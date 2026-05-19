Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B7B3E0C44;
	Tue, 19 May 2026 08:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779179586; cv=none; b=R68lhdvkC4TSZG3gCDIe+W5PLyY6yY9fnG7UYucmE5QJV5DBBqlk7/82n4WTCfmGAG5oOtPNxphfDH1SBpxD7FceIoGPh801ZD3eNUj1HnmDQO7RaLiRewW8DgkwfqbZeoMXsbtxCvTtMkVFzd2a/i0em+U8hBFyxUPQzMRryNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779179586; c=relaxed/simple;
	bh=6TGMMTE0u83WGBGyaqlbzGcDa5UQfun90gQgRnrOvk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jd/qejjykX6Gv52SZkPZhBdSdxxitnQqhSQAHlAmjsV4zyQWLpqLdz1kjpJ2zvI8xZk711pFCLm/nQ9T+5jEFd78I+Mw90N9B3/GtYudZ4SjWLF3GpvkGMWQ0yO8mi9lxbw/Soht1Idl3TkRxeKh5WZoYzleLftKgabAp7LSyAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UpkB90Y3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UpkB90Y3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4B2BC2BCB3;
	Tue, 19 May 2026 08:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779179585;
	bh=6TGMMTE0u83WGBGyaqlbzGcDa5UQfun90gQgRnrOvk8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UpkB90Y3Oz6tTQ+vY8ZH4rWEgyk2v7mcacbSqK/O10gGaK8t5QuPKcqL0ogFiOHER
	 F5BjUw/ZEFq9ECeSspnZM77VZKWP0zJ5BakuXhS8PvcczTDxxiGvEQ/LDMhiyESwrV
	 gn0Ji5Xz3xjUdZI8DzvD0KZ6/fZB6iMg/yh0co2WfgPStjDT1CSiIwJtZq3P6UDKVB
	 5kmJ+JYvU70no82Pn282yrqYwYEgaW1QgBCKhQCyHVxezo3qRRpvsY93T19h6d5Jli
	 nwqLxZtcmD5V7pyKfFFvmvbozH8RB3xgFqIZpzhi+6ob4NRnmtnTB2ZNgEOaVB2LLL
	 t/w0VUH0j1Ygw==
Date: Tue, 19 May 2026 09:33:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] ASoC: mediatek: mt2701: fix snprintf bounds
Message-ID: <61fa661f-0281-4b58-8042-f3f60cdc3407@sirena.org.uk>
References: <20260519010440.629290-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bRbs8QHSgrH1Itrk"
Content-Disposition: inline
In-Reply-To: <20260519010440.629290-1-rosenp@gmail.com>
X-Cookie: Huh?


--bRbs8QHSgrH1Itrk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 18, 2026 at 06:04:40PM -0700, Rosen Penev wrote:
> For whatever reason, GCC is unable to figure out that i2s_num is a
> single digit number, with MT2701_BASE_CLK_NUM being the maximum value it
> represents. Add a min() call to help it out and fix W=1 errors regarding
> snprintf bounds.

> +	i2s_num = min(MT2701_BASE_CLK_NUM, afe_priv->soc->i2s_num);
>  	/* Get I2S related clocks */
> -	for (i = 0; i < afe_priv->soc->i2s_num; i++) {
> +	for (i = 0; i < i2s_num; i++) {

This makes the code rather obscure and will start silently failing if we
ever get more than 9 clocks, we should at least put a build time assert
or a warn on in there.

--bRbs8QHSgrH1Itrk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoMIDwACgkQJNaLcl1U
h9ApDQf8CKbgltfBHlqjDjL8rukX2pWSsSamJye6jR/FaVEZcCEq1DGkd+gBUaTQ
Wmeyqpn6s+OawHMTL1yuTrXcAApnXmWVeKrOhW7h7TnfHnJvyTEJZ69lkQXrk/yf
V+DF2QZNJzwzp87cluUEvhDUgQFhLkZV8bxdmYIfPRPPlAsAar3brLsVNx5Vlp5/
sEGYJ29q1Na6/DrqWuUv3JGMfNBwp73VSVC9SzQ4IZbaCqngsdUEdIMCxK0RWkVy
YhXFQqA6/+tDc4L0WoKxsmgGsumRn3GfYlyTG9W4kpakrCklVTOgzoXXobAbhwDP
fF/+U/Qc2VKq414MKCdyoAA9Fhoorg==
=GZfX
-----END PGP SIGNATURE-----

--bRbs8QHSgrH1Itrk--
