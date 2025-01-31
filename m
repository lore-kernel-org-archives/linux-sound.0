Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7821F890A
	for <linux-sound@vger.kernel.org>; Fri, 31 Jan 2025 20:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738355121; cv=none; b=TOMJ2C3qCKqZcjkrkkN77s0ChCXja2NPEN19l30Vr0gZjBgPMjQ1NI7CDq280FKzxly0REN+XzwsFIUsq03tXhB76xR4sdwKqyVGt+xN6QwEfTbIkGhr3cT/hCZcOdIdAuk0x///HFWZCZF/Vs8UFFbIULu1jDMnIZl1MCVaQG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738355121; c=relaxed/simple;
	bh=rmBWKBYHCI+WuV2jjWYGUn7c5T236U0xlpQEPpz0oeY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l4ajjrm45oeQcuKa36ScyrU8w6J1Bjzp76oYwEupEU74+ydl66/7WjzT1Yydk+FqyDv6blMovyDXBcWruLtdKrYNQEXMx999t2ctbCu1ovKVxkcl1zGwPSVgP0lQRZpxA97PaNRaa1q5qpFlYILwrQktr30gHX9wkPZNvB/aDF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=uPUzRuuQ; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="uPUzRuuQ"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-29fb5257e05so788413fac.0
        for <linux-sound@vger.kernel.org>; Fri, 31 Jan 2025 12:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738355118; x=1738959918; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FzzIwzQtyYUR99JIrJ6how8p6bj9KukV10X1RHN4Hv8=;
        b=uPUzRuuQm3ZGPf+v7Th3oUHvv+dGvhO4XsIBcA/QvMsizBApe0tGtAB7+nO1P7jy1q
         Ik/cc+vEza7Pr28FhufIO5AhgNywlFpeHhVthF2ROlZ23MTfqT9DC0/fPVHcfpQqKK1x
         kzOILKZEZX9col5sG0JKUv9gD/6s4Cc3oCTkY2HUjkGPU6GRoci/acai9Itvr6Qp2/SU
         kKWD+BuyBLR4hZ99kKwNJdiWIWD6UX7ascKxVB9hBP3OJH7zJg23t4lGgvJvfcmyLr6q
         QU/xxC/WfSqs/ZrYSf+pAdMqu0PJ/iCbo21j6K9tQFnuf4+j/WZhIqaFOn2uSzUKXEVA
         TSLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738355118; x=1738959918;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FzzIwzQtyYUR99JIrJ6how8p6bj9KukV10X1RHN4Hv8=;
        b=LdUCR/7qEVYmfXqPSRzzmm61YNjcgLZgGiitW0nGhmmffieDPG0lCVLYVB52hGP5iZ
         TJVeb+EbfDUmqHBo97uJ2WmMBcI4VryGoS2mhVK0YIzK138suTtbl15Ool5SJksdQVkH
         TnjmkDuftoMSX3I5aghy/qbhaq7xJ0uI/n13VvrlA4JQKt+0MrF1/YxzP4UKTlfkgbqW
         Pty0FALy/n1bwHyNVyC4cjKIl8/fNYCwDbWvcWaYgy+27gCMJz1Fo64EUoQn8AGDrzmR
         AlK6gPuCSo5uJG5SePiZ+j/3sj+6LpwPDQY76u2yoQVaQ9EgAWPS3ieBZ3bJRYyZivlX
         Z6YA==
X-Forwarded-Encrypted: i=1; AJvYcCVdYpYIg+TX4Oz+AntCXO2tMzd8BG/yTMvCOud0UBxcUoU/+1KpQrO4PISJpw7qkzsnmqOJv/W6QaGHBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZUqLZSQNN/Jje/FahMy/HAcNEYO52UAXlgudZ+gFDNpPnxCcd
	MGKjHuch6oZyUhtqzCv3rxCQ8XjHAFgTlA1QUikDI5KF1U+WeEhexhK1nU5LXO0=
X-Gm-Gg: ASbGncu+JyQC13CWPtCD1PGIu/o0D2Ij9QQ35WggfSBLHECKFQ+0Tz60722soJIaiko
	O/UB3F3M3ys2vA2Lqyp7Iv+TklUpSnCDy+r66nxu8tS7XG2qUFY4s2v96hLtgPbgsoxRuuQTQk6
	oUb8of2eg6sFcV7PWh/vRaw+gLKTVZKDgOVpRKdUhMhiF7YT5t39hshH+fx5ljyIqs4R9wAWKb1
	ZfDCWFhDgF1h6a/pDsgHBrEo9FY2RMg59bpt/L7GVIp6FW7S18lBqk5/Ir49HlbCTa2WuSSYxw8
	zX2i0EgAh1yf4MSbSpRf5ycN1uNhoLPut16R0IXluV1tnWE=
X-Google-Smtp-Source: AGHT+IERsKIHS0RESeT1aGghrd2e2VbJU3Jew/L2qRirwk6axnCtq0WNFwypLdr9E1c9DhZObl9GKw==
X-Received: by 2002:a05:6870:32cf:b0:29e:255e:9551 with SMTP id 586e51a60fabf-2b32ef5a830mr8108456fac.2.1738355117684;
        Fri, 31 Jan 2025 12:25:17 -0800 (PST)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2b35623d2ffsm1403157fac.22.2025.01.31.12.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 12:25:17 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 31 Jan 2025 14:24:52 -0600
Subject: [PATCH 12/13] phy: mapphone-mdm6600: use
 gpiods_set_array_value_cansleep
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-gpio-set-array-helper-v1-12-991c8ccb4d6e@baylibre.com>
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

ddata->cmd_gpios->ndescs is validated to be equal to
PHY_MDM6600_NR_CMD_LINES during driver probe, so it will have the same
value as the previously hard-coded argument.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/phy/motorola/phy-mapphone-mdm6600.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/phy/motorola/phy-mapphone-mdm6600.c b/drivers/phy/motorola/phy-mapphone-mdm6600.c
index 152344e4f7e44de0f8ab1cae6ae01a1f1c5408e9..8243bab6ac3af2ee1394ef743aaad12a19c8ae36 100644
--- a/drivers/phy/motorola/phy-mapphone-mdm6600.c
+++ b/drivers/phy/motorola/phy-mapphone-mdm6600.c
@@ -177,9 +177,7 @@ static void phy_mdm6600_cmd(struct phy_mdm6600 *ddata, int val)
 
 	values[0] = val;
 
-	gpiod_set_array_value_cansleep(PHY_MDM6600_NR_CMD_LINES,
-				       ddata->cmd_gpios->desc,
-				       ddata->cmd_gpios->info, values);
+	gpiods_set_array_value_cansleep(ddata->cmd_gpios, values);
 }
 
 /**

-- 
2.43.0

