Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40A93376AF
	for <linux-sound@vger.kernel.org>; Tue,  9 Sep 2025 13:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757423717; cv=none; b=UKTAaH8sezFlCOPtbxmE9CV5m6ZXeJW+tKkBaF6mnz7SWGffvs4FRN6kgUjIDDbLlarKU4KZccIiuO0qTRV9G5Quo9YSuAsPGP8ZCggWj1fwRoeOuPfxgO78VM0QV9Np3pKtelzmPT4y4aW3OFdDzG2y0yJRsD6JgDmCOdMFnoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757423717; c=relaxed/simple;
	bh=Kts1f3QjiiKOpa5y5CwRUWzxZF8jR7UQxDt4JhPCx1k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VQo8ksX7WTzKQA9uerUTZn8wV1dQV0UvZ9znuIMektv9paQU6+VjzrU5s76aCYePiXd5NVKqMufZ6BEmS1s+hhjx1xl0qJiQBOd0jPV4MZZBLiUgeTeAYkOG5Tje0AUNP6cACalRJ9iHBioe0OBQy6I8LFyfD+T8ZGEAlv8H91c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=uwA3/xhr; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="uwA3/xhr"
Message-ID: <242f9c48-1968-4efd-a512-93193eeb81e5@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757423714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cpAGnGM1pXdx/yuclPrUsHnNUbrUqLCRvHwqT77bnqI=;
	b=uwA3/xhrwGc6PUbSMYp+Nx0k3cdqCvunSbO3Ai/CNFngGaeKrWGQAmEh6ptIbaEwflZS2m
	2UR5wrJL0nA/FtUWkK0MErC3zrhB7Sw7yKdYcBDFky1yWiZ+4PNL2jz2B1Wp/Vt7LATU+b
	pnkqfoB/zHU9Vp/LOn77LL+9xK0Zy1w=
Date: Tue, 9 Sep 2025 14:56:07 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 02/15] ASoC: SDCA: Add manual PM runtime gets to IRQ
 handlers
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, rafael@kernel.org, yung-chuan.liao@linux.intel.com,
 peter.ujfalusi@linux.intel.com, shumingf@realtek.com, lgirdwood@gmail.com,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com
References: <20250905143123.3038716-1-ckeepax@opensource.cirrus.com>
 <20250905143123.3038716-3-ckeepax@opensource.cirrus.com>
 <f5716cc7-8971-43fc-a646-56a9353fbab5@linux.dev>
 <aL7aldXtzWLYDTt/@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <aL7aldXtzWLYDTt/@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 9/8/25 15:31, Charles Keepax wrote:
> On Mon, Sep 08, 2025 at 01:42:40PM +0200, Pierre-Louis Bossart wrote:
>> On 9/5/25 16:31, Charles Keepax wrote:
>>> @@ -86,18 +88,25 @@ static irqreturn_t function_status_handler(int irq, void *data)
>>>  {
>>>  	struct sdca_interrupt *interrupt = data;
>>>  	struct device *dev = interrupt->component->dev;
>>> +	irqreturn_t irqret = IRQ_NONE;
>>>  	unsigned int reg, val;
>>>  	unsigned long status;
>>>  	unsigned int mask;
>>>  	int ret;
>>>  
>>> +	ret = pm_runtime_get_sync(dev);
>>
>> what does 'dev' represent? The SDCA function device or the
>> parent SoundWire peripheral device?
> 
> SDCA function device here.
> 
>> I would think it's the former, with the parent-child
>> relationship used by the runtime_pm framework to resume the
>> parent peripheral device if needed.
> 
> Yes this would cause the parent to power up, but there is
> nuance here. The parent has actually already been powered up
> by regmap IRQ. The thing here is SDCA is weird, the interrupts
> are defined at the device level, but all the handling is at the
> function level.
> 
> To some extent this is also a consequence of having a regmap per
> function. Regmap IRQ is registered against the SoundWire device,
> as it needs to access the device level IRQ registers. But the
> handlers are per function and need to make sure an individual
> functions register map is out of cache_only so need to do a
> runtime get on the function specifically. In the past with
> multi-function codecs we have been able to cheat a little here
> as resuming the parent actually did everything necessary to
> communicate with a part of the device.

ok, makes sense.

Capturing some of this paragraph in the commit message would be good to explain what resume operations mean for an SDCA child device. 
>> maybe use sdev and pdev as an arbitrary convention to help the reader?
>>
> 
> I quite like the idea of this as a naming convention, will have
> a look at updating stuff.
dev and sdev are fine as well, as suggested in the other email.
