Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72EE3D3D1A;
	Mon, 30 Mar 2026 13:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774877025; cv=none; b=oKeVeLEji1MLFIcXkzpt8YkyvrzFak3X/7Cc4kshEUbxWK4VdUUpckHWap9kfMUExPPi3XDhD7CrI1XwabAiLdnc4aVzfgJ2sKy47cbvNR1N3MzxGaiQQf3xWqd16209JRrWBC/o92wGwm8CZAOR2Nl/5kDZJdTQArfwjxKTzl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774877025; c=relaxed/simple;
	bh=X1+YBhc/ZSUl9M7/HqQfBOi/B766QZ/5KReMpWzPq5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bewct4cqT1VmBdzyb+o6byW7lqKzkk8tDDJSTFqALPDI/MjALBywrWr6IW7hMf50YpKiLJlseW1hhl1Vc6AGZgg0skdPv1DMfTI2cTkspYXMENIWONb4ZQjlL3PMo79UeygBVo3DDZnssT6tzfjR7dF+HiZ1hQnEBH42K0NWF0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MR2vrXID; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MR2vrXID"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 725C6C4CEF7;
	Mon, 30 Mar 2026 13:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774877025;
	bh=X1+YBhc/ZSUl9M7/HqQfBOi/B766QZ/5KReMpWzPq5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MR2vrXIDzjGj6xwXFk1oY54tzC7aa9qaYVEVYseVortnRvD03zDWkHOU7pmUAu1iw
	 m1+r0sOqlIpRZ07+Q/wYzH/xU3+QUJNB/kJ8uNP2iq+MLgGD4s5+KSy38W8dGWQF40
	 inTgz4HP/CadRQ6ZxTCtd4cWH218eXY/oojqMBYmlvLCgztYcDPnsdH7iHsBd/lYZX
	 iu2s112tidE5DG0koJHRsQn4DQ5+O1HCva2As2nuUhu2utNBt3sLxi99exoUUtnR3Z
	 hy3oRSQaJeQjtsVyXS7ORszN/NR3OIT4ViUhlBjIctkCEbREM5j5+pwgGRax4VyMDg
	 kQPMZalbvpKKQ==
Date: Mon, 30 Mar 2026 14:23:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 11/11] ASoC: fsl_easrc: Change the type for iec958
 channel status controls
Message-ID: <be591d2b-9429-43de-8d5b-357a503607d0@sirena.org.uk>
References: <20260330112555.3637002-1-shengjiu.wang@nxp.com>
 <20260330112555.3637002-12-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/8vzq1AnR7+A91Mx"
Content-Disposition: inline
In-Reply-To: <20260330112555.3637002-12-shengjiu.wang@nxp.com>
X-Cookie: HUGH BEAUMONT died in 1982!!


--/8vzq1AnR7+A91Mx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 07:25:55PM +0800, Shengjiu Wang wrote:
> Use the type SNDRV_CTL_ELEM_TYPE_IEC958 for iec958 channel status
> controls, the original type will cause mixer-test to iterate all 32bit
> values, which costs a lot of time. And using IEC958 type can reduce the
> control numbers.

> Also enable pm runtime before updating registers to make the regmap cache
> data align with the value in hardware.

> @@ -100,22 +130,52 @@ static int fsl_easrc_set_reg(struct snd_kcontrol *k=
control,

> -	ret =3D regmap_update_bits_check(easrc->regmap, mc->regbase,
> -				       GENMASK(31, 0), regval, &changed);
> -	if (ret !=3D 0)
> +	ret =3D pm_runtime_resume_and_get(component->dev);
> +	if (ret)
>  		return ret;
> =20
> -	return changed;
> +	ret =3D regmap_update_bits(easrc->regmap, REG_EASRC_CS0(mc->regbase),
> +				 GENMASK(31, 0), regval[0]);
> +	if (ret !=3D 0)
> +		goto err;

This drops all the checking for changed values that we used to do so we
won't generate notifications to userspace.

--/8vzq1AnR7+A91Mx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnKeVsACgkQJNaLcl1U
h9AQpQf/Wwg0d6wy7+tbE0cV56MY0BWOsiAJfNAdGi5hQfMf9SE+Vj31fy/26gup
/KfPd3I+TVmNUhdvQu21rMFsu1zzN9TapmOn6HcWVmFX90sqjE8WnoOVO9v+MKwt
awK6l4vuVU9ZaQkowma/RECz1RHN/4q1c2f7oRmigkxN360nqjJsOrj6b5AW1j30
fNiofpWfFFTjYdOa6ArtWMQEJhQqptnCa2EgXzZDQStWH4D5CuKgLzG38CTOywCl
siM70hegXV44VYSo+DaGvXhhxFjV6pjtA6MvMGh1G23OzWf0EXc+03MOG5QVF0ej
AocKsmJgOl7HxvhLz4BEx4/quWT4Tw==
=5BGx
-----END PGP SIGNATURE-----

--/8vzq1AnR7+A91Mx--
