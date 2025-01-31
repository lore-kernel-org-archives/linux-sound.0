Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B321F866F
	for <linux-sound@vger.kernel.org>; Fri, 31 Jan 2025 20:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738355118; cv=none; b=mJLtbLpufCALPhdf9/fbY+3a2OSsmeTf4lYkOujcpcDxdwQhdDSHNLHWBgwYsmUBZmc8TGdwDa2l28kIt/9GS/0tVM4/pedUUlgfcW30be7zoIrcWxLLx+uydR3ufHArb7UbWayqSZCI8PfbghoVQvOgThp8XKOc4jT+loRwT2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738355118; c=relaxed/simple;
	bh=5lFciV6sDtnvvFQNJQrSdhN6LDbuB2QD+esDyLXoYWY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aGG3iWZJHFctJDskLNoWmpVWkJaQp+MFaIKEF7MlkFdO+BuMLDLotlQHnO9I04vGVwBtBtquFsUpkF1Lz5yofB4LNQdB2/U4kGjabUu5n5yP+jPcd/9LPmaYQ4RO7b3kIHULFtw/+Z52iT1whXTsF4NTPI1on5Z7FsazPP+FC5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=xfWVISNq; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="xfWVISNq"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-724f4d99ba0so1124295a34.0
        for <linux-sound@vger.kernel.org>; Fri, 31 Jan 2025 12:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738355115; x=1738959915; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=59JJI4CO0oacXanEEbv/QOEs28IMbairlUQePRWumA8=;
        b=xfWVISNqGvmJvPxCnksE/Yz1kneKNWKaDoiPyVLVuJJqQz0AQds5/lIkpGqMh16iAD
         ZERvZm4NHH8ecjtnA156EOdT+s3afBz+65DNdZt3iYc6HqEWYMjMyPm8Oa1Zu3dPVK4n
         CbpaQ2ouRcwZeE4GRJsuUuze3SLPEEZf4CyvVcS6g/sEFkP/lEB0nbmevg42OYuehQjL
         4ohqvG7FisQgxd+xvcJN/S6d9ahf31PmA33gG1nKowgQJgD8P+e0HjR3kWZiVVKkuPUD
         3mdj0uy6cgk5FRaXgawn4H7fxeN9x9oZP6o3ixsNVrT4QqFTpirkBPSGe8iZKk7Ez5iQ
         nxhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738355115; x=1738959915;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=59JJI4CO0oacXanEEbv/QOEs28IMbairlUQePRWumA8=;
        b=HlitiYfO8Mos1wKQ3fYquBqfvkWCq+Zt9R6SM24zwLIUqekAkoFVZ7jgHZX6yHWkqy
         oqFulqpNRKlEcSYa4Et5WtG7Jvqk+2W0Y/kdeqL7jFsqOWR95KABUZupE51lE7DUixLf
         V+MubwhXj+L7IgT2oIC2Ecb4NzYBjTvDWbSUvGDWxxFlwQZZDJHaWoVJ5Q2w6Z/04Szk
         cECUyeagut7By4tt8A5XLes3PqO19hBQytlzMOcN4h2MJlhPgxdLHO+W1JgJadqeddSn
         cTO2HjyKkceV7AM+k+TW3aebwmRxgqnRXQG2iYMp7rQR69AwySVppthBH0ScQ9hWS6lo
         fLhQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3InwVGOqjqeU6zWr4UMqWgp+L3aOPoFOboGEA9n7DJcxpxRNmd2xo6l5PUwgkOe9aQ+SRtzQ8LuzoJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNDQGn6FV/ZEwFss9WP/ahs3xFh8//5Qe5PBcXrr4FtGIP6TAN
	T0BArTlVCWmlCfUvKRKpGtc1C41+oLlG8wbOq11YRUZ0b+HzV7ckN3G7WfzAptQ=
X-Gm-Gg: ASbGncuNbBHeXgNGJmaiScUx0jvPHl8SXoVBkSnqpkDVZCV4pMXrQndNtGKAB4PfYkp
	w2Rw3fLxMqfzkv6/tg0yIFop8IqVNPeGprlZK5yZYk576P5K4FK4x9mu/0yGVkWBAaqKJvU9fbI
	imCwU2B6LkIMjhzxTn0k5Y6U6LY86Wa+TzEFPr/e8a6wf4b7KViv6o1Z3OW1bT5IlBfyObYNzx8
	TEjk+oEWw0DreT4e6HJsnvjsCBesyAaue/ntCFjCm4LY94liDonY7zf+sLtvs0s9FacAiP+QGIy
	lerRjp0GWYL/Ak+VUdsqoQAOiiURoohlNp+MNyyMLw+W2EE=
X-Google-Smtp-Source: AGHT+IFrVMAfd3Y3wOZ0h4O9q45j+fMg4Vw3AAmlNZ9ZgYIq1KVZZxWHseA00ADe6a66eu+rR/ZJMg==
X-Received: by 2002:a05:6830:6805:b0:71d:eb02:baed with SMTP id 46e09a7af769-72656774376mr9460293a34.8.1738355115546;
        Fri, 31 Jan 2025 12:25:15 -0800 (PST)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2b35623d2ffsm1403157fac.22.2025.01.31.12.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 12:25:14 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 31 Jan 2025 14:24:51 -0600
Subject: [PATCH 11/13] net: mdio: mux-gpio: use
 gpiods_set_array_value_cansleep
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-gpio-set-array-helper-v1-11-991c8ccb4d6e@baylibre.com>
References: <20250131-gpio-set-array-helper-v1-0-991c8ccb4d6e@baylibre.com>
In-Reply-To: <20250131-gpio-set-array-helper-v1-0-991c8ccb4d6e@baylibre.com>
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

Reduce verbosity by using gpiods_set_array_value_cansleep() instead of
gpiods_set_array_value_cansleep().

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/net/mdio/mdio-mux-gpio.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/mdio/mdio-mux-gpio.c b/drivers/net/mdio/mdio-mux-gpio.c
index ef77bd1abae984e5b1e51315de39cae33e0d063d..d7eaeadde2873977606bdcb5821dba18aa4a578f 100644
--- a/drivers/net/mdio/mdio-mux-gpio.c
+++ b/drivers/net/mdio/mdio-mux-gpio.c
@@ -30,8 +30,7 @@ static int mdio_mux_gpio_switch_fn(int current_child, int desired_child,
 
 	values[0] = desired_child;
 
-	gpiod_set_array_value_cansleep(s->gpios->ndescs, s->gpios->desc,
-				       s->gpios->info, values);
+	gpiods_set_array_value_cansleep(s->gpios, values);
 
 	return 0;
 }

-- 
2.43.0

