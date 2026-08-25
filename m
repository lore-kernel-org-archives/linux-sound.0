Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FFA30C168
	for <linux-sound@vger.kernel.org>; Tue, 25 Aug 2026 08:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787647298; cv=none; b=iJcznodbQPryiCfpVa2fslzoQ+ZZJpNiaQEvPLiI9AdFff8LzketPEoA3x0bl53yAL/abF5npB8Sq6YWrl8iFx/mVMe0TpC78MVT7rQ8+RzNsACqQpE/yJkREITuuf0tnnvEbulysz1OFbSwW/jmuJJ4p9jywR4npCKQwccw5N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787647298; c=relaxed/simple;
	bh=1rGcIZc6xyJ10BN4yD1jgVoi+DZUD/QP5PKu48fGIKA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YjXEfKcJcbhVC2XAYxIqpRqWgxeUWpSzI/A4hpY+g8VI5P7OOg1Zvz9qYej6w36v70u/ifwg/o3GI4lxq1+5fk6DxmWl6fOKvruKNszeFxf0W78u0+NsalFWsEYhCCK7SIyqjeTd1aTRl3EyFV1yGg89wqIUXbsFhDz0h5/lPV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G0HqzCgb; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G0HqzCgb"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-69c108fee7fso7281610a12.3
        for <linux-sound@vger.kernel.org>; Tue, 25 Aug 2026 01:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787647295; x=1788252095; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/rqGdLhMu9krZRKREk51+4+n08MuVi1R0FDvTEzZocw=;
        b=G0HqzCgbgkf6cTsUMvh6jcrEnZdj3P5lZoRZ+OjHY491WYs7+oBUdJSagn0wHJfd5x
         e9BBNB2hZg9CjJ205M3N6aaNYBJqhnpmspFz2NQu9Tjw10fHNhIOCqUNyoNRpjTX6UJY
         6ZEXxHBiIkBexYL3kk3Rc/yPcUPQEGuwR0rAfZXtHifSmKNRIaUFYYJ4MTchvPOy82N0
         K+7UI5Bw0t6lfdhsm1otzE5omr5PmfiDgCgTQtyouqxrU0+AVg4CJkwVxnERghBYL5az
         5dEWrzX2ePyB1wwPpSaqqeGyhVQqnIYMzHrrMbU0fu6fv5pg8MSw0huR1Sc9vgYR+rMK
         sKfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787647295; x=1788252095;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/rqGdLhMu9krZRKREk51+4+n08MuVi1R0FDvTEzZocw=;
        b=NryGJvyVYAA/tM2f0x7mqASu4fePz0RuJVmzNgN9UMf8WRi3WgoLnumhnPDRJoDfgV
         q19YgRB14Pzffy+SxCPQSO1Oubhq8MJ5u3kYH2PKJj2HndYEa22RUP1/L30vkOeKVyjy
         rjL8M6ZxRnroyUZ/swOOA3RahwXjfK2VjUflD+RB2C4ApHXWEYlkIOsO1hR4FWjfM2v3
         bXJ8tBwohe2gFmgxraoYJm6WjGapreceHmYISlSQvo3LX65sGL6vofGSf9vmMR60C7NI
         c8gedGd2hf6bFtaZY5iDD6sU7Qei5am5cLfm1s9UCSkUYntenVIrI0LVpG0plt3lYhlD
         K30Q==
X-Forwarded-Encrypted: i=1; AHgh+RrlPONhi4AzauwXZIStJAwcxIQx8PAXHSKodfJwnLVQdVmXQ46hkgHGRcgD2VGAeeVDomu/fxAsNTnwrQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lSy0vySCsKb0CNWl1qEpn15RDsHpD9+T7K7rZSiWFqwC49clH9
	KGWBcyvHFws+xy04ymZ2eyfX8jRzLxh90IzGkI8COhApmZFiGT/aTaU=
