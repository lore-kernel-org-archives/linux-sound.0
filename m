Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC46270ED2
	for <linux-sound@vger.kernel.org>; Fri,  7 Nov 2025 08:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762504825; cv=none; b=Uoym//WHlN5ABnFaHyv4jNAkgVSBv2ve1VejQJtkZKYQhWi93klpx1kru8oORvvUIUD4SA2XdsfbFSPwjhlzd8/iFmns5l/wsLQXI/DtZIaj3B8qOPqgQZcFk7yhuetqa11GiVMJ/7H+XYNIIYAQqjZ0KrTf+ua4pDNLEezJ3r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762504825; c=relaxed/simple;
	bh=9JcvPVILVy97hsdXJNb7VMxu6BBjGO1PhoJ8NRS9yLs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rwE7ZZpbg5uNfOAyfbqaaPrYsfC5X+oS8ywtCvxl46xedgRrTcqY9p4GMI0wmT6t7+/1znoD3DmqfLT9BbxfHXse5WPkbIqOkY+LCs+PzMRKui+T+NjK9h7Wp4ffZ1GDaMEHQlfkdJI1qBbt+cMJm7oBlekQryFJhBfi+lbyZJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5563c36f6d4so345597e0c.1
        for <linux-sound@vger.kernel.org>; Fri, 07 Nov 2025 00:40:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762504823; x=1763109623;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RsHZezS59+NExnNGIIdIy6ER8EF0CQG8kO0yNppcdcI=;
        b=fuR7gzIUEcHdyMn4yhvwuftpOIvmjkVMJm8JcdliYbtzhreYrbpEsoMQnJGY8UQEjS
         g70Q/E0kSxB78jzmqB6N8rCB4BJiJU7m3QeVvRcDNf7IRsXHZWozMdyVEZUgUhqSA5eM
         AIc3E1cP1kUIxMwEhgljz4IbbmKAZTnFN+8vUuExeFHt5HkNHbPdKj2w/mE+Dk3edJLB
         5lgbgzSd4cJRxG+bZoTIlxujJPi7YAIz5rvGjgPBidUmG4ip2IeGNAIWhnjJ8GPO0cTS
         2CpQ6v4aUXSuzyqG+rxNEyjplthQHLvM04Hn6zD6YF+UGjmqrHhC29teMiUDj1an0lWv
         15jw==
X-Forwarded-Encrypted: i=1; AJvYcCV5KKn1wgscc/clCtdPGZwP2n4KIoUsb2bb8ptir4UBkQgL0lhbWLzK6r//XcJSlAHGADIyNkmTC3xRWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVIla7HVY9b9bhNdZGLxzHMHehicpUuklSs/cC7DGYWqlDhzuN
	ScfhASQxJ5FhhP0PpM7gb24Dai24MVBhHmwHMuYnvG4a3NFC8oPucY46u+Rxb+goWvo=
X-Gm-Gg: ASbGncvJoWPncN6oArR7TBZ4AGsCYXQI8+KXzXw53LhhRuGf6UBg1gn6yPEnrozFzo3
	rDGjluUSVx4Vx3RAlsxHPzOonfLhOIWSxUkmgwbrntVBe1aEPXn4pC7t0JJUC2PWhBkVsXSBBLK
	pMd1qDvZvxOCGXI+z5l/yspjZ+2MZVU6o/7gNtFPdclqsKBMlXqKUUK88SaXA5XNFgltvEsTinT
	OzRJQYSyZub/3GT1rXgTMv4W+j3FStOvj8LCXJvzWCiPF2rT2AjwC4MqhBzdKGc9+MdecLIN514
	PeCUr9pVAKzB7aPCByvEYTsvNt3XoIZQWiX7mXaxUvNyns0F8axcGBFOdGpaxfbfLdldM9Sr3st
	7UOkAi4PYEr2VCPC/D/K3eLEtcR5wS4dPNs2XMDPU3NX+ATsDIeWToDbuS24gNDAGq/KsIxdpeD
	rYt2Ey370CmubcwH0eR9A6qAHHOlq1AIqLtar366NwCmktN3x6WXKs
X-Google-Smtp-Source: AGHT+IHTCfHHWFnbAGQ7mZRx8NUNp1dhzXPDKUPq+lTBLhDLoaldhbUv2NnnjkDyI0lLQ2GxBVHFEA==
X-Received: by 2002:a05:6122:a03:b0:559:6788:7b55 with SMTP id 71dfb90a1353d-559aae79b7bmr250893e0c.3.1762504822620;
        Fri, 07 Nov 2025 00:40:22 -0800 (PST)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-559958286c8sm2644372e0c.17.2025.11.07.00.40.22
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 00:40:22 -0800 (PST)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5598942c187so273039e0c.1
        for <linux-sound@vger.kernel.org>; Fri, 07 Nov 2025 00:40:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUAdZHOVXpCCy3VsdQ5f5w266Kg7Jofoh8cUw4Pq1vewbVJPxgLvgfjUlJsFCDzJC1WNEngdJ3RgEwoRg==@vger.kernel.org
