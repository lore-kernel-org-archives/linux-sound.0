Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727E61E1DFC
	for <linux-sound@vger.kernel.org>; Sat, 14 Mar 2026 19:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773516881; cv=none; b=tt45gUIPh1IHGDjrFui5msIGEDdZMghkj09vNg8MLUlK/vpQu1go3gCigLgujfPuUZ4qqgA3oBJTVj4zbq4Y7G2NA0wboRX2j6o7n5GedjtrpTHHgj07sh0Dqo/fXPA56sK372ivcWyA/D6hGoPc/RWhj5gpIKbhl+cGt8frwlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773516881; c=relaxed/simple;
	bh=Lth7EWEsIwF3SHUznewcoYh8/uieBTo0wCYgQOHwZOU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RUrksgAPT0FyXWRhL0RmtC43TCRtBL8PnTpGCHVsytWXNhvdts+dJ4DRjWTvlkBrDV6uOuW4l1fhpl1YPzFUzqT7Lc8zld/WOJ3osNw7twLJPl4Q7lIk3NBppjLlfTTfe9i+rb1VfDqv1KZjGJ1S2gUyAU97emycFHqYgdSnOxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20230601.gappssmtp.com header.i=@starlabs-systems.20230601.gappssmtp.com header.b=oOrYGXNH; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20230601.gappssmtp.com header.i=@starlabs-systems.20230601.gappssmtp.com header.b="oOrYGXNH"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48539d21b76so22786175e9.1
        for <linux-sound@vger.kernel.org>; Sat, 14 Mar 2026 12:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20230601.gappssmtp.com; s=20230601; t=1773516877; x=1774121677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qgRUv7skzvgM5JyNiSXlTpUT4tb6CMtOEKVYPn7SPuE=;
        b=oOrYGXNH4tHKJZzG9pGXRI8e5OGXu9dGvRRKYdVHZIqtB+1v9212xAXRNN1D2c8de/
         Yi/ZvS1QYlCVvk0V14/JFXF0qHC0vEaNaNUXA0WclLE9V2OI4kCEA+9eGvsx7elzMu2W
         B/poDsM5PUPSRI+rHnqH+i8A5pQLMmaKVuB+XA2JwnF9Lp60Xse+5KKVlDlVRELKwTmD
         8qTU8iNQVCC/OVsAhswTDKpHM9PQ7n0k7dUNnn9T1onkOYszEyiL8zOZLvymdjKOBmrp
         cR6grObWtyv0HUu9EermOx3RMqqEyC6HO3MqQXJpNbvnnSRP03DbwpLsONdecB1k0ehc
         N57g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773516877; x=1774121677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qgRUv7skzvgM5JyNiSXlTpUT4tb6CMtOEKVYPn7SPuE=;
        b=he63WbPI5qEAARVfuHR0njWkUdt1q4S+Nob/uLP09lq1kncA8ySZGIU5BsECJ2vQil
         Xfw6OJmh+ZdjFZDmA8S37ggphQUwFmUuWq3LTKFy7zROKpVgJDo7qncgK/oVRWlnm7fs
         3AbiGe2kMlB86oBDFBt2HKNshcUgqJeqDIu7GWNSaOmz5WRyb9M1ZvN4gvsTN7AWtVzl
         mQBSYSwco8tZVyXz73aPDQ+TlM2YWj5ComA1pKZJjOz2tScsM8ajJpcogrC+xpqu4p4i
         kNBWwa7FzjgNDltzJPKgPdNauf91iTowBnWvipb9QqA0DuYuUBcADjpx4+f1zwDGWxOV
         4AqA==
X-Forwarded-Encrypted: i=1; AJvYcCUSXf1ia8m7EjQoVvJSqUhLM11d7exWifV7QIdsiIxLSLVyI5He21dV5S6q3670XnSgD170c6bw26BJXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzePyXllkFUZxlzqW1KSQ+vbdKWpu3Cn6ZboMmcIMlTGD1kH+TN
	zLyrvbsMGtadG/XS9z3+ja4en56CDT3Z9sBzjhPVKpq7wy/CTvgDbAo78MC6m8unUA==
