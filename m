Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C083F58F0
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 15:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789142364; cv=none; b=SZ+UlzyYJwIBtNo1Xrnjr1q9jbD27fOYSaAA5D0SemJ+BOtKV7L6FD0y1KqJngcGL0vKvcuDWCJtuH9HmvJYmIA1+L6Fmv1yEhVCML/wcH68b7cTP4sK9+gwnvKJqZz0FWJyTsseipgK0jfyiuQD5xFVtKDNF6W39fti0oFMO0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789142364; c=relaxed/simple;
	bh=5aV6Rv9leJcFNlqGwGDRBER225nOb0dpuGTPFI3gDcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oKKNMA3AkHRrzQ8MVBTjiQveGoTPsv7pGyn1pasLs6m6qcYiZL60DJLa5ewMsSfqIwcUTSF/5VQ7xWod0ree1cZO5NIxn312R7WjEAkcqj5wz96jX6lFFYampmTTBCpKf8mCyiXRyuTG6RkZHCzPTOXN5GgLowsqedFiPyag+LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iEvvKxqF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iEvvKxqF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 204361F0089A;
	Fri, 11 Sep 2026 15:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789142362;
	bh=HcW/VnNKQ7DoRq5/LUAS63QhBgkqUc1tF0N+OcG9DsU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iEvvKxqF8KDXiclQuTPSOi+kJRE+utk2vC2nt0AAdgO7tukthoIpYSKYZuCsdBWj2
	 aiDRgGSBsagMRkUNmG1nwJ2pW33E7Xz37vBLMr1a12C4uKdOj8TrYo+XYTaCsQ3YdP
	 PfmPTJBTasDeNrMixxsstV0IJsKdkbXgnIdsfRJh6N/cGVesziojjd5XqxW2HJl8A0
	 iJJZ27hB0x5VZis8M6+ePoucZahehG8fs2JGwKsVEcjABY1LFbyQUwHx3IXFZp+2d/
	 Tk1KyaIp234TtY/fLPo+JYCNeUPjUF+JlGz9pPGICojCNrIE1dXbPDHWp1CBkwW/Iv
	 bROag+TBuQO7A==
Date: Fri, 11 Sep 2026 16:59:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: linux-sound@vger.kernel.org, tiwai@suse.com
Subject: Re: [PATCH v3 1/2] ASoC: codecs: ES8326: Add private members about
 HPF
Message-ID: <f6378ffc-7f25-4bbe-bac1-622fdf0f29a5@sirena.org.uk>
References: <20260911132809.4478-1-zhangyi@everest-semi.com>
 <20260911132809.4478-2-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2RcurHqlU3yjicMN"
Content-Disposition: inline
In-Reply-To: <20260911132809.4478-2-zhangyi@everest-semi.com>
X-Cookie: Piece of cake!


--2RcurHqlU3yjicMN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 11, 2026 at 09:28:08PM +0800, Zhang Yi wrote:
> Add private members related to HPF.
> Add Kcontrol for HPF

> +static int es8326_hpf_set(struct snd_kcontrol *kcontrol,
> +	struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
> +	struct es8326_priv *es8326 = snd_soc_component_get_drvdata(component);
> +	u32 freq;
> +	bool hpf;
> +
> +	if (ucontrol->value.integer.value[0] > 1020)
> +		return -EBUSY;

Sorry, should have mentioned last time - value is signed here so you
should also check for less than 0.

> +	es8326->hpf_freq = ucontrol->value.integer.value[0];
> +	if (es8326->capture_rate) {
> +		freq = (ucontrol->value.integer.value[0] * 48000) / es8326->capture_rate;
> +
> +		hpf = find_best_hpf_freq(freq, &es8326->hpfl, &es8326->hpfr);
> +		if (!hpf)
> +			return -EBUSY;

Since this can fail it might be best to move the assignment above to
the end of the function so we don't update the value if we get an error.

> +	} else {
> +		dev_dbg(component->dev, "PCM_STREAM_CAPTURE is not active.retain the input frequency\n");

dev_dbg_ratelimited().

> +	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
> +		es8326->capture_rate = params_rate(params);
> +		freq = (es8326->hpf_freq * 48000) / params_rate(params);
> +		hpf = find_best_hpf_freq(freq, &es8326->hpfl, &es8326->hpfr);
> +		if (!hpf) {
> +			dev_err(component->dev, "The HPF frequency is invalid\n");
> +			return -EINVAL;
> +		}
> +	}

We need a lock that protects against concurrent writes to the control.

--2RcurHqlU3yjicMN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqkJVYACgkQJNaLcl1U
h9AMvwf/UN3GhiQ40tZV23I+64DY3hwglBCKTfAY6qrzhEyqLSz3DiTXQ1jjV3Tg
E0yu9J3BUrOoDhlgfEAKz0P05W2/5vwiXGqRFMa5He5GeIqJ0WwM7hRMbzjjwihG
Ih67JestBKkOc/m4lEEld4jTrGnhtnBz4w4iDI5WjgnxmXaAsJNGs4PmMWzYsjyc
D6qO5ILD1mfCyV/CwY7uf5Mp+ZnNekenUc14JRyK1aeIbNJe3yJsTBRgE2hCJEGB
CuvqsW+f5nb4nLuxbg27g7yBREWA8sNu0f18+Dn01mAjGVeVyNiJQtSXW6MJ/nQ5
W0Rig6JTTDlwrtAtIMfMrLVljmvNvg==
=nhAv
-----END PGP SIGNATURE-----

--2RcurHqlU3yjicMN--
