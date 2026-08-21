Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEF917993
	for <linux-sound@vger.kernel.org>; Fri, 21 Aug 2026 20:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787345852; cv=none; b=N6LfVYCCI44MFs0XnY6sntoxRoHmOEVG+WF2TBuTyGoc1QMeuLIYkz6Ch3orCfOKlYndTKMao4jN0uj19yQBQEZtxLYC+j41VI54tcVRfh3tVzCdiBNrB0Dt4US+4wQhxJN2cZMHBtsbDFeadiy7VJPHMKQLWJ2/oq6W2Zdg0IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787345852; c=relaxed/simple;
	bh=j2tRYJFNt8KENcj9zWM8AfvTA6H5fHi3uhQAXY2/ZWo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hyXKQ+UsGqV3wl9gtk7S6UQCJkYhDrfdQF5m5Fz0UsEVScpcZYISjqeyVGmfwwPSYVG4K8IgHpDR53k8uZSQUe+hNgQW4XcyDeQa5E6+pxHrLus0jggY3gkiRJJpfIO4CGX1C27QgRNuph5SHqjFpzN2Z94TJ2GqqKLwM+9lyoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b6/uLQIv; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b6/uLQIv"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c20fb91ed0fso206730366b.3
        for <linux-sound@vger.kernel.org>; Fri, 21 Aug 2026 13:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787345849; x=1787950649; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O0r0GmHxCfTRKvUuN/ynVPBuwVgWoS2Jnuin21tATSk=;
        b=b6/uLQIvunpsr6fcti9WlrymXRQSswoxvKGRxsBpI0icHNCtaQl31Z+qsD5k0znTHB
         BcuvBoBKXUi+r8BEZshWdBoST8mVv9K/hUIptpsNotUOfsk8r03fvldJOEWDOMxwe+kD
         B8wIxd+wMtAfo5e9dN4New0GaK96+I7qKLADqoEIlLzsp03zYtU4oo/9FTR5F5U64oSg
         CZ1cIq1ajxZd/YwreeD+Vsb4OW7doaJCisqYGi2bf/hpJDe6Ab2q/b5LxX3inEsE8N/h
         guxDxrogOT0CqTt5oe0+zP4RE6zipHHmrqHQlwTEH01gNH+vYLIkbWgk6HGdZwlACkl4
         W66Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787345849; x=1787950649;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O0r0GmHxCfTRKvUuN/ynVPBuwVgWoS2Jnuin21tATSk=;
        b=FB3wKyYQqpcxiP5zvbjHeEZDr42BtHNQRHBvOzLcZ5YkqtneLxmTs/JScAr8vWq1SJ
         hGrqUyr4SzbvjDsI61q6UYZQ/VHR/tF/OLu+J3BgcoWCTTHUwZchz6hClXMoQVgY496O
         +R0fam19xkDrjR/8e519z+6qZ/wg+haYkPbMBBSBZMjrzO99ZK+PLZ3XlVXkSqYjcA73
         5Nhj9d2wrCtXErqpnl3qvTsHOOk8Mz1QbyLxWi7JBaBmLykvg3yajhrrjE8ne7FGdz9c
         MtIGKLTMgtbTKklJjVQMkjtjaqex1WZ8WVDqCsN6CDKGzbOkoSoNNoJ4SdQ29CnEEAxH
         kX8Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqh3eAe0AtmNSyo/SDTB/xTX52A0hjmQoVGCC3KE6rm0oKKx2xwpdE0BBgtDfx2YSuK5qm94kBFCD0VaA==@vger.kernel.org
X-Gm-Message-State: AFuF++mbpBOteg0oQICG5aF6BcBPXER+oCUJDjrY/KfdWDoFLYeK+F7S
	Hs2/AdGNUysjxzKAJwbbmpJXE4UYv7HvY7P92kETth2Hle9N9/m/2vL/4ohJ0GY=
X-Gm-Gg: AR+sD12wNPdHjY/P1iDqIndNBeRsLxAr1nhmMX0GoySdsty0tQODhkVRfbYLV7V4Unj
	rNDaqgMG8RDLRdULF8wOpnjelZUGDLyzdgGSlafuCJ2X2D2ozqBb+ucRz57WaojQkstIU/z4J+t
	V53mo+AR1PQN39Lbw9I4uR2oW65MlofZAiZb9J8X53oPs6p+MhnkMCpeuZzkTLctwn+6PBYt2Wo
	ALMfQgfzEgdpdts6A1V75BrEKJUEISHWPGDtMBusjko5tKbvxwV4VP9DwirCRciOGcPQYR3L6AK
	TOJkATKy5oW/UdeD5b+6JIQFAkrplYxB6KhnK5Tf50sBdBLKULoQ79OJly1Svo9E80+IK8Z4tix
	uvbHb6HVNFqGwO+WNo6rakJuL+FVT50731punJ00GCypiMntvUsVlb4roluT5ow1SjdIXYTaVHJ
	fGUmWIuCzd5QET1YIAHfg73nD0SqePCnsjD3B8SqOYIjJVe6F6LuvxlIACvJrZhG52VsiTWZBDY
	KFb0hTzCQ==
