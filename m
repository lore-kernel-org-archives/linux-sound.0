Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC0D2FB085
	for <linux-sound@vger.kernel.org>; Mon,  3 Nov 2025 10:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762164999; cv=none; b=G74iQ5Ycr4I56FHdGI3tE9ZZVqfO1Vzl8019eSY47fWaHlKrvMLdstG6poyYrewbxGS7HAOTmrkjADBMcAshCbe5kePoS6A4e098cFb72ulzklKMSl2XZQd7hY/IXY8tPpJC28hsJJP0FJAOgr46pnAw9cjyZp3DRYkWDAaF0CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762164999; c=relaxed/simple;
	bh=mTHQRbPtXcLW9RC24UimP00dT4bpQ240D8TduWco7Ms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=abcd7XA/RHwk7sYAEa5j3x2msvq7SL1RoKPETL25ou2S5BKHrVbJuG6t7gGHN6zzIzHKh3qf+dt9SVzlYSAtf5q+30dBn204v7LvV8JFXIPh92yL4CJeCRjUz4xoFFGZRXLXOb5PHesc/VDFxVeyUzS0I43Btj096+YUvdyvXRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7aab061e7cbso1181962b3a.1
        for <linux-sound@vger.kernel.org>; Mon, 03 Nov 2025 02:16:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762164997; x=1762769797;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WN9rH9/69UaI2zM1r1sL3pcOf4U1LH9TZ13cniByZO0=;
        b=bVsuCDdhf6k913u/gIMIjhZYi/a2wYmwdQGyhLm+XKYRGHYHSQpte1rUIoJHVVLIht
         u0aEZM4KY9rHN+iAYTHFY+j0DozPaxbceeet+U/wBZU328aEKc88US2UPaZCcRRrbu4p
         WAVFVnTMl5zGreu8HllFqQXAmWtW6qkvjJ7bnAGt0vmon8ivZEFEN4FoiyIw+I2nuMaq
         wWaaP0FpOeYVI5r+Lt7pfuzwVSFhxODNbERrxzhDBlTexcC5kqdDq+xhflz9VQhF0RF6
         YZI34KbY/jqUvxUeN28+5KFfwBfwetR92KPNPHHdTiatcMwIMX4JmEmAZGl1dIUjfqYU
         2r0w==
X-Forwarded-Encrypted: i=1; AJvYcCVjH6fAB/lGzJBKrGRzGRV1AunNT94L4570LDpTbjR5nIS67TXvkxLS1l6CZMyc6iTuMKQCHe33+fksWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlVJaC3mhy8/ZCA/4FBxxexqWqhHJ9NAqG1ro5rBqLgo6mRxwY
	35Z4/tBLWb1s5+wkQd57V8t3N9uaFsezzgutVtfjug03THnrv7g0qKxGxrayRsMO
X-Gm-Gg: ASbGncsu6v/NRDu+mmHS3bPG3WEN7H2o/+mdGN9kH/FgWo/HI6VXWksII8symnxbhzf
	7sy2AhOhX70TO639RWVlojqPWMpx3PxMZfvtIQ289eNDT8TuEN64Cj2R2c2WesGCPsyTjWRugAS
	sQwjOkvRdjfPkJJR6t9N/04r4kn08OtP/QZ2tjmODrPjfJrLjzHF3sDuVIMQvBu2oTxsnk1MeBG
	LVEaVJPbKLms8qW7Ynbq8UYQUvo2MxmlcVj12PVfnqU+n4PoCajY71OOGdDyqFDFrC7jQX6b82y
	pHSC/hR9WVmNgwtS2k16hGMe0L0MBNrTDGrDbS1zgCqjBzLhhNIzmz4Acmgj2Yiv5GBHVB2rglK
	jF+ME5vxN4prIEaifVkssNp4PYu8ZPWzupQYp2CkVISQAkJnuefUEedUCYsC0bkzGt1wYSY3HkI
	p5+LlUE/je2HuXP4FwY5Ngk+5hXlrVtQHGLpVURtMLf3McpvOwcx2dX0og
