Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A8D1F8676
	for <linux-sound@vger.kernel.org>; Wed, 14 May 2025 12:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747226398; cv=none; b=YD7C1z/x1TclCWt1z9FIExEcw2QV9e24Y66mPgKEbtF9+SpdGn8RNZzfRP+LYVBQvbPVGbPlmp6SxMjCnzEuGHQqZfwN8Y2x5oz7BdclUPpiZBcIezP537eNh9ui9kDuUgNPfC+Cg5LhzjAL9y00c43+wUFD1LoaoO6na0xmLmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747226398; c=relaxed/simple;
	bh=4Rhoofz2jY7++AFs38tNQeK9g18nykKM4BBSMB+xBY0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W5FbfiWzrmz/3N60VDVGkif+8Pgij1Ck69kYRdDBNAcucxgHoP3var2I8k9cPEMkcqy2QbG9MT9pwjk9YM/K1Yy2ba5aGl9iU0kCP0+a/ZOdFCrLUeegzCdSp95sW9BZ7H7MgEky01DtUWaRW6DLIoEA7VTSJdqFhHREbHwsUyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Jj8H/Dpn; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Jj8H/Dpn"
Message-ID: <01e25477-5475-457a-8c33-4b6c9fdbdd3e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747226391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KPkKj8k/SNvZCZvQuvn33WjoRmcZY5S8EBJHZ4TUkZo=;
	b=Jj8H/DpnbimygGcjtRiLUHQAv/6wgQNuFHSoRA95OHINTA3RocezEaFRplKoNtAlH7tZRa
	Ah2ShbcfT8geGKHPND3akBqgbBSrHq9TCp/wtlKT3XTzgrj9nOJz+pYJ37uILc6xqwGq6o
	W+7JmZESCGNiE1aY9rsPTMAK5t/G7So=
Date: Wed, 14 May 2025 14:15:01 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v5 4/6] ASoC: SDCA: Create DAPM widgets and routes from
 DisCo
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 peter.ujfalusi@linux.intel.com, linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20250512124240.799509-1-ckeepax@opensource.cirrus.com>
 <20250512124240.799509-5-ckeepax@opensource.cirrus.com>
 <470de11c-82b1-4d1f-aa52-e0849ea261e1@linux.dev>
 <aCIrKasDhXrI9SLq@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <aCIrKasDhXrI9SLq@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Thanks for the comments Charles, I am fine with most of your points except the DETECTED_MODE and a question on the non-GE-managed-SUs, see below
-Pierre

>>> SDCA also has a slight habit of having fully connected paths, relying
>>> more on activating the PDEs to enable functionality. This doesn't
>>> map quite so perfectly to DAPM which considers the path a reason to
>>> power the PDE. Whilst in the current specification Mixer Units are
>>> defined as fixed-function, in DAPM we create a virtual control for
>>> each input (which defaults to connected). This allows paths to be
>>> connected/disconnected, providing a more ASoC style approach to
>>> managing the power. PIN_SWITCHs will also be added for non-dataport
>>> terminal entities in a later patch along with the other ALSA controls,
>>> providing greater flexibility in power management.
>>
>> It's been a while since I reviewed an earlier versions so now
>> I am confused.
>> - Is the proposal to have a control to change the PDE state
>> directly, as well as a virtual control to describe a path
>> activation? That would lead to more flexibility but also to
>> confusion, e.g. with 'no sound' when the paths are active but
>> the PDE still in PS3.
> 
> No the PDEs are their own DAPM widgets and are controlled by
> DAPM, they power up when they are on an active path. User-space
> has no direct control over the power state.
> 
> The two methods user-space has for affecting the power state of
> the system. Firstly, the virtual switches on the mixer units,
> I initially added. These let you connect/disconnect a route into
> the MU. Secondly, the pin switched on the endpoints that you
> requested, these let you enable/disable a non-dataport endpoint.

ok

>> - Or do those virtual controls manage the PDE state, without
>> userspace interaction? In that case the 'connected' default
>> would higher power consumption until userspace decides which
>> paths it really wants active.
> 
> All the pin switches default to on, but that is normal and
> probably makes the most sense since that way paths will generally
> work without any interaction.

ok

