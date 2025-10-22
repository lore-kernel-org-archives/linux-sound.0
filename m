Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AC327F4C7
	for <linux-sound@vger.kernel.org>; Wed, 22 Oct 2025 10:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761127313; cv=none; b=gmk83BEprYuq++EiDqJYhi+2N9YOPdegG0Kk08Sdlfj+tP7iRevHsfCdtS5eXWC4IiNGiokQAEU21/V6Y/85tMSB3wIWeN9CF0VddqHiYIOVih+q7UjmWYSz2ntPpruaWs2ETB1/Z1SA9DUMrSdeaiGVc/2F6CTBP2JxniJjwAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761127313; c=relaxed/simple;
	bh=n8auG5eKlZyr31ot6Kp1D+Gj8aLD/n7p+Qqeh5TWnJo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PpVsgSmYAyeyaC5KndBRNYY3PtJQTDbYzMbkups48XOkMglxymVpjMEAFvvxtmdks/75T5LMw+6Xds+C6zw2lTx7IDLJKwf+dgIKR9M4WNlKkQu7Ueur1jCgMhbZosQeCOei8lukDIdvVCapY4UaY+n0HkXZkTznBOJcSIQOTo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-554e726e5cfso2223875e0c.3
        for <linux-sound@vger.kernel.org>; Wed, 22 Oct 2025 03:01:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761127310; x=1761732110;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rEJ/AcXuMMrQoXRwb6HmCfF3LFX3cn+TJWCKJF/dV3w=;
        b=pPzIlrBpIhzRlThYuFiwTasfjcT9BAlKByr8I9J0MgHfmkbTMhyGBMGaj7ij7xTZS2
         sGoC1DuezAICz94CyK5LuUncXAH+SqYBIso7Fz4nZ3Frcd7vaCWMm6Y90ds4Pi4Iw34O
         7JTtRN/kPWnngjR+Zc74Vj2bPKFGAtEgbwt1K5JvnNlWr/1zG50zDJLOdzWXnSgJy+Q2
         KHpuUDq+u5H3tOa6BLEU8jsxCFX+A0z5iPfL94cxScmnCwFuihntPE9ppEYxjeWHmn1p
         mlkMZdqfQjMi/f17J+S8fA9sEAPkPZTLN/WPbeb8wgpwqTiCJJhKhfFLk1+2imzOJoro
         z4nQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7azz8kZNEPteyEJNLwXcqnWvWVKfrLtwNkJRKbL/3T3t2hZ47lHVD1+OW+xxMRSTm9cauf8eqra7Wfw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxI6Vdrx8ytUyUf53DZJRsMtVBrHv/EaOzkb/eUAhfR4FXZVZoB
	A534r1166qvGdeiggThChcgg5RIh8FNCcCHzbMohZm/r5aj0zzZZtCE/e+TjRIHz
X-Gm-Gg: ASbGnctInoivkyNpMbgdEtXhJ37q2WbCA+ITPkZ/m+VrIWYkUEkAl3xMq1YZTHEojok
	Wd3uIMroNsd5RZN6zH1yQir49ZYbMtdIy9HUKdmIYm6HKht+ygJ6wTM0htRUTcWnX7RUlS+3R+e
	G5TmojFGrT4MiSSqpI1TIfbmYnG0KvQ67MchK3hu3zxDMXFr9vlBp7Au1s/IyUVKRHAVJIl5fg0
	P+eX3GSoudrzFRg2jQ1cMXp2BvVJ0TGxuvaK86SVPRhg/DiRtE5ddvKwPQf7mTYA5H5vDrLY+bm
	Tg8anenQGWNyoV/l18OwDRCDXTioTgLguwqKPPnrg6xr6vz7Vu2ZS1KL54AejWRuxkk/qlFfEO7
	ONV6xD6FdC3eUmIaL8eAR0GZS0QOAFR1cYsbsuN2TjUeyYT5b2U+au8nvRK+qRo6KJ54sYesvCY
	tR975hBrWdUEGhcIDv9xWG4SgG+T9xlvgPu4exGyf/KdKbwzxW
X-Google-Smtp-Source: AGHT+IE8afm9cWfJKWFfT+ztBS8FIYb3Saqkj8Xu8kMgzMwDcYBAelZGPlwBO7mH/SMeDgObiTNGbQ==
X-Received: by 2002:a05:6102:3f0d:b0:5d7:c6c1:8510 with SMTP id ada2fe7eead31-5d7dd6a50bamr6391329137.27.1761127309622;
        Wed, 22 Oct 2025 03:01:49 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5d96c2acb3fsm4443226137.16.2025.10.22.03.01.49
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 03:01:49 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-932b7831827so1676518241.2
        for <linux-sound@vger.kernel.org>; Wed, 22 Oct 2025 03:01:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVVzg3LFD8V23LxL1dnClOC1Cpmd2H3F+eoqTE7MkWroWDcxez/kaMR6vNkMLItNALKsBu1LdXrzwLarw==@vger.kernel.org
