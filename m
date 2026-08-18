Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5839A479869
	for <linux-sound@vger.kernel.org>; Tue, 18 Aug 2026 13:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787060003; cv=none; b=Bglp/G1c2hgtfZ87cwHdRgTZ4Piip/j9Qah+UBfDmBharyoZPvZC1dJs633wtA/3Fyj6W23THCT9PVlSTrv9iJyrbT3l5nRjiLDRUAfH2YzmrOyczCkHQNKGnqJCgdvvzQNyqUuXQR6qLADvI/CFUJE+s2Vk3lNH4LL6ZXyzGXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787060003; c=relaxed/simple;
	bh=X5wlPFwzdG3Ji5FSu+8Qkg3NrdVjpDWyr+r6s94mIjU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nZV3d0mtcIsPLNBTtAHUBN048v39qLo28zDLbbWxQ1HjRqrLqwvJSYh4x3f69kFi4AD7UMTQSr0eSI+Y8nzjD31O/vm141IqittuqdceUeO0AE4Ug3jUnVNa2tE4U4yoiCfxkXYJzoPS4fWxGI9n4DglT2zwcbcn+9zj7vCnAos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DaHX+2OK; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DaHX+2OK"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so51779525e9.2
        for <linux-sound@vger.kernel.org>; Tue, 18 Aug 2026 06:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787060000; x=1787664800; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U1rsB/OaZSnozAXTvZj8e3dKV8TKlmbxAyc0wzvWiNI=;
        b=DaHX+2OKANmRIlbycLOpP6PgDD7KgS8HeyQFcajQ8U/kZtmCLj6m4SATBMK0MvgOeg
         5+CnfDQ1s91/sVrFD3R6OqFHQNa1mNS4kosenZCgh1ubFlppeVaLcnf3HxDoK6bwOKU9
         uiKofAjFLHV+43FPFKOzRMeo4ZWuu7iNZbNwXZ6HKu1Zo9eAFSDUUjfrRv4UD6UXm+yz
         tA2j3OQswomLROOkHW8uDClXAVqDNYMvxqzk24IfLLIZId7+YVawU8y1x/fHK/BdzvVN
         kJv/0t2uNR09n9UoKqMiIBdQS8qRTg/hhgnv17iQXj3xHUc5S3Wk0scZ+Nxo/AR31uqk
         LXKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787060000; x=1787664800;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U1rsB/OaZSnozAXTvZj8e3dKV8TKlmbxAyc0wzvWiNI=;
        b=iCTKmQ+ucrlu+zPR/KqL1NruwHFT6rlPgnuXnH2a3TiKq167IOZVidP1B7I3yTFAW7
         g78tG/FtRYQNx7ifDO99K5iBvdMIdwy38b++hJbJHojF5nrQhF4CMfdjZyf9On+jL07b
         FIHB1IWIMdnwTu0IcSk/ggKVeM6p7hxcQmeUBeV8p75aUbjGk4Rt+4suaILpcSQGVWjZ
         e37nFPA/FeqvoZc81teR76yBlAqHBTz9CA9fABnWExzAcwzkcVvP5DllewhdaUor38qo
         jwrSqAfwL97JfsK8rReoDtfgIee+ayG9csa3SvlhKYz5bK3O7ttyiJ4r1UNGkRMGRZcl
         43Mw==
X-Forwarded-Encrypted: i=1; AHgh+Ro6C6sd2GtqNrh4jNrVuiOcIpIOz2z1nyzzE8KXlxpmvD3Gv/0apKlJx33MAtuIZEySmCijTkR8na7Ihg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/20RHfxVvbylhTUhjtVQTZ1Ur23RHKThMRZtCILGaBsTnm6z4
	MTJASFGYbi/l6a2g1f8YKS4SNbFfA7WqOyMzNAWHOo4yEj0ZfkfO4mYh6Nu0F+A=
