Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88EB14373A
	for <linux-sound@vger.kernel.org>; Tue, 12 Mar 2024 18:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710268680; cv=none; b=o4tYu052uvRe/2Y1BIoLyp/VsszqR1MNdRdh5cJzJ3afjXneiQWdXUJmo7OJp+JmU561dQDH0b3mV+hnAlcMfROqfz5UuhXMlBrMOheamrtWT9TxbkdT4y8JOEEif7qesLqIoz/dt0X1GjNtOLFSuywzyHUZ4CsEW2GgnXX63oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710268680; c=relaxed/simple;
	bh=pwjkm2fxqMuTHCLrxR7l1/lBE22syQLoOuPAyaWHRGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=INN2mQKAF7Uqoj7NA251yc07F1UFMwt9dQnvn33yYZpqtDOvLOt0BanEoNXjS5jtA7bj0RkURFRK4zUeeMy5ZYs1PA/HZyZw3Gai7TX6oc9g9zuWT3jGoMMm5PL7UjqhEp4IXLF+iVymFLeuv55gcpzvkfG0qEjqchhm1XPgH4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=OpO1ywxU; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="OpO1ywxU"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 3DC66604B628; Wed, 13 Mar 2024 05:07:56 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 3DC66604B628
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1710268676; bh=6lAeo1OR1rAhyXqrtJCCpY47RmpKVIaWH0kntUnU4iQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OpO1ywxUhrgSC3bvc95y8bH2pRyMeDVDpCW4gwWOqBTcQECnz4vxDDs9TUwwhEC3h
	 GVbX43AxhOQgVA/D73hW06w88IjzMenSX7qScuniJDdRaIE+LwRrouUqoK+wWhPp4S
	 Vq5jvB7+NIXv/ETmiM/dWGV2GKgXlGlZPkt6Tpoxpgfk9rdHpA2F1ZEvQMfd3CIKlw
	 4fXzVbH//cy6O5GrWYJHIplrdQKpzyVi0v5zUq5gPSL29dQK4f0ppAPdB3YSEPHit4
	 eI5sueXNRhuTyGP9g5/HU+j99fPZXRNAX4jGyL6ZQHrVzt3In/VyFKyqGYcExcdWW4
	 Ua0D00EzUAnvw==
Date: Wed, 13 Mar 2024 05:07:56 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [PATCH 13/14] ALSA: scarlett2: Add autogain target controls
Message-ID: <33d7f6dc965ab09522361ec99745a0685e4b8272.1710264833.git.g@b4.vu>
References: <cover.1710264833.git.g@b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1710264833.git.g@b4.vu>

The Scarlett 4th Gen and Vocaster interfaces allow the autogain target
dBFS value(s) to be configured. Add Mean and Peak Target controls for
4th Gen, and a Hot Target control for Vocaster.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 207 ++++++++++++++++++++++++++++++++++++
 1 file changed, 207 insertions(+)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 43922e217503..6040c4df356f 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -332,6 +332,17 @@ enum {
 	SCARLETT2_DIM_MUTE_COUNT
 };
 
