Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA041DE2A4
	for <linux-sound@vger.kernel.org>; Mon,  2 Jun 2025 11:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748863288; cv=none; b=Bx+KYIbA9uioW6+1Rmp/qmbUuvbBnMApfh0M5iUK7q5FGNO99NOe2SIK7MH19Unkq4syjP6yF6UuoTUqfxtKF2746RoemxGf7e0BiO3tlLkfm8AKb38YZ3H3sGnA5Lh7p7iQi3MLDEkoTMMCJP8xCQ4UJrjtEa0exH6S85BVwWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748863288; c=relaxed/simple;
	bh=YC0EqCOZh+bGnAS0g2+hJzdV0xxtzSuWEz6dOnQ4Dp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J7RSWVQN7ONmc0DilxCGN57qNPI11su10UAl0ki/dm6WXnUVvlGGmuTe/2AFEJs1VESwZ0qm4SyHwIJJnjWLIVZbHWvFjUvN9uY/w4BNUdcK8dHZkC7YuWVlggXJtpdgkNdkru9J9AuWiD7MJKQ/xNQU7FmS05Mw0QFJTbVeMnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lWIjQUl9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lWIjQUl9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9998EC4CEED;
	Mon,  2 Jun 2025 11:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748863288;
	bh=YC0EqCOZh+bGnAS0g2+hJzdV0xxtzSuWEz6dOnQ4Dp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lWIjQUl9Nbkx5Plohd4MnWjQlnxZ+y5p0geoc3A/PsyKEIv0lPMjTdAgImsBUVKS5
	 txK5tdfgiNpQy35l6h2zzzLQBcSVdTfmyuzE6kD+sDw7POHhw4p3nO8o+vw7I2gymx
	 jiiZXdtl6qtNnCReOjPyWJpVhXbjFr7TALEbf66ySRy/JWth7krcg/yGi02JC/WUIP
	 NzKQ0GymQ5dcou5zXiYsJvYFfHORbtlKl2TIffHCa6PkDWtf/ljigZ+G3p+lHLNkj3
	 MOlrVTLeSzv24oOgPFlDGWD1U2JLvgrDD8zAD52DcOKwTO/c+ZZPOdbQCqMSqYMt2b
	 8axp7Hq+/kwyw==
Date: Mon, 2 Jun 2025 12:21:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Xose Vazquez Perez <xose.vazquez@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	SOUND ML <linux-sound@vger.kernel.org>,
	MEDIATEK ML <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] ASoC: mt6660: delete MODULE_VERSION
Message-ID: <bd02757e-458b-4a3c-9194-7d7bbbd318f5@sirena.org.uk>
References: <20250531155950.101164-1-xose.vazquez@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BITvhzOI4tGAp1//"
Content-Disposition: inline
In-Reply-To: <20250531155950.101164-1-xose.vazquez@gmail.com>
X-Cookie: Knowledge is power.


--BITvhzOI4tGAp1//
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, May 31, 2025 at 05:59:49PM +0200, Xose Vazquez Perez wrote:

Why?

> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Cc: SOUND ML <linux-sound@vger.kernel.org>
> Cc: MEDIATEK ML <linux-mediatek@lists.infradead.org>
> ---

You've not provided a Signed-off-by for this so I can't do anything with
it, please see Documentation/process/submitting-patches.rst for details
on what this is and why it's important.

--BITvhzOI4tGAp1//
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmg9iTMACgkQJNaLcl1U
h9B9ggf+Loveli4/RDFRqTHaFC6/CBG63rebesdMGUnYUtvOmCxl+57fKdkjzLqn
Aa604mlfThBqgiFrW1LUlEGXohRq9aD/EBfKxwn64VDq5e2kDtVnKozr2FcnD8+6
tR3TSwvdvrq1G2sWahRR09v176jweqbdUVd/4q3LojhKCT3arXdL0EZtvMQMZVLo
p4FUMAH2ZpnFVOusr074RyX2bmeZl/toiiNAligp3N0GlhJXU9PcQAA0USYs38zq
5hwS3sejJpnP7D8DPceYrzisKywf80nK2+RSHYObUvcQSNwrySK6Y8pAkoI6NB5c
CtQm4xzQGAW9F5b/+v7sfFAlDRkVvg==
=Jazz
-----END PGP SIGNATURE-----

--BITvhzOI4tGAp1//--