X-Received: by 2002:a05:6102:3f49:b0:5d6:615:a687 with SMTP id
 ada2fe7eead31-5d7dd5544d6mr5930459137.7.1761127308820; Wed, 22 Oct 2025
 03:01:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1760696560.git.geert+renesas@glider.be> <67c1998f144b3a21399672c8e4d58d3884ae2b3c.1760696560.git.geert+renesas@glider.be>
 <aPKQMdyMO-vrb30X@yury> <CAMuHMdXq7xubX4a6SZWcC1HX+_TsKeQigDVQrWvA=js5bhaUiQ@mail.gmail.com>
 <aPhbhQEWAel4aD9t@yury>
In-Reply-To: <aPhbhQEWAel4aD9t@yury>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Oct 2025 12:01:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUOX=ToDU_44fHrqKWUtee1LKpgisfTKOe4R33er9g+DA@mail.gmail.com>
X-Gm-Features: AS18NWAJp5tYw_pRqlFhPyJqRT3wi5ZG4jspqrcr0Xp9hgyi6lbaoTACOgNkevQ
Message-ID: <CAMuHMdUOX=ToDU_44fHrqKWUtee1LKpgisfTKOe4R33er9g+DA@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] bitfield: Add non-constant field_{prep,get}() helpers
To: Yury Norov <yury.norov@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	David Miller <davem@davemloft.net>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Crt Mori <cmo@melexis.com>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Jacky Huang <ychuang3@nuvoton.com>, 
	Shan-Chun Hung <schung@nuvoton.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Jakub Kicinski <kuba@kernel.org>, Alex Elder <elder@ieee.org>, 
	David Laight <david.laight.linux@gmail.com>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
	Jason Baron <jbaron@akamai.com>, Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Kim Seer Paller <kimseer.paller@analog.com>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Richard Genoud <richard.genoud@bootlin.com>, 
	Cosmin Tanislav <demonsingur@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Jianping Shen <Jianping.Shen@de.bosch.com>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-edac@vger.kernel.org, qat-linux@intel.com, 
	linux-gpio@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-iio@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"

Hi Yury,

