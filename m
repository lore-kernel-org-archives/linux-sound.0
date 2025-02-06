Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1969223BF8E
	for <linux-sound@vger.kernel.org>; Thu,  6 Feb 2025 22:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738882120; cv=none; b=n91LZqG6ZykgTwDp+ElJ+yJBtZl/1syUHwyuFS3dnn9xzGBcc366qU7N8HuU4zt9+PWasVEdsp9tsnC1s12QY4ptDXhcW8jL0cPFD9uFDPBUWrTV6k3OUHZFRSf6gHyMnvRzXY24Kcm0pyZLZlg6P8Ugspo8FQlt478joOJyJJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738882120; c=relaxed/simple;
	bh=S7dgE3UPYoL2oEd02LPby/4FImzR8JSvqPwrh4K9qkM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NEFOA6IEYOQwgT7W81rjf6A3dwGlIOvUR/9qhI5K/SI2xRA1nfuGk88QDxPp6sGsjLBDxk3hfVWu2hZejfAT0B+8Plt11HCtLfzisVFS6t2kPtuh7zEJHPqKa2jK8DFxGXIS0SfTQ37umsMu/8O8O6+rHbFsM6PTkAuMUBdqX+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=nmQpRudM; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="nmQpRudM"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-71e15717a2dso763101a34.3
        for <linux-sound@vger.kernel.org>; Thu, 06 Feb 2025 14:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738882117; x=1739486917; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wW6RHWEtayZ55WpdhtLO2i1JoETOot8MdB4MGkvPArg=;
        b=nmQpRudM85WVm0WAajhyPCri4wbrbkW2/rkX+kWEO83z2na2RrrTq1VAypJCbI4y/E
         J0dDdrMS3wX4dUNHRc8C6zuFX5xPg6JjOTezCVTz5r2HPtJ7AWeCl4yxbdKe221AT/+5
         exmydmLSy23eonQ5u8s8NccyD/CX5khqRVvhHvWerWL1WGwtqTcSVPFqvluM51DpaqXK
         Tf38tYJFzCqKvnYDgJW162G0c0slncdysTpZ38SdWtB+TNetJ5sLYjJeJpS4uEGqTx7Y
         UFQ/n0eD6rt2HXgq+5Hu9qxIvuH3XHrBalx/Y7ir5Rua5GsGZfYtSayoqu+dMpS6vACQ
         0sfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738882117; x=1739486917;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wW6RHWEtayZ55WpdhtLO2i1JoETOot8MdB4MGkvPArg=;
        b=L/JBbaihjYzBA3V2fu6aTGy699BhBrLSev7qf/brVnmPMKiMXvk7qq0dpGjPZJrD2k
         ZErIit+GXZIyVf2LSER163SoFTCctq0q/E3FakTM22GReOdFJ+TOcQJxiPTchCX32IcP
         fS2ZrNC010nF7J+LnSNZGlapAFoF4SBDb9xj77ivEjy9RKDh3Xewk6TTWA7W//QDROo0
         JuD/nQV+s5eOeZ+VXxMztYSs+1UAoyQZ6sddzJCIDM5jqZXKoM18OqO+Sk0+I7nlbQ9f
         mZzuMOJK0giWxrELUwBtnJGS3TsqicDVH7pQBKVqp7q5eZdv7sUTGT/HGa+SmS4kFQVV
         mxUg==
X-Forwarded-Encrypted: i=1; AJvYcCX+feYI7Tu9En3fcXHbx7fKAf4dEmFDGJmwGatVSjPBZhfkIAxdIUdXy81sUJPFlQvrknuMR0ZXJd827w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx11G/Xp6rve32WCsVGFyN/ioQmfpM6gerlZI25dzTE0ntceo9t
	bUyJU6gDb4ebecov5MkT5N0oFtp6dQbZ5XSnd59uW1DVY4zNsVLz4NFYkvhhTls=
X-Gm-Gg: ASbGnctDPaAerJ190dCT+Av3TZW3nh1oqtiCmMXHle0lqsDlAFWjUP1XJnyoqRMkbxO
	U8DoKjKaBRpePvbkuB7QYXknlS61590qaCtk8mHW6+SEY80Ya1hMmx1OuIli0I9bvjl44mQowNy
	m+1swRJmP7KL4LCv+vnZdq65aniJwgOG/OcWzPsHLEZCLgJrP6xB4Rpg0vmGuJS2FCUUksffP5Z
	AV6VtzGRp1TbXcGmj7Z0U24H+p1hxrVfmdQtVgRM94oKTgU7TBZMhG5MrsLiY+wY32NX5/pzecq
	e6b9LbXsaHfNM6dfnxIWJhJIauwY0cP0G/fOOPjQ//gmHl0=
X-Google-Smtp-Source: AGHT+IH8zx5vDbhBOU+RiFLjmMV8uSugiz4ArRiuueUcFuxbcCISDHEvqYTZqWFApQPLnbiuZHKf3g==
X-Received: by 2002:a05:6830:d08:b0:71d:b6a9:7489 with SMTP id 46e09a7af769-726b87dae1bmr640053a34.7.1738882117199;
        Thu, 06 Feb 2025 14:48:37 -0800 (PST)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-726af95bbb5sm510986a34.41.2025.02.06.14.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 14:48:36 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Thu, 06 Feb 2025 16:48:25 -0600
Subject: [PATCH v2 11/13] net: mdio: mux-gpio: use
 gpiod_multi_set_value_cansleep
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-gpio-set-array-helper-v2-11-1c5f048f79c3@baylibre.com>
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

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/net/mdio/mdio-mux-gpio.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/mdio/mdio-mux-gpio.c b/drivers/net/mdio/mdio-mux-gpio.c
index ef77bd1abae984e5b1e51315de39cae33e0d063d..fefa40ea5227c5a35d89ec2c6f95c6668a2470f6 100644
--- a/drivers/net/mdio/mdio-mux-gpio.c
+++ b/drivers/net/mdio/mdio-mux-gpio.c
@@ -30,8 +30,7 @@ static int mdio_mux_gpio_switch_fn(int current_child, int desired_child,
 
 	values[0] = desired_child;
 
-	gpiod_set_array_value_cansleep(s->gpios->ndescs, s->gpios->desc,
-				       s->gpios->info, values);
+	gpiod_multi_set_value_cansleep(s->gpios, values);
 
 	return 0;
 }

-- 
2.43.0

