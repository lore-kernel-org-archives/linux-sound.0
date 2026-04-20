Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765723947B1
	for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 10:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776679954; cv=none; b=ngi4CbJFhgJW6RdWQjX8xexQfwupWYUCkEsFJc0Vm5sErwlOr92YdfMckLkU2jxnkidlsc0b/qYEm7U5TeWRu3IRjzZabVEw9/+uDkgvqpx5U5XpLUUDbDTATZcw60oJPKHKuYmpJrDJNQgtbP0Eu86YRfx0ny6SU5CiQXlO16s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776679954; c=relaxed/simple;
	bh=xtz9H+PoMXer6QAG7G+nYQBJk85DDtfIa2KO7vyErTs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qut5DiqdYLggyuKyGHbeXXhk1qZFqFsKBw+R/v2G0IuxbQzxkhBrZupQbTq9X/svEdLZ+Y/Ps3vleHg2uVHHMXYGOarh5888AgAKJFAP5huPVeMdTusoETHt2ezV093qAEQBb0u3Ul43zIa8T0yzfzBdggN7uxfo5JPKLlFLEWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=J7qyDlZv; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="J7qyDlZv"
Message-ID: <9eb396b8-eb33-466c-a7b2-a1417bd37fdb@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776679949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XDPOnvQaME+11JtB5eNuFcPJIdY/TmlgiYx6IC8Ysuw=;
	b=J7qyDlZvF91zMS6z1m7plz0/PlsybSLD6aUCwZHObJaN4oQrMxHUrA9sSohoxw6hS5bGXs
	j2D2awaJ/H+Go2kBGXzLl+7CISglNJHUkND5Au2oTsXQSCNzBLnBcllKOOhpGe97g5jNHE
	MiNaIO/kymtFCNrdbXdweXKTV+1rKo8=
Date: Mon, 20 Apr 2026 12:10:19 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v9 2/4] ASoC: tac5xx2-sdw: add soundwire based codec
 driver
To: Niranjan H Y <niranjan.hy@ti.com>, linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, broonie@kernel.org,
 ckeepax@opensource.cirrus.com, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, cezary.rojewski@intel.com, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, baojun.xu@ti.com, shenghao-ding@ti.com,
 sandeepk@ti.com, v-hampiholi@ti.com
References: <20260417131401.3104-1-niranjan.hy@ti.com>
 <20260417131401.3104-2-niranjan.hy@ti.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260417131401.3104-2-niranjan.hy@ti.com>
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
> +	/* Lock for firmware download and PDE state transitions.
> +	 * Serializes FW caching/download and DAPM-driven power
> +	 * state changes to prevent PDE operations during firmware load.
> +	 */
> +	struct mutex pde_lock;

that's a lot of stuff that's protected with this lock. See below for one question...


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
> +	unsigned long time;
> +	int ret;
> +	int function_id;
> +	int pde_entity;
> +	int port_num;
> +	u8 sample_rate_idx = 0;
> +
> +	time = wait_for_completion_timeout(&sdw_peripheral->initialization_complete,
> +					   msecs_to_jiffies(TAC5XX2_PROBE_TIMEOUT_MS));
> +	if (!time) {
> +		dev_warn(tac_dev->dev, "%s: hw initialization timeout\n", __func__);
> +		return -ETIMEDOUT;
> +	}
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
> +		/* Detect and set jack type for UAJ path before playback.
> +		 * This is required as jack detection does not trigger interrupt
> +		 * when device is in runtime_pm suspend with bus in clock stop mode.
> +		 */

so here we have an interesting logic - or I misunderstood the comment?

If a headset is inserted when the device is in runtime_pm suspend, how would applications modify the routing and select playback on the headset, which would then ripple down to this hw_params() call?

IOW to play on a headset you first have to know there's a headset.

> +		mutex_lock(&tac_dev->uaj_lock);
> +		tac5xx2_sdca_headset_detect(tac_dev);
> +		mutex_unlock(&tac_dev->uaj_lock);
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
> +	guard(mutex)(&tac_dev->pde_lock);

question I mentioned above: when you reach the hw_params phase, do you really have a potential race with firmware download? What does this specific use of pde_lock protect against?

