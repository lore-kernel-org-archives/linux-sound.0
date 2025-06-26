Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50AC33F9
	for <linux-sound@vger.kernel.org>; Thu, 26 Jun 2025 12:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750940428; cv=none; b=ul9z7zCH5mzI/if7HV7qGqxODAdKNK0HCoYHZNLCq6/bdUrR/LFIpLHq56tJNBJ5/Go01pD1lPHY/nWpcrXofS6VrsLPmlDfj6KkQxmfCTPBO/CSZkVQx3ARyjG5CzoZ4PBbbmPN+QVsOKIyXZfFft28opILwPGW5InQXpaLGVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750940428; c=relaxed/simple;
	bh=8qyf2byYHIoptaXWsPx2Gk2FPmNUY/3QatcRtH4zmT4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fX5DS3VWhzOZRoj3DLb8nCJvmjOBN+FveI5stn1+Tf+YIc7l4joxSOlJRwxDzt6QsArniisR4ymHphRoPBrc12Yvl4heVHzcUYQGklwixUvbza5rfkT0tpUtu3v6NVMGukU9v7LS7koDowLukIa0x5lL5WtSma6Q+wdntOuMyjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=AO/lMCMO; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="AO/lMCMO"
Message-ID: <9f6c60fa-e73f-40d7-8026-bc58d75283f3@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750940423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MJa4G7/4auEdlpZ6nczUpvZ3HkhHj2VdsH3ca8/587o=;
	b=AO/lMCMO4QE17sgg4oUSgoHj7FVEH0Crl8gAfbZEigCctMT8yawXLKVxbYkI0F9Dogtjid
	Dnl1WUCwxiBZSNb+o9fJcYBeOZ3XxpJgqRW+3qWklniqXy4QWs3GML7WLhGJQoPEtG3sib
	uWUCHCl6HDg06CdgsXnD7KxPMfww1Hc=
Date: Thu, 26 Jun 2025 13:47:54 +0200
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
 <600df1c6-1928-40a2-bced-32cd1f264511@linux.dev>
 <aFE1padVBUQTrBue@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <aFE1padVBUQTrBue@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 6/17/25 11:30, Charles Keepax wrote:
> On Tue, Jun 10, 2025 at 07:55:23PM +0200, Pierre-Louis Bossart wrote:
>> On 6/10/25 12:21, Charles Keepax wrote:
>>> On Tue, Jun 10, 2025 at 10:52:30AM +0200, Pierre-Louis Bossart wrote:
> 
> Apologies for the delay, I was sure I responded to this but I
> must have done one of those writing the email then failing to
> send it tricks.
> 
>>>>> + * @externally_requested: Internal flag used to check if something has already
>>>>> + * requested the interrupt.
>>>>
>>>> I am not following what 'externally' and 'something'
>>>> refer to. Each interrupt is allocated to a specific
>>>> function/entity/control, this hints at another agent getting in
>>>> the way but that's not really how this is supposed to work.
>>>>
>>>> This deserves additional clarifications IMHO.
>>>
>>> I can update the commit message/comment a bit, but the idea
>>> is mostly we are creating an SDCA library here, so there are
>>> two possible IRQ flows, the SDCA framework can handle the IRQ
>>> internally, ie. using the handlers present in sdca_interrupts.c or
>>> the client driver can register a handler for the IRQ directly to
>>> do additional magic. This flag lets the core know that was done.
>>
>> I would have expected a base behavior to deal with the interrupt
>> itself, and optionally a vendor-specific extension for additional
>> magic. I don't really get the notion of 'two possible flows'.
> 
> There really isn't a lot of difference between the two:
> 
>   1) Internal: the handler is all class compliant the core just
>      registers it for you:
>       - device driver calls sdca_irq_allocate to register the
>         root IRQ.
>       - function driver calls sdca_irq_populate to register all
>         the handlers.
>   2) External: the handler is not class compliant the end driver
>      should register its own handler to do whatever magic:
>       - device driver calls sdca_irq_allocate to register the
>         root IRQ.
>       - function driver calls sdca_irq_request for the IRQs that
>         need custom handling.
>       - function driver calls sdca_irq_populate to register any
>         remaining handlers, this can be skipped if all IRQs were
>         registered through sdca_irq_request.
> 
> Its really just a cutting down on boiler plate code thing, one
> could always make the client driver register all IRQs through
> sdca_irq_request and then you wouldn't need the external flag,
> but its nice for compliant devices if you can just have a single
> register all IRQs call.

