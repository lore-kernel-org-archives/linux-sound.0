Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2ED156F20
	for <linux-sound@vger.kernel.org>; Fri, 31 Jan 2025 20:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738355089; cv=none; b=P3AhEPNRCMaNs4HCDSxE1tpx7OYu4HIQe2UaF7OwzyuDiL9sGCdHbhyTULXCBIj966Dj78MsHp89Hf88L6jCCfz8k6m6J28Dt3PWwoSP3FNQOBnxQz7cKPiUkvgIw53vceKuaQ/a+Ao8W6jTgQGlw+Xu0WGZ2sF3yZGFJUxQQdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738355089; c=relaxed/simple;
	bh=a4ev7NI00M+pqHz/c63lKpZN/tT3RLqqfUA5HRJSMsg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YXgXymVYdpz8ZKEz/EmABXnqQ+PMDvS+1KZ/v5fTxWzWV++hykHUyi/SUs3w/NLRWQxgokT0iwb75UXuZKw3+sMqgzlAI0nt+y9UwKO9IdLS/xDiS9wm567Z5g4ahM75IbUE3ZUd6oHQtjqWNKGAN30ujBpuDcFZv9dHVcS/r04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ShBjLv2U; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ShBjLv2U"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5f88b61399dso1666961eaf.1
        for <linux-sound@vger.kernel.org>; Fri, 31 Jan 2025 12:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738355085; x=1738959885; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jn/Ny7UFv/UH6iRtjr6jsBabEKLnDl2l7pEqvfjMtFM=;
        b=ShBjLv2U1w+5zymjIFhU7poftN9OhcetisFQnk0H3B/pvg/7UdFSNU0zrwqwuqtNdA
         nsFDff8ZM5KVXkXnc8UpScWb89BwAuyXMKVtsCOJstyRg2PC849jMkHfoCMS0leb8Gyz
         fvxO4R7AG6gGp5b9COON2kYqJu2ZeP5sBPzS7zaFz/1jpuluYh/4xx9yPbLjX/Qn+z89
         AmQeZdxZxlt/15AIidokGNHek0k2zF7zFflb0NdXF5uOLh06aZ5OBhf3oD3JiK0wtQFG
         /yVyddYaQtIQKN5Cs1SZaxEAcf69u4iUJH9QTyWqP3aTZ/qc2kJA+J6kqXsdTyLmDf+f
         DDnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738355085; x=1738959885;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jn/Ny7UFv/UH6iRtjr6jsBabEKLnDl2l7pEqvfjMtFM=;
        b=xEVIK3pRZo8OnrqRK7Vb6Xdr/m2VaoBEM2U6JiR5Xi4tfJpEWO9YvIUFC8dnriTuYJ
         X5sFuB2qOoo1AKX3VNcBUoxJmbsKWB+oPg/xrkeF3Wrp7WUNabJq5QrlTjSeB9HyWgsI
         24mDpjqIHut4AecYxANvKg8uPM+B034hJ9FoeFY0GuPl35JAbCx+CKtG/oyKAe/upllO
         P1PIhEua0hHsX5RiQ76otl67rEb96Qn80bmqgNN08V9q9hs0UMQsNoLjdgl84nQL+Je0
         bJgeU59nNuekycSa+IScXUwN41GocRMsu5CBayeTQlvnO+QrXrC77+P5BCOwgj0DNT45
         B8bg==
X-Forwarded-Encrypted: i=1; AJvYcCXYJqITnrIkKquhTXc0sCI4SB2xgrZKr3dZ8VVp8QeNJ9UDSQZfRmcTATHRoYqM2OGpheHDfgtCJ3ydPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMSW1fo6SuXvRbezBCa1CaGV9uZAipHhefUnGwKJtRpqnp0lL1
	+f4Jn8nla0dll15kdfGFR4IJ2JkRPU73socE75QASvVwgoSe7IPMBC5l2Y9rz8s=
X-Gm-Gg: ASbGncvgQWcUMK+Spycp2FpQRh6MKkTxVmHxIeKhKTL9qyVe6FhgYJUbx41NWK2a6h1
	rn1RX/d0oZQyodZp68X6RaO03bLiLNkHLe/akcvX9WBtDJGeHQts1KMYev9hB1JimBpPuyNYsQN
	QMMnKqa4Z47afiKNihdPfz+HQCZpzBePSjRbe0BqymOrdYyIFZ8daD3bEUxm+eaZth2FVAMt5Ny
	W4vhph7Q+WBo1+7D5zcYG+Dg/e5oVucsR8UUQJxyMUzCB1qeJYm184G+MXb4yMUi/N2T+Z3R6H4
	2ssJYl2OcIs21ZumDL5WfQoLDWWEkeCgi1UHLNgiFHtyf9A=
