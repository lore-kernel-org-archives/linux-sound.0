Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340636E2C3
	for <linux-sound@vger.kernel.org>; Thu,  8 Feb 2024 10:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707387819; cv=none; b=Sp2U8hFFGCWgy9oGU7EOvB2FCnbR2pNficAxFLtyxwbYfmx7yMDl1DuyYS1704mz9RrifnQMIsvLFEcVyrZzQDWyqLkpuFn7XMEOWUhOLq027TTODXHNCkaIFP4rfNjsKTVd4ipoMCXWaUYLWayNe/1MIkvCSnVljHVD8+WnyDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707387819; c=relaxed/simple;
	bh=Ko10ZkzkLNKDt3XPWSA4Pl4GxMkRRlKq5pWgyGeCp8g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t7MkknAWR9LwDVRCRqxhggGVfX72FHIox3OK4bf0zQlMiSGVLaK/7jNH+J4AbWGQtltzQS3dScArxTEfutCc15j2bheiGuBbmXACbz2N4TSsXNytFt4NMKmuR8CG7MuPSUIsCGYOqJOqxstTFIVVlyj36yKpiA7/Ejs7AWhNP7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FymNKl/E; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FymNKl/E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707387817; x=1738923817;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ko10ZkzkLNKDt3XPWSA4Pl4GxMkRRlKq5pWgyGeCp8g=;
  b=FymNKl/EO5iU3EFO9h9AesBNjZXjWBz9OrEn1IJlmkXG95jxlNueDt8o
   8rHu7aOZexhJ0EkXMbhISaN0krIunQ5qte8IuruXFE77NqgmJS2o1srKu
   dHdJkK/3PP2AsWnFcvyPIeSKfUSezLiRoIDt2MziOicnSjOrZSwhe9JZ0
   JmuDA8jBxW1/bltnC658GvIIymr3kKmzeuYWtWCJfO9xCRd3B39RkxHhq
   QcKS5AaJLfk5w62AnjAuffsi1hhVgKmug6PG9IftPXZFP31iU04qZD4ph
   d+Zi4i69xJDsIhzIsgz71rDrjreIrfQ2dbe89lkPve97eR8ImjM12jpnd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="18699164"
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; 
   d="scan'208";a="18699164"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 02:23:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; 
   d="scan'208";a="1913818"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmviesa006.fm.intel.com with ESMTP; 08 Feb 2024 02:23:36 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?=C5=81ukasz=20Majczak?= <lma@chromium.org>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH v2 3/3] ASoC: Intel: avs: Send initial config to module if present
Date: Thu,  8 Feb 2024 11:24:00 +0100
Message-Id: <20240208102400.2497791-4-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240208102400.2497791-1-amadeuszx.slawinski@linux.intel.com>
References: <20240208102400.2497791-1-amadeuszx.slawinski@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If there are initial configs to send to module on init do send them.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/path.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
index 3aa16ee8d34c1..e785fc2a7008f 100644
--- a/sound/soc/intel/avs/path.c
+++ b/sound/soc/intel/avs/path.c
@@ -547,6 +547,33 @@ static int avs_path_module_type_create(struct avs_dev *adev, struct avs_path_mod
 	return avs_modext_create(adev, mod);
 }
 
+static int avs_path_module_send_init_configs(struct avs_dev *adev, struct avs_path_module *mod)
+{
+	struct avs_soc_component *acomp;
+
+	acomp = to_avs_soc_component(mod->template->owner->owner->owner->owner->comp);
+
+	u32 num_ids = mod->template->num_config_ids;
+	u32 *ids = mod->template->config_ids;
+
+	for (int i = 0; i < num_ids; i++) {
+		struct avs_tplg_init_config *config = &acomp->tplg->init_configs[ids[i]];
+		size_t len = config->length;
+		void *data = config->data;
+		u32 param = config->param;
+		int ret;
+
+		ret = avs_ipc_set_large_config(adev, mod->module_id, mod->instance_id,
+					       param, data, len);
+		if (ret) {
+			dev_err(adev->dev, "send initial module config failed: %d\n", ret);
+			return AVS_IPC_RET(ret);
+		}
+	}
+
+	return 0;
+}
+
 static void avs_path_module_free(struct avs_dev *adev, struct avs_path_module *mod)
 {
 	kfree(mod);
@@ -580,6 +607,12 @@ avs_path_module_create(struct avs_dev *adev,
 		return ERR_PTR(ret);
 	}
 
+	ret = avs_path_module_send_init_configs(adev, mod);
+	if (ret) {
+		kfree(mod);
+		return ERR_PTR(ret);
+	}
+
 	return mod;
 }
 
-- 
2.34.1

