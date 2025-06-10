Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC6528A3FC
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 09:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749546624; cv=none; b=eV3asST1+LrxIJBGBrMhVz/8tG5MWaFyJeL0K2hzFxAgWl60Fh30Jy4JzZ3qykiTOz179dyhGC493LSw12d9v9cy6I0cBtKhvPx8ZgtUShpkG3N9DcGdC8GHJEq3/ROBJW6e71yEL5iReiegNt/EDc6IyjEd9dzAwOldmlwtlZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749546624; c=relaxed/simple;
	bh=ud+3VCzu7jEQlkOBhHzNOJwUMyBxJtKJ3o8aslpGXxo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tSp/tqwNPuI7Qyw4GNfa/uE36E38MKA26w0Js3DS03YrwdFx8ETPITqSWmH+GmYxUGx2odqHlLlR9cLOWkLyNSiTi4XGgx8VrZkjgN2C4wiB/YHTe2LaTYZGwcu+eJVn7XQF4Qgq7wJiJjvRWX0q8PwMJOLeFTMU/hX95HYPrFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=UxEiNdJD; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="UxEiNdJD"
Message-ID: <283bafe1-136d-46f4-a83b-7467d0344fd4@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749546618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zuX3/rPddYq0Bx023UfuvO87XaFRwmBh/xEM9vNYq5I=;
	b=UxEiNdJDXGXHEY526VAnj440tkVGTMqYcY8YWoTvrUWpLNy9sNvQzyN8xa3rvA7VlmqZkb
	rKD+EmhUAL/ek2ZmlzIIcJHuLi1JAve1elZ20EJGgrhHrjFyO08/SuogqgJSuPlK78daFN
	3srd7lvJkNGx9KUUgsHAKid15Natt54=
Date: Tue, 10 Jun 2025 11:07:00 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 7/7] ASoC: SDCA: Add some initial IRQ handlers
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com, yung-chuan.liao@linux.intel.com,
 peter.ujfalusi@linux.intel.com
References: <20250609123936.292827-1-ckeepax@opensource.cirrus.com>
 <20250609123936.292827-8-ckeepax@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20250609123936.292827-8-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


