Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E8D383C8E;
	Mon, 20 Apr 2026 12:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776689432; cv=none; b=sX2bTdA7wNAF22X0Bz3R60lzxJiw2UeeYXF5OJ94eiR3jV/31E9jxUGJzVs4rmlSNaICasx7y7xgORIHVgR022WHU1WfxGYbkVsj8ilSPSIR5h1GfTbqDVfWE6VzdcJETjzgmzsGUuCe7W8Q4DqxeuJA53r7ov5r7hq2Dno1wvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776689432; c=relaxed/simple;
	bh=xTIIm6v0aDSvm3HYaOhaWOqM1+ERQmESsoyqC0gy2jc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hYwUlwyoinBQHIJHjjzlKuaP8fcgvDAJ4xcir7a88td42zgkEEumaQ/Qx+13+P/3Ya/nX7hYCaZfn/4qnvPGao9qTbyXMmottPzVkPQIRV7QUp9/tYHlpCnLDdOXEaNWlYA4dxwBHlsuuHH4HMCvBCNbzreb2TpGDNhcvcv4iEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ErFvZhLY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ErFvZhLY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 741BCC19425;
	Mon, 20 Apr 2026 12:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776689431;
	bh=xTIIm6v0aDSvm3HYaOhaWOqM1+ERQmESsoyqC0gy2jc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ErFvZhLYCAbOYtZB5cf8nFzowfaWmqIlzHDrYgZOwAlRd+mB/ObVF3AY+Z67NZO1A
	 7d5wh23h/7qfyILBYz6Dp4Sge8caG/OaqOPxjA+eeNP6ckMwYFwQE8lTkfsEHnaraL
	 l+xeFvDTZBtdZ7vOg2nkcgggY+Czj+982kopyvxVcWiH8Qu8mbel8J+hnL6ZMXMGdZ
	 qqtkRx2YrAsl3MmCCZkmHiqBvEIimWRqE6cjc4zzuLXfs8FfZkYTEVJwUwKWH2nLNu
	 nsFY+8lD/HvolznL/3BBG1ySRdti/nlBKDhAj4AucT/EMY0k34Q7ygP/u/6kVyJF0/
	 OQcv0NE1VAg2g==
Date: Mon, 20 Apr 2026 13:50:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: fsl_micfil: Add DC output remover control
Message-ID: <6c6f94b1-a4fa-418a-b471-8e3c82305233@sirena.org.uk>
References: <20260420085344.2081805-1-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="flMtTIAJpPEILprL"
Content-Disposition: inline
In-Reply-To: <20260420085344.2081805-1-shengjiu.wang@nxp.com>
X-Cookie: Sales tax applies.


--flMtTIAJpPEILprL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 20, 2026 at 04:53:44PM +0800, Shengjiu Wang wrote:

> +static int micfil_put_dc_out_remover_state(struct snd_kcontrol *kcontrol,
> +					   struct snd_ctl_elem_value *ucontrol)
> +{

> +	if (val < 0 || val > 3)
> +		return -EINVAL;
> +
> +	ret = pm_runtime_resume_and_get(comp->dev);
> +	if (ret)
> +		return ret;
> +
> +	micfil->dc_out_remover = val;

...

> +	/* Update DC Remover mode for all channels */
> +	ret = snd_soc_component_update_bits(comp, REG_MICFIL_DC_OUT_CTRL,
> +					    MICFIL_DC_CTRL_CONFIG, reg_val);
> +
> +	pm_runtime_put_autosuspend(comp->dev);
> +
> +	return ret;

This will return 0 not 1 when the value changes, meaning event
generation is missed.  The mixer-test selftest should report this.

--flMtTIAJpPEILprL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnmIREACgkQJNaLcl1U
h9BIGQf/RpXGRbf0pZBOYDwpdzOcFiJwjjmkZadSsDpc0g3ybn3NjnIwvfOKtMzN
jebpDFBtsmpudB7+wkjIEzme/PdFYUrlj/wu4ZPicIkREErh12fLTibTLvTI/YHQ
RKbMge93GcT2FW9mQi065RluhNvCGTdp7wCIU1X6b7Qwsv8KxNfSbsjwVZUyqLK8
7rhdWKJYJfhMr0a/zQNXexCNbs2oRsKK23Jl4Q++GWwz1oXe/b0W8zvweavk8baP
ZJP1gE+NnwAWwP6hDEi/ZO9LiVI3wlWphUIIpawkPiuHbg2MF3PQuTJ2jGocmDN/
ThfvgM8/pO6z5Z8YzWyClLREtSzekg==
=HZhI
-----END PGP SIGNATURE-----

--flMtTIAJpPEILprL--
