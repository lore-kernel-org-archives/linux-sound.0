Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2E533E348
	for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 11:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763550433; cv=none; b=opfYHM+j/cxpcN4czoqDlxtEYIQqGj77AP0GDG11SgRePVcgoWuHG05MHRn8ZBuLTGdF3IbJglJJ7dUu3rbaA+Dll8IS4/m1eborJD3QNT0QMmcpvz3FX5U7EXhBWICqz278cJuQbiLGQgtH6kWWPIoFUTSWVm63V+D1gUXbvsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763550433; c=relaxed/simple;
	bh=P/HSfm7kSgkKKxmOcuhjzFjQ52PiIf79mZIuv7+jXOM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NNBNAmnJfvCA+r+kfEKjMmYIx+vYqEvbDZbKA1Z97dCpIvHyjLp83BqPfKeV+K4mokTir/iVWoOsfEGwjhyPfjJpUEjLUDYQHU1TFpkSD/O2PmPCuQFzrCVZJQSB3heiRtxQKTMWzmanyWnhcfpp0izyGHAOq1O7RW5QbjypDjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=zp8rnUQG; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="zp8rnUQG"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-59447ca49afso8321451e87.1
        for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 03:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763550430; x=1764155230; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BAglYGE6ifGTtBz2S8pM9xkA97ILF6UPjp+08j6rklY=;
        b=zp8rnUQG6to/meegXrlYQM6x10vff5e4R4bEzfjbJyWKOcpyBynUOkY8UjyNNuAZPI
         9sHgJ2pmiKavGZePDrUmVhi7o0bE4kgEq79fn6lTdudbEeisPb+OgVd24bA+3Wb8ddBP
         KYS8GFDpqTbxSODBHi/+RfbmdgOR2O5/QbKDMxCs+rTE3hmsOFKiMLLQ2I3E/3w24JuL
         OTu3aFdrkL2gxR5WYUhY2vcq4UzqsDk7J2LYivSop/uCOrgpKl4sBG4U8tXGIASRpTgV
         1LTCiXRdA8zki9vqTr24fMY+iAbhrGczaZrhEwEVULQW9PzZQbemLUN96S2IDnKvbIqw
         KsIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763550430; x=1764155230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BAglYGE6ifGTtBz2S8pM9xkA97ILF6UPjp+08j6rklY=;
        b=qGJT9uc35xzftD7JkmAZCRU3oKYbdDjr4wscvhFTVRZiMbXJVWLZcuce/Jpi05m1jp
         Uh1Max+Mnx9l1yT3qAa1I3K0q52IUMyPIlivLKYnfCNm3nfLcSp2Ef2IZjDMaQ4krQUc
         OwDK97SeItwU+prM8CNGsnOCBQGPtNlZ552Jlx8HMuQD1TIghkouTO93WwiR8e9bcCfC
         6kFv40Bo8kqRgX7h5HEXjRnEWeUM7a7zFAirDmljcFOq/Wah8a8MIpohOFm9I4T97pUX
         VGmF/HzUgIfe3/4H45PqpI2xGYN5rb+/4QpYzy1nU804oHvTn8AFhbHYBd5CHTTDzLpM
         WGqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMAm9HRujwwJpQBJTO+tGs3xPyHQDw+aEeKqfoTAlgd0mB0sGUrfNZ2fyaRX+k9+3KBbindDtRpVorYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAj1TlZZGCcxbyD1NjBL3HkWs39d0QEDfcsF61vy5pWTBqYLs3
	PLRpTTGp7bem6HAIE0go/2lz0+VUsjxNn605IgA2wfHGuClfBanjNdu/AZoONawXlFioMPr3HiW
	9q78C5sGbZnXzZ6hUn8g+alk6x4/c3shyFPIYx2IADA==
