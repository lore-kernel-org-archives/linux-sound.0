Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51CA388377
	for <linux-sound@vger.kernel.org>; Fri, 24 Apr 2026 13:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777037115; cv=none; b=tmhpc/oMGaw8VpOy1Uu0Z+wW0Waxsv7qE8zyBSsMH4WBMNSPE5JSelcgArC9+gemrDIvYWHhbBBxOR9RI+eALnav0627lkBv4b8cYg6mhNZLPjdZWnQVIwwsLeY+ZD5Fq3Qa5Ui/EH4A6LwLBB8yvmXYCOS9lQ4EaqCnorQgns0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777037115; c=relaxed/simple;
	bh=4jLek8ywiq6yf0DP4SpeLsH4+FOG9LANRqFItcX4lwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dmcqo045GiRGcZnBt0MdFvDXFuypk2+vTX8ZhO2jMBFsyuWaBV8mBT2giPLFwHrO1hDHOu1JXTLnQsQNvDyA6jdT0bYfr98hP6EJYkMPS+9r+iPdeNU6tbazBmWXoq+QD3JF/4Gi1h2tAWV6JSYGIgoPPMxD/H4qhKzBoHQAEuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=wfxturgF; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="wfxturgF"
Message-ID: <b1b6d0cd-293b-43a1-ac3c-6e5bb4dee735@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777037112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CeHvaACN4Zb72yifZvHoGv9VwBbV3zQAWgiIwryJ5dg=;
	b=wfxturgF2MaqQYK07ykSd/BMWtUyj9ok78L8phoCgclx4kJhYBmhiR4l1iX7Do+J/hmlke
	/wrFe+sbFVmTcHOsdXgOP6w79B41QnFxHQTFlzB4NZV2CgAuKVJAA4AqcjIAr2OuNS9Ys2
	wK3vYh3ZitLkVFIHZsyipgRbNtNdLHo=
Date: Fri, 24 Apr 2026 15:24:01 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v10 3/5] ASoC: es9356-sdca: Add ES9356 SDCA driver
To: Zhang Yi <zhangyi@everest-semi.com>, broonie@kernel.org, tiwai@suse.com,
 linux-sound@vger.kernel.org
Cc: peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 ckeepax@opensource.cirrus.com
References: <20260424054928.3257-1-zhangyi@everest-semi.com>
 <20260424054928.3257-4-zhangyi@everest-semi.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260424054928.3257-4-zhangyi@everest-semi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 4/24/26 07:49, Zhang Yi wrote:
> This is the codec driver for es9356-sdca.

Starting to look quite good, additional comments below

> +struct  es9356_sdw_priv {
> +	struct sdw_slave *slave;
> +	struct device *dev;
> +	struct regmap *regmap;
> +	struct snd_soc_component *component;
> +	struct snd_soc_jack *hs_jack;
> +
> +	struct mutex disable_irq_lock;
> +	struct mutex pde_lock;

if you run checkpatch.pl ---strict it'll flag that the expectation is a comment where mutexes are declared.

> +	bool hw_init;
> +	bool first_hw_init;
> +	int jack_type;
> +	bool disable_irq;
> +
> +	struct delayed_work interrupt_handle_work;
> +	struct delayed_work button_detect_work;
> +	unsigned int sdca_status;

> +static int es9356_sdca_button_detect(struct es9356_sdw_priv *es9356)
> +{
> +	unsigned int btn_type = 0, offset, idx, val, owner;
> +	int ret;
> +	unsigned int button[3];

nit-pick: swap last two lines for reverse x-mas style.

> +
> +	ret = regmap_read(es9356->regmap,
> +		SDW_SDCA_CTL(FUNC_NUM_HID, ES9356_SDCA_ENT_HID01, ES9356_SDCA_CTL_HIDTX_CURRENT_OWNER, 0), &owner);
> +	if (ret < 0 || owner == 0x01)
> +		return 0;
> +
> +	ret = regmap_read(es9356->regmap, ES9356_BUF_ADDR_HID, &offset);
> +	if (ret < 0)
> +		goto button_det_end;
> +
> +	for (idx = 0; idx < ARRAY_SIZE(button); idx++) {
> +		ret = regmap_read(es9356->regmap, ES9356_BUF_ADDR_HID + offset + idx, &val);
> +		if (ret < 0)
> +			goto button_det_end;
> +		button[idx] = val;
> +	}
> +
> +	btn_type = es9356_sdca_button(&button[0]);
> +
> +button_det_end:
> +	if (owner == 0x00)
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_HID, ES9356_SDCA_ENT_HID01, ES9356_SDCA_CTL_HIDTX_CURRENT_OWNER, 0), 0x01);
> +
> +	return btn_type;
> +}

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
> +	unsigned char func, pde_entity, cs_entity;
> +	unsigned char ps0 = 0x0, ps3 = 0x3;
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
> +	switch (dai->id) {
> +	case ES9356_DMIC:
> +		func = FUNC_NUM_MIC;
> +		cs_entity = ES9356_SDCA_ENT_CS113;
> +		pde_entity = ES9356_SDCA_ENT_PDE11;
> +		break;
> +	case ES9356_AMP:
> +		func = FUNC_NUM_AMP;
> +		cs_entity = ES9356_SDCA_ENT_CS21;
> +		pde_entity = ES9356_SDCA_ENT_PDE23;
> +		break;
> +	case ES9356_JACK_IN:
> +		func = FUNC_NUM_UAJ;
> +		cs_entity = ES9356_SDCA_ENT_CS36;
> +		pde_entity = ES9356_SDCA_ENT_PDE34;
> +		break;
> +	case ES9356_JACK_OUT:
> +		func = FUNC_NUM_UAJ;
> +		cs_entity = ES9356_SDCA_ENT_CS41;
> +		pde_entity = ES9356_SDCA_ENT_PDE47;
> +		break;
> +	default:
> +		dev_err(component->dev, "%s: Invalid dai id: %d\n",
> +			__func__, dai->id);
> +		return -EINVAL;
> +	}

