Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8F0344DA8;
	Tue, 24 Mar 2026 14:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774360971; cv=none; b=VnrxYsZFDdLnZ8y6BWFqGiIQmbWPVQnS9Sjqgf3WHbGwgdlh+TjAOmrmzmQ5kKP6P2JDErGPQ7N/wAWZwJw3RDIE0OviH+zjlbAj7j/sKjGyUxjq3B6Yj60u0M2r4EfFZpZH7qeZQSVp0000QCTGlA42FLHNbZMtoNnMLU9mnf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774360971; c=relaxed/simple;
	bh=rY8A2PI8lYGZ9GxBlFDyF7IdimzOGD8/BJMm+x+Y8z0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b1uyBGIcxu03kMIG22r5Ud87GatNydAG0KaD+QcvvKpQY5CjAm33Rxv7D1DpgH2/S0wX59nbWboVF7Hm7tV6BQ6CFODN/J16dumteHwl07B0eN6qgllbV+YG0XT533vbrQnFdgbin8ngP9ptjhUkL2AuJKXFktsrpfi3GKACKe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IwO5HDLq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IwO5HDLq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A508C2BC87;
	Tue, 24 Mar 2026 14:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774360971;
	bh=rY8A2PI8lYGZ9GxBlFDyF7IdimzOGD8/BJMm+x+Y8z0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IwO5HDLqX6KqlUUw+Wyq1OErrhbVkyslimnCJaxNLuz8Y9s0yPHxdGHtOcXwHg+Oc
	 oWS9dnhYt0z7mIwPo0H6iefUEUsRyK8J95TklPjovIIiXrYVOe8bl5OO8uIqK768+M
	 eFwAr2IqgKgNF62Z7tTUdAndveh22LOu70rn0+c8easXgZLfUEvaU6k2ceHcg3gNJ0
	 mjfdGFhGtKqAz6p4+lmcIII16626HoYVKqD1uJXiaHBAcKvJOymIYSpCTeEPdTvy3F
	 6jiXbDlp5oobr2OLRRKvmQCSuWXkpN9+CEsnB2Mle91MtOfNUHZ8Gz/hsOXxVCQxGx
	 QrtovgQWg52iA==
Date: Tue, 24 Mar 2026 14:02:47 +0000
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH] ASoC: cs35l56: Allow factory calibration through ALSA
 controls
Message-ID: <626b66fa-3f7a-4777-b510-18d0c0df3bf5@sirena.org.uk>
References: <20260324110302.273983-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fFUmXSv8DKPKPAIH"
Content-Disposition: inline
In-Reply-To: <20260324110302.273983-1-rf@opensource.cirrus.com>
X-Cookie: Forest fires cause Smokey Bears.


--fFUmXSv8DKPKPAIH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 24, 2026 at 11:03:02AM +0000, Richard Fitzgerald wrote:

> +static int cs35l56_cal_ambient_ctl_set(struct snd_kcontrol *kcontrol,
> +				       struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
> +	struct cs35l56_private *cs35l56 = snd_soc_component_get_drvdata(component);
> +	struct snd_soc_dapm_context *dapm;
> +	int ret;
> +
> +	if (!in_range(ucontrol->value.integer.value[0], 5, 35))
> +		return -EINVAL;

The values range from 5..35...

> +static const struct snd_kcontrol_new cs35l56_cal_perform_controls[] = {
> +	SOC_SINGLE_EXT("CAL_AMBIENT", SND_SOC_NOPM, 0, 40, 0,
> +		       cs35l56_cal_ambient_ctl_get, cs35l56_cal_ambient_ctl_set),

...but the range is from 0..40?  I'd expect mixer-test to complain about
both these controls too, they're not flagged as volatile.

--fFUmXSv8DKPKPAIH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnCmYYACgkQJNaLcl1U
h9AITwf/b0Ot/GnuQzuyGftzL9q9BOkON9oTTGQqNwqY7tgFAbRaY/aNdXgEJbGX
lVS4QdeMnyHUjAzipKPTnzrgWvSTf+9hJJli31JFV5/r+ZAT4yYGeoWcmHTMQQHP
kSHGjbkYNpGnSdfxp7zHpT3qgK2aXb8UkgbWI52WouGN41jqy7lmtAs13oqLcmVJ
1cAf9qdQeg+ra1r0Gp+XkqyAFPJEmdHS3LHGIBtTtjA43kPU5wtUsf2ouy5pPdQm
9pqBzp6SCnz8LOColyFgQZJjmX2nldqgN/CgHapeQQGJNK/XFvFAJD5xGtlM34a/
1wJADo6z/Xf61UIZjjT/AWeuCC1lMg==
=OCtT
-----END PGP SIGNATURE-----

--fFUmXSv8DKPKPAIH--
