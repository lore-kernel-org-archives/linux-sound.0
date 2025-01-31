Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5111F8922
	for <linux-sound@vger.kernel.org>; Fri, 31 Jan 2025 20:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738355122; cv=none; b=onfxzc1ZoRea5N/tvjRb1OiTsPc5+TuEvaXFMpXNm/uedAhGJhQ3eop9cw8VaFrZEihiDzzUDoUXsvAjBb28nLnV/ggwGevPhQqM18Rv+jzJna3ku86q8ADU2E9JsRLfAbF2E7OdDwRNpNddvLo8HM9I5XV8Uyu092viM8VGuSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738355122; c=relaxed/simple;
	bh=Q5q1Cf62xGuA/zV0+TKjafPv8tjFCx47ZmXmvjB7zzM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=htJ5QfJjj6a/lheL+QYYTNsPQ5Yir5Zb7e6O2aYXsCVSl1FPm1S83GHCE0hAFM3etmU6IPHgBxjhSc3IWqnYOY4NbRkTu39pwDbc3lXOZbp0gFGXnZjoLDTEtEVau1qr241vuWzjSRlsXw0fL3YNyiCtQflw8rJKZdwRGAVaTO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=FbeReIqM; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="FbeReIqM"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-2a7ccb2c618so1390704fac.2
        for <linux-sound@vger.kernel.org>; Fri, 31 Jan 2025 12:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738355120; x=1738959920; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t9cxGVlfrmOEOQA8LocUnneYPfclUeeeatGnfm6leQU=;
        b=FbeReIqMO8vnYpLBMq/tCQ0Wzeek2MVG2PLNB7Yw48XmSR91lLUE85YYll47wHcuEu
         KycvhEOn+wigv6T6KB/XPC6dioLkMKuCOjMedEl4BodAinW7aFP4eqPQQ99l0fu3cWaq
         gL2G84kObRY7oQq7XO76+72cpJntOeMqOKS/xffF+kT00xJqHKfs15kGwTrKa/ctI3TQ
         77d0pr/L9NTJqbNgESKgZy83jyDmvTaegIUUhESKXVJFQSNXL4ADZVNr2ACMFqyVI1q7
         uISHy0u6AS8n/eTyhSwV2M7LS93hU2/mUq2Kkd/UVI0onUxYS/iy/TL1dPzrw+s0oVxw
         cz3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738355120; x=1738959920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t9cxGVlfrmOEOQA8LocUnneYPfclUeeeatGnfm6leQU=;
        b=PwbuPKwSZGeX1f+qZv3TNfJiBniXD0NqIdsUhmyycyjN9AtGcNWVjv+1WOWQ0Z0b8k
         rY65QrzqCOWZDGkaOWuuzlL8Qb/OJK6ON6/UYK2hOpvEQGzVH3ke6cYlIE8gEOh03PEJ
         q/dSYYrvTTLle/e2fB4a9zSjrejf/jELIB7MuUU+bWzaFthq5mRI37/ffQSV67Vr7KcX
         WkNg+kka8Yso5Ggy915t0x1qm2o1rl+FZkhAdj4G3f6WStovnwAN7I2hbBu2B0Td36Hk
         LK05BJ2zhjKnolJynB28CNh87HqhvSboAIxXHRVKIZlSobGch/+KOUnaHYZl1k3T8FML
         0P4A==
X-Forwarded-Encrypted: i=1; AJvYcCUa2qMz7adzaeAX/8qQeXaLQsgBKKqQRdoZkVwN3igjO3PMFjlVCJDSobK6zs4PtiJyRnfjGVowENz9LA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhs6BIyRcAK5LdJ41rfu4/DfBlDxQtxnztKVGeR/DnVuoRbUJt
	VapcEEaeRcUg9ynVFkizuCTI9spqkZFzAImvf3XCDFAhqIviEbIPl4LlD5Vps7A=
X-Gm-Gg: ASbGncvtSMWy1eNNYmVfsq14o8L0ox9zf8TujI/I8CJb9KjlJI5Dj5yMhmmz4HKssXF
	O4Qq2CxvxS+6D8qg/LzDvomZazUfmkkC92UuxRb825YF32Te3P1G4z+KQLmE2uibYYVT0inGKDm
	fgqV+sHHCgniRY4YvVOXChH8erlVOy955nsmIBkEgHq2Lw1+g6SvZS5V1ZgKzy3KB34qUwU34lg
	D/lIm5+/KUWGxV29l/FoJeHZ9/5r/fHMhECc91lCeq3RkCpu93ZsPWIdbFoeGxudKuB32QcEj9S
	evkSuwVu5yUDRWnX8V9Ycf/iTfCNMRBMAfNedZYNDaYHlss=
X-Google-Smtp-Source: AGHT+IGqg3uaTvNfsfu96auAGMNqMTSmH6qy7PdoMmcZZ87lNXJHf3Cu8HBE7iXbpxe/5j7p/ZYumg==
X-Received: by 2002:a05:6871:209:b0:29e:20c4:222e with SMTP id 586e51a60fabf-2b32f2f8592mr8795453fac.34.1738355119837;
        Fri, 31 Jan 2025 12:25:19 -0800 (PST)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2b35623d2ffsm1403157fac.22.2025.01.31.12.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 12:25:18 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 31 Jan 2025 14:24:53 -0600
Subject: [PATCH 13/13] ASoC: adau1701: use gpiods_set_array_value_cansleep
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-gpio-set-array-helper-v1-13-991c8ccb4d6e@baylibre.com>
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
 sound/soc/codecs/adau1701.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/codecs/adau1701.c b/sound/soc/codecs/adau1701.c
index 291249e0a2a32df7dde81904dce2f6be143fc2d7..d3e6b2763950f78143c0feb07c36764cb265441a 100644
--- a/sound/soc/codecs/adau1701.c
+++ b/sound/soc/codecs/adau1701.c
@@ -325,9 +325,7 @@ static int adau1701_reset(struct snd_soc_component *component, unsigned int clkd
 			__assign_bit(1, values, 1);
 			break;
 		}
-		gpiod_set_array_value_cansleep(adau1701->gpio_pll_mode->ndescs,
-				adau1701->gpio_pll_mode->desc, adau1701->gpio_pll_mode->info,
-				values);
+		gpiods_set_array_value_cansleep(adau1701->gpio_pll_mode, values);
 	}
 
 	adau1701->pll_clkdiv = clkdiv;

-- 
2.43.0

