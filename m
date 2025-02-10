Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D46725A2BF
	for <linux-sound@vger.kernel.org>; Mon, 10 Feb 2025 22:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739227066; cv=none; b=LnHw1aYFn3SA4/f9tHdKmop1Zcc0fpqLtIaER7+JxDSSVV0Oh8cP8h1JfPKBl0ObrmTCYfVKUs6ecSjZlfg3PHvwYJ+UGBBfOxO+TclMJ+5ycDzqxhOAJpaMlVgIDBeTE3SSO2vVXuVdac1ALAkd+N6OdMC0cPHBsMadkm8ww2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739227066; c=relaxed/simple;
	bh=K5V5TnWu+110nnHuULWw1Pwd0QiBFgzUapmy9BeC2p8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U4mOyVwWA9yUgJ19ZdANwRl8iLHoxkR4UKs5526NEvkD1UheD5CsWF1zZB3m9qCtOIM2rrlFkywtJLxQJxxBbvQ9tPvqa+/NwpknbirK/kVIfOdEbYpRQZI99pEtRE0FQFAcbxL6v9qMBhL6y0QqaXrNG6c49ZNKYcIrCe4GfWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=z4odNCuW; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="z4odNCuW"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3f3bac262f9so586893b6e.1
        for <linux-sound@vger.kernel.org>; Mon, 10 Feb 2025 14:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739227062; x=1739831862; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oAgdP5/7nbSCpei3bdgHz+Kvp3J/VbeQ+Dc9cWuRxQY=;
        b=z4odNCuWEIdXw6egWdAWzvkDfUm2yp9LCjnZQvBCOP3qcsaxfCXnX9ztT4tAzJgMaI
         oDzp3usrGdpGtWbm0FqUkKrpmWAEIq0wPRJUUbuLHncebfsQtZRIdXurTcE0coBezaot
         JCqwfqdc21V6HhF23eOTpr1Hv00Dk390SFpGVTMpKQAG5hTBVYYJCwcIsgcO9kiueCqz
         pcz1nbGaOl3KNFWRBj/DCKZxfPkD/u9KWoJF+RASmhfD3E5roTW7Q9RZbtvCdUfMt4C1
         4t7qWk6gsXi17m+oWug7qVV/Df5lYt5w/9r/5UtGtJtXuARRfAjocCTg95E9CRvg5S42
         AFPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739227062; x=1739831862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oAgdP5/7nbSCpei3bdgHz+Kvp3J/VbeQ+Dc9cWuRxQY=;
        b=Rtec6xapzQ53BTXsX3KnB1cznNZEwqbGMEhaWysI5exKOzOTosu1+xRbCEjPc2g8qD
         1a1+LlFHRnim/R6mJcje2+pUDrmR/KVueltcRz6oHEkwbDunWqB3dHRedwS6oGfLN2Q/
         xW8YkOX5deqZ9OdsnZD7NAWL/ZiJnVxMvfXNl3zpTeDowJh2t/YIj3oudloBX7pZBopi
         OdDzRri3hF5d0QlWO0+Uu0xgQzZ1J+Q2wx1c3mf8u4pYbg5lIgUTzAMEUXZuJmEdxHdh
         GC6Ovdp+NgdQyyvy0SV6hT6vdYgR5mSGVYSn8mPWpwZ0kQh1VzT2rUxuVdeFNpbBTw9Z
         t7vA==
X-Forwarded-Encrypted: i=1; AJvYcCXPgFB4BfQWuX3B0VmAr/UoOaZJC89NTS2DLJ2mdFsDQXA4aQ+TDmCEENy8kF9XX+SzEPajdE7Ffu5Ilw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbQ9pkqCoVP9oTpbbnK4aSrfU2WwsPpwk1R1qOZCxF3VC0NF2f
	ix7XObq1xelAhqJxJgZBYDb63qPq89rQEWDvAkfQYPoQWmikjI9DsKgByW8Efyg=
X-Gm-Gg: ASbGncssoePfkWd9vWLTIseZvUFj1McsfqUirfQpYrIBSR5OvLAosT4zUc+xwF66xY4
	RkZmPBamWSSqK3i6hVVBm0ya4craJaGjNtPTxVvAZgNiiPxP0rrv6GoU+/3+0P6MkZVXgwEo5p9
	S5sJLw56k+q/5dUhRupr+GjHKJ+RLDfNreFzoOqCR3qKxf+Cnwj3VkIin3A255gF5JePemAkshZ
	n9q8T58qOrPlMUSxVz0b0R7/ObuLZ3jIuaAVh7MC0Nkunm+ylYpT3EL8IvfjsuFLxoJBGItufjF
	eqhl+oJO1TdTxnPyIzJ3Fp7kjZWjV2BM4+k4ZidBlR+94JQ=
X-Google-Smtp-Source: AGHT+IGCum5h1AQwvUJNh3Kk51lVy6xq7QJ+B7z8EkY33CFant2nucCBaXwDqcXBpkDagMClSCsXTA==
X-Received: by 2002:a05:6808:4099:b0:3f3:b0ae:7998 with SMTP id 5614622812f47-3f3b0ae7b3fmr3901508b6e.17.1739227062548;
        Mon, 10 Feb 2025 14:37:42 -0800 (PST)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f389ed1ca2sm2521820b6e.11.2025.02.10.14.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 14:37:41 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 10 Feb 2025 16:33:30 -0600
Subject: [PATCH v3 04/15] bus: ts-nbus: use gpiod_multi_set_value_cansleep
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-gpio-set-array-helper-v3-4-d6a673674da8@baylibre.com>
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

ts_nbus->data->ndescs is validated to be 8 during probe, so will have
the same value as the hard-coded 8 that is removed by this change.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/bus/ts-nbus.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/ts-nbus.c b/drivers/bus/ts-nbus.c
index d3ee102a13893c83c50e41f7298821f4d7ae3487..b4c9308caf0647a3261071d9527fffce77784af2 100644
--- a/drivers/bus/ts-nbus.c
+++ b/drivers/bus/ts-nbus.c
@@ -109,8 +109,7 @@ static void ts_nbus_reset_bus(struct ts_nbus *ts_nbus)
 
 	values[0] = 0;
 
-	gpiod_set_array_value_cansleep(8, ts_nbus->data->desc,
-				       ts_nbus->data->info, values);
+	gpiod_multi_set_value_cansleep(ts_nbus->data, values);
 	gpiod_set_value_cansleep(ts_nbus->csn, 0);
 	gpiod_set_value_cansleep(ts_nbus->strobe, 0);
 	gpiod_set_value_cansleep(ts_nbus->ale, 0);
@@ -150,12 +149,11 @@ static int ts_nbus_read_byte(struct ts_nbus *ts_nbus, u8 *val)
  */
 static void ts_nbus_write_byte(struct ts_nbus *ts_nbus, u8 byte)
 {
-	struct gpio_descs *gpios = ts_nbus->data;
 	DECLARE_BITMAP(values, 8);
 
 	values[0] = byte;
 
-	gpiod_set_array_value_cansleep(8, gpios->desc, gpios->info, values);
+	gpiod_multi_set_value_cansleep(ts_nbus->data, values);
 }
 
 /*

-- 
2.43.0

