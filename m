Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794391603;
	b=dmCL6RstLJQ2H5Vi3sywaFIgWHv84u1n595EQdXcd7APWZjDfM5TnhNDG478EViSmHhl
	 cPf3+uARgE4YCLffCz/7OtOqMjZ/wus/i4Brw2iH3mqpQlgLw2gLVh4en+Y7S3hY1vZuj
	 wnD1mae2xD3VNtf3VnddWiewZ2kvMrZ1wtoqQFZvxSNEzBbqE9TayiJ+wDWnAvMBOqVQO
	 QTGaRZYPASFFe04wL9GupOMaWFAIn7EWv5l91xGLpQd4CFP2DKcrxvMhjJ8K1x2wdEz+b
	 eMVbs9rUJ/AJbdF8NUuQQjjm3AsAEc0f5vo57PDjGuGRb7NL8IPbzqfEC9XET9lYVwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794391603;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=p7pXPD4xGmJxoqNUMjBHFW+XcIKHkp+3oSxhorL2mg4=;
	b=4sAbtWRYjbJzJ8DmhpR80corChUQjsaRPm8Teoo0kFYsTWinGLZtN5fNL0OKPEbwwb7g
	 1pzNVZv3tUWGDM1T3kcdxVcnZryj4jCM28OROE+n7TOoItUGMVmcTRc34vIaxQyRO+eC0
	 S9SfAFz9aAMVPG1bdtDKpZjKxpi0mx5WiOlAkIkxVBfyCmjGb38goK0dix8qBeA3sUlCL
	 RMUk1wMVLiVo6T6KD6VWT2pikVCYCcXi+fzCal3oKQoknNCRQ19RH7O6AOwk9jNwU7zhX
	 jrUL39WBeLNiyP5Z0TMCUWxjwZ6QQSUTxqRZ98PBrJmBU/E4vkfielQwMBQsCJQFl4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DzZDsV0s;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A41606A324
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 10:06:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05A41606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DzZDsV0s
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-15dd124bbe7so4288256c88.1
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 02:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794391602; x=1794996402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p7pXPD4xGmJxoqNUMjBHFW+XcIKHkp+3oSxhorL2mg4=;
        b=DzZDsV0slanOAv+Ga2+ZN6fIpcvDf/MJz+XlMPxNBDDwH7estQbZoWAqniNTgyT2as
         TThk8EoBD1DwJ+5bAoyAn7Q7pXTkIkJfu4cY1Jaf/SdysL6ISvhIdrRdwrVSvkm583vH
         DuhtlKmuMpSWDK8UWIzWJgjsou4doDZKv1tEaInxS7Ed3JWwKwsaOWS+ZA4MGcqtIcyR
         GQISYUWEWCPRSXRtCNuqoe6cX8a965VgAQ2jOWjUeRmvsK0sBVDApQN6SC+eqxTOxGqF
         1hlh7K2MnDyVPN6Jq7kC1nDYhIv2T9P1IC4BhOkO4dZPpCxAF38XGHe++KedCdVIme1l
         hLyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794391602; x=1794996402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p7pXPD4xGmJxoqNUMjBHFW+XcIKHkp+3oSxhorL2mg4=;
        b=dqxsR2F2Ut60trDQARa7NNNud4vHedtp8em44XFpk1RNFta9mb+H+tvvjUjlywO8s9
         BgiXZVCuiEN2QGFdrQMWWDI4gV66AdMeNIF7k43oJulS0LTiwB5qjWypP0gEyreETs1c
         ddnXmwr6588ODWQV6oCjz/e7ASSYit39WVCaiNxEz8Vs3IY5/0gstHDAfZ7PnTFLXC51
         9agSTTmSWB3QJUtWEXpZCbn7YZUC4VY+72XYc7qMwg67Z4/hzn8+NlMtOHMYH9vZnaRQ
         1aH6BqMvBTvBvDLHW4/BpC/T9PKQxm4Pcy6Z6qc/+XosZPwuiYJNNNYi/PEwMFtC648n
         rakw==
