Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEC51FC3
	for <linux-sound@vger.kernel.org>; Mon, 27 Oct 2025 15:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761578721; cv=none; b=Da47cX3amQ5nPt/sd+RaEvYKYoSGbJoDo6pn314RTQrva5mVsrszJ8Nbiv1+/VlkNn2MQji4H/yrjXyRgsIMmDhJdtSw21sDPZtU9Jx/JmbsKOB3JKYDXif41a+SpukFkwaF0Yu+C3aJ7KiDGSbAeyIXLp1y42ixaqnm6akAh98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761578721; c=relaxed/simple;
	bh=tdFsznqqnwYyZhbruUC6lgL1ux78KE42v2scrikrDlw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N441MUQ+zb7cHIqUmvOl7zA5U9wF05v7t2ru0gePe3kJn/K1+NkFS+h9xs6oqmXQwIVGNbZTJ1MVKlmaFae8pkZZ28Vic6ScfFfAi3lKBPqJdqb8IovP79W25iZX6K18nLbu8PJMKR7ZVOZh3yZhlCTsBr4h0jUILYc1W7pqGBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=j86yTcjs; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="j86yTcjs"
Message-ID: <13c14d26-29ba-4d39-b96a-b12b97935d33@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1761578717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f7iTOvGdKjk0qy0XFcCCCmkErLMtpKv2WxLag2mGv9I=;
	b=j86yTcjsFpJT99xChuvcMkYBbfD4vmr5uPQ2culg46a94dMbm7HvkBV69hpxYaTTc5nADw
	vstUGnx7giFUUQIjViwpcacKZU6O7Z/Pcfz9+5zBcn4Fjll2aErkf0zOkVFLTeWjtFKmul
	9bxOCHup4hkdwEO2ptIBei0MRbDxO6w=
Date: Mon, 27 Oct 2025 16:02:54 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 3/4] ASoC: SDCA: Add basic SDCA class driver
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
 peter.ujfalusi@linux.intel.com, shumingf@realtek.com, lgirdwood@gmail.com,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com
References: <20250925133306.502514-1-ckeepax@opensource.cirrus.com>
 <20250925133306.502514-4-ckeepax@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20250925133306.502514-4-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


> diff --git a/sound/soc/sdca/Kconfig b/sound/soc/sdca/Kconfig
> index e7f36d668f159..56e3ff8448762 100644
> --- a/sound/soc/sdca/Kconfig
> +++ b/sound/soc/sdca/Kconfig
> @@ -37,4 +37,14 @@ config SND_SOC_SDCA_FDL
>  config SND_SOC_SDCA_OPTIONAL
>  	def_tristate SND_SOC_SDCA || !SND_SOC_SDCA
>  
> +config SND_SOC_SDCA_CLASS
> +	tristate "SDCA Class Driver"
> +	select SND_SOC_SDCA
> +	select SND_SOC_SDCA_FDL

which builds on my other comment that the default y is probably not required.
config SND_SOC_SDCA_FDL
	bool "SDCA FDL (File DownLoad) support"
	depends on SND_SOC_SDCA
	default y

> +	select SND_SOC_SDCA_HID
> +	select SND_SOC_SDCA_IRQ
> +	help
> +	  This option enables support for the SDCA Class driver which should
> +	  support any class compliant SDCA part.
> +

> +#define CLASS_SDW_ATTACH_TIMEOUT_MS	5000

maybe add a comment on what the 'ATTACH' refers to.