+/* Autogain target values */
+
+#define SCARLETT2_AG_TARGET_MIN (-30)
+
+enum {
+	SCARLETT2_AG_HOT_TARGET,
+	SCARLETT2_AG_MEAN_TARGET,
+	SCARLETT2_AG_PEAK_TARGET,
+	SCARLETT2_AG_TARGET_COUNT
+};
+
 /* Flash Write State */
 enum {
 	SCARLETT2_FLASH_WRITE_STATE_IDLE,
@@ -512,6 +523,9 @@ enum {
 	SCARLETT2_CONFIG_TALKBACK_MAP,
 	SCARLETT2_CONFIG_AUTOGAIN_SWITCH,
 	SCARLETT2_CONFIG_AUTOGAIN_STATUS,
+	SCARLETT2_CONFIG_AG_HOT_TARGET,
+	SCARLETT2_CONFIG_AG_MEAN_TARGET,
+	SCARLETT2_CONFIG_AG_PEAK_TARGET,
 	SCARLETT2_CONFIG_INPUT_GAIN,
 	SCARLETT2_CONFIG_SAFE_SWITCH,
 	SCARLETT2_CONFIG_INPUT_SELECT_SWITCH,
@@ -523,6 +537,18 @@ enum {
 	SCARLETT2_CONFIG_COUNT
 };
 
+/* Autogain target configuration parameters and names */
+
+static const int scarlett2_ag_target_configs[] = {
+	[SCARLETT2_AG_HOT_TARGET]  = SCARLETT2_CONFIG_AG_HOT_TARGET,
+	[SCARLETT2_AG_MEAN_TARGET] = SCARLETT2_CONFIG_AG_MEAN_TARGET,
+	[SCARLETT2_AG_PEAK_TARGET] = SCARLETT2_CONFIG_AG_PEAK_TARGET
+};
+
+static const char *const scarlett2_ag_target_names[] = {
+	"Hot", "Mean", "Peak"
+};
+
 /* Location, size, and activation command number for the configuration
  * parameters. Size is in bits and may be 1, 8, 16, or 32.
  *
@@ -740,6 +766,9 @@ static const struct scarlett2_config_set scarlett2_config_set_vocaster = {
 		[SCARLETT2_CONFIG_AUTOGAIN_STATUS] = {
 			.offset = 0x1c2, .size = 8, },
 
+		[SCARLETT2_CONFIG_AG_HOT_TARGET] = {
+			.offset = 0xc1, .size = 8, .activate = 29, .pbuf = 1 },
+
 		[SCARLETT2_CONFIG_INPUT_GAIN] = {
 			.offset = 0x9f, .size = 8, .activate = 21, .pbuf = 1 },
 
@@ -818,6 +847,12 @@ static const struct scarlett2_config_set scarlett2_config_set_gen4_2i2 = {
 		[SCARLETT2_CONFIG_AUTOGAIN_STATUS] = {
 			.offset = 0x137, .size = 8 },
 
+		[SCARLETT2_CONFIG_AG_MEAN_TARGET] = {
+			.offset = 0x131, .size = 8, .activate = 29, .pbuf = 1 },
+
+		[SCARLETT2_CONFIG_AG_PEAK_TARGET] = {
+			.offset = 0x132, .size = 8, .activate = 30, .pbuf = 1 },
+
 		[SCARLETT2_CONFIG_PHANTOM_SWITCH] = {
 			.offset = 0x48, .size = 8, .activate = 11, .pbuf = 1,
 			.mute = 1 },
@@ -862,6 +897,12 @@ static const struct scarlett2_config_set scarlett2_config_set_gen4_4i4 = {
 		[SCARLETT2_CONFIG_AUTOGAIN_STATUS] = {
 			.offset = 0x140, .size = 8 },
 
+		[SCARLETT2_CONFIG_AG_MEAN_TARGET] = {
+			.offset = 0x13a, .size = 8, .activate = 23, .pbuf = 1 },
+
+		[SCARLETT2_CONFIG_AG_PEAK_TARGET] = {
+			.offset = 0x13b, .size = 8, .activate = 24, .pbuf = 1 },
+
 		[SCARLETT2_CONFIG_PHANTOM_SWITCH] = {
 			.offset = 0x5a, .size = 8, .activate = 11, .pbuf = 1,
 			.mute = 1 },
@@ -1189,6 +1230,7 @@ struct scarlett2_data {
 	u8 gain[SCARLETT2_INPUT_GAIN_MAX];
 	u8 autogain_switch[SCARLETT2_INPUT_GAIN_MAX];
 	u8 autogain_status[SCARLETT2_INPUT_GAIN_MAX];
+	s8 ag_targets[SCARLETT2_AG_TARGET_COUNT];
 	u8 safe_switch[SCARLETT2_INPUT_GAIN_MAX];
 	u8 pcm_input_switch;
 	u8 direct_monitor_switch;
@@ -1217,6 +1259,7 @@ struct scarlett2_data {
 	struct snd_kcontrol *input_gain_ctls[SCARLETT2_INPUT_GAIN_MAX];
 	struct snd_kcontrol *autogain_ctls[SCARLETT2_INPUT_GAIN_MAX];
 	struct snd_kcontrol *autogain_status_ctls[SCARLETT2_INPUT_GAIN_MAX];
+	struct snd_kcontrol *ag_target_ctls[SCARLETT2_AG_TARGET_COUNT];
 	struct snd_kcontrol *safe_ctls[SCARLETT2_INPUT_GAIN_MAX];
 	struct snd_kcontrol *pcm_input_switch_ctl;
 	struct snd_kcontrol *mux_ctls[SCARLETT2_MUX_MAX];
@@ -3253,6 +3296,7 @@ static int scarlett2_update_autogain(struct usb_mixer_interface *mixer)
 	const struct scarlett2_device_info *info = private->info;
 	int err, i;
 	u8 raw_autogain_status[SCARLETT2_INPUT_GAIN_MAX];
+	s8 ag_target_values[SCARLETT2_AG_TARGET_COUNT];
 
 	private->autogain_updated = 0;
 
@@ -3291,6 +3335,21 @@ static int scarlett2_update_autogain(struct usb_mixer_interface *mixer)
 			private->autogain_status[i] =
 				private->num_autogain_status_texts - 1;
 
+
+	for (int i = 0; i < SCARLETT2_AG_TARGET_COUNT; i++)
+		if (scarlett2_has_config_item(private,
+					      scarlett2_ag_target_configs[i])) {
+			err = scarlett2_usb_get_config(
+				mixer, scarlett2_ag_target_configs[i],
+				1, &ag_target_values[i]);
+			if (err < 0)
+				return err;
+		}
+
+	/* convert from negative dBFS as used by the device */
+	for (int i = 0; i < SCARLETT2_AG_TARGET_COUNT; i++)
+		private->ag_targets[i] = -ag_target_values[i];
+
 	return 0;
 }
 
@@ -3324,6 +3383,12 @@ static void scarlett2_autogain_update_access(struct usb_mixer_interface *mixer)
 		scarlett2_set_ctl_access(private->phantom_ctls[i], val);
 	for (i = 0; i < info->dsp_input_count; i++)
 		scarlett2_set_ctl_access(private->dsp_ctls[i], val);
+
+	for (i = 0; i < SCARLETT2_AG_TARGET_COUNT; i++)
+		if (scarlett2_has_config_item(private,
+					      scarlett2_ag_target_configs[i]))
+			scarlett2_set_ctl_access(
+				private->ag_target_ctls[i], val);
 }
 
 /* Notify of access mode change for all controls read-only while
@@ -3366,6 +3431,12 @@ static void scarlett2_autogain_notify_access(struct usb_mixer_interface *mixer)
 	for (i = 0; i < info->phantom_count; i++)
 		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_INFO,
 			       &private->phantom_ctls[i]->id);
+
+	for (i = 0; i < SCARLETT2_AG_TARGET_COUNT; i++)
+		if (scarlett2_has_config_item(private,
+					      scarlett2_ag_target_configs[i]))
+			snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_INFO,
+				       &private->ag_target_ctls[i]->id);
 }
 
 /* Call scarlett2_update_autogain() and
@@ -3559,6 +3630,122 @@ static const struct snd_kcontrol_new scarlett2_autogain_status_ctl = {
 	.get  = scarlett2_autogain_status_ctl_get,
 };
 
+/*** Autogain Target Controls ***/
+
+static int scarlett2_ag_target_ctl_info(
+	struct snd_kcontrol *kctl, struct snd_ctl_elem_info *uinfo)
+{
+	struct usb_mixer_elem_info *elem = kctl->private_data;
+	struct usb_mixer_interface *mixer = elem->head.mixer;
+	struct scarlett2_data *private = mixer->private_data;
+	int err;
+
+	mutex_lock(&private->data_mutex);
+
+	if (private->hwdep_in_use) {
+		err = -EBUSY;
+		goto unlock;
+	}
+
+	err = scarlett2_check_autogain_updated(mixer);
+	if (err < 0)
+		goto unlock;
+
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 1;
+	uinfo->value.integer.min = SCARLETT2_AG_TARGET_MIN;
+	uinfo->value.integer.max = 0;
+	uinfo->value.integer.step = 1;
+
+unlock:
+	mutex_unlock(&private->data_mutex);
+	return err;
+}
+
+static int scarlett2_ag_target_ctl_get(
+	struct snd_kcontrol *kctl, struct snd_ctl_elem_value *ucontrol)
+{
+	struct usb_mixer_elem_info *elem = kctl->private_data;
+	struct usb_mixer_interface *mixer = elem->head.mixer;
+	struct scarlett2_data *private = mixer->private_data;
+	int err;
+
+	mutex_lock(&private->data_mutex);
+
+	if (private->hwdep_in_use) {
+		err = -EBUSY;
+		goto unlock;
+	}
+
+	if (private->autogain_updated) {
+		err = scarlett2_update_autogain(mixer);
+		if (err < 0)
+			goto unlock;
+	}
+
+	ucontrol->value.integer.value[0] = private->ag_targets[elem->control];
+
+unlock:
+	mutex_unlock(&private->data_mutex);
+	return err;
+}
+
+static int scarlett2_ag_target_ctl_put(
+	struct snd_kcontrol *kctl, struct snd_ctl_elem_value *ucontrol)
+{
+	struct usb_mixer_elem_info *elem = kctl->private_data;
+	struct usb_mixer_interface *mixer = elem->head.mixer;
+	struct scarlett2_data *private = mixer->private_data;
+
+	int index = elem->control;
+	int oval, val, err;
+
+	mutex_lock(&private->data_mutex);
+
+	if (private->hwdep_in_use) {
+		err = -EBUSY;
+		goto unlock;
+	}
+
+	err = scarlett2_check_put_during_autogain(mixer);
+	if (err < 0)
+		goto unlock;
+
+	oval = private->ag_targets[index];
+	val = clamp(ucontrol->value.integer.value[0],
+		    (long)SCARLETT2_AG_TARGET_MIN, 0L);
+
+	if (oval == val)
+		goto unlock;
+
+	private->ag_targets[index] = val;
+
+	/* Send new value to the device */
+	err = scarlett2_usb_set_config(
+		mixer, scarlett2_ag_target_configs[index], 1, -val);
+	if (err == 0)
+		err = 1;
+
+unlock:
+	mutex_unlock(&private->data_mutex);
+	return err;
+}
+
+static const DECLARE_TLV_DB_MINMAX(
+	db_scale_ag_target, SCARLETT2_AG_TARGET_MIN * 100, 0
+);
+
+static const struct snd_kcontrol_new scarlett2_ag_target_ctl = {
+	.iface = SNDRV_CTL_ELEM_IFACE_CARD,
+	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE |
+		  SNDRV_CTL_ELEM_ACCESS_TLV_READ,
+	.name = "",
+	.info = scarlett2_ag_target_ctl_info,
+	.get  = scarlett2_ag_target_ctl_get,
+	.put  = scarlett2_ag_target_ctl_put,
+	.tlv = { .p = db_scale_ag_target }
+};
+
 /*** Input Select Control ***/
 
 static int scarlett2_update_input_select(struct usb_mixer_interface *mixer)