X-Forwarded-Encrypted: i=1; AL+hErG9+LzbR2y7hGfxMaPzHkD6eZfwpr4EUkx5PzOI91ttg+gIPgz+evXTXjrvUcWGMQtGcZ8YS99dOWXc5Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z91D9qe8BEamsqdA9wV4MHU4m8o9/Igq4+L9o0zojDbgIgU7a7T
	PC6JEQZviqanj6YR45x6FuVHGIyLZ0tAyjJaP2v+NLFOYPb+5k7BiVTP
X-Gm-Gg: AYBFou36zgF6XQZUx1Xh71z6rWVnpk5jFrRGjZ1ZuqAWhievnHOoaD5BOEA3O/WT4T/
	W1RzZxvd/2xynC26dabUX0V/wJfGFTxPTvNWfzjRZ+TobH58T8dq/liLM9K++WIxHlBjtUZn5bi
	j5hQ4rniFV9z3KtVU7XBk2oTB2vYl5oDl0acyOHFTdK/DtWOX0ZsALtpEUKUuccxma4Y1ieFUSS
	hhE5Q+yda5CCr529aZjPxGTn4f1NcsLAU5YbthNP2s/pYgCybFMGttHAExptnAJqwY1PBBSqukr
	Lt15PwBsgw8n5epRfJouaSg3ruxwFJSsAdqXTpWVDLwbpAdm/Wzz5es6xYIrtUQCjhFBS6F1A/d
	fF73xuz/CeVeNZ+z1Ylx0B/GLGgokOi3h2lj/zzpf9a+Di0aJz3F6DUQEHc5pnxjEjmrTBbsFNg
	hieUWK+rS//z1bnA9If5KkwW1dqMQ0OUbfq8gfex9IRKXUslzC1PCG1XMxhaNUdiZqJTxXKjDaG
	Bhog9HW8IY729mgk4J0TDpeB3kiublzDPcJ/s1dTUIa34tUabELwJZfMNm0BdOO7Owi+l5Rv/Id
	dgrJpR8PmOeyKnQf0DlTKNcuvvOTkLDOph8UJYi8QD6516QZ/Kcj4hB/QYgNVa3Sq/4dHKU5MuT
	qHf0ADQDRO3M1WwfI8WLPf+AZnz3lyGmict07VRmzYklQR3K9o9C1En4H8cxqp/WuzQ8=
X-Received: by 2002:a05:701b:42c9:10b0:194:3a84:e67d with SMTP id a92af1059eb24-1b3c0360b4cmr2033927c88.44.1794391601941;
        Wed, 11 Nov 2026 02:06:41 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890584sm15778025c88.3.2026.11.11.02.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:06:41 -0800 (PST)
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
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 1/2] ASoC: atmel-i2s: Use devm_clk_get_enabled() for pclk
Date: Wed, 11 Nov 2026 17:06:15 +0700
Message-ID: <20261111100616.31211-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111100616.31211-1-phucduc.bui@gmail.com>
References: <20261111100616.31211-1-phucduc.bui@gmail.com>
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

The peripheral clock is only acquired and enabled once during
probe. Use devm_clk_get_enabled() to combine clock acquisition
and enabling into a single call.

Since the clock is now enabled during probe, request the IRQ
afterwards to ensure it is freed before the clock is disabled
during teardown.

This also removes the need for manual clock disable handling
on probe failures and in the remove callback, as the devm API
automatically handles clock cleanup.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Move the devm_request_irq() call below clock initialization and
   dev->regmap setup, as suggested by Sashiko.

 sound/soc/atmel/atmel-i2s.c | 43 +++++++++++++------------------------
 1 file changed, 15 insertions(+), 28 deletions(-)

