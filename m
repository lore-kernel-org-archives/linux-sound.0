Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794299840;
	b=y5N2sX2iUEy0llJ8cwa3jJ9IrwI8M9dkoLroj88ntNQdu5VB4UCuDau7m5gDZdoH4J72
	 GQJJDDUu+AP3p18lyHZvktK6V+b5DPuWr7RG8ZfUjNfvD0/iOia1m2oqUGXq54AQYdWon
	 UTqEakbeANADNY4edqz4B6M6n+sY02gdyePW5BFHnuMxyGxOefrqlcnydMLfD6Vlq5c57
	 AwqMQhEKQCZ9LQPXIbGgDKpyFg9R1R600VJSMph556ivmlZe+fVCv4XsucKIV0pRFAmNI
	 XaqDFB1vYcLfhhjNrRaUL2tyXiXHFe4LlOZ7jSA2fKi3R7GxjFtAUyHTrWqgDdyUt8A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794299840;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=Z6zw3+1HuXwtuP48Ul74ZlZzk1bdeGryK1LmBRYGOxE=;
	b=qGRU+sbzkvi6oBxqiUoozIS6RXX2ZbF29ER2zT3ySaStC5zKF/pv4nEuVrgzM7UFfUws
	 QlB8g+7zzdkQ0dnTrp+x6UJv2JliaEcslYBK632OVYT4we9fLLJYXq+spiCqqCfR2yXhX
	 QxZv6I9dpjjBa4rTY+1B11TEYoS8m7IOt68MjDYuIT1POZeHMhxHcTLo0HBrlRUDW+rWS
	 T5nT3UvHWapwLoFgpJNJER94lATXX1XkMlzFva7jPtd/kQHHxoBWTAJXZDSSmOIdgplWJ
	 c2OdmcplhFEMXJDDvS7qRafRwgh4G2EaKZU24fBReRY69W3gGBWH9FKGRtYFyhDbI6A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zgNUW4rR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.177
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53419606A321
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 08:37:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53419606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zgNUW4rR
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3ab1bb9666aso1191471fa.3
        for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 00:37:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794299838; cv=none;
        d=google.com; s=arc-20260327;
        b=c5g+5GXef2R6g8yMX/rmo3HEYqA7CZCO4iIXZbVpRh/+ktjipA5zU4v4b3vZRmkpTJ
         O/u60HB2V2W/0mcVSQCYW7Nqv0v66O6pcXHfjA1zr8D5h02WbfxAa8knCbzInRzaNQu2
         aqY523GYXNk8rvZuiqJi1gf7LTTr39yIyxtLZIXyDO7KUPKB1d3L54BZkS+9jebgUAIr
         0yk6AB8xpasCLSPIPUXE493fSXkR1pEPAnMm2EcqtZ1jo0mKiSfKYYccNYjrkAufALS1
         aUxI242rp3WRhReUtt3BTzOL8k6quEKQAtG3KTUrf52/T21XI91p9O9XB0Hts62hmdgq
         UURg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z6zw3+1HuXwtuP48Ul74ZlZzk1bdeGryK1LmBRYGOxE=;
        fh=j7qE0RlvzNR5Qm6xA4ehUDBqPqcz09gsE3Wa6zaxdUU=;
        b=BdVc/4Xve7foTDoezg1iHw6l6HN87x+nnAZ2+at/QhYkgVXFbATq5xIzKxFGOBT40u
         YcjCXqzP+Re6QtI5CCsVy06zNLbbBTBNyqUkdwhrxHA6Wn4Sb/EeO+1uY/armpEemZwc
         nKJxMqeSIbomtZ+Q2YGenpIKZnKQlm2miKSVBVLtrjSgSmyXKsnaNXJBicZbKc8ApZki
         fOVmRGqjGYd28EeodQ4omI68s1oLJI3BVkxdPsrdQ6nN7gVbFkvM7uMZEiAg/OekqPL0
         mNP35jNrFaY7wNmjUjxF1mrcoK7NeIfKkhC3mN7K95vw4e2OGLiyRKw2RcK4542yIAqY
         mVfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794299838; x=1794904638; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z6zw3+1HuXwtuP48Ul74ZlZzk1bdeGryK1LmBRYGOxE=;
        b=zgNUW4rRP3LhPTVYA+9A6VZ13BcsDxx+NRqeK2Hi3NAGGbkF2cvhSNgb/Xfzv3hoJK
         2Go4tyQRaQ5m0oX0hrscJmSzHxrB765lY+6Sm1mii9QsJjM6j54CrT3bK7RvSajmbHaF
         B6fzKGb5W3meafJDq29EuBTr8CcJcCbIZmua85sa06EaCF1mnILS4ftw+B+IVPsRV8QC
         4dTPnxakNtTKQlAppfnDEcUK3GBiQQZs7g5Vm87bI15jJ2O39zQtBjqc3dXeBeTfMMun
         WRh7jS52ShvTUunSzYCgWJ6jb1JMxutigvNHazWYkRGQp4EfQj1v9RR16acHbRhaUr/M
         tJFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794299838; x=1794904638;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z6zw3+1HuXwtuP48Ul74ZlZzk1bdeGryK1LmBRYGOxE=;
        b=d0z8mLbr/N3IcQHDZAxEUAX7UnSQj1Uw5IE5KIAhTZoFJaJ50c4rhUVZW6eRwW63pi
         5lacTL7LHggZqwQFABwbcHDxyx22HuIMiuu/vvpYFnsvasdZ0/FBhWgNyMZGyP1MfByU
         5vioPNDC54XI7Ie6S9bKNNAkprfn60lsmx/JgAcd0oLORGqviDdGXk49ibi2wSgx8Cb+
         6qkX1J3CyLydelhqOVnCh1rJRXDdlUn7KHK2MYedVSR8NGhcjQQY02tGFaGpSpCGzkwp
         YUDgHERmw1OnhyP/KSydrbsQg5ttUWaFnCjTVIi8rEiIHYAMQMjtimCAMAC6Eh08fKel
         yZ5w==
