Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE86923D7CE;
	Sun, 19 Jul 2026 13:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784467472; cv=none; b=qUOMX33U50c3OKok/ZSUM4OqVQLDOd1NXxplFIwqI+hRQ6A69I8squP91nHq+ltx/iATKE6S4imw7VE5HvPZ/tGSiWx+w8c0lNhrLxSCOofXT/BPw9v5Xoy27tohVrgR9WhK8+ePQSWvdKuOQSYsiOJ0gC9hpcT+pxRyxLmfRy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784467472; c=relaxed/simple;
	bh=ZAhml5kBzYDXDcoe4pVPeoIO0moi+/iferggWiGj+rk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PpHGw3fOZWddEkutevDDWFBGT5fXtXQtjQ02MiNWXIaRo6aAQv/m/l9/Ew7gq1b7hraE7QS4ibRcBNvfBpBR3+HaZLVJ6abkGDS5lZ3LOIY9JAcFPqk3e1b6mQuBLUZXM4qgcSgY6tWtndgSfPUNJiTyX14SCu4FelH+AVdHkH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CJUNuxn8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CJUNuxn8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 242C21F000E9;
	Sun, 19 Jul 2026 13:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784467470;
	bh=3Ic+th0EB1wSnPuZW6L9C2TYd9qgoVuTzIFODkpmlp8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CJUNuxn87gYA7AyiGVOQvWUkxL2fSiMLYTVpHDCTXMwOGZijWPHV0VNe3hLK5z+R8
	 w2q4lDvGf+yxrptwGMiKaB3/xwabqCQYtuWZHSj/QCNShwfi2XWoZKgVLrTUeGKG8F
	 KG1V4Y9iZ6EPJBThox0z15qh4ebQHJNuws3gdXrUeUqadM3I2aSoA4QhHFomnQgH/T
	 Q7fpvFWWoMDijUNmVvQWNUbd5/3ZdqQ8d+nKTcCtp2pnBU6xWeYXZHAh+XSgqFmakh
	 4hJdrj5gkTVTkVquP5bsSL7waDlZ988RmmJ/QeLC4Dc+4E6Ld4UUT95803M5lNdRAV
	 6iDFq3TeWJYlA==
Date: Sun, 19 Jul 2026 14:24:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH v3 2/4] ASoC: SDCA: Populate IRQ data earlier
Message-ID: <5eb4f715-4bbc-4dd7-94b2-6968b1dcd273@sirena.org.uk>
References: <20260716142639.2306757-1-ckeepax@opensource.cirrus.com>
 <20260716142639.2306757-3-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Bc45dwWfbYhMHKYl"
Content-Disposition: inline
In-Reply-To: <20260716142639.2306757-3-ckeepax@opensource.cirrus.com>
X-Cookie: Courage is grace under pressure.


--Bc45dwWfbYhMHKYl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2026 at 03:26:37PM +0100, Charles Keepax wrote:
> Currently, the IRQ data (attached Entity/Control/etc) is populated
> as the IRQ is requested. However, this can cause issues as
> occasionally the setup process wants to access specifics of
> an IRQ before the IRQ is actually enabled. To facilitate this
> cache all the IRQ data during sdca_irq_populate_early() and make
> sdca_irq_populate() simply request the outstanding IRQs. This
> also has the advantage that sdca_irq_populate() can now just
> iterate through the IRQ array which is much smaller/faster than
> going through every Entity in the Function for Controls.

> --- a/sound/soc/sdca/sdca_interrupts.c
> +++ b/sound/soc/sdca/sdca_interrupts.c
> @@ -375,7 +375,7 @@ int sdca_irq_data_populate(struct device *dev, struct=
 regmap *regmap,
>  	if (!dev)
>  		return -ENODEV;
> =20
> -	name =3D kasprintf(GFP_KERNEL, "%s %s", entity->label, control->label);
> +	name =3D devm_kasprintf(dev, GFP_KERNEL, "%s %s", entity->label, contro=
l->label);
>  	if (!name)
>  		return -ENOMEM;
> =20

Moving to devm_ makes me a bit nervous.

> @@ -448,21 +448,34 @@ int sdca_irq_populate_early(struct device *dev, str=
uct regmap *regmap,

> +			case SDCA_CTL_TYPE_S(GE, DETECTED_MODE):
> +				ret =3D sdca_jack_alloc_state(interrupt);
>  				if (ret)
>  					return ret;
> =20
> +				interrupt->handler =3D detected_mode_handler;
> +				break;

>  		      struct sdca_interrupt_info *info)
>=20

I'm a bit surprised there's no corresponding change in the cleanup path,
we're moving the allocation to the device driver not the card but the
card may be bound and unbound from the device.  Perhaps I'm missing
something?

--Bc45dwWfbYhMHKYl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpc0AkACgkQJNaLcl1U
h9A/Ugf+PyMw7nWvQfITVn5vc0+uxTaN5UD8Y84ifYYfS1gvBXOeAK0ht1ozcATw
6ydYAn9/PBZpR0UUPYcq5PS6eCtvSIilsW2GJa7v9COUNJ4O7OAbog7WNcTY7Ogk
mneQafRUNJj7zVsLYuWEdRYsyrlPUK30G/KayH/jWwh1Cl+ak8ZiflEpDYJwnMxf
3soOs8QP8H+AMyzExrVUhQIaEJY5xpM3FeAVL2i6+L8XHB3JIkgmHK4RsRDYmLKS
QdnAfat2ZcCan9Tj/UNmFZ99Sz1RHBAfeOiA0OlVaUg9ZMdW3jm97jUwzld97dEk
4eE+0HnMQoXYhtC1GJNMxXfTJOygmg==
=GE8+
-----END PGP SIGNATURE-----

--Bc45dwWfbYhMHKYl--