diff --git a/sound/soc/atmel/atmel-i2s.c b/sound/soc/atmel/atmel-i2s.c
index e1d8af056234..60e885980f4c 100644
--- a/sound/soc/atmel/atmel-i2s.c
+++ b/sound/soc/atmel/atmel-i2s.c
@@ -650,21 +650,16 @@ static int atmel_i2s_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	/* Request IRQ. */
+	/* Get the IRQ. */
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
 
-	err = devm_request_irq(&pdev->dev, irq, atmel_i2s_interrupt, 0,
-			       dev_name(&pdev->dev), dev);
-	if (err)
-		return err;
-
-	/* Get the peripheral clock. */
-	dev->pclk = devm_clk_get(&pdev->dev, "pclk");
+	/* Get and enable the peripheral clock. */
+	dev->pclk = devm_clk_get_enabled(&pdev->dev, "pclk");
 	if (IS_ERR(dev->pclk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(dev->pclk),
-				     "failed to get the peripheral clock\n");
+				     "failed to get/enable the peripheral clock\n");
 
 	/* Get audio clock to generate the I2S Master Clock (I2S_MCK) */
 	dev->gclk = devm_clk_get_optional(&pdev->dev, "gclk");
@@ -675,6 +670,15 @@ static int atmel_i2s_probe(struct platform_device *pdev)
 	dev->regmap = regmap;
 	platform_set_drvdata(pdev, dev);
 
+	/*
+	 * Request IRQ after initializing dev->regmap and enabling pclk,
+	 * so devres frees the IRQ before disabling pclk.
+	 */
+	err = devm_request_irq(&pdev->dev, irq, atmel_i2s_interrupt, 0,
+			       dev_name(&pdev->dev), dev);
+	if (err)
+		return err;
+
 	/* Do hardware specific settings to initialize I2S_MCK generator */
 	if (dev->caps && dev->caps->mck_init) {
 		err = dev->caps->mck_init(dev, np);
@@ -682,11 +686,6 @@ static int atmel_i2s_probe(struct platform_device *pdev)
 			return err;
 	}
 
-	/* Enable the peripheral clock. */
-	err = clk_prepare_enable(dev->pclk);
-	if (err)
-		return err;
-
 	/* Get IP version. */
 	regmap_read(dev->regmap, ATMEL_I2SC_VERSION, &version);
 	dev_info(&pdev->dev, "hw version: %#x\n", version);
@@ -698,10 +697,8 @@ static int atmel_i2s_probe(struct platform_device *pdev)
 	err = devm_snd_soc_register_component(&pdev->dev,
 					      &atmel_i2s_component,
 					      &atmel_i2s_dai, 1);
-	if (err) {
-		clk_disable_unprepare(dev->pclk);
+	if (err)
 		return err;
-	}
 
 	/* Prepare DMA config. */
 	dev->playback.addr	= (dma_addr_t)mem->start + ATMEL_I2SC_THR;
@@ -712,28 +709,18 @@ static int atmel_i2s_probe(struct platform_device *pdev)
 	if (of_property_match_string(np, "dma-names", "rx-tx") == 0)
 		pcm_flags |= SND_DMAENGINE_PCM_FLAG_HALF_DUPLEX;
 	err = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, pcm_flags);
-	if (err) {
-		clk_disable_unprepare(dev->pclk);
+	if (err)
 		return err;
-	}
 
 	return 0;
 }
 
-static void atmel_i2s_remove(struct platform_device *pdev)
-{
-	struct atmel_i2s_dev *dev = platform_get_drvdata(pdev);
-
-	clk_disable_unprepare(dev->pclk);
-}
-
 static struct platform_driver atmel_i2s_driver = {
 	.driver		= {
 		.name	= "atmel_i2s",
 		.of_match_table	= atmel_i2s_dt_ids,
 	},
 	.probe		= atmel_i2s_probe,
-	.remove		= atmel_i2s_remove,
 };
 module_platform_driver(atmel_i2s_driver);
 
-- 
2.43.0

