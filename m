Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF572405FD
	for <linux-sound@vger.kernel.org>; Wed, 12 Mar 2025 13:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741786323; cv=none; b=UuR123kTTGwmIs4qfDmh4lyTO7snOdiJte8j6sGty6lEzzuoFbLgK8ZB40pr+yFxv+1e+0DMWvcyfAzvElNbWbIF+HeWGouzoI3R72+BriPLGFzBPde7TAGMeATc/GJKWnsEgHbBKKZ77v5RlKQrCGgt+LigNPe72lguaQ8/n1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741786323; c=relaxed/simple;
	bh=B2zg89GIjP4Vel9rjY60WJg2IxDwXSUmQq5358BYne8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SQmkO8MY9m8OFuAxl+CW46z1PURlq8OYyt/qOM2EecuDFkoJwe/iFGOoJOkA8K3LubTU3D/SC1hk5X7S83GNBdVzSsMUP/55gh/FEpTb43+0/7jFoFT777yB4IPucZP5TnwgmEcR239mjWhYp9jHRlhqul+cjZdnNd56FzxACE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P/rsYzAl; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P/rsYzAl"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5499659e669so5853234e87.3
        for <linux-sound@vger.kernel.org>; Wed, 12 Mar 2025 06:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741786319; x=1742391119; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rhEAQfn62WOeRCSbphjKXE9NxiHRh23KMe48CXfTNhE=;
        b=P/rsYzAlGsx4IP/leeQuVQV/uH8fdhRh9JyUxFmp5MYITIuqPIKI7HyiJNgxV5lF2J
         RPtTfbVw4EqUnG+s8C2BBZQi3jmf2jVhfXOCRv+5dV5NXuRuaGdzBVXjq4y3RfxtXRvE
         tQh96atuTvoTFFhanoYUT5uXl31cum9gUjcBe0xHcjRb+K2tTyXaSG8IkHnJ3lMbYM+f
         r+AQnDexG+jzE/uwlHQtknFo0FHGW285ZA+0acc80pTBMkvAT+SN9HEwRfdFPl+jlRi1
         0crnExtP97a0HvxCW1WkA4noZvB9vB2MlMoVQXIKyfnADMXyUCtU12fNVq1isUN0Bmpi
         bLaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741786319; x=1742391119;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rhEAQfn62WOeRCSbphjKXE9NxiHRh23KMe48CXfTNhE=;
        b=LBrTUs5t4LpjQnR3/NPxBGGf1GDw2geP+ondSpSW5kjFs3TYtRxWCjTLHpqCusTZkZ
         fCfhNPHcZXJGSz4UKtGISaOslZhG+Hki9TNyw3VC+dFh9u6/dO7pB/gcP5GaigW90RVq
         KW4gL+QYiBPNjIjEw997KVAWZ+/QJUwEBzIk+s/5KFcWVbOutif5TUmYUKo7WpJuDIhy
         +yKwqOOmorP3KehdT7nEGyPMvhkjn4gL0Af8LGD9zNH4UrmNTquyccVaif3MLi9WBH79
         qEGBMmXf6u9QjOG3CZjurLwiTL66Ub6MvgPL6lFQEQo/7Cc9sxlVLdlGjoxNQqIW232a
         TmHQ==
X-Gm-Message-State: AOJu0YyxCssPuC2i6T5AEiNWDni31NnwMe/8AArpjKAzkjh6+OFA32z5
	NAqgTIfMvFAZbxgtIzpyVuaCfDnQ1Ko+SEgc0B6uA1bbQ+Z6vMtVXiUFxWBF45k=
