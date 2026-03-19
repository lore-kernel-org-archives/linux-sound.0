Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BCE1C549F;
	Thu, 19 Mar 2026 12:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773922890; cv=none; b=gA2p+47nt+Qosc0lD+YO1fvGMApt+tQUdL0KDlnNSm7lHnfZERbS9aLZHXtYNeJ+EU9eTJmEy9wtnVDS4gpH77jG7kIVxdg4Qav3XBg8r1kdzO46CgIsRVD0JLLKwDxttTOUccVkXE9Wwc4tQqxg+2M5fj0YpL7qgoi8hvSE4JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773922890; c=relaxed/simple;
	bh=jzzUN1wB2138g870Xzov6H/rzkxcPNsM6cYROCtwUig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KadF3MQGXNKJQr2cIzvbO7t9uIe8OExa9YzWj90Q/o9K2wDeVXC8Qqk+qNl9K571PaDswqMsVO5WDPIPxDNm5LCjX20b5R1BaxRjOupWmFEZBFN84uBdYKsPcUIChPgAJW+J394QDXXuJtylFGz3z743IaZIYodMy+Q+2pBR+ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N4qL0hqg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N4qL0hqg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AAE9C19424;
	Thu, 19 Mar 2026 12:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773922890;
	bh=jzzUN1wB2138g870Xzov6H/rzkxcPNsM6cYROCtwUig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N4qL0hqgakYu2iMykEfsGFRcPpOJrl4k3I7vYVBaJ12OgYUP4l06RWcj/TaRcFYcp
	 iGeAJeAfPMMhYuSDAm/yw5YMmNDQ01jsJueM1i7NYq6I0gIW1ug3N68YUWnIHkVp45
	 qCH/zPE0nTVjxw7ymZON+A7HiqCCMzHjqA1ZHO7ogEL5vl+Ei3UtJofZzzvs5KkEA8
	 YE8YhaXuOvDKnlvNL6K1ihAiEM27BhCWsUoGgJcAHerC0LNMChnEEkC41XvQqLn4Ym
	 P6kQ4v0A7X2huI05PdK8dvqsOz0q4HLvO7Z0Q7Bfd/PmXLemd4cg6G8xOTQdcQyY26
	 G1tiz66sjOUfQ==
Date: Thu, 19 Mar 2026 12:21:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Wenyuan Li <2063309626@qq.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>, gszhai@bjtu.edu.cn,
	25125332@bjtu.edu.cn, 25125283@bjtu.edu.cn, 23120469@bjtu.edu.cn,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: uda1380: add error handling for I2C operations in
 write function In uda1380_write(), multiple I2C operations are performed
 without proper error handling: 1. The return value of the second
 i2c_master_send() (sending register    address) is not checked 2. The return
 value of i2c_master_recv() (reading back data) is not    checked 3. Error
 logging uses pr_debug() which may not capture critical failures
Message-ID: <168e131e-cd22-48fd-bd3b-8bca4a04d1a9@sirena.org.uk>
References: <tencent_C6FA39C682B462AE88A77B1D916115E8C205@qq.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="K9w/mGjmbtI2Bz9X"
Content-Disposition: inline
In-Reply-To: <tencent_C6FA39C682B462AE88A77B1D916115E8C205@qq.com>
X-Cookie: Given my druthers, I'd druther not.


--K9w/mGjmbtI2Bz9X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2026 at 02:26:33PM +0800, Wenyuan Li wrote:
> If any of these I2C operations fail, the driver may continue execution
> with invalid data, leading to incorrect device state or silent failures.
>=20
> Fix this by:
> - Adding proper return value checks for all I2C operations
> - Converting pr_debug() to dev_err() with %pe format for human-readable
>   error codes
> - Moving variable declaration to function beginning (C90 style)
> - Providing detailed error messages including register address and
>   expected values

This is multiple different changes, as covered in submitting-patches.rst
it should really be a patch series with one change per patch.

> +	ret =3D i2c_master_send(uda1380->i2c, data, 3);
> +	if (ret !=3D 3) {
> +		dev_err(component->dev, "write failed: %pe\n", ERR_PTR(ret));
> +		return ret < 0 ? ret : -EIO;
> +	}

i2c_master_send() doesn't return a pointer, it returns an errno or the
transfer length. =20

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.

--K9w/mGjmbtI2Bz9X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm76kQACgkQJNaLcl1U
h9AFywf7B8DJ6uA5r1xggbv6MRFt5QGMu0AN4DXJ9ct8V3PC244Jcfqonn3NeUgX
8LlSeg4tfhwZk3vJ8qshqbQRq1lgQMqLxfKWWOjDKfis36ej2uQtO7TYf7e1B4eQ
o9NBfNOVpE9e3HImQymzu65TqoYBnA1xc6ZMxK8g/NXOOcHQtsn0H4XHQL3VpKD7
qR4BpmIyq4jFQwQNttVBJxmuaE0HFFJ9RZ/am2hTL9RQF7WMLV7Ed+G60YnM5O5w
0R2+J2sr0EXGcSP+00Jwt5RFd5Y82zIw+mJG+mOGs3HpMhU6Ao7S6Vt79etT/nab
rNmjU5AHB1GGE84AlAJdTyLUFopmBQ==
=Fz47
-----END PGP SIGNATURE-----

--K9w/mGjmbtI2Bz9X--
