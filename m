Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103B1417BD2
	for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 10:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791888736; cv=none; b=RnECDenqK7HjwD8YqiW9ftE6XPdaibyw4L/HS7Avss6IrpEEZ6FDZUJYm5YmCaar/0rsf0umrkcmmoC0Blzh050AkjHJjJhg3uDzsUrZQ9lRAFIAFmUlM6ZD6r/AAflZSx7UHcjUgkDM51pavQv96KIUFWt98CV8UdyKfrfPI9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791888736; c=relaxed/simple;
	bh=9CIlnrdafHR6XWx4a7m9mYRPZ1Yo0bQK2WSaPWm9J2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UDk3WHND7eshcnhcAtm4ZftvvKVZUZ43yXsFZp7VAy16VTxKDXrCJwtr7pzPFQRJOT/OxXfRF1gaar6Rtr5I9pnf7E4I4ea+Eu39C64QcIpPAt9yYpeR1kxLDGsnHjOCzvi5ziVmhs+UxC9dzyZiyEcExNHmHttVm8k0XxViDaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bj5seYR4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bj5seYR4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C775A1F000FF;
	Tue, 13 Oct 2026 10:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791888734;
	bh=aGlYmvQjJG0NyXpInDR2NjrwyGT0HVlOqjOhhQq7znw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Bj5seYR4Ic1JYvox+MrEpJ+q/nOqaRDZtwinUjRen18IV4S8e6iXp1X6gFyorOsI4
	 C4JayKLp2BoUU0NCr1emllXqev+aNa3riTnKLkhcCM9KDHJN1Judm5dPe6FRZS00U+
	 AynvK+A+Vgbxjo3rYd5o0S+c1QTJZPB40wjuiAkHZXSo/zgggt+qSgoPsfEOC5SASm
	 CTWrNSSX25zHPHLtAx/Jub/IG5kWSlfpM1jf+l6MF66uO6cAcsGEEdT/t9XCiHps3O
	 U1p/9Ql5o7aYXjWLITRrY1ILVNH4EcURSPnUN5o49K3ImNm4I16rdz3HD3NN1iiPkz
	 OaJVGH+/Kjo+g==
Date: Tue, 13 Oct 2026 11:52:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 07/13] ASoC: soc-component: move
 soc_{probe/remove}_component() to soc-component.c
Message-ID: <2ab7a32b-4172-4f15-9326-f2914d2b5830@sirena.org.uk>
Mail-Followup-To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>,
	linux-sound@vger.kernel.org
References: <87mrsw6cje.wl-kuninori.morimoto.gx@renesas.com>
 <87cxts6cha.wl-kuninori.morimoto.gx@renesas.com>
 <asLKqMzZpRhloNXq@sirena.org.uk>
 <87se2axzdq.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ExPoyWaZI99ERGc9"
Content-Disposition: inline
In-Reply-To: <87se2axzdq.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Some equipment shown is optional.


--ExPoyWaZI99ERGc9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 12, 2026 at 11:39:14PM +0000, Kuninori Morimoto wrote:

> > > +	if (component->driver->probe) {
> > > +		ret = component->driver->probe(component);
> > > +		if (ret < 0)
> > > +			goto err_probe;
> > > +	}

> > ...this doesn't have an equivalent error log to what soc_component_ret()
> > does which is probably not great for diagnostics, nor does the cleanup.

> Actually, I have a patch to use soc_component_ret() here,
> but it changes the behavior.
> This patch just moves function file, and will use soc_component_ret()
> on other patch. Is it OK ?

Sounds good.

--ExPoyWaZI99ERGc9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrODVoACgkQJNaLcl1U
h9ArTQf/Rcva6DAHjXTcQ4Zl+N5Nui6sRfxv2YLlMfP0Kh3U0hLBlDcgAVWeB9UF
T7LeBoMYkqQ+SEIEyF/c95YWsOnPvvp13uNzuEZBE8A6+95467KqDkPCbdRDjHX/
SWfUfEmCD0abueJDYocfPH/g4bEqCqY1DydeeWS6xNu1lrfi6GMkSJhUQywVFs3K
Yue4wU6EqUkSty4z3UZJVlO1eSnyWHOtzzxVFE6oiCscga6kopCscaU9MCznqpt0
et7irTutZMc0a9uXtq6Igxxw0ctn9TYxZK5AgEqnwediZ6Qq4e+1zHDePIM3LGR1
M6NBfblottH8BRj53bEegKdCx2mU+g==
=PInF
-----END PGP SIGNATURE-----

--ExPoyWaZI99ERGc9--
