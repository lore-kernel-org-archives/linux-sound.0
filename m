Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27CA51397
	for <linux-sound@vger.kernel.org>; Sat, 25 Apr 2026 21:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777153226; cv=none; b=fo7wW+neKG/tAZito/f7uG+LE97pkpBaH2Gf+3pL9hHnlpbcln6AvnmwXAl/SNlIlwEuP9rvzyfZkuY59NnEQMJme7C1Y9Hcr++jiBjQdHAO9XuusSmpr5IGLfK5qyyHdSj7QgYzL3IViAeDPdwLs8mnlNhhnYR2LKKcsxWgIlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777153226; c=relaxed/simple;
	bh=7BjZo0PaO4I5hYzjzGuTbMpZnLfQq6ZBOFWcmWIto2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vgfa7ihe5ZYMzZeb9abkvVW+AlVvn8mxn8zGlyyvGdekmZekHA5TZEQOQwvmx4CJh876WCp8SOJqxelGbh8ld8KEWomYI5LViecZU6eSj08q373PTkUcKiQ8b35w7FRP/++1tTvqGRNh1MgDbVNsoCJtOJCehZ8X3CB5euWbKmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=DAH0G62H; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="DAH0G62H"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 58F3C67BB596; Sun, 26 Apr 2026 07:10:22 +0930 (ACST)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 58F3C67BB596
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1777153222; bh=NrocychTCL1A48/O/crT8YovM/ydmdC8U6i6WWxvr1k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DAH0G62HVHuy7G7p/8No09fm4CiKsp2lq26rgbibuUdpJe4S3QFBozFDY1BnkF7Jt
	 GDLNGe2eO98fogCp6WXUTAXYOIi+/SUsGcSkNspUA9GjdNr/cDGD01DUEOVbpuX6nC
	 QUMN2e5IVqXMNZ1BBWlM/+pOKa6OZPtLHJ3+GFHJRwLO3lihwNE0Sj4dFvYmAdTzAf
	 Z9prpgSS/DEVzqzLh5NEmRoJuSM4EaQL1BmY4IsKu9lpvwUWDxM1/8B4pl8KsHFIdK
	 grvEmrZG8eZDvkHWIU/TOy7idEY9CD6VA3F8xvnP31d7P3Dt+d+whO5btyXn4bzKwn
	 kxIiOg19KL54w==
Date: Sun, 26 Apr 2026 07:10:22 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [PATCH 2/2] ALSA: scarlett2: Add Gen 4 firmware 2417 front-panel
 controls
Message-ID: <1f9785ef76b9e97f785dfa4b91876a19f3c20c8e.1777153011.git.g@b4.vu>
References: <cover.1777153011.git.g@b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1777153011.git.g@b4.vu>

Firmware 2417 for the Scarlett 4th Gen Solo, 2i2, and 4i4 added two
new front-panel features: a LED brightness setting (High/Medium/Low)
and an idle sleep timeout. Add ALSA controls to expose them:

- "Front Panel Brightness": enum (High/Medium/Low)
- "Front Panel Sleep Time": integer, seconds, capped at 86400 (24h)

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 298 +++++++++++++++++++++++++++++++++++-
 1 file changed, 295 insertions(+), 3 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 002c93795238..2555ba343d80 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -192,6 +192,9 @@
 /* maximum Bluetooth volume value */
 #define SCARLETT2_MAX_BLUETOOTH_VOLUME 30
 
+/* maximum front-panel sleep time in seconds (24 hours) */
+#define SCARLETT2_MAX_FP_SLEEP_TIME 86400
+
 /* mixer range from -80dB to +12dB in 0.5dB steps */
 #define SCARLETT2_MIXER_MIN_DB -80
 #define SCARLETT2_MIXER_BIAS (-SCARLETT2_MIXER_MIN_DB * 2)
@@ -568,6 +571,8 @@ enum {
 	SCARLETT2_CONFIG_BLUETOOTH_VOLUME,
 	SCARLETT2_CONFIG_SPDIF_MODE,
 	SCARLETT2_CONFIG_SP_HP_MUTE,
+	SCARLETT2_CONFIG_FP_BRIGHTNESS,
+	SCARLETT2_CONFIG_FP_SLEEP_TIME,
 	SCARLETT2_CONFIG_COUNT
 };
 
