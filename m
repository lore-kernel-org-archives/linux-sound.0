Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A22B2BFC85
	for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 14:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761748872; cv=none; b=GOoej2m+YNz12EVUYB23Jt/K79cLWPePYhtDp/T8Et2WSEAivb9KBiLKt+Ipwc7oJIqWgZga1lI781IgQt0IiH91GeaY9azteoAeQo+WiWL0QJ11nxLoEWlEWVGx4n2Y7WkFapO9StcuuhTuHU0vi1fjH906jch6XgyYpsbDUi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761748872; c=relaxed/simple;
	bh=QXFJ9Wye89l5k56IzhXHnCZ5vP4dVOGIaGxaTnibrdI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZuAfeRMF7ZTXB9uotk2MOBIytTyrDdvFt5xB5PTbOPxUJATq9QCRIScMxJrBq1UltczheSVFq+wxp218s5MVbMguG+UM+P1p+X0f47cJz0FNvToqBQsGQdcDiTe2ohE/hPaXh+Svp1Ae2D1A3mORvBYwXA/7VDDbVMmdlwm3nLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-8eafd5a7a23so734368241.1
        for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 07:41:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761748870; x=1762353670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ohi/8MFIs+pUNYTuSKDH5KUVpFMJO5wn0YyhdMa7QIc=;
        b=g4dN9KwUKF4GEutre9+3TWyfHDA+HN6Qm5B5+CU6hNfWrmx/qIdc+7spnZWp0jr2ae
         Qct/c5eiZcOozYDSAx3miGMe5CdGpiB89n4jGfLHtTZ2HHYCj2eC1Uig9S8B9sR4MqC5
         A58bmhErAw5SHXYP74AR1lyFlhoNo6h+bPZXP7jDLHJdFY2hihi1fIwpHj5kdDIjdusH
         dHJd9RtvC9to+fuR0vp3dcPR8dVHDu8/h00vQSrS7PaEADNGnzzg2yk76M4gYVshjCGi
         WWiVWN/reZ8IVWja84BeZnwaYXLQ5dCw2Hv4H2apy/1M5+9jJZtczyaEQwidYnNM1OAP
         syhw==
X-Forwarded-Encrypted: i=1; AJvYcCUi17k1dvESxlDCApci/dNFFysZ3C+GJiEreh89rVFKPGnmk20NyoMtNe8bjvPJYXYL70s5hJCs/vLklA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv3COBVbpCOhY03PwG+54XjHIzYY/ct9ZgutxlOmjBNG+lfb8+
	rz5XaCjLIYyIQ+lq49ObA+EOlkc4xeVj4MPJFjoyya9wTgwDuRW9rGwTCjqvmShd
X-Gm-Gg: ASbGncuqBpf701y32cm6uJWxcXtreM9cbNpzAZanxH1CJxO3JsoC1+sA4TohbX2KDoQ
	f9ydeDQS0Gbo8x94zlG/No0xbetNyAOsSBpcnctXe3svgr/m69H3uyG6nxkTJ/FSK45JvxmJjAH
	nkA6V4W107EA7hXGGrI4ue23h40MXlgc3nImAVOx9Bz6rAET99L0D+ianrIFkfuXsN+OyzvF7cE
	yXMOpImVNwGTF1jIMH8mKo7OgdDQK61fxz5jAs7BcRePhjm514meJy89eSsvtFhBxTRi1H7YX89
	OPi0U0og1uKpK/tv+ujlToDTyjUKk67ymYsx2HdvIPmBhfGwB0CKMgAbM+sAUi7UyFBtubJiBLJ
	UWAZVm3DTJRkbSmWoK5JJPjseTCtHtuGSQvnJ9xudJYTJbjw9riOH30FrmHKjkySMVQTMYdJsI/
	dS0IwJia7uGjKuJY4nhmLuYo2HaBVl9hIgZAaUGvry9VQ0kgyyKuLcjMRb
X-Google-Smtp-Source: AGHT+IFk2Q6drVI8vuDxwTTYfDg9+JvU6JEVkgHO4RAeMwlkwI5RDdMQbODLsvmZQ/HzROA6+Ge7tw==
X-Received: by 2002:a05:6102:3711:b0:5d7:de0a:bd3 with SMTP id ada2fe7eead31-5db8fbfc9cdmr1028770137.8.1761748869967;
        Wed, 29 Oct 2025 07:41:09 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5db4e521e0fsm5065708137.6.2025.10.29.07.41.09
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 07:41:09 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5563c36f6d4so1118769e0c.1
        for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 07:41:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWxlO8KSPE7t0nuILwfHsGJ3CDgm9/sEygd53L3TRPWhGj7K7855boHZlcKmY4hFD3XZ9LHVwmwL0hvjQ==@vger.kernel.org
X-Received: by 2002:a05:6102:2acd:b0:5db:9b88:1fec with SMTP id
 ada2fe7eead31-5db9b88219emr535412137.9.1761748503547; Wed, 29 Oct 2025
 07:35:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761588465.git.geert+renesas@glider.be> <ac3e718c5de6a23375055dd3c2e4ed6daf7542d5.1761588465.git.geert+renesas@glider.be>
 <CACRpkdYMv+R-NJ5R4+UyhK1+DJia0z72kZgt45+0eubXMuGpEw@mail.gmail.com>
In-Reply-To: <CACRpkdYMv+R-NJ5R4+UyhK1+DJia0z72kZgt45+0eubXMuGpEw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Oct 2025 15:34:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUvLH-8yNRoqBdTB+mcmOUedwVGpJ_HGdq8sqgLNB4dvw@mail.gmail.com>
X-Gm-Features: AWmQ_blZ8dUVr2aBwtWAAkAOaE93AtUSPNFDpslgvmXepFfW4tMWIOUWnRJkksY
Message-ID: <CAMuHMdUvLH-8yNRoqBdTB+mcmOUedwVGpJ_HGdq8sqgLNB4dvw@mail.gmail.com>
Subject: Re: [PATCH v5 18/23] pinctrl: ma35: Convert to common
 field_{get,prep}() helpers
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	David Miller <davem@davemloft.net>, Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Crt Mori <cmo@melexis.com>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Jacky Huang <ychuang3@nuvoton.com>, 
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
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Wed, 29 Oct 2025 at 15:21, Linus Walleij <linus.walleij@linaro.org> wrot=
e:
> On Mon, Oct 27, 2025 at 7:44=E2=80=AFPM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
>
> > Drop the driver-specific field_get() and field_prep() macros, in favor
> > of the globally available variants from <linux/bitfield.h>.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v5:
> >   - Extracted from "bitfield: Add non-constant field_{prep,get}()
> >     helpers".
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks!

> I guess this needs to go with the rest of the patches?

There is no hard requirement for that, but if 07/23 goes in, why not
include this one, too?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
