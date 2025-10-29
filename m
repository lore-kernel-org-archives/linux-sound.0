Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57ED7330304
	for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 11:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761736876; cv=none; b=Tn4UCcHv3mfvfCI3DW4rgUxYM9lbk/4DDbt8aIQmGsY6CTkzS812nLLpYyCN1I7ONp5fBCYk7+HkLkWxFbxUXdAnMLdx4kt9qRFRQ9ec+oHisLsFyjcshRbh3HSzDaS+GiIoiI1x7zgF7r+SJ3G0XgFfoFIZwGGEzYapzsWxkv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761736876; c=relaxed/simple;
	bh=wXk+3crOirlJJ3BTqf/pNqQ/QmJIbx5e9hwDeEFKhJg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RlNFwNOTF6fs/wpAqujJ/9OTWAM2W5kiFiA9GihhGdTxRdtrZ8QsmbaAej2SPGJwoxr8T6ln4emsmZi4B+m4Oqc1SVM7TtOtSZu/DcPtUm+h8L4wSfYk+fQ5bbRG9F4mM+jR6wUHzyIBpWXePS9ViHqdiJiG/hbl8XDf6dPZslc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=1ffMZes1; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="1ffMZes1"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-426f1574a14so4725600f8f.3
        for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 04:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761736872; x=1762341672; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ITkYH5qq6p2spjReXhvHRadCK4LlO30xMaO7HYP/79Y=;
        b=1ffMZes1mOU8fjR5o7wC+L01273unHdM0Mb+cyZsJ+3wUzEx+Ft3MEEL56PJxDOode
         /HuB0SR9xAgTzY5pJjKat0O+eT22V5ccFiXfhUqNLPCtE+dB2Gld/P102X3cMmGaTmVl
         y42s/dO1xeBhzqQ4PE3jS4rvuuVDMwwJy+R3esjwLF6maZ2pwXRfE2ZGBq9ET0kleItX
         28zh84HnXqYfv2N3oVQCo3FnrsH0MxNGd3kygdPOV2ylBKRfqsfBlG7erlq09KaEJsBF
         TG9YkhnZaPiwC7FYeMI3F5Dq0TVwqdPmrITyK8wzWZGkOyXgX7rcsX1sERKwsCAC4PJs
         g0Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761736872; x=1762341672;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ITkYH5qq6p2spjReXhvHRadCK4LlO30xMaO7HYP/79Y=;
        b=JgvoI+q2cbsR4HQ148iTm62gxCsSQ7n7Xn7OLnLQmlDwWHNxwoBuUURPWMWFmeyrz/
         f+0CM6xk5v2Wnka3+VxuN/vPtzsgW1388WPxZVOoG+hqnhAoN1BJ20R9oF5MdskjwJ6U
         Hz//BAK1TgfjURnqP0xWK3yACGmhugrd/P5AOh0/DWgTFOlYAPsBahYq4/N6tY1F6wB7
         z2A4MkQm3ywjb+wRggxtTTGgu6C5DC71JeFh3v0H7Lr8aIvTYdnhYlFlpr09X6RQT4Zq
         G8eQ+2zO4L++YWnpdxs+kGHNETYnFLFcddgjkXNTfZVJhqiujPvn6WoHZIPmccRxWfbK
         Tqew==
X-Forwarded-Encrypted: i=1; AJvYcCW5Ns+0p2iq47b28gNTkMFULwjOGy6PHZmLLwhdwCKu7H5/Ip67fU/BB4eZpjadiCTHaXK2SrRtNf8eEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQB9AGCbhkpVSpbD8KbmZ6PorYTcLdl48foRhrUutSOzTfp8vQ
	7wXxL9PRizoK1YQtYDLjVR+KxMytDyVIA2C5alm6vaeHJh3E6xwT+3e3LYxHIIHNwUQ=
X-Gm-Gg: ASbGncudW6fYslTDWU1xQERe8qhCoortS3vs+E6PUducsvMk8g9pmOS6nFrpImttxr3
	+r4a+gOw+fv+un5Re2oXWCRJ4izvjutl4+Ctf/q+ZFXbjHt58pfiIh8o133US2xoCtphHidv7Df
	gX+j6Fy5aAVxoOiXLEO1A1ijRSKAqLiNp4EfLD+ordFPpnUOQrfJVg0SwIdLttN9CZvjYdTK2oB
	2LI2k9cSDOOW1vGFca3mtDd6+cJ2hMBnQypsiCdkH5R15vKha7b80l1w0Wab60OcJRJc6cOXATT
	KOZxZUDOjfSJdOnwVyEWlutSYbbdSQ+jX30zbCk4+kc+9Fweos1SRBtKTXr6lqjMw66YpBonaDU
	rOqk2Zo8TSAFa8kXGOVCbtsKAfv/b+YC71xFR/YGLRgjYaBNz1KIAgBtk72+eoakcqkt6lb+5qH
	LiFxEY
