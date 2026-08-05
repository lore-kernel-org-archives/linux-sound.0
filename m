Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83173B8BBB
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 23:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785971775; cv=none; b=i/v52igDVfnQGm0ASLwJyj9+Rfwz7/cKDR4QwUY0TB8jmP8Z5n+2dOQUiegAC0WT1uYZ2H4alXsk/h6NJHSzmu9TKvseBHRX+75dmOOwszXTCTs1WeceXpM4WeBoYRD0ZxSYKl2mIQPFJ9y46OmCkGbGRERNwcWmq4rsJo7rKWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785971775; c=relaxed/simple;
	bh=N8uGlCp9nGGyO1wNpmf83F022tpuGTehOvMVEGo2L0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j8LkJOZGHz5q1hDxqcH0iXZ0XP6KmMZTgBjSQi6Lkzx3vmVrnS49SHH8FPj4IWJcJarrQbT4vo8wT9s9eZwbFqZHWeJjWA9lNxr3vEARbqINhjVeoHWyF/CuV5gLWeaZqSF1uOkQ9OYK/cURkdeXzYTvc7sAwgrvdWjQpMwgc28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M9zahCl2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M9zahCl2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87DC21F000E9;
	Wed,  5 Aug 2026 23:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785971774;
	bh=tgC3rSjGNIIUQ7C2aL8mCbYndki4Fwf5JH4dz1GRot0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M9zahCl23hVG5uJpcTBUoimrBi1+GBrcIJXQ5rM4L0qbSPZdm0JLAvXRCdbj1nPAk
	 wfMtkmZ2y1gOhdD//HNEPglR8EvW0rCazb5HU7fEnJ0PtvxRfov0Be4t2lafwRumMB
	 nAbNkyU8KAkMxrft9UtN2k2wJpEjcq1LB+snkU4MRlabx/Eyy/478f8ER4d3qli4fO
	 AoWayFpzXtfmbyeyyceLP6V0JAUrHlUu6ZugArGWZ/FRF7tOQaLwG5QZiLKWpaSGu2
	 iRIlLo2IdxGjeVLOFTBsh9zJt9+2J+pwnS+DpylDm/tiDdQRoY9nB36M0o36myaE56
	 z6qgJjHqaxE8A==
Date: Thu, 6 Aug 2026 00:16:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH 23/31] ASoC: wm2000: Use auto-cleanup for firmware loading
Message-ID: <81424cdc-58a7-46b3-9d38-d516ae160070@sirena.org.uk>
References: <20260805135247.670693-1-tiwai@suse.de>
 <20260805135247.670693-24-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e1eg/IybkAgNWRyP"
Content-Disposition: inline
In-Reply-To: <20260805135247.670693-24-tiwai@suse.de>
X-Cookie: Stop ahead.


--e1eg/IybkAgNWRyP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 05, 2026 at 03:52:24PM +0200, Takashi Iwai wrote:
> Simplify the code to manage the firmware loading with __free(firmware)
> auto-cleanup.

>  	for (i =3D 0; i < WM2000_NUM_SUPPLIES; i++)
> @@ -876,6 +875,7 @@ static int wm2000_i2c_probe(struct i2c_client *i2c)
>  			filename =3D pdata->download_file;
>  	}
> =20
> +	const struct firmware *fw __free(firmware) =3D NULL;
>  	ret =3D request_firmware(&fw, filename, &i2c->dev);
>  	if (ret !=3D 0) {
>  		dev_err(&i2c->dev, "Failed to acquire ANC data: %d\n", ret);

Same goto issue here.

--e1eg/IybkAgNWRyP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpzxDoACgkQJNaLcl1U
h9DYTQgAhdp4N95sPbkOR03UV5QSa25z9Flpzrvc+9paryf9Il2dPJ7hUZ6RaWvc
mCLuEPGGmT5VvsZ5lr4uHfdgS1K2cW3CZ93XsT3l9Wi2UxY9vF/74krr3zIJBHBS
uShC7xbpesWZrgjxwHGUZEVk4dLK+NN8IrS4OFo0VHq1zi4rDcEqBzDYfHJnxZ58
P3sus5XnBQ8nblzQj+VdsiL48qNmMUcOta41NIM68EdCEvrjsI3FFXhuiGpLO6o7
WHXHyyJ+QacjeaQHRXbCsRFJ6/DnjXK3Cks9DI0AFqi0Lt+LAOVBzY808c5ak+4U
niVCOglLnHyCGFIym1O+VrKdNX9eVA==
=jOeO
-----END PGP SIGNATURE-----

--e1eg/IybkAgNWRyP--