can this switch + the power sequence below be factored in a helper used by hw_params and hw_free

> +
> +	regmap_write(es9356->regmap,
> +			SDW_SDCA_CTL(func, cs_entity, ES9356_SDCA_CTL_SAMPLE_FREQ_INDEX, 0), rate);

does this need to be done before the power sequence, if not can this be moved before the switch or after the power sequence to help create a helper?
> +
> +	/* power state changes are not independent across functions */
> +	mutex_lock(&es9356->pde_lock);
> +	ret = es9356_pde_transition_delay(es9356, func, pde_entity, ps3);

hah this is interesting, do you need to turn off before turning on?

Actually, since you have a pde_lock, is there really a case where another thread could turn off the power but not wait for the power transition to be complete?

Wondering how useful this is...

> +	if (ret) {
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_CTL(func, pde_entity, ES9356_SDCA_CTL_REQ_POWER_STATE, 0), ps0);
> +		ret = es9356_pde_transition_delay(es9356, func, pde_entity, ps0);
> +	} else
> +		dev_dbg(component->dev, "%s PDE is already PS0", __func__);
> +
> +	mutex_unlock(&es9356->pde_lock);
> +
> +	return 0;
> +}
> +
> +static int es9356_sdw_pcm_hw_free(struct snd_pcm_substream *substream,
> +				  struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_component *component = dai->component;
> +	struct es9356_sdw_priv *es9356 = snd_soc_component_get_drvdata(component);
> +	struct sdw_stream_runtime *sdw_stream = snd_soc_dai_get_dma_data(dai, substream);
> +	int ret;
> +	unsigned char func, pde_entity;
> +	unsigned char ps0 = 0x0, ps3 = 0x3;
> +
> +	if (!es9356->slave)
> +		return -EINVAL;
> +
> +	sdw_stream_remove_slave(es9356->slave, sdw_stream);
> +
> +	switch (dai->id) {
> +	case ES9356_DMIC:
> +		func = FUNC_NUM_MIC;
> +		pde_entity = ES9356_SDCA_ENT_PDE11;
> +		break;
> +	case ES9356_AMP:
> +		func = FUNC_NUM_AMP;
> +		pde_entity = ES9356_SDCA_ENT_PDE23;
> +		break;
> +	case ES9356_JACK_IN:
> +		func = FUNC_NUM_UAJ;
> +		pde_entity = ES9356_SDCA_ENT_PDE34;
> +		break;
> +	case ES9356_JACK_OUT:
> +		func = FUNC_NUM_UAJ;
> +		pde_entity = ES9356_SDCA_ENT_PDE47;
> +		break;
> +	default:
> +		dev_err(component->dev, "%s: Invalid dai id: %d\n",
> +			__func__, dai->id);
> +		return -EINVAL;
> +	}
> +
> +	mutex_lock(&es9356->pde_lock);
> +	ret = es9356_pde_transition_delay(es9356, func, pde_entity, ps0);

same here, do you need to turn on before turning off?
in which cases would the power state NOT be PS0?

> +	if (ret) {
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_CTL(func, pde_entity, ES9356_SDCA_CTL_REQ_POWER_STATE, 0), ps3);
> +		ret = es9356_pde_transition_delay(es9356, func, pde_entity, ps3);
> +	} else
> +		dev_dbg(component->dev, "%s PDE is already PS0", __func__);
> +
> +	mutex_unlock(&es9356->pde_lock);
> +
> +	return 0;
