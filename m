Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC651CD33
	for <linux-sound@vger.kernel.org>; Tue, 12 Mar 2024 16:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710261875; cv=none; b=uned7IJRIPqZyLlN50dBp7mg2kUl0ispuNwWlMhVA7l7WPGNAg5LozYq5OZsY9402cjiNJfHiQyxC+rH7CoNiA7oGciNvjQNxNd797TulVRmKoSm580l63sABrYQyWgYine8ZaacIwfUf6CY8LNdt6GNY9C780S7tuiSg87nn1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710261875; c=relaxed/simple;
	bh=IFQQ/ATOXbnoCtGeCzRHfZLY99x2O9WXPWAh6NNYgKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HfkvxQWNW4xMjDtCUvdofXZo2nDzKXg5BS7HRZDLL6T9XbagAfezgM5QRcCkDZU7jz1FOMeDJpfMTGtOzOAaBbAHvKmD6MgwCxBwCHpwdCwAXAbe2jsteE0KVTiDs7nDPDmDJnGNDVvn1kOwcmjErfF6m11vO91OTbVZ9KTDXSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pu5Qtu/0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pu5Qtu/0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAEDFC433F1;
	Tue, 12 Mar 2024 16:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710261874;
	bh=IFQQ/ATOXbnoCtGeCzRHfZLY99x2O9WXPWAh6NNYgKY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pu5Qtu/0VwF4joxaLUsFOW4k6Eh0UZxZTzG/ckNwndd/+CJezJdv0LOtTQxhB5LiR
	 sDZKfXlkVaDkfH5iqX4Pw2K9QO/LOEPSX/LOBIoqe3dr0sd1PJRtIuiz1ixZEHovo2
	 JfOKzBPBIp/vll8ThTALQnbYYfKnGlZOFuDYadUIqEt24yEXlDHixYaUA/v+HzK8DE
	 4vJNSPEUsjUfJxUtUiFvHcNeYA4k7A7jshl9gtWbeGW0ETCknNeYnnCkn6bk/Eae+q
	 dWxcHhjbq5Lw/ctMBwy9uUAn8BHAOI/POuH89CYRzmYs1RbVbK2iOjxkEaCzKB7Djh
	 4jF7LiY9yjjnA==
Date: Tue, 12 Mar 2024 16:44:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Jiawei Wang <me@jwang.link>
Cc: linux-sound@vger.kernel.org, sashal@kernel.org,
	vijendar.mukunda@amd.com
Subject: Re: [PATCH v2 1/2] ASoC: amd: yc: Revert "Fix non-functional mic on
 Lenovo 21J2"
Message-ID: <a127404b-a071-4917-8ddb-d7371c721827@sirena.org.uk>
References: <a9a4f09f-f38a-48c0-81dc-2796c6126e3e@sirena.org.uk>
 <20240312163256.886831-1-me@jwang.link>
 <20240312163256.886831-2-me@jwang.link>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8e+5UApvMIUgP5Ce"
Content-Disposition: inline
In-Reply-To: <20240312163256.886831-2-me@jwang.link>
X-Cookie: Neutrinos have bad breadth.


--8e+5UApvMIUgP5Ce
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 13, 2024 at 12:32:55AM +0800, Jiawei Wang wrote:
> This reverts commit ed00a6945dc32462c2d3744a3518d2316da66fcc,
> which added a quirk entry to enable the Yellow Carp (YC)
> driver for the Lenovo 21J2 laptop.

This still doesn't apply against my for-6.9 branch.

--8e+5UApvMIUgP5Ce
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXwhm0ACgkQJNaLcl1U
h9Awogf/YvwYl7lAh+8nPcd/a7Gd4f7Eh8z1gmKwW2ULYMfdUYAvWJ/xyr8bOVuX
VTr5Bv1T4ilFprLW/vuGoNb0EorVCXCbzuKmgVcfB74rWB0T0C134Zhpk+Cb/F7+
kPx6Qfz1mH3n2R0kmvBGSiKIxuvnlj6xJuycoqvzSCgmtm4fBcvgbsHjW3tfsTgt
6GtaMM+zu/SaFl2YsZ0U4PZaKbFobXNzGV9xxOrQCHgz0U1WKYQWw0bovY+FDQ5v
xrfE0G/IuxWCkRpOm7kL7wh2acfxo1Ua/kpPGfF8DGOQfsQGAQdfrE/YgaCn/mOY
cPV1SJaPOIEJ5Eb60usHpXbYNagp0A==
=IQ2s
-----END PGP SIGNATURE-----

--8e+5UApvMIUgP5Ce--
