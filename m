Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44DC3D8919;
	Wed, 11 Mar 2026 15:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773241439; cv=none; b=IVvWDuQAOJjssjXTBelyKecdITB4Tc68AXik0XOuBpqlpgf1Y3HIfIgcYYgSq2TuvA8gxymj5mZLXKyIb8c+b4gZ9cyiaGcO/aMa3o4KNU0CGj39uK8hJaGU5WXo59SyV8ANMb07bQw+GJoUtiAa3Usvl73ICiE9YJGVcCsajcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773241439; c=relaxed/simple;
	bh=ot7gZ5+VbJTv95h8Lnxrf8zCPk5HaeARjvNRZoxHQ+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nQ+QHBWZ+NZW3ZTXd1KxsgULU4ZTAsFfXd4LwA+EfTNAqTrlodA2XGUlGytbk6Ckcoji5belOv6cedO8fNHT4Nubt0eV9PbObpvca87DUR44m4SxaXzWnf2B/gbDjLPyIkppVoeJpWRjmKzBmRZkOPpJegPaRpFxnOSFvqbbQNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SIvgEEPR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SIvgEEPR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49698C4CEF7;
	Wed, 11 Mar 2026 15:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773241439;
	bh=ot7gZ5+VbJTv95h8Lnxrf8zCPk5HaeARjvNRZoxHQ+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SIvgEEPRjp/tDJCwLXhccrrDQoKOXgkrBzg4+wZgd9vyhvJu56dGryTcQe0iLx/8K
	 l+37qKvHcdmDPvmbVjAi+vhQXCGtAcLvX6EXXT8aL9iTZQEE+xp922JPPA4lGXBAiT
	 fHubXe2nIVgYO/tmC2Kl8idAWg5DdmsBIiouV02dVDYcSZGqmuPxyX05WhXOG7K+35
	 I5AhTmK2D6tD0EoWuFxxOadD3UI4/lr2DIPcEuBGiIgURZTxOmSllNZI0SW/swYPnv
	 nmZqrnJWL/kOkwbKFGLo33L+4HLn0vXW6CZT3LJ0g2j/7APV0Su/iM52FPLpQ4bJZ/
	 RMmSCYl08Ci1g==
Date: Wed, 11 Mar 2026 15:03:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH] ASoC: cs35l56: Support clock stop mode 1 if enabled in
 ACPI
Message-ID: <80ba7c33-7949-4940-a72c-582ba749b2e7@sirena.org.uk>
References: <20260311142153.2201761-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r/1F9UakR2aXDYEe"
Content-Disposition: inline
In-Reply-To: <20260311142153.2201761-1-rf@opensource.cirrus.com>
X-Cookie: When all else fails, EAT!!!


--r/1F9UakR2aXDYEe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 11, 2026 at 02:21:53PM +0000, Richard Fitzgerald wrote:

> +	ret = fwnode_property_read_u8(dev_fwnode(cs35l56->base.dev),
> +				      "mipi-sdw-clock-stop-mode1-supported",
> +				      &clock_stop_1);
> +	if (ret == 0)
> +		prop->clk_stop_mode1 = !!clock_stop_1;

Should this be using fwnode_property_read_bool()?

--r/1F9UakR2aXDYEe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmxhFoACgkQJNaLcl1U
h9DjXgf+LONlcrEFOn9811PyBo2NnRQMQSQr62WlOFGLiFKBEAxTSTx1kHrOD0cE
h/IBw8h3hj++LAA19jCzCUUKpgNr2YUdgwMvZALKiwcAoT+qaYCEIIGdMCPcr+OW
7WnUUXmA1DLl6mFhvLI3iCb0iZMv21Fps0GehHmHdlRnGBs1uD3a001xMCYljAdX
PMX1KR1/qweh1+CWPUCtwdYAs8O3xW5eUXhL6ULiEvAXNegdT9SmXECtEmYr+Ah7
eGs7EuAAdgdOM3Oq0xEcf+uAPiOSsqZkJl2kCHs/eG4AoCNtrz3M1hWLZcjHcoyF
x6zEOwMFEMEIUjT9EZpVo39gBS+Daw==
=HZNP
-----END PGP SIGNATURE-----

--r/1F9UakR2aXDYEe--
