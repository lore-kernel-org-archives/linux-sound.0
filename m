Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE8C2BDC26;
	Wed, 10 Jun 2026 16:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781107223; cv=none; b=tlJEm1aM081b8SciBYIRDTuDCSIgWQOaRBi9J31gLKWfDWMICT0mx5RE6LsYS917CC/3I7FTIaPpKO3CdSCg0I6LKN8Sa2W8I6qUrVSDiNFtmE+kKCtRCEXrKjBazRBy4MXFEkoo3ByN6KrPsp1cy8sMUBkqBsEngJogSRMqy2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781107223; c=relaxed/simple;
	bh=K0bDbQZxegyrSrLF4f07upIekG02unWyvcaK7VVHm9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NwjDjDN0jHTZafZkI0e1kDs3zTRdYAV48ErbiZa87OjOj9FRmzwm0QBkA+bV84VhCIoioNS0SLKviDQjynJBG8bg7ha5VRBCg4jFUL8rxADX+/6yBRc1lw7oGpTzhlL9gBpP7w6lHDCJezhM2Qw00DB5tbgGOcY4A7Hlp6hZJRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jBb0gE7n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jBb0gE7n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C78411F00899;
	Wed, 10 Jun 2026 16:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781107222;
	bh=Juc3OZmiBwnmfTAKFFzFac5n3pEoZgwwSgCuFvAQ7DI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jBb0gE7nNdWFLeIhKS2Bzw8Ldh14IjaZbeETYfhcV0S0DuQI9+Xk/5v9WUsZX0bKE
	 MvZ7XCXoYr/bPpGrgwoIhbJubvDwRfchTZmg0iNyVHW3TX1E5Nx/td2z2t9rWauY3x
	 r5tzyfQqMq5px11SbHvV4gcOS6SrLYdonPDH1FJibmiO1YK0Q23nRqy3C1JKwpn6NK
	 bSgbaIoADOfnKplIs4o5u4Pk+j1zfHcz2UdA27lEEdUwqGyRKkc7Ad9Twne3Ceifpm
	 4Q+z3ALJ0FQbijtOUip2R3ZIw8L7wFvGuf0MBvmb/RG/08OjhvP9mXOzNc5iIM3/9Q
	 H6I/5ZC7cAS5g==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 016331AC56C5; Wed, 10 Jun 2026 17:00:18 +0100 (BST)
Date: Wed, 10 Jun 2026 17:00:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: qcom: x1e80100: Allow userspace WSA RX channel map
 override
Message-ID: <aimKEkWqIG5ml1st@sirena.co.uk>
References: <20260610-sound-qcom-x1e80100-allow-ucm-channel-map-v1-1-9339724994f5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+fK4VocHJ9w0veOQ"
Content-Disposition: inline
In-Reply-To: <20260610-sound-qcom-x1e80100-allow-ucm-channel-map-v1-1-9339724994f5@oss.qualcomm.com>
X-Cookie: Leave no stone unturned.


--+fK4VocHJ9w0veOQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 10, 2026 at 02:16:04PM +0300, Abel Vesa wrote:

> The WSA RX slot mapping is currently computed entirely from the channel
> count in .prepare() and pushed unconditionally via
> snd_soc_dai_set_channel_map(). Userspace has no way to express a different
> channel map, so any map defined in UCM is ignored.

> Add a writable "Playback Channel Map" control on the WSA RX PCM via
> snd_pcm_add_chmap_ctls() and make it writable. The map selected by
> userspace (SNDRV_CHMAP_*) is stored per AFE port and, at .prepare()
> time, translated into the q6 PCM_CHANNEL_* slots and programmed into the
> DSP.

> When userspace has not provided a full map, the previous default
> mapping is used, so existing behaviour is preserved.

> +static int x1e80100_chmap_ctl_put(struct snd_kcontrol *kcontrol,
> +				  struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_pcm_chmap *info = snd_kcontrol_chip(kcontrol);
> +	struct snd_soc_pcm_runtime *rtd = info->pcm->private_data;
> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> +	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
> +	unsigned int *map = data->user_chmap[cpu_dai->id];
> +	int i;
> +
> +	for (i = 0; i < info->max_channels; i++) {
> +		unsigned int pos = ucontrol->value.integer.value[i];
> +
> +		/* Validate every requested non-unset position up front. */
> +		if (pos && x1e80100_chmap_to_q6(pos) < 0)
> +			return -EINVAL;
> +
> +		map[i] = pos;
> +	}
> +
> +	return 0;

This should return 1 if the value changed.

> @@ -34,6 +125,9 @@ static int x1e80100_snd_init(struct snd_soc_pcm_runtime *rtd)
>  	switch (cpu_dai->id) {
>  	case WSA_CODEC_DMA_RX_0:
>  	case WSA_CODEC_DMA_RX_1:
> +		if (!rtd->pcm)
> +			return 0;
> +
>  		/*
>  		 * Set limit of -3 dB on Digital Volume and 0 dB on PA Volume
>  		 * to reduce the risk of speaker damage until we have active

This hunk seems unrelated, I can't see anything about it in the commit
log either?  I'm a bit confused about what this aims to achieve, I've
not checked which it is but either we should always have created the
PCMs here or we will never have created the PCMs here, it's weird that
this might vary.

--+fK4VocHJ9w0veOQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmopihIACgkQJNaLcl1U
h9AnBAf+MHpI6sUrdSTCeFCXkbwIvJI1eaxUuI0cs9qFLe+3MlTmkl2ma24aSGpA
RBFMkjoPG+jXmebV9Ii4YWQCbSU/jAvBiNMwjzZmjzv9M5sgDq00LP4LdMSKl4Bj
AJfOMd/CqBEmV/zsgJq7fNfvYsxEufcQaz79/6KJnk02tgM+A1PiYaV8kLRDK/4K
je02AX8psg+k0nZZNl2lV8FgWl+FNBaARlVV6ZLp4KFQrcBA12EAYPzq9jzvQSeY
JyrXqPgxQWqXnp9WLZUAEujmmU1Wf0Z9yrifGHq8KI3yqi028u/byraVKu+7/xxP
+5lmCLg0kkZ5jwjhW0YDrm9CyJ9LBw==
=vJcA
-----END PGP SIGNATURE-----

--+fK4VocHJ9w0veOQ--
