Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8801A308F0A
	for <linux-sound@vger.kernel.org>; Sun, 26 Jul 2026 01:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785027927; cv=none; b=XWa0WTEMHSeO4dbftlgDgUu/5Pr6WE9sLMzsQ+sxVbJmfd99ySjP7VvhuHN4w+MprEtEgVQM1xpUFOCXu93IBeeUyWvsbkur72Dv7M0O9i83RJRzaSu4y+FipaoIY5bhuokjYfI3zXRyg/Ib1sOLxNkscP6UiEIs8MmoQDEjrNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785027927; c=relaxed/simple;
	bh=HpyyYcHV0QDWre1HzQWkRCOo52HgZFRIEAsFIinut0E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vCdtfZBGQGZNRtW7qesPxbs8ueB7o2Hauzpv2CsnQdBoX37YsJxGGx5lIh1o7dBa131Ma0V0wQuYnVO43xxMELWE85uvGj+p74/2ibeJUZ/UGZtaFexL5MLglzOOBJLB7D3lNxZY0+tFLMTsG5WD4tGuQWVkdw2yRU0zlwutJw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c7cMM+WO; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c7cMM+WO"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cad8076b01so18026495ad.2
        for <linux-sound@vger.kernel.org>; Sat, 25 Jul 2026 18:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785027926; x=1785632726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=euSwC6dPZiFaZaIT4hWsH8I/nZDprva/hiP/N1htvPw=;
        b=c7cMM+WOp5/nvf/V57wNGLhXOPj7H0tQV5lQ9FYEqFOtpBvlmXBvMGjnpUgxxk/eQq
         X9SfvSuD5I6iziRBsk7SGHtR4XhvEQHGy5Cs/BQ8Du5Zz2xn9Obymcu0llzM+Ig9qqfD
         azCoStoSIhFswlslv0JIKkb2lNtQBMtFwV+Uxf9wnrYRg4Mmx7SEUwRKIN7qYCt1p5ds
         X6MNtIJUw+/FLtyfQE0RmUnV/HKaZlout5vEBQXY7bJkttYNm+g70IUjfIJD0S/r+JAM
         cvMXC/KB+lNdsXC4dBfQ8udUs/qU/AWTWEayzp/DKaEBKGdWakifFisjZf/Mv8/QVAMx
         1q9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785027926; x=1785632726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=euSwC6dPZiFaZaIT4hWsH8I/nZDprva/hiP/N1htvPw=;
        b=rkGgklT2mI5PUtgcKcULl49iX0/OohbYmzGSEKYdfFJ7FilqvnAjsaTuzrIx/Lmmj6
         FyOhn53SKgTjeiWUSjT8LEnh5p8rXx8xYWWqbCpR9wPFptw0vagyzQSdZ2NktIBZ6utS
         qpoCxBt2zUj/BbSyOYR+vLODAh0QqKZWn/8rK/rMJCL1EcYnD+f9Ac3Lfu2llN88NTFs
         c4z/JHxqEL3j+zaI+GbfFn+/aFSuAdOnayR+dSBeR3PttyF2Ad6s5DCOCIZrwCV25sLZ
         CphT+MGtBk/JDy689zXaDcPW2eGuMdA+B3HsxfpyT84V0lC56UX/IkpjbtkQhjjMY0b1
         JyYQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq9au6Ienx7o9JRXGA6Sw+uknWWSSpuPpByi2bLFPWxfr23OLrYL3BG5UhLSOHp4WRvPU2bkxoEmpBYHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbaHl4Wrqj19omYt0DLp2EDyWhz/Oo2BP/oHNriL/3woWS+CcB
	nW2ATjXEcLv1Z87VDBhZDY/YFq/E8UyvNohF0/3Xm8oMlT4BUK7SsN+0
