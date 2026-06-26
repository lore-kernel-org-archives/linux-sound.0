Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB41E37C91F
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 14:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782482702; cv=none; b=f6TVD7/YIY0xYwDSF3Mrwk+OVxfALOujpMQPUPWGvcCSRNTYebw1gW5cjWHBS+QxJuoR5K6uSynf2gGUhR5rwPc0F/NymXIWWEWAt72Gi8U7H5SwsAQ8DPkobzfw/3/vl5OPpzUIJ1o3fs89rMgAnLhskCEtMsumX3WuGmllGrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782482702; c=relaxed/simple;
	bh=FkPidFPyKc9IiC95XTTe2nCCRy4cX9/lB7yMbekkorQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iorVBV3/G+FUcZkGlwwvJunKbJ3bu9iFmiktGj1nwL7M5LtsqSPE6J07wGccjyGb1DJ7hmFuCpiQMXUeQM5vb6SzyG1sEgZ271VHDBPWQ57Xqv0vNvyKQ3pcju02vkA7M9KesmVdfggtEiCKOr1GntNeQUI0xnKudi67PoFzwKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cu27iutO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cu27iutO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E20161F000E9;
	Fri, 26 Jun 2026 14:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782482701;
	bh=jb4KEZZmq9uotls4XR4kf9VQRHvwUdrFyZ7xVrM8Gqg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cu27iutOegxyorKQLa9BC5a/1GzUKgeR1AuLI/8hS+NKvRblk6Ujm3NFPgJwpz02V
	 nwv3GWK/Encn4gdLD0vroKVmTLD9qaSaRijeRr89JUVbdQ05yc0hLNkvvMvuyB3a4h
	 atk0Ky93uoN8ODBUy4Ee9XuwueFwfgId4TayxzR/XFd9BxeJ76qBcNxoUx37acxASL
	 pcx0vKBu9qKc7S0oL6YickfXmVrYtq1hKrfw+ntfLfSEQvV+xsXkSQStozOHyo6rWL
	 TFVcImBkeq8Ar9wEpcs74rLpXHti08PYQnjF6vsv5TUUOZlGQ2KqoOhEAYiGtraD2i
	 7JEaXkWnPPclw==
Date: Fri, 26 Jun 2026 15:04:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: linux-sound@vger.kernel.org, tiwai@suse.com
Subject: Re: [PATCH v3 2/6] ASoC: codecs: ES8389: Fix the issue about mclk_src
Message-ID: <ecf88274-4474-4856-b9bc-842a382ca772@sirena.org.uk>
References: <20260626113614.27893-1-zhangyi@everest-semi.com>
 <20260626113614.27893-3-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mRTdoTEojfWqmAZd"
Content-Disposition: inline
In-Reply-To: <20260626113614.27893-3-zhangyi@everest-semi.com>
X-Cookie: A company is known by the men it keeps.


--mRTdoTEojfWqmAZd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 26, 2026 at 07:36:10PM +0800, Zhang Yi wrote:
> Fix the issue with incorrect modifications to mclk_src
> When the system needs to be configured to use the MCLK from the SCLK pin,
> the code still sets the relevant registers to use the MCLK from the MCLK pin

>  	es8389->mclk = devm_clk_get_optional(component->dev, "mclk");
> -	if (IS_ERR(es8389->mclk))
> -		return dev_err_probe(component->dev, PTR_ERR(es8389->mclk),
> -			"ES8389 is unable to get mclk\n");
> -
> -	if (!es8389->mclk)
> -		dev_err(component->dev, "%s, assuming static mclk\n", __func__);
> +	if (IS_ERR(es8389->mclk)) {
> +		/*
> +		 * If the MCLK property cannot be accessed,
> +		 * switch the codec's internal MCLK_SOURCE to the SCLK pin.
> +		 */
> +		es8389->mclk_src = ES8389_SCLK_PIN;

If there's an actual error here I'd expect us to return the error code
rather than silently ignore the clock....

> +	} else {
> +		if (!es8389->mclk)
> +			dev_err(component->dev, "%s, assuming static mclk\n", __func__);

...if it's genuinely missing we'll end up in this case (which shouldn't
be reported as an error, that's a totally valid configuration).
Consider for example -EPROBE_DEFER.


--mRTdoTEojfWqmAZd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmo+hwkACgkQJNaLcl1U
h9BiXAf/a6CoLuk1ioRcJsv+tlZqT9d4NZjHSLDWZi2Xled4Mhh03Ra2eT3syyDY
zsizy8WUs155GoBaZH/AwSXW/rQHtf86dbQWHhzteaGr+N7lbyVwHFniw3AKMnt9
i7Y0mGBSJL4JUywcHP0AyL1eTYU20bzuqLEJs7tJEMGfNmfzJAl3EJPpEyaeb3zY
YFBMDuHx1emV7h31qy62Rtt46uxr5Y6fOq13Hx5AjO+s8nzmXBuWkb4EWtwREvmx
yHJ6j9j0tbIQnOR+db8EgWU4S5dZW6ndvm2lYYGquO0q0Mojj5fMAZwef4rrXDMJ
oYCFkSjwwCD0tOCojSuqs/Tc1v51sA==
=JCek
-----END PGP SIGNATURE-----

--mRTdoTEojfWqmAZd--
