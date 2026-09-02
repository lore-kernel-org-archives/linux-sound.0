Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24D7361954
	for <linux-sound@vger.kernel.org>; Wed,  2 Sep 2026 14:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788359425; cv=none; b=rGj9JpRTntZ/W/6BRkOjP3Omc2WiuTE9PvqcE3QMlqW1fH9Yg2FflIA++A37F3wWcnMA6FzqcvxHwGQUF/hyqdnXHEOpeiLgb5d15iHs1E12YfyrVG3FQNSWYBOtdo6VrAKyLMuPBxLbu2yobOjlNsguK/Zfu43BEXFk/r+MTtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788359425; c=relaxed/simple;
	bh=Zujxe5u4j4HLI2ZmgTSlUBPfSvvkwhK5ZMtpY/P8NeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tCb8iXlOQ6geJUqtgYrWdOcgGCFfzt3/5BO4ZT/cN8UibVg+1bO0m2zLx++z7Qsd73EZzOS5HCwzLIxSB/r+fMdROSPsrD01LHHEafaQHqnHmX25hu/vhs+XheEsRBjk1AHmJtYKniFiecsk+wmrsV+dD4pT6LzgVVjZCFmjTFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nj8ITsA8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nj8ITsA8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78AFA1F000E9;
	Wed,  2 Sep 2026 14:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788359423;
	bh=rIOZ/j0ymgGZvMEQqXoikEICx6aB66kjETmPoM2Dkuc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Nj8ITsA8wXCijnsWSAzTOjpNaLyQU4orKc5JSTmokeMTBtMacepjF5FDqcl/5il8v
	 KCJblnnZtGp719THZ0ajl8i5Mehyn9qJG28gAgz7/wCo8l08dmUiwT12h+ZXORGscu
	 KfTdvU/t79tEoFP4CkjGQ+WEDw9uKTPndo4VfaA341cngc7YPFKjSOBgt6juw0AINb
	 gkaSig9igD10ArpkWFieV7BwMJeIMo9DNIpGcXAxcIwHjxV00dI35jktSKdsK2EWdY
	 GXGAeF37YFGZEOO2ezDbPEsQF+mV8rqKAm/zbax9dL1D/OyySy6dhZlpw0V0yHYLo8
	 DImpTAI4i4pnw==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id F29C4CD6D9F; Wed, 02 Sep 2026 15:30:19 +0100 (BST)
Date: Wed, 2 Sep 2026 15:30:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: tiwai@suse.de, 13916275206@139.com, perex@perex.cz, lgirdwood@gmail.com,
	linux-sound@vger.kernel.org, baojun.xu@ti.com, k-lu@ti.com
Subject: Re: [PATCH v1] ASoC: tas2781: Protect volume get/put operations with
 guard(mutex)
Message-ID: <apgy-xBtfeR61any@sirena.org.uk>
References: <20260902022500.1182-1-shenghao-ding@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z7P6xrieQmNw3J7u"
Content-Disposition: inline
In-Reply-To: <20260902022500.1182-1-shenghao-ding@ti.com>
X-Cookie: Orders subject to approval.


--z7P6xrieQmNw3J7u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 02, 2026 at 10:25:00AM +0800, Shenghao Ding wrote:
> Add guard(mutex) based codec_lock protection to volume get/put kcontrol
> handlers to prevent races between concurrent register accesses and
> firmware interactions. Use scoped guard for clean auto-release semantics.

> @@ -170,6 +170,7 @@ static int tas2781_digital_getvol(struct snd_kcontrol=
 *kcontrol,
>  	struct soc_mixer_control *mc =3D
>  		(struct soc_mixer_control *)kcontrol->private_value;
> =20
> +	guard(mutex)(&tas_priv->codec_lock);
>  	return tasdevice_digital_getvol(tas_priv, ucontrol, mc);
>  }

This is called by the ALSA core with controls_rwsem, then takes codec_lock.
However tasdevice_fw_ready() takes codec_lock and then creates new controls
which results in snd_ctl_add() taking controls_rwsem.  That's the opposite
ordering so there's a deadlock possibility I think, unless something stops
these controls being visible before the firmware is ready.  lockdep should
complain anyway.



> @@ -181,6 +182,7 @@ static int tas2781_digital_putvol(struct snd_kcontrol=
 *kcontrol,
>  	struct soc_mixer_control *mc =3D
>  		(struct soc_mixer_control *)kcontrol->private_value;
> =20
> +	guard(mutex)(&tas_priv->codec_lock);
>  	return tasdevice_digital_putvol(tas_priv, ucontrol, mc);
>  }
> =20
> @@ -192,6 +194,7 @@ static int tas2781_amp_getvol(struct snd_kcontrol *kc=
ontrol,
>  	struct soc_mixer_control *mc =3D
>  		(struct soc_mixer_control *)kcontrol->private_value;
> =20
> +	guard(mutex)(&tas_priv->codec_lock);
>  	return tasdevice_amp_getvol(tas_priv, ucontrol, mc);
>  }
> =20
> @@ -204,6 +207,7 @@ static int tas2781_amp_putvol(struct snd_kcontrol *kc=
ontrol,
>  	struct soc_mixer_control *mc =3D
>  		(struct soc_mixer_control *)kcontrol->private_value;
> =20
> +	guard(mutex)(&tas_priv->codec_lock);
>  	return tasdevice_amp_putvol(tas_priv, ucontrol, mc);
>  }
> =20
> --=20
> 2.43.0
>=20

--z7P6xrieQmNw3J7u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqYMvsACgkQJNaLcl1U
h9BeFwf/ZF+QFZXAHad77iGlSVibByPM1y9kEV8LmfOW/0uYyMEsJgTd+JiNqpI7
KS6NTa3Xj19GIWz2ik7P/YY2YLW4RhiS2Uwu4nS81Kg5GA+/cY+RcklK+ly97s12
stJDgeX8DO7xrEX1Cr1o5/7UmRvZfbXztaUVFsO1SF40Z9Vbr7gRYPeDSJoeIepT
Bu5snttXh2GT/16n15tYgXXZYyYaILmuDuJPa6SvaYQPVvnUpZnfX4PFtpzxUIlk
4CcyMQ4u/KbGfpGYupsv5swnYscSp6s2MDKv69m3D4PZuQEKoAfkzwNWT/u/6F4Y
q0lLLEQjiqb0u6npfdxmGoYkZkc/yw==
=ighH
-----END PGP SIGNATURE-----

--z7P6xrieQmNw3J7u--