@@ -885,6 +890,42 @@ static const struct scarlett2_config_set scarlett2_config_set_gen4_solo = {
 	}
 };
 
+/* Solo Gen 4, firmware version 2417 and above */
+static const struct scarlett2_config_set scarlett2_config_set_gen4_solo_2417 = {
+	.notifications = scarlett4_solo_notifications,
+	.param_buf_addr = 0xd8,
+	.items = {
+		[SCARLETT2_CONFIG_MSD_SWITCH] = {
+			.offset = 0x47, .size = 8, .activate = 4 },
+
+		[SCARLETT2_CONFIG_DIRECT_MONITOR] = {
+			.offset = 0x108, .size = 8, .activate = 12, .pbuf = 1 },
+
+		[SCARLETT2_CONFIG_PHANTOM_SWITCH] = {
+			.offset = 0x46, .size = 8, .activate = 9, .pbuf = 1,
+			.mute = 1 },
+
+		[SCARLETT2_CONFIG_LEVEL_SWITCH] = {
+			.offset = 0x3d, .size = 8, .activate = 10, .pbuf = 1,
+			.mute = 1 },
+
+		[SCARLETT2_CONFIG_AIR_SWITCH] = {
+			.offset = 0x3e, .size = 8, .activate = 11, .pbuf = 1 },
+
+		[SCARLETT2_CONFIG_PCM_INPUT_SWITCH] = {
+			.offset = 0x206, .size = 8, .activate = 25, .pbuf = 1 },
+
+		[SCARLETT2_CONFIG_DIRECT_MONITOR_GAIN] = {
+			.offset = 0x232, .size = 16, .activate = 26 },
+
+		[SCARLETT2_CONFIG_FP_BRIGHTNESS] = {
+			.offset = 0x243, .size = 8, .activate = 27, .pbuf = 1 },
+
+		[SCARLETT2_CONFIG_FP_SLEEP_TIME] = {
+			.offset = 0x248, .size = 32, .activate = 29 }
+	}
+};
+
 /* 2i2 Gen 4 */
 static const struct scarlett2_config_set scarlett2_config_set_gen4_2i2 = {
 	.notifications = scarlett4_2i2_notifications,
@@ -940,8 +981,9 @@ static const struct scarlett2_config_set scarlett2_config_set_gen4_2i2 = {
 
 /* 2i2 Gen 4, firmware version 2417 and above
  *
- * Firmware 2417 shifted DIRECT_MONITOR_GAIN by 4 bytes; all other
- * offsets are unchanged from scarlett2_config_set_gen4_2i2.
+ * Firmware 2417 shifted DIRECT_MONITOR_GAIN by 4 bytes and added
+ * front-panel brightness and sleep controls; all other offsets are
+ * unchanged from scarlett2_config_set_gen4_2i2.
  */
 static const struct scarlett2_config_set scarlett2_config_set_gen4_2i2_2417 = {
 	.notifications = scarlett4_2i2_notifications,
@@ -991,7 +1033,13 @@ static const struct scarlett2_config_set scarlett2_config_set_gen4_2i2_2417 = {
 			.offset = 0x14e, .size = 8, .activate = 18, .pbuf = 1 },
 
 		[SCARLETT2_CONFIG_DIRECT_MONITOR_GAIN] = {
-			.offset = 0x2a4, .size = 16, .activate = 36 }
+			.offset = 0x2a4, .size = 16, .activate = 36 },
+
+		[SCARLETT2_CONFIG_FP_BRIGHTNESS] = {
+			.offset = 0x2c7, .size = 8, .activate = 37, .pbuf = 1 },
+
+		[SCARLETT2_CONFIG_FP_SLEEP_TIME] = {
+			.offset = 0x2cc, .size = 32, .activate = 39 }
 	}
 };
 
@@ -1054,6 +1102,71 @@ static const struct scarlett2_config_set scarlett2_config_set_gen4_4i4 = {
 	}
 };
 
