Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048F9334690
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 10:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762857872; cv=none; b=D4mR2+pF+gcfpcQsOFtQzKdC5rpYqxjZ9MOk0pyRMBoBuUU0SQeE8Hh0ywkEDD3y08rXnwDyKNW7f5MeD01hnVvyTUjXsq7WoDHj8CCpk2Ncc9AlTYlbUPGVzhRwkRk0zLdvBY7M0HtK0j2N2mUocdin2iEVfntWjsGMKdoBvFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762857872; c=relaxed/simple;
	bh=9cdWyWvVx1HiMmqJtLkBOepfaD6aK6+e9z5z1DN0zTM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VHKHBdFC38g2Hq/xYHC8ARENxdLQ4yUMBSG7eTGmg9/I2wI1pYfdSIJt8iDvnvRbe38UdiVIez22E0+XoUNeyDjrxyvP0BalhQEa2RpIz9jz4Nu+75s+6c6GbGZfI0Ingt49rXlyvEEalRel1rfFzeRQe4BSrP+yb3Gz1YJJJxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kZfXwY8j; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kZfXwY8j"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-63fc8c337f2so3172102d50.0
        for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 02:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762857870; x=1763462670; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9cdWyWvVx1HiMmqJtLkBOepfaD6aK6+e9z5z1DN0zTM=;
        b=kZfXwY8jA2RfIv/beanYlCuNRNHEDnYc6FC7/viUrwd3DhBhSMKXVNQ+LBx54BwxQb
         6bRRD7eO7duzXc/3Vk/cdQsVQ3Je9WCIBmTCXNLDXuCe58WxeNkjWVmYseOlz4Iyvcpy
         2CxO2Tdzj6VYV3p3Zo7KPqusjhQWgDJ7TK4NN8KORD4ZzyMagDHoqPnUWP12U7HEliik
         95BYqbIytmiLh93FTrSVi2AYEMFG76DXmIHRS15zq0lq1ySaJQoNNf7ti93YIdZMKyIZ
         jttvw8xqbhoNduIsu2RPnUnh5Z3ZGTRyXcb+M7uxQZZOpTvbE0H35OiLvsfmz46LUpl8
         yfAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762857870; x=1763462670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9cdWyWvVx1HiMmqJtLkBOepfaD6aK6+e9z5z1DN0zTM=;
        b=YsM0KPxJjTJ92c9aDomWtVoElDWQf8ba2fKzPuQuZHEu1vaNK0FPnsvoCPSux+7zhs
         NBDHXCL+9s+e5zTcmJFKMOB7ZNpAQKZ6pUVgGE4tGEuuBBAXxY5kEVhTX6mzw/1O/EBv
         DfthjJ4tfED8QPNBGIIZPujAkGI+USsPKhmoNxzXx78EjAjxiPqV6EtmPyCG1OpVHsbo
         hZsKnRRjo6psb5mLi9FYU7vckM777Z5x1XGHO7HhemTP3LJmm98AxvY/U+bpLzGL6GsJ
         YydWViVe+TrD4p/KfZVQ2ZXGr2+914hWPXY3oWB/xId9Y2pc6Mq1mhUM/Vb/KNsQChLr
         oEoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKFIm0GBvRcPvQg/sMFvc1lgu11RYYwR8e+uGEP0LUxUMnnt2eUArPp20/fHoBkq275Rm0PCLk7EIC4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjbOLXqo/pGuYZJD7mqUgGJOFPNRN6rhcPFg1MPiK9P3qZx3yJ
	ZD5luNuNWk/qQ0XtydWlZfMLyZCMSzIDOOLOnz6lWT72VNOipCFn+FXoPOdxPDj7Q75FlCUINzh
	vVybcGZllBo8yyI0LwCLIzjZeDUBh9y0ZSoqYgg2Pag==
X-Gm-Gg: ASbGnctsz1NyxSfBTGOlVPMDvMgFJWbgUkU1Y35hHwnebAxi1Kqp8gP3Cc/IgRcruDg
	Fb+1xKucucSVaLc/m/4uw4ubeqOH3hLkNtB52rfEdcKh4WjQaOQX162L76gJ8rL8PSjkk2P0Aa2
	00fAyH5k8aBMeDoF4qldAYapo1utOHJ2nr4rK1nVbjxpm36dhdeCDH9FzQ8q2k6rwpgjj1E9fyA
	wADP+H3UiCFmMRTk1Ea0s/mFS50aU17gLOWw/I2oP2USVefdY/MMQXBWvfE
X-Google-Smtp-Source: AGHT+IGM3E/e9Scx4gWocd3epZsySeg+GiSnUa6Lqk3ZWYP/cx+DuGwZohc+rkcKQ1+QYm8c7Jg9lh/z3+tSIbO/Q/8=
X-Received: by 2002:a05:690c:a719:b0:781:32c:b359 with SMTP id
 00721157ae682-787d541c211mr161593377b3.36.1762857869718; Tue, 11 Nov 2025
 02:44:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org> <20251022-gpio-shared-v2-6-d34aa1fbdf06@linaro.org>
In-Reply-To: <20251022-gpio-shared-v2-6-d34aa1fbdf06@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 11 Nov 2025 11:44:06 +0100
X-Gm-Features: AWmQ_bkCgjjs_tm6yJMft7dkXQVENEnuhOT2qvpn5ldswgUFUo9RrRQtDQDlZKU
Message-ID: <CACRpkdbqLyeaZx37yrKjDFWb=C5c=vK6aPgnW8cMQvwi_6Jiug@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] gpio: provide gpiod_is_shared()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 3:11=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Provide an interface allowing consumers to check if a GPIO descriptor
> represents a GPIO that can potentially be shared by multiple consumers
> at the same time. This is exposed to allow subsystems that already
> work around the limitations of the current non-exclusive GPIO handling
> in some ways, to gradually convert to relying on the new shared GPIO
> feature of GPIOLIB.
>
> Extend the gpiolib-shared module to mark the GPIO shared proxy
> descriptors with a flag checked by the new interface.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
