Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61DB1925BF
	for <linux-sound@vger.kernel.org>; Fri, 31 Jan 2025 22:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738363569; cv=none; b=gBvmIgyy55GvRRr6z8DJnixEGMGzyhKl+BqCMf7FTxaFw6vj/SWIwr1B4nw324O/SWFC+f9BRfiLRwShJDCiN+4fkUVnlNfcAlOmLHzNwTqbuVWxlX6gkMRMISG9LF0xbCIxJHExa6tW7czLSGeEm/dyJD1ON+l9371uCsvuaFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738363569; c=relaxed/simple;
	bh=fV9hhrVRP+qzrleYSIWXpKoYEuxlmibMFIbjPlpYr2A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PCR1Ax7pVOmumdL4y0MOB/+NfjoAbXzb830xPsw/rpUwWnitgjW0PIHp1NjVHtV0IIavJJ6L0tu/NLZQEa0p7XlHD02orFUo0aWkZ03gU/Yk8U4F/1pX6g04m+bWP11Qv3fprKus1J6sfKmbOvApTHcGFYptEP4XVL73PdCNTZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NZD5N+cS; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NZD5N+cS"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-307325f2436so25381561fa.0
        for <linux-sound@vger.kernel.org>; Fri, 31 Jan 2025 14:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738363565; x=1738968365; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fV9hhrVRP+qzrleYSIWXpKoYEuxlmibMFIbjPlpYr2A=;
        b=NZD5N+cSwgVpbp4uBKSqg9Ag0t7Oh4RA/lD0W3UwbFHWlduW2tIowWiv6HwJBhUViu
         xSuh4Kje+bigOiOnBVSWZDT9VJXlhLagMHAUEt3NEfB0hwA9nNvX8kSTyeMTKHxw9yfj
         2rGKONg+p1SpUW6udf14oHRIPfnrGXTD8eYwEzaZaiDCgXJZzTH743+hl0zqAVEXITbx
         R/56S+Sv2LB9ARZKAfSI+pU+Zz2QkHjOEGj1XrtamsQO7VLQbPmaZ27VBJFl/uBnoSWA
         u5IMRUwQcuazoVgnlNRV3UBcRy6Z1bB71Y+sxxmOty/Foo4vtnmr2VEsq5IGcAyjRxJ4
         hw8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738363565; x=1738968365;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fV9hhrVRP+qzrleYSIWXpKoYEuxlmibMFIbjPlpYr2A=;
        b=DjVt9PuyCaV5JyoIx5HC6umlmVi2ToC9mW/zTzTCFJRqBus0SAL3hBTET0WHsWCUiY
         u+pp8ECncidqgwsqTeoitXGNWaC5B/AV1SOrui0w6Qsevd86pWYG+aFISJUiA+rL/Gmu
         HpIZoGs8UcBJOvdxIEHG65MkNKlX9oysvhZSaalZ1+L7YoFVbEt5MGwAJ36Oar/zCSsS
         TesVo4+3Q9RwPlf+f4dF4j5Bzj/zS8JsDYQf9cxj+fZGWgCyBimH9e8Kym3CkHnvGPjq
         Efa1PqmMKuC+q85p71RHurSQtLvSCU3gxiTPmyVzi9B5Jiv+PdjRBdLvk1g+G8aQtDbO
         rHZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbattW5dMamsihXyD5UWsFor5/UeWyTrv3XKxne8rvTQCtT6Lza5rKW2EPzt66My8BhEMnj6PVkntUfA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8TNSAgTEE2Ha2Kb/ppHzyauWGJQwzGg2fFgEdirWMuo0WQmzd
	OjZpGp2a04LhAiHza1vB0cjcg2VplaFo5iXUZFGZZq8zDXxN9tCfjzW0Z6TP/6NtUGWbLpybwtu
	Sxiku+mnN/z20h+cMt+DYC2EBDHaxdB8BooPN5Q==
X-Gm-Gg: ASbGncv3jAxVIQ4gEj3GLGsROuwZg9vgl+Fn/qxv9HdYSz/Txv4svFBQV27KnIX12dC
	5ItRcKKStQpoXSbv+o9iTIxe/qsvt/ZBRiTI8+RrVX8zWhGCrRFU/HDMXJMFWuoE4vHD3gXo=
X-Google-Smtp-Source: AGHT+IHHYjxVhba4NRZORQamjtU7NeuHHIHelxxj9O/XIYBIqNCjtNKWK69c7J1JA7YkTDGQPCWMRncUBp/ITQdEaIo=
X-Received: by 2002:a05:651c:897:b0:300:1c9a:80ce with SMTP id
 38308e7fff4ca-307968e0098mr51916141fa.33.1738363564658; Fri, 31 Jan 2025
 14:46:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250131-gpio-set-array-helper-v1-0-991c8ccb4d6e@baylibre.com>
In-Reply-To: <20250131-gpio-set-array-helper-v1-0-991c8ccb4d6e@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 31 Jan 2025 23:45:53 +0100
X-Gm-Features: AWEUYZk_dyG4cveXgq-R2QdDjI5W5xxfEw1ByFh9vnHwzlCQYvkaIUdRlN711z4
Message-ID: <CACRpkdads3+XQqvZDJXmYHDLGfRK0H_S==72uqkuht2nEX1+rQ@mail.gmail.com>
Subject: Re: [PATCH 00/13] gpiolib: add gpiods_set_array_value_cansleep
To: David Lechner <dlechner@baylibre.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Peter Rosin <peda@axentia.se>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-mmc@vger.kernel.org, netdev@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

On Fri, Jan 31, 2025 at 9:24=E2=80=AFPM David Lechner <dlechner@baylibre.co=
m> wrote:

> This series was inspired by some minor annoyance I have experienced a
> few times in recent reviews.
>
> Calling gpiod_set_array_value_cansleep() can be quite verbose due to
> having so many parameters. In most cases, we already have a struct
> gpio_descs that contains the first 3 parameters so we end up with 3 (or
> often even 6) pointer indirections at each call site. Also, people have
> a tendency to want to hard-code the first argument instead of using
> struct gpio_descs.ndescs, often without checking that ndescs >=3D the
> hard-coded value.
>
> So I'm proposing that we add a gpiods_set_array_value_cansleep()
> function that is a wrapper around gpiod_set_array_value_cansleep()
> that has struct gpio_descs as the first parameter to make it a bit
> easier to read the code and avoid the hard-coding temptation.
>
> I've just done gpiods_set_array_value_cansleep() for now since there
> were over 10 callers of this one. There aren't as many callers of
> the get and atomic variants, but we can add those too if this seems
> like a useful thing to do.

I like it.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

for the series.

Yours,
Linus Walleij
