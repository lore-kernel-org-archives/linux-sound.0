Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394EB3D1CA0
	for <linux-sound@vger.kernel.org>; Wed, 22 Apr 2026 12:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776861093; cv=none; b=aWKFQDF0un+bFi+ZPyCOWASOWvDdwokg2e3oiWoh68UJhLc+443VD2J54IbVrDI1Nz8uSZbRiiA8WyOJmnPzM2goVYXPlkDiarKnFWJnm7CXCoonB5EJAIPFxsEuw8ueAyhA3DbuKWq+W2l6zOtH3nqzwJcrmgb43xifQJ9c7ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776861093; c=relaxed/simple;
	bh=VkY6T2Q8+JsleKi22cmp7mHvh2+IFd5U1MOQPeCTIO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d9Cs3hDESsALNPd932HkdVALYmN6+IcSpz2zGikEp0nvYmqX/DD6YNtEV3iUlouSV7G3v++3N06Oa9Gq84/oZpcKlBtsVIiUEMVjLEt91wubyWuobrEUlH5UV1FuccpXZ4sWh8mXalIXiVZ5bFc02rsC3eR1r2jtigSJCwnGcps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kIe0mjdX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kIe0mjdX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51CB3C19425;
	Wed, 22 Apr 2026 12:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776861092;
	bh=VkY6T2Q8+JsleKi22cmp7mHvh2+IFd5U1MOQPeCTIO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kIe0mjdXfOsWj5sEVJCbPf6Ztixa4lroOq8e6fq4I3pVmiAZAV1fHDzP3feAmS7/r
	 PWL3ICKREiCXTm39YJt50xHbNiFQF2So2WuIUlS9+aEaJf5ssaMWZ1jHCby3QejGfp
	 rqq73Qh+snJ2VP1QrIycGwg96qdwunVdzb/MuaxVpd6aDSx5xp6BJbAD6tvlD0blSl
	 5AkMA+TtNMRKeXVIXXGuWZl/IkJRyeZKsDjEp2YbjMXWmgJ01ljRgQmKdZVq/MNVa2
	 J0ugCR14nwUszffb/9pR3mS10AXbdhafG16pP90gmuU6X3aX2P1UbBS3zufh29dtMk
	 oOKrAXcEMKBWg==
Date: Wed, 22 Apr 2026 13:31:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: Re: [RFC][PATCH 1/2] ASoC: ti: ams-delta: Stop (ab)using
 card->pop_time
Message-ID: <b7fb5a68-89df-46a9-8f78-e57c6ab093d3@sirena.org.uk>
References: <87ik9jk8kd.wl-kuninori.morimoto.gx@renesas.com>
 <87h5p3k8jp.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rPhO0Q038XohYggm"
Content-Disposition: inline
In-Reply-To: <87h5p3k8jp.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: I'm definitely not in Omaha!


--rPhO0Q038XohYggm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2026 at 02:55:54AM +0000, Kuninori Morimoto wrote:

> @@ -280,14 +280,14 @@ static int cx81801_open(struct tty_struct *tty)
>  {
>  	int ret;
> =20
> -	if (!cx20442_codec)
> +	if (!cx20442_codec.component)
>  		return -ENODEV;
> =20
>  	/*
>  	 * Pass the codec structure pointer for use by other ldisc callbacks,
>  	 * both the card and the codec specific parts.
>  	 */
> -	tty->disc_data =3D cx20442_codec;
> +	tty->disc_data =3D &cx20442_codec;
> =20
>  	ret =3D v253_ops.open(tty);
> =20

We need an update in _close() as well, that's getting the component from
disc_data.

--rPhO0Q038XohYggm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnov58ACgkQJNaLcl1U
h9Axpwf/V6gnx4HmR80mNu2/ZPSKTXB2JJxKQmyMlKW18CkWfZXCYQFugxyhjhJO
vBKqbQrMVW33zLLa3iPKVWhNwOcEZ4ieQkRaSr8cbDlDOt3Ark7HJoZhcK9DIb9h
WghAhbvn0QAhspKChN4HDK77Vt9x/S8uvhAlZOfwnxJW0SstjhScMQ3AcitHd0AP
NZZaj2G7N5Nz9B2M17mjrFN7Q0sb7ZWUkeFXuCsMTiFVIlaLPQRc9lzXJ5rMaggR
TdxddQVrRWEkkWYnPfCaugDi5JmaFd4SqgJ2lG1gEuIJSbCuTVdX6ptmzW20/k51
XrQ5LWpESjoi86+7zHH46PPpZUFCFQ==
=/LtK
-----END PGP SIGNATURE-----

--rPhO0Q038XohYggm--
