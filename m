Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E4919993B;
	Mon, 21 Oct 2024 15:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729524606; cv=none; b=cCDvv32pgh2QWFXKR7FrkngNSy6RmHIOCVO+yPdwpnOSMaFcFM2lJsQ3i+jhgDUAdKpxkaukPaOxYqr4PjrWNWD2vFPCSR+v9aIvcSO06evBQXaW41FNbLsYlRQPi8Z78LoPuY8xNjfEd4Afs3c7JZha2jeHjngPsNOhmW7SJCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729524606; c=relaxed/simple;
	bh=dUE1dC0WwbpGBprubj5Oa/K/Zq+fLvL/hbO2fJ3OC0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZV6cfIP7hlJ8MYdRPFRSPpOfuLdhOEaN2mjpU5vX/1zrIrCOU8HFFUOaloJxtcaSups+JkYPjI5jiSn2GbPYDzuxGpP9BQd6EVIshQtBuJIEZNMfVOLAua+i42FzurAzorC82msfpapTbRcjgqbOv0+ksf6Ep/b2DPEilKVlqvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TrrWUl2I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TrrWUl2I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20FC4C4CEE7;
	Mon, 21 Oct 2024 15:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729524605;
	bh=dUE1dC0WwbpGBprubj5Oa/K/Zq+fLvL/hbO2fJ3OC0A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TrrWUl2Ib7417eQMevFaS820wah8bNcR6PUC6wxXl+187SeMREbsyOZ9X841phdXe
	 GQ4+jb3YX4kL8Ahw4stU/wdXjjxey92rcYiN4e/3On/Oc3h/W6msL8I7Xe/C2bknL7
	 SgKnpRrz4f5MEL4prD6Ibib8c2tjb0PF7+T/NY/9keTg6/Qngv9/H+hZIxyymXt4oH
	 XNBLEL3kkbBgVgu8pJYNxUNWmf5IV3sTKAQedp3oKjIgrtgNUMS/UnQSvBq3ohRBr+
	 DPO2tgcGhOgxZX9nieMOC1R7tFawhvsDUqPCt/zwoSuJxbAsRM2cMvBnngPML+ksaj
	 SLne1jxz0dY5A==
Date: Mon, 21 Oct 2024 16:30:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Nuno Sa <nuno.sa@analog.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 4/4] ASoC: codecs: adau1373: add powerdown gpio
Message-ID: <7a8b1560-c091-4e87-a6f4-7ca7453b7414@sirena.org.uk>
References: <20241021-adau1373-shutdown-v1-0-bec4ff9dfa16@analog.com>
 <20241021-adau1373-shutdown-v1-4-bec4ff9dfa16@analog.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+AkS0J1OYCKGy4EZ"
Content-Disposition: inline
In-Reply-To: <20241021-adau1373-shutdown-v1-4-bec4ff9dfa16@analog.com>
X-Cookie: Most people prefer certainty to truth.


--+AkS0J1OYCKGy4EZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 21, 2024 at 03:46:48PM +0200, Nuno Sa wrote:
> If the powerdown GPIO is specified, we use it for reset. Otherwise,
> fallback to a software reset.

Ideally we'd also put the device into reset when we unload, but that's
not essential.

--+AkS0J1OYCKGy4EZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcWc3cACgkQJNaLcl1U
h9BoUAf9FBzDMBHEP/DrPr1FQhJmlHdRZ7rwz64tMzMiMvrPsrSoIY/MlJrgT+go
r4FIDAYqgzbiqZQZbKkjFvFo8RBD/acwoDG0KS06hNJZXmvUu+v5y/FB5/mMBHB9
it0RmAYuLPg82Bbi0FkNGc1Cd0Hq+nJWk5VKxNH1lP8mHobLr0mEfnYpz/PTmk8j
XvvrEEtSML4lRgJwhz7qV1UiQWZ+ECGwAAWeNBdaplpCHcveoUpFeYqRQqh43zMb
/tlN79oslaIzpaU4Yypb1tKKXe+35Sa2VLg/DZTg1JaumyqHg3oHfdPcYZ84FJJV
4Qt/JFXf5gmqa7B1D6b6IdaWWliaZA==
=tVFr
-----END PGP SIGNATURE-----

--+AkS0J1OYCKGy4EZ--
