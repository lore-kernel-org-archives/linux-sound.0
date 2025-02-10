Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34640261396
	for <linux-sound@vger.kernel.org>; Mon, 10 Feb 2025 22:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739227090; cv=none; b=BxYn7ZI5mLLx+Nh5dgpg2C6a3wtYrk9w2TO/W6BagZN/KJCUajB+RuwjcG6BlFi84hupTDfBqLRDXkBVBBOhztgcDtLxY3ZRXNKG+2CVzdphyboYeWoOSuj72TgNZgkldwhN6iGSZQgx4LyftjAq8CjLidKSUdLhUdb3VN45U6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739227090; c=relaxed/simple;
	bh=DTPgNGmkXhUVKQ7XC6/DETbHbqjA5xVWJi+TJtvGAQA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UVg1e/vuEiEsxGpq8blqyuWOHzQsAS1hnj0OYE+MDC5CpPgpdbrlaO+ZpOtuUP+YHrWoGANqE2cguOVPRDcZZjHH4FXGrHKvIMkUDP4Ssq5fW1snsBQOJLFt4m/xH6jxT5POo050Utzt6tu9VRbXP5Rb6f/2RM71IoCfJkQXZFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=LTcJkq0b; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="LTcJkq0b"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3f3bc69c8c6so548450b6e.3
        for <linux-sound@vger.kernel.org>; Mon, 10 Feb 2025 14:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739227087; x=1739831887; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/aqCjYxf4gSpR0G6gRQq6zdrmHAVbQWmkyM76ZxN2F8=;
        b=LTcJkq0bR7PqP6F7wNnr7kEwpB4IF+ENhJyvzgS8fx9V1DHttG4+yB9aXdX2XtYqey
         ImnOvKF1kPCn+B+hvwptAIyqjFNAhCVoYf4R7MYlBP3TdUek2RvoXt9ei+lvtG1TpNZR
         ldm6VIh8HdBroOf+FV63AN3VmfB3IcIuE04PXtVLjGk/7zP69+7IGc8rwtxn8G0PW7LR
         93iucsg1kEq8zsf/UOq2z0xlzl/mjinkGJli56pIiLAyo+aYgXx8EtjBhb+XdWAeo8b8
         pNiGcAzR3dQcfld0oLNZt3rK+u/gbZ8n4OevvpuU/QoE7LeRXbkQSsHY2H3sg33vaU0C
         lNDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739227087; x=1739831887;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/aqCjYxf4gSpR0G6gRQq6zdrmHAVbQWmkyM76ZxN2F8=;
        b=Gc3QSGVIoIA3zqc7dyIRixtQb+gHUsEw+Fz710iYz2Ea7yJm7xZ9PwfmEK97EnwH60
         sBhbWuMPhEwhd298f5wgdoixxiq8r6hX0j9u7plq+Ujv6/CLYoYygL0HG3yInFYL+KQr
         7AnjnSRGzqmg34Ppway00YoTPM3zsDUTS4lQLihTPGPsm7Q3bN1eMTB3dQfZ5e4v1mGJ
         koUebap8GhgHnZlum27FQgvz1/0UHMrX1EDPCZf5Iu6jmcAis4z4ksbMxBRYJqalfUO5
         YvCLaWh7u30K7Uh0zu4DCSbf5tYSmc7v5BU5E1yKwnIwW41iZMl1zy2M/mhiIu4Uq+iR
         tf/w==
X-Forwarded-Encrypted: i=1; AJvYcCUzJbz16Qd3Etocg3ujjuqAVRYcE5jB435AKmfGiAUT2nd6oFrJYKtQXMT1tnxmEl2AYcMKEiZ+pRfXjg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywae6HkBfsDgayqFt/1DgfchZVkSeqZtBXfiTpP92xEpsEmrTlb
	kuIaHVNMjPyBgMW1yrnu9pV7e2Wps7oZl35q0DqpI3EaCcO6y/j6sa/U9WUFI7M=
X-Gm-Gg: ASbGnctYMYIbeFgV5KUzZeDdC2RldbyXzkzCraBY69LD6qFqaLQbf0Eiph2gcSMc54o
	i69TwCOLr9NFgYydDfOBhyo75DEaiZRnsc14N0T488d4WlPcU8HZBdFp6r/rLoEsDTJ9L4x1Y0E
	cYe4UHrvvPGFNH20wRW/VjOcBK3TWA+j6akamyVuQwH8nBTPyS9SnaV195MMw53uswNV7UsSgEI
	RaYRmc5lPH1scyavYJru+YygFygpn4Kj/Cf6Uw6LTAfQy6zL+/NO30NsK5f4CNpRBZqv1ZuyNNp
	TE/CNb2kQC003kGZwpaCphWVz4E3qS68cowmfl9PunyUfzY=
X-Google-Smtp-Source: AGHT+IFodsa1xU/+j9iOyHK4zd5srfGLBws68RU1hOd0Hvn3EqSmNLjWe0xJTDgUwSiCbolk4Lse1g==
X-Received: by 2002:a05:6808:23cb:b0:3eb:5f1a:d083 with SMTP id 5614622812f47-3f3c2633408mr767124b6e.20.1739227087286;
        Mon, 10 Feb 2025 14:38:07 -0800 (PST)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f389ed1ca2sm2521820b6e.11.2025.02.10.14.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 14:38:05 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 10 Feb 2025 16:33:38 -0600
Subject: [PATCH v3 12/15] mux: gpio: use gpiod_multi_set_value_cansleep
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-gpio-set-array-helper-v3-12-d6a673674da8@baylibre.com>
References: <20250210-gpio-set-array-helper-v3-0-d6a673674da8@baylibre.com>
In-Reply-To: <20250210-gpio-set-array-helper-v3-0-d6a673674da8@baylibre.com>
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

Acked-by: Peter Rosin <peda@axentia.se>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/mux/gpio.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mux/gpio.c b/drivers/mux/gpio.c
index cc5f2c1861d4a22d984bcd37efb98dd3561ee765..5710879cd47f89b6ef4458d6b4419a1fe9ad349f 100644
--- a/drivers/mux/gpio.c
+++ b/drivers/mux/gpio.c
@@ -28,9 +28,7 @@ static int mux_gpio_set(struct mux_control *mux, int state)
 
 	bitmap_from_arr32(values, &value, BITS_PER_TYPE(value));
 
-	gpiod_set_array_value_cansleep(mux_gpio->gpios->ndescs,
-				       mux_gpio->gpios->desc,
-				       mux_gpio->gpios->info, values);
+	gpiod_multi_set_value_cansleep(mux_gpio->gpios, values);
 
 	return 0;
 }

-- 
2.43.0

