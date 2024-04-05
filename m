Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744171465B4
	for <linux-sound@vger.kernel.org>; Fri,  5 Apr 2024 09:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712308095; cv=none; b=S5QhlaGzYD28cACiBbCYBppc0Vo/n/tIDmP+vSqRaNMlV47iGu4+Am1Eyc0SbrRt/NMKgoLA6MyGEpSW5PVmmNvba6PeWct1PmA4OqQ2UypU1AN/03ocpQTu4xNWVOtwF/sS9y8Xbxe6COOVgqOJK0cXCnLPVPpJgjX0hcx6XqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712308095; c=relaxed/simple;
	bh=4U5eUPSVHVLioRHAIf9Fo+vGvEmxAF6r2cSIUvxQg8w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tdU3EKewprUguOQroSAzPk2QH3U/GEr5vVlgkozGUt84dZhuOErGPIikKYC0weYixqGS1ih+x+Dxn0S2tt6jixc+9IqisNmn8eiQrxQ/J5B2TDl296jC197cungen1pq5HkRbwBUk+S/kUO+EVdgRU1swC4m5wy8JlAuEmDPTOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C2e7BQa7; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C2e7BQa7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712308094; x=1743844094;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4U5eUPSVHVLioRHAIf9Fo+vGvEmxAF6r2cSIUvxQg8w=;
  b=C2e7BQa7dcbvv/f3U2gXYXF5hVOqzRjm6be8obcK6S0udwQq6zlcOteC
   Aw5tS7T3eEwhVHLtnuihgT2KRgplpNDBOljoKBa/u9e7FiyiLjnywqNhU
   rBkA9Fn2P+vmcV17QTWPBdqndAiF+A23d9gjjuAsdewi2M4X+zFIr3G43
   SICkDK9mEr47jjhSYrzVDSeQaz9Ft6SqIbklgqL80zAQILqpjvxmNB6XU
   9RsRxRLGhI4KYrxugd9Cpspf+um1wQSOTlhOcedEXyzxxDl0PWKJKh5yo
   HLLPsPoXunTSVrnS/0sGAxizUXDlAk/VDc5R1FNcFrDQYhzuIPzEOiiyO
   A==;
X-CSE-ConnectionGUID: azHe7kXEQAquKGuOB9eRsw==
X-CSE-MsgGUID: DZWtMqYCTQyGJ7eZtgXV1g==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7787426"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="7787426"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 02:08:14 -0700
X-CSE-ConnectionGUID: kkSYAi88Tcm5aM5jnaFeSw==
X-CSE-MsgGUID: 8CaWEeVRR+C5q++h6+JdbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="19042424"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa009.jf.intel.com with ESMTP; 05 Apr 2024 02:08:12 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 04/13] ASoC: Intel: avs: Fix config_length for config-less copiers
Date: Fri,  5 Apr 2024 11:09:20 +0200
Message-Id: <20240405090929.1184068-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240405090929.1184068-1-cezary.rojewski@intel.com>
References: <20240405090929.1184068-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Copier's config_length shall always be at least one even if there is no
configuration payload to carry. While the firmware treats
config_length=0 or 1 in the same manner, the driver shall initialize the
module properly.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/path.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
index 5944865a1193..9bd03a44fcb9 100644
--- a/sound/soc/intel/avs/path.c
+++ b/sound/soc/intel/avs/path.c
@@ -148,11 +148,12 @@ static int avs_copier_create(struct avs_dev *adev, struct avs_path_module *mod)
 	struct avs_copier_cfg *cfg;
 	struct nhlt_specific_cfg *ep_blob;
 	union avs_connector_node_id node_id = {0};
-	size_t cfg_size, data_size = 0;
+	size_t cfg_size, data_size;
 	void *data = NULL;
 	u32 dma_type;
 	int ret;
 
+	data_size = sizeof(cfg->gtw_cfg.config);
 	dma_type = t->cfg_ext->copier.dma_type;
 	node_id.dma_type = dma_type;
 
@@ -233,10 +234,7 @@ static int avs_copier_create(struct avs_dev *adev, struct avs_path_module *mod)
 		break;
 	}
 
-	cfg_size = sizeof(*cfg) + data_size;
-	/* Every config-BLOB contains gateway attributes. */
-	if (data_size)
-		cfg_size -= sizeof(cfg->gtw_cfg.config.attrs);
+	cfg_size = offsetof(struct avs_copier_cfg, gtw_cfg.config) + data_size;
 	if (cfg_size > AVS_MAILBOX_SIZE)
 		return -EINVAL;
 
-- 
2.25.1

