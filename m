Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4AD3FD4
	for <linux-sound@vger.kernel.org>; Sun, 17 Mar 2024 02:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710643122; cv=none; b=l6KZ6X3Y44eJ3BG/LQbsD993qbjCMjEV7taFqlynIHEtnLZy6SIwXpjDB5btsmD/W9dGAEfubMwJJd2U8ZvccTbVFk2P/hxBycnC5ZNa1AijCnhdqKY2oCISA/SYUZ4DxyejETjxwy6RuEL4IwlM/6WZPnR8YDMHexQ8l1OKHJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710643122; c=relaxed/simple;
	bh=9JsNszUhjq7XBumKKKI8DjfPFMpOh8JnJfiaAK0yuY0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=VHn12URtdtUCEGSSaJsJ1pa7aO2rEo5z4j8ICmpUGPRDoURv1BMpfQ8W6fSM9taVoXhcWVpv/jxi5lMpyMZcMAASFsLYxlndcI3mhhuveqgmO7MJheMCQcOBflwF+B1KKs0qBu8l1vVmxFdGFj2l9MbDmlUEU0AfdjMfhIXUWdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cpp.in; spf=none smtp.mailfrom=cpp.in; dkim=pass (2048-bit key) header.d=cpp-in.20230601.gappssmtp.com header.i=@cpp-in.20230601.gappssmtp.com header.b=Th8mLzQO; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cpp.in
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cpp.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cpp-in.20230601.gappssmtp.com header.i=@cpp-in.20230601.gappssmtp.com header.b="Th8mLzQO"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6e6fb9a494aso1230384b3a.0
        for <linux-sound@vger.kernel.org>; Sat, 16 Mar 2024 19:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cpp-in.20230601.gappssmtp.com; s=20230601; t=1710643118; x=1711247918; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=03U7Qtxt/xEmViDJ3aib552PLwYMbGB+bOLA5+IeBuA=;
        b=Th8mLzQOPT8RYk+khnbb1EIHL3IIhh8w6CPcgVNTcEPg+E9nQcrQx0xynyDVIHKHAe
         FgYNp+XRTa80W8GW6tdxXmucADGL8tPDQs5DLuVtfnSTY2fpV4xcBOSNTCdkfcKeqkJP
         jhf8/hVjS0xnjBuBmEFvMODwdqRP+7NaHO55hAt6HS3vEUS+J3okrb+gIFAbbFe3RDb8
         BJHHLmhvdzB7rbqM6i3CEm3UHxQhIVrWB//IszU7iGCbRKd/iCNOTwhkGi6U4tF+SWwP
         OzWHYNhTqdpVDsC7OiBYFG741gPtvu8qUUfkM3OC0XfTOCvCEWv1cKHcZjXJgFwiP40N
         vMpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710643118; x=1711247918;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=03U7Qtxt/xEmViDJ3aib552PLwYMbGB+bOLA5+IeBuA=;
        b=aE/3FwsPs7eAWjVkjz9WQwKPItXnDXzx5axaK+wWIT3dAa4pi7mmD46KfVIAoi8jeg
         UWxqI53Uy6sePqzrRXZ6pif8AhT2yqhNbXs+x5bJBJaS7TFzP4w9aEKMWwscOiF9lUd4
         Q41SL8aIn3mP862Q2hmI5Kpz93HsEPGWiAjBBs5PMKmbRQRDpxED74gYVYn+C//Tzhav
         jj042neZPwCkzsWAqhZ5GYNvvTF+L/QtETrAXX47Dg7vPbgo6FNQ044ppLBAF6dGd7Kf
         pH6FIlXlvsioIjatQuPXi65COhKdT4cWcadtd0G/X2q6uQLrqa2teDTsFe/ZXUsNUe2h
         6M1g==
X-Gm-Message-State: AOJu0Yzsyqj3LnFHehUMxO1bBd/5nBffLwxSZgF22nvzqIrs6ZOfycvD
	4e+8agPXuWmzwGmvLcr9laOK8LJs8cNVrYMU373eXcmyh9ofA6nf3J57B4TLf4K7qT4+P2beD1B
	Ag2GD
X-Google-Smtp-Source: AGHT+IEr6GeoJSZUvtLiW0C6i/5pNXu4htOYK7LhG74aW6ReZykiGiWEwNxt3OQZskFwcf++NyLq9Q==
X-Received: by 2002:a17:902:d4d0:b0:1dd:bc31:e9e3 with SMTP id o16-20020a170902d4d000b001ddbc31e9e3mr8700051plg.56.1710643118440;
        Sat, 16 Mar 2024 19:38:38 -0700 (PDT)
