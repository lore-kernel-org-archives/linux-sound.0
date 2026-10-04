Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2BB1DDA18
	for <linux-sound@vger.kernel.org>; Sun,  4 Oct 2026 21:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791150769; cv=none; b=X5Bg5UTxBLP7hKxXb+fEIRNtIGIPX1utDQ9ztxZgd8cACLWaU+XWwZUrzyoSVK4t+ptqQsALlfHQcyAzZPrSfp3uw5JDSRKkki0vGX1yLVS27xTschT4LHh9WV19xjUZ8UNB3xZkem23SF/0wTgpbKlUT33xUQx2gkRw7+g8KPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791150769; c=relaxed/simple;
	bh=B01udrvFKaiAYG3e64IsGiJlC/RHSsxegGAh1/gxyWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PuSDQRcOxKcME3Da+qfPF0up3mMWS+ZSSEDaFPFWN3Smv3vpZzjjVTCI7d7gYxZ/87HWBydOyDmJUtjxA5NUH7IsZWCKsxiP53YGMPpZq2uZ4a37JIhP1QiF7q2fLLvYr1SuxfjWwvrsy7Iv8MmRWnYjfAiynW/p1Zm3QVqpFhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EHcOkV4q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EHcOkV4q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3CB31F000FF;
	Sun,  4 Oct 2026 21:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791150767;
	bh=X8crVz+bspEXHqi4NkD9UpV1i/UiXxOt6y0Ur/gYGOg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EHcOkV4qvRtxNSKLEO0+bnJf3CxOmMro35uZX8J2t0bESHrRqeccZMBfEX8k3uK0F
	 q6SwWO/ZAVTnzhptEAJhaF7xoldciPXDhNOAvs+7I7LlbEg2cP9cDenUTTvjaBY69z
	 okIB4mN+3Pm+gmifj6IkycjW/GNAPQV1n56sC2zUHck2gJahp+uBllIg141v/TOmMF
	 EbKD8KdMZCg4xboOLhzS0LfT4BPEt6sO2O7VkTDIrrf/d5Vfejjs3b2gVmqnw1v5hr
	 rMfFs14ntZP3sFO3rcQS5Dzc++9MtAN7ZOe56fYub2w+ZMw4fEoRBYk92zxObqcJaw
	 hwmvMEbgDxFEQ==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 8CB1B15DD69E; Sun, 04 Oct 2026 22:52:40 +0100 (BST)
Date: Sun, 4 Oct 2026 23:52:40 +0200
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 07/13] ASoC: soc-component: move
 soc_{probe/remove}_component() to soc-component.c
Message-ID: <asLKqMzZpRhloNXq@sirena.org.uk>
Mail-Followup-To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>,
	linux-sound@vger.kernel.org
References: <87mrsw6cje.wl-kuninori.morimoto.gx@renesas.com>
 <87cxts6cha.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qmVYpPPV4+ZTAupj"
Content-Disposition: inline
In-Reply-To: <87cxts6cha.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Use the Force, Luke.


--qmVYpPPV4+ZTAupj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 02, 2026 at 02:52:01AM +0000, Kuninori Morimoto wrote:
> struct snd_soc_component will be capsuled soon, its member will not be
> able to access from non soc-component.c.
>=20
> Move soc_{probe/remove}_component() to soc-component.c

> -int snd_soc_component_probe(struct snd_soc_component *component)
> -{
> -	int ret =3D 0;
> -
> -	if (component->driver->probe)
> -		ret =3D component->driver->probe(component);
> -
> -	return soc_component_ret(component, ret);

This has a soc_component_ret()...

> +int snd_soc_component_probe(struct snd_soc_component *component, struct =
snd_soc_card *card)
> +{

> +	if (component->card) {
> +		if (component->card !=3D card) {
> +			dev_err(component->dev,
> +				"Trying to bind component \"%s\" to card \"%s\" "
> +				"but is already bound to card \"%s\"\n",
> +				component->name, card->name, component->card->name);

Just have a long line - it's better not to split error messages to help
grep.

> +	if (component->driver->probe) {
> +		ret =3D component->driver->probe(component);
> +		if (ret < 0)
> +			goto err_probe;
> +	}

=2E..this doesn't have an equivalent error log to what soc_component_ret()
does which is probably not great for diagnostics, nor does the cleanup.

--qmVYpPPV4+ZTAupj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrCyp0ACgkQJNaLcl1U
h9B2/gf+Lwyw3H6HAuvPhZjyA4BK5SNmRTkiSUK8uA7WdwmLJJD8qSAKULwIWG2f
ZngYKz2JwgjcW6uKCveC+xoYgvvUIhC4flFvjrrYBV72uICLyrxZPcFWbxGtTJm+
2jOvWADRaougaNtXe9xuUqILqEl7IGuNEmlCWKkZCHPo5o6AFoYlXbkcSWQKrPvA
bHaK7l8jfIgxHzFSyh0gK/Z+UKXJPkNfz8EK2gGLWTpNMs0j0XuOWR7h0V6loFSx
94jEe4NMZtMaiZv5yLRpLACFRSAKHvFcKS/KVFx8tBb8tElH+5wMKmo95Z1rkrVi
9UUl3WmzWjZZ8V5Ghh/4YZLFlyrADg==
=O0Os
-----END PGP SIGNATURE-----

--qmVYpPPV4+ZTAupj--
