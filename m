Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D16242D7F
	for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 13:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776174450; cv=none; b=qsNqyzDAWlk1gV9yzHZJA4GlgvXwDgPAt+uvvkAcREiD6e3X/k1KrvO8v0vrtspQK7xKsJ9SAXI0lXdwYDLG8nMObtbuLCYjVcgM1p8m8DExpUuKdCk01xZkfZtXoqJ58Jh0IFI0gOc6jZHjxYPp9LaciLR0VN00cjISlV414SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776174450; c=relaxed/simple;
	bh=JgGjLwEUkpyhc/k5hdqeFKnFQimd13ILedHbkJhJsgs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IzNhLqkIabLir5A3OC8GCGPOEUAf6Ytwp7GAbilDCEzVJ8dseYATe6V5S8sujjB5XgK1YbkddVkPoN3wx4vO5dZUf5vA2nJG79yikehME4CMl9gG5qtAkl6unp0LDqlUAKShjDtlJ2k57hujRxqSuPc5CalPYKvLeDU1E9FQsEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QUX1X9hx; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QUX1X9hx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776174449; x=1807710449;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=JgGjLwEUkpyhc/k5hdqeFKnFQimd13ILedHbkJhJsgs=;
  b=QUX1X9hxClw0cbDwoNUoUJcyatR+KNZEHuTsOkgwgFiby6NeDA83fxtH
   senQe164WdoGLBIrs9XKh9it6ppo82PSZmENSGRzPSNHt+rUXoq0yzta8
   pUKsdOLUP8MOpfHSZ5aq40WNlT+ROY5eiXP9jMCuo3UVEwhWMJtBCIVuT
   beTZQkC1sDMOemZknmzjS3bab0Yc1TR1XuApRCYi9nQnsIZEbHtzYuJiz
   AnuuZewi/NrA0oZlYzsQsRyCCtMaT1QUmxxmxb+hK5Y0xdqnVr8rZc9mi
   H6t35ojI6yIVQ572hye7Ll/OIigVtzESKhXA/duoQrBAPDiZbZ3XKx/AB
   A==;
X-CSE-ConnectionGUID: FOBjts9qSWCOJaEAUKw7eQ==
X-CSE-MsgGUID: CG3Mz2RMSEyzAgxeKcO8vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="77203090"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="77203090"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 06:47:28 -0700
X-CSE-ConnectionGUID: YKLIUhuETm2TJ7jW4WwNJQ==
X-CSE-MsgGUID: oe3ico06SQ247h6LXMYjdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="230032915"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.245.121]) ([10.245.245.121])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 06:47:25 -0700
Message-ID: <401a7777-e83c-4120-9d82-71388bf38397@linux.intel.com>
Date: Tue, 14 Apr 2026 16:47:49 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (re)use and (re)definition of snd_pcm_hw_params->fifo_size for
 'jumpy DMA'
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, arun@asymptotic.io,
 wim.taymans@gmail.com
References: <a03350b3-5828-4ffe-ade7-b94bb6ec7d64@linux.intel.com>
 <87se9htms4.wl-tiwai@suse.de>
 <67b9f48b-1cc7-4dac-8f6a-c0cba6a84b36@linux.intel.com>
 <87ikadtgpe.wl-tiwai@suse.de>
 <dadef18b-1c2e-4c0d-8ae8-2e4b8ad75d04@linux.intel.com>
 <878qb8tsib.wl-tiwai@suse.de> <88979231-caef-4eaa-b89d-22e6973c92f9@perex.cz>
 <cfb84df3-c2bf-4173-bc45-7df29b6a94a3@linux.intel.com>
 <a1b6b2ed-2e26-48ff-afab-60f90ecc4360@perex.cz>
 <4c73e4cb-298a-411a-97ed-f0eff1b06ac9@linux.intel.com>
 <978bdc67-b91e-437a-bb8a-b609a4fef6d1@perex.cz>
 <b97ae6b9-ef72-4dbf-bf29-9092ec3919d8@linux.intel.com>
 <82d870b3-4ec1-440a-ae8b-87edbf665b99@perex.cz>
 <542a9743-2a47-477a-b457-ae32c3f8dc49@linux.intel.com>
 <39fcca55-77f4-4cd9-8a94-d80e5b94c8ba@perex.cz>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <39fcca55-77f4-4cd9-8a94-d80e5b94c8ba@perex.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 14/04/2026 14:14, Jaroslav Kysela wrote:
> On 4/14/26 12:44, Péter Ujfalusi wrote:
> 
>>> How you would like to handle this in an universal way?
>>
>> I think both could be handled by driver provided init_chunk and
>> step_chunk value:
> I don't think so. Actually, sound servers set relatively "big" period
> sizes and expect the lower transfer granularity.

yes, this is what they do.

> The "latency" request must come from application.

Fair point, although the PCM device could advertise that I'm 'jumpy' so
application can check how it will behave.

I also have hard time applying the term 'latency' on this as the aim is
not to introduce latency, but to increase power saving which do causes
increased latency by design.
I can increase latency easily without any power saving benefit by using
big buffer and still streaming constantly into it from ALSA buffer -
let's say for running *trendy-two-letter-word* algorithm on the audio.

I'm OK with latency of XYms with this stream does not imply that jumpy
DMA is also OK. Unless the two is tied by definition in documentation.

> If you read my last proposal, there are two new flags and one changes
> (clarifies) "period size" to be related to the expected (transfer)
> latency.

With my 'simplified' view this is also possible, but the driver tells
(via a flag in snd_pcm_hardware.info) the application that on the device
the period size will relate to jumpy-DMA, please check back how this
will affect you after you set you buffers.

> So, the current (inaccurate - driver specific) behavior won't
> change until application set this flag.

Sort of similar way how the SNDRV_PCM_INFO_NO_PERIOD_WAKEUP /
SNDRV_PCM_HW_PARAMS_NO_PERIOD_WAKEUP is implemented?

I guess an implicit flag from user space would be good so that if the
hw_params flag is not set by applications then the FIFO is either
disabled or the PCM will work with minimal buffers - like in SOF the
default PCM.

> This extension allows us to do
> the full "refine" (handshake) between application and kernel to settle
> the transfer details with the slightly updated framework. Also, this
> flag will activate init_periods and step_periods fields. Basically, the
> app will set the maximal acceptable period size (expected latency = 2 *
> period size) and the driver will return first biggest period size
> depending on driver constraints (initial periods will be included - in
> this case the period size must be lowered to maintain the requested
> latency). It's the complete handshake.

My main problem with this is that I cannot reply to application which
say that I can accept up to XYms latency.
I don't know the latency in here, it depends on the DSP topology that
has been loaded, what I can know is how the host side hw_ptr will behave.
Sure, that translates to a 'latency' It will add maximum of FIFO size
latency , but this FIFO size is not equal to the initial burst size in
some cases, if the FIFO size is small then we will overshoot with hw_ptr.

This is why I try to see this from a power or race to idle point of view.
It is sort of I'm OK to not touch data right on front of the hw_ptr
because I know that initially the DMA will move about this far and then
at every Zms it will move Zms ahead - which I can actually monitor via
the PCM delay.

> I just miss this handshake in your proposal and scratching my head why
> we cannot use period sizes for this, because (as explained) it was the
> base transfer block when the API was designed.

Yes, the handhsake was missing, let me think about this a bit more.

-- 
Péter

