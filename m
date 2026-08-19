Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E101E515;
	Wed, 19 Aug 2026 16:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787155511; cv=none; b=Zx5JHnSs9IlGIT8GIc3VnNJAXuZ3RhdAiB/Whf59jZP3MMmt2dzuvBmr/XpxuFMWPi9+/5/dHJ+00Il1R09+hIVq1eeepC5yc+Cy5w+Ubx7bfHRW6KzwA2zEVxI5rLdyp14Sv+CoY75z8wuSa7/hNxVJSZwQ1EP4dPb31pligjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787155511; c=relaxed/simple;
	bh=mhB5W5LoBNLHs7yKOUUsRa+KmuC0MZ99xNpKVJIJcnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=It9fldbdxfjxty11Ro1AcQ9iJcgkK6FyV345Fom+DGIJ7Wf/Zf6kNwZVSUMK05xkShW9yXmxzhxb71jnxIAxgAgkK+WEUjARxDF28rjs7KGhshTJhs1ER8w/NttDJcTptnnwDLBcJ/1yzPqLJSubEyZ5lYWBKVYo4Qtx8kbagbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IqyxbUDd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IqyxbUDd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DF051F00A3A;
	Wed, 19 Aug 2026 16:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787155509;
	bh=76fJDa3yU2VhoQqB4RI7nd3g845aWQiGrXShEphjl0s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IqyxbUDdNGT8BeOulzKlmGuFD5psESBzgJ2T+hC6XzD++jB/JY7svtYyfGtg383ss
	 9rybPfEuMe+A4jWqZ1IPe9Wz21eqyD98FX+uHGBjjSxfqZA6SdcgGVtmRe8Zxn7HpD
	 Uri+cjfSS189+GDNnx9zIYVZearL9e1GNQy6xtl2gzCQ6IWUQlsic2CXjbF+UwwpRN
	 KJTMXFqyrfm17AHoEsxULTcRKvHTo9enXaSx0KjIb8YSKNGUIIElBF3soY7FyQQ6AQ
	 Bewvo5z9xY0+39H9Ru7SI/szZJBAJV1o8vfMJ8R/3P8HSYnG6wzynqpC3oup5+36mt
	 Cc8KTsTimL2SA==
Date: Wed, 19 Aug 2026 17:05:05 +0100
From: Mark Brown <broonie@kernel.org>
To: phucduc.bui@gmail.com
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] ASoC: mediatek: mt8183: Fix APLL enable error
 handling
Message-ID: <8881e314-0825-4686-a296-97c03b1dd33d@sirena.org.uk>
References: <20260819101849.68010-1-phucduc.bui@gmail.com>
 <20260819101849.68010-2-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ufr91nyObYYC2H+r"
Content-Disposition: inline
In-Reply-To: <20260819101849.68010-2-phucduc.bui@gmail.com>
X-Cookie: Allow 6 to 8 weeks for delivery.


--ufr91nyObYYC2H+r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2026 at 05:18:47PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
>=20
> Currently, the mt8183_apll*_enable() functions call mux_setting(afe, true)
> but do not check its return value to handle failures.
>=20
> In addition, the cleanup paths of mt8183_apll*_enable() do not call
> mux_setting(afe, false) when the enable operation fails, while the
> mt8183_apll*_disable() functions do.
>=20
> Add error handling for apll*_mux_setting() and call mux_setting(afe, fals=
e)
> in the cleanup paths when mt8183_apll*_enable() fails.

> -	apll1_mux_setting(afe, true);
> +	ret =3D apll1_mux_setting(afe, true);
> +	if (ret) {
> +		dev_err(afe->dev, "%s apll1_mux_setting fail %d\n",
> +			__func__, ret);
> +		goto ERR_APLL1_MUX_SETTING;
> +	}

apll1_mux_setting() logs errors, do we need to add another log?

--ufr91nyObYYC2H+r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqF1DAACgkQJNaLcl1U
h9DXtAf+MNuno9lo4ZsotXg9MOl9pnhUb2KfgvrIvkNu4j4j2CbqJoFi1hMugT8v
GqW9yNgjbPMzJ/Of5sgmWc9keOc4bcVDhewHaKFMa+bKOVmyJ54lcu5PPQ9EYUQk
vdoK9uKUB3eVKWZeOPC0DyyEEP+BOEUt/oqTBPMdlV2hE1hIoMf38j1rEeEBaqID
0kPr7CIi9H9Et3KmDcHVXX+VCTWR8OXpeR6ZHIDbRPnGlCe9kvYYIINkuRntT7kj
dpY6zArUsNBY6TC+XoUlwBln+WR1nTcdifXa1jfVF80RrwMn1EyqR5CHRo86/1oT
M+nJS19pFmGbOWnSVN59/ox9/+TIoA==
=YBEO
-----END PGP SIGNATURE-----

--ufr91nyObYYC2H+r--
