Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF002F8E8B
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 14:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782484497; cv=none; b=SwVrxDiraPBI7hhtuG07Cnfile+eIDzgdJKezkLqYTsuUF5zmNRqUlN5LEL5nPHPF92yrN6hnCqPNxMGQU2QUE8XwJHpe3kZNgfHnaxZHsekXFT+EQIgXbC1kv3E5l49CkatKUw3636wU+shvz9E/uV3xSo5BtYvTkBDUm75EMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782484497; c=relaxed/simple;
	bh=15ZnonihTGcSWaGUqDJlS9avYW8C9VNaEdFZ95vyafY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Df1KdwIlSLRWcPxNOY+3bXFIK2h5huD1PzGUBEZoQYCCoj8aD27v9bID0dpDyGF4oSjDal8DS9ySwniv15JWGWn2x6FG/xGA6N7aZ0I8wRxV8MsvgwuHJbUq2coInnufPg4gxibzj1nBLlD2f33TLg+n7lsxY647IWFCNrlFKOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QNitYtm1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QNitYtm1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2D141F000E9;
	Fri, 26 Jun 2026 14:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782484496;
	bh=SlZpP4G+yKhZZvrIE8lGv4nfWKONmZcUWdBMuoPvsBg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QNitYtm1L/EGyNFBSOQfQvSTzt+CKvhk46+sALF2YAmo+Nmg+dltVr56a9faDtxhb
	 VyqKHQm2xmAxXALBDsqbVpC93OH0i2tmMKiDZyD6oHJHveLNvVzanKV7blbPor7IL6
	 1w/dAY7Bv/c2JtA9mSMikaFpAE+KwbEyfJnlP9+UxP1h9dV+CvtSzy3z7W6MtgtSyD
	 hXEKJS33ynCmLs2/yX04/wqgckQF6dXDKPOrR0uCbYWK8VVGPLAwWFtqH3xH4/cI2l
	 AXDdTkBVPYiYafz1LzudvYAjYV88iDx/a1PaU1AryuhKXILKs8KLyNSdR4DeJEgRIP
	 vIhj1pophnOoQ==
Date: Fri, 26 Jun 2026 15:34:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH 1/2] ASoC: sof: nocodec: tidyup sof_nocodec_bes_setup()
Message-ID: <580ced97-a4df-4466-a4b6-aca0da2a9ebb@sirena.org.uk>
References: <87pl1deu34.wl-kuninori.morimoto.gx@renesas.com>
 <87o6gxeu2m.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UQEFeXeMIm7cQXaM"
Content-Disposition: inline
In-Reply-To: <87o6gxeu2m.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: A company is known by the men it keeps.


--UQEFeXeMIm7cQXaM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 05:42:33AM +0000, Kuninori Morimoto wrote:
> It has only 1 card (=3D sof_nocodec_card). No need to use parameter
> to get it.

>  static int sof_nocodec_bes_setup(struct device *dev,
>  				 struct snd_soc_dai_driver *drv,
>  				 struct snd_soc_dai_link *links,
> -				 int link_num, struct snd_soc_card *card)
> +				 int link_num)
>  {
> +	struct snd_soc_card *card =3D &sof_nocodec_card;
>  	struct snd_soc_dai_link_component *dlc;
>  	int i;
> =20

The function still checks the card is non-NULL which is now redundant.

--UQEFeXeMIm7cQXaM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmo+jgsACgkQJNaLcl1U
h9CiGgf/Ti+3jW32UtE2mMaMxv8y6/eHGfDq8fBgJoIGaq60/uMzM6w1vLIC/wCd
PlP/gd8KLMazcLlO980AHG9izF+ElQqbshuZQ/oFGruFkfH0eOtAQuhhDRvriSpu
0301TaD5EkZbAn/tyV6TtQn0mTG78XK5L9ltmDynZ5IqpDYoq1mLwYhvzAEVswZ5
QD19tXpvfISiGr/LXc6DrV8v0oufzWrVYILioxXGsb2AO31CGvNCNsb2iSdts9X5
Tm4GGOWR6qV4ZtVK4DG2iVXWaS87PXIiAjY/3vicGn4F8ZmtFCxQGlqT9ItxBMEA
qpbmB8QvO3UULu3F10jjgrMNZM05PA==
=Cvpn
-----END PGP SIGNATURE-----

--UQEFeXeMIm7cQXaM--
