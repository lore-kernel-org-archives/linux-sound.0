Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0272928A409
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 09:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749546757; cv=none; b=SnPbVNERJAXiac9JyNil8FBaBqGpIpkjJWp6HzwW+jaoIL1AiporMxjYFW2aZAbRKU1DYI8zlxar4oizy7Jwf4hooAv0polePN6rVmzKISIV/6CvoeuZpr3IwJ8Nkmvxst85vAqaA2SgLXWqKNwEGR5kTX5L+X8ENQP2b6+o7tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749546757; c=relaxed/simple;
	bh=m5aPKINS7mU04RBLRyl2vz94zmI8w6f8NrI8Kcpn5Js=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ibroOM+u5b4XbVkkqsBT+/od+4hRbW1VQs2x6JihDePt+JZ5fy94NBjD+O4gCuv7tRR2+89jA9ULtLvwf3XSt5Ij94WcoFMRUQvQ9KycCg5HNorAP81qH02o4gkFN+TodzXukvqsr7m+XMbWOpu+oAnTHhhPepfXpKqEoPjK6UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=AQC50bc8; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="AQC50bc8"
Message-ID: <4233bfad-973b-4803-82f1-13a0b1dae8cb@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749546752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u7URLDmnu4gMGdorNp5kIg3JflZ+7dNlpHKIAhnVizw=;
	b=AQC50bc80rP7UTwSLn8bCDjLp8vzjzejMt5DFs0QKDD3DToB9w0AMZP/0mvkjGc/CxczBK
	DLgwHMs956H9sqeIhIiuH8bRkoqj50Te9JhioVbAJuNIBZPllg1rBAYtGm8YykPVgdmXu0
	1QtI4j6yaKs55dwcF4CW9CneIwZfkUE=
Date: Tue, 10 Jun 2025 10:52:30 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 6/7] ASoC: SDCA: Generic interrupt support
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com, yung-chuan.liao@linux.intel.com,
 peter.ujfalusi@linux.intel.com
References: <20250609123936.292827-1-ckeepax@opensource.cirrus.com>
 <20250609123936.292827-7-ckeepax@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20250609123936.292827-7-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