X-Google-Smtp-Source: AGHT+IENSqWLO/JMNJLWEfyUHP3Mjq4W26Iv0qEKH3r8OB2YkTy+FUkLuZiv4z7uvfVY/XuiHdrcmg==
X-Received: by 2002:a05:6000:4021:b0:427:60d:c505 with SMTP id ffacd0b85a97d-429aef78e49mr2088157f8f.15.1761736871599;
        Wed, 29 Oct 2025 04:21:11 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:69f2:5f2d:9ffc:a805])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952df682sm25657486f8f.43.2025.10.29.04.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 04:21:10 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 29 Oct 2025 12:20:44 +0100
Subject: [PATCH v3 08/10] ASoC: wsa881x: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE
 flag from GPIO lookup
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-gpio-shared-v3-8-71c568acf47c@linaro.org>
References: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org>
In-Reply-To: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org>
To: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Alexey Klimov <alexey.klimov@linaro.org>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1052;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=iK0ZywBEmfSVw6xPFQX6Oke9nUVZV1pPcQC7Xb1WLtQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpAfiXKnnAKknhcraojtkxn3HXQvIqfHbyL+bzN
 EXTvAFatICJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQH4lwAKCRARpy6gFHHX
 csiEEAC4y0Ps9nRfERWW+TIRHLw8qrds7gW3K+kxaWsNsBT38vOQRrALl8SNYm7GZ94LluEso9n
 SSL5AT5boIXTnkKpKhUsNmRhvoaLjsuUtlE1AA/iJvZ6//AC34+pn6a3lOlQZ/s8M5rvRUvNzCc
 /AUSqSkyyElorHQnZsVm23TiMb/h4chxqFQ1mzI1M2CaFDVugOHv3SZyOV5Yus7GI5c0uvt97Cy
 sWYE8PC4I3Io8+souZC+TdOkjA+DJuTjKURoijR4yUrYmiWAVyrz+0C9W9B7orM6U2G+o9DMJwi
 KQplI+8j/Hvq/9j7BdTbgEJmjhj6o3haaszRDVGGKcVhKQZT/hMfO5WOtpxcXUnGh0a9PXeCNvT
 ybgTvSQChRrkrZ/suBk7OAtLas9JNP/AV/ADIwkvT1Qg5YcFUQywjrBccQJaA9XrZ7dUQar+4NX
 plHV0zHPlCYaVSBIjTfUFKER/m41CuhFiKhU1CaIife+NIwemkfvoJNWoYcUDrMwT7Qx4H47jDL
 mUHV3+jE1kwsAHpCEE5EvjKnsgl43pw/R1IxgYaUrcDQxeyO3Bqy+8l0FvyCD9yINbpQNKIwPcc
 JtOZh2FqyA8AZW2dDandfZl9eVndB4tdKfVWQghb1jzvvn2MlVP5t04RU101IMPqdKH51lxIBFj
 yj8vFSO/EhCgneg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This driver is only used on Qualcomm platforms which now select
HAVE_SHARED_GPIOS so this flag can be dropped.

Reviewed-and-tested-by: Alexey Klimov <alexey.klimov@linaro.org> # RB3
Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 sound/soc/codecs/wsa881x.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
index e249de7f91d91f8c7f1e7020086cc65c71e64c5e..d7aca6567c2de1ec36e9f36aa82463bdbf3be27e 100644
--- a/sound/soc/codecs/wsa881x.c
+++ b/sound/soc/codecs/wsa881x.c
@@ -1112,8 +1112,7 @@ static int wsa881x_probe(struct sdw_slave *pdev,
 	if (!wsa881x)
 		return -ENOMEM;
 
-	wsa881x->sd_n = devm_gpiod_get_optional(dev, "powerdown",
-						GPIOD_FLAGS_BIT_NONEXCLUSIVE);
+	wsa881x->sd_n = devm_gpiod_get_optional(dev, "powerdown", 0);
 	if (IS_ERR(wsa881x->sd_n))
 		return dev_err_probe(dev, PTR_ERR(wsa881x->sd_n),
 				     "Shutdown Control GPIO not found\n");

-- 
2.48.1

