Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A39424DCF9
	for <linux-sound@vger.kernel.org>; Mon,  9 Mar 2026 09:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773047777; cv=none; b=euo5FdPM3SoYyPgKdYkCDkRePB3JjeNx4rwtN1QOgFNI9m9fP/JnVKhBO4X4MKpRTwZJFaJh6K2uUTGWvbY0Xj8Nd0H4ZBNhRMtI/x5o6fYGaYzKThYFyunSGGsV5r4GUdf2Z+fBfXIsxwzzV5xhC2Q3vQG6ZpDY5BFN0ilUCas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773047777; c=relaxed/simple;
	bh=hhNk3UOWHl4uvw669viSLn/HtOtqT9vPIf1EJBBmYVA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aFiTfpIxzH5r9vhQ1BvO7fvdOZrau3B2+ujV+I0fYxDziGkt79JHlm6WrQ0UHRkuqmLlsBvAUNdRvY8aDVIs4xmdOfJBp9eJv875BHCIv8EDqlsSEBOq9drv+U2soUgT7X4y5ufmFVv9SiZ8sm2gQnqoXLGJe8dFEbHiEOIr95g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PVUfXuL3; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PVUfXuL3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773047776; x=1804583776;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hhNk3UOWHl4uvw669viSLn/HtOtqT9vPIf1EJBBmYVA=;
  b=PVUfXuL39sUdbFxYyeFoL7cVhIqyf7c4Ffdt6+HLfBcUGfyKX9UyjOmk
   QIhzsbnAyjeRPHogSpwifPQckJ9YsmfROuNrXrm7mbld/wV1utDMtcZWP
   jwmJi+qHpqdomAYrv6LvoUGCJdxXsJsT1C0HR8wK37TLmIdc3fHhMtQmh
   7O45+//Hvlgg7gJ4MixUy8MHazHztbgdtzfchp2bSpGgVuRPO9Q7EBhEI
   hi8E2PR1r6f7tE/5Hp9svbx0r00w9H1EBQ3uOUa6dJ4dMMvNfzwwrkShz
   GyuIZUf7G39Mb8jhCofAwtzUIAZEiCS81GAxk1cSUSp1iHTCqec6qDYFB
   w==;
X-CSE-ConnectionGUID: 4GrDIdXsSYOvLdgSA3ivZA==
X-CSE-MsgGUID: M75VZ8UxQMO/NpXMNdWPrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="84777010"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="84777010"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 02:16:15 -0700
X-CSE-ConnectionGUID: qhjnfF73R1KJ8tTOfWQoQQ==
X-CSE-MsgGUID: v817Xu7uSR6QYsbGhv1xkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="245688636"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa001.fm.intel.com with ESMTP; 09 Mar 2026 02:16:13 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 5/5] ASoC: Intel: catpt: Migrate to the new control operations
Date: Mon,  9 Mar 2026 10:16:05 +0100
Message-Id: <20260309091605.896307-6-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260309091605.896307-1-cezary.rojewski@intel.com>
References: <20260309091605.896307-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch to the new implementation and remove all unused code. The change
effectively causes the control put() operations to return '1' if a
change occurred, '0' if no change was made or error otherwise.

The second effect of the update is reducing the power consumption. With
the new control-operations in place, the controls no longer wake the DSP
just for the sake of updating volume (or mute) settings on the firmware
side. The values are cached and actual update occurs only when streams
are being opened for streaming or are already running.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/pcm.c | 243 +-----------------------------------
 1 file changed, 6 insertions(+), 237 deletions(-)

diff --git a/sound/soc/intel/catpt/pcm.c b/sound/soc/intel/catpt/pcm.c
index 2ed9df7bc434..8356dbdb2809 100644
--- a/sound/soc/intel/catpt/pcm.c
+++ b/sound/soc/intel/catpt/pcm.c
@@ -160,32 +160,6 @@ static void catpt_stream_read_position(struct catpt_dev *cdev,
 	memcpy_fromio(pos, cdev->lpe_ba + stream->info.read_pos_regaddr, sizeof(*pos));
 }
 
