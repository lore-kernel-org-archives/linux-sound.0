Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794371289;
	b=NdrlOXN6fV/inCS52FMZ9+v12SMJzSbzKHWlzpeTCFdE5wGI0tg9jHbnuwKqfNXw+vx/
	 bnzKP5JKDffK8PeDE6/Iq3bks/9Xwr3+3tVG+gLjjjgmh6Vsn/jk8ZYTGcPIt5F1lDaTw
	 wmRvUyCEJUw0GH9LG3cUezV+IynpXUAocJC3ft/GCKw6Iew8xz3uP+A3ZqPL7BMM5sgUF
	 kI7OfhrEHX93dN7151/hCaQd6WR7JbfGosI/VFco6xx0pcdmcspIjIwv6AhmmOFGk4oeY
	 Ea5neEEf7XeBuqOAxYwbMZw9cnWHGXkltcQKswR9hheeuEPrKUTma4+7AcH0WTiocMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794371289;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FlI97Kbc5IzIm3OlbOAAkvy4qx91Md/wmJY6Baz+hNI=;
	b=HF3Km5OboMictHaMcxfCC8ukWu+kAZJEZ9uM90v40qz79Ia9WUVHXmjJTCJh726hlFFD
	 5YtY47H7ePPDvJ38d8d1bCiPsxTyBAl+6QtOiQMt8mSmp1l4HHxxV4kCnW+N3r35FEkoO
	 ivqupp5mXi48KTbAawhQgL4l0BYcFXb305L25oqhfHg0uPTGyL6XspuNyVbcqSmUd4AA1
	 3sQ9dvut9YJ1RVKIPo7rfWuRw6ZCLL2/3wfcMU/tDcoK7G9mMym0wMrZKTzzHlcFqUVhr
	 mZP+4dyQs6ZweKr3qFgCkx9LULwoBQVdZQxwZW1MjddOi+81otIUOjT27Rbkrl19qog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="owpn/r8R";
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FB5606A320
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 04:28:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8FB5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=owpn/r8R
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso4263915eec.0
        for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 20:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794371288; x=1794976088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FlI97Kbc5IzIm3OlbOAAkvy4qx91Md/wmJY6Baz+hNI=;
        b=owpn/r8R9714otjCr2GYliPgfhTAREp1zvbZSxSkrbdvgddt9P+QXCkv8qKkVH5y/5
         zyekUSBFbShuAW4CdeCyGfm4IzP2OgTCtBPx/YnjoohV+MSQMVxgh99hAZ+AZ0jI6093
         AB49JePse3AmZvLzNMmNb4SgEMkKHz7Hx/kbr9YY1OPZ9CRiLxn3UU5JhVS9bpzUG6Ki
         ZlvzSK2Do7BeBrhrrI+bjuNB0GFrVP/WYpJGKg3CByALs+ndMgNsWAbhBLOzIeuJ93Q1
         3vOPkBhpFNbS2zxMTirIc8ULcXTnbQL+o6V/a6QLOSeM5LaOXzN8RETZ5Xcx0u/5m0N1
         o67g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794371288; x=1794976088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FlI97Kbc5IzIm3OlbOAAkvy4qx91Md/wmJY6Baz+hNI=;
        b=nfZO2fRVmHotDVerh/SofD/ShHwmx51dyKmWk3j5LlmPoI1xd5UCdgov6OjSp0xo44
         +M1Wlq/ntHic6tAOmjk7/0pk9LIzPCGgNHiZH5tjlsyOY71/Oo3Zz7HTVczgc7nZyLZ9
         2QErpU5pBfhx8nCVW0bneNuarpfOzxsiEFAIiae3krA0Nulg68A7yYEuWK9clFbdD8am
         ZOOMPm+lsY9PfR3ofj39dAJWdRbvnBKjWQ84RzCJtYOZL0YhV0egDdjv12M7KXDhruMU
         Oq/YuIA+1mWXafjzNXMPelrKsUaxzVPfCuwPDMaSbqsQXYg3cO9LJwi5Bpz2FKhwakMw
         SnCQ==
