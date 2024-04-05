Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6679D15F30D
	for <linux-sound@vger.kernel.org>; Fri,  5 Apr 2024 09:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712308092; cv=none; b=TZyQ8o/A8zsG/9DQVa38IZUH9/vy3/UUM7FMPnz6OTJJoFRg3Y2nNXtsfdAOMnjgLJ5iv8s5yW6l6JDcbW4TWWWhWlRawnsTP8Lg4pjRtmubfxqRMbUG4gWl82heo6nLTCYXmOF+mLBrm1qXQlQGZAS7PgJyK8fYNopzYAPXR3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712308092; c=relaxed/simple;
	bh=ANzCgsUumNqSlnkBuuI/derpqfxzEvU8fc97dO+tuUg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PaiP83ab4ZZVP9hvNHEEOz4QPD2Si7oheQAkg3sVgP3kwYV8sruOUaSxYGIAkK/Ak6qGUR68WgMqJiVE/S6ZM7ZvqGEGScgTa80tAVLZTuwiWwEYnijFdqO2b9169Jk+Z/23jTsyHJCbeu6phBCoElEy+toVBgx4lUJxjC4ycUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EDjslzU+; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EDjslzU+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712308092; x=1743844092;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ANzCgsUumNqSlnkBuuI/derpqfxzEvU8fc97dO+tuUg=;
  b=EDjslzU+byozNthrOkoroeHdbOiSx1222kHMqdg7gZUTd9iGwzGOOymq
   Bju2bkBffpP14vbu5/D1UFEA7rDCChvs8fKZ0WLuEhEqwYW4ZsTG4DJKx
   s+z1s8PNNkUXKzwy55DHPZMYgIsN54asj03dt2p43d9XQCcw/ZXq1NFxA
   tJ5tmpES0h+yXy+OTy/h50KbZiK4RxJshxOnceJ4q955ySf5xN+nY0lJu
   JEwr+3IwtTkn71ERPIiyp8gWPyLbpg3Nvv0bp2k/K4jhtkjvWNr7VYM5e
   oujh42TNknMxKAhwQ6qaJJ9AK4ok2rXPyzL1k2ZQtZzxBUShoORMLtOca
   Q==;
X-CSE-ConnectionGUID: kTFZxo6oSP2+Zs5Yxm04sg==
X-CSE-MsgGUID: fmQ5Y+yiTDelYCRl0Th1Mw==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7787419"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="7787419"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 02:08:12 -0700
X-CSE-ConnectionGUID: hKJQVxYSTlCYR2ZSlDf7gg==
X-CSE-MsgGUID: 9bXG8zgCTZyHsmKCPdogHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="19042420"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa009.jf.intel.com with ESMTP; 05 Apr 2024 02:08:10 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 03/13] ASoC: Intel: avs: Silence false-positive memcpy() warnings
Date: Fri,  5 Apr 2024 11:09:19 +0200
Message-Id: <20240405090929.1184068-4-cezary.rojewski@intel.com>
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

Commit df8fc4e934c1 ("kbuild: Enable -fstrict-flex-arrays=3") enforced
strict flex array declarations. This generates false-positive in form of:
"memcpy: detected field-spanning write". Avoid it by utilizing the
DECLARE_FLEX_ARRAY() macro.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/messages.h | 4 ++--
 sound/soc/intel/avs/path.c     | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/avs/messages.h b/sound/soc/intel/avs/messages.h
index 4e609a08863c..007bc4fb6d99 100644
--- a/sound/soc/intel/avs/messages.h
+++ b/sound/soc/intel/avs/messages.h
@@ -752,9 +752,9 @@ struct avs_copier_gtw_cfg {
 	union avs_connector_node_id node_id;
 	u32 dma_buffer_size;
 	u32 config_length;
-	struct {
+	union {
 		union avs_gtw_attributes attrs;
-		u32 blob[];
+		DECLARE_FLEX_ARRAY(u32, blob);
 	} config;
 } __packed;
 
diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
index e785fc2a7008..5944865a1193 100644
--- a/sound/soc/intel/avs/path.c
+++ b/sound/soc/intel/avs/path.c
@@ -254,7 +254,7 @@ static int avs_copier_create(struct avs_dev *adev, struct avs_path_module *mod)
 	/* config_length in DWORDs */
 	cfg->gtw_cfg.config_length = DIV_ROUND_UP(data_size, 4);
 	if (data)
-		memcpy(&cfg->gtw_cfg.config, data, data_size);
+		memcpy(&cfg->gtw_cfg.config.blob, data, data_size);
 
 	mod->gtw_attrs = cfg->gtw_cfg.config.attrs;
 
-- 
2.25.1