X-Gm-Gg: ATEYQzzcrDnPj77NVAovGOOcb+IG9TCQTVfgDICXuZ25eg4h66c7ZfHgoHl+GCkFhCV
	+tKcFwu87aDi8a4k+HEzqxM0YhFfmum98Wm9QwjPV+x8OjIyHGSd8IovHhRCZOXQh+gs/QjYiCX
	J9BTl7znJYExlfn0cdj6wjfic2oc0L18PVNc9vvHokwhU9Cv6Lkrr1tKpkIF3NLslmrVzUbzIIF
	8j4BR7S5EQOoTNVxOk4GTU0nR61phHV9LEyLxepEVzK23ev2FRAiDzg3nCMjxOQoYkx4x3EXxjq
	AuVfmbJXnEYhVOW/Ej20iiG3KgqSd93rsY3Vp9GzBfB1ZCVVEBn+D8xTpFmTh/6tJDcBySlggIM
	GN8ACig1fKUKcq+6GAZXJle9sVAlvnYdtQYLnu5IHprCDlLlkLE5dX8lyyN5hZ17lMUvh0t25Up
	XpBzMkZGugdpsWz11sey1bA/jFlLxiDdeTgMUDF4S/10kO860hsNw=
X-Received: by 2002:a05:600c:a46:b0:480:4d38:7abc with SMTP id 5b1f17b1804b1-485566d6ec5mr131769375e9.11.1773516876504;
        Sat, 14 Mar 2026 12:34:36 -0700 (PDT)
