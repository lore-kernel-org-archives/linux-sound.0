Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC937313550
	for <linux-sound@vger.kernel.org>; Tue,  5 May 2026 15:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777995766; cv=none; b=NLx0cICDoBcmSGnqqi/hAr26VcMXkp5cE+8hHHSEOknzChzlS8hPL2NZFEnLuHsNOBM2yqvCyLmw7EVeJnf6jOSo1LugUdlGUk19qoyHCfX+EYRwJSk+ejRTYJmmfxV4fYOWRf8T4W1LccMTjUI2GvU3Gi7czuqMY1YB1e66hm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777995766; c=relaxed/simple;
	bh=5dWZoB4y3y7rdWnp/pELPXHsJs2TMx4lFW9xzcoicw4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=njXqIzfr0GM20Jp3zrDdEOyoQAnoRyedmzWhE65eOKCFI2PKqk7dKHZkmkRfFJxr7bOqLJSTXPn6tyODLF7Uiv5A/GGteqGGYdmOG5EnszwlrGfEHy2dl4U+OhtUKF7DbmKZjGAmvo6cKfLFGMQam1/W6ijj0qfDrLWaworR7vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HAs1Ze0E; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HAs1Ze0E"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-bc4edbedb4aso47432866b.1
        for <linux-sound@vger.kernel.org>; Tue, 05 May 2026 08:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777995763; x=1778600563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BE8Eb1tHrthImN/Avtt17wsaxfAykDGB97Glj7l/1S4=;
        b=HAs1Ze0EFXfbKbEKIIpysL/gcVM0uSjGbGTLeE2oZVAqZeUHcakEYz5HJFp+18ftuo
         m1WWovV4GVTyriSOkSK95nJ7oBfUaBd+VMTDSCxvLvGkE8CRgsLyfdZWNSAErsloZ+ol
         ubWqnDvFgMDQsC5hU3PvdsKreJCR8bVvrHuJJ6iEl72JyerRGMWTo21k1FPGGpzmOPy7
         Mz5DTtGoo+bYGIC1GsJ8b9v8e7RQvziAYb14AaYi+z4LOLLdSBCUKbRSHoo6TtPwDXt6
         P0g/zzR4aD9QfdpPhNQnL7uDM4r2GG2HLfng6wJjv9xP8dMuDrGHvmCwnoBH2tCD8lFo
         Aiww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777995763; x=1778600563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BE8Eb1tHrthImN/Avtt17wsaxfAykDGB97Glj7l/1S4=;
        b=XTLLHq3FZ+AguBU7A4TS9z8wsujYv6NVTzBaDtS74pejC/8E4ktNp3WEgSu50TzY0m
         5Lljxeq/pM7lYxzlz6zFvivnEYVA2FzvteUVfgKuwNDBbbRI3yoWX+3GCXBtdwqO+FX6
         vCNBz6GQNW6iq3fgX9vl661CnITbIF+cQSrHTdXZTjQBhkc3gj8/NNrH4c250XI88yNv
         yay2ZtJLWhlVxa8CeGmm50TDp6RVmMpRKbA2Vk1Vvu/3RUv72j0ui6K6Z9e1aAF6983O
         6I+r/xFxxaezXSoLM/8Vo8sEppi+1lM5b30hGPemgS82tOM3Q5/VwWiT4IQLwRzY7eDf
         WffA==
X-Forwarded-Encrypted: i=1; AFNElJ8MUBIr413uQo3u4l0KFCYYVbIu2T5VnSsGVmfTbMV9T75WbS8jchMS3YATspxa6JKwMWqEdbLziIniNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrtfpNT1Pmve8ub6ezn84iodYIVcDJVC6EtgG30ihcrg+MDCbd
	VGHj7cDdfY4P6MQT8vKn7gOiOD7kl8AKEKHLhi7GYxa3nTA5xSHzjdyJ
X-Gm-Gg: AeBDietvKynpo/3Y6/PsfsfVlAbMaZ8XI+GzX9vBTotC22RWqu5rdBWE5GEv96wntFn
	sG9ID0taq2QI0Rr4S644Iggl62i0pVY8BpG4kbS9how+j5b6/1VEQKOtf2b09A5W3zGBkKlynBb
	brvLOwPA4C78uVU/TGM/KXuT07jUeANazgYoBRrsOnb/H1eAa8MdpEGjHLwkevFmnVUnLsQbBw+
	TwaeKcPOeyNSXvgjy7aE6U/TVlFpDQ27eHfoAKgBxKpniaeKwtjXLWUJt27PxzNsHKHV/kp164O
	4ghUG4ym/F2k+f3DhVCc12s0PaohP8Lv3YX3aCERcvzLqqJUMxi0kPMGbU0EvszPUQRwJWpowbC
	WVoXtt4BeWggPxlMxP7Dq2S69FHEGMwXSZ1mU8oIxMtM0SGvgxGl9AeMemq0LdISuSqW8tLN50H
	CcF6gwR8dNGBm4JMRsk8P2V/lEJPs6xN5PS/xvKFliRJEZFh9XTSuMVzJv3Bzq0sbXmcRKCBxPZ
	J20zwHj+Y8v2igY4sMZeWTTbHCBQCZAq2xiLjHCQ4Eu
