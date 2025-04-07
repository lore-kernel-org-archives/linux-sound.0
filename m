Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE5C23AE82
	for <linux-sound@vger.kernel.org>; Mon,  7 Apr 2025 11:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744024019; cv=none; b=qGt8QpZ3vQYrzbqbawHYy2G7bfizHseU/d0QlIeO1D00kYAl/n1Tn8QJt/avxNNal8Uj8xQY0oEeB1XRecTDrWU3IgC7dHE7WuexUXb1tGrxpDNj4LDKnpIqABZ0yb/NbLqf1J/WqrF5V4PI0VKptj8D9vinBy8REFkPmhHHNzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744024019; c=relaxed/simple;
	bh=zp90fr05BKZhOlSRt5H1lwlZFBxYrA/hBYZ0UcYQcKg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LnJmFGSPpgVfomzbLZMyc1JWj6QBm1JsmHEEZLK7FzOZOkK62XM1IJuf8VX2dxzMuBNY8ri9vJJUL9qYYBBAWRDBxL9jryuLUEJlmgUIRuSHPBi1YJHMVqYshseAYuI9AeaYBlLkULkgSEHzhqKqg7fEJiXkNh7eNzD2xa1OOoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HRNZS9tr; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HRNZS9tr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744024019; x=1775560019;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zp90fr05BKZhOlSRt5H1lwlZFBxYrA/hBYZ0UcYQcKg=;
  b=HRNZS9trUvpa3BssSMETkBwUjq+9hnjIRG6y6unzketHDtq1e3L+TREK
   JLd6TS5ZDe6VlM+hpRKEo5BrES/H5S8KYBcyhMmUmvDyy4oumYZJFG8H/
   UDGr2asAoxVmc96njxbBqi3J1rjzJI33vCgSriCTYfirbdI+ebLQhe2FM
   Y6CARMgNl4HusNGcQ6/Tn3SHpehcG/tDd8rQ3Ug1BqTj1Z9kZYhOnrXyG
   FG0a5qvNk7aCR3W31ttLh+sro+SFUdRNs8EinwxFhf+rE4wtojVzGi3cu
   qjnVTpNlQc6gE5wf+it8QYebg2fTtV5NYUKPZA1lMo+GKqY740kcs8pYx
   w==;
X-CSE-ConnectionGUID: NQ15nkPLS6OPjvDvcVScZA==
X-CSE-MsgGUID: h74NtevrTUKrvz0IfW9o9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="49057337"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="49057337"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 04:06:58 -0700
X-CSE-ConnectionGUID: n2cj0rwgQZCKqBlIHH5NIA==
X-CSE-MsgGUID: jUrehtQMRaGI7gEHtlO9MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="127776272"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa006.fm.intel.com with ESMTP; 07 Apr 2025 04:06:56 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	liam.r.girdwood@intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 03/10] ASoC: Intel: avs: Read HW capabilities when possible
Date: Mon,  7 Apr 2025 13:23:45 +0200
Message-Id: <20250407112352.3720779-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250407112352.3720779-1-cezary.rojewski@intel.com>
References: <20250407112352.3720779-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Starting with LunarLake (LNL) and onward, some hardware capabilities are
visible to the sound driver directly. At the same time, these may no
longer be visible to the AudioDSP firmware. Update resource allocation
function to rely on the registers when possible.

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/hdaudio_ext.h         | 1 +
 sound/hda/ext/hdac_ext_controller.c | 1 +
 sound/soc/intel/avs/avs.h           | 1 +
 sound/soc/intel/avs/loader.c        | 9 +++++++++
 4 files changed, 12 insertions(+)

diff --git a/include/sound/hdaudio_ext.h b/include/sound/hdaudio_ext.h
index 60ec12e3b72f..7de390022ac2 100644
--- a/include/sound/hdaudio_ext.h
+++ b/include/sound/hdaudio_ext.h
@@ -99,6 +99,7 @@ struct hdac_ext_link {
 	u32 lcaps;   /* link capablities */
 	u16 lsdiid;  /* link sdi identifier */
 	u32 id;
+	u8 slcount;
 
 	int ref_count;
 
diff --git a/sound/hda/ext/hdac_ext_controller.c b/sound/hda/ext/hdac_ext_controller.c
index 2ec1531d1c1b..c84754434d16 100644
--- a/sound/hda/ext/hdac_ext_controller.c
+++ b/sound/hda/ext/hdac_ext_controller.c
@@ -98,6 +98,7 @@ int snd_hdac_ext_bus_get_ml_capabilities(struct hdac_bus *bus)
 					(AZX_ML_INTERVAL * idx);
 		hlink->lcaps  = readl(hlink->ml_addr + AZX_REG_ML_LCAP);
 		hlink->lsdiid = readw(hlink->ml_addr + AZX_REG_ML_LSDIID);
+		hlink->slcount = FIELD_GET(AZX_ML_HDA_LCAP_SLCOUNT, hlink->lcaps) + 1;
 
 		if (hdac_ext_link_alt(hlink)) {
 			leptr = readl(hlink->ml_addr + AZX_REG_ML_LEPTR);
diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index 91872d1df97a..201897c5bdc0 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -73,6 +73,7 @@ extern const struct avs_dsp_ops avs_tgl_dsp_ops;
 #define AVS_PLATATTR_CLDMA		BIT_ULL(0)
 #define AVS_PLATATTR_IMR		BIT_ULL(1)
 #define AVS_PLATATTR_ACE		BIT_ULL(2)
+#define AVS_PLATATTR_ALTHDA		BIT_ULL(3)
 
 #define avs_platattr_test(adev, attr) \
 	((adev)->spec->attributes & AVS_PLATATTR_##attr)
diff --git a/sound/soc/intel/avs/loader.c b/sound/soc/intel/avs/loader.c
index 0b29941feb0e..ecf050c2c0c7 100644
--- a/sound/soc/intel/avs/loader.c
+++ b/sound/soc/intel/avs/loader.c
@@ -683,6 +683,7 @@ int avs_dsp_boot_firmware(struct avs_dev *adev, bool purge)
 
 static int avs_dsp_alloc_resources(struct avs_dev *adev)
 {
+	struct hdac_ext_link *link;
 	int ret, i;
 
 	ret = avs_ipc_get_hw_config(adev, &adev->hw_cfg);
@@ -693,6 +694,14 @@ static int avs_dsp_alloc_resources(struct avs_dev *adev)
 	if (ret)
 		return AVS_IPC_RET(ret);
 
+	/* If hw allows, read capabilities directly from it. */
+	if (avs_platattr_test(adev, ALTHDA)) {
+		link = snd_hdac_ext_bus_get_hlink_by_id(&adev->base.core,
+							AZX_REG_ML_LEPTR_ID_INTEL_SSP);
+		if (link)
+			adev->hw_cfg.i2s_caps.ctrl_count = link->slcount;
+	}
+
 	adev->core_refs = devm_kcalloc(adev->dev, adev->hw_cfg.dsp_cores,
 				       sizeof(*adev->core_refs), GFP_KERNEL);
 	adev->lib_names = devm_kcalloc(adev->dev, adev->fw_cfg.max_libs_count,
-- 
2.25.1

