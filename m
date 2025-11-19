Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A594346A0F
	for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 10:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763548731; cv=none; b=gFl4jIBXEU0M20E1hh5a8LZwRJ6nzth4GPYzV5E+fL6BNAQNeAkhHwRWHe6kbYswsdQ3QuVJLbuFPAYs5dl1bOcZGiWw6iWrpE/GtZ/j11Kgdla2B05hxlFQpK4X2Uo/avVzP1oR4yXvh6J+uD+QQwMWXelwlhbjMNXNYVJTB3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763548731; c=relaxed/simple;
	bh=L7VgHgGI9r2tjhuEbwy2r1ej8K2QE/4okZ+9y9/KnFM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HAaKWl/PACWvj7kTecX1/QLmDBdcA7L87RFxrEnC6qzIRmB2Ojr/6y66Iw6vu6/+Kg21f2DjGSW2PpK46bPG1rI6x+j3t3n+qbQfQlVw+sIsHNRPO3/SzFVatuAbWbWM9eAT6SGW2PBtkMYj6RJNMLz3G1JCYqRo3QDaLP+L/kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=fvIFzPn8; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="fvIFzPn8"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-595825c8eb3so6550983e87.0
        for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 02:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763548727; x=1764153527; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L7VgHgGI9r2tjhuEbwy2r1ej8K2QE/4okZ+9y9/KnFM=;
        b=fvIFzPn8W4Ba1/PHiV7ZwGj8KE1DCXlzeG0bGNPfGR5PfnzTO6aMWLX7BG2yaTjhA6
         /GHWLUdzRhxJUoFn+Uu91elx0w7v60oybNdpMumr8xGlUnra8HksFUWBjy0UaotvZTI7
         y2aJuiE5nLICSA5tVSkgMEcj1rIX98iIJj05RdDVl0nuVRRdN6qEPZ5d8a6alwW1PQOD
         OXVgbq9joRHxpqblnQk/BTNGGe5QZTuk6Bal04OV1CxXgG75fY+JVoehDNo5Vh/fUWdq
         HMiml41bZsef+XDrCwj9WhkPPcuHdYgJSuusPRh//SegD9FgVzzJR0J8f2rbc7wdjNuC
         XfEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763548727; x=1764153527;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L7VgHgGI9r2tjhuEbwy2r1ej8K2QE/4okZ+9y9/KnFM=;
        b=LUIezyz/4wN7/Dm2BnzBu9uTwTWHFiVrcZM5OJexXtJJlFztac/ZF34J5aXPF/rKHH
         ztRqh+ntBaecxW6RHGM5LaYo/b6NZ/HRyPr1XUGLJa8u0ng0DYaWtKeSi4hvXfHe9z60
         iQSlPi3eOPIOBMmtsUYsP05pHQKl4pI8FWoBirZMteqdn2vWCa8JK6yGr8qXbwn/5iv7
         mQrLdlDlMvfhqcWFoS11RMtiNdx4Pjhu5t2WAZTKFFYkSi5xFKRugQdcFXFGrxAjWkj9
         QjHvWnG6tor5NAdliN4OhcUSoW9LLja7P9vwmKMQt56B/qu2SVEvmRIEkI1VcjGvmzsG
         F0XQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcj2ilXFlDWNmPoFBKLeAv3jOHlVW+pAILWKvikbUh+bmDM7Q2sGc6hjztIKWQj28opijTU9tNXOvXLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZVtdv58+rIMvL0mhS3qFbyr9j2VNLc0I4gk2ByidEe9X0CaYj
	ZGew2MBrWY71v+1anwUFATbVpaq9KDNlkOWZ/IIGX27QG2BlDdpM06DmMgtYjOp4om54WJoVVAK
	6DeLGy6K9+WqiqJ+2PyZ35zJSZQSHmyWhSyS3EOshDQ==
X-Gm-Gg: ASbGncvNA1rafdG+9TfX4RkucFHLNuufKtRL1uVuLxjpW38KigB75bMlQUfeF7ZkUu7
	jV91ZJqySyVoEipmIIMvrPkEJHA+1teKq7J7B0uTc9CQiBzutOsuSzyfapFg+29JSM+fCF0i/Wb
	k5qNU72mCiiIffmVMM9+gKneoMyUXVBGbiqgSLfh4JXG5X0eCFjg7+468RgmyJQy74pBoBYglJe
	u2vpSgFhpuQCyZ+TMh4PT0JzngbcHgBr2nLVCsBiODLHoCmOzLMmi99+bL+77h1uQRr5mNmke5I
	DoEVXIzIvZcKA0VS2Zt1Vzh2EU64Hrzicsmsqg==
X-Google-Smtp-Source: AGHT+IE74jzemY2YhU+PbF7yBA85kAHsHX4mJ4KqZ+2S4FXjqC72Dq3JqM65bbpoVibuwYHQgBzH97q1Jp9PeLxzN0k=
X-Received: by 2002:a05:6512:4017:b0:595:8350:5812 with SMTP id
 2adb3069b0e04-595842523e0mr5924629e87.36.1763548727365; Wed, 19 Nov 2025
 02:38:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251119-cs42l43-gpio-swnodes-v1-1-25996afebd97@linaro.org>
 <aR2OU4se7lxcMtGW@opensource.cirrus.com> <CAMRc=Mc==X3wERStdXmr5A9p0sPe7wdrPE4GZuqPLaKoBb9O9w@mail.gmail.com>
 <aR2Uo++k1NKkk2sj@opensource.cirrus.com>
In-Reply-To: <aR2Uo++k1NKkk2sj@opensource.cirrus.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 19 Nov 2025 11:38:35 +0100
X-Gm-Features: AWmQ_bl4kMdbPY0ybo97ugZVPgitgvbcQ_ZwJ9p6cLlBP2waz2ombgcLzQOoeDo
Message-ID: <CAMRc=MdFDAmqcJ3PMsTbeZUb9imM+fzHzQ_9mQ1T=syDoCcQJw@mail.gmail.com>
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

On Wed, Nov 19, 2025 at 10:58=E2=80=AFAM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
>
> > > > Hi Charles!
> > > >
> > > > Please give this a try. It's only build-tested so far. I hope I
> > > > understood correctly that it's the SPI driver that needs the "cs" G=
PIO
> > > > from the pinctrl.
> > >
> > > Unfortunately it fails with an -EBUSY on adding the MFD children.
> > > I will investigate a little more and report back.
> >
> > Does it fail in device_add_software_node() in MFD core? Is it possible
> > that the device already has a software node for some reason?
>
> Yeah it seems there is already a software node, although somewhat
> at a loss as to why, the only ones we add are inside the SPI
> driver. I will poke further and see if I can find out how it
> acquires that node.
>

Let me know if you figure it out, I'll submit a v2 that doesn't drop
the undefined swnode.

Bart
