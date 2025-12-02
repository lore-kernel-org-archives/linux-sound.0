Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B0C214228;
	Tue,  2 Dec 2025 14:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764684623; cv=none; b=ex3RbX9D2bkBzKLGYZn7yGS5AtAh+0j4hV8vt3hPpQWSr7IYTk+at0g9+2x196T+v5b3vehB72VI9gh2xm40LdQAqEsLAx1B5GBb7H3MSptYnvhZGVAHyjx5FiPJbU14u/Ye5LBDWtfKwqW+UjszpU7tNayuQ2XE8sTCmXtXpdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764684623; c=relaxed/simple;
	bh=toiSa8aTXOXIee5QUwyIDTmaXbKxfpnU6/oadVqAivY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZwLPLmLQHRDPzryKxfKQtRZHqV/OUSMo4lIC93NWrekkkwTWDWRHoU/0Vwy6lhGhcwej026j5AGqmjExaPXTviQS+v18dxoWkxrbILLbJre1bhlL+rUmtJQv4+Pl8WU8jkwMJw7OJJP0WA1E7/9mWq4lhJHBx1+9kwiWduX4glA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q0wmGbwz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q0wmGbwz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10EE1C4CEF1;
	Tue,  2 Dec 2025 14:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764684622;
	bh=toiSa8aTXOXIee5QUwyIDTmaXbKxfpnU6/oadVqAivY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q0wmGbwzvTfqiUqXzrLAaqK6Xv43UVufbVHnV6EJoA6gwU3bFdcz2bqWUb9Ws/yAT
	 O+E7WEnWrmrz815F+57prqpOgcFOrhxySXxLgnC0bRSeVT0tP7uKVAySe//rr/0qq1
	 niET7QINwKdxt30TNFOu9MPLZazIcUtoydBYIXuT7t5/Sp2Vq+r/rSo/PNv/yKJIp9
	 1lgAEZdBjRIw4SjVupHIm8JwaFCocjasrMBVI7kBG8K1iA0YMtLrnvJt4xLbWzbfyM
	 0CfWhJF8lrSsp0eEsQv2AweF1rUvhWixVH+z1Y0ApAOVVUUQ08PN/EUI3m1zSe/atH
	 0o8OQO4NC1JNw==
Date: Tue, 2 Dec 2025 14:10:18 +0000
From: Mark Brown <broonie@kernel.org>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: cpcap: Fix event generation for mux controls
Message-ID: <80517214-ccdf-4497-8ced-2e06ad8f9358@sirena.org.uk>
References: <20251201030354.961-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JJ4W//VJMKJyeoQQ"
Content-Disposition: inline
In-Reply-To: <20251201030354.961-1-vulab@iscas.ac.cn>
X-Cookie: Beware the new TTY code!


--JJ4W//VJMKJyeoQQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 01, 2025 at 11:03:54AM +0800, Haotian Zhang wrote:

> -	err =3D regmap_update_bits(cpcap->regmap, CPCAP_REG_RXCOA,
> -				 mask, reg_voice);
> +	err =3D regmap_update_bits_check(cpcap->regmap, CPCAP_REG_RXCOA,
> +				 mask, reg_voice, &change);
>  	if (err)
>  		return err;
> -	err =3D regmap_update_bits(cpcap->regmap, CPCAP_REG_RXSDOA,
> -				 mask, reg_hifi);
> +	err =3D regmap_update_bits_check(cpcap->regmap, CPCAP_REG_RXSDOA,
> +				 mask, reg_hifi, &change);
>  	if (err)
>  		return err;
> -	err =3D regmap_update_bits(cpcap->regmap, CPCAP_REG_RXEPOA,
> -				 mask, reg_ext);
> +	err =3D regmap_update_bits_check(cpcap->regmap, CPCAP_REG_RXEPOA,
> +				 mask, reg_ext, &change);

This will only flag a change if it happens as part of the last update,
each regmap call will overwrite the change flag.

