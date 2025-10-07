Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03FC2DC77F
	for <linux-sound@vger.kernel.org>; Tue,  7 Oct 2025 12:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759840158; cv=none; b=OEWJ5IqiGYRHRRGgkZ4i8G/1vdCNmJOvLYuSQPKR+XBYkIUPiSDjIO4Cq0sFQYdK+krLLCk8LVTVjJdM0ljLg/k64ATn5bMIN1gopqNQCYnZS82kPEGtqizy+jMuJ6PeCnLo2bkW2sdg3EiVcL5VF+j+754fTXuEj+izejoDsGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759840158; c=relaxed/simple;
	bh=EnIFXZqKjMmu46oO94pEByawVJ8hwocGBr4EM7AEbYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C5MlY6JdzrAMUHUsCEIBw+6aLdd306/2+yI91UmZwDAzo91nZtntoVnSRo3TZAVqvfLlwmQqZjxcu2wU/x0LIFAGVCyVp36eVM3L3I5Nc0di2WNNvKQhRg+xN6sKNC3gOUwa0mtK0Cmsqz9HcAScraUh6gQ0IVqQQ/c3VmFMkfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LdleBcLE; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LdleBcLE"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-57933d3e498so8494840e87.3
        for <linux-sound@vger.kernel.org>; Tue, 07 Oct 2025 05:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759840154; x=1760444954; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EnIFXZqKjMmu46oO94pEByawVJ8hwocGBr4EM7AEbYM=;
        b=LdleBcLEXMPxkGZZ4IH7OHM1RCEfGKmTVWJ7BemZ0ohKWk3OZepLgJvzL2xrSFg4iW
         CH9OqqPR5znp1hzBs1NwrthbL8u9+PG0T5BZ3zcpfTsOtAYzDaU7qkEbOC1HKo1NPJ7d
         BuUkAPFGSIqB66oOCyrgods7ODqHz2NvVn2LTnCJU6Y+sdpB740semCvRU3NHwZcPnOM
         J7LqBsetSjjrQJB/xYTgdog+u9uwGlaEy3wS+YasHk3chLzB0brWBFz6xB4bgPMQiu50
         QGjKVnRLaFQIWA2hfnFCQ89dwUAJL41fACPNVmbBoEbTPq9oDn2VIh+wl/x1aGZWmHwk
         GwUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759840154; x=1760444954;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EnIFXZqKjMmu46oO94pEByawVJ8hwocGBr4EM7AEbYM=;
        b=WoeoFaZVeNTpeRFERTy6RYFex81/j7ZO7jVNNjmg+Twj0Nq3EddedKrUl1yp1sUst6
         cUzQn8uc7WSwC9jYFq30GRFMM6ajQoaw9m8px99BtuhDhk06pOa2ksjhNEwlUaB+kKPy
         9bcm0+MBk4xUfgTWqlSITWApzmWK0JadI2bcsEX7Fnrj+wwEnQ4J+8E1baJgIIc+CzSr
         GCqtIvoS5uQKEwXLlKeC19o+ZiBQkedurKSHt1GidfCf/goRe8H+CQhjxikaJrRXWdU7
         9+RJFzIbMy1z1IrMoMU2ohJahOqpQ3bCU7Y9kANTmlGPOlY8N0BL05KFTamOKcWD+HNA
         c2LA==
X-Forwarded-Encrypted: i=1; AJvYcCVASZ6pCwcoqXc6Aa6J7+r3hTlyTFK46qWvMJ8TxAiXEbM3PCkM2kVddRbE4AXOCWwh7XU0GbudoSA34w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRiF/WTV6uVKajfKo081wTZYnr7cdL8GGILEBI2frDUt0JBEKS
	6Chu6B+TcwZpGbZVzrlAHQ0na/Od33HzPYYjh5bzCsu/tA7Y30DxadrRTRcWTCbKpKryhkz7oB7
	ED30lV0VH6dgAmrW7CUE7Xk71PZHp7ynlILia2elFuw==
