Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAE62E091B;
	Mon, 30 Mar 2026 14:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774881547; cv=none; b=e0CIDJ8Or4IYG8tYcAgww1BIkj0HK+RjPC0vlOIllLjvWio0TX1wiOf2Vw0ynBz65EmAtu6jKkIZJ2/gSlvxt4bOUCVX/YilG1Z+oNeAAePFxaiOULlNOB0oy43pKZryWX6sQ+KsoTeUz43wVfQoXGVWmZHMcGBTSYUXQTI+qp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774881547; c=relaxed/simple;
	bh=zuNqdI63WU+uP39XEYJ5Wz1sL+kNweFLUbuSzdbd60U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mxC5JBAEttyt6J9oaFbUDhQ0IBRC/Zd2TjAIL2PQGbG+/Lhks85NoxzpCcR+rNhi7LCUBpzRfyTa1dnbDuHsML298ir2o4NZndGhhLw5Xp1P8SHGyk1+OlA0oh0Alxi6ZHEF+kRHjHn+nYEZ9KIJSn/NI0xnKbXH/5c+u2KYXxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JMAQ5L4b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JMAQ5L4b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28921C4CEF7;
	Mon, 30 Mar 2026 14:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774881546;
	bh=zuNqdI63WU+uP39XEYJ5Wz1sL+kNweFLUbuSzdbd60U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JMAQ5L4bFtajrDYViOk5IkNZNAzcyH4ohFlQYLsCUaIvoXUA68pu8r/rXUeoA6Hez
	 uIAEKPGV9ry3Ce5U1tuex6YQnmA9TNxFmQHAkKxuAySCyWIUJYQRz4mUDjO4zAVL+h
	 7IEB2GikTaAq+gXGxVc2GKm6hHxaoxsHwp8v8yVeT9tRDKVqhAXtBaZSFiDZR9le3y
	 Lepqazc0otZNxqwIT37E9W3EfT9zddR9jXY3tdP7uMlKHktvZntTI9wIzTINwuViJE
	 WPIcoSLGbZZeh7yr8Mn1ifgY7FchIWJugmrbV0ztTAMit8T07tVM7SI+/6p7iZTgxE
	 n9YAsHm4Q/uaQ==
Date: Mon, 30 Mar 2026 15:39:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Syed Saba Kareem <syed.sabakareem@amd.com>, alsa-devel@alsa-project.org,
	Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
	Sunil-kumar.Dommati@amd.com,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Kees Cook <kees@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	"open list:AMD ASoC DRIVERS" <linux-sound@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ASoC: amd: ps: fix the pcm device numbering for acp pdm
 dmic
Message-ID: <3cd20e58-e204-422b-96bd-465c9e3855a9@sirena.org.uk>
References: <20260330094642.3088923-1-syed.sabakareem@amd.com>
 <510b78db-d04d-4283-9ad7-42c0420e1db3@amd.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/UCji7vj6W5B1FOL"
Content-Disposition: inline
In-Reply-To: <510b78db-d04d-4283-9ad7-42c0420e1db3@amd.com>
X-Cookie: HUGH BEAUMONT died in 1982!!


--/UCji7vj6W5B1FOL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 30, 2026 at 09:15:53AM -0500, Mario Limonciello wrote:
> On 3/30/26 04:46, Syed Saba Kareem wrote:

> > Fixed PCM device numbering is required for acp pdm dmic pcm device
> > to have a common UCM changes.
> > Set the 'use_dai_pcm_id' flag true in acp pdm dma driver for acp 6.3
> > platform. To fix the pcm device numbering based on dai_link->id.

> > Signed-off-by: Syed Saba Kareem <syed.sabakareem@amd.com>

> I suspect we want a stable tag on this too.  Maybe Mark can add when
> committing.

It also doesn't have a Fixes:, and also doesn't apply to for-7.0 so if
you want it for stable I'd suggest rebasing and adding an appropriate
Fixes: tag.

--/UCji7vj6W5B1FOL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnKiwQACgkQJNaLcl1U
h9DT7Af+M/L2Mbhlr5MO2ncCnG/FuDSl27c8q+/v2RNj0g7zbQ2rwLJ6AtHSnefY
fuRLNNLuWNLohybpHR76KNsNhbtDl/TOo5BxkHGYeCI66zvs2UG2WUJS6Pf/cKpH
KQbSEljDglTdfpzTGXZIO6NFjhx8Uvd+b4ESuqpF4xJRBoIknEqC4/sLnuFPqqMb
0CFFg2A0IQCu0ogObEtOozsseHp2CgLB9BCBv7C9/NCGFxkuivI2eK3IWYnfOZcr
2tQ/9e5l7FQ1fmnBUrNuIG/JcS3dstH6vaIZYJ1HHNYZxklwz0GbE6xY+4G5p3/F
OGopQ4YYk/wjFtygG7uJkKmXv7ikoQ==
=YlcV
-----END PGP SIGNATURE-----

--/UCji7vj6W5B1FOL--
