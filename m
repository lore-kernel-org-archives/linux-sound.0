Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909C280638
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 15:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723042965; cv=none; b=Wq4fvaHUy/cqh5PBRIrOZGZfruR3/Wssx/EhT1T50bFfUe0r6AaaqbN2gHBTzdwOqptvLH40TZp5GDlVPpriB0h4sYQ7/WkfWJRZytc2qVTqzPkU5C+6TDUiz5CPGxC83Mx6qVHB0vE7UPfoqR1V9weukrAYdngIysIsicfn2lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723042965; c=relaxed/simple;
	bh=Y7W8wbrOkuNmZ8CQ0WcwZSJsXls2By5/tn0Y2KGbT34=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sJ7gky86Ua7rSpSCIPafphs+FzHTltiyNo6I/NXoCkcvVdFqqJIq+o58VbVTV3Pnurw8xurKur18EPiZCojgvdF4UAdUjbX+4Q/XUkVHgrW7NFIZoahxjNxtgkChqJfK+vrV63wnIBsEPqakHwDpTblKekFviQkVabUPvX90LF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GjM1C5kS; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GjM1C5kS"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5a1c49632deso2279894a12.2
        for <linux-sound@vger.kernel.org>; Wed, 07 Aug 2024 08:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723042962; x=1723647762; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WPaeIu/7/ToaPftt+nmZwaEM7lBvNV082estk80tIAQ=;
        b=GjM1C5kSf+SfapsFA4MuOL0unWnYAvVxP+sq96PLrXGdWi1i4JS+zA6nC8uyRJdZ6C
         zMh1xba5jQbFiDfKeBi4VxiqcnemXs3CBjNLfvvCKkMbNSOMAQcDp3t7iUB54XULDWJ3
         TKzxaruJMd8h0yaIQFihOm7bzrNWZPso8x8wMEzNJcLHpKx5P5K2FZvcaEv0E4BTtQhm
         mLU6ouxmIbzKEXwRkMYUrJovKqq8euTsNfwswkuRcOVCrYyMCrtHaqg4dPbBl2J7gO+S
         pQDMCfd6Z/DH2kshXfGdwmPDD6+CQMwIuzSLuzWJyZmheT1V9sWUc4m0yvTvKGamC7/Q
         Q/ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723042962; x=1723647762;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WPaeIu/7/ToaPftt+nmZwaEM7lBvNV082estk80tIAQ=;
        b=qrtW24BDh7SbvRQ28yOJ16Ix/y6i/mPjws65pK49TFekgNnX2IozwyISpjeyMq+5Ow
         NG7zQLkhxpXHOLH+RRJ4ZlzXU5DrJnNRkRNr6cB0rw9H25xWqSroBDP7xi479jAoxTHs
         04mzMrOvzKeuZ5T2lonw0HZdNu5WtfoSiQqVAVaZoyUjIi6iAlZYykIh85jR2NdTeOBD
         KuGjr4LgPFmx1kiAL9Amkk6LxX8brrmr7+btPuMvqjREKMDAb4aLeXbxCFYVp0AK+tuL
         Odc9w/PlfkmU4/ih6lKbWkgNgj+pUXhl2FQb1c3cEw25Xrl7P7NjCXnJgrJl86RIVWUJ
         AN4Q==
X-Gm-Message-State: AOJu0YwgAeTAVWHknZSndpOGFD9VshPCxAOWR2WGDhl0szWREn9ly/MX
	yfQZXQrnog6mygB4VXyfq1pFp/UzuH23OMWWWtjKhHFs5OutGTRWbSu96BZi9Zw=
X-Google-Smtp-Source: AGHT+IEYpjjpJDMbHBEqI4Rw2M2UUag+5UjvthzgGzzeXam2hAGeCohE28/rAsaJU5XDD5v2iV+kRw==
X-Received: by 2002:a05:6402:331:b0:5a2:2654:7fd1 with SMTP id 4fb4d7f45d1cf-5b7f59e04d9mr11178515a12.36.1723042961586;
        Wed, 07 Aug 2024 08:02:41 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bb90be3a91sm2583047a12.65.2024.08.07.08.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 08:02:39 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 07 Aug 2024 17:02:33 +0200
Subject: [PATCH v2 2/3] ASoC: tas2781-i2c: Get the right GPIO line
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240807-asoc-tas-gpios-v2-2-bd0f2705d58b@linaro.org>
References: <20240807-asoc-tas-gpios-v2-0-bd0f2705d58b@linaro.org>
In-Reply-To: <20240807-asoc-tas-gpios-v2-0-bd0f2705d58b@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Shenghao Ding <13916275206@139.com>, alsa-devel@alsa-project.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.0

The code is obtaining a GPIO reset using the reset GPIO
name "reset-gpios", but the gpiolib is already adding the
suffix "-gpios" to anything passed to this function and
will be looking for "reset-gpios-gpios" which is most
certainly not what the author desired.

Fix it up.

Fixes: ef3bcde75d06 ("ASoC: tas2781: Add tas2781 driver")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/codecs/tas2781-i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index fdf0840ac6c7..bac5ea6d99b9 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -793,7 +793,7 @@ static void tasdevice_parse_dt(struct tasdevice_priv *tas_priv)
 		tas_priv->tasdevice[i].dev_addr = dev_addrs[i];
 
 	tas_priv->reset = devm_gpiod_get_optional(&client->dev,
-			"reset-gpios", GPIOD_OUT_HIGH);
+			"reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(tas_priv->reset))
 		dev_err(tas_priv->dev, "%s Can't get reset GPIO\n",
 			__func__);

-- 
2.45.2

