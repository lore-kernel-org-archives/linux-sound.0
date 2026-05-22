Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C568221277;
	Fri, 22 May 2026 13:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779455878; cv=none; b=h5kcXvnben0YJgZXmqX3DgRnRXNhnNqXRb5xayR16mQGV/ma6UmBZCzi94qXYwPo00Tz/iZImhIyhZ4GB9cp0LAGwUYByaLrkUg3Cxenc5dLV1WaI1MPt+fZnsYDXr13dHU/GeOwtzcTOY39bwOKP48DZ8RsXNwzYTKXMoY3v+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779455878; c=relaxed/simple;
	bh=7b3mNRZcm01s8YZeOlgL9sJB2dXdjAG65kpXapgC/QE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bySFnqhQojxXpt+9ULtWvGRRGf4i+9GcRxY/CPHcr08KTxb1cN8v/KDIp02sWLtQAQhWLvQo8Z1M+rg4wkWkf6aq6ugkfAT5bc+M89axxGJ0r2UfcJI4LXc/9fHwue03rBVk6mhCfvbR6tmFTBiO+YZsTyZFlea0tG+N206TKIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D0vnj9cy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D0vnj9cy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3D5E1F000E9;
	Fri, 22 May 2026 13:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779455876;
	bh=a1cIsmeKhq6mUYdRPZK2e4q/1IIc4x9yHARUBDuobt8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D0vnj9cy+UdeXi/T6tYKUcD7yTfRQ/QmVVYAnpUUlPkfoX1JPKAxpgG7V0+/qlp+D
	 SfOpeVDGFZcm1xfCI/f6VwXA9z7grSXGoSqHNGyll+wi2FZF5KIuZ52FKt3MaiEHgb
	 yrjSS/uTCj8fSGt45On37G/dofsDV15FCUjFmSHmhlF0mFejbU4B6WqfJNc005d9RN
	 4P6r0d+SHakB3Y9M8iorKEF7V92ZdMJH2lHuHfA386ITdE+95U/cZMY2ZGTvbd3bL5
	 k0qwbcc7hbCycnfUUIcRuDoaDqt5ls8rkeuU5tTnXWuo3nPB8HjGx1JBgqndlYNVOt
	 gFu1oKmdahSSw==
Date: Fri, 22 May 2026 14:17:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Srinivas Kandagatla <srini@kernel.org>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	mohammad.rafi.shaik@oss.qualcomm.com
Subject: Re: [PATCH v5 1/3] ASoC: codecs: lpass-wsa-macro: Switch to PM clock
 framework for runtime PM
Message-ID: <0c408230-61cc-4751-938a-06e715744c66@sirena.org.uk>
References: <20260522073324.e18bb240b6f6@oss.qualcomm.com>
 <20260522130459.3411038-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2XEiOPcAVdUOplZs"
Content-Disposition: inline
In-Reply-To: <20260522130459.3411038-1-ajay.nandam@oss.qualcomm.com>
X-Cookie: Celebrity voices impersonated.


--2XEiOPcAVdUOplZs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 22, 2026 at 06:34:40PM +0530, Ajay Kumar Nandam wrote:

> The driver now relies on pm_clk helpers and runtime PM instead of
> manually enabling and disabling macro, dcodec, mclk, npl, and fsgen
> clocks. Runtime suspend and resume handling is delegated to the PM
> core via pm_clk_suspend() and pm_clk_resume(), while existing runtime
> PM callbacks continue to manage regcache state.

>  config SND_SOC_LPASS_WSA_MACRO
>  	depends on COMMON_CLK
> +	depends on PM
>  	select REGMAP_MMIO
>  	select SND_SOC_LPASS_MACRO_COMMON
>  	tristate "Qualcomm WSA Macro in LPASS(Low Power Audio SubSystem)"

Shouldn't this be PM_CLK?  That's what the APIs are actually conditional
on, currently this will work out since PM_CLK depends on PM and HAVE_CLK=20
but the indirection leaves a window for things to break in future.

--2XEiOPcAVdUOplZs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoQV38ACgkQJNaLcl1U
h9B6jAf/Q8yYvw9kwXHlZxaEuKwVps9Gx1AAJq6Z1d9GgTXtrDhYgm6MFRATwQqx
lYQ/qP1/FygJr0EnkYtF1ooC/yGN+1yvjEqvVlAwAnRBZ+RFrWLb/EJpfTx8rJ9g
vGV70buDtDJc0+qdUFPL6w0s1pUgPIBu85j2j7WlcWiG8lFDXTrTc0HAYVAbnar5
os/n77RVc7/Ck+rTu07VjzHprYgba8IHzqUBC+VTEi0z1FZ9glbFGbcbAyUJ2zcO
T2mJva7Aroow9+YhVj0vvHMu4k0IKaY7Cgzk3tI+IcAqSHWKiyw5CZuAZ5FRDMpH
Hn07uQLwgDKMxM2EmdNaykWnKGeUlw==
=ada9
-----END PGP SIGNATURE-----

--2XEiOPcAVdUOplZs--