ok, I see what you are trying to do and I'm fine with it. The use of the word "compliant" is somewhat problematic though, MIPI does not define nor endorse any compliance program and instead talks about 'conformance'. In the case of SDCA, a device could perfectly follow all guidelines of the spec, but require extra magic with a vendor-specific register and/or a vendor-specific extension. That's where you would need dedicated handlers.

> 
>>>>> +	.runtime_pm = true,
>>>>
>>>> can you clarify what this last initialization does? runtime_pm
>>>> is far from obvious for SDCA with the different levels between
>>>> the SoundWire bus (enumeration, clock stop, register access,
>>>> etc) and Function management.
>>>
>>> Means the regmap IRQ handler will do a PM runtime get whilst
>>> handling the IRQ, which will ensure the both the device and the
>>> controller are powered up, which will be necessary for
>>> communicating with the device.
>>
>> this is kind of odd, the device needs to already be up before
>> you have an SDCA interrupt, no?
>> The only case where the device and controller would be in a
>> low-power state would be in the clock-stop, but that's different
>> to the SDCA interrupt, it's the SoundWire 'keep data line high'
>> mechanism.
> 
> I mean yes the device is probably already up when the IRQ is
> first processed by the SoundWire. In general its just good
> practice to be holding a runtime reference whilst interacting
> with the part, stop things turning off whilst you do so.

ok.

>>>>> +static irqreturn_t base_handler(int irq, void *data)
>>>>> +{
>>>>> +	struct sdca_interrupt *interrupt = data;
>>>>> +	struct device *dev = interrupt->component->dev;
>>>>> +
>>>>> +	dev_warn(dev, "%s irq without full handling\n", interrupt->name);
>>>>
>>>> is this saying this function is really a placeholder for
>>>> something else?
>>>
>>> Yeah basically, this will be assigned to any IRQ that doesn't
>>> have an implemented handler. For now that is most things, but
>>> even in the end once the core is more flushed out this will likely
>>> persist as IRQs are control specific in SDCA. This will always be
>>> necessary for controls that don't have any spec mandated handling
>>> but could get an IRQ for implementation specific purposes and
>>> would have a custom handler registered by the client driver. It
>>> is really a default handler to warn the user/system implementor
>>> that some code is likely missing for a part.
>>
>> ok, not sure a dev_warn is required though?
> 
> It is useful information to the user, it typically indicates the
> part is doing something that has no software support. I would be
> happy to downgrade to an info or dbg if you felt strongly, but
> personally I think a warn feels right here.

it's ok for now, once users complain about misleading messages we can always scale this back.

>>>>> +	info->irqs[sdca_irq].externally_requested = true;
>>>>
>>>> this looks like generic/core code, not sure what's 'external'
>>>> about this...
>>>
>>> The key point here is that handler is passed into the function,
>>> that is the destinction between an internal and external here,
>>> internal uses a built in handler, external gets handed a handler
>>> by the client driver.
>>
>> I am not sure I follow this one, you could have a common
>> mechanism followed by a vendor-specific one. Why would there be
>> a choice to make? IIRC the mechanism I implemented in the early
>> stages didn't have this architectural notion of internal/external,
>> just a vendor-specific callback once the interrupt was cleared.
>>
> 
> The regmap IRQ always clears the interrupt, so that is the same
> as your previous implementation. The handler registered here is
> analogous to your vendor-specific callback whether it is
> internal or external. The extra layer here is just a convience,
> the core can register all the IRQ handlers for you if you don't
> need any non-class compliant handling. Just saves a bunch of
> boiler plate in the drivers registering all the IRQs.

ok

