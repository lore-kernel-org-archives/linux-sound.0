Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19EC2163B9
	for <linux-sound@vger.kernel.org>; Mon, 17 Feb 2025 10:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739786853; cv=none; b=NqTYhQdwVAhQ5oerUH1qgd1rMQkqM7tLtrGZ8v+jkMxXKybToQE+Ff96GdeaQ+c6uGzqHfS4Keht7LDehx2/3BV2hZ+HYSCrLUb40J+Z3o9ovlIe3whKpjFBIlRoqJi+hBprJ8idfuueMwkeAZjG/HEpLUzcVnzZLY3sEt1Euvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739786853; c=relaxed/simple;
	bh=j6KVArWe9ArZXGON50kyJRlTfNKPfGYa4ZRNgG9VFvk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nc4oKYxKMBzxAM4K2ey8xddshLvXsMaQBQUCHkYF1xaV6N3TrTs/3i9FQAP9Of4ZE4XBo224HL7kx/QiOuvebJn2C1y8MCntg5Zl1Y9snNeGvSaim5e1JPG+JMqk/muyaFe5uAFkG0RB4gvmqVygzpgfuet9nEkdZ/VNZkEVXlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PQbjhMAV; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PQbjhMAV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739786852; x=1771322852;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=j6KVArWe9ArZXGON50kyJRlTfNKPfGYa4ZRNgG9VFvk=;
  b=PQbjhMAVKlz1V7qubcFdPBnqmfljy9rNK2Vu73CKfPjlLfTR6pS3aU3o
   YIQwLkoI8KC4CPW87AWrIKYGb/bRMKUWdwQWRvzGXRBQX8byGO0YO8NsI
   aYoGERO0m2+40gCsS89NegUb/Uklsm2lX7/qU58VB+pJN7hqH6ebsvQ0J
   a8bP3Xprts09wqHmAgOJZwyDDz8MX0f6jNdRSeeS4eU9rbLo0UsvjOUqG
   b6ocn3UIquzAr/h5ZiCuuHTsJ8aQBNt5+4BawCUy8XK4R3zR7c1xSI5mz
   9W/0G9lxEOOOt2Tg8nz/Yn1U/S+AGAnDtefKYI972PQQgDwo43Wgdwv8z
   A==;
X-CSE-ConnectionGUID: pBTMSDO+T9SR/5UXj2Xv7g==
X-CSE-MsgGUID: q15ztGutTpWBsKQQ9Q0WAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="65818317"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; 
   d="scan'208";a="65818317"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 02:07:31 -0800
X-CSE-ConnectionGUID: MiDrHwxIRf+kDLiqCispFw==
X-CSE-MsgGUID: RUZYnlLWQ1ypEQhAVDJi2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118219065"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by fmviesa003.fm.intel.com with ESMTP; 17 Feb 2025 02:07:30 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 06/10] ASoC: Intel: avs: New volume control operations
Date: Mon, 17 Feb 2025 11:21:11 +0100
Message-Id: <20250217102115.3539427-7-cezary.rojewski@intel.com>
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

To provide multi-channel - more than 2 - capability to volume controls
implement operations that honor the num_channels of a mixer control. As
mc->num_channels can be 0 and is in fact the default behavior, the new
functions decide between ALL_CHANNELS_MASK and individual channels based
on the field value.

To avoid hard-to-review delta when refactoring the code, first implement
the new behavior with follow up changes cleaning things up.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/control.c | 84 +++++++++++++++++++++++++++++++++++
 sound/soc/intel/avs/control.h |  5 +++
 sound/soc/intel/avs/path.c    | 36 +++++++++++++++
 sound/soc/intel/avs/path.h    |  3 ++
 4 files changed, 128 insertions(+)

diff --git a/sound/soc/intel/avs/control.c b/sound/soc/intel/avs/control.c
index a55723289600..a1c7431cfe13 100644
--- a/sound/soc/intel/avs/control.c
+++ b/sound/soc/intel/avs/control.c
@@ -6,6 +6,7 @@
 //          Cezary Rojewski <cezary.rojewski@intel.com>
 //
 
+#include <linux/cleanup.h>
 #include <sound/soc.h>
 #include "avs.h"
 #include "control.h"
@@ -114,3 +115,86 @@ int avs_control_volume_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_va
 
 	return ret ? ret : changed;
 }
