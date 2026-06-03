Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEBA288AD
	for <linux-sound@vger.kernel.org>; Wed,  3 Jun 2026 00:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780445190; cv=none; b=ea6NwkN1hiBjhh6eoppjOx407D9cFeCQZ7Rykq3wbyOX4cRk4GJalW2lejhYFSxGoCSbv+/kEEhIcw3cb8FGWsI3w61s2FcKkHBLZFmwsimZKM0dEF/0QasasLug1lv7cAETPBMqcfh1gj3ibFmyn6T+KPzJnrmesClmZmSLJjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780445190; c=relaxed/simple;
	bh=2w4S+ShRzY3e6nb7c/mx0EOXKPtCFUUnZDHsThboM2I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=F5SVgtsE/TXBUJMl6UbIyFXas4I8mBXiXo06aH8oBm6mAuVUUjVZYVRABqYJLzdT2VrFDpktdVSmCDvnzCBuyShkHirJyU6mY98T4ebxuEZvyI5+YI8WZibO6+PEt4kN4KkTVFKBFPUnJH1l/pB45yTcS1KHKKSd8PF3CDCbgc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l/wOW98f; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l/wOW98f"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-304f590dd91so4680416eec.0
        for <linux-sound@vger.kernel.org>; Tue, 02 Jun 2026 17:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780445187; x=1781049987; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NmZMHYhwOrmRmj2RahnT0vBMFNRDOJoIMTiIsWuD8IU=;
        b=l/wOW98fAgvYxEGWnSgdHGYEZ9Cit8siRfHaqkVMMokl05KvuiYSRg7M2OMRClhbZE
         pJaVV9pJ3faS/nPHG8CNnN0erTr5RqCNEiJu6RoLbraqbVY5Akj56c3E+geoyfvR5qK4
         LsvMRYTIJ5MMpwRZykclvQbOEgS2+gvlPkis97ORUOb4/qGyW9pWJLQqI8ol0YbvHNCI
         WoeIs++MfARfLd1hsb2bpZ/gOXIn0AQ9suIOOPBFaT/EMiS9HXF4HvxmBrSk30av27y4
         qq43z1G100W9Nsa5Tm74rfXPw/wxfMgjHVgGK5rtiq/fiE91EW75vC7yYC7dnteJJxuj
         ngTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780445187; x=1781049987;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NmZMHYhwOrmRmj2RahnT0vBMFNRDOJoIMTiIsWuD8IU=;
        b=kYj8A/4jAtTvTn3mesedrbSSjGJeifUM2inOfb9mp5Tg0VN8k2X6vNEIbNa4ulnmT8
         6RAWjCK+Yy9QqRQ9Kweer40DjN6i1uA1HDl4nZwpWi9LlTNKFne4yKI01yW9ekPFZ9hv
         Dtle/MtTdcwtCG4X2tvIU+IfCOTQNWa29FtWRc7V55eRPJkPoU8GsTKej8zKwG5YrcIm
         8wLSesrvHCZPmFdF62ILiQ0trYLKPeNz1lsT8nTi1lLWKBoeyY1qwko5lsWez5WnHAQI
         468Y4X23UZpc8z1krpZUBx5UbXyNvRZ3nmq+ZiuG3v32dVxdlG+s9RU1KqgA7Bcv0Pci
         +CaA==
X-Gm-Message-State: AOJu0Yy5m2s/qBZz31uFBkzTBUUG7hbT8hUDE1xCp6S6Ai5Lksudu+Z1
	bc7SXNAHfx0hgftqb2iXfieqsVaEoocCFe9hl2QIRsgAvaE0tXzYCzHnWnSzMg==
