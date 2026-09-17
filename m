Received: from out162-62-58-216.mail.qq.com (out162-62-58-216.mail.qq.com [162.62.58.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D27944CF44
	for <linux-sound@vger.kernel.org>; Thu, 17 Sep 2026 06:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789628320; cv=none; b=oXln7Y7NrQ6QE87p74fBB63Dm4D0I+rnFTw+S4kKrU4FsSxstGHNOuHSY3CPOHJyJdyCsM3LMUXUAexP/gKhviTZk/H8hlnHzC9hExW4B3Dff5pWTNIuM41vmawaCHtkWjQMvqRg18uf1raE7Inzd9876IpnTLluZfvyxDJ9CW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789628320; c=relaxed/simple;
	bh=ZJdrE4ZQiL2fLVG0uq498yF1fyMXEuokmN0oteE5iLI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=kfEEEvObw5u90VoQoNyspigJQnzma1FgrBMTeE8hPTu0Nil8cbO9Cg6P9goNWBaFbitseCM6wMK/Yoc8cDmqSx/LAlT6dFG2FMxpd52Ckafxl4SPe5IDAT6Aev3O3bwqNcbMXWyGIDonGrgZV7rsI/0FKGuYf2W3zCqBjBliYTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=Kacba+HR; arc=none smtp.client-ip=162.62.58.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="Kacba+HR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1789628311; bh=MERgzgpXXsLuMM/VoNLF9rsIVtw8Kcufyml/2ixyCzE=;
	h=Date:From:Subject:To:Cc;
	b=Kacba+HRMKdalwTJcORO9GjHwmtAduzfpGgZ7aWqPhFq6LDa+rE6OD2qZTtf68aQ3
	 ldL2nK+3oEJ7Oa1elXt003/ibKdwBh8IrXlgvYIHhW77DAuHf6g0S7FeLIzQae31sa
	 sTril0eoo680YrR6aMs71PPi19tpzMRi8wfj6zRE=
Received: from [192.168.0.69] ([14.145.45.144])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id E9D9DEBD; Thu, 17 Sep 2026 14:58:29 +0800
X-QQ-mid: xmsmtpt1789628309tqvgiq5nj
Message-ID: <tencent_3AB9214FB134949B31E9C471BC3669117F05@qq.com>
X-QQ-XMAILINFO: OPm6cUD8cfbdqid7NB2NoOYRfyymZV9o3WLUB0rew3r48ATCKW9GhVoy5W/pR5
	 x5+iSKaipTySHbt6MfckmrAD5mXKUupf4GovV2zG4HB3RizGwogB19OFjNv7a0W/R+zf/BR0Qslo
	 1Vh+ngW+y9LFfr6NdrbJE0c/BY2vNB7cwtxfw/ga/VFUA88RS2lzBOvXcY73J41s2B3AveH6Libr
	 0qwwuXMK6dcvbdKS+16Nobcm5Cvh6rpno7BghzOvSNYg8qv50ZBe9MMDYogVSv01V24Tq2XTkanx
	 9Ji+S1XUzm9jj/EjDm+17IT8lpD2g5AJlATTy9ukw6JpMcZAOV3/ALdsb46nc6QUdyPENgbl0TG+
	 TghTz3biUVXPY6VPrwNO9M2UJ9W8hu2H8BBjzisBeBQiLfBc2NMoiYhpSCTIVLbao+G0Td6jv/Qs
	 XGbMMtf4QrkDfCTQlFuXXOXOfwc5bgUhIaEQBJXloBOXHAiiCLrUxoU1rYYHxPEpLtg3qZTsQ3KN
	 tlnjA9yrA5HXfizTexGYNkNX16mCMlTd2Fk+kjYHz/0+mWhGv3iFImHKh3B8nd4rHZQX4XhgZUDx
	 RgP5v8ww/jsEtQBu3YT09Y7wl95qKyeHVjEtbyOAVKybDMf5zpyM+HLztFwLQqdNZqvjgq/hUuL3
	 2GbnAX+iLzcI+3wwnH8TZ2nFvqq2+A6r0Bot9wQcPA7j0oRzYHoeA+QV+OwiLLsrIDG63bT9Ckr4
	 leImHdbg/X3r10cO4sfpluDrClzAIvr6wwBI7dNOIC/BHrFvAPhDt861usNDS/Eu9jJZSNETC7F7
	 XTsJ5WUJsb8DLKjgFLO3KmMKNAaIbIxQP2ytO1cOIPLtQprBK2N818xHF823xbmTUbK7mR59zTe1
	 /AC8TiOemSuXLLy0z0ZV6+tQnuJwP7YdpRIgSbUPoeqJbMRZy3m4DHkap6NTRc9f3gSf7LPz5G0E
	 sRq4R/+HRusoM7loqvBGkxkqODEMeNItlFquXSfLzNU7Peu07Uogi69ZqrC7KUjwQQl9vvYVRrt3
	 ddR7bKGoKhB7q/SB4ZGCtBUTtsPXZj7LbYesGC3Vy70x2TBNJL
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-OQ-MSGID: <f11456d2-0d67-4286-8509-63da002b8871@qq.com>
Date: Thu, 17 Sep 2026 14:58:29 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jianyu Zhou <997536907@qq.com>
Subject: [PATCH v2] ALSA: hda/realtek: Add quirk for IPASON SmartBook S1
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com, perex@perex.cz
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

From 2adfedabfdd9f5ec800462b1f1c0859a198e63aa Mon Sep 17 00:00:00 2001
From: Jianyu Zhou <997536907@qq.com>
Date: Thu, 17 Sep 2026 14:34:46 +0800
Subject: [PATCH v2] ALSA: hda/realtek: Add quirk for IPASON SmartBook S1

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

Signed-off-by: Jianyu Zhou <997536907@qq.com>
---
Changes in v2:
- Use ASCII names for the From and Signed-off-by tags.
- Drop the addition to alc269_fixup_models[]: the quirk can be applied
  via the ID alias (0x2782:0x0206) instead.

 sound/hda/codecs/realtek/alc269.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 3abee61..9bbef18 100644
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
-- 
2.55.0


