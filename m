Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D2F2D0C63
	for <linux-sound@vger.kernel.org>; Wed,  8 Apr 2026 07:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775631839; cv=none; b=PgMfzLe7SN8BXONUiGx6E+fOHKjYahU816bB5lDCCHFGkrqW1ktTNlKnTooLVsCXuxf/jj22vPx3yf3w/2RtE/aKuF2auzuRY/Sfv+YvGpfsP3kPtzgnDKyulwa1os6lVttgiIdn44UIIm25GhWVN/vC5u5C0lovErcocF7oGJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775631839; c=relaxed/simple;
	bh=9sxrE/9ciloC5qu+7WAYpabUVmcV9PJT3k9Tg/e5fhI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aJvLE3zc7e8dXT4iDAdvHGmx+8ssajkqYziJyZJRAakCIj6jhFI9g6/1AYn093Zeq1lnPbbjhWFXc9wWgP3iQL1ddSsLpaWF0TPO9GUyGBJbkbaCh9gl/KVVYIlT/V8ieB+m0AXPdClPwJ/U6qZ6Nuj9AvIs6w/9+4e2epBigmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=TbjumYaP; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="TbjumYaP"
Message-ID: <708d8985-313a-4096-ac59-26e9d3088637@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775631834;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qt/0rp23m8+nnDdqp8A5R2uoQEWr9iSqRSSSl++5fDg=;
	b=TbjumYaP+xzeQd1gwvC0zKbGBzfsfYfj3Aij1f0fZk2zJjEq1JYsHMRr5RQLwqZPWl0NjG
	AYh9ReKr/i7KyD75hfbIe2sKwNqT3cDiYmhme74F0VDsGSwTDNAutewlBHr/7ZPbseIgbw
	bx+BtSNuYNHzdcqFtr9kIhfnKND3Gcc=
Date: Wed, 8 Apr 2026 08:43:47 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v5 3/5] ASoC: es9356-sdca: Add ES9356 SDCA driver
To: Zhang Yi <zhangyi@everest-semi.com>, broonie@kernel.org, tiwai@suse.com,
 linux-sound@vger.kernel.org
Cc: peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 ckeepax@opensource.cirrus.com
References: <20260407100105.123041-1-zhangyi@everest-semi.com>
 <20260407100105.123041-4-zhangyi@everest-semi.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260407100105.123041-4-zhangyi@everest-semi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> index ca3e47db1..5953a6131 100644
> --- a/sound/soc/codecs/Kconfig
> +++ b/sound/soc/codecs/Kconfig
> @@ -122,6 +122,7 @@ config SND_SOC_ALL_CODECS
>  	imply SND_SOC_ES8328_I2C
>  	imply SND_SOC_ES8375
>  	imply SND_SOC_ES8389
> +	imply SND_SOC_ES9356
>  	imply SND_SOC_ES7134
>  	imply SND_SOC_ES7241
>  	imply SND_SOC_FRAMER
> @@ -1300,6 +1301,12 @@ config SND_SOC_ES8389
>  	tristate "Everest Semi ES8389 CODEC"
>  	depends on I2C
>  
> +config SND_SOC_ES9356
> +        tristate "Everest Semi ES9356 CODEC SDW"
> +        depends on SOUNDWIRE
> +        select REGMAP_SOUNDWIRE
> +	select REGMAP_SOUNDWIRE_MBQ
> +

indentation on last select seems off


> +static int es9356_sdca_pde_event(struct snd_soc_dapm_widget *w,
> +	struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_dapm_to_component(w->dapm);
> +	struct es9356_sdw_priv *es9356 = snd_soc_component_get_drvdata(component);
> +	unsigned char ps0 = 0x0, ps3 = 0x3;
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_POST_PMU:
> +		regmap_write(es9356->regmap, w->reg, ps0);
> +		es9356_pde_transition_delay(es9356, SDW_SDCA_CTL_FUNC(w->reg), SDW_SDCA_CTL_ENT(w->reg), ps0);
> +		pm_runtime_mark_last_busy(&es9356->slave->dev);

You mark the device as last_busy when powering up?

> +		break;
> +	case SND_SOC_DAPM_PRE_PMD:
> +		regmap_write(es9356->regmap, w->reg, ps3);
> +		es9356_pde_transition_delay(es9356, SDW_SDCA_CTL_FUNC(w->reg), SDW_SDCA_CTL_ENT(w->reg), ps3);

but not when powering down?

Since your device has multiple functions, you also need to track which functions are active. It's easier with one subdevice per function, so that the runtime_pm core keeps track of all children devices. If you have a monolithic driver for multiple functions, you will have to reinvent the wheel with refcounts, etc.

How difficult would it be to follow the infrastructure introduced by Cirrus Logic for SDCA codecs, and split this driver in multiple functions?

> +		break;
> +	}
> +	return 0;
> +}

