Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD8953389
	for <linux-sound@vger.kernel.org>; Tue, 17 Sep 2024 09:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726563748; cv=none; b=F2cjEfZq8Y9jiuYfeXRQidcdg/AFZALSeKNmz7xD2uTePIArSnGfkJDHWp0a2cGyaSdv8Q5Tyyq4OZ+tKonmGZFXGGDDGX1rfTaOD0f30l7RqzAh6c9w0moJmriQ7AZBDxA1EHthTFCLefB1JFafwNT5YZdJDf/d7rap1zcMBEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726563748; c=relaxed/simple;
	bh=bSRixtAWHVVIwr2GzKE3LSqNFD9OgQW5JQeRtqPz+20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jMLJpbAB3qnKBDvtWd2uxJG2G2gFsoHwMHU0MhVOpx8DrAGn6IeM6pW5AGmlx1Xp/KDxJxZNviDGKe1Chc0sPW4b8ZAMufM2tTb74X/3zNHCLZ0k2lhlkZkimuGlNVfAGTpdBcfHwFAn10quX0h+zQ6b455vevmiB3CwFPQxzOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=svhfgCbM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="svhfgCbM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D91BAC4CEC5;
	Tue, 17 Sep 2024 09:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726563748;
	bh=bSRixtAWHVVIwr2GzKE3LSqNFD9OgQW5JQeRtqPz+20=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=svhfgCbMw9ARucec0VE7+EK4GO1WMLFoFSJ9MVptPCx1yNP7jRw5icXD/ziG8PGZD
	 Q+LlGuEiCqUjD58DANauFKkwsloDV+pt8onSTK9mk91ACJ3RPc5XHRELatg1JITIGT
	 6Re04C/RV+L5ARfY0iOgpCYEQgH/jGv0lqkqNwx8I+HBw1y969FUYgPGi2eJ+panZZ
	 C3pG/ONEsXdJZ/aRLdBe+njjZSrXUv+sZsfeqHjB2OvJDQ/b1HcWQifZMx+0kS9hGp
	 mLDqpiweqfFA5aV7xEqIvrQ38y6OaSmLnaX99RbAT0daYnbcUb6JG4eGr6VpbH80ax
	 469SzAzBWHOYQ==
Date: Tue, 17 Sep 2024 11:02:23 +0200
From: Mark Brown <broonie@kernel.org>
To: David Glanzman <davidglanzman@yahoo.com>
Cc: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Re: [PATCH] ASoC: amd: yc: Add quirk for HP Dragonfly pro one
Message-ID: <ZulFn0Vbz9XUHA-r@finisterre.sirena.org.uk>
References: <229243264.8919425.1726551100908.ref@mail.yahoo.com>
 <229243264.8919425.1726551100908@mail.yahoo.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="A1n6xOuh83IEj0Y4"
Content-Disposition: inline
In-Reply-To: <229243264.8919425.1726551100908@mail.yahoo.com>
X-Cookie: Results vary by individual.


--A1n6xOuh83IEj0Y4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 17, 2024 at 05:31:40AM +0000, David Glanzman wrote:
>=20
> Adds a quirk entry to enable the mic on HP Dragonfly pro one laptop

This doesn't apply, it looks like you've had spaces converted into tabs.
Consider using git send-email or b4=20

   https://b4.docs.kernel.org/en/latest/

to send the patch

--A1n6xOuh83IEj0Y4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbpRZ4ACgkQJNaLcl1U
h9Cy8gf8C9ejIvc7ohJdOGFJufX0OivMYKqFX59880aHOaEYvaYJNWoFXF1lsNaH
jGwtA6u1ve2yqK+v7teNkKW/j9EsCj7KuyYX95xtRBr0IIL4wBJafO966HwWhFDu
cPqVPm163RPQUbzBrPXay/eqMCUeMroES79zWNZiCMtTBgiaQXIdhxEyslWE/LNc
RPXAgj4abLr6qTDcZSp+0YJky/W7wF31K/jSmJAWoeRNJ3GUswSY7Mr65voUAx6Q
frHMsy7ernYy8CBEbPBL0tBEuv7JxyH9IC8qcYqzR+W6Th+fRv6mUzX1RJCnhEZg
vTwu0TQ1rxl2rpNxoyus3ciRxMPhXQ==
=6Ju3
-----END PGP SIGNATURE-----

--A1n6xOuh83IEj0Y4--
