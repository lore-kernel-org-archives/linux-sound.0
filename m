Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795167872;
	b=bbiivOThxJLpmRpotMe+pQbIt9hyM1G3FlOfYLxBG//1RmqAnTVB6xxS5l+FI1bulD/L
	 GGbKLel9JpvfaUOssz/6B2bQbbr0kvD8dWFht8tPHZnaCUwCSW8eCr/6qOzmQHGojNgSX
	 8UDchpiMBqmrZf6s3pYDOroVb5ecgyXhxtwngPXubDemcpBBfcR6AROklyyaZV6aFCh/x
	 JVbTeWQapEaXQgFrkoACvoAPcwc7CID9OYG+vjJCcRWZry+HqqIR9xaVJvMpaXFP88GFM
	 GozqU7sjKRtCy+8Bk1jyuvwLhUMsyC/lyfwaOMb9YNR0YBKhcFGu19aSSnCRF0iA/GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167872;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gc0YH7tul+j0foN+otRZFbZgrVsjLkGsvyOuJz0JIG8=;
	b=LDu1718paOCeGhCCwyQVsdJqGMvkIJav4Nv7WWXa7sGJ5AhbxTTYqMy60RHJOzqpbznl
	 i2kNnJgLjb/1sFZ/N7J4Wjl+LRWh/RdYQ80iSQyipMhDhWOk8J9xB2I12w6a0NSySwjI5
	 Q4ly6ztrhMZby1fHNVXkLhv8hSmHocsQHTxfg2uDE/vyEXWkCGken/pXtMtPlMwUlVr31
	 t4g7yMHnGiOufYjQ6lVM1MOGj0h7wFda64xlII15eCm0PjHhkObPwajlZ2NYeP0ijeU1q
	 ht670CGlCxbSIkFNxJLhV2FGvOULEuVfCW7a70RKDbvkSCEHRcEVeW1R2h+tdX03csw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kWVqnyUO;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344EF606A320
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 09:44:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 344EF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kWVqnyUO
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3712b6d9843so598124eec.1
        for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 01:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795167870; x=1795772670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gc0YH7tul+j0foN+otRZFbZgrVsjLkGsvyOuJz0JIG8=;
        b=kWVqnyUOu6Ja5aE/SymBF8yS0E/gQYa9DgVh+hqp2KYCZ3IDoemXQTlXTHCueN5Bm7
         fexNC26c7m/5UXChtp95ApxxTwA0ujv6BArRjhPVp2yJRxC8x3D+SH7hJuAXzkKt1npk
         HcZIEmpuDoR/l15EAim+pUYKCnI7837W0nwh7BRxgp6mT/EYBOL3YD6DWCAB9RR1e+Bi
         hkaJW9kKUiyRbq5BW5Y6JHBdUcrzyAICrYTLB6Ufb1+j16mO+zqZYkuqrUh9wNzIHYjz
         zpXJ3uB4encl9pfMIie1FYS+qR+5czJHzsntv0ALI2yJOkxXCLoF6w99lAallkZVS51l
         828w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795167870; x=1795772670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gc0YH7tul+j0foN+otRZFbZgrVsjLkGsvyOuJz0JIG8=;
        b=UZYp2ZJJ8683KMRuO2W5AmLOpYVkmnXte8C4tJQw6asWneUjfwFI+1z0+ZUaQ2iYek
         5RhZmJj4XcPK7oP9omgTpjTk4WHY9twwC/S2dEL8Oh/REY6p9Kvq2Tly55Gke8isTTxV
         y3oxo7hr8D2NsEotFnzfIo5HTs+/7wW3vo90bHcl/NXHdsINekamO1nB8QMzH0BFE4GP
         GD2LIajD08jJMP2BGGCeeJ2U3pJZaYfPzmeGAsAzj4id3myE/CzLkQ/njQaOVqIFB9w2
         VRVOPtSyY+3w/ZzkZsyyRqEtsDbML88uJwfiW+5eqYBiedznFuzghMTR2cGETQpJv6+g
         MmhQ==
