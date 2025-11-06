Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12189345CBC
	for <linux-sound@vger.kernel.org>; Thu,  6 Nov 2025 14:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762440886; cv=none; b=ig3CfZo3WCYoDH2aZG7JUBXDd4E8aWEjPUFIhCM/stqf6WqTupBJHrhlWF93c1QdnolRMsPCx8YTzRnMlMfjhQBgY/Au6MfJA78Y2y3Care4Vg9vhtdmbhlTK2QR2BA83fartSo0oVtvxThN3okBVYhyhqzlgQaz3D3pjovDEt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762440886; c=relaxed/simple;
	bh=HaefBq/9gx/xpe6H9SR+jXE6I2U49/Bi4dkyZMOckp8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BQaupkLOqIHFhh+rnErcENKzGe9uswTNqdaPPRCywW3GNlnhWygPqVhNJYWdmfr1r4PhpV+7PEKnS58WxWtGRG8otvmkUASqSCTb+44+VzBgslCZHH8K72xHQ7ijvWvXlCvDADb8pBBHnAyCyI35aNv2GX6JygCExyV1WQvtC64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5943d1d6471so1060057e87.0
        for <linux-sound@vger.kernel.org>; Thu, 06 Nov 2025 06:54:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762440883; x=1763045683;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZxZVtMOHoNocoyXPFvfejRTHivuCeFc8a9lYqiVNw1Y=;
        b=v3oWrojwZcROH1zcmpICofOYDQPEBucrs4FkhP7B4UYQ+CGLe07rTsR8U65Adey3LG
         Z3hVBz5Q9S+12VfKg+VdgtjqGB4BiP9Qf3NhHbJ8NbzLpzVU+sL2IHiQw5k0fXhEJyq6
         1aP0evjmbVeKhJzz5wQEsXUimFPBDLBIyghC28jbY2MtlvQdUV+kw3ZI1cSMVlA5MEUE
         sw1UcW3LgFer2NJyikV93giCc4c92p0qCgNbaIWoeFsHsBVZbBdlInzFE0i75UjzFk12
         qBgvnrKXucWKnau5ZjLIJqqjwKd2rv1A+YHwf6XoW8+zf3z07qVId1b9fr4zWZMW41By
         ORng==
X-Forwarded-Encrypted: i=1; AJvYcCUDJIdNnYIZ2Omr0Kvu6n8E10W++X1ZzUZUacxmfJhiJMR76wFxVi/r/5cbQumtA0fJIFz6nPCed9W7Hg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfbdYjfp9jevpaKTAmxEJgilnbh+oY4VXB5FjNpzufqbY6lTkt
	hIGXxPUQW8cCLAPyML6cBMUVZw6WwDtd1OBaR2m+njFuGhk7xXOo6rdcdOcUo9W68TU=
X-Gm-Gg: ASbGnct/sIPBhal0rxxBNGzewTqP29Q8ZrlpVPxgVAEmDQXc+2Kq/leDRsIbzyalYxE
	k+ItcY0Oeir/MftdpP4LyYyNz8a+7Z5rV9E5oACddYkJGV4pYG7K9VJ26F5+PEZCEO0o7duJ1N2
	DqZ0hmxM4Z5kQIZ/3rcTlDcqQMo7zT4EnTxVaTue6nAoPWLUu6iSPUSHsTuH25yDEtRFfKPHKcq
	5XDdboDMpDkF3T0E/sZuSU2dreyD4I8tQZwEegskmK7LXxpD+PgF+DZi8sliK4Nbv82/skvdshn
	qWPDljbU/QGPqCgic0FWZGOx6v4a/XN5DWONGXzJN1Z1DpXUu5puxtw3XvAAJWMdgGjabVwz0cN
	ZjeWsic0RX+avJyBzgMUZGowqZMvtHct3HRPLxp2rGYkzYFTn1Ol8t1M3pU/TM1fW9pOGhBOB5s
	tRCy/TvhmyHkGAbc1xM6fv1+KliObglSVc1UJwJQ==