>>> +		switch (entity->type) {
>>> +		case SDCA_ENTITY_TYPE_IT:
>>> +		case SDCA_ENTITY_TYPE_OT:
>>> +			*num_routes += !!entity->iot.clock;
>>> +			*num_routes += !!entity->iot.is_dataport;
>>
>> I couldn't follow those two lines.
>> Why does the clock play a role, for now it's not really managed?
> 
> Clocks are managed, it is simply the clock muxes that are not
> fully supported at the moment. Which is because clocks are supply
> widgets and DAPM doesn't really have a concept of selectively
> connecting supply widgets at the moment. Which is a little fiddly
> to implement and given our parts don't use any clock muxes not
> high on my priority list.

ok, makes sense.

>> And the difference between streaming and transducer terminals
>> shouldn't change the accounting of routes?
> 
> Yes it does, remember everything is being mapped to DAPM widgets
> here, so streaming terminals need a DAPM route in from the DAI
> widget.

ah yes, you added one layer. I naively thought the DAI was the input/output terminal directly.
 
>>> +			break;
>>> +		case SDCA_ENTITY_TYPE_PDE:
>>> +			*num_routes += entity->pde.num_managed;
>>
>> same here, isn't there a risk of the same route being counted
>> multiple times?
> 
> The PDE is implemented as a supply widget and it will be
> connected to every widget it controls with a DAPM route to
> signify that connection, this adds space for each of those
> routes.

ok.

>>> +			break;
>>> +		default:
>>> +			break;
>>> +		}
>>> +
>>> +		*num_routes += entity->num_sources;
>>> +
>>> +		if (entity->group)
>>> +			(*num_routes)++;
>>
>> And here as well, in case an entity is controlled by a GE does
>> the number of routes really change? 
> 
> Yes because the GE is also implemented as a supply widget and
> linked to all the widgets it controls.
> 
>> I guess the meaning of 'routes' isn't really clear in my head,
>> it's not just data paths but control as well that's taken into
>> account?
> 
> I mean the hard definition here is DAPM routes. But roughly
> speaking each line on the SDCA function diagram will correspond
> to a route here, with a few tweaks like the GEs only show a
> single line going to a red box around a bunch of other entities
> that will be multiple routes one for each entity in the box.

This could be described in comments. The SDCA spec shows lines of different color for pure data paths and 'control' links. Here we are bringing everything back to the same concept of DAPM routes, but those extra routes only connect to supply widgets.

