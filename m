Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEA031A04F
	for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 09:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763545248; cv=none; b=fy4Ji5oFNJ78CNsR/LzmBmEdyi4UqNecXZudVD7jzAbhWrcVISNagGR7Z8zwTynzzKaNLL1nHtsPUPwiAdsz01T7/EsTstsZ3Ac9VmSK3soIjWrUcpe6BoSpnnAOYC16gAT2pgpsgDs8EOSCnNtv3JIBbyiQ22y578+OJEib+qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763545248; c=relaxed/simple;
	bh=BJFj7wxxyKRZ51w2Row95Z4hdVR73BFZbsO74yruv8I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hiVZyTO5bmRCIHQbPOR2VzCJaKw064p+F2vsKXJO64csMTa9zSf/kc5I+Kd33IPLy6BSowOHTii9K0Di6BITjdYHmrn+9n/nEYtCybPdoXTPvk6HhL0NV67rg5vIqwaGwkhvgToAqwlCO/1MEZ1Qj2W4/gWukOGG1Z6sviMuUEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=pFBDWU7N; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="pFBDWU7N"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5957ac0efc2so7081049e87.1
        for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 01:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763545243; x=1764150043; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FBHgHrDZye5yPLQaEJga9ExMy8DO6FtO4ttyOjsB1yw=;
        b=pFBDWU7NVCoxsLoKcr6SRP7vUvaEnM/FjaNdOe83zehk8HT0HgZYlMXdmgxwjOCh80
         Eap6+6sLWbFcyVkwEADhTEOLV7rsfScjM5pA4OVlFxrXY6Bd9mQPqJN6gXCBhUSj7cnR
         LzgjvyIhi2jXcF1e6n3UMPT9qQpgQ28xy0t0qnNhWyZneO/tCGUQGkevZBlNmDXl/cSY
         x5UOpGHCqBS+HNo61uKbDOL9nSsUGyVl4ebifhrkGTC/it6FY7Zy+n9Sz6NArW/JWm4u
         9O/an81efoMy+5mp8rNpq7Uu6xhc7KCCiNC2R6F3vdAz0cobX3VvozyM4HunvdEkJ5Rw
         P8GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763545243; x=1764150043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FBHgHrDZye5yPLQaEJga9ExMy8DO6FtO4ttyOjsB1yw=;
        b=GyCzMxv6jpFKzWAx8wdrB5ltvyPkeWDF13PaQZXEXsY7kQZAKfdxkT43HbPD86zlMt
         /lPwcqmmQsAFV5QRZbVefuBVtEdkbE8mDkkmnpdkQenwisVoTGtdUCphWRPfb4KvnYiX
         ySWKPdIsW0JbfO55ZR0nkKIE9lFsMxsjm9X7jlE+WJ7r7d9dypHTgS7JiMTvZ7ZOlrwf
         CZ5Bc+8eJzmmtZP6zvSxKiAwEN41a2Telh6R+qX6Y/hF0pdIOkVPv1zQPkgvknD9u/G2
         HsJvWAzRbRbwtEggi8YsM1coqJBsW8cKNoMrZbZ5ZBWHzoVGB7NAQ/wbg9UQrBIA3+Rl
         7oHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZW3hXa9qQhUjJe3d4DIiKyjjVkB5K379zliZzdOGo3i8vRGmPY7l9vqUt0G6LUZgg77i+aGhFqn82jw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9xXswTIT8d0IrRfV9Wgtn9bEyaDSXmtervR1RHyfeYCwLG7P7
	IJmOzjxUoAN94NFsN1IvGtigv4nK+HqYMLCL43+SPdBAt2Iearp3BBzpb4ADPTO3bPYO6el+3CN
	SPEgxBJFGgOZT4V+GCHNCZoawr58XvyktImpXgGLS6A==
X-Gm-Gg: ASbGncvZRshCFTzNvcHIjPBSzNFK5wIdKs5aUfIdoCQUHTUY471mU0Xiyl/yxS49RWP
	XINBkJuktKlx35yP5c43PQJ+7hUx7JQZm2ds9I0JhuLeseRlkDUw99SI1Ns1x4p1m6pg4iTqR/9
	CU5UZCFVaCicy4zbPcfKNFZNYVGUn3ONRBZooT6ucKdY9AGGANeu6YEE3lyDaYzkcN1PaFktVFZ
	cTln32nnM5Syoz6cnCd4eLClW4dFSE03NOk9TFn7vAYwWvZLnvenSYabrM4AUT7rHJWGmTpp71h
	e9CX5ew8WH+IUCRRTj7NWBHSOdw=
