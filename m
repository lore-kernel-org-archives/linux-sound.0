Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABD1264617
	for <linux-sound@vger.kernel.org>; Tue,  8 Apr 2025 07:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744097914; cv=none; b=DI3ArFnfRWxae4wVJzQYThLIK4dPjo+R8nW8nDFAxBAHfIMyiDu/sr6Es3Ei6KpyIVObiymNkT8rgN7O34TEKwGKmAXXuL+a6Is6icp+rLImgWrbLiF645wCvyup/FiXxbXdq5+6bfxFD7tn5n5IsxDvJp/QTGUJuGuV7wG9l/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744097914; c=relaxed/simple;
	bh=gnxLULCAyuh9NQsbezqTT7XeAICs/jSdAV8dBui03AY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ud2gWwR2w0EJLDVfJttKK2xY52ELiCLLhDVOT639yaJzLdbIIhuFqeFpdIF8s7blloByYPLsjaYmMquqJ7nHy9w0Lkd3ZyvN0dS5sGD1tdWgUktnUk5IWypEtQTCrKEgABC09PUJVERyXMgYhSU+Ovklvbt4hRRGayxLPNhlQL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Zz8ItODr; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Zz8ItODr"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3995ff6b066so2830042f8f.3
        for <linux-sound@vger.kernel.org>; Tue, 08 Apr 2025 00:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744097911; x=1744702711; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aDax3Ws05YZ8zmDA6rC1tfgqVxvQ1cnKk2mOaqzS1/I=;
        b=Zz8ItODr+iek7sistyaWm9uOHGLFGzwiCzZqY6h698pvEiBDAA69ZRpP+4SXCizoKg
         /C/TKZ3zMZRaSuENpRx1K55P0MXim1OLralrQYVtqwXruZdAoE+vzfEWAaJJq2Ux5pWY
         1OGSznWL1t4ykOzYE7BA0GR3fbovH+jDJ6PJlc4q9quO5htqnyS5M6gZRZpD3jduci3n
         NQClzZhf+cbGyxWrGImXHddpv2kkE0o6iMcUQmjW7CYHQN21ne/RKSI4eeqi0clWPdk1
         MQD/C7MOquBdTVQgRWT/Wq8FnClbEvpZrJrEMoTPrrKOAX4t/fv/U9AjtfWZGiD/JRrT
         xGUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744097911; x=1744702711;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aDax3Ws05YZ8zmDA6rC1tfgqVxvQ1cnKk2mOaqzS1/I=;
        b=HIsjgOVj8ILxTeZqd2UwsRzS0lw4Us0nWAjut6jnQWb0wQGjSn3/oaFHNv95Bp9DiU
         3sXrJTVb8gCVzHaXxOrHQZo+5pGm2Jy8mHo4CK2rTBu0ewzYr6TT26TsNgGG90pA3hwE
         71eHfpCm8zIBf2T/FMn3mDhRwLrx4y4sPJBAM202vDsSELDc+0mz/XYvO1bwU07E1v8w
         v30dTKCV97S6fkAk/Y71NPFBj2gV7klkE8Dje3gOAyqcMUJTCMnOjxFIkcWzIYlatHI9
         INEi4Lj5wnkrZUiAGIlI6ysZr5WZfR6kTujzfAkcuOWb6HaKwWnfgBAPIa1tgGCbyhHE
         91Xw==
X-Gm-Message-State: AOJu0Yxl4Cp+GXkqhLy3QZOK6MutYJKMIqyaLjPMaoeOPbOByeRLIbDQ
	5pkK33Fn7yWm/zHPsZtJk8QZR2L9nHqoVvGe3kmHlrzn4x4EgcnL8/3QW6OKfBI=
X-Gm-Gg: ASbGncuNXFGQVKnzqpCfh3N0w2nA3IFpq1Edu7WBxWiAC6R8sQ0C6jC7Wqr9accea3O
	cS4mddjOCmb6wToC/UuPpiG5xVezqrBr13bBevtiPI9hBjOXvya49oVSXubhmKDg5NbpC3ahtNt
	jLI8rRF0ccFw5AIS8iaojDhjnGjoEYPhG0OyH4wEyVs1RjRqQrb/RV2OAXIjgVM9WCt6pWL1S3S
	MK5zz31VSrzuI7JKLLhoexkCExkd6B/R40rhwdald0fc+k5W70OjZvs4Di9OGY/fi2kbDQRQdEj
	uEXoTOhj+agCOALFUgqt/4dCG8LTXRiy3oPT+w==
