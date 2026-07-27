Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D56246774;
	Mon, 27 Jul 2026 17:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785174102; cv=none; b=pC3GZUlDSs5QVbxfMy4s88U9IvGVmLHgXHneSlaxT5M6tlP5oW2kPO6UN7Nw8CmZiHeFZCfPu5JoTEC4Ev7C0ouv18QBWGCpsPktbjXM91X4hGKzry42BuR9s9cZXsZjPnpTwAUKTy7roL0aLu6wk3McJzjT/0IybQsf8QtSuRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785174102; c=relaxed/simple;
	bh=WfzX6QfseqCwDrqrIp/vR1R7pKu20TjlmkhiZLGtaOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EWawEtoBsZMYwd0uNdZ+F6TC6zpdbDGcoH1Qoc1OghFRsyWBNfsPF01OCINepyWRDmuTajlBik1vSqTaUgCUflhyME8O7EumT3e/WgW7hB/amuaM20xUpICz4EOtncLsB8edAvg4WCjbVgbW8vXdl+cm1hrVwX6G7cQE21J4zmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VWZ6hJYk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VWZ6hJYk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEC651F000E9;
	Mon, 27 Jul 2026 17:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785174101;
	bh=WfzX6QfseqCwDrqrIp/vR1R7pKu20TjlmkhiZLGtaOo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VWZ6hJYk6OD5Ah678t64vkvSOeCUq58a4B3nROSRaQJHHmESeSA4RgIKR5DdO7azB
	 FpmsxOHbJsrdbqwxbIJw/j0ByzX7jX5txpT0vgSzLEZIBQ4ijoDI6eU86x+qRiUUKw
	 +Y3tW5oMyH95e5w7GiGZTmpFDRdX3QYsBJSF2IltcC5Yj7zupkdsV7xMp99aUMB4L+
	 pL9EcbTHk+As+Gd2CuVZJJPP5Y/E1d1CQ12xGX/UHshEHETwKDHQ50Xrt+PaKItppu
	 VmQkd+N8eUKSVNrnzARAc81/zb9WQahlCWFabVLDFkkTDBtb1jY6Yx+u1XZJOKdiRr
	 NVeC/LAGXHceA==
Date: Mon, 27 Jul 2026 18:41:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 0/3] ASoC: qcom: qdsp6: Add MI2S clock control
Message-ID: <cbd35d4e-a135-4224-8e33-543a7fdb986a@sirena.org.uk>
References: <20260727151230.408122-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="T9V6qvMbmLv02Nr6"
Content-Disposition: inline
In-Reply-To: <20260727151230.408122-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Cookie: It's OKAY -- I'm an INTELLECTUAL, too.


--T9V6qvMbmLv02Nr6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 27, 2026 at 08:42:27PM +0530, Mohammad Rafi Shaik wrote:
> Add support for MI2S clock control within q6apm-lpass DAIs, including
> handling of MCLK, BCLK via the DAI .set_sysclk callback. Each MI2S port
> now retrieves its clock handles from the device tree, allowing per-port
> clock configuration and proper enable/disable during startup and shutdown.

I have already got v7 in CI, please send incremental changes for
anything new here.

--T9V6qvMbmLv02Nr6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpnmE8ACgkQJNaLcl1U
h9Cn/Af+LpYmxYvbs7lwW5DOZ1i3E77ji4uhHBvRiV1zPKGOAf0xlEPJegSQxqH2
mAztdhRy5VsB6ZvFrK2tJ802NFu9AfxD0hlSSsPNF9FBYy4zmYLcll9q8ReeznFA
sjSGkKAaNhXlY28lwhvK9KFIYivt5qfFmipmo+ukLsGiHnmXIGu2Iv6q5JdGl+8x
Ex9OZojFzMe+i5FAeYriud3h4AIbMJngxRFIXVVXMtH+XDa6un1gFLHquAS5PKlP
w97yv2K09jgqGcejiUPslLs6Lb254s5WJLCyuo+ilpalmmEk0uFsgaSq1z9o0HQL
113bfNF9aBYqn32Uoj43Iw+7Hiip6Q==
=L/Fo
-----END PGP SIGNATURE-----

--T9V6qvMbmLv02Nr6--
