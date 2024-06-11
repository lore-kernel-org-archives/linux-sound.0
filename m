Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12FBF14A96
	for <linux-sound@vger.kernel.org>; Tue, 11 Jun 2024 18:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718131002; cv=none; b=RLPpQzzS8cmJkL2gVYqezJtUQw7memFkzBb5n7xl6WvMt3gjh8jj6sLwflvwpWMU/Jjhgr5C8HAgl/g+43E2wWlAjjIwlOhj24I5BEYCSaKp+m/EZSe28pUoqyPm/FYbkRTbsrhAlbR+inqanHLkX7eG10W1Tlvb5iyHHeCMNPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718131002; c=relaxed/simple;
	bh=7QFGps/dQUJXiZvpwN7CTpJGyuguFJBanIuBJqqhE7I=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=XeHIID9HBdizHDsrIl6uhtsknP4uLsDaLD2WYD24Uu5y0rf/qrgtPvurWtM/QwM0omwkAsaTqXMdQuywyXOtf6Sry6ECyMJj4DrSzf9VU003uS959XySLxV9kzYL3TvULtVp4Bd4WDa74FepWcCGWv5xSf2482d4/RCCa9Fiqd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ucxm11yd; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ucxm11yd"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52c8ddc2b29so1827455e87.3
        for <linux-sound@vger.kernel.org>; Tue, 11 Jun 2024 11:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718130999; x=1718735799; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oFiDp8vILhHoQ5s8/TZjRlixSE3lFpHdalM24PZAY3I=;
        b=Ucxm11ydCE63whvXnkyfIffLHHGWbR4Bak45W8Z4UUXcDp2t8/GJUpYxkoOt9ts5kG
         Fbk+Vo52GDGGBj8ciRJEG3yI0crYULfattaNERHt4U0zu8fXHEp5ztEn+sW2FvSOtRVa
         EOS/952JJtAor3wGE/fwUyYCdFoHIecfTEovOzfLxuAjkI6bFfqQOjSE0mTv68oOySeS
         vLB2CN/T6RJMIJVQMy+OSiW6KE82Ip3jaZJISSX3qqwnVUqKBJmy3bb3JaNcQwCjeG+J
         HjXWlh0yBnnJzYbx8dcaTIu/0xf4+TUfp+QeZ06J/BfRkrWxqPzzVx5v2jTR8aGn025h
         4jlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718130999; x=1718735799;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oFiDp8vILhHoQ5s8/TZjRlixSE3lFpHdalM24PZAY3I=;
        b=UYxVRWJwsZD+d5/oM/SoJz63WtPHt2MRs/55S9kO7sv46x5WDLMkZ9rZTWSiou19GD
         iL+12lxY7cM1L+c0mc3R1Ed7my3w4pde7NyOrJ0nG5lPjlBYLnm2flwDTzemoMZYU4iv
         ZRPeHNMZOqBWwhjxf565ofaobS+IZzuzrVm7yRrf8j54Nd/+UXwKWVP2t1nCzybt19qQ
         F19dH5nz0IX7Fk9jC52MKYCsTWA2nH6XmgloIZfGYPjOBfybR6pLu+Uhn0Zifdi9PU+z
         CNoOvLYvv/KUTe5vOhRMBVD7wXDzorU8wPXB12TMFz9Ci4+xZ+pvwz32QNsfKptN5v92
         RPSQ==
X-Gm-Message-State: AOJu0YxCStvR5ugWyRhJMDJj/ky6P27AzhBv5yJdz37caFdy3jD47oe/
	X/e+5yVWWDsqh1fIuNai8W8QB6bQYAyJ7CP8Lxemh6L4GIvZQwN1
X-Google-Smtp-Source: AGHT+IH4JD+bZ/zrVioxXSnESUn8Bs5DWHkCqfKTbYYhsdb6tL+6RaJK7Q1TKvcFQzkUiCOOP5tmRg==
X-Received: by 2002:ac2:4d1b:0:b0:51a:f689:b4df with SMTP id 2adb3069b0e04-52bb9fc943bmr8842496e87.44.1718130998836;
        Tue, 11 Jun 2024 11:36:38 -0700 (PDT)
