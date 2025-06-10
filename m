Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290F9247DEA
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 17:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749578138; cv=none; b=qo/k43NZU63Wio30KO48TLVBcFpIq1FKccRbBVgkl95uG89KkNIBEmXrUWiX2+a0n0m2axnbKuH0dNZIoXoGaY1L0rtsJUTcC1t4iZ8RKJbjjeJuYfEwvxCeJEA93Q8jotRBgcFeUalkTwRiwA8RlS9uJgzutErcxhEuW0hD2+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749578138; c=relaxed/simple;
	bh=o3v24iUBbkeKyQlUCwEuK0DDZOZPlbMzJUXE4SJO0LY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rvkzmVKXfJ2Vz6N4H1jJcEwveNgQbZ0aQ3yD8APnlhzVAWTnck+QViD79fou/mO2eZgCFcR2aGM8yKxIQnpVYwK5adhKNH+oVnxYhRqUtedIGTCZhYeQJfkunBO1/V1RwOi6BpPTgbIjTWkI6ZnigsFdhBlKLjuGC7C5Gnm+llw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=tV3qQ8AS; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="tV3qQ8AS"
Message-ID: <600df1c6-1928-40a2-bced-32cd1f264511@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749578131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/HdvGdOrc+ZhxHjeA0am5cY/VB98DteU6E4YtBTsuig=;
	b=tV3qQ8ASSClpoO1P7mFS0dGCpuEfFZYOqvj/4mQopz7qUgA2zIo7Cxv2t/Stw0gUV3Bkgl
	p3+OxRVKuB8kM7cR1pDyEE9mBe3Ue8FdBIvF8z9tWrQdjf3tp9C5Xqg6yoKQtd+EMVb4hf
	+n8qQSRIXRaifxHoXCCaAbOhRuQPzQo=
Date: Tue, 10 Jun 2025 19:55:23 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 6/7] ASoC: SDCA: Generic interrupt support
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com, yung-chuan.liao@linux.intel.com,
 peter.ujfalusi@linux.intel.com
References: <20250609123936.292827-1-ckeepax@opensource.cirrus.com>
 <20250609123936.292827-7-ckeepax@opensource.cirrus.com>
 <4233bfad-973b-4803-82f1-13a0b1dae8cb@linux.dev>
 <aEgHQnT1hNU3kJKP@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <aEgHQnT1hNU3kJKP@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 6/10/25 12:21, Charles Keepax wrote:
> On Tue, Jun 10, 2025 at 10:52:30AM +0200, Pierre-Louis Bossart wrote:
>>> + * @externally_requested: Internal flag used to check if something has already
>>> + * requested the interrupt.
>>
>> I am not following what 'externally' and 'something'
>> refer to. Each interrupt is allocated to a specific
>> function/entity/control, this hints at another agent getting in
>> the way but that's not really how this is supposed to work.
>>
>> This deserves additional clarifications IMHO.
> 
> I can update the commit message/comment a bit, but the idea
> is mostly we are creating an SDCA library here, so there are
> two possible IRQ flows, the SDCA framework can handle the IRQ
> internally, ie. using the handlers present in sdca_interrupts.c or
> the client driver can register a handler for the IRQ directly to
> do additional magic. This flag lets the core know that was done.

I would have expected a base behavior to deal with the interrupt itself, and optionally a vendor-specific extension for additional magic. I don't really get the notion of 'two possible flows'.

