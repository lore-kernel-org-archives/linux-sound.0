Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22A451991B
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 16:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789057470; cv=none; b=OGJWpJ0Ve2EnQiYaXzvnqt9Cp8rjVr/5CuzwsbMa8a/POdRrbHQQtOJHVvCRP3cFhdOlMUI7IJfLiYfWqYxc6VAJkHdt98qFEyAl25V6KxYn9qYj7f2dRzm+BtJbtAOmubiGqZ6MxpGMcLke4jtblWkdjDyfpGkX7xJ15o100aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789057470; c=relaxed/simple;
	bh=XMEHOa0BVufINKJK4ZzKEIUiwHETJnR3kYoPy/JwP+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gTxhrOKc/H9AGYzZvP2A0lrBvZvRk1AoF291BlbAwZ9/VKY58hkxOXzfZTnGuNCD9bapSynVV8VHYjfRa0oi82yJ3+CraA4PXjrT+xTag3BqSYSqj/Cf7/JipByqivnGyBkXbHbTpt8eVO87pxaXM5ikYJrFNH1q8nFyUSEwLEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nE9CqRN9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nE9CqRN9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC7521F000FF;
	Thu, 10 Sep 2026 16:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789057469;
	bh=rYy8Zlc7FIKNe+mlHAqXT+c2i9QqTIwWMNrQWjFOkNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nE9CqRN9t90gRZy7EF3dr59d3xiTMayMuqPB1ux0MqHdSgTIcTCd4BDbHfXnqqhIR
	 fFPWrSMSdw3QH82McUh7O45Rq+zEI7cI6GZ905xC5hl582cjGyNqFawHRZn+Npbthv
	 TYmjytdTSK5JQSFLGvK0UxppFszPgpGZ9i31chm3eWFqnrCxRuK+n+MQ7QHpAkSzSB
	 +FqKgI9ijHe5mHrZBXFyc6ZOhjCJFkQ7GKl2dCljZWaG9OdGNMY2M65YfTIHIM8OpU
	 ersMbElkPHRprMS9ImUnOPg6wKaGJeZ56FNjhWDfkg7zkFFSvKWh1AsCnVbMvNordS
	 2v5K7+BQnWYBg==
Date: Thu, 10 Sep 2026 17:24:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: linux-sound@vger.kernel.org, tiwai@suse.com
Subject: Re: [PATCH 1/2] ASoC: codecs: ES8326: Add private members about HPF
Message-ID: <12182d7f-b6f6-44d3-9b4f-e73ed0253ef5@sirena.org.uk>
References: <20260910111828.28027-1-zhangyi@everest-semi.com>
 <20260910111828.28027-2-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hKO2gGoyFPJ9xQU3"
Content-Disposition: inline
In-Reply-To: <20260910111828.28027-2-zhangyi@everest-semi.com>
X-Cookie: Gravity brings me down.


--hKO2gGoyFPJ9xQU3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 10, 2026 at 07:18:27PM +0800, Zhang Yi wrote:
> Add private members related to HPF.
> Add Kcontrol for HPF

> +static int es8326_hpf_set(struct snd_kcontrol *kcontrol,
> +	struct snd_ctl_elem_value *ucontrol)
> +{

> +	if (es8326->capture_rate) {
> +		freq = (ucontrol->value.integer.value[0] * 48000) / es8326->capture_rate;

> +		if (es8326->hpf_freq != ucontrol->value.integer.value[0])
> +			dev_dbg(component->dev, "At the %u Hz sampling rate, %ld Hz could not be obtained."
> +				"the frequency has been set to the closest value, %u Hz\n",
> +				es8326->capture_rate, ucontrol->value.integer.value[0], es8326->hpf_freq);

It's fine to just do this silently.

> +	} else {
> +		es8326->hpf_freq = ucontrol->value.integer.value[0];
> +		dev_dbg(component->dev, "PCM_STREAM_CAPTURE is not active.retain the input frequency\n");
> +	}

This won't do any validation at all, but find_best_hpf_freq() refuses to
run in the frequency is over 1020Hz.  We should be consistent and reject
high values in this case too.

> +	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
> +		es8326->capture_rate = params_rate(params);
> +		freq = (es8326->hpf_freq * 48000) / params_rate(params);
> +		hpf = find_best_hpf_freq(freq, &es8326->hpfl, &es8326->hpfr, &es8326->hpf_freq);
> +		if (!hpf) {
> +			dev_err(component->dev, "The HPF frequency is invalid\n");
> +			return -EINVAL;
> +		}
> +	}

This will update hpf_freq, does that ensure stable values (especially if
the capture frequency changes with different streams)?  We probably want
to just store the user value without modifying it.

--hKO2gGoyFPJ9xQU3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqi2bkACgkQJNaLcl1U
h9CM0Qf/a/8X6158nZ0rjQkzvFAjsFUe/4bguwfzleYrfhrKHXulp4TfVE3cEiQ+
N0aYj5d3TT7NNlNMgbhvjc/uPObfE+4Cw8OiYqBS2pDmo9RUlZUL4CI1HE0eZmf3
WyhfE31h1v6bPqSY+eoB5wpUWSKmZbucAn3GT1eQbMn2zwUdW3i0WfenvFPoacDx
dCqiZHcKPR2OkaYuDUd+oqmY/b0N67tYWJVTWLp0T6Cn7Pn7ZGfXhua1NoU5+KkX
C8ytZ9uhOeygC+6M6uRRbHe307YWtIBgFXM4C0jYVVlaserxPxY/590bipJclH3K
VnJkQ6vcUQx8AW4fi2F3qTQIfsvLDA==
=5OWI
-----END PGP SIGNATURE-----

--hKO2gGoyFPJ9xQU3--
