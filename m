Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4103EFD05
	for <linux-sound@vger.kernel.org>; Wed,  6 May 2026 12:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778071638; cv=none; b=cv9jRXQo4CIq4yuzn7rU+4zydmmpBBST5z9KmqcMMqApxLp/4qdvRHuTbgBp3AAO+GvuMnUE3lXEBwjr9X9t/Lbcs/zAITGkXXdwtJQNpBfqPFR0U6LZZKePNELXa21DHHIFzqg4UqmVdRu4ziNQe26mTDC86kk/qQloowXvI+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778071638; c=relaxed/simple;
	bh=DF3VXPn1YWn2wop+9VT2l6WKVtVqSXK0/iXQGJhH8N8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XNqy9eDBDxPTUSsxC95sR0UqpYCKHAy6rN05uUA95eYTv6XJ0z4uNQUHPwfZknSJXOTs1JprXpINuB1B+KA+fPUJJcltCbEroOC7IhNBLm/39/n9xhCtIq8khXF7boX9wzzt6dsjdyAF7zf60OTEZhTjDP1We+FVsDjK8KD+drQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=gtwE26kB; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="gtwE26kB"
Message-ID: <0df21295-d3e3-4f53-8d22-dc28244dc4f1@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778071631;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t9qZb86l9kJF2xdly1bnLNufMjVLjEduyu/y61nP3NU=;
	b=gtwE26kBul+CfUDkYP5tiwySw5KYV0ivp9MKq96/03Hc3VS8+Ga4ak3WkJp81ZZ8a/coB3
	2FjBFa8hH7Ngq46H/lAqbh7FOOcRhSerufkK6ghiRpbTKPA9SX+8FzxZz+9Sv/q0n8cYHI
	hcb+3LuyHgh7h4gzPHCfzNMCAAE3G+0=
Date: Wed, 6 May 2026 14:26:34 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v11 3/5] ASoC: es9356-sdca: Add ES9356 SDCA driver
To: Zhang Yi <zhangyi@everest-semi.com>, broonie@kernel.org, tiwai@suse.com,
 linux-sound@vger.kernel.org
Cc: peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 ckeepax@opensource.cirrus.com
References: <20260506025447.3288-1-zhangyi@everest-semi.com>
 <20260506025447.3288-4-zhangyi@everest-semi.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260506025447.3288-4-zhangyi@everest-semi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Looks mostly good, only a couple of comments below:

