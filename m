Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7208026059D;
	Wed,  8 Jul 2026 18:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783536653; cv=none; b=M3GjacTUpQ/1wLgvSwhhGCFTHlt+wYgwgdlTHrfQjNcmTxuK/oob2Z1ocgq7ORTS9chNjljZQrjYDAu6PMig0J43K6OeG5tMOJ6hMpxqtNWLvKuJJ4KTBSyYpA7lkjcVlcAClp3GrJcsRcHj1Zwbnkgrofe/vzmkqOMZFb2Ma+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783536653; c=relaxed/simple;
	bh=XqOU1OmFciI/5YcTfXVl9XxkwkxdHr4L12yLpaNpVfA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B52WZnxhwiM3R2GkCxs2j0UpVzo2uN2W+4zTQ5glkZvVSLExe5kFfPxgkwxejL6BZl7HKICd8CyvKNhrc6l5euAh1M0+j+x49KN4OzB59L8MixVZlV5khyed4yOkPRGDPinlXqD3hvZrpFbshwl80lL0Uhe3dP6EWBd8y7+WzZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IbHlV/Mi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IbHlV/Mi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94D651F000E9;
	Wed,  8 Jul 2026 18:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783536652;
	bh=NJ1Mtv3Z5EZMTXr3z2tClVIP4sNjn8cKIMmkJ09/DdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IbHlV/Mic/okJUPMbSa+AUxeiQQCAo35r8D7X6Lsngrd3Fz+xstSRU5eoAMzeGN2R
	 JJkCK1hwMUGSeR6+UzvsWbyzcAdsMGQWFU2WUWxEvvcmQ2nJjuVvv9enhkcGsKSac7
	 zm5W0PsbUAFXnvFmhOqExaug1LnHUqr1fhQ0/gTaMQ9betilrT1yBZJtOkYIqlJfgR
	 VYsKCCO2y+s8tLGB3hCLIOEq8hrnOTVzxeW1yfztK2yauGsd1tZ8oKh6zGXV5Di5t3
	 ggbr8BK4HTYduFm1Sy9Hlg8oy8UVgO5avW6I51V4RixyEJM4RQ53ZgrF20aTnm3PBl
	 l55pQIoUyt9fg==
Date: Wed, 8 Jul 2026 19:50:47 +0100
From: Mark Brown <broonie@kernel.org>
To: phucduc.bui@gmail.com
Cc: Max Filippov <jcmvbkbc@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: xtensa: Use dev_err_probe() and drop redundant
 error handling
Message-ID: <3fafaf57-7de8-4124-8ad4-036a90801fe5@sirena.org.uk>
References: <20260706045747.36811-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+W4wipwQwpE02ENY"
Content-Disposition: inline
In-Reply-To: <20260706045747.36811-1-phucduc.bui@gmail.com>
X-Cookie: The other line moves faster.


--+W4wipwQwpE02ENY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 06, 2026 at 11:57:47AM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
>=20
> Convert error paths with messages to dev_err_probe(), which combines
> dev_err() and the return statement while also handling -EPROBE_DEFER
> for the clock path.
> Remove the redundant "err:" label and return errors directly. Paths such
> as platform_get_irq() already log failures in the callee, so they simply
> return the error code without printing an additional message. Inline the
> pm_runtime_disable() cleanup at its only call site.

> -	if (IS_ERR(i2s->regmap)) {
> -		dev_err(&pdev->dev, "regmap init failed\n");
> -		err =3D PTR_ERR(i2s->regmap);
> -		goto err;
> -	}
> +	if (IS_ERR(i2s->regmap))
> +		dev_err_probe(&pdev->dev, PTR_ERR(i2s->regmap), "regmap init failed\n"=
);

This isn't returning the error directly, it's ignoring it...

--+W4wipwQwpE02ENY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpOnAcACgkQJNaLcl1U
h9Cppwf+Ja+2Qe1fXzYZNACEMStj3R8/SuHoxYl7vSwUHhAVk1E0Kt3cdyNr4Prq
KeiDbgVR4YD9FfvevgZ4VzmndyRFWwg8uuj/NiIGWgN/U0bfkOtd/cu3yQj2NrY8
Fk65Ls5XGqXMNS2iyIMUzkYDbGmLaK32L3ijnRk4hVjFwUlDzufejJqBduhclpcm
2Pu+6gK7ZrRgzIMunRWm/vLKJUojnMA/uIqqYyhOmqyCxFxwBBhtYaR+lyzcm9qA
ZS5PEmmy30K6uppGXm/rP5SEEdUAM4QUcGFCBz4oQL5Y8WvTWHnj7i3mtd3uuVBZ
KhsKYjMhbO/LtiAJOEkXDJPxMSBfDw==
=2FrU
-----END PGP SIGNATURE-----

--+W4wipwQwpE02ENY--