X-Received: by 2002:a05:6102:4425:b0:5db:e32d:a3ff with SMTP id
 ada2fe7eead31-5ddb9e056aemr278996137.19.1762504514580; Fri, 07 Nov 2025
 00:35:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1762435376.git.geert+renesas@glider.be> <cfc32f8530d5c0d4a7fb33c482a4bf549f26ec24.1762435376.git.geert+renesas@glider.be>
 <aQy0T2vUINze_6_q@smile.fi.intel.com> <CAMuHMdXVUJq36GvNUQE8FnHsX+=1jG4GOJ_034r=fgr_Rw4Djg@mail.gmail.com>
 <aQzIIqNnTY41giH_@smile.fi.intel.com> <CAMuHMdW8ndAdGnSHopYFMWvw7wk7wKz_7+N91M1jRHoqK1KBrg@mail.gmail.com>
 <c62eb5a727f149fb9d8b4a4c8d77418a@realtek.com>
In-Reply-To: <c62eb5a727f149fb9d8b4a4c8d77418a@realtek.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 7 Nov 2025 09:35:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU3hWDOWXxuOJcBA7tphBT7X-0H+g0-oq0tZdKw+O5W3A@mail.gmail.com>
X-Gm-Features: AWmQ_bkZe8xF0tkRpW5gVlylkcfm2r3jZb2Xa1XdOQVS8F7wx8KXagIs6XSHJvI
Message-ID: <CAMuHMdU3hWDOWXxuOJcBA7tphBT7X-0H+g0-oq0tZdKw+O5W3A@mail.gmail.com>
Subject: Re: [PATCH v6 12/26] bitfield: Add less-checking __FIELD_{GET,PREP}()
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Yury Norov <yury.norov@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
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
	Jianping Shen <Jianping.Shen@de.bosch.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, 
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "qat-linux@intel.com" <qat-linux@intel.com>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, 
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, 
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, 
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	linux-wireless <linux-wireless@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Ping-Ke,

On Fri, 7 Nov 2025 at 02:16, Ping-Ke Shih <pkshih@realtek.com> wrote:
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > The extra checking in field_prep() in case the compiler can
> > determine that the mask is a constant already found a possible bug
> > in drivers/net/wireless/realtek/rtw89/core.c:rtw89_roc_end():
> >
> >     rtw89_write32_mask(rtwdev, reg, B_AX_RX_FLTR_CFG_MASK, rtwdev->hal.rx_fltr);
> >
> > drivers/net/wireless/realtek/rtw89/reg.h:
> >
> >     #define B_AX_RX_MPDU_MAX_LEN_MASK GENMASK(21, 16)
> >     #define B_AX_RX_FLTR_CFG_MASK ((u32)~B_AX_RX_MPDU_MAX_LEN_MASK)
> >
> > so it looks like B_AX_RX_FLTR_CFG_MASK is not the proper mask for
> > this operation...
>
> The purpose of the statements is to update values excluding bits of
> B_AX_RX_MPDU_MAX_LEN_MASK. The use of B_AX_RX_FLTR_CFG_MASK is tricky, but
> the operation is correct because bit 0 is set, so __ffs(mask) returns 0 in
> rtw89_write32_mask(). Then, operation looks like
>
>    orig = read(reg);
>    new = (orig & ~mask) | (data & mask);
>    write(new);

Thanks for your quick confirmation!
So the intention really is to clear bits 22-31, and write the rx_fltr
value to bits 0-15?

if the clearing is not needed, it would be better to use
#define B_AX_RX_FLTR_CFG_MASK GENMASK(15, 0)

If the clearing is needed, I still think it would be better to
change B_AX_RX_FLTR_CFG_MASK, and split the clearing off in a separate
operation, to make it more explicit and obvious for the casual reader.

> Since we don't use FIELD_{GET,PREP} macros with B_AX_RX_FLTR_CFG_MASK, how
> can you find the problem? Please guide us. Thanks.

I still have "[PATCH/RFC 17/17] rtw89: Use bitfield helpers"
https://lore.kernel.org/all/f7b81122f7596fa004188bfae68f25a68c2d2392.1637592133.git.geert+renesas@glider.be/
in my local tree, which started flagging the use of a discontiguous
mask with the improved checking in field_prep().

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