+
+int avs_control_volume_get2(struct snd_kcontrol *kctl, struct snd_ctl_elem_value *uctl)
+{
+	struct soc_mixer_control *mc = (struct soc_mixer_control *)kctl->private_value;
+	struct avs_control_data *ctl_data = mc->dobj.private;
+	struct avs_path_module *active_module;
+	struct avs_volume_cfg *dspvols;
+	struct avs_dev *adev;
+	size_t num_dspvols;
+	int ret, i;
+
+	adev = avs_get_kcontrol_adev(kctl);
+
+	/* Prevent access to modules while path is being constructed. */
+	guard(mutex)(&adev->path_mutex);
+
+	active_module = avs_get_volume_module(adev, ctl_data->id);
+	if (active_module) {
+		ret = avs_ipc_peakvol_get_volume(adev, active_module->module_id,
+						 active_module->instance_id, &dspvols,
+						 &num_dspvols);
+		if (ret)
+			return AVS_IPC_RET(ret);
+
+		/* Do not copy more than the control can store. */
+		num_dspvols = min_t(u32, num_dspvols, SND_SOC_TPLG_MAX_CHAN);
+		for (i = 0; i < num_dspvols; i++)
+			ctl_data->values[i] = dspvols[i].target_volume;
+		kfree(dspvols);
+	}
+
+	memcpy(uctl->value.integer.value, ctl_data->values, sizeof(ctl_data->values));
+	return 0;
+}
+
+int avs_control_volume_put2(struct snd_kcontrol *kctl, struct snd_ctl_elem_value *uctl)
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
+		ret = avs_peakvol_set_volume(adev, active_module, mc, input);
+		if (ret)
+			return ret;
+	}
+
+	memcpy(ctl_data->values, input, sizeof(ctl_data->values));
+	return 1;
+}
+
+int avs_control_volume_info(struct snd_kcontrol *kctl, struct snd_ctl_elem_info *uinfo)
+{
+	struct soc_mixer_control *mc = (struct soc_mixer_control *)kctl->private_value;
+
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = max_t(u32, 1, mc->num_channels);
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = mc->max;
+	return 0;
+}
diff --git a/sound/soc/intel/avs/control.h b/sound/soc/intel/avs/control.h
index d9fac3569e8d..e16fa79962de 100644
--- a/sound/soc/intel/avs/control.h
+++ b/sound/soc/intel/avs/control.h
@@ -10,14 +10,19 @@
 #define __SOUND_SOC_INTEL_AVS_CTRL_H
 
 #include <sound/control.h>
+#include <uapi/sound/asoc.h>
 
 struct avs_control_data {
 	u32 id;
 
 	long volume;
+	long values[SND_SOC_TPLG_MAX_CHAN];
 };
 
 int avs_control_volume_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol);
 int avs_control_volume_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol);
+int avs_control_volume_get2(struct snd_kcontrol *kctl, struct snd_ctl_elem_value *uctl);
+int avs_control_volume_put2(struct snd_kcontrol *kctl, struct snd_ctl_elem_value *uctl);
+int avs_control_volume_info(struct snd_kcontrol *kctl, struct snd_ctl_elem_info *uinfo);
 
 #endif
diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
index 329838119015..a72ebde7d011 100644
--- a/sound/soc/intel/avs/path.c
+++ b/sound/soc/intel/avs/path.c
@@ -323,6 +323,42 @@ static struct avs_control_data *avs_get_module_control(struct avs_path_module *m
 	return NULL;
 }
 
+int avs_peakvol_set_volume(struct avs_dev *adev, struct avs_path_module *mod,
+			   struct soc_mixer_control *mc, long *input)
+{
+	struct avs_volume_cfg vols[SND_SOC_TPLG_MAX_CHAN] = {{0}};
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
+			vols[i].channel_id = i;
+			vols[i].target_volume = input[i];
+			vols[i].curve_type = t->cfg_ext->peakvol.curve_type;
+			vols[i].curve_duration = t->cfg_ext->peakvol.curve_duration;
+		}
+
+		ret = avs_ipc_peakvol_set_volumes(adev, mod->module_id, mod->instance_id, vols,
+						  mc->num_channels);
+		return AVS_IPC_RET(ret);
+	}
+
+	/* Target all channels if no individual selected. */
+	vols[0].channel_id = AVS_ALL_CHANNELS_MASK;
+	vols[0].target_volume = input[0];
+	vols[0].curve_type = t->cfg_ext->peakvol.curve_type;
+	vols[0].curve_duration = t->cfg_ext->peakvol.curve_duration;
+
+	ret = avs_ipc_peakvol_set_volume(adev, mod->module_id, mod->instance_id, &vols[0]);
+	return AVS_IPC_RET(ret);
+}
+
 static int avs_peakvol_create(struct avs_dev *adev, struct avs_path_module *mod)
 {
 	struct avs_tplg_module *t = mod->template;
diff --git a/sound/soc/intel/avs/path.h b/sound/soc/intel/avs/path.h
index bfd253c9fa95..e9317b64de86 100644
--- a/sound/soc/intel/avs/path.h
+++ b/sound/soc/intel/avs/path.h
@@ -69,4 +69,7 @@ int avs_path_reset(struct avs_path *path);
 int avs_path_pause(struct avs_path *path);
 int avs_path_run(struct avs_path *path, int trigger);
 
+int avs_peakvol_set_volume(struct avs_dev *adev, struct avs_path_module *mod,
+			   struct soc_mixer_control *mc, long *input);
+
 #endif
-- 
2.25.1

