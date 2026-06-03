Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CC535A38C;
	Wed,  3 Jun 2026 08:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780474698; cv=none; b=QWheIv4jf6zfqMZOM4yN11CAExaHfullDaVamiMtr2a8c2rGZ4qtusisaEAMLFoJYeAono/idCHvQWSyToL2kNWUP4kaP/uBMm6x73Ieh/xfjewNebHVw8Nev2mtXXWzLtAy56170kzYF9FywAxiDDfWD5YH4Tnyyj6z4bQ9V7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780474698; c=relaxed/simple;
	bh=3f7mowVCYbtWbFNFWumsMTJQinYxylXqEaObMd3bN3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZhHbkd5suayjgeHDDqVeb05KvYKpwMwwhaFHq6lEBpAm7YGYrCoLvl8CFhkIKue4WHkTwW5PgHdAeHPHQsNdFULbd/0UVbIUevB62SAOFBgNtTOb+qZcV/7CVeRa13OGaKtrSHxIINqavsBjv7JTo349PuOKkukWqCgZAmnotoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ysrsxghf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ysrsxghf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5709D1F00893;
	Wed,  3 Jun 2026 08:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780474697;
	bh=3f7mowVCYbtWbFNFWumsMTJQinYxylXqEaObMd3bN3U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YsrsxghflWf91OahaSp4oOn59hBhHdGtSsPLpUUtXxM83FJKZP0y2CndDzG0mwYH9
	 eyQl1rhFdmJy00ETlE24vCEk4I9PeV4Ej1yOdYU/nkRXOZNR1l8xjnWwHAi7xeIQwR
	 bsUIhuebSiH9kxbil6z1YGt1MUaQp6PCXqvD43X/A71jf5ca2PLuPwHvBXrN6eE+aC
	 omW8APZNt6gqI9f6HirVHdmvNXxo4auNZP+v5WAI4xxoo6+/WzeirYTuC+3lyK400z
	 MD+ELw/HxDYe00by41624lroEEENT1AN4yInctkIx713pbzbGvmdgJ1Crk8iAl8jSJ
	 xA8J9qItQte8g==
Date: Wed, 3 Jun 2026 09:18:13 +0100
From: Mark Brown <broonie@kernel.org>
To: lijun <lijun01@kylinos.cn>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: loongson: Fix invalid position error in
 ls_pcm_pointer
Message-ID: <43d820f6-324f-411f-9050-7dab8c1d636d@sirena.org.uk>
References: <20260601084309.845322-1-lijun01@kylinos.cn>
 <7ff4cebc-4873-4135-b58c-29a9ce2d696f@sirena.org.uk>
 <e4c628f8-dac3-4318-bdeb-758ac007a92b@kylinos.cn>
 <40a51e9a-56d3-4859-871a-42842158e976@sirena.org.uk>
 <7c1bb036-3670-4d71-9f0d-a395b4f6823d@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="W6XrLXkKon9SnUif"
Content-Disposition: inline
In-Reply-To: <7c1bb036-3670-4d71-9f0d-a395b4f6823d@kylinos.cn>
X-Cookie: micro:


--W6XrLXkKon9SnUif
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 03, 2026 at 09:07:30AM +0800, lijun wrote:
> Is it handled like this?
> desc =3D dma_desc_save(prtd);
> addr =3D ((u64)desc->saddr_hi << 32) | desc->saddr;
> if (addr < runtime->dma_addr || addr > runtime->dma_addr +
> runtime->dma_bytes) {
> =A0=A0 =A0=A0=A0=A0 dev_warn(dev, "WARNING! dma_addr:0x%x\n", addr);
> =A0=A0 =A0=A0=A0=A0 snd_pcm_stop_xrun(substream);

I think that should do the trick (assuming this isn't something that
occurs all the time but only in error conditions).

--W6XrLXkKon9SnUif
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmof40QACgkQJNaLcl1U
h9Ablwf/Wsrl0bJyOVGD77bgKbhFE/z26ZCK6lvBRFJuqnCnj33JN1RJN4ikGsNL
9aKZuiemlOW209XrplJR8cFSZ2edgCojbGPJEzo36+CrlE+VYEvcvnRPt/gmf+TN
6ovnr+BR514IEDgOeC0ZphMx5z5TliAD72G3BSWRpiahLcd5cE6CXp3W9tLyaAN4
8RzfjtFMn9qX1gq9NQKnEFhwFhGW9quqMdmdK/+pHNF/IUDAYF5l5nu3fqNisASe
ZJgl937xbr5Hsdrd58nqUg9TGiUbI5MohYK50SVsiksQ/VaMaYnRlnsp23TIht7V
D5fRLHWshtDOYm7QOSaAHa+WmVYXHQ==
=/ty4
-----END PGP SIGNATURE-----

--W6XrLXkKon9SnUif--
