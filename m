Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349A22E0B5D
	for <linux-sound@vger.kernel.org>; Tue,  7 Oct 2025 13:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759843312; cv=none; b=qt2+r7zgjw1JtxR27aeShPV8cdbVtvsJeZA11n4p6yGcjoZ5hnt3vaDtkzp76EvOoUGo3UPkS7dj9Pue3Zqg1AncgEoF/0iVPhK8wJCIK7DV/b9Gk73q7ZN6vFrVNxvPzEFebfo/oIhWuoT/mF/+6s3y/tPIKufN/rgOfwG4NA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759843312; c=relaxed/simple;
	bh=264X1qDN3aQAP8Oh7tuky79CRF6X9B+bbwWZ9c7oerg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fHIQmlgTWmdSwyZZjRF/BuLKBjt11XpV1FY0L9vSQ11Tha2XOXd0lemXcuSsmUBMRhAKkQmimalgnbzc/i7zRJzP6v9/p5fEagIuLYC/jYwNM56w/AF1PI7wBtLjO7R8NHT2yPNa0RV62eZbLuouHqOQQ6RSWjrwIV0ViMaDLrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=DKBRTvtc; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="DKBRTvtc"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3682ac7f33fso67059441fa.0
        for <linux-sound@vger.kernel.org>; Tue, 07 Oct 2025 06:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759843309; x=1760448109; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=264X1qDN3aQAP8Oh7tuky79CRF6X9B+bbwWZ9c7oerg=;
        b=DKBRTvtcDoAdupeGLvdKBjxsZOnuPORThx375SEX3c94jfX6Pffhx5xH3YCdcUktDk
         8RtUgM4um/ZK/GRKugStNQkcV3NNh6+H4BhAdOqnnQ7MhWjaMligFBl6ArCo5HL+tODJ
         LphZpd4ve9qyEq0Mo+b1iID54E/1c21MHj0Urpfj6/yjhpa0+RL401EJHDwmg8+/vn5E
         KI05vXBgHusbGxk4mg6mf3W1JfiPIYmeDiT/Gd0N7DLhtLB0G6M1PZFl2ORfAIClUN0H
         URVsOSBV6rAG17C9j5Z41C/vIw5+dJYPwpNtzBWy9i8KSLS2bZZbGo1LQdFPTzPDTR3+
         STEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759843309; x=1760448109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=264X1qDN3aQAP8Oh7tuky79CRF6X9B+bbwWZ9c7oerg=;
        b=fmhJF1S6u1j4LyPnsOIaQfUGe/klohGQ5CCsY6pjBSZA6U7kMt5Lkea8i+lQ5g2Zvo
         E8DkRCRkP4MpRlWKySVb+MwNEbEzKVb96IQWFNisGfIdtW1iJUVK7lJWEWdMoBjNiU3z
         W49T8mFTpQcHg/PQ8Rz7+x0E1a89Vy1WunBw6TO8EHqNOkpUn04OGu65jWDRxHeaaCl3
         Z/J9OaUFIOgYEJGmW+WNcBBo6N74Cscxv6TO3ufmHgATKDKVVjiVJ+/sCEjEXWo1AorA
         vWf+ALWL8z4mTa2SwSwHgt6y+rkcfbiQjnl1JjGOOm9x7NVoVWZW7r2Y44Ih9sPl/w3m
         +pYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUA8wyy31+iEcTcBrDudSRJXA+EUPu1KQ+HzrNc+V+4DSuJ84RIJHLLFpytTtmjlDVUzYvxXFUK13nngw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwavHNvpJAK/eipCGPEkGuYb7+3IqVEdSY8zLEJmDR3IfHvc3nD
	OxlPrqlKqLiA4YlUleBJXOtgF4SAmh29NlPXA8hVgnzOLdIfS+9eU2jvCNLmnxcx7ELTLhU2Gow
	GhieMEL3m/MTvaPQedObzPFz/b2fjvWbql3lkWX1GEQ==
X-Gm-Gg: ASbGnctR5B0D3wWsONjc8ER4ZsGTrSQWnjGgIjmOpIT/vZ8PbQDTVkpXK99FSdaldxd
	imeSCZWzRAlXPCDnXAUwwWBCb4ZEiIMRlHuDbhdn76HDcCLwTXKtCJrcT9a7A9rBFIE+/RWPQct
	lEyIT2BfguMvOaEidE0Hcyn+4m6y97QyJFONdkRfrfuAbrNKpGMeZvkr5AolaA0l0QpHzaEOqhF
	bnEviNJo9u+dvm31eSdZY/KgyO2PP+iA1Z+2k0OafpZwJYOG1rE7rSEJrVAVfY=
X-Google-Smtp-Source: AGHT+IE2+IZs52lFcgfooqKpv3k1qTzL2NCFC1USj9Z26FyDVKNO8SnLmrjpEF3qS87kcFqgJsuw+/Q2h1TIfSrcKYE=
X-Received: by 2002:a05:651c:1504:b0:364:c083:2fec with SMTP id
 38308e7fff4ca-375f516a094mr10405761fa.7.1759843309309; Tue, 07 Oct 2025
 06:21:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
 <0b402bba-0399-4f93-873e-890a78570ff7@kernel.org> <CAMRc=MfwEHGV-HZQURR3JNg1HatAeWO17qbRmkWUXTSBWj5jSg@mail.gmail.com>
 <80347dcf-419b-489e-9b0e-d901fbacc71a@kernel.org> <CAMRc=McaZV=tUkzDGMYxXqkuEYw_KasKcv8QGdjw709UYZuGhg@mail.gmail.com>
 <a9a4f33f-b6c5-4c25-8321-7b08a2afb8a0@sirena.org.uk>
In-Reply-To: <a9a4f33f-b6c5-4c25-8321-7b08a2afb8a0@sirena.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 7 Oct 2025 15:21:37 +0200
X-Gm-Features: AS18NWAcsMukxeTYbTWMUg8zWpW3gx9qkOJvdBd4XuNGAXfy8hVOWJV-QYlmbI0
Message-ID: <CAMRc=Mey+iRyKY7Ou=0LM1268r6_WuQDzYmLOU5MZbVoU1yugg@mail.gmail.com>
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>, 
	Mika Westerberg <westeri@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 7, 2025 at 3:18=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Tue, Oct 07, 2025 at 03:13:29PM +0200, Bartosz Golaszewski wrote:
> > On Mon, Oct 6, 2025 at 11:55=E2=80=AFPM Srinivas Kandagatla <srini@kern=
el.org> wrote:
>
> > > Yes, these codec drivers are due to be moved to use reset-gpios.
>
> ...
>
> > anything. And what about shared pins other than reset? 'dc-gpios' for
> > display, other 'powerdown' instances, 'enable-gpios', all kinds of
> > uncommon names like: `dlg,cs`, `wlf,ldo2ena`, `speaker-enable`,
> > `maxim,enable`? It's not likely we will create a separate abstraction
>
> Many of which, crucially, don't actually reset the device.

That's my point. While the function of a `reset-gpios` is quite clear,
these are not.

Bartosz