X-Gm-Gg: Acq92OFyZhcN9K8ngK/87+uAV004byj4uFu9ZxOHc+WZ4OVuIIWo0w7J11djhOSqj+M
	CPPUOzZykcL54ObhdwcIeffti/1lpjxIOfVp0ASO1myHSQFQ/SLE9iV9zQePMGtngiZaUp3ocEA
	Ew/+N1yyc/mdSEY5tOagoLYot7QU7DkxbTZC19PJ+SVeMOFL8BfhGNW2VOEBqfp1YGEsHLtwMmS
	lyxgy6hgyBfH4lkN3HkaEgcmq9hxJvmC/kTP8kCJWzdge4bAUevhVn9vpGXnbAjYkvQ8H0a5wZ7
	gxI7y5NkfQuwGL74tSqM6aTLXP4FDMJvOwKBCkxVDZmgalnTY+4GfK+Uyi5ZJD9zyYcCXGD5vwq
	2Z8TuqYSMTXjMsUSTBDW04qz/clQmbMo7MrV5RHA2jRBP1IH4Z4d665hcR5IZ+NNFGep7pYSlL9
	+jX6PTsGT6Axz+k+26Vsj4y7cMawv1QpLxMJ/nMRo8S1Lb3E3VnMSY1oHxuhMgF8Iy+keF8QZ9x
	Hh/JIZ/1dH3/zhuEfzRgEI=
