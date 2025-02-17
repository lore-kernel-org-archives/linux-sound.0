Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823B4216E21
	for <linux-sound@vger.kernel.org>; Mon, 17 Feb 2025 10:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739786855; cv=none; b=l3BOrdhHnFIckakahmKlMChQv6GTuLm/5akGa45IaALx6fyyCRW8pUSji74urtqzLz8OsXnIOKZLSwqCGG1IxDkfyBIXwUDv5ErwNKpSXuVap57LcJNaIRZ0tvDUbltmdBInah4xiTQrI6YF4/AcR0IzipIqxPx+9I+JZrlxP8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739786855; c=relaxed/simple;
	bh=ynfYRjehEAQWqs6EHQUbCOYCodhFGabTR/VA+wlxm0g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Emqqfma1/HGidPO5SU5cWg+/vD0Zf3azHz34yEWj4EceJybjjNKwnaT20VOlTqO2usRYSg+W71yNFlDCfMUID77Woz4DfifDAvccG+SB/7X1f2X4EHkCG69nDTKwwQ85vR0P5KAeKGYwMWfV31UpbeApg3lFOOBm3DpBgDTPQoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gmf7XYrm; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gmf7XYrm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739786853; x=1771322853;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ynfYRjehEAQWqs6EHQUbCOYCodhFGabTR/VA+wlxm0g=;
  b=Gmf7XYrm0YvMQ9A5SHMgkOpmuiQcMtie8IPtC+ySrKfXwnH9GtKkblfm
   B0qM4W7BLmUiKjW6PQhjrmub5MEPpXKsvy2RNM1M/8zFBoU5HMy/FhQ1W
   9DyFfgZxMCCJI9QqO3THxZeglNJ9QihqgQvPewzvGOP9LhM/Z0qm0P8mw
   Y6YpyhiOf8TELfX148xE5uh7h5Z7buvQMvqsGRo4XjfL7dYlCfBBg5OdW
   ro5fviOsO56ttB0sRrp/LsB8Y6X0y42aSEI7j/2LAwhZ5Xyx/0nlvGHBM
   k3UKipAziZVpTbW3zQskq5pulNUPGwM7BZCBELVTOeku7Rx942/wmKTi2
   w==;
X-CSE-ConnectionGUID: cKyPgOrQTmOEQXA9FLOx3Q==
X-CSE-MsgGUID: HvXxXxfKRNiImDMcLkJFtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="65818321"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; 
   d="scan'208";a="65818321"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 02:07:33 -0800
X-CSE-ConnectionGUID: l9fBaogdSnaEVSZ8Q4hPkg==
X-CSE-MsgGUID: 5z4fdK9XQlS8QCrZtF+3LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118219068"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by fmviesa003.fm.intel.com with ESMTP; 17 Feb 2025 02:07:32 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 07/10] ASoC: Intel: avs: Move to the new control operations
Date: Mon, 17 Feb 2025 11:21:12 +0100
Message-Id: <20250217102115.3539427-8-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250217102115.3539427-1-cezary.rojewski@intel.com>
References: <20250217102115.3539427-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow for multi-channel volume controls to be utilized by an application
by moving over to the new implementation. Drop all unused code in the
process.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/control.c  | 72 +---------------------------------
 sound/soc/intel/avs/control.h  |  8 +---
 sound/soc/intel/avs/path.c     |  2 +-
 sound/soc/intel/avs/topology.c |  1 +
 4 files changed, 6 insertions(+), 77 deletions(-)

diff --git a/sound/soc/intel/avs/control.c b/sound/soc/intel/avs/control.c
index a1c7431cfe13..64283aa35281 100644
--- a/sound/soc/intel/avs/control.c
+++ b/sound/soc/intel/avs/control.c
@@ -48,75 +48,7 @@ static struct avs_path_module *avs_get_volume_module(struct avs_dev *adev, u32 i
 	return NULL;
 }
 
