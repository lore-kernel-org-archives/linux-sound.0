Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793847424;
	b=iqTKwFj5+p8BOD9bMC353EorxMmjAVcAzXgRQeaQEMGjFuWt7de4knkMgeqDB/v8C71h
	 Xt9OPor/RFtGKHAupBD0VGhwgQpmPAfBaBPJ4H+Fgt4qYqkmYFlfGlljLyMr8F93bg7HS
	 KNQMTiSl0PR7BfyXgFuOK9r74rb6kIcZsOmP/PfZ9gEZmTW2GMdqbkIXr1XH+/ESqvTyE
	 Hyp36ckW4PCfKhP5myYFnpnSyp/ToHtdGMDlorxQXveivnPajHmRcUMw+EZDLsiMy/d4c
	 flZ2GBpKc0ddVmCXB4OGD44tmmimmpcrongS6E1bPFJ/g+y/qQze3Svwb4lcvSH3U4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793847424;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=glFoeqTtNUfY2+mxzil5Yl+taLvoFmrlvPohUi507NU=;
	b=jiA1v8sKVlM+6IBTSpktv4pGeeo9XSP35qwK0cebJpOoqY8yQK4phvQ1j6IlRIZ7NiiX
	 0nxEwehDuqJBp0Im7sjtHY4+7kh8K/xM5Pa0/da3bjnhqceopSpIwSqyP1hqUO1juoUiC
	 24erKl13Ov2VqzzzcKPSl/riQUmdo0aMCdGtqr9c3cTMSuX3iFiXrfdNDA4HwdN57PcEm
	 PIJ23ka607TM7q1jQrnl+1N+RU/TdwofyWIwjVPPnspXBmwc4pDOaRDAQGeMxgnizGxYt
	 ChzS7/fwjD/qS6rfCQvT849Eyee7U9AUzHd2jX0i9/WbO5sLj3Fwv49cRdsRwEaXSPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=R7Qt27yL;
	arc=none smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5DD606A328
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 02:57:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A5DD606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=R7Qt27yL
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C96C83F853
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 02:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1793847420;
	bh=glFoeqTtNUfY2+mxzil5Yl+taLvoFmrlvPohUi507NU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=R7Qt27yLogN3RdwhkZEmcyiyW6IZiEIXy5Zu80URZC1U8z2l53NHQULrfFmhvvgag
	 m83lobKsrmVgbMg/TZtycvej2pY1E630J62ZHBXdQTmCIHzwjOURDY7X89ulrc5e4K
	 ycE8n0+ntb9ullBhGrDttiRIDwZOH9Ia1cEshE49jjnrdzlWOTji2+wbFgtWoe+LQL
	 V/hRmOXPBK6OgKzQAdTbIStBgQW+LHMcb7WNhYxMCGqAASfVqsS/znmCo+pdfEciST
	 fX5E6BjS6THvcuZq6qOfFp7yzYjyL+Zh7x9nL7I75lYW+GWpNQ+9j/0LLq6UkWKvbk
	 fR2rRZEbFIuZ9sLVMMvtwtFBfm72GNqdBdsemj7qZRG74Q7GlBFhMjSc08QGbL92+1
	 /kBVQcI5bbGeHIKsUNt7K1DDd84BumEUvpezoGoGiaC9cntwKlkRQhGpFMWB1f0MQH
	 USl4zSQ22e59tcbCWY48fvYtmC6Hol+mh5QpIW76RU4ozEDiIEhLxiwLR2JbaSqrJH
	 MDNCHdoZbIPXNjpAk+f5qm71TvqAc4FiskyCBw+crER0li+2xTUeUh5HiYsMpQNWUd
	 KlJhNsLPRM2B4GIRFPsXN61BI2GLYRYlOxSPfAR+rhT9RSKmqiIoIFoGZyXC2+ze9A
	 xVfk7fQXJJGSf8V0e8np4gQw=
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8862ed0539dso1660676b3a.0
        for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 18:57:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793847419; x=1794452219;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=glFoeqTtNUfY2+mxzil5Yl+taLvoFmrlvPohUi507NU=;
        b=LLPZKBPEBkgJYRFJxBODmQtaDa+cur+pvjtHedKmp8tJwVj0rQFKobiILceObWDApr
         7HrgMrxxvlbXm7j1H5aoYtvQIxWNB5h/kCbSluhRI9E8RL7CLcvFK7+2nSi17bsSOqH0
         /RLfKRyU8aHWepY4iK8vvl/DaRzC6Pu1eGn8bYxVmv3FlIhxBZHEO5i7BKb1nAwUw/N1
         YlHhWkJFCWmdLHGA4lAnGqP69ToqbkRN6gCo/J3uOaB6CGZ2Rb4LN6yJlhzQGnBXLrn4
         Iclao9uaqJ/JHm+XfrQDUVB+gp86c+Mn01xotkzcN769VBNmWuTVsRilh86vHrdoIWIs
         NsqQ==
X-Gm-Message-State: APuU4Z/JDZaY9OJH8upJLsOYMzw3U9fMxEqdEVl78zYOK1MX5rLhSKP2
	l0Q+Ru+2oK3BcXyGDJffMRCLUFpcMQF2+H/FInQE5jSY74NkKIKJFvtZYzSd0/8DKAe7W6u+Uej
	xbiQ97MEzsrn6YR0zMxsY6xCPhW/akEulYIb3LelKW7Iry11NOlLci1dvWxGgNTZtdyplKYoHES
	b46g95
