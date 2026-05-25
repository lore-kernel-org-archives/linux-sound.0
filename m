Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93E1146588
	for <linux-sound@vger.kernel.org>; Mon, 25 May 2026 17:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779729500; cv=none; b=i8QHavx+ZuEx1ZuU+MlNm6ntPHQf2NmYfhS8OOM7P4T5LrRr2RuYAgjBDzDR0ZtrohUi+oCXhyl+fHmxf/5m3+AcxFvt9HQ/0O9BwzkAkUttSESFkZ9MNmGJGjFJ40U+KkPNtPNZgp9+yJB5xTusfhe8W2njoRMpyN6R1kxIbUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779729500; c=relaxed/simple;
	bh=Y5ct2xe4700wkCZz6smFN4AilbfcF42fH7SEOXqP+bg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=CGDt886ADAFn/EslAv6vhLHPazqBIs8LQxGmpKKn0YjZLXcdo4xiOdKvLRTuacCV+8L8bvsSwchEmWFKoFCEhP2MusxAMJ9rxfmihBNrDiAP69fLNnRwZuWr0V1TEiEdTtzECEPeZO65U2XtPAEljccKLjR1CdCHRW0efYNoc8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oGcwgZnt; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oGcwgZnt"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-30246cfd41aso1579676eec.1
        for <linux-sound@vger.kernel.org>; Mon, 25 May 2026 10:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779729498; x=1780334298; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vt66IeI9nKEEWLlFAgUegYdGwX2EcKUI70hfZtYIxuc=;
        b=oGcwgZnt1xrkzarj4cBgdxaDVC5gyGmfiQK1B6TZBXwOt5Rp0+UN9FyNEdUYcNnT3M
         suNG0Z5fqJdj9OGADQEIJeZd7EMprVX6bU9oSWSxBSy2flm0r7vY4bvtil2Y/HwodfTC
         1J+AUUcPZH/7nguUoAGfqD/Z7se3vuiyQMhuszguKUk8n0ZIwjj1EqNhDKQn8fag2qlV
         WpCDLtL+dLlmZoWESdPY7WIR9QZxJfGinlPeIlgFOsjQQ89TmEMI96IefslYk8RUryZj
         V+I9K39mu0DTFdZMDwbg7D1pTXymXY00eQVQpY1DGbL9JUT0fR4hiiNzpkd5Py17LiNn
         ARqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779729498; x=1780334298;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vt66IeI9nKEEWLlFAgUegYdGwX2EcKUI70hfZtYIxuc=;
        b=JEfjE/ca2dtLi963KGXd0E+zgO50SASar/Tlvat7cCvr5IhamXd+dPKXdDxIZ72M/0
         9232G0fc3kwU4zpPBhqbRN2qo+3MCSoTAOTSZfJ2OTW8KZiqXJ3YmKRHaS1RMdSbpvlV
         Wm67zIc4div4DgZ86eCh3C64DXerLwOWxvCQiSnp74X6+ekLbUmGalVI4nbxcXX7cEBi
         40/axM9OYaoLkJpZ8eheaBgKvZ1g/4R8ZYQ0GHKTvuYuYUtXwCLKED/ICAMgqO4JUCIM
         b0UIDiOwPHkEec1NaAkPnP/RrLwW31kygbgq456XdLXPPHpStSUtjsj/qr0vIwce+EMt
         xmKw==
X-Gm-Message-State: AOJu0Yx4zn7GHkeBSKvM+1j8NG5YukegpP1NEHkmUO5zDoeky7W4a+Uw
	AttnF6YXp5uRyqhvjaNHtP1KE8XueC6A46eG7p4NblVfyAl9m4s5Y38Dda6QCg==
X-Gm-Gg: Acq92OHJYRwtJfo11l5172/C7QOrM4bcD2Nki8coTfvNM27aDhy8XGrIfc+sDCDQ0+Z
	UUn5TjqcRuFtqc9NsQ30kTvs/aBNQVfrBEPb6GygCQ0vMkJu2JQa1Ug9YbMw9Vx39hAVHprgqwa
	vZiRcHhmiICZaZurx2vT3RjM6okcsvE1cAxq+BTMUBA6Bjqth9XQZKnPttYDKmHcLwAk+HgcSL/
	JQprVTbxFrmAiJC2FXt9eYoakP8/L4FlDQ43A1o1UsaOZVYq86rV7eZkC5DPiRwr1ZYWYGk6N1U
	d4fYc+onhzII3pNzhqyx8JKI7PFEB6qXctIehkZZpWLEeqc2WMSVgoXhqz5V5EPOJqAZbcmlCTc
	KS+CjhcZKAGt5HjM1ejA2Z7Zasw14+x+ypFVf4khgj2e4VkHbOlKiH/5HwnRZu5ulfJwONXWNkp
	1PE50K0jIeqEd/NwRs69n65k70uE/wTmsQgX3914dHy7kGtG0raKp/Tgu2x5Bqvv/UqLS1TYgEX
	XA/9bX5Ivess4otUKCTF2Y=
X-Received: by 2002:a05:7301:6589:b0:2ed:e12:3770 with SMTP id 5a478bee46e88-304491f622amr6819022eec.32.1779729497731;
        Mon, 25 May 2026 10:18:17 -0700 (PDT)
Received: from [192.168.1.18] (177-4-162-74.user3p.v-tal.net.br. [177.4.162.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3045245d6aesm7842090eec.26.2026.05.25.10.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 10:18:17 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Mon, 25 May 2026 14:18:03 -0300
Subject: [PATCH] ASoC: codecs: rk3328: Use managed GPIO and clock helpers
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260525-asoc-rk3328-devm-resources-v1-1-2abde0006f89@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBAF0KuUWTvQpE0RryIu4uRXo9jIjC1C6
 d2Nunybt5JBM4wOzUqKJVsuU4XbNSTXOF3AOVWTb/3QBtdztCKs967ze05YHqywMqvAOLiAmAa
 MkJ5q8FSM+f3Lj6e/bT7fIK/vSNv2AZSe0Z1+AAAA
X-Change-ID: 20260514-asoc-rk3328-devm-resources-515ead6efec4
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4208;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=Y5ct2xe4700wkCZz6smFN4AilbfcF42fH7SEOXqP+bg=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFkiLWHeN+JVQi0FDJbu2+S9Oym6xatgb4nPVysDNaV1b
 EUW8q86SlkYxLgYZMUUWVYnLbLc0/Xgan3cCg+YOaxMIEMYuDgFYCLhkQx/pW6WPGdz6XwVo37p
 2bTzTLPzj62Jiqi5ffDYrw1x62qmKTIyXGH/uPDJXLl8C6cnBfzp1ao3tTcanZq+gWFG3beyjC2
 7uAA=
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
base-commit: 8cd773d4f8235aaf0b04927b3c9d2d0326def09b
change-id: 20260514-asoc-rk3328-devm-resources-515ead6efec4

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

