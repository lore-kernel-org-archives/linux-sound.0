Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572EC361669;
	Tue, 27 Jan 2026 16:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769531316; cv=none; b=pi2kfsgwIhJ01STmhr+dvdqtNNdBXBggVdgMVi8ddzm9U8nM55bqq8UZGR3RUiMqYqXTbaoMDHXawzj7+Q8/OPmIjyHGN6HrUjGkBdxyhmoZGa+1/YetqTQhR9o63KEjNHcnGu0qyClJKGk4sCoQv+ffjfUzThPBIm0Xq6zfcF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769531316; c=relaxed/simple;
	bh=2gT/iHNtUCQOANyOZ9F4WPx+IA6+nc9rpNAAiYeGwao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bcyloimVCnJQx5l8XlxN8ujk0tpOuCOgIBgMsOc7RYB17QqcmdanhWdaocEcz7eSQVy7dZgt3MTsv7BW0c8Sb5GysHrctr68pq7CMsNzUSSNiOyMylmDLkTplRoX/74HT3W0iVLmtXuKNwoEUfh/T/fISnnb17+xyFcmCWTJBak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QMmH42S3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QMmH42S3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8121C116C6;
	Tue, 27 Jan 2026 16:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769531316;
	bh=2gT/iHNtUCQOANyOZ9F4WPx+IA6+nc9rpNAAiYeGwao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QMmH42S3D/fXjA4XZBLKEKGqYGR+hblOcWG3YmQKQwiQleNmxot9M1L7Xa5UBwle2
	 vURpOabrmHYJVsdnjgUegV8sB0/oQ0jRzLoCStl3hyEruj9x6nyfp7xN+brPrBihtc
	 4cRxEPJExSxhIXoF7t/5NQQJXUTjGzjJjsPEtg15GhfrakEfNFGKL3UkmsMB+W9j1Z
	 l8WPycyFo01tIRY+wxWh7c/bLAEF03LNVXt8SaIY7oZMytIq8GhJTFjy11PjbHuzwk
	 Ok7hlincUZVAaCX3NkP5CR2Tzlu+0yOo99QzCL0/twLqqzHqrf2Aoe+2Gd06Uj5JJL
	 bL2NnqU9yTtng==
Date: Tue, 27 Jan 2026 16:28:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Heiko Stuebner <heiko@sntech.de>,
	Alexey Charkov <alchark@gmail.com>,
	Sjoerd Simons <sjoerd.simons@collabora.com>,
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Sugar Zhang <sugar.zhang@rock-chips.com>
Subject: Re: [PATCH 05/10] ASoC: rockchip: spdif: Improve sample rate support
Message-ID: <0d7af11f-497f-4c12-b439-41c30f10e087@sirena.org.uk>
References: <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-0-a7c547072bbb@collabora.com>
 <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-5-a7c547072bbb@collabora.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sMM3hIg87s8YkaqH"
Content-Disposition: inline
In-Reply-To: <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-5-a7c547072bbb@collabora.com>
X-Cookie: I brake for chezlogs!


--sMM3hIg87s8YkaqH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 27, 2026 at 05:08:25PM +0100, Sebastian Reichel wrote:

> The hardware supports all typical sample rates from 8000 - 19200.

All sample rates up to 19.2kHz!  :P

--sMM3hIg87s8YkaqH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml4564ACgkQJNaLcl1U
h9DVYQf/VTCLBTwVdz4bkyRLRrcQTN24cIP4LD0onUacgLs0Uw7cv4AxPuVvUB0V
oT1muQitYWFjpl8/QzRrd8swBGis8qRLpxBlkd0pRhA3cIGPSJHEYTh8HYxT5eme
7qYQ+zk6/WIXH9JkV5sEp97RtxZXqFhGZo9olc/al0zm82MGWm5MBHIaPkIiWXR7
Rqk1j6CdhCU+IhIict1rY4RzX5ZtCP79dqxdEOrPn9WiJkM4HwEODi7kXxtohmzS
pXDTSj5d7lRuX+DXv0SxdkjISW0waRtN0NViwla85R0qwY+rJxf68VIpe94BzE5O
N5daWx98kbh4/v55+JtrCJGQ9uqybw==
=ITKb
-----END PGP SIGNATURE-----

--sMM3hIg87s8YkaqH--
