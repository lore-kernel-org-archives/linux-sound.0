Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541C150097B
	for <linux-sound@vger.kernel.org>; Tue, 13 Jan 2026 17:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768324437; cv=none; b=PtwS8zgMrRgNM1EqmaNabuNJbew39RMvAR16s0WfHyH1cgj73NEcotijf2c6OjzE5Cmd8kJfF3DGvCkkrVdtOWPdJgYFjMGgqr18ga3gF02jhmPBrlPMS/3zk50MGZ8AArh0qVOf5Czu1aKidCtFKp+PRfz595NLCuOkAWHTH7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768324437; c=relaxed/simple;
	bh=ntpiODfbJw0Z5Al1UYe3ju3yn9LsFmeqp7IPqjCExtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XbebP5+eUH0w5pHdfFbZkSr1FXvPpS763zlatuZm6AK3SHY4Mxt5pkPERUpBWvNV2H+pxgYSoWu927oooWSBS1KknMpSLyZmD6W7CJralH1ur7U2CVjr/rpJuIlhucE5tnRnG35q41mI5ohUmBrYrmbI9iGL9WIo9nfUXUbmTys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PeSjmDTW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PeSjmDTW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6AB2C116C6;
	Tue, 13 Jan 2026 17:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768324436;
	bh=ntpiODfbJw0Z5Al1UYe3ju3yn9LsFmeqp7IPqjCExtQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PeSjmDTWCCTaNpuUqTlAMYRhnC0JGIrIODjfCXy/fQmN2vqVzEOWJPBR68Okg9dhh
	 qUsK9/GS05VBM+ZMUQHGITNeH1oFeCKCbe45keXHTHb/lqRauR7WRjYUgZXOyX2G54
	 QGcsWm5LFDmSqJo/8Sqz7bBRjX+faHa80xjo3/21xrM/2EtaTPsyVmCXuyrKF5D5Oh
	 QxTmJn0sbmnVnpEU1LwzucJ4c/hLgcKpvj1fKudl+QmNZYEN2ApWikjPUXoAv4GAPp
	 frHc72s2tkPDm1otVKFx0Uox8qAA6HkWu3wFWG1sKbk/3awiXp8i1rjb1xEUKcWynH
	 VPsnP621I23Vw==
Date: Tue, 13 Jan 2026 17:13:53 +0000
From: Mark Brown <broonie@kernel.org>
To: Cole Leavitt <cole@unwrap.rs>
Cc: linux-sound@vger.kernel.org, ckeepax@opensource.cirrus.com,
	sbinding@opensource.cirrus.com, patches@opensource.cirrus.com
Subject: Re: [PATCH] ASoC: sdw_utils: cs42l43: Enable Headphone pin for
 LINEOUT jack type
Message-ID: <04fe0512-8d25-43ec-b400-38dee37c2bfe@sirena.org.uk>
References: <20260113084402.10427-1-cole@unwrap.rs>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XJ6D5Kl4d7+Oo8FD"
Content-Disposition: inline
In-Reply-To: <20260113084402.10427-1-cole@unwrap.rs>
X-Cookie: /usr/news/gotcha


--XJ6D5Kl4d7+Oo8FD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 13, 2026 at 01:44:02AM -0700, Cole Leavitt wrote:

> Fixes: 45b8e93bd0c7 ("ASoC: sdw_utils: Add helper for soc_sdw_cs42l43")
> Signed-off-by: Cole Leavitt <cole@unwrap.rs>

Commit: fcfa8321d41b ("ASoC: sdw_utils: cs42l43: Enable Headphone pin for LINEOUT jack type")
	Fixes tag: Fixes: 45b8e93bd0c7 ("ASoC: sdw_utils: Add helper for soc_sdw_cs42l43")
	Has these problem(s):
		- Target SHA1 does not exist

--XJ6D5Kl4d7+Oo8FD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlmfVAACgkQJNaLcl1U
h9C2+Qf+KLs6z/pnhNyuOW4IDon5udjDLojdS1Ryw58JPX75ZoHBPsgWTHIAyUTz
Scbx5qNf+V/Y627D1yidurs2Z4mXSgzOrMVn5QZ7HQaB2gp5adjRXpOQYuX3xtdA
xBXqK0gPiCrHlZTDAvyuox0U02ROaJYua6Nrun8jFDVR/3DtWp0ndRQCVuH1EKwv
Qc1mraQsIeZ7VbuZkAoahk4Fq3oMalZhBteBMG02FdpM6FSZeFMZ9KXgBxDp/byY
rABnDOESafODRroZTiEgazxUlvryz+8Sq4ygE+6twNLj72seoPhgxf7gQ0/L/E15
HcQLBhtchJBdFl0B9Tz5YGw2vq+4qQ==
=1Got
-----END PGP SIGNATURE-----

--XJ6D5Kl4d7+Oo8FD--
