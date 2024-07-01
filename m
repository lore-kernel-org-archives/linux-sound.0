Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C424E7D412
	for <linux-sound@vger.kernel.org>; Mon,  1 Jul 2024 07:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719819592; cv=none; b=hh5cIMOYTrhHU1ZzjjqcOvy7EC/3P5vsmuFbCe7RGvll43KXirQcrIZlOaRUeBQtIcsF+RAS5X68DhnMnJ4STMBzIvTdyuWFLfGyOAE+NMXW+tfcLGWOMe/OZACwrB1vwsKoF/knMzO9hW7PMMBmMmXgUgDzqWM27x3+WoUFZVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719819592; c=relaxed/simple;
	bh=2LXhDj+OjHwm9PSo2QZCbe9HMxUgBLthEvA3G7WWahk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pdR7B57RfWJvROvZZxX+uaTE5SV1AUG9kLHVSxGxetFOf6Mnvr02KD4h6czRz4+C20fIslwiJvpeQ4i/8ZVA6t7WlVijSGr8HCx4yvvIOvLFSldPbwRFp6bM7HgAF7nkIFLunJobsXgY5M9DLJE90WP8WsUnhm5HGDomO6SUaJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QCgNK904; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QCgNK904"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ec52fbb50cso26030781fa.2
        for <linux-sound@vger.kernel.org>; Mon, 01 Jul 2024 00:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719819589; x=1720424389; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S8ExwtvC8Rv0PryTWXbkCNqG0vwkQRpwqxJGJECfGVk=;
        b=QCgNK904GydpNZqfondsGDGIvlyafCkwElD1a6LkfdZKYua9uNjlplerVImHHKIowG
         34MHuPwhicBKlqyzZRXJsSDILdDksVbcoSTsVCX2X95MtTJNpkJGfFbQc/X3jIPeGEoF
         r1ShINGInYEO0JpQw1Qh+EWEahwE5rhCSjABHkQgBjBRJZt/Ap3FRb61aEUpiOP5g8tB
         Tl/pqicqT+NGZHu76XuqHzuSbsfWTz8oDWds1PVnzqpUZ5ZPymWgG3HK5e87ZIBkLhPU
         h9uigdZ0lk5FyZDetPA21uHhX0/ZJnOPZlodzFP7JV4btjUi4HaGtqNmyse1GPBSLGJE
         eKQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719819589; x=1720424389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S8ExwtvC8Rv0PryTWXbkCNqG0vwkQRpwqxJGJECfGVk=;
        b=IP/8ymcUU8UIKBa/GO+bELOev+OjE/bnlpPQSEmDvrTI3yufXJMPL5k4RFY5m+WaYY
         wOOu5JseqpK5VHa43R/ojVJtccmq3u0rEiIfzIrt9RNyYE0bKrukCL+w1GxxWkfovm+l
         haD+u6BLuz646MH7QBmGdmhCVB2HPuBZDpXjSYvIY1U8YHjIUAPPH0wEAQyEaWqWwhzR
         ES2HlpCcmR8d3lRkJbZ2kt2JKaLsxrxYALV8b/bB2fZeqHybZ4KqMYKe2+ZD6nsFse1B
         28GyAbjwWAYSJEpF810aZzUOpECZrKBOgrWH30xxPWAVWo5IHEhi/x8RUpcEJZouOgFV
         sEKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHZQlAXLc31PAnkUZVk43hEUvnZpG/ujgkFTqDiDx2tzzi2h4tMvepar3/mttlYlUbn23MM4cY78gonUM7kpaSEc0eideX70eX7bA=
X-Gm-Message-State: AOJu0YzgasKIDVidxGbUl6hvGbUTI37Vsn9o8PCG3oDq7gA12+0k/66v
	dmJWmdsMmnkK6pObkY82ogWbsFBq5G3sKK3pbUnXPkG/heYTE6MjvAZSd7bOylrP+GprCiZ4i3o
	W
X-Google-Smtp-Source: AGHT+IHhZFMA0XT6XBDgJiHh2nMdh9If6ijL1sfRHPnrXsiQhUhG2w0sX4XVs3IUQY3q0KizhIYGUw==
X-Received: by 2002:a2e:99c2:0:b0:2ec:50fa:1e47 with SMTP id 38308e7fff4ca-2ee5e392b79mr29326251fa.21.1719819588889;
        Mon, 01 Jul 2024 00:39:48 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0fb9absm9279936f8f.80.2024.07.01.00.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 00:39:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 01 Jul 2024 09:39:34 +0200
