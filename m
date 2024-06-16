Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FDC61FF0
	for <linux-sound@vger.kernel.org>; Sun, 16 Jun 2024 08:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718527990; cv=none; b=rlX3fouE37raR2x8EB8tDPfM6iAuQZ92D3K9O7aXxK6RMJEXe0DCYiV36kECaBbiuWLvgUik89ewdUR+WR11tKchzEsuXkJbWqflTyhvszrRqtpW9YW5EwXvN6SXiW32C9BhXGc4H0GHaUJVf/KYmKLd5SN9X1funCiDpO7LwRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718527990; c=relaxed/simple;
	bh=7diifNYf+KW6aDSwiDqBnsWXRQS2wQfJ53heDZFRqcE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q9oKaB/mbzGtFNDpcVFf1P/XE/nNM0PYtLQR0IZG/vR0xZtwdJXzzyQ8arJuTeUsHbu3xLJToCD/25vtD1GRotnSDgsD0G/uSHvy0xgxb4xKsOFFhQsx2WajWEX9Ol3a9Fq12mjA7lA1fp4qZQFOK/Kqq2Io9BUXKZu1W/OerMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GNHHRmZg; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GNHHRmZg"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52b7e693b8aso3981211e87.1
        for <linux-sound@vger.kernel.org>; Sun, 16 Jun 2024 01:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718527987; x=1719132787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wq3w/tLNAWkt1g+/aHgnJUxU1edQyiaJclqKFvj2QmY=;
        b=GNHHRmZgAhtTfutnN7+SAYZ6YZTR1PA86D+FXDuLGB9zI9NE7Gsg3jh1wfaK+pHbeO
         KVOW03XRppm2NQMGSn+honY1nmhSH/wroHtz81/8a8vw1BvXYVeiHIkd2KoqKvoO3/kR
         On3ZMWqWUBanwsD6xM36cXx1x0rHQC6E/ijFGWgCO1hfczTvCZC2ErSpTPDN5AtBWGXb
         wfGd3lMWMkqP32AV0c/33wXfZT/e8k65Tcda1cVI82HMF1B0bpxhvTO7RmML91PbwZ/3
         LnsESjecBdGboIgQ1pJXTmU8waAVGayy6yowAbHAs0K4I4dV6F8xf9I5Og11PuOzjuyV
         oBBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718527987; x=1719132787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wq3w/tLNAWkt1g+/aHgnJUxU1edQyiaJclqKFvj2QmY=;
        b=RceD/cZ4v1MfBdLTtUspE0XA3BvPTxqKrpChXZ4cmwmecPiL+tUSB1/pwqbYo6j0Xw
         ZUvokLX5vu6lSwuhP/BJqj45dERphVmspbVqLSTptfO06mGA6qQFDF9NCXCxs0zYx44L
         ze9DeOV4ihiinmV+v1nZ6QKfu6aqWpPzvCrI8h70BISPuq0wBRML5R3l5H/hhW95gk4N
         jDOZX7v7M9gFoGk1rz4SzUZmw9Fm+x+XsA6EJV60RjjhKCX0DlI+C5mC57Y261n+4YKL
         o/QQ3CJBUgxZYlzJatUc9oHCpFxsekdiolaicrDoPuG/SX8zNhXmKCvA5yW/iMhyXnEp
         ikpw==
X-Gm-Message-State: AOJu0YxiXS0TNw9LNmxwY8er4IhZ1BX3lJapQd655NqOCPU+pkBxe7pa
	SDSPbKWPMUGfXmuQt69oj4TaixxqlnmOlIH4IKr2K86WwRYge4eo
X-Google-Smtp-Source: AGHT+IGdMuYHFwQK3eAWDwoUa643Z+HjrBZahHz4Z5smSbVQGMCBrNH+CRVDevInakQyXGAG7PZ4hQ==
X-Received: by 2002:a19:8c12:0:b0:52c:8906:4415 with SMTP id 2adb3069b0e04-52ca020e576mr2581298e87.1.1718527986840;
        Sun, 16 Jun 2024 01:53:06 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a312:c7bd:9500::4f84])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec05bf422dsm10390251fa.21.2024.06.16.01.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jun 2024 01:53:06 -0700 (PDT)
