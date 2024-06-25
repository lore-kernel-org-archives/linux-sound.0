Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDC114A62F
	for <linux-sound@vger.kernel.org>; Tue, 25 Jun 2024 12:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719318996; cv=none; b=ZN+pYnCtiwMuY7YycmwqrM1QG9Eqjao+0t1wxhuF3TfVxhMxdMLnoaHey9w/ELIYxTu4p79nBSUIXn9fSThRtgvgJXhDYHxEtHeNBLmncDu+LUFF9S4Ol6Xp+D3ywrs5HkssMXzTxKHQtcMqn1cBylXQe2SWqYa1rnsP+YiVZ/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719318996; c=relaxed/simple;
	bh=qVzx3C2DF4eHW9TGGY8JymTq9Udm1aYYcnu1Jcq/4oQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AEvjfEt+7bIXfIboPEV3t9cBtsXuHUCsiM00PBJx3h4HTWBeL+zf48GgwSXX6DPo96VAbANUUgdhdb9CENHIg1iGPrPCVIqTOZYk984CwOaQEcF+Ccvhq3mqff2zpSjOd98e1Td218dFoGLNO8eRLeZHyfcx+Ulrh8TSj3vSllU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GHGKLEyg; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GHGKLEyg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719318994; x=1750854994;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=qVzx3C2DF4eHW9TGGY8JymTq9Udm1aYYcnu1Jcq/4oQ=;
  b=GHGKLEygJMlsL16MHyzTH+j0sx83Tr/cQt0aC5PLQsy2GR7MJligAHHd
   xsvVO7wIALcuyEX/EjnegufHQwJb8q7FKvUEo6wljGxmNNuACzJ8ynv0W
   OfV+0NBn+pyLiHhLP7+XEtojMtOhDny/JB1RELYpLP+sGS8WxhlD9KuDG
   ILvJ/lMS4Wtb1dgg8uSwoeKbVDeHTobgPA6qTal5d2qMTSUADGtE4P7i/
   baS+3FaCM9DUBrmJTKxChzJ0wx9gWy2Ihd0si1d15vyduR1xMHG7q1om/
   h2GabSGwjYZsv8im/v/1gUP5rIhwrCrRWAVJ2CTK9OsjgdSCFVqluznwI
   Q==;
X-CSE-ConnectionGUID: tmXb81jnTJaXgGbSDkZ+Mg==
X-CSE-MsgGUID: e6Af70J+TUuIF1P8Bg69gQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="16296417"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; 
   d="scan'208";a="16296417"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 05:36:34 -0700
X-CSE-ConnectionGUID: kM0HW6reSeamdbEHD1of0A==
X-CSE-MsgGUID: cv8HfuvQTM22yWmXTBXJBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; 
   d="scan'208";a="44344373"
Received: from ettammin-desk.ger.corp.intel.com (HELO [10.245.246.252]) ([10.245.246.252])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 05:36:32 -0700
Message-ID: <69951352-c0c4-4984-bbab-acdfc4add146@linux.intel.com>
Date: Tue, 25 Jun 2024 14:36:28 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ALSA: compress_offload: introduce passthrough
 operation mode
To: Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Vinod Koul <vkoul@kernel.org>
References: <20240621164915.410946-1-perex@perex.cz>
 <18c2a323-f0b5-4dea-b502-ce7e7021c555@linux.intel.com>
 <51462bc7-d9da-4e2d-9244-a59184c4d8ed@perex.cz>
 <7fb00353-08f2-4fad-b05e-cdf4b6451cbe@linux.intel.com>
 <626a22b6-7de9-45ba-a702-f4539f2a25a7@perex.cz>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <626a22b6-7de9-45ba-a702-f4539f2a25a7@perex.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/25/24 13:48, Jaroslav Kysela wrote:
> On 25. 06. 24 8:06, Pierre-Louis Bossart wrote:
> 
>>>> I honestly find the state machine confusing, it looks like in the SETUP
>>>> stage tasks can be added/removed dynamically, but I am not sure if it's
>>>> a real use case? Most pipeline management add a bunch of processing,
>>>> then go in the 'run' mode. Adding/removing stuff on a running pipeline
>>>> is really painful and not super useful, is it?
>>>
>>> This I/O mechanism tries to be "universal". As opposite to the standard
>>> streaming APIs, those tasks may be individual (without any state
>>> handling among multiple tasks). In this case, the "stop" in the middle
>>> makes sense. Also, it may make sense for real-time operation (remove
>>> altered/old data and feed new).
>>
>> I must be missing something on the data flow then. I was assuming that
>> the data generated in the output buffer of one task was used as the
>> input buffer of the next task. If that were true, stopping a task in the
>> middle will essentially starve the tasks downstream, no?
>>
>> If the tasks are handled as completely independent entities, what usages
>> would this design allow for?
> 
> The usage is for the user space. It allows to accelerate the audio data
> processing in hardware, but input is from user space and output is
> exported to user space in this simple API. The purpose of this API is
> just "chaining" to reduce the user space context switches (latency).

I am still very confused between the notion of  "chaining" and
adding/removing tasks dynamically at run-time. The former is fine, the
latter is very hard to enable in a glitch-free manner, usually all
filters have an internal history buffer. Inserting, stopping or removing
a filter is likely to add audible discontinuities.

>> Also I don't fully get the initial/final stages of processing. It seems
>> that the host needs to feed data to the first task in the chain, then
>> start it. That's fine for playback, but how would this be used if we
>> wanted to e.g. enable an ASRC on captured data coming from an audio
>> interface?
> 
> There are no stream endpoints in kernel (no playback, no capture). It's
> just about we have some audio data, do something with them and return
> them back.
> 
> For an universal media stream router, another API should be designed. I
> believe that using dma-buf buffers for I/O is nice and ready to be
> reused in another API.

Humm, how would this work with the initial ask to enable the ASRC from
FSL/NXP? If we leave the ends of the processing chain completely
undefined, who's going to use this processing chain? Shouldn't there be
at least one example of how existing userspace (alsa-lib, pipewire,
wireplumber, etc) might use the API? It's been a while now, but when we
introduced the compress API there was a companion 'tinycompress' utility
- largely inspired by 'tinyplay' - to showcase how the API was meant to
be used.

To be clear: I am not against this API at all, the direction to have
userspace orchestrate a buffer-based processing chain with minimal
latency is a good one, I am just concerned that we are leaving too many
points open in terms of integration with other audio components.
