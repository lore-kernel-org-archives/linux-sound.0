Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5DD45FFD1
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 17:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785865175; cv=none; b=NzU+AvOxHqinbsAOnGFeTiDAaNIkYhigNBq+y8SqENiA8CrUyo4dsor9pKGDSXclQEERYJ9h6IfH0zwmn97kvxNGRzPFHggZCIU//70TX6G2mqsPZuvcYBpaPXUn9+xb9c/6qhBnM4kcP49vk6Vg8KPAIR22BNNKZfmWvcNKy/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785865175; c=relaxed/simple;
	bh=pxI2yut4/i9aOVYX1mtPjwpi5FhC2vY0TNjW4HOj5ho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sbFV/7orBesBWDe9jLGLYSOP447okY9XGKD7J8kxahJkTSrY2OcZur8fDH9TBTHhyoT7zwjCm8ZTZKMo5HCTemCha951DXbc4pUkojdyhwS50In1WvELDQHQVzFnh0JOZUusdpFr5oMt4cVK4viLCFZeWceF4XNh3hmN5/WsDAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KSDP06nw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KSDP06nw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F0F31F000E9;
	Tue,  4 Aug 2026 17:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785865174;
	bh=tQImbUw94vcq/Wj3h1UPZ0oTljqCO1N+EHNm7CAdJfQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KSDP06nw3ePJ+qif753Ecwo8S4yQIUCzX4gfHhiouizsoxewSqWf4b4QwBwE1XlpZ
	 pAQF9TvzMMwk0+6V2fKapoCM+vB0OJ4mdDNOGkc/qtVXl0AOR419nF0Qi30LK5/ItT
	 fWwyv2IbOUVurMQVzUUDcYMxv/7bh4Yfjgl/vyXn/vIxTnU+tFrSMSpTUfPfzPQiB4
	 60969JIH9PFYy25d3gd8jZFa4f3sZ+a3p4W8EXasePBoY05mwDKtaiVXHJcpzgHzOI
	 J4LesC3RGonAVO2YfImdoYKdGoz1hpnONMNiC0qbO9f2w4L0jb2l5Wd6bLKogQT2Zv
	 /mCuhcSuipu6Q==
Date: Tue, 4 Aug 2026 18:39:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
	Oder Chiou <oder_chiou@realtek.com>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 30/44] ASoC: codecs: rt*: use .auto_selectable_formats
Message-ID: <2edcd6aa-c0b8-4589-a9c7-517fafe15814@sirena.org.uk>
References: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
 <875x1qww9x.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7YoWC21nV2nt9OEy"
Content-Disposition: inline
In-Reply-To: <875x1qww9x.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Biz is better.


--7YoWC21nV2nt9OEy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 04, 2026 at 12:43:07AM +0000, Kuninori Morimoto wrote:

> We can use .auto_selectable_formats. Let's adds it.

> diff --git a/sound/soc/codecs/rt5668.c b/sound/soc/codecs/rt5668.c
> index 4154bad276101..1a4a928c7c3c6 100644
> --- a/sound/soc/codecs/rt5668.c
> +++ b/sound/soc/codecs/rt5668.c
> @@ -2254,16 +2254,30 @@ static int rt5668_resume(struct snd_soc_component=
 *component)
>  #define RT5668_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3=
LE | \
>  		SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
> =20
> +static const u64 rt5668_selectable_formats =3D
> +	SND_SOC_POSSIBLE_DAIFMT_I2S	|
> +	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
> +	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
> +	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
> +	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
> +	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
> +	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
> +	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
> +
>  static const struct snd_soc_dai_ops rt5668_aif1_dai_ops =3D {
>  	.hw_params =3D rt5668_hw_params,
>  	.set_fmt =3D rt5668_set_dai_fmt,
>  	.set_tdm_slot =3D rt5668_set_tdm_slot,
> +	.auto_selectable_formats	=3D &rt5668_selectable_formats,
> +	.num_auto_selectable_formats	=3D 1,
>  };
> =20
>  static const struct snd_soc_dai_ops rt5668_aif2_dai_ops =3D {
>  	.hw_params =3D rt5668_hw_params,
>  	.set_fmt =3D rt5668_set_dai_fmt,
>  	.set_bclk_ratio =3D rt5668_set_bclk_ratio,
> +	.auto_selectable_formats	=3D &rt5668_selectable_formats,
> +	.num_auto_selectable_formats	=3D 1,
>  };

The ops special case DAI2 for set_dai_fmt() so it'll need a different
set of formats.  Similarly for rt5682.

--7YoWC21nV2nt9OEy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpyI9EACgkQJNaLcl1U
h9D2/gf/bzeupqZKHwxveG1Sg6V+/BpV64XInRaWR/co9nu8fMAGTv7BD/1LjNpD
DKtzRJ0g7qZJ5DHcY5FLyAy3ZHvcPKjmSv3TU5M/r0Dn2bStrf2OWrtCXK2nTfuC
V3ah/ruQp+2Mb00lF8KnRtDtdIFL270ocFK33ptnBBjm+B+u81PHnrNZyzKCeMNE
lYWu3DcB74aH5I5HpmtBrH4IFi9THRs95TBdYvfl5vmHUkVPsyCZzu+ey7cPaWi9
xaB6aFXf9aAYhhU6wpYBdFDEUjpOm8RaLpbEYgV5mYofI2dW17Xl2gzfqrja0DRD
Z1j1ocw7V743JG3hlFPx+49hlsB9NQ==
=EGSg
-----END PGP SIGNATURE-----

--7YoWC21nV2nt9OEy--
