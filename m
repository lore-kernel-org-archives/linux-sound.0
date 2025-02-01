Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6031C3C1D
	for <linux-sound@vger.kernel.org>; Sat,  1 Feb 2025 16:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738426943; cv=none; b=ppun3mAe3MHY3ns3zer/A9SoLSE5ZFzJRU5AFstEIOTrUlfuJ+tq0sDksYSEXH/ajl9xollve9NL718HM9t49RBo8W0S+LadPNYSiJjMJaU2OVqxPo0RdQfBHGHO6mXQWIZ+HMuvINtWfT80LZ/8u+1cRTBBAG89nw5TYs3kVjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738426943; c=relaxed/simple;
	bh=gc2yB9uwC+CfjzlaXN3vOgLBSMdhCziTLFTpp/igtbI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AsrmW4M1Wi+sBmln5myp0DwHumREAmcQhwRYRiO22/QTyoC/EdrystHXKUI/HZg9bPqVYj7gCQIUnx/RjpLmB4FgTW6nxLdwqzKByZpwIJRbQd8Ww0+DyQUHPjnfAL6ATFtrFjAQgKZ71jsD0nED5gR4VuyS24GoDs1S9FOKaF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=k4gk33Oj; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="k4gk33Oj"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30229d5b229so30808631fa.0
        for <linux-sound@vger.kernel.org>; Sat, 01 Feb 2025 08:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738426940; x=1739031740; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gc2yB9uwC+CfjzlaXN3vOgLBSMdhCziTLFTpp/igtbI=;
        b=k4gk33OjrqZyZ8vAYmHFC6SVUZiZQtw7U/YUtZ4FvXExY4btcCxRNryyrCPvrcImcM
         BHNCZMu4UDoo3CByDYH6ItDBUJB05WadJ+Xb9rKpYOD5HUQwLOzpigmQPjk8SpGqe6hd
         8Gv6ou3vWTgqU8TJzgKNS/71JZk6vOgM1h2KEwCgWRc/qHMzMafQwOnBGS+bhjSOkSiY
         oG9BbUOwNPPALUvi5Mf1S5xLjxJplPK5U/QBOu+TyAlA4HtMJloqZ8I5kcdc+syux9/O
         O/FY2K/YloMAggAv3CyC3tHmb7XLxT75vc79S8wzDAcyKUlA405fJaa4LvO2QvU8qOsD
         6qUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738426940; x=1739031740;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gc2yB9uwC+CfjzlaXN3vOgLBSMdhCziTLFTpp/igtbI=;
        b=MKv0Ck02TeQBRJrjIU2FSyV+ZaMEW6uh3HJ+0AQeqHuiTYcd/SUdj81Ep3PXMVC03s
         zblbF0PZ0cuP5UpT52/RzbmPeGxhATDRjNfhEI5OCGpU1dAN7Gn0Mo+lWYfzaavMDsqr
         wVhYJjcbdb82IJtjO/nI6kLaSVovs36+O5SL7hdbxRzu121TjUG4Njzyv36txtBGiewg
         IiXIWOAqLODJST/cvZYLUrDQIg9qmaBChYYDsqIjcG3SiuAZdc961vFXDWnfJ/XJ0ZJJ
         qhHaIzJht2GPa69Ng+eaM4MS4mSv//ykQqKEYTE5yBen9uPBDEkRb2Z1oNvxniOtaBEl
         b0+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWEWwuw/E68kvv5cg07Zp3LF2sKpUP3JbPoB2zOjaXv5dnh7w18inrJc0S5UmR84+YROLEb+1W5bZu8wg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxLYZ+jjYxHf4q8DmI5nVGXHaWaLJfcPFEsASJzJUL+yfaDVEa
	Kof5kjaqKEIvf6zPJ5ZdLgDjalyJQoY0f0prAjQ0bKiioXopRNs1peUlM898vA31Ps59HMITDyy
	G9aCxu+MyabgVuRYPrn8wZ4N1mTbM3qeGsnhMLg==
