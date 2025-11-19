Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2EC352FB5
	for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 14:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763561389; cv=none; b=nT9Hb9+1u/VYvb8NuNFvAVjAskJoz7FtrQDwm5PsSFcejjLNPR1lyAtlr+acUnLq5ev8TvjHfuoQrev8Uko2CzUWf07LMqU4DYV/yKhuVEKNnsJJBu+Oa9LZhk30BaORjakpz8UgXgkY0Nxo0JigJxotkaGbYbT//5AfeY+s/kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763561389; c=relaxed/simple;
	bh=oaQJkpLoRmPH88edjtjw6e0CUhdPfZru2YI8CASwDRQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UcBoZeGUqWiAIdDNfsG3w50rSnW8j0x2Bikv0Ma5vfo5536SLv0L7zXfi0KOA/P/o3ktRyN1FI2DdJxT2V0hr4k+p6D17A7sARg72erON3FS537/aMA0aU1v7C/62Epy7k12iReHX9vexr7ySxzTlgfViOXUwLXU/Cj/4ZJ8mLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=gR+++1Pg; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="gR+++1Pg"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-595825c8eb3so6783239e87.0
        for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 06:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763561386; x=1764166186; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oaQJkpLoRmPH88edjtjw6e0CUhdPfZru2YI8CASwDRQ=;
        b=gR+++1PgCrzo9uVK4C0WKS3OWBL8Ou8VC+MqqJn46UkDimyIKyQJKMeZdcpHqaZUsJ
         JDFVdzffuB0ZbjoU8j/FkVnAeWQlaUDnT4B0ZRZ1G3e4sdhiFnB+JKwNxq/n1VfT60vY
         UQHt24xJvl2C/HJ4abikvrQpvZtZNAu/8AGNbT6PsdsM7tLxCXQtUPGt1W4sSKrF4h94
         5s1rdtT+hY/A1Ig6ezUbp6TofPv9aTTnK4oA8nPSGRUeMUFrprhTcuS39zviN1rSAvHS
         sWYsTZtwterFeNZPIHEbaotP+P13gxEg1w1//qVxIhF4yL72bRgOTgrD7UmNHg9ESvyh
         2Zmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763561386; x=1764166186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oaQJkpLoRmPH88edjtjw6e0CUhdPfZru2YI8CASwDRQ=;
        b=F3kToCe6TyyhgEQyD8VRmJ5P8iZzh47vuDnzsk1jJ8uLkSEM2+Fi2Ze5QAUADOAFnr
         WmtvCULyFfSv5Ba/K8m0Nhdm+YE7Cu8eAC5FtK8F1+mYgc56yhhd14SMcj/NiLJ+Vy9U
         RE78Ny7bL1vou7uZdZ/dv2YVDToJpYenvRQXfN1C88cQzplfxJYcfWQEXmeUps46M5P+
         eIqDyqSJx4svWVUBmmcB4xBkUplO868qQSxe3MNsr8+WBeLxf1iTq0/9oRc1OhUYemdg
         B0Kmg+ejDtGeMs7x91j+oA1IIwwSq7zbw62z8Ws8lMHb0w7JvBQUdDAG8nSu6A4tW1aU
         7Dcw==
X-Forwarded-Encrypted: i=1; AJvYcCWO4uK8GukY5OKAGZ8a2+zaAn9zfstD0/mjTSajcsSYCPEMhCa0tphI47qFVDYPIJhuQ2W2By8YP6OYFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHjQdIRsPoJlbGp4KF/0fA/Yq4rCYYQzc9AGQKH9Rm9YOBIw1N
	fHj0H/yKahsrAtDwNFzb+TWW/gvzC78lLe9MXUD5F/gaLYdxiIqZueUny7LPPgqHWFNSuyQAZIT
	7U3I3McKl+ajvpRCIPmhVWoP09ctF4LxEADrcGbGKsw==