X-Received: by 2002:a05:7300:371e:b0:303:f2dc:8ab4 with SMTP id 5a478bee46e88-3074fa3d73cmr577490eec.2.1780445186417;
        Tue, 02 Jun 2026 17:06:26 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-23.user3p.v-tal.net.br. [177.4.161.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db56697sm917881eec.2.2026.06.02.17.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 17:06:25 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Tue, 02 Jun 2026 21:06:21 -0300
Subject: [PATCH RESEND] ASoC: codecs: rk3328: Use managed GPIO and clock
 helpers
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260602-asoc-rk3328-devm-resources-v1-1-71878feb5f4c@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6XPsQ6CMBAG4FchnT3TFiHg5CCrg46GoZSrVIWaK
 xAN4d0FHNxcHP/L5fvvBuaRLHq2DQZG2FtvXTMFsQqYrlRzQbDllJnkMuYxF6C800C3MJQJlNj
 XQOhdRxo9qI1JRaikMcqwCXgQGvtc8DM7ZqfssGf5Z+674oq6neV505Croa0I1bcsktGvsl6AA
 KmKEjnnsUnS3aVW9r7Wrp7FyvrW0Wv5qxfLBf+q+TiOb38EkBswAQAA
X-Change-ID: 20260601-asoc-rk3328-devm-resources-a4f913a2ffaf
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 notify@kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4208;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=2w4S+ShRzY3e6nb7c/mx0EOXKPtCFUUnZDHsThboM2I=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFny+f+1L2aZn/bckanekP1bRcyG6X5Q/Z/vXut6rnQ/v
 WS89EpMRykLgxgXg6yYIsvqpEWWe7oeXK2PW+EBM4eVCWQIAxenAEwk1pmRYXnVSeNrK5x3L7ms
 mPn63d3ozoJoxVeib9YX6f58dfDK1CZGhtcx0ULSZ7o3BpYqzgp5b7zD6trq25t7j9/yPs7P8fJ
 sLh8A
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

rk3328_platform_probe() acquires the mute GPIO with gpiod_get_optional()
but never releases it. It also enables mclk and pclk manually while
relying on probe error labels for unwind, and the driver has no platform
remove callback to disable those clocks after a successful unbind.

This path has already needed fixes for missing clock unwinds on probe
errors. Use devm_gpiod_get_optional() and devm_clk_get_enabled() so the
GPIO and enabled clock lifetimes are tied to the device. This removes the
manual error labels and makes both probe failure and driver unbind follow
the normal devres cleanup path.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/soc/codecs/rk3328_codec.c | 54 ++++++++++-------------------------------
 1 file changed, 13 insertions(+), 41 deletions(-)

diff --git a/sound/soc/codecs/rk3328_codec.c b/sound/soc/codecs/rk3328_codec.c
index 9697aefc6e03..5871b5a81975 100644
--- a/sound/soc/codecs/rk3328_codec.c
+++ b/sound/soc/codecs/rk3328_codec.c
@@ -425,7 +425,6 @@ static int rk3328_platform_probe(struct platform_device *pdev)
 	struct rk3328_codec_priv *rk3328;
 	struct regmap *grf;
 	void __iomem *base;
-	int ret = 0;
 
 	rk3328 = devm_kzalloc(&pdev->dev, sizeof(*rk3328), GFP_KERNEL);
 	if (!rk3328)
@@ -441,14 +440,13 @@ static int rk3328_platform_probe(struct platform_device *pdev)
 	regmap_write(grf, RK3328_GRF_SOC_CON2,
 		     (BIT(14) << 16 | BIT(14)));
 
-	ret = of_property_read_u32(rk3328_np, "spk-depop-time-ms",
-				   &rk3328->spk_depop_time);
-	if (ret < 0) {
+	if (of_property_read_u32(rk3328_np, "spk-depop-time-ms",
+				 &rk3328->spk_depop_time)) {
 		dev_info(&pdev->dev, "spk_depop_time use default value.\n");
 		rk3328->spk_depop_time = 200;
 	}
 
-	rk3328->mute = gpiod_get_optional(&pdev->dev, "mute", GPIOD_OUT_HIGH);
+	rk3328->mute = devm_gpiod_get_optional(&pdev->dev, "mute", GPIOD_OUT_HIGH);
 	if (IS_ERR(rk3328->mute))
 		return PTR_ERR(rk3328->mute);
 	/*
@@ -461,57 +459,31 @@ static int rk3328_platform_probe(struct platform_device *pdev)
 		regmap_write(grf, RK3328_GRF_SOC_CON10, BIT(17) | BIT(1));
 	}
 
-	rk3328->mclk = devm_clk_get(&pdev->dev, "mclk");
+	rk3328->mclk = devm_clk_get_enabled(&pdev->dev, "mclk");
 	if (IS_ERR(rk3328->mclk))
 		return PTR_ERR(rk3328->mclk);
 
-	ret = clk_prepare_enable(rk3328->mclk);
-	if (ret)
-		return ret;
 	clk_set_rate(rk3328->mclk, INITIAL_FREQ);
 
-	rk3328->pclk = devm_clk_get(&pdev->dev, "pclk");
-	if (IS_ERR(rk3328->pclk)) {
-		dev_err(&pdev->dev, "can't get acodec pclk\n");
-		ret = PTR_ERR(rk3328->pclk);
-		goto err_unprepare_mclk;
-	}
-
-	ret = clk_prepare_enable(rk3328->pclk);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "failed to enable acodec pclk\n");
-		goto err_unprepare_mclk;
-	}
+	rk3328->pclk = devm_clk_get_enabled(&pdev->dev, "pclk");
+	if (IS_ERR(rk3328->pclk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(rk3328->pclk),
+				     "failed to get or enable acodec pclk\n");
 
 	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base)) {
-		ret = PTR_ERR(base);
-		goto err_unprepare_pclk;
-	}
+	if (IS_ERR(base))
+		return PTR_ERR(base);
 
 	rk3328->regmap = devm_regmap_init_mmio(&pdev->dev, base,
 					       &rk3328_codec_regmap_config);
-	if (IS_ERR(rk3328->regmap)) {
-		ret = PTR_ERR(rk3328->regmap);
-		goto err_unprepare_pclk;
-	}
+	if (IS_ERR(rk3328->regmap))
+		return PTR_ERR(rk3328->regmap);
 
 	platform_set_drvdata(pdev, rk3328);
 
-	ret = devm_snd_soc_register_component(&pdev->dev, &soc_codec_rk3328,
+	return devm_snd_soc_register_component(&pdev->dev, &soc_codec_rk3328,
 					       rk3328_dai,
 					       ARRAY_SIZE(rk3328_dai));
-	if (ret)
-		goto err_unprepare_pclk;
-
-	return 0;
-
-err_unprepare_pclk:
-	clk_disable_unprepare(rk3328->pclk);
-
-err_unprepare_mclk:
-	clk_disable_unprepare(rk3328->mclk);
-	return ret;
 }
 
 static const struct of_device_id rk3328_codec_of_match[] __maybe_unused = {

---
base-commit: 3c9e23488ff4447f66b48479be25eb28e693a9e7
change-id: 20260601-asoc-rk3328-devm-resources-a4f913a2ffaf

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

