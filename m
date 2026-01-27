Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA78134CFD0;
	Tue, 27 Jan 2026 12:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769518240; cv=none; b=kfbf0LNcCFvMdWDj8ZRvoOwQCkG9SyMqzQQuYcUPHV/5s+++RwMnenxe5mqyglu63e0rvrdkQL1YLyJ5adTVHGSBy6/j4Lg5ZBgz4pqtJRVdvji7Wo9xiY8UnnQajCCdYJdrIM/qKL0b9d9X/WF1+eYtXpkhGu/3CwcDykn0Dzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769518240; c=relaxed/simple;
	bh=yR0xQFj1SPiElELNM2aUlYLKzZ+HjyHsWuNBAkW9wEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pSuYN//91vmWOWmU+69UbfUGllx1x/eQFLxhF0D7Q9vLSZL17JuVSXAH40r0thqOEpY83r0IAD/tr778YpaltN6U9Ij1wXL+YlRIj8kqNIzpZ9ARqCCV7dVp3y0B4MUvdrUb4du6sok6AylKWDEmmqT7ALeyfaiGcU5wQHBytTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IJDahrVS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IJDahrVS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17019C116C6;
	Tue, 27 Jan 2026 12:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769518240;
	bh=yR0xQFj1SPiElELNM2aUlYLKzZ+HjyHsWuNBAkW9wEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IJDahrVSeY0j+JNbmUcys/dq1kvYkOjn5dmXcCY3U+ip7+zvhhQexofT1/vICTkF8
	 RbhBc/WRI6igOGrN6psH3uRkq79zmx6QW4mP2JWNliPu5BgKeYdQhZD3UJpQMp/CIH
	 u9i8YcwNC5774//uKqRYmbc/SRQKYzQeRvORsz2Qj4XBEfbW73zlZxcTnk3tJww8Bo
	 msF/q08p6GQTQHbH6RxOuQ+MUvPKk5H/ouTMFCiFxYCiKTX3nABRa3jV6kREhgv3e8
	 ucerZWmE2qL3Bb4Y/QialspvoC7ZWV6v4O2Vo88tSNb6Ff5hIactQOwVkYvWIr5bqi
	 ECe2T6bCeoaCA==
Date: Tue, 27 Jan 2026 12:50:34 +0000
From: Mark Brown <broonie@kernel.org>
To: "Anton D. Stavinskii" <stavinsky@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 0/6] ASoC: sophgo: add CV1800 I2S controllers support
Message-ID: <50b16e42-2621-46d9-bb3f-5b4ea20aaaa5@sirena.org.uk>
References: <20260120-cv1800b-i2s-driver-v4-0-6ef787dc6426@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j5gRACT764pWXPnU"
Content-Disposition: inline
In-Reply-To: <20260120-cv1800b-i2s-driver-v4-0-6ef787dc6426@gmail.com>
X-Cookie: I brake for chezlogs!


--j5gRACT764pWXPnU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 20, 2026 at 11:06:02PM +0400, Anton D. Stavinskii wrote:
> This patch series adds basic audio support for Sophgo CV1800B,
> as used on boards such as the Milk-V Duo.
> The series introduces the I2S controller driver,
> the DAC and ADC codec drivers, corresponding DT bindings,
> and DTS updates to wire the components together.

I'm going to apply these, but there's a couple of small issues - please
send incremental patches fixing these.

--j5gRACT764pWXPnU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml4tJkACgkQJNaLcl1U
h9C15gf+LZ2vbf2V2mzyVpx5/XVKRAXSeNrkBB4ee2C+1MBVFvWzgMa54NBdBqHQ
8rE7a4b2rJRF7x09H+YuUnzZasLwzzWVXG6MwsUqJq4avihbona0li959wEXDT7+
8eMzdUwcKRpm8YkFBZIeBe6MEiCQz+OuFRuDR9kCnwlIx3D0R+sdDjUDpFgwglTW
kNJb9syIqewNcmaYN73SMFtTNTr+ujXd5QjE1vHUM/wnILWk6sN2NI5XXyr64kQ+
TlUQ9lTyeeKXsauW/RrhJQDQsNgLpifHqYMUWCVzLJ1/Tujwaut6rSFXxkXloUUK
09CzNq6iyeXviiBHoz2vQvqQVQxNRg==
=JDcg
-----END PGP SIGNATURE-----

--j5gRACT764pWXPnU--
