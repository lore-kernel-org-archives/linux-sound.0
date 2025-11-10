Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA1E2EB859
	for <linux-sound@vger.kernel.org>; Mon, 10 Nov 2025 09:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762765601; cv=none; b=CorrUYPJdZn9/HZEJ22KPOh+orjMTArgFeqR+r1ZoU0QCmfzdp/XpF4rAPNGpmDM0XHZgXDqZ9NMi8p2StaT8bP/uPoSOyzgTXu82OHcJi90iZOoBH0YTFDivIyJTafkCz585ETKoQr7QtkRUqfUbsDWfjRBozdF/N8K21BYjGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762765601; c=relaxed/simple;
	bh=JRmjklDdMnXYPa/YzcCMj4xR0iBgS1Ed7pmHd076aaU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NqFXc5JTS10XQgs3D+nsMvZjYO0dsMm2u5nF5pakt6W00arNy5bxDhqbmiG9r4Oii4VAJHJa4ERnn7mboMsX2py0VdojGsKQ1/17Nkz6lxems+bwVbOL9vNmWtUPq2/zOpfqI+h81BiXUa9ZOuvFbX3a8ocriwlMeKfZHn4tosU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b556284db11so2174837a12.0
        for <linux-sound@vger.kernel.org>; Mon, 10 Nov 2025 01:06:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762765600; x=1763370400;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zuaR1c68u39/qbD5w07qCJ9IxeheIz5/8CL8hB/l6OE=;
        b=Qt4rQmEs//SmKPTIjs7AGH+DlMex3R7i7ZxcvpTLLZR376d1vBdgh3NsgzF0KHAohx
         3gOg7F0TYAPcTeay+FPfVc8EznRJydj68nlZiGXPqjOrJqmTLMhMMIVFAxm12yZqjM1d
         V78Gl4PL8SUWobPJfkNg0QU7toAhAlWZnd0uE8EpL07GtrY5AtYs0UTc4Ac++oMljRI0
         oP55h/vTXDcyYS3L1N3IFp0sE1iogZcxTmSGnWmpRJtkffi5ruzIpJzMOaNbC/tTrGzX
         tSfebFGSVjZ3LjwUJG6crFf7imlLvOxJv+PCUGZg+7iMXA6O3Q4KYcmpLuwC4FTE/Pps
         iXTw==
X-Forwarded-Encrypted: i=1; AJvYcCWhhp3ZlbzbqXLtgpF9RrfOSuA1OcXHoDJSgNuHYSWJl2lZu34CTqJ6eXO4fh9anX2AkM4p1TZ81EP90Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyulS+WWPQYrrlAxprMPvqjBTkMmcX/eL30Rj6wvAAPJicN/ed9
	vuLCvc4FOQoGvuPlSpHA0eNGLe2phjeThyng0FVzHCbgWJj742059eBNsqcwbNJo
X-Gm-Gg: ASbGncvNLWhVt6AEXr/Z5Z4T8wAPl2EYP0bJOs/iOvctF/ca2LwBBWPnDQuXpviQAbF
	nYLgSa+Z38lBbGAK2UORFSq3KSjEzXF8PIVeg4GXFw1gUzEUmlpNpLwUhU3KHXxPDqCgkwJXK18
	1c722WkXSlVVcWJjebZ9js/T0uFFEnTlmIaH2jjdafmnfaj1DGhNgQKXzzP/odOOH0Xi809NjTR
	X5lqbgEGOpp+KSrg86yTWGe320XywLXvOKSbEfYI42uXsIKXt7Y++FVq+BiqUAQEbzYSUiyd7oP
	GeH80iRV2/NxFoNZN5lW8nC5IiLtcgVf+mzaKmGKgSJna+rajhgU9YVUKgRGYULQ2hoSHTbH9iw
	dmKNdrRvst3r8C+xR7vRAezWSv0jKWO4ogsuA3Io3z+BCkQbbk5xmVPoVpo9oQeiEb6rLB16S07
	9xM5y3oC1vexOZA167V/QWjytyOC9rtB4gKCrmcpcdccfzTSUpVOoIjdWU
