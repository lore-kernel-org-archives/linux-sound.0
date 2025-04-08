Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1174A265608
	for <linux-sound@vger.kernel.org>; Tue,  8 Apr 2025 07:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744097919; cv=none; b=Tuvkj4d0RQl8LmnT7FqliazgVYGXbPJHdTafVuqu4HR1josU52Wja1FkBGAv01wfLwz2j6PV3R+5dxUAKW3tkPgwDEtKPpr2mZ7giyeWN+8mIHZX6dInmkPtE+Inr3E1pwrNWdCJPmu4tAIq3H8CMqT2vci1VYYPbH2qq7Lsh8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744097919; c=relaxed/simple;
	bh=QyM9Y2T9KFk9FIF6coN2uL+8ky5fWHdeo/FQXvejEe4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hwn3qKlH9xcVmh9DVOlWAKG9t/4HPByUFL3D4GUT537GprHyWlbrmUJwtbuFo+wrJ7ZTukGN5hdSTfueYXbVl4KJ2ZWmToT28+okaA2aXjfaQYV9nFPMMZFPFOWYix579iGw8SrgqfrULJQ88NRjrTLZ5AkzntPFm9oSirgvZtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=2/vmbU6j; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="2/vmbU6j"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so56908395e9.3
        for <linux-sound@vger.kernel.org>; Tue, 08 Apr 2025 00:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744097915; x=1744702715; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W803SFoPErBgnl6+mnZ477H39AcMJ+KI3OFr89zmp24=;
        b=2/vmbU6jcZCKPgKVxlMnyBjQaArjIFx563FFYtOta6vvij/7yLmQP9TMuCPFuRNfhx
         ZnoEg6kgeeHJHCu0ezsOFTr1K3LOA0h7nuRynVM8I4WruiLvNivhvRNqIWOrJUh2nDTB
         txv9KGsnozLmySpIM2NiuQoBU7TSKdMYPSvDVbAtyTXHSm44m93pYplyLFSlcp5UTQuc
         ps7q3fmuUIHeRvZ3hxmgn7XWnxxUfq/Ne6yjhMhbrBCdLJD4Ot40YBoAiVb1G2ZCWBJJ
         ekbtORcteRp5OmJm8zTxiLXaWk4q3wAVNXD9857OPB/FvCcEy/Cmf+MRbmmdJubmRFs2
         DrvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744097915; x=1744702715;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W803SFoPErBgnl6+mnZ477H39AcMJ+KI3OFr89zmp24=;
        b=nC2gKiXSvDQGPvqVl/Bd4z7CQ9isxExbYlhy1xGm1OKaaNqNLToz4i/CFIfm/aEq/e
         1Q8HtIJX94ihvkZEgKlhaYQcreInb2uqrZlvYdSjFiDDr2SgaO37Xe4We4HfA4v0Sa1a
         aro1qnDNXDolEbKQ3BAqG7q3fQZoc8uK8yyk1haH5vnVUO4OC0l8CD62gmlE3sQ1tABi
         nLzMBV+a5yefpzHbMhEwZiD7qVafI4HLahkHEweFBhc/Q0myxJN9JOlRJvu4GuTfWRRk
         0l17J9V1wdJRNrLWygkxp4l25ScbZP4gxeUMjQsbZkdHhzzB/wlnX/oU/Ee0oosYxcZE
         nyYQ==
X-Gm-Message-State: AOJu0YzJUf4GAkVN1mTvVn6qKCN8194SQiItbwCEaNgxUh/e4hqrnUeH
	fMqW4jXYI3LwIb37v0qPqC+ppcgBjk8sPhonRGg9LAt0sQkvRCRSfyQvdvggplk=
X-Gm-Gg: ASbGncvk3CKP8UL96PUs0pZ3BCCj3Gr8gg2LmpXSzHsRznCxyza+M4/DQDWoJ8Rqqcr
	s1TWY969P5u5hbIwFWDmNhl4EYBX4m1TjiNIr1SmT2U7teiJAcvw0pl3elepiNd1iuYLFLrzCus
	Kr37zodzD5ExBGNaROehwCP98Iv6Dx7hTskNifRnC5eLnOAFHA0DoGBFVHZXcMAFa82jWevlGAs
	Qqf+sTnOOR8gHJ98emQIZmi3NRdkvi1CL1U4uosJ6HPiSbfn0DRLpLib2NkWetoLhs2juUNdViN
	usMZjczWSScVV8hDHBeDJREhFe2UskoBNk2Uow==
X-Google-Smtp-Source: AGHT+IFu6lZjvoeA0BI6CTAms2fH8tDTh0Ob12qHNOFNaOg2B+9x5oIaqW97sCHJZtmtAyMcmFnsjQ==
X-Received: by 2002:a05:6000:4212:b0:39c:3108:3746 with SMTP id ffacd0b85a97d-39d14662f19mr12870082f8f.52.1744097915381;
        Tue, 08 Apr 2025 00:38:35 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30239813sm13892137f8f.101.2025.04.08.00.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:38:35 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:38:27 +0200