X-Received: by 2002:a17:907:3e9a:b0:c15:e118:9b99 with SMTP id a640c23a62f3a-c246a6a3e6cmr934111166b.23.1787345849337;
        Fri, 21 Aug 2026 13:57:29 -0700 (PDT)
Received: from localhost.localdomain ([31.223.84.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2495ee5295sm2393366b.0.2026.08.21.13.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 13:57:28 -0700 (PDT)
From: "=?UTF-8?q?Habil=20Eren=20T=C3=BCrker?=" <habilerenturker@gmail.com>
X-Google-Original-From: =?UTF-8?q?Habil=20Eren=20T=C3=BCrker?= <habilerenturker@hotmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Habil=20Eren=20T=C3=BCrker?= <habilerenturker@hotmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add quirk for HP Laptop 15-fd0039nt speaker mute LED
Date: Fri, 21 Aug 2026 23:57:06 +0300
Message-ID: <20260821205717.3219-1-habilerenturker@hotmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

HP Laptop 15-fd0039nt (SSID 103c:8bb6) has a speaker mute LED that is
controlled via VREF100 on NID 0x1a. Unlike standard implementations, this
device requires PIN_VREF100 (0x24) to turn the LED on and PIN_IN (0x20)
to turn it off, with active-high polarity.

The existing ALC236_FIXUP_HP_MICMUTE_LED_ONLY quirk only handles the
microphone mute LED, so this patch adds a new fixup
ALC236_FIXUP_HP_15_FD0XXX that covers both:
- Mic mute LED via GPIO0 (active-low)
- Speaker mute LED via NID 0x1a VREF100

The patch also adds a custom power_filter to ensure the pin remains
powered during suspend, and a shutdown hook to restore the pin state.

Tested-by: Habil Eren Türker <habilerenturker@hotmail.com>
Signed-off-by: Habil Eren Türker <habilerenturker@hotmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 59 ++++++++++++++++++++++++++-----
 1 file changed, 50 insertions(+), 9 deletions(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 01b87267f..d19935be3 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -1364,16 +1364,57 @@ static void alc269_fixup_hp_gpio_led(struct hda_codec *codec,
 	alc_fixup_hp_gpio_led(codec, action, 0x08, 0x10);
 }
 
-static void alc236_fixup_hp_micmute_led_only(struct hda_codec *codec,
-				const struct hda_fixup *fix, int action)
+/* Patch for HP 15-fd0xxx (8BB6) Speaker Mute LED & Mic-Mute LED */
+
+static void hp_8bb6_shutup(struct hda_codec *codec)
+{
+	snd_hda_shutup_pins(codec);
+	snd_hda_set_pin_ctl(codec, 0x1a,
+			   snd_hda_codec_get_pin_target(codec, 0x1a));
+}
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
-}
+		alc_fixup_hp_gpio_led(codec, action, 0x00, 0x01);
+		spec->mute_led_polarity = 0;
+		snd_hda_gen_add_mute_led_cdev(codec, hp_8bb6_speaker_mute_led_set);
+		codec->power_filter = hp_8bb6_power_filter;
+		codec->power_save_node = 0;
+		spec->shutup = hp_8bb6_shutup;
+		break;
 
+	case HDA_FIXUP_ACT_INIT:
+		if (spec->gen.vmaster_mute.hook)
+			snd_hda_sync_vmaster_hook(&spec->gen.vmaster_mute);
+		break;
+	}
+}
 static void alc285_fixup_hp_gpio_led(struct hda_codec *codec,
 				const struct hda_fixup *fix, int action)
 {
@@ -4096,7 +4137,7 @@ enum {
 	ALC236_FIXUP_HP_GPIO_LED,
 	ALC236_FIXUP_HP_MUTE_LED,
 	ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF,
-	ALC236_FIXUP_HP_MICMUTE_LED_ONLY,
+	ALC236_FIXUP_HP_15_FD0XXX,
 	ALC236_FIXUP_LENOVO_INV_DMIC,
 	ALC298_FIXUP_SAMSUNG_AMP,
 	ALC298_FIXUP_SAMSUNG_AMP_V2_2_AMPS,
@@ -5839,9 +5880,9 @@ static const struct hda_fixup alc269_fixups[] = {
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
@@ -7345,7 +7386,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
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