> +static void es9356_sdca_jack_init(struct es9356_sdw_priv *es9356)
> +{
> +	mutex_lock(&es9356->jack_lock);
> +
> +	if (es9356->hs_jack) {
> +		sdw_write_no_pm(es9356->slave, SDW_SCP_SDCA_INTMASK1, SDW_SCP_SDCA_INTMASK_SDCA_7);
> +		sdw_write_no_pm(es9356->slave, SDW_SCP_SDCA_INTMASK1,
> +			(SDW_SCP_SDCA_INTMASK_SDCA_7 | SDW_SCP_SDCA_INTMASK_SDCA_5 | SDW_SCP_SDCA_INTMASK_SDCA_1));
> +	}
> +
> +	mutex_unlock(&es9356->jack_lock);

you should explain what this jack_lock protects and what sort of race condition can happen. I don't recall seeing this before?


> +static int es9356_sdca_button(unsigned int *buffer)
> +{
> +	static int cur_button;
> +
> +	if (*(buffer + 1) | *(buffer + 2))
> +		return -EINVAL;
> +	switch (*buffer) {
> +	case 0x00:
> +		cur_button = 0;
> +		break;
> +	case 0x20:
> +		cur_button = SND_JACK_BTN_5;
> +		break;
> +	case 0x10:
> +		cur_button = SND_JACK_BTN_3;
> +		break;
> +	case 0x08:
> +		cur_button = SND_JACK_BTN_2;
> +		break;
> +	case 0x02:
> +		cur_button = SND_JACK_BTN_4;
> +		break;
> +	case 0x01:
> +		cur_button = SND_JACK_BTN_0;
> +		break;
> +	default:
> +		break;
> +	}

where is BTN_1 handled? you listed it in patch1

+	ret = snd_soc_card_jack_new_pins(rtd->card, "Headset Jack",
+					 SND_JACK_HEADSET | SND_JACK_BTN_0 |
+					 SND_JACK_BTN_1 | SND_JACK_BTN_2 |
+					 SND_JACK_BTN_3 | SND_JACK_BTN_4 |
+					 SND_JACK_BTN_5,




> +static void es9356_jack_detect_handler(struct work_struct *work)
> +{
> +	struct es9356_sdw_priv *es9356 =
> +		container_of(work, struct es9356_sdw_priv, jack_detect_work.work);
> +	int ret, btn_type = 0;
> +
> +	if (!es9356->hs_jack)
> +		return;
> +
> +	if (!es9356->component->card || !es9356->component->card->instantiated)
> +		return;
> +
> +	if (es9356->sdca_status & SDW_SCP_SDCA_INT_SDCA_7) {
> +		btn_type = es9356_sdca_button_detect(es9356);
> +		if (btn_type < 0)
> +			return;

I don't fully understand why you deal with buttons in a jack_detect handler, when you have a button_handler below?

> +	} else {
> +		ret = es9356_sdca_headset_detect(es9356);
> +		if (ret < 0)
> +			return;
> +	}
> +
> +	if (es9356->jack_type != SND_JACK_HEADSET)
> +		btn_type = 0;
> +
> +	snd_soc_jack_report(es9356->hs_jack, es9356->jack_type | btn_type,
> +			SND_JACK_HEADSET |
> +			SND_JACK_BTN_0 | SND_JACK_BTN_1 |

BTN1 here as well

> +			SND_JACK_BTN_2 | SND_JACK_BTN_3 |
> +			SND_JACK_BTN_4 | SND_JACK_BTN_5);
> +
> +	if (btn_type) {
> +		snd_soc_jack_report(es9356->hs_jack, es9356->jack_type,
> +			SND_JACK_HEADSET |
> +			SND_JACK_BTN_0 | SND_JACK_BTN_1 |

and here

> +			SND_JACK_BTN_2 | SND_JACK_BTN_3 |
> +			SND_JACK_BTN_4 | SND_JACK_BTN_5);
> +		mod_delayed_work(system_power_efficient_wq,
> +			&es9356->button_detect_work, msecs_to_jiffies(280));
> +	}
> +}
> +
> +static void es9356_button_detect_handler(struct work_struct *work)
> +{
> +	struct es9356_sdw_priv *es9356 =
> +		container_of(work, struct es9356_sdw_priv, button_detect_work.work);
> +	unsigned int reg, offset;
> +	int ret, idx, btn_type = 0;
> +	unsigned int button[3];
> +
> +	ret = regmap_read(es9356->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_GE35, ES9356_SDCA_CTL_DETECTED_MODE, 0), &reg);
> +
> +	if (ret < 0)
> +		goto io_error;
> +
> +	if (reg == 0x04) {
> +		ret = regmap_read(es9356->regmap, ES9356_BUF_ADDR_HID, &offset);
> +		if (ret < 0)
> +			goto io_error;
> +		for (idx = 0; idx < ARRAY_SIZE(button); idx++) {
> +			ret = regmap_read(es9356->regmap, ES9356_BUF_ADDR_HID + offset + idx, &reg);
> +			if (ret < 0)
> +				goto io_error;
> +			button[idx] = reg;
> +		}
> +		btn_type = es9356_sdca_button(&button[0]);
> +	}
> +
> +	snd_soc_jack_report(es9356->hs_jack, es9356->jack_type | btn_type,
> +			SND_JACK_HEADSET |
> +			SND_JACK_BTN_0 | SND_JACK_BTN_1 |
> +			SND_JACK_BTN_2 | SND_JACK_BTN_3 |
> +			SND_JACK_BTN_4 | SND_JACK_BTN_5);
> +
> +	if (btn_type) {
> +		snd_soc_jack_report(es9356->hs_jack, es9356->jack_type,
> +			SND_JACK_HEADSET |
> +			SND_JACK_BTN_0 | SND_JACK_BTN_1 |
> +			SND_JACK_BTN_2 | SND_JACK_BTN_3 |
> +			SND_JACK_BTN_4 | SND_JACK_BTN_5);
> +		mod_delayed_work(system_power_efficient_wq,
> +			&es9356->button_detect_work, msecs_to_jiffies(280));
> +	}
> +
> +	return;
> +io_error:
> +	pr_err_ratelimited("IO error in %s, ret %d\n", __func__, ret);
> +}
> +
> +static int es9356_sdw_pcm_hw_params(struct snd_pcm_substream *substream,
> +				    struct snd_pcm_hw_params *params,
> +				    struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_component *component = dai->component;
> +	struct es9356_sdw_priv *es9356 = snd_soc_component_get_drvdata(component);
> +	struct sdw_stream_config stream_config = {0};
> +	struct sdw_port_config port_config = {0};
> +	struct sdw_stream_runtime *sdw_stream = snd_soc_dai_get_dma_data(dai, substream);
> +	int ret;
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
> +	port_config.num = dai->id;
> +
> +	ret = sdw_stream_add_slave(es9356->slave, &stream_config,
> +				   &port_config, 1, sdw_stream);
> +	if (ret) {
> +		dev_err(dai->dev, "Unable to configure port\n");
> +		return -EINVAL;
> +	}
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
> +			SDW_SDCA_CTL(FUNC_NUM_MIC, ES9356_SDCA_ENT_CS113, ES9356_SDCA_CTL_SAMPLE_FREQ_INDEX, 0), rate);
> +	if (dai->id == ES9356_AMP)
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_AMP, ES9356_SDCA_ENT_CS21, ES9356_SDCA_CTL_SAMPLE_FREQ_INDEX, 0), rate);
> +	if ((dai->id == ES9356_JACK_IN) | (dai->id == ES9356_JACK_OUT)) {
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_CS41, ES9356_SDCA_CTL_SAMPLE_FREQ_INDEX, 0), rate);
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_CS36, ES9356_SDCA_CTL_SAMPLE_FREQ_INDEX, 0), rate);

