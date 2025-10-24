Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4330B221FCF
	for <linux-sound@vger.kernel.org>; Fri, 24 Oct 2025 07:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761289411; cv=none; b=oOvy7nRo0w/CJgHh8DzsnAoq7yShyR+ZaNjjO6jKsFWKGsUo/5He4AR3CnvJZznhCAPtYsDcU0UFmYvj5KSi8PcvlVrsj2d1cAQ0e68HFDCilrNjqTdVF1AlbHImZlcF2y+4LftVLvJf/P6PIoRE47C7T4mEDFKygXxhs4kUzPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761289411; c=relaxed/simple;
	bh=jwKwKoQ1je32EjVd1IL0UvZ2d8JBijczHCb0ou5rPAg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FmncAB79+ozlooCQ/s+I1dRaNZyRHs62utB/hxuGqy4H4Cb+aKzxXbU3Wei/8/1h62ihJrLjjOnMM3jrDiJ4Q7mr+vrtl5Lt69sHk/YXyuuYb2h+USTOal3BG+2hLJGUjt1iNGH2FkXfukq6zJLJIEXsiJ9Jq855RA21QWvr4nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ghKtyQUw; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ghKtyQUw"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-591eb980286so1793776e87.2
        for <linux-sound@vger.kernel.org>; Fri, 24 Oct 2025 00:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761289407; x=1761894207; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jOlB0kPMPcikcykh5NXoFKFdbJH0a3Am29BYJ5NIg8A=;
        b=ghKtyQUw2YwzgTn4jwV0MMygeaEH07ARTCZQj7LVrdzklXZFeg5e9a2JesQQ482857
         pZ22jdPOqW5UJHxsyRX+kLLX/8AISxBwxKl/S7d7PD27ufB8YnBMLG46AXPRDLlOVURm
         6cEK6M2D/ZybW7pbGQVGn4UBQ43gWg8aqZDHkRMQa4BGCUcpyO/7wKWojW4CFLlClbtp
         ATiBS8tdQRwc6W7uooz9oYcQsoshDGh5HgfcTjrkWYHwsNAbrKiri6p3NlrxhwqDbfw1
         ux6eK0dkKLOtyjnjuL4HNTsi9nVcq14I3waUo+JadWzCqJEUQ9/GpC8rP4/TFrFM08w+
         LHqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761289407; x=1761894207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jOlB0kPMPcikcykh5NXoFKFdbJH0a3Am29BYJ5NIg8A=;
        b=TN2nSPb+52V/biW++XbwK/rFIr0ut/lx9NyNg1itzXZAzKg3QcL+Obdfok9C4SySyD
         doTwWbFuigm50+JmgiSGFA+dF8RtQbUhnqeOXRq4du6eeum3Txugw0G8HX72zop9g4Rf
         LHbs9kfKx0kQ/mqm6KaScY8u/uHBNUOw1krBmBE1siyxeIpDLPPJ4Tv+XIdZbgpECX5i
         0zVt99ORmoHpsU1rnQWBqLDPxs/H/kla0CAo3W6NFK5OPxmcwI8UqBJBOh2Wjg99+wGH
         l069O+xaXzN8YiZnM6YPQm3ZFUzXhZfch4jDysPjESbkOrAY//N+hGiPd0kEsiEke8v/
         QlUg==
X-Forwarded-Encrypted: i=1; AJvYcCW/21tRvAZsFNQJvGLqQYtdxBEbZYsG1OgUxfX+NSR7fs69j1y9eg9aiIVlNTMu3s971mbQE5UcwiPOXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLtFn0IdOTyEC5OYVwszH1REKFfmGws+/jes9cdrRSy3BoYzTL
	mAdR+XJ6564EUX6/W3xJpFgvBtQ3zfDcRq0ZXiVTEpvP60LRCoiLFX696YCRxPzJgZIF6XGxN3c
	8Y7hc0OjnoypioKRbx9J6GzF/7M2Rm5aCTVKrQoOlRw==