X-Gm-Gg: ASbGncvamA1GHFpsXcntX5jo1YSBoNJo2jTlA5d5048ik9X4h4/I5mJof//HtdJVLxu
	5QYh2iDHmZbAdyGOAOb1gYXULVgv+nDeLbvqm3becHksOsmjyBzhcJVdYqBrwi3yzs6ckSN6CJv
	WLPotRiQCWoLmIvXk9sVhLXSOO+ywyWrjgAPj9Rpp14WG/jgfKLLEHoLfkpMwxh30xvR3IC5dVU
	c2z+G0bcRUn4+LxwzTb3uXtrtahd9pUzP4OAF9D9YKRzyTU8yLHp1G42hTjvrTlD/BzUWq6pX3+
	bPZz8+Q2hPPjTndDbHvDsZCZlhk=
X-Google-Smtp-Source: AGHT+IEeA2MlI3JrK1vn3lEmeQsXIQ9eQp9us0I+JYX+0qUqjPDNcKyIq9tYmQgbg39crSEorsfXs+YtJFZeiSxhvQo=
X-Received: by 2002:a05:6512:33c8:b0:594:3567:e835 with SMTP id
 2adb3069b0e04-595842523d5mr6058585e87.35.1763561385570; Wed, 19 Nov 2025
 06:09:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aR2Uo++k1NKkk2sj@opensource.cirrus.com> <CAMRc=MdFDAmqcJ3PMsTbeZUb9imM+fzHzQ_9mQ1T=syDoCcQJw@mail.gmail.com>
 <aR2gVzKhfN38MHAR@opensource.cirrus.com> <CAMRc=Mck8MiAm_nxY_L6Zw4cH-vYf24zSkPp=bhnUw68Q6FV=g@mail.gmail.com>
 <aR2i6lNNWEbQk0fx@smile.fi.intel.com> <CAMRc=MdYcdrQSDWKDHrx4-Y4-y92AQqr73MoRC3ws-X==SL0MA@mail.gmail.com>
 <aR2o2R30TbVOcqZe@opensource.cirrus.com> <CAMRc=MciO0WYejOYZduqE73U4OVTxcaMfe6Sv1VXWJWL2FFNmw@mail.gmail.com>
 <aR29uKW7yLxws9jA@opensource.cirrus.com> <CAMRc=MdXNXQhE9zi=i0x0yGCi0fKQNU8_tn2_Uy24TAhxG7BRA@mail.gmail.com>
 <aR3FnUNO4DyCdiLD@opensource.cirrus.com>
In-Reply-To: <aR3FnUNO4DyCdiLD@opensource.cirrus.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 19 Nov 2025 15:09:33 +0100
X-Gm-Features: AWmQ_bkuL9SC7iST13IM0z8S8Q9KRGjjeXzDaed4bWZ13HYvJ_YIUtsuMOzhJkU
Message-ID: <CAMRc=MebbjT7QAn8M0q0MsbRhTA-CUNKmo4nUPgXBXrmU-4D6g@mail.gmail.com>
Subject: Re: [PATCH RFT/RFC] mfd: cs42l43: setup true links with software nodes
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, 
	Maciej Strozek <mstrozek@opensource.cirrus.com>, Andy Shevchenko <andy@kernel.org>, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 2:27=E2=80=AFPM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
>
> I think as Andy pointed out though the first 4 patches in your
> chain do loosely want we want. Previously, we used the name to
> point to the actual pinctrl driver, your patches should let us
> do that properly through the fwnode. So we can drop the pinctrl
> swnode and just have the cs-gpios bit point at the actual fwnode
> instead. I am trying to hack together a strawman but its failing
> in a lightly odd way. Hopefully I can get that sorted fairly
> soon and post, or I guess I could post a version earlier if you
> wanted a look in the knowledge it still doesn't work?
>

If your solution won't work after all, we can try using machine lookup
instead. We have all the blocks except for support for the "undefined"
GPIO in machine lookup. That would need to be added.

Bart