> +/**
> + * struct sdca_interrupt - contains information about a single SDCA interrupt
> + * @name: The name of the interrupt.
> + * @component: Pointer to the ASoC component owns the interrupt.
> + * @function: Pointer to the Function that the interrupt is associated with.
> + * @entity: Pointer to the Entity that the interrupt is associated with.
> + * @control: Pointer to the Control that the interrupt is associated with.
> + * @externally_requested: Internal flag used to check if something has already
> + * requested the interrupt.

I am not following what 'externally' and 'something' refer to. Each interrupt is allocated to a specific function/entity/control, this hints at another agent getting in the way but that's not really how this is supposed to work.

This deserves additional clarifications IMHO.

> + */
> +struct sdca_interrupt {
> +	const char *name;
> +
> +	struct snd_soc_component *component;
> +	struct sdca_function_data *function;
> +	struct sdca_entity *entity;
> +	struct sdca_control *control;
> +
> +	bool externally_requested;
> +};
> +
> +/**
> + * struct sdca_interrupt_info - contains top-level SDCA interrupt information
> + * @irq_chip: regmap irq chip structure.
> + * @irq_data: regmap irq chip data structure.
> + * @irqs: Array of data for each individual IRQ.
> + * @irq_lock: Protects access to the list of sdca_interrupt structures.
> + */
> +struct sdca_interrupt_info {
> +	struct regmap_irq_chip irq_chip;
> +	struct regmap_irq_chip_data *irq_data;
> +
> +	struct sdca_interrupt irqs[SDCA_MAX_INTERRUPTS];
> +
> +	struct mutex irq_lock; /* Protect accesses to irqs list */

Can you elaborate on what might conflict?

The only thing I can think of in terms of required locking is access to the common SDCA interrupt registers, but that's different to the irq list.

> +static const struct regmap_irq_chip sdca_irq_chip = {
> +	.name = "sdca_irq",
> +
> +	.status_base = SDW_SCP_SDCA_INT1,
> +	.unmask_base = SDW_SCP_SDCA_INTMASK1,
> +	.ack_base = SDW_SCP_SDCA_INT1,
> +	.num_regs = 4,
> +
> +	.irqs = regmap_irqs,
> +	.num_irqs = SDCA_MAX_INTERRUPTS,
> +
> +	.runtime_pm = true,

can you clarify what this last initialization does? runtime_pm is far from obvious for SDCA with the different levels between the SoundWire bus (enumeration, clock stop, register access, etc) and Function management.

> +};
> +
> +static irqreturn_t base_handler(int irq, void *data)
> +{
> +	struct sdca_interrupt *interrupt = data;
> +	struct device *dev = interrupt->component->dev;
> +
> +	dev_warn(dev, "%s irq without full handling\n", interrupt->name);

is this saying this function is really a placeholder for something else?

> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int sdca_irq_request_locked(struct device *dev,
> +				   struct sdca_interrupt_info *info,
> +				   int sdca_irq, const char *name,
> +				   irq_handler_t handler, void *data)
> +{
> +	int irq;
> +	int ret;
> +
> +	irq = regmap_irq_get_virq(info->irq_data, sdca_irq);
> +	if (irq < 0)
> +		return irq;
> +
> +	ret = devm_request_threaded_irq(dev, irq, NULL, handler,
> +					IRQF_ONESHOT, name, data);
> +	if (ret)
> +		return ret;
> +
> +	dev_dbg(dev, "requested irq %d for %s\n", irq, name);

might be worth adding the function and entity name?

> +
> +	return 0;
> +}
> +
> +/**
> + * sdca_request_irq - request an individual SDCA interrupt
> + * @dev: Pointer to the struct device against which things should be allocated.
> + * @interrupt_info: Pointer to the interrupt information structure.
> + * @sdca_irq: SDCA interrupt position.
> + * @name: Name to be given to the IRQ.
> + * @handler: A callback thread function to be called for the IRQ.
> + * @data: Private data pointer that will be passed to the handler.
> + *
> + * Typically this is handled internally by sdca_irq_populate, however if
> + * a device requires custom IRQ handling this can be called manually before
> + * calling sdca_irq_populate, which will then skip that IRQ whilst processing.
> + *
> + * Return: Zero on success, and a negative error code on failure.
> + */
> +int sdca_irq_request(struct device *dev, struct sdca_interrupt_info *info,
> +		     int sdca_irq, const char *name, irq_handler_t handler,
> +		     void *data)
> +{
> +	int ret;
> +
> +	if (sdca_irq < 0 || sdca_irq > SDCA_MAX_INTERRUPTS) {
> +		dev_err(dev, "bad irq request: %d\n", sdca_irq);
> +		return -EINVAL;
> +	}
> +
> +	guard(mutex)(&info->irq_lock);
> +
> +	ret = sdca_irq_request_locked(dev, info, sdca_irq, name, handler, data);
> +	if (ret) {
> +		dev_err(dev, "failed to request irq %s: %d\n", name, ret);
> +		return ret;
> +	}
> +
> +	info->irqs[sdca_irq].externally_requested = true;

this looks like generic/core code, not sure what's 'external' about this...

> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_NS_GPL(sdca_irq_request, "SND_SOC_SDCA_IRQ");
> +
> +/**
> + * sdca_irq_data_populate - Populate common interrupt data
> + * @component: Pointer to the ASoC component for the Function.
> + * @function: Pointer to the SDCA Function.
> + * @entity: Pointer to the SDCA Entity.
> + * @control: Pointer to the SDCA Control.
> + * @interrupt: Pointer to the SDCA interrupt for this IRQ.
> + *
> + * Return: Zero on success, and a negative error code on failure.
> + */
> +int sdca_irq_data_populate(struct snd_soc_component *component,
> +			   struct sdca_function_data *function,
> +			   struct sdca_entity *entity,
> +			   struct sdca_control *control,
> +			   struct sdca_interrupt *interrupt)
> +{
> +	struct device *dev = component->dev;
> +	const char *name;
> +
> +	name = devm_kasprintf(dev, GFP_KERNEL, "%s %s %s", function->desc->name,
> +			      entity->label, control->label);
> +	if (!name)
> +		return -ENOMEM;
> +
> +	interrupt->name = name;
> +	interrupt->component = component;
> +	interrupt->function = function;
> +	interrupt->entity = entity;
> +	interrupt->control = control;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_NS_GPL(sdca_irq_data_populate, "SND_SOC_SDCA_IRQ");
> +
> +/**
> + * sdca_irq_populate - Request all the individual IRQs for an SDCA Function
> + * @function: Pointer to the SDCA Function.
> + * @component: Pointer to the ASoC component for the Function.
> + * @info: Pointer to the SDCA interrupt info for this device.
> + *
> + * Typically this would be called from the driver for a single SDCA Function.
> + *
> + * Return: Zero on success, and a negative error code on failure.
> + */
> +int sdca_irq_populate(struct sdca_function_data *function,
> +		      struct snd_soc_component *component,
> +		      struct sdca_interrupt_info *info)
> +{
> +	struct device *dev = component->dev;
> +	int i, j;
> +
> +	guard(mutex)(&info->irq_lock);
> +
> +	for (i = 0; i < function->num_entities; i++) {
> +		struct sdca_entity *entity = &function->entities[i];
> +
> +		for (j = 0; j < entity->num_controls; j++) {
> +			struct sdca_control *control = &entity->controls[j];
> +			int irq = control->interrupt_position;
> +			struct sdca_interrupt *interrupt;
> +			const char *name;
> +			int ret;
> +
> +			if (irq == SDCA_NO_INTERRUPT) {
> +				continue;
> +			} else if (irq < 0 || irq >= SDCA_MAX_INTERRUPTS) {
> +				dev_err(dev, "bad irq position: %d\n", irq);
> +				return -EINVAL;
> +			}
> +
> +			interrupt = &info->irqs[irq];
> +
> +			if (interrupt->externally_requested) {
> +				dev_dbg(dev,
> +					"skipping irq %d, externally requested\n",
> +					irq);
> +				continue;
> +			}
> +
> +			ret = sdca_irq_data_populate(component, function, entity,
> +						     control, interrupt);
> +			if (ret)
> +				return ret;
> +
> +			ret = sdca_irq_request_locked(dev, info, irq, interrupt->name,
> +						      base_handler, interrupt);
> +			if (ret) {
> +				dev_err(dev, "failed to request irq %s: %d\n",
> +					name, ret);
> +				return ret;
> +			}
> +		}
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_NS_GPL(sdca_irq_populate, "SND_SOC_SDCA_IRQ");
> +
> +/**
> + * sdca_irq_allocate - allocate an SDCA interrupt structure for a device
> + * @dev: Device pointer against which things should be allocated.
> + * @regmap: regmap to be used for accessing the SDCA IRQ registers.
> + * @irq: The interrupt number.
> + *
> + * Typically this would be called from the top level driver for the whole
> + * SDCA device, as only a single instance is required across all Functions
> + * on the device.
> + *
> + * Return: A pointer to the allocated sdca_interrupt_info struct, or an
> + * error code.
> + */
> +struct sdca_interrupt_info *sdca_irq_allocate(struct device *dev,
> +					      struct regmap *regmap, int irq)
> +{
> +	struct sdca_interrupt_info *info;
> +	int ret;
> +
> +	info = devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
> +	if (!info)
> +		return ERR_PTR(-ENOMEM);
> +
> +	info->irq_chip = sdca_irq_chip;
> +
> +	devm_mutex_init(dev, &info->irq_lock);
> +
> +	ret = devm_regmap_add_irq_chip(dev, regmap, irq, IRQF_ONESHOT, 0,
> +				       &info->irq_chip, &info->irq_data);
> +	if (ret) {
> +		dev_err(dev, "failed to register irq chip: %d\n", ret);
> +		return ERR_PTR(ret);
> +	}
> +
> +	dev_dbg(dev, "registered on irq %d\n", irq);

not sure how helpful this message might be, it'll be rather cryptic without additional context on which interrupt this code handles.

> +
> +	return info;
> +}
> +EXPORT_SYMBOL_NS_GPL(sdca_irq_allocate, "SND_SOC_SDCA_IRQ");
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("SDCA IRQ library");

