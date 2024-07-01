Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEB284A32
	for <linux-sound@vger.kernel.org>; Mon,  1 Jul 2024 07:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719819597; cv=none; b=aw8+QOUqV/Sj6mJQxuKTLFNHZ4Sbk49aqs30+r+1DxT3Ppzzn9o7e04KKc572hPZukKOu/aiAG4URomEbR7VCsqxjX4RGOs8gHjhkfQfKYOJo1gi2k0H5j5SsEObL8q3HqL5JxTzSTlVtMGtQSsBsZ1eE7OTwjjPoPkAJsO4jpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719819597; c=relaxed/simple;
	bh=mHTTaZNpcGoV/mUxNlKDTFQQYgAom9YHnI/rebyFS7Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fjDmOsz80wz6b5r2nKTxbHrwDIwEFGwhNXs5jmMEk0lc9DtLGYT3SK3CwjJ1wa/FATuExB8Qnqi7Kyve8efz4q5Oj8vPwJtEiG212stQh32bR9ObtBRm2QfvSino4AiS3EAss49ibay2rdkOKCwwEqzi9UJ2lVKQAZWMJyh/g9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PhXcidIB; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PhXcidIB"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-367339bd00aso2047646f8f.3
        for <linux-sound@vger.kernel.org>; Mon, 01 Jul 2024 00:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719819594; x=1720424394; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LkhZEX+m4yRFERQhljwkeNudJNH97Tx+yLOdy4DNmag=;
        b=PhXcidIBQYT9Kbag+uEEEp6fuwRteJgOY7oV5HZanr1XlMaKWwUiimxNAgrSlpAbuE
         8eW3QiIUKxjvTMAqioVvUgy9O+6xYspxRqyHVrWbZkBLpESMlm8/9LLz3JLYHPBLfcOJ
         TGb25JVfhbJKqT/kcccg1A0MGdqxRLzzZPjQnNUbr1l8lNhudrQnEZCo9N9+7zTWiYCL
         plEoNXL6KJUA2r7gp+J4tz22bNMoHaDV1OY7/gmbhCFFDSYkkrrAhMZZq9p6bJiiZRko
         +kacKje6kazcefR0XXVhgVzQqBxFgTdQUHffQfWeaB+QjkqUUUGOnoAlWxQBXgM14ONh
         MtNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719819594; x=1720424394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LkhZEX+m4yRFERQhljwkeNudJNH97Tx+yLOdy4DNmag=;
        b=kiywezNze+z+1KHDBFu8T1I4O+Ds0rT77rKDSkmuIhcJx+nzanzVaQGfvO2YgDjXh1
         jzOvYWOALDsR7e4Y8rtm+CUEkN4QqfifYDyuciKM32PuCMq8hzUiCyqnt/oXdH2jSnYv
         xWd7riaPjTUQNHclFGKUM9R43J9yIdym5P/PnvP4GGrJqfxteCK3voOORi+LCaKvESQO
         ytZrsjNKMgETdyAxz4qAmqhVeY9LWaqYWUVb9wfRypw5nDKseB8ISi2f18E5J71chyhk
         hPU6iyXkPGaeFXIxplAf+8MDenJNfD+G3PqlzoenKmlkBd/7aQm4/TaqwIysuBbOtyx8
         5Bqw==
X-Forwarded-Encrypted: i=1; AJvYcCUEw3V00UsQ7ipL2uN7mhjrfalijL2aM4wX/YIPcbLNLys1JaLbjXojZujyqaaN/QkxWI8SM24+6IiDLYSMHAlfHd3L5Iu8ZQ0fOtA=
X-Gm-Message-State: AOJu0YwROyVCgzMWum0S/WqdeG5kPw33EToHvpWnerTHicqY/Wnf6/Zt
	rtV/OzmyfSn0uVe08338qnQSmc2gowRwdFRAroFT6b9hrgdc7Ff35rlpU0T9Hao=
X-Google-Smtp-Source: AGHT+IELAP7OOkaVhC6selMuvtx3yRVOwXrHRpbUfCYh3qaNYGybZnve/dhn7uV2G1WhEKJKJ5oHWw==
X-Received: by 2002:adf:f48e:0:b0:360:8537:ce27 with SMTP id ffacd0b85a97d-367756e5165mr3354107f8f.42.1719819594023;
        Mon, 01 Jul 2024 00:39:54 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0fb9absm9279936f8f.80.2024.07.01.00.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 00:39:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 01 Jul 2024 09:39:38 +0200
