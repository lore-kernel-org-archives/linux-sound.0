Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E860F1F4705;
	Tue,  7 Jan 2025 16:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736267089; cv=none; b=fVLu4BkJgsJSLPp7X/tiygzeaLLTVx3aLEZzld3vxdLDY3OFGNwCDe8PC4gkNo1TcFLg20plEZY4OWqRSPkYzwgbg9FLSDK0oTpTRANcpHT97WPoH8canVWgxr/Sv9wAR17NjsuoXTNPgHyjbqWlqbKp1qqEO5+aVCbOMZZ23Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736267089; c=relaxed/simple;
	bh=vpjJVSK+EtxmiAddnVfzd+VKh0ZVQrzhk85rvQ7uXhE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jDJGpvtjzRnAtlrDdaEROCoJQxLMBgnqy8T6w6XdUgcVvFr9ACosah/BxvdnRX0WKIpQg/nAvijmbU4A7Pq4lhQaDOBOvDQTMotDOYboMq5dgRh8XGuqbtfc+lnhoeQimrQ2DbUkWjC4wnQ2E4WTyAFUibgsTSSZyvLmuaM8KoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JlHt/6lC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JlHt/6lC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93D60C4CED6;
	Tue,  7 Jan 2025 16:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736267088;
	bh=vpjJVSK+EtxmiAddnVfzd+VKh0ZVQrzhk85rvQ7uXhE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JlHt/6lC4y14YrTe3+4rEBBFQ1w2CjO+jroJwWsRc9WR5KQQRPsIpC89iGc0ErUlR
	 meglZFcQABib/ZPPwFswWiuclRUMtrfsunZEh9Iy7N2Ir8ApHgL5qM0CXfrLgQfq6U
	 RC/7d1C8oRNjPwSw8DPyImxkLJl1TTI50WYtSo87TMCzet98kZdBAKbB7+qTX/uX1x
	 d1VnLwzOWdx0wWNk6IxTKFv//4O2IZJ9awkJ1uFcpzx7Q6eKeJ9cC5oAbNMmA8XlRe
	 MScRGFQp8Z9tc/eISSHIt7Sk0coLxpVdBx6x1AFuIIAPeT0/N0r/dQvOOKpT62OtEK
	 xp5xc0zbjoXcQ==
Date: Tue, 7 Jan 2025 16:24:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-Kernel <linux-kernel@vger.kernel.org>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: add missing maintainers for Sound drivers
Message-ID: <38d57b92-a03c-4dd4-bd0d-2c1ae5d1a8f3@sirena.org.uk>
References: <87msg4o4zu.wl-kuninori.morimoto.gx@renesas.com>
 <2505bc4e-2968-414e-a7e0-4c0ac0862c55@sirena.org.uk>
 <87ed1fmrsw.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wjpTvbI2LcdxGZNs"
Content-Disposition: inline
In-Reply-To: <87ed1fmrsw.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: PIZZA!!


--wjpTvbI2LcdxGZNs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 06, 2025 at 11:43:59PM +0000, Kuninori Morimoto wrote:

> > >  RENESAS R-CAR & FSI AUDIO (ASoC) DRIVERS
> > > +M:	Mark Brown <broonie@kernel.org>
> > >  M:	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

> > It's fine not to list me for individual drivers, things like
> > get_maintainers will wrap in all the upper level maintainers
> > automatically

> Indeed no need to add your name for R-Car driver.
> But I noticed get_maintainers doesn't indicate your name for below header
> which is used for Simple Card / Audio Graph Card.

> 	include/sound/simple_card*

> It seems under include/sound/ is divided into smaller parts.
> I guess we want to have this instead ?

>  F:     Documentation/sound/soc/
>  F:     include/dt-bindings/sound/
> -F:     include/sound/soc*
> -F:     include/sound/sof.h
> -F:     include/sound/sof/
> +F:     include/sound/

We could do, though that'd also pull in generic ALSA stuff that's not
relevant to me (which is why it's the specific patterns at the minute).
TBH I get copied on enough stuff and the volume is low enough that it's
not the end of the world.  The other, more specific, option would be to
add the individual files.  It'd also be fine to list me for the generic
cards if you like, it was mainly R-Car that didn't seem right.

--wjpTvbI2LcdxGZNs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmd9VUwACgkQJNaLcl1U
h9Cp7Af/dN+eNAUo9erXzkU/T35mDVIx6NVMELWfqAKV+8LrfIZQO9bBPb23oMKm
kxqwQ8/Nzuszly4Pvoad48e0KI4tRDcdW8TMN3SFJ+6Hl5SM7FXTU/Q+MJMRXPAf
PKFwWRrNUBfG9b4R5+T3VNHKwStYHb05r+Ghbq9sB3Dt4hF0iNz/2H4C7sw1VcmY
bw2nLfI2TRIhy/m5tTPqbXN4se/ra++HoqkOz4wusUJCsO3k2HF7HuPepclLxE/W
nCXf/PZkVgLDBudVUFOGN3QPKKQiemhtELUQwfumk5zlYtJRdYGfL+yVGorwzPi/
69lsyufnXROQzPlDvcWoQV5XfAD6XA==
=M67h
-----END PGP SIGNATURE-----

--wjpTvbI2LcdxGZNs--
