Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793046948;
	b=GRB+kNgl5Nx+QcMjRTcmd1SBJYUKjHdjmxEHzpJ0biUeZ74FMtZ70U8ZcPP/bsshYF+0
	 6GWqvV82jwFz3IIC3cYjpOGxKjNyr0/vSKWV7Oar+PH5KNIe6izccJS65iAScI2nJO4/u
	 li3EleueG796HrqYKnEPEGmJbEmigEpXtKA03aqdEi2YMfsb/dWrvHye6FnOtdik7mIhf
	 kPM7QQ3naFHTxzwp2b6jz3o9ntaKXfL+7vw9/Y0341Jz9AJyhh9ZngHiGWFSC6W5+R/Vv
	 Qw75cWVBO7zFQrxkjVVWjXMm8QHtiTSD6Y3CkmYyXlO+dDNqAIrX9/DaPLvol0Lxv7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793046948;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=2hPAQhe4MvqztirCgp00Mx77xY1LFDG4m3TpyBKCQEA=;
	b=EMjXDOdWg+Z1Pspx725WQYwqiT5JLQQsTkj318m/3DgdHFQJx+SsiAv62z+0P70sXd3p
	 7wMLDjsrGmGl+p/fCwTENiUJ9SarDn1wsZQlwJprTG/oqoQt7q7ttsnZ8Q2W30UeSgeb3
	 lgWZFYVBGdXXwDyKLX4/nH8fZZQR/F8XdjRsu+K6EEccZNROUMq2CPWuHTiu5plQzXzr5
	 F3AeAaB6cymVHBSXt+EwsfQcvoxPTGmQb3ki+4TUZXaQ1wDHjOcvJLkE1IjJmIKp7RjuY
	 xokrt9RMlFx7Auhb3mganvKzQB/bOoxYD9K+mbxm8BuFAWeMJWAmEdPjVn/ZshStAYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jw1JLrwt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2903606A31A;
	Mon, 26 Oct 2026 20:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jw1JLrwt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 363FF1F01825;
	Mon, 26 Oct 2026 20:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793046947;
	bh=2hPAQhe4MvqztirCgp00Mx77xY1LFDG4m3TpyBKCQEA=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=jw1JLrwttBsE7o7h8TEbCS/rz2cDvnG5I8sk/V1nPI0yBKLS15ZUYmQljIjMBFer1
	 5/MfBNTEXJhzTIb/znm2jH4CJoqur80nlBfnreC0YA0EsbQkf385RIEgdXCfj/3KD7
	 u9D6Eo662G8qel7zlRmFhzTcJqiguklClOmSxdpDFjDfleJhs1ZxDK7r2uiv5ziIbk
	 XKD+u9W1aABenw7mUcSBhx78CGuPMyySIt8pYWExIj7R9CWsjs8i7C35aEKZ4bv5N0
	 w09Mwu4iRxgJkTTAKL3VzL34MiuIRF/2acZnCMsgLY752YbDwbPXhT17Os/oIpQZUS
	 eq1B66rax+UcQ==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 2BBF51F2857B;
	Mon, 26 Oct 2026 20:35:34 +0000 (GMT)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v1 2/2] ASoC: codecs: nau8310: Add support for NAU83G10
 amplifier
From: Mark Brown <broonie@kernel.org>
To: Neo Chang <YLCHANG2@nuvoton.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, 
 robh@kernel.org, krzk+dt@kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org, 
 neo.chang70@gmail.com, kchsu0@nuvoton.com, sjlin0@nuvoton.com
In-Reply-To: <20261022084037.259983-3-YLCHANG2@nuvoton.com>
References: <20261022084037.259983-1-YLCHANG2@nuvoton.com>
 <20261022084037.259983-3-YLCHANG2@nuvoton.com>
Date: Mon, 26 Oct 2026 20:35:33 +0000
Message-Id: <179304693306.199157.5210648249546181520.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2845; i=broonie@kernel.org;
 h=from:subject:message-id; bh=oeSuQFkadcgGkEWdZIUiMxB0zeLYf4fgpoShtipJD9k=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLu75xaEei6/Ij9islBYltc2mWZio2Ul7LflfoZVVSuN
 vmzEm98RykLgxgXg6yYIktcFvfL+pLXa/gOLmyDmcPKBDKEgYtTACZSc53hn9aMUKFVkzvM716f
 fe5Zir5R0tdZLWcdLfvu/7zHuPdS1DqG/zH+H3Qf6yz3+JP+IXueLdej9BTPFX9lVgmmPtLanrJ
 qGQMA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> Add support for the Nuvoton NAU83G10 audio amplifier.
> The NAU83G10 is a mono boost Class-D audio amplifier with
> integrated DSP and I/V-sense support.

>  	imply SND_SOC_MT6660
>  	imply SND_SOC_NAU8315
>  	imply SND_SOC_NAU8325
> +	imply SND_SOC_NAU8310

Please keep these sorted, same in other places like Makefile.

> +static void nau8310_send_data_payload(struct snd_soc_component *cp,
> +	unsigned short dsp_addr, const void *param_data, int param_size,
> +	int *frag_cnt, int *padding)
> +{
> +	const u8 *data = (const u8 *)param_data;
> +	u32 payload = 0;
> +	int i, data_size = 0;
> +
> +	for (i = 0; i < param_size; i++) {
> +		payload |= data[i] << (data_size * 8);

data[i] will be promoted to int which won't DTRT for values with the top
bit set, cast to u32 before shifting.

> +	struct snd_soc_component *cp = snd_soc_dapm_to_component(w->dapm);
> +	struct nau8310 *nau8310 = snd_soc_component_get_drvdata(cp);
> +	int ret = 0;
> +
> +	if (SND_SOC_DAPM_EVENT_ON(event)) {
> +		ret = nau8310_dsp_exec_command(cp, NAU8310_DSP_CMD_CLK_RESTART,

This needs to take nau8310->lock to avoid races with firmware load.

> +	dev_info(dev, "Algorithm of DSP is ready, status %x", status);

dev_dbg(), this will get run a lot.

> +	dev_dbg(dev, "Request firmware and wait until finish.");
> +	ret = request_firmware(&fw, NAU8310_DSP_FIRMWARE, dev);

We have a firmware-name in the binding, shouldn't we use it?

> +err_loaded:
> +	regmap_update_bits(regmap, NAU8310_R13_MUTE_CTRL, NAU8310_SOFT_MUTE, 0);

Shouldn't we leave things muted?

> +static int nau8310_clkdet_put(struct snd_kcontrol *kcontrol,
> +	struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct soc_mixer_control *mc =
> +		(struct soc_mixer_control *)kcontrol->private_value;
> +	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);

This isn't a DAPM control, we can't use this lookup.

> +static int nau8310_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
> +{
> +	struct snd_soc_component *component = dai->component;
> +	struct nau8310 *nau8310 = snd_soc_component_get_drvdata(component);
> +	struct regmap *regmap = nau8310->regmap;
> +	unsigned int ctrl1_val = 0, ctrl2_val = 0;
> +
> +	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {

SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK.

> +static int nau8310_switch_internal_osc(struct snd_soc_component *cp)
> +{
> +	struct nau8310 *nau8310 = snd_soc_component_get_drvdata(cp);
> +	int ret;
> +
> +	/* For internal Ring OSC, the default fs apply to 48kHz */
> +	nau8310->fs = NAU8310_DEFAULT_SAMPLE_RATE;

This will overwrite anything set_sysclk() set, since we call this from
_shutdown() and _resume() we're relying on the machine driver
reconfiguring the clocks when starting streams.

-- 
Mark Brown <broonie@kernel.org>