Subject: [PATCH v3 6/6] ASoC: codecs: lpass-wsa-macro: Simplify with
 cleanup.h
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240701-b4-qcom-audio-lpass-codec-cleanups-v3-6-6d98d4dd1ef5@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3389;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=mHTTaZNpcGoV/mUxNlKDTFQQYgAom9YHnI/rebyFS7Q=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmgl1AQS92yL9416c8UVe+w7/0WkAuH7E1cdUAC
 ++EDTJccBuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZoJdQAAKCRDBN2bmhouD
 1wEfD/wIHxe8tcpCX1EmCOcXJt2sUUnucJDFR+nNQ+DNVcA7ZufKmvMsEHQ1Mi7g7Ju0uhaRR9J
 DU9kt5wS350/08AZerCK99VA1Og8ddZwmAZ/gJoQXzKowQyjbwMw0gLheSEWkr1i1t3vJGpQNnS
 NbN/Gjg+IVHxrOCKgq68825mk5Q7v5WWM76u2201s4xIcSWajthZDoY6TM0C3x1rFsFckGBbvnc
 5zaPV8b5+UENozlrb2tSuKcDpoCJ2WS5MmmfkDhRzya23JADD3/shIZOzt26mrGnItt5ZRS7az0
 BQMFrrPRyYkc4GD1Po0YF72bdvPUTLyEt67WmKIlnnDUcOWe9kH4sE/Aey/+/JfURjkho0uEHpZ
 l6v9dHxXFMK2v9T5MMsh2IHA4sxRxyF0329W8cHUOFMMe/UM/KKXJPBkB1VbVacSukanSyyPt5D
 fVVisrQTdJbZWNdnCKCOXi0OEFBMr5m08sg0Oqn45wxTywy0E9yuuOHE5P9YXKnoQy5QhgDiS67
 zJfBW//uMxxbHNeFS9UMCc2/7Jv6hWt70uKbtsAM0D3/faMH1AZrVwbv0CbRiIrn4PGdZsVMLPz
 zqXSAD0WJtPyD1Y3i1yIeqy09EzyrfW66qIKWYsncv5VcNTY3+3lv1axz1fX3DfXqPbMniYeF1y
 ydRmGBLBBIPO6Ng==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Driver's probe() has two allocations which are needed only within the
probe() itself - for devm_regmap_init_mmio().

Usage of devm interface is a bit misleading here, because these can be
freed right after each scope finishes.

This makes the code a bit more obvious and self documenting.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. New patch
---
 sound/soc/codecs/lpass-wsa-macro.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index b4e7139bac61..73a588289408 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 // Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/io.h>
@@ -2725,8 +2726,6 @@ static const struct snd_soc_component_driver wsa_macro_component_drv = {
 static int wsa_macro_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct reg_default *reg_defaults;
-	struct regmap_config *reg_config;
 	struct wsa_macro *wsa;
 	kernel_ulong_t flags;
 	void __iomem *base;
@@ -2765,6 +2764,8 @@ static int wsa_macro_probe(struct platform_device *pdev)
 		return PTR_ERR(base);
 
 	wsa->codec_version = lpass_macro_get_codec_version();
+	struct reg_default *reg_defaults __free(kfree) = NULL;
+
 	switch (wsa->codec_version) {
 	case LPASS_CODEC_VERSION_1_0:
 	case LPASS_CODEC_VERSION_1_1:
@@ -2773,9 +2774,8 @@ static int wsa_macro_probe(struct platform_device *pdev)
 	case LPASS_CODEC_VERSION_2_1:
 		wsa->reg_layout = &wsa_codec_v2_1;
 		def_count = ARRAY_SIZE(wsa_defaults) + ARRAY_SIZE(wsa_defaults_v2_1);
-		reg_defaults = devm_kmalloc_array(dev, def_count,
-						  sizeof(*reg_defaults),
-						  GFP_KERNEL);
+		reg_defaults = kmalloc_array(def_count, sizeof(*reg_defaults),
+					     GFP_KERNEL);
 		if (!reg_defaults)
 			return -ENOMEM;
 		memcpy(&reg_defaults[0], wsa_defaults, sizeof(wsa_defaults));
@@ -2789,9 +2789,8 @@ static int wsa_macro_probe(struct platform_device *pdev)
 	case LPASS_CODEC_VERSION_2_8:
 		wsa->reg_layout = &wsa_codec_v2_5;
 		def_count = ARRAY_SIZE(wsa_defaults) + ARRAY_SIZE(wsa_defaults_v2_5);
-		reg_defaults = devm_kmalloc_array(dev, def_count,
-						  sizeof(*reg_defaults),
-						  GFP_KERNEL);
+		reg_defaults = kmalloc_array(def_count, sizeof(*reg_defaults),
+					     GFP_KERNEL);
 		if (!reg_defaults)
 			return -ENOMEM;
 		memcpy(&reg_defaults[0], wsa_defaults, sizeof(wsa_defaults));
@@ -2804,8 +2803,9 @@ static int wsa_macro_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	reg_config = devm_kmemdup(dev, &wsa_regmap_config,
-				  sizeof(*reg_config), GFP_KERNEL);
+	struct regmap_config *reg_config __free(kfree) = kmemdup(&wsa_regmap_config,
+								 sizeof(*reg_config),
+								 GFP_KERNEL);
 	if (!reg_config)
 		return -ENOMEM;
 
@@ -2816,8 +2816,6 @@ static int wsa_macro_probe(struct platform_device *pdev)
 	if (IS_ERR(wsa->regmap))
 		return PTR_ERR(wsa->regmap);
 
-	devm_kfree(dev, reg_config);
-	devm_kfree(dev, reg_defaults);
 	dev_set_drvdata(dev, wsa);
 
 	wsa->dev = dev;

-- 
2.43.0

