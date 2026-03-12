Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA8E398900
	for <linux-sound@vger.kernel.org>; Thu, 12 Mar 2026 04:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773290657; cv=none; b=mNZ+/hXXGXpPfCvDGFDe/uQrq/XUYhVO5ViEPYZ0YGGwHsKghxJOs3Z0/RCRYnjyLEpaKVby5vOZ+SL7DgqfYmUZYYrISjP6gqqWTcwOa6UXIIungcki3oMsA9Zje6Pobw0w0wiKahR1uY5weO2xWpgLBDk0LPZ83Hh5fDivK2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773290657; c=relaxed/simple;
	bh=uIPFTI3p2+j6BLRarm5FiW+jUkDkHDB4dOSDMF+ZGHc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a7p16GHzr83ybcsDYTHmwdxoajT1uUYRS09J68qJmM6ECdq9WlvtoxVybiLGKy7G7we/bevZARD5XXch9/ZhXI5ZBQi8X3LCaZf8z2VT0B47/sVq4qfSM1AB+4ygsjmoVwWfAiHrjyOPpK6HCYcyVi8scsE4MvSlRz20XT+0y/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rXGeYUTQ; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rXGeYUTQ"
Message-ID: <a36ce413-5aff-4117-bc76-95801ce1fd3b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773290654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZX63Vie/dEp8wxTtKr7TnHNseyR/AUWUQJV+nt6ZUoQ=;
	b=rXGeYUTQZAZ3kOxrxxzNRlu4Vc8XoayGhtvaVETulqSQD2frX7XSt/z4xzr0kPowRu+uI8
	Ev1FGZXvsSc71WYAzM2XhtHejG7UdL+LwiTP8K0AMMSK/8Jtg67RzEJjvwXgN1K8guVsKC
	4CzpF4Ax3wFrRMEPnz1zGTw7acaYTLk=
Date: Wed, 11 Mar 2026 21:14:59 -0700
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 4/6] ASoC: es9356-sdca: Add ES9356 SDCA driver
To: Zhang Yi <zhangyi@everest-semi.com>, broonie@kernel.org, tiwai@suse.com,
 linux-sound@vger.kernel.org
Cc: peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
References: <20260226073534.3347-1-zhangyi@everest-semi.com>
 <20260226073534.3347-5-zhangyi@everest-semi.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260226073534.3347-5-zhangyi@everest-semi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

> +static void es9356_pde_transition_delay(struct es9356_sdw_priv *es9356, unsigned char func,
> +	unsigned char entity, unsigned char ps)
> +{
> +	unsigned int delay = 1000, val;
> +
> +	pm_runtime_mark_last_busy(&es9356->slave->dev);
> +
> +	/* waiting for Actual PDE becomes to PS0/PS3 */
> +	while (delay) {
> +		regmap_read(es9356->regmap,
> +			SDW_SDCA_HCTL(func, entity, ES9356_SDCA_CTL_ACTUAL_POWER_STATE, 0), &val);
> +		if (val == ps)
> +			break;
> +
> +		usleep_range(1000, 1500);

this is a delay

> +		delay--;

and this isn't a delay, it's a loop/iteration counter.

> +	}
> +	if (!delay) {
> +		dev_warn(&es9356->slave->dev, "%s PDE to %s is NOT ready", __func__, ps?"PS3":"PS0");

it's a constant discussion on this list to figure out if dev_warn() is really useful. I don't think it is.
You also have a number of dev_err() that will likely pollute the logs without giving the user much information.
dev_dbg() is more useful for developers IMHO.


> +static int es9356_sdw_pcm_hw_params(struct snd_pcm_substream *substream,
> +				    struct snd_pcm_hw_params *params,
> +				    struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_component *component = dai->component;
> +	struct es9356_sdw_priv *es9356 = snd_soc_component_get_drvdata(component);
> +	struct sdw_stream_config stream_config = {0};
> +	struct sdw_port_config port_config = {0};
> +	struct sdw_stream_runtime *sdw_stream = snd_soc_dai_get_dma_data(dai, substream);
> +	enum sdw_data_direction direction;
> +	int ret, num_channels;
> +	unsigned int rate;
> +
> +	if (!sdw_stream)
> +		return -EINVAL;
> +
> +	if (!es9356->slave)
> +		return -EINVAL;
> +
> +	/* SoundWire specific configuration */
> +	snd_sdw_params_to_config(substream, params, &stream_config, &port_config);
> +
> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> +		port_config.num = dai->id;
> +	} else {
> +		port_config.num = dai->id;
> +	}

looks like a useless test to me if both branches do the same thing?
Consider using a static checker for stuff like this...

> +
> +	ret = sdw_stream_add_slave(es9356->slave, &stream_config,
> +				   &port_config, 1, sdw_stream);
> +	if (ret)
> +		dev_err(dai->dev, "Unable to configure port\n");
> +
> +	switch (params_rate(params)) {
> +	case 16000:
> +		rate = ES9356_SDCA_RATE_16000HZ;
> +		break;
> +	case 44100:
> +		rate = ES9356_SDCA_RATE_44100HZ;
> +		break;
> +	case 48000:
> +		rate = ES9356_SDCA_RATE_48000HZ;
> +		break;
> +	case 96000:
> +		rate = ES9356_SDCA_RATE_96000HZ;
> +		break;
> +	default:
> +		dev_err(component->dev, "%s: Rate %d is not supported\n",
> +			__func__, params_rate(params));
> +		return -EINVAL;
> +	}
> +
> +	if (dai->id == ES9356_DMIC)
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_HCTL(FUNC_NUM_MIC, ES9356_SDCA_ENT_CS113, ES9356_SDCA_CTL_SAMPLE_FREQ_INDEX, 0), rate);
> +	if (dai->id == ES9356_AMP)
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_HCTL(FUNC_NUM_AMP, ES9356_SDCA_ENT_CS21, ES9356_SDCA_CTL_SAMPLE_FREQ_INDEX, 0), rate);
> +	if ((dai->id == ES9356_JACK_IN) | (dai->id == ES9356_JACK_OUT)) {
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_HCTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_CS41, ES9356_SDCA_CTL_SAMPLE_FREQ_INDEX, 0), rate);
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_HCTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_CS36, ES9356_SDCA_CTL_SAMPLE_FREQ_INDEX, 0), rate);
> +	}
> +	return ret;
> +}

