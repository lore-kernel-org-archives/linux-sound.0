Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C62851009
	for <linux-sound@vger.kernel.org>; Tue, 26 Dec 2023 18:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="Ea7l5UvV"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 60AB4604B15B; Wed, 27 Dec 2023 04:38:46 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 60AB4604B15B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703614126; bh=2ns/TR+XHkn0m2vqqGKlwG1XloQdP9W7wfhuQrABEbo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ea7l5UvVVWZVlG5RRUnmO/7UFTKk8qYCCImUjh8PKXlgIT0vsXotVrRIXHyR4rHEL
	 QOeziDYdHhzdHL+whMolQCiuOaEoXb2hQNatfWPKtOq3yDOnuUxzGZnyFOyEACEG/l
	 sMv+jWpvmfOu2IvILlC2PvKDRzXLp644pSGmS7/n+eRNa042oHx2mOmG6cFZD3v5un
	 u5d+N1rgzA5RNr2dYqiG2VEB3jf/aLZfS0Ib/Qu9SUB7Wf7dcw1IV4L6bL/lxzPsXG
	 y+czB2egbkNt5B5JFINrrw1OTh6WJntxCU7g/Q5ulzNQ6Q/5Rsn4qCMlz4LDP16P+9
	 Y2JmHbvBhAuNQ==
Date: Wed, 27 Dec 2023 04:38:46 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 17/20] ALSA: scarlett2: Add minimum firmware version check
Message-ID: <5455a7e54bda81556066abd7f761b10e9c5f8a16.1703612638.git.g@b4.vu>
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

Early firmware for the Scarlett Gen 4 devices has sufficient
differences that it is better to enforce a minimum firmware version
than to try and work around those differences. Add a minimum firmware
version field to the device info struct, and display a message if the
firmware version is too old. Only create the Firmware Version and MSD
(optional) controls in this case.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 73 ++++++++++++++++++++++++++++++++++---
 1 file changed, 67 insertions(+), 6 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 5c44793fe345..c21ea9fc38ab 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -660,6 +660,9 @@ struct scarlett2_device_info {
 	/* which set of configuration parameters the device uses */
 	const struct scarlett2_config_set *config_set;
 
+	/* minimum firmware version required */
+	u16 min_firmware_version;
+
 	/* support for main/alt speaker switching */
 	u8 has_speaker_switching;
 
@@ -2352,6 +2355,45 @@ static int scarlett2_add_firmware_version_ctl(
 				     0, 0, "Firmware Version", NULL);
 }
 
+/*** Minimum Firmware Version Control ***/
+
+static int scarlett2_min_firmware_version_ctl_get(
+	struct snd_kcontrol *kctl,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct usb_mixer_elem_info *elem = kctl->private_data;
+	struct scarlett2_data *private = elem->head.mixer->private_data;
+
+	ucontrol->value.integer.value[0] = private->info->min_firmware_version;
+
+	return 0;
+}
+
+static int scarlett2_min_firmware_version_ctl_info(
+	struct snd_kcontrol *kctl,
+	struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 1;
+
+	return 0;
+}
+
+static const struct snd_kcontrol_new scarlett2_min_firmware_version_ctl = {
+	.iface = SNDRV_CTL_ELEM_IFACE_CARD,
+	.access = SNDRV_CTL_ELEM_ACCESS_READ,
+	.name = "",
+	.info = scarlett2_min_firmware_version_ctl_info,
+	.get  = scarlett2_min_firmware_version_ctl_get
+};
+
+static int scarlett2_add_min_firmware_version_ctl(
+	struct usb_mixer_interface *mixer)
+{
+	return scarlett2_add_new_ctl(mixer, &scarlett2_min_firmware_version_ctl,
+				     0, 0, "Minimum Firmware Version", NULL);
+}
+
 /*** Sync Control ***/
 
 /* Update sync control after receiving notification that the status
@@ -6061,6 +6103,7 @@ static int scarlett2_get_flash_segment_nums(struct usb_mixer_interface *mixer)
 static int scarlett2_read_configs(struct usb_mixer_interface *mixer)
 {
 	struct scarlett2_data *private = mixer->private_data;
+	const struct scarlett2_device_info *info = private->info;
 	int err, i;
 
 	if (scarlett2_has_config_item(private, SCARLETT2_CONFIG_MSD_SWITCH)) {
@@ -6069,12 +6112,22 @@ static int scarlett2_read_configs(struct usb_mixer_interface *mixer)
 			1, &private->msd_switch);
 		if (err < 0)
 			return err;
-
-		/* no other controls are created if MSD mode is on */
-		if (private->msd_switch)
-			return 0;
 	}
 
+	if (private->firmware_version < info->min_firmware_version) {
+		usb_audio_err(mixer->chip,
+			      "Focusrite %s firmware version %d is too old; "
+			      "need %d",
+			      private->series_name,
+			      private->firmware_version,
+			      info->min_firmware_version);
+		return 0;
+	}
+
+	/* no other controls are created if MSD mode is on */
+	if (private->msd_switch)
+		return 0;
+
 	err = scarlett2_update_input_level(mixer);
 	if (err < 0)
 		return err;
@@ -6595,6 +6648,11 @@ static int snd_scarlett2_controls_create(
 	if (err < 0)
 		return err;
 
+	/* Add minimum firmware version control */
+	err = scarlett2_add_min_firmware_version_ctl(mixer);
+	if (err < 0)
+		return err;
+
 	/* Read volume levels and controls from the interface */
 	err = scarlett2_read_configs(mixer);
 	if (err < 0)
@@ -6605,8 +6663,11 @@ static int snd_scarlett2_controls_create(
 	if (err < 0)
 		return err;
 
-	/* If MSD mode is enabled, don't create any other controls */
-	if (private->msd_switch)
+	/* If MSD mode is enabled, or if the firmware version is too
+	 * old, don't create any other controls
+	 */
+	if (private->msd_switch ||
+	    private->firmware_version < private->info->min_firmware_version)
 		return 0;
 
 	/* Create the analogue output controls */
-- 
2.43.0

