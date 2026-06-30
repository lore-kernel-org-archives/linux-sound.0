Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B932B38551A
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 12:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782823087; cv=none; b=M0k1tk1feAh19NHl5w1W3oSHTMMt1+7KRMVFTql1Qa7rsw9zJFYyywjQmalxAodI7Q4YsAqSIjb76zP26T8t7cpJZNMOvl4/gGiIKr3IhuxTXMBZRd8fHk6ZOcg3lBfDITT8safIULoqq0QvW6ChjQXq1KudV4JwDbL2uDnkg/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782823087; c=relaxed/simple;
	bh=TLqRy6bjOHSiZOheCSXLMq0h+jbPiyBod8GUeZEy2CQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=daVbU5YpIeP291JIpuSw1fxi7rgy4l+Rd4wsCyYlkFVvREB695/cd5MQ1SNjvDfN4xMG2PZXT9gcY3XCWCbbK/VCoFhKiaE0HNZI3h1q3PTzqbfcucIk0M0pa7RSXHu40LFhzwfbkt3NJ2CliJC7rjQ/6OUln5QfW6o6FVnvTrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=HwuRAXFI; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="HwuRAXFI"
Message-ID: <46af3cdf-d704-4cd2-bb24-cbe9fb1303db@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782823082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4luJcNs7cpCca4BLDs7MDKIlyBLX5Cs6F16Lmamjgbg=;
	b=HwuRAXFIyOPthPwQFxH0yWjvr/HT8/tatDJvGZKxBw5dZXtEaEBW2adwb86pHnVXmjwdNF
	asR4SdCO5yaxvpwPrzHUNNNLgueEok+uIj+RZI2OHVIqTNOlPFpbTkUYMkaalBcuZySeqG
	MbyYoQkuDbiinv2ISGlooOtPQTccL7A=
Date: Tue, 30 Jun 2026 14:36:31 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] soundwire: Intel: stop sdw clock in system suspend
To: Richard Fitzgerald <rf@opensource.cirrus.com>,
 "Liao, Bard" <bard.liao@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "vkoul@kernel.org" <vkoul@kernel.org>
Cc: "vinod.koul@linaro.org" <vinod.koul@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>,
 Richard Fitzgerald <Richard.Fitzgerald@cirrus.com>
References: <20260629144450.2096823-1-yung-chuan.liao@linux.intel.com>
 <20260629144450.2096823-3-yung-chuan.liao@linux.intel.com>
 <11f8d158-9ddc-46fc-9cd5-11a696d3413f@linux.dev>
 <SJ2PR11MB842410EE22537B0673173EECFFF72@SJ2PR11MB8424.namprd11.prod.outlook.com>
 <520f67ca-941b-4e08-8985-03f0e09b0313@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <520f67ca-941b-4e08-8985-03f0e09b0313@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


>>>> --- a/drivers/soundwire/intel_auxdevice.c
>>>> +++ b/drivers/soundwire/intel_auxdevice.c
>>>> @@ -669,7 +669,8 @@ static int __maybe_unused intel_suspend(struct
>>> device *dev)
>>>>           return 0;
>>>>       }
>>>>
>>>> -    ret = sdw_intel_stop_bus(sdw, false);
>>>> +    /* No need to keep the SoundWire clock active in system suspend */
>>>> +    ret = sdw_intel_stop_bus(sdw, true);
>>>
>>> erm, are you sure about this change?
>>>
>>> What this does is stop the SoundWire clock before entering system suspend.
>>> Is this needed? The whole point of system suspend is that the host will stop
>>> operating completely.
> 
> Not necessarily. There are multiple types of system suspend, like
> suspend-to-RAM. The system doesn't always shut down.

Let's be clear: all types of system suspend do not use the clock stop mode, at least on Intel platforms.

The clock stop mode is ONLY used in the pm_runtime suspend.

The main reason for this is that the host cannot keep a detector alive to restart the bus at the request of a peripheral.
As a result, the jack detection only works in pm_runtime suspend and NOT in system suspend. It's been the default since we introduced support of clock stop...

Note that in case where the peripheral is not capable of generating a wake, the clock stop is not used either. No need to keep that detector alive on the host if it's never going to see a wake.

> Also depends on the OS: Android seems to use system suspend as a deep
> sleep state.
> 
>>
>> Yes, that's what we need. The purpose is to inform the Peripheral to go
>> into the deserved clock stop mode before system suspend.

Sorry but this isn't what this patch does. 

I think you are confusing power savings in clock stop mode with the ability for the codec to enter a lower power in system suspend.

If you do need the ability to put the peripheral in a lower power mode, it's perfectly acceptable, but that can be done in the system suspend routine of the peripheral driver. You do not need or want to piggy-back on the clock stop mechanism which isn't used in system suspend.

>>> There is in theory no need to stop the clock because the clock restart capability
>>> will not be used.
> 
> As Bard says, the peripherals should be informed that the clock will be
> stopped. They at least should have the opportunity to act on that. And
> they could still be powered across one of the lighter forms of system
> suspend.

Again it'd be fine to reach a lower power for the peripheral or keep some power rails active, but that's orthogonal to the clock stop.

>>> Think for example of jack detection, it's supported in pm_runtime suspend
>>> with the SoundWire interrupt capability, but not in system suspend.
>>
>> An example that we need clock stop1 in system suspend is to keep the amp's
>> firmware in system suspend. In other words, we don't want to reload the
>> firmware after system resume

If you want to use lower power modes in system suspend, that's fine. The suspend/resume routines can be modified to introduce lower power modes on the peripheral side.
I am not disagreeing with the concept of lowering power consumption in system suspend, just on the mechanisms that you trying to use.

But keeping the context on the peripheral is one bridge too far I am afraid. Intel platforms perform a bus reset in all cases, including in clock-stop modes, that was the hardware guidance. That means that no matter what you do prior to pm_runtime and system suspend the peripheral WILL lose context.

To rehash the different points:
- The only significant difference between pm_runtime and system suspend is the wake detection capability which is only supported in the former case. 
- On Intel platforms, context is lost on the peripheral in all resume routines because of the bus reset, the latency on resume is pretty much the same in both cases
- The peripheral driver can introduce a lower-power mode in system suspend by changing the system suspend routine.

