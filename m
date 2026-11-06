Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793963468;
	b=sOns8FQz5/p+Xw58cwSUYFVovRc3JaMzy9U3PKqP5dPGJ7y5nHmSDBfjYVlPbvKumske
	 Xff4wHYd0qYYe12NVbO1JtxETnYYybOZZhxdeBk+bylDIe6e86pBiPN8y6H48mVr77Yhl
	 EEC1ZIQte+KtYS01Y2cqxZUvxFv08+7XPah1JoBMeX5oqk0D8eKIh/X5/GlfqmGj2Hhfc
	 lJSSyjFn+F7de+sli+RpCDjU0hpZej4rl3wTLDt6WpZM7UCIIPPgaM6IKxowIYR6R9HRa
	 zxxWLSjDnSMlm0xjaxD3eZuuOK286g5KeX/JvpO0iu6yAaQlyraQypS6JIERUNQWavA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793963468;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=04JNpn6MkvJfLD57bB0zOEm0p2RG76ittvWRrz6OcGA=;
	b=GnX5CL43MGe/T6bfC0EuJHWZ944QoaZjFRkW+a/C7duDiJZ5OrH75JcmUAaNDbDcpXtR
	 qr6/yQAN2yrj8niV/0Wv2aC1l77DK778/xBYPKZG5XKxcXMv4oDHUhz6N7EqbqV5qeBEg
	 Qy3SzwzQifGPyfLsM2x6pe5E3THdnjfAi+Wec35Pv3Hpwt/k7/sDD2UuIIT72t33YqPJe
	 1j1yNgV8MpFda6/YnlCIIXOrWcAvPzFPLUmqVOKeWkFsIIUGnmCFCA6FRtUK3my9z5Rnz
	 ozbRe5KYnlyMYK6mPQYNN3l2UVdRtipE2XdAL+dUkmW+dC3wzlcr5H67xDp3WH2OL5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EJFzx1bS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E3D606A329;
	Fri,  6 Nov 2026 11:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EJFzx1bS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC3091F0089F;
	Fri,  6 Nov 2026 11:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793963467;
	bh=04JNpn6MkvJfLD57bB0zOEm0p2RG76ittvWRrz6OcGA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EJFzx1bSuaQT8jMj0HprCrvZtD7HfkqyCu8BAqRVeIISjooCSGndg1V//m9tszk2+
	 a1nGo5C1HxcYPViXF1KWhaymR7nViSB5SB5rwUA4l6lp1ul8CGb3PgwDVEYpEFPI0a
	 u1pU/acI2Ao90QpeXu5As34or8sxUELVtn6KUgPYbc4ICk9N2ia+kgL7eMp9Js+nvm
	 Gy6SVjKqHNm7X+G/tdruqblPyhzO0x0qmrFRkuEicjLGVRRXngWWajdIaoMu6jypcp
	 jL/5JJOYYsr2TGWuEWEK4pkL+7Mau0r2YBb51AVQjboK/4XV+ygVne03APOc6DXnhw
	 dxNROhdd5y1Nw==
Message-ID: <sashiko-outbox-201269@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/4] ASoC: cdns: Add Cadence I2S-MC controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: joakim.zhang@cixtech.com
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261106105208.1246554-5-joakim.zhang@cixtech.com>
References: <20261106105208.1246554-1-joakim.zhang@cixtech.com>
 <20261106105208.1246554-5-joakim.zhang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 11:11:07 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] ASoC: cdns: premature -EBUSY in cdns_i2s_mc_hw_params() when
  peer DAI is open
- [Low] ASoC: cdns: i2s-mc: un-gated data pin clocks in
  cdns_i2s_mc_dai_probe()
--

commit 020a5d5318e146daa2dd788c38c07f592ec9d4bb
Author: Joakim Zhang <joakim.zhang@cixtech.com>

ASoC: cdns: Add Cadence I2S-MC controller driver

This commit adds an ASoC driver for the Cadence I2S-MC multi-channel
controller in the CIX SKY1 audio subsystem.

> diff --git a/sound/soc/cdns/cdns-i2s-mc.c b/sound/soc/cdns/cdns-i2s-mc.c
> new file mode 100644
> index 0000000000000..5bbac98101449
> --- /dev/null
> +++ b/sound/soc/cdns/cdns-i2s-mc.c
> @@ -0,0 +1,1152 @@

[ ... ]

