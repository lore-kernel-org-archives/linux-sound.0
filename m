Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD1D2FF164
	for <linux-sound@vger.kernel.org>; Fri,  6 Feb 2026 14:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770386914; cv=none; b=IQhtFoVYhAUTkLh2atd2/Dya180drjmmxmL4OjQUHzrSg3IP0EPE2sDAy4gI1xH52oQFK9/6XdgBYLfKNBHiJji8nliDG9WEi5Oyb3f+YQm8Yflk5y8OXur8AODopz5BdXTDiT3Lqj4SEOyclHbB4R2o8dR9S6qklD3OAaxpMhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770386914; c=relaxed/simple;
	bh=UY/nf6EPW4a2v1n4TYF134vFMmEfUXZ+Bquc0fuO/3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GRCmNJ7YCdjVirXCly5aqQscs4SBvn5PGUk+W9o6cMMhmv4sgSikaw5IVVe2AAg+DvGZs98C7PzDPHSOiAM3w9AE6P8UYr04fhCCI33PLqJoi8Ietm/Mvy5DzSH2eGgh0mGMAf8HlQw52pgMd9QcaCTg5O+/cH116mQ9poNawEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S0C8A72t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S0C8A72t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DBF2C116C6;
	Fri,  6 Feb 2026 14:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770386914;
	bh=UY/nf6EPW4a2v1n4TYF134vFMmEfUXZ+Bquc0fuO/3c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S0C8A72thwxYZD8+iz+O+moFjGbNGopFZ/qLppj2GFCzGJchNfggnNxaUcLbC7Wv4
	 WyOo7imadnBP2hwH9LeZJ72C+ZD1G1a4DORc4vacU4FRdgxJP96VgzCY5cNKSolvXz
	 9nZUy95E+rHjWq8sPVXSR/ddfFATRyX15/kyslEMIALo18Pma7cLBXkD8K2BclQ0ob
	 hXFlVKllJzLYp5ZOhQybnGsGj+toWt3/MRXnalyb0NIR+yYkqtKMgZFYyO3+SANJIG
	 WaaCWofC1BnpvmcQI+2oBmil6Ch7Ka+jFGSiIhSscNz3Fg3N/WXrPaYFTyC22j9H+d
	 Oey6PVFxnP+Mw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id D6BEB1AC57C6; Fri, 06 Feb 2026 14:08:28 +0000 (GMT)
Date: Fri, 6 Feb 2026 14:08:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.com,
	perex@perex.cz, amade@asmblr.net, linux-sound@vger.kernel.org,
	kuninori.morimoto.gx@renesas.com
Subject: Re: [PATCH v3] ALSA: control: Verify put() result when in debug mode
Message-ID: <aYX13LsGaMjO8X92@sirena.co.uk>
References: <20260206113250.207179-1-cezary.rojewski@intel.com>
 <87ms1m9htu.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DyOmcQbZ5ga6t5AY"
Content-Disposition: inline
In-Reply-To: <87ms1m9htu.wl-tiwai@suse.de>
X-Cookie: Think big.  Pollute the Mississippi.


--DyOmcQbZ5ga6t5AY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 06, 2026 at 01:28:45PM +0100, Takashi Iwai wrote:
> Cezary Rojewski wrote:

> > +	if (retcmp == ret)
> > +		pr_info("kctl->put() returned the expected value of '%d'\n", ret);
> > +	else
> > +		pr_warn("expected kctl->put() to return '%d' but got '%d'\n", ret, retcmp);

> So this prints out a message at each access even if it succeeds.
> I believe this would flood too many messages unnecessarily.  Can it be
> better to be with debug level?

> Also, this message doesn't show any relevant information about which
> card, device and which control caused the error, and that makes
> debugging harder.  Put some prefix to identify the problematic
> control.

Might it be worth considering doing this via trace_printk() or possibly
tracepoints?  They're very low overhead and with tracepoints they're
strutured so they're more suitable for very high volume logging.

--DyOmcQbZ5ga6t5AY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmF9dkACgkQJNaLcl1U
h9B+cQgAhTD1hCDk1lpRwjuVH8/FFOYBV2cKD+SWTwzAUyqWFFSwsML9GUYMWTPy
ZGdhJjDUqYVTqGPlPJU/W2z1e2GArvs3eWyD4i5q47D+SVwQsMvBeTLpqPoKpBO8
Qf1QufvbtEnOT0bKQRBW3n7ApwD7OG8f8aFsrDMbV63g7OxivAgaJn6W3F78CEiW
xtr91/5aEB2Ugnhi0q4j+kS3CWRbfGcPwJp5VngqcAPBMtmzyaN/XagikYOXy1ii
XlEqDxC01KauByZZmU94707h9O0c/J4nomd/CQhjAuU+NIQ2xUtuGZI2sAMUZAjZ
3VdT1E36GfcJpJBYlfmdOCOuXgySvg==
=68sB
-----END PGP SIGNATURE-----

--DyOmcQbZ5ga6t5AY--
