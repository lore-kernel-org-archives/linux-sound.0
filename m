Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0462BE02C
	for <linux-sound@vger.kernel.org>; Sun, 19 Oct 2025 09:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760865430; cv=none; b=uwjrNe/Tx8gCPNDyNWrc6wDxDPlhRGOI2I+Vwpm5UuIWDuVjSxL1qqFQkxgw2G8o/t09S5WmcEqvVPrFSS7DGqDpLWxXY/op8YiaFC+y6nJZL6hgnlqOAnHy/rSIYzAcissn/aLCya8K6tO4u6DKdM+KLYf/AiQwY9AChndLsXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760865430; c=relaxed/simple;
	bh=mCTqfekfk6qOXn0IB0q6lh5FkE26sk2eU5PGymINVZI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YcEP8qgYRAxnNNLWCWw/XBy5hSpAULMfkLSu6CrhI6xrrlHcVugErHNAcb89H/3uxHVeG+3oB0Zxr5+zIue0/4J7018hUkUZPdyafPzMls027VF8gZFoRuNDIOFhGZJicZa1xZ9xbQfo3ttqXZKy8Klk58GNE2ncbFFKKNGdXNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D7Xv/Wy8; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D7Xv/Wy8"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-471131d6121so26893885e9.1
        for <linux-sound@vger.kernel.org>; Sun, 19 Oct 2025 02:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760865425; x=1761470225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1bTeeYKE5+epIQgyyFAu7llY+ZJZZc1/NGSonmm3rn8=;
        b=D7Xv/Wy8DJ/DQjZwMKv19N+ittTcsf7HTYvWX6povhr+OhUrW21wZSe3CwDUlwZI6P
         TXlw2MZ3WF4qyKAwsaljqIDfcORlF8mcxaeCdRHU7+RzoEoy8g3NcTZfosQbr+2UlBHG
         CdK7fbWOKEeEubw4Xir/iZ6NzoSZnHPh6d2D0ML8gRxE3HOu8KWn6t/k1hVFidY7+l8f
         CfnWBSKCMKU+y2427RxaZ4xf9GuoSVPSAbMZfhhrd2NSshW4F4JGsOi45GG7hVH33bQ1
         ROtrJAvCjy+3BSLkeqF9EvbRQrGIfLiFe5QbViVaYyJ4m/fE0bf2Lz7aeaw+D9twRn46
         JVyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760865425; x=1761470225;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1bTeeYKE5+epIQgyyFAu7llY+ZJZZc1/NGSonmm3rn8=;
        b=MzA0I0joPGVla7lwLkzLMUDmdd4GQwQlCdWDARPvg1Z6sQnlYViDdz41g51keB74Zo
         WcAV8k6sBruxPtwxg7PYTJe2HqTW9MxH3R64xxwrybwn6LbV5Ak9UdE39+lS2a8iM6+T
         Vo/UEKIPeWIXneJlj5BXDxBvHESdYlxTnMdnQWNA/wjoNpGvrtmuEr2bde7NnjxGcL2n
         TqocqEBg+pa/0nGDCn2snwWbgMW+OkfmbDSPkJAXdYLNgEjCXew4c6J5WYJW29LUyNZp
         1GwNkPgI941IEJyqH6akDAKz4pgwavN3l0PjAE6vJnJUP8Tx48z8vdbkzOOcJMKGDzRt
         JkIA==
X-Gm-Message-State: AOJu0Yxp3++aBYIIDPF3E85ozq2cpEK2qU/q4a9XbB5zcDXURZc/NnDX
	Z1Vcv0DkwLS+v39MCklgCUxIEJjDATDwMcQehHLKhGI3v2bvZ4SxycPHG5a+FQbV
X-Gm-Gg: ASbGnctHIVPfTK9Btkl0Azl75cSHFUy7mGQkUi4h7tzSiV3vWSeZ3aHsWhaTX/0wpSi
	AkRHaK9orIoFfiId7n4aMmB108HoBccB03wCvHZ6KsTplJrvgEWcqgwwD6AZYftYclkakBl4N1h
	fQGpxOEaZuq/AbfoDou0Iq18Uo8t/10TrL7OdcfkFMXd+5IPfNfV7cqyCJQELEITm2eRZ+HgBUB
	jwVsh+lMV1DLg6qrtBs8RpyGHckEZK6ObovIjnb0ZoXVGw2vYf9HQh2IRXT2YRnRhytwsgCscBU
	GsoY81HrmizsSfQUzZ5TGXvOcJ2K+zT0Ogv25bxYnoMJLOXdhjlGurQ5RsHKlrkEYdDhPRQNubX
	5Vt2VcV2rNg0ao2BLHu7HQsNh/C2BmArSXSkWtJBo64oWvDXaTsxAzi8gT5ap0TOFLOsqvQNEOi
	eCm02iVNUkkup+U7izKFr+DbiIoTlBuc9CmsB8
X-Google-Smtp-Source: AGHT+IFIDKr56WgTsNJxIcdCXA8uMZr6DKUGM/hYfELxZT1nrwWzXa339FjAooqtDrxxEjexyZ1rRA==
X-Received: by 2002:a05:600d:62b1:b0:46f:b43a:aef4 with SMTP id 5b1f17b1804b1-471b5341411mr15744615e9.38.1760865424923;
        Sun, 19 Oct 2025 02:17:04 -0700 (PDT)
Received: from nixos.kykwifi.com ([95.7.250.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3affsm9271455f8f.12.2025.10.19.02.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 02:17:04 -0700 (PDT)
From: ern775 <eren.demir2479090@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>,
	ern775 <eren.demir2479090@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Fix mute led for HP Victus 15-fa1xxx (MB 8C2D)
Date: Sun, 19 Oct 2025 12:14:18 +0300
Message-ID: <20251019091651.2371-1-eren.demir2479090@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The existing quirk for Victus 15-fa1xxx wasn't working on Victus 15-fa1031nt due to a different board id.
This patch enables the existing quirk for the device with the board id 8BC8.

Tested on HP Victus 15-fa1031nt (MB 8C2D). The LED behaviour works
as intended.

Signed-off-by: ern775 <eren.demir2479090@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 6b9e5c091bf3..522d4792ec59 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6577,6 +6577,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8c16, "HP Spectre x360 2-in-1 Laptop 16-aa0xxx", ALC245_FIXUP_HP_SPECTRE_X360_16_AA0XXX),
 	SND_PCI_QUIRK(0x103c, 0x8c17, "HP Spectre 16", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8c21, "HP Pavilion Plus Laptop 14-ey0XXX", ALC245_FIXUP_HP_X360_MUTE_LEDS),
+	SND_PCI_QUIRK(0x103c, 0x8c2d, "HP Victus 15-fa1xxx (MB 8C2D)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8c30, "HP Victus 15-fb1xxx", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8c46, "HP EliteBook 830 G11", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8c47, "HP EliteBook 840 G11", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
-- 
2.51.0

