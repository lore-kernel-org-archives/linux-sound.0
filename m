Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E2E25D551
	for <linux-sound@vger.kernel.org>; Mon, 10 Feb 2025 22:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739227077; cv=none; b=UdF3oVSA4MwO6YRCDGdX51Bi+E1bgMse0U6K+PV8Ni/kPeK3s/oU93nJmqfrWPwrW5TqkJDphBJOC6rvRsJeCQqjUSyxvOOI4wIXSgved0zdvOV+w6o1G7A6j3BTzTrA4b3sCHyDwgNP2DJava5QRZMCPN6a0IVGNdzVfZgyo0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739227077; c=relaxed/simple;
	bh=DEtDLgJv5UYwZaak4CnPj1ALmi7rrV6hWuddp/nLJio=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BXYU28OZa19UtOKS6povsYxFE1b/sECzArbWDO8CfddkYAPyB1AZdPxpDJNdkaOy9FQrRdENa5DytKLkp1ibz6FPK1xJx3PRowoIof8ha5KHmNgSiaNjla9zzsXS5eV51CHH32pjXOC5TQdngD9Eum694MwH1vOoLwbh78F4Ekc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=vujvn9q1; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="vujvn9q1"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3f3ac204922so1247845b6e.3
        for <linux-sound@vger.kernel.org>; Mon, 10 Feb 2025 14:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739227074; x=1739831874; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GMcrxDurUnSK2SHairVKflMalwdh2XVxdj0wjaWv8sM=;
        b=vujvn9q16sHkCxjODesonUK7YfToaWCovqp1meHYAiAMGuxuvuxvtjgT7kb4u9Rr6V
         swRcw0YIojKyBSboU0wstCJdaRggX8BRWH4M6uBpGT8p1fBitXYbaydpvLWzCEQjAgyH
         NK8GDJF94FCeuET5MshCx5YbGjJaWqAgw3WdWfpWFRjlu/QtI/QggzM5FO97TiYmaxBz
         PAABk2lpH9oFI0pUI/2JkcpFJHdPWUeviNglFTcXNGwMqsgsZIHJYDsnSsc9LP95ZXSs
         ERAcFCFmZaDh5TkuKpoMUw8CZYx5ReOtYpGtHricMbLSB2JZJizhsvkfgo09Zkf0S9Pe
         pc4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739227074; x=1739831874;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GMcrxDurUnSK2SHairVKflMalwdh2XVxdj0wjaWv8sM=;
        b=UrufFi8BPbTIAKhR469wWPOmxJnzw1gkShNTx7VBzIF5m/vOjO7Y+8wii/Z+ORzeah
         yQw0IsfvFQVbjCKAXiyUMKZHxrsZ3dCb35Row8SjWwZoT77k1yH7HUZGMN5L1p6AeaaQ
         ZDOY73pk6rWcc1w24tZrSrsAkNhqEkqyQJqFKFgUfu30uIp6HG31C80Zn93bSk+sPF6s
         z+MQ0X3OITsyj0/BjTf+WQGhvD/YsUAEUb1pSofGAg2I+/Wngkc7mgo9TEWviecYiVti
         4RV06LTiGge0nPZgCSbzj5LHGlIqncbvI9B20IQ6Q8S2Gw1NnRCpzIiGXAiC0C6xKkxG
         ZKEw==
X-Forwarded-Encrypted: i=1; AJvYcCVR7b9e1DRbEaqa01yqzr28x2qozDaPonIWmn29ST8/Ih83h0Gt77YPyY0CJkV0+1NvMUtaZc/iBs2A0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzB2p8im154KQhOoOmtDgKlp3g6YpHLXw7vSzygE2L6Q24jJf2f
	OEjwAz5RUZrpOQABHkcvcoro/cFsc+lS3uQtJo1mnAMc/4PvldQjkoo4V2Qfsb4=
X-Gm-Gg: ASbGnctzdw3DTGAM94N5vB9QS16BLcMqs4IcyZTf0RFEFg5GyhVmXeDUd/A2bsbwZWP
	EgOiCYSxyLOJt8pYWjlHqpTBGydA/rVerb4PmPiP5QAZCvwLOuGAAHv4juQsc1JYr9TYOY2Nc8C
	wSe/fOIWh3k9OEK55ds2jhSpuXUn0wT/UrmO2/7kO5xbshqYZc9ooBqzRkKhn9e7rRMmwwVc9ix
	YIoIrRRY2OpDNqAPRJ9hs0Ry0LCfH5CrB6a5OvKC7BM2htk1GMB73mXOlZNKF9bPb2kbqaoPIwD
	AYZGLs9zeV3f4A+Bh+dxah2gxZILblo96FBQiUcAqtR0eeg=
X-Google-Smtp-Source: AGHT+IHpQCMO/UtYCFM9csSv77tlAPoKshLmX0/bTL0+YDtp28Q6Z4e9EVZz3B9NbqVlL1P+vOnPrw==
X-Received: by 2002:a05:6808:1a19:b0:3eb:39f5:de8b with SMTP id 5614622812f47-3f392362d24mr10975894b6e.32.1739227074492;
        Mon, 10 Feb 2025 14:37:54 -0800 (PST)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f389ed1ca2sm2521820b6e.11.2025.02.10.14.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 14:37:53 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 10 Feb 2025 16:33:34 -0600
Subject: [PATCH v3 08/15] iio: amplifiers: hmc425a: use
 gpiod_multi_set_value_cansleep
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-gpio-set-array-helper-v3-8-d6a673674da8@baylibre.com>
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
 linux-sound@vger.kernel.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2

Reduce verbosity by using gpiod_multi_set_value_cansleep() instead of
gpiod_set_array_value_cansleep().

Passing NULL as the 3rd argument to gpiod_set_array_value_cansleep()
only needs to be done if the array was constructed manually, which is
not the case here. This change effectively replaces that argument with
st->gpios->array_info. The possible side effect of this change is that
it could make setting the GPIOs more efficient.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
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

