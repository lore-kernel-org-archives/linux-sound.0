Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770773DAC11
	for <linux-sound@vger.kernel.org>; Thu,  6 Feb 2025 22:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738882114; cv=none; b=VSSuoWJejZtVRUMa8wrlaQmhneLMqOTf8z7qHEUnsrq/7GPU7vjQ7JWnlNAq6AYqyYCpAzkK8D4dOlONFnHjp+WBNnMZY2SAcfBn5zO8yKxCo/CDk//pXb1Xw7jV5waRLCMVWKAA2NXtanpMc0dp5tsccYBdCjob/8RgDHs59RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738882114; c=relaxed/simple;
	bh=IH4g1d8UAtzwg8g1uq4cmWqDVZbX87ChiYlpGpKjpcs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zwrkm3y7YBFP+DER2iV9zf/zNm4rEBCNjHVqqvZazmE4VeeAewF2pvPLAwLBUX9Fe6V57gC2CZldyln6i2RaAkUqFP41pAeQeqQlh2eAqWr3u2gohX2e04xr2QoduQoINLPuuLFs9uPlzBX1kTV0rOPxa2mwRWYuT7Iqx6SjyBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=AnYjx7dv; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="AnYjx7dv"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-724d1724657so1335011a34.0
        for <linux-sound@vger.kernel.org>; Thu, 06 Feb 2025 14:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738882111; x=1739486911; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+wznyorGz9Vd3pJ7hNo9c2JQSgu4MoX0a4PWBg4SPl0=;
        b=AnYjx7dv/fHT+RaED0QPGTL31FjQ8sPhaC9j6rFbYMIqV1bhjP7GNgroxDh2xTM8qE
         X3quFZWilB3KMjn4EFADZF9L+JrUvA3mcmJ0AeJ2ODcxjMSjwix5XgGmu9ttLKsFOWdX
         KnEzRgKY/TYZbPgQhK9gsmaKhaFHixmME7pXAwcdbr7R/6fWRAyHSoZFeahw6OZtohqL
         wm47wd5LlVjIKn0kaq4Sy3PRn3FguH5BqbXEWuvUFu48GWxy1niWvSh6G78pDnZYl5e0
         D2/rKKaYEslnT5KZlOy0NdQAf+KtgZaqBuVg5lex0hkL3chwwd1hgWaNF2CBULDDY4EF
         mbBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738882111; x=1739486911;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+wznyorGz9Vd3pJ7hNo9c2JQSgu4MoX0a4PWBg4SPl0=;
        b=Zgw9pBE6kGQgh0txPw0Enz7q3ZqVVbiUQZxQtp+kvfgYddJOUITMIQvDRmjP4Du5G9
         kZ4vFICkMw0ZEKxHUgJAZTJoo5CTan7R/s+ME7eWJYTjOKLg4JLMwAok1uYxCPNhQVxm
         VDqR+uB7DKdohtrLRJAGXz5VEAot4VVAiUSqJDCPlVJczWlSFKF4Xs6J4RAvhDyfreIL
         YNnbgAE2smh6djMFUe3GJUFBXYxXx8XDoFnf2+QNmWxAHkocUyhPb3YPQmj9YA2s09oJ
         qbYbVKk1XfULGqXs5ob/bgncEhGAPOTKqGxNvoHJGmnODCYoZRtDnIlrVXD8hrw+2BnF
         UEdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZO8UhjvwBVapw/Phrot/HnEnPLlwzmPZ9QKYLOHxh3KvbGe/H0Dk2gajKPezUaEVpJ8g7XzLRLBaURg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzA7K6dCBThNi/QRTvNR/cDN7luR7xt4dW7dFVU47ZqLBMO4YMC
	PXC7tqKZ8W2DZtQxqUgWidxna2uDbpnBbQDlLIUKiyng7ORoNaXFJJKHJQlSroc=
X-Gm-Gg: ASbGnctTy7UQLMHaF3a3o2LRtt4B3MoyeYETZXWdZYWpfYAJHxjf4QoKmoo8qqJjNuU
	YrGdHEsM02Mlktt+tNMfsVCHUo0DCdsxfbJBGrynqbuXw3j9Cv1IB+MY46Tovm2l23Owya40N7V
	/vygELpIEsmp0mcKH2lsbXXaaJi1msDwX7t/lwjYl7cvT/sPpjeGKrmhJRhx2UeT18w6AYskFFr
	xMNkb+3J4J8UPZiV/Cfc+G3Ioskgq1x+uROFFN2I8tw18cg2iAz1nICZihvi2/4xVYFu4xUk7QF
	9noUiSZB0B29SdFpOzKZXNKHk3OQYN0bqFoNHX0kK1SYYnA=
X-Google-Smtp-Source: AGHT+IFY5Ed96/KcKz8L7aoyZ9lE6qS5z+d/+9NsZ4rcpOBs9+vdKruwDq8O9FLpVqE3mmL4J2bJeg==
X-Received: by 2002:a05:6830:3981:b0:70f:7375:e2b5 with SMTP id 46e09a7af769-726b8f3ab09mr416508a34.6.1738882111587;
        Thu, 06 Feb 2025 14:48:31 -0800 (PST)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-726af95bbb5sm510986a34.41.2025.02.06.14.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 14:48:31 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Thu, 06 Feb 2025 16:48:21 -0600
Subject: [PATCH v2 07/13] iio: amplifiers: hmc425a: use
 gpiod_multi_set_value_cansleep
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-gpio-set-array-helper-v2-7-1c5f048f79c3@baylibre.com>
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

Passing NULL as the 3rd argument to gpiod_set_array_value_cansleep()
only needs to be done if the array was constructed manually, which is
not the case here. This change effectively replaces that argument with
st->gpios->array_info. The possible side effect of this change is that
it could make setting the GPIOs more efficient.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/amplifiers/hmc425a.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iio/amplifiers/hmc425a.c b/drivers/iio/amplifiers/hmc425a.c
index 2ee4c0d70281e24c1c818249b86d89ebe06d4876..d9a359e1388a0f3eb5909bf668ff82102286542b 100644
--- a/drivers/iio/amplifiers/hmc425a.c
+++ b/drivers/iio/amplifiers/hmc425a.c
@@ -161,8 +161,7 @@ static int hmc425a_write(struct iio_dev *indio_dev, u32 value)
 
 	values[0] = value;
 
-	gpiod_set_array_value_cansleep(st->gpios->ndescs, st->gpios->desc,
-				       NULL, values);
+	gpiod_multi_set_value_cansleep(st->gpios, values);
 	return 0;
 }
 

-- 
2.43.0

