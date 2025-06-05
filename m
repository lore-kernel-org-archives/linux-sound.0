Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FAA1F4C94
	for <linux-sound@vger.kernel.org>; Thu,  5 Jun 2025 11:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749124720; cv=none; b=fn4+ajqZG8rZCpB0DAuOB4PLJT8jUIHG2OZaWfkolc50tO/mPRDueTGZEI8/KqhHwOVz5ZTZSz3J1YYfUyVD5QFaWq19PgddJ1BpCeF12gCG63qomnv7AHY5IQfrA7mPaKC+thpcqQz+QdI2wqVhmNOxEataWsw+HSGeW945sDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749124720; c=relaxed/simple;
	bh=AyS7ph0Uow2S6NpS5lXma0tiqdZFpYmPWUvgLoYRwME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r5VvJuxChidsez6jj+2CsiXm+ZD6yp3ZaJBVRnSUBOrhrkrc9ywZCk1b6v+chFJ+9y5K98s1Uf3WV/FW4w67yjZgsY1iZJMqebLVBj0ql1RaMeuoNG5RK94biuLYQQnyE9Ngu7fRXTFRIA+5dw//IUDLC/AckAgPmlms0noghLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ovivcS2Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ovivcS2Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68FFEC4CEE7;
	Thu,  5 Jun 2025 11:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749124720;
	bh=AyS7ph0Uow2S6NpS5lXma0tiqdZFpYmPWUvgLoYRwME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ovivcS2ZoXNVFkju0DehkZyx9uQePAoUt0D4cXrJWD8Cl7+J5dL0kZR31ahO52QUJ
	 izD/4vuiYgBE5LB1XTGUb0Sg5GlYvpuxgU9UWdCi8HbS6ajcrkkoBYvDKGo3Da7zL4
	 Gm8uGFzknRvYkhl3+kjjn3eoHY4HcLTycuvXLfY5I0vBkd+6nCkg57OigPxlXsa6vG
	 erIVXQfJTnKagVA4Df837a6td9FlZFBd2bgfiza3dwdgBHoUmO98gOkXQnQqSPWEpc
	 gkIRgUov3VX0SVTKIGpteZGdZmBnsXzfXfgogo68tjjLyIirwm1TsrOq3p6UXZmfcY
	 y2XSTDbIgVITQ==
Date: Thu, 5 Jun 2025 12:58:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Giedrius =?utf-8?Q?Trainavi=C4=8Dius?= <giedrius@blokas.io>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: soc-dai: tidyup return value of
 snd_soc_xlate_tdm_slot_mask()
Message-ID: <6f9c423f-526d-4395-a8a4-cc3df0c3e724@sirena.org.uk>
References: <87qzzzj7t1.wl-kuninori.morimoto.gx@renesas.com>
 <87msanj69x.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w7yIDmU0/dIdw/Zm"
Content-Disposition: inline
In-Reply-To: <87msanj69x.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: That's no moon...


--w7yIDmU0/dIdw/Zm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 05, 2025 at 02:01:30AM +0000, Kuninori Morimoto wrote:

> Should it be like below instead of fixing (a) ?
>=20
> (S)	int snd_soc_dai_set_tdm_slot(... slots ...)
> 	{
> 		int ret =3D -ENOTSUPP;
> 		...
>=20
> +		if (slots =3D=3D 0) {
> +			ret =3D 0;
> +			goto next;
> +		}
>=20
> 		if (dai->driver->ops &&
> 		    dai->driver->ops->xlate_tdm_slot_mask)
> (b)			ret =3D dai->driver->ops->xlate_tdm_slot_mask(...);
> 		else
> (a)			ret =3D snd_soc_xlate_tdm_slot_mask(...);
> +	next:
> 		...
> 	}
>=20
>=20
> Thank you for your help !!

That does seem safer.

--w7yIDmU0/dIdw/Zm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhBhmsACgkQJNaLcl1U
h9B7wwf6AuNRvXfy7bDIFuFzCjFSxPEKTW1n7+mb+X3WPHVtHjswAeTkFXwyui0P
dxOkLbRxzPpN/04wBvj2h5rrdJL3mMow2gX9qJ2DLAxrU90wt6FGZP+WEQh5uLoQ
jNfyjLzKQFQxDVgrSBTUMfueYuiB/V2jWsOqzdNWVhj5tCU4EcULrkqMRnDdhdHB
d7YxmWsHLZ67rP1a9SDQWxpvDFGqTj64rD0Q5k/XT2S7HDcWF1PkXLQp4dD9V57j
UAEm39/Svemu1fDWad1tj0dsmK+A2vMiA3Xe0uNzm4w/3GENj8/E+6GxNxoMA7sf
nuQN4EeNHjx2NbpqXC+GkG9BvUMTqw==
=Z4DZ
-----END PGP SIGNATURE-----

--w7yIDmU0/dIdw/Zm--
