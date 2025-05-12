Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166CB2AD18
	for <linux-sound@vger.kernel.org>; Mon, 12 May 2025 14:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747058454; cv=none; b=JuXMaRmUki6XeHrvjNXN9grpEwJIDlsox4gsUQvFnLcrWh5KlRPpQ99SBOcMPb99hFEH5knxAUKx5XL/pzoU8P+6V1bSk8MwCTKRPtC+TisNPgHTHBCgLYaF21F4k3Kdt4ASfnmPO9JaKXz5P7a4TXMyyGJgFkIlQbC1L8r6SSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747058454; c=relaxed/simple;
	bh=sfRIequqLighzB3XcGde2ImfhGZzpctzH+796Lyj2uA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eJHpfJ8AuV/v6oE9/YKqwmGpkQYRS7rzsVm2vOWUhVKkuf83nSWe4CXtsmCIMkGbSNHjwYl8yFk8thDbGpAjVTyylvrvKSnHvF47L8zNjds4xV2iJVCxCwFjqH2vHMDV1IRkMo3852MwRAyKDmJEjayUKirIphXUza1/V3gyub4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=PaTv5ZHX; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="PaTv5ZHX"
Message-ID: <470de11c-82b1-4d1f-aa52-e0849ea261e1@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747058449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HrfyGM5JOeUm79K1wlENPoi3l19Ge32ZVH8mTR2QtDY=;
	b=PaTv5ZHXkYcRjzeaYykG7LITXrascvBpTUFANR4ZwhmoGSLnHhi8bv9NPtIiPgZea4qO2n
	Ih5IMTNVnEwtpplo+ck1VPLSRLhYvhtTTk4aFU3QOhdDAWKqYt3c68DnLyPI6JfNQORhpw
	94jZYwXOPphncmPudWcXFP0XP169cbk=
Date: Mon, 12 May 2025 15:46:40 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v5 4/6] ASoC: SDCA: Create DAPM widgets and routes from
 DisCo
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 peter.ujfalusi@linux.intel.com, linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20250512124240.799509-1-ckeepax@opensource.cirrus.com>
 <20250512124240.799509-5-ckeepax@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20250512124240.799509-5-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 5/12/25 14:42, Charles Keepax wrote:
> Use the previously parsed DisCo information from ACPI to create DAPM
> widgets and routes representing a SDCA Function. For the most part SDCA
> maps well to the DAPM abstractions.
> 
> The primary point of interest is the SDCA Power Domain Entities
> (PDEs), which actually control the power status of the device. Whilst
> these PDEs are the primary widgets the other parts of the SDCA graph
> are added to maintain a consistency with the hardware abstract,
> and allow routing to take effect. As for the PDEs themselves the
> code currently only handle PS0 and PS3 (basically on and off),
> the two intermediate power states are not commonly used and don't
> map well to ASoC/DAPM.
> 
> Other minor points of slightly complexity include, the Group Entities
> (GEs) these set the value of several other controls, typically
> Selector Units (SUs) for enabling a cetain jack configuration. Multiple
> SUs being controlled by a GE are easily modelled creating a single
> control and sharing it among the controlled muxes.
> 
> SDCA also has a slight habit of having fully connected paths, relying
> more on activating the PDEs to enable functionality. This doesn't
> map quite so perfectly to DAPM which considers the path a reason to
> power the PDE. Whilst in the current specification Mixer Units are
> defined as fixed-function, in DAPM we create a virtual control for
> each input (which defaults to connected). This allows paths to be
> connected/disconnected, providing a more ASoC style approach to
> managing the power. PIN_SWITCHs will also be added for non-dataport
> terminal entities in a later patch along with the other ALSA controls,
> providing greater flexibility in power management.

It's been a while since I reviewed an earlier versions so now I am confused.
- Is the proposal to have a control to change the PDE state directly, as well as a virtual control to describe a path activation? That would lead to more flexibility but also to confusion, e.g. with 'no sound' when the paths are active but the PDE still in PS3.
- Or do those virtual controls manage the PDE state, without userspace interaction? In that case the 'connected' default would higher power consumption until userspace decides which paths it really wants active.
 

