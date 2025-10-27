Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8269B30B522
	for <linux-sound@vger.kernel.org>; Mon, 27 Oct 2025 15:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761578723; cv=none; b=ERRI0F+qyszTls+K4VYp3rOYJmBWt73dxoMRzmEFwBJ61GjsUG9C6hazpTGTUgjJgVLFTkdQIxdShDSXWCJWvAD+oiJKuvuxVY3C4Rrh4MPIS8svBqMnlNvU8JzpMgHSASeC24OKw0DRTS9GCbSNXByXUimMBHkZ3ViA3j1qJlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761578723; c=relaxed/simple;
	bh=t49GDFLJpDJm2rQ23lQOb3E3Y1S+HVQD8gAqfFK+aTM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=FLzWIMtiu9Z8RCGIqDp4lPv7KrQihnfpoKq8nES8MszxUJjQjs7d74nYCPUzrdIxcRUgk3cQmSUD7+xWjfHumqjiFUvJ4DzAoWwnqM6k4AqJJP+S7D1JgsDUqeudTvVLC6qBs/4FRsfDvAya574CM2Tnpzd01i8sHCUOrUcxwv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=DWcjPoyD; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="DWcjPoyD"
Message-ID: <8e547635-1ea4-48b8-8e44-7c0e5d2f6092@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1761578719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dR7fkgXjWkUoov3a3lEi/5Guwe1/7SGaj3gkrKyx2AU=;
	b=DWcjPoyDe/ui0t8Jdc96U1FpGPJBteydSpnbQ+4gyChFc0Sk0ttV0B4M5Qn17sCQ8L7B1f
	XyCR4LSrsoSMSiaARGkw8+f2oOClj66/OTYTojm1wztQwBzzVsDNywFDym+31lSaOjGZhB
	mgwvtY/lBs88BZNjzHvOjMIvTbX1zUs=
Date: Mon, 27 Oct 2025 16:24:05 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Subject: Re: [PATCH 4/4] ASoC: SDCA: Add basic SDCA function driver
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
 peter.ujfalusi@linux.intel.com, shumingf@realtek.com, lgirdwood@gmail.com,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com
References: <20250925133306.502514-1-ckeepax@opensource.cirrus.com>
 <20250925133306.502514-5-ckeepax@opensource.cirrus.com>
Content-Language: en-US
In-Reply-To: <20250925133306.502514-5-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


