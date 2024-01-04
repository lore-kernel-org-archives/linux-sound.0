Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E688249FC
	for <linux-sound@vger.kernel.org>; Thu,  4 Jan 2024 15:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bernhard-seibold.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bernhard-seibold.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bernhard-seibold.de header.i=@bernhard-seibold.de header.b="jhMNpVgD"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4T5WV62zddz9sRf;
	Thu,  4 Jan 2024 16:58:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bernhard-seibold.de;
	s=MBO0001; t=1704383934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RpNJaw/4pI0sdvw8mrEzDv3Qt/Yy1rPAuqYAegFRORU=;
	b=jhMNpVgDntQ0JAl1DfF7IDmkRSmKJ3SWNKyzNEraOfXDdDTUbD5Gz316ZC0yKVFlQ0NmUd
	WU93WiTm255I4lKLNFUUi4Wie4c7SkWbFUYM6Jgf9C/J3wy/mFiHAwgTni4adpf6Ji2urd
	pVSKCf+4BOswW3jc+vi5+4DfP0HKnNJO5ScLJ0lMS7k99w64GZbLj0KO+VSI6h3ewXoNfW
	VWuzbvHRsmy3pc/cw0fvHQumUeV+9Eb12yVqsTNvuu/kkIhBnJLiCKYP/CsINj/UyHCreQ
	ynRLyNAE27cGo6KqIh066p1Q+akOaIzKqc9X8X5TJ2+uzJexXmLH6p1dz2fqUQ==
From: Bernhard Seibold <mail@bernhard-seibold.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Mark Brown <broonie@kernel.org>,
	Bernhard Seibold <mail@bernhard-seibold.de>
Subject: [PATCH] ALSA: hda: generic: Always add LED controls
Date: Thu,  4 Jan 2024 16:58:38 +0100
Message-ID: <20240104155838.7514-1-mail@bernhard-seibold.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LEDs for mute and microphone mute can be added to any system via the
audio-mute and audio-micmute triggers, e.g. via USB HID devices.
Therefore, add the LED controls unconditionally.

Signed-off-by: Bernhard Seibold <mail@bernhard-seibold.de>
---
 sound/pci/hda/hda_generic.c | 46 ++++++++++++++++++-------------------
 sound/pci/hda/hda_generic.h |  2 --
 2 files changed, 22 insertions(+), 26 deletions(-)

diff --git a/sound/pci/hda/hda_generic.c b/sound/pci/hda/hda_generic.c
index bf685d01259d..e78c0dd17c42 100644
--- a/sound/pci/hda/hda_generic.c
+++ b/sound/pci/hda/hda_generic.c
@@ -3644,8 +3644,7 @@ static int add_single_cap_ctl(struct hda_codec *codec, const char *label,
 		return -ENOMEM;
 	if (is_switch) {
 		knew->put = cap_single_sw_put;
-		if (spec->mic_mute_led)
-			knew->access |= SNDRV_CTL_ELEM_ACCESS_MIC_LED;
+		knew->access |= SNDRV_CTL_ELEM_ACCESS_MIC_LED;
 	}
 	if (!inv_dmic)
 		return 0;
@@ -3663,8 +3662,7 @@ static int add_single_cap_ctl(struct hda_codec *codec, const char *label,
 		return -ENOMEM;
 	if (is_switch) {
 		knew->put = cap_single_sw_put;
-		if (spec->mic_mute_led)
-			knew->access |= SNDRV_CTL_ELEM_ACCESS_MIC_LED;
+		knew->access |= SNDRV_CTL_ELEM_ACCESS_MIC_LED;
 	}
 	return 0;
 }
@@ -3706,8 +3704,7 @@ static int create_bind_cap_vol_ctl(struct hda_codec *codec, int idx,
 		knew->index = idx;
 		knew->private_value = sw_ctl;
 		knew->subdevice = HDA_SUBDEV_AMP_FLAG;
-		if (spec->mic_mute_led)
-			knew->access |= SNDRV_CTL_ELEM_ACCESS_MIC_LED;
+		knew->access |= SNDRV_CTL_ELEM_ACCESS_MIC_LED;
 	}
 	return 0;
 }
@@ -3979,7 +3976,6 @@ int snd_hda_gen_add_mute_led_cdev(struct hda_codec *codec,
 	if (spec->vmaster_mute.hook)
 		codec_err(codec, "vmaster hook already present before cdev!\n");
 
-	spec->vmaster_mute_led = 1;
 	return 0;
 }
 EXPORT_SYMBOL_GPL(snd_hda_gen_add_mute_led_cdev);
