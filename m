Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B45A22ACFB
	for <linux-sound@vger.kernel.org>; Thu, 27 Feb 2025 11:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740657354; cv=none; b=Jf6NFcQ4uB52lkzGzES3A9Brin9QpUGHIB2A75bBQAFZi7by9V8PLGLGEHUVhzlCdxhBw8goVHAwR738FvotxhDenxvDjL/iGn6+m9dM04VGk+HNd0xa0gv/CRFnnpv/7Cl1L+QSfFFJYFXxrfm/0KwTVEDWCzkne1i1Ci/Xmxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740657354; c=relaxed/simple;
	bh=pa4RhoZIvQDS34wuAFaE1/nN7B7iifNOtoodMR0jV7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TQxSXx4UYFjUocQfTaMb0qPujTxCkLhULvikLe7gFAvS5NeAVeSys14FlRx2lGHRPQN0GKYPYZo4YGEU2WVOq7U/SluKgdGhd7nEtd7xR2wmUKQvzFDKmUuikpiFOQwrr9p7LhsbqAu+KTjKbXa/Js2ARKikJpjNvDOmn99a10A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QNdGh9ph; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QNdGh9ph"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7907DC4CEDD;
	Thu, 27 Feb 2025 11:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740657354;
	bh=pa4RhoZIvQDS34wuAFaE1/nN7B7iifNOtoodMR0jV7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QNdGh9phSF4PTO8YYabt5p4a2QuSnYeGXz9fUqaYf3voYf7HM36FYQ87tpVL2Nkrz
	 X3lVqNvfaHSzoYnRo3QRgkAp1p+R+iyOeVrkolN8kuL1i2lZatKAsfQKFCqSQHJTaC
	 JdJd0XdTA1s/7XjsBCCNzJNk/6zTJESBSIdwhZL782CoCmBpeFSLPa4PMqS0droYNp
	 h53kg1w59xjnJjhrUtC8eqLjjSVw9B6P86+I8Th59rKz90IklBbs3ju3RJbMSKlvLJ
	 Hhyytag5SBKzmMYfJjUM+eijy4xValKhF/MqVCqZiFMLjo8lvrQTU2XDeZUEThStiq
	 OCBW8IKLySALQ==
Date: Thu, 27 Feb 2025 11:55:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 1/2] ASoC: simple-card-utils: Don't use
 __free(device_node) at graph_util_parse_dai()
Message-ID: <791a775b-c7bc-4027-ab13-3eacabb4625f@sirena.org.uk>
References: <87bjuoqo6c.wl-kuninori.morimoto.gx@renesas.com>
 <87a5a8qo5y.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0TzLnAxRXo0r7Cgj"
Content-Disposition: inline
In-Reply-To: <87a5a8qo5y.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Swim at your own risk.


--0TzLnAxRXo0r7Cgj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2025 at 11:30:49PM +0000, Kuninori Morimoto wrote:
> commit 419d1918105e ("ASoC: simple-card-utils: use __free(device_node) for
> device node") uses __free(device_node) for dlc->of_node, but we need to
> keep it while driver is in use.
>=20
> Don't use __free(device_node) in graph_util_parse_dai().
>=20
> Fixes: 419d1918105e ("ASoC: simple-card-utils: use __free(device_node) fo=
r device node")

This isn't applying against my 6.14 branch, it's got a dependency on
some of the changes in -next unfortunately.  Could you rebase onto
for-6.14 please?

--0TzLnAxRXo0r7Cgj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfAUsYACgkQJNaLcl1U
h9DgGgf/alzSqUZqVURD5Or4RyhTmmxMSBmDzT573NsHP9cmwVUZ6OtW1wRqdbjD
Y3yMGz98u12UEsdUCbjBj1cGbchhtKxhRxP8piuqd5s7Ew4z+Ja/rqBXNhiQqqVT
9ivd6MOind1ZpmfYiNlrIp56yXdXl4Jbo4KvBW9XVhzIjONWgup/5vxMzZAqScEg
vEyMjA8fS8RNRrGmcms5vlKQgGVNOJRrTys9VCxNDuuCHkWLOugUdJSvh5SrWBgD
3rmrwY6/70aK8dUgda6YVD3X9PTwiNtXmNs+VPtmmsDPGRGs/3AKpH/EXTfhG/Zy
AKSetFyxoPww3/RSLU+tr+WWuRUT0A==
=Sx94
-----END PGP SIGNATURE-----

--0TzLnAxRXo0r7Cgj--
