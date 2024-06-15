Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF52171CD
	for <linux-sound@vger.kernel.org>; Sat, 15 Jun 2024 19:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718480879; cv=none; b=IpQCs9roWtVqMSh51XO5vW2k/ol3f6f9skFcDenWK9CI12w2Taw+zVSZUafzoQyZwOh5hLULHkFXwfUIiCB/nmYWYKWzM0q2x9Q/JaggK0F3JI7+Ij0T8YhIIEqug923RV9Gja/SEaUEmmIDogeGv+jeg1uURBNSr4sb6I+6O2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718480879; c=relaxed/simple;
	bh=42b2noIdCB+qURk9Vdw2P3b3BL/qJaLKtsNpvw9FdNs=;
	h=Message-ID:Date:MIME-Version:From:To:Cc:Subject:Content-Type; b=sEtkX4AGeA5Ppvz1rR+ygy6+0mf8FistwKLqC/L5tlJSBoVRxIkVJYzyL1mL7MTIQErQ4gbcQrO5NCUNl4uSpk1OPtCrPu1ABlcqodaBqJYjRizcHf7vlLMEFD0aDG9Pttlka3GKDLp2VBPKhCw6YcYqSXusiIR70Ns7XHzB/eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mrum3Kc7; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mrum3Kc7"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a6f176c5c10so382882666b.2
        for <linux-sound@vger.kernel.org>; Sat, 15 Jun 2024 12:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718480876; x=1719085676; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:cc:to:content-language:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dolEz+fDUwzcwVHGdH7SLJCbD1WzCsbBL7fWgh1egjY=;
        b=mrum3Kc7OzSx6oIlKrjcMMI33TMhwWOT9ch64r75nvO6kSQXqhpmZBejwBaQpgToko
         jqCs+KBjOnKB/ntYdTdDbxeFGQGtF3TlYJeZzUbDIHtXoPUgrJC3uQjG+kJURrD/ID8k
         eyivc2VYfCy5jyT95AvIluTdGpJWzAxXajwcDbYItXKCOVDRoVeOjOCRhBr/ZH/Lee4K
         zvii3fnG0CgNNH2JOVoLTtgqYmnMkdh8Xiyfir6FJO8mDS/jiewS3lgMohJTYRYLkYcF
         ecIKpiFoiDxbI/lShdPzpEkdvEmooQv38k2C2cKd0x25FljieBp/Qwth0I6L05yBCFFf
         xFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718480876; x=1719085676;
        h=content-transfer-encoding:subject:cc:to:content-language:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dolEz+fDUwzcwVHGdH7SLJCbD1WzCsbBL7fWgh1egjY=;
        b=Gv9ozdXE8wtQrS6KfYsf+alqF3jZj2DH5t0xZ7kEvBOaPMAjiFGhnw4zfODRLGUV8N
         LISWVMTIjHWJpLAsC2KJr3pGncpRNiIaRiNIJbtbIgXRb52AlEw3aZooOKMzAdLOAM/1
         lMxNBaFn/ya139ZihjFaxEqyGrgQyqp0Bbp8pdsLJIJoxCKI4JwGochmLVk3Z30eE4OH
         Pl81IXQydFfNuIVmvi/olYw/Kwilsab+L5hoa+0wQsuPCipudAkmAZ5PlVke63KIFCqM
         Eb/IrhbpN1BZT6jeUVPGx3FWN9KnphVsyvHIpCn85xm74/hFFGYFepxy6NojaNVqAYlA
         meWQ==
X-Gm-Message-State: AOJu0Yw6RdLu2spOuqKWYcxfFDC+MuHQSrwgpXi3uWWgo8+3dypd6xGl
	kuLS7yANlzNBU3qPvczai91M8K7aKsktFXg1VuwbIUOVV5RCbvL/F3L6ToCh5CA=
X-Google-Smtp-Source: AGHT+IGxE07kEgAKREizSQfSZYMeYC6HreHI2lZtxlP3EmdDje/L5M+GuIMHc7sbQVu2vb8Jo990Ug==
X-Received: by 2002:a17:906:d104:b0:a6f:51d5:ef0d with SMTP id a640c23a62f3a-a6f60dc7ffcmr402850566b.60.1718480875590;
        Sat, 15 Jun 2024 12:47:55 -0700 (PDT)
Received: from ?IPV6:2a02:a312:c7bd:9500::4f84? ([2a02:a312:c7bd:9500::4f84])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f42bc6sm330707266b.167.2024.06.15.12.47.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Jun 2024 12:47:55 -0700 (PDT)
Message-ID: <c4a9dc00-880f-4d46-88db-c49b85de177f@gmail.com>
Date: Sat, 15 Jun 2024 21:47:28 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?B?R2VyZ2VseSBNw6lzesOhcm9z?= <meszaros.gergely97@gmail.com>
Content-Language: en-US
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2] ALSA: hda/realtek: Add quirk for Lenovo Yoga Pro 7 14ARP8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

 From fbcfdec1bc4789f5fb5436c80fb7c085bd060dc0 Mon Sep 17 00:00:00 2001
From: Gergely Meszaros <meszaros.gergely97@gmail.com>
Date: Sat, 15 Jun 2024 21:29:39 +0200
Subject: [PATCH v2] ALSA: hda/realtek: Add quirk for Lenovo Yoga Pro 7 14ARP8

Similarly to other Lenovo laptops these also have a dual speaker
setup with a shared amplifier.
The model also seems to have a conflicting PCI SSID with the codec SSID for
the Legion Y9000X 2022 IAH7. Only tested on the Yoga Pro 7, as I don't have
access to the other laptop.

Signed-off-by: Gergely Meszaros <meszaros.gergely97@gmail.com>
---
V1 -> V2: Use existing ALC285_FIXUP_SPEAKER2_TO_DAC1 instead of ALC287_FIXUP_YOGA_PRO_7_14ARP8_BOTH_SPK_TO_DAC2.
           Include legion IAH7 in fixup and function name.

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
