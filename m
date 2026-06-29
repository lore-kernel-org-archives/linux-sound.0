Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9256236DA04;
	Mon, 29 Jun 2026 11:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782731830; cv=none; b=VCGRcL8mLA6RBcTncEovRRE5+qt5X+dXm1wJdPVHTS5Co3rtqON+tXuTGMK6wlhILhggV7ax52d7rlYrZ9fi2G4bs/yKr1sGi+yVxZmJw1SLXgUQbCTQpMnitAXVmJTE5Hi4A5WEYWNjRH0wTF61G66GUiUZDG8aiuupbH/NL1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782731830; c=relaxed/simple;
	bh=RAoFJgva2OnXFgc+hG2ERuMvz4Y3eEdIecTjeIOc9bU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QmKWzq6S7I5MlMYx8Bn6u1LKLueSAgHRd5l+wUFy30Z+toHwjd28IkkqwokwrPVre+dQ4B+TrOdquJAbojCvyZSdJ9hs/G7nxI2wjg0xWmtyjPCwRz3nZk87kMTBm+QXHh2d6mzpZUERH5BgqcfTk+Ol0VdG88AYAiLlVVeiSqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oWNxJPpi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oWNxJPpi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D99751F000E9;
	Mon, 29 Jun 2026 11:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782731829;
	bh=oMPAh37KwybGZcR5RFOuI4DyOQCzHhSpxnlzwI6uDGY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oWNxJPpi04a5yzN1p35HYelJNO089ZpIMQ9NN7m9LIHZdMdvCiJgi/K632pTjK/fG
	 9TplplIDVgaz8liV7ldeUTuBncNSZqfeh4aUkkeDDOLzG8fZNxT8DE5QJupw1r0Jsb
	 ZhahLK/5zphSJaYkLBbHiGG2WR3jG54mkJjsJsgAfYewjaarJSQD3Aq+rmJmbEG9O9
	 RHKN/fY+SJ0sIdoEoQstCFp38R79bs8OuwWfAnaZavXAV5kROh+Hhsv/Tcrwu8OU4H
	 jbOfxeJ54ENcIB6pnp0HAFq7S1nYY3LHDXXij62zt/Zb7sNdk3SeVYj7V12U0gNt5q
	 v0sjnBoByrxbA==
Date: Mon, 29 Jun 2026 12:17:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 03/17] ASoC: rockchip: rockchip_sai: #include
 <linux/platform_device.h> explicitly
Message-ID: <8dcfcd10-4b9d-4775-9e23-3884b896a7b9@sirena.org.uk>
References: <cover.1782490566.git.u.kleine-koenig@baylibre.com>
 <d2fe7dc85277b01526f9320ed5baab2acd29660b.1782490566.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HJyhBMaH9dnz+AzZ"
Content-Disposition: inline
In-Reply-To: <d2fe7dc85277b01526f9320ed5baab2acd29660b.1782490566.git.u.kleine-koenig@baylibre.com>


--HJyhBMaH9dnz+AzZ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 08:00:22PM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> Currently that header is only included via:
>=20
> 	<sound/dmaengine_pcm.h> ->
> 	<sound/soc.h> ->
> 	<linux/platform_device.h>

Acked-by: Mark Brown <broonie@kernel.org>

--HJyhBMaH9dnz+AzZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpCVC8ACgkQJNaLcl1U
h9BEaQf+LJKVjBR3CzfB5LfeTicF2UG1SITyPebmdLt+bwwJIPIgmCv6j8lpadLr
/LqHY5ijaBG9wrx97zfqolLd1p2JS6aXEjUZrpyd2Qmwuee4p1g/h4xG1g7l5x04
RMAOa/z8PmmYZEgZ/ASTyQ8Wm8AUOtvM+2ArPr0bxhLcnSLQhpSneG8cw6Swm8dd
Jb2uCXxGvffL9jt422oyK6rJGxCg/vuTAJjFoi1FMOiSsp4XeVCOSCtJD6wgfsLj
M5LmMJJ88yAJanf4SnBEed464Jfbx+V1cL4ZN2kOu17o5OKBdUy58sGXnZtdUdph
uT+DGfzAzsR20BYjYjyxsQLiaoLFhg==
=7V8g
-----END PGP SIGNATURE-----

--HJyhBMaH9dnz+AzZ--
