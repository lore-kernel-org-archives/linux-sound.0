Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEA21A9FB7
	for <linux-sound@vger.kernel.org>; Mon, 22 Sep 2025 11:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758542289; cv=none; b=AnDcI+nS8NY020a1J5ILOAYNN7JoKTiPWr1JnaEEbbH3RRb43S0ueHwFlr0noOALkIypHm3srfK97P6x5vZNHT7P8YTtW54ImNXlt+IhHwn1qbt/3Q5UuI00sQPsNu2OW4SX8ywynUhSOY1EANWHpflvvaCGrRx5K09c7AFNuhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758542289; c=relaxed/simple;
	bh=HX3E30IHqIF6O3DenosKcHkyqy9Gh60cCJAKMryfqKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KZdg+vMlciKXUVxHV3R6Hvj+8TgZAGwviUSeItm5Ptycc8rxW/PVcSeF8KV8QoloBiI0anOyrhfb49yWMlSGZotMftrSK188Pfx1nV259xHh8PxAGOLhJH57baSmjMxW5ipqNzrVb+L25vV6xE0D7xn96ysVwQ6H+ixZOStQMNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z0GAXHQM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z0GAXHQM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C2D5C4CEF0;
	Mon, 22 Sep 2025 11:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758542288;
	bh=HX3E30IHqIF6O3DenosKcHkyqy9Gh60cCJAKMryfqKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z0GAXHQMOhzuryetOuStIWzE+mXNfSnx/PTNQLTnPRecWDXK90lGMeKBh6cD4VsFB
	 MnM1PVr7ZT9AR8oSMZYYVRLV15ok2EAzmj9a/1bC9VB2DExCoqFeGtR8W0W0n6+S7C
	 jZnEG5TBIpZ4k8K9GkBWFsgHmkJ7fh+/wpolip1tMVxGtmKnevz2uFtGaSHGJLUxGH
	 Fg6gUPPkZOZtVBbUJngGY/Bq15/UlDJ1r6afb2ttKy7W40pAm21CGt6uTjWzJ4P0tY
	 Sm86nRz160W3X+zkuFTVCEqwMUIh2Z0SLmGkhymIelt6cLmVhyBWmR64sksHp8gwEJ
	 03UAvMq3xuIDg==
Date: Mon, 22 Sep 2025 13:58:03 +0200
From: Mark Brown <broonie@kernel.org>
To: Niranjan H Y <niranjan.hy@ti.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	yung-chuan.liao@linux.intel.com, cezary.rojewski@intel.com,
	peter.ujfalusi@linux.intel.com, ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.dev,
	navada@ti.com, shenghao-ding@ti.com, v-hampiholi@ti.com,
	baojun.xu@ti.com
Subject: Re: [PATCH v5 1/5] ASoC: ops: improve snd_soc_get_volsw
Message-ID: <aNE5y5iMWSLyEMmr@finisterre.sirena.org.uk>
References: <20250912083624.804-1-niranjan.hy@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p6H9WN8cpiBZ26bE"
Content-Disposition: inline
In-Reply-To: <20250912083624.804-1-niranjan.hy@ti.com>
X-Cookie: Reunite Gondwondaland!


--p6H9WN8cpiBZ26bE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 12, 2025 at 02:06:20PM +0530, Niranjan H Y wrote:

> * add error handling in case register read fails
> * clamp the values if the register value read is
>   out of range

This is really two changes, they don't even overlap code wise - see
submitting-patches.rst.

> @@ -249,9 +250,15 @@ static int soc_get_volsw(struct snd_kcontrol *kcontr=
ol,
>  {
>  	struct snd_soc_component *component =3D snd_kcontrol_chip(kcontrol);
>  	unsigned int reg_val;
> -	int val;
> +	int val, ret =3D 0;
> =20
>  	reg_val =3D snd_soc_component_read(component, mc->reg);
> +	val =3D reg_val;
> +	if (val < 0) {

Here reg_val is an unsigned int, but then we assign that to an int check
if it's less than 0.  I don't see how that can work sensibly, and indeed
when I test it on some amlogic platforms it blows up:

   https://lava.sirena.org.uk/scheduler/job/1862694#L1927

that normaly succeds:

   https://lava.sirena.org.uk/scheduler/job/1863246#L1931

It's obviously not a bad idea to have error checking, we should really
do that, but it's a bigger rework than this.

--p6H9WN8cpiBZ26bE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjROcsACgkQJNaLcl1U
h9CeYgf9EKFJkDnAwswEm7R8IAmEZ+Ivx5AOvI5p/vO9SgDYC5uKXSae/460idRN
KqjvlSmrQ9ra0u4NeTcX9cdJ9KXsplZWh1Bk1kP79ZCsmZTVM7VbXzkm/Aze2w/2
s497e9oTVI0gICubAPbVjk8ULjTFV+ifyKEGJqALJb1bxC34GFeo0T2loK7mujS4
bu+BR+O6w+cebzxJHQf7slbPv7N4YQRUQsS+RiAVmxaEZwyitFmkOMbqW32/8GUA
czl0wdYelJsFWJCaSjlLxqWgU6tABRgXpOJaWge04swGz7y4ZZkQl/XJpnGBRWnD
2MXRZmETi4E2rf3KmLser4ofQ6eAag==
=CQ1/
-----END PGP SIGNATURE-----

--p6H9WN8cpiBZ26bE--
