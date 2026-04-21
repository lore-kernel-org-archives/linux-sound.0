Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0C5217F33
	for <linux-sound@vger.kernel.org>; Tue, 21 Apr 2026 16:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776788561; cv=none; b=enlQNfb0aWPmr8WiD5LVwqjqXBW5XqCaq2YfUAmrI5DISTNFPOHLpqPHSwfTo2E+zH701UsD24sehfOanPoHpulTpJzQTQJIaQ05K1z9JFthH2jynThLN/S+1EVCbyn51Mz1cuKGzrFSNCSQ8x3vJt6uWco7IyBVAeDUTdSWxRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776788561; c=relaxed/simple;
	bh=AIchNQNdActzgeicw5VdncsPfIcN/Tn0UZ40tvKDtww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hXmszfHjCdl8DFupVpiwcj9GbChkZ3XaPw13pq6SkrCjymx3AxtHuvzHvphNbqo8nPG/Vgo7ha/+MIRZ+QYsS1EXUYFygpNj3oHdO2teFoJET7fut7nHU//Ad+UnaWofpIpuxc4rOJxEbAXYucUPYDtzVDJTihBmuRKcTd4C/oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=eZbuxs1g; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="eZbuxs1g"
Message-ID: <dbe26161-f4fb-49d8-8f50-1e4afcda27f6@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776788557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wttAwI+k95Cys9fGwZbO3Vb9saPB0tIR+VBjPuQUkQ4=;
	b=eZbuxs1gwoX7r7eEHeCjbE0KsxtZbloSnVs2LXoE+kiDMYOGynvCDdRdFiKotzhewPskWy
	ty25Zc+HLSGfD5wVMDPHzI1r1BB3dVcqfmtD457Kix2V8usAuovh+SQGlQ4nuALrI1sQet
	5BH0jJltYvAJM1e2tprPcvqdPc9A54g=
Date: Tue, 21 Apr 2026 18:10:22 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v9 2/4] ASoC: tac5xx2-sdw: add soundwire based codec
 driver
To: "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "ckeepax@opensource.cirrus.com" <ckeepax@opensource.cirrus.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "perex@perex.cz"
 <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
 "cezary.rojewski@intel.com" <cezary.rojewski@intel.com>,
 "peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>,
 "yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
 "ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
 "kai.vehmanen@linux.intel.com" <kai.vehmanen@linux.intel.com>,
 "Xu, Baojun" <baojun.xu@ti.com>, "Ding, Shenghao" <shenghao-ding@ti.com>,
 "Kasargod, Sandeep" <sandeepk@ti.com>,
 "Hampiholi, Vallabha" <v-hampiholi@ti.com>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
References: <20260417131401.3104-1-niranjan.hy@ti.com>
 <20260417131401.3104-2-niranjan.hy@ti.com>
 <9eb396b8-eb33-466c-a7b2-a1417bd37fdb@linux.dev>
 <9952bc337cfa4b01bff11da3f93e31fc@ti.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <9952bc337cfa4b01bff11da3f93e31fc@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


> 
>>> +		/* Detect and set jack type for UAJ path before playback.
>>> +		 * This is required as jack detection does not trigger interrupt
>>> +		 * when device is in runtime_pm suspend with bus in clock stop
>> mode.
>>> +		 */
>>
>> so here we have an interesting logic - or I misunderstood the comment?
>>
>> If a headset is inserted when the device is in runtime_pm suspend, how would
>> applications modify the routing and select playback on the headset, which
>> would then ripple down to this hw_params() call?
>>
>> IOW to play on a headset you first have to know there's a headset.
> 
> This is limitation in the current HW revision. So keeping this as temporary workaround
> to make uaj playback work.

That doesn't really address my point. If you don't have an interrupt to trigger a runtime_pm resume, I am not sure how audio routing would work. You could detect the headset when playing on *another* endpoint but that's a different function/GE entity to deal with...

In any case why not do the detection in the resume callback instead of hw_params?
see more on this below...
 

>>> +	guard(mutex)(&tac_dev->pde_lock);
>>
>> question I mentioned above: when you reach the hw_params phase, do you
>> really have a potential race with firmware download? What does this specific
>> use of pde_lock protect against?
> 
> answer below ...
>>> +static s32 tac_sdw_pcm_hw_free(struct snd_pcm_substream *substream,
>>> +			       struct snd_soc_dai *dai)
>>> +
>>> +	guard(mutex)(&tac_dev->pde_lock);
>>
>> same here, do you really have a race with firmware download?
>>
>> Or is this a case of dependencies between functions that requires all power
>> state transitions to be serialized?
> 
> ... during my testing, I have noted when the playback starts (from clock stop mode),
> device gets "detached" first, tries to resume, .hw_params is called, then gets "attached".

That seems very very odd. The resume should wait on the device being completely operational. Only then would you deal with hw_params.

Note that there are devices that require a soft reset after firmware download, and that does cause an extra detach-attach sequence, but again the resume has to complete fully before hw_params is reached. See examples from Cirrus Logic.

> I am checking slave's initialization completion variable in .hw_params to make sure that the
> firmware download is complete before .hw_params proceeds.

that's not the expected sequence, see all other codec drivers, they wait on the initialization_complete in resume callbacks.

> On the "master" side, looks like the slave status is handled via workqueues.
> So, still I wanted to keep one more protection, just in case, because of the above sequence, for serialization.

I would recommend you start with the expected sequences, I really don't see what's different in your case that would require such a fundamental change in programming sequences?