X-Gm-Gg: ASbGncvQ/MPmV0vjJmxiCFaJ2cdy4yRD/oyHeaE5ioL1Gbrn/a+6gBM7gc/bm40ncMA
	Qd8/8J8nnqGtezLhcJhLT0J/OG+N4IBEOeJAAKcbYcKTbhNAjQ45KPO2vpX355IILHiaMDevHyc
	Ekr3q6Ie0T88cBBJNArPSYLflSS3nO4Op6Vbw82sUUX2ae8iBceHKKLaG2oOOidNimMNnDftOLP
	GaRKzXg6+5rHVJ/1zNdWY5MW0kYxFCexH2Rppn5sJwkXgfcgd+huMXO6JmFB/ZS0H0et3liGJZ2
	MK/52oEjrVCS1H+ntsqrSaGRXMV8dXqjY47APBA9AYYY/5zq+0N4Zdw=
X-Google-Smtp-Source: AGHT+IHWnYCBrhTvqZlyPcM3tIeZ8BhMfC97IsTwkUhgOge8nCWIzSOCXKGn/GCNcPGwk8qaNI9Vyw==
X-Received: by 2002:ac2:5b04:0:b0:549:91db:c14b with SMTP id 2adb3069b0e04-549abaaad27mr2034068e87.8.1741786318790;
        Wed, 12 Mar 2025 06:31:58 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498ae460desm2121858e87.24.2025.03.12.06.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 06:31:57 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 12 Mar 2025 14:31:51 +0100
Subject: [PATCH 2/3] ASoC: pcm3008: Convert to GPIO descriptors
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-pcm-codecs-v1-2-41ffc4f8fc5c@linaro.org>
References: <20250312-pcm-codecs-v1-0-41ffc4f8fc5c@linaro.org>
In-Reply-To: <20250312-pcm-codecs-v1-0-41ffc4f8fc5c@linaro.org>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2

This converts the PCM3008 driver to look up the GPIO lines
using descriptors.

Apparently there are no in-tree users of the platform data
struct, so users need to adopt.

New users can associate the GPIO lines with the platform
device "pcm3008-codec".

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/codecs/pcm3008.c | 61 ++++++++++++++++++++++++----------------------
 sound/soc/codecs/pcm3008.h | 19 ---------------
 2 files changed, 32 insertions(+), 48 deletions(-)

diff --git a/sound/soc/codecs/pcm3008.c b/sound/soc/codecs/pcm3008.c
index 09c6c1326833d66dd12c60ff243c9bd9ffda36d9..d3d2e7f40170c8335f5f8ca4d20863accb638c61 100644
--- a/sound/soc/codecs/pcm3008.c
+++ b/sound/soc/codecs/pcm3008.c
@@ -14,7 +14,7 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/device.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/slab.h>
 #include <linux/module.h>
 #include <sound/core.h>
@@ -22,17 +22,22 @@
 #include <sound/initval.h>
 #include <sound/soc.h>
 
-#include "pcm3008.h"
+struct pcm3008 {
+	struct gpio_desc *dem0_pin;
+	struct gpio_desc *dem1_pin;
+	struct gpio_desc *pdad_pin;
+	struct gpio_desc *pdda_pin;
+};
 
 static int pcm3008_dac_ev(struct snd_soc_dapm_widget *w,
 			  struct snd_kcontrol *kcontrol,
 			  int event)
 {
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
-	struct pcm3008_setup_data *setup = component->dev->platform_data;
+	struct pcm3008 *pcm = component->dev->platform_data;
 
-	gpio_set_value_cansleep(setup->pdda_pin,
-				SND_SOC_DAPM_EVENT_ON(event));
+	gpiod_set_value_cansleep(pcm->pdda_pin,
+				 SND_SOC_DAPM_EVENT_ON(event));
 
 	return 0;
 }
@@ -42,10 +47,10 @@ static int pcm3008_adc_ev(struct snd_soc_dapm_widget *w,
 			  int event)
 {
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
-	struct pcm3008_setup_data *setup = component->dev->platform_data;
+	struct pcm3008 *pcm = component->dev->platform_data;
 
-	gpio_set_value_cansleep(setup->pdad_pin,
-				SND_SOC_DAPM_EVENT_ON(event));
+	gpiod_set_value_cansleep(pcm->pdad_pin,
+				 SND_SOC_DAPM_EVENT_ON(event));
 
 	return 0;
 }