Received: from [192.168.3.16] (mx-ll-183.89.30-58.dynamic.3bb.co.th. [183.89.30.58])
        by smtp.gmail.com with ESMTPSA id n8-20020a170902d2c800b001dd47b663eesm6470858plc.56.2024.03.16.19.38.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Mar 2024 19:38:37 -0700 (PDT)
Message-ID: <65d6986c-3152-417b-aa17-543224aca2a8@cpp.in>
Date: Sun, 17 Mar 2024 05:38:35 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Anthony I Gilea <i@cpp.in>
Subject: [PATCH] ALSA: hda/realtek: Add quirk for HP Spectre x360 14 eu0000
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Connect two CS35L41 amps on I2C bus with HDA.
Fix pincfgs.
Fix bass speakers connecting to a wrong DAC.
Fix mute and micmute LEDs.

Signed-off-by: Anthony I Gilea <i@cpp.in>
---
  sound/pci/hda/patch_realtek.c | 38 ++++++++++++++++++++++++++++++++++++++
  1 file changed, 38 insertions(+)

diff --ruNp a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
--- a/sound/pci/hda/patch_realtek.c	2024-03-10 23:38:09.000000000 +0300
+++ b/sound/pci/hda/patch_realtek.c	2024-03-17 03:36:42.305164663 +0300
@@ -7204,6 +7204,38 @@ static void alc_fixup_headset_mic(struct
  	}
  }

+static void alc245_fixup_hp_spectre_x360_eu0xxx(struct hda_codec *codec,
+					  const struct hda_fixup *fix, int action)
+{
+	/*
+	 * The Pin Complex 0x14 for the treble speakers is wrongly reported as
+	 * unconnected.
+	 * The Pin Complex 0x17 for the bass speakers has the lowest association
+	 * and sequence values so shift it up a bit to squeeze 0x14 in.
+	 */
+	static const struct hda_pintbl pincfgs[] = {
+		{ 0x14, 0x90170110 }, // top/treble
+		{ 0x17, 0x90170111 }, // bottom/bass
+		{ }
+	};
+
+	/*
+	 * Force DAC 0x02 for the bass speakers 0x17.
+	 */
+	static const hda_nid_t conn[] = { 0x02 };
+
+	switch (action) {
+	case HDA_FIXUP_ACT_PRE_PROBE:
+		snd_hda_apply_pincfgs(codec, pincfgs);
+		snd_hda_override_conn_list(codec, 0x17, ARRAY_SIZE(conn), conn);
+		break;
+	}
+
+	cs35l41_fixup_i2c_two(codec, fix, action);
+	alc245_fixup_hp_mute_led_coefbit(codec, fix, action);
+	alc245_fixup_hp_gpio_led(codec, fix, action);
+}
+

  enum {
  	ALC269_FIXUP_GPIO2,
@@ -7478,6 +7510,7 @@ enum {
  	ALC2XX_FIXUP_HEADSET_MIC,
  	ALC289_FIXUP_DELL_CS35L41_SPI_2,
  	ALC294_FIXUP_CS35L41_I2C_2,
+	ALC245_FIXUP_HP_SPECTRE_X360_EU0XXX,
  };

  /* A special fixup for Lenovo C940 and Yoga Duet 7;
@@ -9655,6 +9688,10 @@ static const struct hda_fixup alc269_fix
  		.type = HDA_FIXUP_FUNC,
  		.v.func = cs35l41_fixup_i2c_two,
  	},
+	[ALC245_FIXUP_HP_SPECTRE_X360_EU0XXX] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc245_fixup_hp_spectre_x360_eu0xxx,
+	},
  };

  static const struct snd_pci_quirk alc269_fixup_tbl[] = {
@@ -9989,6 +10026,7 @@ static const struct snd_pci_quirk alc269
  	SND_PCI_QUIRK(0x103c, 0x8b96, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
  	SND_PCI_QUIRK(0x103c, 0x8b97, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
  	SND_PCI_QUIRK(0x103c, 0x8bf0, "HP", ALC236_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8c15, "HP Spectre x360 2-in-1 Laptop 14-eu0xxx", ALC245_FIXUP_HP_SPECTRE_X360_EU0XXX),
  	SND_PCI_QUIRK(0x103c, 0x8c46, "HP EliteBook 830 G11", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
  	SND_PCI_QUIRK(0x103c, 0x8c47, "HP EliteBook 840 G11", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
  	SND_PCI_QUIRK(0x103c, 0x8c48, "HP EliteBook 860 G11", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