X-Google-Smtp-Source: AGHT+IEWN9bYde/xMBfOkHQNa6HTYyFDHb28eVaUUMXpnBBVvhESil1QEAAwJj+1rOSrQNH6YQ+0zg==
X-Received: by 2002:a05:6000:1867:b0:39c:2688:6edd with SMTP id ffacd0b85a97d-39cb3595c48mr12927726f8f.15.1744097910752;
        Tue, 08 Apr 2025 00:38:30 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30239813sm13892137f8f.101.2025.04.08.00.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:38:30 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:38:23 +0200
Subject: [PATCH 05/12] ASoC: codecs: rt5677: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-sound-v1-5-dd54b6ca1ef9@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1523;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=zqMzTD4a9F77NzTYV5GJminLBgRVL2t9zDj4XQHtrdg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9NJuPhUyJQBxaca+q9M4yYolMhou4yTpNTZ4z
 bBZeOmVg++JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TSbgAKCRARpy6gFHHX
 cjTPEAC1m5Nhh2RvAgn2Pdst2uBxBgbujINKZhSTjhjkRq2GEmSbijkEPVPhf3lTtSgh831MbWY
 /u0gfFdKiH205VrjCt/8wzP2IL4IMpSaWYwt2Q2JAIHbbCVfDnJRL7y3hwEnoxArxbkJytcOKis
 FzezC8j6QX/iHLKZT/aBdX0ldbqSsKmyQYRMVMKm8sJjAS3ytnxsrKtuvjXt39QjGz+9/rJ6U3X
 +P5nukSNs+yzFNVyFIk6iGrXCC8UEmzVdAe+D1naSqPiirI7nnYt5fcie0iR04GoHq2IDEJaDRu
 6hJZJJNBBiLZLIcEQMSs45Xwts0A+SrnEbcXOBgrs+JdkQTJ8zwWppLPWPfbBfdtUDAzOwF9nhR
 a1fMazH4gjgsVO5GQboxTzs12sAQyUyBKTsWmU/6C1koEFip2C6I7oJJnmqTMtnUgbL1RWHYQ2k
 dUwigXx6LBL7gN59RUhnnViGXAWoWdibP7VWrZ0YCm+zXd+Kqeoli3saaMek+mza0XqWSyZgcL4
 G2KDLyBbxTUWfHj3Wvybh8SBenScb9aaAyCfnFFl43VlOsRbnOieVGSaFPQ6UMTbjj4spNmsfEn
 qHnY6WkI0X1nN5hEOof8Ym1FX5XGI6rpQDm8qDZ2Sj5QCuCNSeCkDbUvPsjK80aWka4sZj5El99
 62Jw0Pdii81VBAA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 sound/soc/codecs/rt5677.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index 6e4774148566..69a0fb8d7f77 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -4725,13 +4725,14 @@ static int rt5677_update_gpio_bits(struct rt5677_priv *rt5677, unsigned offset,
 }
 
 #ifdef CONFIG_GPIOLIB
-static void rt5677_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int rt5677_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	struct rt5677_priv *rt5677 = gpiochip_get_data(chip);
 	int level = value ? RT5677_GPIOx_OUT_HI : RT5677_GPIOx_OUT_LO;
 	int m = RT5677_GPIOx_OUT_MASK;
 
-	rt5677_update_gpio_bits(rt5677, offset, m, level);
+	return rt5677_update_gpio_bits(rt5677, offset, m, level);
 }
 
 static int rt5677_gpio_direction_out(struct gpio_chip *chip,
@@ -4834,7 +4835,7 @@ static const struct gpio_chip rt5677_template_chip = {
 	.label			= RT5677_DRV_NAME,
 	.owner			= THIS_MODULE,
 	.direction_output	= rt5677_gpio_direction_out,
-	.set			= rt5677_gpio_set,
+	.set_rv			= rt5677_gpio_set,
 	.direction_input	= rt5677_gpio_direction_in,
 	.get			= rt5677_gpio_get,
 	.to_irq			= rt5677_to_irq,

-- 
2.45.2