> +static irqreturn_t function_status_handler(int irq, void *data)
> +{
> +	struct sdca_interrupt *interrupt = data;
> +	struct device *dev = interrupt->component->dev;
> +	unsigned int reg, val;
> +	unsigned long status;
> +	unsigned int mask;
> +	int ret;
> +
> +	reg = SDW_SDCA_CTL(interrupt->function->desc->adr, interrupt->entity->id,
> +			   interrupt->control->sel, 0);
> +
> +	ret = regmap_read(interrupt->component->regmap, reg, &val);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to read function status: %d\n", ret);
> +		return IRQ_NONE;

usually when a read fails, the entire device is in the weeds. Not sure squelching the interrupts is wise, something more drastic should happen.

> +	}
> +
> +	dev_dbg(dev, "function status: %#x\n", val);
> +
> +	status = val;
> +	for_each_set_bit(mask, &status, BITS_PER_BYTE) {
> +		mask = 1 << mask;
> +
> +		switch (mask) {
> +		case SDCA_CTL_ENTITY_0_FUNCTION_NEEDS_INITIALIZATION:
> +			//FIXME: Add init writes
> +			break;

between here...

> +		case SDCA_CTL_ENTITY_0_FUNCTION_FAULT:
> +			dev_err(dev, "function fault\n");
> +			break;
> +		case SDCA_CTL_ENTITY_0_UMP_SEQUENCE_FAULT:
> +			dev_err(dev, "ump sequence fault\n");
> +			break;
> +		case SDCA_CTL_ENTITY_0_DEVICE_NEWLY_ATTACHED:
> +		case SDCA_CTL_ENTITY_0_INTS_DISABLED_ABNORMALLY:
> +		case SDCA_CTL_ENTITY_0_STREAMING_STOPPED_ABNORMALLY:
> +		case SDCA_CTL_ENTITY_0_FUNCTION_HAS_BEEN_RESET:

... and here, the status bit essentially mean the Function isn't working as expected. I really don't see the point of attempting to write a register below, we'd need something that essentially resets the SoundWire device to restart from a known position.

> +		case SDCA_CTL_ENTITY_0_FUNCTION_BUSY:
> +			break;

Conversely this one seems harmless, FUNCTION_BUSY only impacts specific SDCA registers and this status cannot have any bearing on how to deal with interrupts.

> +		}
> +	}
> +
> +	ret = regmap_write(interrupt->component->regmap, reg, val);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to clear function status: %d\n", ret);
> +		return IRQ_NONE;
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t detected_mode_handler(int irq, void *data)
> +{
> +	struct sdca_interrupt *interrupt = data;
> +	struct snd_soc_component *component = interrupt->component;
> +	struct device *dev = component->dev;
> +	struct snd_soc_card *card = component->card;
> +	struct rw_semaphore *rwsem = &card->snd_card->controls_rwsem;
> +	struct snd_kcontrol *kctl = interrupt->priv;
> +	struct snd_ctl_elem_value ucontrol;
> +	struct soc_enum *soc_enum;
> +	unsigned int reg, val;
> +	int ret;
> +
> +	if (!kctl) {
> +		const char *name __free(kfree) = kasprintf(GFP_KERNEL, "%s %s",
> +							   interrupt->entity->label,
> +							   SDCA_CTL_SELECTED_MODE_NAME);
> +
> +		if (!name)
> +			return -ENOMEM;
> +
> +		kctl = snd_soc_component_get_kcontrol(component, name);
> +		if (!kctl) {
> +			dev_dbg(dev, "control not found: %s\n", name);
> +			return IRQ_NONE;
> +		}
> +
> +		interrupt->priv = kctl;
> +	}
> +
> +	soc_enum = (struct soc_enum *)kctl->private_value;
> +
> +	reg = SDW_SDCA_CTL(interrupt->function->desc->adr, interrupt->entity->id,
> +			   interrupt->control->sel, 0);

Humm, I have to walk back what I wrote above, if FUNCTION_BUSY is set the read below can be problematic, no?

> +	ret = regmap_read(component->regmap, reg, &val);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to read detected mode: %d\n", ret);
> +		return IRQ_NONE;
> +	}
> +
> +	switch (val) {
> +	case SDCA_DETECTED_MODE_DETECTION_IN_PROGRESS:
> +	case SDCA_DETECTED_MODE_JACK_UNKNOWN:
> +		reg = SDW_SDCA_CTL(interrupt->function->desc->adr,
> +				   interrupt->entity->id,
> +				   SDCA_CTL_GE_SELECTED_MODE, 0);
> +
> +		/*
> +		 * Selected mode is not typically a volatile register, but
> +		 * force a read from the hardware in the case detected mode
> +		 * is unknown to see what the device selected as a "safe"
> +		 * option.
> +		 */

I am not sure this explanation is correct. I was my understanding that when there's a jack interrupt, both the DETECTED and SELECTED values are set by hardware, but SELECTED can be overridden by higher-level software or user interaction. DETECTED is RO, SELECTED is R/W IIRC.

> +		regcache_drop_region(component->regmap, reg, reg);
> +
> +		ret = regmap_read(component->regmap, reg, &val);
> +		if (ret) {
> +			dev_err(dev, "failed to re-check selected mode: %d\n", ret);
> +			return IRQ_NONE;
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	dev_dbg(dev, "%s: %#x\n", interrupt->name, val);
> +
> +	ucontrol.value.enumerated.item[0] = snd_soc_enum_val_to_item(soc_enum, val);
> +
> +	down_write(rwsem);
> +	ret = kctl->put(kctl, &ucontrol);
> +	up_write(rwsem);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to update selected mode: %d\n", ret);
> +		return IRQ_NONE;
> +	}
> +
> +	snd_ctl_notify(card->snd_card, SNDRV_CTL_EVENT_MASK_VALUE, &kctl->id);
> +
> +	return IRQ_HANDLED;
> +}
> +
>  static int sdca_irq_request_locked(struct device *dev,
>  				   struct sdca_interrupt_info *info,
>  				   int sdca_irq, const char *name,
> @@ -202,6 +339,7 @@ int sdca_irq_populate(struct sdca_function_data *function,
>  			struct sdca_control *control = &entity->controls[j];
>  			int irq = control->interrupt_position;
>  			struct sdca_interrupt *interrupt;
> +			irq_handler_t handler;
>  			const char *name;
>  			int ret;
>  
> @@ -226,8 +364,23 @@ int sdca_irq_populate(struct sdca_function_data *function,
>  			if (ret)
>  				return ret;
>  
> +			handler = base_handler;
> +
> +			switch (entity->type) {
> +			case SDCA_ENTITY_TYPE_ENTITY_0:
> +				if (control->sel == SDCA_CTL_ENTITY_0_FUNCTION_STATUS)
> +					handler = function_status_handler;
> +				break;
> +			case SDCA_ENTITY_TYPE_GE:
> +				if (control->sel == SDCA_CTL_GE_DETECTED_MODE)
> +					handler = detected_mode_handler;
> +				break;
> +			default:
> +				break;
> +			}
> +
>  			ret = sdca_irq_request_locked(dev, info, irq, interrupt->name,
> -						      base_handler, interrupt);
> +						      handler, interrupt);
>  			if (ret) {
>  				dev_err(dev, "failed to request irq %s: %d\n",
>  					name, ret);

