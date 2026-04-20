Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9FA21CC5C
	for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 11:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776684418; cv=none; b=mMDM4VE7ySgBcSPLGJV6QVuyX198K5Vqk+WE7qRH0fUzNuouHL3m/V1s2gOdw7E/tkKumjy+vBUk6xq4Dq+dAhpGPPcNdW+MK8TSyXJcRCIP0LtllqJoZ87RfLeq8sJ1euJacsJ34AIRndqL1o+iyeamqdijv6EVbS+qCZJGn04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776684418; c=relaxed/simple;
	bh=RVixhBZCkKoL+2N+FVQhtUaLjhWOU0QlVObgHfwjqzk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UAlCHKn18FwGzCU5bGX1ky3R92QE05AR05xk+h0Pz0B6foLnfbmvlWhpLMJczK7pwpnpLVgqnilldKcdxrNbttZq6mhOMDfDc6Q0YDkOv6vZhtLhJZlBm9nQzYdhUe+mlvgbG8s4LpDqaYeWeUQEk9P2qtZgJ1oS5h+RI6Kz6q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BDrMOw76; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BDrMOw76"
Message-ID: <6832da94-39cc-4cfd-ad1c-0c4bfea8c79c@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776684405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sP/cywsX0uhk4hgHtLb8TV4cSvhf2+OpZuTwp/uJmH8=;
	b=BDrMOw767dFJ3se5x1haaUMmlm2D43lOs289kyYz/bSfe/4l2nhfvpdBdHPQb2Un5xyOW0
	+zKZxG6tBoW6Qc7It7QDZ4TksueBdU4oEATdtnwtSLlpq4JkzTWBl0Y7kyZQAflcloEsmB
	N7tAlwQUV8FnJ+dC4FuW+K6zAIcyUA0=
Date: Mon, 20 Apr 2026 13:26:34 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v9 1/4] ASoC: SDCA: Add PDE verification reusable helper
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Niranjan H Y <niranjan.hy@ti.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, broonie@kernel.org, lgirdwood@gmail.com,
 perex@perex.cz, tiwai@suse.com, cezary.rojewski@intel.com,
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 baojun.xu@ti.com, shenghao-ding@ti.com, sandeepk@ti.com, v-hampiholi@ti.com
References: <20260417131401.3104-1-niranjan.hy@ti.com>
 <6b72e996-a2dd-445b-b145-82644a6df8eb@linux.dev>
 <aeYBgE4JQiApVvRS@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <aeYBgE4JQiApVvRS@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 4/20/26 12:35, Charles Keepax wrote:
> On Mon, Apr 20, 2026 at 11:49:00AM +0200, Pierre-Louis Bossart wrote:
>> On 4/17/26 15:13, Niranjan H Y wrote:
>>> + * This function implements the polling logic but does NOT modify the power state.
>>> + * The caller is responsible for writing REQUESTED_PS before invoking this function.
>>
>> Erm, why not dealing with the write to REQUESTED_PS in this
>> helper? You have all the 'to' and 'from' information in the
>> parameters.
> 
> I have no objections to moving that into the helper as well.
> 
>>> +	static const int polls = 100;
>>> +	static const int default_poll_us = 1000;
>>> +	unsigned int reg, val;
>>> +	int i, poll_us = default_poll_us;
>>> +	int ret;
>>> +
>>> +	if (pde_delays && num_delays > 0) {
>>> +		for (i = 0; i < num_delays; i++) {
>>> +			if (pde_delays[i].from_ps == from_ps && pde_delays[i].to_ps == to_ps) {
>>> +				poll_us = pde_delays[i].us / polls;
>>> +				break;
>>> +			}
>>> +		}
>>> +	}
>>> +
>>> +	reg = SDW_SDCA_CTL(function_id, entity_id, SDCA_CTL_PDE_ACTUAL_PS, 0);
>>> +
>>> +	for (i = 0; i < polls; i++) {
>>> +		if (i)
>>> +			fsleep(poll_us);
>>
>> This solution will loop for up to 100 times, and the sleep
>> duration could be questionable.
> 
> The duration doesn't have to be precise here, as long as the
> result is longer than the requested time everything is fine.
> 
>> Say for example you have a 10ms transition, do you really want
>> to read ACTUAL_PS every 100us?
> 
> Quite potentially, I imagine it will be fairly common for parts
> to change PS a lot faster than the actual timeouts they provide,
> due to corner cases and people just being conservative in the
> DisCo. So its quite possible something that says 10mS typically
> switches in a couple 100uS.
> 
>> If the pde_delay is 1ms then a read every 10us makes no sense,
>> the SoundWire command protocol would not be able to handle
>> such reads.
>>
>> A minimum threshold on poll_us would make sense IMHO.
> 
> I guess you do reach a point where the soundwire command makes
> the delay effectively meaningless. What would you suggest for a

yep, that was the main point.

> minimum? Something like 100uS feels kinda reasonable to me,
> I would lean towards quite a small value here. Other options
> might be to look at some sort of exponential back off, doing the
> first few polls faster than later ones.
> 
> This is definitely one of those situations where SDCA is a little
> too vague for its own good. But I would also say making a change
> like this should at a minimum be a separate patch rather than
> part of this one. And I am not convinced we need to block this
> series on updating it, although if we just wanted to go with a
> simple minimum that seems easy enough to add.

A minimum of 100us would be fine, we can always optimize for long delays later.

