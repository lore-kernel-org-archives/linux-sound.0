Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CDD3126B2
	for <linux-sound@vger.kernel.org>; Thu, 20 Nov 2025 12:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763642010; cv=none; b=LfxNtpiWoBrVDmFiOTZrAfMqQq1yxzPzfoDYLuz0RE335yPJwSB/gzwEkEw2/pkru8fSTi+pkXM3OovN+G/qOJrntrt9wgNuTbUbJuIHX3NYUWuMhseNOwToFwTUH6zHlr4EsRpZqniF0t/Lu4G+vSNd2SPQQtegBim3/hGOlwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763642010; c=relaxed/simple;
	bh=9g2zA8FzAMTNkIHXZSnYTPmf3AmIIIUujAJL+eqWIEo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rMUKZ1DQBIRR6Pm5hNjEcyfxmcnLQv4ernfkwT9wGJrlby/evWwPFIB64OiK+dw30M+ZpxG8KFz1RADxsmTdTs/aqsE1CEkfsZDu5yB9wxPt8ZOktTeuhm7Gm/7SgL7FNKEIGus2aHnQZiB0iW/4lpTzRXt7NooCVuK4p4iNTJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=AgT6lVtj; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="AgT6lVtj"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-37b97e59520so5026881fa.2
        for <linux-sound@vger.kernel.org>; Thu, 20 Nov 2025 04:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763642007; x=1764246807; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9g2zA8FzAMTNkIHXZSnYTPmf3AmIIIUujAJL+eqWIEo=;
        b=AgT6lVtjZ//BVrYw6rMS1dDhGh07h00pC8tlxtWBiU2FzhptiaXPB5lAQqF5st6JrP
         oCFFE9Upsk5Ofw1I+rQxPtR0g2kEJzK15jkC7TDflllZ0FMzsAprHuvxQuWP4GcVMk7C
         p1R2OLKIxYJnld7EVTILlXXu58MAeeH2/QkfpLrCXF27N8QDL/0cKmU0Y3YxWY6yYqxT
         PoJQ/pT3gDPcpiPev46E0p5uUXghHO8GFskaUFoPZeUXPA7xuhDIRV/49lYVjnlEKrMe
         BAkSBDwElfU2nvtUt1wRVgQ1k76ms90rjrzfffq7V/TjIiWgJ5X0uSY7VHY41+/I9OO5
         EiDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763642007; x=1764246807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9g2zA8FzAMTNkIHXZSnYTPmf3AmIIIUujAJL+eqWIEo=;
        b=mXkJqxLyxjjzak3JjmMFau3sDBGOaa1cXX7pQxlxpgSL4QyzfgDQzgezkNWB9yUdId
         zALxHuV7cZbumBNm7gmTJCa2xEXxtwiAD/sJ0kmtXg6JHbYD3G4yM/IfNvNFSrBr2lZ/
         cVShM2lWOSyI9j+HIEVA8UY+V0elaPxElAslNGo7mAnTGovO/BDNrqXcc3NzHtMSdDZB
         nXF7ybnsQ4+SjMVb2VahrI4mJLu3fvaJAuMEtqFH+D7igb0TUJQpOEAdViOsaoPYP2m4
         09wEaw8a86CLpFspDJApI/asU5KZQGw2rWI7UWCwcrJSAUGjXZoQ+LebAQ8UUEDgHiwT
         u/Eg==
X-Forwarded-Encrypted: i=1; AJvYcCUUd0MHEX2ZX1T93V2CcqzcobjY4gcvWPSzxXFMvkrrTjCqk3gf2ss2A7rRtTWPJpYan89B4+dqupnFaw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8xkgdS6jhyhAqmIxeDNMjySOLopraIPpMcnaLGjwRk6JmrLSG
	9KK4LqxfMZcdzRF2taochFt6sjSDpyPBV5HTdDtXDyI86YdkqB/D50mxJnKRy/urmIvPmoWzNhX
	zeih4tbRo11PvNHK5SBAX8tWtpGbeas/bunw8dF642Q==
