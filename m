Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2112163B9
	for <linux-sound@vger.kernel.org>; Mon, 17 Feb 2025 10:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739786857; cv=none; b=pBvIgGFccXqLp6dvlXOeDwVat+jdncILpPYHTnibiHtABzG1qBXHtvf0xGAhkinpvLPDYRFsQi4NJ+m1OM1jMIJpxfVvC4lUM0cC3QJRoIhx+/mtyQkt1xSD3pCU/NS8qYne0Tp0R9zi+2Q6uTBkgPvEbfQ50i4dbafYXhbUOP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739786857; c=relaxed/simple;
	bh=jlg2VFrjTOIQNhKDMA+9woDrgRXEws1M/4sOJdVLY+c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E1VEf/nH4OckVs3lGnPScmTnuLsFeQH7h+ZeWkm0y2PdK3/8z7ggkcNpaGsz1zmZ5sWacMgyofdQauq6R8IWd6Y4mCQ4xcAwPC+9kzZb16s1818FT4ZqmmrpP1x633vCcIx1mcD4IbisaT/B0/2Z9aIJbMFpsRxpUXsHA7neDg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CLKZqJhI; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CLKZqJhI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739786856; x=1771322856;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jlg2VFrjTOIQNhKDMA+9woDrgRXEws1M/4sOJdVLY+c=;
  b=CLKZqJhI9HMnUHXLkWl0bAUfXuZ/4oD6k1oGFYknDbvTEl9aU9Kkovuz
   DvP2bfX7Zjs/74W3skVW1hLzhDFPTzUvEg8cXyqXhRMUJ52zWFZ17JDj3
   70o49Qht32Njhn3zXT7rikizhP0pKNAVBlc5my2G5P6RzCpxbre2knYKx
   jC3JQT/lDpisr2in8qnoDukJ4K4Z0qH5wRJYc1FRfRlZjOnIoS5NlM+8K
   IpLX4GvXwHAhqKlzxBbWvP9XGRIw1vlM0HaG2LxsxjTToeTZ1CrtChlfy
   +nf7uwuezV/vzWdMaMIp8c7MCZ42/b0fQ4Ci8IDDDAf3u/ZxHYu+e3Jbp
   A==;
X-CSE-ConnectionGUID: xotQCRLrQ7eBomvloMvNhQ==
X-CSE-MsgGUID: yXLt3EeHQeuwbzCPKh9+Vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="65818328"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; 
   d="scan'208";a="65818328"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 02:07:35 -0800
X-CSE-ConnectionGUID: CEth/ytDSNK2Yks7jlHiwA==
X-CSE-MsgGUID: eMgHk17HQ12qfi+6nEpTIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118219071"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by fmviesa003.fm.intel.com with ESMTP; 17 Feb 2025 02:07:33 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 08/10] ASoC: Intel: avs: Add support for mute for PEAKVOL and GAIN
Date: Mon, 17 Feb 2025 11:21:13 +0100
Message-Id: <20250217102115.3539427-9-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250217102115.3539427-1-cezary.rojewski@intel.com>
References: <20250217102115.3539427-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

With recent updates to AudioDSP firmware, mute functionality has been
added to PEAKVOL and GAIN modules. The operation occurs over IPC
similarly to how volume is configured. Wire it up to kcontrol
infrastructure present in the avs-driver.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/control.c  | 83 ++++++++++++++++++++++++++++++++++
 sound/soc/intel/avs/control.h  |  3 ++
 sound/soc/intel/avs/path.c     | 36 +++++++++++++++
 sound/soc/intel/avs/path.h     |  2 +
 sound/soc/intel/avs/topology.c | 11 ++++-
 5 files changed, 134 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/control.c b/sound/soc/intel/avs/control.c
index 64283aa35281..2e01dc75a15a 100644
--- a/sound/soc/intel/avs/control.c
+++ b/sound/soc/intel/avs/control.c
@@ -130,3 +130,86 @@ int avs_control_volume_info(struct snd_kcontrol *kctl, struct snd_ctl_elem_info
 	uinfo->value.integer.max = mc->max;
 	return 0;
 }
