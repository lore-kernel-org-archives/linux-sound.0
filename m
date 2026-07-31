Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDCB2E7BD3
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 20:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785529931; cv=none; b=qr6DMvynyl5uGwjpRJELVmseA1GqI+X6/ScYIb2v7bAFrUv0bnt/kWNLYQJ+yLUeMN+q6/MLUTa0UYi0Ve/bmIQ+el+zSnJT8gd0oOpljOdVV6CZvEeeTaejg8hq+K/A4DqA5oYZBD/D0oz77rQRxX0UxuPpjZHJnEn0u0Zqbrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785529931; c=relaxed/simple;
	bh=g4WBim8Xvjyj5yLxLOn0cHOKyxc3FnnPD9rooOpBF5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SQcVclzenXt5wnzJD9+hytZl+pWB8qR8qgxuu5Ca9nyDYTXczkXbToQA6xP4UWKcqURlfFU3JeA88T0xw7P7YQ/kb+912hOEs482Frdq0LxUae9n7L5GL5j2NEHUQ9UWtJV6XXVx5+tvczlaHOD+/C+gwL1pbEa5r3GpqJBhuR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ei0/MF08; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ei0/MF08"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0B6D1F00AC4;
	Fri, 31 Jul 2026 20:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785529930;
	bh=9/whu6H9Z/BilNgbOHATl3kyOICSvpsn0fgMNRCj7Aw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ei0/MF08QPUG53ll9BHI34v5xqwXtBmLZWhIGE8J9Qxn3EF3pjbG6mD2l202GpcOU
	 A6alvn2CorIe4BEii3SoRyFBAUyoJFNpYJXzRuAsP83K2ZX7aYiJPrD5tUpgzxYtWB
	 QC3ru0yyRRXV3QW782GbBdg6/uVqfjG3ziMcUuLnOxJWzZgmPg++ZD2u8guNY4vHQm
	 /LSu0mps85dqknphALm9NwuZd6DGuvntZSpwXIfEWaDIqw+ua9BzE/xFbwmoenc5Qy
	 speIj3+WlMG0qU2354GuCD0X6Yg0iW/Cen7uHYdhqTwHSQL6l0A7wL4C/s4zD/w35R
	 e9MVIJmDTA83g==
Date: Fri, 31 Jul 2026 21:32:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 2/4] ASoC: renesas: enable COMPILE_TEST for PCM SH7760
Message-ID: <b7dbea39-5137-4d97-96dd-2d4e08423dd0@sirena.org.uk>
References: <87jyqbswp0.wl-kuninori.morimoto.gx@renesas.com>
 <87h5lfswog.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zKXpZdxHdI+l7m0O"
Content-Disposition: inline
In-Reply-To: <87h5lfswog.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: No shirt, no shoes, no service.


--zKXpZdxHdI+l7m0O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2026 at 02:46:39AM +0000, Kuninori Morimoto wrote:
> PCM SH7760 is not compiled with COMPILE_TEST, and there is no defconfig
> which selects it. So it is easy to be overlooked for compile test and/or
> ASoC updating.
>=20
> Let's enable COMPILE_TEST when it was for SuperH / SH-Mobile

>  config SND_SOC_PCM_SH7760
>  	tristate "SoC Audio support for Renesas SH7760"
> -	depends on CPU_SUBTYPE_SH7760 && SH_DMABRG
> +	depends on SUPERH || ARCH_RENESAS
> +	depends on (CPU_SUBTYPE_SH7760 && SH_DMABRG) || COMPILE_TEST
>  	help
>  	  Enable this option for SH7760 AC97/I2S audio support.

The DMA driver includes asm/dmabrg.h which only seems to exist on SH?

--zKXpZdxHdI+l7m0O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmptBkYACgkQJNaLcl1U
h9AqKAf/TedgeoV89pZdJDJ46+931WaI/KB96/h/kJcwNuI+GHRX9xlY7ltR/mj/
Mb7eTm6YVdq5514i06JWtx2RKJzMBr4CDlFTBeu8LwF4+hsBS9uSH4RTk3FG9jcY
hsjayK5ava7BR0Xd6kSH1HIaIjsT54LOxA1TSIg2GUPlgZBkg5YnKTJghiURBbRH
VkW9eBMm5lfkSwZYekv0rnEq8p6ZIQF4RU0zPNR9yhLmqJ6BPoECFk9FjR2OE+tq
zYzwdoZBvecweKieCexT+eHoXbqlSgalgszqJN874l9MSrE4QwDQlT785n1na1mE
S3WcfLnt3w8gvFfvPd+mDu1BHaLnEg==
=fsSy
-----END PGP SIGNATURE-----

--zKXpZdxHdI+l7m0O--