X-Gm-Gg: ASbGncvhv1gay8pBvPErgW/f3P7qifS68njTNO/t6ludkOka6XRL/u59StLYmZMrf6r
	7nT+/cxQXqsmhKgoGbsK+CNYOBSADZ9moiQnm0oSkv6ia9bJTkKHC2IpZnKNCAkTQhHhm6iGLX5
	cMJxUIk2NnL+LRT8R6NIVMAuLdx+G5kwdwbjpzouPOvdAp1Bvu29xu2f/pSCJfywKoo6/twASNp
	65IkfZvHjrSd3oEGPCGZaU/VCaC9oflec1wNS+YZrXlg8liqwm838Mk41I3q78+Kd+t6cbqg7PN
	VTvhSSHoLLqDvgDtqtyeGYGK0w==
X-Google-Smtp-Source: AGHT+IFs28MMNUgFYI3iSwLRyTE8I2EDvLITWgQ618U/qcnkqtpjTvDZRHT2IGmIN2LmnvUGv1JDHAZs/hwBATssw7g=
X-Received: by 2002:a2e:9790:0:b0:37b:aa93:613d with SMTP id
 38308e7fff4ca-37cc6752540mr7357131fa.12.1763642006713; Thu, 20 Nov 2025
 04:33:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aR29uKW7yLxws9jA@opensource.cirrus.com> <CAMRc=MdXNXQhE9zi=i0x0yGCi0fKQNU8_tn2_Uy24TAhxG7BRA@mail.gmail.com>
 <aR3FnUNO4DyCdiLD@opensource.cirrus.com> <CAMRc=MfuQSGPbt3x366j5c9Sg-mgu=TfmD6X25Dk5Rmu0JiiEw@mail.gmail.com>
 <CAHp75VdLfkcrmaGBPu_YLDReyX5Gvu9pE6BXweArA5PmM3MQnQ@mail.gmail.com>
 <CAMRc=Mf9djJ77ob8L1OKa6HHBx_JxR_sajWH1mFGz=V+hMDbmw@mail.gmail.com>
 <CAHp75Vf_+WzMn+pmwK4zhLEZtG3Uat4FrdFMCMtPmmX82E3Wzg@mail.gmail.com>
 <CAMRc=MdbgeJOMoHDm_z04ko1pdKed06GP4=M+VsPaD3YOEvs6Q@mail.gmail.com>
 <aR4qxiR7pzrPdaUz@smile.fi.intel.com> <CAMRc=Me-DXN9kx+5bqDb9doMG9MX2EiRJiC=_QqDc0q3gOz8wA@mail.gmail.com>
 <aR7luqqew3LRwFgn@smile.fi.intel.com>
In-Reply-To: <aR7luqqew3LRwFgn@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 20 Nov 2025 13:33:14 +0100
X-Gm-Features: AWmQ_blDoZPlIeJRmMuhollO_8xLtYrhOZeIHhTLu8BJ_wc62Lveu80O0CFrd44
Message-ID: <CAMRc=Mft8R9RjZhy39G60b2VRi7F2so-iUaARTj+MCgNx+qAqQ@mail.gmail.com>
Subject: Re: [PATCH RFT/RFC] mfd: cs42l43: setup true links with software nodes
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Lee Jones <lee@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Linus Walleij <linus.walleij@linaro.org>, Maciej Strozek <mstrozek@opensource.cirrus.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
	linux-spi@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 20, 2025 at 10:56=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> > Look at all the find_device_by_fwnode() functions we have everywhere.
>
> What do you mean, please?
>
> $ git grep -n -w find_device_by_fwnode | wc -l
> 0
>

I made up a placeholder name for all different variants of functions
finding devices of different types by fwnode.

> Even if you refer to *_find_device_by_fwnode(), still it's not everywhere=
,
> just in a dozen of modules.
>
> > The crux of the problem Charles identified is the fact that the
> > secondary fwnode is a field of struct fwnode_handle and not of a
> > struct device. This really doesn't make sense as we see where multiple
> > devices use a single "real" fwnode but want to have different
> > secondary software nodes.
> >
> > Moving the secondary fwnode to struct device would already help a lot
> > but if we're doing that then we may as well switch to a list of
> > fwnodes.
>
> They all should be an independent entity that can be part of the struct d=
evice
> but it's not obligatory relation ship.
>
> Again, device may have a backing fwnode, while fwnode might not have a st=
ruct
> device consumer.
>

I never said it must have one. Just that it's common and we do use this fac=
t.

Bart
