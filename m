Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB2932B98B
	for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 11:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760698942; cv=none; b=L+y0W31tXXsgKz/60oJdslYpO985zP+9d3lM83KT25Ci/3Kwq/UuXO9b362RoaXTsemGWuwyBw0UqysAhkL9Q8wBiVZLFKU6mfLFg2ykv3x/42YHH3nemS4V3s92KR+k6ALZgYmLVSTqmDK0haLPEf8gfk9wzQ3vkfqmQggxXgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760698942; c=relaxed/simple;
	bh=LrniXy6ZCFM530ZMtcnDRQn9pcEmCEynLCDVJ3AMIhs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F7RgpWcOJ9C+aSmgEirqOYVVtcZioEdNYNfhBJy0hV9T6hvEqkOiKEcYX8kG4Ay0SxaAP4A7RormTYvihMV945tCyKi64ISSLjBIt1ZOdwhA1A+lyiEOKZf69+PlcS0QlJXf87J9G6e6pOEh4E5idnrGZ0eNxsB/ZSnv4a3HgYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-88f239686f2so227563085a.0
        for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 04:02:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760698939; x=1761303739;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XCpfZFAx3hiLnczCJXcXTR7Dek411X8RRc+fD4xQf5M=;
        b=jqQWSbGBjt7zcI9gkvRVD7z92qqKQZ9eN1/ho9RXDR7y0+CMI4ubk4j/Sxo1FQM5Pp
         hH7R1o7jnPuxgGgtYfZ/kKO7HEW7mkCXL29ZNb5CQVjpwRrg44m1+QpZLwoyB9m6SRLi
         +eGMXvhVBjKSpjcxSKD+ZB2pjY+VthX7VDLV30PNWMYpkWCbkNinh8MPNkXOsiC4A0AK
         lFOVFs9v7An/OqGd8Y8KDoYd5ErhsqJvNQzD+M0q98pwhHCyKG25egX+ZURyorMQN7nC
         7bwjMXQtvmnamKN46fdULr0sxjLKSHx5Gi/1G7S+bivTFT/sRRcvRORQJvaLAUkWpe+K
         tQZg==
X-Forwarded-Encrypted: i=1; AJvYcCUkm5rMQpRHta7GxEooI5WODKELr19yw6F0tbJuu0WlTGHYbz6pewJLTs+fcMxfFWEVbJfQ7klC296quA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWtdEb0z6cXo5fovCMBxXvrZK+59NBlS37Ko0JJxAGgTbgQS2O
	AyPdqYwVA5kNEhq+2R8XYKS18ToQSLMdnJsArq37NEXdXURkNhkJUjyKqbFaM8UG
X-Gm-Gg: ASbGncsZpMheI9MXirMji4G+KobJdH4WZdUJy0CZ9IKVa33vApJchSBGjn4RNVNW++V
	zIE1vXV0TBwCHpBbtGNah1Z5nVDoG0OruP0GSVigabpR4Xu5SBb7Sugky3DQdlkfBeAjkI81VgT
	EJiNVgG3xwuUy/R5EOcHrWjmW+byeANzNBghPq6WHzBf56rFNfk5stPt6f5MaxK+MWxn3R36Dzl
	1zAkgpruQehnAeDmyZUKJC7rfVG0uqjvHpOpJFKO2JIWPhWk88L9J0fxhsdBJyAdiwozDp54gXO
	NQIbOZpZxdT3M5atWUMapgD5TQ0PvRHIwgtS44EonxCAaYC5nm7IzQAD2SMhz8OY/W6Lzhx5V4f
	6uBEIGl7R0xeSB0mvePT46BsEfvWwnuPe5yuq6aRaDcGrDRhnB/D4G8Mrt9/EHOaYm0vP4lAiO8
	7VvqUyVkpeKmQ9UGr1KgZNfQICNeD3ekESW5Xs6g3Nrg==
