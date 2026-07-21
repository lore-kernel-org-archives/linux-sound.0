Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F752EBBB7
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 16:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784649798; cv=none; b=WwkrlA/IX/A8B5TivnLlJO2FPzIkVCrap669O6JJsdowxwubqtpD9J4eq7hHWh3CyAQntVInWl/xa6UNP209Klm9j1X8mn1iheVYOf9kcCOf1W+NYnnOsVfLdNQm14I0vLWC/fRNh6WyXBRUIuyJB1aA9F2W4i9aYRGLx1yn2Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784649798; c=relaxed/simple;
	bh=Ll+J3BSOBqlG+PhTaIZ10WOa5N62rgX4HFICI+Us75U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LbTbh4+69pCTJ/D/JS5gYcu8Zgqm8Vz7sX8g7S1a++BmbsSqdMNqA1yC10bUp5c5opdz1dAwwFOdfp6taJWIUgcUoT+bZ5GPjieKzQenEfoJfzDHd9n9iHFxZ62IFuGKcO1hri12JovIH5wTSJLlLKlng7q+RRn0s46y60dld5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dBKLzTuh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dBKLzTuh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67EAC1F00A3A;
	Tue, 21 Jul 2026 16:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784649797;
	bh=cfQFjbL1r096alBzzgBKZcMoMhH9HJhH+rTuNdX1fNg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dBKLzTuhhBJbL7779vLINsAPWJ3mzYLa2AFrIgxP8TAOm1BE1KIa3wXJNlFWjijYe
	 7ap71XNIVcs2Hs6B//Hx8NnQ2EsEQEMbB7p1yXuVZ/LxL7tvjsLEQUTOsLvrgovnA+
	 bt0UyDpjNz9ruUSuRuzIcHcNFaN35/oc5oorDhLfpcWShfLR0FOnPS9/juO9DlUUzi
	 EXbHkWzUQ1X1oFMvU2NgzZGWeGYUxs30nbS5eg86v/OjCbU4JQeRoAo6mWOknyRean
	 WbUvcRvoQm9lTiINdeOApY69PxmbKMIYea86VuC/TEUCbdqUn+q3H2/8qE08FsDCa5
	 t3aUX2eZ3tNIw==
Date: Tue, 21 Jul 2026 17:03:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Takashi Iwai <tiwai@suse.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v4 06/12] ASoC: intel: avs: use
 snd_soc_register_component()
Message-ID: <4aa7a0b3-19f7-4108-b2eb-71f197e1391a@sirena.org.uk>
References: <87qzkxjg53.wl-kuninori.morimoto.gx@renesas.com>
 <87ik69jg3t.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="T6WcZARPgnHSTkzT"
Content-Disposition: inline
In-Reply-To: <87ik69jg3t.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Love America -- or give it back.


--T6WcZARPgnHSTkzT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 21, 2026 at 01:17:42AM +0000, Kuninori Morimoto wrote:
> It is calling snd_soc_component_initialize() / snd_soc_add_component().
> We can now use snd_soc_register_component() instead.

> @@ -1387,25 +1387,29 @@ int avs_register_component(struct device *dev, const char *name,
>  			   struct snd_soc_dai_driver *cpu_dais, int num_cpu_dais)
>  {
>  	struct avs_soc_component *acomp;
> +	const char *comp_name;
>  	int ret;

> -       acomp->base.name = devm_kstrdup(dev, name, GFP_KERNEL);
> -       if (!acomp->base.name)
> +       acomp->base = snd_soc_component_alloc(dev);
> +       if (acomp->base)
> +               return -ENOMEM;

That test is the wrong way round.

> -	ret = snd_soc_component_initialize(&acomp->base, drv, dev);
> -	if (ret < 0)
> -		return ret;

That was the only user of ret, this will fail a -Werror build.


--T6WcZARPgnHSTkzT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpfmD4ACgkQJNaLcl1U
h9AmkQf/Xnby9yb0qkMfe4SM8nsJkhYbr2POzwbpFlNOHPLz3x2jT2jphT/dgNrq
aitZNxV2t1AmELkACTIkmCsRP4uS/gkTQw5stZdp7uc5lEkuCWU1vkkiGtgjXlbn
WXcENBd6iyx3j/sp8YaWTH4uc/zjm2BHil1o2jbXXebhSkcgJy21sbPzPkygxlc3
74oSYEO/zFhJkHO5xuVZ/UxUklUcAgHCEm5jbRXouFfo5ErVvkdFR75O22wSsO0C
The1EJomyjCd7O3W106ti5jDCLUiE5TeL47wpC9bRIpNjpRx6OxIed+MP22GRjfZ
Mw2TU80DMfmCZ/XR4y4MZzIhSGM9LQ==
=xocM
-----END PGP SIGNATURE-----

--T6WcZARPgnHSTkzT--
