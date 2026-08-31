Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9845237C923
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 20:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788209848; cv=none; b=d2CGF3/G9O7vsGxMJ+O6oh1FF1NVe2TAqSG4WJWjQxENkbEMFAx+oLs8sVm1ZYTsCCqpmsslLFJ8bH7BUnY1Q3qXPdPfHuYr6ZDZtOEPCEjNO2kNBVbkLYWhTFHyzMAw6tl3Es7hRpz5DEXOKfIWO+w9Ix4kxJUDuLNC8BH9fjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788209848; c=relaxed/simple;
	bh=SZFnu8U3lGaZywGc+S5AHO9Rs2+8eDZVx0zLu4RGMm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b0qUnIl5itwS4wXPiERbBt2VRK5xR0YFJ4/pkCCHs2CeUvJ7sEtw23MdBmLB965wA5aPV2I0wyNqRqZidU3KpNAvNvbSksVa52FxCHfNLAxbjAifdmdfXq97SSn8T4Wlboc6qpW1uZU/w7RcgBedAJIXbuPaR8feIwmTXI4lA1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KWVCQErD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KWVCQErD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D1071F000E9;
	Mon, 31 Aug 2026 20:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788209845;
	bh=gaZEKL2+TthySOxdON0donjsFeKTptge43WVMyCtQvY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KWVCQErDeig5I9I/6973al8oXkfRKNRVDvmRNZCKW2waI++V+pHr87T1gUTawwTP3
	 hxNqJy03Dxj7s7aYiuCwSHaguQ9T5IjBw9kxH9d6Ji3TedAg2O+fasW5n6tE+O7DNz
	 /PoNQurqO/WOvd/D5kUq5lHF+3Aazzm6WCmwcwwzVRnoQ93hp+DUrPTP8MRiBbv3lW
	 qGDXpp2wnOI+HRfAw4+AglYQqyFfFkhH1Jsz9lfSjCQAe7jN0Iq+q3PlIYM+6IRo4V
	 HjzSlN1o9zmBXguPKnpId8I1KhICBBEzDmYKprvE42AvwPtKw4cc2TX3dd1J+5Ozhq
	 7tEf1D9f3hqIg==
Date: Mon, 31 Aug 2026 21:57:21 +0100
From: Mark Brown <broonie@kernel.org>
To: jml <jml@carbonforge.ai>
Cc: Vijendar.Mukunda@amd.com, shenghao-ding@ti.com,
	venkataprasad.potturu@amd.com, kevin-lu@ti.com, baojun.xu@ti.com,
	sen@ti.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 3/3] ASoC: tas2783: re-initialise amplifiers from
 .startup after system sleep
Message-ID: <0c55f950-fc93-4826-9178-193dcf64658f@sirena.org.uk>
References: <20260824034153.50193-1-jml@carbonforge.ai>
 <20260824034153.50193-4-jml@carbonforge.ai>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8PkRpOwmIxTTN1t4"
Content-Disposition: inline
In-Reply-To: <20260824034153.50193-4-jml@carbonforge.ai>
X-Cookie: Sell by date stamped on bottom.


--8PkRpOwmIxTTN1t4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 23, 2026 at 08:41:53PM -0700, jml wrote:

For DCO purposes you should really use something that's less obviously a
pseudonym.

> After system sleep the amplifiers come back silent. The firmware is in
> fact re-downloaded correctly when the peripheral re-enumerates - the=20
> download reports success and both fw_dl_success and hw_init are set -=20
> but the part still produces no output. Only a firmware download
> performed shortly before playback restores sound.

This really feels like a bodge; the resume path ought to be able to
figure out getting the device into a good state without this.  There's
some issues below which I think would be best solved by handling this in
the actual resume path.  Are you sure it's not something like races with
the device bouncing on and off the bus during init and something eating
all the removals while a callback is running?

> +static int tas_sdw_startup(struct snd_pcm_substream *substream,
> +			   struct snd_soc_dai *dai)
> +{

> +	tas_dev->hw_init =3D false;
> +	regcache_cache_only(tas_dev->regmap, false);
> +
> +	ret =3D tas_io_init(tas_dev->dev, tas_dev->sdw_peripheral);
> +	if (ret || !tas_dev->fw_dl_success) {

What stops tas_update_status() running at the same time?  That also
tries to do an _io_init().  Also given that _io_init() does a software
reset do we need to resync bits of the cache?

>  static const struct snd_soc_dai_ops tas_dai_ops =3D {
> +	.startup	=3D tas_sdw_startup,

This only runs for new streams so if we're suspended with active audio
we won't go through startup again...

> +/*
> + * fw_dl_success on its own is not a reliable indication that the DSP st=
ill
> + * holds its program: whether a given peripheral re-enumerates before or
> + * after this notifier runs is a race, and a download performed while the
> + * bus is still settling does not stick.
> + */
> +static int tas2783_pm_notify(struct notifier_block *nb,
> +			     unsigned long action, void *data)
> +{
> +	struct tas2783_prv *tas_dev =3D
> +		container_of(nb, struct tas2783_prv, pm_nb);
> +
> +	switch (action) {
> +	case PM_SUSPEND_PREPARE:
> +	case PM_HIBERNATION_PREPARE:
> +	case PM_POST_SUSPEND:
> +	case PM_POST_HIBERNATION:
> +		tas_dev->force_reinit =3D true;
> +		break;

=2E..which is going to interact poorly with this.

--8PkRpOwmIxTTN1t4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqV6rAACgkQJNaLcl1U
h9DsOwgAhfeJl7T51KL0tDm2B4YVvuYavTxf7op3Jnf4Ar4817FRjLA445Q5fvcy
trmr4c/P0AkIPEl+1k+IfDDEwoPCvQGP0Wdoj8nhD2oLxlRJEtuPu910zuQCX5ts
XVJ9uZRE/FUMrMzdjkzKSf/Ehcte8wKq6Sk1F7QaWjqOcGXmlKWPpEb6WPzeVJRe
6Gzm3Vnm1o/asX8RWw5t17Yqi/WbvA6J9nXOsEvhMQE4IlQL8WXKC3abA2cnz7kV
qLnaYe/LhrvTcCgH5GSPUgzts7RUtEFE/w9QxA144/Wv/DFItJYaC+N9tNoFa0jc
J0aaQ8/hvnlVHMVhaf8uCspS+IdsZg==
=9/PK
-----END PGP SIGNATURE-----

--8PkRpOwmIxTTN1t4--
