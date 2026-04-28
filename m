Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BEA330649;
	Tue, 28 Apr 2026 08:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777363662; cv=none; b=oU4Jem0ntwM7iuvbjQdqcq7fgZrjAZL9xiuIczuSA8zHX5ybhHdLRr68HMEzAIfgjjTeswK24PnMHn0RMj+Oqrt1m7M9F4ea55/tsvaejInotV04GXez7dokdbvDadA2pfd/QzJdVyRq8IvkVSsJzPmdPeOOmOUQBorFkma/NNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777363662; c=relaxed/simple;
	bh=UfAd2Jq9oazNbJgG/1QKnEfmNwcZyGx8kZ1KbvhgwoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nWDYPydTUjce67TnllvKTef95A9EuNdK41vrNTPn9ZOH3mIar4+5mmbgnhwtd4DFP6qHsbGcDTlBP5nknVf08Ec7EPtVNua6hTLrj23oBczBcLbA2kkkrY+7luuWEXitEpMIrLUtZfpytl4ktbD+wopLdAu2cfzrRcxJkYUYSXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bgl8iOYc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bgl8iOYc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1672BC2BCAF;
	Tue, 28 Apr 2026 08:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777363662;
	bh=UfAd2Jq9oazNbJgG/1QKnEfmNwcZyGx8kZ1KbvhgwoM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bgl8iOYcaGjsXREWK76L7oXinyeIa6cilEmnDf31bw6HDV/xuJ0x2N5ezlHxv1PYc
	 1KAIL8nfh8HJA5HlMjB6bBT/IRlOUAPL0c99WUV7bph/qc8BhgMAw7EoEaiWe6HuBg
	 V2HniuI6i00m3+8ZlqhbaGDoRrotvvUhuoY0y+ycVvKHWEYK+61KKjJ2eunwlsGKHJ
	 JqtTVf1aBWFz7mHVFIYRiuIQKK7eBjeT0ODkVQrjLrFtD4kHMQ2vHfE1bZR5jce/4O
	 gDp4CxDakFg5JeVNgOHUARSgFS8O4eb2kJyvEjObGR4CB+NpaKQK7IhYqIJdlp21uO
	 o3gT7rcCV7kIw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id BF1C41AC5840; Tue, 28 Apr 2026 09:07:39 +0100 (BST)
Date: Tue, 28 Apr 2026 17:07:39 +0900
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v1 1/1] ASoC: Intel: cht_bsw_rt5672: Drop unneeded NULL
 checks
Message-ID: <afBqy-LWQ6th2S9v@sirena.co.uk>
References: <20260428074758.3087437-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="S8xKput8qTDS2AV0"
Content-Disposition: inline
In-Reply-To: <20260428074758.3087437-1-andriy.shevchenko@linux.intel.com>
X-Cookie: Victory uber allies!


--S8xKput8qTDS2AV0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 28, 2026 at 09:47:58AM +0200, Andy Shevchenko wrote:
> After the commit 7735bce05a9c ("ASoC: Intel: boards: use devm_clk_get()
> unconditionally") the driver assumes that mclk is always provided, hence
> no need to check for it being NULL anymore.

There's also the fact that as part of support for optional clocks the
clock API will quite happily consume NULL clocks.

--S8xKput8qTDS2AV0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnwasoACgkQJNaLcl1U
h9AYlgf/Y1OdpHdsvqm4hY1F00rFJnS0/UEC2sQ2S3Xq4/4W+Bm6EU1F9DnMdx86
rnznmTz081E7fpXURLri+DE16Z4oQe5t49VII+4HuWQef3yS2kIfeNVh8rmpRke+
73V3FW56kU+mcA9eFMqxbFK+8EeGER+eGKzsg5FaXJDBp6wZbTJhPMLjrmbhcHRL
RKaRQYS9dPU5x7mH0PUG990QD4cozvkIcvYqAwSecMSUlXBqE+PgaNSE6XZGgreX
qZB2cn4vWNbDV1SiPcFEv3lfArPYU1ItxCXcVVV+Ly0a1fc5hz8UxuG34lwv8P2G
S1VJwDr2b7p70A5Nvhij98TlODo3qw==
=mBYU
-----END PGP SIGNATURE-----

--S8xKput8qTDS2AV0--
