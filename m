Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E16264A7C
	for <linux-sound@vger.kernel.org>; Tue,  6 May 2025 09:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746522120; cv=none; b=DBmagfWKH5dbZF4nLNqnLeG6COmxtkO+1kldPzrLnW9Uns5Z9xSPtWqUQfIOm9V6kfK3vHW/hBW1ONkYWO++yQRvMVhHLF8Hdcy2Q5bKUgsL6s8VPkm9U3XSL16cSuRuBr/QrC4fxf5Bh+sEPb056JOc8lCrUPwxqm/BUWyhcgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746522120; c=relaxed/simple;
	bh=gYKt/V/uMuHipLynaF1K3ceGiFbenp32cyT/tx97Akw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oOb2/w50YtM4W0gtK1kfG66NiqNO085DLcxmrMOcbXLP06IdsdZgUvZzrHBAVXHFLMr8VSh/8DYl/gLn3dyPkC5pD4GsEy1p4TjxmPz7NWmdKFNblEKFA1Oxk5WxIihFxzYLvAXiVqyIYY7A3LDZZVX9VeW+axBdYyL5CoVdU8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=E82NgLrd; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="E82NgLrd"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so47278155e9.1
        for <linux-sound@vger.kernel.org>; Tue, 06 May 2025 02:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746522114; x=1747126914; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fqB98pFRqw492ZhmHp/PFeUzRjROzd7VojSNtl3mvpE=;
        b=E82NgLrd5aQePPCmpkwHp6MC+yNO5DOha0vWYFlF6Q5aYeifX+SWL6nYaeVHSx4mr7
         P/HxRA6mP89AtNKvVfP2SCwRoAFyf3JmcsLJbkONuTIvG3orazs9cQkFIX/OZOeWwT2F
         yWCnfXkLhrC/qVgQbubyv6LtctGSw47Vb4p0qMPfsWv1ESdL3QR+L6MN/mDh9WFatYpJ
         +dnQaKmS0duVcgh6ZinsEfRBP1kVpeGyB7M2ZvJSf2oMM9553pUfHJ4svHtx2eUQXpWx
         t46a2g2p7k0aN3GBLfXhg4ZxO4DqD+XVg04gsUSG3Ia1Vf/6upoY8AI9BVkz49Dv5Ma6
         LKAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746522114; x=1747126914;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fqB98pFRqw492ZhmHp/PFeUzRjROzd7VojSNtl3mvpE=;
        b=igx0f6oUrZCVaVze6u841/cLiwUSWfAGUj2JSLy57iadGL0Rnd9UPx7tT32lFJz+Cc
         ylyVNi5fcWs+ylmrqMpJBi7Z2lJ/XLMg1RWQPA10+vp8nBzH1S7VGd67X29LJ5JPpUUx
         M/CeEJ0NtmTLNJR8RrqkHpGGMeOOZo9jD5rKZtI+5ujYDyJCXTm4mg4SrvBA+EsGoI/A
         2iFG/37SIE0r/Ib42f/7E7jZLTcGjwnFDBRvL/MCl9sQM/XII7KdkKFBXRhwH78cDoGD
         0lRX6kR51cZwIpQrElOlPDQAU14mZByNupSclNOmvLBfYZCsayTKv6CRT5AwoVQL2id9
         Rnvw==
X-Forwarded-Encrypted: i=1; AJvYcCWAFchr5bIAP//qltJdsfV+8tlUvM7LHuIWYO0WZfJHjQyG7mjzeEAlr2vGWCliwLNm/uFJehWHZyLUFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6JUO7R/Tiarb0rLWIIimS8Jq/mAq2oHYAKFhL2Xhp4kfXYs2r
	oB3RkSXrIKWhP/pTrzcogyewwOJoIYw2BdmkXKy10CH3SoA4mmatkRAGAePSfdY=
X-Gm-Gg: ASbGnctvCtSNSoDOAgdseGXvuBkHhz+rqT/geynesQDRRVqBwRlJdV+uNhAGNlShmIP
	b7JvrnK55RPo3CiF9DEhfCA4wLgmkry29rdZpgHDtUCLovSJ0M0XDxDe0v5C2k+v8ZfmesnOfxW
	7SG/EOQ8pRE+XTAxHrzHFCqJ6pwCmaoyMNBNT4Rd0l0R9yrEY8A12hF+3SAg7PlUfq5CYMHKhuj
	bNph8QhIX+E+yX//IOe3q+R6Vka4p1geuVYgyZAT+oCehAESTCN8SeqW49/41xkTn6itXmUwugu
	6jayBgYo27r7Y+STdAZAbI8y/pBgiO4ainY=
