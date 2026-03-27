Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D952D838E
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 18:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774637556; cv=none; b=QgSVviOCMRtA3JGZY4GniPF82rNuXSfCqrfA6teGpExT1VVPeyKOiMYd808vaBrVjFuxEY7LQZED6i4FFDj9Mthg1aoUj7jdW09VnEi0lhHBvkUM7NyVvYP2jexjAdMXhl+pVewX4Dq3BvQN7y/atafR07OtY2T7CF6UnMpjxd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774637556; c=relaxed/simple;
	bh=KgZQltZ3T51qJL40Die9qTtnRHJcoDyfzv7d2Ug+AT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R1aNshg7ixDbgCq2RXFdcNCyubFbIBcTYvhkAoYNnWxbnFqMYyOnhSJ+bLTmHAD3d9fYzP2OW/SlYFcATb93TXpal0Z4kp1tO7QXla88salPOxRorsTPw3X8BLHln/nv5rIKXaxjAipoWf7OmZlss8D2UVpxn9Lf/lSrD4N1w5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m4HzLF+f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m4HzLF+f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72E51C19424;
	Fri, 27 Mar 2026 18:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774637555;
	bh=KgZQltZ3T51qJL40Die9qTtnRHJcoDyfzv7d2Ug+AT8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m4HzLF+furtQLvnj8zvX+evCnt1S61aYWdNDjNzdLKgNYDh7CxgedRx1XcyzrrG/T
	 JrQXrE9ClbzvangclhJYNVymnWR8ELz8jF/C7dR750TrUNQmZRrvbhY5Q/1dnGwUj/
	 M9uYdloFKlDKkx8I7iz2J+AXKU+hl5QrOewJomXxkkEJaQeOFwnbmMUK7DfxhBOZuz
	 moP33TvIu1hHRnpVV4UsXzBb0KCDsv07qxvLf4QEQQX4FfkjdjoEmVargQ1nPdioZk
	 5VGKpacpeNhuyZDNHW+xo+uxdhRXHxN0a9Cy//CGKvaDzEzZl3rJ2SUFbs665Hag/w
	 tDV/t2ldGpfjw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 34B971AC5847; Fri, 27 Mar 2026 18:52:33 +0000 (GMT)
Date: Fri, 27 Mar 2026 18:52:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v7.0-rc5
Message-ID: <acbR8X6DbMaAhVj-@sirena.co.uk>
References: <20260327184954.2E1221AC5847@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zNivFVgAgFZfE+1Q"
Content-Disposition: inline
In-Reply-To: <20260327184954.2E1221AC5847@finisterre.sirena.org.uk>
X-Cookie: Identify your visitor.


--zNivFVgAgFZfE+1Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2026 at 06:49:53PM +0000, Mark Brown wrote:
> The following changes since commit c369299895a591d96745d6492d4888259b004a=
9e:
>=20
>   Linux 7.0-rc5 (2026-03-22 14:42:17 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/=
asoc-fix-v7.0-rc5

Sorry, my script got confused by me moving between machines.

--zNivFVgAgFZfE+1Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnG0fAACgkQJNaLcl1U
h9AbWAf/bDsTR5ZOame1cPhGOGkfR4S9GYPBBAnxk7VhKG6PTi4tWX06nn8CC5km
+IHz01nqvaNqHDEQ3QDGGBCyTRZ41etzHSQFyixlyFPaiNRG3OqWU4kC2EIvzVjM
eB7fRhkC5ksbl0opxxrvcHILhrRUjjPfqvL3cO1recchhjt2qzEektw+Gcc3PwhV
Fp1bJCLQsGVBPhREBP1T4zOwLQiRhsL3W8G89iJpPSvmIQHGrkKt/p82orRJ/9T8
KT84fBxTJ/Q4Zm9STYnCzWIZbSWOVui7e6WRbcxMhK0wLxhfeXBm4XoHZNXTJxMv
eGp5B1sqrtoLPrG+tBpzho5/q3teTw==
=OzLz
-----END PGP SIGNATURE-----

--zNivFVgAgFZfE+1Q--
