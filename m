Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2730B40DFDC
	for <linux-sound@vger.kernel.org>; Thu, 16 Apr 2026 20:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776371575; cv=none; b=sheP0tmFcePZuOsc4JwhDtRKMm+wt43ekbg2vuL7No9NZraYbfp8uIXFCgm+77Lbwlim839bd7iu5p5P0fvW8aTw2ae+76fi12mH6r/4Z47/BMvfDKVHB6NZCYh9apDx+81jCdGUn3SPqpexgwhq0cjBq2ysyfVEG199cFKFPJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776371575; c=relaxed/simple;
	bh=QNtk93YPWorrLwq5Xkclo2PUavkuFZFQEuA94q0VnPs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oI3Xl3RjMHz4nazw6fM2XNvramDlkjubgzUatuMvZkDe5MjDA/WO57sxUeog7JpA7J2DUQzH1JOY8sdNPNwjMWdeskAoLHVflVOeNQ3qUePryiE+YAjFoYwoz0DFJw+1voTMFcFkPG/d+umaA2GZEB5Z2JbWF/YVB3tgaaMvs44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ml3JxTVc; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ml3JxTVc"
Message-ID: <b1970c45-0dd5-476e-88e6-a5eb1b7ee10b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776371570;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CAb+t42BKxiOIOu9xW2WuTLaQKTqXxRaeVcEuieK+5g=;
	b=ml3JxTVcS+LctfDk4PUa1QkGbrrS45o+5A6m5touI8RJPXXYUpkAaXzE0J5Ju9l19DLpMe
	I+4KaJuBSCBjZaBWQkSW1BVlLlNg0JmE7tawuhxslyOM/njyEv0miOwEMlxkcz3ziM5icJ
	QOyqOzn2qWhPswOGvNAFEFhXmPbCCpQ=
Date: Tue, 14 Apr 2026 13:47:58 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v8 1/3] ASoC: tac5xx2-sdw: add soundwire based codec
 driver
To: Niranjan H Y <niranjan.hy@ti.com>, linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, broonie@kernel.org,
 ckeepax@opensource.cirrus.com, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, cezary.rojewski@intel.com, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, baojun.xu@ti.com, shenghao-ding@ti.com,
 sandeepk@ti.com, v-hampiholi@ti.com
References: <20260410141251.5563-1-niranjan.hy@ti.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260410141251.5563-1-niranjan.hy@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


> +static int tac_clear_latch(struct tac5xx2_prv *priv)
> +{
> +	int ret;
> +
> +	ret = regmap_write(priv->regmap, TAC_INT_CFG, 0X00);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_update_bits(priv->regmap, TAC_INT_CFG,
> +				 TAC_INT_CFG_CLR_REG, TAC_INT_CFG_CLR_REG);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(priv->regmap, TAC_INT_CFG, 0X00);
> +	return ret;

nit-pick: it wouldn't hurt to describe what this sequence does.

> +}
> +
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
> +	int ret, retry;
> +	int function_id;
> +	int pde_entity;
> +	int port_num;
> +	unsigned int actual_ps = 3; /* off */
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
> +		 * This is required as jack is not triggering interrupt
> +		 * when the device is in suspended mode.
> +		 */

presumably in runtime_pm suspend with the bus in clock stop mode, the jack should be able to trigger a bus wake.
You may want to update this comment, 'suspended mode' is a rather overloaded term.

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
> +	mutex_lock(&tac_dev->pde_lock);
> +	regmap_write(tac_dev->regmap, SDW_SDCA_CTL(function_id, pde_entity,
> +						   TAC_SDCA_REQUESTED_PS, 0),
> +		     0x03);
> +	mutex_unlock(&tac_dev->pde_lock);

I think I provided the feedback several times that the "SDCA way" is to write REQUESTED_PS but then wait for ACTUAL_PS to reflect the intended power state.
If this is not required for these devices, you absolutely want to comment on this non-standard device-specific sequences.

Edit: you have a loop to wait on ACTUAL_PS below when you write REQUESTED_PS a second time.
This does require more comments or a code simplification...

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
> +				   SDW_SDCA_CTL(function_id, TAC_SDCA_ENT_PPU11,
> +						TAC_SDCA_CTL_PPU_POSTURE_NUM, 0),
> +				      0);
> +		if (ret) {
> +			dev_err(tac_dev->dev, "Failed to set PPU11: %d", ret);
> +			return ret;
> +		}

Can this register be initialized once on startup? This doesn't look dependent on any stream-specific hw params, and we have no hook to select the 'posture' (SDCA generalized orientation concept) at the moment.

> +
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
> +	ret = regmap_write(tac_dev->regmap,
> +			   SDW_SDCA_CTL(function_id, pde_entity,
> +					TAC_SDCA_REQUESTED_PS, 0), 0);
> +	if (ret) {
> +		dev_err(tac_dev->dev, "failed to set PS to 0: %d\n", ret);
> +		return ret;
> +	}

humm, why do you need to write REQUESTED_PS again?

> +
> +	retry = 3;
> +	do {
> +		ret = regmap_read(tac_dev->regmap,
> +				  SDW_SDCA_CTL(function_id, pde_entity,
> +					       TAC_SDCA_ACTUAL_PS, 0),
> +				  &actual_ps);
> +		if (ret)
> +			continue;
> +		if (!actual_ps)
> +			break;
> +		if (retry)
> +			usleep_range(1000, 1200);
> +	} while (retry--);
> +
> +	if (ret)
> +		dev_err(tac_dev->dev,
> +			"failed to read PS 0 transition, err=%d\n", ret);
> +
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
> +	int pde_entity, function_id, actual_ps, retry;
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
> +	ret = regmap_write(tac_dev->regmap,
> +			   SDW_SDCA_CTL(function_id, pde_entity, 0x01, 0),

TAC_SDCA_REQUESTED_PS?

> +			   0x03);
> +	if (ret)
> +		return ret;
> +
> +	retry = 3;
> +	do {
> +		ret = regmap_read(tac_dev->regmap, SDW_SDCA_CTL(function_id, pde_entity,
> +								TAC_SDCA_ACTUAL_PS, 0),
> +				  &actual_ps);
> +		if (ret)
> +			continue;
> +		if (actual_ps == 0x03)
> +			break;
> +		if (retry)
> +			usleep_range(1000, 1200);
> +	} while (retry--);

this sequence should be a generic SDCA helper really to avoid code duplication.

> +
> +	return ret;
> +}
