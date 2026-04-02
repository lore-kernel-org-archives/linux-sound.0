Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AFB3090F5;
	Thu,  2 Apr 2026 15:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775143514; cv=none; b=nFprigWYiMo7wmi0X+rw1TZ0iZCiZmE4EiDIq/WzlCDADrMzwxlJeEKFrFWHRKstlM4g3dM3Jmb1dC6NDaUqAX5WkRQNRmbAZ6u741J2UT3SpUUcDdmpo2wnymL0hf//gL458tL/1ElrZHAaZ/zOe3MXfyFgPvmtqMOdXjdTaRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775143514; c=relaxed/simple;
	bh=PfLCWd9PUNQk8cN1qwGWbqFtQQ3Vw3IJ7mZJL7Xi+NQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aXAiUvcPP/i4ILEPaPFDRIXg9s09sqnWzuq/D7Df75VR0/FQrBCf868MKSLJFDmNbSnhbwumg47dS3GSxsiPB1YlrEQABltb5fdiE30+cMqpCnIQMspnP08PJ7GgjWK4xqGTu9U5mR4+4m78m5aLdnWBFEvILXXbuHeXIp9Ydj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ghDJRmy0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ghDJRmy0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D624C116C6;
	Thu,  2 Apr 2026 15:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775143514;
	bh=PfLCWd9PUNQk8cN1qwGWbqFtQQ3Vw3IJ7mZJL7Xi+NQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ghDJRmy0kkaU0JJIB4zFpD3vAtAeWZWNtLwqhziyqohQ5ScWQ1OzEnmpE5ZRqEDDK
	 D+puECP6bssA6wb2FLcflM6tQIHzjg18YwhzublWvUXhbjxnQisDklPOQlPqUCBS51
	 1PmyUZZjnSdHz8F9grKN3kaAoHovbJt9sleNnMr0dQ/dICMsVgcdg/QYcxWxKCX8No
	 QMHocCCaaHtAVn0BP1cj92M7bcwPuSLuFBs/VkYYda9gPf36fesWCuEqNX/CS4iEgh
	 0mHwiFX7WrVERLBLGMXlGO4Er1PdDMkXMzZMHkgp8BeagyE9q6OwIGFzxzcvgqHvae
	 h8MU9RmnvsaBw==
Date: Thu, 2 Apr 2026 16:25:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	yung-chuan.liao@linux.intel.com, patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: intel: sof_sdw: Prepare for configuration without
 a jack
Message-ID: <d90c2911-1cb9-45c5-9c11-51d9259d8d1c@sirena.org.uk>
References: <20260402105943.29605-1-mstrozek@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zg+uhuQg1pX35YqX"
Content-Disposition: inline
In-Reply-To: <20260402105943.29605-1-mstrozek@opensource.cirrus.com>
X-Cookie: <doogie> dpkg has bugs?  no way!


--zg+uhuQg1pX35YqX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 02, 2026 at 11:59:43AM +0100, Maciej Strozek wrote:

> @@ -134,6 +135,11 @@ int asoc_sdw_cs42l43_spk_rtd_init(struct snd_soc_pcm=
_runtime *rtd, struct snd_so
>  	if (ret)
>  		dev_err(card->dev, "cs42l43 speaker map addition failed: %d\n", ret);
> =20
> +	ret =3D snd_soc_component_set_sysclk(component, CS42L43_SYSCLK, CS42L43=
_SYSCLK_SDW,
> +					   0, SND_SOC_CLOCK_IN);
> +	if (ret)
> +		dev_err(card->dev, "Failed to set sysclk: %d\n", ret);
> +
>  	return ret;

This means that instead of returning the error from the speaker map
addition to the caller we now overwite it with whatever the attempt to
set the sysclk does.

--zg+uhuQg1pX35YqX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnOilQACgkQJNaLcl1U
h9ADJwf+OmJ5dFVjDTty64muViSrhSLUmOAFFH3WrMaEUw+PuyUAKhwZgY9lSAgo
PmuNalnfuthlmGU/PEDjPy+Fo5uwXxjGG130Aa6iEhkR6HJvvUZcjoaTIir4Qqb2
vYF5lwBmLVUNZXKcx65AerBb0ZMtw4T/cdEbgnomuWRN4W0mAA7yhzRPPVILIaa1
+VdR/RE2kH42W6IWlBW3wdD2daXUptWV/hQFU3HGUwGQkl3YJAZrwY4d14rNt2Tw
plwggwIuVXvDpFDmXtFF8jmMY8/5TgYmEritkINZeTufRAwqAvDDodr1lh4KK+O5
LG1+wnJQ3mnLSSVI7atewX3jPuWhYg==
=ZFLq
-----END PGP SIGNATURE-----

--zg+uhuQg1pX35YqX--
