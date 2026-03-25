Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951BA26A0A7
	for <linux-sound@vger.kernel.org>; Wed, 25 Mar 2026 13:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774445323; cv=none; b=QArCUIMdjErq+yf3jEhRj81t+/+N7bmSXM6cTmxj/1neW5xUV8tQljUaM8FhDi42GNANE/ozclQQq5W2rot8zPWXZgehzAl+6iCY7T1JgPRh9wtggR+ChMF1izC54ucXnG0FpkNooWaBl428bx8cNQYTmgnlax5A/JRsMRiyxYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774445323; c=relaxed/simple;
	bh=u0gZwCfVRmefDYuuoATLsTXZtIcX0eamEercteCiYCw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rpWW+x1mdvlJrjRD1zasLeX1k90gKYqFyex/VuxjE6rxoAKoPvlEbuyw6qNiIza9ku5gfeQ4OP5GmdaI2A1OB8xk1vxagysWBdfQBJyKQnvWxZcKhwfcIwtv2QMAy7oztiJ7RhrlynE+fHvHThfc6zRIX6mkykLtrpN55ZpWBfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eIKZYikD; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eIKZYikD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774445322; x=1805981322;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=u0gZwCfVRmefDYuuoATLsTXZtIcX0eamEercteCiYCw=;
  b=eIKZYikDIdb3p7m0Jzk/G6If03GrmoGtK1BSx2DvfIhr7xtLEaMVGY36
   WSZhaOFToN95mNKFP2wPiAWaoY8LBGSaTIBtlEuMuH1DVo3sN1x13YoaS
   kG91u7pTfli2QPJA0ISgqdfQ8hwju5SqIA5r6eEWJP3rv98vmpGXrz0iA
   /ieD+6+Pju1M24ogM7o5MZwVUqA9OCx5PzvkXyhNykVSWLMIRjKjbsGYw
   CP2WgbgPJISEX/7QlwEh3UrC5wZx3aoryt8eHExLVrMygoBOY93FCp+oz
   IqqGRVvDqRjbfilXaDWaRJjKixeMNf2NIY7RHCT64nJ71wC7GgloLMjw4
   A==;
X-CSE-ConnectionGUID: 0QI4tpjvQduYnn2QiwRetg==
X-CSE-MsgGUID: XKhWXehFS/O3g5gI/gmeNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="79074336"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="79074336"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 06:28:42 -0700
X-CSE-ConnectionGUID: XfD2luXiRqKkkPcIbo3Ckw==
X-CSE-MsgGUID: 5xP3FTH6TZObRO5YxyK/AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="221796224"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.245.36]) ([10.245.245.36])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 06:28:40 -0700
Message-ID: <420a8205-6a95-4e8a-852e-f3094200e5b1@linux.intel.com>
Date: Wed, 25 Mar 2026 15:28:55 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (re)use and (re)definition of snd_pcm_hw_params->fifo_size for
 'jumpy DMA'
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, arun@asymptotic.io,
 wim.taymans@gmail.com
References: <a03350b3-5828-4ffe-ade7-b94bb6ec7d64@linux.intel.com>
 <c521e0d9-4d69-4fd4-9c29-bb9b62c93310@perex.cz>
 <8fe7f61b-dae4-4ae6-aa96-7e604a37e624@linux.intel.com>
 <813612ea-f942-432f-9bf1-7b1ccfe59046@perex.cz>
 <6b129498-f130-44a0-a679-6fa1c639046e@linux.intel.com>
 <a3eaedae-f23b-46ac-9e8f-a6167df7ef41@perex.cz>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <a3eaedae-f23b-46ac-9e8f-a6167df7ef41@perex.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 24/03/2026 17:48, Jaroslav Kysela wrote:
> On 3/24/26 11:51, Péter Ujfalusi wrote:
> 
>>> But if we agree on other name like 'burst_size' or 'batch_size', I'll be
>>> fine with it, too.
>>
>> I think neither of these are right, unless we substitute them with a
>> variable which tells the size of the FIFO in hardware that is going to
>> be filled.
>> max_hw_ptr_burst_size or max_dma_burst_size or max_burst_size - in
>> frames?
> 
> I missed the 100ms + 1ms case (it was a bit hidden in the examples).

Sorry about that, too much sometimes result less ;)

> Looking to this again, I think that the terminology should be more
> abstracted. The DMA word is not appropriate in this contents. Even the
> burst word is not so good. Also, applications do not work with hw_ptr,
> but with the avail / delay values (calculated from the head [hw_ptr] /
> tail [appl_ptr] - playback).
> 
> I think that we both mean similar thing, but the question is how to
> define the right API for it.

Yes, I agree.

> Basically, for playback this value should be the "minimal fill"
> recommendation to avoid underruns. So for your examples, it should be
> 101ms or 196ms (but in samples) right ?
> 
> If we look to other direction (capture), it may describe the "maximal
> sample block" which will be put to the audio buffer (hw_ptr change).
> 
> So, perhaps, the xfer_latency name may be used (value should be in
> samples)? Applications should not go bellow this value.

Looking at the PW code (spa/plugins/alsa/alsa-pcm.c) and I sort of
started to appreciate the 'headroom' term.

I disagree that this is not about DMA or about burst since it is
precisely about that. It can be viewed as 'latency' but the latency is
reported via the delay and the delay fluctuates over time based on how
the DSP FIFO drains and fills.

What we want to tell applications is to be careful as the hw_ptr is not
running in steady pace, but it is jumping, bursting, uses bigger steps.
If we really want to be precise, we would want to expose two numbers:
A: the size of the FIFO will will be filled initially
B: the size of the steps which the hw_ptr will move after the initial
burst. This is also the 'distance' of these steps

So, again the 100ms FIFO:
A=100ms
B=96ms

start: hw_ptr moves to 100ms and will stay there for 96ms
50ms: hw_ptr is still at 100ms
96ms: hw_ptr jumps to 196ms and will stay there for 96ms
...
if you want to predict where the hw_ptr will be at any given time of
Xms hw_ptr: 100 + roundown(X - 100, 96) // if I'm right

A=100ms
B=1ms

start: hw_ptr moves to 100ms and will stay there for 1ms
50ms: hw_ptr is at 150ms
96ms: hw_ptr is at 196ms
...
if you want to predict where the hw_ptr will be at any given time of
Xms hw_ptr: 100 + roundown(X - 100, 1) // if I'm right

The kernel cannot predict how application is planning to manage the
buffer, but if it knows when it will wake up then it can pre-calculate
the amount of data it must provide to avoid xrun.

If B is not provided they can use B=A a rughstimate ;)

On capture side the hw_ptr will jump by B, A have no relevance.

A: hw_buffer_size
B: hw_buffer_refill_step_size

s/hw_buffer/offload ?

PW then probably can use these:
state->start_delay = hw_buffer_size;
state->headroom = hw_buffer_refill_step_size

and on start/xrun it might need to provide
state->start_delay + max(state->start_delay, state->headroom)
or to the distance that it is planning to wake up.

Likely applications can work this out even with A to keep things simple.

-- 
Péter