X-Received: by 2002:a17:907:98a:b0:ba5:60e1:2ef2 with SMTP id a640c23a62f3a-bbffcf7eb1dmr762413266b.22.1777995762810;
        Tue, 05 May 2026 08:42:42 -0700 (PDT)
Received: from din-wdei726.dei.uc.pt (gtdei-nat-wdei.dei.uc.pt. [193.136.212.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc3546221b7sm144313766b.25.2026.05.05.08.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 08:42:42 -0700 (PDT)
From: Rodrigo Faria <rodrigofilipefaria@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rodrigo Faria <rodrigofilipefaria@gmail.com>
Subject: [PATCH v2] ALSA: hda/realtek: Add mute LED fixup for HP Pavilion 15-cs1xxx
Date: Tue,  5 May 2026 16:42:28 +0100
Message-ID: <20260505154228.11040-1-rodrigofilipefaria@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new fixup for the mute LED on the HP Pavilion 15-cs1xxx series
using the VREF on NID 0x1b.

The BIOS on these models (tested up to F.32) incorrectly reports
the mute LED on NID 0x18 via DMI OEM strings, which lacks VREF
capabilities. This fixup overrides the LED pin to the correct
NID 0x1b.

Signed-off-by: Rodrigo Faria <rodrigofilipefaria@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index a9cd03bb7..ebb353a9e 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -1669,6 +1669,20 @@ static void alc295_fixup_hp_mute_led_coefbit11(struct hda_codec *codec,
 	}
 }
 
+/* Override wrong pin to NID 0x1b (F.32 BIOS reports 0x18 via DMI OEM string)
+ * on HP pavilion 15-cs1xxx laptops */
+static void alc295_fixup_hp_pavilion_mute_led_1b(struct hda_codec *codec,
+						 const struct hda_fixup *fix,
+						 int action)
+{
+	struct alc_spec *spec = codec->spec;
+
+	alc269_fixup_hp_mute_led(codec, fix, action);
+
+	if (action == HDA_FIXUP_ACT_PRE_PROBE)
+		spec->mute_led_nid = 0x1b;
+}
+
 static void alc233_fixup_lenovo_coef_micmute_led(struct hda_codec *codec,
 				const struct hda_fixup *fix, int action)
 {
@@ -3857,6 +3871,7 @@ enum {
 	ALC290_FIXUP_SUBWOOFER,
 	ALC290_FIXUP_SUBWOOFER_HSJACK,
 	ALC295_FIXUP_HP_MUTE_LED_COEFBIT11,
+	ALC295_FIXUP_HP_PAVILION_MUTE_LED_1B,
 	ALC269_FIXUP_THINKPAD_ACPI,
 	ALC269_FIXUP_LENOVO_XPAD_ACPI,
 	ALC269_FIXUP_DMIC_THINKPAD_ACPI,
@@ -5700,6 +5715,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc295_fixup_hp_mute_led_coefbit11,
 	},
+	[ALC295_FIXUP_HP_PAVILION_MUTE_LED_1B] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc295_fixup_hp_pavilion_mute_led_1b,
+	},
 	[ALC298_FIXUP_SAMSUNG_AMP] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc298_fixup_samsung_amp,
@@ -6907,6 +6926,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8548, "HP EliteBook x360 830 G6", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x854a, "HP EliteBook 830 G6", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x85c6, "HP Pavilion x360 Convertible 14-dy1xxx", ALC295_FIXUP_HP_MUTE_LED_COEFBIT11),
+	SND_PCI_QUIRK(0x103c, 0x856a, "HP Pavilion 15-cs1xxx", ALC295_FIXUP_HP_PAVILION_MUTE_LED_1B),
 	SND_PCI_QUIRK(0x103c, 0x85de, "HP Envy x360 13-ar0xxx", ALC285_FIXUP_HP_ENVY_X360),
 	SND_PCI_QUIRK(0x103c, 0x8603, "HP Omen 17-cb0xxx", ALC285_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x860c, "HP ZBook 17 G6", ALC285_FIXUP_HP_GPIO_AMP_INIT),
-- 
2.54.0

