Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40591272E47
	for <linux-sound@vger.kernel.org>; Tue,  6 May 2025 09:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746522127; cv=none; b=ArT7W7aY2Xiwdw7Fdn1nXfaB9W5kFZrFnv0nLZktevZtxClq1+XbuD/v8VNZJjtYDLuO6x6hb7ZZ4KuYeKZphUt0GBtLzhhlqX0Pbt4ugjt3vfXHSveRN18swtW3eXwQlUzFZTGGK5upjf3+fIV8oMax8XHGCylDdN2kK0NCD7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746522127; c=relaxed/simple;
	bh=hcIZWHI2OFSlwwqSAvtsOAaH6T2rInpLX8inAqA7EA8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=geQ9gGXEAiV5LM6TTTYVRw6LS3cvGA3O9m1Cki3MrFtIqJI4z/PeJJWvrY6PEcBRKe2TNu/IpSVx4qsht/0qqqKRfAMOw847pu87LFi3kUEHhFML0n7A4RXv6n6+zwj8mXdWc4PIRA29QEl0zhtJ7RphLCXUA73wWGEpcvgZubE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bp610mJa; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bp610mJa"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cf257158fso29118345e9.2
        for <linux-sound@vger.kernel.org>; Tue, 06 May 2025 02:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746522123; x=1747126923; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EqJOkLDpEbdjHj6y0NvdqBxAKuQLVchFLzPyCOvEcoA=;
        b=bp610mJahfEPRDdORxb/sXthIV9Utx/8W8D/C9Tz2P0tBj9Yd8S79IjJ5w0aztkOcE
         qgJAqv5zT6dHiUCKId3zPfqYTwEvHVDCI65f9kWCuh/NUrIwvg5ku3ghOXStJGPD3121
         E4txet1D86kS2Z5CYukvhFdYOP6ljgaXrdCL4VcmRuDW0DEibLN1/vE6capKIqOK+BRP
         cJo/z14+eZN/msVmRfI+1SLYeauMJxWu9rIyhrdz0p0+wE+d/RPNdNLuIO66CavONCtD
         Ph/MRMNmPWOaGkdp5Wu07Oq1dHh3up2KIPPPTTQ3SPnmvdCczkYlZK63thUawjSVweDk
         iDMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746522123; x=1747126923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EqJOkLDpEbdjHj6y0NvdqBxAKuQLVchFLzPyCOvEcoA=;
        b=h8Cx89kT5zdAOjkyWvtTsxTUtiUlxJMEpf9P/nwVjGL0T06s2AIWbRySPVZSOI5Bcf
         pGZm95WiP+KUa7+hUycCFOWtRC9AX1Y0SiMgIaIl+aLbOg+yH8azZd1bOK9lg6cP5iad
         E71/hN2cPbJeCtiE2nvqfQwH91BG6q4v/5ZhD5dinAJGShFVgiAgxuxu5vG6m11qlKLD
         nr+u1nOXfbbYJz7Rb5hVOFJhXby8/r2uJTM0SE567MpdfO8LwzwXHuhZEOR4sKINd591
         xS4o+nYDj44kUsBFXUQj766XPCvyyRokxXJ2iSppCu+oVDEXsKBRJXgS2HRWJ1esXOnL
         +nrA==
X-Forwarded-Encrypted: i=1; AJvYcCVdSTJGwqsx4utFnoFZpcFVEMgZQ460Q277u64AtmgJSrR1N1TQ5zo36vTufc2nGlaax1HQjWjJqvb95w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBAYmH7mJCO6SSYwWQVdFkrH25NK1M07Tb9zb5MqVPwsYkGh+h
	0PGeJhuRGaZTffU21sbweoGbmV+q2ZS1bBv/N/sHUwrR5MMMgopBcptR7FBzyHs=
X-Gm-Gg: ASbGnct0PVofQdlyR3sHT/RbDc3L7N65c307AcIfYUVmo6wFARjssr++iAyoURIvVp/
	s16tdDywbZzZKMnVuAWdJNPfl4DmIKLcblfaiXhFhQE8NTGIG/4+hlGhSlK0rOBOVNYP5quaOjB
	bkn2ptKy3nvJbZE2fBH/7oh5GMF8TNRdo27TO4zWfu/yaalYNIKxqRGZnppCQvEWxATiHjTq5gu
	MTQqnQnXiyRzT2IVhi2+jcLfBlXrdibem1F1BhT+Yax3Mz78F0lmJRIMcV/EPabCy1MXyQJW3hr
	ycyY4gMLWKblA1VrFrj70fTxpz78Kvhxu5KUJEcHrehQXw==
