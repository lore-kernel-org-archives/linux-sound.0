Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697BF50243
	for <linux-sound@vger.kernel.org>; Tue, 26 Dec 2023 18:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="Q5FlQIZ8"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 975E1604B6C8; Wed, 27 Dec 2023 04:36:21 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 975E1604B6C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703613981; bh=lN5FvSLhixdXj8WejUQ2Nd9w02A6tBSzlHk0cBitcqE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q5FlQIZ8tFNkfz0bdHjSeaVONzvWA5tItf+/SjEGbUrl/bcfQWGcFIS0xTcoKmuez
	 jrrvMk+ot0yL11jpRFf8sLeIHWSAoHgnGK3F0M5Lp8tP+p21CQqHcRP6fjJAC29DmH
	 J9VNvU0oLxvuq8d6fa4qkKg15DePVbabvWOnfrDefVPdyND2c7ChG3pGW5PuTYK+ma
	 8wz9Pg0EGINEkRpEWFXznZ96/EI3JCUpWp68LMb5KHytJ1FNfj0pBp0R/zF/eHHGKf
	 cAhhZVu/oYUFE658cfEnGa9bev9pa+tOkViomvO3GCJ9yQGleJwOvzIxTnp7mLM+iQ
	 FXjVOWFhZC9sQ==
Date: Wed, 27 Dec 2023 04:36:21 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 03/20] ALSA: scarlett2: Add support for air/phantom control
 on input 2
Message-ID: <19511f18895b8c094985a4a5691fbc1dc028c108.1703612638.git.g@b4.vu>
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

The Focusrite Scarlett Gen 4 Solo has Air and Phantom Power controls
on analogue input #2 (the Gen 3 Solo had these controls on analogue
input #1). Add air_input_first and phantom_first device info options
to cater for this.

These options are similar to the level_input_first option that was
added for the Gen 3 Solo, but these new options do not require
adjusting the index of the control.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 10260666811f..5c5198bb224a 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -632,9 +632,15 @@ struct scarlett2_device_info {
 	 */
 	u8 air_input_count;
 
+	/* the first input with an air control (0-based) */
+	u8 air_input_first;
+
 	/* the number of phantom (48V) software switchable controls */
 	u8 phantom_count;
 
+	/* the first input with phantom power control (0-based) */
+	u8 phantom_first;
+
 	/* the number of inputs each phantom switch controls */
 	u8 inputs_per_phantom;
 
@@ -3043,6 +3049,7 @@ static int scarlett2_phantom_ctl_put(struct snd_kcontrol *kctl,
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
+	const struct scarlett2_device_info *info = private->info;
 
 	int index = elem->control;
 	int oval, val, err = 0;
@@ -3064,7 +3071,7 @@ static int scarlett2_phantom_ctl_put(struct snd_kcontrol *kctl,
 
 	/* Send switch change to the device */
 	err = scarlett2_usb_set_config(mixer, SCARLETT2_CONFIG_PHANTOM_SWITCH,
-				       index, val);
+				       index + info->phantom_first, val);
 	if (err == 0)
 		err = 1;
 
@@ -3763,7 +3770,8 @@ static int scarlett2_add_line_in_ctls(struct usb_mixer_interface *mixer)
 
 	/* Add input air controls */
 	for (i = 0; i < info->air_input_count; i++) {
-		snprintf(s, sizeof(s), fmt, i + 1, "Air", "Switch");
+		snprintf(s, sizeof(s), fmt, i + 1 + info->air_input_first,
+			 "Air", "Switch");
 		err = scarlett2_add_new_ctl(mixer, &scarlett2_air_ctl,
 					    i, 1, s, &private->air_ctls[i]);
 		if (err < 0)
@@ -3773,7 +3781,8 @@ static int scarlett2_add_line_in_ctls(struct usb_mixer_interface *mixer)
 	/* Add input phantom controls */
 	if (info->inputs_per_phantom == 1) {
 		for (i = 0; i < info->phantom_count; i++) {
-			scnprintf(s, sizeof(s), fmt, i + 1,
+			scnprintf(s, sizeof(s), fmt,
+				  i + 1 + info->phantom_first,
 				  "Phantom Power", "Switch");
 			err = scarlett2_add_new_ctl(
 				mixer, &scarlett2_phantom_ctl,
-- 
2.43.0

