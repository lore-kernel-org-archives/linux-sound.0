Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119F3320CDF
	for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 10:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760698520; cv=none; b=UERKj0d9N/UzZpYyfQIHIuhRuvg2Gjw9O9jyKGC9f1J5lh6r+mPIuaDRd/cikIDTDifLdNrms0Un9E5BLsBaMXRtus/MA2pAt+T5hdcoYA/DKtZ/bdKc/jHF1e6yZLCCwZkunajPWiSC/vS+uuoLVKxFThpGfcTUN2t9WCnCfjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760698520; c=relaxed/simple;
	bh=7roeWK5AtO/7ZwDK0dlN3Uu9wiMocaa5toCTUlYqJaM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fpiEtXw3sKPvjO22LTc76DB9WVcw+AbDGA/1p8CGunSj2yD8iyknmG43bw1jlDWnPPrVTaSxx4pvHRF9MJlf7n5wFOcZWJvl3JMSHY/C6egUBopdHvwWlYZSmZORN0NT/p7z5Sgi64HZeTQE9d2zTvAdtqaiGdqutvgzn07XOZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-54aa5f70513so497074e0c.2
        for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 03:55:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760698516; x=1761303316;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zPE9WHNZsdRI3QmdRcH/wWeYzKksV+R5Ry8aWltKbjU=;
        b=wxPBwohJyxxnRifh2VtVUu1xpT6JL5j3qtX1V2hJBL4q1B+O1KXUMPabA66sJfeuoZ
         dsIdlgOwtq8x9yjhjHvhfLzvT+v+smOGxhuyc8blAVyrYYyaCTjFt0fgyaY9PvVDw4wN
         ZazHmsqRwtkj7O88vG5+9av3LRqbjJYZMyZEbUlxM279Vh6oE/74/XVW0a9PIzG+BFdK
         7b8o/Smg67n2eu7eAmqtG3HgIxTTC7RFMkfsUeogNTzJM98qQ44muOMnwp/TGNZUcFOs
         8sV9FVrRuMmwwoAN0kTlinK0fJW6S8QmDEQ3AIoA8AHWTMf2uG+5jnOr95HCCWzifH7P
         QvMw==
X-Forwarded-Encrypted: i=1; AJvYcCV2m3AvcLYGfNVmebcEWk0/rRrvcOwGgwlCpj4HC0In7VRqYOqsr6gSBqeRCzhi0rDS+wQ7vIbZxTOhdA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6bSa4KeW8mSNvXIZPWG1y0OmUUvVTbJoNGn2GxAR+DvpYyd2u
	9Wb2GDKvypSut50jSyYVQ3BKswKYeKKpWxT6xbCbyBjYWEsBBk+cS00yaGJ97kvQ
X-Gm-Gg: ASbGncsEVLps2PYZly9aQhsRT5ai3e64uzXOo2bFYENL7sx00/b7ngoJFzm1l5w++PQ
	RgxhQCHuiiDyAwxyJqZ246rpbn9B/gHK1lP+YFM2t2zzbQpfM+xFptLTxdV71GYWwSo9FbdxLmy
	zTi4xEvYOLzVgadfazLdW+IFySE4DtraICz7tJnk5Zt4udOQbA9keVVMLJsn9Tfnmeinb/UiazA
	CnOG+lOWKmxTVtxqZtgu4vsqp+DmjbwMl3h31Pv54AaJhWeNNgwe7e7vy4buFr2FGoaiK6ff5v1
	rJ+M5Cnqia/Pu/D4l24wpv8w0Yr134pd4Yobf4vNKfN7NloPQ2MX/vWziHwXFV6Nwk73ZCzJWXM
	PUEWq9laHUV17jMwtOOYK3QbXrXktclU4Plt+L818WLA4k+4/GCmmOZst57kJfwXULObqoB9d0M
	osRCw49bbJma4fmtxORbxbHd9CIe3xKkpbTa9xlA==
