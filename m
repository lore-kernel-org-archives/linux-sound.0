Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94392ED87C
	for <linux-sound@vger.kernel.org>; Tue, 23 Dec 2025 10:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766485781; cv=none; b=DNCgR0X7aL5+9C+F21EosAcT/S8Wvlq1JQ990RsWX63pbS/6c709d9YQr85Z8lRqUh6u9wwCFxYzKt5+O7cqC5yDl30mr+7D8a3AkfIALs35dZ2CrzszBUJvQxS+uLpqwlugmxnx1LvdKIU6QVLdvYeOMAZB2zeAyJt8Id0Txy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766485781; c=relaxed/simple;
	bh=jxIFOmlWecQJXp8Qnfwordtrr3O42+XJoY4jDUThUEE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N5dYYUbC+XhrJzfGaLdUfNEOpYfAfDtr7btrMFys73FafZytrFpSuGNJbgc2aNJKyDMy+5jdHyBN7tk90TaLdZDqd3EA2JMM78VvHH9gTlA9lxWxmeblTGUFzCdRKyNu9sqOQn93GeC4T/v+K1a1A0um/EyCVC/kcJFr12vR+Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=EdJIg3m6; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="EdJIg3m6"
Message-ID: <319caf4d-a96d-4c25-b912-e00c76ad8038@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766485776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uxJiSaZut/yH228snLkgQ75WoU0duQVax7NMZA3TEDU=;
	b=EdJIg3m6uEyUCa4O2JNal2F1xIl9Zn9qULXJp33croUd/DpEd6BDqnxYOzr8uPZLOV+0Bo
	rHgSDDfke9TENoVu4nYPYJAL+JlIK07D18FGTZ4n+rfijC9xLCFn0o/0zQGwbg2H0qA0jn
	PhuHUNNp2iaRqgQ+thl+9Ta99GRE8iY=
Date: Tue, 23 Dec 2025 11:29:29 +0100
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
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <a1b2b617-448d-4457-891e-d2cc00858f50@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


>>>>>>> +    val = sdw_read_no_pm(s_rt->slave, SDW_DPN_PREPARESTATUS(p_rt->num));
>>>>>>> +    if (val < 0) {
>>>>>>> +        ret = val;
>>>>>>> +        goto err;
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    if (val & p_rt->ch_mask) {
>>>>>>
>>>>>> Can you explain why we don't use the ch_mask in the already-prepared case? I am missing something.
>>>>>>
>>>>> I'm not sure what you mean here. The if() immediately above your comment
>>>>> uses ch_mask to check the already-prepared state.
>>>>
>>>> I was referring to the 1. above, you read the prepare status without checking for ch_mask first.
>>>>
>>>
>>> What would be the purpose of checking ch_mask before the read?
>>
>> I don't know - why do we need to read it in the second case and not the first is all I am asking.
>>
> 
> What the code is doing is:
> 
> 1. Read the current prepare status
> 2. Check if any channels we prepared are still reporting NOT_PREPARED
> 3. If there are any NOT_PREPARED channels we need to do the wait, else
>    we can skip it

ok, sorry for being thick. The code is just fine, I misread it with the test split in two.

>>>>>>> +        /* Wait for completion on port ready */
>>>>>>> +        port_ready = &s_rt->slave->port_ready[p_rt->num];
>>>>>>> +        wait_for_completion_timeout(port_ready, msecs_to_jiffies(ch_prep_timeout));
>>>>>>
>>>>>> I understand the code is the same as before but would there be any merit in checking the timeout before starting a read? If the device is already in the weeds, doing another read adds even more time before reporting an error.
>>>>>>
>>>>> Do you mean save the system time when the DPN_PREPARE was written to
>>>>> that peripheral and then check here whether the timeout period has
>>>>> already elapsed?
>>>>
>>>> I meant testing the return value of wait_for_completion_timeout(). If you already timed out at this point with a return value of zero, there's no point in checking the status any more, the system is in the weeds.
>>>>
>>>
>>> Wait completion will _always_ timeout because this code is holding the
>>> bus lock, which blocks the ALERT handler from running and signalling
>>> the completion. The wait_for_completion_timeout() is effectively
>>> msleep(msecs_to_jiffies(ch_prep_timeout));
>>> So we have to read the register afterwards to see whether the peripheral
>>> actually prepared.
>>>
>>> I've left the useless wait_for_completion_timeout() in the code so this
>>> commit is only changing what it says it is changing, and nothing else.
>>>
>>> What to do about the deadlocked wait_for_completion_timeout() is a
>>> separate problem.
>>
>> Humm, what happens if you have a single peripheral, does this result in an increase of the prepare time all the way to the timeout value?
>> I can see how preparing all ports in parallel would reduce the total time compared to a serial approach, even with a timeout, but if we end-up always timing out even in the case where there is a single device it'd be quite odd.
> 
> Yes, but that's a separate problem that needs fixing. The current code
> in the kernel does the timeout for every amp. So if you have 4 amps with
> a timeout of 10ms it takes >40ms to do the port prepare.

so is this fair to say that by not testing the return value of wait_for_completion_timeout(), we never detected the 'always-timeout' behavior since the initial contribution circa 2018, even with a single device per link? 

Wow, that'd be a big 7-year old conceptual miss...
 
>> In other words does this patch reduce the start latency only in the case of multiple devices, but adds a 'tax' for all other cases?
> 
> This only affects peripherals that use the full CP_SM (not simplified).
> 
> If you have only 1 peripheral there is either no change or a possibility
> of skipping the wait. Before this change it would always wait the full
> timeout before noticing that it is ready.
> 
> After this change, you might be able to skip the wait. If it prepared
> immediately, so that it is already reporting prepared when the first
> read tests for that, it will skip the wait.
> (BTW I see that happening with CS35L56. It prepares so fast that it
> is already done, without waiting for any of the timeouts.)
> 
> If it isn't ready that early, you get the timeout as before.
> 
> It isn't adding any penalty to single devices, unless you count the
> trivial time it takes to do the register read, which is negligible
> compared to getting deadlocked in the wait_for_completion_timeout().

ok, now I get the point that the use of sdw_acquire_bus_lock() in sdw_prepare_stream() prevents the use of device-initiated interrupts.

One possible change is a departure from the use of the PORT_READY alert. This was meant to be a worst-case scenario for cases where the prepare time is in hundreds of ms - IIRC we thought devices would need to adjust their internal clock to that of the bus, which might change during a prepare operation. But as you mentioned it in practice devices are prepared much faster. So we could have a typical loop with multiple read/sleep instead. See for example cdns_clear_bit() as an example of what I have in mind, classic kernel code really.

That might speed-up the prepare time even for the single device case - and then that may be enough to avoid the deferred check on PORT_READY and make the code simpler for multiple devices as well.

At any rate you're onto something, thanks for submitting this and bearing with my questions.
