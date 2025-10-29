Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12A22D29A9
	for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 14:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761749937; cv=none; b=ry7+cFbWYH9FjRsH6/gpeQIGvzrEVyl88RoL0QU4k2wA5lDHpG6l8OH3fFYu/4WMV3KKNosQRghAPFAyn3SHvBBqsbUKnXl3VsUMHnMmmNH8dFQ/3XfzICO5BFpf523n1NIYWpDgAOh9Ix/cbo5Xlhv4Y4zwqOflHwO+iPgvu3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761749937; c=relaxed/simple;
	bh=RiCdWEkCDNsJiKATmU0RbHd3Kb5B/0yb//UgjVnVdPE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rXIT7/S+1Gyojhsy6b6fJS4akbDhm4KL+nqoIYSE1daw+nXecZaILuwuE2Djbkyt+91qd239DVIa9ekYVKjyrAVi1Jik0OUtczZvlfwj4knXRfd5Vvn9rTu5m+CkdFASjgs8v/4uh05LpVshZvayeoOoTcHxl7Mp662wRMy3A0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-78e4056623fso15956d6.2
        for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 07:58:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761749934; x=1762354734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UmTxX9Lp/E6iQMSfd9sSFodFiE1yd68ZDUJdx86zE5s=;
        b=szos9BIyavM4hdRLDKyUKt7bbuwZBfGFBRSdB50n8rfIJl1oMBp6WwS1rWoLaHF6Wa
         H8ea+SBN2QmFV09QqAcEvV2tpbhUjkjfTXPHI14RFuQ6Ghz5Pwg9F2omEHMRRKWlfDxg
         2WUKQAthTOYJfUxuMt6O/V2cBUNtLkLV2NNq2Rfy14bcKN0tS23Scb+Xg07iYq0sAZW8
         Bnzw31MizNYVHkvu9QMLGaXzYI70zOowAGt6tHrAsmLEqHeEv/9kmeFfzxgJlu0nh6gw
         BdaRdF0w2odDostqMZfCXs92uJ61KWGXxJ9BRjjOtLT2daJZ6U6FmrsCxYpWaKmSgSPd
         fIzA==
X-Forwarded-Encrypted: i=1; AJvYcCVQfDx0X6b54saCuikEQ9A5x/GDhfEL3VVYB3B1/dZIlAuCETCssHGkWsBUX3geRfZGMK2roBAlyVX+/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzeDdTlqZNGEQ9cgEs5CjpX6IS5UvEaXoi6RWdMr7DAxkxctuJV
	/vCdXXqariGZqd7VpedYj++ltttTarVHhY5FNFjYaG2ANDec/gypx9j7mCQzDzYv
X-Gm-Gg: ASbGnctRRuBv4SzECH8a9hS/JDs+XMWUQRi0C7loC2AO1oCsfp53Ijf6kVj19pW99fe
	41Zxp/bvyAImiKxd/K/DdYmaWmA7GwCyNy19pqC16yF4Rk7hHH0TxfZtKEwX9xjKCtbyckLOCln
	7CtItIXPf/s2/0aVeCsWEXrdxJlgbhEFWOqREXkOa1QNj4HEgmP84KGD/PHnG9OiyYH1N/KMkPs
	6tRIDHDIRAeSeRezRW/Xl4gycNs4jcmBKyhIItnHZMB+ZlCYf7pHcrrbaaot9IAyr4WO6Ef0jje
	zHbltBL1VrRAmGxSU1Sdw8mIt1lNjQtL2R1a/2E49UMafWM8W7aRhKrxN/Xh0eH65bujunKD+va
	tmXtpIvqTbMJgryOwdVLtgeIp9z/RIDpsIYZGTO9XM5Vy7RHdVLcUa4oKv7W+FviZi9ACHVm9km
	OlEZPNwWgiI2a1rCQ3UaNlT7tGPztmTJ8AGxZE4zWmriSyD/jUVUC5UDKD
X-Google-Smtp-Source: AGHT+IEGarA3Bxehp37Byxkdm8XL8CVCDjV+YKOL53+WGIgH3juoTXhFj62kZlvNU2kLsojHnt3QTQ==
X-Received: by 2002:a05:6214:3285:b0:87c:20f1:359c with SMTP id 6a1803df08f44-88009ad5449mr34167456d6.11.1761749934089;
        Wed, 29 Oct 2025 07:58:54 -0700 (PDT)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com. [209.85.160.180])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87fc48cba39sm104197026d6.15.2025.10.29.07.58.53
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 07:58:53 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4eba124d189so54575981cf.2
        for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 07:58:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXFKDV1nEXgnYqdoC9ymYNwHdn0gotuCpTWi6m+aCq1GaU33ibJ6s7nmH+/3Wtx3KBeOBR5OXKdk2gx1A==@vger.kernel.org
X-Received: by 2002:a05:6102:3e95:b0:5db:38a1:213b with SMTP id
 ada2fe7eead31-5db90656011mr932905137.27.1761748238614; Wed, 29 Oct 2025
 07:30:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761588465.git.geert+renesas@glider.be> <03a492c8af84a41e47b33c9a974559805d070d8d.1761588465.git.geert+renesas@glider.be>
 <CACRpkda6ykSZ0k9q4ChBW5NuPZvmjVjH2LPxyp3RB-=fJLBPFg@mail.gmail.com>
In-Reply-To: <CACRpkda6ykSZ0k9q4ChBW5NuPZvmjVjH2LPxyp3RB-=fJLBPFg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Oct 2025 15:30:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWriu9eUHMSKcv7ojSqbquP3=z2oaquQZLx5nmN0EcGaA@mail.gmail.com>
X-Gm-Features: AWmQ_blleyKJMjc4oETFxToQhJJ0bdzSdD1fdMmRWAHt71coVgn8wIHcAFgDdM8
Message-ID: <CAMuHMdWriu9eUHMSKcv7ojSqbquP3=z2oaquQZLx5nmN0EcGaA@mail.gmail.com>
Subject: Re: [PATCH v5 07/23] pinctrl: ma35: #undef field_{get,prep}() before
 local definition
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

On Wed, 29 Oct 2025 at 15:20, Linus Walleij <linus.walleij@linaro.org> wrot=
e:
> On Mon, Oct 27, 2025 at 7:43=E2=80=AFPM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
>
> > Prepare for the advent of globally available common field_get() and
> > field_prep() macros by undefining the symbols before defining local
> > variants.  This prevents redefinition warnings from the C preprocessor
> > when introducing the common macros later.
> >
> > Suggested-by: Yury Norov <yury.norov@gmail.com>
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Do you want me to just merge this patch to the pinctrl tree or do
> you have other plans?

My plan (cfr. cover letter) was to take it myself, as this is a hard
dependency for 11/23.
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
