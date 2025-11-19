Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C498313E12
	for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 10:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763549425; cv=none; b=dKxwtOa4Fc5x8NecfjbLPOR8GwSOeui7/vfDznZpo7RjrokyKSU/QOslKnljYZR2ssI61x1Q399UC+YRMA2AOJXmtvBnVoGLLBZ9Brg12Bg+O0mj0BXD9BZv0zx230ET1GsheEZmTIlqBP8MqUaB0u/FwEvb67EWKEmmK6ICexo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763549425; c=relaxed/simple;
	bh=U0lZHlvs3oME19X+GdToGZ3Zc7DkUXF+0jdjnChjHjw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wv/WwumMFpELx/bms3NmwiUb4YT8iOxbK0zE0/m9ZLHzy2qaWm6wgxyPMx0v3kRYDKbUvh7ZNWMOf931rAB9x7ECZPr7EvZSE0ed8u91jhB1gPv7d81t+jszJuBbXMXLsUJZ5aD3BxiLCifAH6l5nhdN3UiWZTdHKXL7LrgEpTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bvq5utmD; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bvq5utmD"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-376466f1280so70879711fa.0
        for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 02:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763549421; x=1764154221; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U0lZHlvs3oME19X+GdToGZ3Zc7DkUXF+0jdjnChjHjw=;
        b=bvq5utmDa7MhpzW1p9Q6KeFOGDNo2Qr7zqGo3xi9aIFQ2eB8UZTZdApoHSKFl/CMiT
         bgEjzdTwEyX1dy4+vYBbIHVxeQIg0/eA3+a0Y8mcjlKhs0M5jqPzbZs6iefl9AcEaJ54
         NdDzvU/8qNp/Duw479IECpWA6gwEtobwMWwvcuT3/Fqm9zD0V1hrbhlObaXqrtx7W7gY
         TZLjWfCqg32xxlhBqhyb3Kl7tplfUJlVm7QH2ZkgiqNOUYgvqWEr97/7tsZBvzE3rqvP
         mzcrCQt/ZD1ESXp7slC75d3hht4sFez7VrFcCymcc1A5tJHnjGHpYex2Bula0uqMFq7h
         AS0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763549421; x=1764154221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U0lZHlvs3oME19X+GdToGZ3Zc7DkUXF+0jdjnChjHjw=;
        b=L18z0DTxyRtPg86a3lecBxyxof0i9qWa5XzrTAlDMRtCTS9riyluUFKlxUhw60Ky1a
         4lAirVdT3jifk0VYuJXbe4NB4UDi7g4KATT0BtGQ9L0UqEHFHVHv3RuJt4ejn5M+u6hk
         3jUlPZlnh4geQAMJXG8Wyp9nWxOpGwNvmgKfsXBjH/Ja1veGUdRGyNVBDPx9PrWNY+ll
         L4QLLWF6A1urePFGoqIG6mihjpnLeAspAPFgEMPndZij6HVQ0bwmtqGckvhvoLZnAXhD
         IxXKmRYQnMw8uPxh97aXkfcbzs9O968lpoCpu3NLnwh6YPSPXuDi+juWHEqreiRz4mVr
         0Fmg==
X-Forwarded-Encrypted: i=1; AJvYcCVVFHzwyyWteQbrYQgdJb4i1eKBT590pU1m0iFwE8vLbXAMFxrHRLzDF/RWzibuhWEQ+zM395FXyijbMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvHm/93mQasnsJqUrnCDFrrGQBShrspvDfy3tJqnnHJgP+MI3C
	ko1rVsCLENH3RB4VQq6gmlBOhAbDIB7gfP1aXSmKCsNkg2x23Vah5GkiUBfXEGOSL8N5pMIr/oR
	Fv82PbQLA5+w34YVn2MzYAwJzX/cV/n5W4SfksQP7fw==