> +static int class_function_sdw_add_peripheral(struct snd_pcm_substream *substream,
> +					     struct snd_pcm_hw_params *params,
> +					     struct snd_soc_dai *dai)
> +{
> +	struct class_function_drv *drv = snd_soc_component_get_drvdata(dai->component);
> +	struct sdw_stream_runtime *sdw_stream = snd_soc_dai_get_dma_data(dai, substream);
> +	struct sdw_slave *sdw = dev_to_sdw_dev(drv->dev->parent);
> +	struct sdw_stream_config sconfig = {0};
> +	struct sdw_port_config pconfig = {0};
> +	int ret;
> +
> +	if (!sdw_stream)
> +		return -EINVAL;
> +
> +	snd_sdw_params_to_config(substream, params, &sconfig, &pconfig);
> +
> +	ret = sdca_asoc_get_port(drv->dev, drv->regmap, drv->function, dai);
> +	if (ret < 0)
> +		return ret;
> +
> +	pconfig.num = ret;

You should probably document the assumption that each function has access to separate ports. 

IIRC there could be cases where ports are *shared* between functions due to hardware restrictions. I remember telling the SDCA committee that either functions were independent or they were not, and the answer is that they are independent except when they aren't. It's probably ok to assume a simple case first to make progress, but with a clear documentation of the known limits.

Oh and for some functions multiple ports are required to make use of different lanes, e.g. for the digital links in the NDAI functions.

> +
> +	ret = sdw_stream_add_slave(sdw, &sconfig, &pconfig, 1, sdw_stream);
> +	if (ret) {
> +		dev_err(drv->dev, "failed to add sdw stream: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return sdca_asoc_hw_params(drv->dev, drv->regmap, drv->function,
> +				   substream, params, dai);
> +}
> +
> +static int class_function_sdw_remove_peripheral(struct snd_pcm_substream *substream,
> +						struct snd_soc_dai *dai)
> +{
> +	struct class_function_drv *drv = snd_soc_component_get_drvdata(dai->component);
> +	struct sdw_stream_runtime *sdw_stream = snd_soc_dai_get_dma_data(dai, substream);
> +	struct sdw_slave *sdw = dev_to_sdw_dev(drv->dev->parent);
> +
> +	if (!sdw_stream)
> +		return -EINVAL;
> +
> +	return sdw_stream_remove_slave(sdw, sdw_stream);
> +}
> +
> +static int class_function_sdw_set_stream(struct snd_soc_dai *dai, void *sdw_stream,
> +					 int direction)
> +{
> +	snd_soc_dai_dma_data_set(dai, direction, sdw_stream);
> +
> +	return 0;
> +}
> +
> +static const struct snd_soc_dai_ops class_function_sdw_ops = {
> +	.startup	= class_function_startup,
> +	.shutdown	= sdca_asoc_free_constraints,
> +	.set_stream	= class_function_sdw_set_stream,
> +	.hw_params	= class_function_sdw_add_peripheral,
> +	.hw_free	= class_function_sdw_remove_peripheral,
> +};
> +
> +static int class_function_component_probe(struct snd_soc_component *component)
> +{
> +	struct class_function_drv *drv = snd_soc_component_get_drvdata(component);
> +	struct sdca_class_drv *core = drv->core;
> +
> +	return sdca_irq_populate(drv->function, component, core->irq_info);
> +}
> +
> +static const struct snd_soc_component_driver class_function_component_drv = {
> +	.probe			= class_function_component_probe,
> +	.endianness		= 1,
> +};
> +
> +static int class_function_boot(struct class_function_drv *drv)
> +{
> +	unsigned int reg = SDW_SDCA_CTL(drv->function->desc->adr,
> +					SDCA_ENTITY_TYPE_ENTITY_0,
> +					SDCA_CTL_ENTITY_0_FUNCTION_STATUS, 0);
> +	unsigned int val;
> +	int ret;
> +
> +	ret = regmap_read(drv->regmap, reg, &val);
> +	if (ret < 0) {
> +		dev_err(drv->dev, "failed to read function status: %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (!(val & SDCA_CTL_ENTITY_0_FUNCTION_HAS_BEEN_RESET)) {
> +		dev_dbg(drv->dev, "reset function device\n");
> +
> +		ret = sdca_reset_function(drv->dev, drv->function, drv->regmap);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (val & SDCA_CTL_ENTITY_0_FUNCTION_NEEDS_INITIALIZATION) {
> +		dev_dbg(drv->dev, "write initialisation\n");
> +
> +		ret = sdca_regmap_write_init(drv->dev, drv->core->dev_regmap,
> +					     drv->function);
> +		if (ret)
> +			return ret;
> +
> +		ret = regmap_write(drv->regmap, reg,
> +				   SDCA_CTL_ENTITY_0_FUNCTION_NEEDS_INITIALIZATION);
> +		if (ret < 0) {
> +			dev_err(drv->dev,
> +				"failed to clear function init status: %d\n",
> +				ret);
> +			return ret;
> +		}
> +	}
> +
> +	/* Start FDL process */
> +	ret = sdca_irq_populate_early(drv->dev, drv->regmap, drv->function,
> +				      drv->core->irq_info);
> +	if (ret)
> +		return ret;
> +
> +	ret = sdca_fdl_sync(drv->dev, drv->function, drv->core->irq_info);
> +	if (ret)
> +		return ret;
> +
> +	ret = sdca_regmap_write_defaults(drv->dev, drv->regmap, drv->function);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(drv->regmap, reg, 0xFF);
> +	if (ret < 0) {
> +		dev_err(drv->dev, "failed to clear function status: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int class_function_probe(struct auxiliary_device *auxdev,
> +				const struct auxiliary_device_id *aux_dev_id)
> +{
> +	struct device *dev = &auxdev->dev;
> +	struct sdca_class_drv *core = dev_get_drvdata(dev->parent);
> +	struct sdca_device_data *data = &core->sdw->sdca_data;
> +	struct sdca_function_desc *desc;
> +	struct snd_soc_component_driver *cmp_drv;
> +	struct snd_soc_dai_driver *dais;
> +	struct class_function_drv *drv;
> +	struct regmap_sdw_mbq_cfg *mbq_config;
> +	struct regmap_config *config;
> +	struct reg_default *defaults;
> +	int ndefaults;
> +	int num_dais;
> +	int ret;
> +	int i;
> +
> +	drv = devm_kzalloc(dev, sizeof(*drv), GFP_KERNEL);
> +	if (!drv)
> +		return -ENOMEM;
> +
> +	cmp_drv = devm_kmemdup(dev, &class_function_component_drv, sizeof(*cmp_drv),
> +			       GFP_KERNEL);
> +	if (!cmp_drv)
> +		return -ENOMEM;
> +
> +	config = devm_kmemdup(dev, &class_function_regmap_config, sizeof(*config),
> +			      GFP_KERNEL);
> +	if (!config)
> +		return -ENOMEM;
> +
> +	mbq_config = devm_kmemdup(dev, &class_function_mbq_config, sizeof(*mbq_config),
> +				  GFP_KERNEL);
> +	if (!mbq_config)
> +		return -ENOMEM;
> +
> +	drv->dev = dev;
> +	drv->core = core;
> +
> +	for (i = 0; i < data->num_functions; i++) {
> +		desc = &data->function[i];
> +
> +		if (desc->type == aux_dev_id->driver_data)
> +			break;
> +	}
> +	if (i == core->sdw->sdca_data.num_functions) {
> +		dev_err(dev, "failed to locate function\n");
> +		return -EINVAL;
> +	}
> +
> +	drv->function = &core->functions[i];
> +
> +	ret = sdca_parse_function(dev, core->sdw, desc, drv->function);
> +	if (ret)
> +		return ret;
> +
> +	ndefaults = sdca_regmap_count_constants(dev, drv->function);
> +	if (ndefaults < 0)
> +		return ndefaults;
> +
> +	defaults = devm_kcalloc(dev, ndefaults, sizeof(*defaults), GFP_KERNEL);
> +	if (!defaults)
> +		return -ENOMEM;
> +
> +	ret = sdca_regmap_populate_constants(dev, drv->function, defaults);
> +	if (ret < 0)
> +		return ret;
> +
> +	regcache_sort_defaults(defaults, ndefaults);
> +
> +	auxiliary_set_drvdata(auxdev, drv);
> +
> +	config->reg_defaults = defaults;
> +	config->num_reg_defaults = ndefaults;
> +	config->lock_arg = &core->regmap_lock;
> +
> +	if (drv->function->busy_max_delay) {
> +		mbq_config->timeout_us = drv->function->busy_max_delay;
> +		mbq_config->retry_us = umax(drv->function->busy_max_delay / 10,
> +					    mbq_config->retry_us);
> +	}
> +
> +	drv->regmap = devm_regmap_init_sdw_mbq_cfg(dev, core->sdw, config, mbq_config);
> +	if (IS_ERR(drv->regmap))
> +		return dev_err_probe(dev, PTR_ERR(drv->regmap),
> +				     "failed to create regmap");
> +
> +	ret = sdca_asoc_populate_component(dev, drv->function, cmp_drv,
> +					   &dais, &num_dais,
> +					   &class_function_sdw_ops);
> +	if (ret)
> +		return ret;
> +
> +	pm_runtime_set_autosuspend_delay(dev, 200);

why 200?

> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_set_active(dev);
> +	pm_runtime_get_noresume(dev);
same comment, this is the same sequence as for the parent and I don't quite follow the pm_runtime flow.

> +
> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = class_function_boot(drv);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_snd_soc_register_component(dev, cmp_drv, dais, num_dais);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to register component\n");
> +
> +	dev_err(dev, "%s: %pfwP: probe completed\n", __func__, auxdev->dev.fwnode);

why is this an error? the error case is handled earlier.

> +
> +	pm_runtime_mark_last_busy(dev);
> +	pm_runtime_put_autosuspend(dev);
> +
> +	return 0;
> +}
> +
> +static int class_function_codec_runtime_suspend(struct device *dev)
> +{
> +	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
> +	struct class_function_drv *drv = auxiliary_get_drvdata(auxdev);
> +
> +	/*
> +	 * Whilst the driver doesn't power the chip down here, going into
> +	 * runtime suspend lets the SoundWire bus power down, which means
> +	 * the driver can't communicate with the device any more.
> +	 */

actually this is not completely correct. The function driver can communicate IF the parent is active. This is copy-paste from the device level but it's not how the hardware works.

> +	regcache_cache_only(drv->regmap, true);

I would also add a comment that all the power management for PE/GEs is handled by DAPM when streams become active/suspended. So there isn't a need to deal with PE/GEs at this level.

> +
> +	return 0;
> +}
> +
> +static int class_function_codec_runtime_resume(struct device *dev)
> +{
> +	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
> +	struct class_function_drv *drv = auxiliary_get_drvdata(auxdev);
> +	int ret;
> +
> +	regcache_cache_only(drv->regmap, false);
> +
> +	regcache_mark_dirty(drv->regmap);

does the order matter?

> +
> +	ret = regcache_sync(drv->regmap);
> +	if (ret) {
> +		dev_err(drv->dev, "failed to restore register cache: %d\n", ret);
> +		goto err;
> +	}
> +
> +	return 0;
> +
> +err:
> +	regcache_cache_only(drv->regmap, true);
> +
> +	return ret;
> +}
> +
> +static const struct dev_pm_ops class_function_pm_ops = {
> +	RUNTIME_PM_OPS(class_function_codec_runtime_suspend,
> +		       class_function_codec_runtime_resume, NULL)
> +};
> +
> +static const struct auxiliary_device_id class_function_id_table[] = {
> +	{
> +		.name = "snd_soc_sdca." SDCA_FUNCTION_TYPE_SMART_AMP_NAME,
> +		.driver_data = SDCA_FUNCTION_TYPE_SMART_AMP,
> +	},
> +	{
> +		.name = "snd_soc_sdca." SDCA_FUNCTION_TYPE_SMART_MIC_NAME,
> +		.driver_data = SDCA_FUNCTION_TYPE_SMART_MIC,
> +	},
> +	{
> +		.name = "snd_soc_sdca." SDCA_FUNCTION_TYPE_UAJ_NAME,
> +		.driver_data = SDCA_FUNCTION_TYPE_UAJ,
> +	},
> +	{
> +		.name = "snd_soc_sdca." SDCA_FUNCTION_TYPE_HID_NAME,
> +		.driver_data = SDCA_FUNCTION_TYPE_HID,
> +	},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(auxiliary, class_function_id_table);
> +
> +static struct auxiliary_driver class_function_drv = {
> +	.driver = {
> +		.name		= "sdca_function",
> +		.pm		= pm_ptr(&class_function_pm_ops),
> +	},
> +
> +	.probe		= class_function_probe,
> +	.id_table	= class_function_id_table
> +};
> +module_auxiliary_driver(class_function_drv);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("SDCA Class Function Driver");
> +MODULE_IMPORT_NS("SND_SOC_SDCA");

