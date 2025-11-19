Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467A22FDC5D
	for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 16:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763570987; cv=none; b=h9Jeuttes6pI6T57PMiUMPnr1pVki1qpHYnoE+4MZyW4SCo1GdWP6ihCvOKNLDuyoFcc3qdT4wwK4lmwvErM+8vCHzL5tcT3mdcjxKj7oHP5ULwEKwQWrjXXk6fijnfyueZnC8AqVTc5QabQnl39m1/cGoKXwXAlDxduL1iIGAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763570987; c=relaxed/simple;
	bh=vS3GqcZz5/e1YIqg4Y6p2P5bhXNAXrlTE9+KdZfTBYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z/8QQvOeT6IDgJ98zXBW1LBXkIgGuvmcfi/RJeuByCyi4vW8vBiLXw//vd4s1HAVOIYOQ3E/4qJfBfL9f2VV0dP+x7RAjTMzew7iBO29kpXxoAO4dvke+YWIu+1VqF2ScxxVdPNJS5BUolKGcKjvuUbm42NZ4/8inwsQOj3nlrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=JhyqtWVp; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="JhyqtWVp"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-594285c6509so7345079e87.0
        for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 08:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763570983; x=1764175783; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xpyvLKh/Mmn1vrCVutB6f5Cfy4PhM6ahAnv3kAcqCw0=;
        b=JhyqtWVpX07L0WANl33eI2MP2gt/oATpSqk2/t09c6NF8gPHOxjjVkwBXhrV3HyJeW
         RDflWvH8YPbaQu9YYHAJcxVtl3iBmldLqogqMueKWNDx0OeC7oG/n1F71WoQ9X/X53F/
         k9QctUJ+LAnsOz9Ts1Hra7CPeTAortI5/eLswOD3dLJelSjfG5Q/xRwUfcusrvvI4oGN
         rIJ7O+5uoVka+x+3zksV8SAfGeS+tnJbvBkjhCxbEwh/tG5qwqB6m85o987ceY7IDbkS
         rUDgzz4XMcqm/6VbzK3vuk6XusbzbRP+I6sD/H/knsahFzTTURyPr3KUmGOiXBOk+dFf
         7aBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763570983; x=1764175783;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xpyvLKh/Mmn1vrCVutB6f5Cfy4PhM6ahAnv3kAcqCw0=;
        b=vqQjCGGdA60bUwctd1TUY1+IVnS+d6/0Tm7hkvRd7BeoOXaIZyITcIbjFEg2c1ibJN
         4nlaF71QwlRSFmLnMemiWYTLrF4TShncZEPl3a5l/BJ23FH//Xs/kqCuixA+rEBCZ1f3
         /JkZvskh2n3fR7Epk5RM7F1Luwfxf++R6XfeTPnJFzbdJP/dwPUJ8DO5Y6dzFd+Kzxqf
         9zbmcmqzCnc2HOaXA9cL1L+E77R3cMYVwG7hIfEU7AllSG5jenrQx+1cfk1Q9LqyCk4f
         BiNXpF10vw/wtov4ei8gBX7DEMYlJ0r5BVIcNLLpGCd2Cxx8e2BV+d6lZWnFhGRSIJxY
         TcRg==
X-Forwarded-Encrypted: i=1; AJvYcCWmB8EMlm8NGAmgn2pFXkF7g04r9b0uzvkYxgbJBx+vqKVtrvrN56KVJEqdpgci01xDHY7zDlifcLTDzg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXWZgvG3sPrF3NG04SJsW5kCOrHKKkyEKaVhM4A9JvjDn8oklf
	RaDEXrzed/q/lYA+yRzrVPjKpG6o4Ft38ZeqqViOaeCHgtmsRBe3TgjKBugvozfnZD5lB9OKw4S
	cvAZXCYNSKyNsvAi5MPUypVZHsT4rjGeIK2MQSyB7JA==
X-Gm-Gg: ASbGncsbBtSGCEOO1EbmvOwDUFPYZ8e0bfawD3YWTdva+55IMu1HH6lAtZDa8GYeA/K
	aDCx0/0dD1Hg4n4IN47+18JQkfceIZNuA1i3v4ZdTNljXt7tXNRY6C1576TOpBxMbj9H+m9Qylz
	a4SiOQ785GuubSrk+g8AUWJuWMuawipyeB+Er6b7SulkB/w3qDdYJQxoT2zJq4n7dsrB7MtQjFO
	YVgCwT9pGMHA+y4+ds+qemu31gK4lniEI9c8giJ7YU5k741MRuWwBIMEXThpa4VUdaKq5n142xK
	mwTA73MAuhW5n/mx0hF267FSYJA6HjvLzdop/g==
X-Google-Smtp-Source: AGHT+IFsTisXqLbVlfib8qoYQct2imtfeHS1nqYYs5EAkrXWjXIV/4PzaUvblCYoNs8nCi4yHoHai6jS2Y+Xg+cm4JI=
X-Received: by 2002:a05:6512:3b1e:b0:595:7854:af77 with SMTP id
 2adb3069b0e04-595841b5442mr7042616e87.22.1763570983255; Wed, 19 Nov 2025
 08:49:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251119-cs42l43-gpio-lookup-v1-0-029b1d9e1843@linaro.org> <20251119-cs42l43-gpio-lookup-v1-1-029b1d9e1843@linaro.org>
In-Reply-To: <20251119-cs42l43-gpio-lookup-v1-1-029b1d9e1843@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 19 Nov 2025 17:49:31 +0100
X-Gm-Features: AWmQ_bmjhxVSOKFkWMMGQNZ-qd7cGCoUpkpDr5ssCwk_lQAj7mY_DFCa0JUpk80
Message-ID: <CAMRc=MeD4gsyHe_rkGRgRO4p36+szobgCnc0C-CYGWZhm-dQNQ@mail.gmail.com>
Subject: Re: [PATCH RFT/RFC 1/2] gpiolib: support "undefined" GPIO machine lookup
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Maciej Strozek <mstrozek@opensource.cirrus.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Andy Shevchenko <andy@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-spi@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 4:21=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> SPI devices can specify a cs-gpios property to enumerate their chip
> selects. In device tree, a zero entry in this property can be used to
> specify that a particular chip select is using the SPI controllers
> native chip select, for example:
>
>     cs-gpios =3D <&gpio1 0 0>, <0>;
>
> Here, the second chip select is native. Allow users to pass
> ERR_PTR(-ENOENT) as the key field in struct gpiod_lookup, indicating a
> native chip select.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/gpio/gpiolib.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 91e0c384f34ae5c0ed61ccd3a978685d4f72e867..dbb5f7fe7b661979f559fcd32=
ad6e1c463431a18 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -4557,6 +4557,9 @@ static struct gpio_desc *gpiod_find(struct device *=
dev, const char *con_id,
>                 if (p->con_id && (!con_id || strcmp(p->con_id, con_id)))
>                         continue;
>
> +               if (p->key =3D=3D PTR_ERR(-ENOENT))

As the build bot pointed out - this should have been ERR_PTR(-ENOENT).

Bart

> +                       return ERR_PTR(-ENOENT);
> +
>                 if (p->chip_hwnum =3D=3D U16_MAX) {
>                         desc =3D gpio_name_to_desc(p->key);
>                         if (desc) {
>
> --
> 2.51.0
>
