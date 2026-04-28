Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1821D2BEFFE
	for <linux-sound@vger.kernel.org>; Tue, 28 Apr 2026 20:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777406525; cv=none; b=m8/TlmbPtpSkKrgWiKG3HQzbgK3P4IF6e6J+y2lw4TKkwjdS6IERku+MSwLMm0xfcX9YWA8OxzD8+KMnnD18AYT7x28Ndl3hrx+19jDvhC2pBxzWCE+VQ/7rsJ5bSbEj2Mw2gm01/s+zKbrwp9PBYxJoaxE+5wv8fj6tVw++JcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777406525; c=relaxed/simple;
	bh=PwXRvanX82k7pNMZzur/WDAHPIDp1pUckslUi7ILskk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BWzzD+k7grdS1Y6aw6g+y9J2LWQyVfeHpjG+RmbCwRqkG+5Iu76QvIHZYJ06biEjqK6sZrxKi3RxAtz2UDolgDTvKof5VRRAKtg3vP0b7oAxknK3aMvh4QrlNcX5U5rlt5AQQtjJ3TJy8h1xJIj9vJ/UAcAb32JTRgKkglDFFC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=FiYI52PZ; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="FiYI52PZ"
Message-ID: <7137df6a-5e49-4516-a356-3414f7d14c33@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777406520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wvWkd1gFVy0K7P7hzCh8hX3ZAgBL3AKAQwln1LUIU74=;
	b=FiYI52PZL4Sb9iN3umdLEV0/s8gwo0Kx/g5InF9MbPIMxGLlmnWUHko0SiCIbD8/KRXZD3
	EGMBbO0LNjd/am0jcaqcRTdPrcsNtpdH6LjBxtB5HPA33iIaD997vVUT/skBDHDE8Gn369
	Z8SrPPcAuk8irvRmjKt+n0eqZTvPE7g=
Date: Tue, 28 Apr 2026 21:57:45 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v11 2/4] ASoC: tac5xx2-sdw: add soundwire based codec
 driver
To: Niranjan H Y <niranjan.hy@ti.com>, linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, broonie@kernel.org,
 ckeepax@opensource.cirrus.com, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, cezary.rojewski@intel.com, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, baojun.xu@ti.com, shenghao-ding@ti.com,
 sandeepk@ti.com, v-hampiholi@ti.com
References: <20260427082401.2118-1-niranjan.hy@ti.com>
 <20260427082401.2118-2-niranjan.hy@ti.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260427082401.2118-2-niranjan.hy@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


> +struct tac5xx2_prv {
> +	struct snd_soc_component *component;
> +	struct sdw_slave *sdw_peripheral;
> +	struct sdca_function_data *sa_func_data;
> +	struct sdca_function_data *sm_func_data;
> +	struct sdca_function_data *uaj_func_data;
> +	struct sdca_function_data *hid_func_data;
> +	enum sdw_slave_status status;
> +	/* serialize potential concurrent uaj detection in .hw_params
> +	 * during playback session and .interrupt_callback.
> +	 */
> +	struct mutex uaj_lock;

is this uaj_lock really needed, if you look below at hw_params there's nothing that looks even remotely tied to jack detection...

> +	struct regmap *regmap;
> +	struct device *dev;
> +	bool hw_init;
> +	bool first_hw_init;
> +	u32 part_id;
> +	struct snd_soc_jack *hs_jack;
> +	int jack_type;
> +	 /* Custom fw binary. UMP File Download is not used. */
> +	unsigned int fw_file_cnt;
> +	struct tac_fw_file *fw_files;
> +	struct completion fw_caching_complete;
> +	bool fw_dl_success;
> +	u8 fw_binaryname[64];
> +};

