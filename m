Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBFE30EF6F;
	Tue, 23 Dec 2025 13:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766495958; cv=none; b=D4wrIfQy2d1ZuyFrY7q8qKfROGZlLiEZ/xS3FhtjsoaV8semin89m1To0fx0gr6Jlnkr4GawQr3kReF0DIRtdO4dvrWNEkIzRfqjTRBeZIoohZSw1CS+xmwOyQD0dBm6hb9+mNV2vx/EoQ1zHdgoQ93SHJI6h6/dU8qJP0LbwhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766495958; c=relaxed/simple;
	bh=Na7wFT9EjN71eDrumUXgPSC0I4dorFjBIQtthbkw5EY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZmDV4zz5kEjlXR1geo8tKVy5cxiMGiZvQ7YN4WIG0ORCYjWky6auGXao5yRJV8KoXDOFpZDalm/tnm46UebGBH+rO3xvAoSdUU7YFjcR5vl7IXN2XwrWKQCpivAx8zVflyXNeii+de7z8iExoI3uR58ACBvBeHmlaim//KNqiDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=gzjA2xAr; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="gzjA2xAr"
Message-ID: <c81f581a-ee9f-4692-8ed8-736b5c5053af@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766495954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8W8h9uESaI+H4KXOl0BngZ9NI5rpMeeC0gQh3RG4jR4=;
	b=gzjA2xArZxH3538YxGlm+T3KzDBfSjXEiRzc1SCEj+KGGDfua17mcosJnlrBa0uuozj43K
	Uk7Qp3PwXp/DVpH38p8JR8AaWQdrEJOpVEVXToDiwpOYcW+LzPdBc2AbpGJh0DnISSKHYF
	sPcMAnJb/iauScvttANQ1O0BRw295wk=
Date: Tue, 23 Dec 2025 14:19:11 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3] soundwire: stream: Prepare ports in parallel to reduce
 stream start latency
To: Richard Fitzgerald <rf@opensource.cirrus.com>, vkoul@kernel.org,
 yung-chuan.liao@linux.intel.com
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20251125165609.483763-1-rf@opensource.cirrus.com>
 <4d811207-1c01-4302-85b1-9d4079ea1a4b@linux.dev>
 <795fd33c-7a0f-4600-87be-1690cb0c0ea3@opensource.cirrus.com>
 <5c80bead-716a-4528-b614-4b425184a484@linux.dev>
 <d86e401a-205d-42a3-b90d-239d669c6ee1@opensource.cirrus.com>
 <1e2035bc-5168-4ec8-83cb-eeff41bdaed6@linux.dev>
 <a1b2b617-448d-4457-891e-d2cc00858f50@opensource.cirrus.com>
 <319caf4d-a96d-4c25-b912-e00c76ad8038@linux.dev>
 <028ae5fc-5ce1-4fbb-a09c-88700f2d77b1@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <028ae5fc-5ce1-4fbb-a09c-88700f2d77b1@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 12/23/25 11:47, Richard Fitzgerald wrote:
> On 23/12/25 10:29, Pierre-Louis Bossart wrote:
> <SNIP>
> 
>>>> I can see how preparing all ports in parallel would reduce the total time compared to a serial approach, even with a timeout, but if we end-up always timing out even in the case where there is a single device it'd be quite odd.
>>>
>>> Yes, but that's a separate problem that needs fixing. The current code
>>> in the kernel does the timeout for every amp. So if you have 4 amps with
>>> a timeout of 10ms it takes >40ms to do the port prepare.
>>
>> so is this fair to say that by not testing the return value of wait_for_completion_timeout(), we never detected the 'always-timeout' behavior since the initial contribution circa 2018, even with a single device per link?
>>
>> Wow, that'd be a big 7-year old conceptual miss...
> 
> It's just  a design flaw in the code. It wasn't found because it was
> tested against Realtek codecs, which use the simplified CP_SM so the
> code can skip the Prepare stage.

ok, thanks for the precision.

> The original code checked for timeout and then always failed, because it
> always timed out. So none of the Cirrus amps and codecs worked. I sent
> the "temporary" workaround of reading the status register after the
> wait_for_completion() and ignoring the timeout if the device is now
> reporting prepared, until I could fix it properly. I've only just got
> around to looking at this again.

ok, so this is a follow-up to commit 3d3e88e from 2021, where the timeout check was removed?
This should probably be mentioned in the commit description, with a clear explanation that the timeout happens in all cases.

I personally misunderstood that earlier commit, which states 

'The previous implementation would always fail if the
wait_for_completion() timed out, even if the port was reporting
successful prepare.
'

 
>>>> In other words does this patch reduce the start latency only in the case of multiple devices, but adds a 'tax' for all other cases?
>>>
>>> This only affects peripherals that use the full CP_SM (not simplified).
>>>
>>> If you have only 1 peripheral there is either no change or a possibility
>>> of skipping the wait. Before this change it would always wait the full
>>> timeout before noticing that it is ready.
>>>
>>> After this change, you might be able to skip the wait. If it prepared
>>> immediately, so that it is already reporting prepared when the first
>>> read tests for that, it will skip the wait.
>>> (BTW I see that happening with CS35L56. It prepares so fast that it
>>> is already done, without waiting for any of the timeouts.)
>>>
>>> If it isn't ready that early, you get the timeout as before.
>>>
>>> It isn't adding any penalty to single devices, unless you count the
>>> trivial time it takes to do the register read, which is negligible
>>> compared to getting deadlocked in the wait_for_completion_timeout().
>>
>> ok, now I get the point that the use of sdw_acquire_bus_lock() in sdw_prepare_stream() prevents the use of device-initiated interrupts.
>>
>> One possible change is a departure from the use of the PORT_READY alert. This was meant to be a worst-case scenario for cases where the prepare time is in hundreds of ms - IIRC we thought devices would need to adjust their internal clock to that of the bus, which might change during a prepare operation. But as you mentioned it in practice devices are prepared much faster. So we could have a typical loop with multiple read/sleep instead. See for example cdns_clear_bit() as an example of what I have in mind, classic kernel code really.
>>
>> That might speed-up the prepare time even for the single device case - and then that may be enough to avoid the deferred check on PORT_READY and make the code simpler for multiple devices as well.
>>
> 
> I've got an experimental patch to replace the
> wait_for_completion_timeout() with a polling loop. It's a brute-force
> approach but reduces the overhead without the scary rewrite of the bus
> locking.

sounds good, it's not that bad in terms of brute-forcing and certainly less bad than a broken design where an expected interrupt cannot be serviced by construction.

>> At any rate you're onto something, thanks for submitting this and bearing with my questions.
> 
> I need to send a new version of this patch anyway because it will
> need rebasing onto https://lore.kernel.org/linux-sound/20251219173830.407-1-niranjan.hy@ti.com/T/#u
> That one is fixing a problem so makes sense to take it first.
> 
> I'll improve the commenting in V2 to explain better what the code
> is doing.

I'd recommend the 'brute-force' approach, this wait_for_completion_timeout() makes no sense - and it'd remove the need for the extra read before the nonsensical wait.

Probably something for 2026 now ;-)