> +static void es9356_register_init(struct es9356_sdw_priv *es9356)
> +{
> +	regmap_write(es9356->regmap, ES9356_STATE, 0x02);
> +	regmap_write(es9356->regmap, ES9356_ENDPOINT_MODE, 0x24);
> +	regmap_write(es9356->regmap, ES9356_PRE_DIV_CTL, 0x00);
> +	regmap_write(es9356->regmap, ES9356_ADC_OSR, 0x18);
> +	regmap_write(es9356->regmap, ES9356_ADC_OSRGAIN, 0x13);
> +	regmap_write(es9356->regmap, ES9356_DAC_OSR, 0x16);
> +	regmap_write(es9356->regmap, ES9356_CLK_CTL, 0x0f);
> +	regmap_write(es9356->regmap, ES9356_CSM_RESET, 0x01);
> +	regmap_write(es9356->regmap, ES9356_CLK_SEL, 0x30);
> +
> +	regmap_write(es9356->regmap, ES9356_DETCLK_CTL, 0x51);
> +	regmap_write(es9356->regmap, ES9356_HP_TYPE, 0x10);
> +	regmap_write(es9356->regmap, ES9356_MICBIAS_CTL, 0x10);
> +	regmap_write(es9356->regmap, ES9356_HPDETECT_CTL, 0x07);
> +	regmap_write(es9356->regmap, ES9356_ADC_ANA, 0x30);
> +	regmap_write(es9356->regmap, ES9356_PGA_CTL, 0xa8);
> +	regmap_write(es9356->regmap, ES9356_ADC_INT, 0xaa);
> +	regmap_write(es9356->regmap, ES9356_ADC_LP, 0x19);
> +	regmap_write(es9356->regmap, ES9356_VMID1SEL, 0xbc);
> +	regmap_write(es9356->regmap, ES9356_VMID_TIME, 0x0b);
> +	regmap_write(es9356->regmap, ES9356_STATE_TIME, 0xbb);
> +	regmap_write(es9356->regmap, ES9356_HP_SPK_TIME, 0x77);
> +	regmap_write(es9356->regmap, ES9356_HP_DETECTTIME, 0xa4);
> +	regmap_write(es9356->regmap, ES9356_MICBIAS_SEL, 0x15);
> +	regmap_write(es9356->regmap, ES9356_KEY_PRESS_TIME, 0xff);
> +	regmap_write(es9356->regmap, ES9356_KEY_RELEASE_TIME, 0xff);
> +	regmap_write(es9356->regmap, ES9356_KEY_HOLD_TIME, 0x0f);
> +	regmap_write(es9356->regmap, ES9356_BTSEL_REF, 0x00);
> +	regmap_write(es9356->regmap, ES9356_KEYD_DETECT, 0x18);
> +	regmap_write(es9356->regmap, ES9356_MICBIAS_RES, 0x03);
> +	regmap_write(es9356->regmap, ES9356_BUTTON_CHARGE, 0x00);
> +	regmap_write(es9356->regmap, ES9356_CALIBRATION_TIME, 0x13);
> +	regmap_write(es9356->regmap, ES9356_CALIBRATION_SETTING, 0xf4);
> +
> +	regmap_write(es9356->regmap, ES9356_SPK_VOLUME, 0x33);
> +	regmap_write(es9356->regmap, ES9356_DAC_VROI, 0x01);
> +	regmap_write(es9356->regmap, ES9356_DAC_LP, 0x00);
> +	regmap_write(es9356->regmap, ES9356_HP_IBIAS, 0x04);
> +	regmap_write(es9356->regmap, ES9356_HP_LP, 0x03);
> +	regmap_write(es9356->regmap, ES9356_SPKLDO_CTL, 0x65);
> +	regmap_write(es9356->regmap, ES9356_SPKBIAS_COMP, 0x09);
> +	regmap_write(es9356->regmap, ES9356_VMID1STL, 0x00);
> +	regmap_write(es9356->regmap, ES9356_VMID2STL, 0x00);
> +	regmap_write(es9356->regmap, ES9356_VSEL, 0xfc);
> +
> +	regmap_write(es9356->regmap, ES9356_IBIASGEN, 0x10);
> +	regmap_write(es9356->regmap, ES9356_ADC_AMIC_CTL, 0x0d);
> +	regmap_write(es9356->regmap, SDW_SCP_BUS_CLOCK_BASE, 0x01);

this is wrong, all standard codec registers should be handled by the core, not by the codec driver with regmap.
please remove this regmap definition
