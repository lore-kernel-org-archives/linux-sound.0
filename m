Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B075138656A
	for <linux-sound@vger.kernel.org>; Thu, 26 Mar 2026 12:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774526656; cv=none; b=e2SmNXz7Enh2L8jRmRw32LRBU1oQxbbRnBx9yLWCVOJVj03QmMxCRPDFohvr94mJORhulhtlmqEiyg4RB5jQ0eEMTtj4Xbhkb++djIYUPrhFrmRb269PqacihWxX4z1mZj7AunVSjSW6ghOlbjyPIV78LQYL7dQGudzKiHEY12I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774526656; c=relaxed/simple;
	bh=zdihGUYNRTvbma15RRqLshkNpQmW75lqN32ZKFC3I54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BX2eOJHZpZ3Dfkavr5yaaRXtvZ8iPzAiP7vbLlrbDD2vokAxYuUFyk1/h+MbRQ1CzRmUzaSWkXv6XiE0oQtCHJ8olINrgxTFhEfldramT3bbKsi2k2NbUf9rz+m1xtvG2Cup/VtjYqmT09bH2+17VCiT5DLfeEBz1APFyGDEjs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QXqQAjrA; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QXqQAjrA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774526654; x=1806062654;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=zdihGUYNRTvbma15RRqLshkNpQmW75lqN32ZKFC3I54=;
  b=QXqQAjrADNe/2p0cwuooVQ0HrzuIcFjFp0bAzpPVBpVCXcQr1fovoYP4
   Y46NeCtFe0fsEzInJhVNqrrXo4oh8FycHESF6Qn61OZi5ruqWQW4insW9
   Je79QXVnRWYyqhLV4tFWmLwtYW7zb6TiDDPafuhGT6+gQAjBpqfckG+3u
   rhNC+kz8aocBdIf3xtH4zOpm8HoPdi9tTIk6fxFgwJDXZ4MtS/qxxUZ4L
   b8psDTIEXhF8HYRBMxquzWF4OJtPzoRQP5ayU9h5I4RWMmW4fCRFKZx5q
   BizdHlI31LYJ/ahyzQgXxNCKUKb/rK3BUWZNKLoBVAM4ZCBbZTNt0qXyG
   Q==;
X-CSE-ConnectionGUID: F1QMcxtzSq+j8wQ2xMSCyw==
X-CSE-MsgGUID: rcyZ2O0pSWOQlAj3AnIO+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="86960550"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="86960550"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 05:04:14 -0700
X-CSE-ConnectionGUID: 1B2gqNaeTuigq8FKx3lrTg==
X-CSE-MsgGUID: sGMvx/1NQAywJTFu9ydE+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="224915430"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.245.219]) ([10.245.245.219])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 05:04:11 -0700
Message-ID: <41aa963d-876c-4ee1-b91c-7026e72a16ec@linux.intel.com>
Date: Thu, 26 Mar 2026 14:04:27 +0200
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
 <420a8205-6a95-4e8a-852e-f3094200e5b1@linux.intel.com>
 <1ca0acb2-18fb-449e-9a52-e73d9eebfb62@perex.cz>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <1ca0acb2-18fb-449e-9a52-e73d9eebfb62@perex.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 25/03/2026 16:08, Jaroslav Kysela wrote:
> On 3/25/26 14:28, Péter Ujfalusi wrote:
> 
>> Looking at the PW code (spa/plugins/alsa/alsa-pcm.c) and I sort of
>> started to appreciate the 'headroom' term.
>>
>> I disagree that this is not about DMA or about burst since it is
>> precisely about that. It can be viewed as 'latency' but the latency is
>> reported via the delay and the delay fluctuates over time based on how
>> the DSP FIFO drains and fills.
> 
> My point was that we should not use those terms for the structure
> members, because it's standard prefill / data fetch (put) granularity
> issue. DMA is just the concrete use. Describing both parameters seem
> like the best idea.

OK.

>> PW then probably can use these:
>> state->start_delay = hw_buffer_size;
>> state->headroom = hw_buffer_refill_step_size
> 
> We don't use head/tail in the buffer variables for ALSA API. The
> headroom can be named just 'update_granularity' or 'update_step' or so.
> Also, start delay is not correct, too. Maybe 'prefill' or 'init_fill'
> says all. Or we can eventually try to be more consistent and use
> 'init_chunk' and 'step_chunk' to notify applications about the data
> transfer characteristics from the other (hw) side of the audio buffer.
> The chunk word is not used actually in the ALSA API, so developers
> should not mix that with other things like fifo or period.

The headroom and start_delay are pipewire internal variables.

Right, let's go with init_chunk and step_chunk it is.
I needed to move these around in mouth to get the taste of it, but I
think it will do it.

It is better to have them in frames, right?

>> and on start/xrun it might need to provide
>> state->start_delay + max(state->start_delay, state->headroom)
>> or to the distance that it is planning to wake up.
> 
> It will end with 2 * prefill for your examples, because start_delay >
> headroom.

true

> It should be just prefill + step.

Not quite right, this works when the DSP buffer is 'large enough' - yes,
the definition for now is 'large enough', see:
We have only experience with this with SOF so far... The default PCMs
are using 4ms buffer in DSP and what we see is that if the PW headroom
is less than 8ms then it can xrun right away at start.
In this case the firmware steps the DMA in 1ms steps, so after just 1ms
into the playback (and this is counted when the kernel flipped the start
bit!) the DMA already pointing at the 6th ms data, if there is any
scheduling latency spike around this then it is pretty much guarantied
that and xrun will happen.
With larger DSP buffers this is less likely as the DMA is more stationary.

But, this is up to the application to interpret the values the kernel
gives, I would personally do the headroom 2x init_chunk at minimum for
the start/xrun case then use the step_chunk runtime.

> Also, it seems that in SOF case, the queued "prefill" sample block is
> mandatory for internal processing, otherwise xrun will happen, or no ?

Yes, the firmware fills the host buffer initially, but with
https://github.com/thesofproject/linux/pull/5673 this buffer is not
static, it changes based on period size. Can be limited by topology.

The prefill block is sort of not mandatory, we need ~4ms minimum
internally on host side to be able to compensate DSP internal scheduling
(clock scaling, power transitions, rate changes, etc), this is the default.
With 'DeepBuffer' on PCM we can put the system to lower PC state while
playing audio as we only need the DSP and the IP to run and it has audio
data to chew through.

-- 
Péter

