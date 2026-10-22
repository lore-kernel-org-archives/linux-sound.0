Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792636777;
	b=1PRCZ2iZiqkNJzTUQSCZc9W+Fq6q5vRwVvLkbo++AJpbecRw9SSuV1DrD1rg9vjB861J
	 vQNf+baAQd483pR+yrOSR1lNwmho0of/uhOAuoxY7s6dSabPeyTCSiPkSluFuxv+tU2MH
	 hYQo+5r9ZfETT82dzYaQkKGkJjsA+ep0A/aC6OMoj7NNrtKyxvvdtZSLlftnn4DR5gAV9
	 vFdGkipGPjudTpmglv+Pw23SxJ8aILEKASlzPUpALv4YLlFRVGkr5LWrAeMqFcd1bc7Pu
	 noKXVhvFuKPdNQ10Ek6sF92K701MmZaYyRujJdAZqGRGaIR/n3Mq5wmdQusSG3rpVkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792636777;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=6Qylts5YOUjz4RQv9iCj1M8vYBR41/kSDnv/5i0gdsQ=;
	b=ouhQKOvZ9ojVTBC9Rbkphs1MXbEJSOK82vyCrJfCzNmF2gwt4L7vH8FT8BN5feG4DsUd
	 CPvRROtd8PWhjT674cM11YrvRQJFEiYN7CHgFPXHW82Art4Gd6wNR48deyu5lhQd7/2QB
	 nye3uoen+u9XKVlRNhmjY6yiYk8PD3X9deGv+rzm5wtKibO0urVw7mXrtWrZH34wj31zp
	 RoT0AtpMPlaBJDbh+en91pFZXjgV+OUko82NQCfO1xglHv6emSNlcw7hR75Uc/wRaegNY
	 dvB0gtqK4pB+xDjrPLL8hnSe4Lsga+DzcV0N6bMFx6pl1SPS4jnFdWIxwFZfPvjkpbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=frE2J1N4;
	arc=none smtp.remote-ip=209.85.222.171
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76326606A31A
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 02:39:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76326606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=frE2J1N4
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-93cbc3ab2fdso68226785a.3
        for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 19:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792636776; x=1793241576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Qylts5YOUjz4RQv9iCj1M8vYBR41/kSDnv/5i0gdsQ=;
        b=frE2J1N4Ff6md2FpyEl7sqgr5SfFfbdw6QbjUrQm5g0XMPZx33Dpj9c1DcA8Tntsi9
         tY0L3HuTcj+6mfjCWfbBLdOnOJRUrV5PN14dPiJMKZpr3HN+cn0afkTitgkC22KTw42r
         pv7ugjto2GlN9eeugzkU7o7pAeI6I3JYTiBmI4TRh4ajdzGSHq+EYxLPosHl1PrTjmdK
         I3bf2aJF4Zl3dE3wWWOvTuXOLCaycBebm13bGx8YmaSuAJvk6BHyU6JWXSsGDRb5bT0b
         Rmkm7P+IUQPYOdwZuG+zpuOyFZT9cnQ//vU9U8Pu8YEFHAozJI5RDZP9OYZxN8RkLax3
         SDqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792636776; x=1793241576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Qylts5YOUjz4RQv9iCj1M8vYBR41/kSDnv/5i0gdsQ=;
        b=ZFPjRI1ngjYVkVMC+/aiViUynn3dU71ksJiigvSA+paakqZW9L5i9TRaT4H+6Y8RM6
         2nBR/Xap+UlsubIRhcEJTH8eW2Fbl45Oc/TplDXYTop75I3MZ0WQWP4EFd4FQTdglCn+
         a+g1MGtiVi09+H7vaSzI9qMDk+GcWjetw47bYyR791AZfDcGe1Co9pYAmnHqvusz3p+g
         6BXbREtRwSHE8gEeH4GC+WSklaAEWZq4faeWe/2PDqSJ4yu2OBsTU/IkTVZcnrvVBpot
         WVgo6rhmKEZvShR3oyqWWg1tVcS23+LEnjUDpOz5m4PYChS53F22SHqYwd37JfU9Df+r
         F0uQ==
X-Gm-Message-State: AFq9FYLeHu1qBzfnudaLPPM/6CSufVMMeUH7VtaSVx92jBCwg5mAeaKT
	8Zld2hLK0sBFY5ykl4ARPKA61Wzn12ahgSThzaWGbbLaPkq5AfMQK2xX