>>> + * @irq_lock: Protects access to the list of sdca_interrupt structures.
>>> + */
>>> +struct sdca_interrupt_info {
>>> +	struct regmap_irq_chip irq_chip;
>>> +	struct regmap_irq_chip_data *irq_data;
>>> +
>>> +	struct sdca_interrupt irqs[SDCA_MAX_INTERRUPTS];
>>> +
>>> +	struct mutex irq_lock; /* Protect accesses to irqs list */
>>
>> Can you elaborate on what might conflict?
>>
>> The only thing I can think of in terms of required locking
>> is access to the common SDCA interrupt registers, but that's
>> different to the irq list.
> 
> By the nature of SDCA there is one set of IRQs for the device, so
> the irqs list may be accessed from different functions, these
> will by asynchronous so best to gate access to make sure
> everything is happy.

right so it's really protection between concurrent accesses to the irq list initiated by separate function drivers.

>>> +static const struct regmap_irq_chip sdca_irq_chip = {
>>> +	.name = "sdca_irq",
>>> +
>>> +	.status_base = SDW_SCP_SDCA_INT1,
>>> +	.unmask_base = SDW_SCP_SDCA_INTMASK1,
>>> +	.ack_base = SDW_SCP_SDCA_INT1,
>>> +	.num_regs = 4,
>>> +
>>> +	.irqs = regmap_irqs,
>>> +	.num_irqs = SDCA_MAX_INTERRUPTS,
>>> +
>>> +	.runtime_pm = true,
>>
>> can you clarify what this last initialization does? runtime_pm
>> is far from obvious for SDCA with the different levels between
>> the SoundWire bus (enumeration, clock stop, register access,
>> etc) and Function management.
> 
> Means the regmap IRQ handler will do a PM runtime get whilst
> handling the IRQ, which will ensure the both the device and the
> controller are powered up, which will be necessary for
> communicating with the device.

this is kind of odd, the device needs to already be up before you have an SDCA interrupt, no?
The only case where the device and controller would be in a low-power state would be in the clock-stop, but that's different to the SDCA interrupt, it's the SoundWire 'keep data line high' mechanism.

>>> +static irqreturn_t base_handler(int irq, void *data)
>>> +{
>>> +	struct sdca_interrupt *interrupt = data;
>>> +	struct device *dev = interrupt->component->dev;
>>> +
>>> +	dev_warn(dev, "%s irq without full handling\n", interrupt->name);
>>
>> is this saying this function is really a placeholder for
>> something else?
> 
> Yeah basically, this will be assigned to any IRQ that doesn't
> have an implemented handler. For now that is most things, but
> even in the end once the core is more flushed out this will likely
> persist as IRQs are control specific in SDCA. This will always be
> necessary for controls that don't have any spec mandated handling
> but could get an IRQ for implementation specific purposes and
> would have a custom handler registered by the client driver. It
> is really a default handler to warn the user/system implementor
> that some code is likely missing for a part.

ok, not sure a dev_warn is required though?

>>> +static int sdca_irq_request_locked(struct device *dev,
>>> +				   struct sdca_interrupt_info *info,
>>> +				   int sdca_irq, const char *name,
>>> +				   irq_handler_t handler, void *data)
>>> +{
>>> +	int irq;
>>> +	int ret;
>>> +
>>> +	irq = regmap_irq_get_virq(info->irq_data, sdca_irq);
>>> +	if (irq < 0)
>>> +		return irq;
>>> +
>>> +	ret = devm_request_threaded_irq(dev, irq, NULL, handler,
>>> +					IRQF_ONESHOT, name, data);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	dev_dbg(dev, "requested irq %d for %s\n", irq, name);
>>
>> might be worth adding the function and entity name?
> 
> That information isn't really available here, for handlers
> registered by the SDCA core name will be name up of the function,
> entity and control names so the information will be present. For
> custom IRQ handlers it is up to the requesting driver to specify
> a good name.
> 
>>> +int sdca_irq_request(struct device *dev, struct sdca_interrupt_info *info,
>>> +		     int sdca_irq, const char *name, irq_handler_t handler,
>>> +		     void *data)
>>> +{
>>> +	int ret;
>>> +
>>> +	if (sdca_irq < 0 || sdca_irq > SDCA_MAX_INTERRUPTS) {
>>> +		dev_err(dev, "bad irq request: %d\n", sdca_irq);
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	guard(mutex)(&info->irq_lock);
>>> +
>>> +	ret = sdca_irq_request_locked(dev, info, sdca_irq, name, handler, data);
>>> +	if (ret) {
>>> +		dev_err(dev, "failed to request irq %s: %d\n", name, ret);
>>> +		return ret;
>>> +	}
>>> +
>>> +	info->irqs[sdca_irq].externally_requested = true;
>>
>> this looks like generic/core code, not sure what's 'external'
>> about this...
> 
> The key point here is that handler is passed into the function,
> that is the destinction between an internal and external here,
> internal uses a built in handler, external gets handed a handler
> by the client driver.

I am not sure I follow this one, you could have a common mechanism followed by a vendor-specific one. Why would there be a choice to make? IIRC the mechanism I implemented in the early stages didn't have this architectural notion of internal/external, just a vendor-specific callback once the interrupt was cleared.

> 
>>> +/**
>>> + * sdca_irq_allocate - allocate an SDCA interrupt structure for a device
>>> + * @dev: Device pointer against which things should be allocated.
>>> + * @regmap: regmap to be used for accessing the SDCA IRQ registers.
>>> + * @irq: The interrupt number.
>>> + *
>>> + * Typically this would be called from the top level driver for the whole
>>> + * SDCA device, as only a single instance is required across all Functions
>>> + * on the device.
>>> + *
>>> + * Return: A pointer to the allocated sdca_interrupt_info struct, or an
>>> + * error code.
>>> + */
>>> +struct sdca_interrupt_info *sdca_irq_allocate(struct device *dev,
>>> +					      struct regmap *regmap, int irq)
>>> +{
>>> +	struct sdca_interrupt_info *info;
>>> +	int ret;
>>> +
>>> +	info = devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
>>> +	if (!info)
>>> +		return ERR_PTR(-ENOMEM);
>>> +
>>> +	info->irq_chip = sdca_irq_chip;
>>> +
>>> +	devm_mutex_init(dev, &info->irq_lock);
>>> +
>>> +	ret = devm_regmap_add_irq_chip(dev, regmap, irq, IRQF_ONESHOT, 0,
>>> +				       &info->irq_chip, &info->irq_data);
>>> +	if (ret) {
>>> +		dev_err(dev, "failed to register irq chip: %d\n", ret);
>>> +		return ERR_PTR(ret);
>>> +	}
>>> +
>>> +	dev_dbg(dev, "registered on irq %d\n", irq);
>>
>> not sure how helpful this message might be, it'll be rather
>> cryptic without additional context on which interrupt this
>> code handles.
> 
> This is registering the primary IRQ it is the entry point, so
> it isn't a specific IRQ in the SDCA sense. I could change it to
> something like "SDCA root irq registered on %d\n"?

ok

