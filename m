Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A99F2DA763
	for <linux-sound@vger.kernel.org>; Wed, 12 Nov 2025 08:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762934789; cv=none; b=iBN0609REuaZ+8lzQjeMX0B/vVtZGgrQTIC/qTbcWdVP1Fj08V9y65RXm2EI1IHr/dWFUR6HgUJ9eqgk8r4tvye5yywyS7eqPtmskoVbXOG0CGdQSrREeODahUWQuHz/g4upaVm9GF+wCekeZnSTv7sgAD2bIR9y8Ybth5PCZ7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762934789; c=relaxed/simple;
	bh=CsuCzn99HhVaXWmVpBege6OrJ/pMPiZ2yYvkZ7pOFR0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BBHj50i+NrX9kcB/Ut3V0PXUCIP+6cd7T7BXqAIM6V/0NP/08Bp9xlLFaa3BaDG/Mk3sTG4kIUqPJ46tZ9v2yCGwRv2ixdtXaHgdXNQujmS2NFfLqw8iQBaBRdhas6/YBRGVJciDTXOL+EAik7lOiOp0eZQO4zqnIavsYkvSjGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xDKk4dHE; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xDKk4dHE"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5942bac322dso513677e87.0
        for <linux-sound@vger.kernel.org>; Wed, 12 Nov 2025 00:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762934786; x=1763539586; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CsuCzn99HhVaXWmVpBege6OrJ/pMPiZ2yYvkZ7pOFR0=;
        b=xDKk4dHEe1YiZnUKxUz2ru/zaNKC8evp/f/YqNWi7rusRi1mfcv0LRunxxJoUfOmpI
         rGFuvyz8x20C+U02FpQHSPX0RxxbyuJWUuupKuuWy/F6OFsUY1qjQwOrMvXUGnp68Fan
         gMaOxY8N4kj+bRxxkTnQCRC6p8emi3Lgsf1lV0Rox1BBIIbr+5TOEjImrQbqwPyn7/4f
         15JYsZyhdDMBe1JGNhwgHHmwqgbfvKkN5PKoVMNku1MpoA6c51ITcA9JtRR1Ua7xTvoB
         ougtYVY2+tdxRtMfUZ+9MgunsHx3PFYBV/4MByM4hxmcRRQWKjbuSbW2gCe5QkXthoe2
         19Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762934786; x=1763539586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CsuCzn99HhVaXWmVpBege6OrJ/pMPiZ2yYvkZ7pOFR0=;
        b=AO7pzh4solEKwJE4X5G6icqsYr5e3RKeTSLGSEzWyZetRIdDh/11FI8myZTKK2+Dfq
         cthvKZmI/azlRxDqjqUaKn26XxUIcFpJ6eTLZPLFCPpfYbMd/upn0RIr+h8hlF2ZEs9o
         1Hi8URUjR0/X3gNQkyPIk/eGw2/hdpEU8NwQKzSZ1EsjnBJaVMDgE7cuPTcdbDxY23Ga
         Kg+UqQAFuc/i8BQRQuq+qrYjBYiOHdqWTlq/lYFuh2QBBRUMw8s7DYm2VVEWW8nIQjeZ
         kEHXTfn2CSx5qX9umGeFvBNtzlrjlA23BUDmzb+klc//djdC3R7o3H2zdJKBrJvnFPje
         3hkA==
X-Forwarded-Encrypted: i=1; AJvYcCVSmPu88MJynRcXSxNhJmXazcZ7b0izBTzfbOZ811MiPBPSD1Q5UxCEQ9fdHUUA/Ugv1FQ2/MBXL+IaJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDMYcU56080CxcFCIopUdEQe3uApkOr/EnEiKhSYbPHAgSajPW
	p6KivyQM05ZpxcKP20vGPCsgQnMEC7YsITKwEzSVN1y9aIccLkEqknSWPu7JOfa1SNTu/Ycly+m
	ERBfpyABbrYCb2PvcZ9PVCMys6SsbafWqxNdN0ttDkg==
X-Gm-Gg: ASbGnctTbJyz45YNFLlePWkAjvQ5zR/WETjF4KGd1HaFQcCsgk0od6CDUbUms774jaZ
	nv1IAV3Brr0cZfLZ4m3ctR1XFNn6eQSN9w7QZmMNIK++qHUHG/BzP4OmNZwwJxrJnlT+ES/2kU6
	hpm26nFcUyBkO3/FFMYnvLps1pGZtL0O88k4WCsFDSVJEp9fOyATDK7cfwsHxdOgYZXHKGdE9l+
	Kn7s5DXXpDrN4w61dQB44TRlp8qKHLKzPcULRD2A0murjNdFpjp7cYsBDUeZngPAgeytmvonvdd
	4P2eP+2R7U8vX0s=
X-Google-Smtp-Source: AGHT+IFGOvlOzvk9piywId0UEm/LoEe92kaATxaPyyaUwvvWEVZS+cjBT7dXjw6jb/DtZt422ITz+COnEZi1kuHwxHY=
X-Received: by 2002:a05:6512:3e1a:b0:594:3039:2d16 with SMTP id
 2adb3069b0e04-59576e2ca55mr736184e87.32.1762934785669; Wed, 12 Nov 2025
 00:06:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
 <20251022-gpio-shared-v2-6-d34aa1fbdf06@linaro.org> <CACRpkdbqLyeaZx37yrKjDFWb=C5c=vK6aPgnW8cMQvwi_6Jiug@mail.gmail.com>
In-Reply-To: <CACRpkdbqLyeaZx37yrKjDFWb=C5c=vK6aPgnW8cMQvwi_6Jiug@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 12 Nov 2025 09:06:13 +0100
X-Gm-Features: AWmQ_bnmO8YFH80sSD6rPVFUgANGxGc1BYRZ0qoygt-PZMj9Pyi0gMYkuFaH7pA
Message-ID: <CAMRc=McySdUtj4foEf5a2db8jUEa=CnPmVVms2nwHoO2UYChSg@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] gpio: provide gpiod_is_shared()
To: Linus Walleij <linus.walleij@linaro.org>
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

On Tue, Nov 11, 2025 at 11:44=E2=80=AFAM Linus Walleij <linus.walleij@linar=
o.org> wrote:
>
> On Wed, Oct 22, 2025 at 3:11=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
>
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Provide an interface allowing consumers to check if a GPIO descriptor
> > represents a GPIO that can potentially be shared by multiple consumers
> > at the same time. This is exposed to allow subsystems that already
> > work around the limitations of the current non-exclusive GPIO handling
> > in some ways, to gradually convert to relying on the new shared GPIO
> > feature of GPIOLIB.
> >
> > Extend the gpiolib-shared module to mark the GPIO shared proxy
> > descriptors with a flag checked by the new interface.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>

I think you wanted to leave this under v3?

Bart