> +static int es9356_set_jack_detect(struct snd_soc_component *component,
> +	struct snd_soc_jack *hs_jack, void *data)
> +{
> +	struct es9356_sdw_priv *es9356 = snd_soc_component_get_drvdata(component);
> +	int ret;
> +
> +	es9356->hs_jack = hs_jack;

Other codec drivers have this before the pm_runtime_resume_and_get():

	/* we can only resume if the device was initialized at least once */
	if (!rt711->first_hw_init)
		return 0;

	ret = pm_runtime_resume_and_get(component->dev);


> +	ret = pm_runtime_resume_and_get(component->dev);
> +	if (ret < 0) {
> +		if (ret != -EACCES) {
> +			dev_err(component->dev, "%s: failed to resume %d\n", __func__, ret);
> +			return ret;
> +		}
> +		/* pm_runtime not enabled yet */
> +		dev_info(component->dev, "%s: skipping jack init for now\n", __func__);
> +		return 0;
> +	}
> +
> +	if (es9356->hs_jack)
> +		sdw_write_no_pm(es9356->slave, SDW_SCP_SDCA_INTMASK1,
> +			(SDW_SCP_SDCA_INTMASK_SDCA_7 | SDW_SCP_SDCA_INTMASK_SDCA_5 | SDW_SCP_SDCA_INTMASK_SDCA_1));
> +
> +	pm_runtime_mark_last_busy(component->dev);
> +	pm_runtime_put_autosuspend(component->dev);
> +
> +	return 0;


> +static int es9356_power_state(struct snd_soc_dai *dai, unsigned char *func, unsigned char *pde_entity,
> +	unsigned char *cs_entity, int power)
> +{
> +	struct snd_soc_component *component = dai->component;
> +	struct es9356_sdw_priv *es9356 = snd_soc_component_get_drvdata(component);
> +	unsigned char ps0 = 0x0, ps3 = 0x3;
> +	int ret;
> +
> +	switch (dai->id) {
> +	case ES9356_DMIC:
> +		*func = FUNC_NUM_MIC;
> +		*cs_entity = ES9356_SDCA_ENT_CS113;
> +		*pde_entity = ES9356_SDCA_ENT_PDE11;
> +		break;
> +	case ES9356_AMP:
> +		*func = FUNC_NUM_AMP;
> +		*cs_entity = ES9356_SDCA_ENT_CS21;
> +		*pde_entity = ES9356_SDCA_ENT_PDE23;
> +		break;
> +	case ES9356_JACK_IN:
> +		*func = FUNC_NUM_UAJ;
> +		*cs_entity = ES9356_SDCA_ENT_CS36;
> +		*pde_entity = ES9356_SDCA_ENT_PDE34;
> +		break;
> +	case ES9356_JACK_OUT:
> +		*func = FUNC_NUM_UAJ;
> +		*cs_entity = ES9356_SDCA_ENT_CS41;
> +		*pde_entity = ES9356_SDCA_ENT_PDE47;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	/* power state changes are not independent across functions */
> +	mutex_lock(&es9356->pde_lock);
> +	ret = es9356_pde_transition_delay(es9356, *func, *pde_entity, power?ps3:ps0);
> +	if (ret) {
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_CTL(*func, *pde_entity, ES9356_SDCA_CTL_REQ_POWER_STATE, 0), power?ps0:ps3);
> +		es9356_pde_transition_delay(es9356, *func, *pde_entity, power?ps0:ps3);
> +	} else
> +		dev_dbg(component->dev, "%s PDE is already %d\n", __func__, power?ps3:ps0);

why do you need to pass a 'power' argument that you then translate as a power state. just pass the desired power state as argument...

> +
> +	mutex_unlock(&es9356->pde_lock);
> +	return 0;
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
> +	unsigned char func, pde_entity, cs_entity;
> +	unsigned int rate;
> +	int ret;
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
> +	ret = es9356_power_state(dai, &func, &pde_entity, &cs_entity, 1);

nit-pick: pde_entity is not used in this routine.

> +	if (ret) {
> +		dev_err(component->dev, "%s: Invalid dai id: %d\n",
> +			__func__, dai->id);
> +		return -EINVAL;
> +	}
> +
> +	regmap_write(es9356->regmap,
> +			SDW_SDCA_CTL(func, cs_entity, ES9356_SDCA_CTL_SAMPLE_FREQ_INDEX, 0), rate);
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
> +	unsigned char func, pde_entity, cs_entity;
> +	int ret;
> +
> +	if (!es9356->slave)
> +		return -EINVAL;
> +
> +	sdw_stream_remove_slave(es9356->slave, sdw_stream);
> +
> +	ret = es9356_power_state(dai, &func, &pde_entity, &cs_entity, 0);

nit-pick: this helper is a bit weird, it returns information for function, pde and cs that aren't used/necessary here.

> +	if (ret) {
> +		dev_err(component->dev, "%s: Invalid dai id: %d\n",
> +			__func__, dai->id);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}

> +static int es9356_sdca_io_init(struct device *dev, struct sdw_slave *slave)
> +{
> +	struct es9356_sdw_priv *es9356 = dev_get_drvdata(&slave->dev);
> +
> +	if (es9356->hw_init)
> +		return 0;
> +
> +	es9356->disable_irq = false;
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

no, all the initializations should be in the probe, only the set_active() belongs here. see other codecs for inspiration.

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

> +static int es9356_sdw_probe(struct sdw_slave *slave,
> +				const struct sdw_device_id *id)
> +{
> +	struct regmap *regmap;
> +
> +	regmap = devm_regmap_init_sdw_mbq_cfg(&slave->dev, slave, &es9356_sdca_regmap, &es9356_mbq_config);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	return es9356_sdca_init(&slave->dev, regmap, slave);
> +}
> +
> +static int es9356_sdw_remove(struct sdw_slave *slave)
> +{
> +	struct es9356_sdw_priv *es9356 = dev_get_drvdata(&slave->dev);
> +
> +	if (es9356->hw_init) {
> +		cancel_delayed_work_sync(&es9356->interrupt_handle_work);
> +		cancel_delayed_work_sync(&es9356->button_detect_work);
> +	}
> +
> +	if (es9356->first_hw_init)
> +		pm_runtime_disable(&slave->dev);

the pm_runtime_enable() should be in the probe() for symmetry, see comment above.

> +
> +	mutex_destroy(&es9356->disable_irq_lock);
> +	mutex_destroy(&es9356->pde_lock);
> +
> +	return 0;
> +}
> +
> +static const struct sdw_device_id es9356_sdw_id[] = {
> +	SDW_SLAVE_ENTRY_EXT(0x04b3, 0x9356, 0x02, 0, 0),
> +	SDW_SLAVE_ENTRY_EXT(0x04b3, 0x9356, 0x03, 0, 0),
> +	{},
> +};
> +MODULE_DEVICE_TABLE(sdw, es9356_sdw_id);
You also need a separate patch cc: Vinod in drivers/soundwire/intel_auxdevice.c to update this:

static struct wake_capable_part wake_capable_list[] = {