-static u32 catpt_stream_volume(struct catpt_dev *cdev,
-			       struct catpt_stream_runtime *stream, u32 channel)
-{
-	u32 volume, offset;
-
-	if (channel >= CATPT_CHANNELS_MAX)
-		channel = 0;
-
-	offset = stream->info.volume_regaddr[channel];
-	memcpy_fromio(&volume, cdev->lpe_ba + offset, sizeof(volume));
-	return volume;
-}
-
-static u32 catpt_mixer_volume(struct catpt_dev *cdev,
-			      struct catpt_mixer_stream_info *info, u32 channel)
-{
-	u32 volume, offset;
-
-	if (channel >= CATPT_CHANNELS_MAX)
-		channel = 0;
-
-	offset = info->volume_regaddr[channel];
-	memcpy_fromio(&volume, cdev->lpe_ba + offset, sizeof(volume));
-	return volume;
-}
-
 static void catpt_arrange_page_table(struct snd_pcm_substream *substream,
 				     struct snd_dma_buffer *pgtbl)
 {
@@ -911,7 +885,6 @@ static int catpt_volume_info(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
-__maybe_unused
 static int catpt_volume_get(struct snd_kcontrol *kctl, struct snd_ctl_elem_value *uctl)
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kctl);
@@ -938,7 +911,6 @@ static int catpt_volume_get(struct snd_kcontrol *kctl, struct snd_ctl_elem_value
 	return 0;
 }
 
-__maybe_unused
 static int catpt_volume_put(struct snd_kcontrol *kctl, struct snd_ctl_elem_value *uctl)
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kctl);
@@ -967,14 +939,12 @@ static int catpt_volume_put(struct snd_kcontrol *kctl, struct snd_ctl_elem_value
 	return 1;
 }
 
-__maybe_unused
 static int catpt_loopback_mute_get(struct snd_kcontrol *kctl, struct snd_ctl_elem_value *uctl)
 {
 	uctl->value.integer.value[0] = *(bool *)kctl->private_value;
 	return 0;
 }
 
-__maybe_unused
 static int catpt_loopback_mute_put(struct snd_kcontrol *kctl, struct snd_ctl_elem_value *uctl)
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kctl);
@@ -1002,195 +972,6 @@ static int catpt_loopback_mute_put(struct snd_kcontrol *kctl, struct snd_ctl_ele
 	return 1;
 }
 