X-Gm-Gg: ASbGncuSqg9nswuuCFKlP1nK/nfejv6WU5dD97vB6tF4tGV+yqqpAqB4VbHfrTuZwNL
	9sxwIHlTZe9k/nR/o5ibcEEsJHn9R3W/Gs1hoyMD0tHRLgGXl9g4mBVF8WvuRuKjarEBErlcjNI
	8OfXqo3SR7IAZhRqQ7iBIgL/Sy9P+o8R1ihgpKHShrJ3NdbZUWZswON3wC3SKGilOQM2tErHlja
	hfxPoRcllVTiUoX0QslvOhFdQeVFmNKcaA1Gi6iuQQJudo9ORBYNMfYU1ucTYyGVruMRu2KW4Ni
	8J4mdv6UoKdD4J7Zvjks+C0mCvFR52/MB/2vbA==
X-Google-Smtp-Source: AGHT+IEByHLYhcIgvSanSM8tMwvF105FUFtD4D9NsQtnkjRof8Zbe/aWwLqy0tr4Fha/zwWmFa6Qnbhq5TLc/JANodQ=
X-Received: by 2002:a05:6512:12c7:b0:594:5000:4554 with SMTP id
 2adb3069b0e04-59604e3fdecmr640459e87.28.1763549421090; Wed, 19 Nov 2025
 02:50:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251119-cs42l43-gpio-swnodes-v1-1-25996afebd97@linaro.org>
 <aR2OU4se7lxcMtGW@opensource.cirrus.com> <CAMRc=Mc==X3wERStdXmr5A9p0sPe7wdrPE4GZuqPLaKoBb9O9w@mail.gmail.com>
 <aR2Uo++k1NKkk2sj@opensource.cirrus.com> <CAMRc=MdFDAmqcJ3PMsTbeZUb9imM+fzHzQ_9mQ1T=syDoCcQJw@mail.gmail.com>
 <aR2gVzKhfN38MHAR@opensource.cirrus.com>
In-Reply-To: <aR2gVzKhfN38MHAR@opensource.cirrus.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 19 Nov 2025 11:50:09 +0100
X-Gm-Features: AWmQ_bkpCln6zgbAXW2XRzVuci8BzZrDY9oELMmEyUcWmMTFoqhHCwA947yCtA4
Message-ID: <CAMRc=Mck8MiAm_nxY_L6Zw4cH-vYf24zSkPp=bhnUw68Q6FV=g@mail.gmail.com>
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

On Wed, Nov 19, 2025 at 11:47=E2=80=AFAM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
>
> On Wed, Nov 19, 2025 at 11:38:35AM +0100, Bartosz Golaszewski wrote:
> > On Wed, Nov 19, 2025 at 10:58=E2=80=AFAM Charles Keepax
> > <ckeepax@opensource.cirrus.com> wrote:
> > >
> > > > > > Hi Charles!
> > > > > >
> > > > > > Please give this a try. It's only build-tested so far. I hope I
> > > > > > understood correctly that it's the SPI driver that needs the "c=
s" GPIO
> > > > > > from the pinctrl.
> > > > >
> > > > > Unfortunately it fails with an -EBUSY on adding the MFD children.
> > > > > I will investigate a little more and report back.
> > > >
> > > > Does it fail in device_add_software_node() in MFD core? Is it possi=
ble
> > > > that the device already has a software node for some reason?
> > >
> > > Yeah it seems there is already a software node, although somewhat
> > > at a loss as to why, the only ones we add are inside the SPI
> > > driver. I will poke further and see if I can find out how it
> > > acquires that node.
> > >
> >
> > Let me know if you figure it out, I'll submit a v2 that doesn't drop
> > the undefined swnode.
>
> Cool, thanks for all your help here. Might take me a couple hours
> but I will get to the bottom of the EBUSY thing, and report back.
>

Sure. Could you just post the stack trace down to where the EBUSY is
returned in drivers/base/swnode.c? I'd like to analyze the logic
myself too if that's not too much work for you.

Bart
