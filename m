Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795283073;
	b=cXEn99bt9uuQcRTmnn/O4dxD+OdGqfU9iM2Jy0hs416Txb9n8f4JMgo27QU59aS3TdGf
	 V8hKnduxEJvfDBxCmXs2DBIL/L03bYYu9vo/AVmzdlwaRgR8K8cfhyGE1wELvLuDG77oN
	 KGeepfHlRLJtjOIN72iLRMCQEtbW6PAW41mMIfH/IAuH+ZaBSFhGMDZWf0js+y1sLO2/I
	 XdOQdrB2zk9L5hkPNapnhhDH0SUG8giECPyWClR0vORnRZTBtYYq70gW1GDRbt6GROvvg
	 T2luedWVVqBF+XTI5zOZu1FRmG5W64jFHqVbpiypCtoeuiKA0j5sG2stKGoPx7AbDdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795283073;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=9HSxhukvMV5W3viGrxjDb6woOlLtOSFWPUApTXi5qPQ=;
	b=ij97V6IcGHYW34R2q1WOzf8ea7cgAWjj1Rk9vrCdbpIIcJTsuDg6kIDCzO8k1y449f7T
	 wuyHlby6SoxLHNQU1p2Pj3jFHGCHZ5LcfX72u7hjfuuU1cif3m4lnbTez/hMxZhsvK+p6
	 D1S0do4U0rp4gH0hRvRSKSi354+aZVS58Q24Ndc+o2gg1YfV1eWg8K6/teBxdRby4lsUc
	 0dNu+wQ/HaN/jrMWafKeUlkiEsMP62kRFin5m6ZaoXVSietO/UbdTNmd6BDYBG15xjUcq
	 RUnJp8Rc68gBtdvjzFuoxA+96pNiAhBaVmftE9upIfDZ7ppXAWPMiO75Fu30pmihevw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OMopPk6s;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39905606A320
	for <linux-sound@vger.kernel.org>; Sat, 21 Nov 2026 17:44:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39905606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OMopPk6s
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so23468015e9.1
        for <linux-sound@vger.kernel.org>; Sat, 21 Nov 2026 09:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795283071; x=1795887871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9HSxhukvMV5W3viGrxjDb6woOlLtOSFWPUApTXi5qPQ=;
        b=OMopPk6sioHZ1jnaB6pwWwSZiJidU7G2YGrzOf/jXS59Fr19TbdkInC28PqCHjcedl
         bOByQ1kiJLmGXuGVYKlh20YKxOfyDwatjVI2Rz69tYN/mVatCFIGVhIF/sqkWVn08kwc
         hrLBTux4dUyvND51Z97l2r6XZCWqAH4mcZ3YqZfYFxMssQx7vaQCu5FSLaSpmdCMusaq
         LHzU0ChAuKqFIg7g4ox10PEtETHtE3LyblU6HXmf0ddcln8uw//axK1xeZAvRkTufr+6
         AvQimF1zaYuqaG57ObCnjTR3Rc941v90FeXrFPOpoMZXTbqFbGcc/f0ppgWP/luvNwqw
         8zAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795283071; x=1795887871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9HSxhukvMV5W3viGrxjDb6woOlLtOSFWPUApTXi5qPQ=;
        b=AH02Ms4izSD7sarKxBD93I5y175YiXWJIWBf3GkXJP8ybagDwQmyEk89Hf8hqeb+Hy
         pYnVzmqt9zzXoFnsjHERwD/afXWE9QEoEAbSw+QExpJy8HbkvgVFEf7BL4qxhEUninVw
         F5FyKNnRYmsVOVrAAtPEglPb4t2n+Y9+Q3jAh4UzhbQ6p13CKsogrLEF/y0crR/0iDqb
         6ORW3mwfNXWCxE6m1hyqfMk3avFJkmDmfVypAmprigY5+qMnIQ3SvkBd1V9xEwK81Mo4
         AFkRVbIAMRkaHR1C3YSqan73GXr7TA71gO6idskfOUqo9gp36aXwdy0ZzWUU9BmHjft2
         Q1EA==
X-Gm-Message-State: APuU4Z8z1WGsgDmX9sx574SyIl2oCGhYxJU380A9osmxL3eqgKaB4/Ia
	iveKEZoIguT5r8UdzmYnsFjycXCd7IRG25zcUOE1gD3QShB6AFI6gANFkWbtKsRQ
