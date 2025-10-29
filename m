Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8488350D6B
	for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 14:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761748789; cv=none; b=i4QAVBvXCPhQUj//4O/B5NjGTmTMp2FBwzUAhMJkQrMU0cuWdnUmd248rtVW8epTEjnTb7ERQ7J9n48+X/T+Z6FCdLmJVkX8A0c8dciNXSrdC4aEW6IqMFobTSlx6tP4cV+ZYlnygOiGTqiRWu1Ij2wyHuIC+P823fl+/OMKtiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761748789; c=relaxed/simple;
	bh=FbqavNtq8VJC+dwAXLJIaCG9l+pt4WVO7NOuPi3OYaE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qUQsOJGY0T6eS7+X55RCnvgv4VV2hah6L/pJwPfwzVuD4PMPaR9V8P/aa2g7NCDd9lPY7cbU0L510f/6bTBS84YmmUx/HCtuHdRwQ26UmC0NJS1tH2V0oNHacDpVAvPfPUTIBCCis+hyvlaVMCFea/rxdvOL7cDX1hi+XmUsmDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-78f30dac856so84961586d6.2
        for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 07:39:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761748786; x=1762353586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kNDkhDDabcFgtYSzLRibzijDMaquJ035sDb5A+sIiAE=;
        b=jE6jxQuVNO0dBYlPJbtCWbwU23WiJuGvnRpq2PLJRD6pr2yyvkwW7cYXHgWbHoyePp
         5F/ns2Q4+i+ZHIPrFk9s2+TeOhPeibZ0BRU5VsMEmoLU7DXSVjC4VY9uNR7TdA35GIXK
         2nzAiW8o7YcbYdNIt9KrhBCLj/GmC9RLHLQa5UZTzkYh0vbaVfhQrEwvcKHwR3WG/J22
         AAiac1314OhEoEiP3SYrIocEx5qFlgAxTXpaKmNWYkMl9KUm5DINxkn5NgqpR0Vzu5ER
         VWYVUFBXFJ1BvNLhH3LB5fAKAoKjyrl5bTgTiip6ivtUVdhWcH0vSxcgV2zbWmf+hVpu
         A75A==
X-Forwarded-Encrypted: i=1; AJvYcCVFgQkeUskX2ouZB+gCNQZl9ZX9rb3+SOH5N1XGCzleZCggJB/yrmvOgH1QbjTeZrO0Q33YIw1twincWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTJawTytWtJsbcwe1mOPjOok6gE+28HCmreMJrRpYy0LKxAO/m
	4biGA37UaU2JdNibY5joTqME577hXCIn02Uv9tfgiNB5PZZN/5EmV60G2H+YZX8o
X-Gm-Gg: ASbGncvjMLUZ1c8w+1mOJOlWhb7CgPpbX3i32Ut1NU0eqnQkJfTWErYw62tt7t3aO8A
	sgIEYz3ACxrCa3q9S9QZilapWDgi9j4C7JQh8fzhJhnw5UoNcU6az0dPeA5PBFe6q3Kl5Fko4Pq
	Yc6Rzh/GRGSK1pa85spUoZ+7EDcPyGgtbVcFtARK42DYkeylxTXyDiRhPwqwifa3FCGD7CSoojX
	rh3j5/tYiKfdW8Z9/bPk0jcXhXIvCVowrFM3k+/Q2Pt86BdU1+eN5NrI70dBWJ8fz/bGu9RHxJV
	gqVOm+/yfjsWEaz0POMDAxgXW9EFg0M8B6O1UI60GZvS4j9EVjTgnrtTxfDGqOKxlPhX6S3fv8+
	/zKpDKmGk52Q4VHF8qBXJWI6Ndp7LFqOlQwu8D+hWf2p6jetB80P+V0FwhjGdX25unw9ZVe0Fg5
	kF4ZQavXDcQ29El812KpXMZtm0iSXcYfEdE8jK4Qe43wWHig==
