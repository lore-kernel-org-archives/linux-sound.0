Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E46330B26
	for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 16:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760717194; cv=none; b=jdu6TgbLLqrPEn85gxjl8rHF3T3N3ukWzahXFPdfbnMl98dzaiiKIsyuoLqwKbGKMTnppHosce7he3CSQX1kbD7K8fVoB4ze79hfyeG4Ekzs8sxRx9zCj5fHTdHx4kArKGgTe3aoRKzlDvJTHmR0FMVH18SBeelW0huTh+kmfdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760717194; c=relaxed/simple;
	bh=5UuF/HjwkQMRQp3toEpBUcYrHBj825aq+Tc6Itk11zY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hFysU4+3rK42XR/4Y6OJsbC5/CJwN2RdVKexKHau18eEKuw/PnXoJTB0EN9nasE7esEXbhxKYZQd9AcPxk8rId3VA9Luf+vkRPpjFtM0bqaWLY4686YPG8+Dbt3t0Q0YgYJEUMX+eQR12XgeaSBzxYqzFXP/Ei3mXDc+NnhVENE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-441de7ba142so1126426b6e.2
        for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 09:06:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760717191; x=1761321991;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D4mf9FdrvOGmLornKgNki0gXD9BcM6SCmzEl3gfV4Zs=;
        b=P+oq7wPsDTCabhjqwfvEGts3r835KLL9ZspIK/64e6mAy0F7cB5mAzqh00rGT0KSkn
         vu/h4e0WJw2rFmaqYbl2kYtIm+i5wxhOTv0HyombQhoKVtAm+TZYuOm8Ii+nruiGGNkZ
         q2Y3XctokcSTCDsDBFaGBjiQUXFNVeUjUMqeEqnFBWVDm9+DcXPQjfYlHxeBX3hntkT+
         QmxFKHz5Pqi4j5UThIi98k8OeUaBhwRtX6a8DKkFzddCAPhlEHX4+bKl+DwmtnEceJFX
         RfDPen2M6ZTHjjMaNJQ+TM2mBb5pHHVE6X7ddiGZYDV9mWzpjY3ywIkuF3GLLx/F39N/
         2nOQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6e8FP37b0i8qPdw6Nqjs/UvHiQ8lyoZ0ppvnl8D7VPK0vyFLC87ZQC/Ucu4JMzkmH10hylr+0b1z7Tg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGcd+C5uZYisq+3DgOtDwmit2aQOqRM+UeCDPBALJF5Co3b/Tk
	Cl+39YbtPPrjs9KCy8Ycv/2HvspdC2OpSaeFwfa0hCh/cAvjhUbofCgcausfDKzZ
X-Gm-Gg: ASbGncv+auc4TTFg0u/Xj4ntjc0eY1wUX3yKsS8Jqz3d+Almrkmv2iO8uaOm860qOCX
	No1I+sjtC/uqhYlpzrvqYDgsG6O6ceI2a7VX35pv7dducav5+/oJINeayO64TNyBYCckUoiaKP1
	0tYat0qPLor4dDt9Epi4vkR5cAQ/j50GlJ/BYSNe0NgoUwnynlo9npNX7NFZQxuKHh/0WhyxP0O
	4js96rhD2OITlK69BOHKEvvoxuPGmep2vEVmueloQ6RlhC6b/ySOAkDMBPs43P19lqapGfUpaqq
	R3+Bo3FY8UHRY7EjSiZGtxHXHuwwliX3IvXfrG22j4GNGSaqutdtgZxD+KzkjIfJm8Pk58yqJvx
	khVzHCMVh7+LlfjQIZE6fn0M537hZ8PNnoXVruLw9yFBSPxA/OTQQi0TaIimZldDhGIScRboF8+
	j1Ye9XgqJxvcjRB82BdDRvJiGofdoFk6fw6CH9eNfMvhyKtSZn
X-Google-Smtp-Source: AGHT+IGW+qBAhfjZM/PojU4Uybbb6jIXRGb/c2aEYLzjgszfBldVNz5DjIB5JbADih8K1Ue/vi6wpg==
X-Received: by 2002:a05:6808:2002:b0:43f:7287:a5de with SMTP id 5614622812f47-443a30d427amr1785070b6e.41.1760717191430;
        Fri, 17 Oct 2025 09:06:31 -0700 (PDT)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com. [209.85.210.54])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-44220cb8fc7sm1017148b6e.23.2025.10.17.09.06.30
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 09:06:30 -0700 (PDT)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7bcfafec537so1566778a34.0
        for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 09:06:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWFWkIoJZrfUVbvVDbX+EncHQjUYTr/xmnWljr4Mf81+kNKoQcqD9u241NrAqrPvUmQIceeD2waco88hw==@vger.kernel.org
X-Received: by 2002:a05:6102:40c6:10b0:5d7:dec6:389a with SMTP id
 ada2fe7eead31-5d7dec64177mr1309355137.9.1760716852567; Fri, 17 Oct 2025
 09:00:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1739540679.git.geert+renesas@glider.be> <2d30e5ffe70ce35f952b7d497d2959391fbf0580.1739540679.git.geert+renesas@glider.be>
 <20251017081912.2ad26705@kernel.org>
In-Reply-To: <20251017081912.2ad26705@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Oct 2025 18:00:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVS5KmVkv_pmc+R-EXik-Z1_7nuiHM=vm1Cu8v91wmLBQ@mail.gmail.com>
X-Gm-Features: AS18NWD4CQztq7yi6j63q-9XtnW0otWo2wOw8z0_Fp7R-6z_qrlZWB5IqFYEbBg
Message-ID: <CAMuHMdVS5KmVkv_pmc+R-EXik-Z1_7nuiHM=vm1Cu8v91wmLBQ@mail.gmail.com>
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

On Fri, 17 Oct 2025 at 17:19, Jakub Kicinski <kuba@kernel.org> wrote:
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
> We already have helpers for this, please just don't know they exist :/
>
> The "const" version of the helpers are specifically defined to work
> on masks generated with BIT() and GENMASK(). If the mask is not
> constant we should expect it to have a well defined width.
>
> I strongly prefer that we do this instead and convert the users to
> the fixed-width version:
>
> ---->8----------------
>
> Subject: bitfield: open code the fixed-width non-const helpers so that people see them
>
> There is a number of useful helpers defined in bitfield.h but
> they are mostly invisible to the reader because they are all
> generated by macros. Open code the 32b versions (which are
> most commonly used) to give developers a chance to discover them.
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Thanks, but this is more or less the same code which you suggested
before [1], and to which I just replied[2] after looking at the
generated assembler output on various architectures.

> @@ -188,6 +193,81 @@ static __always_inline u64 field_mask(u64 field)
>         return field / field_multiplier(field);
>  }
>  #define field_max(field)       ((typeof(field))field_mask(field))
> +
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

Unfortunately gcc emits actual divisions or __*div*() calls, and
multiplications in the non-constant case.

So I don't think this is suitable as-is.

> +}

[1] https://lore.kernel.org/all/20250214073402.0129e259@kernel.org
[2] https://lore.kernel.org/all/CAMuHMdU+0HGG22FbO3wNmXtbUm9RhTopYrGghF6UrkFu-iww2A@mail.gmail.com

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