X-Gm-Gg: AZFdTZcJL/BEdDCcD/y3s3LpBkpWbkpI8ZYFGQNxZT9i7of6Gsk1SLA8cTT4vLmgH7S
	sCq/4KR1DLmDRPLvz19zsN83DTUqNOjcW/DkC0g5shg+VVxWECxibwsRyv2EXPNrupl33ZIeNig
	QzJwkhP2ILKCjfT1xsWgivWV5UEg99SuFdhk4DqBzxHt15Xy3PsL1m8eFz/YZzhr+gGSHti9Ojk
	t+bQDtrZJx/1XwVWUVBOKzby2veD3XlHtSqHPZP/diVDDZBrys0ECMCqtkZX+5fPdr+cTeY34tf
	P0XXRf8GDZrW2gh2odLC3NdU05TTYTYJPYYM8qU6snb/FTW9UsXgbsMvPtMJ4M86ekmQ0ZiIWpI
	6VauihC39+nLTJxfWn24UfB2FfO6fPxqd8DwOJtGf7zt6zr8VNBXz6GYpuuA3ZiCO64v+/1118v
	KwQkgfTQcFldYsjpGx9f45FD9uhJIFpS433ZAiVuHYBvzoBONz0Qc8Ja/nLXWThBP2m9jEI4yu9
	vwJSZuWYJ9NRgVfFukddQbsXgj0AOVHkmFiYPPOmomcUC40/shVMpbH8xuHMAOk3XvyH0X03ICa
	4mrjbBLvfZRKfUt/VAjQBdM48ENfNB08kLcka1HG+l998pHnWAYiy+QKVk+CmvE7CXEJ/A==
X-Received: by 2002:a05:600c:83ca:b0:4a1:9661:14b5 with SMTP id 5b1f17b1804b1-4bb888176eamr151654525e9.29.1795283071505;
        Sat, 21 Nov 2026 09:44:31 -0800 (PST)
Received: from cachyos-HP-X9-388H ([2a01:e11:8004:540:43c1:1d7f:b5d3:9c8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b2c5sm208329935e9.5.2026.11.21.09.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 09:44:31 -0800 (PST)
From: Andrea Di Pietro <andreadipietro084@gmail.com>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	Andrea Di Pietro <andreadipietro084@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Enable mute LEDs for HP OmniBook 7 14-hg0xxx
Date: Sat, 21 Nov 2026 18:43:26 +0100
Message-ID: <20261121174326.16369-1-andreadipietro084@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Use ALC287_FIXUP_CS35L41_I2C_2_HP_MUTE_LEDS for PCI SSID 103c:8f07
(HP OmniBook 7 Laptop 14-hg0xxx) so both mute and mic-mute LEDs
work alongside the dual CS35L41 I2C amplifiers.

Signed-off-by: Andrea Di Pietro <andreadipietro084@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Notes for maintainers:

PCI SSID 103c:8f07 was previously listed as "HP Agusta G7KX" using
ALC287_FIXUP_CS35L41_I2C_2. On my HP OmniBook 7 Laptop 14-hg0xxx
(DMI: "HP HP OmniBook 7 Laptop 14-hg0xxx/8F07"), dmesg shows the CS35L41
DSP firmware path referencing "HP_Consumer\CY25\Agusta\Official_release",
confirming that "Agusta" is the internal codename for this platform.

Switching to ALC287_FIXUP_CS35L41_I2C_2_HP_MUTE_LEDS keeps the dual
CS35L41 I2C initialization intact while chaining
ALC245_FIXUP_HP_X360_MUTE_LEDS, which exposes and drives both
hda::mute and hda::micmute properly on this hardware.

Please confirm whether updating the existing 103c:8f07 entry in-place
is safe across any other variants sharing this SSID.

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index d38be4d500b..c746aa3a5c1 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -8145,7 +8145,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8ee4, "HP Bantie A6U", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO),
 	SND_PCI_QUIRK(0x103c, 0x8ee5, "HP Bantie A6U", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO),
 	SND_PCI_QUIRK(0x103c, 0x8ee7, "HP Abe A6U", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO),
-	SND_PCI_QUIRK(0x103c, 0x8f07, "HP Agusta G7KX", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x103c, 0x8f07, "HP OmniBook 7 Laptop 14-hg0xxx", ALC287_FIXUP_CS35L41_I2C_2_HP_MUTE_LEDS),
 	SND_PCI_QUIRK(0x103c, 0x8f0c, "HP ZBook X G2i 16W", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8f0e, "HP ZBook X G2i 16W", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8f2d, "HP Auster 14", ALC287_FIXUP_CS35L41_I2C_2),
-- 
2.56.1

