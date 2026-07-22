Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8ECB3019DC
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 13:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784727395; cv=none; b=FoqMy7BvqvmEqoZsbuT89XQ/DqlDjN3Cg6Ucxa+FSWyNeXwRAIe6yecdptpunssDvBKY4AykG48paXoi05iSkbW9k2IUAwqNaRufK/FI/BnMuo3ekhKWkihK9hdXjsaBXQig6Ev43Capl98icPlJFf4Yv4w1/El/O/h81AmhYCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784727395; c=relaxed/simple;
	bh=T/I29ZhAvdVvm+JEpvLThQsE3OzZPnuDOGYDX9oa7XE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ukGpeIu7sBWIkYAq3orFRrBg5uHgCTz+IRcIkpYPEfoHEFJ2OPpRUn/YX+qeb4J7RVQVc6uXnutzjh+FBdiRihMvGNz3wk/BPDZOm8a5EhC0IgVEu5itG5aAEV43APZCDs5pPl+0p/sqGNu6Eg2Vz/MmfwkaqK6q7HiTSYPeaW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f+OAQc2v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f+OAQc2v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 746321F00A3D;
	Wed, 22 Jul 2026 13:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784727394;
	bh=T/I29ZhAvdVvm+JEpvLThQsE3OzZPnuDOGYDX9oa7XE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=f+OAQc2vFegTD9+wCnigv6Ybq6ikwsKiusFuL/naNVePNSWAedm/ogvJlJ+mESMHn
	 /gHYpFXimoDw+hnKwUXLl+0p7hrApvgxxqWos5IRq3VYCUXhSs/dRim7EOA2pfv40v
	 0Ukk6rYdt+t51Svd/+HeS2xqqDIFwG2leQB18hGuqyaejTQOs+YV6TMulS/s8aeKlx
	 3Ya9lMz4o9edIDeNzLMNXJ2beIcg3WXHZnUbnhtvZ7104xGbBHqGQXDcU2/qs9ZqnO
	 AEi2AFwU0PGBEwt1Q+Qkxu5uccd5q9jHm1hAwi1bkTFDjWEK7AcI97dbobaGWoRwGH
	 vJhculfALPTqg==
Date: Wed, 22 Jul 2026 14:36:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Takashi Iwai <tiwai@suse.com>, Xiubo Li <Xiubo.Lee@gmail.com>
Subject: Re: [PATCH v4 01/12] ASoC: soc-component: move
 soc_component_field_shift()
Message-ID: <b0e44e5d-7649-40ed-8f17-e61b654c1733@sirena.org.uk>
References: <87qzkxjg53.wl-kuninori.morimoto.gx@renesas.com>
 <87pl0hjg4g.wl-kuninori.morimoto.gx@renesas.com>
 <d2670363-bbfc-479b-a214-62aec13dde7b@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="M2/t2OEqUq58yaPa"
Content-Disposition: inline
In-Reply-To: <d2670363-bbfc-479b-a214-62aec13dde7b@intel.com>
X-Cookie: Life is like an analogy.


--M2/t2OEqUq58yaPa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2026 at 11:56:36AM +0200, Cezary Rojewski wrote:
> On 7/21/2026 3:17 AM, Kuninori Morimoto wrote:
> > soc_component_field_shift() is used from
> > snd_soc_component_{read/write}_field(). It is better to located around
> > them.
> >=20
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
>=20
> Shouldn't the sign-off tag be the last one?

Yeah, though it's not the end of the world so long as the signoffs
themselves are in the right order.

--M2/t2OEqUq58yaPa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpgx1wACgkQJNaLcl1U
h9BLaAf+KDCVm2/q7PHRU84/kvDAQJuCDX2fWM44U00ZKQJqfVfia1OfKlKp0s3j
wwM/3tofIQeBWarEDW9jHTb4zNwVNb1FzpRqmXDNEdQOHqQvXr4jizAYKQJ0t6eV
SRUAMHALJEGM5r1Z7dv2qP9qHUV4ePQ1d7vFgTKJ/eVZz62I4ZRLUsA6PKAM2Jn+
pySA+nmjrHdOmRpLvUrd4A+IgMX8GD2hGeOLN2uPy1pyZGhmIqggh36OVcxDaF+M
rn212/5eY+93zMCLaRb73JD5Q5ijA2AR8pW3qeuTtvtKDVRxkXwBi7Hr+VNJg1bX
iTcVxn6SSVthFTMUPy+bRofbTCXr8Q==
=r1Ee
-----END PGP SIGNATURE-----

--M2/t2OEqUq58yaPa--
