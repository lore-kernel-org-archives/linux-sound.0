Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E7C126C02;
	Sat, 18 Jul 2026 18:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784400842; cv=none; b=WXgcxyct0s4PxVNqVDQU5IhuxJdWUDuJ9VHDIheYk3hP3k67FFgassriwVCQAqtoIJurxCedg91nsxY+KA4Dc3j5zBMW/bRnjoOaB8XaBwf4dTwmvyXJY9kQ3eRAYa/PSYf6znuW/mQwHWjI/COBz7HSpGxZsLdDnD8gkRNXvQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784400842; c=relaxed/simple;
	bh=03QjHEORsOlSOMmYmM4SiPXRLEaYPdddPlK47XnKFIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X8BZrxjFQ60uHpFIFKIoCluPrVWKfWCOdqZjL9iCGIcxSaCvXZTBgX6DxMFOyzSoF9pdg1vbnBYw64Mwgs8hnWxUGiNg6nEm1kkdetS2INj0Ik4hhcidG27VdhXTQZ6p7JA4ktixCLERGEe6oz0IZdsoBizAQB3HYKcOSnYfBDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cka3VSZg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cka3VSZg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7882E1F000E9;
	Sat, 18 Jul 2026 18:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784400841;
	bh=ivwRKrM7a+JQs2oGmLyCMI+T7Np32kctvJz0lG+G9iM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cka3VSZgKkuwDGTpdGiQF3TI0XEo1Mj8D0lH8oRPSIyIrLnr4aerN+RQcCFFIk9Hf
	 5YoKbl+VHFbPo9hViMlrt4xeEQoaLfOmz6qiyBeuGu6EYGi6lJg5XWqXM9yZBt1bS5
	 xhxruFBwLFPkmY7iSS+8WJAIV/JMHa+qt4IvOw5eRasTr552EXTbUz78uKLPr2px5a
	 pGiJopjThdn1TKcDV/4bawTNF+Hr8J49tUH8tPBV4Ac4ofe4sZVC6QVw2SeQiIdYuo
	 BQF+wqzxRDsGg59nTUFl2KLFc739fRRjRRBQPYtx7xX7ibgA0bLJdm+hd5PeCQe29Z
	 hmtkjBJGg8byA==
Date: Sat, 18 Jul 2026 19:53:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] ASoC: topology: Guard against out-of-range mixer control
 shift
Message-ID: <a28a49fa-a8e6-44ac-9401-4ac0286fe620@sirena.org.uk>
References: <fb5d83513eda68578f0275b7fa274f172c08a0b1.1784395999.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="W+7cZN/fsFiiASdA"
Content-Disposition: inline
In-Reply-To: <fb5d83513eda68578f0275b7fa274f172c08a0b1.1784395999.git.daniel@makrotopia.org>
X-Cookie: Do not pick the flowers.


--W+7cZN/fsFiiASdA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 18, 2026 at 06:34:42PM +0100, Daniel Golle wrote:
> soc_tplg_control_dmixer_create() copies the per-channel "shift" field from
> the topology file verbatim into struct soc_mixer_control. That value is
> later used as a shift amount in soc_get_volsw() / soc_put_volsw() (e.g.

>  	sm->shift =3D tplg_chan_get_shift(tplg, mc->channel, SNDRV_CHMAP_FL);
>  	sm->rshift =3D tplg_chan_get_shift(tplg, mc->channel, SNDRV_CHMAP_FR);
> =20
> +	if (sm->shift >=3D 32 || sm->rshift >=3D 32) {

Won't this break for mono controls - the right shift lookup will return
a negative error code?

--W+7cZN/fsFiiASdA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpby8QACgkQJNaLcl1U
h9CWKAgAhFwX4gS+72WmY2yCfB3I/YS+ThcQGmD5qK/5tbNLIrLxiK5Q+ieX8m6b
/LjYBogYwglN65Z52MSvIczTCKT3RWA+owm2Zls9Gf7FDhswD8UkLuD7X2PkhXJ9
lAsb08wSpRbYNiAiUmsUk/3sWsYBy0ao3MB+jxXc+0aTsUQ9GKpYss9vzTgHDhgE
a08lHuPe264xOVCnDbH/U8dF7LawK3q3gcKqnxC4idqsevACRCUcI2OuHGI9bhj3
FxlC5fvOKpcFtS+gF36yUSuAqdox5Irqyiha1gd3fHFLwvJhX6t5zw/MzoCq/rK0
MuyeUNZVOzSVorURGosYd3xJk/9NxQ==
=oNWG
-----END PGP SIGNATURE-----

--W+7cZN/fsFiiASdA--
