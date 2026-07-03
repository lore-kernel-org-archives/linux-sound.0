Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B4A270552;
	Fri,  3 Jul 2026 16:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783096104; cv=none; b=bOqXdGNoJmER/LtdupDhNNghfmN9TbWEwaoY0En3EhxmpfxPKpHcxIkaq+wAPHBI5cPiGT5WTr2g+Zfue59P4WUZEbe4oZi8GFdVjyWTN3jdc3KXUfz9Em1mkAG4cUK5q50ex4S/OzZ3R9IYDJTsNsPxOW21TogBlVl05egWnqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783096104; c=relaxed/simple;
	bh=Wsa8e60w8+QOPPxrLWdRcVw01IrklMQWAMErh0FATrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ip5yCMoot1W07tEEOuUDfPcsSN83q/0WKQCEfB1pEqs76dAergjHkUUq5Dm97MmiZZbpUv1efJoSTCtL3icQ2OKUFMjki+jcyOoL77BeWS5aPOjTVc26Vopn4X65gDYjP6Zo1z8DX6zTAY8PPHNlggYYLlpXtdURraJ3jSeNguo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mJlTK/ML; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mJlTK/ML"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D8A41F000E9;
	Fri,  3 Jul 2026 16:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783096103;
	bh=Wsa8e60w8+QOPPxrLWdRcVw01IrklMQWAMErh0FATrY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mJlTK/MLMIQ+rd/1H1ee/scqYwaVUY/0YIXlR2xipz8OC9TCICYWdqLvAGbb7Kx9n
	 OREL+av26ebXWSRiqp/FAGDcVp45q5qSXlg5/0k1K+OuNM3b/q32h0Bh5ahCBWZiqq
	 u41c7JAhY7yLa/WXMKRet7P6GvI4i4zFyaxt5yH+4N4nljdAWJvNqrVxljJpskw+Ys
	 SDq99IrG/SbBkxpxLVBjgogTc38se4jnO7Tsk8QR0H/WK0IXV4CAYodKHhaXdD3Ql3
	 czrM2sF/2xtD3FUfVBJOePCAYxBvM7HhsMsfKJ+z3oa8uhxX3jA0oBYSHIbulJfce5
	 wfFa/7Agy67Sg==
Date: Fri, 3 Jul 2026 17:28:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
	yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
	perex@perex.cz, tiwai@suse.com, Basavaraj.Hiregoudar@amd.com,
	Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
	mario.limonciello@amd.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org
Subject: Re: [PATCH 16/16] ASoC: SOF: amd: add system and runtime PM ops for
 ACP7x
Message-ID: <58e4579d-f87c-48db-9682-fec99c4706af@sirena.org.uk>
References: <20260701095759.1012929-1-Vijendar.Mukunda@amd.com>
 <20260701095759.1012929-17-Vijendar.Mukunda@amd.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xi+K1Jmv9S1qyQZZ"
Content-Disposition: inline
In-Reply-To: <20260701095759.1012929-17-Vijendar.Mukunda@amd.com>
X-Cookie: Another megabytes the dust.


--xi+K1Jmv9S1qyQZZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 01, 2026 at 03:25:17PM +0530, Vijendar Mukunda wrote:
> Add amd_sof_acp7x_suspend() and amd_sof_acp7x_resume() for ACP7.B/7.F
> platforms power management.

The interrupt is requested with IRQF_SHARED so probably worth double
checking if the interrupt handler is safe to run while the suspend and
resume callbacks are running, I see we reset the device during suspend
so there might be some risk of corrupted register reads?

--xi+K1Jmv9S1qyQZZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpH4yAACgkQJNaLcl1U
h9BTeAf/Xfs1KNhSBIwDYu9QP2zsOV1/3DUMCxLaFbq37lr72UfKrdXpClDydIEn
T09HIBD1H5s+Zrth7ZBVYRYjEtm2wzl9cuCQksc0YtQ3XqBbC/MzFWHdEVaI/BVd
3OFTXAdsuzrcGAiOv9i9NiSQNdju/stm0O4Ttxfuq2j3SkiPQ9yjAaaRpOdgQ6x/
fOFttkBKLg5zdQfeIapK91jDfYm171kaLwKEBZ0tkzf81kdLyucygP5p1IeXQEjP
JF+ImSdXb3RM4Ar3wv4a/B3o7TyGmwAPEVWhBpn06Gf48N+bN4WapRlfvA33y859
JjFvPy1LUZhXtHT14b83Aia6PiNS3w==
=3h86
-----END PGP SIGNATURE-----

--xi+K1Jmv9S1qyQZZ--
