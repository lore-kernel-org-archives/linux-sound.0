Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670621E9919;
	Thu, 19 Feb 2026 12:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771504490; cv=none; b=kCqSWnhNLM40qWv1Fnq3p3YKJxBPKrbn4B2sSTmAd/vRm7LGKoskYkXt7Bi9ByFu4czLqoH1UtwTevj2V24eZpNGKVxbPkAJSIfxRkaA/Rxq39PtMu0O96SeOlpMUak6SdJfTd9V5dKT5pbeww8UvgsjuDasOBB4aA9Y7uKe60g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771504490; c=relaxed/simple;
	bh=YAnTtW57ZsdLmBjDX/bZxNdgmLb1OfT40saBIA53b+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KXhaf8EfsdSx6+MPuhdexXsykhfNpmJmszxuMKLFrOfghsqOo2aj+Tamh2bjDPp222jZ1i7ZVRCyxs6xcbLaNoM2Pn060ttOjJyf5/yYjy9XZdLoVsaa9ChVlFcNuT74u1ivshrx+7YahbAxP3ygATLr7UzWGeu3Klst1VYfu/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AFv89y4H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AFv89y4H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 536FBC4CEF7;
	Thu, 19 Feb 2026 12:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771504490;
	bh=YAnTtW57ZsdLmBjDX/bZxNdgmLb1OfT40saBIA53b+8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AFv89y4HUrTsz55/lVePGduxlo1QW2hsrJMrQYPcKfU7w79IurjiiFvXeJqJXfWO+
	 y2HHpNtgrWFDe+peo9jOgmUFwQ9Y8F/0zXj/DIec3H1jPvEWVxJ2SYGJY/Ox+u+KQp
	 V9POIMxoMXbQO8LxFQ3R+2aj47t6Q6ljv3U6o/1Eu8hccju8vy+xKCZ8WhTCldBQf/
	 r6wd/FImfaPo3x82tZ0KOdbA5s+cZlsaV4DvRVs/sBiQ6ZRD3Yy1nBYlaYeq1z40I3
	 X1EkGwClGvrrzDuppebolhSMbvX4hqxsQA8pFJKjYd9Ytxvebavm+XuKH6CZN08gPA
	 l+aWwuaqnr1RA==
Date: Thu, 19 Feb 2026 12:34:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
	linux-kernel@vger.kernel.org,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH] ASoC: rockchip: i2s-tdm: Use param rate if not provided
 by set_sysclk
Message-ID: <00698644-63dd-45b0-b43b-a7bc0fa459b1@sirena.org.uk>
References: <20260218201834.924358-1-detlev.casanova@collabora.com>
 <20260219093718b7d29076@mail.local>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="55fmptbvw0r6A80C"
Content-Disposition: inline
In-Reply-To: <20260219093718b7d29076@mail.local>
X-Cookie: glibido:


--55fmptbvw0r6A80C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 19, 2026 at 10:37:18AM +0100, Alexandre Belloni wrote:
> On 18/02/2026 15:18:34-0500, Detlev Casanova wrote:

> > +		if (!mclk_rate)
> > +			mclk_rate = DEFAULT_MCLK_FS * params_rate(params);
> > +

> Maybe this could be set as the default value of i2s_tdm->mclk_rx_freq
> and i2s_tdm->mclk_tx_freq in rockchip_i2s_tdm_probe instead of relying
> on it being 0 and testing later on?

That makes sense but since this is fixing a regression and I'd like to
get the fix in I'll apply, we can improve things incrementally.

--55fmptbvw0r6A80C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmXA2MACgkQJNaLcl1U
h9Ctsgf8CssLHe47N22ZRkgHcLkjAj5HSKx85p5fThpOXttkqWXR39rMZqpMpus3
kemlx0F0ycZFJ0QfizRsfw9P4irvqgIL9YEGSztV7NONyp7O4rMhU0jUubpjIX+V
bIa7BC22qD1h/3vIgarZAwnfnAzgqVpEjoHECp7/6aHASRzGFiH6CR3i/gUo2MRU
nJMlmqyx0U9xeWeg4VJuUWd4T2W3TbjFdzo9aslqS7pKJvk9pytKVlJBLKIiSeN+
hQf3XJJhEYBzsclLTBbF84cVeiUtaPatdZMLuNYx6m861iI2Ut4bIY2ccfMfPUnH
628Y2IrK8Uy1KwpQfzpMaVOJsXS2Ng==
=IFYo
-----END PGP SIGNATURE-----

--55fmptbvw0r6A80C--
