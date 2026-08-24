Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E8A3F1678
	for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 09:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787564613; cv=none; b=X0tW0fcHIC3cWE7X38awqTmTGgrbxkDXaofX6oaUZdQ+E5Lyw65VFQx6YJCXlTEzwb3eQ/L/WtE0WMva2Gded1eWlnZ3qi9oRCPFoNS5Ui1VH5CU+CcLc22B/SimLbPqYfeRpHyLBdqhhavm9AMUrv+mhVF9zUDtjdjuyNePXLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787564613; c=relaxed/simple;
	bh=lCHOKf1he7vKZlNXyEz99WnPXMGujAfkVEfOmKv5yW4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WPvS1Er4++w6jZ22/nd4T1RepuVc3dE3UB54e7rzdxVanZ30qnCHBNg00vTm7iANk+IrOEHT9jm2CAK+48xt04kbyLsbfDlMUEAkNhXCR+yyxe88rICD6w/n29ljsUmwGJln0qhCmOFKD/3Ot3O8BCoJ90lOkKQay50h8IwBtuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T2vONzQz; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T2vONzQz"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c15f020a223so473456066b.1
        for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 02:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787564610; x=1788169410; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tt+TQsCLx2V8Yk8sD/vVtXtNe1G9NCu1SZAx+dsGT3Q=;
        b=T2vONzQzoyKzFXr6eJdSGPTpsngV479FOV1cs6wCkU2rKQANYl0/QfCAIemPVye9R8
         F+PsExWXdnPZLVxLG24/Eo8dDpx1p9zBiPBq7VBZ9ALoJsexxbE3SjzGVNsKaymzLXsO
         2vpv3rgPxlpa3Tc26Z24uGx9tg7wb6zkm6u2bA8mIEsOT0yePT4Yndw5H5PpnbFoGa8B
         oBxaYEfDsNSZTM9PHsxraJtezZBnhyLxGQZFB6kfkS8Cs/lrtY9TzjKr6tU18EShsoUM
         gOUKZWbe2v5zd4MPbaiLSLJO6Q4I8oYTJfS8UZcJC6XmaQ0V88DiYCA9Umv1pvSrw/93
         UoAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787564610; x=1788169410;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tt+TQsCLx2V8Yk8sD/vVtXtNe1G9NCu1SZAx+dsGT3Q=;
        b=tZTNoQWp4TvSs0tPBpy7FgDzfglb6stifUuF3t4nc74LaHywiYphNYY6I7EYRUQTLk
         Vp8wJbaxtjlc7bKT4qaLxcWbryHGri0dYxD0mXqsEh29Kcew/JvYRdesLyHvpyliyII6
         8o2uQQaico/qfN3vdIoekh0PJRDBX2tY6+a5O/dKq8Dfk5xZGC1UDRsCBLa2Hxq5xZZs
         ucV8LHgA/VbxrO9LJvd8s2nBgEn7CLUR7P2904/U91F6Oz8aMuQjgS8L5fXNLrQTbvLl
         G5mTejs8IlmhfN1W8pe9Q5h59NgreGQg08QHud+HTTeRwmQvJR1cs9uijFME9j9raPNH
         htpA==
X-Forwarded-Encrypted: i=1; AHgh+Rp/xYDeB6+gDU8bVayzk9ZWKFjUyKUEjG2dqrkYURKWSkegW5CIfv60EgBvFwK9stRNmHr3IO1I+e6G3Q==@vger.kernel.org
X-Gm-Message-State: AFuF++no6ClWSyM9gTBofpOiUQA/vnrswh3VjMfTH//UESI/N7GsB+nu
	SM9tkswtXWkJpgsIKTdH1Ej+qxfuPVVbC3R17uYtBqd9k4DsdOWooTY=
X-Gm-Gg: AR+sD10qh/LmPM5vDaMFp4bfFGRQoSZgk5HPN/vI62emdl1Y8e6N8zJh5XpZwLQQtWS
	UoZGwS9u23kmlWRDZyfjrKFovo8ngv8y6QEUx8wWy6CVX8ctiX91B00CFL3CcSM1ai+5jq/LbqV
	qzIlB99s+vgtp9IUfa8+bC+JzkloD8KVYknFOaYZFemSMojZDG/rrQHyMGguij7bh4dTR7YeWx1
	fe+uA+2m5HQERv+7fsvBxazEaxxzzHbOYfS/hjOsyeATPLhvONES7UrRtsq3fiEdaMsXs+jVhgn
	5IApKL4I0mCB2kkYVMbtNP6eMtBw5cI+/Oc9lPJHDPE4hfc6VEqIpCEjHMJjZeS3s+5Y0aFNfdp
	Mdn3TbnIX3tUHwywb1cN2hux0wF6L/SDmbXM88GYUnelc1QZEvl0in8e5pIfRIb221pR0gswQpm
	GIihpOIWIrsbBmAYnGKRIldTwjMrfHfy8rkdqr2Q+J7L6ZHjoZ+v/y8tcxbv6xkfmKiifshKNv/
	zWQ8pPJAzZTLHs=
X-Received: by 2002:a17:907:3d0a:b0:c20:74db:50c7 with SMTP id a640c23a62f3a-c246a697ac4mr2957361066b.13.1787564609890;
        Mon, 24 Aug 2026 02:43:29 -0700 (PDT)
Received: from localhost.localdomain ([31.223.84.133])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f8f08sm1140963166b.35.2026.08.24.02.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 02:43:29 -0700 (PDT)
From: "=?UTF-8?q?Habil=20Eren=20T=C3=BCrker?=" <habilerenturker@gmail.com>
X-Google-Original-From: =?UTF-8?q?Habil=20Eren=20T=C3=BCrker?= <habilerenturker@hotmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Habil=20Eren=20T=C3=BCrker?= <habilerenturker@hotmail.com>
Subject: [PATCH] ALSA: hda/realtek: Fix speaker mute LED for HP Laptop 15-fd0039nt
Date: Mon, 24 Aug 2026 12:42:28 +0300
Message-ID: <20260824094256.3758-1-habilerenturker@hotmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

