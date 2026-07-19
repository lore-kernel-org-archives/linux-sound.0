Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150C627B4F7;
	Sun, 19 Jul 2026 19:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784487926; cv=none; b=QoIgRGLjyCra3pKqQGtUplA8ND+5lVXZuR3yhr049Pyvd2Jo8RIvnDaXEKOarz12+MSNXQmDfHd6wwAdu/PMRUrO/ubNyTlNYO0QxFtmG2Oly5LVLaXdE8ccT1XVcgAtpyjGhWS+zlIdcEGEqc2IevOiAMGp8pLMG0grIAR143k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784487926; c=relaxed/simple;
	bh=UjNGwV6X6Ee4IIr5vJ/ucxQFBpbRIKdeOD7NbBUnRBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IvHU4n/XHpf0thPmWUBNoLu7BBgEvShxVB0vrZ5JIB1rzOaW95Dej0XamDqITUcbOrOoLx6538r+q9U2NLjhdJF2CDjigEdeg0bkY8eUrMjibhMEmJT45dz4GBBCzbxuawLhy7QL2rdlgNA5gCpBpcoYQoOQYXr1vzrD1SRrPYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fS0sMdQL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fS0sMdQL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F8EE1F000E9;
	Sun, 19 Jul 2026 19:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784487924;
	bh=NuEx5IO0hfsFaxuOKrYc1dtYQmdvVEcNNyzH04R5Kiw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fS0sMdQLHgZ2CcVz778TGjmYUsckuxHxSr+TNM8F1THJ6AZRO3z5FLiEDL5hzrcMc
	 HqnN7txln9R/XkcuZdTr3YyYwB8dG2y4KWZDpMn20Q6CZAJq8sTw2cF6vqAYMOMIGY
	 s6AqHvgkJ2vE/l0TdZyadn+mK446+PQFBBeSAMOd0l7QYj9GzXC1GNcK1Hd43C/06x
	 jUYFY/ul7ZNchcpnw0pQ7MRTXfoHs/Xm0auoDoVmbrZzZlKVi7OMRCxD1n6WbjEqJ7
	 c1J/cbjqCjrNWUmtdzjCRDTo0PLX6ziYSf/1Sv3zGMZuhbyYY9X3MMLEZo6oAKVurI
	 A4SS35+LQE8Xw==
Date: Sun, 19 Jul 2026 20:05:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Gianluca Boiano <morf3089@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, "Wang, Sen" <sen@ti.com>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] ASoC: codecs: add TAS2557 mono smart amplifier
 driver
Message-ID: <de369f10-e7c6-4528-aa57-56241bf700b3@sirena.org.uk>
References: <20260717233402.414326-1-morf3089@gmail.com>
 <20260717233402.414326-3-morf3089@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oxmBckQ0O84Mzxol"
Content-Disposition: inline
In-Reply-To: <20260717233402.414326-3-morf3089@gmail.com>
X-Cookie: Courage is grace under pressure.


--oxmBckQ0O84Mzxol
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jul 18, 2026 at 01:34:00AM +0200, Gianluca Boiano wrote:

> The TAS2557 is a mono Class-D smart amplifier with an on-chip DSP for
> speaker protection. Audio is received over I2S/TDM (ASI) and processed
> by DSP firmware before reaching the Class-D output stage.

