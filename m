Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794821081;
	b=2OfSExuops1wtM5vpOGkDdp1t3FnyCLeBvDJM7RANxzARcL4g7kIK0cGdkBQlhWE4tli
	 GU771oArK5POQ1KdGJXrHLXMJHuR6XB8vBvhGNVQvzG1ghmuOKnn2QsqCMKNSmlKfnQQ5
	 HR4nvtGVOWNrmy5jTihoNAMrd7xd+KPzcCMvyvEJqOYijx5FJvDYpdDbzmmheRuLGzsWT
	 dH+c5OACMhNKKIso5Q+9I5nxXSZcWZvrdhljp+LZcIo6yGuFQQ1fe1cQFC7Toa0CVkU+3
	 NqOVC7Zn4SxvXS5B7tVL9uElo7boUlo79cnEjff5aSt2CKKOgWDSx9WgKfvFDmWPHUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794821081;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XBl6SSviqpQOksI/O76xGkK2rzDNjLeiKDxI3tZWuYQ=;
	b=qQ5UfwSV+IquLXQ9rEugpEIv0vnBTPMXBkdB2aO/9cGgCz15htss6HewxMvAconwvTeF
	 f9MtlKyGOoI0XuwdRQRsyKIwyHtq6OTrTpd/jP/WZT7XhWTFjheiuRw1i4WTsHMmv9p3C
	 ca0WPVq+cUvyENGM6DjWdhGx4LEJj7JjA1bJuAKn7IXReq5QFTnT3HzaBHC2/LpXojz5K
	 NDgZs8SxOlHR+QTYFelN7ylKsDX/zDze8+JDGmzil/QOyyHreTQQuk3ItpSauBFRvGXN6
	 KFTFoYnOgZBpteB6gdOSR4ZwVHPA5GeBHkidxS8iCTFtLKxNAHBHTBEqegXirs2a8iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SuolmalW;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73BBA606A323
	for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 09:24:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73BBA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SuolmalW
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ee2072d1e7so7946415ad.2
        for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 01:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794821079; x=1795425879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XBl6SSviqpQOksI/O76xGkK2rzDNjLeiKDxI3tZWuYQ=;
        b=SuolmalW6iv1mAhR8LZKmrFTcEC62Y3yMvpvS2G5mTr8q74VK4ZYvVf0zaLg/Qjzhz
         lpC9DbZrAAEH0AMuyZxdbP+HT0nczDIKcxRjiE+25IY6AXyewsMrwK80XMAoAEoG64sB
         LBRCNfJX0sqbq+9+q4md9b4rZKiwVwJGVauLQmJOkAuYvg0BCWFGreiDk92JwGgbpzDJ
         TGhgOqZw590ovoSL0Xdp7n/uiSO8XBAAHqyj5nMcbhH+Q9kF41wYcTFkneBGxtQ34SbS
         SuWav31sdpzZzK6fywOop1fVjaZgWohzSP6kZVqXd60mOLUcjaUw34JFQI85lO1i/som
         y7Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794821079; x=1795425879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XBl6SSviqpQOksI/O76xGkK2rzDNjLeiKDxI3tZWuYQ=;
        b=VDvY+UhW5N3r+g4Xk6y0Gv/m5u9EpK6274p8VcveHymvwPOVVp34q08dpBmhsTTWT7
         TJxMz6f8oKnmXB8u84FzjIbOG+IV9vDES2S8tfj+Rw90fnk3FwG8DUoFq92WecWjAo5G
         3mIo6zm6Qu5ImPWn4wEK99xyrV97yJUwhGf1RUAim0e/3UTcPfv1v3gusZiuYTHONXOy
         iQhKP/Q17rlo47WP67mR6MaWDqa++3Tgqg6BS0dTYERxPTiHvEK73CbfGgiHp9opWlE/
         mwaiaQBVS/awQwsGpAciLkjHC89va8CqD9n/k14Xw547upFIVNx7BmkpPUXBFhnYxM4e
         mARA==
X-Forwarded-Encrypted: i=1; AL+hErHiXyLRqX7tL4/HwVf/QIZgjiKcUyPCtZIhxCVQKR2HQTLO4O2JMUyGNdUZYUP8KR251n0sEP5agAwvpA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9JJsup1yIZTcXeq7J9D8PaSsECofLq7XUGZzyLorEo3AWlC9mc
	yurlfOexMZFD3YNPSlR7fxXw4zEAcQ/G1m8G2ub8xI6n+nsnSi0lOP1/JHoqWA==
