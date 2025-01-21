Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED141D554;
	Tue, 21 Jan 2025 12:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737461897; cv=none; b=SL8QVDQ/nGFuKlEXFiQriyIpYNAam7PQE8nlD1CgWgKFWu1F3dMiAqakrgySoyu/p9uM1AH30KWMj+R/F5LUNGOjxVNR5rS31DWz70ZQ4q2XXtBwmnG+FrZzsTR63/w2wtyYfCLWx5xremipDMv6ACl+eQO7E29gMBA6vd7Es3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737461897; c=relaxed/simple;
	bh=ZKcdt5yOgwEgoH9SV2BN2o77FGdnLoyFtweZ/deWCys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JCM3rg9ux6gXutrfH/n2nWKuq4G1EHbc14uySWSBrE4OuAg/dRS7iyJfD5nrhlQRsSRN9njCimCMk1IvGCTdn4jHj/NIV82QDZldhfJ7hxUZvK0sdSt7IRpq59mDOWlkFRitSmuffw5Eri0arscrqMOEi8LwM6NaPaa8AuezrRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RpPERH0H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RpPERH0H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B065DC4CEDF;
	Tue, 21 Jan 2025 12:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737461896;
	bh=ZKcdt5yOgwEgoH9SV2BN2o77FGdnLoyFtweZ/deWCys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RpPERH0HyLSG1o9boCr585RKuBzaHbwungGX3V8uc5elq3IoS3ZJdIzacaekJAC7E
	 Vq6resPkpDUCPVodjx3S9FZyURuWO5GwNErOO8+viF/MZw0X8asNJKnnnLD5G6MwT7
	 9SsFYs59K1LNzoLBXXrVU5o6GjWvxZ9fttXGQegsv36CXF3yMFhZGMvvmOyCUQX6jW
	 0f83qXk/6aCbl0mor1TT3DVYGj32TY8HEDM/A+gnezt6Imv5RRmSMrtarxk2A3mRPp
	 mBjV8vDwYQIsZ9UjzvmaI3nVy1yDbuuhwPlrQRgOtzzoADyKCdqiGWE6BrFBOA+FdI
	 awjnLokx3CjBw==
Date: Tue, 21 Jan 2025 12:18:10 +0000
From: Mark Brown <broonie@kernel.org>
To: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: audio-graph-card2: use correct endpoint when
 getting link parameters
Message-ID: <b111824e-d691-489a-baf9-66c6e3ec7a0b@sirena.org.uk>
References: <87h65t3voj.wl-kuninori.morimoto.gx@renesas.com>
 <20250121064815.741820-1-ivo.g.dimitrov.75@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="B9Y9vN+51WQSQ5y6"
Content-Disposition: inline
In-Reply-To: <20250121064815.741820-1-ivo.g.dimitrov.75@gmail.com>
X-Cookie: <Manoj> I *like* the chicken


--B9Y9vN+51WQSQ5y6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 21, 2025 at 08:48:15AM +0200, Ivaylo Dimitrov wrote:
> When link DT nodes are parsed, most functions get port as a parameter,
> which results in port endpoint@0 always being used. However, each endpoint
> might have different settings, but those are currently ignored.

Please don't send new patches in reply to old patches or serieses, this
makes it harder for both people and tools to understand what is going
on - it can bury things in mailboxes and make it difficult to keep track
of what current patches are, both for the new patches and the old ones.

--B9Y9vN+51WQSQ5y6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmePkIEACgkQJNaLcl1U
h9C+Bwf/e63CxFiIbGR0z5Gw6WlxC0KOWzKi9+810Attmx09BpjN3d2BBWwnXxSE
FiEkYdH57jKBhx6qarjztaxNst5sGhx7YXhunYcBAYxOOOLLQ54j0usDoZCehmWQ
0GbYkkLX5CpaTfPaQWmk0l7VB8hFe3Z1j+lyXHkiiYEAUrDkdYGNam7C0hjVIpok
eeG2DIOv1oJnt4iOpF1HSFFwbtv7J/aRzELATZts/Dn1+3afRVgYWGFShWr4cdo2
BYvWSS1qd8junvibzLyVsYtlylAkRmSyrHg2qMLA3N6cL6wL5mnqTGl3xjZ7LwRh
8BWNI8mTwjZvKgpW6kRzpl07ylT+pA==
=83uW
-----END PGP SIGNATURE-----

--B9Y9vN+51WQSQ5y6--
