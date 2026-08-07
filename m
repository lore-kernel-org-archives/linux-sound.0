Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4940472F9A
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 15:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786116906; cv=none; b=FbBw9rUnlc9Edmz/JlBPJj85B0LelQpGiWd04bB/iBIqMHPJSx08UotNlZAc5wkI4Bj0RX/HtWkWB6PdCp7blUkf3IaKAY7WogWOJAkF/trm3/cPMfbkjaWU5UjOgOy/Q0/LsBMGIwk5+n++bHO9rF0Jfk0UdhQxmbdxGVCoviA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786116906; c=relaxed/simple;
	bh=LJ6v2Wph5mz5FCHBWMBW3DlchI7moE0W/HQUxarsmfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rr7xFE+dnbxVrq6kMDLdA2XiaNfUws/3Uj1oq2zxlOLICd3KAIaRyMOtXvFuRx8/UPGK3kc7kPDmi9kl9EejSZhq6PXSThM8d1ltuGxJmU805XoMkGluDTHoB668wlOAe33P4+QfgKKDgC7JVOkaHLIFKwNfgq4HqqSjffZ0k4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WuT06huC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WuT06huC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83C781F00A3E;
	Fri,  7 Aug 2026 15:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786116905;
	bh=4m0oiXLvhvfQ+ByIA8NIpBkrT8v8xUVKxMNDAZG9JMo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WuT06huCsbLHpqLla45v1P/cHz+E/I9cH8nIJxbFtKroH8yID94jpaIyXlzWQdNm6
	 wgVAl6vqUQSNDQp33jqGTO/5zwMWsfShJkSaXR8RAbAANx3RNf9bhsrHKFIHDCqeCz
	 BNB+vi1o0swzaeBfZ/pUk/m6gNABeLNKeYn9jNW4Yq1PHJoV0HvaOsOHxGZzdvUfKa
	 Xa/y3AdS0LhZZxd1Zgy1iaHtc763UfA2esbkuomDTF9lVeGEFDZ2HxFKBk/BUA0tZn
	 ohHoh5f4qf9asMgVTy3EXZLvfE4/yi+cJsFGezgWhn6oQ3BJIYc7WzyupPnqDaqb42
	 VRIjm3brnsM+Q==
Date: Fri, 7 Aug 2026 16:35:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Lars-Peter Clausen <lars@metafoo.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	=?iso-8859-1?B?Ik51bm8gU8OhIg==?= <nuno.sa@analog.com>,
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 04/44] ASoC: codecs: adau*: use
 .auto_selectable_formats
Message-ID: <90850af1-8095-40b6-a44e-64479b0b64b6@sirena.org.uk>
References: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
 <871pcavjig.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6ZsbC8v8wuKZ46Qs"
Content-Disposition: inline
In-Reply-To: <871pcavjig.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: 1 + 1 = 3, for large values of 1.


--6ZsbC8v8wuKZ46Qs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 07, 2026 at 12:53:11AM +0000, Kuninori Morimoto wrote:

> diff --git a/sound/soc/codecs/adau1977.c b/sound/soc/codecs/adau1977.c
> index b42f35b1a6036..b9d9853934216 100644
> --- a/sound/soc/codecs/adau1977.c
> +++ b/sound/soc/codecs/adau1977.c
> @@ -741,6 +741,17 @@ static int adau1977_set_tristate(struct snd_soc_dai =
*dai, int tristate)
>  		ADAU1977_SAI_OVERTEMP_DRV_HIZ, val);
>  }
> =20
> +static const u64 adau1977_selectable_formats =3D
> +	SND_SOC_POSSIBLE_DAIFMT_I2S	|
> +	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
> +	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
> +	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
> +	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
> +	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
> +	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
> +	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
> +	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
> +

This looks like another one where not all combinations are supported -
the DSP formats look like they disable invered LRCLK?

--6ZsbC8v8wuKZ46Qs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp1+yMACgkQJNaLcl1U
h9BzKAf/VJLkWXXHD12a7MFzlUams4iixqdYhpH6yaZdSBQN/i4v+sikVnDOf/aR
YLU2/vOL1H7HHVUoNCIigM6tFReBUzNRn95avTLnkb55w4wRjURsUcLuc0DB8Biw
mTiZg6OEfi9SsGOCFy8oRKfRQp6hdQyOvA5e/2eWoirijzm3l0pr+JMdEubgHAtK
gV78GXBLOYgJY2S09b9UzB0Vdcr9u/zAChNzBne2vc423i6J3NBwFLqskErtZ7/9
Oq/Tn/o3JjCR74uHVK4YKtYh5+ezoAKRU+E9icyi8nSRsh95lDzg9ohvg/ihI1Ax
6Prl26SCk+lVU4EGsTvn1UbqgU29WA==
=NIbK
-----END PGP SIGNATURE-----

--6ZsbC8v8wuKZ46Qs--
