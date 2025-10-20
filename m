Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FDA2E9737
	for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 12:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760962910; cv=none; b=S5sNTSNquYHEfVomet2esfBae+99y4WEkTpE65ULb2jNzO64VEZucWHuTW8fcjyzNnVW4vs/zRqLPTJzof97crWKBeMeT0oQMDzMEqJNZvjHQhJ461V9NFGdtA5DUeiZ6m5j0/GLiRLzlpB8oGMeKrfxsWk7HKZn1ScA6IC9x0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760962910; c=relaxed/simple;
	bh=zQJyABbFIFRgraIjRfB4Kv0edNHngRx2HTU3PnrqMSo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ENb7SOo9hQ4f5r7CQMbGb6gkdKnFtpDFndDMbMXsWruQDHs6+XPQ6mlUPCYJxwNhcvVGFINmP0eYmqjiqSbaM3+uy0XWke1wdrMO9AmuK2ijVbLAbYP2JbQEn4Iz1N/R5TLbNc2VhnLVOwibb6O3/pDg/QTIQN7+mOjzJ8uPRE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-93e7e87c21bso290572939f.3
        for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 05:21:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760962908; x=1761567708;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pomt2ITXhIHlFit8dq3w5svz3PMdwi8h98cx9ZzxHC0=;
        b=WChGNLVUuzfKxCpWHgH6DFBnOSXZFCZj7LLWGITEcNqFb86dId8AWpXrb4NuobZJvV
         SyDlWzeFFeKZgwhF+4XegjaUgTbwSl60tcr4uraAl3d44LsrxpM7ndMhcZ4qgsC6fb4E
         DMgr/z76dRtxMgus82E4tGmHFsRFT7r/gZRwNdtEAzX4JO75eSXLkEShHzZjRW/+LcN+
         TFY76X3yEQBIc5hO2ZOYw1kXCtU8rYk0ohFukN42NK9dQkmGh4xZMBBKS+NouUwdxD6P
         3jJ7vr2StepKkFTeRwpliJ+IIBKHsC5XkiuOa5q58+nr114GRlo6FNpQvM0d3kfUXXD7
         YzbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOPBdqKWUBeQjAsTHmLl1Ihx0lF0eUDPt5SduSZI9Migv2qVg3bXjC9XZgJv4Dt74QUqCroMkoIvkmBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx18l2AzKA/wD6c/FIylFWHXbtPWqX75LORikRqGiWDShFq3p9
	DESy8vKPK+sa8aTPlV02wh/WD2LMMRv2EHWYgOqRB0OwoCYrHwwFNr/hO9ToiLGR
X-Gm-Gg: ASbGncv2ePgvAVGKPLIVqmkn97WH3jxKpBjgBEXFCxBgolf5roZ8QYfqeJw1L1VARrF
	VwEh3HbpDCDTyszdNDmcKmofNb1td0Bli+pxUDUjOFOFA6j+PD7R8vNVVIw8rhS+HZYBYT6Lnf7
	aKSyNHXctX5HMJICGvYGc2Spl1yhLFqstg21J3lk72vgikUqAsVWskcMQpxMttcYm2D/t9odRxd
	+Ujh0o+p87OvC14Wj8lIrJA0SlSRTHwGrcj7bqbN11t2O84Ub1W6qBAUbHOYL/xwzd0SBQl2zZe
	X/KXg5vBa9DalBsQ3+QhsGYt76qu1KsYsf/0s0+PCxdp75glbeucS/QShsnNRPGckTVGkxdqjB2
	C71VOBbZ9JKk3IOzxJOv031yGT28gyLQ6XdJrpEY5GeiRjxb2IDwF64H1RN/QySwjSMkDhcP7e/
	SK/FYaewKtZVVGSL9Giu/itwAnRn3ONWiytmfESHq+m86+4k6Z5gIY43E6XPk=
X-Google-Smtp-Source: AGHT+IE2CBuMFXLFYp8RTppWUV/ne73ElZJVkfQpDCQ0bhsFSsGCmjGpW39zDbSWn8PlkkdUrnHcAQ==
X-Received: by 2002:a05:6602:489:b0:93e:2f4c:97be with SMTP id ca18e2360f4ac-93e7642f8e7mr2063763139f.15.1760962907724;
        Mon, 20 Oct 2025 05:21:47 -0700 (PDT)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com. [209.85.166.50])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-93e866df2eesm290272239f.19.2025.10.20.05.21.47
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 05:21:47 -0700 (PDT)
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-93e7e87c21bso290571139f.3
        for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 05:21:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVaWz/aOmsBK0pUl7Mcxh2QTDI/myMlFqAwiN4eWXhVL6gk1N5bxLv2PwJRWJe1J6ugBejb01sRcHe5LA==@vger.kernel.org
