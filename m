Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6122772A
	for <linux-sound@vger.kernel.org>; Wed, 12 Jun 2024 07:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718178910; cv=none; b=aLpRmc/u/eRBjVZMNUTB/hLWMwuttBah2wV0sbb8L8zViE0p16tzLg5WHEyHcCUzYgW6HhqwKkEyYtlsQboY8AYxUCKNO5TJWNP5rDOxR3QCuz840MTxlJetETPyciBwbKeuf50qkAsw3NLGzOLrx6UXvmnKUOBQVcIdPq2kvQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718178910; c=relaxed/simple;
	bh=/jcoXUR9wDP6KAAPbxMnAdcj2368TaJUtRP9CxBQamU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p+NZsbgyRbuaqDR3bS/aLwM7sB39AIckkNL2lMwquFwZfQAtMYro7Xkycz+sFZ6a7/aqTWc1h8Vk0j60lWYyOrgkp5QpEt0+KS3betaUnGnfMHGMx4UOO3zyOthU6qq+j4dL3pdz/QHAuBQyKmWhIk/Jd0SV8x4dJl9X2fwMXrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com; spf=pass smtp.mailfrom=timesys.com; dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b=Af/GNqtC; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timesys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b="Af/GNqtC"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-627e3368394so72379987b3.2
        for <linux-sound@vger.kernel.org>; Wed, 12 Jun 2024 00:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718178908; x=1718783708; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s8zvLumEmzHSVfDBX+K3KODMcTb3eNmXQ7W6gFdSMig=;
        b=Af/GNqtCTkyI2n74kjCoTQa2O4IpWQO7pwNbUD4DMkqFjuLpI9PNJx/iQvPMBYlSfH
         fnmXHerNMpYuCmU2a2vAg8e+dDTHIaPf81ZBb02eOEUGLcJU6kYNJH+fKK0yDAtozCsK
         FIXehBzv509pz24GxQ+DbAw1GRwL1WIqb1Xe2oKZIAsnSQwKKwZh42j1EV1024pSfc5E
         0RdzQJViPhK4kIOqV1ELzknGGc7ZQaPoK+iXouEdU3ay5FD+N/xg7+Y5Fg7W4ARQdZ4L
         ayeaq9+kxnbIganHelSaDuund1F8A9NjBbNar7UmCT/GblIPv2eFJPAtiJu5CUafKHRa
         9XPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718178908; x=1718783708;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s8zvLumEmzHSVfDBX+K3KODMcTb3eNmXQ7W6gFdSMig=;
        b=oHkfPBtmyIK+faUv5qoulCrN4a9S2SbWOaNAArTJiDERi4H8q/XsAqW8leVynYrWby
         u3cgun01adW/wzDNKWyTnFOLfiDEYdeMXn90Ycjlnk6xHXN+NWASVFiEZwdfhfHwlLJt
         1zRKbADgZuwpSNhRNB/Ve1u/Y2qGY20n8+dgdDPkNTnPk5CBr/BgFk8Bt9cZ4VYC/g5N
         UJt3iXrPph7oKK+M7d5wPD6NQE2NLP32Hh5BFg45SkeC1bkqS6Mx6CQ/jWX6JFgvreaQ
         inOA/d6Mn4af4bZJnC0Ehm0iaG8WMrlvKEWSXK8mJyqmt3AnmtpzfNMgj5fkHsbrFfAg
         +iRg==
X-Forwarded-Encrypted: i=1; AJvYcCWBYbdfWKdc7g8PfUYVORM6c6MsOj+0Bw6z5Vu0KKR5e3BRB7RWbVilxJ2CnE6e0qLz7w0ToyOo4hHRbAs6Jm6z6TrBEXY9aoxoL3w=
X-Gm-Message-State: AOJu0YzDS7yAE2cSoAKAdUKCNigBvClE3c5b699qHquFClKB42ERSw4M
	asCTl22YAINR+BJU3QzrhfV1QFE3J3EYLLa7o8ndTKk0ZeZlWAG8qWb4lP3xt91C88j6BbKXoXB
	eRIqI/ftywt63fOqBsrpyMyu1FPpTocsxKoiYoQ==
X-Google-Smtp-Source: AGHT+IFPLy4bDjB26DeJ3OyETqud+YR8g7kmBRh3/NifyRwyRcvSuS2NJ859y2s2TX4hnMNdepvtl112sIycLjmhYjk=
X-Received: by 2002:a25:918a:0:b0:dfe:ed7:84be with SMTP id
 3f1490d57ef6-dfe67064dedmr951615276.25.1718178907988; Wed, 12 Jun 2024
 00:55:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240611094810.27475-1-piotr.wojtaszczyk@timesys.com> <Zmgor8accyAiUkUO@finisterre.sirena.org.uk>
In-Reply-To: <Zmgor8accyAiUkUO@finisterre.sirena.org.uk>
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Date: Wed, 12 Jun 2024 09:54:57 +0200
Message-ID: <CAG+cZ05=w5KbxOOtpo99B=OHBaLNRKKJVrFT67CH1-6z1gP7ZA@mail.gmail.com>
Subject: Re: [Patch v2 1/2] ASoC: fsl: Add i2s and pcm drivers for LPC32xx CPUs
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vladimir Zapolskiy <vz@mleia.com>, Russell King <linux@armlinux.org.uk>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Chancel Liu <chancel.liu@nxp.com>, Arnd Bergmann <arnd@arndb.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2024 at 12:36=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
> > +FREESCALE SOC LPC32XX SOUND DRIVERS
> > +M:   Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
> > +L:   alsa-devel@alsa-project.org (moderated for non-subscribers)
> > +L:   linuxppc-dev@lists.ozlabs.org
> > +S:   Orphan
> > +F:   sound/soc/fsl/lpc3xxx-*
> > +
>
> It seems a bit odd to add yourself as a maintainer while also marking
> the driver as orphan?
Nautel Ltd agreed to maintain this driver, I will add them.

> > +     i2s_info_p->clk =3D devm_clk_get(dev, "i2s_clk");
> > +     if (IS_ERR(i2s_info_p->clk))
> > +             return dev_err_probe(dev, PTR_ERR(i2s_info_p->clk), "Can'=
t get clock\n");
> > +
> > +     i2s_info_p->clkrate =3D clk_get_rate(i2s_info_p->clk);
> > +     if (i2s_info_p->clkrate =3D=3D 0)
> > +             return dev_err_probe(dev, -EINVAL, "Invalid returned cloc=
k rate\n");
>
> Nothing ever enables this clock.
It's enabled in lpc3xxx_i2s_startup() and disabled in lpc3xxx_i2s_shutdown(=
).
When the clock is enabled the bit clock on I2S interface always runs.
So this is to avoid active clock when the interface isn't used.

--=20
Piotr Wojtaszczyk
Timesys