X-Gm-Gg: AR+sD10f6IP/pvtfa45KqgCH6IixuzMIOeH7KfYNW8iyfqDULYlmVooRHxEda44Yss2
	ie0bOffTHvJsYF6nZNVQ2Ah9WCOEX2tbWymAhPbWmuXDtndZaKflQTjApaghpbZBkHfo8B6N2GP
	q+tlGfBEGqGklJ29Zv1X+Za7mifO4U39ub0n++GhZleQzBZydAwtdavrFnrZHE/aT1gXZiOc3vh
	+z4/qu90vs0hwcXiZPFrKhHxR6f7jZItTS0EtQZMrv6Mr83VrttAzqmPfKC9HubyeQPhoNuos/U
	Xzh2DExdEwxLSZJQSRGXTYFDe05OytxtiUu8dNEGvYhfztd1bUSFNQu1GPzpnw4gdASui+lrcJR
	v7a2902bHYA+4clbpHYmioyrMl/AZeAPuVzSy3xcX9jgpFG1aJIrKbkfS5lf1HGd1elXs1JILKZ
	eR8TwB+CWpPeD/yuPldPaimywwwxY+/wS9slXPD4Uc2CBjbW5uRGGIu04Ct8yf3qCvcyFjv1Aqj
	W1U
X-Received: by 2002:a17:90b:39a7:b0:38e:b400:a854 with SMTP id 98e67ed59e1d1-38f2977c44cmr3701463a91.37.1785027925744;
        Sat, 25 Jul 2026 18:05:25 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:e2c2:1f24:32d5:9d51])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e0f4a039asm11821445c88.9.2026.07.25.18.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 18:05:24 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] ASoC: tlv320aic32x4: do not allocate gpio config separately
Date: Sat, 25 Jul 2026 18:05:12 -0700
Message-ID: <20260726010519.117805-2-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260726010519.117805-1-dmitry.torokhov@gmail.com>
References: <20260726010519.117805-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that the driver only works with device tree we do not need to
keep GPIO config separate from the driver structure.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 sound/soc/codecs/tlv320aic32x4.c | 47 +++++++++++++-------------------
 1 file changed, 19 insertions(+), 28 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c
index da582f2c940c..87b155599e94 100644
--- a/sound/soc/codecs/tlv320aic32x4.c
+++ b/sound/soc/codecs/tlv320aic32x4.c
@@ -31,10 +31,6 @@
 
 #include "tlv320aic32x4.h"
 