@@ -4002,7 +3998,6 @@ int snd_hda_gen_add_micmute_led_cdev(struct hda_codec *codec,
 				     int (*callback)(struct led_classdev *,
 						     enum led_brightness))
 {
-	struct hda_gen_spec *spec = codec->spec;
 	int err;
 
 	if (callback) {
@@ -4013,7 +4008,6 @@ int snd_hda_gen_add_micmute_led_cdev(struct hda_codec *codec,
 		}
 	}
 
-	spec->mic_mute_led = 1;
 	return 0;
 }
 EXPORT_SYMBOL_GPL(snd_hda_gen_add_micmute_led_cdev);
@@ -4973,8 +4967,7 @@ int snd_hda_gen_parse_auto_config(struct hda_codec *codec,
 
 	parse_user_hints(codec);
 
-	if (spec->vmaster_mute_led || spec->mic_mute_led)
-		snd_ctl_led_request();
+	snd_ctl_led_request();
 
 	if (spec->mixer_nid && !spec->mixer_merge_nid)
 		spec->mixer_merge_nid = spec->mixer_nid;
@@ -5173,6 +5166,7 @@ static const char * const follower_pfxs[] = {
 int snd_hda_gen_build_controls(struct hda_codec *codec)
 {
 	struct hda_gen_spec *spec = codec->spec;
+	struct snd_kcontrol *kctl;
 	int err;
 
 	if (spec->kctls.used) {
@@ -5211,19 +5205,23 @@ int snd_hda_gen_build_controls(struct hda_codec *codec)
 		if (err < 0)
 			return err;
 	}
-	if (!spec->no_analog && !spec->suppress_vmaster &&
-	    !snd_hda_find_mixer_ctl(codec, "Master Playback Switch")) {
-		err = __snd_hda_add_vmaster(codec, "Master Playback Switch",
-					    NULL, follower_pfxs,
-					    "Playback Switch", true,
-					    spec->vmaster_mute_led ?
-						SNDRV_CTL_ELEM_ACCESS_SPK_LED : 0,
-					    &spec->vmaster_mute.sw_kctl);
-		if (err < 0)
-			return err;
-		if (spec->vmaster_mute.hook) {
-			snd_hda_add_vmaster_hook(codec, &spec->vmaster_mute);
-			snd_hda_sync_vmaster_hook(&spec->vmaster_mute);
+	if (!spec->no_analog && !spec->suppress_vmaster) {
+
+		kctl = snd_hda_find_mixer_ctl(codec, "Master Playback Switch");
+		if (!kctl) {
+			err = __snd_hda_add_vmaster(codec, "Master Playback Switch",
+						    NULL, follower_pfxs,
+						    "Playback Switch", true,
+						    SNDRV_CTL_ELEM_ACCESS_SPK_LED,
+						    &spec->vmaster_mute.sw_kctl);
+			if (err < 0)
+				return err;
+			if (spec->vmaster_mute.hook) {
+				snd_hda_add_vmaster_hook(codec, &spec->vmaster_mute);
+				snd_hda_sync_vmaster_hook(&spec->vmaster_mute);
+			}
+		} else {
+			kctl->vd[0].access |= SNDRV_CTL_ELEM_ACCESS_SPK_LED;
 		}
 	}
 
diff --git a/sound/pci/hda/hda_generic.h b/sound/pci/hda/hda_generic.h
index a8eea8367629..13db36528041 100644
--- a/sound/pci/hda/hda_generic.h
+++ b/sound/pci/hda/hda_generic.h
@@ -223,8 +223,6 @@ struct hda_gen_spec {
 	unsigned int inv_dmic_split:1; /* inverted dmic w/a for conexant */
 	unsigned int own_eapd_ctl:1; /* set EAPD by own function */
 	unsigned int keep_eapd_on:1; /* don't turn off EAPD automatically */
-	unsigned int vmaster_mute_led:1; /* add SPK-LED flag to vmaster mute switch */
-	unsigned int mic_mute_led:1; /* add MIC-LED flag to capture mute switch */
 	unsigned int indep_hp:1; /* independent HP supported */
 	unsigned int prefer_hp_amp:1; /* enable HP amp for speaker if any */
 	unsigned int add_stereo_mix_input:2; /* add aamix as a capture src */
-- 
2.43.0