From: Gergely Meszaros <meszaros.gergely97@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Gergo Koteles <soyer@irl.hu>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2 RESEND] ALSA: hda/realtek: Add quirk for Lenovo Yoga Pro 7 14ARP8
Date: Sun, 16 Jun 2024 10:52:33 +0200
Message-ID: <20240616085233.16922-1-meszaros.gergely97@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Similarly to other Lenovo laptops these also have a dual speaker
setup with a shared amplifier.
The model also seems to have a conflicting PCI SSID with the codec SSID for
the Legion Y9000X 2022 IAH7. Only tested on the Yoga Pro 7, as I don't have
access to the other laptop.

Signed-off-by: Gergely Meszaros <meszaros.gergely97@gmail.com>
---
V1 -> V2: Use existing ALC285_FIXUP_SPEAKER2_TO_DAC1 instead of ALC287_FIXUP_YOGA_PRO_7_14ARP8_BOTH_SPK_TO_DAC2.
          Include legion IAH7 in fixup and function name.

Resend with git-send-email, to not mangle line-breaks.

 sound/pci/hda/patch_realtek.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 79736c8782a3..78ab48c16b88 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7520,6 +7520,7 @@ enum {
 	ALC285_FIXUP_ASUS_GU605_SPI_SPEAKER2_TO_DAC1,
 	ALC287_FIXUP_LENOVO_THKPAD_WH_ALC1318,
 	ALC256_FIXUP_CHROME_BOOK,
+	ALC287_FIXUP_LENOVO_14ARP8_LEGION_IAH7,
 };
 
 /* A special fixup for Lenovo C940 and Yoga Duet 7;
@@ -7559,6 +7560,21 @@ static void alc287_fixup_lenovo_14irp8_duetitl(struct hda_codec *codec,
 	__snd_hda_apply_fixup(codec, id, action, 0);
 }
 
+/* Similar to above the Lenovo Yoga Pro 7 14ARP8 PCI SSID matches the codec SSID of the
+   Legion Y9000X 2022 IAH7.*/
+static void alc287_fixup_lenovo_14arp8_legion_iah7(struct hda_codec *codec,
+					   const struct hda_fixup *fix,
+					   int action)
+{
+	int id;
+
+	if (codec->core.subsystem_id == 0x17aa386e)
+		id = ALC287_FIXUP_CS35L41_I2C_2; /* Legion Y9000X 2022 IAH7 */
+	else
+		id = ALC285_FIXUP_SPEAKER2_TO_DAC1; /* Yoga Pro 7 14ARP8 */
+	__snd_hda_apply_fixup(codec, id, action, 0);
+}
+
 /* Another hilarious PCI SSID conflict with Lenovo Legion Pro 7 16ARX8H (with
  * TAS2781 codec) and Legion 7i 16IAX7 (with CS35L41 codec);
  * we apply a corresponding fixup depending on the codec SSID instead
@@ -9658,6 +9674,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK,
 	},
+	[ALC287_FIXUP_LENOVO_14ARP8_LEGION_IAH7] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc287_fixup_lenovo_14arp8_legion_iah7,
+	},
 	[ALC287_FIXUP_YOGA9_14IMH9_BASS_SPK_PIN] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc287_fixup_yoga9_14iap7_bass_spk_pin,
@@ -10520,7 +10540,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3865, "Lenovo 13X", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x3866, "Lenovo 13X", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x3869, "Lenovo Yoga7 14IAL7", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
-	SND_PCI_QUIRK(0x17aa, 0x386e, "Legion Y9000X 2022 IAH7", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x17aa, 0x386e, "Legion Y9000X 2022 IAH7 / Yoga Pro 7 14ARP8",  ALC287_FIXUP_LENOVO_14ARP8_LEGION_IAH7),
 	SND_PCI_QUIRK(0x17aa, 0x386f, "Legion Pro 7/7i", ALC287_FIXUP_LENOVO_LEGION_7),
 	SND_PCI_QUIRK(0x17aa, 0x3870, "Lenovo Yoga 7 14ARB7", ALC287_FIXUP_YOGA7_14ARB7_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x3877, "Lenovo Legion 7 Slim 16ARHA7", ALC287_FIXUP_CS35L41_I2C_2),
-- 
2.45.2

