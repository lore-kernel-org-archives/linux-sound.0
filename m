Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CB92FFF9D
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 02:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779417019; cv=none; b=e+V+QK6iAjo6d0uKV4zwtNthDh+KC2bXQQrqZ2nzbWhBmJezL67hmZNS2NXfTdmQm63+YTNFeWho4Uw16MMqUXdbuEhV7QDi8jdWD0qjJoiHUeZk4lzoOnwO1ou+nw/HwqTzJbc8d7QBwSH8Dy4Ej1ZMa4+hPrHFC/rMwCPNkiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779417019; c=relaxed/simple;
	bh=TMV3OUjSiKWrVH9DS2Bb4U32yk1kAQtbOJI6PQhF/+k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hx6nDd1CQInsQRGhe2oCiMfAbr8PotPMQ44tZohL4TncRLh5cQht2VIbMwMg4tzTNexGoA+ogRtBB3AuCvdevPIWwJ7/mXxQW/KtINQG0W0gKZX3aCEs6ywI7Tsz7mUZjxEdjRN904cX/fJoTkbiht5tT8S+jmbZbBIQKD4ViFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rUHfnre8; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rUHfnre8"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1363e78746eso1654115c88.1
        for <linux-sound@vger.kernel.org>; Thu, 21 May 2026 19:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779417017; x=1780021817; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7P3tHPmrG3wLPqmsJl2HC3o69eg3JUch5W4/s30Hz1E=;
        b=rUHfnre8k7jaOqen7DrXBemdgW7umzjudtUTFdnZN304vd3Z3OB1AIhtr+iEQPqh+S
         Tqadd0mSfMBFyfgmUcg78wGTTyMsrQ3wP9frSfGgqqi8Yt2nMdDI3VyKUFHWrUel61HW
         TPBW4+foBQ7KFYQvAqLVWUyMFI2gYVoQXrpUCTzEIpALfj5wOOmN5WzQbGLBJwc6ReqW
         1VxVmYaNkFlrKHpHA4WGa883Xnc9M9bW6eAxf0z1Pf8pq4zEsfGNdiJkYRVxDigGUVnX
         qADMajh31AGHz6P+OH3FrMNQvEf0FD98UswiYjofHltQwQUCtxIZELO/h9nFafAyFB00
         LE9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779417017; x=1780021817;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7P3tHPmrG3wLPqmsJl2HC3o69eg3JUch5W4/s30Hz1E=;
        b=jVgSrvFacESIdOuqFyn7tnGukUwQ1ff9/329a8VJbenm5Oipeeje8bc206Yxx8jZis
         hS2BaU3tehDDxrkft/LNqgAf1CfCfVWRQaMBziOCSeWqWRuYETjlmZdl76/5TJEkXFSU
         nJtrj+wsz7f58Ko3W8YwwOSh4YBBkaawtN55q7dy+3tnjPF62JYACSyg6dIRhWuRkP5N
         i3SSKLW9AuUf6gEFlSL29g84vhMak7FPFapc1wD+X1JX32SsJLDN5MPvx78Ejz0oC38L
         jkApYnuUK1w8Q3v54yVQbiQ05pr+1TbGoMohCQJ2q/zdkBk+tJimAEwfeyZUgEp7F9W3
         tJWA==
X-Gm-Message-State: AOJu0YzGFemYLCplRpQeZ/JkeAbJxR2ZLscpl1lO6uUIpZo14KKChxAU
	cP4mqFsbuxcAnaH4rjrjOD+l12r+WDRhepPYlvlvVo8VB7LOIIvwmx+2KrdSG6io
X-Gm-Gg: Acq92OElDSBSD5HlxMANPLV5GX6pjVyE6p8g+LTC+Lr87yALSWrwa+83khPqpiVIo6H
	QNtDS70asgw0MRa+tWX34m5EKFpzaAmQd2+HhkYd9k85Q4Ax2NYFbz2SUUuVDN0t3lt6LxT/jck
	KT+ntHCOK9zS4Og6Vaq2EJs19MBpfX9knyzof7UBjujFQL+ZhSasvkIjwQqlIXmEX9goYdjp/Mq
	oKSlHB610rFdm3vrSowA9TxEEUHROJual2gtGiEcZHxfsGk5XWJatue3M3aUEdp9lGgZGETTzut
	f2pq+bEpKf/fW8z2lh02NPWnbg8Wmn8f5cFNK9JMU0epDR2Pc8wekgedhq3qihpZc059G14yNF/
	lrBKLYSZLdFZbq4N/ar9WkB1WGeVcNKfI2VqwEp3WR0PyBd5mtvuIHuPN52muN2lxZ4PJh/t5K0
	9Nl1UDniz1EjNUHdGoQxZ6YIb1EojfasVDR4t9b+n7fmd4iNYfPx/NfNUupQh9EHtxhzYLzjYUy
	Q==
