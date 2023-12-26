Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EB350252
	for <linux-sound@vger.kernel.org>; Tue, 26 Dec 2023 18:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="VRc/W37w"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 8F53E604B2CB; Wed, 27 Dec 2023 04:38:02 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 8F53E604B2CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703614082; bh=3X7/qAzdi4fbKUpXPbQG/zFS4/3eHBSTkcgx993TyrY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VRc/W37wm6L6SRQ8Qe1J/FLrxmqNmQPYdvEeLhiw/KdZBD/c6zJw2QSOy/qnG3bxW
	 3hpvv9K0s/pM6yPG4EeJ+cdx+Gh+Q1O1D2S4sCV0OrTo7+lggesELmZVaWAJJWnDTz
	 IqSQ73U1ROR9xWuCOvlKCTq7g56bRsUHJ9PKHjl7Eb2G0+WaVR/8127MEF1TkI7ivl
	 wGs0QBIU7Ml/G0hXuz8pUw3Qi2KEtgQ5qPprZah9+2sBZ9Bcwvfz6jGEOsBPACANzz
	 KGX3omazkrYsFl/lZ6aafGPcRJWDPwXv3qCD39Nlnn92TZL5l5OYUd24EQxpNho4pc
	 WhB01BPswnl4A==
Date: Wed, 27 Dec 2023 04:38:02 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 11/20] ALSA: scarlett2: Add power status control
Message-ID: <d9806bc41adc45b1c19749562fec7765ba24351d.1703612638.git.g@b4.vu>
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

Add a control to retrieve the power status from the interface
(bus-powered, external-powered, or insufficient power).

Mark the new scarlett2_notify_power_status() function with
__always_unused until it gets used when the Gen 4 notification
callback function arrays are added.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 123 ++++++++++++++++++++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 2d6fd9faed31..f5f57c86cec8 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -278,6 +278,14 @@ enum {
 	SCARLETT2_AUTOGAIN_STATUS_COUNT
 };
 
