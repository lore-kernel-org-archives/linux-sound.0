Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA8D1EDA0E
	for <linux-sound@vger.kernel.org>; Tue,  9 Dec 2025 16:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765298520; cv=none; b=O9vzJIl4ts9HFUGsI4Y5gjcMMeUozwN8hr792muIDSf2ANY8epUWG/MvVuXzb0VdCFzgylVoBr8fW+xVR6a0Cdtvfkg4ByZdoA2CCk8/IvpPBRwJ+df3ICD7wxXHo5KYlVbJwuR8nL+uj4PUSnFW+UgGoKCHu2pHJQxMnHhu6nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765298520; c=relaxed/simple;
	bh=pwUcd9vjnfMky5WF7d70fAeZu3q9exEvlcE+V881c5c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=joqSrWSfxRygVucfUB1dkisrjCJPgt7UcTLSPqtebgt6s1w9CGydGVOFqiEiQbjYFUuZ5zLup2l0jfnfyumqNYPhhamQVuWv8gUOTVM2XsdkujOno8HvGqL0ycfxzc5WkquRkJB/3KRFZ98eQ8uNe/Httvte5D5qFO130rEUjx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Kca7KAqq; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Kca7KAqq"
Message-ID: <5c80bead-716a-4528-b614-4b425184a484@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1765298504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=brszIlAhmsEE/FZSPfwDcpI6p6Nj3AfFbJJ+JF8SUUA=;
	b=Kca7KAqqY+hh9g3VjD2m7D8kBFWpoJecDxv2IgJAHOr2uG4BqSwmrP99GjdIXdlLQCJajg
	R8J/DXXewABEc5D7a8UfqjUakAlzTZehLLa3PUDt0d5Yw3v7jvyP2l8XFq2xkImK2VaOIq
	h+tJpbOLO2zopW39YNcbJblfElaxfew=
Date: Tue, 9 Dec 2025 16:41:39 +0000
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
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <795fd33c-7a0f-4600-87be-1690cb0c0ea3@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


>>> Changes in V2:
>>> +    if (simple_ch_prep_sm)
>>> +        return 0;
>>> +
>>> +    /*
>>> +     * Check if already prepared. Avoid overhead of waiting for interrupt
>>> +     * and port_ready completion if we don't need to.
>>> +     */

1.

>>> +    val = sdw_read_no_pm(s_rt->slave, SDW_DPN_PREPARESTATUS(p_rt->num));
>>> +    if (val < 0) {
>>> +        ret = val;
>>> +        goto err;
>>> +    }
>>> +
>>> +    if (val & p_rt->ch_mask) {
>>
>> Can you explain why we don't use the ch_mask in the already-prepared case? I am missing something.
>>
> I'm not sure what you mean here. The if() immediately above your comment
> uses ch_mask to check the already-prepared state.

I was referring to the 1. above, you read the prepare status without checking for ch_mask first.

>>> +        /* Wait for completion on port ready */
>>> +        port_ready = &s_rt->slave->port_ready[p_rt->num];
>>> +        wait_for_completion_timeout(port_ready, msecs_to_jiffies(ch_prep_timeout));
>>
>> I understand the code is the same as before but would there be any merit in checking the timeout before starting a read? If the device is already in the weeds, doing another read adds even more time before reporting an error.
>>
> Do you mean save the system time when the DPN_PREPARE was written to
> that peripheral and then check here whether the timeout period has
> already elapsed?

I meant testing the return value of wait_for_completion_timeout(). If you already timed out at this point with a return value of zero, there's no point in checking the status any more, the system is in the weeds.

> If that's what you mean, I don't see much advantage in that. If the
> hardware is working correctly, this will be detected by the read above
> that checks if the peripheral has already prepared. If it has we skip
> the wait_for_completion_timeout().
> 
> If the peripheral is "in the weeds", so that its prepare time has
> already passed and it still isn't ready, we're no longer in a state
> where we care about minimizing audio startup time because the hardware
> is now broken. So it's probably not worth complicating the code to
> take a few milliseconds off that case.

I agree it's no longer about minimizing the start time but rather providing an error faster, without waiting for a second timeout on read.
 
>>> +        val = sdw_read_no_pm(s_rt->slave, SDW_DPN_PREPARESTATUS(p_rt->num));
>>> +        if ((val < 0) || (val & p_rt->ch_mask)) {
>>> +            ret = (val < 0) ? val : -ETIMEDOUT;
>>> +            goto err;
>>> +        }
>>> +    }
>> T
>>
> 