X-Google-Smtp-Source: AGHT+IF4i2xOr8bDIZwM1EA3O4zt3kgYgArHL8BTlLQRDeYcEXtDtIOY0/R12o2F1DbsxrzZfLdngw==
X-Received: by 2002:a17:903:1b6e:b0:295:9db1:ff2b with SMTP id d9443c01a7336-297e57095b1mr103528825ad.57.1762765599518;
        Mon, 10 Nov 2025 01:06:39 -0800 (PST)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com. [209.85.210.173])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29650c5c72esm137196135ad.33.2025.11.10.01.06.39
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 01:06:39 -0800 (PST)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7aace33b75bso2896461b3a.1
        for <linux-sound@vger.kernel.org>; Mon, 10 Nov 2025 01:06:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVd71wuG+HJ2UEyC69dD3/EMkUaSPZ11owB93ysnvzmdiL5/lz+j7Wa06hpGPqeiLyr2U3kvhRkuasgSA==@vger.kernel.org
X-Received: by 2002:a05:6102:950:b0:5db:fb4c:3a89 with SMTP id
 ada2fe7eead31-5ddc471358fmr2304047137.19.1762765185596; Mon, 10 Nov 2025
 00:59:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761588465.git.geert+renesas@glider.be> <97549838f28a1bb7861cfb42ee687f832942b13a.1761588465.git.geert+renesas@glider.be>
 <20251102104326.0f1db96a@jic23-huawei> <CAMuHMdUkm2hxSW1yeKn8kZkSrosr8V-QTrHKSMkY2CPJ8UH_BQ@mail.gmail.com>
 <20251109125956.106c9a1a@jic23-huawei>
In-Reply-To: <20251109125956.106c9a1a@jic23-huawei>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Nov 2025 09:59:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX8c1VkBuPDpJ5mpCcRH+zEX4F1bQKFf_V8N9ZZtCYqxA@mail.gmail.com>
X-Gm-Features: AWmQ_bmD7LCstBufqr7pTwqKUhf3WnheTdaFZy-l1C13xKAmQ3xomq2Nqy5MxZo
Message-ID: <CAMuHMdX8c1VkBuPDpJ5mpCcRH+zEX4F1bQKFf_V8N9ZZtCYqxA@mail.gmail.com>
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

On Sun, 9 Nov 2025 at 14:01, Jonathan Cameron <jic23@kernel.org> wrote:
> On Mon, 3 Nov 2025 11:09:36 +0100
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Sun, 2 Nov 2025 at 11:43, Jonathan Cameron <jic23@kernel.org> wrote:
> > > On Mon, 27 Oct 2025 19:41:44 +0100
> > > Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> > >
> > > > Prepare for the advent of globally available common field_get() and
> > > > field_prep() macros by undefining the symbols before defining local
> > > > variants.  This prevents redefinition warnings from the C preprocessor
> > > > when introducing the common macros later.
> > > >
> > > > Suggested-by: Yury Norov <yury.norov@gmail.com>
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >
> > > So this is going to make a mess of merging your series given this is
> > > queued up for next merge window.
> > >
> > > I can pick this one up perhaps and we loop back to the replacement of
> > > these in a future patch?  Or perhaps go instead with a rename
> > > of these two which is probably nicer in the intermediate state than
> > > undefs.
> >
> > Renaming would mean a lot of churn.
> > Just picking up the #undef patch should be simple and safe? The
> > removal of the underf and redef can be done in the next cycle.
> > Thanks!
>
> Only 1 call of each of these in the driver, so churn is small either way.
>
> To avoid a bisection problem if your tree merges first I need to modify
> this stuff in the original patch or leave it for Linus to deal with as
> a merge conflict resolution which is mess I'd rather do without.

If you add the #undef, there won't be any bisection problem?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