X-Gm-Gg: ASbGnctQyDjW5qsCpAK6QrEWXE6MGC11nsA38Qk/SjaJjgXtdq+mujTNv96WrEgtYZg
	mmRP/N3GOeINCQiUGUjsiAB2RuMt8XNp3rbclXrLPHQjlUfSWMFQfKsgp60XAIAgTyrKF46kYjE
	eFdVvpL1GqIOb1XDOUMa2jk05GhZ6PCUum/sMQotGPWqON1kcBTSK/A8gujH2kWr0DdewAaOaE/
	jw6/r3YAcaqtqYQljkWaTpwj7wROgbXGvLmfSzjFBE+Qjiz1u2X1+86riSuqFQ=
X-Google-Smtp-Source: AGHT+IFvEXq4IGvOkBEwLnkFzMNYQoqXWta+MRuNZ6zy5QIvEZlr/9df2gaJ9h0Z2yhh4+vKPvuKBvTOlCdfwhpYHf8=
X-Received: by 2002:a05:6512:3e2a:b0:55f:6fb4:e084 with SMTP id
 2adb3069b0e04-58cbc776474mr4804386e87.50.1759840153971; Tue, 07 Oct 2025
 05:29:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
 <hyzzrjn7jzo3tt3oyg7azijouawe3zopfjzq6zfhoo6e6z2m4t@ssl5vl4g557e>
 <zk4ea5cibrkp4vttuy4evrqybf76b3nop5lnyck4ws4nyf2yc4@ghj2eyswsoow>
 <CAMRc=MdWmO4wvX6zpzN0-LZF1pF5Y2=sS8fBwr=CKMGWHg+shA@mail.gmail.com> <rfr5cou6jr7wmtxixfgjxhnda6yywlsxsei7md7ne3qge7r3gk@xv6n5pvcjzrm>
In-Reply-To: <rfr5cou6jr7wmtxixfgjxhnda6yywlsxsei7md7ne3qge7r3gk@xv6n5pvcjzrm>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 7 Oct 2025 14:29:01 +0200
X-Gm-Features: AS18NWAtiT9xc4AHDK2XxNjFXsHbeG0TTtUUuLHamMaXYLyXs_iBH5F444RGyw8
Message-ID: <CAMRc=Me9Td5G9qZV8A98XkGROKw1D2UeQHpFzt8uApF8995MZw@mail.gmail.com>
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <kees@kernel.org>, 
	Mika Westerberg <westeri@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
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

On Tue, Oct 7, 2025 at 12:09=E2=80=AFAM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
>
> > >
> > > Not always... For something like shared reset line, consumers request=
 the line
> > > as GPIO and expect gpiolib to do resource manangement.
> > >
> >
> > They could use the reset API and it would implicitly create a virtual
> > device that requests the reset GPIO and controls its enable count.
> > Except that some devices also do a specific reset sequence with delays
> > etc. That would require some additional logic in reset-gpio.
> >
>
> I was referring to the PCIe PERST# line, for which the 'reset-gpios' prop=
erty
> already exist in the schema. Now, you want me to model this simple GPIO a=
s a
> fake reset controller and use it the PCIe Bridge nodes through 'resets'
> property?
>

No, not at all. It's just that a shared `reset-gpios` property is
pretty common and Krzysztof implemented the reset-gpio driver[1] to
address it. Drivers that request a reset control via the OF interface
will notice that there's no `resets` property but if there's a
`reset-gpios`, the reset core will create a virtual device binding to
the reset-gpio driver which requests the GPIO in question (once!) and
registers with the reset subsystem providing shared reset control to
users. Basically the abstraction Srini mentioned minus any reset
sequence.

That only happens if the driver uses the reset API. If you go with the
GPIOLIB then none of this matters. I definitely don't want to change
the existing DT sources either but I want to find out if the code in
this series is suitable (with some modifications) for supporting the
PERST# line or if the logic behind it is more complex and possibly
requires separate, more fine-grained handling.

Bartosz

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/reset/reset-gpio.c
