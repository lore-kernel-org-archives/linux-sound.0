Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6692051009
	for <linux-sound@vger.kernel.org>; Tue, 26 Dec 2023 18:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="edngYPMo"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 9AC1C604B10A; Wed, 27 Dec 2023 04:38:52 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 9AC1C604B10A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703614132; bh=c154WcOmzp/baeTyNKMo6GI+66AqUQCJXonGXdL1MMk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=edngYPMogD7pjF7a4uBqxe9u19QNjZ2Rhu+Pst/zVgmAW0nh5Xt5X0mbxMwbOrtzH
	 Gr5vOMsOfo3//+2APMdXq+yHF30I4njyys+wHlFqXx9RtR8TVmz7A9et/aYV+raRxw
	 kMMyFKs/F2cJF8pmw/kjIFFEn9hduboL5BbA4Zbwz9SxRjR1YLZ0y305aUSUD4M7vX
	 l5qrneoVlgDH/Y8HLp+9Tdcho0diuPc+xEA9ovMc9ElHqoqSKWUXIsomC2JSG6w6vD
	 qOvHUbG6E5i7JmeThYEtqDWFBgMX8r6t8qsFVtVPNx6o0tOdkOYggoLGdZh18EZ2pW
	 KY1s/6RNJp/Iw==
Date: Wed, 27 Dec 2023 04:38:52 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 18/20] ALSA: scarlett2: Add R/O headphone volume control
Message-ID: <bd4a76da157f8cc3fbfa02eba96d02bdb86817c5.1703612638.git.g@b4.vu>
References: <cover.1703612638.git.g@b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1703612638.git.g@b4.vu>

The Scarlett 4i4 Gen 4 adds a R/O headphone volume control in addition
to a R/O master volume control (which is already supported).