-static int catpt_mixer_volume_get(struct snd_kcontrol *kcontrol,
-				  struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
-	struct catpt_dev *cdev = dev_get_drvdata(component->dev);
-	u32 dspvol;
-	int ret;
-	int i;
-
-	ret = pm_runtime_resume_and_get(cdev->dev);
-	if (ret)
-		return ret;
-
-	for (i = 0; i < CATPT_CHANNELS_MAX; i++) {
-		dspvol = catpt_mixer_volume(cdev, &cdev->mixer, i);
-		ucontrol->value.integer.value[i] = dspvol_to_ctlvol(dspvol);
-	}
-
-	pm_runtime_put_autosuspend(cdev->dev);
-
-	return 0;
-}
-
-static int catpt_mixer_volume_put(struct snd_kcontrol *kcontrol,
-				  struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
-	struct catpt_dev *cdev = dev_get_drvdata(component->dev);
-	int ret;
-
-	ret = pm_runtime_resume_and_get(cdev->dev);
-	if (ret)
-		return ret;
-
-	ret = catpt_set_dspvol(cdev, cdev->mixer.mixer_hw_id,
-			       ucontrol->value.integer.value);
-
-	pm_runtime_put_autosuspend(cdev->dev);
-
-	return ret;
-}
-
-static int catpt_stream_volume_get(struct snd_kcontrol *kcontrol,
-				   struct snd_ctl_elem_value *ucontrol,
-				   enum catpt_pin_id pin_id)
-{
-	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
-	struct catpt_stream_runtime *stream;
-	struct catpt_dev *cdev = dev_get_drvdata(component->dev);
-	long *ctlvol = (long *)kcontrol->private_value;
-	u32 dspvol;
-	int ret;
-	int i;
-
-	guard(mutex)(&cdev->stream_mutex);
-
-	stream = catpt_stream_find(cdev, pin_id);
-	if (!stream) {
-		for (i = 0; i < CATPT_CHANNELS_MAX; i++)
-			ucontrol->value.integer.value[i] = ctlvol[i];
-		return 0;
-	}
-
-	ret = pm_runtime_resume_and_get(cdev->dev);
-	if (ret)
-		return ret;
-
-	for (i = 0; i < CATPT_CHANNELS_MAX; i++) {
-		dspvol = catpt_stream_volume(cdev, stream, i);
-		ucontrol->value.integer.value[i] = dspvol_to_ctlvol(dspvol);
-	}
-
-	pm_runtime_put_autosuspend(cdev->dev);
-
-	return 0;
-}
-
-static int catpt_stream_volume_put(struct snd_kcontrol *kcontrol,
-				   struct snd_ctl_elem_value *ucontrol,
-				   enum catpt_pin_id pin_id)
-{
-	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
-	struct catpt_stream_runtime *stream;
-	struct catpt_dev *cdev = dev_get_drvdata(component->dev);
-	long *ctlvol = (long *)kcontrol->private_value;
-	int ret, i;
-
-	guard(mutex)(&cdev->stream_mutex);
-
-	stream = catpt_stream_find(cdev, pin_id);
-	if (!stream) {
-		for (i = 0; i < CATPT_CHANNELS_MAX; i++)
-			ctlvol[i] = ucontrol->value.integer.value[i];
-		return 0;
-	}
-
-	ret = pm_runtime_resume_and_get(cdev->dev);
-	if (ret)
-		return ret;
-
-	ret = catpt_set_dspvol(cdev, stream->info.stream_hw_id,
-			       ucontrol->value.integer.value);
-
-	pm_runtime_put_autosuspend(cdev->dev);
-
-	if (ret)
-		return ret;
-
-	for (i = 0; i < CATPT_CHANNELS_MAX; i++)
-		ctlvol[i] = ucontrol->value.integer.value[i];
-	return 0;
-}
-
-static int catpt_offload1_volume_get(struct snd_kcontrol *kctl,
-				     struct snd_ctl_elem_value *uctl)
-{
-	return catpt_stream_volume_get(kctl, uctl, CATPT_PIN_ID_OFFLOAD1);
-}
-
-static int catpt_offload1_volume_put(struct snd_kcontrol *kctl,
-				     struct snd_ctl_elem_value *uctl)
-{
-	return catpt_stream_volume_put(kctl, uctl, CATPT_PIN_ID_OFFLOAD1);
-}
-
-static int catpt_offload2_volume_get(struct snd_kcontrol *kctl,
-				     struct snd_ctl_elem_value *uctl)
-{
-	return catpt_stream_volume_get(kctl, uctl, CATPT_PIN_ID_OFFLOAD2);
-}
-
-static int catpt_offload2_volume_put(struct snd_kcontrol *kctl,
-				     struct snd_ctl_elem_value *uctl)
-{
-	return catpt_stream_volume_put(kctl, uctl, CATPT_PIN_ID_OFFLOAD2);
-}
-
-static int catpt_capture_volume_get(struct snd_kcontrol *kctl,
-				    struct snd_ctl_elem_value *uctl)
-{
-	return catpt_stream_volume_get(kctl, uctl, CATPT_PIN_ID_CAPTURE1);
-}
-
-static int catpt_capture_volume_put(struct snd_kcontrol *kctl,
-				    struct snd_ctl_elem_value *uctl)
-{
-	return catpt_stream_volume_put(kctl, uctl, CATPT_PIN_ID_CAPTURE1);
-}
-
-static int catpt_loopback_switch_get(struct snd_kcontrol *kcontrol,
-				     struct snd_ctl_elem_value *ucontrol)
-{
-	ucontrol->value.integer.value[0] = *(bool *)kcontrol->private_value;
-	return 0;
-}
-
-static int catpt_loopback_switch_put(struct snd_kcontrol *kcontrol,
-				     struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
-	struct catpt_stream_runtime *stream;
-	struct catpt_dev *cdev = dev_get_drvdata(component->dev);
-	bool mute;
-	int ret;
-
-	guard(mutex)(&cdev->stream_mutex);
-
-	mute = (bool)ucontrol->value.integer.value[0];
-	stream = catpt_stream_find(cdev, CATPT_PIN_ID_REFERENCE);
-	if (!stream) {
-		*(bool *)kcontrol->private_value = mute;
-		return 0;
-	}
-
-	ret = pm_runtime_resume_and_get(cdev->dev);
-	if (ret)
-		return ret;
-
-	ret = catpt_ipc_mute_loopback(cdev, stream->info.stream_hw_id, mute);
-
-	pm_runtime_put_autosuspend(cdev->dev);
-
-	if (ret)
-		return CATPT_IPC_RET(ret);
-
-	*(bool *)kcontrol->private_value = mute;
-	return 0;
-}
-
 static int catpt_waves_switch_get(struct snd_kcontrol *kcontrol,
 				  struct snd_ctl_elem_value *ucontrol)
 {
@@ -1219,7 +1000,7 @@ static int catpt_waves_param_put(struct snd_kcontrol *kcontrol,
 
 static const SNDRV_CTL_TLVD_DECLARE_DB_SCALE(catpt_volume_tlv, -9000, 300, 1);
 
-#define CATPT_VOLUME_CTL2(kname, pname) {		\
+#define CATPT_VOLUME_CTL(kname, pname) {		\
 	.iface	= SNDRV_CTL_ELEM_IFACE_MIXER,		\
 	.name	= kname,				\
 	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE |	\
@@ -1232,27 +1013,15 @@ static const SNDRV_CTL_TLVD_DECLARE_DB_SCALE(catpt_volume_tlv, -9000, 300, 1);
 		&(struct catpt_control_data) { CATPT_PIN_ID_##pname } \
 }
 
-#define CATPT_VOLUME_CTL(kname, sname) \
-{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, \
-	.name = (kname), \
-	.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ | \
-		  SNDRV_CTL_ELEM_ACCESS_READWRITE, \
-	.info = catpt_volume_info, \
-	.get = catpt_##sname##_volume_get, \
-	.put = catpt_##sname##_volume_put, \
-	.tlv.p = catpt_volume_tlv, \
-	.private_value = (unsigned long) \
-		&(long[CATPT_CHANNELS_MAX]) {0} }
-
 static const struct snd_kcontrol_new component_kcontrols[] = {
 /* Master volume (mixer stream) */
-CATPT_VOLUME_CTL("Master Playback Volume", mixer),
+CATPT_VOLUME_CTL("Master Playback Volume", MIXER),
 /* Individual volume controls for offload and capture */
-CATPT_VOLUME_CTL("Media0 Playback Volume", offload1),
-CATPT_VOLUME_CTL("Media1 Playback Volume", offload2),
-CATPT_VOLUME_CTL("Mic Capture Volume", capture),
+CATPT_VOLUME_CTL("Media0 Playback Volume", OFFLOAD1),
+CATPT_VOLUME_CTL("Media1 Playback Volume", OFFLOAD2),
+CATPT_VOLUME_CTL("Mic Capture Volume", CAPTURE1),
 SOC_SINGLE_BOOL_EXT("Loopback Mute", (unsigned long)&(bool[1]) {0},
-		    catpt_loopback_switch_get, catpt_loopback_switch_put),
+		    catpt_loopback_mute_get, catpt_loopback_mute_put),
 /* Enable or disable WAVES module */
 SOC_SINGLE_BOOL_EXT("Waves Switch", 0,
 		    catpt_waves_switch_get, catpt_waves_switch_put),
-- 
2.34.1

