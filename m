Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.203
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793823724;
	b=bp883wYC7tFS6GJu59V6YIe7RWsJyY9eXwvJssrfXmN7BYDXWi8xiSfej/6rwUTXCat5
	 ihJCK1NlpVXNjTJUWL/bOjBj2GtQw+AN+4THFXSV7Uk3Yrm67jMnYMSJ1Psl+pn2xg2w4
	 hccFONd7ePqHUJvJLA2jiPPki/j26HdyT+1FsIY6zGftamqKlA8msi91aMMIHXvTpLbnR
	 PUKKa3mfMMFgUmPUzo0e5aLKO9aWE6zVzyWP70RJXiwpMgnyMOpCKeumXk+nySFmruUz+
	 QKOE4h2rvMLkn2nMlwdoS+BM1QPKTlwrnywjBFHuqvpKOzQ6MvvnrgS+Ol+SZwIRyig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793823724;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=XWjAjz3gKTPiU4WwwdsPU5E4IxT2eeZD2iTwvrhk29g=;
	b=ibluNRED7Jpc+jX7lk0DGsIBSNEqgovYJ9kvBKSMtpaYqXREW1X4ERCoPBW+vxR/6RFa
	 k0/Jyu/6TPQmg0L29h6X2O2xSmXg1n+qzuWTALIezwZa52RE0Th/RGYNlpE78eh9n3kkW
	 zbJkZ31qFspiLKRV4ZkOwL2J8g4M7yivJ0FKWOClKXuR+qL8/K/P2dvuO/IfrzaB/EB4U
	 aKl9kHpGj3Ty+gGiMn3XD1k8XC2dFjqWS7AGZ6C9MkngNDqDg9qXFSAQ7MXQa0sMmcJwK
	 l3bWiBH/E+BfX02DXFNUkLyzM3M1OL2vXGxWgO8/IpQy2K8vEGhtP5EIxbY8raox+Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=f4Rr9qzz;
	arc=none smtp.remote-ip=95.215.58.203
Received: from mta1.migadu.com (out-203.mta1.migadu.com [95.215.58.203])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B916070311
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 20:22:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00B916070311
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=f4Rr9qzz
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=snRuUIe/UGnz3itk6GOa9diYP72EGtNdi6p2RQh7Bfk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793823720; v=1; x=1794428520;
 b=f4Rr9qzzenG9TX+F11C9QYchKVaZLQ14lU1el/E+58KJRI4C7rcYKdnXQujSz304bREF7/Xq
 UTvLKg4xBQSKYBz9/nq4MbniThtEFqYVh/MHzSLinBVWVhJUpoJDO1B5cTQDZZaPRcxxUcm7xSB
 oC8LqXv7Q4br57aTzCRRUFEQ=
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 01081e1aec6ec143;
	Wed, 04 Nov 2026 20:22:00 +0000
X-Mizu-Trace-ID: 01081e1aec6ec143
X-Migadu-Flow: FLOW_OUT
Message-ID: <259d0c79-2a36-4a36-8e7c-fa24137a02bd@linux.dev>
Date: Wed, 4 Nov 2026 21:20:39 +0100
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] ASoC: Intel: avs: Soundwire support
To: Cezary Rojewski <cezary.rojewski@intel.com>, Vinod Koul <vkoul@kernel.org>
Cc: linux-sound@vger.kernel.org, broonie@kernel.org, tiwai@suse.com,
 perex@perex.cz, amade@asmblr.net, linux-kernel@vger.kernel.org,
 yung-chuan.liao@linux.intel.com
References: <20261103134958.2089136-1-cezary.rojewski@intel.com>
 <bcfe64de-359c-4f16-9014-5d6f8bf30c40@linux.dev>
 <9da94716-4dde-4389-9574-12f90b52e05a@intel.com>
 <d9672276-5616-4609-98c1-5b9bdd06cf05@linux.dev> <aus0GT3ht1oEY2mc@parshuram>
 <746bae53-ed1d-4881-9268-968c25270bda@intel.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <746bae53-ed1d-4881-9268-968c25270bda@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/4/26 15:31, Cezary Rojewski wrote:
> On 11/4/2026 2:33 PM, Vinod Koul wrote:
>> On 04-11-26, 12:52, Pierre-Louis Bossart wrote:
>>> On 11/4/26 10:14, Cezary Rojewski wrote:
>>>> On 11/3/2026 6:20 PM, Pierre-Louis Bossart wrote:
>>>>>
>>>>>> Also, the existing code fetches the PDIs based on pre-defined "dai_id".
>>>>>> That's not the case for the avs-driver.  It simply asks: "is any PDI
>>>>>> free?" and assigns it for the substream if one is found.
>>>>>> No predefining.  Again, this aligns with how HDAudio streaming is done.
>>>>> Yeah but at the end of the day there's a 1:1 mapping between cpu_dai and
>>>>> PDI, no?
>>>>>
>>>>> All PDIs are created equal, a dynamic mapping doesn't make things more
>>>>> efficient. It just makes things more complex to debug since you don't
>>>>> have a fixed mapping between dailinks/stream/cpu_dai/PDI.
>>>>>
>>>>> Put differently, couldn't the AVS driver work around that fixed mapping
>>>>> to avoid changes to legacy platforms that have shipped many moons ago?
>>>>
>>>> Kind disagree on the debugging part.  Having SDW streaming follow
>>>> closely to what is done for HDAudio from the beginning (no hardcodes)
>>>> makes it easier for a developer to debug stuff.  OTOH if one of these
>>>> two follows a completely different path, the developer has to have such
>>>> hardcodes in mind when debugging the PCM code or even when looking at
>>>> the topology.
>>>>
>>>> At the same time, I'm not going anywhere and I do intend to work with
>>>> Peter and Kai to update the common code. Simply put, such a refactor
>>>> would be routed through SOF GH first.
>>> The machine driver selects the first available cpu_dai when creating a
>>> dailink. It doesn't really add much value to add a second level of
>>> freedom to select PDIs, since in practice it'll select the first as
>>> well. PDIs have no moral equivalent in HDaudio, it's a Cadence-specific  IP.
>>>
>>> Also there is already a degree of freedom in the allocation of
>>> stream_tag, which is used for DMA support. That one makes sense since
>>> DMAs may be used for non-SoundWire things (HDMI, trace, probe, etc).
>>>
>>> That's 2 degrees of freedom on 3 levels, do you really need full
>>> configurability?
> 
> I'm not following this "level of freedom" notion. What's part of this
> set is a basic allocation - driver (a user of the soundwire-lib) comes
> and ask for a free resource (PDI). If there is one, it gets assigned.
> Very standard, how many expect resources are redistributed.

You're missing a level. The platform driver exposes a set of DAIs, and
then the machine driver will decide which dai it needs for a specific
dailink/stream. That's the part that really matters IMHO.

The choice of the PDI is done only internally in the Intel platform
driver, and it really doesn't matter how you map cpu_dais to PDIs. A
fixed mapping is just as good as a dynamic approach - same results,
maybe less elegant but the performance is identical.

>> I dont see any gain from this approach. I would reconsider and see if we
>> can reuse things
>>
> 
> I'm not sure which way the last message goes.
> 
> However, I find it easier to move from hardcodes to the basic allocation
> approach (seen here, in this very patchset) than the other way around.
> The change would consist of updating intel_hw_params() so the PDI
> allocation is no longer done there.

Change is risky, especially when this touches platforms all the way to
CNL across at least 3 generations of Intel hardware since 2018, for no
tangible benefit.
