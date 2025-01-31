Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3271F707F
	for <linux-sound@vger.kernel.org>; Fri, 31 Jan 2025 20:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738355109; cv=none; b=cser8XxR+K0Q8Ve3MCdoEkt1ELln2mgsOeSyndYdLHJu9Zxye+9RyRLayZMo3Vq8q8gCsgVXGc0o9F8hhqMEZdNreQBMR4ziiiYGW53s6UZqvhvfkwWjCHylf/K0tYhl1NeFzDB/S6nh3i6fEnko+UD5qbyLIQjYssZowZeBAOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738355109; c=relaxed/simple;
	bh=Dir9udBrhZIEDuzX3pRLNcZGmhbiV9AhUdKa7dHH2zs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S7Xi3c0rJCTqQoNvtHG2jc4aqEVycsc0dk4NYoQo+QSCNF8r40vAMIJJybVnfKV7vU4Myf77UEm31Tx9TcPwE0NdanmOXkxY/Vg135vNEeSP1tZCBSq4/icAYC6Ns0a6v0ymsLr/H5zp0/cNhkXFzaAkjWVftESBq5BxHZT21Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=JLqiHDEm; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="JLqiHDEm"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-2aa17010cbcso994437fac.3
        for <linux-sound@vger.kernel.org>; Fri, 31 Jan 2025 12:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738355106; x=1738959906; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DXSo9qIqFw2jH0TFUFiXNHDreUcSE5l/XqXZpt46Vu0=;
        b=JLqiHDEmc5QOTTvhC7d5nL1vn+WC3Poy4hTEcuXYTaFGW4yEm/1zyc+ngmEptSqGFM
         uLDCvKUKB++42M2YtmVGMG0QBxnNnDglYbuSmoY6Ojjf+BoLddAmKeFvrnbE2viMU1zr
         hhhq06ewVft5HMEb2wOISaPPa/E+ZIPsyuNTNxcUhi0AJxLV8Be03dvfV0Xq+T+brhbL
         cQUb2KfmxGPVChau+3bN0HKFgOtWb+up3CWWwR0OUMjKQ6/0E678p/pgFHPrZrG4NkYR
         HfGTCH7jhVbD3GS8EjzY8v/BkE8WIdOJ9SLNLfWUMt8ac9GfrpDw1+tbgvOHgUbuo8Iq
         NhKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738355106; x=1738959906;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DXSo9qIqFw2jH0TFUFiXNHDreUcSE5l/XqXZpt46Vu0=;
        b=D2IU0f4ua/V2WEEFhkEd/G7whpKws000J8dnUt8X+DQqhPfwNDy5NlNyp4eU88wszE
         jH1mEOG8lEiuXm6PGlxmYM4u7H9zoflagmRhSFfxniMn2F4KJ6/pvA5tfXtWItoVEPaG
         NP+aL/iPlnFNwWss1ZpQR8gnTgWxmugocKdX9zSHf79T9KkkiNNk8Raq5Zp/1hGBI0l3
         Cf735/ZuK3Jqf/O1NWcbmVbjpDTAWKM2PcVeu4+x+clxgPL7OT4oE/DEGSKZ3t8R8vYr
         xcdgo/C+ZYX6/fKOtz5HTNaksKb06lcxRhLm688Lqc1kOf++s6Q8IMjwvmQpcrDq02ZD
         nTQw==
X-Forwarded-Encrypted: i=1; AJvYcCUHr0KaDWpjkczQpaumlRPqvAzrXu1ND4fIREkmf/sfes74oRCIT7+QK6m2R6CNbszQHni5Kx0pzdtFVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzS4yQyT0TD36Jlw6HEuSCTdBH320EeWvOh3iAhG0V0/Tnp1Dsv
	qdR/AqAVckj4EEj5u0OW7IKuPdFMqOmLGKH+asRrCEFAtos9nR2nnzc1j8mBFo8=
X-Gm-Gg: ASbGncs+AQql3Di1p/OuJMvOwES6CRYkr1jdCB5pkWNpH86iseCt4Eu+kcOfruWyESn
	kSXh40vwbCo2XAMG8JyjYhVgD8HqnXW0ILHveRnChTsmFYtf0ttcFWD0tR56xWIpQ9hiPW2MERf
	bJq7TUVnizTxgOyzGEe7zij9MpCPUc+Gg58nlVhnNSiRGC3z37q19CckOBMoKc6WXTJuIwErGmE
	FKaHVb6X/BWfuK+wIF0RLS3WSgMkS5f3kb42m2DWnRfPKEeX387CFJgo2Zn3ZXvVltfrGvANqg4
	dyEIBV+uKeT2mugjSUneuXF3dlCrGp1FwVJGYmN7Uqy4R2w=
X-Google-Smtp-Source: AGHT+IEk+EYILkaYfRPwnEDbJBIEBFXhatYC+4TE05088ijfOkCj1XESP7wyxn6VQQJyYksFnt4aeg==
X-Received: by 2002:a05:6871:a9cc:b0:29e:2d18:2718 with SMTP id 586e51a60fabf-2b32f26194dmr7999805fac.28.1738355106264;
        Fri, 31 Jan 2025 12:25:06 -0800 (PST)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2b35623d2ffsm1403157fac.22.2025.01.31.12.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 12:25:04 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 31 Jan 2025 14:24:48 -0600
Subject: [PATCH 08/13] iio: resolver: ad2s1210: use
 gpiods_set_array_value_cansleep
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-gpio-set-array-helper-v1-8-991c8ccb4d6e@baylibre.com>
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
 drivers/iio/resolver/ad2s1210.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/resolver/ad2s1210.c b/drivers/iio/resolver/ad2s1210.c
index b681129a99b6cf399668bf01a1f5a15fbc4f95b8..938176ac7209a92180fe8d55191d4abce026afdd 100644
--- a/drivers/iio/resolver/ad2s1210.c
+++ b/drivers/iio/resolver/ad2s1210.c
@@ -182,8 +182,7 @@ static int ad2s1210_set_mode(struct ad2s1210_state *st, enum ad2s1210_mode mode)
 
 	bitmap[0] = mode;
 
-	return gpiod_set_array_value(gpios->ndescs, gpios->desc, gpios->info,
-				     bitmap);
+	return gpiods_set_array_value_cansleep(gpios, bitmap);
 }
 
 /*
@@ -1473,10 +1472,7 @@ static int ad2s1210_setup_gpios(struct ad2s1210_state *st)
 
 		bitmap[0] = st->resolution;
 
-		ret = gpiod_set_array_value(resolution_gpios->ndescs,
-					    resolution_gpios->desc,
-					    resolution_gpios->info,
-					    bitmap);
+		ret = gpiods_set_array_value_cansleep(resolution_gpios, bitmap);
 		if (ret < 0)
 			return dev_err_probe(dev, ret,
 					     "failed to set resolution gpios\n");

-- 
2.43.0