X-Gm-Gg: AYBFou1EiN7BugJdmSRX78MZQwcU74EICT+Hdo8aeC2kYismIT8XYJEMNtFoosRDRdp
	dx6go9G9dSsG7rDdufbL8vwdvolAas2IQO151ky9ryqjB4cru7Kzac+HnOxhxvXHX1SkKTX5VEj
	EaiF1mYPMDUlLqbnrHwsYPR2gk8veJfY37FCMCVEDYCHgOyMQvy32AVWTFDTYscXiKROTxFzB0V
	7ODwjziBfBMSozl0lQmW3k9uyYMC3eX0yZi8mYmAEBDd1ZveSG0fVkegcQzqMUMmRP9VZbFclHy
	kjBnYKWlU/WJH3JuIG0mnTQvqSgm8r1k4TMw8ShRFfxz9QgWR/dGEHQ+rZsqcU+5D/Hsev7wWUw
	OV5nUvhUWPYZj78KOxPhVuj+5i2ZVYiuTc3UnnFh9NfwIjTvCjI+hNCAGLmvPoP1K7PUPY3KQEW
	ZQmRV/iyD3RkCzd7aEr+KPj5MZwTi8Ga7yt+uz1cNn93RYF3gAcjMqTH5GnRHxGLNgNDULWBQu7
	9DLwuFmrN619+uuoBv/Z2RiGdL6xjQLHnLM2VpCfU2RsfVfU1K4Yz8ULUpPz1p56HVzktNM5LHq
	FMXFc2HZWTpdt+LCqWy4s/9oNce89dc5Tu0dGAGJvEElL/B+m0FdXrKB56FSua6Cw3hcqcXP6Vv
	Zb6S7ANkg5wjDwycvw7Ltd7OMbA==
X-Received: by 2002:a05:620a:2908:b0:93c:2c15:e513 with SMTP id af79cd13be357-93f57faa15bmr749391585a.63.1792636776293;
        Wed, 21 Oct 2026 19:39:36 -0700 (PDT)
Received: from fedora-lenovo (d226-112-40.home.cgocable.net. [24.226.112.40])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f56c6ef4dsm411634785a.3.2026.10.21.19.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 19:39:34 -0700 (PDT)
From: Volodymyr Lurin <volodymyr.iurin@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	Volodymyr Lurin <volodymyr.iurin@gmail.com>
Subject: [PATCH 1/1] ALSA: hda/realtek: Add mute LEDs quirk for HP Pavilion Plus 14-EW1XXX.
Date: Wed, 21 Oct 2026 22:38:39 -0400
Message-ID: <20261022023839.504841-1-volodymyr.iurin@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP Pavilion Plus 14-ew1xxx with subsystem ID 103c:0x8c31 needs the
ALC245_FIXUP_HP_MUTE_LED_V2_COEFBIT bit LED quirk to control speaker
mute LED and ALC245_FIXUP_HP_GPIO_LED quirk to control mic mute LED.

Define new ALC245_FIXUP_HP_PAVILION_14_EW1XXX_LEDS fixup that combine
existing COEF(ALC245_FIXUP_HP_MUTE_LED_V2_COEFBIT) and
GPIO (ALC245_FIXUP_HP_GPIO_LED) fixups. Add the missing quirk entry.

Tested on the affected hardware: both the mute and mic-mute key
LEDs respond correctly to the keyboard hotkeys after this change.

Based on tests, to control mute LED, it is sufficient to
flip coef bit #3. While ALC245_FIXUP_HP_X360_MUTE_LEDS works too
(combines ALC245_FIXUP_HP_MUTE_LED_COEFBIT and ALC245_FIXUP_HP_GPIO_LED),
it also flip coef bit #2, and side effect of this "flip" is not clear.
So separate chained quirk introduced to be of safe side.

Signed-off-by: Volodymyr Lurin <volodymyr.iurin@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 36d3bc23a2df..550cf976af6c 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -4463,6 +4463,7 @@ enum {
 	ALC245_FIXUP_HP_MUTE_LED_V1_COEFBIT,
 	ALC245_FIXUP_HP_MUTE_LED_V2_COEFBIT,
 	ALC245_FIXUP_HP_X360_MUTE_LEDS,
+	ALC245_FIXUP_HP_PAVILION_14_EW1XXX_LEDS,
 	ALC287_FIXUP_THINKPAD_I2S_SPK,
 	ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD,
 	ALC287_FIXUP_CS35L41_I2C_4_THINKPAD_ACPI,
@@ -7061,6 +7062,12 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC245_FIXUP_HP_GPIO_LED
 	},
+	[ALC245_FIXUP_HP_PAVILION_14_EW1XXX_LEDS] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc245_fixup_hp_mute_led_v2_coefbit,
+		.chained = true,
+		.chain_id = ALC245_FIXUP_HP_GPIO_LED
+	},
 	[ALC287_FIXUP_THINKPAD_I2S_SPK] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc287_fixup_bind_dacs,
@@ -7889,6 +7896,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8c2d, "HP Victus 15-fa1xxx (MB 8C2D)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8c2f, "HP Victus 15-fb2xxx", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8c30, "HP Victus 15-fb1xxx", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
+	SND_PCI_QUIRK(0x103c, 0x8c31, "HP Pavilion Plus Laptop 14-ew1xxx", ALC245_FIXUP_HP_PAVILION_14_EW1XXX_LEDS),
 	SND_PCI_QUIRK(0x103c, 0x8c3f, "HP Victus 15-fa1xxx (MB 8C3F)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8c46, "HP EliteBook 830 G11", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8c47, "HP EliteBook 840 G11", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
-- 
2.56.0