+/* Power Status Values */
+enum {
+	SCARLETT2_POWER_STATUS_EXT,
+	SCARLETT2_POWER_STATUS_BUS,
+	SCARLETT2_POWER_STATUS_FAIL,
+	SCARLETT2_POWER_STATUS_COUNT
+};
+
 /* Notification callback functions */
 struct scarlett2_notification {
 	u32 mask;
@@ -334,6 +342,8 @@ enum {
 	SCARLETT2_CONFIG_SAFE_SWITCH,
 	SCARLETT2_CONFIG_INPUT_SELECT_SWITCH,
 	SCARLETT2_CONFIG_INPUT_LINK_SWITCH,
+	SCARLETT2_CONFIG_POWER_EXT,
+	SCARLETT2_CONFIG_POWER_STATUS,
 	SCARLETT2_CONFIG_COUNT
 };
 
@@ -751,6 +761,7 @@ struct scarlett2_data {
 	u8 direct_monitor_updated;
 	u8 mux_updated;
 	u8 speaker_switching_switched;
+	u8 power_status_updated;
 	u8 sync;
 	u8 master_vol;
 	u8 vol[SCARLETT2_ANALOGUE_MAX];
@@ -774,6 +785,7 @@ struct scarlett2_data {
 	u8 talkback_map[SCARLETT2_OUTPUT_MIX_MAX];
 	u8 msd_switch;
 	u8 standalone_switch;
+	u8 power_status;
 	u8 meter_level_map[SCARLETT2_MAX_METERS];
 	struct snd_kcontrol *sync_ctl;
 	struct snd_kcontrol *master_vol_ctl;
@@ -795,6 +807,7 @@ struct scarlett2_data {
 	struct snd_kcontrol *direct_monitor_ctl;
 	struct snd_kcontrol *speaker_switching_ctl;
 	struct snd_kcontrol *talkback_ctl;
+	struct snd_kcontrol *power_status_ctl;
 	u8 mux[SCARLETT2_MUX_MAX];
 	u8 mix[SCARLETT2_MIX_MAX];
 };
@@ -5526,6 +5539,91 @@ static int scarlett2_add_standalone_ctl(struct usb_mixer_interface *mixer)
 				     0, 1, "Standalone Switch", NULL);
 }
 
+/*** Power Status ***/
+
+static int scarlett2_update_power_status(struct usb_mixer_interface *mixer)
+{
+	struct scarlett2_data *private = mixer->private_data;
+	int err;
+	u8 power_ext;
+	u8 power_status;
+
+	private->power_status_updated = 0;
+
+	err = scarlett2_usb_get_config(mixer, SCARLETT2_CONFIG_POWER_EXT,
+				       1, &power_ext);
+	if (err < 0)
+		return err;
+
+	err = scarlett2_usb_get_config(mixer, SCARLETT2_CONFIG_POWER_STATUS,
+				       1, &power_status);
+	if (err < 0)
+		return err;
+
+	if (power_status > 1)
+		private->power_status = SCARLETT2_POWER_STATUS_FAIL;
+	else if (power_ext)
+		private->power_status = SCARLETT2_POWER_STATUS_EXT;
+	else
+		private->power_status = SCARLETT2_POWER_STATUS_BUS;
+
+	return 0;
+}
+
+static int scarlett2_power_status_ctl_get(struct snd_kcontrol *kctl,
+					  struct snd_ctl_elem_value *ucontrol)
+{
+	struct usb_mixer_elem_info *elem = kctl->private_data;
+	struct usb_mixer_interface *mixer = elem->head.mixer;
+	struct scarlett2_data *private = mixer->private_data;
+	int err = 0;
+
+	mutex_lock(&private->data_mutex);
+
+	if (private->power_status_updated) {
+		err = scarlett2_update_power_status(mixer);
+		if (err < 0)
+			goto unlock;
+	}
+	ucontrol->value.integer.value[0] = private->power_status;
+
+unlock:
+	mutex_unlock(&private->data_mutex);
+	return err;
+}
+
+static int scarlett2_power_status_ctl_info(
+	struct snd_kcontrol *kctl, struct snd_ctl_elem_info *uinfo)
+{
+	static const char *const values[3] = {
+		"External", "Bus", "Fail"
+	};
+
+	return snd_ctl_enum_info(uinfo, 1, 3, values);
+}
+
+static const struct snd_kcontrol_new scarlett2_power_status_ctl = {
+	.iface = SNDRV_CTL_ELEM_IFACE_CARD,
+	.access = SNDRV_CTL_ELEM_ACCESS_READ,
+	.name = "",
+	.info = scarlett2_power_status_ctl_info,
+	.get  = scarlett2_power_status_ctl_get,
+};
+
+static int scarlett2_add_power_status_ctl(struct usb_mixer_interface *mixer)
+{
+	struct scarlett2_data *private = mixer->private_data;
+
+	if (!scarlett2_has_config_item(private,
+				       SCARLETT2_CONFIG_POWER_EXT))
+		return 0;
+
+	/* Add power status control */
+	return scarlett2_add_new_ctl(mixer, &scarlett2_power_status_ctl,
+				     0, 1, "Power Status Card Enum",
+				     &private->power_status_ctl);
+}
+
 /*** Cleanup/Suspend Callbacks ***/
 
 static void scarlett2_private_free(struct usb_mixer_interface *mixer)
@@ -5817,6 +5915,13 @@ static int scarlett2_read_configs(struct usb_mixer_interface *mixer)
 			return err;
 	}
 
+	if (scarlett2_has_config_item(private,
+				      SCARLETT2_CONFIG_POWER_EXT)) {
+		err = scarlett2_update_power_status(mixer);
+		if (err < 0)
+			return err;
+	}
+
 	err = scarlett2_update_sync(mixer);
 	if (err < 0)
 		return err;
@@ -6153,6 +6258,19 @@ static void scarlett2_notify_direct_monitor(struct usb_mixer_interface *mixer)
 		       &private->direct_monitor_ctl->id);
 }
 
+/* Notify on power change */
+static __always_unused void scarlett2_notify_power_status(
+	struct usb_mixer_interface *mixer)
+{
+	struct snd_card *card = mixer->chip->card;
+	struct scarlett2_data *private = mixer->private_data;
+
+	private->power_status_updated = 1;
+
+	snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE,
+		       &private->power_status_ctl->id);
+}
+
 /* Interrupt callback */
 static void scarlett2_notify(struct urb *urb)
 {
@@ -6330,6 +6448,11 @@ static int snd_scarlett2_controls_create(
 	if (err < 0)
 		return err;
 
+	/* Create the power status control */
+	err = scarlett2_add_power_status_ctl(mixer);
+	if (err < 0)
+		return err;
+
 	/* Set the access mode of controls disabled during
 	 * autogain/phantom power switching.
 	 */
-- 
2.43.0

