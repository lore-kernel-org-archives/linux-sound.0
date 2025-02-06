Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A9E23BF87
	for <linux-sound@vger.kernel.org>; Thu,  6 Feb 2025 22:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738882117; cv=none; b=sImPE6YVPOYc3Sq+rBL8gsXjPpipprMvlTX+km0Dl2IUULjUbEH3vALuMthhQ7/cjv7858fTMjYFmSGTem0Sv8pgsQ6Nrr1e5tgPAujXeVYPyfsKW7DH4eOxRdZfNvyP8BM1iwR2BRSd+3HQmHJ0ngGyhL2XkcehjO+hiJa2qaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738882117; c=relaxed/simple;
	bh=HaFWSgBdfXggpkPiEPQivtzXY7Xojib1tG2MzfPUdgM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HXGcb+WTHi4BSaCLQOK51+c5sGqDVEjkKjxN8DhWxWIQcMBtkVXJFJRBGKL5rYWyQp9xvyMdusuNK/YDeDJQ9Kw1QhqtInPsVpbpyHYNt6SObfqITn3wcUXHfi+qouq9sHmESKrklt3Fr3eqeaEmreOWa+G0+HVTCtbTxzS/uEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=cG9pwCnk; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="cG9pwCnk"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-71e2a32297dso793176a34.0
        for <linux-sound@vger.kernel.org>; Thu, 06 Feb 2025 14:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738882114; x=1739486914; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hnz0az7lntDGiOpb5KMBiHYUt+/ZN1SFQQir1JT9FNk=;
        b=cG9pwCnkAGhREeCpqTup5txOFp23jH8qzyvN/AXhPm+HsbSzH7nwbiISN9/J/pQjCT
         aRmMwKOEOaAH2ejG4ZtdJiNaTDSifLuDQRLdTOUVfGsHWnxRO1VUYIIVER9gzUJqTGoe
         zX+XAFX3q6RAYoScAzRqwFo2E7gjIhM4t7fzx3om1IKQ49qYCyGvgVsWmtMUjCPp3Abs
         E83O3ZRfdX3y3DWYApFxut4GWdUGhVZ3e4aBoGd8cyrqTO50Tt2elx+LSrqP/iQUh4w1
         /G20RwOZDyTyPs0ERRJSW6FzBeqGR2ZhJWGXJyvp3aDhzsAS5U/VhRHlFK17JXQwHREj
         5IRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738882114; x=1739486914;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hnz0az7lntDGiOpb5KMBiHYUt+/ZN1SFQQir1JT9FNk=;
        b=pyYW31j0EwndAg+eay9LGxRDXhYSMc5xQzsDHKyu+jifySKy28Bym5W9Wzxth1W5lK
         NbkKLvfL/+IxwzonYobnaOz2d5lQPh8yYca9yza0/LWXgvqidnVCezUvdTPXc59XUO/w
         bGB85rJ92WZWQza1/2A8c4jGvSat1Tve5Y2qKcmYQgUQLrWFdFW0JypjtD2+SK6CtFSX
         6tMjC3HAdv0sIlNO8ynqN891wH/KuhZ8yltTMWajeAntNVshlpWXKtrDaZWRTub7TKpB
         lXUqsMJwi7O7j1L0Dekl+W276l5UnOmjtaHlhgAaCWZjjzeKiIt/C9HTJ1cIF5hTIGfG
         AIYg==
X-Forwarded-Encrypted: i=1; AJvYcCXeRPq47ob54kwf3VPFr7qvzwpYdj3mqAUolysLiVCeGUhelNbQO01nsWHzVReDzvaki2y8DfdE2fSiPA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0mWseiccXrY8kO5FhlpzAY+o3MSAP11s90IlNVVFRx1zxl05x
	BVWQDTiEIVohuKyvGoi7CqBHtIJQbhszZfNmgdDRt9sVOKxRXuC45rJXV/vNptc=
X-Gm-Gg: ASbGncsG+U9VIA34W8/uhfEI7E0ZWy2DDhTCEg1l0hmyeenwgK21Ep0FozOkBGMDWfH
	MiLRyAiNWQjwXh7ZJ121cR+y6U8U+Lon5IMEF/QrxapQQ0IDweugsn8z4vlxstw1gwuYUqIDh3b
	OXNnKz1jRaWyQihFySlMM/G85KKwcI3UWC3C8C3cWilk5SevMQ4gWnjPhmERwwuhGCAEeQW2ezP
	fi7dl0cJV9bT8lvekeE4BAjmSnTqg2s0csR/Eghfre9tl5K38zk+Uxv1593XPNlHuo64xoM2Hkd
	jqhvEGDmngLDDq2fhzebRTTCplwD1OafxaxxFDXXTFx7J0w=
X-Google-Smtp-Source: AGHT+IEVknGonsegy5S/Aw+PLXi2TjO/wnkH/rmRbYYU8mAcrJGwZvntuKEgjA/jQ79DrZ7uQxsojw==
X-Received: by 2002:a05:6830:3981:b0:70f:7375:e2b5 with SMTP id 46e09a7af769-726b8f3ab09mr416555a34.6.1738882113893;
        Thu, 06 Feb 2025 14:48:33 -0800 (PST)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-726af95bbb5sm510986a34.41.2025.02.06.14.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 14:48:33 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Thu, 06 Feb 2025 16:48:23 -0600
Subject: [PATCH v2 09/13] mmc: pwrseq_simple: use
 gpiod_multi_set_value_cansleep
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-gpio-set-array-helper-v2-9-1c5f048f79c3@baylibre.com>
References: <20250206-gpio-set-array-helper-v2-0-1c5f048f79c3@baylibre.com>
In-Reply-To: <20250206-gpio-set-array-helper-v2-0-1c5f048f79c3@baylibre.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Peter Rosin <peda@axentia.se>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-iio@vger.kernel.org, linux-mmc@vger.kernel.org, 
 netdev@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-sound@vger.kernel.org, David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2

Reduce verbosity by using gpiod_multi_set_value_cansleep() instead of
gpiod_set_array_value_cansleep().

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/mmc/core/pwrseq_simple.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mmc/core/pwrseq_simple.c b/drivers/mmc/core/pwrseq_simple.c
index 37cd858df0f4d7123683e1fe23a4c3fcd7817d13..4b47e6c3b04b99dc328a8b063665a76340a8e0d0 100644
--- a/drivers/mmc/core/pwrseq_simple.c
+++ b/drivers/mmc/core/pwrseq_simple.c
@@ -54,8 +54,7 @@ static void mmc_pwrseq_simple_set_gpios_value(struct mmc_pwrseq_simple *pwrseq,
 		else
 			bitmap_zero(values, nvalues);
 
-		gpiod_set_array_value_cansleep(nvalues, reset_gpios->desc,
-					       reset_gpios->info, values);
+		gpiod_multi_set_value_cansleep(reset_gpios, values);
 
 		bitmap_free(values);
 	}

-- 
2.43.0

