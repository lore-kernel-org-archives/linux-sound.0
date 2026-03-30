Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C533D3CF027;
	Mon, 30 Mar 2026 13:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774877769; cv=none; b=WP4SD3j60+Gj0JLAhSsJyfU5SoRZRoya1oTXcI0KFXvLuAzNo+IFK4QhxvbvC4FHPBLDic6lTbKqRn+CEzau2OGwvDwKi6pFwac9cBJXB2V/KK4Pgv5Us9HLpJD5XuZ6H0/skm5bAINjoQya7nzSS42WIds+Vd0bGaIfm/fIg2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774877769; c=relaxed/simple;
	bh=UqKFzszMdeVIqB06BW7OL7AX4igFJl9zdsX61D/TcTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cYLufqNlicfVcckCAnslVn/Mhm2turXFmHZ+UXashw6GMSjkexbshXYIbjWHundbNYdXGy9jcmHssYD5XCkx8rgBOWjZnrx6qTcWc86xKa76AXImtfMF9G3fbbFx7NZ+OhaLN1B2M+W6zS+rF1PXfn2hnybJHgzKogLK/jsXtX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qiwfZ528; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qiwfZ528"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3BCCC4CEF7;
	Mon, 30 Mar 2026 13:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774877769;
	bh=UqKFzszMdeVIqB06BW7OL7AX4igFJl9zdsX61D/TcTw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qiwfZ528bDQSVHkQTVzgeQtRD/B9AdDZy3ZLC1P9LNcfKp+pPb6mkU9vNmswz36Pi
	 xhfebhK6UQwRkksB2V21DrrwYWuToXeXLqLcoSCcgManSHZAyU1MHQkw5RRzkK6Mte
	 ghBimTrvK3uUcKXHodmpMW0Zzrg5mpRtJonLDiwBO6QRMCL004JkQswINGxiC3LnGy
	 2VQhIJmob6dpKJsXz1Dshvg+KBhndIG5puJNrJS1uK++X/TgjoRxzmS1cuS30QejPX
	 GSy91Tq099NU0y7SnQjQCbm8btagJ5ZNhlBPExyjfzAXbUEtad0Pc8CKoVrQTwAyFQ
	 WdkufIyGvLyDw==
Date: Mon, 30 Mar 2026 14:36:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Gilson Marquato =?iso-8859-1?Q?J=FAnior?= <gilsonmandalogo@hotmail.com>
Cc: "Vijendar.Mukunda@amd.com" <Vijendar.Mukunda@amd.com>,
	"venkataprasad.potturu@amd.com" <venkataprasad.potturu@amd.com>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ASoC: amd: yc: Add DMI entry for HP Laptop 15-fc0xxx
Message-ID: <752ed1d8-fe5f-4e6b-a326-53c2a8aeab44@sirena.org.uk>
References: <PH7P223MB0552E3677315AF71746FC36FB355A@PH7P223MB0552.NAMP223.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OPdn9El501G1pBxP"
Content-Disposition: inline
In-Reply-To: <PH7P223MB0552E3677315AF71746FC36FB355A@PH7P223MB0552.NAMP223.PROD.OUTLOOK.COM>
X-Cookie: HUGH BEAUMONT died in 1982!!


--OPdn9El501G1pBxP
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 29, 2026 at 01:31:33AM +0000, Gilson Marquato J=FAnior wrote:
> From 37071560173aadb81a52ae2ba1587b6581e1164c Mon Sep 17 00:00:00 2001
> From: =3D?UTF-8?q?Gilson=3D20Marquato=3D20J=3DC3=3DBAnior?=3D
>  <gilsonmandalogo@hotmail.com>
> Date: Sun, 29 Mar 2026 00:22:03 +0000
> Subject: [PATCH] ASoC: amd: yc: Add DMI entry for HP Laptop 15-fc0xxx
> MIME-Version: 1.0
> Content-Type: text/plain; charset=3DUTF-8
> Content-Transfer-Encoding: 8bit

This looks like something got confused and sent a mailbox or something.
If you're having email trouble you might want to look at the b4 patch
submission interface:

   https://b4.docs.kernel.org/en/latest/contributor/send.html

it lets you generate mails direct from git without having to configure
email.

--OPdn9El501G1pBxP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnKfEQACgkQJNaLcl1U
h9Akggf9EG7zwwaHGpTJZSv+Luaa2mQEdo423ieFtRwTIoWdLkCYVCkyex23hgpD
h6YRcSETgAQdGsw3B2iazSxUH9N+vCaYgPpGOx2X2z7tJbYGzVnv41iK+wgxADiQ
hOhknen8jrRn0IrzYsKwPnep22IB6oKtDimU/Hi92yppCMQHtE3kU/XXzvIW2o8x
TjMuUhaQLrdAq48o1P8FyPf7ylItub64Kyhc+mmrqNXtcx1dFZkUYCoQkyxfYasf
7KbnGIQFKNTX8HB4Yv6k5WEJKUV5hzsDiL0B+fPbHghUb1UN23Pcha8Xdq7HfLpN
ddpcnKluwfpHC818OBQ7k+9JbOu4Fw==
=x5Qv
-----END PGP SIGNATURE-----

--OPdn9El501G1pBxP--
