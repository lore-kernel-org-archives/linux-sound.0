Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A0C26463F
	for <linux-sound@vger.kernel.org>; Tue,  8 Apr 2025 07:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744097915; cv=none; b=tARS3QS4R44vy5jYOzZo2OLy/6rwQ6ssV66GrQmXcP3l/blGZsOD7pY3Q0N0dXcAw0hJeEZ8vPvzC+Udg0/bI5fZmhVOD2Y+73MfsoakSTq/pmRsUqV9oQzGqt+ee7T0AiKz6mPylfZnUjaxGjqRtq9/hUt93aqAcBjMw5BaNxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744097915; c=relaxed/simple;
	bh=gmKssN881RyaMdbX9IDKos6vpe0C9x5lclww+lbf4e4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D1j9h7rMMYeAsuAvAUtBRW0/dgUAz3QqhjAKiFqYp9HGZ0buPCR44Jtj24sZEF5WU/00hVhNMPFbfh20HIgLrO7O3RYUFG1eEOYL/zjuLV2Bz0b1DUTV7mLoCFxycX0QOtwtFfrf4tWEO/5sqcQIkqUT4/LazNCOY0uVmMWq/so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=zpKGol//; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="zpKGol//"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39727fe912cso2230099f8f.3
        for <linux-sound@vger.kernel.org>; Tue, 08 Apr 2025 00:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744097912; x=1744702712; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LQVmUT29V2vBtC9E+gdEFAxcap/8e4R6NNrtBDHE7iQ=;
        b=zpKGol//Mt5OILiY9yqXj2vaJ4bvigJlZ+KtIIfWpKOHQIcibL7AT2h5z7nwcgNBWf
         664teir3Gl4Y+XC2chp7oqu5MwKcEJpkoGImMKwdPKUhyEhggXNHPfKocpHhEj/NNMWa
         WWTzwkEH4DeHWkzXlHzFkoe/By8LA8rJazGlXvRvcJjDwLiBqEXmOLdXIIM+Soh4Mqi0
         xzZvIdyuf7rfCDsjmciLWlS8OrSN7sdmSQU79mk8TKshaj6oNJKFz/IdEbw+v7dcNKxX
         btH6xZa0ieEurCxreWDCsYvtKVwVSzEVkm1Jph86qZuRn1z6CBxVlTUugm20roSMiN+d
         FUeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744097912; x=1744702712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LQVmUT29V2vBtC9E+gdEFAxcap/8e4R6NNrtBDHE7iQ=;
        b=a41A96yEbdCRSX+I1CLuRbForABD2qAW+Z8PrGOjrDlFSOO53Szfx7Ny6iTyMoc2r0
         qfT561JTLnBZAl067zKgEp60c2Y2huVW2Hz1CWM/VRqIml07YPr6QDpSrnOQOCIIps7/
         tmhQ9sd6kaFeGV81WpAANBDQFrXcF+MG5kRQyykn2Vsx0p55ykNELVxyF9PCKyo+OUZi
         O4+Q8WLAadLu/vrXGGfHVnUB2u4RBgRzbNicfN5awxYDb1sHX53zIXhnIWqLQL42Fxdo
         Y5fVpnjhZjw6Egi1zUrEjTO1si/DssWg/RCJeicEC39fQft18JwOygUCwN5VqnEZvm4j
         CJbg==
X-Gm-Message-State: AOJu0YxTXzV1nUzUCUcLYvOm6AneawrHisKImgQnZViA7Tmg9O/Iiu6l
	Y3tADQpZxNujbM4zVKAMTjowddoWM5u5Hhc1fTtv0QWzV6Zq6+tj60MCrzt2bNc=
X-Gm-Gg: ASbGncsleyVDYX3UEngsfnK89v3VWNwdOfYoRUvRa37VsAbv0/0nPk1N2jfa0puOpRU
	FSN1aCohQ7gXqdYsS3Tf1gQfrRS2DBYzA407TL7A2FVIRXm7kleV8Ztn301ZzVR9e+Q0y1kk67X
	zYuUZBbeKzkg81kyDeZy2EC+gO5bLjTQ8EpHXeU5iAtMM1tbjoGDDZLdhIDX1cqssh2AtAGFBpH
	shNcyv6A517Az82VEJLjGZ4prKxZ6Y79P5zFukm3MhuUloWg906zkH5WwQ8YkcxQ5vECJ4+vefN
	NuPoV7C3GHMFrqRC+HcaVj/f22YAxqi3SGkovA==