> +	ret = regmap_write(tac_dev->regmap,
> +			   SDW_SDCA_CTL(function_id, pde_entity,
> +					TAC_SDCA_REQUESTED_PS, 0), 0);
> +	if (ret) {
> +		dev_err(tac_dev->dev, "failed to set PS to 0: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = sdca_asoc_pde_ensure_ps(tac_dev->dev, tac_dev->regmap,
> +				      function_id, pde_entity,
> +				      SDCA_PDE_PS3, SDCA_PDE_PS0,
> +				      NULL, 0);
> +	if (ret)
> +		dev_err(tac_dev->dev,
> +			"failed to transition to PS0, err= %d\n", ret);
> +	return ret;
> +}
> +
> +static s32 tac_sdw_pcm_hw_free(struct snd_pcm_substream *substream,
> +			       struct snd_soc_dai *dai)
> +{
> +	s32 ret;
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
> +	guard(mutex)(&tac_dev->pde_lock);

same here, do you really have a race with firmware download?

Or is this a case of dependencies between functions that requires all power state transitions to be serialized?

> +	ret = regmap_write(tac_dev->regmap,
> +			   SDW_SDCA_CTL(function_id, pde_entity, TAC_SDCA_REQUESTED_PS, 0),
> +			   SDCA_PDE_PS3);
> +	if (ret)
> +		return ret;
> +
> +	ret = sdca_asoc_pde_ensure_ps(tac_dev->dev, tac_dev->regmap,
> +				      function_id, pde_entity,
> +				      SDCA_PDE_PS0, SDCA_PDE_PS3,
> +				      NULL, 0);
> +	if (ret)
> +		dev_err(tac_dev->dev, "failed to trasition from PS0 to PS3");
> +	return ret;
> +}
> +
> +static const struct snd_soc_dai_ops tac_dai_ops = {
> +	.hw_params = tac_sdw_hw_params,
> +	.hw_free = tac_sdw_pcm_hw_free,
> +	.set_stream = tac_set_sdw_stream,
> +	.shutdown = tac_sdw_shutdown,
> +};
> +
> +static int tac5xx2_sdca_btn_type(unsigned char *buffer, struct tac5xx2_prv *tac_dev)
> +{
> +	switch (*buffer) {
> +	case 1: /* play pause */
> +		return SND_JACK_BTN_0;
> +	case 10: /* vol down */
> +		return SND_JACK_BTN_3;
> +	case 8: /* vol up */
> +		return SND_JACK_BTN_2;
> +	case 4: /* long press */
> +		return SND_JACK_BTN_1;
> +	case 2: /* next song */
> +	case 32: /* next song */
> +		return SND_JACK_BTN_4;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static int tac5xx2_sdca_button_detect(struct tac5xx2_prv *tac_dev)
> +{
> +	unsigned int btn_type, offset, idx;
> +	int ret, value, owner;
> +	u8 buf[2];
> +
> +	ret = regmap_read(tac_dev->regmap,
> +			  SDW_SDCA_CTL(TAC_FUNCTION_ID_HID, TAC_SDCA_ENT_HID1,
> +				       TAC_SDCA_CTL_HIDTX_CURRENT_OWNER, 0), &owner);
> +	if (ret) {
> +		dev_err(tac_dev->dev,
> +			"Failed to read current UMP message owner 0x%x", ret);
> +		return ret;
> +	}
> +
> +	if (owner == SDCA_UMP_OWNER_DEVICE) {
> +		dev_dbg(tac_dev->dev, "skip button detect as current owner is not host\n");
> +		return 0;
> +	}
> +
> +	ret = regmap_read(tac_dev->regmap,
> +			  SDW_SDCA_CTL(TAC_FUNCTION_ID_HID, TAC_SDCA_ENT_HID1,
> +				       TAC_SDCA_CTL_HIDTX_MESSAGE_OFFSET, 0), &offset);
> +	if (ret) {
> +		dev_err(tac_dev->dev,
> +			"Failed to read current UMP message offset: %d", ret);
> +		goto end_btn_det;
> +	}
> +
> +	dev_dbg(tac_dev->dev, "button detect: message offset = %x", offset);
> +
> +	for (idx = 0; idx < sizeof(buf); idx++) {
> +		ret = regmap_read(tac_dev->regmap,
> +				  TAC_BUF_ADDR_HID1 + offset + idx, &value);
> +		if (ret) {
> +			dev_err(tac_dev->dev,
> +				"Failed to read HID buffer: %d", ret);
> +			goto end_btn_det;
> +		}
> +		buf[idx] = value & 0xff;
> +	}
> +
> +	if (buf[0] == 0x1) {
> +		btn_type = tac5xx2_sdca_btn_type(&buf[1], tac_dev);
> +		ret = btn_type;
> +	}
> +
> +end_btn_det:
> +	regmap_write(tac_dev->regmap,
> +		     SDW_SDCA_CTL(TAC_FUNCTION_ID_HID, TAC_SDCA_ENT_HID1,
> +				  TAC_SDCA_CTL_HIDTX_CURRENT_OWNER, 0), 0x01);
> +
> +	return ret;
> +}
> +
> +static int tac5xx2_sdca_headset_detect(struct tac5xx2_prv *tac_dev)
> +{
> +	int val, ret;
> +
> +	if (!tac_has_uaj_support(tac_dev))
> +		return 0;

can this really happen? usually you try to detect a headset if the device is capable of dealing with headsets, no?
Should this test be moved at a higher level before you enable low-level handling of headset stuff?

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
> +	if (!tac_has_uaj_support(tac_dev))
> +		return 0;

same here, shouldn't set_jack() be added to the component callbacks before probe?

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
> +	.set_jack = tac5xx2_set_jack,

maybe make this dynamic and only populate .set_jack in tac_init() below when you can deal with a jack?

> +};
> +
> +static s32 tac_init(struct tac5xx2_prv *tac_dev)
> +{
> +	s32 ret;
> +	struct snd_soc_dai_driver *dai_drv;
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
> +	ret = devm_snd_soc_register_component(tac_dev->dev,
> +					      &soc_codec_driver_tacdevice,
> +					      dai_drv, num_dais);
> +	if (ret) {
> +		dev_err(tac_dev->dev, "%s: codec register error:%d.\n",
> +			__func__, ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}