X-Google-Smtp-Source: AGHT+IEA6MI3/eVAdqj25y/O52sPRoTGczW1O2gqmD31jZVU/w0qKc/rISzimaZq3KsB0lB7wfNBfQ==
X-Received: by 2002:a05:6871:a581:b0:2b3:8c07:6461 with SMTP id 586e51a60fabf-2b38c07814dmr1466360fac.19.1738355085268;
        Fri, 31 Jan 2025 12:24:45 -0800 (PST)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2b35623d2ffsm1403157fac.22.2025.01.31.12.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 12:24:44 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Subject: [PATCH 00/13] gpiolib: add gpiods_set_array_value_cansleep
Date: Fri, 31 Jan 2025 14:24:40 -0600
Message-Id: <20250131-gpio-set-array-helper-v1-0-991c8ccb4d6e@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIgxnWcC/x3M3QpAQBBA4VfRXJvaHyKvIhfLjjUltlmJ5N1tL
 r+Lcx5IJEwJuuIBoZMT71uGLguYFrcFQvbZYJSplbYaQ+QdEx3oRNyNC62RBEdfOWta2yhvIbd
 RaObr//bD+35rVoI+ZwAAAA==
X-Change-ID: 20250131-gpio-set-array-helper-bd4a328370d3
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

This series was inspired by some minor annoyance I have experienced a
few times in recent reviews.

Calling gpiod_set_array_value_cansleep() can be quite verbose due to
having so many parameters. In most cases, we already have a struct
gpio_descs that contains the first 3 parameters so we end up with 3 (or
often even 6) pointer indirections at each call site. Also, people have
a tendency to want to hard-code the first argument instead of using
struct gpio_descs.ndescs, often without checking that ndescs >= the
hard-coded value.

So I'm proposing that we add a gpiods_set_array_value_cansleep()
function that is a wrapper around gpiod_set_array_value_cansleep()
that has struct gpio_descs as the first parameter to make it a bit
easier to read the code and avoid the hard-coding temptation.

I've just done gpiods_set_array_value_cansleep() for now since there
were over 10 callers of this one. There aren't as many callers of
the get and atomic variants, but we can add those too if this seems
like a useful thing to do.

---
David Lechner (13):
      gpiolib: add gpiods_set_array_value_cansleep()
      auxdisplay: seg-led-gpio: use gpiods_set_array_value_cansleep
      bus: ts-nbus: validate ts,data-gpios array size
      bus: ts-nbus: use gpiods_set_array_value_cansleep
      gpio: max3191x: use gpiods_set_array_value_cansleep
      iio: adc: ad7606: use gpiods_set_array_value_cansleep
      iio: amplifiers: hmc425a: use gpiods_set_array_value_cansleep
      iio: resolver: ad2s1210: use gpiods_set_array_value_cansleep
      mmc: pwrseq_simple: use gpiods_set_array_value_cansleep
      mux: gpio: use gpiods_set_array_value_cansleep
      net: mdio: mux-gpio: use gpiods_set_array_value_cansleep
      phy: mapphone-mdm6600: use gpiods_set_array_value_cansleep
      ASoC: adau1701: use gpiods_set_array_value_cansleep

 drivers/auxdisplay/seg-led-gpio.c           |  3 +--
 drivers/bus/ts-nbus.c                       | 10 ++++++----
 drivers/gpio/gpio-max3191x.c                | 18 +++++++-----------
 drivers/iio/adc/ad7606.c                    |  3 +--
 drivers/iio/adc/ad7606_spi.c                |  3 +--
 drivers/iio/amplifiers/hmc425a.c            |  3 +--
 drivers/iio/resolver/ad2s1210.c             |  8 ++------
 drivers/mmc/core/pwrseq_simple.c            |  3 +--
 drivers/mux/gpio.c                          |  4 +---
 drivers/net/mdio/mdio-mux-gpio.c            |  3 +--
 drivers/phy/motorola/phy-mapphone-mdm6600.c |  4 +---
 include/linux/gpio/consumer.h               |  7 +++++++
 sound/soc/codecs/adau1701.c                 |  4 +---
 13 files changed, 31 insertions(+), 42 deletions(-)
---
base-commit: df4b2bbff898227db0c14264ac7edd634e79f755
change-id: 20250131-gpio-set-array-helper-bd4a328370d3

Best regards,
-- 
David Lechner <dlechner@baylibre.com>