Subject: [PATCH v3 2/6] ASoC: codecs: lpass-rx-macro: Simplify with
 cleanup.h
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240701-b4-qcom-audio-lpass-codec-cleanups-v3-2-6d98d4dd1ef5@linaro.org>
References: <20240701-b4-qcom-audio-lpass-codec-cleanups-v3-0-6d98d4dd1ef5@linaro.org>
In-Reply-To: <20240701-b4-qcom-audio-lpass-codec-cleanups-v3-0-6d98d4dd1ef5@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2459;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=2LXhDj+OjHwm9PSo2QZCbe9HMxUgBLthEvA3G7WWahk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmgl08N1puNYLwMumh8OH49VAat5Ny9jHNO2iyY
 57k6THtXieJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZoJdPAAKCRDBN2bmhouD
 1//JD/9zt7hVaxdfvsXkn2F2F19ihi9vDCarT30YkxGA3IVJvvjXPnaZT5C1Xt6V2F3XAMi2V+L
 yg8KOfBaAgQ10sskIqnXUwJIw5oRsIO60s7mBNjpwHE1O9zykThNWZNRY9zaGQWeJtb/wE53L3T
 ctOQ9SyRUdKF4zKtquDYRJF7mUht2nNuCmOMWFUbK8xRAYFm0hmgNFjmCULr8X1os/Yyytk282N
 81l5OF9q1Cx3KbeWKLrlsJawjiqh3xXxvg5bzBQYGhpfYYyTKkdcK1LyUVVF74NkdxlDepZWXd9
 6LDZkFPgtoFW7+F+SeedcrKjpZk8aj+6jhWuNRfKipqK5756AZb4zdeFHTdtcbkc26EzKdh7DSr
 NOfP2fhazYtTEc0d3Bn8JEDX6zfAGWV4C7YnNKoGHK4TB2tlcLBR5i4pBDEIliiDN+zALH0ChTn
 inZfFV39xUrYmiSauHUelqX/gVuFOA+/8fiOPfhnsmYmHjWUeENk0k5skw2hjNJoUtqJ3YRKmUl
 kCYtIaDPlxxgI6oy2VJkKgF9dFvGymPDM1NuuNLme0oGoGljeR9i11DDVTLv0+11xJpGRi74Kjs
 icJ8U5RNKmVh8h8LO13LDpkpXewQK9gBX4twCTvk+rq/2gI12JUX9mXFvXBjPIWZtiCUbmhfxR0
 ADa/jYSfZoHnAjw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Allocate the default register values array with scoped/cleanup.h to
reduce number of error paths and make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Not adding Dmitry's Rb tag, because of major change devm->cleanup.h.
---
 sound/soc/codecs/lpass-rx-macro.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 77e734ad1885..638f3995a364 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 // Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/io.h>
@@ -3764,7 +3765,6 @@ static const struct snd_soc_component_driver rx_macro_component_drv = {
 
 static int rx_macro_probe(struct platform_device *pdev)
 {
-	struct reg_default *reg_defaults;
 	struct device *dev = &pdev->dev;
 	kernel_ulong_t flags;
 	struct rx_macro *rx;
@@ -3812,6 +3812,8 @@ static int rx_macro_probe(struct platform_device *pdev)
 		return PTR_ERR(base);
 
 	rx->codec_version = lpass_macro_get_codec_version();
+	struct reg_default *reg_defaults __free(kfree) = NULL;
+
 	switch (rx->codec_version) {
 	case LPASS_CODEC_VERSION_1_0:
 	case LPASS_CODEC_VERSION_1_1:
@@ -3849,10 +3851,8 @@ static int rx_macro_probe(struct platform_device *pdev)
 	rx_regmap_config.num_reg_defaults = def_count;
 
 	rx->regmap = devm_regmap_init_mmio(dev, base, &rx_regmap_config);
-	if (IS_ERR(rx->regmap)) {
-		ret = PTR_ERR(rx->regmap);
-		goto err_ver;
-	}
+	if (IS_ERR(rx->regmap))
+		return PTR_ERR(rx->regmap);
 
 	dev_set_drvdata(dev, rx);
 
@@ -3864,7 +3864,7 @@ static int rx_macro_probe(struct platform_device *pdev)
 
 	ret = clk_prepare_enable(rx->macro);
 	if (ret)
-		goto err_ver;
+		return ret;
 
 	ret = clk_prepare_enable(rx->dcodec);
 	if (ret)
@@ -3910,7 +3910,6 @@ static int rx_macro_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_clkout;
 
-	kfree(reg_defaults);
 	return 0;
 
 err_clkout:
@@ -3923,8 +3922,6 @@ static int rx_macro_probe(struct platform_device *pdev)
 	clk_disable_unprepare(rx->dcodec);
 err_dcodec:
 	clk_disable_unprepare(rx->macro);
-err_ver:
-	kfree(reg_defaults);
 
 	return ret;
 }

-- 
2.43.0

