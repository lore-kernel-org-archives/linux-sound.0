Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52AB33EA69;
	Thu,  3 Oct 2024 08:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727943957; cv=none; b=KlAT8P6lXdzCfBbyi8dr1Jo7p3snQFvyhOvF4MkW6hD+92nobBv6q0UF2snwQcZVABx3owmJs/BIWA4gyIMwZuSj+uruubJDixHnSGkP0Krmcsy5ubxeUy8FWsRZ0I9R9uHRFjrGoqDhRsUllajaopYHLIJXjNIUCa9Z6JgmrKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727943957; c=relaxed/simple;
	bh=AB0d6NMTstiPZWMsI7UYFkElIv/mKCBJDfRxlrRJXss=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ek2x0P5QvvejqW9ne9Trr2HrlPqgdI34JB5rbloP/MxUiOA8yRoGCl19IE+PZfXrJxjpvLgz0cn2S2r7QIn3BXn0SyVtjOkfPNR48OjmmBSAOS7C3DJ55VxaC8fqTxa2lU1KgmoPYgihZZdsNQWJhZWYAK0JNk6KwgyUpeqTYtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TvN35hyn; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TvN35hyn"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 50EE04002B;
	Thu,  3 Oct 2024 08:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727943953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JHm94FJKntrSnrQpV7BYaxzJnPo2EYUvXKt/hl2o4XQ=;
	b=TvN35hynDrxnwsidmg4QW5e+4TG31RtmdkucP/s2sx5pNZHfRvRGxfJWyQ1ecsJp6ezYKR
	v5RHc2uxy2LdSf3E+OR3a/MY8ccXkBMAwxTkDNb8uX+z5uCXilPQW/Dn6z8HfvaonU4kxg
	p3sbowLVtsbpO8V8FW9D56BVc2RgkcqMmuyVuxaBm8RDbsB7utrlKqpPMPPhUljjrgy+Wp
	u8AYGmgKgG1w7BsJcuUNIpajLZazAlCjGiEgS0rQRV7n/xb8nTM+ny7UNGrqf7dDRgIx+4
	06P7jD5H3s7zPY6D2OavGbH6o57KjCqGSGnBuSzc2xo0QbYqoZBoCbTmAMgPig==
Date: Thu, 3 Oct 2024 10:25:52 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Peter Ujfalusi <peter.ujfalusi@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jayesh Choudhary
 <j-choudhary@ti.com>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] ASoC: dt-bindings: davinci-mcasp: Fix interrupts
 property
Message-ID: <20241003102552.2c11840e@xps-13>
In-Reply-To: <172789067103.163279.11797735685119883296.b4-ty@kernel.org>
References: <20241001204749.390054-1-miquel.raynal@bootlin.com>
	<172789067103.163279.11797735685119883296.b4-ty@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hi Mark,

broonie@kernel.org wrote on Wed, 02 Oct 2024 18:37:51 +0100:

> On Tue, 01 Oct 2024 22:47:49 +0200, Miquel Raynal wrote:
> > My understanding of the interrupts property is that it can either be:
> > 1/ - TX
> > 2/ - TX
> >    - RX
> > 3/ - Common/combined.
> >=20
> > There are very little chances that either:
> >    - TX
> >    - Common/combined
> > or even
> >    - TX
> >    - RX
> >    - Common/combined
> > could be a thing.
> >=20
> > [...] =20
>=20
> Applied to
>=20
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-=
next

I didn't read your e-mail in time, there is apparently more to fix if
P=C3=A9ter is right, as the current binding still does not allow the "rx"
interrupt alone, while apparently it should. I prepared a second fix.

Thanks,
Miqu=C3=A8l
