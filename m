Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F3A1428F8
	for <linux-sound@vger.kernel.org>; Tue, 12 Mar 2024 18:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710268694; cv=none; b=MjhgANduWfKSPe7PXlEKuyIb/9WSqHnNj3VIE/lHzY7eLAllhYhRNPrJeSG+B5gC2SWivNsuCCWqTClKlYhBBQ3wa5HTNdr3fbBxTpmnX9V89yt9eqOHQrhiH7mDXgjhznlUBHgtgwJggXqUrBRDnaQEtTnR7oeTdkMxTHLq+SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710268694; c=relaxed/simple;
	bh=+gpx7+5nB8u0P8n/Z7JeZENLRyJDItL45dl2mGgjge0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mK0AOHvIo9geFrK5kRQqaCQxEX9M9KFwbL1nE4SE8MiTGcgQwO6MNQiaXLUZO9DAQW9yTnU7nGj1fUqbjP2MzJEvSVGhjvjuKCsN583gTKCqSXXhag+rj/Eu3YN1TtUGeAJ3kDlBhRRc1+X7VzIyLhyiRtkr/LEOC1I7/1Rd/es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=Mnv2FLbK; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="Mnv2FLbK"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 82CAE604B628; Wed, 13 Mar 2024 05:08:10 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 82CAE604B628
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1710268690; bh=OY9n+HYxA9NhpubmAwZfRRexPGDn6CXkSDTpHAZqZj8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mnv2FLbKk1O2j7bPafilBZ5pkIXJ66xQZ8TVE4NZYbGkiQiY4Tdo2lxWwpeaEM+XP
	 lyC/2DJ0bMbMVdVGFIrVNBrCO4o5mP4gLpUJH7FLnCSK4XWjFnpjn2oYPo78r1R6aw
	 7QvTRcSIJZwMPVX1XzFE0W+/f2sQ3gD3ts5NyNfsSxv+Nj45dSaUPIg9eo3vEsGf+l
	 mdyg5wLrz8tx8IEhc52mttJ793pNWUqmjNKTbHeN8blxrPh3gVCPRZ3cZv0NhKylwQ
	 1CAJ0wFYl/vrYOB4vP4GQsE6H/BlBNehM/hMNc1k3wgmC/9rwMdpVynKGE30FX7G3V
	 Z01DD/QGB3W1A==
Date: Wed, 13 Mar 2024 05:08:10 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [PATCH 14/14] ALSA: scarlett2: Add Bluetooth volume control for
 Vocaster Two
Message-ID: <b78687f7243142a4466f63c0aee9742b44ee395d.1710264833.git.g@b4.vu>
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

The Vocaster Two has a Bluetooth module with a volume control. Add a
corresponding ALSA mixer control.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 156 ++++++++++++++++++++++++++++++++++++
 1 file changed, 156 insertions(+)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 6040c4df356f..a2de31a0371b 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -88,6 +88,7 @@
  *  - input mute, gain, autogain, safe mode
  *  - direct monitor mixes
  *  - compressor and EQ
+ *  - Bluetooth volume
  *
  * <ditaa>
  *    /--------------\    18chn            20chn     /--------------\
@@ -180,6 +181,9 @@
  */
 #define SCARLETT2_MAX_GAIN_VALUE 70
 
+/* maximum Bluetooth volume value */
+#define SCARLETT2_MAX_BLUETOOTH_VOLUME 30
+
 /* mixer range from -80dB to +6dB in 0.5dB steps */
 #define SCARLETT2_MIXER_MIN_DB -80
 #define SCARLETT2_MIXER_BIAS (-SCARLETT2_MIXER_MIN_DB * 2)
@@ -421,6 +425,7 @@ static void scarlett2_notify_direct_monitor(struct usb_mixer_interface *mixer);
 static void scarlett2_notify_power_status(struct usb_mixer_interface *mixer);
 static void scarlett2_notify_pcm_input_switch(
 					struct usb_mixer_interface *mixer);
+static void scarlett2_notify_bluetooth(struct usb_mixer_interface *mixer);
 
 /* Arrays of notification callback functions */
 
@@ -449,6 +454,7 @@ static const struct scarlett2_notification vocaster_notifications[] = {
 	{ 0x04000000, scarlett2_notify_input_dsp },
 	{ 0x08000000, scarlett2_notify_input_gain },
 	{ 0x10000000, scarlett2_notify_input_phantom },
+	{ 0x20000000, scarlett2_notify_bluetooth },
 	{ 0, NULL }
 };
 
