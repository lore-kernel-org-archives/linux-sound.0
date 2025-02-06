Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C9F239070
	for <linux-sound@vger.kernel.org>; Thu,  6 Feb 2025 22:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738882108; cv=none; b=nufJEok2iY9bhDDL+rEKiyC3tulzlD+p/yxLaOan8dhRxVMNpdHSmWXvEHSfpgJ+P5fZDnH+AawhXu9+1j38/pK0sEH7cxoCE79j53gR4FBjlmfzwouGeOU08BHMYVcCc3LsBaj8O2t51+Jzoe/4oN2p0PJd1xnXTqT6gvh3TrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738882108; c=relaxed/simple;
	bh=BsYr8xPzy7+Clg3NB+2+t+eBy6Bnh8Cl10byN7syoc8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P1qPdktSINo2gUFFEO48EnZmdaFptsI0U0c/RH13PDHDpQvfCDa2VS7qgrm7EZjZYcsDAuiN79G/CwGSTf+ezjhpKsA6OxiAjBV/4HVVpK+3ABM6/7iWW8uw4gfXUZqq+9aCfozQaE+7Gu8OkjgAhT6zDWL3rCnPQYV1APg/wgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=FigD2OPo; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="FigD2OPo"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-71e22b2387cso1145372a34.3
        for <linux-sound@vger.kernel.org>; Thu, 06 Feb 2025 14:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738882104; x=1739486904; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GH3NKtPpRHESHp33nulC7OX1rB6L2Ayb/Aiy8rtkYPA=;
        b=FigD2OPo/EIvsE6z27uxyPhfFzqcY5jizhT1/mV0w7nlj//SVqEShe0y7JHpCEjYV8
         Wo8WmclDkzxDFolPLke61nLi8IXFYAs3wbp+lxOIuCU+imc6DomBUZ97OlD0WKqmRWyF
         Ya6hAt01fKLpj/Z4nEjtE5ZqYXsqMfERWdgziQvNx5sOQ2+TxCYiwru3ljzKaJtCMZ04
         0nb/kzqvacxwNK0aTjnxhO0Ht1C0JYHcH83D0o0Nq+aq9Bf3eyUiTBZQYcZrM0QAkqvo
         5tPjxemt6x22Rz47n4Go5gqpfoOU5IGSuHeZXZ7Cqi1jb1pK3AleZKB7HI3a+3xS6xlD
         /6FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738882104; x=1739486904;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GH3NKtPpRHESHp33nulC7OX1rB6L2Ayb/Aiy8rtkYPA=;
        b=fFcw78Ulc4+9gzIMSaQMo2D5vqUbuzyGvdmwLybJfbqudirDZxWfepBuC4zYpWp4IF
         nGgD9oUy2M/RltEPXSO6vcSSOmQ3GlS8YO1MLavoM5v5l7MTKn8PBG6EvGUYictLNJwk
         hMI7+iqb9Hyan+OguDAkt1rmeuAeD4Bg1vR1cfww/fiixrBx8rW/c/H8VgSxjejC/bHf
         u5yxCZPWGrA6AxLMC2e6XHc0egZhjfLGZFMKmk567HUxTSYKsupHLaZQLUw+ss8FzE0D
         2+amvZAFba8X8Rn9KRkBwrY5iokYjIIgtgOtjIIzP0sTJyzRQk3ZsFHqQhdmYtRY/npo
         LE2Q==
X-Forwarded-Encrypted: i=1; AJvYcCU+8z9tA1xXi3Y3EwEF0lxSof5ZlkW0PlXjHSuQwluQnXncW9zNhwtORCSv1izroXzGzZNQ+DS3i7HrLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwF3Jiqh8VMHKZnQhOzcoyadVvKftL095zUWwYKi59Xirnpzsub
	fTsqzmvvjJNzML50OdW04qHSIyTZuMqKjUc+GzFZLp0nt69dxeqDpj48ipfxPd0=
X-Gm-Gg: ASbGnctZDI/N+eix2xL5uPstj8Kt3IF8sbBo4/sevQY0fhCNbuzdKum8j0kT3UhsHBd
	6d17gBVNKedbVtxZOOLkzgt/NjyXYysJwUCFMJQFgRUzZPuPA2iNCkXdzCs8VBr+BlkEL1/WMXs
	sxR3kNpIPGQanMSlJqAb43YZ6dV0SjLTjyR/ctaWy5t219ISKiC9GS1O/wjBH0QF8j4k40YZWzk
	xWF73OGYfhK767nH/wFvmwK7T10UKjlyFW5oGFk7epNYjiVkBLb0kMVzjsL4OLqg4KrswaygEgg
	Ku77FuNqTMXAnTw+VJ9Ut2UIaiGfxq3d5weIi+ypRTtqSZk=
X-Google-Smtp-Source: AGHT+IHCjAZ/4mXxk1VXEbjQMmNTdXsRhhKdUtPACGbfwSRhNyt4nhKE9d5n5z8psMK5DgXY9qctNA==
X-Received: by 2002:a05:6830:6c18:b0:71d:fb64:b601 with SMTP id 46e09a7af769-726b88c7282mr749926a34.27.1738882104636;
        Thu, 06 Feb 2025 14:48:24 -0800 (PST)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-726af95bbb5sm510986a34.41.2025.02.06.14.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 14:48:24 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Thu, 06 Feb 2025 16:48:16 -0600
Subject: [PATCH v2 02/13] auxdisplay: seg-led-gpio: use
 gpiod_multi_set_value_cansleep
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-gpio-set-array-helper-v2-2-1c5f048f79c3@baylibre.com>
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

Acked-by: Andy Shevchenko <andy@kernel.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
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