X-Gm-Gg: AYBFou3K1kvn0upd93ZU+lf3tgxf9oGszl8lExx/nEvDw0v6CRQLneNS9MOaF9+FUyo
	xSI+/K2Rsn5MJM4dfGijatDr2X7faRH4EgnJ2Fh0TDRr61BhX7IzwGqFddWK03UVGkU8EYlfnH0
	vwVRpi/e+gsIfVCreqhuEgh/cbMV+xEX7yOQOLosUFLT7EGf24+wrvR5W0Nb4ASO41EZllB6HbG
	hmWURgVWCw0qTbrsZltzhbz8no84j6pKIZ2tinbQLPQDqtDBSTrt4iCjbuXEqDBknSYs4Hjp+de
	sifslwe1OgknNZ7pWbmESjNl5NH9smjtthf4MxrGqmFIndm5zBC5y6WX0JrDEAYa26f9NQ44nqO
	btYhMpD+drYjXIuDWmBxla3EWNyED6EQ4Bca5xoAZpulwrzap7d6Jubk64t+93M5nW6dIA5fS+E
	BsRQv8x9awnDK+gZGFO16fz0WPXp/h
X-Received: by 2002:a05:6a00:806:b0:886:bb44:631f with SMTP id d2e1a72fcca58-8a9bb79fb0dmr15642264b3a.10.1793847419307;
        Wed, 04 Nov 2026 18:56:59 -0800 (PST)
X-Received: by 2002:a05:6a00:806:b0:886:bb44:631f with SMTP id d2e1a72fcca58-8a9bb79fb0dmr15642244b3a.10.1793847418922;
        Wed, 04 Nov 2026 18:56:58 -0800 (PST)
Received: from localhost.localdomain (211-75-139-218.hinet-ip.hinet.net. [211.75.139.218])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09b667995sm1399905b3a.40.2026.11.04.18.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 18:56:58 -0800 (PST)
From: Chris Chiu <chris.chiu@canonical.com>
To: tiwai@suse.com,
	kailang@realtek.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Chiu <chris.chiu@canonical.com>
Subject: [PATCH] ALSA: hda/realtek: Use inverted mute LED quirk for HP ZBook 8 G2a
Date: Thu,  5 Nov 2026 10:56:47 +0800
Message-ID: <20261105025647.1116662-1-chris.chiu@canonical.com>
X-Mailer: git-send-email 2.43.0
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

HP ZBook 8 G2a (SSIDs 0x103c:0x8f40, 0x103c:0x8f41, 0x103c:0x8f42,
0x103c:0x8f62) use the Realtek ALC245 codec with a TAS2781 amplifier
via I2C. They share the same hardware configuration as the related
0x103c:0x8f94 / 0x103c:0x8f95 models but were left on
ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED, which drives the speaker mute
LED backwards: off when muted and on when unmuted.

Reassign these SSIDs to ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED_INVERTED
so the LED follows mute state correctly.

Fixes: 9afbbf490322 ("ALSA: hda/realtek - Enable Mute LED and Tas2781 for HP platform")
Signed-off-by: Chris Chiu <chris.chiu@canonical.com>
---
 sound/hda/codecs/realtek/alc269.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index f7786e1b0878..b00036f2719d 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7738,11 +7738,11 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8f3a, "HP EliteBook 6 G2i", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8f3c, "HP EliteBook 6 G2a", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8f3d, "HP EliteBook 6 G2a", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
-	SND_PCI_QUIRK(0x103c, 0x8f40, "HP ZBook 8 G2a 14", ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED),
-	SND_PCI_QUIRK(0x103c, 0x8f41, "HP ZBook 8 G2a 16", ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED),
-	SND_PCI_QUIRK(0x103c, 0x8f42, "HP ZBook 8 G2a 14W", ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED),
+	SND_PCI_QUIRK(0x103c, 0x8f40, "HP ZBook 8 G2a 14", ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED_INVERTED),
+	SND_PCI_QUIRK(0x103c, 0x8f41, "HP ZBook 8 G2a 16", ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED_INVERTED),
+	SND_PCI_QUIRK(0x103c, 0x8f42, "HP ZBook 8 G2a 14W", ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED_INVERTED),
 	SND_PCI_QUIRK(0x103c, 0x8f57, "HP Trekker G7JC", ALC287_FIXUP_CS35L41_I2C_2),
-	SND_PCI_QUIRK(0x103c, 0x8f62, "HP ZBook 8 G2a 16W", ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED),
+	SND_PCI_QUIRK(0x103c, 0x8f62, "HP ZBook 8 G2a 16W", ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED_INVERTED),
 	SND_PCI_QUIRK(0x103c, 0x8f7e, "HP Messi", ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8f94, "HP ZBook 8 G2a 14", ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED_INVERTED),
 	SND_PCI_QUIRK(0x103c, 0x8f95, "HP ZBook 8 G2a 16", ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED_INVERTED),
-- 
2.43.0

