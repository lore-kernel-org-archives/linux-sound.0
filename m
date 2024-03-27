Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8D812A141
	for <linux-sound@vger.kernel.org>; Wed, 27 Mar 2024 14:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711549120; cv=none; b=PLN+99s7mxIOtLDPCh7zQX+qxOId6lHVAXmaj/3QtwcEpByyUxbyB05qvI7h9LcEi8Veuj70vEEBejLrr7sbg7nc/YnJ/zvexkLtV3EBOM6laFU1io8OWj/J1AXrpivWGbzwNOa3EyQ7Er07MjLWlggQVyNLDU+tgLVrjPxAkGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711549120; c=relaxed/simple;
	bh=yx54pdvylagjEOh5wy8B9pc9qeW4Nkhl/bROIbttvdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h1RUYoQ7rmu4c8rPSS0GIQ7zTFpzuuIBAMlZpq5A+WemDzDDR2Nz9ixTcIRi5drMG5IdM6TPkUM2nEoFgBu2zNp+h3So/rAnSmarubQYzsuUpJSGilduo2rytFN3J9uV71XiZzqcRAHHs7JC1Nb6GbhFiDUa1LO9JKGsoqTA/u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YDMpd+wM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YDMpd+wM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BC30C433C7;
	Wed, 27 Mar 2024 14:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711549120;
	bh=yx54pdvylagjEOh5wy8B9pc9qeW4Nkhl/bROIbttvdE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YDMpd+wMbuR0+M8y77GTlptAqQT01kWl33O1qrQFlPqVfcAJ+7qx7y+GjxK6NdhIx
	 NJzREWrSOheL4KwyC4YGuVwCLbcpQ5VDjLFlrlE10cuTDQhPmizfvhD9O8Wr6xYRpL
	 aAoIfzfOKyDt6YGXwrBih3W0U+7NVw7lOiKYMV2XQbbuchkvOzDAjwTYyeESzJHVuY
	 PZumnbGwdGYKE9a3RM/QU6OzmA1o6HcghhGg56Gb/cH97T3qgsS5wgRmvMeOLD4NR9
	 Wo/dAYOH2ozN1/9v9oD8BnvRljRAwv1eNcrfgbl442KTJZyKSDTAvs7m2xdItr+qmK
	 /z4ffXbqt/Xjg==
Date: Wed, 27 Mar 2024 14:18:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Sukai Huang <sukaih@student.unimelb.edu.au>
Cc: linux-sound@vger.kernel.org
Subject: Re: Request to Add DMI Quirk for Lenovo IdeaPad Pro 5 16AHP9
Message-ID: <01a85207-990f-4fb3-8852-a61094664815@sirena.org.uk>
References: <CAE1pm7Pn3p9-9N4CDDL6mnS2KBw62FYypvBVKPQzoS6_RSLJOQ@mail.gmail.com>
 <39f47d0d-337e-41f3-b110-2f6326f6f4ae@sirena.org.uk>
 <CAE1pm7OFXv9fC+Oxh3nWpxQNQCuNLZUGpmfY+aG+8HGhy4GFiA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3Dn0dtu4HEJx9vQq"
Content-Disposition: inline
In-Reply-To: <CAE1pm7OFXv9fC+Oxh3nWpxQNQCuNLZUGpmfY+aG+8HGhy4GFiA@mail.gmail.com>
X-Cookie: A rolling disk gathers no MOS.


--3Dn0dtu4HEJx9vQq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 27, 2024 at 10:48:16AM +1100, Sukai Huang wrote:
> From bfe53271fce81b87b8a0ff63c94f05dba2f39d43 Mon Sep 17 00:00:00 2001
> Date: Wed, 27 Mar 2024 10:23:23 +1100
> Subject: Request to ASoC: amd: yc: Fix non-functional mic on Lenovo 83D5
>=20
> Like many other models, the Lenovo 83D5 (IdeaPad Pro 5 16AHP9) needs a
> quirk entry for the internal microphone to function. Once added, DMIC
> capture dmic-hifi-0 device can be found by `arecord -l`
>=20
> Reported by: Sukai Huang <sukaih@student.unimelb.edu.au>
> ---

Sorry, for licensing reasons you need to add a Signed-off-by here (see
submitting-patches.rst for an explanation of what that's about).

--3Dn0dtu4HEJx9vQq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmYEKrsACgkQJNaLcl1U
h9APVgf+LVyKqd4Txv6wOz6ItqmGereR94Jan+0uRlMjlLBSUSze51bKNIilVn0W
KqMzd6IT5eJ3JVNaOZVzX+hhlYJlMheae3HpSsfFKR9BGp3hyrB4Db39PHfKkNql
uZ2GqMqAG6TI0oK2SJRMLvf6FeN1YZzLF82NFw3v8+j15r0+iSr8b9E+hi+CPlpZ
/aRiVnkosts0swNVeFh2eMse10VGSFzUcpVXi9IN6IgRMoRruKG0TSxUWfATkUYg
vtJxQLcDaz4SjRsBr4ez3QIAA7tHxTfxGrJhb342EABSz5oBnBgR1+NwrL2zFLim
/556RPy64DNMHlg8PrNmWzrRTv43Zg==
=VcSY
-----END PGP SIGNATURE-----

--3Dn0dtu4HEJx9vQq--