X-Google-Smtp-Source: AGHT+IGGT2OqLEALwV1+pdBNWF3Hc/MWwpJAo31DCyYzZO+kooGpkqRD77B8ceuEcIs9rWO0GkNlUw==
X-Received: by 2002:ac8:584c:0:b0:4b3:4a3a:48b8 with SMTP id d75a77b69052e-4e89d3fa769mr45345451cf.73.1760698939314;
        Fri, 17 Oct 2025 04:02:19 -0700 (PDT)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com. [209.85.222.179])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e8966948besm30673041cf.8.2025.10.17.04.02.18
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 04:02:19 -0700 (PDT)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-890521c116fso164978185a.3
        for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 04:02:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVChJdUcGM5qAzhRyLbL1Pi/tQ2ksCmeWQmv8aQQw5X7tjvRVPWpW3XvJXbI+hs16abGsBI+VYLPie2kA==@vger.kernel.org
X-Received: by 2002:a05:6102:c49:b0:5a1:f09f:524e with SMTP id
 ada2fe7eead31-5d7dd59bcd6mr1313646137.16.1760698511065; Fri, 17 Oct 2025
 03:55:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1739540679.git.geert+renesas@glider.be> <2d30e5ffe70ce35f952b7d497d2959391fbf0580.1739540679.git.geert+renesas@glider.be>
 <20250214073402.0129e259@kernel.org>
In-Reply-To: <20250214073402.0129e259@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Oct 2025 12:55:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU+0HGG22FbO3wNmXtbUm9RhTopYrGghF6UrkFu-iww2A@mail.gmail.com>
X-Gm-Features: AS18NWCjFk9wo7Q1aPnnkBYJzaq6xcQVQAXawyeid30N8a2RlJlAbXrKkziomTs
Message-ID: <CAMuHMdU+0HGG22FbO3wNmXtbUm9RhTopYrGghF6UrkFu-iww2A@mail.gmail.com>
Subject: Re: [PATCH treewide v3 2/4] bitfield: Add non-constant
 field_{prep,get}() helpers
To: Jakub Kicinski <kuba@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	David Miller <davem@davemloft.net>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Crt Mori <cmo@melexis.com>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Jacky Huang <ychuang3@nuvoton.com>, 
	Shan-Chun Hung <schung@nuvoton.com>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Alex Elder <elder@ieee.org>, 
	David Laight <david.laight.linux@gmail.com>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-crypto@vger.kernel.org, 
	qat-linux@intel.com, linux-gpio@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, linux-iio@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"

Hi Jakub,

On Fri, 14 Feb 2025 at 16:34, Jakub Kicinski <kuba@kernel.org> wrote:
> On Fri, 14 Feb 2025 14:55:51 +0100 Geert Uytterhoeven wrote:
> > The existing FIELD_{GET,PREP}() macros are limited to compile-time
> > constants.  However, it is very common to prepare or extract bitfield
> > elements where the bitfield mask is not a compile-time constant.
> >
> > To avoid this limitation, the AT91 clock driver and several other
> > drivers already have their own non-const field_{prep,get}() macros.
> > Make them available for general use by consolidating them in
> > <linux/bitfield.h>, and improve them slightly:
> >   1. Avoid evaluating macro parameters more than once,
> >   2. Replace "ffs() - 1" by "__ffs()",
> >   3. Support 64-bit use on 32-bit architectures.
> >
> > This is deliberately not merged into the existing FIELD_{GET,PREP}()
> > macros, as people expressed the desire to keep stricter variants for
> > increased safety, or for performance critical paths.
>
> I really really think that people should just use the static inline
> helpers if the field is not constant. And we should do something like
> below so that people can actually find them.
>
> diff --git a/include/linux/bitfield.h b/include/linux/bitfield.h
> index 63928f173223..e02afcd7aeee 100644
> --- a/include/linux/bitfield.h
> +++ b/include/linux/bitfield.h
> @@ -156,6 +156,80 @@
>                 (typeof(_mask))(((_reg) & (_mask)) >> __bf_shf(_mask)); \
>         })
>
> +/**
> + * u32_encode_bits() - prepare a u32 bitfield element (non-const)
> + * @v: value to put in the field
> + * @field: shifted mask defining the field's length and position
> + *
> + * Equivalent of FIELD_PREP() for u32, field does not have to be constant.
> + *
> + * Note that the helper is available for other field widths (generated below).
> + */
> +static __always_inline __u32 u32_encode_bits(u32 v, u32 field)
> +{
> +       if (__builtin_constant_p(v) && (v & ~field_mask(field)))
> +               __field_overflow();
> +       return ((v & field_mask(field)) * field_multiplier(field));
> +}

Unfortunately gcc emits actual divisions or __*div*() calls, and
multiplications in the non-constant case.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
