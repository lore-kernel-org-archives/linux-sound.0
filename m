Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4AB3B27D9
	for <linux-sound@vger.kernel.org>; Wed,  8 Apr 2026 13:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775655844; cv=none; b=nJKWrJdFaMo4jQmuqPF6gnTGE1yU6+bocFVoV9uLbotVARkn8NJODGcJ4UM8HV/Dpvb1sekl8tiNH4+qwhxRGsPhwqLD3fbRXvoUwVrszddZqVaWBu0LB9TXIrfYWFPYgkEoExxtW0hTESAm2Kf/GEn3uSQLIewSrlSVjNlJ+NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775655844; c=relaxed/simple;
	bh=3CK7pHg5Wgzr+Q5+TDQEkjfSRl8WnskE12w15k8RrGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vz2xcldwlD+yPGy6dt5WSq8LHgKkGRlR36AxS7vFZei11lwBOosOcUeHi++vVbq71ggWEW7N5myLDsugyQ9SqNIdmX3FxyRn4cMc+VT3GkINF3nG8rl9B5F2Z+CXymsCOt3PD2bwZPkTBosQJ4gVHArWvpchp2kgWuoFpHPBIoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AAX5IY0T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AAX5IY0T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AF7AC19421;
	Wed,  8 Apr 2026 13:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775655843;
	bh=3CK7pHg5Wgzr+Q5+TDQEkjfSRl8WnskE12w15k8RrGE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AAX5IY0TgrQ4NYbgXE5YA0uAOt7JhR11GmN0QHyQgyh/iIPsEORbT1BEkJEljaQNJ
	 BjRmVuac3EgXt8GboXmwsriHlFHDMLsCZsC7KGvU8gHOZat2NUuFHuaqfwPbJIgGm8
	 YhdZZACw73OuxImTZpd93CJU1XzQlaTy8NeYN3ap03LTGg8VEI0ds+u1lxNh/1Nbi4
	 UcMQqFPfgarmCQ79DUhkh4Z7T6vvKbcOfp8rod7pZwUfehBFqN5vgYOxNAvIMPbYqv
	 xC/PP2bvxMuumexxd88fJ1t0VKZzs1tvbMrzTj4PSAGVfXZ8jx54RWtfyWBdtlUaTs
	 Y6nbiHwb4d5gA==
Date: Wed, 8 Apr 2026 14:43:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 3/5] ASoC: SDCA: Fix cleanup inversion in class driver
Message-ID: <a4ddbfa3-127b-497b-9227-2a72c32ddd22@sirena.org.uk>
References: <20260408093835.2881486-1-ckeepax@opensource.cirrus.com>
 <20260408093835.2881486-4-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SpnPMhTTb1mfv4aS"
Content-Disposition: inline
In-Reply-To: <20260408093835.2881486-4-ckeepax@opensource.cirrus.com>
X-Cookie: Often things ARE as bad as they seem!


--SpnPMhTTb1mfv4aS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 08, 2026 at 10:38:33AM +0100, Charles Keepax wrote:

> This led to a cleanup inversion where the devm cleanup for the parent
> Soundwire IRQ runs before the handler that removes the function drivers.
> So the parent IRQ is destroyed before the function drivers had a chance
> to do any cleanup and remove their IRQ handlers.

> Move the registrations of the function driver cleanup into
> class_boot_work() after the function drivers are registered, so that it
> runs before the cleanup of the parent SoundWire IRQ handler.

> +static void class_remove_functions(void *data)
> +{
> +	struct sdca_class_drv *drv =3D data;
> +
> +	cancel_work_sync(&drv->boot_work);
> +
> +	sdca_dev_unregister_functions(drv->sdw);
> +}

> @@ -157,6 +166,11 @@ static void class_boot_work(struct work_struct *work)
>  	if (ret)
>  		goto err;
> =20
> +	/* Ensure function drivers are removed before the IRQ is destroyed */
> +	ret =3D devm_add_action_or_reset(drv->dev, class_remove_functions, drv);
> +	if (ret)
> +		goto err;
> +

This means we register the cleanup of boot_work from boot_work which
seems a bit fun and...

> -static void class_dev_remove(void *data)
> -{
> -	struct sdca_class_drv *drv =3D data;
> -
> -	cancel_work_sync(&drv->boot_work);

=2E..what now cancels boot_work if we somehow manage to remove before
boot_work has completed (possibly even before it's scheduled)?

--SpnPMhTTb1mfv4aS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnWW54ACgkQJNaLcl1U
h9CJwgf/W2iYXc6qAh6y9v4c9pC8KfPjn85iTwv0PDTTHb1n+EOO2yoxgfIg/Pqa
w9pgO2u/lhNicOvzABnvxIPlpEe0i09LZSN8PzvW7R8Kjd8fOMRRLH2BEKTDX75k
un2jY5OF3f+4Mdaam4iffb6duSNCOYgXVmioU36cIX666PmkONighsGL2X1jBRHA
BVAPgINRmEg4II0a15CloXihM5KWiVVFvyUnJ2/7Nhn/+8smZi41Xq3aBM3w9DPX
lsyrh2ZthJUxEgsqHYwFcdF8c6JWa0fE4wjysIw2pgbxggxTWuM6Nmg1rnDUka2Z
zrgNG57XKWEIEUViUo2XaG6JlQ4frg==
=xQJK
-----END PGP SIGNATURE-----

--SpnPMhTTb1mfv4aS--