X-Google-Smtp-Source: AGHT+IGJsYvkVPHVl4YsySoC+wJ4JVcxABMlE4WNGFwRYnS1d8dHW7grEMU5z3TWvRilCRfUOe1hIQ==
X-Received: by 2002:a05:6a20:958e:b0:33e:4b14:7e9 with SMTP id adf61e73a8af0-348cab83a05mr15446859637.22.1762164997007;
        Mon, 03 Nov 2025 02:16:37 -0800 (PST)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com. [209.85.210.171])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b93bf44e233sm9971416a12.34.2025.11.03.02.16.36
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 02:16:36 -0800 (PST)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7930132f59aso6005165b3a.0
        for <linux-sound@vger.kernel.org>; Mon, 03 Nov 2025 02:16:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWwoPDcbPvntIO/L2bpzYXPWhmHyRsJHip9QXsIfOzM3AyDKN9pR/BTB7EbudfD79bG5iBVToa5FrwefA==@vger.kernel.org
X-Received: by 2002:a05:6102:418d:b0:5db:f031:84ce with SMTP id
 ada2fe7eead31-5dbf031902dmr85155137.29.1762164587067; Mon, 03 Nov 2025
 02:09:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761588465.git.geert+renesas@glider.be> <97549838f28a1bb7861cfb42ee687f832942b13a.1761588465.git.geert+renesas@glider.be>
 <20251102104326.0f1db96a@jic23-huawei>
In-Reply-To: <20251102104326.0f1db96a@jic23-huawei>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 3 Nov 2025 11:09:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUkm2hxSW1yeKn8kZkSrosr8V-QTrHKSMkY2CPJ8UH_BQ@mail.gmail.com>
X-Gm-Features: AWmQ_bmxzzzgoIljXMDy5wJmHF15bg4ZKICGjY8c2_gWom3ME9XAPzMw0ghLXn4
Message-ID: <CAMuHMdUkm2hxSW1yeKn8kZkSrosr8V-QTrHKSMkY2CPJ8UH_BQ@mail.gmail.com>
Subject: Re: [PATCH -next v5 10/23] iio: imu: smi330: #undef
 field_{get,prep}() before definition
To: Jonathan Cameron <jic23@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	David Miller <davem@davemloft.net>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Crt Mori <cmo@melexis.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Jacky Huang <ychuang3@nuvoton.com>, 
	Shan-Chun Hung <schung@nuvoton.com>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
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

Hi Jonathan,

On Sun, 2 Nov 2025 at 11:43, Jonathan Cameron <jic23@kernel.org> wrote:
> On Mon, 27 Oct 2025 19:41:44 +0100
> Geert Uytterhoeven <geert+renesas@glider.be> wrote:
>
> > Prepare for the advent of globally available common field_get() and
> > field_prep() macros by undefining the symbols before defining local
> > variants.  This prevents redefinition warnings from the C preprocessor
> > when introducing the common macros later.
> >
> > Suggested-by: Yury Norov <yury.norov@gmail.com>
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> So this is going to make a mess of merging your series given this is
> queued up for next merge window.
>
> I can pick this one up perhaps and we loop back to the replacement of
> these in a future patch?  Or perhaps go instead with a rename
> of these two which is probably nicer in the intermediate state than
> undefs.

Renaming would mean a lot of churn.
Just picking up the #undef patch should be simple and safe? The
removal of the underf and redef can be done in the next cycle.
Thanks!

> > --- a/drivers/iio/imu/smi330/smi330_core.c
> > +++ b/drivers/iio/imu/smi330/smi330_core.c
> > @@ -68,7 +68,9 @@
> >  #define SMI330_SOFT_RESET_DELAY 2000
> >
> >  /* Non-constant mask variant of FIELD_GET() and FIELD_PREP() */
> > +#undef field_get
> >  #define field_get(_mask, _reg) (((_reg) & (_mask)) >> (ffs(_mask) - 1))
> > +#undef field_prep
> >  #define field_prep(_mask, _val) (((_val) << (ffs(_mask) - 1)) & (_mask))
> >
> >  #define SMI330_ACCEL_CHANNEL(_axis) {                                        \

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