X-Gm-Gg: ASbGncuLIWfJX0ARlCYC3I1zR6JVhaK8PaqaPj4J08UF3kKOXP3iTR/K96kZJRe5nuu
	t+AiZ4uVs+XTjnkYDex+C/B3lA95DsAe4PTvykmaXcjeIMAijMVQ5DTlQCfSqZd9JxQKlcoSP
X-Google-Smtp-Source: AGHT+IEMrH29lOkWTlWC69aY0dD2xb+wCJlnehQsFFcBgOS7bovj0ZbCV4vzNowRaHEyenGDcRs81QzQOyPr/8xF7gY=
X-Received: by 2002:a05:6512:12c7:b0:53e:239b:6097 with SMTP id
 2adb3069b0e04-543e4c3fd4cmr5485244e87.50.1738426939852; Sat, 01 Feb 2025
 08:22:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250131-gpio-set-array-helper-v1-0-991c8ccb4d6e@baylibre.com>
 <CAMRc=MdwQL8dWU5zF5fp+KUbC2RA2Q264by8HGXMg2k1rxhsTA@mail.gmail.com>
 <9931433b-5cde-4819-ac96-eea4f1f0f1f2@baylibre.com> <CAMRc=McEdcDs01BAKN5vg9POg_xxJBY1k8bfgiDN60C1-e_jow@mail.gmail.com>
 <072be5a9-e0fb-4073-85b3-4a8efcafae09@baylibre.com>
In-Reply-To: <072be5a9-e0fb-4073-85b3-4a8efcafae09@baylibre.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sat, 1 Feb 2025 17:22:08 +0100
X-Gm-Features: AWEUYZndtirbEg_aYtJ6wt5WMFYJObSWPO3NsWCnNmAFKxLlbxMM9F8rxlAsWp4
Message-ID: <CAMRc=Meq_Gfhcjzx0vCL0JPzfnOcijFgB6AuqtsqgGn1eOTMVg@mail.gmail.com>
Subject: Re: [PATCH 00/13] gpiolib: add gpiods_set_array_value_cansleep
To: David Lechner <dlechner@baylibre.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-mmc@vger.kernel.org, netdev@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-sound@vger.kernel.org, 
	Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Peter Rosin <peda@axentia.se>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 1, 2025 at 5:17=E2=80=AFPM David Lechner <dlechner@baylibre.com=
> wrote:
>
> On 2/1/25 10:14 AM, Bartosz Golaszewski wrote:
> > On Sat, Feb 1, 2025 at 5:09=E2=80=AFPM David Lechner <dlechner@baylibre=
.com> wrote:
> >>
> >> On 2/1/25 4:36 AM, Bartosz Golaszewski wrote:
> >>>
> >>> This looks good to me except for one thing: the function prefix. I wo=
uld
> >>> really appreciate it if we could stay within the existing gpiod_ name=
space and
> >>> not add a new one in the form of gpiods_.
> >>>
> >>> Maybe: gpiod_multiple_set_ or gpiod_collected_set...?
> >>>
> >>> Bartosz
> >>
> >> I was waiting for someone to complain about the naming. ;-)
> >>
> >> I was going for as short as possible, but OK, the most obvious prefix =
to me
> >> would be `gpio_descs_...` (to match the first parameter). Any objectio=
ns to
> >> that?
> >>
> >
> > Yes, objection! As far as any exported interfaces go: in my book
> > "gpio_" is the prefix for legacy symbols we want to go away and
> > "gpiod_" is the prefix for current, descriptor-based API. Anything
> > else is a no-go. I prefer a longer name that starts with gpiod_ over
> > anything that's shorter but doesn't.
> >
> > Bartosz
>
> Oops, that was a typo. I meant to write gpiod_descs_.

Eh... the D in gpioD already stands for "GPIO Descriptor" but if
there's no better option in your opinion than I guess I can live with
that.

Bart
