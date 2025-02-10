Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBA2254AFB
	for <linux-sound@vger.kernel.org>; Mon, 10 Feb 2025 22:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739227059; cv=none; b=j83VoyKgGAT12d9N3QFpFrApAymD5MtcJ1ErXbShfzFVD/AlvAVl0U7FEzq8pgFb8ja3t8jw/p9NU/DjMsYZZKkavZQmKcRQ8I9iBIvl+ww1paVDNiPSgFcdS76uq2o1KLN7kQa638kw8S0SSmk6+Fc8sfbULOj8ka0DLL7yyl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739227059; c=relaxed/simple;
	bh=niyVa96MKYbn0/yX32i9Lb8f6xkttYKqAUie+rLFIpw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dd1h9OM21/6r2YYeygEdeS1Kk7066DB9znJNobZtDWXj53Vw/3OcqApG6DwsXaaZ+9b0KrsuQ4KGSuTCxdV20bR/vNwfj7pXUhEo2Prri3EZshjqo34y55EHU07ZmJXh+wGzQfDqseZy0Xd/YqoG0qMtNdHqP09/1M3dSTnT4lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=NiddYB0j; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="NiddYB0j"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3f3b83185d6so600990b6e.1
        for <linux-sound@vger.kernel.org>; Mon, 10 Feb 2025 14:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739227056; x=1739831856; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YJrdF9PqOCsaQVoyXe6fXVbwa2pQeAvJKGzGuCxpxAQ=;
        b=NiddYB0jNhn//VaVWUzcWNGKWIeEyKfcIB2RGxGapk2Rsw7QuhJTHCJ4XwS/Nmfi0m
         wv4f2mthWm/UF4OJUKuECfl4tuSEVDfnuWTQkQpAWIZUaZxu8DMh3ph3evLpfuEw6IEK
         MoW9iB84yzBIHcsc2B7d9OBfcqiMCmZntNlfXoWvLZr9088w6ZY0uHXFK2r4TbQkUsq7
         PmnmEn0pl488AdriFRaZasKhpgeY0kWGFDrR/+guatUWgoUhgFzt4Tjg4u3vnJXp99Ce
         JkzEaOo5JuUjNYlQmHr+6wYvDKwooRd/S0wbt7IVT6hFs7Fv49vWVBAb+RTYfcws6sHi
         o4pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739227056; x=1739831856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YJrdF9PqOCsaQVoyXe6fXVbwa2pQeAvJKGzGuCxpxAQ=;
        b=dwEG7GY88oeJSfEnRCl43h6ehBB1IyqvldaOJlt/WNgxQN8H584HFELGRG7K6ezrCt
         iqJpqpwtVNEPBJS71mbHY7A1sKNgP031IK6dXTGpB9uUxsSJFgc7NwDtDoPLyo68ZOY0
         R4VVpeUrPp2l1Cy3AE1fw/5B0mbJ3FGRseoUo3zQ5ONrvhkca1kZpuF2gpuRjTxi6WrY
         JHzvBmNLoO5ObEByzQUwposNuWQED9WfzNs0wryqHPf/BINwTq6ARFOFqYl9ijhs41pM
         MYnFULm4HfvxPgYHYiaF4HD9C0sVFOlwNsDV2hUa0ig9J1g9vTAZoYJpPG7qnzZF+5Jj
         oNfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXQRaC9C2uuwAR0XNyFHTHQJmallz/iKrwNj7MyzbRq1rx7RMjSCc+ZA7VdAJ1aGVu3Rmb1plOFZfoEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDHNt+BnQGW7UQjoCkUgnt3Kfl7uf7X7Dw4V93vrYom9uveGvR
	gRoUpJLEGfwxzDnre+78I2pt4foa9BB1PV2mGz4KKXstpgwFl9Q1a4eiqax6NxM=
X-Gm-Gg: ASbGncsqy37slUniozXewYgrAHHBtDjW0G/RVz/hjj0xDU5KlVmMowT+fVYScjjXGHQ
	cxNAn1Ea1qXrujLOsH95HoarNs27Ph76LRkRfl6BqkfqaGVRjr1s2jGjEHfs25Uy0F3hDuP0/ap
	kPm0hBqKNODBroM86plJ35zYDIzFp8UxATRJdSceYH7WpipoO+22WnUF8PPNgj1khlKIOrfFZLt
	jpUU03WC4+nML+pMlidGtLttnk94B8evQiGXGlJ5Ug3kVohhLCiJFxnMDp5EVjgN4EmR8qOUyvt
	AvoN4H/9lHRBTqTuSlCPJFxAAW/SF+MICe2qzkkbJ3oSmiQ=
X-Google-Smtp-Source: AGHT+IEaS15Bntym3mAt6zrku3a2Uko68yjmwMRgXiq6dPbA7MZZB8Aa64yOncDet1fFdEO8/9GX1g==
X-Received: by 2002:a05:6808:198f:b0:3f3:b6c2:a29 with SMTP id 5614622812f47-3f3b6c2115dmr3804142b6e.7.1739227056176;
        Mon, 10 Feb 2025 14:37:36 -0800 (PST)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f389ed1ca2sm2521820b6e.11.2025.02.10.14.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 14:37:34 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 10 Feb 2025 16:33:28 -0600
Subject: [PATCH v3 02/15] auxdisplay: seg-led-gpio: use
 gpiod_multi_set_value_cansleep
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-gpio-set-array-helper-v3-2-d6a673674da8@baylibre.com>
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

Acked-by: Andy Shevchenko <andy@kernel.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/auxdisplay/seg-led-gpio.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/auxdisplay/seg-led-gpio.c b/drivers/auxdisplay/seg-led-gpio.c
index f10c25e6bf126cfaac3e4c353f8bfc6639d94a60..dfb62e9ce9b407fe356c3a7d2d25319b91a11a75 100644
--- a/drivers/auxdisplay/seg-led-gpio.c
+++ b/drivers/auxdisplay/seg-led-gpio.c
@@ -36,8 +36,7 @@ static void seg_led_update(struct work_struct *work)
 
 	bitmap_set_value8(values, map_to_seg7(&map->map.seg7, linedisp->buf[0]), 0);
 
-	gpiod_set_array_value_cansleep(priv->segment_gpios->ndescs, priv->segment_gpios->desc,
-				       priv->segment_gpios->info, values);
+	gpiod_multi_set_value_cansleep(priv->segment_gpios, values);
 }
 
 static int seg_led_linedisp_get_map_type(struct linedisp *linedisp)

-- 
2.43.0

