Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F7D3A6417;
	Wed, 19 Aug 2026 13:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787147197; cv=none; b=afWJQR0fksJh5QLmssOfqu1qDZkNYAc0g1+OZtdJ+UOSFY2dlcmsm6PUfvgXk2Har36ojGihswjrCJWvm5X7fMWemxUk0BFeIHwgaf5LjlaRAiBdltPr8MIzsw7Tb0f5ehd1tJiU5YKFTQKd3CDxiP0HCbBGWqAK1L12A+4rENI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787147197; c=relaxed/simple;
	bh=n5dAMr5s+tpwmaX+ra4n8/msR5yEsrdG5fj8hgGY8I8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MANTsRprP5Vi2n4qcBJhkbUjPJlSAIJvkSvFl/5qxYXPoc2i91y4FqxQm0FHREQo2WuOL/6SPtS9p+qpkkP92Nacknr1bDsk7hjbD08OrehD+4mMY0A0u5tL+kzEZlTlUaxTOvKvFospPTxZ49psrCkaLL399M7e3z+ggCxyd1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lb1p5cUr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lb1p5cUr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CB121F000E9;
	Wed, 19 Aug 2026 13:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787147196;
	bh=0POZP8e22vVaZUN+en054awfGBRd8ShEuGrlh2XjrrI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Lb1p5cUr2j8tu47uPzzPDx8NLXQV/95d67eXOqe9HDmFPO1TRVK812d8Bvwghn4DB
	 MZQ2OJaHWJnBb7wHCrKVG/lO73JUL81fPwad+REaOeXQZbZRRCxguaOXrOVamMz2AQ
	 LaAlEjLiJ4Do5mGms+vTnjn1V1Ovmv2yCkcQGMQ8EG8DBo+lAoA6Guju9UQUhhKP3p
	 T+T7+YmvDaSIpSaefpVVQZ6fh9HsiQ7w4ju3scylu1+YIeF4j+LDSGUtLDMaZNeEsA
	 CQf6/F3MYEXLbzRRhCYxTulNAxyjbR9jL+GukfSl+dBSAiSrEp70AhYVRcVMvkuNVN
	 8+xC+l9yJk3Eg==
Date: Wed, 19 Aug 2026 14:46:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Niranjan H Y <niranjan.hy@ti.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	ckeepax@opensource.cirrus.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, cezary.rojewski@intel.com,
	peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
	kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.dev,
	baojun.xu@ti.com, shenghao-ding@ti.com, sandeepk@ti.com,
	v-hampiholi@ti.com
Subject: Re: [PATCH v1 1/2] ASoC: tac5xx2-sdw: update default regmap registers
Message-ID: <b714ed66-e722-461b-8cce-8535a14acc75@sirena.org.uk>
References: <20260819053427.2277-1-niranjan.hy@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rOX8dKNf0rktIiFd"
Content-Disposition: inline
In-Reply-To: <20260819053427.2277-1-niranjan.hy@ti.com>
X-Cookie: Allow 6 to 8 weeks for delivery.


--rOX8dKNf0rktIiFd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 19, 2026 at 11:04:26AM +0530, Niranjan H Y wrote:

> +	/* SA */
> +	{TAC_VOLUME_REG(SA, FU21, LEFT),  0x9c00},
> +	{TAC_VOLUME_REG(SA, FU21, RIGHT), 0x9c00},
> +	{TAC_GAIN_REG(SA, FU23, LEFT),  0x0},
> +	{TAC_GAIN_REG(SA, FU23, RIGHT), 0x0},
> +	{TAC_MUTE_REG(SA, FU21, LEFT),  0x1},
> +	{TAC_MUTE_REG(SA, FU21, RIGHT), 0x1},
> +	{TAC_MUTE_REG(SA, FU23, LEFT),  0x1},
> +	{TAC_MUTE_REG(SA, FU23, RIGHT), 0x1},

Did you check the sorting of the table here?

> -	REG_SEQ0(SDW_SDCA_CTL(TAC_FUNCTION_ID_SA, TAC_SDCA_ENT_FU23,
> -			      TAC_SDCA_CHANNEL_GAIN, TAC_CHANNEL_LEFT), 0),
> -	REG_SEQ0(SDW_SDCA_CTL(TAC_FUNCTION_ID_SA, TAC_SDCA_ENT_FU23,
> -			      TAC_SDCA_CHANNEL_GAIN, TAC_CHANNEL_RIGHT), 0),

The new macros use _CHANEL_VOLUME and _MASTER_GAIN, there's none using
_CHANNEL_GAIN?

--rOX8dKNf0rktIiFd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqFs7UACgkQJNaLcl1U
h9DPtwf/fOKVKlF9w1pD+LKM98ZoqGVfXAj8lgmCLVU8FJEmFXUNXOZB4nJIM8gD
a8G1I0HLr8rb5M5WETEdWnO2vDQZs24idnm2uFAdNXwshhap0UeizlAZh7XiZgUt
ItglPUedBitxBsZi7+i74AHIfATyUpSf0npJ79EuVNQA4fo+OvNtL0rHTsMVZf8N
X1+vccpf683z2S3+dRNtWLX/bokGWWPYFqfKLHEEntARQZ2Bh0jwQbpi5M7gOqXt
/ZYMyzMakDPKD6yQ1euRPsmtutXXzD9s3MzftFfrcm2TIxlsUz2tj6fK+IzHBrZ1
jKKusD2bn0kfcPwcizgwVYPxRMpuBw==
=9qM+
-----END PGP SIGNATURE-----

--rOX8dKNf0rktIiFd--
