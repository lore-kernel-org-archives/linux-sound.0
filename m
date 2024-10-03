Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A26384FAD;
	Thu,  3 Oct 2024 08:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727943832; cv=none; b=Nm+OBGbVC8MYPQGt97iJ/fD1shwBo1Mh/PULiRJbg3AUnJfRX8+3OOSLcH8XZA9ps4fCoJk/VaJwZRMi7uRwpI/whw0D8BHQ9jizYpov7qvjtN79pqnqV7AvzB/0PUL4cDAtAfHT5SYpO61c3sVfpXh03lT9dIjr1Nr2zvhACaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727943832; c=relaxed/simple;
	bh=Ww5sEm1UZ8mj7K1bio4w12k7oSUV2QtudL0chVEX1GE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fm8/8QPLLWcyIbuIhIRIH3hF/JLdrKo3Ng1/qQGVZkOUzshcTNw2dMsG5Q91flzXFjZCVBzmtmfyPEcfpVs86dfkN53Gt4edCnbhqdLfHc6ZVYTNAtwe95sMHXipoY8jkAreAzh5P/ZzPAwJnyZvFOJpw/Ob6W/fZ0t0pxZvAbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mPlpIB/6; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mPlpIB/6"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3D7DF40014;
	Thu,  3 Oct 2024 08:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727943828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=On2xGY5hMkwzoaaeU/lUt2EeaXWPfHOtxpzc3euMH4g=;
	b=mPlpIB/6/H9XXT8zHcMVr57dEbfDlPG0y/MDEb33FGrj2YbJ6Jm1l2fj+a1BMS1eNtYgYO
	0JS662KMHvs2jv3y04xLPcEoPVUQfbWl/ZrPJzfKhQ1e+ZUQR2Wpy1uZgq4uYWbMMIcEao
	URUhSrj+9+JzNZPhwhfuX6rGhUrhd1HNIEY1YaEjM+3ea4VnqFK80XEhbkx/4Jj9BgAjGo
	nFZ46KA2v5KRSk4G2gDnTFAALwXfzSp3NqSJwn6CTmQ4qDm1ol5R8KlilvopdLKuDHrHDW
	/O64VocxDJCbkhT1ZE2zQQrd091r16phQpz5e0fpnDI0iyWvQIzhDCx4R+gDbA==
Date: Thu, 3 Oct 2024 10:23:47 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?UMOpdGVy?= Ujfalusi <peter.ujfalusi@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jayesh Choudhary <j-choudhary@ti.com>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] ASoC: dt-bindings: davinci-mcasp: Fix interrupts
 property
Message-ID: <20241003102347.0f95e48d@xps-13>
In-Reply-To: <a67e031b-5685-48f2-b3b0-5181dd7371f2@gmail.com>
References: <20241001204749.390054-1-miquel.raynal@bootlin.com>
	<a67e031b-5685-48f2-b3b0-5181dd7371f2@gmail.com>
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

Hi P=C3=A9ter,

peter.ujfalusi@gmail.com wrote on Wed, 2 Oct 2024 11:43:56 +0300:

> Hi,
>=20
> On 01/10/2024 23:47, Miquel Raynal wrote:
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
> > could be a thing. =20
>=20
> For interrupt these are the valid ones=C3=89
> - Common only
> - TX and RX
> - TX only
> - RX only

Thanks for the input!

AFAIU, Rx only is currently not a valid description. As you are
providing a description list with minItems =3D <1>, I think it expects
either the first item or nothing. When I change the example in the yaml
to only give the "rx" interrupt, make dt_binding_check errors out.

I will propose an update.

Thanks,
Miqu=C3=A8l
