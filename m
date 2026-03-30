Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57413D5241;
	Mon, 30 Mar 2026 13:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774878242; cv=none; b=ZEvazBu9/rB0+1lApKBm2/F5hjxAmRaBMLtRd/bTciHQn2Zhxc+oXfuUgRD2QlvHuslIuW+UlWqih3GpFrZRR3rIiCSdbnI7D72ZR7AGgSk/bA+ENKMdH8bbrZhDWPc2LxuZVroZuRVvuebsHCYuJcnd4fO6DoxjkKEnX3YN0QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774878242; c=relaxed/simple;
	bh=e/lfGg3pPoXB1XOHi7NUqmDi2GKRyGRTPgz9ddjcYHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DTUt1+ow8u0V7aB4gfLH3sHRLQ6JAVQ7gwrZcf7DfBfntx/VPmTjYnwYnkSBGxtel+WkZNpePPjjFVObWH2HFjcFb+r54BIwJTq7hNPUqxMwu8yX9SurzHUJxnP+7InfltVmGDHuk0Q4gPMKfbM/dKFrpn5q7F01azBUOWBlRn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pjuyCHlu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pjuyCHlu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47C34C4CEF7;
	Mon, 30 Mar 2026 13:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774878241;
	bh=e/lfGg3pPoXB1XOHi7NUqmDi2GKRyGRTPgz9ddjcYHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pjuyCHluZPe8wbzLraaUAD91gw8cavqkQwKE8UpZsG3ce+EFtn/4TM5lhhPlqs3n4
	 J4h60dNemcBI+hefSGPMRw0+L3Nnfx9lQyLvJfOiLtOzqA3ZxI/jFTNYS/ymbRcHmv
	 UQ9+yA3g9SwtmV+nQoxnkj3Xht4md50neXtfaaWEa+XAi00uCOQn3XVICeciPEr9f5
	 slJM1RJf9NsGM4uontjlCIJsrhFZGjtSe4iDIfs0SLgR5t5+6J+lCwUimsxW7DP9/o
	 QMMYEtqSblGY2WpltIXe/SdMlLvxekaqWQSJGt2qyFRLh1xWiOAWUjZ4BdANdzrZIM
	 1UgWKTjc4OBBQ==
Date: Mon, 30 Mar 2026 14:43:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	superm1@kernel.org, Sunil-kumar.Dommati@amd.com,
	venkataprasad.potturu@amd.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: amd: acp: update dmic_num logic for acp pdm
 dmic
Message-ID: <03a53820-a076-42ed-9ab2-3877396f99f9@sirena.org.uk>
References: <20260330072431.3512358-1-Vijendar.Mukunda@amd.com>
 <20260330072431.3512358-2-Vijendar.Mukunda@amd.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dI3HTm/r/Y3gRSFj"
Content-Disposition: inline
In-Reply-To: <20260330072431.3512358-2-Vijendar.Mukunda@amd.com>
X-Cookie: HUGH BEAUMONT died in 1982!!


--dI3HTm/r/Y3gRSFj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 30, 2026 at 12:50:27PM +0530, Vijendar Mukunda wrote:

> +++ b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
> @@ -535,11 +535,11 @@ static int mc_probe(struct platform_device *pdev)
>  					  " cfg-amp:%d", amp_num);
>  	if (!card->components)
>  		return -ENOMEM;
> -	if (mach->mach_params.dmic_num) {
> +	if (soc_sdw_quirk & ASOC_SDW_ACP_DMIC) {

soc_card_dai_links_create() (which could perhaps use better namespacing)
checks both dmic_num and the quirk.  This doesn't seem properly joined
up (and perhaps the code shouldn't be as spread out as it is)?

--dI3HTm/r/Y3gRSFj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnKfhsACgkQJNaLcl1U
h9DXcQf/Req/nIvPby0oETVo+xflG1uDXBGro/Em5r7Rw1fbh2SHDKC8vSHW3aXf
QMTfSXUkKv57R5N3hqqE2deHwFcnePQq1VvcJAUV841z1GaQ1CfC0yegldOdnI4h
/jgH19Shd+sjf0/d5bpTlBJaA2KTlXtzNHr3jUFmiJDgKvyRRcjaYIzKf+EjxAnV
NSWHr8UJgQxeS0gZid17tUYceYWVDXz3EBLG//LKoN/f7UYa5t0OFnQESITrp6oH
f7FGFGnXcENX0xZJgIBED/k6csChtrVRmpqygrTFD6DW3ByDrsV/jLxhKi9vnwJA
s4U/2PqYUMEgshUtvJJ7Z13i3L+/Rw==
=12eD
-----END PGP SIGNATURE-----

--dI3HTm/r/Y3gRSFj--
