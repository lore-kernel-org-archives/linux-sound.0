Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D195024D
	for <linux-sound@vger.kernel.org>; Tue, 26 Dec 2023 18:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="F0XPc0LW"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 7B2B2604B5B2; Wed, 27 Dec 2023 04:36:54 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 7B2B2604B5B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703614014; bh=R2DkRGirTwjcIg9rwRCxACsDe9EmGVSkoUJ2iFhhNhY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F0XPc0LW7yi/dqHKaPBCfIp8vno4+wBllw/nhl6zjWY8yrcEgM6N0tL1U4FdRxCCz
	 bM4CGLfcXegDq/09S+umNatwZB0JrA6p63uW/S4/1X++wGVQlA5OypintJROw3+Ijn
	 y6I2+W7lqFARdr6zRS0Y9Wu3kd8g9lBIXH/TE86ucmRYNZWkdDKVm2TBq2jIwExnhb
	 53VAY/e5ATT4ymhMPj2ynHcJk0hOGLFVLkJ92ekBiLjxWb6tFLqbSs5ET1bzumN8Ql
	 afou5qgGiPHfsn1sa+jsIPEWYePjWl6F9Asa2eQuHs0dwqBn9qEFxDTKiX44V/FQRP
	 84Ww3tOWtbGIA==
Date: Wed, 27 Dec 2023 04:36:54 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 06/20] ALSA: scarlett2: Add support for Air Presence + Drive
 option
Message-ID: <a9ccda7222842a72e4ce7aa258614ff45248bb16.1703612638.git.g@b4.vu>
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

Extend the existing "air" option support from Scarlett Gen 3, which
had two states (off/on), to accommodate Scarlett Gen 4's new state:
Presence + Drive.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 46 +++++++++++++++++++++++++++++--------
 1 file changed, 36 insertions(+), 10 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 3098d9d38e3f..416973b8a6c4 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -647,6 +647,12 @@ struct scarlett2_device_info {
 	/* the first input with an air control (0-based) */
 	u8 air_input_first;
 
+	/* number of additional air options
+	 * 0 for air presence only (Gen 3)
+	 * 1 for air presence+drive (Gen 4)
+	 */
+	u8 air_option;
+
 	/* the number of phantom (48V) software switchable controls */
 	u8 phantom_count;
 
@@ -3022,7 +3028,7 @@ static int scarlett2_air_ctl_put(struct snd_kcontrol *kctl,
 	}
 
 	oval = private->air_switch[index];
-	val = !!ucontrol->value.integer.value[0];
+	val = ucontrol->value.integer.value[0];
 
 	if (oval == val)
 		goto unlock;
@@ -3040,12 +3046,31 @@ static int scarlett2_air_ctl_put(struct snd_kcontrol *kctl,
 	return err;
 }
 
-static const struct snd_kcontrol_new scarlett2_air_ctl = {
-	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
-	.name = "",
-	.info = snd_ctl_boolean_mono_info,
-	.get  = scarlett2_air_ctl_get,
-	.put  = scarlett2_air_ctl_put,
+static int scarlett2_air_with_drive_ctl_info(
+	struct snd_kcontrol *kctl, struct snd_ctl_elem_info *uinfo)
+{
+	static const char *const values[3] = {
+		"Off", "Presence", "Presence + Drive"
+	};
+
+	return snd_ctl_enum_info(uinfo, 1, 3, values);
+}
+
+static const struct snd_kcontrol_new scarlett2_air_ctl[2] = {
+	{
+		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+		.name = "",
+		.info = snd_ctl_boolean_mono_info,
+		.get  = scarlett2_air_ctl_get,
+		.put  = scarlett2_air_ctl_put,
+	},
+	{
+		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+		.name = "",
+		.info = scarlett2_air_with_drive_ctl_info,
+		.get  = scarlett2_air_ctl_get,
+		.put  = scarlett2_air_ctl_put,
+	}
 };
 
 /*** Phantom Switch Controls ***/
@@ -3839,9 +3864,10 @@ static int scarlett2_add_line_in_ctls(struct usb_mixer_interface *mixer)
 	/* Add input air controls */
 	for (i = 0; i < info->air_input_count; i++) {
 		snprintf(s, sizeof(s), fmt, i + 1 + info->air_input_first,
-			 "Air", "Switch");
-		err = scarlett2_add_new_ctl(mixer, &scarlett2_air_ctl,
-					    i, 1, s, &private->air_ctls[i]);
+			 "Air", info->air_option ? "Enum" : "Switch");
+		err = scarlett2_add_new_ctl(
+			mixer, &scarlett2_air_ctl[info->air_option],
+			i, 1, s, &private->air_ctls[i]);
 		if (err < 0)
 			return err;
 	}
-- 
2.43.0