X-Google-Smtp-Source: AGHT+IGDU8UwVARAbr3wvLnx+R/CMU+fndtw+gPiz5QuLHtsjMKW02FOMERXLYV/50G6vY3UpD1p6Q==
X-Received: by 2002:a05:600c:a375:b0:43d:300f:fa1d with SMTP id 5b1f17b1804b1-441d10154abmr18934305e9.31.1746522114107;
        Tue, 06 May 2025 02:01:54 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:bfd0:3ad7:fd8a:fe95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441bc83d471sm138125725e9.26.2025.05.06.02.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:01:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 06 May 2025 11:01:44 +0200
Subject: [PATCH 01/12] gpio: lp873x: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-gpiochip-set-rv-gpio-part3-v1-1-0fbdea5a9667@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1643;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=KzVnua5lKk6LSZ+RA6U6z6ophC29UZ2psB9O2qSifco=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoGc/8PZdeK3eoxj5LZCAwJ2tSgAZHtlOTQquu1
 TAv25EMsKmJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaBnP/AAKCRARpy6gFHHX
 ciBXD/9eOGxP6WMpRIbDeI4ZPyWQdRiVWSzDMz0kD+ULzuBS7OHZLm1Lxi6rYWDOoZpA1aa/qRm
 T5DXumO4TNeoTYBlW4zeeAEyA6tdzECpf1BhhK/71Cn3CTpEE5pCBPbr1SvCuil2ysLA1n3Xg75
 kgPpAliYslsoCvHFYMZmoP/fFYVs5VoMLCCbAt25ueJJhtaMLmaUr9+nsxjQWRQFjce8XjxLZii
 uJ3Itxgyt00NTON1YpRsK3F1mGAeoZ1Pd/RUkCVXkRsvFN+faFyk9IbdH7qlAUYAG0U+ejvRtYm
 /UyYpvwOe23hQyg+2Oi7V74VaTaEQoEy4t/s95EwAXun2JRR/3iJiMs2DCKh7mu6mmarCHQ0UJ9
 rxrMU0F8SWGoNdoHJI84PkrzCowsnyGfaRbErOycQwKW7sif5ra5B+FBN0FTOzpt9H50VtulR6u
 ki6ZquD5iMa4DJg4U7s5rj4LSL41DL1E1PI6WKGM1SotlSot6p+ShkRrgong21J0XZ/Ct28bQfO
 FHWNqOgECDw9gWlNurVLK1udL3d1qtF24kPC+tq5Z7CmYOa+J86cFTFVihnXzLEUpjlgrhnsTd9
 LVPrjLlEel3vU7pgznmnDpKarYuIvU6If7rb8TRGHcBwE3diBLGk+eBSPYNSNnX5lDbsWkoDzMr
 JAhTSgymkWD4x+g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-lp873x.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-lp873x.c b/drivers/gpio/gpio-lp873x.c
index 5c79ba1f229c4..1908ed302e923 100644
--- a/drivers/gpio/gpio-lp873x.c
+++ b/drivers/gpio/gpio-lp873x.c
@@ -58,14 +58,14 @@ static int lp873x_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return val & BIT(offset * BITS_PER_GPO);
 }
 
-static void lp873x_gpio_set(struct gpio_chip *chip, unsigned int offset,
-			    int value)
+static int lp873x_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	struct lp873x_gpio *gpio = gpiochip_get_data(chip);
 
-	regmap_update_bits(gpio->lp873->regmap, LP873X_REG_GPO_CTRL,
-			   BIT(offset * BITS_PER_GPO),
-			   value ? BIT(offset * BITS_PER_GPO) : 0);
+	return regmap_update_bits(gpio->lp873->regmap, LP873X_REG_GPO_CTRL,
+				  BIT(offset * BITS_PER_GPO),
+				  value ? BIT(offset * BITS_PER_GPO) : 0);
 }
 
 static int lp873x_gpio_request(struct gpio_chip *gc, unsigned int offset)
@@ -124,7 +124,7 @@ static const struct gpio_chip template_chip = {
 	.direction_input	= lp873x_gpio_direction_input,
 	.direction_output	= lp873x_gpio_direction_output,
 	.get			= lp873x_gpio_get,
-	.set			= lp873x_gpio_set,
+	.set_rv			= lp873x_gpio_set,
 	.set_config		= lp873x_gpio_set_config,
 	.base			= -1,
 	.ngpio			= 2,

-- 
2.45.2