X-Gm-Gg: AZFdTZeNTPFz5eq+Akir2N7uueD45fq7TszpzZ/APHEpCwzqTQIoGqEVHN8P1/PhQT9
	vakOdzuVIEPcY0bekoTKJe3EOJ9Jv5p2+Qe0pKlogKp/BceI52iMk3IZXdhLEAmgK1QIgcxbvar
	Bds9Y3HTdTbSSR+44J4Zym0LHyVl6wpJdDFJjZTRrEC9NAWJUmgTiJAI4KAQdE/pnS3PzbQAsIh
	42BVrynnALbn1s6AmIZpnekPOcr+7IO7dd0ZttCfWd/pmZiYHQWIt+JPVo+rsf94fPEV0LXxSVq
	o+ju0DODCzmTij4kTCYxcD511l8YA3o1azAIVBRsoJytw5p70ye7LzRI/0PP5KHJCi7gEsYW0J1
	FvFFSEVLgRy5kRAFIx/gj+QjGarsWsCDkRJiLGade4r92xdiF8Xs87lOUKew9pTQxRxzAu1GlHU
	rSh47EzPGNXNPfjX5Ux0pmykcH+w9u6TAe+jXMZ9FJGN5jkon7YzmgkGtOCfcudH6Zwe4mk0zg0
	6cYXm2eVMN+D4RgvzECofW8IGjxQn0YJ3fHHnRaNxEzLIChvNa1IoBs9yfKzyPfs1ardctJCcol
	oXNX+ox1+YBhS0dMCtXxrmfoLp1lOOIJvgxWanzI3xHaUo2bWKjUAH8C5D2SGgnBZWEeyBvqyE+
	N9kic/CpRhMmjjyQjRrh6FLFClJ3xc/riWmztaNAGJtAD
X-Received: by 2002:a17:90b:558e:b0:3ac:9ed8:f319 with SMTP id 98e67ed59e1d1-3b1b07fec26mr8956019a91.2.1794821079320;
        Mon, 16 Nov 2026 01:24:39 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec43699sm15661189a91.10.2026.11.16.01.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:24:38 -0800 (PST)
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
Subject: [PATCH 2/3] ASoC: atmel: mchp-i2s-mcc: Use devm_clk_get_enabled() for pclk
Date: Mon, 16 Nov 2026 16:24:05 +0700
Message-ID: <20261116092407.514998-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116092407.514998-1-phucduc.bui@gmail.com>
References: <20261116092407.514998-1-phucduc.bui@gmail.com>
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

The peripheral clock is enabled once during probe and disabled during
remove. Use devm_clk_get_enabled() to automate clock management and
remove the unnecessary remove callback.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/mchp-i2s-mcc.c | 28 ++++------------------------
 1 file changed, 4 insertions(+), 24 deletions(-)

diff --git a/sound/soc/atmel/mchp-i2s-mcc.c b/sound/soc/atmel/mchp-i2s-mcc.c
index 9d8043a85782..fe42a8c2cad3 100644
--- a/sound/soc/atmel/mchp-i2s-mcc.c
+++ b/sound/soc/atmel/mchp-i2s-mcc.c
@@ -1064,13 +1064,10 @@ static int mchp_i2s_mcc_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	dev->pclk = devm_clk_get(&pdev->dev, "pclk");
-	if (IS_ERR(dev->pclk)) {
-		err = PTR_ERR(dev->pclk);
-		dev_err(&pdev->dev,
-			"failed to get the peripheral clock: %d\n", err);
-		return err;
-	}
+	dev->pclk = devm_clk_get_enabled(&pdev->dev, "pclk");
+	if (IS_ERR(dev->pclk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dev->pclk),
+				     "failed to get/enable the peripheral clock\n");
 
 	/* Get the optional generated clock */
 	dev->gclk = devm_clk_get_optional(&pdev->dev, "gclk");
@@ -1087,19 +1084,11 @@ static int mchp_i2s_mcc_probe(struct platform_device *pdev)
 	dev->regmap = regmap;
 	platform_set_drvdata(pdev, dev);
 
-	err = clk_prepare_enable(dev->pclk);
-	if (err) {
-		dev_err(&pdev->dev,
-			"failed to enable the peripheral clock: %d\n", err);
-		return err;
-	}
-
 	err = devm_snd_soc_register_component(&pdev->dev,
 					      &mchp_i2s_mcc_component,
 					      &mchp_i2s_mcc_dai, 1);
 	if (err) {
 		dev_err(&pdev->dev, "failed to register DAI: %d\n", err);
-		clk_disable_unprepare(dev->pclk);
 		return err;
 	}
 
@@ -1109,7 +1098,6 @@ static int mchp_i2s_mcc_probe(struct platform_device *pdev)
 	err = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
 	if (err) {
 		dev_err(&pdev->dev, "failed to register PCM: %d\n", err);
-		clk_disable_unprepare(dev->pclk);
 		return err;
 	}
 
@@ -1121,20 +1109,12 @@ static int mchp_i2s_mcc_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static void mchp_i2s_mcc_remove(struct platform_device *pdev)
-{
-	struct mchp_i2s_mcc_dev *dev = platform_get_drvdata(pdev);
-
-	clk_disable_unprepare(dev->pclk);
-}
-
 static struct platform_driver mchp_i2s_mcc_driver = {
 	.driver		= {
 		.name	= "mchp_i2s_mcc",
 		.of_match_table	= mchp_i2s_mcc_dt_ids,
 	},
 	.probe		= mchp_i2s_mcc_probe,
-	.remove		= mchp_i2s_mcc_remove,
 };
 module_platform_driver(mchp_i2s_mcc_driver);
 
-- 
2.43.0