> +/**
> + * sdca_asoc_count_component - count the various component parts
> + * @function: Pointer to the Function information.
> + * @num_widgets: Output integer pointer, will be filled with the
> + * required number of DAPM widgets for the Function.
> + * @num_routes: Output integer pointer, will be filled with the
> + * required number of DAPM routes for the Function.
> + *
> + * This function counts various things within the SDCA Function such
> + * that the calling driver can allocate appropriate space before
> + * calling the appropriate population functions.
> + *
> + * Return: Returns zero on success, and a negative error code on failure.
> + */
> +int sdca_asoc_count_component(struct device *dev, struct sdca_function_data *function,
> +			      int *num_widgets, int *num_routes)
> +{
> +	int i;
> +
> +	*num_widgets = function->num_entities - 1;
> +	*num_routes = 0;
> +
> +	for (i = 0; i < function->num_entities - 1; i++) {
> +		struct sdca_entity *entity = &function->entities[i];
> +
> +		switch (entity->type) {
> +		case SDCA_ENTITY_TYPE_IT:
> +		case SDCA_ENTITY_TYPE_OT:
> +			*num_routes += !!entity->iot.clock;
> +			*num_routes += !!entity->iot.is_dataport;

I couldn't follow those two lines. 
Why does the clock play a role, for now it's not really managed?
And the difference between streaming and transducer terminals shouldn't change the accounting of routes?

> +			break;
> +		case SDCA_ENTITY_TYPE_PDE:
> +			*num_routes += entity->pde.num_managed;

same here, isn't there a risk of the same route being counted multiple times?

> +			break;
> +		default:
> +			break;
> +		}
> +
> +		*num_routes += entity->num_sources;
> +
> +		if (entity->group)
> +			(*num_routes)++;

And here as well, in case an entity is controlled by a GE does the number of routes really change? 

I guess the meaning of 'routes' isn't really clear in my head, it's not just data paths but control as well that's taken into account?

> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_NS(sdca_asoc_count_component, "SND_SOC_SDCA");

> +static int entity_early_parse_ge(struct device *dev,
> +				 struct sdca_function_data *function,
> +				 struct sdca_entity *entity)
> +{
> +	struct sdca_control_range *range;
> +	struct sdca_control *control;
> +	struct snd_kcontrol_new *kctl;
> +	struct soc_enum *soc_enum;
> +	const char *control_name;
> +	unsigned int *values;
> +	const char **texts;
> +	int i;
> +
> +	control = selector_find_control(dev, entity, SDCA_CTL_GE_SELECTED_MODE);
> +	if (!control)
> +		return -EINVAL;
> +
> +	if (control->layers != SDCA_ACCESS_LAYER_CLASS)
> +		dev_warn(dev, "%s: unexpected access layer: %x\n",
> +			 entity->label, control->layers);
> +
> +	range = control_find_range(dev, entity, control, SDCA_SELECTED_MODE_NCOLS, 0);
> +	if (!range)
> +		return -EINVAL;
> +
> +	control_name = devm_kasprintf(dev, GFP_KERNEL, "%s %s",
> +				      entity->label, control->label);
> +	if (!control_name)
> +		return -ENOMEM;
> +
> +	kctl = devm_kmalloc(dev, sizeof(*kctl), GFP_KERNEL);
> +	if (!kctl)
> +		return -ENOMEM;
> +
> +	soc_enum = devm_kmalloc(dev, sizeof(*soc_enum), GFP_KERNEL);
> +	if (!soc_enum)
> +		return -ENOMEM;
> +
> +	texts = devm_kcalloc(dev, range->rows + 3, sizeof(*texts), GFP_KERNEL);
> +	if (!texts)
> +		return -ENOMEM;
> +
> +	values = devm_kcalloc(dev, range->rows + 3, sizeof(*values), GFP_KERNEL);
> +	if (!values)
> +		return -ENOMEM;
> +
> +	texts[0] = "No Jack";
> +	texts[1] = "Jack Unknown";
> +	texts[2] = "Detection in Progress";
> +	values[0] = 0;
> +	values[1] = 1;
> +	values[2] = 2;
> +	for (i = 0; i < range->rows; i++) {
> +		enum sdca_terminal_type type;
> +
> +		type = sdca_range(range, SDCA_SELECTED_MODE_TERM_TYPE, i);
> +
> +		values[i + 3] = sdca_range(range, SDCA_SELECTED_MODE_INDEX, i);

Humm, my memory of GEs is that the hardware reports a 'DETECTED_MODE' and then software (kernel and/or userspace) can choose a "SELECTED_MODE". here we only deal with SELECTED_MODE, is this intentional?

> +		texts[i + 3] = get_terminal_name(type);
> +		if (!texts[i + 3]) {
> +			dev_err(dev, "%s: unrecognised terminal type: %#x\n",
> +				entity->label, type);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	soc_enum->reg = SDW_SDCA_CTL(function->desc->adr, entity->id, control->sel, 0);
> +	soc_enum->items = range->rows + 3;
> +	soc_enum->mask = roundup_pow_of_two(soc_enum->items) - 1;
> +	soc_enum->texts = texts;
> +	soc_enum->values = values;
> +
> +	kctl->iface = SNDRV_CTL_ELEM_IFACE_MIXER;
> +	kctl->name = control_name;
> +	kctl->info = snd_soc_info_enum_double;
> +	kctl->get = snd_soc_dapm_get_enum_double;
> +	kctl->put = snd_soc_dapm_put_enum_double;
> +	kctl->private_value = (unsigned long)soc_enum;
> +
> +	entity->ge.kctl = kctl;
> +
> +	return 0;
> +}

> +static int entity_parse_it(struct device *dev,
> +			   struct sdca_function_data *function,
> +			   struct sdca_entity *entity,
> +			   struct snd_soc_dapm_widget **widget,
> +			   struct snd_soc_dapm_route **route)
> +{
> +	int i;
> +
> +	if (entity->iot.is_dataport) {
> +		const char *aif_name = devm_kasprintf(dev, GFP_KERNEL, "%s %s",
> +						      entity->label, "Playback");
> +		if (!aif_name)
> +			return -ENOMEM;
> +
> +		(*widget)->id = snd_soc_dapm_aif_in;
> +
> +		add_route(route, entity->label, NULL, aif_name);
> +	} else {
> +		(*widget)->id = snd_soc_dapm_mic;

so for non-dataport terminals there's no route added, but didn't the intro say that there was a virtual control for such terminals? that seems like a route definition if a control can alter the data path, no?

> +	}
> +
> +	if (entity->iot.clock)
> +		add_route(route, entity->label, NULL, entity->iot.clock->label);
> +
> +	for (i = 0; i < entity->num_sources; i++)
> +		add_route(route, entity->label, NULL, entity->sources[i]->label);
> +
> +	(*widget)++;
> +
> +	return 0;
> +}

> +static int entity_pde_event(struct snd_soc_dapm_widget *widget,
> +			    struct snd_kcontrol *kctl, int event)
> +{
> +	struct snd_soc_component *component = widget->dapm->component;
> +	struct sdca_entity *entity = widget->priv;
> +	static const int poll_us = 10000;

This should be a #define, no?

> +	int polls = 1;
> +	unsigned int reg, val;
> +	int from, to, i;
> +	int ret;
> +
> +	if (!component)
> +		return -EIO;
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_POST_PMD:
> +		from = widget->on_val;
> +		to = widget->off_val;
> +		break;
> +	case SND_SOC_DAPM_POST_PMU:
> +		from = widget->off_val;
> +		to = widget->on_val;
> +		break;
> +	}
> +
> +	for (i = 0; i < entity->pde.num_max_delay; i++) {
> +		struct sdca_pde_delay *delay = &entity->pde.max_delay[i];
> +
> +		if (delay->from_ps == from && delay->to_ps == to) {
> +			polls = max(polls, delay->us / poll_us);
> +			break;
> +		}
> +	}
> +
> +	reg = SDW_SDCA_CTL(SDW_SDCA_CTL_FUNC(widget->reg),
> +			   SDW_SDCA_CTL_ENT(widget->reg),
> +			   SDCA_CTL_PDE_ACTUAL_PS, 0);
> +
> +	for (i = 0; i < polls; i++) {
> +		if (i)
> +			fsleep(poll_us);

The logic seems inverted? I would first sleep by the amount of time required for a transition before reading the status register. Here we read it first and then sleep for following iterations. The first read is almost guaranteed to fail.

> +
> +		ret = regmap_read(component->regmap, reg, &val);
> +		if (ret)
> +			return ret;
> +		else if (val == to)
> +			return 0;
> +	}
> +
> +	dev_err(component->dev, "%s: power transition failed: %x\n",
> +		entity->label, val);
> +	return -ETIMEDOUT;
> +}
> +
> +static int entity_parse_pde(struct device *dev,
> +			    struct sdca_function_data *function,
> +			    struct sdca_entity *entity,
> +			    struct snd_soc_dapm_widget **widget,
> +			    struct snd_soc_dapm_route **route)
> +{
> +	unsigned int target = (1 << SDCA_PDE_PS0) | (1 << SDCA_PDE_PS3);
> +	struct sdca_control_range *range;
> +	struct sdca_control *control;
> +	unsigned int mask = 0;
> +	int i;
> +
> +	control = selector_find_control(dev, entity, SDCA_CTL_PDE_REQUESTED_PS);
> +	if (!control)
> +		return -EINVAL;
> +
> +	/* Power should only be controlled by the driver */

is it though? With the virtual controls you were referring to earlier, it's possible that the path is not used and the PDE in PS3. I guess I am still in the dark on what controls the PDE.

> +	if (control->layers != SDCA_ACCESS_LAYER_CLASS)
> +		dev_warn(dev, "%s: unexpected access layer: %x\n",
> +			 entity->label, control->layers);
> +
> +	range = control_find_range(dev, entity, control, SDCA_REQUESTED_PS_NCOLS, 0);
> +	if (!range)
> +		return -EINVAL;
> +
> +	for (i = 0; i < range->rows; i++)
> +		mask |= 1 << sdca_range(range, SDCA_REQUESTED_PS_STATE, i);
> +
> +	if ((mask & target) != target) {
> +		dev_err(dev, "%s: power control missing states\n", entity->label);
> +		return -EINVAL;
> +	}
> +
> +	(*widget)->id = snd_soc_dapm_supply;
> +	(*widget)->reg = SDW_SDCA_CTL(function->desc->adr, entity->id, control->sel, 0);
> +	(*widget)->mask = GENMASK(control->nbits - 1, 0);
> +	(*widget)->on_val = SDCA_PDE_PS0;
> +	(*widget)->off_val = SDCA_PDE_PS3;
> +	(*widget)->event_flags = SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD;
> +	(*widget)->event = entity_pde_event;
> +	(*widget)->priv = entity;
> +	(*widget)++;
> +
> +	for (i = 0; i < entity->pde.num_managed; i++)
> +		add_route(route, entity->pde.managed[i]->label, NULL, entity->label);
> +
> +	for (i = 0; i < entity->num_sources; i++)
> +		add_route(route, entity->label, NULL, entity->sources[i]->label);
> +
> +	return 0;
> +}

> +/* Class selector units will be exported as an ALSA control */
> +static int entity_parse_su_class(struct device *dev,
> +				 struct sdca_function_data *function,
> +				 struct sdca_entity *entity,
> +				 struct sdca_control *control,
> +				 struct snd_soc_dapm_widget **widget,
> +				 struct snd_soc_dapm_route **route)
> +{
> +	struct snd_kcontrol_new *kctl;
> +	struct soc_enum *soc_enum;
> +	const char **texts;
> +	int i;
> +
> +	kctl = devm_kmalloc(dev, sizeof(*kctl), GFP_KERNEL);
> +	if (!kctl)
> +		return -ENOMEM;
> +
> +	soc_enum = devm_kmalloc(dev, sizeof(*soc_enum), GFP_KERNEL);
> +	if (!soc_enum)
> +		return -ENOMEM;
> +
> +	texts = devm_kcalloc(dev, entity->num_sources + 1, sizeof(*texts), GFP_KERNEL);
> +	if (!texts)
> +		return -ENOMEM;
> +
> +	texts[0] = "No Signal";
> +	for (i = 0; i < entity->num_sources; i++)
> +		texts[i + 1] = entity->sources[i]->label;
> +
> +	soc_enum->reg = SDW_SDCA_CTL(function->desc->adr, entity->id, control->sel, 0);
> +	soc_enum->items = entity->num_sources + 1;
> +	soc_enum->mask = roundup_pow_of_two(soc_enum->items) - 1;
> +	soc_enum->texts = texts;
> +
> +	kctl->iface = SNDRV_CTL_ELEM_IFACE_MIXER;
> +	kctl->name = "Route";
> +	kctl->info = snd_soc_info_enum_double;
> +	kctl->get = snd_soc_dapm_get_enum_double;
> +	kctl->put = snd_soc_dapm_put_enum_double;
> +	kctl->private_value = (unsigned long)soc_enum;

Can you remind me in which cases we have a Selector Unit not controlled by a GE, and what userspace would do with such kcontrols?

> +
> +	(*widget)->id = snd_soc_dapm_mux;
> +	(*widget)->kcontrol_news = kctl;
> +	(*widget)->num_kcontrols = 1;
> +	(*widget)++;
> +
> +	for (i = 0; i < entity->num_sources; i++)
> +		add_route(route, entity->label, texts[i + 1], entity->sources[i]->label);
> +
> +	return 0;
> +}

> +static int entity_parse_mu(struct device *dev,
> +			   struct sdca_function_data *function,
> +			   struct sdca_entity *entity,
> +			   struct snd_soc_dapm_widget **widget,
> +			   struct snd_soc_dapm_route **route)
> +{
> +	struct sdca_control *control;
> +	struct snd_kcontrol_new *kctl;
> +	int cn;
> +	int i;
> +
> +	if (!entity->num_sources) {
> +		dev_err(dev, "%s: selector 1 or more inputs\n", entity->label);
> +		return -EINVAL;
> +	}
> +
> +	control = selector_find_control(dev, entity, SDCA_CTL_MU_MIXER);
> +	if (!control)
> +		return -EINVAL;
> +
> +	/* MU control should be through DAPM */
> +	if (control->layers != SDCA_ACCESS_LAYER_CLASS)
> +		dev_warn(dev, "%s: unexpected access layer: %x\n",
> +			 entity->label, control->layers);

isn't this an error? How would DAPM deal with this case?

> +
> +	if (entity->num_sources != hweight64(control->cn_list)) {
> +		dev_err(dev, "%s: mismatched control and sources\n", entity->label);
> +		return -EINVAL;
> +	}
> +
> +	kctl = devm_kcalloc(dev, entity->num_sources, sizeof(*kctl), GFP_KERNEL);
> +	if (!kctl)
> +		return -ENOMEM;
> +
> +	i = 0;
> +	for_each_set_bit(cn, (unsigned long *)&control->cn_list,
> +			 BITS_PER_TYPE(control->cn_list)) {
> +		const char *control_name;
> +		struct soc_mixer_control *mc;
> +
> +		control_name = devm_kasprintf(dev, GFP_KERNEL, "%s %d",
> +					      control->label, i + 1);
> +		if (!control_name)
> +			return -ENOMEM;
> +
> +		mc = devm_kmalloc(dev, sizeof(*mc), GFP_KERNEL);
> +		if (!mc)
> +			return -ENOMEM;
> +
> +		mc->reg = SND_SOC_NOPM;
> +		mc->rreg = SND_SOC_NOPM;
> +		mc->invert = 1; // Ensure default is connected
> +		mc->min = 0;
> +		mc->max = 1;
> +
> +		kctl[i].name = control_name;
> +		kctl[i].private_value = (unsigned long)mc;
> +		kctl[i].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
> +		kctl[i].info = snd_soc_info_volsw;
> +		kctl[i].get = snd_soc_dapm_get_volsw;
> +		kctl[i].put = snd_soc_dapm_put_volsw;
> +		i++;
> +	}
> +
> +	(*widget)->id = snd_soc_dapm_mixer;
> +	(*widget)->kcontrol_news = kctl;
> +	(*widget)->num_kcontrols = entity->num_sources;
> +	(*widget)++;
> +
> +	for (i = 0; i < entity->num_sources; i++)
> +		add_route(route, entity->label, kctl[i].name, entity->sources[i]->label);
> +
> +	return 0;
> +}

> +/**
> + * sdca_asoc_populate_dapm - fill in arrays of DAPM widgets and routes
> + * @dev: Pointer to the device against which allocations will be done.
> + * @function: Pointer to the Function information.
> + * @widget: Array of DAPM widgets to be populated.
> + * @route: Array of DAPM routes to be populated.
> + *
> + * This function populates arrays of DAPM widgets and routes from the
> + * DisCo information for a particular SDCA Function. Typically,
> + * snd_soc_asoc_count_component will be used to allocate appropriately
> + * sized arrays before calling this function.
> + *
> + * Return: Returns zero on success, and a negative error code on failure.
> + */
> +int sdca_asoc_populate_dapm(struct device *dev, struct sdca_function_data *function,
> +			    struct snd_soc_dapm_widget *widget,
> +			    struct snd_soc_dapm_route *route)
> +{
> +	int ret;
> +	int i;
> +
> +	/* Some entities need to add controls referenced by other entities */
> +	for (i = 0; i < function->num_entities - 1; i++) {
> +		struct sdca_entity *entity = &function->entities[i];
> +
> +		switch (entity->type) {
> +		case SDCA_ENTITY_TYPE_GE:
> +			ret = entity_early_parse_ge(dev, function, entity);

what does 'early' mean here? is there a 'late_parse_ge', or is this to say that GEs are parsed first?

> +			if (ret)
> +				return ret;
> +			break;
> +		default:
> +			break;
> +		}
> +	}


