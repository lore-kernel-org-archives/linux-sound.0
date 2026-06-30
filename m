Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BF03F4139
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 13:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782825062; cv=none; b=M8PYSeV9i4AnLNj0FOm6JDG/hIwS9xlpXopaQBGArF5QI/jkenPVyGNvyrOjz09DJ42qSX1TH2fZ5WJG9n4WyVTCXe3PhuYVQLlPMxMYR6oKWEl5EuBeyJBYUeFns2d9bMl1+cjynOrWgubanzYoJExlADP8FkCtG4+SNUwUius=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782825062; c=relaxed/simple;
	bh=zbGriGselz3MylIWuwTSEYJKS0jzpHmeBw5W8JWcdY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hhS1MrP6GSrHSMnK0rxWysz45VvPW4Ai61V2uLh6JLJk+0YRQEZeI1ijUnrTlwFTn4Z8gbfKOx+BrSUEMeybMybF8mJvV9O00hRCuaO4m2LNOi6VeD3jmnKcS5HbfkZ7g1xNK9YBCrt2IIYqRL9x0s+kQ2MG102iFQSc9uswCK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dOCNye6S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dOCNye6S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C7931F000E9;
	Tue, 30 Jun 2026 13:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782825061;
	bh=GyJ713h4xEwvO7wPxVcf3xlSMN4lHf+vJWiAftjJdOI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dOCNye6SQz37ONVf5dPunqpkHxEdolNAsNXRlnWaS9P1fTCrYl0lA+6XE+NckCcvw
	 xGFBMEMXW+gcG6x4XKZ5YF4tgBq+vgBKQkC5AJYXP0X0rZ6/ZsbAxh97OE15bjkZea
	 VvGN/g/u4zko/LKfgVuGpYlmf6P0CKaf0kgbLFfqRQS9ftXLFBPT/JOpWF67phIeTc
	 ym3ATwITYAJEgQYWNhrn8Gpe46hceeJ3QrnsbR8qC45HJ4WOtradcmrVZZKAwAYGaA
	 5VzGTs51Rekkt2Y/0V+KwhRbAocwLHWlKyEXRVhfOhcFd7a7Q0zpQ6aNLUSfGTS/u0
	 l6lVMd0zcWRAQ==
Date: Tue, 30 Jun 2026 14:10:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH 2/5] ASoC: soc-component: add component_name
Message-ID: <545d93d0-eded-46d9-8ce4-57a9ca795d26@sirena.org.uk>
References: <87fr29esth.wl-kuninori.morimoto.gx@renesas.com>
 <87cxxdesss.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JmBr0QQj+D2D9b77"
Content-Disposition: inline
In-Reply-To: <87cxxdesss.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Air is water with holes in it.


--JmBr0QQj+D2D9b77
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 06:09:56AM +0000, Kuninori Morimoto wrote:
> Current component has component->name, but we can't setup it via
> component_driver today, so the user need to use
> snd_soc_component_initialize() / snd_soc_add_component() directly
> instead of using snd_soc_register_component().

> @@ -2717,6 +2717,7 @@ int snd_soc_component_initialize(struct snd_soc_com=
ponent *component,
>  	INIT_LIST_HEAD(&component->card_aux_list);
>  	mutex_init(&component->io_mutex);
> =20
> +	component->name =3D driver->component_name;

Should we handle the case where there's a name somehow already, this is
user visible.  Preserve the existing value and/or warn.

--JmBr0QQj+D2D9b77
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpDwF8ACgkQJNaLcl1U
h9CT2Qf/S4XFeQOC5NOsU8nK3AW+gj4bF9de0q2tuYgTWbrX05ykjeoz7zvI2x6n
+JkEMk6a79/gpPtBjMVEIHyP8xFqQSm+W8GYwgx4OzFgJhl8v4Ej8mjeuKPHRxgh
jfE2d8NN+Lg75a6QY6iblA1/ju+cEiE2iAN80EozcBaq/x7tf7BMhJI1Cb39pSsS
pmKlgLmt7CqcsMki83/uj9PwMVP/om8S51o2Egxi09+Nohw9kW3arJmuNNeJ+Hy1
tQf/28UNFT8lRIgy9KINwNv2adJwjpSvVHgFWFAuDM4Gm62WHq8MmbU4iY6hdiFA
+ba4gO1qsXmte4UZevi35sjwrLF51A==
=pva4
-----END PGP SIGNATURE-----

--JmBr0QQj+D2D9b77--