HP Laptop 15-fd0039nt (SSID 103c:8bb6) needs a quirk to control the
speaker mute LED via VREF100 on NID 0x1a (active-high).

This patch replaces the previous ALC236_FIXUP_HP_MICMUTE_LED_ONLY
with ALC236_FIXUP_HP_15_FD0XXX, which covers both mic mute (GPIO0)
and speaker mute (NID 0x1a) LEDs.

Use spec->no_shutup_pins instead of a custom shutup hook, as suggested
by Takashi Iwai.

Fixes: e711ebfadc9a ("ALSA: hda/realtek: Add quirk for HP Laptop 15-fd0039nt")
Tested-by: Habil Eren Türker <habilerenturker@hotmail.com>
Signed-off-by: Habil Eren Türker <habilerenturker@hotmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 51 ++++++++++++++++++++++++++-----
 1 file changed, 43 insertions(+), 8 deletions(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 01b87267f..a2a3341c3 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -1364,14 +1364,49 @@ static void alc269_fixup_hp_gpio_led(struct hda_codec *codec,
 	alc_fixup_hp_gpio_led(codec, action, 0x08, 0x10);
 }
 
-static void alc236_fixup_hp_micmute_led_only(struct hda_codec *codec,
-				const struct hda_fixup *fix, int action)
+/* Patch for HP 15-fd0xxx (8BB6) Speaker Mute LED & Mic-Mute LED */
+
+static unsigned int hp_8bb6_power_filter(struct hda_codec *codec,
+					  hda_nid_t nid,
+					  unsigned int power_state)
+{
+	if (nid == 0x1a)
+		return AC_PWRST_D0;
+	return snd_hda_gen_path_power_filter(codec, nid, power_state);
+}
+
+static int hp_8bb6_speaker_mute_led_set(struct led_classdev *led_cdev,
+					 enum led_brightness brightness)
+{
+	struct hda_codec *codec = dev_to_hda_codec(led_cdev->dev->parent);
+	unsigned int val = (brightness == LED_OFF) ? PIN_IN : PIN_VREF100;
+	snd_hda_set_pin_ctl_cache(codec, 0x1a, val);
+	return 0;
+}
+
+static void alc236_fixup_hp_15_fd0xxx(struct hda_codec *codec,
+				      const struct hda_fixup *fix,
+				      int action)
 {
 	struct alc_spec *spec = codec->spec;
 
-	if (action == HDA_FIXUP_ACT_PRE_PROBE)
+	switch (action) {
+	case HDA_FIXUP_ACT_PRE_PROBE:
 		spec->micmute_led_polarity = 1;
-	alc_fixup_hp_gpio_led(codec, action, 0x00, 0x01);
+		alc_fixup_hp_gpio_led(codec, action, 0x00, 0x01);
+		
+		spec->mute_led_polarity = 0;
+		snd_hda_gen_add_mute_led_cdev(codec, hp_8bb6_speaker_mute_led_set);
+		
+		codec->power_filter = hp_8bb6_power_filter;
+		spec->no_shutup_pins = 1;
+		break;
+
+	case HDA_FIXUP_ACT_INIT:
+		if (spec->gen.vmaster_mute.hook)
+			snd_hda_sync_vmaster_hook(&spec->gen.vmaster_mute);
+		break;
+	}
 }
 
 static void alc285_fixup_hp_gpio_led(struct hda_codec *codec,
@@ -4096,7 +4131,7 @@ enum {
 	ALC236_FIXUP_HP_GPIO_LED,
 	ALC236_FIXUP_HP_MUTE_LED,
 	ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF,
-	ALC236_FIXUP_HP_MICMUTE_LED_ONLY,
+	ALC236_FIXUP_HP_15_FD0XXX,
 	ALC236_FIXUP_LENOVO_INV_DMIC,
 	ALC298_FIXUP_SAMSUNG_AMP,
 	ALC298_FIXUP_SAMSUNG_AMP_V2_2_AMPS,
@@ -5839,9 +5874,9 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc236_fixup_hp_mute_led_micmute_gpio,
 	},
-	[ALC236_FIXUP_HP_MICMUTE_LED_ONLY] = {
+	[ALC236_FIXUP_HP_15_FD0XXX] = {
 		.type = HDA_FIXUP_FUNC,
-		.v.func = alc236_fixup_hp_micmute_led_only,
+		.v.func = alc236_fixup_hp_15_fd0xxx,
 	},
 	[ALC236_FIXUP_LENOVO_INV_DMIC] = {
 		.type = HDA_FIXUP_FUNC,
@@ -7345,7 +7380,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8b97, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8bb3, "HP Slim OMEN", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8bb4, "HP Slim OMEN", ALC287_FIXUP_CS35L41_I2C_2),
-	SND_PCI_QUIRK(0x103c, 0x8bb6, "HP Laptop 15-fd0039nt", ALC236_FIXUP_HP_MICMUTE_LED_ONLY),
+	SND_PCI_QUIRK(0x103c, 0x8bb6, "HP Laptop 15-fd0039nt", ALC236_FIXUP_HP_15_FD0XXX),
 	SND_PCI_QUIRK(0x103c, 0x8bbe, "HP Victus 16-r0xxx (MB 8BBE)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8bc8, "HP Victus 15-fa1xxx", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8bcd, "HP Omen 16-xd0xxx", ALC245_FIXUP_HP_MUTE_LED_V1_COEFBIT),
-- 
2.47.3