this is interesting, in theory SoundWire allows input and output to use different sampling frequencies?
dais are usually one direction only, shouldn't the clock be set only for the specific dai?

> +	}
> +	return ret;
> +}
> +
> +static int es9356_sdw_pcm_hw_free(struct snd_pcm_substream *substream,
> +				  struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_component *component = dai->component;
> +	struct es9356_sdw_priv *es9356 = snd_soc_component_get_drvdata(component);
> +	struct sdw_stream_runtime *sdw_stream = snd_soc_dai_get_dma_data(dai, substream);
> +
> +	if (!es9356->slave)
> +		return -EINVAL;
> +
> +	sdw_stream_remove_slave(es9356->slave, sdw_stream);
> +	return 0;
> +}
> +
> +static const struct snd_soc_dai_ops es9356_sdw_ops = {
> +	.hw_params	= es9356_sdw_pcm_hw_params,
> +	.hw_free	= es9356_sdw_pcm_hw_free,
> +	.set_stream	= es9356_sdw_set_sdw_stream,
> +	.shutdown	= es9356_sdw_shutdown,
> +};
> +
> +static struct snd_soc_dai_driver es9356_sdw_dai[] = {
> +	{
> +		.name = "es9356-sdp-aif4",
> +		.id = ES9356_DMIC,
> +		.capture = {
> +			.stream_name = "DP1 Capture",
> +			.channels_min = 1,
> +			.channels_max = 2,
> +		},
> +		.ops = &es9356_sdw_ops,
> +	},
> +	{
> +		.name = "es9356-sdp-aif2",
> +		.id = ES9356_JACK_IN,
> +		.capture = {
> +			.stream_name = "DP2 Capture",
> +			.channels_min = 1,
> +			.channels_max = 2,
> +		},
> +		.ops = &es9356_sdw_ops,
> +	},
> +	{
> +		.name = "es9356-sdp-aif3",
> +		.id = ES9356_AMP,
> +		.playback = {
> +			.stream_name = "DP3 Playback",
> +			.channels_min = 1,
> +			.channels_max = 2,
> +		},
> +		.ops = &es9356_sdw_ops,
> +	},
> +	{
> +		.name = "es9356-sdp-aif1",
> +		.id = ES9356_JACK_OUT,
> +		.playback = {
> +			.stream_name = "DP4 Playback",
> +			.channels_min = 1,
> +			.channels_max = 2,
> +		},

see my note above, jack_in and jack_out are seperate dais, so we shouldn't set handle their settings in the same way in hw_params.

> +		.ops = &es9356_sdw_ops,
> +	},
> +};
> +
> +static int es9356_sdca_mbq_size(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case SDW_SDCA_CTL(FUNC_NUM_MIC, ES9356_SDCA_ENT_FU113, ES9356_SDCA_CTL_FU_VOLUME, CH_L):
> +	case SDW_SDCA_CTL(FUNC_NUM_MIC, ES9356_SDCA_ENT_FU113, ES9356_SDCA_CTL_FU_VOLUME, CH_R):
> +	case SDW_SDCA_CTL(FUNC_NUM_AMP, ES9356_SDCA_ENT_FU21, ES9356_SDCA_CTL_FU_VOLUME, CH_L):
> +	case SDW_SDCA_CTL(FUNC_NUM_AMP, ES9356_SDCA_ENT_FU21, ES9356_SDCA_CTL_FU_VOLUME, CH_R):
> +	case SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU41, ES9356_SDCA_CTL_FU_VOLUME, CH_L):
> +	case SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU41, ES9356_SDCA_CTL_FU_VOLUME, CH_R):
> +	case SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU36, ES9356_SDCA_CTL_FU_VOLUME, CH_L):
> +	case SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU36, ES9356_SDCA_CTL_FU_VOLUME, CH_R):
> +	case SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU33, ES9356_SDCA_CTL_FU_CH_GAIN, 0):
> +	case SDW_SDCA_CTL(FUNC_NUM_MIC, ES9356_SDCA_ENT_FU11, ES9356_SDCA_CTL_FU_CH_GAIN, 0):
> +		return 2;
> +	default:
> +		return 1;
> +	}
> +}
> +
> +static struct regmap_sdw_mbq_cfg es9356_mbq_config = {
> +	.mbq_size = es9356_sdca_mbq_size,
> +};
> +
> +static bool es9356_sdca_volatile_register(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case ES9356_BUF_ADDR_HID:
> +	case ES9356_HID_BYTE2:
> +	case ES9356_HID_BYTE3:
> +	case ES9356_HID_BYTE4:
> +	case SDW_SDCA_CTL(FUNC_NUM_HID, ES9356_SDCA_ENT_HID01, ES9356_SDCA_CTL_HIDTX_CURRENT_OWNER, 0):
> +	case SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_GE35, ES9356_SDCA_CTL_DETECTED_MODE, 0):
> +	case SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_GE35, ES9356_SDCA_CTL_SELECTED_MODE, 0):
> +	case SDW_SDCA_CTL(FUNC_NUM_AMP, ES9356_SDCA_ENT_PDE23, ES9356_SDCA_CTL_REQ_POWER_STATE, 0):
> +	case SDW_SDCA_CTL(FUNC_NUM_AMP, ES9356_SDCA_ENT_PDE23, ES9356_SDCA_CTL_ACTUAL_POWER_STATE, 0):
> +	case SDW_SDCA_CTL(FUNC_NUM_MIC, ES9356_SDCA_ENT_PDE11, ES9356_SDCA_CTL_REQ_POWER_STATE, 0):
> +	case SDW_SDCA_CTL(FUNC_NUM_MIC, ES9356_SDCA_ENT_PDE11, ES9356_SDCA_CTL_ACTUAL_POWER_STATE, 0):
> +	case SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_PDE47, ES9356_SDCA_CTL_REQ_POWER_STATE, 0):
> +	case SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_PDE47, ES9356_SDCA_CTL_ACTUAL_POWER_STATE, 0):
> +	case SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_PDE34, ES9356_SDCA_CTL_REQ_POWER_STATE, 0):
> +	case SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_PDE34, ES9356_SDCA_CTL_ACTUAL_POWER_STATE, 0):
> +	case ES9356_FLAGS_HP:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static const struct regmap_config es9356_sdca_regmap = {
> +	.reg_bits = 32,
> +	.val_bits = 16,
> +	.volatile_reg = es9356_sdca_volatile_register,
> +	.max_register = 0x45ffffff,
> +	.cache_type = REGCACHE_MAPLE,
> +	.use_single_read = true,
> +	.use_single_write = true,
> +};
> +
> +static void es9356_regcache_sync_volume(struct device *dev, struct regmap *regmap)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(es9356_volume_register); i++) {
> +		regcache_sync_region(regmap, es9356_volume_register[i],
> +			es9356_volume_register[i]);
> +	}
> +}
> +
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
> +	regmap_write(es9356->regmap, ES9356_STATE, 0x0e);
> +	regmap_write(es9356->regmap, ES9356_CSM_RESET, 0x00);
> +	regmap_write(es9356->regmap, ES9356_HP_TYPE, 0x08);
> +
> +	regmap_write(es9356->regmap,
> +		SDW_SDCA_CTL(FUNC_NUM_MIC, ES9356_SDCA_ENT_FU113, ES9356_SDCA_CTL_FU_VOLUME, CH_L), ES9356_DEFAULT_VOLUME);
> +	regmap_write(es9356->regmap,
> +		SDW_SDCA_CTL(FUNC_NUM_MIC, ES9356_SDCA_ENT_FU113, ES9356_SDCA_CTL_FU_VOLUME, CH_R), ES9356_DEFAULT_VOLUME);
> +
> +	regmap_write(es9356->regmap,
> +		SDW_SDCA_CTL(FUNC_NUM_AMP, ES9356_SDCA_ENT_FU21, ES9356_SDCA_CTL_FU_VOLUME, CH_L), ES9356_DEFAULT_VOLUME);
> +	regmap_write(es9356->regmap,
> +		SDW_SDCA_CTL(FUNC_NUM_AMP, ES9356_SDCA_ENT_FU21, ES9356_SDCA_CTL_FU_VOLUME, CH_R), ES9356_DEFAULT_VOLUME);
> +
> +	regmap_write(es9356->regmap,
> +		SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU41, ES9356_SDCA_CTL_FU_VOLUME, CH_L), ES9356_DEFAULT_VOLUME);
> +	regmap_write(es9356->regmap,
> +		SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU41, ES9356_SDCA_CTL_FU_VOLUME, CH_R), ES9356_DEFAULT_VOLUME);
> +
> +	regmap_write(es9356->regmap,
> +		SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU36, ES9356_SDCA_CTL_FU_VOLUME, CH_L), ES9356_DEFAULT_VOLUME);
> +	regmap_write(es9356->regmap,
> +		SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU36, ES9356_SDCA_CTL_FU_VOLUME, CH_R), ES9356_DEFAULT_VOLUME);
> +}
> +
> +static int es9356_sdca_io_init(struct device *dev, struct sdw_slave *slave)
> +{
> +	struct es9356_sdw_priv *es9356 = dev_get_drvdata(&slave->dev);
> +
> +	if (es9356->hw_init)
> +		return 0;
> +
> +	regcache_cache_only(es9356->regmap, false);
> +
> +	if (es9356->first_hw_init) {
> +		regcache_cache_bypass(es9356->regmap, true);
> +	} else {
> +		/*
> +		 * PM runtime is only enabled when a Slave reports as Attached
> +		 */
> +
> +		/* set autosuspend parameters */
> +		pm_runtime_set_autosuspend_delay(&slave->dev, 3000);
> +		pm_runtime_use_autosuspend(&slave->dev);
> +
> +		/* update count of parent 'active' children */
> +		pm_runtime_set_active(&slave->dev);
> +
> +		/* make sure the device does not suspend immediately */
> +		pm_runtime_mark_last_busy(&slave->dev);
> +
> +		pm_runtime_enable(&slave->dev);
> +
> +		es9356_register_init(es9356);
> +	}
> +	pm_runtime_get_noresume(&slave->dev);
> +
> +	regmap_write(es9356->regmap,
> +		SDW_SDCA_CTL(FUNC_NUM_MIC, ES9356_SDCA_ENT_XU12, ES9356_SDCA_CTL_SELECTED_MODE, 0), 0x01);
> +	regmap_write(es9356->regmap,
> +		SDW_SDCA_CTL(FUNC_NUM_MIC, ES9356_SDCA_ENT0, ES9356_SDCA_CTL_FUNC_STATUS, 0), 0x40);
> +	regmap_write(es9356->regmap,
> +		SDW_SDCA_CTL(FUNC_NUM_AMP, ES9356_SDCA_ENT_XU22, ES9356_SDCA_CTL_SELECTED_MODE, 0), 0x01);
> +	regmap_write(es9356->regmap,
> +		SDW_SDCA_CTL(FUNC_NUM_AMP, ES9356_SDCA_ENT0, ES9356_SDCA_CTL_FUNC_STATUS, 0), 0x40);
> +	regmap_write(es9356->regmap,
> +		SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_XU42, ES9356_SDCA_CTL_SELECTED_MODE, 0), 0x01);
> +	regmap_write(es9356->regmap,
> +		SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_XU36, ES9356_SDCA_CTL_SELECTED_MODE, 0), 0x01);
> +	regmap_write(es9356->regmap,
> +		SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT0, ES9356_SDCA_CTL_FUNC_STATUS, 0), 0x40);
> +
> +	if (es9356->first_hw_init) {
> +		regcache_cache_bypass(es9356->regmap, false);
> +		regcache_mark_dirty(es9356->regmap);
> +	} else
> +		es9356->first_hw_init = true;
> +
> +	es9356->hw_init = true;
> +
> +	pm_runtime_mark_last_busy(&slave->dev);
> +	pm_runtime_put_autosuspend(&slave->dev);
> +
> +	return 0;
> +}
> +
> +static int es9356_sdw_update_status(struct sdw_slave *slave,
> +				    enum sdw_slave_status status)
> +{
> +	struct es9356_sdw_priv *es9356 = dev_get_drvdata(&slave->dev);
> +
> +	if (status == SDW_SLAVE_UNATTACHED)
> +		es9356->hw_init = false;
> +
> +	if (status == SDW_SLAVE_ATTACHED) {
> +		if (es9356->hs_jack) {
> +			sdw_write_no_pm(es9356->slave, SDW_SCP_SDCA_INTMASK1, SDW_SCP_SDCA_INTMASK_SDCA_7);
> +			sdw_write_no_pm(es9356->slave, SDW_SCP_SDCA_INTMASK1,
> +			(SDW_SCP_SDCA_INTMASK_SDCA_7 | SDW_SCP_SDCA_INTMASK_SDCA_5 | SDW_SCP_SDCA_INTMASK_SDCA_1));

I don't get why you have two writes in a row that will touch SDW_SCP_SDCA_INTMASK_SDCA_7?
Is the first write required at all?

> +		}
> +	}
> +
> +	if (es9356->hw_init || status != SDW_SLAVE_ATTACHED)
> +		return 0;
> +
> +	return es9356_sdca_io_init(&slave->dev, slave);
> +}