On Wed, 22 Oct 2025 at 06:20, Yury Norov <yury.norov@gmail.com> wrote:
> On Mon, Oct 20, 2025 at 03:00:24PM +0200, Geert Uytterhoeven wrote:
> > On Fri, 17 Oct 2025 at 20:51, Yury Norov <yury.norov@gmail.com> wrote:
> > > On Fri, Oct 17, 2025 at 12:54:10PM +0200, Geert Uytterhoeven wrote:
> > > > The existing FIELD_{GET,PREP}() macros are limited to compile-time
> > > > constants.  However, it is very common to prepare or extract bitfield
> > > > elements where the bitfield mask is not a compile-time constant.
> > > >
> > > > To avoid this limitation, the AT91 clock driver and several other
> > > > drivers already have their own non-const field_{prep,get}() macros.
> > > > Make them available for general use by consolidating them in
> > > > <linux/bitfield.h>, and improve them slightly:
> > > >   1. Avoid evaluating macro parameters more than once,
> > > >   2. Replace "ffs() - 1" by "__ffs()",
> > > >   3. Support 64-bit use on 32-bit architectures.
> > > >
> > > > This is deliberately not merged into the existing FIELD_{GET,PREP}()
> > > > macros, as people expressed the desire to keep stricter variants for
> > > > increased safety, or for performance critical paths.
> > > >
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > > > Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > > > Acked-by: Crt Mori <cmo@melexis.com>
> > > > ---
> > > > v4:
> > > >   - Add Acked-by,
> > > >   - Rebase on top of commit 7c68005a46108ffa ("crypto: qat - relocate
> > > >     power management debugfs helper APIs") in v6.17-rc1,
> > > >   - Convert more recently introduced upstream copies:
> > > >       - drivers/edac/ie31200_edac.c
> > > >       - drivers/iio/dac/ad3530r.c
> > >
> > > Can you split out the part that actually introduces the new API?
> >
> > Unfortunately not, as that would cause build warnings/failures due
> > to conflicting redefinitions.
> > That is a reason why I want to apply this patch ASAP: new copies show
> > up all the time.
>
> In a preparation patch, for each driver:
>
>  +#ifndef field_prep
>  #define field_prep() ...
>  +#endif
>
> Or simply
>
>  +#undef field_prep
>  #define field_prep() ...
>
> Then add the generic field_prep() in a separate patch. Then you can drop
> ifdefery in the drivers.
>
> Yeah, more patches, but the result is cleaner.

And we need 3 kernel releases, as the addition of the macros to
the header file now has a hard dependency on adding the #undefs?
Unless I still apply all of them to an immutable branch, but then what
is the point?

> > > > --- a/include/linux/bitfield.h
> > > > +++ b/include/linux/bitfield.h
> > > > @@ -220,4 +220,40 @@ __MAKE_OP(64)
> > > >  #undef __MAKE_OP
> > > >  #undef ____MAKE_OP
> > > >
> > > > +/**
> > > > + * field_prep() - prepare a bitfield element
> > > > + * @mask: shifted mask defining the field's length and position
> > > > + * @val:  value to put in the field
> > > > + *
> > > > + * field_prep() masks and shifts up the value.  The result should be
> > > > + * combined with other fields of the bitfield using logical OR.
> > > > + * Unlike FIELD_PREP(), @mask is not limited to a compile-time constant.
> > > > + */
> > > > +#define field_prep(mask, val)                                                \
> > > > +     ({                                                              \
> > > > +             __auto_type __mask = (mask);                            \
> > > > +             typeof(mask) __val = (val);                             \
> > > > +             unsigned int __shift = sizeof(mask) <= 4 ?              \
> > > > +                                    __ffs(__mask) : __ffs64(__mask); \
> > > > +             (__val << __shift) & __mask;    \
> > >
> > > __ffs(0) is undef. The corresponding comment in
> > > include/asm-generic/bitops/__ffs.h explicitly says: "code should check
> > > against 0 first".
> >
> > An all zeroes mask is a bug in the code that calls field_{get,prep}().
>
> It's a bug in FIELD_GET() - for sure. Because it's enforced in
> __BF_FIELD_CHECK(). field_get() doesn't enforce it, doesn't even
> mention that in the comment.
>
> I'm not fully convinced that empty runtime mask should be a bug.

Getting (and using) data from nowhere is a bug.
Storing data where there is no space to store is also a bug.

I will add a comment.

> Consider memcpy(dst, src, 0). This is a no-op, but not a bug as
> soon as the pointers are valid. If you _think_ it's a bug - please
> enforce it.

memcpy() with a fixed size of zero is probably a bug.
memcpy() with a variable size is usually used to copy "as much as is
needed", so zero is usually not a bug.

> > > I think mask = 0 is a sign of error here. Can you add a code catching
> > > it at compile time, and maybe at runtime too? Something like:
> > >
> > >  #define __field_prep(mask, val)
> > >  ({
> > >         unsigned __shift = sizeof(mask) <= 4 ? __ffs(mask) : __ffs64(mask);
> > >         (val << __shift) & mask;
> > >  })
> > >
> > >  #define field_prep(mask, val)
> > >  ({
> > >         unsigned int __shift;
> > >         __auto_type __mask = (mask), __ret = 0;
> > >         typeof(mask) __val = (val);
> > >
> > >         BUILD_BUG_ON_ZERO(const_true(mask == 0));
> >
> > Futile, as code with a constant mask should use FIELD_PREP() instead.
>
> It's a weak argument. Sometimes compiler is smart enough to realize
> that something is a constant, while people won't. Sometimes code gets
> refactored. Sometimes people build complex expressions that should
> work both in run-time and compile time cases. Sometimes variables are
> compile- or run-time depending on config (nr_cpu_ids is an example).
>
> The field_prep() must handle const case just as good as capitalized
> version does.

OK, I will add the (build-time) check.

> > >         if (WARN_ON_ONCE(mask == 0))
> > >                 goto out;
> > >
> > >         __ret = __field_prep(__mask, __val);
> > >  out:
> > >         ret;
> > >  })
> >
> > Should we penalize all users (this is a macro, thus inlined everywhere)
> > to protect against something that is clearly a bug in the caller?
>
> No. But we can wrap it with a config:
>
>  #ifdef CONFIG_BITFIELD_HARDENING
>          if (WARN_ON_ONCE(mask == 0))
>                  goto out;
>  #endif

That can be done later, when hardening other bitfield functions
and macros.

> > These new macros are intended for the case where mask is not a constant.
> > So typically it is a variable of type u32 or u64.
>
> You never mentioned that. Anyways, it's again a weak argument.

I'll add more comments ;-)

> > > > +             unsigned int __shift = sizeof(mask) <= 4 ?              \
> > > > +                                    __ffs(__mask) : __ffs64(__mask); \
> > >
> > > Can you use BITS_PER_TYPE() here?
> >
> > Yes, I could use BITS_PER_TYPE(unsigned long) here, to match the
> > parameter type of __ffs() (on 64-bit platforms, __ffs() can be used
> > unconditionally anyway), at the expense of making the line much longer
> > so it has to be split.  Is that worthwhile?
>
> Not sure I understand... The
>
>         "unsigned int __shift = BITS_PER_TYPE(mask) < 64 ?"
>
> is 49 chars long vs 42 in your version. Even if you add two tabs, it's
> still way below limits. And yes,

Oh, you meant instead of the size check.
I thought you objected to the hardcoded number 4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