X-Gm-Gg: ASbGncsJyurHD5YngZhUSImzPsnpLsdP9mbl5i6W8gseuQPJYFOFs8LoQh5QsFd3mOM
	y61FJ+sSvTgf3L9eADeyw/lVdBl7Kwz5RIa8EClqk26uTDH/UijIrm5vc0Ky0amDvP6gP2bnunA
	GHnN5e0WSwOzJx9UF7kda0GEVw8hzDOmHZSWv+OiraTH+fUU47HH2VdiqOFBSxC/f51c7aFxI7O
	5+oJrTbw0k/jRTRy5Lx3E+chbU0qVQiuuWTaEPwj38MEnFleGKZlHZFgQZZy6cZT0LrAA/ivt1G
	tQ4H6NF4NI2jKaJB3DGj4Ppc4Uk=
X-Google-Smtp-Source: AGHT+IHz1jfLeXX4cVuvQLHrboCDkU9Z/3wJ/aOh15NqEvgqPBK1kJhzlTN5go1fMOmrHzOvoCvAd8jNUnqKzCWd6rQ=
X-Received: by 2002:a05:6512:61cb:10b0:595:91dc:7289 with SMTP id
 2adb3069b0e04-59591dc7516mr3074895e87.9.1763550429550; Wed, 19 Nov 2025
 03:07:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251119-cs42l43-gpio-swnodes-v1-1-25996afebd97@linaro.org>
 <aR2OU4se7lxcMtGW@opensource.cirrus.com> <CAMRc=Mc==X3wERStdXmr5A9p0sPe7wdrPE4GZuqPLaKoBb9O9w@mail.gmail.com>
 <aR2Uo++k1NKkk2sj@opensource.cirrus.com> <CAMRc=MdFDAmqcJ3PMsTbeZUb9imM+fzHzQ_9mQ1T=syDoCcQJw@mail.gmail.com>
 <aR2gVzKhfN38MHAR@opensource.cirrus.com> <CAMRc=Mck8MiAm_nxY_L6Zw4cH-vYf24zSkPp=bhnUw68Q6FV=g@mail.gmail.com>
 <aR2i6lNNWEbQk0fx@smile.fi.intel.com>
In-Reply-To: <aR2i6lNNWEbQk0fx@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 19 Nov 2025 12:06:57 +0100
X-Gm-Features: AWmQ_bkondsqV9UsntdoN89OxecZ_AJb26WupJUBcE1O5C5776e2GNUo79GFsOA
Message-ID: <CAMRc=MdYcdrQSDWKDHrx4-Y4-y92AQqr73MoRC3ws-X==SL0MA@mail.gmail.com>
Subject: Re: [PATCH RFT/RFC] mfd: cs42l43: setup true links with software nodes
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Lee Jones <lee@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Linus Walleij <linus.walleij@linaro.org>, Maciej Strozek <mstrozek@opensource.cirrus.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
	linux-spi@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 11:58=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Nov 19, 2025 at 11:50:09AM +0100, Bartosz Golaszewski wrote:
> > On Wed, Nov 19, 2025 at 11:47=E2=80=AFAM Charles Keepax
> > <ckeepax@opensource.cirrus.com> wrote:
> > > On Wed, Nov 19, 2025 at 11:38:35AM +0100, Bartosz Golaszewski wrote:
>
> ...
>
> > > Cool, thanks for all your help here. Might take me a couple hours
> > > but I will get to the bottom of the EBUSY thing, and report back.
> >
> > Sure. Could you just post the stack trace down to where the EBUSY is
> > returned in drivers/base/swnode.c? I'd like to analyze the logic
> > myself too if that's not too much work for you.
>
>
> FWIW, there is also an interesting debug technique. Put in your driver wh=
ere
> you get this error code something like this (after all #include directive=
s):
>
> #undef EBUSY
> #define EBUSY __LINE__
>
> And then you get some error code which is line number in some C file. You=
 can
> narrow down grepping of the EBUSY in the suspected files and get the one.
>
>         git grep -n -w EBUSY -- ...files of interest...
>
> Hope this saves some minutes for you.
>

Charles confirmed he gets it from device_add_software_node(). I want
to know how we're getting there and how we could end up already having
a software node.

Bartosz