Received: from ?IPV6:2001:4c4e:2a20:8400:c516:1ba4:840e:c62d? (20014C4E2A208400C5161BA4840EC62D.dsl.pool.telekom.hu. [2001:4c4e:2a20:8400:c516:1ba4:840e:c62d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4224385670fsm38170815e9.16.2024.06.11.11.36.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jun 2024 11:36:38 -0700 (PDT)
Message-ID: <a9d59988-da7f-4a53-8df1-3b6a7e6d24b7@gmail.com>
Date: Tue, 11 Jun 2024 20:36:15 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: =?UTF-8?B?R2VyZ2VseSBNw6lzesOhcm9z?= <meszaros.gergely97@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Lenovo Yoga Pro 7 14ARP8
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Similarly to other Lenovo laptops these also have a dual speaker
setup with a shared amplifier.
The model also seems to have a conflicting PCI SSID with the codec SSID for
the Legion Y9000X 2022 IAH7. Only tested on the Yoga Pro 7, as I don't have
access to the other laptop.

Signed-off-by: Gergely Meszaros <meszaros.gergely97@gmail.com>
---
  sound/pci/hda/patch_realtek.c | 28 +++++++++++++++++++++++++++-
  1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index aa76d1c88589..ddafe533ec11 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7520,6 +7520,8 @@ enum {
  	ALC285_FIXUP_ASUS_GU605_SPI_SPEAKER2_TO_DAC1,
  	ALC287_FIXUP_LENOVO_THKPAD_WH_ALC1318,
  	ALC256_FIXUP_CHROME_BOOK,
+	ALC287_FIXUP_YOGA_PRO_7_14ARP8,
+	ALC287_FIXUP_YOGA_PRO_7_14ARP8_BOTH_SPK_TO_DAC2,
  };
  
  /* A special fixup for Lenovo C940 and Yoga Duet 7;
@@ -7559,6 +7561,21 @@ static void alc287_fixup_lenovo_14irp8_duetitl(struct hda_codec *codec,
  	__snd_hda_apply_fixup(codec, id, action, 0);
  }
  
+/* Similar to above the Lenovo Yoga Pro 7 14ARP8 PCI SSID matches the codec SSID of the
+   Legion Y9000X 2022 IAH7.*/
+static void alc287_fixup_yoga_pro_7_14arp8(struct hda_codec *codec,
+					   const struct hda_fixup *fix,
+					   int action)
+{
+	int id;
+
+	if (codec->core.subsystem_id == 0x17aa386e)
+		id = ALC287_FIXUP_CS35L41_I2C_2; /* Legion Y9000X 2022 IAH7 */
+	else
+		id = ALC287_FIXUP_YOGA_PRO_7_14ARP8_BOTH_SPK_TO_DAC2; /* Yoga Pro 7 14ARP8 */
+	__snd_hda_apply_fixup(codec, id, action, 0);
+}
+
  /* Another hilarious PCI SSID conflict with Lenovo Legion Pro 7 16ARX8H (with
   * TAS2781 codec) and Legion 7i 16IAX7 (with CS35L41 codec);
   * we apply a corresponding fixup depending on the codec SSID instead
@@ -9658,6 +9675,14 @@ static const struct hda_fixup alc269_fixups[] = {
  		.chained = true,
  		.chain_id = ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK,
  	},
+	[ALC287_FIXUP_YOGA_PRO_7_14ARP8] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc287_fixup_yoga_pro_7_14arp8,
+	},
+	[ALC287_FIXUP_YOGA_PRO_7_14ARP8_BOTH_SPK_TO_DAC2] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc289_fixup_asus_ga401,
+	},
  	[ALC287_FIXUP_YOGA9_14IMH9_BASS_SPK_PIN] = {
  		.type = HDA_FIXUP_FUNC,
  		.v.func = alc287_fixup_yoga9_14iap7_bass_spk_pin,
@@ -10516,7 +10541,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
  	SND_PCI_QUIRK(0x17aa, 0x3865, "Lenovo 13X", ALC287_FIXUP_CS35L41_I2C_2),
  	SND_PCI_QUIRK(0x17aa, 0x3866, "Lenovo 13X", ALC287_FIXUP_CS35L41_I2C_2),
  	SND_PCI_QUIRK(0x17aa, 0x3869, "Lenovo Yoga7 14IAL7", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
-	SND_PCI_QUIRK(0x17aa, 0x386e, "Legion Y9000X 2022 IAH7", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x17aa, 0x386e, "Legion Y9000X 2022 IAH7 / Yoga Pro 7 14ARP8",  ALC287_FIXUP_YOGA_PRO_7_14ARP8),
  	SND_PCI_QUIRK(0x17aa, 0x386f, "Legion Pro 7/7i", ALC287_FIXUP_LENOVO_LEGION_7),
  	SND_PCI_QUIRK(0x17aa, 0x3870, "Lenovo Yoga 7 14ARB7", ALC287_FIXUP_YOGA7_14ARB7_I2C),
  	SND_PCI_QUIRK(0x17aa, 0x3877, "Lenovo Legion 7 Slim 16ARHA7", ALC287_FIXUP_CS35L41_I2C_2),
@@ -10791,6 +10816,7 @@ static const struct hda_model_fixup alc269_fixup_models[] = {
  	{.id = ALC285_FIXUP_HP_ENVY_X360, .name = "alc285-hp-envy-x360"},
  	{.id = ALC287_FIXUP_IDEAPAD_BASS_SPK_AMP, .name = "alc287-ideapad-bass-spk-amp"},
  	{.id = ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN, .name = "alc287-yoga9-bass-spk-pin"},
+	{.id = ALC287_FIXUP_YOGA_PRO_7_14ARP8_BOTH_SPK_TO_DAC2, .name = "alc287-yoga-pro-7-both-spk-to-dac2"},
  	{.id = ALC623_FIXUP_LENOVO_THINKSTATION_P340, .name = "alc623-lenovo-thinkstation-p340"},
  	{.id = ALC255_FIXUP_ACER_HEADPHONE_AND_MIC, .name = "alc255-acer-headphone-and-mic"},
  	{.id = ALC285_FIXUP_HP_GPIO_AMP_INIT, .name = "alc285-hp-amp-init"},
-- 
2.45.2
