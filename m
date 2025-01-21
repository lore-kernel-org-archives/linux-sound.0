Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936281F03EA;
	Tue, 21 Jan 2025 13:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737466910; cv=none; b=pj6dSXCOYbgEa1PLyETkCley1XjdZnQ09Rr4m5qVhTPzMmkzRfTp7V01sReGHaS/k88XQUEAQfR8+GOCqYhvvXtSs6W2aI7xnMxtzVmj7PnIoYz95qfde90rQXyHWnRrEBMvR1XGDXcx5McuJ4bhZsRk7TjQXqb29L1zBZhwEjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737466910; c=relaxed/simple;
	bh=oT+/C689ekR7ZO2PgHLLEk3xG6/Rcwpfb5XQoN052qU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CjzZXuA7RBY71R9iNIT2/FgFiEZNxy9uMcvqocVveWN5W0dI4crdxYbsthHR1ixbD0ETmH24cKv0DYkMQEK1ZUwjeYyidTpc2mkfzqCv34Cax41tIgxDTl9S+BNe90q6+x6FB76uoSdldHNkaLw0dPolyLpgHBIBAMqJKyP8XTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dp9PoSAr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dp9PoSAr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB81FC4CEDF;
	Tue, 21 Jan 2025 13:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737466910;
	bh=oT+/C689ekR7ZO2PgHLLEk3xG6/Rcwpfb5XQoN052qU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dp9PoSArUWVTVphaSX8vRBlDuEAA/hwYSH87L/TuwnHWla2l6uwvan0YJxAEgvlul
	 5pdmSnaK4Uuxt08pHW9AgAUnL4eqSNObbfmEPeHwK5Q9sxzUjoxHGqye2OF6LOL8SW
	 AOV7IHoNCyz6+/cRK1Ixb3qMwsWOORhwneKMP0WOShaVIGa6Vmdpn20uSnNWKIO3oy
	 kpMLX+mIHXmJdleQWDM4w6EE3kD28ElAFiqCtlA4Vq4h313JMVzHLvqNYjtr0mzOM6
	 xCF9dushW2cjs8Fh1LNIl06zROAwROG5wZpAK8BQBOi4R0wvl1nxudVtCM5tyKTvnU
	 arg7FL1H7lHjA==
Date: Tue, 21 Jan 2025 13:41:46 +0000
From: Mark Brown <broonie@kernel.org>
To: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: audio-graph-card2: use correct endpoint when
 getting link parameters
Message-ID: <5a7b0bec-8592-45cf-b0c9-45184ddcc38e@sirena.org.uk>
References: <87h65t3voj.wl-kuninori.morimoto.gx@renesas.com>
 <20250121064815.741820-1-ivo.g.dimitrov.75@gmail.com>
 <b111824e-d691-489a-baf9-66c6e3ec7a0b@sirena.org.uk>
 <da9642c9-a6e0-4846-a438-a5c84334cf36@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6aNe6pIFuXEXtN5U"
Content-Disposition: inline
In-Reply-To: <da9642c9-a6e0-4846-a438-a5c84334cf36@gmail.com>
X-Cookie: <Manoj> I *like* the chicken


--6aNe6pIFuXEXtN5U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 21, 2025 at 03:33:30PM +0200, Ivaylo Dimitrov wrote:

> Ok, will know for the future. Shall I resend?

No need, it's fine - hopefully Morimoto-san can review.

--6aNe6pIFuXEXtN5U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmePpBkACgkQJNaLcl1U
h9CacQf/ecVjjf+E6K3wcZ/CaimG6v4v+19N5zTyADrJfv9YkXVANnFkl4eng0Sb
jx/FaFxrZR4TRc1NG8CgPPlHioGRITcsF/TZqU8N78DEh6Ri6Q0lJQCUlKr0Rxx6
8NgwLEaF18a5ZoaUYoVfyWFm59rcumxpP9Uqlgh/5X3k2wiMeKoOVdvjQnhexrGy
q3Gk2SVbMmUnXZbfQV2ddnS2aJj2kkE/07cJge3fjX5a04W3hjDbKYepw1ydK9zs
bui6VgY4CbacBBULzYbjIG1Ihq1mX1Zn1yNwfHAUDXi7pWlMOx++S+090lMG0Kh2
Z5dbVuQS5KzwMH180uA3uTka4G9/SQ==
=SXQp
-----END PGP SIGNATURE-----

--6aNe6pIFuXEXtN5U--