X-Google-Smtp-Source: AGHT+IEQBbyGNvSBH/IUZ7yIkS1NqraYFdwMWxFz3yplI3ge5b8Y0Hl4j3r2KPDZyW7P/JlTUqu6oQ==
X-Received: by 2002:a05:600c:1c0b:b0:43d:649:4e50 with SMTP id 5b1f17b1804b1-441d04feeabmr20345795e9.13.1746522123409;
        Tue, 06 May 2025 02:02:03 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:bfd0:3ad7:fd8a:fe95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441bc83d471sm138125725e9.26.2025.05.06.02.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:02:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 06 May 2025 11:01:53 +0200
Subject: [PATCH 10/12] gpio: mb86s7x: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-gpiochip-set-rv-gpio-part3-v1-10-0fbdea5a9667@linaro.org>
References: <20250506-gpiochip-set-rv-gpio-part3-v1-0-0fbdea5a9667@linaro.org>
In-Reply-To: <20250506-gpiochip-set-rv-gpio-part3-v1-0-0fbdea5a9667@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1602;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Af+W5lkq0OOTLJFoxPrjkcufnz4i+x8pujOP6mAns+I=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoGc//nXJvfvNuFXirRuBnaS/f3lvGmAa5BZS94
 o12DeEaGrmJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaBnP/wAKCRARpy6gFHHX
 csv3D/kBSFLlqOIfps57wWdE3tJ2zBgTTX6pQhnjc+vB+c9WXL77cC666D4OrG3ZGaW6oHBRDyx
 L3R8OnvH/U5qaStUlQ5U9+TFz9broTUfI2FxGDe60Vzch63Db7uKqaL738vRE70G72+ZUvBjy3z
 6VKr08Xe+lh5X4MIcxgthLTcUbLgqoXDKe1gkY3EqhN18R0bwJce3TF1OTTu5t16AD+a2jKTC8c
 jq4ld6KmVGe9wVjijQ66U9hAcuFOTkgW6vsHNrvVV4a2Le81VAXLQvL06/eBXNz7ZcWvgT2DpJm
 MuZKiD+dhlkfjCQ5/IH+5GkDyZE+TfgrdvRR1jMPPqpAesr0CIOK8hctYXVVJV22fMTpIxiyQSe
 mpfb8FlR1eiH6pD5/rph8sCQbArUWnYkhYEKwtzRLcbh56YgfgEutZ2r+kHA76+FfJ9SZvaqpz8
 EEaqaEzNTIoZOlQ10V98eMiFEHR4Aa4yUvXEVpKp9Mj2blyVVImYq/L/iVawMBy2epMhgmmq69O
 g8RbmijkDxZxPl2xDTZkx63YLaNDnxVY/ZF1w05JkPOjqB8jDaeQ8ah+NYHr3UexNuHBVTJdiGp
 SOLKdtn8jdGUEUm57R4EzgCvi3f7td1g089F9N58QYUROqemQTFNdj+SWERzB2adHKC3Pr038oc
 74tmNN0JQEtX9MA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mb86s7x.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mb86s7x.c b/drivers/gpio/gpio-mb86s7x.c
index 7ee891ef6905c..5ee2991ecdfdd 100644
--- a/drivers/gpio/gpio-mb86s7x.c
+++ b/drivers/gpio/gpio-mb86s7x.c
@@ -119,7 +119,7 @@ static int mb86s70_gpio_get(struct gpio_chip *gc, unsigned gpio)
 	return !!(readl(gchip->base + PDR(gpio)) & OFFSET(gpio));
 }
 
-static void mb86s70_gpio_set(struct gpio_chip *gc, unsigned gpio, int value)
+static int mb86s70_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
 {
 	struct mb86s70_gpio_chip *gchip = gpiochip_get_data(gc);
 	unsigned long flags;
@@ -135,6 +135,8 @@ static void mb86s70_gpio_set(struct gpio_chip *gc, unsigned gpio, int value)
 	writel(val, gchip->base + PDR(gpio));
 
 	spin_unlock_irqrestore(&gchip->lock, flags);
+
+	return 0;
 }
 
 static int mb86s70_gpio_to_irq(struct gpio_chip *gc, unsigned int offset)
@@ -178,7 +180,7 @@ static int mb86s70_gpio_probe(struct platform_device *pdev)
 	gchip->gc.request = mb86s70_gpio_request;
 	gchip->gc.free = mb86s70_gpio_free;
 	gchip->gc.get = mb86s70_gpio_get;
-	gchip->gc.set = mb86s70_gpio_set;
+	gchip->gc.set_rv = mb86s70_gpio_set;
 	gchip->gc.to_irq = mb86s70_gpio_to_irq;
 	gchip->gc.label = dev_name(&pdev->dev);
 	gchip->gc.ngpio = 32;

-- 
2.45.2