@@ -534,6 +540,7 @@ enum {
 	SCARLETT2_CONFIG_POWER_LOW,
 	SCARLETT2_CONFIG_PCM_INPUT_SWITCH,
 	SCARLETT2_CONFIG_DIRECT_MONITOR_GAIN,
+	SCARLETT2_CONFIG_BLUETOOTH_VOLUME,
 	SCARLETT2_CONFIG_COUNT
 };
 
@@ -795,6 +802,9 @@ static const struct scarlett2_config_set scarlett2_config_set_vocaster = {
 
 		[SCARLETT2_CONFIG_INPUT_MUTE_SWITCH] = {
 			.offset = 0x1be, .size = 8, .activate = 17, .pbuf = 1 },
+
+		[SCARLETT2_CONFIG_BLUETOOTH_VOLUME] = {
+			.offset = 0xbf, .size = 8, .activate = 28 },
 	}
 };
 
@@ -1134,6 +1144,9 @@ struct scarlett2_device_info {
 	/* the number of DSP channels */
 	u8 dsp_count;
 
+	/* has a Bluetooth module with volume control */
+	u8 has_bluetooth;
+
 	/* remap analogue outputs; 18i8 Gen 3 has "line 3/4" connected
 	 * internally to the analogue 7/8 outputs
 	 */
@@ -1206,6 +1219,7 @@ struct scarlett2_data {
 	u8 mix_updated;
 	u8 speaker_switching_switched;
 	u8 power_status_updated;
+	u8 bluetooth_updated;
 	u8 sync;
 	u8 master_vol;
 	u8 headphone_vol;
@@ -1240,6 +1254,7 @@ struct scarlett2_data {
 	u8 msd_switch;
 	u8 standalone_switch;
 	u8 power_status;
+	u8 bluetooth_volume;
 	u8 meter_level_map[SCARLETT2_MAX_METERS];
 	struct snd_kcontrol *sync_ctl;
 	struct snd_kcontrol *master_vol_ctl;
@@ -1273,6 +1288,7 @@ struct scarlett2_data {
 	struct snd_kcontrol *speaker_switching_ctl;
 	struct snd_kcontrol *talkback_ctl;
 	struct snd_kcontrol *power_status_ctl;
+	struct snd_kcontrol *bluetooth_volume_ctl;
 	u8 mux[SCARLETT2_MUX_MAX];
 	u8 mix[SCARLETT2_MIX_MAX];
 	u8 monitor_mix[SCARLETT2_MONITOR_MIX_MAX];
@@ -1770,6 +1786,7 @@ static const struct scarlett2_device_info vocaster_two_info = {
 	.peq_flt_total_count = 4,
 	.mute_input_count = 2,
 	.gain_input_count = 2,
+	.has_bluetooth = 1,
 
 	.port_count = {
 		[SCARLETT2_PORT_TYPE_NONE]     = {  1,  0 },
@@ -7753,6 +7770,121 @@ static int scarlett2_add_power_status_ctl(struct usb_mixer_interface *mixer)
 				     &private->power_status_ctl);
 }
 
+/*** Bluetooth Volume ***/
+
+static int scarlett2_update_bluetooth_volume(struct usb_mixer_interface *mixer)
+{
+	struct scarlett2_data *private = mixer->private_data;
+	int err;
+
+	private->bluetooth_updated = 0;
+
+	if (!private->info->has_bluetooth)
+		return 0;
+
+	err = scarlett2_usb_get_config(mixer,
+				       SCARLETT2_CONFIG_BLUETOOTH_VOLUME,
+				       1, &private->bluetooth_volume);
+	if (err < 0)
+		return err;
+
+	return 0;
+}
+
+static int scarlett2_bluetooth_volume_ctl_get(struct snd_kcontrol *kctl,
+					     struct snd_ctl_elem_value *ucontrol)
+{
+	struct usb_mixer_elem_info *elem = kctl->private_data;
+	struct usb_mixer_interface *mixer = elem->head.mixer;
+	struct scarlett2_data *private = mixer->private_data;
+	int err = 0;
+
+	mutex_lock(&private->data_mutex);
+
+	if (private->hwdep_in_use) {
+		err = -EBUSY;
+		goto unlock;
+	}
+
+	if (private->bluetooth_updated) {
+		err = scarlett2_update_bluetooth_volume(mixer);
+		if (err < 0)
+			goto unlock;
+	}
+	ucontrol->value.integer.value[0] = private->bluetooth_volume;
+
+unlock:
+	mutex_unlock(&private->data_mutex);
+	return err;
+}
+
+static int scarlett2_bluetooth_volume_ctl_put(struct snd_kcontrol *kctl,
+					     struct snd_ctl_elem_value *ucontrol)
+{
+	struct usb_mixer_elem_info *elem = kctl->private_data;
+	struct usb_mixer_interface *mixer = elem->head.mixer;
+	struct scarlett2_data *private = mixer->private_data;
+	int oval, val, err = 0;
+
+	mutex_lock(&private->data_mutex);
+
+	if (private->hwdep_in_use) {
+		err = -EBUSY;
+		goto unlock;
+	}
+
+	oval = private->bluetooth_volume;
+	val = clamp(ucontrol->value.integer.value[0],
+		    0L, (long)SCARLETT2_MAX_BLUETOOTH_VOLUME);
+
+	if (oval == val)
+		goto unlock;
+
+	private->bluetooth_volume = val;
+	err = scarlett2_usb_set_config(mixer,
+				       SCARLETT2_CONFIG_BLUETOOTH_VOLUME,
+				       0, val);
+	if (err == 0)
+		err = 1;
+
+unlock:
+	mutex_unlock(&private->data_mutex);
+	return err;
+}
+
+static int scarlett2_bluetooth_volume_ctl_info(
+	struct snd_kcontrol *kctl, struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 1;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = SCARLETT2_MAX_BLUETOOTH_VOLUME;
+	uinfo->value.integer.step = 1;
+	return 0;
+}
+
+static const struct snd_kcontrol_new scarlett2_bluetooth_volume_ctl = {
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+	.name = "",
+	.info = scarlett2_bluetooth_volume_ctl_info,
+	.get  = scarlett2_bluetooth_volume_ctl_get,
+	.put  = scarlett2_bluetooth_volume_ctl_put,
+};
+
+static int scarlett2_add_bluetooth_volume_ctl(
+	struct usb_mixer_interface *mixer)
+{
+	struct scarlett2_data *private = mixer->private_data;
+
+	if (!private->info->has_bluetooth)
+		return 0;
+
+	/* Add Bluetooth volume control */
+	return scarlett2_add_new_ctl(mixer, &scarlett2_bluetooth_volume_ctl,
+				     0, 1, "Bluetooth Capture Volume",
+				     &private->bluetooth_volume_ctl);
+}
+
 /*** Notification Handlers ***/
 
 /* Notify on sync change */
@@ -8109,6 +8241,21 @@ static void scarlett2_notify_pcm_input_switch(struct usb_mixer_interface *mixer)
 	scarlett2_notify_mux(mixer);
 }
 
+/* Notify on Bluetooth change */
+static void scarlett2_notify_bluetooth(struct usb_mixer_interface *mixer)
+{
+	struct snd_card *card = mixer->chip->card;
+	struct scarlett2_data *private = mixer->private_data;
+
+	if (!private->info->has_bluetooth)
+		return;
+
+	private->bluetooth_updated = 1;
+
+	snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE,
+		       &private->bluetooth_volume_ctl->id);
+}
+
 /* Handle acknowledgement that a command was received; let
  * scarlett2_usb() know that it can proceed
  */
@@ -8646,6 +8793,10 @@ static int scarlett2_read_configs(struct usb_mixer_interface *mixer)
 			return err;
 	}
 
+	err = scarlett2_update_bluetooth_volume(mixer);
+	if (err < 0)
+		return err;
+
 	err = scarlett2_update_mix(mixer);
 	if (err < 0)
 		return err;
@@ -8773,6 +8924,11 @@ static int snd_scarlett2_controls_create(
 	if (err < 0)
 		return err;
 
+	/* Create the Bluetooth volume control */
+	err = scarlett2_add_bluetooth_volume_ctl(mixer);
+	if (err < 0)
+		return err;
+
 	/* Set the access mode of controls disabled during
 	 * autogain/phantom power switching.
 	 */
-- 
2.43.0