+
+int avs_control_mute_get(struct snd_kcontrol *kctl, struct snd_ctl_elem_value *uctl)
+{
+	struct soc_mixer_control *mc = (struct soc_mixer_control *)kctl->private_value;
+	struct avs_control_data *ctl_data = mc->dobj.private;
+	struct avs_path_module *active_module;
+	struct avs_mute_cfg *dspmutes;
+	struct avs_dev *adev;
+	size_t num_dspmutes;
+	int ret, i;
+
+	adev = avs_get_kcontrol_adev(kctl);
+
+	/* Prevent access to modules while path is being constructed. */
+	guard(mutex)(&adev->path_mutex);
+
+	active_module = avs_get_volume_module(adev, ctl_data->id);
+	if (active_module) {
+		ret = avs_ipc_peakvol_get_mute(adev, active_module->module_id,
+					       active_module->instance_id, &dspmutes,
+					       &num_dspmutes);
+		if (ret)
+			return AVS_IPC_RET(ret);
+
+		/* Do not copy more than the control can store. */
+		num_dspmutes = min_t(u32, num_dspmutes, SND_SOC_TPLG_MAX_CHAN);
+		for (i = 0; i < num_dspmutes; i++)
+			ctl_data->values[i] = !dspmutes[i].mute;
+		kfree(dspmutes);
+	}
+
+	memcpy(uctl->value.integer.value, ctl_data->values, sizeof(ctl_data->values));
+	return 0;
+}
+
+int avs_control_mute_put(struct snd_kcontrol *kctl, struct snd_ctl_elem_value *uctl)
+{
+	struct avs_path_module *active_module;
+	struct avs_control_data *ctl_data;
+	struct soc_mixer_control *mc;
+	struct avs_dev *adev;
+	long *input;
+	int ret, i;
+
+	mc = (struct soc_mixer_control *)kctl->private_value;
+	ctl_data = mc->dobj.private;
+	adev = avs_get_kcontrol_adev(kctl);
+	input = uctl->value.integer.value;
+	i = 0;
+
+	/* mc->num_channels can be 0. */
+	do {
+		if (input[i] < mc->min || input[i] > mc->max)
+			return -EINVAL;
+	} while (++i < mc->num_channels);
+
+	if (!memcmp(ctl_data->values, input, sizeof(ctl_data->values)))
+		return 0;
+
+	/* Prevent access to modules while path is being constructed. */
+	guard(mutex)(&adev->path_mutex);
+
+	active_module = avs_get_volume_module(adev, ctl_data->id);
+	if (active_module) {
+		ret = avs_peakvol_set_mute(adev, active_module, mc, input);
+		if (ret)
+			return ret;
+	}
+
+	memcpy(ctl_data->values, input, sizeof(ctl_data->values));
+	return 1;
+}
+
+int avs_control_mute_info(struct snd_kcontrol *kctl, struct snd_ctl_elem_info *uinfo)
+{
+	struct soc_mixer_control *mc = (struct soc_mixer_control *)kctl->private_value;
+
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_BOOLEAN;
+	uinfo->count = max_t(u32, 1, mc->num_channels);
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = mc->max;
+	return 0;
+}
diff --git a/sound/soc/intel/avs/control.h b/sound/soc/intel/avs/control.h
index 66f3fe064e1d..08b2919e4629 100644
--- a/sound/soc/intel/avs/control.h
+++ b/sound/soc/intel/avs/control.h
@@ -20,5 +20,8 @@ struct avs_control_data {
 int avs_control_volume_get(struct snd_kcontrol *kctl, struct snd_ctl_elem_value *uctl);
 int avs_control_volume_put(struct snd_kcontrol *kctl, struct snd_ctl_elem_value *uctl);
 int avs_control_volume_info(struct snd_kcontrol *kctl, struct snd_ctl_elem_info *uinfo);
+int avs_control_mute_get(struct snd_kcontrol *kctl, struct snd_ctl_elem_value *uctl);
+int avs_control_mute_put(struct snd_kcontrol *kctl, struct snd_ctl_elem_value *uctl);
+int avs_control_mute_info(struct snd_kcontrol *kctl, struct snd_ctl_elem_info *uinfo);
 
 #endif
diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
index 56a2916eec5e..403510494e77 100644
--- a/sound/soc/intel/avs/path.c
+++ b/sound/soc/intel/avs/path.c
@@ -359,6 +359,42 @@ int avs_peakvol_set_volume(struct avs_dev *adev, struct avs_path_module *mod,
 	return AVS_IPC_RET(ret);
 }
 
+int avs_peakvol_set_mute(struct avs_dev *adev, struct avs_path_module *mod,
+			 struct soc_mixer_control *mc, long *input)
+{
+	struct avs_mute_cfg mutes[SND_SOC_TPLG_MAX_CHAN] = {{0}};
+	struct avs_control_data *ctl_data;
+	struct avs_tplg_module *t;
+	int ret, i;
+
+	ctl_data = mc->dobj.private;
+	t = mod->template;
+	if (!input)
+		input = ctl_data->values;
+
+	if (mc->num_channels) {
+		for (i = 0; i < mc->num_channels; i++) {
+			mutes[i].channel_id = i;
+			mutes[i].mute = !input[i];
+			mutes[i].curve_type = t->cfg_ext->peakvol.curve_type;
+			mutes[i].curve_duration = t->cfg_ext->peakvol.curve_duration;
+		}
+
+		ret = avs_ipc_peakvol_set_mutes(adev, mod->module_id, mod->instance_id, mutes,
+						mc->num_channels);
+		return AVS_IPC_RET(ret);
+	}
+
+	/* Target all channels if no individual selected. */
+	mutes[0].channel_id = AVS_ALL_CHANNELS_MASK;
+	mutes[0].mute = !input[0];
+	mutes[0].curve_type = t->cfg_ext->peakvol.curve_type;
+	mutes[0].curve_duration = t->cfg_ext->peakvol.curve_duration;
+
+	ret = avs_ipc_peakvol_set_mute(adev, mod->module_id, mod->instance_id, &mutes[0]);
+	return AVS_IPC_RET(ret);
+}
+
 static int avs_peakvol_create(struct avs_dev *adev, struct avs_path_module *mod)
 {
 	struct avs_tplg_module *t = mod->template;
diff --git a/sound/soc/intel/avs/path.h b/sound/soc/intel/avs/path.h
index e9317b64de86..7ed7e94e0a56 100644
--- a/sound/soc/intel/avs/path.h
+++ b/sound/soc/intel/avs/path.h
@@ -71,5 +71,7 @@ int avs_path_run(struct avs_path *path, int trigger);
 
 int avs_peakvol_set_volume(struct avs_dev *adev, struct avs_path_module *mod,
 			   struct soc_mixer_control *mc, long *input);
+int avs_peakvol_set_mute(struct avs_dev *adev, struct avs_path_module *mod,
+			 struct soc_mixer_control *mc, long *input);
 
 #endif
diff --git a/sound/soc/intel/avs/topology.c b/sound/soc/intel/avs/topology.c
index ee70e3d0e889..9ef1adb077f4 100644
--- a/sound/soc/intel/avs/topology.c
+++ b/sound/soc/intel/avs/topology.c
@@ -1905,7 +1905,10 @@ static int avs_manifest(struct snd_soc_component *comp, int index,
 	return 0;
 }
 
-#define AVS_CONTROL_OPS_VOLUME	257
+enum {
+	AVS_CONTROL_OPS_VOLUME = 257,
+	AVS_CONTROL_OPS_MUTE,
+};
 
 static const struct snd_soc_tplg_kcontrol_ops avs_control_ops[] = {
 	{
@@ -1914,6 +1917,12 @@ static const struct snd_soc_tplg_kcontrol_ops avs_control_ops[] = {
 		.put = avs_control_volume_put,
 		.info = avs_control_volume_info,
 	},
+	{
+		.id = AVS_CONTROL_OPS_MUTE,
+		.get = avs_control_mute_get,
+		.put = avs_control_mute_put,
+		.info = avs_control_mute_info,
+	},
 };
 
 static const struct avs_tplg_token_parser control_parsers[] = {
-- 
2.25.1