@@ -106,11 +111,13 @@ static const struct snd_soc_component_driver soc_component_dev_pcm3008 = {
 
 static int pcm3008_codec_probe(struct platform_device *pdev)
 {
-	struct pcm3008_setup_data *setup = pdev->dev.platform_data;
-	int ret;
+	struct device *dev = &pdev->dev;
+	struct pcm3008 *pcm;
 
-	if (!setup)
-		return -EINVAL;
+	pcm = devm_kzalloc(dev, sizeof(*pcm), GFP_KERNEL);
+	if (!pcm)
+		return -ENOMEM;
+	platform_set_drvdata(pdev, pcm);
 
 	/* DEM1  DEM0  DE-EMPHASIS_MODE
 	 * Low   Low   De-emphasis 44.1 kHz ON
@@ -120,30 +127,26 @@ static int pcm3008_codec_probe(struct platform_device *pdev)
 	 */
 
 	/* Configure DEM0 GPIO (turning OFF DAC De-emphasis). */
-	ret = devm_gpio_request_one(&pdev->dev, setup->dem0_pin,
-				    GPIOF_OUT_INIT_HIGH, "codec_dem0");
-	if (ret != 0)
-		return ret;
+	pcm->dem0_pin = devm_gpiod_get(dev, "dem0", GPIOD_OUT_HIGH);
+	if (IS_ERR(pcm->dem0_pin))
+		return PTR_ERR(pcm->dem0_pin);
 
 	/* Configure DEM1 GPIO (turning OFF DAC De-emphasis). */
-	ret = devm_gpio_request_one(&pdev->dev, setup->dem1_pin,
-				    GPIOF_OUT_INIT_LOW, "codec_dem1");
-	if (ret != 0)
-		return ret;
+	pcm->dem1_pin = devm_gpiod_get(dev, "dem1", GPIOD_OUT_LOW);
+	if (IS_ERR(pcm->dem1_pin))
+		return PTR_ERR(pcm->dem1_pin);
 
 	/* Configure PDAD GPIO. */
-	ret = devm_gpio_request_one(&pdev->dev, setup->pdad_pin,
-				    GPIOF_OUT_INIT_LOW, "codec_pdad");
-	if (ret != 0)
-		return ret;
+	pcm->pdad_pin = devm_gpiod_get(dev, "pdad", GPIOD_OUT_LOW);
+	if (IS_ERR(pcm->pdad_pin))
+		return PTR_ERR(pcm->pdad_pin);
 
 	/* Configure PDDA GPIO. */
-	ret = devm_gpio_request_one(&pdev->dev, setup->pdda_pin,
-				    GPIOF_OUT_INIT_LOW, "codec_pdda");
-	if (ret != 0)
-		return ret;
+	pcm->pdda_pin = devm_gpiod_get(dev, "pdda", GPIOD_OUT_LOW);
+	if (IS_ERR(pcm->pdda_pin))
+		return PTR_ERR(pcm->pdda_pin);
 
-	return devm_snd_soc_register_component(&pdev->dev,
+	return devm_snd_soc_register_component(dev,
 			&soc_component_dev_pcm3008, &pcm3008_dai, 1);
 }
 
diff --git a/sound/soc/codecs/pcm3008.h b/sound/soc/codecs/pcm3008.h
deleted file mode 100644
index f7f4fbbd89db2bd4fb8d29059bf404d34d939dad..0000000000000000000000000000000000000000
--- a/sound/soc/codecs/pcm3008.h
+++ /dev/null
@@ -1,19 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * PCM3008 ALSA SoC Layer
- *
- * Author:	Hugo Villeneuve
- * Copyright (C) 2008 Lyrtech inc
- */
-
-#ifndef __LINUX_SND_SOC_PCM3008_H
-#define __LINUX_SND_SOC_PCM3008_H
-
-struct pcm3008_setup_data {
-	unsigned dem0_pin;
-	unsigned dem1_pin;
-	unsigned pdad_pin;
-	unsigned pdda_pin;
-};
-
-#endif

-- 
2.48.1

