Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F9C127B73
	for <linux-sound@vger.kernel.org>; Fri, 10 May 2024 14:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715349756; cv=none; b=TQX+fiLZFdszBa+cH/fk/2FuaDHxuwVTTGAnNfrRlLbBw1UXGn1KJkB2E8FkqMRqbHota/AyEddJx26h+riVH7827PeWiGA35yUck+O/i2ckXDnmnN201abdnvp4z0y0A2iBdETJUfJX9sbJ1I2PdJUllL0TcWf/qobGcepKB1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715349756; c=relaxed/simple;
	bh=KizgTWsjVAR6Jkm9k2diW4VEW17v4SJtX5br9JFZQXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q0NaJchgcqOC2YFBYnV727jXlaaHNw/tyxXe0IKSS0rJKhmsN84qdPtxc904Zp3lmAWTzRgg68EzX5ExuTY8/JI8y5b61QPd4HvcWrF2wpxu22x4VBDQMH2LWdfb+pA5am5fRkEyAJdvr9CccZM5Npxbnqv/yrviB82GUU+EoZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=J9ZqXTpx; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="J9ZqXTpx"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 89601606EA7E; Fri, 10 May 2024 23:24:42 +0930 (ACST)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 89601606EA7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1715349282; bh=YXtvJEjIQRQ0RTLvAUJZnggAp7qcopxTT5TGQH9v3CA=;
	h=Date:From:To:Cc:Subject:From;
	b=J9ZqXTpxWjXddkj0i6x8CZsNGxgm+576JDTc/P9fDOSynm0c+4OPpeNgWyHh1q7oE
	 ZS9pDBep1I5VqN8fGqkeeZJ/M3p1rtmclB8fpGaeLjtKG5EMxnSrBBi1bKO7NPb/4J
	 PrkdtqhVs1eQ/7TKwWFieDeJKmqxDYb4K2lWG6ooDBAkBFOVhwaF1wEU4sGPB7k8LS
	 iHtKnTI8gu7dFt+iRvQazG0DjJLsKEHresmY8ACto4z9UT4UwtZ2SF5e45trNjuH7b
	 DB0uKnonqKHESykMLwvxtOgoVFdUrWdsormTxTqU0e/IlTfQttRjIaPoxVApJM0mgv
	 qVa0sNfer02OA==
Date: Fri, 10 May 2024 23:24:42 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: scarlett2: Add S/PDIF source selection controls
Message-ID: <Zj4nIu+bn8jS5X8+@m.b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Add S/PDIF Source/Digital I/O Mode selection controls for the Scarlett
3rd Gen 18i8/18i20 and Clarett 4Pre/8Pre interfaces. These models have
both coax S/PDIF and optical inputs, and the optical inputs are
switchable between being used as S/PDIF and ADAT inputs. The Scarlett
3rd Gen 18i20 also has a "Dual ADAT" mode for 8-channel audio at
88.2/96kHz.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 179 ++++++++++++++++++++++++++++++++++++
 1 file changed, 179 insertions(+)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index b251d25f2a85..87e9f5f6dddb 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -541,6 +541,7 @@ enum {
 	SCARLETT2_CONFIG_PCM_INPUT_SWITCH,
 	SCARLETT2_CONFIG_DIRECT_MONITOR_GAIN,
 	SCARLETT2_CONFIG_BLUETOOTH_VOLUME,
+	SCARLETT2_CONFIG_SPDIF_MODE,
 	SCARLETT2_CONFIG_COUNT
 };
 
@@ -754,6 +755,9 @@ static const struct scarlett2_config_set scarlett2_config_set_gen3c = {
 
 		[SCARLETT2_CONFIG_TALKBACK_MAP] = {
 			.offset = 0xb0, .size = 16, .activate = 10 },
+
+		[SCARLETT2_CONFIG_SPDIF_MODE] = {
+			.offset = 0x94, .size = 8, .activate = 6 },
 	}
 };
 
@@ -977,6 +981,9 @@ static const struct scarlett2_config_set scarlett2_config_set_clarett = {
 
 		[SCARLETT2_CONFIG_STANDALONE_SWITCH] = {
 			.offset = 0x8d, .size = 8, .activate = 6 },
+
+		[SCARLETT2_CONFIG_SPDIF_MODE] = {
+			.offset = 0x9e, .size = 8, .activate = 4 },
 	}
 };
 