> +static int tac_sdw_hw_params(struct snd_pcm_substream *substream,
> +			     struct snd_pcm_hw_params *params,
> +			     struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_component *component = dai->component;
> +	struct tac5xx2_prv *tac_dev = snd_soc_component_get_drvdata(component);
> +	struct sdw_stream_config stream_config = {0};
> +	struct sdw_port_config port_config = {0};
> +	struct sdw_stream_runtime *sdw_stream;
> +	struct sdw_slave *sdw_peripheral = tac_dev->sdw_peripheral;
> +	int ret;
> +	int function_id;
> +	int pde_entity;
> +	int port_num;
> +	u8 sample_rate_idx = 0;
> +
> +	if (!tac_dev->hw_init) {
> +		dev_err(tac_dev->dev,
> +			"error: operation without hw initialization");
> +		return -EINVAL;
> +	}
> +
> +	sdw_stream = snd_soc_dai_get_dma_data(dai, substream);
> +	if (!sdw_stream) {
> +		dev_err(tac_dev->dev, "failed to get dma data");
> +		return -EINVAL;
> +	}
> +
> +	ret = tac_clear_latch(tac_dev);
> +	if (ret)
> +		dev_warn(tac_dev->dev, "clear latch failed, err=%d", ret);
> +
> +	switch (dai->id) {
> +	case TAC5XX2_DMIC:
> +		function_id = TAC_FUNCTION_ID_SM;
> +		pde_entity = TAC_SDCA_ENT_PDE11;
> +		port_num = TAC_SDW_PORT_NUM_DMIC;
> +		break;
> +	case TAC5XX2_UAJ:
> +		function_id = TAC_FUNCTION_ID_UAJ;
> +		pde_entity = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ?
> +				TAC_SDCA_ENT_PDE47 : TAC_SDCA_ENT_PDE34;
> +		port_num = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ?
> +				TAC_SDW_PORT_NUM_UAJ_PLAYBACK :
> +				TAC_SDW_PORT_NUM_UAJ_CAPTURE;
> +		break;
> +	case TAC5XX2_SPK:
> +		function_id = TAC_FUNCTION_ID_SA;
> +		pde_entity = TAC_SDCA_ENT_PDE23;
> +		port_num = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ?
> +				TAC_SDW_PORT_NUM_SPK_PLAYBACK :
> +				TAC_SDW_PORT_NUM_SPK_CAPTURE;
> +		break;
> +	default:
> +		dev_err(tac_dev->dev, "Invalid dai id: %d", dai->id);
> +		return -EINVAL;
> +	}
> +
> +	snd_sdw_params_to_config(substream, params, &stream_config, &port_config);
> +	port_config.num = port_num;
> +	ret = sdw_stream_add_slave(sdw_peripheral, &stream_config,
> +				   &port_config, 1, sdw_stream);
> +	if (ret) {
> +		dev_err(dai->dev,
> +			"Unable to configure port %d: %d\n", port_num, ret);
> +		return ret;
> +	}
> +
> +	switch (params_rate(params)) {
> +	case 48000:
> +		sample_rate_idx = 0x01;
> +		break;
> +	case 44100:
> +		sample_rate_idx = 0x02;
> +		break;
> +	case 96000:
> +		sample_rate_idx = 0x03;
> +		break;
> +	case 88200:
> +		sample_rate_idx = 0x04;
> +		break;
> +	default:
> +		dev_dbg(tac_dev->dev, "Unsupported sample rate: %d Hz",
> +			params_rate(params));
> +		return -EINVAL;
> +	}
> +
> +	switch (function_id) {
> +	case TAC_FUNCTION_ID_SM:
> +		ret = regmap_write(tac_dev->regmap,
> +				   SDW_SDCA_CTL(function_id, TAC_SDCA_ENT_CS113,
> +						TAC_SDCA_CTL_CS_SAMP_RATE_IDX, 0),
> +			sample_rate_idx);
> +		if (ret) {
> +			dev_err(tac_dev->dev, "Failed to set CS113 sample rate: %d", ret);
> +			return ret;
> +		}
> +
> +		break;
> +	case TAC_FUNCTION_ID_UAJ:
> +		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> +			ret = regmap_write(tac_dev->regmap,
> +					   SDW_SDCA_CTL(function_id, TAC_SDCA_ENT_CS41,
> +							TAC_SDCA_CTL_CS_SAMP_RATE_IDX, 0),
> +					sample_rate_idx);
> +			if (ret) {
> +				dev_err(tac_dev->dev, "Failed to set CS41 sample rate: %d", ret);
> +				return ret;
> +			}
> +		} else {
> +			ret = regmap_write(tac_dev->regmap,
> +					   SDW_SDCA_CTL(function_id, TAC_SDCA_ENT_CS36,
> +							TAC_SDCA_CTL_CS_SAMP_RATE_IDX, 0),
> +					sample_rate_idx);
> +			if (ret) {
> +				dev_err(tac_dev->dev, "Failed to set CS36 sample rate: %d", ret);
> +				return ret;
> +			}
> +		}
> +		break;
> +	case TAC_FUNCTION_ID_SA:
> +		/* SmartAmp: no additional sample rate configuration needed */
> +		break;
> +	}
> +
> +	ret = regmap_write(tac_dev->regmap, SDW_SDCA_CTL(function_id, pde_entity,
> +							 TAC_SDCA_REQUESTED_PS, 0), 0);
> +	if (ret) {
> +		dev_err(tac_dev->dev, "failed to set PS to 0: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = sdca_asoc_pde_poll_actual_ps(tac_dev->dev, tac_dev->regmap, function_id, pde_entity,
> +					   SDCA_PDE_PS3, SDCA_PDE_PS0, NULL, 0);
> +	if (ret)
> +		dev_err(tac_dev->dev,
> +			"failed to transition to PS0, err= %d\n", ret);
> +	return ret;

so as I said above there's nothing here that might conflict with the interrupt callback?
What am I missing?

> +}
> +
> +static s32 tac_sdw_pcm_hw_free(struct snd_pcm_substream *substream,
> +			       struct snd_soc_dai *dai)
> +{
> +	s32 ret;

style nit-pick: reverse xmas-tree

> +	struct snd_soc_component *component = dai->component;
> +	struct tac5xx2_prv *tac_dev =
> +		snd_soc_component_get_drvdata(component);
> +	struct sdw_stream_runtime *sdw_stream =
> +		snd_soc_dai_get_dma_data(dai, substream);
> +	int pde_entity, function_id;
> +
> +	sdw_stream_remove_slave(tac_dev->sdw_peripheral, sdw_stream);
> +
> +	switch (dai->id) {
> +	case TAC5XX2_DMIC:
> +		pde_entity = TAC_SDCA_ENT_PDE11;
> +		function_id = TAC_FUNCTION_ID_SM;
> +		break;
> +	case TAC5XX2_UAJ:
> +		function_id = TAC_FUNCTION_ID_UAJ;
> +		pde_entity = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ?
> +				TAC_SDCA_ENT_PDE47 : TAC_SDCA_ENT_PDE34;
> +		break;
> +	default:
> +		function_id = TAC_FUNCTION_ID_SA;
> +		pde_entity = TAC_SDCA_ENT_PDE23;
> +		break;
> +	}
> +
> +	ret = regmap_write(tac_dev->regmap, SDW_SDCA_CTL(function_id, pde_entity,
> +							 TAC_SDCA_REQUESTED_PS, 0),
> +			   SDCA_PDE_PS3);
> +	if (ret)
> +		return ret;
> +
> +	ret = sdca_asoc_pde_poll_actual_ps(tac_dev->dev, tac_dev->regmap, function_id,
> +					   pde_entity, SDCA_PDE_PS0, SDCA_PDE_PS3,
> +					   NULL, 0);
> +
> +	return ret;
> +}
> +
> +static const struct snd_soc_dai_ops tac_dai_ops = {
> +	.hw_params = tac_sdw_hw_params,
> +	.hw_free = tac_sdw_pcm_hw_free,
> +	.set_stream = tac_set_sdw_stream,
> +	.shutdown = tac_sdw_shutdown,

so set_jack is now dynamically added...

> +};
> +