> +static int es9356_sdw_interrupt_callback(struct sdw_slave *slave,
> +					 struct sdw_slave_intr_status *status)
> +{
> +	struct es9356_sdw_priv *es9356 = dev_get_drvdata(&slave->dev);
> +	int ret, stat;
> +	int count = 0, retry = 3;
> +	unsigned int sdca_cascade, scp_sdca_stat1 = 0;
> +
> +	mutex_lock(&es9356->jack_lock);
> +
> +	ret = sdw_read_no_pm(es9356->slave, SDW_SCP_SDCA_INT1);
> +	if (ret < 0)
> +		goto io_error;
> +	es9356->sdca_status = ret;
> +
> +	do {
> +		ret = sdw_read_no_pm(es9356->slave, SDW_SCP_SDCA_INT1);
> +		if (ret < 0)
> +			goto io_error;
> +		if (ret & SDW_SCP_SDCA_INTMASK_SDCA_1) {
> +			ret = sdw_update_no_pm(es9356->slave, SDW_SCP_SDCA_INT1,
> +				SDW_SCP_SDCA_INT_SDCA_1, SDW_SCP_SDCA_INT_SDCA_1);
> +			if (ret < 0)
> +				goto io_error;
> +		}
> +
> +		ret = sdw_read_no_pm(es9356->slave, SDW_SCP_SDCA_INT1);
> +		if (ret < 0)
> +			goto io_error;
> +		if (ret & SDW_SCP_SDCA_INTMASK_SDCA_5) {
> +			ret = sdw_update_no_pm(es9356->slave, SDW_SCP_SDCA_INT1,
> +				SDW_SCP_SDCA_INT_SDCA_5, SDW_SCP_SDCA_INT_SDCA_5);
> +			if (ret < 0)
> +				goto io_error;
> +		}
> +
> +		ret = sdw_read_no_pm(es9356->slave, SDW_SCP_SDCA_INT1);
> +		if (ret < 0)
> +			goto io_error;
> +		if (ret & SDW_SCP_SDCA_INTMASK_SDCA_7) {
> +			ret = sdw_update_no_pm(es9356->slave, SDW_SCP_SDCA_INT1,
> +				SDW_SCP_SDCA_INT_SDCA_7, SDW_SCP_SDCA_INT_SDCA_7);
> +			if (ret < 0)
> +				goto io_error;
> +		}

Humm, maybe this was inspired by existing code, but why are you reading the same SDCA_INT1 egister multiple times?
You could do a single read, then keep track of the interrupts and one update for all 3 sources of interrupts.
If there is an additional interrupt you detect it and loop once more.

> +
> +		ret = sdw_read_no_pm(es9356->slave, SDW_DP0_INT);
> +		if (ret < 0)
> +			goto io_error;
> +		sdca_cascade = ret & SDW_DP0_SDCA_CASCADE;
> +
> +		ret = sdw_read_no_pm(es9356->slave, SDW_SCP_SDCA_INT1);
> +		if (ret < 0)
> +			goto io_error;
> +		scp_sdca_stat1 = ret & SDW_SCP_SDCA_INTMASK_SDCA_1;
> +
> +		stat = scp_sdca_stat1 || sdca_cascade;
> +
> +		count++;
> +	} while (stat != 0 && count < retry);
> +
> +	if (status->sdca_cascade)
> +		mod_delayed_work(system_power_efficient_wq,
> +			&es9356->jack_detect_work, msecs_to_jiffies(280));

why 280 ms? how did you determine this value, hardware or experiments?

> +
> +	mutex_unlock(&es9356->jack_lock);
> +	return 0;
> +
> +io_error:
> +	mutex_unlock(&es9356->jack_lock);
> +	pr_err_ratelimited("IO error in %s, ret %d\n", __func__, ret);
> +	return ret;
> +}

> +
> +#endif

