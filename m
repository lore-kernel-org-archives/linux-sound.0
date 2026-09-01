Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F079032C8B
	for <linux-sound@vger.kernel.org>; Tue,  1 Sep 2026 23:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788304197; cv=none; b=AX2poO1wG8p+epvLW6QgfreN+7CpYqgLpL797paXclc8r4u/8jLm5dkhMWO1jwqzvzGU/2yvUCaCNUYiPPhxetlcgz61i7c8tMmjEqRA4497XSQ8hprLUQy/gnF9PwBfa133ynHtg/M3Ayo0hJvlerXcuPuiOuI4aemPsE+y10k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788304197; c=relaxed/simple;
	bh=504QPVuJds91P8exm9MBwR3ovocslSfxeB9SFiXdG5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pndZNQmwFbDsk+SYDCGzP/peinqzlSDXxHFVmc9LPqrqHRG1oDhdfnzpPOQo+B+3zIqQQuMt311yCFhga4TiPD/n0ApgHpNpqjGk73R2Dd+ag/WeD0/XVWlt63lBN+cYPyhMlnsHzKA0+4EPUP+6k753tX69bW2nBnm5XQFNois=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=My4D2SPM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="My4D2SPM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C8B71F000E9;
	Tue,  1 Sep 2026 23:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788304196;
	bh=504QPVuJds91P8exm9MBwR3ovocslSfxeB9SFiXdG5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=My4D2SPMZH1vLOPsQQIBKd0C3/xVdSJ7odjSBDYl95ye4rOnNUUygdezJd+0uHBXQ
	 zMuZtSEIoeCj8e4L+NR8P1pYuUjodSVixmEOKxBUFcI6OY2pIBf7ErEW5eTyrcLSDt
	 iEmh8QharWxCgzTLYYOrFyIeQ7qpIdp98imO7/GMc918UEc72oy8jHlFP5q6lbJhvh
	 roasokfbQiYBTtVM86aVFQHTwzGkgDc3zt0hZll4iYY4Mp3GxGfabnTlKNDidEoWrt
	 X+nyXiX9avw25SdjHPaSVM7PHXMHBy0ap7e+CpStChnA90dleZvxAiLM8oSiD7krPM
	 VdkLlX7+EHHxQ==
Date: Wed, 2 Sep 2026 00:09:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/9] ASoC: ux500: Fix MSP lifecycle, clocking and
 resources
Message-ID: <0deba12c-bff2-4ea4-be4e-524c3b52dda0@sirena.org.uk>
References: <20260902-ux500-msp-fixes-v1-0-da1447fd9f7b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SVGOmR0J8J1d3GHM"
Content-Disposition: inline
In-Reply-To: <20260902-ux500-msp-fixes-v1-0-da1447fd9f7b@kernel.org>
X-Cookie: Prevent forest fires.


--SVGOmR0J8J1d3GHM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 02, 2026 at 12:43:43AM +0200, Linus Walleij wrote:
> Repair independent correctness problems in the DB8500 multichannel
> serial port driver. The series fixes duplex and repeated-prepare stream
> ownership, error propagation, frame and divider programming, FIFO
> watermarks, DAI validation, reset handling, and MMIO resource ownership.
> It also removes obsolete PRCMU QoS calls which are unconditional stubs.

This doesn't apply against current code, please check and resend.

--SVGOmR0J8J1d3GHM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqXWz8ACgkQJNaLcl1U
h9CBZAf/cDkOSat6V2RA4ViE/lJ6TpM6E6bEVPhTBg4NY0z7ls+MzI3X1CiGGZ95
nNtHKz4j7F8kkw8x/5PRiMGW6rirSRmwWRQHWuJRZquJJgORjpmJg6OjrqeV2z6o
ByXTGP3bUWx3SHjXszFkaRnELviX08694R4XcHFGTF2MmKiVEQh97Ulsq5R7VBxl
JfJCcjRhbF6NP7MkE6iDRww9ST1+m2rOlTQyxZJIFImjATFQfcoWnxcFmvDxn2oa
xLL9f23n+1CMJMMIeraRBxZ876gUl9ejQAqMeh3Oh2TFZwc3H62k/p2HgomySXdU
GL9zPBNQX6NunrLx7c92DUUfUma9aw==
=UVkw
-----END PGP SIGNATURE-----

--SVGOmR0J8J1d3GHM--