X-Google-Smtp-Source: AGHT+IFvZvw5Uploc2OvFlUNEE2dqE90NtjX5bq4jy/GYAsdNYmaB9Rh/Be7cPPWKnMHkk6uxs02yg==
X-Received: by 2002:a05:6214:224c:b0:87c:2024:4d5c with SMTP id 6a1803df08f44-88009bc8604mr37753376d6.35.1761748786375;
        Wed, 29 Oct 2025 07:39:46 -0700 (PDT)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com. [209.85.222.171])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88013ea8d33sm7165626d6.13.2025.10.29.07.39.46
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 07:39:46 -0700 (PDT)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-88f2b29b651so740592785a.0
        for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 07:39:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUZmDBaP459L4U/j6StGAg704TODWRCNNNsITn1Ixrq6o3+XmNierunUiM6DxFoHOCrZdt+T8JJJ6syEQ==@vger.kernel.org
X-Received: by 2002:a05:6102:26d3:b0:5d6:156f:fedb with SMTP id
 ada2fe7eead31-5db90694687mr933346137.36.1761748440676; Wed, 29 Oct 2025
 07:34:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761588465.git.geert+renesas@glider.be> <03a492c8af84a41e47b33c9a974559805d070d8d.1761588465.git.geert+renesas@glider.be>
 <CACRpkda6ykSZ0k9q4ChBW5NuPZvmjVjH2LPxyp3RB-=fJLBPFg@mail.gmail.com> <aQIlB8KLhVuSqQvt@yury>
In-Reply-To: <aQIlB8KLhVuSqQvt@yury>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Oct 2025 15:33:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUTR2VnQ++j_ccUN3-GzKmSzS3H3QNyYqZNacfOBXD50Q@mail.gmail.com>
X-Gm-Features: AWmQ_blqiXGJheNiHtKi_cJSwq0gfFP8sAonrx_tsjN_f5pUMr0aiWqvAOsiPck
Message-ID: <CAMuHMdUTR2VnQ++j_ccUN3-GzKmSzS3H3QNyYqZNacfOBXD50Q@mail.gmail.com>
Subject: Re: [PATCH v5 07/23] pinctrl: ma35: #undef field_{get,prep}() before
 local definition
To: Yury Norov <yury.norov@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	David Miller <davem@davemloft.net>, Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, 
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
Content-Transfer-Encoding: quoted-printable

Hi Yury,

On Wed, 29 Oct 2025 at 15:30, Yury Norov <yury.norov@gmail.com> wrote:
> On Wed, Oct 29, 2025 at 03:19:45PM +0100, Linus Walleij wrote:
> > On Mon, Oct 27, 2025 at 7:43=E2=80=AFPM Geert Uytterhoeven
> > <geert+renesas@glider.be> wrote:
> > > Prepare for the advent of globally available common field_get() and
> > > field_prep() macros by undefining the symbols before defining local
> > > variants.  This prevents redefinition warnings from the C preprocesso=
r
> > > when introducing the common macros later.
> > >
> > > Suggested-by: Yury Norov <yury.norov@gmail.com>
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > Do you want me to just merge this patch to the pinctrl tree or do
> > you have other plans?
>
> There's a couple nits from Andy, and also a clang W=3D1 warning to
> address. So I think, v6 is needed.

Indeed....

> But overlall, the series is OK, and I'd like to take it in bitmaps
> branch as it's more related to bits rather than a particular
> subsystem.

OK, fine for me (if I can still get an immutable branch ;-)

Note that as of today there are two more to fix in next:
commit d21b4338159ff7d7 ("mtd: rawnand: sunxi: introduce ecc_mode_mask
in sunxi_nfc_caps") in next-20251029
commit 6fc2619af1eb6f59 ("mtd: rawnand: sunxi: rework pattern found
registers") in next-20251029

Thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
