Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB733B2FE4;
	Mon, 27 Apr 2026 23:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777332266; cv=none; b=uZxjuxrbNGIcfOMvJI4+x4uPNB6mNf2SaVGBZlMB/EGRwFswC8e59mnaW2lClyqfqnhwvkWRSvosZb2H7H5rdG5AolkhX8kCcaDpWCKfw/QLquaJJpuyVWf+mxe7/pZrSHnBLF5s9Hpi7GfzxNiK92euAXLkki2ubLrd2W4Sk/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777332266; c=relaxed/simple;
	bh=AzCXbr/Tb9Acddx2OgG5jUYx2GC3nWgmBLOq/h09Cno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=exM4l0Tv72x6Yrd9SmzslBOTy3PwkEdH/HG5qqmFrDdbbQ1tTIg0uR71UYf2sl1U17copt3nu5ruQn5NueUQDED+QynHWhl3puvpHdW90K0aXslA2ZJBpXTTdS9oWdS1/LS+M/HUi/9N6PDZpiJErSD0spgpEEsUS0sQxDqha8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NBXoft37; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NBXoft37"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D7EBC19425;
	Mon, 27 Apr 2026 23:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777332266;
	bh=AzCXbr/Tb9Acddx2OgG5jUYx2GC3nWgmBLOq/h09Cno=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NBXoft37wSJBVms8uwiOuviYWSMtPxA8pvszuwBhj6V80Dubrl/lsqSEE+2cHIaCp
	 mPukwcAP5T3lCigW9hEl8ckAPWZX9POxsr0kvQN1zI6tQ9D+ToIhXI9lSNr+jz8QGc
	 hWbuf0kMnAakIFSAS4bS6m+ID9yCgdj5SY5ZccEtXDrDOshdO+taPFpc4usHJMO10y
	 KcJ8xrCa+i65pbui4+gJI7kmLFFfzoNJvO947h+pLz3ZpQ4nZkDej8lVqA04sG2e4n
	 yuUkZT0crRyb8RHCG85rwx17peRlowpmPIh6Ws8jTIG70Yzfihtwy5V+HeFdsogA4J
	 C8xO2zZnipovQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id F1C401AC583E; Tue, 28 Apr 2026 00:24:23 +0100 (BST)
Date: Tue, 28 Apr 2026 08:24:23 +0900
From: Mark Brown <broonie@kernel.org>
To: wangdich9700@163.com
Cc: tiwai@suse.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, wangdicheng <wangdicheng@kylinos.cn>
Subject: Re: [PATCH] ASoC: aw88395: Fix kernel panic caused by invalid GPIO
 error pointer
Message-ID: <ae_wJ2JZFaKQvnJv@sirena.co.uk>
References: <20260427022946.48886-1-wangdich9700@163.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2WgRHS23ZfuilnpJ"
Content-Disposition: inline
In-Reply-To: <20260427022946.48886-1-wangdich9700@163.com>
X-Cookie: Victory uber allies!


--2WgRHS23ZfuilnpJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2026 at 10:29:46AM +0800, wangdich9700@163.com wrote:
> From: wangdicheng <wangdicheng@kylinos.cn>
>=20
> In aw88395_i2c_probe(), if `devm_gpiod_get_optional()` fails, it returns
> an ERR_PTR() error pointer. The current code only prints a message and
> continues execution, leaving `aw88395->reset_gpio` as an invalid pointer.
>=20
> Later, in `aw88395_hw_reset()`, this invalid pointer is passed to
> `gpiod_set_value_cansleep()`, which dereferences it and causes a kernel
> panic.
>=20
> For optional GPIOs, `devm_gpiod_get_optional()` returns NULL if the GPIO
> is not defined in the DT, which is safe. If it returns an ERR_PTR, it
> means a real error occurred (e.g., -EPROBE_DEFER) and the probe must be
> aborted. Fix this by returning the error code when IS_ERR() is true.

This looks OK in so far as it goes but there's other bugs in the driver,
at least printing a dev_err() if the GPIO is missing which doesn't
exactly sound optonal to me.

--2WgRHS23ZfuilnpJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnv8CcACgkQJNaLcl1U
h9Av+Qf8Db6dX0GqrZq1ZJ7ikuEosbNWG0ScOUjh780SLsDFZky+qPG4jlJMWXJn
dASIj0y6kf12yUFd7urv8KgAJen/EzWlcwi/IoXImH8kUZuLa42LxhnXbsqHj4fJ
vmBDRbTCwVfwlxAHfw7Q2C21OJOG9iYxKhCHEQKlsTwP7FEhU+EFTo7uHe1E9KlJ
+/l25iWEfCGqoNgRBStXGmqaPC1XdMnUGjTIqTkzVnsZ/78/d4V4joa4JB6FZX2V
eGSyjQk/OX26scDhFROKgoS0CSlsifw/n0Dgsol1Hi+HtvpXJxvtYT/DwCAt39mC
AeJeY08TcDNcvcDo1dyI0eAbnhvCrg==
=0+5c
-----END PGP SIGNATURE-----

--2WgRHS23ZfuilnpJ--
