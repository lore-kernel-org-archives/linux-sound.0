Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4613D669B;
	Wed,  5 Aug 2026 10:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785925859; cv=none; b=Ta6VLdVPX83iPdN2sGiMSa4m7kWXwlz5MFGoz7TTbP2CxCLCMb4KxUo1QrOaZYSmw4+xTbgqmKONsES2+lsTuRyuTxaI1MlK+WsgOITXnlYZESbM3ckwKQ6Aaah1+uuv+B56G/wsksrMWKIr1oUud90ru+dqyhNSw1BTUqeNAiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785925859; c=relaxed/simple;
	bh=kSGCtVbR8cRvgnRNNhaP5p4VqSrwSfcjG6gaozNQzZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WqRgpnWZMAWoPTkvtgwE40Wijs2mh6yGz0Pef1d8TbB+v4kE7pZH7fNMKw8+poJMLzKCETmNjphn0+zupketJpXFrc8YX+GHRP0pGBHOWQDu11yOBdlMPjJwxSLegfv1qm417AOcyXKhYex/46ZexA6+36J+BTPZIqusguw+Gl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bRQmVAs1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bRQmVAs1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98A661F000E9;
	Wed,  5 Aug 2026 10:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785925857;
	bh=9QY8sLvXEjely0lgxRQ0MGVx5/6YTx8OdpKaPvj/ilg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bRQmVAs1ydr0/qlnTbFTfCz7MR1kmj/sPgEslnKKih+m3Ebc9+rxpXI9yXsdaHLBL
	 G56670VSWm2rmwWmG6kQYpBiOtBhEQ3tsTj5ahP1qbqDI+FLEQWYQOmYDP3M0l97lU
	 ipghHzCsoWYd90bRulbrPipRQX4GiQLmMI+i+kz5HMoXDLExg6Y3fUYXL+QErW/1Qc
	 qr2EpdueetbmMfTC/VLOl3ViO5IugZgbQDbCMHDzYILitcFXog5MVHWl/EloWdN62Q
	 X6D0ssZPWyoG9FfGgoAtQr/0OEERJ+CBurRB8hS7fzxTqGWo+Q7pTmblKWZBa5oNyY
	 uBWvpvFBiIQwA==
Date: Wed, 5 Aug 2026 11:30:52 +0100
From: Mark Brown <broonie@kernel.org>
To: YLCHANG2 <neo.chang70@gmail.com>
Cc: Neo Chang <YLCHANG2@nuvoton.com>, lgirdwood@gmail.com, perex@perex.cz,
	robh@kernel.org, krzk+dt@kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
	kchsu0@nuvoton.com, sjlin0@nuvoton.com
Subject: Re: [PATCH v7 2/2] ASoC: codecs: nau8360: Add support for NAU83G60
 amplifier
Message-ID: <fe60dbe2-0626-4d52-8be3-62445a35ddaf@sirena.org.uk>
References: <20260804032951.1069901-1-YLCHANG2@nuvoton.com>
 <20260804032951.1069901-3-YLCHANG2@nuvoton.com>
 <479efa04-2c02-4b5d-8fdd-e3d4c6e49c4f@sirena.org.uk>
 <7691eac8-5798-c1b5-5ffd-19c780b69a3f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wSX65rLJnZG4q4ts"
Content-Disposition: inline
In-Reply-To: <7691eac8-5798-c1b5-5ffd-19c780b69a3f@gmail.com>
X-Cookie: Stop ahead.


--wSX65rLJnZG4q4ts
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 05, 2026 at 05:03:01PM +0800, YLCHANG2 wrote:
> On 8/4/26 23:58, Mark Brown wrote:
> > On Tue, Aug 04, 2026 at 11:29:51AM +0800, Neo Chang wrote:

> > > +	switch (clk_id) {
> > > +	case NAU8360_CLK_ID_INT:

> > Usually we don't have a lot of fine grained control of the internal
> > clock dividers of the device, things are a lot easier when the device
> > just figures out what it needs based on it's input clocks.

> To make sure I understand: Should we remove the internal clock IDs from
> set_sysclk and handle clock configurations automatically inside the codec
> driver?

That's ideal.

> Does this mean we should avoid configuring them via the machine driver
> entirely? If so, what is the preferred way to handle clock fallback when
> playback stops or MCLK is absent

> (e.g., via PCM shutdown hooks or DAPM events)?

What do you mean by clock fallbacks here?  Presumably there's some clock
still running, if that's the only one running it's reasonable for the
device to switch over to it.

--wSX65rLJnZG4q4ts
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpzENwACgkQJNaLcl1U
h9BDkQf+IsVEz+3iVy06KiM4odUUtyikOkdVqwgriauT33Rl8oBSYF7XFDPDdXv5
L8OPFenTor5m9go+wFhfL8hdsm91usoOCjoGSndpgLGJGzjEZNtSJFHhRBuIZShf
E/sm0KenjEeabySrOoTFX1MIxffDzUhgFyBAjW++00dxVatMcGsVmrb3RLZDrhQA
Go4lH31Xo2nazrtieZfJqPb1Ie/98ptaOa/6bK/qUBEP7IDrMgHU9kFZWGAHJqef
zySGvM4zVN6LRDmVzpbnbOozzwskq5/meHsdQL3ky/scuH6Lw9Sm3mtvwF/vnHdB
qFJFEiRiO8QD6w0EFXVXJ1mHoU2cIQ==
=pQ/m
-----END PGP SIGNATURE-----

--wSX65rLJnZG4q4ts--