X-Gm-Gg: AR+sD11X/fUDDAgm/IyvdswaVE5BH+0LAkCgj5ak6I4ZEK+h0Wa25U5eXUYKwMdCMV3
	5pgXxGF4Htxwwe9Dzv3HJA++n5YDnwOMrxPZH5wgeaLL/eiATkyuJY+HNte6a3NjOTCVRdUpCib
	VQxdo1A/DSFE6qYzBnjDwf6bYxg6OoZGz6zNn/lJUDJ7qfoo1AB7dWtCZSALNbQEg91VgSPR1oU
	1V//DHDLiZmSpED4II3oqRfTdh0/n9GjwVXRvxOS4UX34DwIROR0Fd3BOfcfVqVe0hXVTsDqVuA
	QyBFR0rhSpI9Ya2LT0uVwh9iLkHgah9Q/6bWl+xDnJ0pRkFTI+qkRqqtUOwS2+MQnV/zmK/mg+s
	H30FUNUGbHsDKsGzd/p+1T0N9MSE9uET7nBww4J2oq/EYrhTvlw5ekonF7wlUmCLurYlUN+PFP/
	sXii9kx5i24jEaFUZTWVO/dDGuVV4s00snNVGQuwaJT39KItg7rNhNxu1zLg+PwJKO3Tcng60u1
	qq+P0H/fw==
X-Received: by 2002:a17:906:f5a8:b0:c21:450d:cd7e with SMTP id a640c23a62f3a-c24925dbc76mr2418611366b.9.1787647295025;
        Tue, 25 Aug 2026 01:41:35 -0700 (PDT)
Received: from localhost.localdomain ([31.223.84.133])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24962bbea6sm1567513466b.27.2026.08.25.01.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 01:41:34 -0700 (PDT)
From: "=?UTF-8?q?Habil=20Eren=20T=C3=BCrker?=" <habilerenturker@gmail.com>
X-Google-Original-From: =?UTF-8?q?Habil=20Eren=20T=C3=BCrker?= <habilerenturker@hotmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Habil=20Eren=20T=C3=BCrker?= <habilerenturker@hotmail.com>
Subject: [PATCH] ALSA: hda/realtek: Fix speaker mute LED for HP Laptop 15-fd0039nt
Date: Tue, 25 Aug 2026 11:40:14 +0300
Message-ID: <20260825084125.4103-1-habilerenturker@hotmail.com>
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
 sound/hda/codecs/realtek/alc269.c | 61 +++++++++++++++++++++++++++----
 1 file changed, 53 insertions(+), 8 deletions(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 01b87267f..ec7b9ee67 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -1364,14 +1364,59 @@ static void alc269_fixup_hp_gpio_led(struct hda_codec *codec,
 	alc_fixup_hp_gpio_led(codec, action, 0x08, 0x10);
 }
 
-static void alc236_fixup_hp_micmute_led_only(struct hda_codec *codec,
-				const struct hda_fixup *fix, int action)
+/*
+ * HP Laptop 15-fd0xxx (SSID 103c:8bb6) Speaker Mute LED fix
+ *
+ * The speaker mute LED is controlled via VREF100 on NID 0x1a.
+ * This pin must remain powered (D0) even during suspend, otherwise
+ * the LED state is lost and the pin defaults to Hi-Z on resume,
+ * causing the LED to stop responding to mute toggles.
+ * Windows keeps this pin powered unconditionally, so matching that
+ * behavior ensures consistent LED operation across suspend/resume.
+ * The mic-mute LED is controlled via GPIO 0 with active-low polarity.
+ */
+static unsigned int hp_8bb6_power_filter(struct hda_codec *codec,
+					 hda_nid_t nid,
+					 unsigned int power_state)
+{
+	if (nid == 0x1a)
+		return AC_PWRST_D0;
+	return snd_hda_gen_path_power_filter(codec, nid, power_state);
+}
+
+static int hp_8bb6_speaker_mute_led_set(struct led_classdev *led_cdev,
+					enum led_brightness brightness)
+{
+	struct hda_codec *codec = dev_to_hda_codec(led_cdev->dev->parent);
+	unsigned int val = (brightness == LED_OFF) ? PIN_IN : PIN_VREF100;
+
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
@@ -4096,7 +4141,7 @@ enum {
 	ALC236_FIXUP_HP_GPIO_LED,
 	ALC236_FIXUP_HP_MUTE_LED,
 	ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF,
-	ALC236_FIXUP_HP_MICMUTE_LED_ONLY,
+	ALC236_FIXUP_HP_15_FD0XXX,
 	ALC236_FIXUP_LENOVO_INV_DMIC,
 	ALC298_FIXUP_SAMSUNG_AMP,
 	ALC298_FIXUP_SAMSUNG_AMP_V2_2_AMPS,
@@ -5839,9 +5884,9 @@ static const struct hda_fixup alc269_fixups[] = {
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
@@ -7345,7 +7390,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
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

