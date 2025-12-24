Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC70F2AD16
	for <linux-sound@vger.kernel.org>; Wed, 24 Dec 2025 11:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766575954; cv=none; b=Wd9MvCyng7IypqWPjafBoI6E6hSYAWHASRD/GImgY6UewRXal2eWKxtjTIPK3b/rCRYo5uVTArZIKWN40UEJViQQRrEINGrzdP/ew7Z+LCZJXgPvsfrGj3LN1B8Q9QNw3nctaxttY1/oHWSZbNZEqMGZHM1oBT/x2Y6rgkbGf4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766575954; c=relaxed/simple;
	bh=t40Pb7Em2mOBdSAD9OtyFbqIV8s6qqvZU5wkx9aNRJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IbKcodjfOG/udVJIFeNDA/sWLDASxHXAibr2t+0TRtx3LVdI2/J+piPYzMv0qcsESCt1TLS5X3hPbAMDpocyYgnclXqmruWDTx89sJr+g3PS6YnmTd0fzSMj2Kl1nB/Yy2ZXXRnstbEya3qlukYnRPfvhBfzS7j0HhGzsLdUto8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PIeMkX1G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PIeMkX1G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55D6AC4CEFB;
	Wed, 24 Dec 2025 11:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766575953;
	bh=t40Pb7Em2mOBdSAD9OtyFbqIV8s6qqvZU5wkx9aNRJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PIeMkX1GCZY9prQ0LYhGKFGuPYPLm0XZASyOg4k9uYprFgPrRsALLc5zRbn6KjxKF
	 xqSg1nctnPl61tjKNuEDw6X+ubBNI20aXUECDwifqJKsy+IXejf3WXoXKHyVZwFToL
	 I4/dNb6DMnDrZ9HX6jrmjuW/4LRieh1PxfpxJ9drPkKP1G1yYO7thQGoXElbvyNZF/
	 L/O9ipbKdOh8h2PWJNGE0QS3TvFleFLnMdd86Rg16fhTPUcsX5mUwDTjX2BdaC5JQ8
	 DLxitTLkTJkTQyxiztDJtfPPjbeW8ueZ7QiysK8CUwntpzhOxU4WSebN5cYwb+SgAL
	 QwZQij6JRPvPg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 9A3131AC56B3; Wed, 24 Dec 2025 20:32:29 +0900 (JST)
Date: Wed, 24 Dec 2025 11:32:29 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: alc5623: tidyup clock inversion in
 alc5623_set_dai_fmt()
Message-ID: <aUvPTUs2ESeZao_d@sirena.co.uk>
References: <875x9wvgzi.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Gm/NtluBrTv8jvpv"
Content-Disposition: inline
In-Reply-To: <875x9wvgzi.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Think big.  Pollute the Mississippi.


--Gm/NtluBrTv8jvpv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 24, 2025 at 12:52:17AM +0000, Kuninori Morimoto wrote:

> It has duplicate code, tidyup it.

>  	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
>  	case SND_SOC_DAIFMT_NB_NF:
> +	case SND_SOC_DAIFMT_NB_IF:
>  		break;
>  	case SND_SOC_DAIFMT_IB_IF:
> -		iface |= ALC5623_DAI_MAIN_I2S_BCLK_POL_CTRL;
> -		break;
>  	case SND_SOC_DAIFMT_IB_NF:
>  		iface |= ALC5623_DAI_MAIN_I2S_BCLK_POL_CTRL;
>  		break;
> -	case SND_SOC_DAIFMT_NB_IF:
> -		break;
>  	default:
>  		return -EINVAL;
>  	}

Looking at this I think the issue is that the device only supports
inverted bitclock but has no control for the frame polarity - the _IF
cases should just be removed.

--Gm/NtluBrTv8jvpv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlLz0wACgkQJNaLcl1U
h9AIkQf/b4sZs48SR/Nsq3B/091GROC1GXIPON4aYVtQQNhDiNk5TBtHjphGx7OC
7KZGpkuYIN2FYz2fD+ogfQHrbDIe13ltl50iQil+JpIk8Hba/M4AwA+hB3OGhTa/
4wIACCB05HFKTpKhOKtCCKLKDTNCWDjXHNQDabE0J1ULcycVgCPUzab0G3VT2wov
vJhh5y6vdeHGz+/3SFPb7NzuBcF4IPYKSdNucdHfADUowuWrywadMy9NbYoxqjVU
bREYWwDAI+VizmwQe+lnJkqdlSQ7wsbCSfvquvVE4C9aCq1YtGgcODh9vcUMqyGG
C61G/9mS3z5AjuMw3zfUkL6ubpkkRA==
=rCIg
-----END PGP SIGNATURE-----

--Gm/NtluBrTv8jvpv--
