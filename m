Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795461181;
	b=aqoxT8WsgWvTHSJeGe9uPtTWWuwQXUkvhd99nr0kikBfEVchC9J3rVw/4DJI1X5JtXnP
	 43hI5fPo8siH5LZ/c6aVcVPoZcR/gY77eZ/yoG9E47S3FnAJ2435xvyQAgJdfVyZo4Az3
	 KbTr5nBU+/ucepRpgiOhA0xZrqPbaeWTg3vfailomzYp6JkfRW+Mr3GVuAju6obkkMDRH
	 EfCgl1kmIdcvWy5GlnZQO/klONjwu9TNUyVA8hGhjwUo9jc90KxxgtA8zLNuDMh3K5tUX
	 7SuxMRwvkV7hqQTISVzfATT75E6RVZTEjNcR42y+aJyhzuy/lkK5FijeeZZxnQS/IuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795461181;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 Mail-Followup-To:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Cookie;
	bh=2CuPgqEt5n69wuWPQsBYtZpvMhggemFtcDu6oTGw3OA=;
	b=XDeGv5w3QK9Sxgk/73zCrDzixErqO47rB8gJBJ5eskuyGYhJfJcgY8vI3NbhlX+3/BvQ
	 hj3zu3FQ+wOmNqA45LH5ywOovTIuooqN8LzVCthUHM+Rr2Ryp6BPtE8T8BUdWShxyzlHU
	 e3SdstEtTY0fBZPVirH6gCWp+UIVrcZp6PlsBh6D6ektvRRIzKk4LR9OnCr9quNUkST6r
	 2K3Uiw0D8OMMyD3NXqad+bmlmYaLqhydOjTRhhkOEupzb4ECE+vE5c4ao2S9MfeG+I9j6
	 0U5Bxpy5LBiQueUE0aEyupgHgC5wVSdRrUbLF10BqUcNyO3G9aPViN7EWS84nDGlKtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dd+d2aDE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96923606A31F
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 19:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dd+d2aDE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E06811F000C6;
	Mon, 23 Nov 2026 19:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795461180;
	bh=2CuPgqEt5n69wuWPQsBYtZpvMhggemFtcDu6oTGw3OA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dd+d2aDEvwh1NPbltbyHz0a0Ge57uKFF+wNV1mCShgd2d+wXbjDQ0E/UTk8sBgv8S
	 Cjp6R2KqpmKsjldh3FoFfEIbIRTx/s3BSgD4TXrTFbdlGxCbxA+FQT7DA5x1nhVLld
	 /o7JF/yPkZT57XmLuGR439ndZ2epbCxpR5XpALyKsYbLhcj1kp2YTRl1TR3OD+u+Ji
	 1H8Uxhi31u54mBhyfft1vWypN6ru01XpmoZDRkdQg3EX30VA3xw9/GAs3GeBdc4fKd
	 tDbKf8JtSvAb6g1x1kMxwyvP2yVHZc4rzLfsyEW35j/R23oYXEGPyzQMAipvDn1hTx
	 dyxZro+XaxfWw==
Date: Mon, 23 Nov 2026 19:12:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
Subject: Re: [PATCH v2 00/27] ASoC: add new Component functions
Message-ID: <00d26919-05fd-47bf-8470-46b05b7e06fc@sirena.org.uk>
Mail-Followup-To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
References: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gDzzpTx+Ipra3DiL"
Content-Disposition: inline
In-Reply-To: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Truth is free, but information costs.


--gDzzpTx+Ipra3DiL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 12:30:02AM +0000, Kuninori Morimoto wrote:
>=20
> Hi Mark
>=20
> This is v2 patch-set
>=20
> I'm now posting ASoC Capsuling patches.
> Current status, and this patch-set postion is below.
> This patch-set moves Card related functions to soc-card.c

This needs a rebase against current code.

--gDzzpTx+Ipra3DiL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsEkDgACgkQJNaLcl1U
h9CW2wf8CZdzwS/zp0yMqovNeD+6fgA+vNHJ16/85z3s/lbQEhNzVDfDRo89eeMW
v5Y0fxmdVrlWwyTzJgUD2fa2GEyxzHCLJ4k0c08APZe7iUPcAGodPy/WoojO1NHE
SbdyKmpbBtka9jmnb7nZN6P6sW7eDjpYyA7ke4jYQuGvqdLgPUVvnUFptD2N+b4/
0iIsF1XXxZ9+maF5tbKlrVpAJ2XmxilMxE71JpqpQO7lGCuh/zP/JL9o6iOpcRu+
jfvDJJO0cC5N9Tk+5E/5tlvkcRCZo1o/Z6ryRLtowoK/Uu5oJ/pswlUvcz9uO+Hu
HkVWxXW6X7Ccg9X9FCDXagYFvWGtXw==
=h2+G
-----END PGP SIGNATURE-----

--gDzzpTx+Ipra3DiL--
