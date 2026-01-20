Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346F94508F8
	for <linux-sound@vger.kernel.org>; Tue, 20 Jan 2026 18:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768932911; cv=none; b=EJDrnbdpGArzjZfw20pjYD9ZO0m3/NcDqasUWzffRNoZB4sjGX+3euBUnuYmKy2+aBGuK+l852UuNg1tPrhsELKlgtVVHoI3/YaRh2w/c5EWwSv0ajOhDmWjbhpUesKq/rMw/IAoimdZ0xqA3DDe5QU40cB16ghzUEcX+QOwBX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768932911; c=relaxed/simple;
	bh=tqLyrbzUtxdeXqt17tBsNudefj+fEaJkHasbnfsIP5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=juiVtqN8yF8hTejKo7cFNHR470NneMIr6WuHFaE5vZq8gm14n3ueNJrujVmtGePk+KHSqbjQVBcJQ1B1C603XlSkP80jzcCD55NIEelvKCfylYqC1b+243lfBf10jWFFvcT8Baq5VA8DPSZ6qHvG6IWOGIpFd9KhM1zicEKGVQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fiCfqPS/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fiCfqPS/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF6A0C16AAE;
	Tue, 20 Jan 2026 18:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768932910;
	bh=tqLyrbzUtxdeXqt17tBsNudefj+fEaJkHasbnfsIP5E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fiCfqPS/gdjL74K00vDuYuqxNB2lZBfuXhsfTM1m/GlwSUw5EULYbUqqjsXX/aPei
	 MsHFxJ714dOrr8otYTkdKxNSu9SMsakC4/RQS6ZQRdkktjHZoQlHtcAR/Cm6IUm7dc
	 JVZx0tzq3xIbxqEJ+TKHXFo/fgHRizLeQAd/kxUAfJqZeb0Fomt6pMCTXIt1yCoCAW
	 v8unigpa4FNaZcDrLgCwATajZB94qaUuBTVP2qM94zhAQHrYvYj1UCUtMtPpO3xM1Q
	 A/8dHCoR3wT1kwJRkYpuz+35Uh91I5CSF4x2FT8BBdC72uWTSrTJva2l0wwYL3R/j4
	 tgacse7rfXwxw==
Date: Tue, 20 Jan 2026 18:15:07 +0000
From: Mark Brown <broonie@kernel.org>
To: Sven Rettig <retto@gmx.net>
Cc: linux-sound@vger.kernel.org
Subject: Re: PATCH: ASoC: amd: yc: Fix microphone on ASUS PM1503CDA
Message-ID: <de5b78d2-f585-4a50-988f-16eebf764e33@sirena.org.uk>
References: <4506ea87-d4c2-4db9-80f8-267a7a015cf2@gmx.net>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XqhCEKLEIw70M0sk"
Content-Disposition: inline
In-Reply-To: <4506ea87-d4c2-4db9-80f8-267a7a015cf2@gmx.net>
X-Cookie: I'm ANN LANDERS!!  I can SHOPLIFT!!


--XqhCEKLEIw70M0sk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 18, 2026 at 02:32:42PM +0100, Sven Rettig wrote:
> Add DMI match for ASUSTeK COMPUTER INC. PM1503CDA to enable the internal
> microphone.
>=20
> Signed-off-by: Sven Rettig <retto@gmx.net>

> --- sound/soc/amd/yc/acp6x-mach.c.orig	2026-01-18 14:09:58.370727062 +0100
> +++ sound/soc/amd/yc/acp6x-mach.c	2026-01-18 14:10:54.532336621 +0100

As covered in submitting-patches.rst patches should be in a form that
can be applied by git am, such that patch -p1 can consume them:

Applying: PATCH: ASoC: amd: yc: Fix microphone on ASUS PM1503CDA
error: sha1 information is lacking or useless (soc/amd/yc/acp6x-mach.c).
error: could not build fake ancestor
Patch failed at 0001 PATCH: ASoC: amd: yc: Fix microphone on ASUS PM1503CDA


--XqhCEKLEIw70M0sk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlvxioACgkQJNaLcl1U
h9DkgAf/SQ8FAtvpz3ImSHJM36qCMliD0PAY1VY2d+meqiE8WwMCT1GSj0Ks0QmS
52e+oAtgOvXfGntE+7R9UhlUq6TwqHXl9HsbI8aVwpTpI2Yj2iYh0KyrogjXNqWt
5nZ+xp/wvBPWpRLUm4tcxrm9OSnXV5YDI+rBpzx+CU5hczvnB4W4YkIN2DfyyQsf
HB4RtL4JNAAROrABYSSHFOMvjMltRsybJwISDkTQ8DjaUXG7gVnV1Sa4gaO36rKy
Xyx7jumoHkesuEpTYLK07GyP5bUiQaOy+mWzBnpHCE5WJ9PyO4x9bYoxu1LBWnTv
Pz9F1bBvX8/qBkWf2UHf2oGNvmkOXw==
=M8AY
-----END PGP SIGNATURE-----

--XqhCEKLEIw70M0sk--