-int avs_control_volume_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
-{
-	struct soc_mixer_control *mc = (struct soc_mixer_control *)kcontrol->private_value;
-	struct avs_control_data *ctl_data = (struct avs_control_data *)mc->dobj.private;
-	struct avs_dev *adev = avs_get_kcontrol_adev(kcontrol);
-	struct avs_volume_cfg *dspvols = NULL;
-	struct avs_path_module *active_module;
-	size_t num_dspvols;
-	int ret = 0;
-
-	/* prevent access to modules while path is being constructed */
-	mutex_lock(&adev->path_mutex);
-
-	active_module = avs_get_volume_module(adev, ctl_data->id);
-	if (active_module) {
-		ret = avs_ipc_peakvol_get_volume(adev, active_module->module_id,
-						 active_module->instance_id, &dspvols,
-						 &num_dspvols);
-		if (!ret)
-			ucontrol->value.integer.value[0] = dspvols[0].target_volume;
-
-		ret = AVS_IPC_RET(ret);
-		kfree(dspvols);
-	} else {
-		ucontrol->value.integer.value[0] = ctl_data->volume;
-	}
-
-	mutex_unlock(&adev->path_mutex);
-	return ret;
-}
-
-int avs_control_volume_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
-{
-	struct soc_mixer_control *mc = (struct soc_mixer_control *)kcontrol->private_value;
-	struct avs_control_data *ctl_data = (struct avs_control_data *)mc->dobj.private;
-	struct avs_dev *adev = avs_get_kcontrol_adev(kcontrol);
-	long *volume = &ctl_data->volume;
-	struct avs_path_module *active_module;
-	struct avs_volume_cfg dspvol = {0};
-	long ctlvol = ucontrol->value.integer.value[0];
-	int ret = 0, changed = 0;
-
-	if (ctlvol < 0 || ctlvol > mc->max)
-		return -EINVAL;
-
-	/* prevent access to modules while path is being constructed */
-	mutex_lock(&adev->path_mutex);
-
-	if (*volume != ctlvol) {
-		*volume = ctlvol;
-		changed = 1;
-	}
-
-	active_module = avs_get_volume_module(adev, ctl_data->id);
-	if (active_module) {
-		dspvol.channel_id = AVS_ALL_CHANNELS_MASK;
-		dspvol.target_volume = *volume;
-
-		ret = avs_ipc_peakvol_set_volume(adev, active_module->module_id,
-						 active_module->instance_id, &dspvol);
-		ret = AVS_IPC_RET(ret);
-	}
-
-	mutex_unlock(&adev->path_mutex);
-
-	return ret ? ret : changed;
-}
-
-int avs_control_volume_get2(struct snd_kcontrol *kctl, struct snd_ctl_elem_value *uctl)
+int avs_control_volume_get(struct snd_kcontrol *kctl, struct snd_ctl_elem_value *uctl)
 {
 	struct soc_mixer_control *mc = (struct soc_mixer_control *)kctl->private_value;
 	struct avs_control_data *ctl_data = mc->dobj.private;
@@ -150,7 +82,7 @@ int avs_control_volume_get2(struct snd_kcontrol *kctl, struct snd_ctl_elem_value
 	return 0;
 }
 
-int avs_control_volume_put2(struct snd_kcontrol *kctl, struct snd_ctl_elem_value *uctl)
+int avs_control_volume_put(struct snd_kcontrol *kctl, struct snd_ctl_elem_value *uctl)
 {
 	struct avs_path_module *active_module;
 	struct avs_control_data *ctl_data;
diff --git a/sound/soc/intel/avs/control.h b/sound/soc/intel/avs/control.h
index e16fa79962de..66f3fe064e1d 100644
--- a/sound/soc/intel/avs/control.h
+++ b/sound/soc/intel/avs/control.h
@@ -14,15 +14,11 @@
 
 struct avs_control_data {
 	u32 id;
-
-	long volume;
 	long values[SND_SOC_TPLG_MAX_CHAN];
 };
 
-int avs_control_volume_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol);
-int avs_control_volume_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol);
-int avs_control_volume_get2(struct snd_kcontrol *kctl, struct snd_ctl_elem_value *uctl);
-int avs_control_volume_put2(struct snd_kcontrol *kctl, struct snd_ctl_elem_value *uctl);
+int avs_control_volume_get(struct snd_kcontrol *kctl, struct snd_ctl_elem_value *uctl);
+int avs_control_volume_put(struct snd_kcontrol *kctl, struct snd_ctl_elem_value *uctl);
 int avs_control_volume_info(struct snd_kcontrol *kctl, struct snd_ctl_elem_info *uinfo);
 
 #endif
diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
index a72ebde7d011..56a2916eec5e 100644
--- a/sound/soc/intel/avs/path.c
+++ b/sound/soc/intel/avs/path.c
@@ -370,7 +370,7 @@ static int avs_peakvol_create(struct avs_dev *adev, struct avs_path_module *mod)
 
 	ctl_data = avs_get_module_control(mod);
 	if (ctl_data)
-		volume = ctl_data->volume;
+		volume = ctl_data->values[0];
 
 	/* As 2+ channels controls are unsupported, have a single block for all channels. */
 	cfg_size = struct_size(cfg, vols, 1);
diff --git a/sound/soc/intel/avs/topology.c b/sound/soc/intel/avs/topology.c
index 45952fbe9694..ee70e3d0e889 100644
--- a/sound/soc/intel/avs/topology.c
+++ b/sound/soc/intel/avs/topology.c
@@ -1912,6 +1912,7 @@ static const struct snd_soc_tplg_kcontrol_ops avs_control_ops[] = {
 		.id = AVS_CONTROL_OPS_VOLUME,
 		.get = avs_control_volume_get,
 		.put = avs_control_volume_put,
+		.info = avs_control_volume_info,
 	},
 };
 
-- 
2.25.1