X-Gm-Message-State: APuU4Z95d9raIPjHYxa/R+jtMX+RwPSFoMBjPsv6r5MobCLh8VyENUTp
	wR9vQnFbEApyioEstPnVgxj22TXfNUl0dyw24ytaw1tLe58pvxTd2/4fgUdZBZvRFqNCQpvKCMY
	Rh6zolSwXXE6TyzQ0Cthow21JHluXcPg=
X-Gm-Gg: AYBFou0cjmzQeB71mnriX5E3mi5jEL8cynoI2UkRWv9g5ghM56tnKAv0bS349Sg4AtF
	noJBWzoWMhUq/pKgK43DCGU6S5JI1b56tReJ4ZURAp72tZlL4RogQ6KIFIuhJRtUF2rgk4Z8T8u
	IyoH4a4PS3TSiDRr1iYvCEansRlieqij4KDkrTdAzdHdbcVNlkklyhcuok0IhITejZCDvIj5qxE
	8RG0eEaUSJ9cTmG1yYWwlRXHNhs6evbTFp9FhqXNDwA82BSpxgZjlz3xHvsE3esk8hLmINbE1ts
	UbbrETyIc0Oe32/uxZjGWAjI9zInXoCHfsprJY1jvMkUB4YKmQLLNdeKK6kauGTsQqZBR0yax0x
	QV/K5fEYkxRn8IB5HjM+3E7sNEWhZNkGhJLAkcyuO1dh9YZkU17jXC/qdQgFxqOVCEU3AQKY=
X-Received: by 2002:a05:6512:239f:b0:5bf:b65b:8598 with SMTP id
 2adb3069b0e04-5c156e8dad7mr661174e87.3.1794299838210; Tue, 10 Nov 2026
 00:37:18 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-asoc-rockchip-i2s-tdm-v1-0-f32951b3c527@gmail.com>
 <20261110-asoc-rockchip-i2s-tdm-v1-2-f32951b3c527@gmail.com> <sashiko-outbox-206522@kernel.org>
In-Reply-To: <sashiko-outbox-206522@kernel.org>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Tue, 10 Nov 2026 00:37:07 -0800
X-Gm-Features: AclHuK9fgDottRGq0OBgRPNaGUeWys7ogEQYUnfi9xyPTiQ9XcrQxs1Y7tDt7BI
Message-ID: <CAEy9hNXtOjRqT5q9mc+gaFX8f7KumwhvLtq1N=48ZOU+JAMHfA@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: rockchip: i2s-tdm: add the reset value of XFER
 to the regmap defaults
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Should this include a Fixes: tag so stable trees can pick it up?

Yes, thanks: the regmap warning is printed since the 7.0 cycle, so
stable trees from there on show it.

Fixes: 081068fd6414 ("ASoC: rockchip: add support for i2s-tdm controller")

Arun


On Mon, Nov 9, 2026 at 11:36=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] ASoC: rockchip: i2s-tdm: missing Fixes trailer for I2S_XFER
>   reg_default
> --
>
> commit fcc3b955539c797b954dd2c22348b8e552e615ec
> Author: Arun Iyengar <aiyengar1990@gmail.com>
>
> > ASoC: rockchip: i2s-tdm: add the reset value of XFER to the regmap defa=
ults
> >
> > I2S_XFER (0x1c) is writeable and not volatile, so it is cached, but it
> > has no entry in rockchip_i2s_tdm_reg_defaults[]. The flat cache then
> > treats it as uninitialised, and the first cached access of it -- the
> > regmap_update_bits() in the trigger and stop paths, or regcache_sync()
> > after a runtime suspend -- warns
> >
> >   rockchip-i2s-tdm fddf0000.i2s: using zero-initialized flat cache, thi=
s may cause unexpected behavior
> >
> > It is the only cached register without a default: TXFIFOLR, INTSR, CLR,
> > TXDR, RXDR and RXFIFOLR are volatile and all other registers have one.
> >
> > Add XFER with its reset value of 0 (TX and RX stopped), which is also
> > what the zero-initialised cache assumed so far, so no register value
> > written to the hardware changes.
> >
> > Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
>
> [Severity: Low]
> Since I2S_XFER (0x1c) was omitted from rockchip_i2s_tdm_reg_defaults[]
> when the driver was added, should this include a Fixes: tag so stable
> trees can pick it up?
>
>   Fixes: 081068fd6414 ("ASoC: rockchip: add support for i2s-tdm controlle=
r")
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-asoc-roc=
kchip-i2s-tdm-v1-0-f32951b3c527@gmail.com?part=3D2