-struct aic32x4_setup_data {
-	unsigned int gpio_func[5];
-};
-
 struct aic32x4_priv {
 	struct regmap *regmap;
 	u32 power_cfg;
@@ -48,7 +44,8 @@ struct aic32x4_priv {
 	struct regulator *supply_dv;
 	struct regulator *supply_av;
 
-	struct aic32x4_setup_data *setup;
+	unsigned int gpio_func[5];
+
 	struct device *dev;
 	enum aic32x4_type type;
 
@@ -959,41 +956,41 @@ static void aic32x4_setup_gpios(struct snd_soc_component *component)
 
 	/* setup GPIO functions */
 	/* MFP1 */
-	if (aic32x4->setup->gpio_func[0] != AIC32X4_MFPX_DEFAULT_VALUE) {
+	if (aic32x4->gpio_func[0] != AIC32X4_MFPX_DEFAULT_VALUE) {
 		snd_soc_component_write(component, AIC32X4_DINCTL,
-			  aic32x4->setup->gpio_func[0]);
+			  aic32x4->gpio_func[0]);
 		snd_soc_add_component_controls(component, aic32x4_mfp1,
 			ARRAY_SIZE(aic32x4_mfp1));
 	}
 
 	/* MFP2 */
-	if (aic32x4->setup->gpio_func[1] != AIC32X4_MFPX_DEFAULT_VALUE) {
+	if (aic32x4->gpio_func[1] != AIC32X4_MFPX_DEFAULT_VALUE) {
 		snd_soc_component_write(component, AIC32X4_DOUTCTL,
-			  aic32x4->setup->gpio_func[1]);
+			  aic32x4->gpio_func[1]);
 		snd_soc_add_component_controls(component, aic32x4_mfp2,
 			ARRAY_SIZE(aic32x4_mfp2));
 	}
 
 	/* MFP3 */
-	if (aic32x4->setup->gpio_func[2] != AIC32X4_MFPX_DEFAULT_VALUE) {
+	if (aic32x4->gpio_func[2] != AIC32X4_MFPX_DEFAULT_VALUE) {
 		snd_soc_component_write(component, AIC32X4_SCLKCTL,
-			  aic32x4->setup->gpio_func[2]);
+			  aic32x4->gpio_func[2]);
 		snd_soc_add_component_controls(component, aic32x4_mfp3,
 			ARRAY_SIZE(aic32x4_mfp3));
 	}
 
 	/* MFP4 */
-	if (aic32x4->setup->gpio_func[3] != AIC32X4_MFPX_DEFAULT_VALUE) {
+	if (aic32x4->gpio_func[3] != AIC32X4_MFPX_DEFAULT_VALUE) {
 		snd_soc_component_write(component, AIC32X4_MISOCTL,
-			  aic32x4->setup->gpio_func[3]);
+			  aic32x4->gpio_func[3]);
 		snd_soc_add_component_controls(component, aic32x4_mfp4,
 			ARRAY_SIZE(aic32x4_mfp4));
 	}
 
 	/* MFP5 */
-	if (aic32x4->setup->gpio_func[4] != AIC32X4_MFPX_DEFAULT_VALUE) {
+	if (aic32x4->gpio_func[4] != AIC32X4_MFPX_DEFAULT_VALUE) {
 		snd_soc_component_write(component, AIC32X4_GPIOCTL,
-			  aic32x4->setup->gpio_func[4]);
+			  aic32x4->gpio_func[4]);
 		snd_soc_add_component_controls(component, aic32x4_mfp5,
 			ARRAY_SIZE(aic32x4_mfp5));
 	}
@@ -1016,8 +1013,7 @@ static int aic32x4_component_probe(struct snd_soc_component *component)
 	if (ret)
 		return ret;
 
-	if (aic32x4->setup)
-		aic32x4_setup_gpios(component);
+	aic32x4_setup_gpios(component);
 
 	clk_set_parent(clocks[0].clk, clocks[1].clk);
 	clk_set_parent(clocks[2].clk, clocks[3].clk);
@@ -1173,8 +1169,7 @@ static int aic32x4_tas2505_component_probe(struct snd_soc_component *component)
 	if (ret)
 		return ret;
 
-	if (aic32x4->setup)
-		aic32x4_setup_gpios(component);
+	aic32x4_setup_gpios(component);
 
 	clk_set_parent(clocks[0].clk, clocks[1].clk);
 	clk_set_parent(clocks[2].clk, clocks[3].clk);
@@ -1224,14 +1219,8 @@ static const struct snd_soc_component_driver soc_component_dev_aic32x4_tas2505 =
 static int aic32x4_parse_dt(struct aic32x4_priv *aic32x4,
 		struct device_node *np)
 {
-	struct aic32x4_setup_data *aic32x4_setup;
 	int ret;
 
-	aic32x4_setup = devm_kzalloc(aic32x4->dev, sizeof(*aic32x4_setup),
-							GFP_KERNEL);
-	if (!aic32x4_setup)
-		return -ENOMEM;
-
 	ret = of_property_match_string(np, "clock-names", "mclk");
 	if (ret < 0)
 		return -EINVAL;
@@ -1248,9 +1237,11 @@ static int aic32x4_parse_dt(struct aic32x4_priv *aic32x4,
 		gpiod_set_consumer_name(aic32x4->rstn_gpio, "tlv320aic32x4_rstn");
 	}
 
-	if (of_property_read_u32_array(np, "aic32x4-gpio-func",
-				aic32x4_setup->gpio_func, 5) >= 0)
-		aic32x4->setup = aic32x4_setup;
+	for (int i = 0; i < ARRAY_SIZE(aic32x4->gpio_func); i++)
+		aic32x4->gpio_func[i] = AIC32X4_MFPX_DEFAULT_VALUE;
+	of_property_read_u32_array(np, "aic32x4-gpio-func",
+				   aic32x4->gpio_func, ARRAY_SIZE(aic32x4->gpio_func));
+
 	return 0;
 }
 
-- 
2.55.0.229.g6434b31f56-goog