+/* 4i4 Gen 4, firmware version 2417 and above */
+static const struct scarlett2_config_set scarlett2_config_set_gen4_4i4_2417 = {
+	.notifications = scarlett4_4i4_notifications,
+	.param_buf_addr = 0x130,
+	.input_gain_tlv = db_scale_gen4_gain,
+	.autogain_status_texts = scarlett2_autogain_status_gen4,
+	.items = {
+		[SCARLETT2_CONFIG_MSD_SWITCH] = {
+			.offset = 0x5c, .size = 8, .activate = 4 },
+
+		[SCARLETT2_CONFIG_AUTOGAIN_SWITCH] = {
+			.offset = 0x13e, .size = 8, .activate = 10, .pbuf = 1 },
+
+		[SCARLETT2_CONFIG_AUTOGAIN_STATUS] = {
+			.offset = 0x140, .size = 8 },
+
+		[SCARLETT2_CONFIG_AG_MEAN_TARGET] = {
+			.offset = 0x13a, .size = 8, .activate = 23, .pbuf = 1 },
+
+		[SCARLETT2_CONFIG_AG_PEAK_TARGET] = {
+			.offset = 0x13b, .size = 8, .activate = 24, .pbuf = 1 },
+
+		[SCARLETT2_CONFIG_PHANTOM_SWITCH] = {
+			.offset = 0x5a, .size = 8, .activate = 11, .pbuf = 1,
+			.mute = 1 },
+
+		[SCARLETT2_CONFIG_INPUT_GAIN] = {
+			.offset = 0x5e, .size = 8, .activate = 12, .pbuf = 1 },
+
+		[SCARLETT2_CONFIG_LEVEL_SWITCH] = {
+			.offset = 0x4e, .size = 8, .activate = 13, .pbuf = 1,
+			.mute = 1 },
+
+		[SCARLETT2_CONFIG_SAFE_SWITCH] = {
+			.offset = 0x150, .size = 8, .activate = 14, .pbuf = 1 },
+
+		[SCARLETT2_CONFIG_AIR_SWITCH] = {
+			.offset = 0x50, .size = 8, .activate = 15, .pbuf = 1 },
+
+		[SCARLETT2_CONFIG_INPUT_SELECT_SWITCH] = {
+			.offset = 0x153, .size = 8, .activate = 16, .pbuf = 1 },
+
+		[SCARLETT2_CONFIG_INPUT_LINK_SWITCH] = {
+			.offset = 0x156, .size = 8, .activate = 17, .pbuf = 1 },
+
+		[SCARLETT2_CONFIG_MASTER_VOLUME] = {
+			.offset = 0x32, .size = 16 },
+
+		[SCARLETT2_CONFIG_HEADPHONE_VOLUME] = {
+			.offset = 0x3a, .size = 16 },
+
+		[SCARLETT2_CONFIG_POWER_EXT] = {
+			.offset = 0x168, .size = 8 },
+
+		[SCARLETT2_CONFIG_POWER_LOW] = {
+			.offset = 0x16d, .size = 8 },
+
+		[SCARLETT2_CONFIG_FP_BRIGHTNESS] = {
+			.offset = 0x3a9, .size = 8, .activate = 36, .pbuf = 1 },
+
+		[SCARLETT2_CONFIG_FP_SLEEP_TIME] = {
+			.offset = 0x3ac, .size = 32, .activate = 38 }
+	}
+};
+
 /* Clarett USB and Clarett+ devices: 2Pre, 4Pre, 8Pre */
 static const struct scarlett2_config_set scarlett2_config_set_clarett = {
 	.notifications = scarlett2_notifications,
@@ -1404,6 +1517,8 @@ struct scarlett2_data {
 	struct snd_kcontrol *talkback_ctl;
 	struct snd_kcontrol *power_status_ctl;
 	struct snd_kcontrol *bluetooth_volume_ctl;
+	u8 fp_brightness;
+	u32 fp_sleep_time;
 	u8 mux[SCARLETT2_MUX_MAX];
 	u8 mix[SCARLETT2_MIX_MAX];
 	u8 monitor_mix[SCARLETT2_MONITOR_MIX_MAX];
@@ -1994,6 +2109,7 @@ static const struct scarlett2_device_info vocaster_two_info = {
 static const struct scarlett2_device_info solo_gen4_info = {
 	.config_sets = (const struct scarlett2_config_set_entry[]) {
 		{ 2115, &scarlett2_config_set_gen4_solo },
+		{ 2417, &scarlett2_config_set_gen4_solo_2417 },
 		{ }
 	},
 	.has_devmap = 1,
@@ -2109,6 +2225,7 @@ static const struct scarlett2_device_info s2i2_gen4_info = {
 static const struct scarlett2_device_info s4i4_gen4_info = {
 	.config_sets = (const struct scarlett2_config_set_entry[]) {
 		{ 2089, &scarlett2_config_set_gen4_4i4 },
+		{ 2417, &scarlett2_config_set_gen4_4i4_2417 },
 		{ }
 	},
 	.has_devmap = 1,
@@ -7743,6 +7860,172 @@ static int scarlett2_add_bluetooth_volume_ctl(
 				     &private->bluetooth_volume_ctl);
 }
 
+/*** Front Panel Brightness/Sleep Controls ***/
+
+static int scarlett2_update_fp(struct usb_mixer_interface *mixer)
+{
+	struct scarlett2_data *private = mixer->private_data;
+	int err;
+
+	if (scarlett2_has_config_item(private, SCARLETT2_CONFIG_FP_BRIGHTNESS)) {
+		err = scarlett2_usb_get_config(
+			mixer, SCARLETT2_CONFIG_FP_BRIGHTNESS,
+			1, &private->fp_brightness);
+		if (err < 0)
+			return err;
+	}
+
+	if (scarlett2_has_config_item(private, SCARLETT2_CONFIG_FP_SLEEP_TIME)) {
+		err = scarlett2_usb_get_config(
+			mixer, SCARLETT2_CONFIG_FP_SLEEP_TIME,
+			1, &private->fp_sleep_time);
+		if (err < 0)
+			return err;
+	}
+
+	return 0;
+}
+
+static const char * const scarlett2_fp_brightness_texts[] = {
+	"High", "Medium", "Low"
+};
+
+static int scarlett2_fp_brightness_ctl_info(
+	struct snd_kcontrol *kctl, struct snd_ctl_elem_info *uinfo)
+{
+	return snd_ctl_enum_info(uinfo, 1,
+				 ARRAY_SIZE(scarlett2_fp_brightness_texts),
+				 scarlett2_fp_brightness_texts);
+}
+
+static int scarlett2_fp_brightness_ctl_get(
+	struct snd_kcontrol *kctl, struct snd_ctl_elem_value *ucontrol)
+{
+	struct usb_mixer_elem_info *elem = kctl->private_data;
+	struct scarlett2_data *private = elem->head.mixer->private_data;
+
+	ucontrol->value.enumerated.item[0] = private->fp_brightness;
+	return 0;
+}
+
+static int scarlett2_fp_brightness_ctl_put(
+	struct snd_kcontrol *kctl, struct snd_ctl_elem_value *ucontrol)
+{
+	struct usb_mixer_elem_info *elem = kctl->private_data;
+	struct usb_mixer_interface *mixer = elem->head.mixer;
+	struct scarlett2_data *private = mixer->private_data;
+	int oval, val, err;
+
+	guard(mutex)(&private->data_mutex);
+
+	if (private->hwdep_in_use)
+		return -EBUSY;
+
+	oval = private->fp_brightness;
+	val = min(ucontrol->value.enumerated.item[0],
+		  ARRAY_SIZE(scarlett2_fp_brightness_texts) - 1);
+
+	if (oval == val)
+		return 0;
+
+	private->fp_brightness = val;
+
+	err = scarlett2_usb_set_config(
+		mixer, SCARLETT2_CONFIG_FP_BRIGHTNESS, 0, val);
+
+	return err < 0 ? err : 1;
+}
+
+static const struct snd_kcontrol_new scarlett2_fp_brightness_ctl = {
+	.iface = SNDRV_CTL_ELEM_IFACE_CARD,
+	.name = "",
+	.info = scarlett2_fp_brightness_ctl_info,
+	.get  = scarlett2_fp_brightness_ctl_get,
+	.put  = scarlett2_fp_brightness_ctl_put,
+};
+
+static int scarlett2_fp_sleep_time_ctl_info(
+	struct snd_kcontrol *kctl, struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 1;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = SCARLETT2_MAX_FP_SLEEP_TIME;
+	uinfo->value.integer.step = 1;
+	return 0;
+}
+
+static int scarlett2_fp_sleep_time_ctl_get(
+	struct snd_kcontrol *kctl, struct snd_ctl_elem_value *ucontrol)
+{
+	struct usb_mixer_elem_info *elem = kctl->private_data;
+	struct scarlett2_data *private = elem->head.mixer->private_data;
+
+	ucontrol->value.integer.value[0] = private->fp_sleep_time;
+	return 0;
+}
+
+static int scarlett2_fp_sleep_time_ctl_put(
+	struct snd_kcontrol *kctl, struct snd_ctl_elem_value *ucontrol)
+{
+	struct usb_mixer_elem_info *elem = kctl->private_data;
+	struct usb_mixer_interface *mixer = elem->head.mixer;
+	struct scarlett2_data *private = mixer->private_data;
+	u32 oval, val;
+	int err;
+
+	guard(mutex)(&private->data_mutex);
+
+	if (private->hwdep_in_use)
+		return -EBUSY;
+
+	oval = private->fp_sleep_time;
+	val = clamp(ucontrol->value.integer.value[0],
+		    0L, (long)SCARLETT2_MAX_FP_SLEEP_TIME);
+
+	if (oval == val)
+		return 0;
+
+	private->fp_sleep_time = val;
+
+	err = scarlett2_usb_set_config(
+		mixer, SCARLETT2_CONFIG_FP_SLEEP_TIME, 0, val);
+
+	return err < 0 ? err : 1;
+}
+
+static const struct snd_kcontrol_new scarlett2_fp_sleep_time_ctl = {
+	.iface = SNDRV_CTL_ELEM_IFACE_CARD,
+	.name = "",
+	.info = scarlett2_fp_sleep_time_ctl_info,
+	.get  = scarlett2_fp_sleep_time_ctl_get,
+	.put  = scarlett2_fp_sleep_time_ctl_put,
+};
+
+static int scarlett2_add_fp_ctls(struct usb_mixer_interface *mixer)
+{
+	struct scarlett2_data *private = mixer->private_data;
+	int err;
+
+	if (scarlett2_has_config_item(private, SCARLETT2_CONFIG_FP_BRIGHTNESS)) {
+		err = scarlett2_add_new_ctl(
+			mixer, &scarlett2_fp_brightness_ctl, 0, 1,
+			"Front Panel Brightness", NULL);
+		if (err < 0)
+			return err;
+	}
+
+	if (scarlett2_has_config_item(private, SCARLETT2_CONFIG_FP_SLEEP_TIME)) {
+		err = scarlett2_add_new_ctl(
+			mixer, &scarlett2_fp_sleep_time_ctl, 0, 1,
+			"Front Panel Sleep Time", NULL);
+		if (err < 0)
+			return err;
+	}
+
+	return 0;
+}
+
 /*** S/PDIF Mode Controls ***/
 
 static int scarlett2_update_spdif_mode(struct usb_mixer_interface *mixer)
@@ -8789,6 +9072,10 @@ static int scarlett2_read_configs(struct usb_mixer_interface *mixer)
 	if (err < 0)
 		return err;
 
+	err = scarlett2_update_fp(mixer);
+	if (err < 0)
+		return err;
+
 	err = scarlett2_update_spdif_mode(mixer);
 	if (err < 0)
 		return err;
@@ -8935,6 +9222,11 @@ static int snd_scarlett2_controls_create(
 	if (err < 0)
 		return err;
 
+	/* Create the front-panel brightness/sleep controls */
+	err = scarlett2_add_fp_ctls(mixer);
+	if (err < 0)
+		return err;
+
 	/* Create the S/PDIF mode control */
 	err = scarlett2_add_spdif_mode_ctl(mixer);
 	if (err < 0)
-- 
2.53.0