> +static const unsigned int tas2557_startup_data[] = {
> +	TAS2557_GPI_PIN_REG,              0x15,	/* enable DIN, MCLK, CCI */
> +	TAS2557_GPIO1_PIN_REG,            0x01,	/* enable BCLK (ASI1) */
> +	TAS2557_GPIO2_PIN_REG,            0x01,	/* enable WCLK (ASI1) */
> +	/* ASI2 GPIO wiring; arm the BCLK source (GPIO5) before its dividers */
> +	TAS2557_GPIO6_PIN_REG,            0x01,	/* GPIO6 = ASI2 WCLK input */
> +	TAS2557_GPIO8_PIN_REG,            0x02,	/* GPIO8 = ASI2 DIN */
> +	TAS2557_GPIO5_PIN_REG,            0x01,	/* GPIO5 = ASI2 BCLK input */

This looks awfully board specific....

> +static int tas2557_dev_bulk_write(struct tas2557_priv *tas2557, unsigned int chn,
> +				  unsigned int reg, const u8 *data, size_t len)
> +{
> +	int ret;
> +
> +	/* The chip auto-increments past reg 0x7f into the page register */
> +	if (TAS2557_PAGE_REG_ADDR(reg) + len > 128)
> +		return -EINVAL;

I didn't check but is there room for sharing code with the other
multi-book TI devices?

> +static int fw_parse_header(struct tas2557_priv *tas2557,
> +			   struct tas2557_firmware *fw,
> +			   const u8 *data, size_t size)
> +{

> +	fw->device = get_unaligned_be32(data); data += 4;
> +	if (fw->device != TAS2557_FW_DEVICE_MONO &&
> +	    fw->device != TAS2557_FW_DEVICE_STEREO) {
> +		dev_err(tas2557->dev,
> +			"unsupported device %u in firmware (expected 2=mono or 3=stereo)\n",
> +			fw->device);
> +		return -EINVAL;
> +	}

The tas2781 checks to see if there are one or two devices being
controlled by the driver and rejects a mismatch.  Also, is there some
overlap in firmware formats here?  Again I didn't actually check.

> +static int tas2557_set_program(struct tas2557_priv *tas2557,
> +			       unsigned int prog_idx, int config_idx)

> +	/* Load PLL configuration for this config (firmware-driven) */
> +	if (config->pll < fw->num_plls) {
> +		ret = tas2557_load_pll(tas2557, config->pll);
> +		if (ret < 0)
> +			return ret;
> +	}

Shouldn't an out of range value be an error?

> +static int tas2557_enable(struct tas2557_priv *tas2557, bool enable)
> +{

> +	} else if (!enable && tas2557->powered) {
> +		ret = tas2557_load_data_all(tas2557, tas2557_shutdown_data);
> +		if (ret < 0)
> +			dev_err(tas2557->dev, "shutdown failed: %d\n", ret);
> +
> +		tas2557->powered = false;
> +		tas2557->dac_muted = true;
> +		tas2557->sense_muted = true;
> +
> +		dev_dbg(tas2557->dev, "amplifier group powered off\n");
> +	}

Does sense_muted get handled properly for suspend?  The core mutes and
unmutes playback streams over suspend but not capture.

> +static int tas2557_hw_params(struct snd_pcm_substream *substream,
> +                            struct snd_pcm_hw_params *params,
> +                            struct snd_soc_dai *dai)

> +       /* Commit cached stream state now the hardware writes have succeeded */
> +       tas2557->sample_rate = rate;
> +       tas2557->wordlength = wordlength;

This won't actually take effect if the device doesn't power down - you
should probably not set use_pmdown_time to force a power down/up, though
that's annoying when the configuration is the same.

--oxmBckQ0O84Mzxol
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpdH+4ACgkQJNaLcl1U
h9Aj1wf/QvZks+ZBhOnKUZ62Iir49WjJTgw/TZhOZV6G2dpBbaKEo+787jjgkJb/
bX7umhA4h3lPoS5TcZvDjTyg4ybEmT+8JdT4Lq4nThdMtr23DFDer8z2Kn6I1ezi
LIPsXKLa2FtpfydbOR4CUa4dycTkJV+MW3qeWWbdC/NiqUzK51dF5sj6MlZzfpjl
oIqK1ydfIK9o85+g9PQdWEIhp9q7TyR29Hi39YnF8ApJZ37VfhOAyiGDcWtgXnQw
npck348pPEjtstrmfV2D/QFzKx1/DEXh0VJJFhO86DvffF/opjEg6g+kgiWtWUEI
cBzChwoDBSh8tV8PW0G24wzpXBFbyg==
=TGcm
-----END PGP SIGNATURE-----

--oxmBckQ0O84Mzxol--