X-Google-Smtp-Source: AGHT+IGKGZp4VoNxGxZbwCrXFfvpphPUfNmVQflaL1tsTaRV7qjKkQEPavKHAhR2mkaSQ9eO/NsT5w==
X-Received: by 2002:a05:6512:2c85:b0:594:5000:4555 with SMTP id 2adb3069b0e04-594500f8c9fmr656292e87.29.1762440882745;
        Thu, 06 Nov 2025 06:54:42 -0800 (PST)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a034532sm772613e87.49.2025.11.06.06.54.40
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 06:54:41 -0800 (PST)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5943d1d6471so1059972e87.0
        for <linux-sound@vger.kernel.org>; Thu, 06 Nov 2025 06:54:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUUJFQdHSgwf2i421CFDhzzqCQYFMsiCkiCE+HSxcYT8TjT3eQ0GC9s90btHo5qNGRxanPUtfAPJRgVcg==@vger.kernel.org
X-Received: by 2002:a05:6402:1ed5:b0:640:b643:f3c5 with SMTP id
 4fb4d7f45d1cf-641058cf323mr7301623a12.16.1762440555932; Thu, 06 Nov 2025
 06:49:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1762435376.git.geert+renesas@glider.be> <cfc32f8530d5c0d4a7fb33c482a4bf549f26ec24.1762435376.git.geert+renesas@glider.be>
 <aQy0T2vUINze_6_q@smile.fi.intel.com>
In-Reply-To: <aQy0T2vUINze_6_q@smile.fi.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Nov 2025 15:49:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXVUJq36GvNUQE8FnHsX+=1jG4GOJ_034r=fgr_Rw4Djg@mail.gmail.com>
X-Gm-Features: AWmQ_bnZOzLGAFcWzxKh1EIKjH4MNs7moeVCtN8xGb6mN65nYBliBYrABdUBf0M
Message-ID: <CAMuHMdXVUJq36GvNUQE8FnHsX+=1jG4GOJ_034r=fgr_Rw4Djg@mail.gmail.com>
Subject: Re: [PATCH v6 12/26] bitfield: Add less-checking __FIELD_{GET,PREP}()
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Yury Norov <yury.norov@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
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
	Jianping Shen <Jianping.Shen@de.bosch.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-edac@vger.kernel.org, qat-linux@intel.com, 
	linux-gpio@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-iio@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andy,

On Thu, 6 Nov 2025 at 15:44, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> On Thu, Nov 06, 2025 at 02:34:00PM +0100, Geert Uytterhoeven wrote:
> > The BUILD_BUG_ON_MSG() check against "~0ull" works only with "unsigned
> > (long) long" _mask types.  For constant masks, that condition is usually
> > met, as GENMASK() yields an UL value.  The few places where the
> > constant mask is stored in an intermediate variable were fixed by
> > changing the variable type to u64 (see e.g. [1] and [2]).
> >
> > However, for non-constant masks, smaller unsigned types should be valid,
> > too, but currently lead to "result of comparison of constant
> > 18446744073709551615 with expression of type ... is always
> > false"-warnings with clang and W=1.
> >
> > Hence refactor the __BF_FIELD_CHECK() helper, and factor out
> > __FIELD_{GET,PREP}().  The later lack the single problematic check, but
> > are otherwise identical to FIELD_{GET,PREP}(), and are intended to be
> > used in the fully non-const variants later.
> >
> > [1] commit 5c667d5a5a3ec166 ("clk: sp7021: Adjust width of _m in
> >     HWM_FIELD_PREP()")
> > [2] commit cfd6fb45cfaf46fa ("crypto: ccree - avoid out-of-range
> >     warnings from clang")
>
> Also can be made as
>
> Link: https://git.kernel.org/torvalds/c/5c667d5a5a3ec166 [1]

Nooooh... torvalds might click on it, and complain ;-)

> > +     BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >               \
> > +                      __bf_cast_unsigned(reg, ~0ull),                \
> > +                      pfx "type of reg too small for mask")
>
> Perhaps we may convert this (and others?) to static_assert():s at some point?

Nick tried that before, without success:
https://lore.kernel.org/all/CAKwvOdm_prtk1UQNJQGidZm44Lk582S3p=of0y46+rVjnSgXJg@mail.gmail.com

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