X-Gm-Gg: AR+sD12QrWHF4rbazyKKHhfc46PCLp6bSliMwJdfjkxpnAZb9BdSsP4IR6Kdl7lf1qa
	qYgR6t+M0pPzDWyMQIOqUHiSlC0CZWnOZMGcNqaVm1VVyyflDWcBtzA5HXpQMo20NIdXIECO2wb
	KwMeE8VNk1MEz1X8ZdCEDmXRyIPM5HGIGjgCMBJkHRoTXspAzjMliQ5bJZiNr3PDrR2481FtHnv
	d6f0Zu1N3/ooenWip/SsD231bAa3Hjn60S+amYT9AQNYSt/clVn/dXvA1RX8YE7jzportO3H6R7
	fNYRc2kC+jJbatC5l6bN9EEyhorbkJUG/6gPkOFL3jDzSnvKQV7HdIKsEPZCRq/BZL78+JG9kVC
	EfzQ66V/nJIgT6ZXN9pJs7dOto0mlaZL4pLn4oOedeVTea9sh/H3/kvRiMF8xz8Yb5BqyeIz6DO
	xQmxCUpgzlsN7ZN3paSzJVqpxFl3L4oT9pokrdHlbKh4CZGKvsRNXNieLW1+qGrRWHDMsWhArO6
	i2muqP6SuDxITkVVyg=
X-Received: by 2002:a05:600c:c16d:b0:499:8ff5:8ecc with SMTP id 5b1f17b1804b1-4998ff590a6mr469337905e9.15.1787060000273;
        Tue, 18 Aug 2026 06:33:20 -0700 (PDT)
Received: from localhost.localdomain ([31.223.84.189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49996100184sm298460495e9.1.2026.08.18.06.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 06:33:19 -0700 (PDT)
From: "=?UTF-8?q?Habil=20Eren=20T=C3=BCrker?=" <habilerenturker@gmail.com>
X-Google-Original-From: =?UTF-8?q?Habil=20Eren=20T=C3=BCrker?= <habilerenturker@hotmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Habil=20Eren=20T=C3=BCrker?= <habilerenturker@hotmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add quirk for HP Laptop 15-fd0039nt
Date: Tue, 18 Aug 2026 16:32:43 +0300
Message-ID: <20260818133303.5102-1-habilerenturker@hotmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch adds a quirk for the HP Laptop 15-fd0039nt (SSID 103c:8bb6)
to fix the micmute LED functionality.

The micmute LED is controlled via GPIO 0 with active-low polarity.

Tested-by: Habil Eren Türker <habilerenturker@hotmail.com>
Signed-off-by: Habil Eren Türker <habilerenturker@hotmail.com>
---
 sound/pci/hda/patch_realtek.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index b0ee9b58e..1045bb3dc 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -4577,6 +4577,18 @@ static void alc236_fixup_hp_gpio_led(struct hda_codec *codec,
 	alc_fixup_hp_gpio_led(codec, action, 0x02, 0x01);
 }
 
+static void alc236_fixup_hp_micmute_led_only(struct hda_codec *codec,
+				const struct hda_fixup *fix, int action)
+{
+	struct alc_spec *spec = codec->spec;
+
+	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
+		/* Micmute LED = GPIO 0 */
+		spec->micmute_led_polarity = 1;
+	}
+	alc_fixup_hp_gpio_led(codec, action, 0x00, 0x01);
+}
+
 static void alc269_fixup_hp_gpio_led(struct hda_codec *codec,
 				const struct hda_fixup *fix, int action)
 {
@@ -8138,6 +8150,7 @@ enum {
 	ALC236_FIXUP_HP_GPIO_LED,
 	ALC236_FIXUP_HP_MUTE_LED,
 	ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF,
+	ALC236_FIXUP_HP_MICMUTE_LED_ONLY,
 	ALC236_FIXUP_LENOVO_INV_DMIC,
 	ALC298_FIXUP_SAMSUNG_AMP,
 	ALC298_FIXUP_SAMSUNG_AMP_V2_2_AMPS,
@@ -9772,6 +9785,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc236_fixup_hp_mute_led_micmute_vref,
 	},
+	[ALC236_FIXUP_HP_MICMUTE_LED_ONLY] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc236_fixup_hp_micmute_led_only,
+	},
 	[ALC236_FIXUP_LENOVO_INV_DMIC] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc_fixup_inv_dmic,
@@ -11034,6 +11051,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8b97, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8bb3, "HP Slim OMEN", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8bb4, "HP Slim OMEN", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x103c, 0x8bb6, "HP Laptop 15-fd0039nt", ALC236_FIXUP_HP_MICMUTE_LED_ONLY),
 	SND_PCI_QUIRK(0x103c, 0x8bbe, "HP Victus 16-r0xxx (MB 8BBE)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8bc8, "HP Victus 15-fa1xxx", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8bcd, "HP Omen 16-xd0xxx", ALC245_FIXUP_HP_MUTE_LED_V1_COEFBIT),
-- 
2.47.3