> +static int tac5xx2_sdca_headset_detect(struct tac5xx2_prv *tac_dev)
> +{
> +	int val, ret;
> +
> +	if (!tac_has_uaj_support(tac_dev))
> +		return 0;

... but here the test for uaj_support is still there? Is this needed?

> +
> +	ret = regmap_read(tac_dev->regmap,
> +			  SDW_SDCA_CTL(TAC_FUNCTION_ID_UAJ, TAC_SDCA_ENT_GE35,
> +				       TAC_SDCA_CTL_DET_MODE, 0), &val);
> +	if (ret) {
> +		dev_err(tac_dev->dev, "Failed to read the detect mode");
> +		return ret;
> +	}
> +
> +	switch (val) {
> +	case 4:
> +		tac_dev->jack_type = SND_JACK_MICROPHONE;
> +		break;
> +	case 5:
> +		tac_dev->jack_type = SND_JACK_HEADPHONE;
> +		break;
> +	case 6:
> +		tac_dev->jack_type = SND_JACK_HEADSET;
> +		break;
> +	case 0:
> +	default:
> +		tac_dev->jack_type = 0;
> +		break;
> +	}
> +
> +	ret = regmap_write(tac_dev->regmap,
> +			   SDW_SDCA_CTL(TAC_FUNCTION_ID_UAJ, TAC_SDCA_ENT_GE35,
> +					TAC_SDCA_CTL_SEL_MODE, 0), val);
> +	if (ret)
> +		dev_err(tac_dev->dev, "Failed to update the jack type to device");
> +
> +	return 0;
> +}
> +
> +static int tac5xx2_set_jack(struct snd_soc_component *component,
> +			    struct snd_soc_jack *hs_jack, void *data)
> +{
> +	struct tac5xx2_prv *tac_dev = snd_soc_component_get_drvdata(component);
> +	int ret;
> +
> +	guard(mutex)(&tac_dev->uaj_lock);
> +	if (!hs_jack) {
> +		if (tac_dev->hs_jack) {
> +			tac_dev->hs_jack = NULL;
> +			ret = 0;
> +			goto disable_interrupts;
> +		}
> +		return 0;
> +	}
> +
> +	tac_dev->hs_jack = hs_jack;
> +	if (!tac_dev->hw_init) {
> +		dev_err(tac_dev->dev, "jack init failed, hw not initialized");
> +		return 0;
> +	}

should this test go up to the start of the function?
And isn't there a case where .set_jack can be invoked before the device is fully initialized?

I have a vague memory this was the case with other codecs, please double-check.

> +
> +	ret = regmap_write(tac_dev->regmap, SDW_SCP_SDCA_INTMASK2,
> +			   SDW_SCP_SDCA_INTMASK_SDCA_11);
> +	if (ret) {
> +		dev_warn(tac_dev->dev,
> +			 "Failed to register jack detection interrupt");
> +		goto disable_interrupts;
> +	}
> +
> +	ret = regmap_write(tac_dev->regmap, SDW_SCP_SDCA_INTMASK3,
> +			   SDW_SCP_SDCA_INTMASK_SDCA_16);
> +	if (ret) {
> +		dev_warn(tac_dev->dev,
> +			 "Failed to register for button detect interrupt");
> +		goto disable_interrupts;
> +	}
> +
> +	return 0;
> +
> +disable_interrupts:
> +	/* ignore errors while disabling interrupts */
> +	regmap_write(tac_dev->regmap, SDW_SCP_SDCA_INTMASK2, 0);
> +	regmap_write(tac_dev->regmap, SDW_SCP_SDCA_INTMASK3, 0);
> +
> +	return ret;
> +}
> +
> +static int tac_interrupt_callback(struct sdw_slave *slave,
> +				  struct sdw_slave_intr_status *status)
> +{
> +	struct tac5xx2_prv *tac_dev = dev_get_drvdata(&slave->dev);
> +	struct device *dev = &slave->dev;
> +	int ret = 0;
> +	int btn_type = 0;
> +	unsigned int sdca_int2, sdca_int3, jack_report_mask = 0;
> +
> +	guard(mutex)(&tac_dev->uaj_lock);

again what does this uaj_lock protect?


> +	if (status->control_port) {
> +		if (status->control_port & SDW_SCP_INT1_PARITY)
> +			dev_warn(dev, "SCP: Parity error interrupt");
> +		if (status->control_port & SDW_SCP_INT1_BUS_CLASH)
> +			dev_warn(dev, "SCP: Bus clash interrupt");
> +	}
> +
> +	ret = regmap_read(tac_dev->regmap, SDW_SCP_SDCA_INT2, &sdca_int2);
> +	if (ret) {
> +		dev_err(dev, "Failed to read UAJ Interrupt, reg:%#x err=%d\n",
> +			SDW_SCP_SDCA_INT2, ret);
> +		return ret;
> +	}
> +
> +	ret = regmap_read(tac_dev->regmap, SDW_SCP_SDCA_INT3, &sdca_int3);
> +	if (ret) {
> +		dev_err(dev, "Failed to read HID interrupt reg=%#x: err=%d",
> +			SDW_SCP_SDCA_INT3, ret);
> +		return ret;
> +	}
> +
> +	dev_dbg(dev, "SDCA_INT2: 0x%02x, SDCA_INT3: 0x%02x\n",
> +		sdca_int2, sdca_int3);
> +
> +	if (sdca_int2 & SDW_SCP_SDCA_INT_SDCA_11) {
> +		ret = tac5xx2_sdca_headset_detect(tac_dev);
> +		if (ret < 0)
> +			goto clear;
> +		jack_report_mask |= SND_JACK_HEADSET;
> +	}
> +
> +	if (sdca_int3 & SDW_SCP_SDCA_INT_SDCA_16) {
> +		btn_type = tac5xx2_sdca_button_detect(tac_dev);
> +		if (btn_type < 0)
> +			btn_type = 0;
> +		jack_report_mask |= SND_JACK_BTN_0 | SND_JACK_BTN_1 |
> +			SND_JACK_BTN_2 | SND_JACK_BTN_3 | SND_JACK_BTN_4;
> +	}
> +
> +	if (tac_dev->jack_type == 0)
> +		btn_type = 0;
> +
> +	dev_dbg(tac_dev->dev, "in %s, jack_type=%d\n", __func__, tac_dev->jack_type);
> +	dev_dbg(tac_dev->dev, "in %s, btn_type=0x%x\n", __func__, btn_type);
> +
> +	if (!tac_dev->hs_jack)
> +		goto clear;
> +
> +	snd_soc_jack_report(tac_dev->hs_jack, tac_dev->jack_type | btn_type,
> +			    jack_report_mask);
> +
> +clear:
> +	if (sdca_int2) {
> +		ret = regmap_write(tac_dev->regmap, SDW_SCP_SDCA_INT2, sdca_int2);
> +		if (ret)
> +			dev_dbg(tac_dev->dev, "Failed to clear jack interrupt\n");
> +	}
> +
> +	if (sdca_int3) {
> +		ret = regmap_write(tac_dev->regmap, SDW_SCP_SDCA_INT3, sdca_int3);
> +		if (ret)
> +			dev_dbg(tac_dev->dev, "failed to clear hid interrupt\n");
> +	}
> +
> +	return 0;
> +}

