Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C0E24DCF9
	for <linux-sound@vger.kernel.org>; Mon,  9 Mar 2026 09:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773047772; cv=none; b=csJy5hvAjlZGb9Evc8tWVO0eGuMMgrUeZ9oYEZImqyTaqNQ3XGbhVjcnadoaCCGPhk5nI3VSFoRGs2SZyStxO/LxvINGErr1lC2kj2UCz6KFVctCHImmh2b9xfom2rywfFgOUmGL+IrWEp4gGlOXDZZ05/2leOHEYaFKXitfDS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773047772; c=relaxed/simple;
	bh=UqPbSHIgXJl24Boz0jza64r9rlfvx0A5Kn6rZbo8zIo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WluQOK+o7c7Dj7qpTOzSnUH186dtsKMOr4F29RgJtQfXGxf1O2SrDXY8zZPN4lXSKbo3qbZkfgCldgllHxFLNxeoCZ/HECU8GejiJz0Md7QtATC/gxShm/5U4YcM4q8NVLha/mB/fHxi7i2YuLHFy7zGck91MVMKO1IKHuK4fXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hUzN08LQ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hUzN08LQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773047770; x=1804583770;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UqPbSHIgXJl24Boz0jza64r9rlfvx0A5Kn6rZbo8zIo=;
  b=hUzN08LQSMwAZKLTlG0JlUKQdr0S9hClRk6ji8QYp5FrspuYl4nr8yhC
   FIlPRK5cdmhhZ/fmRJx1c3TeRvbt2Jl/4nUIAqK+Tb4/Lh6O8a1FaQugD
   FNXe4iRRWq2osGqSrKLmKCJRZ/SxLutunOYb002Op1dCQTpTSdxtxQCis
   IQUQe1AlR0uuzelETZhpHJZfbJRU7Dwo4GWRA5ZQ2wKwxt3/VPswL1eFn
   qQP0X4ERS2FopgLb6qvU/TzYpdTOEf13suH8Ler7nQnldNGHqlaN0ghGA
   bz5gidD0KSwKpsdhdjbpfyBPePTUB7zf4Fb32VxK0rdAbNiumprjrOVMd
   w==;
X-CSE-ConnectionGUID: Rzxzu+CAT2OSY373drw+fA==
X-CSE-MsgGUID: 7k3FqtZQRSaGRvvHikqHpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="84776985"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="84776985"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 02:16:10 -0700
X-CSE-ConnectionGUID: RPfyxFhkSfqnIBlAGFhnRA==
X-CSE-MsgGUID: Za1IBBLORWm6aIqGOgUYNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="245688619"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa001.fm.intel.com with ESMTP; 09 Mar 2026 02:16:08 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 2/5] ASoC: Intel: catpt: New volume and mute control operations
Date: Mon,  9 Mar 2026 10:16:02 +0100
Message-Id: <20260309091605.896307-3-cezary.rojewski@intel.com>
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

The catpt-driver's volume and mute control operations always return '0'
regardless if a change occurred or not. To conform to ALSA's interface,
value '1' shall be returned when a change occurred.

The second major point is power consumption. Existing control operations
always wake the DSP even if no streams are running. In such case waking
the DSP just for the sake of updating the volume (or mute) settings on
the firmware side is a waste of power. The provided implementation
caches the values and updates the settings only when streams are being
opened for streaming or are already running.

As changing existing code is non-trivial, provide new operations
instead. The put() operation, which interests us the most, takes the
following shape:

	// two values provided to put():
	// pin_id - which stream given control relates to
	// value_to_apply - the value from user

	if (control->existing_val == value_to_apply)
		return 0;

	runtime_stream = get_running_stream(pin_id);
	if (runtime_stream != NULL) {
		ret = send_ipc();
		if (ret)
			return ret;
	}

	control->existing_val = value_to_apply;
	return 1;

Adheres to ALSA's expectation and avoids sending IPCs if there is no
change to be made.

Two helpers which are part of the patch, catpt_stream_hw_id() and
catpt_stream_volume_regs(), help differentiate between individual
streams and the general MIXER stream. Translates to one pair of
get()/put() instead of two pairs as done currently.

