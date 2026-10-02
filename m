Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4763655C0
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 04:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790915976; cv=none; b=QbM/bxm4QXtOyGR8h6Jz17TxShG4HO1csMBuIj6TW06cjwUtzsUupiWru4PqBWmyhrc9XAik585Caet6ZtCdrKb/uEmmFsSqMkygwlJlp3+5QdhWqxxNDwLohKD+6d/T1MAotbITEo7zmjC5lY7aTRUTJhgA3Aqz+DQJE7nAtnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790915976; c=relaxed/simple;
	bh=j10/ZsLN17TBlhm6+uNpFoq3nbtgD9vXY3E5nQkwFs4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PMIu5P8fYA7sCn5DL88HA8OIdskTjLpf4/15sy9gVKSE2DRGKUTab1lYwrz+YRk0TKWVpaZYkYYKFmGaA5VSg5F4CGu+pnPRR7BQyGs4yr0aVx/sLwnehShA2vA8LOzbSC57cljSLSWnlXy7I4HInqFKjCZhJbf86TQSpFiQIqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ou8fUxAP; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ou8fUxAP"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2d747ee1f38so32994845ad.2
        for <linux-sound@vger.kernel.org>; Thu, 01 Oct 2026 21:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790915975; x=1791520775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NJOT7+NCf5K/5kFKuz5HB9vHPxvovBR55Pk8e6dUoC4=;
        b=ou8fUxAPlexIFSiT6uNxBNkRWgCaZFaKIPoIyOLPlrzrbZNbx8PsIZPZYj9BPZ2OMJ
         zT8HvfVGojUIOra+X65RsTm8qWs9agyWgA6wmBYKiEpJScdMfiTGsQsg/SczP497mcJn
         LyFTI99AphQM+eGqqqcAqk3qmUTVRDVTAKkHN97/KYIQLdlQf+Z+QEd3LNTKvJ1ngBpA
         iCRupcx1+gadaSr+P3zyxCcr3eS9+rLZ67jLZsctehRm+lcV+xK1MtLz/pkEtxZbfNro
         U8HEfbAKJBxkieAeppaHTx/eBqTcIz3fOhtPYzu99OfJFoRIXBbYe8wVv8QJYZksxRAQ
         B0cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790915975; x=1791520775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NJOT7+NCf5K/5kFKuz5HB9vHPxvovBR55Pk8e6dUoC4=;
        b=pXtDGS/LiIk+AwHD5SRGfUCliZzb2XkK1tw7pa8RJG78lHxr70Wm6VfxlG2HFr05TO
         TFHCiBF+Px3sRq997igOzF7o+cd3yH8MYUxxFC7oo/DG5qr33yDN/W3Oy+MDquX32mgs
         5wTLMrurK9eXTQ8V+A0nX3php+geMBV60SeNBKi1QPXrxqYxJBXS5MigTiuN/t/suEd1
         i5Y3CSoCtRf2nMwvHcUkKZbnye31UwzSIygNXNz8R7W/beb0bwXXNTGuY+tTQrg+9iaa
         CSU8ORv4yIOESS7c3yCQJfKqAIUaF8Z36iseA0ikGD9oYPDmZLvrpAWA97YtYJmYFJZH
         BgKg==
X-Forwarded-Encrypted: i=1; AKwUvBxh2wB6g4b4LAgwYmh2MzeYuKl55J6LDZwC29xddcr3Pm6039ZY9VQ25IKAJTCmKQ97zPYjPui21i15ew==@vger.kernel.org
X-Gm-Message-State: AFq9FYIYyJkQCGmcR3Glx8i2MgW821A2FDKkiO1vhdipHoKzX7BR/EH6
	Cgl9tTe7GHSRi00BFe22xnim0iYlolREFo0xeBt2hSSFrKt3Hh0zelMn
X-Gm-Gg: AYBFou11Td0xsNiR3WCdQX+LbiFuDXcD7TnahB/dyhGnb8BKeR4YSlitl8hToKvbKz7
	LvmzhgaiRyV1MAd2VST5AVsoqtUmoxBGx9+TSQ2tNZeMzzxia76f5JtRdo0rqW8xdIexfkvWcqN
	gHt3bChw8LinfJQypesi1acd+wl4eBZGKvCjW7cPoIfXdGtegeEeGOGN4AFOxqY8NeEamvC1zJN
	TqkYi/8GVsqEdoJH2TvktpEMp2FloisgJ2cjA/7cC26zBXLDCPOQnZSbvJ98AuH1BSVEQyii8lD
	KHIivCbx2fkn0huiKPWG45qox++h70m5fU90lDJiUtvzOw3nQ/3A+c+xVIg/EEke5A34fY7+mbc
	MWE9jbpvqG/KWYPV6jzDVonp+OVoyUxxvLwOYv6XBL9tBbMdVj4ZlGRQz9HP7wYmiEEBtFrII/U
	RxXT2Y3XXSNVHHnLiIANGcFtP37H7XHY37na/x/9HSzb5hQRTPgqW1bEf6LRvDBdM5HzbPgxocq
	dtOLv/UYp/VyPWmRebnxnCi0XamLY0CtFBJKyU5dQbqj98gZL1EsBm7EGYeb1VQAQxkpsJrIvz6
	DEu/Ryt8obJiGg==
X-Received: by 2002:a17:903:32c5:b0:2df:b047:72d8 with SMTP id d9443c01a7336-2e49b7ffbf2mr13420335ad.74.1790915974574;
        Thu, 01 Oct 2026 21:39:34 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f67c413sm3713985ad.20.2026.10.01.21.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 21:39:34 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	Cyrille Pitchen <cyrille.pitchen@atmel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/5] ASoC: atmel-i2s: use optional API for gclk
Date: Fri,  2 Oct 2026 11:38:54 +0700
Message-ID: <20261002043856.97295-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002043856.97295-1-phucduc.bui@gmail.com>
References: <20261002043856.97295-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The gclk is an optional clock according to the device tree binding.

Use devm_clk_get_optional() to handle the optional gclk directly.

Unlike the existing code, errors other than -EPROBE_DEFER are now
returned instead of being silently ignored.

Fixes: 73ad0df57290 ("ASoC: atmel-i2s: Remove unnecessary audio PLL clock (aclk)")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/atmel-i2s.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/soc/atmel/atmel-i2s.c b/sound/soc/atmel/atmel-i2s.c
index c52d048449f8..6ca230f8adc8 100644
--- a/sound/soc/atmel/atmel-i2s.c
+++ b/sound/soc/atmel/atmel-i2s.c
@@ -670,13 +670,10 @@ static int atmel_i2s_probe(struct platform_device *pdev)
 	}
 
 	/* Get audio clock to generate the I2S Master Clock (I2S_MCK) */
-	dev->gclk = devm_clk_get(&pdev->dev, "gclk");
-	if (IS_ERR(dev->gclk)) {
-		if (PTR_ERR(dev->gclk) == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-		/* Master Mode not supported */
-		dev->gclk = NULL;
-	}
+	dev->gclk = devm_clk_get_optional(&pdev->dev, "gclk");
+	if (IS_ERR(dev->gclk))
+		return PTR_ERR(dev->gclk);
+
 	dev->dev = &pdev->dev;
 	dev->regmap = regmap;
 	platform_set_drvdata(pdev, dev);
-- 
2.43.0

