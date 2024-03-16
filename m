Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76B810940
	for <linux-sound@vger.kernel.org>; Sat, 16 Mar 2024 09:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710582210; cv=none; b=rVzTwz5UWkRQRM1TtodqfoX+fyP7pMJYRzIRP6QxJfTxVFcsesJVjB6wBRMiGLd2a+ruwYlSppRr6Tq1/OAOnqGkFEHMzsXZWmbtBfJtI0oaWvVI6c2/gV2msZacGqa8Tlp1y2CDCTI8I0AGm3mR+m4bHam+QRL+GFkhe5sjAD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710582210; c=relaxed/simple;
	bh=4wRJFN6IXBfIiauJKNPViO/VAlzpwd79IT7rJ8dvJv0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ch81dZ4H4OFu0vWLlZab9PpB3fo0CYGRsIUbLzTzLJ91g7QftzM2HgpbuJ/3hMJ4eVSku6gDH2tLeKOnKLfP3nGI3im5olzqxo5PaIqRU9r/Mp7iHmAEnM/Z6xFALXkrBfMYuF7cQORKc0IMlIWx8dHjgn9z5GfFlGMuED5SMs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fqRKh/Le; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fqRKh/Le"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-513d3e57518so2782380e87.3
        for <linux-sound@vger.kernel.org>; Sat, 16 Mar 2024 02:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710582207; x=1711187007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aXpQc7xpGdduCJ7w/YzFGyfHXDRiwkRakFMzzDur64Q=;
        b=fqRKh/Le4WMuZG6eRy4AHOfeTQ0Qoj0yL3OEDDgTq5vJsPMH/CK9fI0TQg8T5ML/HQ
         t/qgxC4/am0Gh7xfDnzx+4VP6p4qkf+YXA9e7x49dg2KQSoJDdpvYp8RChBQg3R661AD
         3SKp3XbJScFqxPGwglZOxADDzM7fw3sXkqJpBB2otYPEzoz3z+S5GBqNdVUheqF/eAp+
         5QwfIxO+WFjWoOFS6W9+j386SJTx92o5iBBHmO4fihQWJrvUqyVqTXnbL+6nqosOsypW
         EB0RqheeGnCQvm2xgWegsGUJHIY7s/7hHsZRYAEA2cagVmomPis8vzzG4D5LDWNpI5Pg
         KtuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710582207; x=1711187007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aXpQc7xpGdduCJ7w/YzFGyfHXDRiwkRakFMzzDur64Q=;
        b=d7omGCCF5cf2TzwmUzEvngbUg0O0SWjZjlONdU5N2l/VbfUWikSHn+F/qEN7dvXDLl
         H1leJU/69L8cZmT690cRZBnim7T+nSYrHnEY9L86049NvfisGLANKsqfVxdbvGdDb7XP
         a+wwvs/cpdMc9+DERiuK52CGrteA2RYwtnOG5+jh1fSJKoVqzdIlGXke2xyaTSliXVhs
         qtR7MQmRW7pv9FmpjpJSRvFztEkir0OJe93gh14bGXqUQzbZYdy8rWjgmht9HwhfXCYn
         hb9grx9rGrE8Vqvp+CUeX979UHGZgweSmahczVCVuakf9UBWAVhkG4csZtmSfscGpUpg
         VrUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNp0ihjiQWqxcgiqoO+vr6oYiIIOfeJHrcAXpEzHexfovnq2s+eWaOCsHgGtRRrCm45a+51wtt8IF51MVsLGezgi2CHRVTmhOGQXo=
X-Gm-Message-State: AOJu0Yytdkt+MVeL/GUCBaWU9fv5zpZVxb6NhY5ao4Cz8C2Q7Xm7FqEn
	a+Il9k8gqnq6W6W4EEp1zyf48rBE49G2J1yLiCCZZYTsgU7Db2XEZhUI2RsN