> +
> +static int class_read_prop(struct sdw_slave *sdw)
> +{
> +	struct sdw_slave_prop *prop = &sdw->prop;
> +
> +	sdw_slave_read_prop(sdw);
> +
> +	prop->use_domain_irq = true;
> +	prop->scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY |
> +			      SDW_SCP_INT1_IMPL_DEF;

Oh now I understand this 'class' driver is really a SoundWire device driver. You should clarify that this isn't meant to deal with function devices but it's one level up.

> +
> +	return 0;
> +}
> +
> +static int class_sdw_update_status(struct sdw_slave *sdw, enum sdw_slave_status status)
> +{
> +	struct sdca_class_drv *drv = dev_get_drvdata(&sdw->dev);
> +
> +	switch (status) {
> +	case SDW_SLAVE_ATTACHED:
> +		dev_info(drv->dev, "device attach\n");

probably too verbose, dev_dbg() would make more sense IMHO.

> +
> +		drv->attached = true;
> +
> +		complete(&drv->device_attach);
> +		break;
> +	case SDW_SLAVE_UNATTACHED:
> +		dev_info(drv->dev, "device detach\n");
> +
> +		drv->attached = false;
> +
> +		reinit_completion(&drv->device_attach);
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct sdw_slave_ops class_sdw_ops = {
> +	.read_prop	= class_read_prop,
> +	.update_status	= class_sdw_update_status,
> +};
> +
> +static void class_regmap_lock(void *data)
> +{
> +	struct mutex *lock = data;
> +
> +	mutex_lock(lock);
> +}
> +
> +static void class_regmap_unlock(void *data)
> +{
> +	struct mutex *lock = data;
> +
> +	mutex_unlock(lock);
> +}
> +
> +static int class_wait_for_attach(struct sdca_class_drv *drv)
> +{
> +	if (!drv->attached) {
> +		unsigned long timeout = msecs_to_jiffies(CLASS_SDW_ATTACH_TIMEOUT_MS);
> +		unsigned long time;
> +
> +		time = wait_for_completion_timeout(&drv->device_attach, timeout);
> +		if (!time) {
> +			dev_err(drv->dev, "timed out waiting for device re-attach\n");
> +			return -ETIMEDOUT;
> +		}
> +	}
> +
> +	regcache_cache_only(drv->dev_regmap, false);
> +
> +	return 0;
> +}
> +
> +static bool class_dev_regmap_volatile(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case SDW_SCP_SDCA_INTMASK1 ... SDW_SCP_SDCA_INTMASK4:
> +		return false;
> +	default:
> +		return true;
> +	}
> +}
> +
> +static bool class_dev_regmap_precious(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case SDW_SCP_SDCA_INT1 ... SDW_SCP_SDCA_INT4:
> +	case SDW_SCP_SDCA_INTMASK1 ... SDW_SCP_SDCA_INTMASK4:
> +		return false;
> +	default:
> +		return true;
> +	}
> +}
> +
> +static const struct regmap_config class_dev_regmap_config = {
> +	.name			= "sdca-device",
> +	.reg_bits		= 32,
> +	.val_bits		= 8,
> +
> +	.max_register		= SDW_SDCA_MAX_REGISTER,
> +	.volatile_reg		= class_dev_regmap_volatile,
> +	.precious_reg		= class_dev_regmap_precious,
> +
> +	.cache_type		= REGCACHE_MAPLE,
> +
> +	.lock			= class_regmap_lock,
> +	.unlock			= class_regmap_unlock,
> +};
> +
> +static void class_boot_work(struct work_struct *work)
> +{
> +	struct sdca_class_drv *drv = container_of(work,
> +						  struct sdca_class_drv,
> +						  boot_work);
> +	int ret;
> +
> +	ret = class_wait_for_attach(drv);
> +	if (ret)
> +		goto err;
> +
> +	drv->irq_info = sdca_irq_allocate(drv->dev, drv->dev_regmap,
> +					  drv->sdw->irq);
> +	if (IS_ERR(drv->irq_info))
> +		goto err;
> +
> +	ret = sdca_dev_register_functions(drv->sdw);
> +	if (ret)
> +		goto err;
> +
> +	dev_dbg(drv->dev, "boot work complete\n");
> +
> +	pm_runtime_mark_last_busy(drv->dev);
> +	pm_runtime_put_autosuspend(drv->dev);
> +
> +	return;
> +
> +err:
> +	pm_runtime_put_sync(drv->dev);
> +}
> +
> +static void class_dev_remove(void *data)
> +{
> +	struct sdca_class_drv *drv = data;
> +
> +	cancel_work_sync(&drv->boot_work);
> +
> +	sdca_dev_unregister_functions(drv->sdw);
> +}
> +
> +static int class_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *id)
> +{
> +	struct device *dev = &sdw->dev;
> +	struct sdca_device_data *data = &sdw->sdca_data;
> +	struct regmap_config *dev_config;
> +	struct sdca_class_drv *drv;
> +	int ret;
> +
> +	sdca_lookup_swft(sdw);
> +
> +	drv = devm_kzalloc(dev, sizeof(*drv), GFP_KERNEL);
> +	if (!drv)
> +		return -ENOMEM;
> +
> +	dev_config = devm_kmemdup(dev, &class_dev_regmap_config,
> +				  sizeof(*dev_config), GFP_KERNEL);
> +	if (!dev_config)
> +		return -ENOMEM;
> +
> +	drv->functions = devm_kcalloc(dev, data->num_functions,
> +				      sizeof(*drv->functions),
> +				      GFP_KERNEL);
> +	if (!drv->functions)
> +		return -ENOMEM;
> +
> +	drv->dev = dev;
> +	drv->sdw = sdw;
> +	mutex_init(&drv->regmap_lock);
> +
> +	dev_set_drvdata(drv->dev, drv);
> +
> +	INIT_WORK(&drv->boot_work, class_boot_work);
> +	init_completion(&drv->device_attach);
> +
> +	dev_config->lock_arg = &drv->regmap_lock;
> +
> +	drv->dev_regmap = devm_regmap_init_sdw(sdw, dev_config);
> +	if (IS_ERR(drv->dev_regmap))
> +		return dev_err_probe(drv->dev, PTR_ERR(drv->dev_regmap),
> +				     "failed to create device regmap\n");
> +
> +	regcache_cache_only(drv->dev_regmap, true);
> +
> +	pm_runtime_set_autosuspend_delay(dev, 250);
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_set_active(dev);
> +	pm_runtime_get_noresume(dev);

This seems odd, I don't recall that we do something similar in existing codec drivers.
It'd be worth explaining the whole pm_runtime flow.

> +
> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_add_action_or_reset(dev, class_dev_remove, drv);
> +	if (ret)
> +		return ret;
> +
> +	queue_work(system_long_wq, &drv->boot_work);
> +
> +	return 0;
> +}
> +
> +static int class_runtime_suspend(struct device *dev)
> +{
> +	struct sdca_class_drv *drv = dev_get_drvdata(dev);
> +
> +	/*
> +	 * Whilst the driver doesn't power the chip down here, going into runtime
> +	 * suspend lets the SoundWire bus power down, which means the driver
> +	 * can't communicate with the device any more.
> +	 */
> +	regcache_cache_only(drv->dev_regmap, true);
> +
> +	return 0;
> +}
> +
> +static int class_runtime_resume(struct device *dev)
> +{
> +	struct sdca_class_drv *drv = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = class_wait_for_attach(drv);

You probably need to explain the model here. In the general case a bus could just enable clock_stop and the attach should be immediate on restarting the clock. The wait only makes sense for cases where the bus is powered-down. Not all solutions will choose the last option.

> +	if (ret)
> +		goto err;
> +
> +	regcache_mark_dirty(drv->dev_regmap);
> +
> +	ret = regcache_sync(drv->dev_regmap);
> +	if (ret) {
> +		dev_err(drv->dev, "failed to restore cache: %d\n", ret);
> +		goto err;
> +	}
> +
> +	return 0;
> +
> +err:
> +	regcache_cache_only(drv->dev_regmap, true);
> +
> +	return ret;
> +}
> +
> +static const struct dev_pm_ops class_pm_ops = {
> +	RUNTIME_PM_OPS(class_runtime_suspend, class_runtime_resume, NULL)
> +};
> +
> +static const struct sdw_device_id class_sdw_id[] = {
> +	SDW_SLAVE_ENTRY(0x01FA, 0x4245, 0),

It seems odd to put specific ACPI identifiers here.
It also begs the question on how extensions could be managed.
For a first-start it's probably ok but we've got to have alignment on how we identify 
- devices for which the default class is 'good-enough'
- devices where an extension on top of the default class is required
- devices where a custom driver is needed

IIRC when I looked at class drivers a long time ago, we don't have the plumbing in the SoundWire bus to automagically load a class driver if no custom driver is found - and adding such plumbing was way above my skills/knowledge.



