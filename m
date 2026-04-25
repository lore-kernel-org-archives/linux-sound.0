Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E1326A0B9
	for <linux-sound@vger.kernel.org>; Sat, 25 Apr 2026 21:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777151823; cv=none; b=RoOH2l2chckMKhJhhwpmRoHCVNKPvLMM7MZiMvVvFcPsrD2iV2lqOaRzdk13aT/S2t2afl4Fa6NiWKfiVoaKhLkrg+zDXpN2WL3RHB4cHXEZEaeGSMbTSjA55hL6vdd3yQsHqZyJAvEzorUl44GF8e+O6rBytpgGazSa5bMYZwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777151823; c=relaxed/simple;
	bh=dHqJ9puByX4lb63oT6N9pw4Pgt2+d+Lp4uzQpHP59WM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uMk/QncTEXm62sxbK8oSdwbVdEfTqumQsEPJdlt/DWtNhdFCO6NRICZH8I+y504o20bA14nOuKkKHUjQ1KRHgjEEoH+1oKH4S/JDaf2qnnCMvgMp4DbFbOUU/aMpTZ67hgH7f5SNExrkb9ugyhPgxmcUW+wYBzafQFIMBBsEvUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=p7mv/wKp; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="p7mv/wKp"
Received: by m.b4.vu (Postfix, from userid 1000)
	id C483967BB596; Sun, 26 Apr 2026 06:46:59 +0930 (ACST)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu C483967BB596
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1777151819; bh=AtEtYUJWRQWqlM/NMO3/FvNPl/w5FxQoYc0mIm3MZtc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p7mv/wKpAH8VvgML/Qw5Y+er9sIXwgmQd5oW9yGoK74/aYRoyOMcC3ktUM/U7jPHP
	 XhzEPgRH/2pbEaYkeDntJn90osdRFXBoa5QBIPqJDqVZ91p7pDpOiVhaQCoYCDGHzw
	 Inr+8QJa7ctGXDBFUYgnSYsh9uncnaVxaU30/Gk0tV5wKu+N6gJZY78Mk5VHNCCY/c
	 qzVgKBC8gZ0XO3P6htEBtihuA3wxK7Qo1INCzRXk4mtdU1nKSQw0kL/O37kOrLwvQp
	 4Qi7+4mc8MF+BsOK2w1HHgxPLT7b5n99/xoMcyCwPz+rShqmj//UJ6E2XZ5akuivLy
	 XnuHYO78hHTeQ==
Date: Sun, 26 Apr 2026 06:46:59 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [PATCH 2/3] ALSA: scarlett2: Fold min_firmware_version into
 config_sets
Message-ID: <f2ca214b39c773c186adafc8726d6ff79f198459.1777151532.git.g@b4.vu>
References: <ae0tEsi8dKm1akJd@m.b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae0tEsi8dKm1akJd@m.b4.vu>

The device info's min_firmware_version field encoded the oldest
firmware the driver supports on each device. With the config_sets
array in place, the first entry's from_firmware_version carries the
same meaning (it's the oldest firmware range any config_set applies
to). Merge the two by dropping min_firmware_version from
scarlett2_device_info and reading config_sets[0].from_firmware_version
at the three call sites that used it.

No functional change.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 15abca6d34ef..68adec4f21d9 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -1117,9 +1117,6 @@ struct scarlett2_device_info {
 	/* which sets of configuration parameters the device uses */
 	const struct scarlett2_config_set_entry *config_sets;
 
-	/* minimum firmware version required */
-	u16 min_firmware_version;
-
 	/* has a downloadable device map */
 	u8 has_devmap;
 
@@ -1848,7 +1845,6 @@ static const struct scarlett2_device_info vocaster_one_info = {
 		{ 1769, &scarlett2_config_set_vocaster },
 		{ }
 	},
-	.min_firmware_version = 1769,
 	.has_devmap = 1,
 
 	.phantom_count = 1,
@@ -1895,7 +1891,6 @@ static const struct scarlett2_device_info vocaster_two_info = {
 		{ 1769, &scarlett2_config_set_vocaster },
 		{ }
 	},
-	.min_firmware_version = 1769,
 	.has_devmap = 1,
 
 	.phantom_count = 2,
@@ -1943,7 +1938,6 @@ static const struct scarlett2_device_info solo_gen4_info = {
 		{ 2115, &scarlett2_config_set_gen4_solo },
 		{ }
 	},
-	.min_firmware_version = 2115,
 	.has_devmap = 1,
 
 	.level_input_count = 1,
@@ -2001,7 +1995,6 @@ static const struct scarlett2_device_info s2i2_gen4_info = {
 		{ 2115, &scarlett2_config_set_gen4_2i2 },
 		{ }
 	},
-	.min_firmware_version = 2115,
 	.has_devmap = 1,
 
 	.level_input_count = 2,
@@ -2059,7 +2052,6 @@ static const struct scarlett2_device_info s4i4_gen4_info = {
 		{ 2089, &scarlett2_config_set_gen4_4i4 },
 		{ }
 	},
-	.min_firmware_version = 2089,
 	.has_devmap = 1,
 
 	.level_input_count = 2,
@@ -3341,7 +3333,8 @@ static int scarlett2_min_firmware_version_ctl_get(
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct scarlett2_data *private = elem->head.mixer->private_data;
 
-	ucontrol->value.integer.value[0] = private->info->min_firmware_version;
+	ucontrol->value.integer.value[0] =
+		private->info->config_sets[0].from_firmware_version;
 
 	return 0;
 }
@@ -8566,6 +8559,7 @@ static int scarlett2_read_configs(struct usb_mixer_interface *mixer)
 {
 	struct scarlett2_data *private = mixer->private_data;
 	const struct scarlett2_device_info *info = private->info;
+	u16 min_firmware_version = info->config_sets[0].from_firmware_version;
 	int err, i;
 
 	if (scarlett2_has_config_item(private, SCARLETT2_CONFIG_MSD_SWITCH)) {
@@ -8576,13 +8570,13 @@ static int scarlett2_read_configs(struct usb_mixer_interface *mixer)
 			return err;
 	}
 
-	if (private->firmware_version < info->min_firmware_version) {
+	if (private->firmware_version < min_firmware_version) {
 		usb_audio_err(mixer->chip,
 			      "Focusrite %s firmware version %d is too old; "
 			      "need %d",
 			      private->series_name,
 			      private->firmware_version,
-			      info->min_firmware_version);
+			      min_firmware_version);
 		return 0;
 	}
 
@@ -8766,6 +8760,7 @@ static int snd_scarlett2_controls_create(
 	const struct scarlett2_device_entry *entry)
 {
 	struct scarlett2_data *private;
+	u16 min_firmware_version;
 	int err;
 
 	/* Initialise private data */
@@ -8774,6 +8769,8 @@ static int snd_scarlett2_controls_create(
 		return err;
 
 	private = mixer->private_data;
+	min_firmware_version =
+		private->info->config_sets[0].from_firmware_version;
 
 	/* Send proprietary USB initialisation sequence */
 	err = scarlett2_usb_init(mixer);
@@ -8816,7 +8813,7 @@ static int snd_scarlett2_controls_create(
 	 * old, don't create any other controls
 	 */
 	if (private->msd_switch ||
-	    private->firmware_version < private->info->min_firmware_version)
+	    private->firmware_version < min_firmware_version)
 		return 0;
 
 	/* Create the analogue output controls */
-- 
2.53.0

