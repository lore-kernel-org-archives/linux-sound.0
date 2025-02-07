Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAB71E1A33
	for <linux-sound@vger.kernel.org>; Fri,  7 Feb 2025 13:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738934020; cv=none; b=KeULkLhFC4CJ26bLi8y3yxHzMC/xNGeV0NLgjVfpu57wqTgKasU34dMbByBOfmeS4A2Cnj6JzEJygwJcpWsE1P5NRhM6Pu/wCqVgxy2d3xTV4Hk0luz1c7HYkHvfP6M/vJ/oFhIzpUWvEBNGciJrpB7O/oi8RqD0haFpUZL6/ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738934020; c=relaxed/simple;
	bh=fHmM7S/9TWF8DFxEexQ+inKw/HMdCDK9SVSyj3cKC/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UrFpbcZRq0FytQnKwhvIVS2NK0UYTWYUh4+R1nMRfAYpbNMjEaEGNHSae9OlBgfwWqiBuqkvfrGvuBb0jG6Ty/7RMPKTuR95aqaL8ey+j80Y4v9D1NreljFErnZrbQB7aaFv6clZCbqvvXpvHGL8xBIJ+OPTCU9GfWjyEcwQG8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=idMZ+i6j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="idMZ+i6j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E609C4CED1;
	Fri,  7 Feb 2025 13:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738934019;
	bh=fHmM7S/9TWF8DFxEexQ+inKw/HMdCDK9SVSyj3cKC/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=idMZ+i6jjUgX+K/qZzJhpy4laW5PW94a1Wn42OQdmr2h8aurMmExVUDLT4hxJlEnP
	 BBDWJJWewhVTvWhyMUgOMDKE/hQSipojMZCq6iweb+kNeHeUAGih3XGuqAzOz/r/Zz
	 IUxF8+ZzhTuAOip6xaUipic/ZwWKn/klG5Z+Zb6VjKC/pcdSZjByPTXxv5mcXx/Pf7
	 JuVNW46C8spr8jk0pSGbac5jvB2nH/ny8eI+0AVg/CpD6id15JsZV8p5SnCWqGkhS8
	 dH7iTqJPXJfJGvOSN7Us4IyRPPLi8wdwQZhz8LbRRZ/+RBGwVtohlMi+qcVcSOkLxr
	 peTU/PE+4X5GQ==
Date: Fri, 7 Feb 2025 13:13:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: tiwai@suse.de, linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev, bard.liao@intel.com
Subject: Re: [PATCH 1/2] fixup!  ASoC: Intel: soc-acpi-intel-ptl-match: add
 rt712_vb + rt1320 support
Message-ID: <19b6dc76-abb5-4405-a7f5-d97b77c3b7b7@sirena.org.uk>
References: <20250207123637.215320-1-yung-chuan.liao@linux.intel.com>
 <20250207123637.215320-2-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DDxtntWBHZi8bGmh"
Content-Disposition: inline
In-Reply-To: <20250207123637.215320-2-yung-chuan.liao@linux.intel.com>
X-Cookie: MMM-MM!!  So THIS is BIO-NEBULATION!


--DDxtntWBHZi8bGmh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 07, 2025 at 08:36:36PM +0800, Bard Liao wrote:
> From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
>=20
> s/lnl/ptl

You've left the fixup!s in the subject lines here...

--DDxtntWBHZi8bGmh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmemBv4ACgkQJNaLcl1U
h9CvzAf8D0y4SAScqSDiDXZsaOh3a4Yp6GW4kTjSi1gFB2P+JRUpVJuBHfNEObNW
/przJurzIOUiVT8Yahx4SvAoWtppZkvYG8v2KZYFhlF+Or/bNnIm/5WQc3VIHTqH
oxtT/khTTFRIzS3i+pPs44cEz9FAao/tBQGtfSZtEr3ZbgTQ3hXkHGgjAM3k/ckU
UnSb3fup/8USJDw+aAgL5VQK+e2S+uvkyzfPeKcAwJnyPVsh6a+Xs0HFLXzb7ypc
4JUnfOmoYEY6zKZtoXuMgEMlBfn777sg1rzg3kqQhiPDtZmJb24mQefyOA/6hYb+
9NGS7mdMR1B+kFo2iIGhGpYmQAutOg==
=XoSK
-----END PGP SIGNATURE-----

--DDxtntWBHZi8bGmh--
