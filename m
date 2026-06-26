Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF2F2F6560
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 14:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782482939; cv=none; b=CGtN9cp/DS8am6+K8SOc5zPXgiTZ/yfzdxb2Y0tNsrRHSjeHn7+ZrWnah2yMCdlsd3S+MR+OSb+rlm515OQJMo2aUV2na87GwwuucPF3i3ips7c6gA95xrL28nvm0YTJY5E4Z9ZHboAqvpvUWff0izZ/4tTu+gM9or2tnAIXNWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782482939; c=relaxed/simple;
	bh=8L9APAAd8CRDxSp4DHy8iSxhTWkGGYZK0e8hYB/sGkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YdQluhU3OqIKNrRh7si6sQToHGCZfcAL62nmtAvaUsD2jkxKnkvWvK25CLV7trwCYXhDen4G9XG+yUNq1Ibey14V4inRpBzyWC038QmleVykjM/l8K8giUCAWyWAG63UcqWFjROxlQgnacx+cTF4Wv2z4feKxBTu7bOqw9pXow8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LsBVe+uy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LsBVe+uy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAAF51F000E9;
	Fri, 26 Jun 2026 14:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782482938;
	bh=6ivvOmwoJQ1NeUWI2UI7bRqIYmJFj1goaLPEl/zttAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LsBVe+uyvG25UskVDZsV0YJEt8QjZnPM59ZJvHc4/7KXBLVHw0fjCDFLIF+UyDwPq
	 U8LldNIuzbbcc2ga0RvSHruXTvWUU8QQHRBqCpuBUX0DjMFtIqZEJDBvx31DX9i53p
	 7FMYbBxq50eCK08nJRi0GySliwoTvWodGWA1uHUy21A5dBY3Ki/dFSqGzw+qzbwcu1
	 Cf7k0ETwokIIXpQ5IRNMkCISpj3z/vXRZIwGC9oUJecQURRzeGZQOUX6u4EWe+MpdC
	 gM+2IHFfq4PCcOtFC8VFXyWQoXyAqZ57qJNcVRlZ+mrinTIbDK+Xnhmz4IDfPwphej
	 Q/X6nz6DR36Zw==
Date: Fri, 26 Jun 2026 15:08:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: linux-sound@vger.kernel.org, tiwai@suse.com
Subject: Re: [PATCH v3 5/6] ASoC: codecs: ES8389: Add private members about
 HPF
Message-ID: <f5bd25e2-0f70-4e9c-a73a-e00a632be06d@sirena.org.uk>
References: <20260626113614.27893-1-zhangyi@everest-semi.com>
 <20260626113614.27893-6-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4mFYEvUuaTu9X8U6"
Content-Disposition: inline
In-Reply-To: <20260626113614.27893-6-zhangyi@everest-semi.com>
X-Cookie: A company is known by the men it keeps.


--4mFYEvUuaTu9X8U6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 26, 2026 at 07:36:13PM +0800, Zhang Yi wrote:
> Add private members related to HPF.
> Add Kcontrol for HPF

> +static bool find_best_hpf_freq(u32 target_hz, u8 *hpf1, u8 *hpf2, u32 *out)
> +{
> +	int best_row = -1, best_col = -1;
> +	u32 min_diff = U32_MAX;
> +	u32 f, diff;
> +	int i, j;
> +
> +	if ((target_hz > 1020) | (target_hz < 0))
> +		return false;

This says the maximum target is 1020Hz...

> +	SOC_SINGLE_EXT("ADC HPF Freq Select", SND_SOC_NOPM, 0, 1021, 0,
> +				es8389_hpf_get, es8389_hpf_set),

...but the control goes up to 1021Hz?

--4mFYEvUuaTu9X8U6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmo+h/YACgkQJNaLcl1U
h9AXlgf/cxC6W8v2PLRW12gx0BYNwE4UDWv3qU3QtvIvE2WeQHxZfGUwkL9U5YEe
zCvNUYBTh+t1omLoVLseegFDtGNGj3CqXFKBVU+20s5GvLdAdOoppluao6lBcWP2
FLPPqau/XOy3TYxxU2zv91IYfDnfH4TOy6TCwYYCAuZSRicU9K4wjGLFgXI6/C4s
U/5p0ccsQMk1qamLimZ44lB+vmARzzW5DsChqGSCS9PG71/XcSiY9K23h1lapOLe
GGimTBk9jscr2hNJgfgKaIcO1o5OXvS6Sz/PimNMWeQmsDEhfe2ZlOA7hy434aOr
4j1QGO/ltOJdE1uuTJttE+Jmzmn9RA==
=xXj/
-----END PGP SIGNATURE-----

--4mFYEvUuaTu9X8U6--