@@ -6693,6 +6880,20 @@ static int scarlett2_add_line_in_ctls(struct usb_mixer_interface *mixer)
 			i, 1, s, &private->autogain_status_ctls[i]);
 	}
 
+	/* Add autogain target controls */
+	for (i = 0; i < SCARLETT2_AG_TARGET_COUNT; i++)
+		if (scarlett2_has_config_item(private,
+					      scarlett2_ag_target_configs[i])) {
+
+			scnprintf(s, sizeof(s), "Autogain %s Target",
+				  scarlett2_ag_target_names[i]);
+			err = scarlett2_add_new_ctl(
+				mixer, &scarlett2_ag_target_ctl,
+				i, 1, s, &private->ag_target_ctls[i]);
+			if (err < 0)
+				return err;
+		}
+
 	/* Add safe-mode input switch controls */
 	for (i = 0; i < info->safe_input_count; i++) {
 		scnprintf(s, sizeof(s), fmt, i + 1,
@@ -7783,6 +7984,12 @@ static void scarlett2_notify_autogain(struct usb_mixer_interface *mixer)
 			       &private->autogain_status_ctls[i]->id);
 	}
 
+	for (i = 0; i < SCARLETT2_AG_TARGET_COUNT; i++)
+		if (scarlett2_has_config_item(private,
+					      scarlett2_ag_target_configs[i]))
+			snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_INFO,
+				       &private->ag_target_ctls[i]->id);
+
 	scarlett2_autogain_notify_access(mixer);
 }
 
-- 
2.43.0