> +static s32 tac_component_probe(struct snd_soc_component *component)
> +{
> +	struct tac5xx2_prv *tac_dev =
> +		snd_soc_component_get_drvdata(component);
> +	struct device *dev = tac_dev->dev;
> +	struct sdw_slave *slave = tac_dev->sdw_peripheral;
> +	unsigned long time;
> +	int ret;
> +
> +	/* Wait for SoundWire hw initialization to complete */
> +	time = wait_for_completion_timeout(&slave->initialization_complete,
> +					   msecs_to_jiffies(TAC5XX2_PROBE_TIMEOUT_MS));
> +	if (!time) {
> +		dev_warn(dev, "%s: hw initialization timeout\n", __func__);
> +		return -ETIMEDOUT;
> +	}
> +
> +	if (!tac_has_uaj_support(tac_dev))
> +		goto done_comp_probe;
> +
> +	ret = snd_soc_dapm_new_controls(snd_soc_component_to_dapm(component),
> +					tac_uaj_widgets,
> +					ARRAY_SIZE(tac_uaj_widgets));
> +	if (ret) {
> +		dev_err(component->dev, "Failed to add UAJ widgets: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = snd_soc_dapm_add_routes(snd_soc_component_to_dapm(component),
> +				      tac_uaj_routes, ARRAY_SIZE(tac_uaj_routes));
> +	if (ret) {
> +		dev_err(component->dev, "Failed to add UAJ routes: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = snd_soc_add_component_controls(component, tac_uaj_controls,
> +					     ARRAY_SIZE(tac_uaj_controls));
> +	if (ret) {
> +		dev_err(dev, "Failed to add UAJ controls: %d\n", ret);
> +			return ret;
> +	}
> +
> +done_comp_probe:
> +	tac_dev->component = component;
> +	return 0;
> +}
> +
> +static void tac_component_remove(struct snd_soc_component *codec)
> +{
> +	struct tac5xx2_prv *tac_dev = snd_soc_component_get_drvdata(codec);
> +
> +	tac_dev->component = NULL;
> +}
> +
> +static const struct snd_soc_component_driver soc_codec_driver_tacdevice = {
> +	.probe = tac_component_probe,
> +	.remove = tac_component_remove,
> +	.controls = tac5xx2_snd_controls,
> +	.num_controls = ARRAY_SIZE(tac5xx2_snd_controls),
> +	.dapm_widgets = tac5xx2_common_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(tac5xx2_common_widgets),
> +	.dapm_routes = tac5xx2_common_routes,
> +	.num_dapm_routes = ARRAY_SIZE(tac5xx2_common_routes),
> +	.idle_bias_on = 0,
> +	.endianness = 1,
> +};
> +
> +static s32 tac_init(struct tac5xx2_prv *tac_dev)
> +{
> +	s32 ret;
> +	struct snd_soc_dai_driver *dai_drv;
> +	struct snd_soc_component_driver *component_driver;
> +	int num_dais;
> +
> +	dev_set_drvdata(tac_dev->dev, tac_dev);
> +
> +	switch (tac_dev->part_id) {
> +	case 0x5572:
> +		dai_drv = tac5572_dai_driver;
> +		num_dais = ARRAY_SIZE(tac5572_dai_driver);
> +		break;
> +	case 0x5672:
> +		dai_drv = tac5672_dai_driver;
> +		num_dais = ARRAY_SIZE(tac5672_dai_driver);
> +		break;
> +	case 0x5682:
> +		dai_drv = tac5682_dai_driver;
> +		num_dais = ARRAY_SIZE(tac5682_dai_driver);
> +		break;
> +	case 0x2883:
> +		dai_drv = tas2883_dai_driver;
> +		num_dais = ARRAY_SIZE(tas2883_dai_driver);
> +		break;
> +	default:
> +		dev_err(tac_dev->dev, "Unsupported device: 0x%x\n",
> +			tac_dev->part_id);
> +		return -EINVAL;
> +	}
> +
> +	component_driver = devm_kzalloc(tac_dev->dev, sizeof(*component_driver),
> +					GFP_KERNEL);
> +	if (!component_driver)
> +		return -ENOMEM;
> +
> +	memcpy(component_driver, &soc_codec_driver_tacdevice, sizeof(*component_driver));
> +	if (tac_has_uaj_support(tac_dev))
> +		component_driver->set_jack = tac5xx2_set_jack;
> +
> +	ret = devm_snd_soc_register_component(tac_dev->dev, component_driver,
> +					      dai_drv, num_dais);
> +	if (ret) {
> +		dev_err(tac_dev->dev, "%s: codec register error:%d.\n",
> +			__func__, ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static s32 tac5xx2_sdca_dev_suspend(struct device *dev)
> +{
> +	struct tac5xx2_prv *tac_dev = dev_get_drvdata(dev);
> +
> +	if (!tac_dev->hw_init)
> +		return 0;
> +
> +	regcache_cache_only(tac_dev->regmap, true);
> +	return 0;
> +}
> +
> +static s32 tac5xx2_sdca_dev_system_suspend(struct device *dev)
> +{
> +	return tac5xx2_sdca_dev_suspend(dev);
> +}
> +
> +static s32 tac5xx2_sdca_dev_resume(struct device *dev)
> +{
> +	struct sdw_slave *slave = dev_to_sdw_dev(dev);
> +	struct tac5xx2_prv *tac_dev = dev_get_drvdata(dev);
> +	unsigned long t;
> +	int ret;
> +	bool had_unattached = false;
> +
> +	if (!tac_dev->first_hw_init) {
> +		dev_dbg(dev, "Device not initialized yet, skipping resume sync\n");
> +		return 0;
> +	}
> +
> +	if (!slave->unattach_request)
> +		goto regmap_sync;
> +
> +	had_unattached = true;
> +	t = wait_for_completion_timeout(&slave->initialization_complete,
> +					msecs_to_jiffies(TAC5XX2_PROBE_TIMEOUT_MS));
> +	if (!t) {
> +		dev_err(&slave->dev, "resume: initialization timed out\n");
> +		sdw_show_ping_status(slave->bus, true);
> +		return -ETIMEDOUT;
> +	}
> +	slave->unattach_request = 0;
> +	dev_dbg(tac_dev->dev, "%s wait for resume complete, starting writes\n", __func__);
> +
> +	/* Detect and set jack type for UAJ path before playback.
> +	 * This is required as jack detection does not trigger interrupt
> +	 * when device is in runtime_pm suspend with bus in clock stop mode.
> +	 */
> +	mutex_lock(&tac_dev->uaj_lock);
> +	tac5xx2_sdca_headset_detect(tac_dev);
> +	mutex_unlock(&tac_dev->uaj_lock);

again what does this mutex protect? there is no interrupt so there cannot be any conflict/race with the interrupt callback and even less with hw_params.

> +
> +regmap_sync:
> +	regcache_cache_only(tac_dev->regmap, false);
> +	if (!had_unattached) {
> +		regcache_mark_dirty(tac_dev->regmap);
> +		ret = regcache_sync(tac_dev->regmap);
> +		if (ret < 0)
> +			dev_warn(dev, "Failed to sync regcache: %d\n", ret);
> +	}
> +
> +	return 0;
> +}

> +static struct pci_dev *tac_get_pci_dev(struct sdw_slave *peripheral)
> +{
> +	struct device *dev = &peripheral->dev;
> +
> +	for (; dev; dev = dev->parent) {
> +		if (dev_is_pci(dev))
> +			return to_pci_dev(dev);

I find this surprising, what is the purpose of going up in the device hierarchy to find a PCI device?
Why would this driver care?

> +	}
> +
> +	return NULL;
> +}
> +static int tac_update_status(struct sdw_slave *slave,
> +			     enum sdw_slave_status status)
> +{
> +	int ret;
> +	bool first = false;
> +	struct tac5xx2_prv *tac_dev = dev_get_drvdata(&slave->dev);
> +	struct device *dev = &slave->dev;
> +
> +	tac_dev->status = status;
> +	if (status == SDW_SLAVE_UNATTACHED) {
> +		tac_dev->hw_init = false;
> +		tac_dev->fw_dl_success = false;
> +	}
> +
> +	if (tac_dev->hw_init || tac_dev->status != SDW_SLAVE_ATTACHED) {
> +		dev_dbg(dev, "%s: early return, hw_init=%d, status=%d",
> +			__func__, tac_dev->hw_init, tac_dev->status);
> +		return 0;
> +	}
> +
> +	if (!tac_dev->first_hw_init) {
> +		pm_runtime_set_autosuspend_delay(tac_dev->dev, 3000);
> +		pm_runtime_use_autosuspend(tac_dev->dev);
> +		pm_runtime_mark_last_busy(tac_dev->dev);
> +		pm_runtime_set_active(tac_dev->dev);
> +		pm_runtime_enable(tac_dev->dev);

I suggest you look at other codec drivers, all the pm_runtime configuration is done in the .probe callback and only set_active done upon a change in status.

> +		tac_dev->first_hw_init = true;
> +		first = true;
> +	}
> +
> +	pm_runtime_get_noresume(tac_dev->dev);
> +
> +	regcache_mark_dirty(tac_dev->regmap);
> +	regcache_cache_only(tac_dev->regmap, false);
> +	ret = tac_io_init(&slave->dev, slave, first);
> +	if (ret) {
> +		dev_err(dev, "Device initialization failed: %d\n", ret);
> +		goto err_out;
> +	}
> +
> +	ret = regcache_sync(tac_dev->regmap);
> +	if (ret)
> +		dev_warn(dev, "Failed to sync regcache after init: %d\n", ret);
> +
> +err_out:
> +	pm_runtime_mark_last_busy(tac_dev->dev);
> +	pm_runtime_put_autosuspend(tac_dev->dev);
> +
> +	return ret;
> +}
> +
> +static int tac5xx2_sdw_clk_stop(struct sdw_slave *peripheral,
> +				enum sdw_clk_stop_mode mode,
> +				enum sdw_clk_stop_type type)
> +{
> +	struct tac5xx2_prv *tac_dev = dev_get_drvdata(&peripheral->dev);
> +
> +	dev_dbg(tac_dev->dev, "%s: mode:%d type:%d", __func__, mode, type);
> +	return 0;

this looks rather useless, no?

> +}
> +
> +static int tac5xx2_sdw_read_prop(struct sdw_slave *peripheral)
> +{
> +	struct device *dev = &peripheral->dev;
> +	int ret;
> +
> +	ret = sdw_slave_read_prop(peripheral);
> +	if (ret) {
> +		dev_err(dev, "sdw_slave_read_prop failed: %d", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}

> +static s32 tac_sdw_probe(struct sdw_slave *peripheral,
> +			 const struct sdw_device_id *id)
> +{
> +	struct regmap *regmap;
> +	struct device *dev = &peripheral->dev;
> +	struct tac5xx2_prv *tac_dev;
> +	struct sdca_function_data *function_data = NULL;
> +	int ret, i;
> +
> +	tac_dev = devm_kzalloc(dev, sizeof(*tac_dev), GFP_KERNEL);
> +	if (!tac_dev)
> +		return dev_err_probe(dev, -ENOMEM,
> +				     "Failed devm_kzalloc");
> +
> +	if (peripheral->sdca_data.num_functions > 0) {
> +		dev_dbg(dev, "SDCA functions found: %d",
> +			peripheral->sdca_data.num_functions);
> +
> +		for (i = 0; i < peripheral->sdca_data.num_functions; i++) {
> +			struct sdca_function_data **func_ptr;
> +			const char *func_name;
> +
> +			switch (peripheral->sdca_data.function[i].type) {
> +			case SDCA_FUNCTION_TYPE_SMART_AMP:
> +				func_ptr = &tac_dev->sa_func_data;
> +				func_name = "smartamp";
> +				break;
> +			case SDCA_FUNCTION_TYPE_SMART_MIC:
> +				func_ptr = &tac_dev->sm_func_data;
> +				func_name = "smartmic";
> +				break;
> +			case SDCA_FUNCTION_TYPE_UAJ:
> +				func_ptr = &tac_dev->uaj_func_data;
> +				func_name = "uaj";
> +				break;
> +			case SDCA_FUNCTION_TYPE_HID:
> +				func_ptr = &tac_dev->hid_func_data;
> +				func_name = "hid";
> +				break;
> +			default:
> +				continue;
> +			}
> +
> +			function_data = devm_kzalloc(dev, sizeof(*function_data),
> +						     GFP_KERNEL);
> +			if (!function_data)
> +				return dev_err_probe(dev, -ENOMEM,
> +						     "failed to allocate %s function data",
> +						     func_name);
> +
> +			ret = sdca_parse_function(dev, peripheral,
> +						  &peripheral->sdca_data.function[i],
> +						  function_data);
> +			if (!ret)
> +				*func_ptr = function_data;
> +			else
> +				devm_kfree(dev, function_data);
> +		}
> +	}
> +
> +	dev_dbg(dev, "SDCA functions enabled: SA=%s SM=%s UAJ=%s HID=%s",
> +		tac_dev->sa_func_data ? "yes" : "no",
> +		tac_dev->sm_func_data ? "yes" : "no",
> +		tac_dev->uaj_func_data ? "yes" : "no",
> +		tac_dev->hid_func_data ? "yes" : "no");
> +
> +	tac_dev->dev = dev;
> +	tac_dev->sdw_peripheral = peripheral;
> +	tac_dev->hw_init = false;
> +	tac_dev->first_hw_init = false;
> +	mutex_init(&tac_dev->uaj_lock);
> +	tac_dev->part_id = id->part_id;
> +	dev_set_drvdata(dev, tac_dev);
> +
> +	regmap = devm_regmap_init_sdw_mbq_cfg(&peripheral->dev, peripheral,
> +					      &tac_regmap, &tac_mbq_cfg);
> +	if (IS_ERR(regmap))
> +		return dev_err_probe(dev, PTR_ERR(regmap),
> +				     "Failed devm_regmap_init_sdw\n");
> +
> +	regcache_cache_only(regmap, true);
> +	tac_dev->regmap = regmap;
> +	tac_dev->jack_type = 0;
> +	init_completion(&tac_dev->fw_caching_complete);
> +
> +	if (tac_has_dsp_algo(tac_dev)) {
> +		tac_generate_fw_name(peripheral, tac_dev->fw_binaryname,
> +				     sizeof(tac_dev->fw_binaryname));
> +
> +		ret = tac_load_and_cache_firmware_async(tac_dev);
> +		if (ret) {
> +			complete_all(&tac_dev->fw_caching_complete);
> +			dev_dbg(dev, "failed to load fw: %d, use rom mode\n", ret);
> +		}
> +	} else {
> +		complete_all(&tac_dev->fw_caching_complete);
> +	}
> +
> +	ret = tac_init(tac_dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "failed to initialize tac device\n");
> +
> +	return 0;
> +}
> +
> +static void tac_sdw_remove(struct sdw_slave *peripheral)
> +{
> +	struct tac5xx2_prv *tac_dev = dev_get_drvdata(&peripheral->dev);
> +
> +	mutex_destroy(&tac_dev->uaj_lock);
> +	dev_set_drvdata(&peripheral->dev, NULL);

if you move all the runtime_pm stuff to the probe above, this remove() would also need to be modified to add a pm_runtime_disable()

> +}

