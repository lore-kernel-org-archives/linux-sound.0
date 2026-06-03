Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CFC399CF2;
	Wed,  3 Jun 2026 07:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780470357; cv=none; b=Z7HWKdv5qNgfjqCVtrfLoTYW1EjRnVjTqbmtbGZLDpGp5Zryvs452VqpcWCK3m2vfHaAyBnJ2ZvwGhwq4ItBEAsB4XH4KsMUKRSludOrvN+GV88BCHcjuYYkI755XutuO6FVI7IySj2r2ryZY3KJCM/TjBVnBFJw3YmaWZ0qXMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780470357; c=relaxed/simple;
	bh=ZwKaBGIDJKzBIqWNQ8DTTESEJnhiILg03ABlkcm53Xk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LzGu0C/Zj2hKL7PvjIgcXHE2zqJ83IfS2oP4Axl7kQaPP2BPVVjO6IgZOEO/0lSxHlbPioEooQ4faQaKg8PfOAjiT+hZpU4/xlvTptKBpyiuELm9a96b6YyYxg+p1EfarKhcx2vsaMBG11g2Zs6O/aALg9o/FuqoZkIFfqwhGrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AysaJPUQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AysaJPUQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0310E1F00893;
	Wed,  3 Jun 2026 07:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780470356;
	bh=25z1k0s++eUF7QlPZTPXl32Gho9JjO3neBW9iB8RL60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AysaJPUQvsZvtMLEfdT+MnxEWCpCBWplzrbcApJ28MoEfEWQnBrkWncPHBfXhMkz/
	 olwoQmjTI9VYlfm8woHY5Ze1WOZD36ObcaDvdnsGAZW3DaV4cdK6Rpn+LWKPmGzbEN
	 l9QN54qtw3I/BfAxt4VaWvltvKN+XWp74ExSBNN1BilYiZPjQ2LksrLicvlAVaVy+R
	 uyp7/9CQ3foHwnwZrZhIU2Q74534mmX+BmJ1NYifkfIcyigC/QWDIa51UmfkkArdwI
	 vsdTepaJstvgJfeKNy1EwbEf3f8VASElPrOLRKbGyJ9lXHUK7RpNEpoEdsMC61oQFS
	 sj0sNDocBP32w==
Date: Wed, 3 Jun 2026 08:05:52 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, notify@kernel.org
Subject: Re: [PATCH RESEND] ASoC: codecs: rk3328: Use managed GPIO and clock
 helpers
Message-ID: <5d353fbc-f4f9-45bb-8f7e-ee7d495e0099@sirena.org.uk>
References: <20260602-asoc-rk3328-devm-resources-v1-1-71878feb5f4c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="U+0PyDSxrcx1n8ZL"
Content-Disposition: inline
In-Reply-To: <20260602-asoc-rk3328-devm-resources-v1-1-71878feb5f4c@gmail.com>
X-Cookie: micro:


--U+0PyDSxrcx1n8ZL
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 02, 2026 at 09:06:21PM -0300, C=E1ssio Gabriel wrote:
> rk3328_platform_probe() acquires the mute GPIO with gpiod_get_optional()
> but never releases it. It also enables mclk and pclk manually while
> relying on probe error labels for unwind, and the driver has no platform
> remove callback to disable those clocks after a successful unbind.

Please do not submit new versions of already applied patches, please
submit incremental updates to the existing code.  Modifying existing
commits creates problems for other users building on top of those
commits so it's best practice to only change pubished git commits if
absolutely essential.

--U+0PyDSxrcx1n8ZL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmof0k8ACgkQJNaLcl1U
h9AkGgf+JECnjZ0dFwDG4wH9Locr6xUVJqhM8ja6D3mMAeM+aSC36hws2SIrJs5I
TRBew6IBsHlBzgJNpiFsqKepp2xg5VQDGy7ZfsT9CSuHeHDBAa4P7jhm4SIPO9cI
TukzcRBKDet/MJ9uVUKOppP3vbgrw3BDU6doXYR1jcBuaTa8cKbPGFCW27qvBr3k
hAQFhUxAvFcBnSoIPCBJs9fYCwUVoLW09GYYmtaff5Bya/RhxHxO4icU7va5tl3m
ASNO+VqtsPiwhAgSI8bAmyOYnwvEHD9iygUQX8VQ+FA56SJC8S4hx/jp8xi5sNU3
TP6NuhbUpJTbiOLQhB5Bm2ljyfP0VQ==
=5pDO
-----END PGP SIGNATURE-----

--U+0PyDSxrcx1n8ZL--
