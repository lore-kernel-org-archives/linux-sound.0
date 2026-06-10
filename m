Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2F53F65E0
	for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 11:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781090962; cv=none; b=CTRZpdnl596pVTAaHY0xzkzm5bfdu/8jLiSL1PNUjMCvoVbw8RZFOMvgKMaDyraLxfUA079W8CnYxb+lqmUqa4AIicchpeOjL3eiDCBg73Pl+VJU1+8g1DGGblyta/uIJR0GWq630rzhcY0D7JS0dRkF4pBa7d7efuA7nGe6g7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781090962; c=relaxed/simple;
	bh=hdGzZ+FVIoSMyj/BwDLvr74kuYY4zIbGSqdX17SVbcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cTPKKs10iZDPEH0+LOm8wFPfO8AwgZdsQqT/i285djDc9wzOUdZmkJp1QGERaltXZPYg5fN4Ho22FKAtBGlD+5NtQXC0BoR+3Xs1QU3dqRDRgpyQH0aAaKHP4XzqJx736pbOjdbr3ZtsN6ubG9wKBvKQj2ijDWBifNogkN6IYIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XJKQZ1lN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XJKQZ1lN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 820141F00898;
	Wed, 10 Jun 2026 11:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781090961;
	bh=9caPWRlkqQDCXxbKzqdJSCfqcHwA2GfdGyBQv11Cr00=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XJKQZ1lNo+7fHO1hC8NukyTWud9k3j3HYbt1z8AdOolkgG+anHzM2f8cGgUtQp4oH
	 UHTGkqaHz4cNbNBmk5V8+oNEAfaZaXmLQlbB7Q4zAyIY0E/olqpbaXYnNop/MRdvMn
	 DBrDHNAH5B9u4hJOa0VG6brmq0NPxnN7ZREqbrTWzUOxXTOjGL4UIXw6ycbzWwjgge
	 74hm+vda+Ipj23ySldjRYt6HGm2kR3KWNMkp+Hewp/bk5V+7WLrLIeo+gIDQ6xXT3p
	 UYzIyF2pY/DBn7IIbVIO/ePkqK9Lvmnnu9Bgd4Nnh3AHXvVHY8LsmXu0ZahpmzeFOx
	 2H0N+U3PUsgZw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id CFE7C1AC56C5; Wed, 10 Jun 2026 12:29:18 +0100 (BST)
Date: Wed, 10 Jun 2026 12:29:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: Re: [RFC][PATCH] ASoC: soc-ops-test: remove component from
 soc_ops_test_priv
Message-ID: <ailKjsngVh4q91C0@sirena.co.uk>
References: <878q8wcjuo.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+z7Vt0M5ZlbM7j7y"
Content-Disposition: inline
In-Reply-To: <878q8wcjuo.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Leave no stone unturned.


--+z7Vt0M5ZlbM7j7y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 03, 2026 at 04:45:51AM +0000, Kuninori Morimoto wrote:
> No need to have component in soc_ops_test_priv. Remove it.
>=20
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> In my understanding, component is not needed in soc_ops_test_priv,
> but not 100% sure. This needs Acked-by / Tested-by.

So long as it works it should be fine...  did you verify that KUnit
still works well, we do try calling generic ops?

--+z7Vt0M5ZlbM7j7y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmopSo4ACgkQJNaLcl1U
h9BniAf9FSQoiXzt2Ht4FJOTs6HtyjMTZuV72uUio5BRi8FyaztGIy8kb84jVsrL
hAZ7QCFDyo/clJ8arV2JXGBcvYI+oVNkFX/IYFxGL908QaThojmnLfuvLyrTGl4i
CMI4Ftdbt1Wtpi5jEhYY2LY0zJX8JFK3duf/yJfeNoEjPbMvIbrPrsCHFt24nMmZ
ku8HGIM0je9O5I5QMYBCljBbX+/7hFEcAYSG4lLaHDeztOG/h2aAuX+/udd+PC8y
G+0MBUF6cEF6kIiONNwqyYx9v1Boe8JsO97FCBZNvzfHq/MRG3jT2s2bBJJU/c2s
8qmzpvnqXXaOLTynGlWSc8e4Vj2V7w==
=nZP5
-----END PGP SIGNATURE-----

--+z7Vt0M5ZlbM7j7y--