Subject: [PATCH 09/12] ASoC: codecs: peb2466: use new GPIO line value
 setter callbacks
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-sound-v1-9-dd54b6ca1ef9@linaro.org>
References: <20250408-gpiochip-set-rv-sound-v1-0-dd54b6ca1ef9@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-sound-v1-0-dd54b6ca1ef9@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
 Oder Chiou <oder_chiou@realtek.com>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Herve Codina <herve.codina@bootlin.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, patches@opensource.cirrus.com, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2569;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=y4V5c/YLi6h6vrcHaV9RorzHXNL2yLbtaONpy+VaplY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9NJvxXG45j3PQaKR207Rl+yciiaJhmVkwRAT/
 peItlc1PaaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TSbwAKCRARpy6gFHHX
 cuilD/9ZQ1TM0g2o7wCTvTxqpJDnIQT6Pidi0cJW+3Ak5pKNfe8AkS/6gI2e9hdn2ERVgBV4yg1
 3iRb3J0oWGBqMnLH3fEHdTTLPAaH4NBy9tDHDuow5zKbrwQSNk355uNwBnOXx+rW5XkqWvrzZ9F
 jyeYEUJKNQ9TMVVbU/WFKJBwMl8vxHq3IOJSU2QV7I0bkk8w1Ntocj+PsdiJVPgytTRBtCtricw
 QzWo6sQNusiRtXVLPM/3cxsCV2akzeIsQpOn+w7qZTl7a3azVd8TN4FfY9bZ4HLaVTXwiHt5V2s
 2OfbMW5KopN017da73uNUe21evhpmliBIHDza+Jf5arY4wiyhVnZOxAZCNwvASuFtRv2fxTybeS
 GWctWsOnLezDNmT1BCAsO2qzB60wwC9xENqhs3TQ4oY2/LKX+MrdGJCuqbkNYSwQ7uIw0HEqwEv
 fPg3ouPHfvGNZ9HSBe9mw7cyY1cr6Xw2jvp8+NA0uPk4toUq3mjAC5CEKmwS7mFaSAR9r6k4VbU
 RDvyIPf0/9iKSGZeFtpSgZgoHyOB9jN3KNeK6uWi/pG7LJFggJqrgOSvx71C9GMJlfLyFcEVgBw
 Ouc37XqH6Cnhn92YG3fBTw//AFeQ+Ooa1t+/m2seLwXYz1VHee2IvocOtyjoQ4kwLHO3O/iP63i
 /GqnHGx5vxkI7zA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 sound/soc/codecs/peb2466.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/peb2466.c b/sound/soc/codecs/peb2466.c
index a989cfe058f0..b8905c03445e 100644
--- a/sound/soc/codecs/peb2466.c
+++ b/sound/soc/codecs/peb2466.c
@@ -1726,7 +1726,8 @@ static int peb2466_chip_gpio_update_bits(struct peb2466 *peb2466, unsigned int x
 	return ret;
 }
 
-static void peb2466_chip_gpio_set(struct gpio_chip *c, unsigned int offset, int val)
+static int peb2466_chip_gpio_set(struct gpio_chip *c, unsigned int offset,
+				 int val)
 {
 	struct peb2466 *peb2466 = gpiochip_get_data(c);
 	unsigned int xr_reg;
@@ -1740,14 +1741,14 @@ static void peb2466_chip_gpio_set(struct gpio_chip *c, unsigned int offset, int
 		 */
 		dev_warn(&peb2466->spi->dev, "cannot set gpio %d (read-only)\n",
 			 offset);
-		return;
+		return -EINVAL;
 	}
 
 	ret = peb2466_chip_gpio_offset_to_data_regmask(offset, &xr_reg, &mask);
 	if (ret) {
 		dev_err(&peb2466->spi->dev, "cannot set gpio %d (%d)\n",
 			offset, ret);
-		return;
+		return ret;
 	}
 
 	ret = peb2466_chip_gpio_update_bits(peb2466, xr_reg, mask, val ? mask : 0);
@@ -1755,6 +1756,8 @@ static void peb2466_chip_gpio_set(struct gpio_chip *c, unsigned int offset, int
 		dev_err(&peb2466->spi->dev, "set gpio %d (0x%x, 0x%x) failed (%d)\n",
 			offset, xr_reg, mask, ret);
 	}
+
+	return ret;
 }
 
 static int peb2466_chip_gpio_get(struct gpio_chip *c, unsigned int offset)
@@ -1879,7 +1882,9 @@ static int peb2466_chip_direction_output(struct gpio_chip *c, unsigned int offse
 		return -EINVAL;
 	}
 
-	peb2466_chip_gpio_set(c, offset, val);
+	ret = peb2466_chip_gpio_set(c, offset, val);
+	if (ret)
+		return ret;
 
 	if (offset < 16) {
 		/* SOx_{0,1} */
@@ -1940,7 +1945,7 @@ static int peb2466_gpio_init(struct peb2466 *peb2466)
 	peb2466->gpio.gpio_chip.direction_input = peb2466_chip_direction_input;
 	peb2466->gpio.gpio_chip.direction_output = peb2466_chip_direction_output;
 	peb2466->gpio.gpio_chip.get = peb2466_chip_gpio_get;
-	peb2466->gpio.gpio_chip.set = peb2466_chip_gpio_set;
+	peb2466->gpio.gpio_chip.set_rv = peb2466_chip_gpio_set;
 	peb2466->gpio.gpio_chip.can_sleep = true;
 
 	return devm_gpiochip_add_data(&peb2466->spi->dev, &peb2466->gpio.gpio_chip,

-- 
2.45.2