@@ -1147,6 +1154,11 @@ struct scarlett2_device_info {
 	/* has a Bluetooth module with volume control */
 	u8 has_bluetooth;
 
+	/* S/PDIF Source/Digital I/O mode control */
+	const char * const spdif_mode_control_name;
+	const u8 *spdif_mode_values;
+	const char * const *spdif_mode_texts;
+
 	/* remap analogue outputs; 18i8 Gen 3 has "line 3/4" connected
 	 * internally to the analogue 7/8 outputs
 	 */
@@ -1255,6 +1267,7 @@ struct scarlett2_data {
 	u8 standalone_switch;
 	u8 power_status;
 	u8 bluetooth_volume;
+	u8 spdif_mode;
 	u8 meter_level_map[SCARLETT2_MAX_METERS];
 	struct snd_kcontrol *sync_ctl;
 	struct snd_kcontrol *master_vol_ctl;
@@ -1582,6 +1595,14 @@ static const struct scarlett2_device_info s8i6_gen3_info = {
 	}
 };
 
+static const u8 scarlett2_spdif_s18i8_gen3_values[] = { 0, 2, -1 };
+
+static const char * const scarlett2_spdif_s18i8_gen3_texts[] = {
+	"RCA",
+	"Optical",
+	NULL
+};
+
 static const struct scarlett2_device_info s18i8_gen3_info = {
 	.config_set = &scarlett2_config_set_gen3c,
 	.has_speaker_switching = 1,
@@ -1591,6 +1612,10 @@ static const struct scarlett2_device_info s18i8_gen3_info = {
 	.phantom_count = 2,
 	.inputs_per_phantom = 2,
 
+	.spdif_mode_control_name = "S/PDIF Mode Capture Enum",
+	.spdif_mode_values = scarlett2_spdif_s18i8_gen3_values,
+	.spdif_mode_texts = scarlett2_spdif_s18i8_gen3_texts,
+
 	.line_out_remap_enable = 1,
 	.line_out_remap = { 0, 1, 6, 7, 2, 3, 4, 5 },
 	.line_out_unmap = { 0, 1, 4, 5, 6, 7, 2, 3 },
@@ -1661,6 +1686,15 @@ static const struct scarlett2_device_info s18i8_gen3_info = {
 	}
 };
 
+static const u8 scarlett2_spdif_s18i20_gen3_values[] = { 0, 6, 1, -1 };
+
+static const char * const scarlett2_spdif_s18i20_gen3_texts[] = {
+	"S/PDIF RCA",
+	"S/PDIF Optical",
+	"Dual ADAT",
+	NULL
+};
+
 static const struct scarlett2_device_info s18i20_gen3_info = {
 	.config_set = &scarlett2_config_set_gen3c,
 	.has_speaker_switching = 1,
@@ -1671,6 +1705,10 @@ static const struct scarlett2_device_info s18i20_gen3_info = {
 	.phantom_count = 2,
 	.inputs_per_phantom = 4,
 
+	.spdif_mode_control_name = "Digital I/O Mode Capture Enum",
+	.spdif_mode_values = scarlett2_spdif_s18i20_gen3_values,
+	.spdif_mode_texts = scarlett2_spdif_s18i20_gen3_texts,
+
 	.line_out_descrs = {
 		"Monitor 1 L",
 		"Monitor 1 R",
@@ -2019,11 +2057,24 @@ static const struct scarlett2_device_info clarett_2pre_info = {
 	}
 };
 
+static const u8 scarlett2_spdif_clarett_values[] = { 0, 1, 2, -1 };
+
+static const char * const scarlett2_spdif_clarett_texts[] = {
+	"None",
+	"Optical",
+	"RCA",
+	NULL
+};
+
 static const struct scarlett2_device_info clarett_4pre_info = {
 	.config_set = &scarlett2_config_set_clarett,
 	.level_input_count = 2,
 	.air_input_count = 4,
 
+	.spdif_mode_control_name = "S/PDIF Source Capture Enum",
+	.spdif_mode_values = scarlett2_spdif_clarett_values,
+	.spdif_mode_texts = scarlett2_spdif_clarett_texts,
+
 	.line_out_descrs = {
 		"Monitor L",
 		"Monitor R",
@@ -2076,6 +2127,10 @@ static const struct scarlett2_device_info clarett_8pre_info = {
 	.level_input_count = 2,
 	.air_input_count = 8,
 
+	.spdif_mode_control_name = "S/PDIF Source Capture Enum",
+	.spdif_mode_values = scarlett2_spdif_clarett_values,
+	.spdif_mode_texts = scarlett2_spdif_clarett_texts,
+
 	.line_out_descrs = {
 		"Monitor L",
 		"Monitor R",
@@ -7885,6 +7940,121 @@ static int scarlett2_add_bluetooth_volume_ctl(
 				     &private->bluetooth_volume_ctl);
 }
 
+/*** S/PDIF Mode Controls ***/
+
+static int scarlett2_update_spdif_mode(struct usb_mixer_interface *mixer)
+{
+	struct scarlett2_data *private = mixer->private_data;
+	int err, i;
+	u8 mode;
+	const u8 *mode_values = private->info->spdif_mode_values;
+
+	if (!private->info->spdif_mode_control_name)
+		return 0;
+
+	err = scarlett2_usb_get_config(mixer, SCARLETT2_CONFIG_SPDIF_MODE,
+				       1, &mode);
+	if (err < 0)
+		return err;
+
+	private->spdif_mode = 0;
+
+	for (i = 0; *mode_values != -1; i++, mode_values++)
+		if (*mode_values == mode) {
+			private->spdif_mode = i;
+			break;
+		}
+
+	return 0;
+}
+
+static int scarlett2_spdif_mode_ctl_info(struct snd_kcontrol *kctl,
+					   struct snd_ctl_elem_info *uinfo)
+{
+	struct usb_mixer_elem_info *elem = kctl->private_data;
+	struct scarlett2_data *private = elem->head.mixer->private_data;
+	const char * const *mode_texts = private->info->spdif_mode_texts;
+	int count = 0;
+
+	while (*mode_texts++)
+		count++;
+
+	return snd_ctl_enum_info(uinfo, 1, count,
+				 private->info->spdif_mode_texts);
+}
+
+static int scarlett2_spdif_mode_ctl_get(struct snd_kcontrol *kctl,
+					  struct snd_ctl_elem_value *ucontrol)
+{
+	struct usb_mixer_elem_info *elem = kctl->private_data;
+	struct scarlett2_data *private = elem->head.mixer->private_data;
+
+	ucontrol->value.enumerated.item[0] = private->spdif_mode;
+	return 0;
+}
+
+static int scarlett2_spdif_mode_ctl_put(struct snd_kcontrol *kctl,
+					  struct snd_ctl_elem_value *ucontrol)
+{
+	struct usb_mixer_elem_info *elem = kctl->private_data;
+	struct usb_mixer_interface *mixer = elem->head.mixer;
+	struct scarlett2_data *private = mixer->private_data;
+	int oval, val, err = 0;
+	int i;
+
+	mutex_lock(&private->data_mutex);
+
+	oval = private->spdif_mode;
+	val = ucontrol->value.enumerated.item[0];
+
+	if (val < 0) {
+		err = -EINVAL;
+		goto unlock;
+	}
+
+	for (i = 0; i <= val; i++)
+		if (private->info->spdif_mode_values[i] == -1) {
+			err = -EINVAL;
+			goto unlock;
+		}
+
+	if (oval == val)
+		goto unlock;
+
+	private->spdif_mode = val;
+
+	err = scarlett2_usb_set_config(
+		mixer, SCARLETT2_CONFIG_SPDIF_MODE, 0,
+		private->info->spdif_mode_values[val]);
+	if (!err)
+		err = 1;
+
+unlock:
+	mutex_unlock(&private->data_mutex);
+	return err;
+}
+
+static const struct snd_kcontrol_new scarlett2_spdif_mode_ctl = {
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+	.name = "",
+	.info = scarlett2_spdif_mode_ctl_info,
+	.get  = scarlett2_spdif_mode_ctl_get,
+	.put  = scarlett2_spdif_mode_ctl_put,
+};
+
+static int scarlett2_add_spdif_mode_ctl(struct usb_mixer_interface *mixer)
+{
+	struct scarlett2_data *private = mixer->private_data;
+
+	if (!private->info->spdif_mode_control_name)
+		return 0;
+
+	return scarlett2_add_new_ctl(mixer, &scarlett2_spdif_mode_ctl,
+				     0, 1,
+				     private->info->spdif_mode_control_name,
+				     NULL);
+}
+
 /*** Notification Handlers ***/
 
 /* Notify on sync change */
@@ -8797,6 +8967,10 @@ static int scarlett2_read_configs(struct usb_mixer_interface *mixer)
 	if (err < 0)
 		return err;
 
+	err = scarlett2_update_spdif_mode(mixer);
+	if (err < 0)
+		return err;
+
 	err = scarlett2_update_mix(mixer);
 	if (err < 0)
 		return err;
@@ -8929,6 +9103,11 @@ static int snd_scarlett2_controls_create(
 	if (err < 0)
 		return err;
 
+	/* Create the S/PDIF mode control */
+	err = scarlett2_add_spdif_mode_ctl(mixer);
+	if (err < 0)
+		return err;
+
 	/* Set the access mode of controls disabled during
 	 * autogain/phantom power switching.
 	 */
-- 
2.44.0

