Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D883732E137
	for <linux-sound@vger.kernel.org>; Fri, 13 Mar 2026 13:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773409182; cv=none; b=IIMnfQLY6flpLEYiEgZFd7iNrcAJmCRRizRODxewamAcH4mo7NVeHl7KmcetaSJCsk5K90xLRM96vHyK6hKpozpbumUJ0sG3HVW0KjQPIPxG9rX6rtssdeFfOatSVUfolrPSy/rVz2vcS1lIM7N10d61rCGyyi/D2gZLDdxuP5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773409182; c=relaxed/simple;
	bh=CANl8dUSaI6r+KLxrU+3FGe/LUtCMpC+SLpMnolJq6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TEri9/IXV485ilOhsvlaLfVLuzdeUU8FGDMmvZsUFjqLcvlEEPkrJ/k5a3EHz/BHLwTDSJ6ieVifhqFxRwgfOtTatnLW3MELteUYl7VJRfNQhzPcG9wLSFlVFmEnZqi2qJIH7FTQRU5jUoEHtrjDIcHZvRYCoZj9ZDHV2znH3Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BPOxqhz8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BPOxqhz8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1B90C19421;
	Fri, 13 Mar 2026 13:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773409182;
	bh=CANl8dUSaI6r+KLxrU+3FGe/LUtCMpC+SLpMnolJq6g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BPOxqhz8PtIiNNfyF1uILwoVNtU6zsU7Ie3D/fM3tdYUXKwc1q31Fyd+2AVWFKVJT
	 6mp2ZwDmjghAMXAEhjRyriytcm/VPGfg8mcWMovrUyg+nvw5xTjCt3Hu/oKuKv/Rw3
	 3wQrx81Zz9XSjVEk74IFSYBiwbJixS3mEiy/ABk3OvN1Ej5UYKGWxiv4kc/E9D2R3e
	 CkOSkXfibZzqk0IUPXdhj7dcy69eBz94IHH6pELukUeQwVeptlmwVR/EjMdGJEhf20
	 frRTPrn3hmE+wfKS2nPXOQSXzjdWkhln+VUvGY6dWBa41Prz2HR7bdYu58lDoj2VQp
	 8fvGu9OBj3aqw==
Date: Fri, 13 Mar 2026 13:39:39 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
Subject: Re: Question about DAI count
Message-ID: <16d4f5c4-79fb-47ee-81a9-1f7c9f2ed16c@sirena.org.uk>
References: <87ldfwy16u.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WjmVhxqeHGopFVus"
Content-Disposition: inline
In-Reply-To: <87ldfwy16u.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Monitor not included.


--WjmVhxqeHGopFVus
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 13, 2026 at 01:20:55AM +0000, Kuninori Morimoto wrote:

> I want to ask about usage count.
> DAI and Component has counter which is called as "active"

...

> I'm not 100% sure, but some code are caring DAI / Component active count.
> I guess soc-pcm.c should call activate (X) / deactivate (Y) too ?

Yes, probably.

> Another concern is it calls activate (X) when starup was successed (1),
> but doesn't care when deactivate (Y) (2).
> Actually, shutdown might do nothing if it was not the target.
> So unconditional deactivate (Y) is not good, I think.

I suspect this is all just full of bugs and there's a good chance that
drivers that have been relying on it don't work properly any more if
they ever did.  It's effectively trying to do runtime PM for DAIs.

> I guess we should call activate / deactivate *from* startup/shutdown.
> These should be paired.

Yes, they need to be paired.

--WjmVhxqeHGopFVus
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm0E5oACgkQJNaLcl1U
h9DHlwf/YC2EYVqxPtkBgZjDZXrivogYdYZKURM6FKGY9N0o3bYCOdQ3Nq8RJD1b
ulVyE/6nVSg1kjmbX0q+zA0DQmKqg4r4oKm0yZ1wpm7QkO+aJ0XdadX02HiRc0zk
oKJg6eYBdw9/1IWO/dqo5bHKAdldP8nf3PcSxT76jsOBwJze2pGGejhLobnRqxm1
v4Q6oL08RPGE4sa0A8e5xOmu8F8JnW+nlrZRvH9OdePR/Fy/Bz3ruHmoBO4cHuP6
Oo/mmZqvjNvM/Lty0cRcaY3UuqM5jAy2GrVuL7sH0AosdwM+CKHhRUI8Lj34NfJo
nBHygClewlykTU9Fg+OxSlr8hfz/Mw==
=OLZw
-----END PGP SIGNATURE-----

--WjmVhxqeHGopFVus--