X-Google-Smtp-Source: AGHT+IEGoO3fL0ecZ1AY8GUBLT25Sn8bHTlHf1SBOYk9VDf5XPqET34r8wc2V4tfWXPa8mxDUa00tpV4/1tvjo49G/Y=
X-Received: by 2002:a05:6512:31d3:b0:594:2654:5e3f with SMTP id
 2adb3069b0e04-5960382ed4bmr753172e87.12.1763545243378; Wed, 19 Nov 2025
 01:40:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251119-cs42l43-gpio-swnodes-v1-1-25996afebd97@linaro.org> <aR2OU4se7lxcMtGW@opensource.cirrus.com>
In-Reply-To: <aR2OU4se7lxcMtGW@opensource.cirrus.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 19 Nov 2025 10:40:30 +0100
X-Gm-Features: AWmQ_bmv6FTo3b-CGfQ-DjpMx9N6kq87b-YAvaUrmBKqhWvA5NQ7Ya0H7RtNhs0
Message-ID: <CAMRc=Mc==X3wERStdXmr5A9p0sPe7wdrPE4GZuqPLaKoBb9O9w@mail.gmail.com>
Subject: Re: [PATCH RFT/RFC] mfd: cs42l43: setup true links with software nodes
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Linus Walleij <linus.walleij@linaro.org>, Maciej Strozek <mstrozek@opensource.cirrus.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
	linux-spi@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 10:31=E2=80=AFAM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
>
> On Wed, Nov 19, 2025 at 10:10:24AM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Currently the SPI driver sets up a software node rerefencing the GPIO
> > controller exposing the chip-select GPIO but this node never gets
> > attached to the actual GPIO provider. The lookup uses the weird way GPI=
O
> > core performs the software node lookup by the swnode's name. We want to
> > switch to a true firmware node lookup so the actual link must exist.
> > Move the configuration to the MFD core and connect the SPI and pinctrl
> > sub-devices with software node references.
> >
> > Fixes: 439fbc97502a ("spi: cs42l43: Add bridged cs35l56 amplifiers")
> > Reported-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > Closes: https://lore.kernel.org/all/aRyf7qDdHKABppP8@opensource.cirrus.=
com/
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> > Hi Charles!
> >
> > Please give this a try. It's only build-tested so far. I hope I
> > understood correctly that it's the SPI driver that needs the "cs" GPIO
> > from the pinctrl.
>
> Unfortunately it fails with an -EBUSY on adding the MFD children.
> I will investigate a little more and report back.
>

Does it fail in device_add_software_node() in MFD core? Is it possible
that the device already has a software node for some reason?

> > +static const struct software_node cs42l43_gpiochip_swnode =3D {
> > +     .name =3D "cs42l43-pinctrl",
> > +};
> > +
> > +static const struct property_entry cs42l43_cs_props[] =3D {
> > +     PROPERTY_ENTRY_GPIO("cs-gpios", &cs42l43_gpiochip_swnode, 0, GPIO=
_ACTIVE_LOW),
> > +     { }
> > +};
>
> This drops the undefined node, that is important as it lets the
> SPI core know that device is using an internal chip select rather
> than a GPIO.
>

I really dislike the whole concept of this undefined software node.
This driver is literally the only user and I'd love to just get rid of
it. HOW exactly does it let the driver know to use internal chip
select? Can we do it differently?

> > +static const struct software_node cs42l43_spi_swnode =3D {
> > +     .properties =3D cs42l43_cs_props,
> > +};
> > +
> >  static const struct mfd_cell cs42l43_devs[] =3D {
> > -     { .name =3D "cs42l43-pinctrl", },
> > -     { .name =3D "cs42l43-spi", },
> > +     {
> > +             .name =3D "cs42l43-pinctrl",
> > +             .swnode =3D &cs42l43_gpiochip_swnode,
> > +     },
> > +     {
> > +             .name =3D "cs42l43-spi",
> > +             .swnode =3D &cs42l43_spi_swnode,
>
> I will need to think about this a little more but I suspect this
> no longer being conditional on the magic ACPI properties could
> cause issues if a system was to use the SPI controller more
> traditionally and actually have CS GPIOs in the firmware.
> Although maybe that real node would take preference over the
> swnode?
>

The lookup goes to the primary firmware node first, it would typically
be DT or ACPI node. Then if no match, it will go to the secondary
node.

Bart
