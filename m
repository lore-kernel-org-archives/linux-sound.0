Received: from out203-205-221-190.mail.qq.com (out203-205-221-190.mail.qq.com [203.205.221.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D54434BA33
	for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 03:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789528049; cv=none; b=ZNGBfKNoZ50SXFK52Dd5uq2LYc25qNfiJ/cubdq1274lokOHCDlVrxuD7roGFRupgWjHUTL1OwZhrpjfbTAGbwvA6+VVWWgKZfVUMJux1HBjYeTrzEMhuA6BILFloablqBbc8GmvNCgXA3k2FLb4PfgjDhh3eibA173Y83PxO4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789528049; c=relaxed/simple;
	bh=HtgbK894+1C9ov6KoaGdo3wWRIyqdUdBP1QUbqrxGgQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=tW26eucgNupBt0xC6FDDYMF81NdO/iuJvOvAFWIRVc/UH1gFmEklDnVllhm6CLBIQikENjlns45jpc+N/BGU3I/1pzM9SbrCXic0F6f/0D33HE8gLjM5XrttPp2Tdcgl5OfuAjF75jljomrLE5z+WQ3BWbo0AOElCPlcEaXNXyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=Fa09anVn; arc=none smtp.client-ip=203.205.221.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="Fa09anVn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1789528038; bh=nLFdd5IKIh/9QDBamxXGzP1wV2+31djaFoUF76pRFpM=;
	h=Date:From:Subject:To:Cc;
	b=Fa09anVnYCUOvnniZqSMplQZskvYkXx1L8arHIJFq/b/zYv06NPxpjgTydPGu4Vxq
	 klneGyp5WFJBvgC1KO3jFWa69KZeTVHIgW5mdu/UGeD0+xDzz5N2vgZQrgfFmZP+lF
	 Ile0mX9j3Nee+Df3C3VFCzZFcx4KZcl4X4oJoiGE=
Received: from [192.168.0.191] ([14.19.58.198])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id 1802F67D; Wed, 16 Sep 2026 11:06:00 +0800
X-QQ-mid: xmsmtpt1789527960tb1wzdcdm
Message-ID: <tencent_2BCBDB797DA546DC6649A28E1FB5A48B7508@qq.com>
X-QQ-XMAILINFO: OCAZGJrgFcSqUEMRKHdRiwtQBdO9GBUbx50L56gZ2wCaAj1irHLpn/aw1Yp4KI
	 i5b2XiGqO2s4D441yuTfa6RW1lVMVOSUaHJDIDlH88zqY+WLTyCocTB6OEJE28X8Q5BLlHDXw+gp
	 GxGPrdpWRXiwO6bH01Am9w5VcbMahhaJ12vGSCyjj9gPddreG2IPdeAuaIq5mRIuyA9h5a6Rhwfj
	 zzfAGvcAL6gIa9RwtquuoXoo9KkLEjTCzp6UJNFq+zjMwlN+7bkPxCg+x+vnwONDhWiV5mljxWcK
	 wXV5cIM6LGUlhcFMaM0t1+nFOVTNyihG+huuU454uVNmUEUwBzkJczV76016u+rowrR+VTKqZuix
	 QOhqUj4bavsT8es1fshCeanD5Vn5o+HOg1uGJDtr5C7Cx/cyw+MCYeL/8sO4XkjVh4oMFw4VVK+O
	 Bh0oJVLYdvC8M8ByPx21JjWsOApNXzHNq8kX5innt72/Xc9GuVrY74P167bJusX1Tu9YbiLEEfwQ
	 WZFH9ff2kyhNz7UgEiOXyk4yKzQLcH31m3OsFA9FBngwUCz9bshhBl3P2xMn3p5Ne71NaJB18DLk
	 a/cmQEs1gZLc6jbVnTX5CEMerdzJHR4Oni0SrO3ql5gHy3Ojc9Aq2mrqzNLBgfb15GGrGwjM75+x
	 JrW39FY83CKstA7c4+Bc8dn7qP8C1uhDU+/nzpGZPQDQUalzCZEVpa3rcwxU2hg3DtIMcWmaTuvh
	 Lu+JfftcUv1J20lWMKGTb4mJPqW4r7et9FBMjlG0fXbUfSoc1sDDZ7KwGs7g7UWDac2xbxsPP7hQ
	 a10xfD3FAuqVmoaXjnor17qfIXvtmH7YjIXPZL9WsEZf+dDqs5WZGPDouLjXmacC41gSctNs9wjE
	 UVtrJvqOf9UL+9vylS1IQiDMpeLYd+TsY+2RBE9IwyoySB2mlM4vyNCxBeDBTCDInq3GbQq0ZIkt
	 21vJAcAddE2lfYCttkaN+F3P3lIqeqcPaU9Gtr2uP4AHAwgFxyGeRq30AU8UzE
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-OQ-MSGID: <fa1ebdd1-1713-44cb-8453-03265d6e054d@qq.com>
Date: Wed, 16 Sep 2026 11:06:00 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?B?5ZGo5bu65a6H?= <997536907@qq.com>
Subject: [PATCH] ALSA: hda/realtek: Add quirk for IPASON SmartBook S1
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From 09aa2aa6f566f10eb303dfd4731e1776d0a1c96e Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?=E5=91=A8=E5=BB=BA=E5=AE=87?= <997536907@qq.com>
Date: Wed, 16 Sep 2026 10:30:17 +0800
Subject: [PATCH] ALSA: hda/realtek: Add quirk for IPASON SmartBook S1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The internal speaker of the IPASON SmartBook S1 (an Emdoor ODM laptop)
stays silent under Linux, while the Bluetooth audio and the headset
output work fine.  The same machine plays sound under Windows with the
vendor driver, so the hardware and the amplifier are known good.

The BIOS reports the pin default of the actual internal speaker pin
(NID 0x1b) as 0x411111f0, i.e. the default association 0xf, which means
"unconnected".  The pin parser therefore drops that node already at the
pin-configuration time, hence no mixer control is ever created for it
and the pin is never driven, no matter how the output pin 0x14 is set
up.  Enabling 0x1b makes the speaker work immediately.

The existing ALC256_FIXUP_HONOR_MRB_XXX_M1020_AUDIO quirk makes the
speaker work, too, but it additionally rewrites the pins 0x14, 0x19 and
0x1a with Honor-specific values, which creates a bogus "Dock Mic" device
that does not exist on this hardware.  Add a minimal fixup that only
enables 0x1b as the internal speaker.  Touching 0x14 is not needed:
with the pin configuration overridden at runtime, both keeping its BIOS
value (0x90170110) and disabling it (0x411111f0) leave the speaker
working, so 0x1b alone decides the output.

  Codec:       Realtek ALC256 (0x10ec0256), SSID 0x2782:0x0206
  BIOS pincfg: 0x14 0x90170110  0x18 0x411111f0  0x19 0x02a19040
               0x1a 0x411111f0  0x1b 0x411111f0  0x1d 0x4067b945
               0x1e 0x411111f0  0x21 0x02214020

Tested on 7.2.0-1-MANJARO and 6.18.45-1-MANJARO, with both the SOF and
the legacy HDA driver paths.

Signed-off-by: 周建宇 <997536907@qq.com>
---
 sound/hda/codecs/realtek/alc269.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 3abee61..b0b8dea 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -4383,6 +4383,7 @@ enum {
 	ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN_HEADSET,
 	ALC285_LENOVO_DAC_RENAME,
 	ALC287_FIXUP_YOGA9_SPEAKER2_TO_DAC1,
+	ALC256_FIXUP_IPASON_SMARTBOOK_S1,
 };
 
 /* A special fixup for Lenovo C940 and Yoga Duet 7;
@@ -7129,6 +7130,13 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC287_FIXUP_TXNW2781_I2C,
 	},
+	[ALC256_FIXUP_IPASON_SMARTBOOK_S1] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x1b, 0x90170110 },	/* the real internal speaker */
+			{ }
+		},
+	},
 };
 
 static const struct hda_quirk alc269_fixup_tbl[] = {
@@ -8345,6 +8353,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x2014, 0x800a, "Positivo ARN50", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
 	SND_PCI_QUIRK(0x2039, 0x0001, "Inspur S14-G1", ALC295_FIXUP_CHROME_BOOK),
 	SND_PCI_QUIRK(0x2145, 0x0001, "Star Labs StarFighter", ALC233_FIXUP_STARLABS_STARFIGHTER),
+	SND_PCI_QUIRK(0x2782, 0x0206, "IPASON SmartBook S1", ALC256_FIXUP_IPASON_SMARTBOOK_S1),
 	SND_PCI_QUIRK(0x2782, 0x0214, "VAIO VJFE-CL", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
 	SND_PCI_QUIRK(0x2782, 0x0228, "Infinix ZERO BOOK 13", ALC269VB_FIXUP_INFINIX_ZERO_BOOK_13),
 	SND_PCI_QUIRK(0x2782, 0x0232, "CHUWI CoreBook XPro", ALC269VB_FIXUP_CHUWI_COREBOOK_XPRO),
@@ -8572,6 +8581,7 @@ static const struct hda_model_fixup alc269_fixup_models[] = {
 	{.id = ALC245_FIXUP_BASS_HP_DAC, .name = "alc245-fixup-bass-hp-dac"},
 	{.id = ALC256_FIXUP_HONOR_MRB_XXX_M1020_AUDIO, .name = "alc256-honor-mrb-xxx-m1020-audio"},
 	{.id = ALC287_FIXUP_LENOVO_LEGION_AW88399, .name = "alc287-lenovo-legion-aw88399"},
+	{.id = ALC256_FIXUP_IPASON_SMARTBOOK_S1, .name = "alc256-ipason-smartbook-s1"},
 	{}
 };
 #define ALC225_STANDARD_PINS \
-- 
2.55.0

