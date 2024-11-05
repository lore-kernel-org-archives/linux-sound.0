Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B27A1E2007
	for <linux-sound@vger.kernel.org>; Tue,  5 Nov 2024 19:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730833923; cv=none; b=pDqQBYXxh+MxfBzjZrAcSZDkm9Ps75emhFFmZsWrqE/OJEdexetcME5MSXl1nTbfE8/Wtx5ZG4HhkzaRNFn3++rEt2+kpleKf5wDPXQU5Nv0JkpxSOa3lNKClvfHdahFBtbwECjpJJTCG39tN0QivJ8iZUZxvr7nlriBjAswZH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730833923; c=relaxed/simple;
	bh=XsfylNx6cesTvMoFDKWiUIJg/0rM4dntjMromSzAhQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ABaKDbqhu1nZGlV/UpRIQFCY/D76fhZijDtrDaGo6PegZcxGq4nGhsIzMHSvM3wlQR44gWeNLi9yVNSKHvMWL3O8mWLkVr5xklH07qrtXGG2Y99qyi2mClYWiqVsBVrMd5AM2wj7710l9R8DlN4VY/Bexjw41/Nr3lKrtLRvRm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lELs7dY0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lELs7dY0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B30BC4CECF;
	Tue,  5 Nov 2024 19:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730833923;
	bh=XsfylNx6cesTvMoFDKWiUIJg/0rM4dntjMromSzAhQI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lELs7dY0kAGrW99LA2g0moRx9pVJN49w04h5sJxEB6ZWlT6Y0o5f01J9k4hXmPu38
	 oPVXSrRkdYH7G4lkNy8xFym8dsMwZdEPHZJ4yyKw+kM19E2reQw7fiJSsdrHM1e76P
	 IQnWFbZFOsrhzEHjuGZ68xoz23G+ndZOioKWYPoSvClFD2crpWAgtwg0Y6OqAb8hcr
	 D6zuT/wBtEcyyHgqPLYlvLfnrgCadb8sbeBb7T9dwxezbrfQj+hxEyrzYwwX4jhlkE
	 B3ogKqOVRXWo2Q+j85Zx/KwW+qFFvAdjhoiauQ20l9j8eZ3Kc8+oabMimfnNyxsEok
	 A9qpnpRJM++UA==
Date: Tue, 5 Nov 2024 19:11:59 +0000
From: Mark Brown <broonie@kernel.org>
To: Mingcong Bai <jeffbai@aosc.io>
Cc: mario.limonciello@amd.com, linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: amd: yc: fix internal mic on Xiaomi Book Pro 14
 2022
Message-ID: <d8234639-0082-474f-94e9-3b7714c13073@sirena.org.uk>
References: <8bad41b7ddbc8e061f682ecdf00a50e1@aosc.io>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gw86E9ulpVEV4jSR"
Content-Disposition: inline
In-Reply-To: <8bad41b7ddbc8e061f682ecdf00a50e1@aosc.io>
X-Cookie: <doogie> dpkg has bugs?  no way!


--gw86E9ulpVEV4jSR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 01, 2024 at 12:35:35PM +0800, Mingcong Bai wrote:
> Xiaomi Book Pro 14 2022 (MIA2210-AD) requires a quirk entry for its
> internal microphone to be enabled.

This doesn't apply against current code, please check and resend.

Applying: ASoC: amd: yc: fix internal mic on Xiaomi Book Pro 14 2022
error: git diff header lacks filename information when removing 1 leading pathname component (line 6)
error: could not build fake ancestor
Patch failed at 0001 ASoC: amd: yc: fix internal mic on Xiaomi Book Pro 14 2022

--gw86E9ulpVEV4jSR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcqbf4ACgkQJNaLcl1U
h9A7nQf/VXq8WSYcpH8PPVfMvf7EvBphdx81u9YSOAtmacTLVgIOFiycXX59nZt8
gbZ0dHS5NXv1QEXZCKQrw318XlpVYAmmIdVmTYN3VokTWOG3uhtv4786DhuhFXQn
RoNVw90/2fRipXMAppFZbsR2r2EaXZBo7Q+SGQfJ1MN7R8MnV9hEWYJOusHiM3IC
lygip4CNVzHAmvlQTRukJgYmbammRm7/cRD713oJWcen3Nvmv0gkxW1aFRJFIq1/
3ZZiuaKvMYSUP3SQyuFsTS3uvlrYRe8FTtlL7Kcg5fqOoUyAPQ9lFdOn8rrnq/tN
wiGHvZ8V7XfL4p6IvwG/rorTLnuZeQ==
=/WMm
-----END PGP SIGNATURE-----

--gw86E9ulpVEV4jSR--