X-Forwarded-Encrypted: i=1; AL+hErEYXMfaj2CZRTzvxji57+MVtJwhU7A1fZR3qjtuTQ/ILui3SRz2darNoX7FoTNaT5u6pPaly0nJ/TIP5A==@vger.kernel.org
X-Gm-Message-State: APuU4Z9L8f6DbqrDBNg2CHhQS0ITvsKpXJT4ImRF99cMrxNNmDSVxSxt
	gWjbFfUrM2XrE552kS3Vl2yh7Hb7S/Ri5K6zCUQhKyLzUfNYZvGDBmKC
X-Gm-Gg: AYBFou1bXWfMzVcpWHW9KqMvJB/S0enIJcCUSrB3fu22JNCzPjw6pDRttuRGCPrzgcJ
	SAQLGqqO7lKBGVD47U25GAY1EqFWYITEeqKbcAGYMNR0gEhp/Y9LsfMEZoY1SHRWXPyH3bYO3yy
	BnjhqkTV0XDgAEoPb76vmchxSwRmi7f0p/FOIsvxMriwu//c3NhxTlHDWgyJbDMdIRtn3EzYOzz
	DeepTfZ2cSHHmoRtU+kzcZr7OGbLCJPjKvyHO6gnNAONgkmpQKAN6LgouEJVF/C2aJNNH1k15zh
	JW6D3dnFH1aM7cXEcmxh1z77DwPVa6A97GOF/EDLE+vB/DIlziLP1PAHZpklDe5F18cflBJW3xU
	Zs4WBdm2VHr+g2ZR89t5HGYRDTp5I4/Ly+zUk2q2ozgepJ3RmIhlUpdRafbPUPm7kGxmS2VGKGh
	yX76D6vEsmvum2/ByNSLlbYxZxsses8e1/m/SU+w869eTTf4oDdTR4/BoobScy2G+WJk5PPPMUr
	2YmVA9o5ys6hOowdBtUPh42Il0+f7dJtoflTLmcd9SP1g1ir8yVkub+Pujt/x9yA6blVQfPsesB
	XV1+A+Ww1v62GOzapmOCeOhwkmCO5TywhmugvKpSQ98k1DhIZo6pub4ZK6Qa0q0NE9B1l1kd6P7
	n3jEt8m3hfl+2Ks7RdPDYs0fzSik63IIZmAzaC474DxjH
X-Received: by 2002:a05:7301:d80f:20b0:36f:6d81:3fa6 with SMTP id 5a478bee46e88-37685a83893mr2193123eec.6.1794371287541;
        Tue, 10 Nov 2026 20:28:07 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375218c863csm11132090eec.28.2026.11.10.20.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:28:07 -0800 (PST)
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
Subject: [PATCH] ASoC: atmel-i2s: Use devm_clk_get_enabled() for pclk
Date: Wed, 11 Nov 2026 11:27:46 +0700
Message-ID: <20261111042746.14714-1-phucduc.bui@gmail.com>
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

From: bui duc phuc <phucduc.bui@gmail.com>

The peripheral clock is only acquired and enabled once during
probe. Use devm_clk_get_enabled() to combine clock acquisition
and enabling into a single call.

This also removes the need for manual clock disable handling
on probe failures and in the remove callback, as the devm API
automatically handles clock cleanup.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/atmel-i2s.c | 25 ++++---------------------
 1 file changed, 4 insertions(+), 21 deletions(-)

diff --git a/sound/soc/atmel/atmel-i2s.c b/sound/soc/atmel/atmel-i2s.c
index e1d8af056234..a3aeb8e607f6 100644
--- a/sound/soc/atmel/atmel-i2s.c
+++ b/sound/soc/atmel/atmel-i2s.c
@@ -660,8 +660,8 @@ static int atmel_i2s_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	/* Get the peripheral clock. */
-	dev->pclk = devm_clk_get(&pdev->dev, "pclk");
+	/* Get and enable the peripheral clock. */
+	dev->pclk = devm_clk_get_enabled(&pdev->dev, "pclk");
 	if (IS_ERR(dev->pclk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(dev->pclk),
 				     "failed to get the peripheral clock\n");
@@ -682,11 +682,6 @@ static int atmel_i2s_probe(struct platform_device *pdev)
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
@@ -698,10 +693,8 @@ static int atmel_i2s_probe(struct platform_device *pdev)
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
@@ -712,28 +705,18 @@ static int atmel_i2s_probe(struct platform_device *pdev)
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