X-Received: by 2002:a05:6102:50a2:b0:5d5:f6ae:38ca with SMTP id
 ada2fe7eead31-5d7dd6f4c27mr3609494137.41.1760962417639; Mon, 20 Oct 2025
 05:13:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1760696560.git.geert+renesas@glider.be> <792d176149bc4ffde2a7b78062388dc2466c23ca.1760696560.git.geert+renesas@glider.be>
 <aPJwtZSMgZLDzxH8@yury>
In-Reply-To: <aPJwtZSMgZLDzxH8@yury>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 20 Oct 2025 14:13:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXCoqZmSqRAfujib=2fk0Ob1FiPYWBj8vMXfuXNoKhfVg@mail.gmail.com>
X-Gm-Features: AS18NWDS1vbUG4-z_--VlQ3gjSspwjijy0fs8EPqX7O88cWCZQUNQKHTmAYei1k
Message-ID: <CAMuHMdXCoqZmSqRAfujib=2fk0Ob1FiPYWBj8vMXfuXNoKhfVg@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] bitfield: Drop underscores from macro parameters
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
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Yury,

On Fri, 17 Oct 2025 at 18:37, Yury Norov <yury.norov@gmail.com> wrote:
> On Fri, Oct 17, 2025 at 12:54:09PM +0200, Geert Uytterhoeven wrote:
> > There is no need to prefix macro parameters with underscores.
> > Remove the underscores.
> >
> > Suggested-by: David Laight <david.laight.linux@gmail.com>
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v4:
> >   - Update recently introduced FIELD_MODIFY() macro,

> > --- a/include/linux/bitfield.h
> > +++ b/include/linux/bitfield.h
> > @@ -60,68 +60,68 @@
> >
> >  #define __bf_cast_unsigned(type, x)  ((__unsigned_scalar_typeof(type))(x))
> >
> > -#define __BF_FIELD_CHECK(_mask, _reg, _val, _pfx)                    \
> > +#define __BF_FIELD_CHECK(mask, reg, val, pfx)                                \
> >       ({                                                              \
> > -             BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
> > -                              _pfx "mask is not constant");          \
> > -             BUILD_BUG_ON_MSG((_mask) == 0, _pfx "mask is zero");    \
> > -             BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
> > -                              ~((_mask) >> __bf_shf(_mask)) &        \
> > -                                     (0 + (_val)) : 0,               \
> > -                              _pfx "value too large for the field"); \
> > -             BUILD_BUG_ON_MSG(__bf_cast_unsigned(_mask, _mask) >     \
> > -                              __bf_cast_unsigned(_reg, ~0ull),       \
> > -                              _pfx "type of reg too small for mask"); \
> > -             __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
> > -                                           (1ULL << __bf_shf(_mask))); \
> > +             BUILD_BUG_ON_MSG(!__builtin_constant_p(mask),           \
> > +                              pfx "mask is not constant");           \
> > +             BUILD_BUG_ON_MSG((mask) == 0, pfx "mask is zero");      \
> > +             BUILD_BUG_ON_MSG(__builtin_constant_p(val) ?            \
> > +                              ~((mask) >> __bf_shf(mask)) &  \
> > +                                     (0 + (val)) : 0,                \
> > +                              pfx "value too large for the field"); \
> > +             BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >       \
> > +                              __bf_cast_unsigned(reg, ~0ull),        \
> > +                              pfx "type of reg too small for mask"); \
> > +             __BUILD_BUG_ON_NOT_POWER_OF_2((mask) +                  \
> > +                                           (1ULL << __bf_shf(mask))); \
> >       })
>
> I agree that underscored parameters are excessive. But fixing them has
> a side effect of wiping the history, which is a bad thing.
>
> I would prefer to save a history over following a rule that seemingly
> is not written down. Let's keep this untouched for now, and if there
> will be a need to move the code, we can drop underscores as well.

Fair enough.
So I assume you are fine with not having underscored parameters in
new code, like in [PATCH v4 2/4]?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
