Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895A23E51D4
	for <linux-sound@vger.kernel.org>; Mon,  4 May 2026 17:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777914525; cv=none; b=Ymb0V+GjwJQca66wD6RSOs5GNpUJg+msrJ++YwXhTRz8LhlqX8KhstvIfgSAD+ITnViGfwZmxKlcUxWiMDCNI8w7muB8fhNmrCGRmUNxjBlrv5Yau8O182kKh+3erbMUzKVQj032zbeeSN0HRFg8rD9eKs/kGOHkEVUBUuJ14f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777914525; c=relaxed/simple;
	bh=aFx4Ehy2kU0sK44qOes1qRFmz8MUSwem4QYwhLMTvQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LZSLLqa5rd+xyRuHVmzruBWMey1YAvmZruYNdrnhJ5/wzKmIRTVzy/DTl20zAjpTJqa4fZQG5TNZkONTfF1yOvp6hI64OTojyK3/WVaLWUir47VfufcEdnRfNS1oCaMhMmivomWsqKIoW9gYH95/6XJZDPA0HXjKZvqY1+4o/oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=CwhyQlnS; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="CwhyQlnS"
Message-ID: <38b91312-31e8-4c20-bea8-ce6e8d4e7365@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777914507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9p1qt/Rcb5WtjgrNhODJKKHVDs97CrfsnIByz1zL9EQ=;
	b=CwhyQlnS5oZr3kwSHfW+dqn8FDjweM1VaS6brA9UA7EL2tTfpCWssbSum+8UljsSdlTARR
	CSeDjsQI7Y5NHFyrNbTIxN2TJyuQOdqy46t5aTxQbCv00fSlq6ckv+uWWQ7NmFF112K5D1
	OixStNr5prA2Ayj0pdclFG+1WUqUOtU=
Date: Mon, 4 May 2026 19:07:12 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v15 2/4] ASoC: tac5xx2-sdw: add soundwire based codec
 driver
To: Niranjan H Y <niranjan.hy@ti.com>, linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, broonie@kernel.org,
 ckeepax@opensource.cirrus.com, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, cezary.rojewski@intel.com, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, baojun.xu@ti.com, shenghao-ding@ti.com,
 sandeepk@ti.com, v-hampiholi@ti.com
References: <20260504125716.2015-1-niranjan.hy@ti.com>
 <20260504125716.2015-3-niranjan.hy@ti.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260504125716.2015-3-niranjan.hy@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 5/4/26 14:57, Niranjan H Y wrote:
> Add codec driver for tac5xx2 family of devices.
> This includes the support for
>   1. tac5572 - DAC, PDM, UAJ and HID
>   2. tas2883 - Amplifier with DSP
>   3. tac5672 - Similar to tac5572 with feedback
>   4. tac5682 - Similar to tac5672 with Amplifier DSP.
> 
> Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>

Thanks for bearing with my reviews, this driver looks pretty good to me at this point

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>

I added additional comments that can be handled in future updates if desired.


> +static int tac_sdw_hw_params(struct snd_pcm_substream *substream,
> +			     struct snd_pcm_hw_params *params,
> +			     struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_component *component = dai->component;
> +	struct tac5xx2_prv *tac_dev = snd_soc_component_get_drvdata(component);
> +	struct sdw_slave *sdw_peripheral = tac_dev->sdw_peripheral;
> +	struct sdw_stream_runtime *sdw_stream;
> +	struct sdw_stream_config stream_config = {0};
> +	struct sdw_port_config port_config = {0};
> +	u8 sample_rate_idx = 0;
> +	int function_id;
> +	int pde_entity;
> +	int port_num;
> +	int ret;
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
> +		dev_err(tac_dev->dev, "Invalid dai id: %d for power up\n", dai->id);
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
> +		dev_err(tac_dev->dev,
> +			"failed to set func %d, entity %d's requested PS to 0: %d\n",
> +			function_id, pde_entity, ret);
> +		return ret;
> +	}
> +
> +	ret = sdca_asoc_pde_poll_actual_ps(tac_dev->dev, tac_dev->regmap, function_id, pde_entity,
> +					   SDCA_PDE_PS3, SDCA_PDE_PS0, NULL, 0);
> +	if (ret)
> +		dev_err(tac_dev->dev, "failed to transition func %d, pde %d from PS3 -> PS0, err=%d\n",
> +			function_id, pde_entity, ret);
> +	return ret;
> +}

In theory it can happen that hw_params() is invoked multiple times with different parameters, without hw_free() invoked.
You may want to double-check if it's ok to change the sample-rate index after moving to PS_0, IOW that it's safe to call hw_params() multiple times.


> +static int tac_port_prep(struct sdw_slave *slave, struct sdw_prepare_ch *prep_ch,
> +			 enum sdw_port_prep_ops pre_ops)
> +{
> +	struct device *dev = &slave->dev;
> +	struct tac5xx2_prv *tac_dev = dev_get_drvdata(dev);
> +	unsigned int val;
> +	int ret;
> +
> +	if (pre_ops != SDW_OPS_PORT_POST_PREP)
> +		return 0;
> +
> +	if (!tac_dev->fw_dl_success)
> +		return 0;
> +
> +	ret = regmap_read(tac_dev->regmap, TAC_DSP_ALGO_STATUS, &val);
> +	if (ret) {
> +		dev_err(dev, "Failed to read algo status: %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (val != TAC_DSP_ALGO_STATUS_RUNNING) {
> +		dev_dbg(dev, "Algo not running (0x%02x), re-enabling\n", val);
> +		ret = regmap_write(tac_dev->regmap, TAC_DSP_ALGO_STATUS,
> +				   TAC_DSP_ALGO_STATUS_RUNNING);

this part is interesting, when the port is prepared the DSP is set as RUNNING, but I don't see when the DSP would be stopped?

Let's say that all streams are stopped and all PDEs are in PS_3, wouldn't the DSP need to be managed at some point to reach a lower power?


