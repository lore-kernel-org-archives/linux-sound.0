Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4598D34C130;
	Thu,  2 Jul 2026 18:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783017189; cv=none; b=D0syYMNLvwPgm0l2PQD/2haF2EGd1CQ1wkeJvVzhnIUPL5oG/w4Or6h+LhRdIkzPGnZVzj2bwBhZb39ZaLGvP4PuDh3iObcV+LVUj6RcQP7Owp+PMCDcI58e8L+uB+FcVbYfSB/gNT7/uq1fdSv8zy9M9UH/YtX60pFs9NjlRds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783017189; c=relaxed/simple;
	bh=fDiisAO+/G9RNY6V7cFMhWsVqb+s5dZ/p6x2IiHBzGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nY38bv528ZQo15M/dTw675Jr1jTo7dvfRBNE6nKEWRWFXu8odU7fGEwJWg5AoGiQUspCiZ1cADkLV4wZn2Nh6QAin9VSaFmdzdREDNibuUJnsgb2+Xm2Rf6s+mqQFBtqaSzLHKhehUcC4Xp86+EvCNV7IcWFH+nSWkz8VtNy8dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jVclXSRE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jVclXSRE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD8771F00A3D;
	Thu,  2 Jul 2026 18:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783017187;
	bh=iKhT3vG6Ne54QoZ5v4Za8qBp+EQHr0QjXvpIIa9RjKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jVclXSREZh41Y6iae0JKZkrjQaVkjIrJxtE1sBU4v9hDuvmb9EJJBSBKx5dEa7gtY
	 QXxV3xb0pZkH5fG16V1AUQO0ZTRZHcfzy055W2zptnpx+XR/FEKVTUvjHT3qQqSRZn
	 80RzGGub21pitpwJvB3/F8yMTYJi/XuNEcXARSwuLpfZ09oQsSRRAwLXo4j0uqvH6C
	 FckAfH+Dy1tHIU0jJqI8dqLDYqWBoCPsSgZuUSV36TWKKVywhODTtyPdJmTbuvo4t8
	 RwHQ1K+Bk4TxC5OA2llFqSB/3wMTOJQLdEE0eP169mKzylOf4hZRMYPRyPsrWp5IId
	 lUiioj1PWQkKw==
Date: Thu, 2 Jul 2026 19:33:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: tas2781: bound firmware description string parsing
Message-ID: <d4fc66ad-70d2-4e57-8298-788e8724b8ea@sirena.org.uk>
References: <20260701053255.29087-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="D2BlXoTSWgar3jKi"
Content-Disposition: inline
In-Reply-To: <20260701053255.29087-1-pengpeng@iscas.ac.cn>
X-Cookie: Reactor error - core dumped!


--D2BlXoTSWgar3jKi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 01, 2026 at 01:32:55PM +0800, Pengpeng Hou wrote:

> @@ -2165,7 +2205,12 @@ static int fw_parse_calibration_data(struct tasdev=
ice_priv *tas_priv,
>  		calibration =3D &(tas_fmw->calibrations[i]);
>  		offset +=3D 64;
> =20
> -		n =3D strlen((char *)&data[offset]);
> +		n =3D tasdevice_fw_strnlen(fmw, offset);
> +		if (n < 0) {
> +			dev_err(tas_priv->dev, "Description err\n");
> +			offset =3D n;
> +			goto out;
> +		}

In this case n is an unsigned number so the error check is broken here.

--D2BlXoTSWgar3jKi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpGrt4ACgkQJNaLcl1U
h9Ctpwf/Tw/ajbqKHfje41/0samzYPHZxK9Ga8meogvl4UhZairU2sjYiOJGkEO8
t3UXGVgcZcdhSwAMD1xoaxuNRazM0Hkmlyc0Wz70dUUJr3ulwA+3i6U4OwYdcOUE
CPVx9BMP+Zo6qmUxYP5GrmOmZCok753ibWH5mfx7se65kmvVqv6ZVE1WymOIjPRd
q9A5wQztqtKcKyu5VfHKIhDZlgYLJYV36NfkX0HIyj1tgY7nbzhLkEq4ghRArTEW
whKQ4UO1ZZantRcikv4aQShY5pUFe+pGvkHjZotBlfKRXfr2PS/QfC+4HDHiOX02
Dp9/EsxypRnyNsOoYADy3LDlp6wxyA==
=sAnr
-----END PGP SIGNATURE-----

--D2BlXoTSWgar3jKi--
