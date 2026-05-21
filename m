Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5763A25B0B3;
	Thu, 21 May 2026 15:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779377745; cv=none; b=Q4RqDq4r7fPMUFQDB3pXg+wq+EW2UVWupaOHb77fakRuhB7qEzlOeRx5Wtw6F+bzGve2dTHPyijhBVhhuwxHir7IXSsVDK5jzZiI90g2aGCdDN23wi8K1eJ6wnC8B5r2SAyzFBz2htaHEoNiOG3i4G78bHpdw09BlzncHNcxkss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779377745; c=relaxed/simple;
	bh=oImRwjI+XSNpas5HABW8j0NwP849AjVk4QzoZ8axO3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JYazgh10SszssM5wUegrDrnStLyOCqpBKzd9KpE+//VCtQnLJ+27q0nil0xuFJyQ3l6gojJJx6kAZRnG8leROAYsSdH/uIG0VsafuMXM32sht8HzHdJeVcDF7CKmwyBttPf7uY09SCqn4c7yKWLsiZnegJuT0+4iCBrhSvI4U9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WgIOVQ24; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WgIOVQ24"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEB1D1F000E9;
	Thu, 21 May 2026 15:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779377743;
	bh=TQwSrXVYnpbCfJdtfPjLSghRrh3omoKn1DB2+rGBNjE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WgIOVQ24fSOQxyG4iGiLd0T3oOMQsbj1BC/sFOR9UkwhioDe7MhOPISoGe7bQweJ1
	 E4IzCvBrBQmsxwuyT87jWxYliddNtjMx6Zi7iUgHkXoWXLwPRm2snsiTWNSvkM38Lf
	 FBxiOdrm2SVUxF2l2KsRygGAmu7mNxlgwV6N9rgnbLAbjiY749XK/HmuChFRFfEc/4
	 jJkvGrMQSD5HgBEcQUYrRwBamaJOSWdeGFM/u7LtU+ZSoRNi6VQIoEe1CwCFgkIESV
	 9FsHq3NjbHUiXO7DM5sTA3mKiBno3JbQeCMt8Ei03tGAkHinbeBqRmepmXaq5Uaqs0
	 ziTJdrplekOwg==
Date: Thu, 21 May 2026 16:35:39 +0100
From: Mark Brown <broonie@kernel.org>
To: YLCHANG2 <neo.chang70@gmail.com>
Cc: Neo Chang <YLCHANG2@nuvoton.com>, lgirdwood@gmail.com, perex@perex.cz,
	robh@kernel.org, krzk+dt@kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
	kchsu0@nuvoton.com, sjlin0@nuvoton.com
Subject: Re: [PATCH v2 2/2] ASoC: codecs: nau8360: Add support for NAU83G60
 amplifier
Message-ID: <934509a9-1347-4b02-a341-0db0d1db42e7@sirena.org.uk>
References: <20260518024704.118613-1-YLCHANG2@nuvoton.com>
 <20260518024704.118613-3-YLCHANG2@nuvoton.com>
 <ce8d5ba7-22aa-47ac-90ab-026ed1ee3928@sirena.org.uk>
 <ddacfe50-072d-66fd-c760-c898bdab52f4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UVs/AC80Z1SYC8M2"
Content-Disposition: inline
In-Reply-To: <ddacfe50-072d-66fd-c760-c898bdab52f4@gmail.com>
X-Cookie: No shirt, no shoes, no service.


--UVs/AC80Z1SYC8M2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 20, 2026 at 11:01:53AM +0800, YLCHANG2 wrote:
> On 5/18/26 19:35, Mark Brown wrote:

> > > +static bool nau8360_volatile_reg(struct device *dev, unsigned int reg)
> > > +{
> > > +	switch (reg) {
> > > +	case NAU8360_R00_SOFTWARE_RST ... NAU8360_R02_I2C_ADDR:
> > > +	case NAU8360_R06_INT_CLR_STATUS:
> > > +	case NAU8360_R21_VBAT_READOUT ... NAU8360_R22_TEMP_READOUT:
> > > +	case NAU8360_R41_CLK_CTL2:
> > > +	case NAU8360_R46_I2C_DEVICE_ID:

> > Are the I2C addresss and device ID volatile or do they just not have
> > defaults?

> For NAU8360_R02_I2C_ADDR, it requires a write operation to latch the I2C
> device address.
> For NAU8360_R46_I2C_DEVICE_ID, although it is read-only, its value is
> determined by the hardware configuration
> of the GPIO1 and GPIO2 pins at boot (e.g., 0x1a, 0x1b, 0x4a, or 0x4b).

In that case they shouldn't be marked as volatile, just omitted from the
defaults - they can be cached on first use.

--UVs/AC80Z1SYC8M2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoPJkoACgkQJNaLcl1U
h9D6Dgf+MTFdSAqe+sVth1MJROGJFObulkedu9OA8uG35UgzyoNnZLCBJkQpVIZ4
1px0piveEdCEof5YO8E36u8e6DnBz+J+muskMv1lTEoM0vi6PsNtkLUg8WzCHXdK
uZyxdPv+/442PssImFrXj15dZgIVv4TU5yE5ILxY3HVWmYsIRu7SSTzKzNZxUfJM
TBptlzzjjHTqfOO12fmq4m7JC9D2/HBGpGZ8MKSp3MwJogC5/a54Pb+R7Z5CxVez
x914kR1dNsvlpgRFTLCC2CGXLZMXIaXSAQMaDsWAkpyhl5aVky111iJRQhmHsdYd
aL9m3xbjCglFXQmN+Am3B+kL4DQ5+g==
=ySQG
-----END PGP SIGNATURE-----

--UVs/AC80Z1SYC8M2--
