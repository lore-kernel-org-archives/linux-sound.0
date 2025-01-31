Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E7A1F75B2
	for <linux-sound@vger.kernel.org>; Fri, 31 Jan 2025 20:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738355112; cv=none; b=RDqie3SUZ+X3T39hGgebYRTfdc2g+89cevKqaiTLdZ5qSV/TxY4RS/HX0QMCKvZYHWC7IB2kVJI2Qc6D1ErCbmkY0vUTcATOOQyVJ3WRTn41cU2WReTEZjIFO/Ge9z82hhnG1Vm/yXWAn4J76ENgGYxXwiIG6witGgRQgOP0F38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738355112; c=relaxed/simple;
	bh=MK0Ks2Di2rJVvigp/s/vAkyxV2Ps9hTBvb2TEAom5M0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bQ2GIfaah1wjGLldLOWlNd5T1GECbYPks0zlkwTaJOveHIKIB1aiGo2QcRGX4XepvJJ0xtc//Wg3w3x7M2ceX9RzwuWKveRvLoqsfq95GD92pDHPILZz6eMA8qRfPnkZpCtkymApAuiQKEAlPGhO83DHZWCNcLrW7dMawPWOtLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=TvKooawx; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="TvKooawx"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-29fe7ff65e6so819562fac.0
        for <linux-sound@vger.kernel.org>; Fri, 31 Jan 2025 12:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738355109; x=1738959909; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lwWNVnhNlJbHZ/NQhMSjzQrpqbMeo/6h41DdX1Qvb2w=;
        b=TvKooawxk3ek74wKtIXI5KaEKZulBtQxUrB6kT0RHQ8XQ5TNLQejFlCawjYv5dJxKP
         QmA0sG4JSA4gCGhiV44hp1U4iN0rC9D0ZGD6wp3VOQdc+WLXeUfK4cBDwc+pjyGzfk/7
         pIVDcxasgxQJ2GQFj2lxnW02DL477FldSm5uh+zU/Fgw1W+FRvpN4rRejYXzpHxzzQSq
         iCG1ZxCO27hKzZQIg5uybXovgC0OSu8/fCgzH4gIlDI1w2BuG2YhRlRuDEC39pO9u22J
         zfw/1OapEiNvUatIPZ5hKMapWz2jItA1s2EfzhfSeHtmWGsEuE8dHTerIIfQDTMKhuZ/
         0yHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738355109; x=1738959909;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lwWNVnhNlJbHZ/NQhMSjzQrpqbMeo/6h41DdX1Qvb2w=;
        b=s0QNNzvAf7u/OqZy8J8GxG/ZeqrNdP2T0iyMHQKx2v/s1PmSs4c4u9Th62E95e8H5v
         COwGn3HTfjqi0h7O7YJV1FxT1ypotSMphUgqYTw3lwYue2xGNBL7q7MPEJljxyrgGJRH
         4iX4tezhN32kR8To1XMK65C4sV5tFzInYTyFa6ADprPYXNp85Z150fhYJLepYLMtKIBS
         xpOZ9hymMXDVrAFWqviNyB51mjPTMGdl7a0Hd19XVhkfuECUxheiPamAKWiQcbumDFwK
         v5GsGK2F5Z1yZCsKCzVicsX7mDo1KmbXEO/DDYepD1v1vrD+tGyltHi3B0C7RsD68Fqa
         SnqA==
X-Forwarded-Encrypted: i=1; AJvYcCW39BcuAqLX2TI29u9ILmVuKIwcSCWPrvXAvBndfzSzGbHIs6NorPedh8wgimgThK8CLGXy4mEiE2wfzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSYYUBwq/qFbAwc6SrzrYZQbFJf63dDzW6lNxciuzI9HgBsehK
	oyOzB2sCQ5pBigdajZW1v8lEg/GAHeJp3nKgKW6xm1Cwlbfpq4SC/Hpxuga6aL8=
X-Gm-Gg: ASbGnctQ5luDjakLGK7yg9Gd9E4Gk7AMpg5W76O3MR8I218GJhJv+x4+XkBM3Gley8q
	dEZA57yDqVSN7tGBZO44dlKDLGDFIm9vbJfF5ZiPjqueem2MG31DU0EGcIGwZgf3fbviFJvlfuV
	jhyJu8Sh12TdLQPI5c2JBMycl5FyC9zqQ5uPM9GgoumeGfwFbkMIL9YML7WvDUS4NHsNFRMNRbt
	q/gDTSbK4PMbXyphHfgDDfdHFkti53Uzu+kp9ECzv57oW/Bcl/gAcrCaDv1ulGCYcnEHr4gdDiu
	H+LChuBNw9txWWOhG8mpEcqC+wgWudOcxu6JnyWUO5bxAA0=
X-Google-Smtp-Source: AGHT+IHQyjQ8y3Rtu7NlfkeMw/zOxhLdOk/J2rb/TrRaSbO1InYUF9KwbynHBq+Y9XgpJsj8OqBDUw==
X-Received: by 2002:a05:6870:7186:b0:296:aef8:fe9a with SMTP id 586e51a60fabf-2b32efdc7b9mr8033858fac.7.1738355109312;
        Fri, 31 Jan 2025 12:25:09 -0800 (PST)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2b35623d2ffsm1403157fac.22.2025.01.31.12.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 12:25:08 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 31 Jan 2025 14:24:49 -0600
Subject: [PATCH 09/13] mmc: pwrseq_simple: use
 gpiods_set_array_value_cansleep
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-gpio-set-array-helper-v1-9-991c8ccb4d6e@baylibre.com>
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
 drivers/mmc/core/pwrseq_simple.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mmc/core/pwrseq_simple.c b/drivers/mmc/core/pwrseq_simple.c
index 37cd858df0f4d7123683e1fe23a4c3fcd7817d13..b3a6d053c826741005f1484ad81df30b6bf75bbc 100644
--- a/drivers/mmc/core/pwrseq_simple.c
+++ b/drivers/mmc/core/pwrseq_simple.c
@@ -54,8 +54,7 @@ static void mmc_pwrseq_simple_set_gpios_value(struct mmc_pwrseq_simple *pwrseq,
 		else
 			bitmap_zero(values, nvalues);
 
-		gpiod_set_array_value_cansleep(nvalues, reset_gpios->desc,
-					       reset_gpios->info, values);
+		gpiods_set_array_value_cansleep(reset_gpios, values);
 
 		bitmap_free(values);
 	}

-- 
2.43.0

