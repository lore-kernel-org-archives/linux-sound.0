Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B634F35028D
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 17:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785864631; cv=none; b=GRf8aZQZYl6QC2cTCSMRIBxR6y0g5GHzZ/Oo0/0Bx+BkDAVcrLf7AY7iB3GXbfcxgYYh4ENcoB1E3Cb50ylAOFpBa3iiXpORvYDNtYsb3viG6CEFzaADPAQpoR8JVvjTws11l94DNnIDH574Cjv2mDV6xXsxS0mWOUNdMF5MxkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785864631; c=relaxed/simple;
	bh=/SGV1h62CUzjjmwKuzpBB8jsx5abPwpWHydpfYl0Sp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GzGgvtw6zURaJPwo/FahMichEYGXQDkPrPPUOKG4nKhy7fsYddfNA/U7kmNA0LAbQfIZ8O4MoHXvprk6mId7X9TNJDluuJ5An89DcadI9S3WH/ZOBpEwYXTqpnM+gCDKOGiefrh4TdS7yN9RAjkUoFTMziMF+W/S1vfTmXokKn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oem+Tz4H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oem+Tz4H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAFB01F000E9;
	Tue,  4 Aug 2026 17:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785864630;
	bh=YZ3jCTpr8tl5cS+KRQobIsxJAnHuvCX2jn3WudYJd4E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oem+Tz4HBWAk0nlsvrN29rdOGpIcpVdOVvsjFgUtXXmJkSzR1ov2ENGmMYB7GSjt8
	 yDVjSkCBOmj04zAuX6UJTXmGKdUGQjOA2GOV5fXzbKg0WItOToUBR3WVq0uaCCJ9R2
	 HsYXpjxsOzLbW0DXohPqpBfdfykSUHYXK1IosFvulSvgP4R8fGNvwv+06Kf3p4hq7M
	 0I+0BgtSHT+8OyRXL3hwRO2OCdKiLmHH3Y5LM9yQ3r2t7Vl9ZPOkclFhoCfUESl1Bb
	 t8ob1A3PqZbc2XTFp+4rMYur8lmfYComMpC7e02yZl7mDrHOPFiav4mftyLqT/m9qg
	 Fw3rUJOLqD5oA==
Date: Tue, 4 Aug 2026 18:30:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: David Rhodes <david.rhodes@cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 12/44] ASoC: codecs: cs35l*: use .auto_selectable_formats
Message-ID: <d1ca94f2-d104-47e1-85c1-abbd9ccbd50b@sirena.org.uk>
References: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
 <87v79qwwcn.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jQY7u+h6yaeNwfUt"
Content-Disposition: inline
In-Reply-To: <87v79qwwcn.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Biz is better.


--jQY7u+h6yaeNwfUt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 04, 2026 at 12:41:29AM +0000, Kuninori Morimoto wrote:
> We can use .auto_selectable_formats. Let's adds it.
>=20
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

> +static const u64 cs35l35_selectable_formats =3D
> +	SND_SOC_POSSIBLE_DAIFMT_I2S	|
> +	SND_SOC_POSSIBLE_DAIFMT_PDM;
> +
>  static const struct snd_soc_dai_ops cs35l35_ops =3D {
>  	.startup =3D cs35l35_pcm_startup,
>  	.set_fmt =3D cs35l35_set_dai_fmt,
>  	.hw_params =3D cs35l35_hw_params,
>  	.set_sysclk =3D cs35l35_dai_set_sysclk,
> +	.auto_selectable_formats =3D &cs35l35_selectable_formats,
> +	.num_auto_selectable_formats =3D 1,
>  };

>  static const struct snd_soc_dai_ops cs35l35_pdm_ops =3D {
>  	.startup =3D cs35l35_pdm_startup,
>  	.set_fmt =3D cs35l35_set_dai_fmt,
>  	.hw_params =3D cs35l35_hw_params,
> +	.auto_selectable_formats	=3D &cs35l35_selectable_formats,
> +	.num_auto_selectable_formats	=3D 1,
>  };

This looks off, are you sure the _pdm_ops ought to support I2S?  I
suspect the other ops is really an I2S only one too.

--jQY7u+h6yaeNwfUt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpyIbEACgkQJNaLcl1U
h9DOkgf9GXVgHVhVim6wf7w2dDSyILtQOKcrCbMu5id3M55gUrMruwQwGBY5rVJL
Tm86Niz8lKdczWQ65Qo/UoDo99y0VRStcCLZ+SqzzMzyfBo0hlfoLq3LNBMQ169/
JSSObLnGwQtRKGbIbvXasesV6pvyTd8hcPcN8CXvwpgSIQrk+MW3HBFlSbqcFdil
Q4y72ONzZS+TV64PNEBaheZPfKKlJQ0mAgu/Tja2psLFdga3JJTY2oumWKitQIzN
rghzXLlusZ7H3p/Gcx52oYO0u0KnPuTHDuDUsrtvgc3usD8OMGT4X0suWAaBNF25
r+bvyQkl6LRDOWJLyVsx6niubca7ng==
=5FdI
-----END PGP SIGNATURE-----

--jQY7u+h6yaeNwfUt--
