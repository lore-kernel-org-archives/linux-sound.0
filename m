Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019DB2264AB
	for <linux-sound@vger.kernel.org>; Tue,  9 Sep 2025 13:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757423719; cv=none; b=Z4Qdr+Rm0ZG2DOJscQ4c3S3TWMkpNydyoYACqJNdN6gTeFIuz7M/hu+d0eIlu9o5ZuXzBXSCJfPUX2wVb/y0PhB70uqhCuaILHaJfI9mz3F7up4t5v9dQ7aRLpWrREeaTEPpLJ3oy7LCf78B9SY9ydNIpfjPOT51wPJ/5/d1Iu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757423719; c=relaxed/simple;
	bh=R6wafAiA1mp8+7Jj+8LZbciVz8ES24OXWphN+Z8Xtg4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tb9xzgpTDvkVr2+HxLg78Cr2w7ISMD3e0X2PxketieavwOhvuLAZKrqKMM1YfKMYdqS9gQ0FC8k9WDcmS3Mt0bKN7UnX9BUuQWvqHs2NAZ7eCU9iEwdtSi4+kTWuznzbjnOBXp2HiUsjeo/qgV1JXrbL7urk/IEXRp/MMoCC3zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=loHCIp6q; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="loHCIp6q"
Message-ID: <7c1585bd-9835-41f0-9bad-f08a8ef0f5ae@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757423716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XuI4oBdKSYquASe46jxCtb1xaIyxWdoiI3WCl6WjHtY=;
	b=loHCIp6qIQ7XPuj0E8+KRG3fDR58rDDZrmiF49YE54u8/4Z5nl2u038RLusmWGj7/b4wx1
	njbFaEfI4xY59Ei/ltE+VvKt75phLQ4ycsUL0OLhXm63D255D/lNtkZYYXjfobGDSjBs3S
	HRfy5M8u8rtZG2vfgpsV5+VFix+Nf3Y=
Date: Tue, 9 Sep 2025 15:05:40 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 04/15] ASoC: SDCA: Pass device register map from IRQ alloc
 to handlers
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, rafael@kernel.org, yung-chuan.liao@linux.intel.com,
 peter.ujfalusi@linux.intel.com, shumingf@realtek.com, lgirdwood@gmail.com,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com
References: <20250905143123.3038716-1-ckeepax@opensource.cirrus.com>
 <20250905143123.3038716-5-ckeepax@opensource.cirrus.com>
 <2f9bffb7-1f89-477e-b2f2-09974b189d57@linux.dev>
 <aL7ScExrl3u1TlLs@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <aL7ScExrl3u1TlLs@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 9/8/25 14:56, Charles Keepax wrote:
> On Mon, Sep 08, 2025 at 01:49:43PM +0200, Pierre-Louis Bossart wrote:
>> On 9/5/25 16:31, Charles Keepax wrote:
>>> Store a copy of the device register map in the structure for the IRQ
>>> handlers. This will allow the individual IRQ handlers access to the
>>> device level register map if required.
>>
>> Sorry, not following how you plan on sharing access to regmap between
>> parent and child devices.
> 
> They all have a pointer to the device level register map, if some
> function or the device level is using it the regmap lock will be
> held and the others are block.

ok

>>> @@ -445,6 +445,9 @@ struct sdca_interrupt_info *sdca_irq_allocate(struct device *dev,
>>>  
>>>  	info->irq_chip = sdca_irq_chip;
>>>  
>>> +	for (i = 0; i < ARRAY_SIZE(info->irqs); i++)
>>> +		info->irqs[i].device_regmap = regmap;
>>> +
>>
>> Lost on this one as well. A child device could support multiple
>> interrupts, e.g. for buttons and jack, not sure why each interrupt
>> needs a separate pointer to the same identical information.
> 
> Most IRQs don't need custom handling so the core can handle those
> IRQs. In the case of custom IRQs the driver would register some
> private data structure that would contain necessary information
> for the handler such as regmaps. This array of interrupt
> structures is basically that private data. A pointer to this
> structure will be passed to the IRQ when it fires and it needs to
> contain all the stuff the IRQ handler needs, one of those things
> might be the device level register map.

I think I am still looking at interrupts with the standard non-SDCA interrupts in mind. In the existing SoundWire handling, all interrupts are handled one after the other in the same handler. The only case where we could customize the handler is for the 'vendor-defined' interrupt.

But for SDCA we are moving to a different design, aren't we? Each interrupt is handled separately with its own handler, either provided by the core or customized by a vendor, and that handler must be provided with enough context information to access registers. If that description is correct then yes no objection to this copy of the information.