X-Google-Smtp-Source: AGHT+IGmyz/fcATvO+Tv2wCPoiXnHeamAhSlCJnPcXEq1U9ZXUP7l48mVQVvnhmTmMaFDRW7GdnKeQ==
X-Received: by 2002:ac2:4acd:0:b0:513:cf5a:f872 with SMTP id m13-20020ac24acd000000b00513cf5af872mr4321013lfp.69.1710582206718;
        Sat, 16 Mar 2024 02:43:26 -0700 (PDT)
Received: from localhost.localdomain (51-171-224-185-dynamic.agg7.kby.lmk-mlw.eircom.net. [51.171.224.185])
        by smtp.googlemail.com with ESMTPSA id l21-20020a056000023500b0033ec312cd8asm5068843wrz.33.2024.03.16.02.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Mar 2024 02:43:26 -0700 (PDT)
From: Ian Murphy <iano200@gmail.com>
To: tiwai@suse.com
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	Ian Murphy <iano200@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: add in quirk for Acer Swift Go 16 - SFG16-71
Date: Sat, 16 Mar 2024 09:41:57 +0000
Message-ID: <20240316094157.13890-1-iano200@gmail.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Keyboard has an LED that is ON/OFF when mic is muted/active
 - LED is controlled by GPIO pin
 - Patch enables led to appear in /sys/class/leds/ as hda::micmute
 - Enables LED when mic is MUTED
 - Disables LED when mic is active

Signed-off-by: Ian Murphy <iano200@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index a91d5ec29bfb..05c685485606 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6891,6 +6891,13 @@ static void yoga7_14arb7_fixup_i2c(struct hda_codec *cdc,
 	comp_generic_fixup(cdc, action, "i2c", "INT8866", "-%s:00", 1);
 }
 
+static void alc256_fixup_acer_sfg16_micmute_led(struct hda_codec *codec,
+			       const struct hda_fixup *fix, int action)
+{
+       alc_fixup_hp_gpio_led(codec, action, 0, 0x04);
+}
+
+
 /* for alc295_fixup_hp_top_speakers */
 #include "hp_x360_helper.c"
 
@@ -7374,6 +7381,7 @@ enum {
 	ALC289_FIXUP_DELL_CS35L41_SPI_2,
 	ALC294_FIXUP_CS35L41_I2C_2,
 	ALC245_FIXUP_CS35L56_SPI_4_HP_GPIO_LED,
+	ALC256_FIXUP_ACER_SFG16_MICMUTE_LED,
 };
 
 /* A special fixup for Lenovo C940 and Yoga Duet 7;
@@ -9569,6 +9577,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC285_FIXUP_HP_GPIO_LED,
 	},
+	[ALC256_FIXUP_ACER_SFG16_MICMUTE_LED] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc256_fixup_acer_sfg16_micmute_led,
+	},
 };
 
 static const struct snd_pci_quirk alc269_fixup_tbl[] = {
@@ -9612,6 +9624,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1025, 0x1430, "Acer TravelMate B311R-31", ALC256_FIXUP_ACER_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1025, 0x1466, "Acer Aspire A515-56", ALC255_FIXUP_ACER_HEADPHONE_AND_MIC),
 	SND_PCI_QUIRK(0x1025, 0x1534, "Acer Predator PH315-54", ALC255_FIXUP_ACER_MIC_NO_PRESENCE),
+	SND_PCI_QUIRK(0x1025, 0x169a, "Acer Swift SFG16", ALC256_FIXUP_ACER_SFG16_MICMUTE_LED),
 	SND_PCI_QUIRK(0x1028, 0x0470, "Dell M101z", ALC269_FIXUP_DELL_M101Z),
 	SND_PCI_QUIRK(0x1028, 0x053c, "Dell Latitude E5430", ALC292_FIXUP_DELL_E7X),
 	SND_PCI_QUIRK(0x1028, 0x054b, "Dell XPS one 2710", ALC275_FIXUP_DELL_XPS),
-- 
2.44.0

