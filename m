Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BF81F5601
	for <linux-sound@vger.kernel.org>; Fri, 31 Jan 2025 20:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738355104; cv=none; b=lkfpvB2eX16sP8jO+nFHWF5tvt5hfoP5syk6UWXgN/tUYHQP1PEaB7kgOn7i/ivKL7FP5SyOkTPrUUNiXSboJtPaX7sLEIoXlnxXdxOc7by+NFOsAJ0Qn0bhRgZz99trC5g0AelN+SgtNfTIVdm4p5qvzUmCO3hpwqAnLGvZ8ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738355104; c=relaxed/simple;
	bh=9/jQiweV7yB0cOyjEzTaktkYDTP4ZnpLC0eY9PbXQiI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rc2MbjCfcxQfUSr/Bk5AqeVsn3NEVvwN2kULKJIg2RQB8js/V+1gBCzA3gvt5vts9jAK1PBHKHPw98HxMDydiXQV2z6d91KDR6LAqw6nWqGsKVrYJquisprtazrEy3Y8k1pN4Ewyg1sf0psohjaYFmfwxU5fnvqTaBkEYAqGXMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=dPOQXsl0; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="dPOQXsl0"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5f88a93dceeso736806eaf.2
        for <linux-sound@vger.kernel.org>; Fri, 31 Jan 2025 12:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738355101; x=1738959901; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HLsz4+tHpjKqe9Yh2fzFcV0a8GzDcsWx5V/eyXI7CsY=;
        b=dPOQXsl0jyCRKlP9OZrbnBzIkog9S7YDFa0F4xmuWXBuN9tnRHwd2YqfZbpjURjHM2
         qotZJvpGyyYMyW3I7NxtrwidnoXp9GUZspNWpvTUEjW5TY0uzG27gbKE3jqVKVXaamVV
         c3sCvAtI2fBkvD/jRU1HabsdnA1biCTUsxXzorz50dCFKhTEpAK7eWVgdg3z/364Dc/n
         GB4Kx4b6/PU/kvEOEgifO7TlOvvbLhze+14A19IMqYf+IbZn2EFAvoebHmjnrwFQBsyG
         0o+mH2KgOAiIG552xnoZDlO3DmItar2Vq5PY90p38uXkikPoSt+v2xaj9hwtSwmk3p8I
         7QHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738355101; x=1738959901;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HLsz4+tHpjKqe9Yh2fzFcV0a8GzDcsWx5V/eyXI7CsY=;
        b=Tv3H4gWlkGopUtTB3oMgBIuiancIZ4lm5u/hFadVRWExGVuSxYimOih5Abjzh22FdZ
         f1GaRJj3w8NAhIVV0XHUgXCGoTA9BW2ZHA+jKRjAysq7xBjVbV5vYbszVVGbIyDwwXvJ
         XIrtqKOLd6iz5M2ZFMFygeGEKIWVu2qx+BMHmyBNs2owXL5KllxS8OlzHyWrRQWPg3m2
         +Y/aLipBCVdZNCoCiESmGsooP3GrEqnIIeff0WHIi8uHmjE5z0YOt9Ie1ncrV04PODvV
         iBP6YeyiDfzMG5m3TseO3WDEzvouVUcPPK5QMWC/4WjXMueivts906i+M3ttHjfbEr9r
         8pag==
X-Forwarded-Encrypted: i=1; AJvYcCW0pOPLC23x4N7pdrCh1+if6XktF72a6s19KiR+u9y1PobCiRt91dh8fZjLuNh6lCVepLHaP/GE1Sk42Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywthj/pMu4Q/AmoukVUwxQKdt7o1KUxWJ87GpcG5q8iZmcFvzSi
	vau7kE61dXwZJlsut0Ymb96WDakKY0ecBKvHu/yQCa2WAJwBFzlbKGsBapqt/vQ=
X-Gm-Gg: ASbGncvYn093G+Hpdd96ZGpQFhHnRPC/OhGq9rUgTXzKfChe/NZKScdPOL3CfGvpDcG
	NAu5GbEyb3jwMoVGp80U6O2dvX6TKNQ2c+6n1hrJwo0VOXxdTczdcUg6z+lpqIWSvsb2Q8zmbXY
	N1HzGG8VwlPA+XvF8AY46aggHQsgEHvOhHGvSpYd1GPQGo8+Kg+j5VfnJ6a6EMWXcL1DPR1zFus
	P2IpDOfcAvaHyOtNJ6kdr3D9+5kizsiGrM2aJxCdQL4Qyjyubp8FmYs8gth7rKnPKeQmGxUNuzb
	WnfM7EJq8ad7N3Kpmy2NldxGPoIq8oaMqlhSVrOVLC0nxXc=
X-Google-Smtp-Source: AGHT+IE0gOiKruiwKZS2fVv0rrPSXfEcYE6NWhi9xtJKoPa0qd12KXWlAvVzsWhUG+e0SGLuDExKGg==
X-Received: by 2002:a05:6870:702a:b0:29e:6096:c25f with SMTP id 586e51a60fabf-2b32f0bbdf3mr8023505fac.23.1738355101014;
        Fri, 31 Jan 2025 12:25:01 -0800 (PST)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2b35623d2ffsm1403157fac.22.2025.01.31.12.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 12:24:59 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 31 Jan 2025 14:24:46 -0600
Subject: [PATCH 06/13] iio: adc: ad7606: use
 gpiods_set_array_value_cansleep
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-gpio-set-array-helper-v1-6-991c8ccb4d6e@baylibre.com>
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
gpiods_set_array_value().

These are not called in an atomic context, so changing to the cansleep
variant is fine.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/ad7606.c     | 3 +--
 drivers/iio/adc/ad7606_spi.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/adc/ad7606.c b/drivers/iio/adc/ad7606.c
index d8e3c7a43678c57470a5118715637a68b39125c1..fe2216fd072e375f3dd8096980e53074f8ee3758 100644
--- a/drivers/iio/adc/ad7606.c
+++ b/drivers/iio/adc/ad7606.c
@@ -818,8 +818,7 @@ static int ad7606_write_os_hw(struct iio_dev *indio_dev, int val)
 
 	values[0] = val & GENMASK(2, 0);
 
-	gpiod_set_array_value(st->gpio_os->ndescs, st->gpio_os->desc,
-			      st->gpio_os->info, values);
+	gpiods_set_array_value_cansleep(st->gpio_os, values);
 
 	/* AD7616 requires a reset to update value */
 	if (st->chip_info->os_req_reset)
diff --git a/drivers/iio/adc/ad7606_spi.c b/drivers/iio/adc/ad7606_spi.c
index e2c1475257065c98bf8e2512bda921d6d88a3002..d3064e452adfbc40b44f4437e76a73aeeb036ef0 100644
--- a/drivers/iio/adc/ad7606_spi.c
+++ b/drivers/iio/adc/ad7606_spi.c
@@ -297,8 +297,7 @@ static int ad7606B_sw_mode_config(struct iio_dev *indio_dev)
 	 * otherwise, they must be hardwired to VDD
 	 */
 	if (st->gpio_os) {
-		gpiod_set_array_value(st->gpio_os->ndescs,
-				      st->gpio_os->desc, st->gpio_os->info, os);
+		gpiods_set_array_value_cansleep(st->gpio_os, os);
 	}
 	/* OS of 128 and 256 are available only in software mode */
 	st->oversampling_avail = ad7606B_oversampling_avail;

-- 
2.43.0