Mark the new scarlett2_notify_volume() function with __always_unused
until it gets used when the Gen 4 notification callback function arrays
are added.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 82 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 81 insertions(+), 1 deletion(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index c21ea9fc38ab..fea22ae9b0ba 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -332,6 +332,7 @@ enum {
 	SCARLETT2_CONFIG_MUTE_SWITCH,
 	SCARLETT2_CONFIG_SW_HW_SWITCH,
 	SCARLETT2_CONFIG_MASTER_VOLUME,
+	SCARLETT2_CONFIG_HEADPHONE_VOLUME,
 	SCARLETT2_CONFIG_LEVEL_SWITCH,
 	SCARLETT2_CONFIG_PAD_SWITCH,
 	SCARLETT2_CONFIG_MSD_SWITCH,
@@ -784,6 +785,7 @@ struct scarlett2_data {
 	u8 power_status_updated;
 	u8 sync;
 	u8 master_vol;
+	u8 headphone_vol;
 	u8 vol[SCARLETT2_ANALOGUE_MAX];
 	u8 vol_sw_hw_switch[SCARLETT2_ANALOGUE_MAX];
 	u8 mute_switch[SCARLETT2_ANALOGUE_MAX];
@@ -809,6 +811,7 @@ struct scarlett2_data {
 	u8 meter_level_map[SCARLETT2_MAX_METERS];
 	struct snd_kcontrol *sync_ctl;
 	struct snd_kcontrol *master_vol_ctl;
+	struct snd_kcontrol *headphone_vol_ctl;
 	struct snd_kcontrol *vol_ctls[SCARLETT2_ANALOGUE_MAX];
 	struct snd_kcontrol *sw_hw_ctls[SCARLETT2_ANALOGUE_MAX];
 	struct snd_kcontrol *mute_ctls[SCARLETT2_ANALOGUE_MAX];
@@ -3324,6 +3327,18 @@ static int scarlett2_update_volumes(struct usb_mixer_interface *mixer)
 					private->vol[i] = private->master_vol;
 	}
 
+	if (scarlett2_has_config_item(private,
+				      SCARLETT2_CONFIG_HEADPHONE_VOLUME)) {
+		err = scarlett2_usb_get_config(
+			mixer, SCARLETT2_CONFIG_HEADPHONE_VOLUME,
+			1, &vol);
+		if (err < 0)
+			return err;
+
+		private->headphone_vol = clamp(vol + SCARLETT2_VOLUME_BIAS,
+					       0, SCARLETT2_VOLUME_BIAS);
+	}
+
 	return 0;
 }
 
@@ -3367,6 +3382,34 @@ static int scarlett2_master_volume_ctl_get(struct snd_kcontrol *kctl,
 	return err;
 }
 
+static int scarlett2_headphone_volume_ctl_get(
+	struct snd_kcontrol *kctl,
+	struct snd_ctl_elem_value *ucontrol)
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
+	if (private->vol_updated) {
+		err = scarlett2_update_volumes(mixer);
+		if (err < 0)
+			goto unlock;
+	}
+	ucontrol->value.integer.value[0] = private->headphone_vol;
+
+unlock:
+	mutex_unlock(&private->data_mutex);
+	return err;
+}
+
 static int line_out_remap(struct scarlett2_data *private, int index)
 {
 	const struct scarlett2_device_info *info = private->info;
@@ -3456,6 +3499,17 @@ static const struct snd_kcontrol_new scarlett2_master_volume_ctl = {
 	.tlv = { .p = db_scale_scarlett2_volume }
 };
 
+static const struct snd_kcontrol_new scarlett2_headphone_volume_ctl = {
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+	.access = SNDRV_CTL_ELEM_ACCESS_READ |
+		  SNDRV_CTL_ELEM_ACCESS_TLV_READ,
+	.name = "",
+	.info = scarlett2_volume_ctl_info,
+	.get  = scarlett2_headphone_volume_ctl_get,
+	.private_value = 0, /* max value */
+	.tlv = { .p = db_scale_scarlett2_volume }
+};
+
 static const struct snd_kcontrol_new scarlett2_line_out_volume_ctl = {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE |
@@ -4806,6 +4860,18 @@ static int scarlett2_add_line_out_ctls(struct usb_mixer_interface *mixer)
 			return err;
 	}
 
+	/* Add R/O headphone volume control */
+	if (scarlett2_has_config_item(private,
+				      SCARLETT2_CONFIG_HEADPHONE_VOLUME)) {
+		snprintf(s, sizeof(s), "Headphone Playback Volume");
+		err = scarlett2_add_new_ctl(mixer,
+					    &scarlett2_headphone_volume_ctl,
+					    0, 1, s,
+					    &private->headphone_vol_ctl);
+		if (err < 0)
+			return err;
+	}
+
 	/* Remaining controls are only applicable if the device
 	 * has per-channel line-out volume controls.
 	 */
@@ -6265,7 +6331,7 @@ static void scarlett2_notify_sync(struct usb_mixer_interface *mixer)
 		       &private->sync_ctl->id);
 }
 
-/* Notify on monitor change */
+/* Notify on monitor change (Gen 2/3) */
 static void scarlett2_notify_monitor(struct usb_mixer_interface *mixer)
 {
 	struct snd_card *card = mixer->chip->card;
@@ -6286,6 +6352,20 @@ static void scarlett2_notify_monitor(struct usb_mixer_interface *mixer)
 				       &private->vol_ctls[i]->id);
 }
 
+/* Notify on volume change (Gen 4) */
+static __always_unused void scarlett2_notify_volume(
+	struct usb_mixer_interface *mixer)
+{
+	struct scarlett2_data *private = mixer->private_data;
+
+	private->vol_updated = 1;
+
+	snd_ctl_notify(mixer->chip->card, SNDRV_CTL_EVENT_MASK_VALUE,
+		       &private->master_vol_ctl->id);
+	snd_ctl_notify(mixer->chip->card, SNDRV_CTL_EVENT_MASK_VALUE,
+		       &private->headphone_vol_ctl->id);
+}
+
 /* Notify on dim/mute change */
 static void scarlett2_notify_dim_mute(struct usb_mixer_interface *mixer)
 {
-- 
2.43.0