>>> +	texts[0] = "No Jack";
>>> +	texts[1] = "Jack Unknown";
>>> +	texts[2] = "Detection in Progress";
>>> +	values[0] = 0;
>>> +	values[1] = 1;
>>> +	values[2] = 2;
>>> +	for (i = 0; i < range->rows; i++) {
>>> +		enum sdca_terminal_type type;
>>> +
>>> +		type = sdca_range(range, SDCA_SELECTED_MODE_TERM_TYPE, i);
>>> +
>>> +		values[i + 3] = sdca_range(range, SDCA_SELECTED_MODE_INDEX, i);
>>
>> Humm, my memory of GEs is that the hardware reports a 'DETECTED_MODE' and
>> then software (kernel and/or userspace) can choose a "SELECTED_MODE". here
>> we only deal with SELECTED_MODE, is this intentional?
>>
> 
> This code is creating the ALSA control for the SELECTED_MODE
> control, the DETECTED_MODE is all handled internally and there is
> no need to export it.

Humm, that one doesn't seem right. There could be cases where the DETECTED_MODE is inconclusive, or that additional vendor-specific steps are needed to decide which SELECTED_MODE makes sense. I don't think we should assume everything is handled internally, or we have to define what 'internally' means. This cannot be generic SDCA stuff, it has to be configurable for specific implementations/vendors.

>>> +	if (entity->iot.is_dataport) {
>>> +		const char *aif_name = devm_kasprintf(dev, GFP_KERNEL, "%s %s",
>>> +						      entity->label, "Playback");
>>> +		if (!aif_name)
>>> +			return -ENOMEM;
>>> +
>>> +		(*widget)->id = snd_soc_dapm_aif_in;
>>> +
>>> +		add_route(route, entity->label, NULL, aif_name);
>>> +	} else {
>>> +		(*widget)->id = snd_soc_dapm_mic;
>>
>> so for non-dataport terminals there's no route added, but didn't the intro
>> say that there was a virtual control for such terminals? that seems like a
>> route definition if a control can alter the data path, no?
>>
> 
> This add route is for connecting the DAI widget, the actual
> routes specified by the SDCA topology are added in the for loop
> below.
> 
> And the PIN_SWITCH's are added in the next patch which adds the
> non-DAPM ALSA controls, as noted in the commit message.

ok

>>> +	}
>>> +
>>> +	if (entity->iot.clock)
>>> +		add_route(route, entity->label, NULL, entity->iot.clock->label);
>>> +
>>> +	for (i = 0; i < entity->num_sources; i++)
>>> +		add_route(route, entity->label, NULL, entity->sources[i]->label);
>>> +
>>> +	(*widget)++;
>>> +
>>> +	return 0;
>>> +}
>>
>>> +static int entity_pde_event(struct snd_soc_dapm_widget *widget,
>>> +			    struct snd_kcontrol *kctl, int event)
>>> +{
>>> +	struct snd_soc_component *component = widget->dapm->component;
>>> +	struct sdca_entity *entity = widget->priv;
>>> +	static const int poll_us = 10000;
>>
>> This should be a #define, no?
>>
> 
> I could make it a define if you feel strong but I generally quite
> like if it just a local delay being using in one place to define
> it locally, means you don't have to look things up when reading
> the code.

I guess my main point was to explain where this 10ms value comes from. I am not sure what to make of it, it's either very large or very small depending on the initial and desired power states. Plus I would expect the sleep times to vary by orders of magnitude depending on the type of function managed.

>>> +	for (i = 0; i < polls; i++) {
>>> +		if (i)
>>> +			fsleep(poll_us);
>>
>> The logic seems inverted? I would first sleep by the amount of time
>> required for a transition before reading the status register. Here
>> we read it first and then sleep for following iterations. The first
>> read is almost guaranteed to fail.
>>
> 
> I mean it would be fine to sleep first but often there is enough
> slack in the system that things are ready as soon as you get
> here. Often these transitions are way way way faster than the max
> time we are parsing from DisCo implies.

Sorry, my bad. I thought the DisCo definitions were minimum sleep times, as for HDaudio. But they are worst-case times, so it makes sense to try one's luck early and wait later.

>>> +static int entity_parse_pde(struct device *dev,
>>> +			    struct sdca_function_data *function,
>>> +			    struct sdca_entity *entity,
>>> +			    struct snd_soc_dapm_widget **widget,
>>> +			    struct snd_soc_dapm_route **route)
>>> +{
>>> +	unsigned int target = (1 << SDCA_PDE_PS0) | (1 << SDCA_PDE_PS3);
>>> +	struct sdca_control_range *range;
>>> +	struct sdca_control *control;
>>> +	unsigned int mask = 0;
>>> +	int i;
>>> +
>>> +	control = selector_find_control(dev, entity, SDCA_CTL_PDE_REQUESTED_PS);
>>> +	if (!control)
>>> +		return -EINVAL;
>>> +
>>> +	/* Power should only be controlled by the driver */
>>
>> is it though? With the virtual controls you were referring to earlier, it's
>> possible that the path is not used and the PDE in PS3. I guess I am still in
>> the dark on what controls the PDE.
> 
> The PDE is controlled by the DAPM widget created at the bottom of
> this function and yes power should only be directly controlled by
> drivers.

ok

>>> +	kctl->iface = SNDRV_CTL_ELEM_IFACE_MIXER;
>>> +	kctl->name = "Route";
>>> +	kctl->info = snd_soc_info_enum_double;
>>> +	kctl->get = snd_soc_dapm_get_enum_double;
>>> +	kctl->put = snd_soc_dapm_put_enum_double;
>>> +	kctl->private_value = (unsigned long)soc_enum;
>>
>> Can you remind me in which cases we have a Selector Unit not
>> controlled by a GE, and what userspace would do with such kcontrols?
>>
> 
> A selector unit not tidied to a GE is just a DAPM mux, it
> provides an ALSA control which allows user-space to select which
> input it wants routed through the selector.

I meant in which topologies is this used/needed?

>>> +	/* MU control should be through DAPM */
>>> +	if (control->layers != SDCA_ACCESS_LAYER_CLASS)
>>> +		dev_warn(dev, "%s: unexpected access layer: %x\n",
>>> +			 entity->label, control->layers);
>>
>> isn't this an error? How would DAPM deal with this case?
> 
> In general the control will work the same no matter what access
> specifier it is given, it still sets the control. So I didn't
> really see the need to hard error out here. Mostly likely if one
> gets these its a sign of slightly dodgy DisCo but we should be
> fine to carry one.

ok, probably best to deal with flaky DSDT at a later time.

>>> +int sdca_asoc_populate_dapm(struct device *dev, struct sdca_function_data *function,
>>> +			    struct snd_soc_dapm_widget *widget,
>>> +			    struct snd_soc_dapm_route *route)
>>> +{
>>> +	int ret;
>>> +	int i;
>>> +
>>> +	/* Some entities need to add controls referenced by other entities */
>>> +	for (i = 0; i < function->num_entities - 1; i++) {
>>> +		struct sdca_entity *entity = &function->entities[i];
>>> +
>>> +		switch (entity->type) {
>>> +		case SDCA_ENTITY_TYPE_GE:
>>> +			ret = entity_early_parse_ge(dev, function, entity);
>>
>> what does 'early' mean here? is there a 'late_parse_ge', or is this
>> to say that GEs are parsed first?
> 
> Yeah we need to parse them first such that the GE controls
> are ready when the SUs are parsed since they will link to the
> control generated by the GE.

ok, worthy of a comment to make this dependency clearer.