>  	if (err)
>  		return err;
> =20
>  	snd_soc_dapm_mux_update_power(dapm, kcontrol, muxval, e, NULL);
> =20
> -	return 0;
> +	return change ? 1 : 0;
>  }
> =20
>  static int cpcap_input_right_mux_get_enum(struct snd_kcontrol *kcontrol,
> @@ -515,6 +516,7 @@ static int cpcap_input_right_mux_put_enum(struct snd_=
kcontrol *kcontrol,
>  	unsigned int muxval =3D ucontrol->value.enumerated.item[0];
>  	int regval =3D 0, mask;
>  	int err;
> +	bool change =3D false;
> =20
>  	mask =3D 0;
>  	mask |=3D BIT(CPCAP_BIT_MIC1_MUX);
> @@ -539,14 +541,14 @@ static int cpcap_input_right_mux_put_enum(struct sn=
d_kcontrol *kcontrol,
>  		break;
>  	}
> =20
> -	err =3D regmap_update_bits(cpcap->regmap, CPCAP_REG_TXI,
> -				 mask, regval);
> +	err =3D regmap_update_bits_check(cpcap->regmap, CPCAP_REG_TXI,
> +				 mask, regval, &change);
>  	if (err)
>  		return err;
> =20
>  	snd_soc_dapm_mux_update_power(dapm, kcontrol, muxval, e, NULL);
> =20
> -	return 0;
> +	return change ? 1 : 0;
>  }
> =20
>  static int cpcap_input_left_mux_get_enum(struct snd_kcontrol *kcontrol,
> @@ -591,6 +593,7 @@ static int cpcap_input_left_mux_put_enum(struct snd_k=
control *kcontrol,
>  	unsigned int muxval =3D ucontrol->value.enumerated.item[0];
>  	int regval =3D 0, mask;
>  	int err;
> +	bool change =3D false;
> =20
>  	mask =3D 0;
>  	mask |=3D BIT(CPCAP_BIT_MIC2_MUX);
> @@ -607,14 +610,14 @@ static int cpcap_input_left_mux_put_enum(struct snd=
_kcontrol *kcontrol,
>  		break;
>  	}
> =20
> -	err =3D regmap_update_bits(cpcap->regmap, CPCAP_REG_TXI,
> -				 mask, regval);
> +	err =3D regmap_update_bits_check(cpcap->regmap, CPCAP_REG_TXI,
> +				 mask, regval, &change);
>  	if (err)
>  		return err;
> =20
>  	snd_soc_dapm_mux_update_power(dapm, kcontrol, muxval, e, NULL);
> =20
> -	return 0;
> +	return change ? 1 : 0;
>  }
> =20
>  static const struct snd_kcontrol_new cpcap_input_left_mux =3D
> --=20
> 2.50.1.windows.1
>=20

--JJ4W//VJMKJyeoQQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmku80kACgkQJNaLcl1U
h9C+Ngf/Raji1qrpZenwOUKZ+1s0vJ6+yHIYmjInlkoIyCHXyH9I+zx/GAVziinO
F6eOcoxu9PByfs1XOgLmsqM8BHxAtDxV3z4KZ189xcJ3P6H9YprIKdFQ5/+3Zbnp
MFrXVFeIBQkzEacqHjEyRAq/12/6YerTn2wcveR00+eQNKyjsnwkzkC5ZeCL63yi
yJwQwpxzY2Ra6zBU96rnKAljvaK4hSkAV3G/KDOHLzQaKAkkoDnD5W25i10XG0Me
95dXIzQgSECk/8E3i9AMemKmkp3So8Dti4sK+3KcyzcdV6zLei9FxK7pVYOKaVns
1FRXB0o1a0hbwpbiXCy8Ns99Gcop6Q==
=mCZQ
-----END PGP SIGNATURE-----

--JJ4W//VJMKJyeoQQ--