X-Google-Smtp-Source: AGHT+IFakjuHkBBntYKyw9Oka8+A6YXowE32gcVlg3zyHKyHXa3Ecocoqik3fCZYGL38qbPt8pP5ig==
X-Received: by 2002:a05:6122:3c89:b0:53f:7828:16c7 with SMTP id 71dfb90a1353d-5564eeebab2mr1243100e0c.15.1760698516451;
        Fri, 17 Oct 2025 03:55:16 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-554f37d2ea8sm5268029e0c.4.2025.10.17.03.55.13
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 03:55:14 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-580a1f1f187so701543137.1
        for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 03:55:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUf6dzxIb3AQMwThudXHd2rpQZXYH4MBE026FLbNFkFKubqmB7iSTmEDbzA8qK2vn3W54sdY4WStjIQ7w==@vger.kernel.org
X-Received: by 2002:a05:6102:5111:b0:5d5:f766:333e with SMTP id
 ada2fe7eead31-5d7dd5934demr1126362137.15.1760698513447; Fri, 17 Oct 2025
 03:55:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1739540679.git.geert+renesas@glider.be> <2d30e5ffe70ce35f952b7d497d2959391fbf0580.1739540679.git.geert+renesas@glider.be>
 <20250214073402.0129e259@kernel.org> <20250214164614.29bbc620@pumpkin>
In-Reply-To: <20250214164614.29bbc620@pumpkin>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Oct 2025 12:55:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXost7vL5uTocMGtrqhEk5AY3QUWvyP5w7_hBtf3MkMfA@mail.gmail.com>
X-Gm-Features: AS18NWAcP6voBjoIoEi-7RxJ0pdmzXqhfe5FdHBNP60R0y-DyUBofdEL44euygw
Message-ID: <CAMuHMdXost7vL5uTocMGtrqhEk5AY3QUWvyP5w7_hBtf3MkMfA@mail.gmail.com>
Subject: Re: [PATCH treewide v3 2/4] bitfield: Add non-constant
 field_{prep,get}() helpers
To: David Laight <david.laight.linux@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	David Miller <davem@davemloft.net>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Crt Mori <cmo@melexis.com>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Jacky Huang <ychuang3@nuvoton.com>, 
	Shan-Chun Hung <schung@nuvoton.com>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Alex Elder <elder@ieee.org>, 
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-crypto@vger.kernel.org, qat-linux@intel.com, linux-gpio@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, linux-iio@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Fri, 14 Feb 2025 at 17:46, David Laight <david.laight.linux@gmail.com> wrote:
> On Fri, 14 Feb 2025 07:34:02 -0800
> Jakub Kicinski <kuba@kernel.org> wrote:
> > On Fri, 14 Feb 2025 14:55:51 +0100 Geert Uytterhoeven wrote:
> > > The existing FIELD_{GET,PREP}() macros are limited to compile-time
> > > constants.  However, it is very common to prepare or extract bitfield
> > > elements where the bitfield mask is not a compile-time constant.
> > >
> > > To avoid this limitation, the AT91 clock driver and several other
> > > drivers already have their own non-const field_{prep,get}() macros.
> > > Make them available for general use by consolidating them in
> > > <linux/bitfield.h>, and improve them slightly:
> > >   1. Avoid evaluating macro parameters more than once,
> > >   2. Replace "ffs() - 1" by "__ffs()",
> > >   3. Support 64-bit use on 32-bit architectures.
> > >
> > > This is deliberately not merged into the existing FIELD_{GET,PREP}()
> > > macros, as people expressed the desire to keep stricter variants for
> > > increased safety, or for performance critical paths.
> >
> > I really really think that people should just use the static inline
> > helpers if the field is not constant. And we should do something like
> > below so that people can actually find them.
>
> Especially since you really don't want to be calling ffs() on variables.

It is not that bad, as most temporary architectures have an instruction
for that.

> Much better to have saved the low bit and field width/mask.

While that would allow some space saving (only 10 or 12 bits needed to
store low + width), gcc would generate quite some code to create the
mask (even on PowerPC, where I expected a single instruction would
do ;-).


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
