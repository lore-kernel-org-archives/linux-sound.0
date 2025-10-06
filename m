Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5A22D8789
	for <linux-sound@vger.kernel.org>; Mon,  6 Oct 2025 16:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759767074; cv=none; b=hraQjhyhSoJj1Ng5zJgEfrRat3A4oXlr0wEvwDV40ERLnMQH7vX37CVnzdhNBYXyzhdgZbHXNj8qqSkwaD/vOAU65sbFWmES01arDq5cuz8+wIkZwHTwcmGeUUnppFV8Yiu26W5FFb4VGMHgAxvgnMN6kpOF1Lo5lM4DX1vOM60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759767074; c=relaxed/simple;
	bh=bAAmP6Vor3+frUWo9VM5DAgXz95oSL+3FrW7uk1ufUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tMfuE4gcuNme6k5bnFxIqgsqERj5PSDwfb98aNqgqXs5sQhmC8L0doKhym0IVYBv7Lt73KfVs8lFfK9HF0xhcCieR39sc7m2CeusJlHE2nUjW/oO24UUKq0+ULQ9iXJznZLjH4YcCnfSab5IDmstCJyEK/4Wu63buZGtmIwoODI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=VLrtECs6; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="VLrtECs6"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-36527ac0750so48836921fa.3
        for <linux-sound@vger.kernel.org>; Mon, 06 Oct 2025 09:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759767071; x=1760371871; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bAAmP6Vor3+frUWo9VM5DAgXz95oSL+3FrW7uk1ufUM=;
        b=VLrtECs6+aeEeZz+5cjvV6B/jGEJBVfEd/gTDAJD2K2FcF7e15k3LADejBcX6p7l0Y
         KrHQ10WvOU1U3EUD5RcMEz1+TNFrUT96t6wuLEOm0yM9HD5ZeC+Qbnq/dP94FHbyrUGt
         gfhhf9RCiTUsVzFIExZhtsKkDZl9osqBoiCb85qDZL2GVxeRfdDl7Q9rp9pjQAUsufYy
         g0exd8nmbboKMV/CVUjzM8ohVf4ACv63d0TDNGV7PweeyWSwQtX3Bf4ec3v81SXKkEe7
         OYNkWKFno8CxXi1kQuCtjz0uTO6mmN03TBYF2aBQjubIfGOmDZaZqLhIoW72Wc5q/mmL
         0/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759767071; x=1760371871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bAAmP6Vor3+frUWo9VM5DAgXz95oSL+3FrW7uk1ufUM=;
        b=TgRnWhujpK1HCoh+5pPK/oug/4x85GRJ4Tnhiv6wF7RAkW6BVpq7XArzzxBD1tGW1A
         mSTMrZr5HReg6zoK+GG1yQxYnHl0EPsP4WJvk/gDpKipipVpN7S55EEmcrpAXQgvwA16
         K6Lv2pnCLsoSBRvTCRRhNobnlLF2CqXJDI5mwOB1isoBdlj0XGsgq90GGddFXr38Mv1r
         hJY2wLNHuKHV52+I04FBVGSlpMkczyW+de2kbg4fSEClXJn+IR8w5MUFDfZnd429wv3T
         8wc2NZqAdxEtwc/gejyZLQlbDxSiXS5CX5OOEhP/WxO1z1Auz78kM5PJl4WnxtNU6oZ6
         EbzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGSR9O/lc7XCxLzRL2bqBFS1Fd7CL2OsHHfEnUJbhuMiNTG/pBuREz1n6XdFMDv5nBq0REyx43DbXmFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmHYC6XGb9gXiTfTsEDXyOFppVRgMm78QH9KmhryLZgMW45syR
	2cTxUmDllyhs3FIs0t1RJxc4awhEWJEwM+jEKd254G2IeMkJEKjl28DANxBPZu30dLBlj1lN2vR
	QJP0PF8h8o9Y6MQBbPZwef8apsslv7+nz/WoEOoXuDQ==
X-Gm-Gg: ASbGnct1c6Qex7DhLBv/buic1ZY6OIHAfHXI2bRo7nXXwVfyNLsMXwSzL4wd639xzQj
	Wa3WRJWWyldPGlLkImO84Twcn8pFpjEtyBr5sNuuobl58ihG1zGLBbyruLcoNo/owJCRF1LWZrF
	QeJwH4ARC0S28l5Y44lKwivAARyQ7b70boEfdZyus+MNj/R2g0WSio63HGPip9jKVi5PQKbONDr
	9EJie+VohUn4G0m6LGSKNyGt1ipzmWfdZfemGOgMLlS8w7ToGYX/+tHz1vlUTA=
X-Google-Smtp-Source: AGHT+IHQni+hoN/f23d0O8IX74fUFomrJ9gkJXQ0jq6YVPXYNOJtNrLGQEvHZJ8/WlypXR2ARa7kU4bjK03qJXmCeP8=
X-Received: by 2002:a2e:bcc6:0:b0:36e:35c8:3dc4 with SMTP id
 38308e7fff4ca-374c37fc6f8mr39619951fa.21.1759767070653; Mon, 06 Oct 2025
 09:11:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
 <hyzzrjn7jzo3tt3oyg7azijouawe3zopfjzq6zfhoo6e6z2m4t@ssl5vl4g557e> <zk4ea5cibrkp4vttuy4evrqybf76b3nop5lnyck4ws4nyf2yc4@ghj2eyswsoow>
In-Reply-To: <zk4ea5cibrkp4vttuy4evrqybf76b3nop5lnyck4ws4nyf2yc4@ghj2eyswsoow>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 6 Oct 2025 18:10:59 +0200
X-Gm-Features: AS18NWDSntYY-tS0LWjCm4WwdgxQdqQ5RgzeqJofTletfEADJXVbDbVNAU36cIY
Message-ID: <CAMRc=MdWmO4wvX6zpzN0-LZF1pF5Y2=sS8fBwr=CKMGWHg+shA@mail.gmail.com>
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <kees@kernel.org>, 
	Mika Westerberg <westeri@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 6, 2025 at 5:43=E2=80=AFPM Manivannan Sadhasivam <mani@kernel.o=
rg> wrote:
>
> On Wed, Sep 24, 2025 at 11:25:12AM -0700, Dmitry Torokhov wrote:
> > Hi Bartosz,
> >
> > >
> > > The practical use-case for this are the powerdown GPIOs shared by
> > > speakers on Qualcomm db845c platform, however I have also extensively
> > > tested it using gpio-virtuser on arm64 qemu with various DT
> > > configurations.
> >
> > How is this different from the existing gpio-backed regulator/supply?
> > IMO GPIOs are naturally exclusive-use resources (in cases when you need
> > to control them, not simply read their state), and when there is a need
> > to share them there are more appropriate abstractions that are built on
> > top of GPIOs...
> >
>
> Not always... For something like shared reset line, consumers request the=
 line
> as GPIO and expect gpiolib to do resource manangement.
>

They could use the reset API and it would implicitly create a virtual
device that requests the reset GPIO and controls its enable count.
Except that some devices also do a specific reset sequence with delays
etc. That would require some additional logic in reset-gpio.

Bart
