Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1577A3D566B;
	Fri, 24 Apr 2026 16:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777046977; cv=none; b=PCcevFcSxK4xAT2KEyKKYqYS/9cbBQGoTCglYKcEM5lo2sVf61gnt6Vu7mrszpKdLuPd2gZBvt9frFEfmOh2c7QTMfSsypwSI91/sSzVqxvjEetwklJG72sLYsAE4PO5yzaDZvhrkz0aC5n5BYiLgkW2zkA+lX6apB04TMsTgCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777046977; c=relaxed/simple;
	bh=Bmxf+kSLRyZzILqSP1RoPMKZCg2c1UE0whfFdtgIgZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A4iJvqeOSf52kTqpcvVUC/rTaszJBSjVXWAHylVGPZ73O9l8Ok9V1F+p/F7K+789zfFi6gLrqBZUEzsf6Pbr6yRwvtKkLa6XT50jGHBXl1TlDy9pD3LQXOZObouW7fZ+C4b0jeONvnhhmoKuykETQUG7fi5jE8QXQuBNtY91HZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O9URvp0m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O9URvp0m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C564DC2BCB2;
	Fri, 24 Apr 2026 16:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777046976;
	bh=Bmxf+kSLRyZzILqSP1RoPMKZCg2c1UE0whfFdtgIgZc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O9URvp0mFZCPMhsvjttXDH1IlhIbyj3fz5knEyEBnYO404TmAQNnqVVx9c+zd5dCV
	 tzkiqucveNOtwCXDPRXfQgbZnkEJfV2+ucqbLIMefMOMwUiC8s6NeyxmwsOtvyh4Px
	 Q/QVVyHteM+YDLd8AV7nHUgeFJuxBeZ0LvIr7jNLq19I37SrdItjqkSN5VEzDvu25a
	 nVkhoP1WECqTpdnDbDdikQXcDe1nCrMoY8BitNCtJwEpTvEyc9Y5Mswf/Hm2klVyqs
	 SYsJuscHfJGcOU396nWwn0zC5nM7ocgCxoX0QbtE0+ryeC/7S5IWotPwXLhncp9Crm
	 0cIcC4wzoqR3Q==
Date: Fri, 24 Apr 2026 17:09:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] ASoC: fsl-asoc-card: add channel and rate
 constraints for CS42888
Message-ID: <c925e9e6-934d-4b07-aaef-a7f737c687a2@sirena.org.uk>
References: <20260424103806.2276780-1-shengjiu.wang@nxp.com>
 <20260424103806.2276780-4-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OOY2g0cHqmoB5HE/"
Content-Disposition: inline
In-Reply-To: <20260424103806.2276780-4-shengjiu.wang@nxp.com>
X-Cookie: I can't drive 55.


--OOY2g0cHqmoB5HE/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 24, 2026 at 06:38:04PM +0800, Shengjiu Wang wrote:

> The CS42888 codec has 4 I2S lanes with 2 channels per lane. Using odd
> channel counts (3, 5, 7) causes data misalignment in the I2S frame,
> resulting in incorrect channel mapping. Only mono and even channel
> counts (1, 2, 4, 6, 8) work correctly.

> +static int fsl_asoc_card_startup(struct snd_pcm_substream *substream)
> +{
> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct fsl_asoc_card_priv *priv = snd_soc_card_get_drvdata(rtd->card);
> +	struct snd_pcm_runtime *runtime = substream->runtime;
> +	static struct snd_pcm_hw_constraint_list constraint_rates;
> +	static struct snd_pcm_hw_constraint_list constraint_channels;

This makes the constraints global for all substreams, given that the
Freescale SoCs tend to have multiple DAIs and have things like direct
PDM inputs I'd expect it'd be relatively common to have disjoint
constraints.

--OOY2g0cHqmoB5HE/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnrlbsACgkQJNaLcl1U
h9A+SAgAgajMZ4IC+0VYx5rMiGKr2keBas/+oFT/82spBqE6gK9hyGaqIcJ5WhiF
IvT28+aTaGlRBRCyWvxvMhmrciWoNCJQBHiJJVpYLwW2MeCZPHIJp/EF0TcHPxr2
pQ9o73I3ArA1Le9hYYyZVkLIG1hNBA8xfmz7cwVqJ5G2OnQL19aeW9nRUaNfNL7l
bUQEEt3gKskAKtm/pE9b4ZBG5aezx2mNnAJB+vCZVMIyvC8GIu7VPcKLJm7R1/ng
0FsqX01ABGwoBVhgK/A0lm1dd8ffYTCOUj7QxRlnI2j3i6TL1bHfR17hqhRVpt1p
qKxPKVXHmO6BbZmBPGr/tzWNhf3x5g==
=r2dV
-----END PGP SIGNATURE-----

--OOY2g0cHqmoB5HE/--
