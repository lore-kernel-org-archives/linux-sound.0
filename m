Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1D623A6
	for <linux-sound@vger.kernel.org>; Mon,  3 Feb 2025 00:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738543084; cv=none; b=SMD87nNgkkrCh5k8UV+oo9KqbBGBK0oqsPe+x9h6uDycHF/rQotf2n+14egJT8Gus3cLEniZmF9ot63AS8lp8xGh6zobDbt1T3uvTqZTpKSmFMbs8lErEDRhtY9EREQP+sI2I4LXbvqcQxvaizjuJNJhFSXBwVpX/rCDp5pzk5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738543084; c=relaxed/simple;
	bh=4TQUJKRXlmdNZynbNKMPfE7i11ANZ1V5iA23lnAPDII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J8GjmFKuFloqOesp6YqOkyqz0eobBOI4zFQAODEkKS/mCHVVOaPi3zh61JD9LTWHHnxLo8bcHEs/6K4G8Q8QhE7y9HX0PJTH/C4JbABc/v9oeBfndy9fnohAYfsHO6BgbEdHipda7BMeUzJzbIGBlCa/j00TvDYFQALkePSZRgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sQIIQQ9+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sQIIQQ9+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AF78C4CED1;
	Mon,  3 Feb 2025 00:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738543083;
	bh=4TQUJKRXlmdNZynbNKMPfE7i11ANZ1V5iA23lnAPDII=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sQIIQQ9++5Sp7XxlI7hwzNTMpFlI0YqZf17E/ExpDEt/e4jbTiuO8TGgzx/7tDtQE
	 hVANSjOtPEsFj6A7yme3s5aYYaIrN/GEFf+I4mOTe84fX11xAc67VqETWjLGHXqrO8
	 Ri81S5RvB0dpGd2QEe217vnItyjwPDGvxuLfQJuMugOwmRixpMLZAePZLZqy7FWjr4
	 z6PRUbYPzb8dvae1i1G3auWzsOFoPFZwWtg7kwn1oZvRc9IBo8YJS5bu4hgHE6sRyt
	 r0SBACDBuB8nPn4+5HX7FpRx8zlIXSCmPYos+ScKYBwNg0EEWXrKn+RYtPhhb6NF+X
	 igacCZTLuac9Q==
Date: Mon, 3 Feb 2025 00:37:58 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: soc-core: add snd_soc_dapm_add_routes_with_card()
Message-ID: <729fe828-3048-4b61-b2bb-93aa9c8d14c6@sirena.org.uk>
References: <874j33nlvb.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SKOjDUxA1e/xdfb3"
Content-Disposition: inline
In-Reply-To: <874j33nlvb.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: I'm wearing PAMPERS!!


--SKOjDUxA1e/xdfb3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 17, 2024 at 01:23:20AM +0000, Kuninori Morimoto wrote:
> Some device want to ignore snd_soc_dapm_add_routes() error, thus
> card->disable_route_checks flags had been added for such purpose. Because
> of this, ASoC has duplicate code for it. Let's adds new
> snd_soc_dapm_add_routes_with_card(), and share the error message handling.
>=20
> We don't need to indicate error message on this function, because it will
> be indicated from snd_soc_dapm_add_route().

This doesn't apply against current code, please check and resend.

--SKOjDUxA1e/xdfb3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmegD+UACgkQJNaLcl1U
h9DTLQf/RkAVEUJ2H74z71uvChCNMfSIFaWSkQ2azwxUdXeVnkK3TkQ8pcMmrXCA
vTjtYODTI871mAd9nzB4cgwV8rx8zRF9m+f7oYJ7jDXB4N4xoNVDTjbqVpq0x0QE
o8EdJetV1UKsOatgIBdqD7Ap7NWADClANIaq61I6bteqxuPsMzZ0hQsDwrP3C6yw
1Ktimadpmxre1ZYCI7x1IBK4wsFnpNHdbs6l/DAh1S7Vx+8iNtyqZ9XW3UBSGz7S
XZ7LNY9HBveSzf/M9EiP7KMM6P86ciELjgk0MqRX9iQMDrNG/hIMKOqCR/8/ulrr
XwU0CptW5ZYNJv9Ei01//ztgX0O3ag==
=De44
-----END PGP SIGNATURE-----

--SKOjDUxA1e/xdfb3--