X-Received: by 2002:a05:7022:661f:b0:135:f2aa:46da with SMTP id a92af1059eb24-1365f812eefmr696894c88.16.1779417017083;
        Thu, 21 May 2026 19:30:17 -0700 (PDT)
Received: from [192.168.1.18] (177-4-162-74.user3p.v-tal.net.br. [177.4.162.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13669c6a2adsm293024c88.0.2026.05.21.19.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 19:30:16 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Thu, 21 May 2026 23:30:07 -0300
Subject: [PATCH] ASoC: rockchip: i2s: Use managed hclk and runtime PM
 cleanup
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260521-asoc-rockchip-i2s-devm-cleanup-v1-1-9319bd781393@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNywrCMBBG4Vcps3agDaagryIu4uSvHS9NyNgil
 L67UZff5pyVDEVhdGxWKljUNE0V3a4hGcN0BWusJte6vvWu42BJuCS5y6iZ1RlHLE+WB8I0Z+4
 lRPhhf/DwVCO5YND3b3A6/23z5QZ5fau0bR/FocZRggAAAA==
X-Change-ID: 20260521-asoc-rockchip-i2s-devm-cleanup-6cade5f495e5
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5256;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=TMV3OUjSiKWrVH9DS2Bb4U32yk1kAQtbOJI6PQhF/+k=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFn8+7c+Pl3a4dA4+WnT0pC6856eb3pTIvWsll/tLAv/s
 1bePsGxo5SFQYyLQVZMkWV10iLLPV0PrtbHrfCAmcPKBDKEgYtTACYSK8fwz9R8pszmW4U/8iYG
 5VU7t8kESQb88EvrWX5vh1mvgrwXB8M/5cWzy6b+X9q3dUegnmSFT+rqjJN+wUa7/SOWc37vVvn
 MDQA=
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

The Rockchip I2S driver mixes devm-managed probe resources with manual
runtime PM and hclk cleanup.  This leaves the remove path doing runtime PM
shutdown and clock disable before devm-managed ASoC and PCM resources are
released.

Keep the bus clock enabled for the device lifetime with
devm_clk_get_enabled(), and move the runtime PM teardown into devres so the
unwind order matches the managed registrations.  This also removes the
remove callback, which only existed for cleanup.

Use a devm action for the final runtime suspend and register it before the
managed runtime PM action, so teardown disables runtime PM before forcing
the device into the suspended state.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/soc/rockchip/rockchip_i2s.c | 68 +++++++++++++++------------------------
 1 file changed, 26 insertions(+), 42 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index 49ff86b35ef1..4e3af0f37941 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -664,6 +664,14 @@ static const struct of_device_id rockchip_i2s_match[] __maybe_unused = {
 };
 MODULE_DEVICE_TABLE(of, rockchip_i2s_match);
 
+static void rockchip_i2s_suspend(void *data)
+{
+	struct device *dev = data;
+
+	if (!pm_runtime_status_suspended(dev))
+		i2s_runtime_suspend(dev);
+}
+
 static int rockchip_i2s_init_dai(struct rk_i2s_dev *i2s, struct resource *res,
 				 struct snd_soc_dai_driver **dp)
 {
@@ -758,37 +766,28 @@ static int rockchip_i2s_probe(struct platform_device *pdev)
 	}
 
 	/* try to prepare related clocks */
-	i2s->hclk = devm_clk_get(&pdev->dev, "i2s_hclk");
+	i2s->hclk = devm_clk_get_enabled(&pdev->dev, "i2s_hclk");
 	if (IS_ERR(i2s->hclk)) {
 		dev_err(&pdev->dev, "Can't retrieve i2s bus clock\n");
 		return PTR_ERR(i2s->hclk);
 	}
-	ret = clk_prepare_enable(i2s->hclk);
-	if (ret) {
-		dev_err(i2s->dev, "hclock enable failed %d\n", ret);
-		return ret;
-	}
 
 	i2s->mclk = devm_clk_get(&pdev->dev, "i2s_clk");
 	if (IS_ERR(i2s->mclk)) {
 		dev_err(&pdev->dev, "Can't retrieve i2s master clock\n");
-		ret = PTR_ERR(i2s->mclk);
-		goto err_clk;
+		return PTR_ERR(i2s->mclk);
 	}
 
 	regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
-	if (IS_ERR(regs)) {
-		ret = PTR_ERR(regs);
-		goto err_clk;
-	}
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
 
 	i2s->regmap = devm_regmap_init_mmio(&pdev->dev, regs,
 					    &rockchip_i2s_regmap_config);
 	if (IS_ERR(i2s->regmap)) {
 		dev_err(&pdev->dev,
 			"Failed to initialise managed register map\n");
-		ret = PTR_ERR(i2s->regmap);
-		goto err_clk;
+		return PTR_ERR(i2s->regmap);
 	}
 
 	i2s->bclk_ratio = 64;
@@ -799,8 +798,7 @@ static int rockchip_i2s_probe(struct platform_device *pdev)
 			i2s->bclk_off = pinctrl_lookup_state(i2s->pinctrl, "bclk_off");
 			if (IS_ERR_OR_NULL(i2s->bclk_off)) {
 				dev_err(&pdev->dev, "failed to find i2s bclk_off\n");
-				ret = -EINVAL;
-				goto err_clk;
+				return -EINVAL;
 			}
 		}
 	} else {
@@ -811,16 +809,23 @@ static int rockchip_i2s_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(&pdev->dev, i2s);
 
-	pm_runtime_enable(&pdev->dev);
+	ret = devm_add_action(&pdev->dev, rockchip_i2s_suspend, &pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return ret;
+
 	if (!pm_runtime_enabled(&pdev->dev)) {
 		ret = i2s_runtime_resume(&pdev->dev);
 		if (ret)
-			goto err_pm_disable;
+			return ret;
 	}
 
 	ret = rockchip_i2s_init_dai(i2s, res, &dai);
 	if (ret)
-		goto err_pm_disable;
+		return ret;
 
 	ret = devm_snd_soc_register_component(&pdev->dev,
 					      &rockchip_i2s_component,
@@ -828,36 +833,16 @@ static int rockchip_i2s_probe(struct platform_device *pdev)
 
 	if (ret) {
 		dev_err(&pdev->dev, "Could not register DAI\n");
-		goto err_suspend;
+		return ret;
 	}
 
 	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
 	if (ret) {
 		dev_err(&pdev->dev, "Could not register PCM\n");
-		goto err_suspend;
+		return ret;
 	}
 
 	return 0;
-
-err_suspend:
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		i2s_runtime_suspend(&pdev->dev);
-err_pm_disable:
-	pm_runtime_disable(&pdev->dev);
-err_clk:
-	clk_disable_unprepare(i2s->hclk);
-	return ret;
-}
-
-static void rockchip_i2s_remove(struct platform_device *pdev)
-{
-	struct rk_i2s_dev *i2s = dev_get_drvdata(&pdev->dev);
-
-	pm_runtime_disable(&pdev->dev);
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		i2s_runtime_suspend(&pdev->dev);
-
-	clk_disable_unprepare(i2s->hclk);
 }
 
 static const struct dev_pm_ops rockchip_i2s_pm_ops = {
@@ -866,7 +851,6 @@ static const struct dev_pm_ops rockchip_i2s_pm_ops = {
 
 static struct platform_driver rockchip_i2s_driver = {
 	.probe = rockchip_i2s_probe,
-	.remove = rockchip_i2s_remove,
 	.driver = {
 		.name = DRV_NAME,
 		.of_match_table = of_match_ptr(rockchip_i2s_match),

---
base-commit: 40cc9602caf2539369bd3dd7d66ee67e204e75ef
change-id: 20260521-asoc-rockchip-i2s-devm-cleanup-6cade5f495e5

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