Received: from starbook ([217.155.46.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4855638cebcsm105647415e9.0.2026.03.14.12.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 12:34:35 -0700 (PDT)
From: Sean Rhodes <sean@starlabs.systems>
To: linux-kernel@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chris Chiu <chris.chiu@canonical.com>,
	Kailang Yang <kailang@realtek.com>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
	Edip Hazuri <edip@medip.dev>,
	Zhang Heng <zhangheng@kylinos.cn>,
	linux-sound@vger.kernel.org
Subject: [PATCH v3] ALSA: hda/realtek: Sequence GPIO2 on Star Labs StarFighter
Date: Sat, 14 Mar 2026 19:34:34 +0000
Message-ID: <20260314193434.8237-1-sean@starlabs.systems>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <4d5fb71b132bb283fd41c622b8413770b2065242.1771532060.git.sean@starlabs.systems>
References: <4d5fb71b132bb283fd41c622b8413770b2065242.1771532060.git.sean@starlabs.systems>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The initial StarFighter quirk fixed the runtime suspend pop by muting
speakers in the shutup callback before power-down. Further hardware
validation showed that the speaker path is controlled directly by LINE2
EAPD on NID 0x1b together with GPIO2 for the external amplifier.

Replace the shutup-delay workaround with explicit sequencing of those
controls at playback start and stop:
- assert LINE2 EAPD and drive GPIO2 high on PREPARE
- deassert LINE2 EAPD and drive GPIO2 low on CLEANUP

This avoids the runtime suspend pop without a sleep, and also fixes pops
around G3 entry and display-manager start that the original workaround
did not cover.

Fixes: 1cb3c20688fc ("ALSA: hda/realtek: Fix speaker pop on Star Labs StarFighter")
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Kailang Yang <kailang@realtek.com>
Cc: Chris Chiu <chris.chiu@canonical.com>
Cc: Edip Hazuri <edip@medip.dev>
Cc: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Tested-by: Sean Rhodes <sean@starlabs.systems>
Signed-off-by: Sean Rhodes <sean@starlabs.systems>
---
 sound/hda/codecs/realtek/alc269.c | 64 ++++++++++++++++++++++---------
 1 file changed, 45 insertions(+), 19 deletions(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 4c49f1195e1b..901314a7af51 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -1017,24 +1017,6 @@ static int alc269_resume(struct hda_codec *codec)
 	return 0;
 }
 
-#define STARLABS_STARFIGHTER_SHUTUP_DELAY_MS	30
-
-static void starlabs_starfighter_shutup(struct hda_codec *codec)
-{
-	if (snd_hda_gen_shutup_speakers(codec))
-		msleep(STARLABS_STARFIGHTER_SHUTUP_DELAY_MS);
-}
-
-static void alc233_fixup_starlabs_starfighter(struct hda_codec *codec,
-					      const struct hda_fixup *fix,
-					      int action)
-{
-	struct alc_spec *spec = codec->spec;
-
-	if (action == HDA_FIXUP_ACT_PRE_PROBE)
-		spec->shutup = starlabs_starfighter_shutup;
-}
-
 static void alc269_fixup_pincfg_no_hp_to_lineout(struct hda_codec *codec,
 						 const struct hda_fixup *fix, int action)
 {
@@ -1454,6 +1436,32 @@ static void alc274_hp_envy_pcm_hook(struct hda_pcm_stream *hinfo,
 	}
 }
 
+#define ALC233_STARFIGHTER_SPK_PIN	0x1b
+#define ALC233_STARFIGHTER_GPIO2	0x04
+
+static void alc233_starfighter_update_amp(struct hda_codec *codec, bool on)
+{
+	snd_hda_codec_write(codec, ALC233_STARFIGHTER_SPK_PIN, 0,
+			    AC_VERB_SET_EAPD_BTLENABLE,
+			    on ? AC_EAPDBTL_EAPD : 0);
+	alc_update_gpio_data(codec, ALC233_STARFIGHTER_GPIO2, on);
+}
+
+static void alc233_starfighter_pcm_hook(struct hda_pcm_stream *hinfo,
+					struct hda_codec *codec,
+					struct snd_pcm_substream *substream,
+					int action)
+{
+	switch (action) {
+	case HDA_GEN_PCM_ACT_PREPARE:
+		alc233_starfighter_update_amp(codec, true);
+		break;
+	case HDA_GEN_PCM_ACT_CLEANUP:
+		alc233_starfighter_update_amp(codec, false);
+		break;
+	}
+}
+
 static void alc274_fixup_hp_envy_gpio(struct hda_codec *codec,
 				      const struct hda_fixup *fix,
 				      int action)
@@ -1467,6 +1475,24 @@ static void alc274_fixup_hp_envy_gpio(struct hda_codec *codec,
 	}
 }
 
+static void alc233_fixup_starlabs_starfighter(struct hda_codec *codec,
+					      const struct hda_fixup *fix,
+					      int action)
+{
+	struct alc_spec *spec = codec->spec;
+
+	switch (action) {
+	case HDA_FIXUP_ACT_PRE_PROBE:
+		spec->gpio_mask |= ALC233_STARFIGHTER_GPIO2;
+		spec->gpio_dir |= ALC233_STARFIGHTER_GPIO2;
+		spec->gpio_data &= ~ALC233_STARFIGHTER_GPIO2;
+		break;
+	case HDA_FIXUP_ACT_PROBE:
+		spec->gen.pcm_playback_hook = alc233_starfighter_pcm_hook;
+		break;
+	}
+}
+
 static void alc_update_coef_led(struct hda_codec *codec,
 				struct alc_coef_led *led,
 				bool polarity, bool on)
@@ -4058,7 +4084,6 @@ enum {
 	ALC245_FIXUP_CLEVO_NOISY_MIC,
 	ALC269_FIXUP_VAIO_VJFH52_MIC_NO_PRESENCE,
 	ALC233_FIXUP_MEDION_MTL_SPK,
-	ALC233_FIXUP_STARLABS_STARFIGHTER,
 	ALC294_FIXUP_BASS_SPEAKER_15,
 	ALC283_FIXUP_DELL_HP_RESUME,
 	ALC294_FIXUP_ASUS_CS35L41_SPI_2,
@@ -4074,6 +4099,7 @@ enum {
 	ALC288_FIXUP_SURFACE_SWAP_DACS,
 	ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO,
 	ALC233_FIXUP_LENOVO_GPIO2_MIC_HOTKEY,
+	ALC233_FIXUP_STARLABS_STARFIGHTER,
 	ALC245_FIXUP_BASS_HP_DAC,
 	ALC245_FIXUP_ACER_MICMUTE_LED,
 };
-- 
2.51.0