X-Gm-Gg: ASbGncvZjWbD00z998bgKB0pWR9CZ/aXBeliKlYc/pgy/s9SA56QphuJ7apWFQ//QlL
	bpoB97y7w/SyLaEVYcyrrt8Be/5eZlDlXtSw9Y8U/2y+/Ug1lO+YkXNkSniNh0rfJRzDK4JwtYz
	lixGoKXjFWn3k4yRNJHs4Tck+aNyYoPCSrACV5yNmfeRIgiHe7BKT8V3pl5K+1ZPxqQEkIuwQAd
	mB7cYagLOPJDpw4wr29jYBC4oeTtOW17Ip/kfbpxnCz3WL5VH4HaQRrTUa+DplvSxWF4m3ERAIb
	GFj1pmRDzDNF4ceRn74DEYjUMg==
X-Google-Smtp-Source: AGHT+IGot33eiQ+BcQWl6UG0zv+FNQnQnMAkHHpWuHdoQFvVpdE10kN9LM8Ma75zpPJb50O7ebN6pjI2myaknhddpuQ=
X-Received: by 2002:a05:6512:31c2:b0:591:c6c0:9afb with SMTP id
 2adb3069b0e04-591d8546211mr8882195e87.34.1761289407199; Fri, 24 Oct 2025
 00:03:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
 <20251022-gpio-shared-v2-4-d34aa1fbdf06@linaro.org> <aPkcpTWfTb0HOF51@smile.fi.intel.com>
In-Reply-To: <aPkcpTWfTb0HOF51@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 24 Oct 2025 09:03:15 +0200
X-Gm-Features: AS18NWBS-Jd3edts4iMIfdLC_kiOaNMJiYsAVBHOjeSjhFk4sOt2_3x0nM3hP4c
Message-ID: <CAMRc=MduywsSKrN08_4F2xEjZrdnV--_3LZNmxwRHH=_QtceHA@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] gpio: shared-proxy: implement the shared GPIO
 proxy driver
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
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

On Wed, Oct 22, 2025 at 8:04=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Wed, Oct 22, 2025 at 03:10:43PM +0200, Bartosz Golaszewski wrote:
> >
> > Add a virtual GPIO proxy driver which arbitrates access to a single
> > shared GPIO by multiple users. It works together with the core shared
> > GPIO support from GPIOLIB and functions by acquiring a reference to a
> > shared GPIO descriptor exposed by gpiolib-shared and making sure that
> > the state of the GPIO stays consistent.
> >
> > In general: if there's only one user at the moment: allow it to do
> > anything as if this was a normal GPIO (in essence: just propagate calls
> > to the underlying real hardware driver). If there are more users: don't
> > allow to change the direction set by the initial user, allow to change
> > configuration options but warn about possible conflicts and finally:
> > treat the output-high value as a reference counted, logical "GPIO
> > enabled" setting, meaning: the GPIO value is set to high when the first
> > user requests it to be high and back to low once the last user stops
> > "voting" for high.
>
> I have two Q:s about the design:
> 1) why can't the value be counted on the struct gpio_desc level?

No, I specifically tried to limit the impact on users not needing this
to a minimum.

> 2) can gpio-aggregator facilities be reused (to some extent)?

I don't see how but if you have a precise idea, let me know.

>
> ...
>
> > +#include <linux/auxiliary_bus.h>
> > +#include <linux/cleanup.h>
> > +#include <linux/device.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/gpio/driver.h>
> > +#include <linux/module.h>
>
> + types.h
>
> > +#include "gpiolib-shared.h"
>
> ...
>
> > +out:
> > +     if (shared_desc->highcnt)
> > +             dev_dbg(proxy->dev,
> > +                     "Voted for value '%s', effective value is 'high',=
 number of votes for 'high': %u\n",
> > +                     value ? "high" : "low", shared_desc->highcnt);
> > +     else
> > +             dev_dbg(proxy->dev, "Voted for value 'low', effective val=
ue is 'low'\n");
>
> You can unify and maybe save a few bytes here and there by doing somethin=
g like
> this:
>
>         const char *tmp; // name is a placeholder
>
>         tmp =3D str_high_low(shared_desc->highcnt);
>         dev_dbg(proxy->dev,
>                 "Voted for value '%s', effective value is '%s', number of=
 votes for '%s': %u\n",
>                 str_high_low(value), tmp, tmp, shared_desc->highcnt);
>

This doesn't make sense, we don't "vote for low". We only vote for
high. It's not: which option gets the most votes, it's: if there's at
least one vote for high, then we go high.

Bart
