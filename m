Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C136C1DACB4
	for <linux-sound@vger.kernel.org>; Fri,  6 Dec 2024 12:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733486845; cv=none; b=dNlN1LKVuYDg37blkKpRhz2ldIw2QDbJtq1ODJWpI6zSCc8G5LUIdGkFCjFSpBi20EVc7mWz/MJYQZQVRCfZ8I3pory27OlFvSTIos3dCcxy5fcMqJjRHzdpiQA8cliBxkgrjE+uAJ5HM3jBCNtGXHLXdi5CP1ULEhHuJ8wRZfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733486845; c=relaxed/simple;
	bh=IIV4zavmhmd/H7SV/ki7hvybbkDjArtHHRSSbktiiVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AX1EL5Q/YrbNzaYODT8fEtuwPtffx8E7tuKk6ymFzwUl1sJN3bFuKXJo7u71hPodVPcWBeL3h5YCTa2f36iR2FDnQmcxLCHuM8sNtFdunXf4J5NgVZLmU4XIZzBwGM9gk28y83ZK4NZy2wx1Lwje6cy/zLYWrA2cDAWSXa3X/UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ya7f6rCr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ya7f6rCr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31CA3C4CED1;
	Fri,  6 Dec 2024 12:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733486845;
	bh=IIV4zavmhmd/H7SV/ki7hvybbkDjArtHHRSSbktiiVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ya7f6rCrwlAdgfuX96ocnrQRZc9x35DD/vjk+h4wWHYUmbgxcCNkxcQM9/a/4MyyQ
	 IPQ2q8p/lq8+GG/OW6BsMD4TMOPA14pb6wxP0orVYlU5uxddjF4OXBhdbQOhIDu9YX
	 w3eTYK6Ascq+D5gVXm18gHc/JyemelSpbbjGy5vpQcWKFfTP4j97+dsJKGj3UPmpiB
	 8UMAD3eMR9YhHIs34pzwvRGnCo5RxEjVqe1CUWX2Urla3P/Xl/6Rr8MJn6bXiAo3xt
	 eS+1VnntGsr7E47OenY45mMBpEWjB7Au9usDgpKpJpiCDv7J9mY/u3rJ8iO//HDzag
	 mVRm6xuVcDImA==
Date: Fri, 6 Dec 2024 12:07:21 +0000
From: Mark Brown <broonie@kernel.org>
To: Stephen Gordon <gordoste@iinet.net.au>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: pcm3168a: Add option to force clock consumer
Message-ID: <8a484ca1-1d3d-4a46-9513-fa0691751b06@sirena.org.uk>
References: <ea504848-eeb1-4e8e-bbf2-394114802c20@iinet.net.au>
 <5011ceef-5100-441d-b169-dabba135d27f@iinet.net.au>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="M03HwrtBxWLdBSfj"
Content-Disposition: inline
In-Reply-To: <5011ceef-5100-441d-b169-dabba135d27f@iinet.net.au>
X-Cookie: Sales tax applies.


--M03HwrtBxWLdBSfj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 06, 2024 at 10:54:43PM +1100, Stephen Gordon wrote:
> Hi,
>=20
> Resending with signoff tag and including linux-sound on CC.

As covered in submitting-patches.rst please put any administrative
information after the --- so that it is is automatically removed by
tooling.  There is no need to resubmit for this alone.

--M03HwrtBxWLdBSfj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdS6PgACgkQJNaLcl1U
h9A60wf+Koe1pDVjzbq/BG86Y5mZguQ7Wc0gSVjIq5Pew5W0ORucJ10B9VEP8sRx
oLjfcqUvhKpF1e+rMResCkBTzD9sg4bVAHXG9PzVD9jyW7uuIPvRVZVlJ7O/5cpF
E740XzLBosydcV2IiKEYleO9KT0yFmN5CSSy8KbQpP+hUykE8SargnortHnqLsCo
N/y5oVKY4kEo3edOCr7HKoa1pmrKJl1Jh/1/F2yVbLj+SAobT+3zJ5bGuPaE/dss
N7cCU/qb/reEGv7PctYCOlLNx3bQM2BJvmdzVSxGPamhlUGfAJbwjGswq6gXa605
NCAvxmzRjYTkraVlJoMcKPhXSrsNTQ==
=vy44
-----END PGP SIGNATURE-----

--M03HwrtBxWLdBSfj--