X-Google-Smtp-Source: AGHT+IGUJn8Zq34HDc5Dha7/WV8HrI2iZCosrT+ksBpGa3LxTqmcQ7HJ8H3bhYBFYza4iwBG7cA9tw==
X-Received: by 2002:a5d:59ad:0:b0:391:1139:2653 with SMTP id ffacd0b85a97d-39d6fd06913mr7779430f8f.52.1744097911839;
        Tue, 08 Apr 2025 00:38:31 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30239813sm13892137f8f.101.2025.04.08.00.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:38:31 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:38:24 +0200
Subject: [PATCH 06/12] ASoC: codecs: wm8996: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-sound-v1-6-dd54b6ca1ef9@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1551;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=J+UXKSUM53U2y2pHQ+9DPWteN9/2otTFvDTKRKmiZUs=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9NJuvYmZB5HOytKdjpF+bXv0ibp4qgHi/JhNO
 UlbOT9UwHiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TSbgAKCRARpy6gFHHX
 ctRxD/40q9HVEWkMEU1CQ2bpA1xLXRmNnYTvAA1+Rh9v+2slXDl8EpukoU/ntP7Zcb1HZqDmdHB
 As0sbr1Xthx002nsTO2ykfLst8E1tfhiQpGo2/YiirvAx5S4g9CAECLgVNBa3vpm/bvdxqP0ZB9
 YliQrDQSyolU+tdSU7F0ZDjwLf/9QnQMSEUU2NJRHe/XhUOJ6Dn31c/sAVhCD3/w5NjkPqNwD/R
 kgXonWNMNi0DvCJq83xI8bdTwID9JF/BdSM6mur2PPpzhnhiPYBAmoUWecdLm8VDKgjbdK1UF87
 rtIQJBU4lAbtxRiyn3p3qHPTmLNYDbnPI0hYRi6Mi60rAoqLZqIrXqmjkC56vDzVg+tajH8C9+k
 glVthIuYXvAblFH2dVsuWzFclKI4mCCtUweAbyQXhflJOD+XNdqkAgIGnQlFsY8nQ0/gYhZa/v4
 uGG6YoTTDJaO0cNlWiqGEtJVt/C7CZcaRJLtTek9DYqWHap+kr/vCEjP02Cv62+z/IOdCty3WwS
 mIEfGgYqsjeX99tBd6rWTZUIVqLLDoNjCHWgp5wZBrG1zu0PzIvpeCe9rTV1MgZdmtIrjE/8eG3
 phAnYyMls+IsW2vudz+FckW5zGScBZgs4t6oPuRhEXE2vnTP/6IPkkFQmyHCRAfOjl86CNz9gxh
 pnSNCdM+uwGQMgw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 sound/soc/codecs/wm8996.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wm8996.c b/sound/soc/codecs/wm8996.c
index c2af8d7ecdd8..e364d0da9044 100644
--- a/sound/soc/codecs/wm8996.c
+++ b/sound/soc/codecs/wm8996.c
@@ -2136,12 +2136,14 @@ static int wm8996_set_fll(struct snd_soc_component *component, int fll_id, int s
 }
 
 #ifdef CONFIG_GPIOLIB
-static void wm8996_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int wm8996_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	struct wm8996_priv *wm8996 = gpiochip_get_data(chip);
 
-	regmap_update_bits(wm8996->regmap, WM8996_GPIO_1 + offset,
-			   WM8996_GP1_LVL, !!value << WM8996_GP1_LVL_SHIFT);
+	return regmap_update_bits(wm8996->regmap, WM8996_GPIO_1 + offset,
+				  WM8996_GP1_LVL,
+				  !!value << WM8996_GP1_LVL_SHIFT);
 }
 
 static int wm8996_gpio_direction_out(struct gpio_chip *chip,
@@ -2184,7 +2186,7 @@ static const struct gpio_chip wm8996_template_chip = {
 	.label			= "wm8996",
 	.owner			= THIS_MODULE,
 	.direction_output	= wm8996_gpio_direction_out,
-	.set			= wm8996_gpio_set,
+	.set_rv			= wm8996_gpio_set,
 	.direction_input	= wm8996_gpio_direction_in,
 	.get			= wm8996_gpio_get,
 	.can_sleep		= 1,

-- 
2.45.2

