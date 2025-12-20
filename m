Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDE21925BC
	for <linux-sound@vger.kernel.org>; Sat, 20 Dec 2025 11:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766231284; cv=none; b=n+BCeDbwq8ZeKY2s4cqxKbRTUj44QABz/eisZY7yy76mksPP54uvyzb4uBWx+maMynct8JHMk6RPym2ExKgoavoJ/hh8aLCBmMROgfVJ8ksCjLHc/x8j95/MCxoAGN525lBiDPIOgSAtrBzDJeH7wbKjzcACNlj4rV+02l0AW+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766231284; c=relaxed/simple;
	bh=YuTaqj10n28bAGQ6v8sBFF2A9JG1IkJu4viCiVUbQns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ew2avHWnt9Mo9CwDYnP/eKiVY94pTqbTT6BMImvdqiXHib42IepTa1T1Lcc/8UDJa7WY19kVXC4HMUzHh3YTbHGGvX8f5/cpOd9W0ycmETxJ360Axk7tgLU/yBXBHe13ytSkSxQEaH02KNZJkgoa0Bw0o6k3J6MVNNcg4H0z7Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=T/X+4Pwr; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="T/X+4Pwr"
Message-ID: <1e2035bc-5168-4ec8-83cb-eeff41bdaed6@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766231280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=znnq34TAQb8CeBct4D7B2cGx0UHwEbU53M8LYZZt1Q8=;
	b=T/X+4PwriK6MkhdSJoAu6v3dwpVluFjuyChKsz+uX69MlvGqoRGex6pVpnkLDFD9g3D1qP
	c1bsNnc8CtHw+hDgXCP2ogLhuPGUxiyhM68ri99iGvVUsOpbiLAeVwohaEB2aLtfJZToDE
	vu5nInomBiclJLMCb2hdT08dFEeDHIY=
Date: Sat, 20 Dec 2025 12:15:04 +0100
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
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <d86e401a-205d-42a3-b90d-239d669c6ee1@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 12/10/25 10:59, Richard Fitzgerald wrote:
> On 9/12/25 16:41, Pierre-Louis Bossart wrote:
>>
>>>>> Changes in V2:
>>>>> +    if (simple_ch_prep_sm)
>>>>> +        return 0;
>>>>> +
>>>>> +    /*
>>>>> +     * Check if already prepared. Avoid overhead of waiting for interrupt
>>>>> +     * and port_ready completion if we don't need to.
>>>>> +     */
>>
>> 1.
>>
>>>>> +    val = sdw_read_no_pm(s_rt->slave, SDW_DPN_PREPARESTATUS(p_rt->num));
>>>>> +    if (val < 0) {
>>>>> +        ret = val;
>>>>> +        goto err;
>>>>> +    }
>>>>> +
>>>>> +    if (val & p_rt->ch_mask) {
>>>>
>>>> Can you explain why we don't use the ch_mask in the already-prepared case? I am missing something.
>>>>
>>> I'm not sure what you mean here. The if() immediately above your comment
>>> uses ch_mask to check the already-prepared state.
>>
>> I was referring to the 1. above, you read the prepare status without checking for ch_mask first.
>>
> 
> What would be the purpose of checking ch_mask before the read?

I don't know - why do we need to read it in the second case and not the first is all I am asking.
 
>>>>> +        /* Wait for completion on port ready */
>>>>> +        port_ready = &s_rt->slave->port_ready[p_rt->num];
>>>>> +        wait_for_completion_timeout(port_ready, msecs_to_jiffies(ch_prep_timeout));
>>>>
>>>> I understand the code is the same as before but would there be any merit in checking the timeout before starting a read? If the device is already in the weeds, doing another read adds even more time before reporting an error.
>>>>
>>> Do you mean save the system time when the DPN_PREPARE was written to
>>> that peripheral and then check here whether the timeout period has
>>> already elapsed?
>>
>> I meant testing the return value of wait_for_completion_timeout(). If you already timed out at this point with a return value of zero, there's no point in checking the status any more, the system is in the weeds.
>>
> 
> Wait completion will _always_ timeout because this code is holding the
> bus lock, which blocks the ALERT handler from running and signalling
> the completion. The wait_for_completion_timeout() is effectively
> msleep(msecs_to_jiffies(ch_prep_timeout));
> So we have to read the register afterwards to see whether the peripheral
> actually prepared.
> 
> I've left the useless wait_for_completion_timeout() in the code so this
> commit is only changing what it says it is changing, and nothing else.
> 
> What to do about the deadlocked wait_for_completion_timeout() is a
> separate problem.

Humm, what happens if you have a single peripheral, does this result in an increase of the prepare time all the way to the timeout value?
I can see how preparing all ports in parallel would reduce the total time compared to a serial approach, even with a timeout, but if we end-up always timing out even in the case where there is a single device it'd be quite odd.

In other words does this patch reduce the start latency only in the case of multiple devices, but adds a 'tax' for all other cases?