PIN_ID_INVALID is returned if given stream is not currently running -
the constant is part of the firmware's API but remained unused by the
driver.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/messages.h |   3 +
 sound/soc/intel/catpt/pcm.c      | 149 +++++++++++++++++++++++++++++++
 2 files changed, 152 insertions(+)

diff --git a/sound/soc/intel/catpt/messages.h b/sound/soc/intel/catpt/messages.h
index a634943eb669..fcc9f1b46bc2 100644
--- a/sound/soc/intel/catpt/messages.h
+++ b/sound/soc/intel/catpt/messages.h
@@ -69,6 +69,7 @@ struct catpt_fw_version {
 int catpt_ipc_get_fw_version(struct catpt_dev *cdev,
 			     struct catpt_fw_version *version);
 
+/* PIN_IDs represent both, individual streams and the general mixer. */
 enum catpt_pin_id {
 	CATPT_PIN_ID_SYSTEM = 0,
 	CATPT_PIN_ID_REFERENCE = 1,
@@ -79,6 +80,8 @@ enum catpt_pin_id {
 	CATPT_PIN_ID_MIXER = 7,
 	CATPT_PIN_ID_BLUETOOTH_CAPTURE = 8,
 	CATPT_PIN_ID_BLUETOOTH_RENDER = 9,
+	/* 10 is reserved */
+	CATPT_PIN_ID_INVALID = 11,
 };
 
 enum catpt_path_id {
diff --git a/sound/soc/intel/catpt/pcm.c b/sound/soc/intel/catpt/pcm.c
index fbe4821755bd..08f1e36a136f 100644
--- a/sound/soc/intel/catpt/pcm.c
+++ b/sound/soc/intel/catpt/pcm.c
@@ -114,6 +114,46 @@ catpt_stream_find(struct catpt_dev *cdev, u8 stream_hw_id)
 	return result;
 }
 
+/* Caller responsible for holding ->stream_mutex. */
+static u8 catpt_stream_hw_id(struct catpt_dev *cdev, enum catpt_pin_id pin_id)
+{
+	struct catpt_stream_runtime *stream;
+
+	switch (pin_id) {
+	default:
+		stream = catpt_stream_find(cdev, pin_id);
+		if (stream)
+			return stream->info.stream_hw_id;
+		break;
+	case CATPT_PIN_ID_MIXER:
+		if (!list_empty(&cdev->stream_list))
+			return cdev->mixer.mixer_hw_id;
+		break;
+	}
+
+	return CATPT_PIN_ID_INVALID;
+}
+
+/* Caller responsible for holding ->stream_mutex. */
+static u32 *catpt_stream_volume_regs(struct catpt_dev *cdev, enum catpt_pin_id pin_id)
+{
+	struct catpt_stream_runtime *stream;
+
+	switch (pin_id) {
+	case CATPT_PIN_ID_MIXER:
+		if (!list_empty(&cdev->stream_list))
+			return &cdev->mixer.volume_regaddr[0];
+		break;
+	default:
+		stream = catpt_stream_find(cdev, pin_id);
+		if (stream)
+			return &stream->info.volume_regaddr[0];
+		break;
+	}
+
+	return NULL;
+}
+
 static void catpt_stream_read_position(struct catpt_dev *cdev,
 				       struct catpt_stream_runtime *stream, u32 *pos)
 {
@@ -314,6 +354,11 @@ static void catpt_dai_shutdown(struct snd_pcm_substream *substream,
 
 static int catpt_set_dspvol(struct catpt_dev *cdev, u8 stream_id, long *ctlvol);
 
+struct catpt_control_data {
+	enum catpt_pin_id pin_id;
+	long volumes[CATPT_CHANNELS_MAX];
+};
+
 static int catpt_dai_apply_usettings(struct snd_soc_dai *dai,
 				     struct catpt_stream_runtime *stream)
 {
@@ -855,6 +900,97 @@ static int catpt_volume_info(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
+__maybe_unused
+static int catpt_volume_get(struct snd_kcontrol *kctl, struct snd_ctl_elem_value *uctl)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kctl);
+	struct catpt_dev *cdev = dev_get_drvdata(component->dev);
+	struct catpt_control_data *data;
+	u32 dspvol, *regs;
+	long *uvolumes;
+	int i;
+
+	data = (struct catpt_control_data *)kctl->private_value;
+	uvolumes = &uctl->value.integer.value[0];
+
+	guard(mutex)(&cdev->stream_mutex);
+
+	regs = catpt_stream_volume_regs(cdev, data->pin_id);
+	if (regs) {
+		for (i = 0; i < CATPT_CHANNELS_MAX; i++) {
+			dspvol = readl(cdev->lpe_ba + regs[i]);
+			data->volumes[i] = dspvol_to_ctlvol(dspvol);
+		}
+	}
+
+	memcpy(uvolumes, data->volumes, sizeof(data->volumes));
+	return 0;
+}
+
+__maybe_unused
+static int catpt_volume_put(struct snd_kcontrol *kctl, struct snd_ctl_elem_value *uctl)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kctl);
+	struct catpt_dev *cdev = dev_get_drvdata(component->dev);
+	struct catpt_control_data *data;
+	u8 stream_hw_id;
+	long *uvolumes;
+	int ret;
+
+	data = (struct catpt_control_data *)kctl->private_value;
+	uvolumes = &uctl->value.integer.value[0];
+
+	if (!memcmp(data->volumes, uvolumes, sizeof(data->volumes)))
+		return 0;
+
+	guard(mutex)(&cdev->stream_mutex);
+
+	stream_hw_id = catpt_stream_hw_id(cdev, data->pin_id);
+	if (stream_hw_id != CATPT_PIN_ID_INVALID) {
+		ret = catpt_set_dspvol(cdev, stream_hw_id, uvolumes);
+		if (ret)
+			return ret;
+	}
+
+	memcpy(data->volumes, uvolumes, sizeof(data->volumes));
+	return 1;
+}
+
+__maybe_unused
+static int catpt_loopback_mute_get(struct snd_kcontrol *kctl, struct snd_ctl_elem_value *uctl)
+{
+	uctl->value.integer.value[0] = *(bool *)kctl->private_value;
+	return 0;
+}
+
+__maybe_unused
+static int catpt_loopback_mute_put(struct snd_kcontrol *kctl, struct snd_ctl_elem_value *uctl)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kctl);
+	struct catpt_dev *cdev = dev_get_drvdata(component->dev);
+	bool *kmute, cmute;
+	u8 stream_hw_id;
+	int ret;
+
+	kmute = (bool *)kctl->private_value;
+	cmute = (bool)uctl->value.integer.value[0];
+
+	if (*kmute == cmute)
+		return 0;
+
+	guard(mutex)(&cdev->stream_mutex);
+
+	stream_hw_id = catpt_stream_hw_id(cdev, CATPT_PIN_ID_REFERENCE);
+	if (stream_hw_id != CATPT_PIN_ID_INVALID) {
+		ret = catpt_ipc_mute_loopback(cdev, stream_hw_id, cmute);
+		if (ret)
+			return CATPT_IPC_RET(ret);
+	}
+
+	*kmute = cmute;
+	return 1;
+}
+
 static int catpt_mixer_volume_get(struct snd_kcontrol *kcontrol,
 				  struct snd_ctl_elem_value *ucontrol)
 {
@@ -1072,6 +1208,19 @@ static int catpt_waves_param_put(struct snd_kcontrol *kcontrol,
 
 static const SNDRV_CTL_TLVD_DECLARE_DB_SCALE(catpt_volume_tlv, -9000, 300, 1);
 
+#define CATPT_VOLUME_CTL2(kname, pname) {		\
+	.iface	= SNDRV_CTL_ELEM_IFACE_MIXER,		\
+	.name	= kname,				\
+	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE |	\
+		  SNDRV_CTL_ELEM_ACCESS_TLV_READ,	\
+	.info	= catpt_volume_info,			\
+	.get	= catpt_volume_get,			\
+	.put	= catpt_volume_put,			\
+	.tlv.p	= catpt_volume_tlv,			\
+	.private_value = (unsigned long)		\
+		&(struct catpt_control_data) { CATPT_PIN_ID_##pname } \
+}
+
 #define CATPT_VOLUME_CTL(kname, sname) \
 {	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, \
 	.name = (kname), \
-- 
2.34.1

