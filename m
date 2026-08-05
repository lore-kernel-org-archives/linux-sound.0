Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCB147CA88
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 22:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785970589; cv=none; b=V2EDPvqS2bu8OaZyy/GD/LIg9BOGmIuOCq2BMaByQX6XSSK4lrQ92rl3qOTR3BM2YX4xXxagOMBQnvnAH7KI/bFEg9vThosVZdR5FywAVVwNlgYNrsvq1cEbguZQFpjW4dVM+AAwsHENyJlWGh393/FaJknTl3eUZZV7bwcrQKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785970589; c=relaxed/simple;
	bh=EiGN/d5NQBGtYeZE+Vfavef6hAAV0d5sbxeVkgiGU/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qKgdNhyzxXrXDiE5OJTyQug4fq0fkVVTTtLISXgM8n4UC110aU0qQIR78cCfpSFbu9ndqkCV5cPg+700a57pLLeRQxKPQq1OCL0iOetcxp0Dc36Uhld7WYQYH2jdXvsDbrOs5z/rlfJH9XGAyns73u4e44gXiXpagAof/6S4Cfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KREZx5Ep; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KREZx5Ep"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB2C41F000E9;
	Wed,  5 Aug 2026 22:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785970586;
	bh=c4YEMtGQ1jJRew34NGHCwBIrYQ5NOKsy+Q0mrpByzhY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KREZx5EpLLy6QskCdI+6K82X8NNIdYjMN0j9fVgN3FfGZFXJNs7jpqnHzUDTL6f7D
	 j1DBFDL/jvtGDX+zcg+vBQLuN074ShhJadiUVZAB/1D7we5qfmWTDr9mQX/YjoGBS4
	 0Q5ZcDQQZEYLKQwi/w6HJr8jzPT2ZNdCmnnq4l84Dc45qzQ672haji9v5UR9tplGgX
	 bqglNAnm95llsU/mEfCpVoyEEy3PEW5vcxJD8KIWC+6FF+XYjhUCYsr/LBg9LJcVbK
	 +PllhQuVZ4SZKORbegbDDps5p9imrd3moyN4knjd5w6hkyDdBygfCAtPvS9IvBkeZV
	 yjRGMA71D/PZA==
Date: Wed, 5 Aug 2026 23:56:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, Oder Chiou <oder_chiou@realtek.com>
Subject: Re: [PATCH 13/31] ASoC: rt1320-sdw: Use auto-cleanup for firmware
 loading
Message-ID: <bed1131f-59a4-4da7-994a-d1d5a6728603@sirena.org.uk>
References: <20260805135247.670693-1-tiwai@suse.de>
 <20260805135247.670693-14-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hSPfhK61kf2Pos+B"
Content-Disposition: inline
In-Reply-To: <20260805135247.670693-14-tiwai@suse.de>
X-Cookie: Stop ahead.


--hSPfhK61kf2Pos+B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 05, 2026 at 03:52:14PM +0200, Takashi Iwai wrote:
> Simplify the code to manage the firmware loading with __free(firmware)
> auto-cleanup.
>=20
> Only the code refactoring, no functional changes.

> @@ -2170,6 +2164,7 @@ struct rt1320_dspfwheader {
>  		goto _exit_;
>  	}
> =20
> +	const struct firmware *fw __free(firmware) =3D NULL;
>  	request_firmware(&fw, filename, dev);
>  	if (fw) {
>  		fwheader =3D (struct rt1320_dspfwheader *)fw->data;

There's a goto further up that jumps over this which clang warns about,
this will break the build.  Landmines like that are why cleanup.h warns
about mixing it with goto.

--hSPfhK61kf2Pos+B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpzv5YACgkQJNaLcl1U
h9ASBgf/YGFBQ9llutsBdL8UP+TiYaB8leRoB5lA0mVIQfofVRetKqFrTBrC23e/
M1pNovzkKqbZomkpoDhLeD2lwOha3x8qD4JSDYir8UdldbsamPgPqOKMzJ0KCrVh
+AYih8O7tvM9vlQZcQiMOpNlhDNlI3z57gXosZ7T9nvhp7ycuTJmDj1S6VgxS3ZN
b310Yq7NnzoQ+bacPQHDAbsiNg9DZZxgnFAbem/pFezfrClKgeAp9HYyVX8wcxSG
3BiLX6ZwbWeZJk3TfL1ehsS8EsPAs5NrKNHH2ucDsvPFNMPyIZ4lUYqQFZ81jgsc
X5ll2e5uuc45nxWFpZlCtWXBCDeUQA==
=A3sy
-----END PGP SIGNATURE-----

--hSPfhK61kf2Pos+B--