> +static bool cdns_i2s_mc_other_dai_active(struct snd_soc_dai *cpu_dai)
> +{
> +	struct snd_soc_dai *dai;
> +
> +	for_each_component_dais(cpu_dai->component, dai) {
> +		if (dai =3D=3D cpu_dai)
> +			continue;
> +		if (snd_soc_dai_active(dai))
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +static int cdns_i2s_mc_hw_params(struct snd_pcm_substream *substream,
> +				 struct snd_pcm_hw_params *params,
> +				 struct snd_soc_dai *cpu_dai)
> +{
> +	struct cdns_i2s_mc_priv *i2s_mc_priv =3D snd_soc_dai_get_drvdata(cpu_da=
i);
> +	struct device *dev =3D i2s_mc_priv->dev;
> +	u32 rate, sample_rate =3D 0;
> +	u32 slots, slot_width, resolution, ctrl;
> +	unsigned long i2s_clk_rate;
> +	u8 pin_tx_num, pin_rx_num;
> +	struct clk *clk_parent;
> +	bool is_master_mode;
> +	int ret;
> +
> +	rate =3D params_rate(params);
> +	slot_width =3D i2s_mc_priv->devtype_data->data_width;
> +	dev_dbg(dev, "rate =3D %d, slot_width =3D %d\n", rate, slot_width);
> +
> +	/* switch clk mux to select the appropriate clk parent */
> +	if (rate % 8000 =3D=3D 0) {
> +		/* Sampling rate is a multiple of 8KHz, select "audio-clk0" */
> +		clk_parent =3D i2s_mc_priv->clks[AUDIO_CLK0];
> +	} else if (rate % 11025 =3D=3D 0) {
> +		/* Sampling rate is a multiple of 11.025KHz, select "audio-clk2" */
> +		clk_parent =3D i2s_mc_priv->clks[AUDIO_CLK2];
> +	} else {
> +		dev_err(i2s_mc_priv->dev, "Invalid sample rate\n");
> +		return -EINVAL;
> +	}
> +
> +	if (cdns_i2s_mc_other_dai_active(cpu_dai) &&
> +	    !clk_is_match(clk_get_parent(i2s_mc_priv->clk_i2s), clk_parent)) {
> +		dev_err(dev,
> +			"i2s clock parent conflicts with active stream on the other DAI\n");
> +		return -EBUSY;
> +	}

[Severity: High]
Does checking snd_soc_dai_active(dai) here cause cdns_i2s_mc_hw_params() to
fail with -EBUSY whenever both playback and capture substreams are opened
before hw_params is configured?

__soc_pcm_open() increments the DAI active count via
snd_soc_runtime_activate() at open time and keeps it non-zero across
soc_pcm_hw_free() until close.  When an audio server opens both playback
and capture PCM substreams before calling snd_pcm_hw_params() on either,
both DAIs are already marked active; if the requested rate requires
switching clk_i2s to the other parent clock, cdns_i2s_mc_hw_params()
rejects both streams with -EBUSY.  Should cdns_i2s_mc_other_dai_active()
check whether the peer DAI actually has hardware parameters configured (for
example via snd_soc_dai_get_symmetric_rate(dai) or driver state tracked in
hw_params and hw_free) instead of snd_soc_dai_active()?

[ ... ]

> +static int cdns_i2s_mc_dai_probe(struct snd_soc_dai *cpu_dai)
> +{
> +	struct cdns_i2s_mc_priv *i2s_mc_priv =3D snd_soc_dai_get_drvdata(cpu_da=
i);
> +	u32 ctrl =3D 0, cid_ctrl =3D 0;
> +
> +	/*
> +	 * Transceiver disable
> +	 * Transceiver clock disable
> +	 * All interrupts masked
> +	 * Reset for transmitter synchronizing unit
> +	 * Reset for receiver synchronizing unit
> +	 */
> +	ctrl |=3D FIELD_PREP(I2S_CTRL_I2S_EN, 0);
> +	ctrl &=3D ~(I2S_CTRL_TSYNC_RST | I2S_CTRL_RSYNC_RST);
> +	cid_ctrl |=3D I2S_CID_CTRL_STROBE_TS | I2S_CID_CTRL_STROBE_RS;
> +	cid_ctrl &=3D ~I2S_CID_CTRL_INTREQ_MASK;
> +
> +	regmap_update_bits(i2s_mc_priv->regmap, I2S_CTRL,
> +			   I2S_CTRL_I2S_EN | I2S_CTRL_TSYNC_RST | I2S_CTRL_RSYNC_RST, ctrl);
> +	regmap_update_bits(i2s_mc_priv->regmap, I2S_CID_CTRL,
> +			   I2S_CID_CTRL_STROBE_TS | I2S_CID_CTRL_STROBE_RS |
> +			   I2S_CID_CTRL_INTREQ_MASK, cid_ctrl);

[Severity: Low]
Should cdns_i2s_mc_dai_probe() also set I2S_CID_CTRL_I2S_STROBE in
I2S_CID_CTRL to gate the per-pin clocks initially?

I2S_CID_CTRL resets to 0x00000000 (all clock strobes enabled), and
cdns_i2s_mc_rxtx_config() only clears and sets the I2S_CID_CTRL_I2S_STROBE
bits matching pin_tx_mask_adjust or pin_rx_mask_adjust, leaving unwired or
unused pins with their clock gates enabled.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106105208.1246=
554-1-joakim.zhang@cixtech.com?part=3D4
