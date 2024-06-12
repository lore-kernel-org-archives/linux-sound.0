Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A9717C9
	for <linux-sound@vger.kernel.org>; Wed, 12 Jun 2024 07:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718178550; cv=none; b=L7BUXxwCK9/bI9FXYNQIltrDxd9lL/vFubGt9nVPvmEOtxcFG5bQdR79ho/nj/uY5xfssCpqkrKvbG4n6vav2DHsQ0kQQ8jcJc4/NUvNjqikEWiMFEq5Q2yBawKUCOdw6nXFv0cVmBPf3zd/3f2rsN3rQvjSWMVT3/4PAWuTO7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718178550; c=relaxed/simple;
	bh=3wDlt0rm1YoJeMtoYXnJF3HN3gpF6lAx5EVTQ33RwdQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QGCZq4SBk7TDKhxFJXyjgiUI+0chdKkE8gvq1chGgYgKYK4eMZZovuvOFXYVnd1J7k4v489T4qSeddNkkotHB3CsdLWsuJIu2ke6FNi7St6PXZbz3ElNwExeqbTxQjdSmKL9gwb43ivcLBvaSBr6wRogbKaYVAQoNq23Rhr7Ss4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com; spf=pass smtp.mailfrom=timesys.com; dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b=G/B0r9Si; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timesys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b="G/B0r9Si"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-795ca45c54cso116367585a.0
        for <linux-sound@vger.kernel.org>; Wed, 12 Jun 2024 00:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718178546; x=1718783346; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QLcH5YJaXuB/7MGBHEHfOlicw3pcEYZxxPQWbcZpzrg=;
        b=G/B0r9SiiziUQ4SpsRffKek3W9c6gkUuhhNVNwOQeRuuKZwBwXGkxX/gv+6oM4EhMj
         rJC1qD/Li6OrZtRL6lyEj4wkUH/t1647RqVD0ytpl7CZQqzQoHG91Ycfun+zgcaSbvU1
         7LEcz5eVuNlgT8oZF6TlVOoN1/rja6D0dbSSoEbmVEmveuUMROKV3gYKCc43xQpcyrv3
         7nFtF2XBkuSsaCtQzzO4UXKP01yJOqVFA0adkKbG0JJjasvKYV8WuUbc5JgMtB1LktDo
         WXAkjPWL0Z0uvJcntxivZ8jIqI2+kwugDQfuQTISlMsHgFHuZL3fXm+QWKzVRLLprz/x
         +kHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718178546; x=1718783346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QLcH5YJaXuB/7MGBHEHfOlicw3pcEYZxxPQWbcZpzrg=;
        b=cn3v4nZ3f25WyDW4cp0k94in7Ni4hZ14IxindNH0i94UL7qTU+jNtkoyQX1TEUdwmI
         e/kFSlcUsNwNwddbQO7lmhy8rTytzkZNgPJFDdzSzPSJn82UPskyXgFjiR/lde0NGZF8
         uvAd+fkSTt0gxwa02k8z7FXej2HGwyLHDj8xSXDwr+Z8agChzScBLli2Mx5dv28584of
         jY7kt2i9kOfkxgQYBWqGlth2/YkNV/YbeGhbc/2kUE8uG9t2b99pE1j+Tg5cUDD05qSo
         1yYenHdGkT3yPzjSEuv4p+O/CQXbYT+SemHQ7anHq3ajOEhiqY2l2YC8b0O1IV7u2S9e
         oCcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWW3X1CyNqPJOCVVjtPYjPame5i9dzDmwChFJ//ib/5P9MkO4Zsi68b8T4ULP9iIVxsDlp74+6SUsvMH4lUbhbX7oA2MwQt0wJBvx4=
X-Gm-Message-State: AOJu0YyvcZkXFUYKjapABJGe6E6MkzZMXmrSoltgef4xuR+NGnyUZYPv
	2oUgGcaFMFk1fXz8UIHKsDj6uJ9BO/JH4UWg2gLsA3g7vGP2BEv4V/YebaC2DPv2cd5njswRKvN
	n7tkiFQcbfy9JlthX3RT0f6nU8Lt7F/1+T755hg==
X-Google-Smtp-Source: AGHT+IFeCV50FnVEaMqclrtqDNFKqc6xUL0MAu5JUv82YAmzpGH5pe7N5VXTefcxSlBdNwkvmPPJIXMcRjw3+tCTj+0=
X-Received: by 2002:a05:6214:460e:b0:6b0:6b78:e608 with SMTP id
 6a1803df08f44-6b19230ddb2mr12311056d6.31.1718178546635; Wed, 12 Jun 2024
 00:49:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240611094810.27475-1-piotr.wojtaszczyk@timesys.com> <6cd2897f-a61d-4351-abac-714bae2ab154@kernel.org>
In-Reply-To: <6cd2897f-a61d-4351-abac-714bae2ab154@kernel.org>
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Date: Wed, 12 Jun 2024 09:48:55 +0200
Message-ID: <CAG+cZ06kf-n339XHnOiOzSECNkxVLYVw5UvtiWZwkDx5VFHa8A@mail.gmail.com>
Subject: Re: [Patch v2 1/2] ASoC: fsl: Add i2s and pcm drivers for LPC32xx CPUs
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vladimir Zapolskiy <vz@mleia.com>, Russell King <linux@armlinux.org.uk>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Chancel Liu <chancel.liu@nxp.com>, Arnd Bergmann <arnd@arndb.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2024 at 12:15=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index aacccb376c28..7616f61d6327 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -8909,6 +8909,13 @@ S:     Maintained
> >  F:   sound/soc/fsl/fsl*
> >  F:   sound/soc/fsl/imx*
> >
> > +FREESCALE SOC LPC32XX SOUND DRIVERS
> > +M:   Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
> > +L:   alsa-devel@alsa-project.org (moderated for non-subscribers)
> > +L:   linuxppc-dev@lists.ozlabs.org
> > +S:   Orphan
>
> Not sure if we want it in the first place. Why would we like to support
> orphaned drivers? Sorry, if there is no one to care about it, then it
> should not be merged.
>
I contacted Nautel Ltd they agreed to maintain this driver so I will add
J.M.B. Downing <jonathan.downing@nautel.com>
as a maintainer.

> > +static int lpc32xx_i2s_remove(struct platform_device *pdev)
> > +{
> > +     return 0;
> > +}
>
> You did not respond to comment about this. Drop.
I will remove empty functions

--
Piotr Wojtaszczyk
Timesys