X-Forwarded-Encrypted: i=1; AL+hErH82OVlXQ+RA5cbIPPL+lqlFrE6ruzQu838PPbK0IbHlA50UBDH1dcv9Fv0WS/2qLAQYEopKN1UzIy8rw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/d+IY9nRUsF5iLaCZu05NMn42Mw7KCqNoLFqIMPWFVuxN7qxwE
	9TMW6QlfaDBhnEPrzF6h5A5kAY3E4w04n5KCyDN1w+qTpaV3X/5wnzY2M5daYQ==
X-Gm-Gg: AYBFou0HbTyMlnAWOvDDRD5y9AXVzniE8ag5iQyKnGvkLayxh5zfASmvMJCzEFHS1O3
	9mbOvMqB4w7Ttyxus4vdghNJ3BVPE2i7CSZiS2dYu2UB0lJSHTc2OTdVVtDljLMDHKjBDIHSq1j
	yHkCegPY7qSjrfhBVrCKDxqgmClWhJBLLDOP5KnWkeJDKfnyOscS/SPbytOgog+BW+R1j8MCiJ3
	Ck66NFpEWoen8dA2tUbyOf+lq566T//tbkbZjgqjvMqzvs6BNFIrufaBFYxSjdNjCXkA7NNcsNY
	nWe0WKGMI7WTtRdQQdlGzGc8cnMiYC8qtsouoWtOv6ZuNz4oP4MPnAjNFySJ+kpGqRd1d9LJZny
	ZZ1Dk/nNsdm60W2a7khvgCUBktbGCUiIplpaM2AN3X/l39aP2TG1+ur4XULlvGHYDHby6NiOBtn
	0f4vKrz95CyqBwMOKI7J9cHT8eMq05qOpNARGE5WciMhGWDT0sWJxXfvDECaPN5GrJr7ZhauyBb
	hF6hZnD/s5Jd+RzZ83lAHLFed42O0r2XEfM8tm/Xl56zTEfdCWmwFfgSWWSpLU4XMGp0wK0pH/4
	vs1Qto4kZ5//MaL906u4725QTDqukhquHeCZW7DO12XKSQkTxlwjCsnsqv7b2lW3suz/iOm0yBN
	2umfQjf5FWbKCY62CmYJxBSDm2sOiVthCeLaSk3oQNqbK
X-Received: by 2002:a05:693c:4091:b0:379:4197:5eef with SMTP id 5a478bee46e88-3856f65b3cfmr2456499eec.8.1795167870262;
        Fri, 20 Nov 2026 01:44:30 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm3982974eec.13.2026.11.20.01.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:44:29 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/3] ASoC: atmel: mchp-spdiftx: Move IRQ request after runtime PM setup
Date: Fri, 20 Nov 2026 16:43:54 +0700
Message-ID: <20261120094354.6814-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120094354.6814-1-phucduc.bui@gmail.com>
References: <20261120094354.6814-1-phucduc.bui@gmail.com>
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

From: bui duc phuc <phucduc.bui@gmail.com>

Move devm_request_irq() after runtime PM setup to ensure the IRQ is
released before the runtime suspend action runs during cleanup.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/mchp-spdiftx.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/sound/soc/atmel/mchp-spdiftx.c b/sound/soc/atmel/mchp-spdiftx.c
index b034bd46cd5a..658ff667439c 100644
--- a/sound/soc/atmel/mchp-spdiftx.c
+++ b/sound/soc/atmel/mchp-spdiftx.c
@@ -812,16 +812,11 @@ static int mchp_spdiftx_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	/* Request IRQ */
+	/* Get IRQ */
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
 
-	err = devm_request_irq(&pdev->dev, irq, mchp_spdiftx_interrupt, 0,
-			       dev_name(&pdev->dev), dev);
-	if (err)
-		return err;
-
 	/* Get the peripheral clock */
 	dev->pclk = devm_clk_get(&pdev->dev, "pclk");
 	if (IS_ERR(dev->pclk))
@@ -863,6 +858,12 @@ static int mchp_spdiftx_probe(struct platform_device *pdev)
 		}
 	}
 
+	/* Request IRQ */
+	err = devm_request_irq(&pdev->dev, irq, mchp_spdiftx_interrupt, 0,
+			       dev_name(&pdev->dev), dev);
+	if (err)
+		return err;
+
 	dev->playback.addr = (dma_addr_t)mem->start + SPDIFTX_CDR;
 	dev->playback.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 
-- 
2.43.0

