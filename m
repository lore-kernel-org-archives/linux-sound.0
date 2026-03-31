Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B9133F8AD
	for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 14:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774966164; cv=none; b=VfZD+SH4Xfm+DX3qHTg+p/3Qqv3+diZEAj+oHztXfU278CazXbFjCnFtUVk22uV8VMhQihwUd4TcutYv9jgTtaHCtcRfjneXosJ7/hEbwsdlb+NIwHylO/ghXAdn7StX4eIbs3TbYuet7t7zV5ONxdt+iWk9CSThY6rtYEsaSy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774966164; c=relaxed/simple;
	bh=2w0ngJrbmXF6tUy0LlRP0HjJJny1NVtHmHBUcUFcOZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MwUrMhDa+3iawBIKv1eivxSX6ykn2HwEJYNaUSysdduSnK3I5ZP1YG8y4/bvkqy7eEuYAZgJGzmEx9Hyd15KRHBjUgKXTomw+aG3Ca1hE3Zh9CAiv/vZypITT4M1U681LTEPz8aDHboaQ48y1TfxrcQQoKsImErnaCo25EMC6to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PznJQkU5; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PznJQkU5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774966162; x=1806502162;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=2w0ngJrbmXF6tUy0LlRP0HjJJny1NVtHmHBUcUFcOZA=;
  b=PznJQkU5n+xhkjSCCrs29Yuu1F1NhxeGxZgsWTLAgJG1InTu8yCGbuwd
   QPCewVd3BC8Jlg+I6OjefyU7EM77/UA6L1n/IckAqLvXToP6y8X37HP7X
   RuxMVUDbO9spZZ/UtsmQMoOzgg+fBNGIJPDcOIxSxEzWjbVzicwpDlzDL
   U09mLDPRxJkInRV7olFUFBXPZkNdNIVqKKYa8D/VOF91OxdqItAXS6AQB
   T16Wl3ir1eF8pPfhvP578yuR5EuwlNnQKMr2G3iTME80S6kdBckeaDcRm
   lttXPAzdBBf3zfWIW2vczEYF/aiq10MBRtvQ3Cik0sai6s/POjASW6jmB
   w==;
X-CSE-ConnectionGUID: C03Z1/DZRpuWEiEIrdtGIA==
X-CSE-MsgGUID: EXr3Cn74Qmit9mGbNnkZTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="76092907"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="76092907"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 07:09:10 -0700
X-CSE-ConnectionGUID: xomyWnABScGrwXl+ZBG1Aw==
X-CSE-MsgGUID: XE3EYAwDQ+2uCIEQhuHOxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="219725950"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.218]) ([10.245.245.218])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 07:09:08 -0700
Message-ID: <4c73e4cb-298a-411a-97ed-f0eff1b06ac9@linux.intel.com>
Date: Tue, 31 Mar 2026 17:09:24 +0300
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
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <a1b6b2ed-2e26-48ff-afab-60f90ecc4360@perex.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 31/03/2026 15:00, Jaroslav Kysela wrote:
> On 3/31/26 12:56, Péter Ujfalusi wrote:
> 
>> Pipewire uses the minimum period size internally for headroom
>> calculation:
>> https://gitlab.freedesktop.org/pipewire/pipewire/-/
>> commit/9c42c06af00818038be494fd41632cb2d50a0df5
>>
>> This works more or less, but things started to get out of control soon.
> 
> It's conditional, so it's not a general rule. Pipewire just tries to
> push the drivers to limits with hard-coded assumptions.
> 
>> To get the most power saving benefit, you would want quite big
>> DeepBuffer, let's say 100ms but for video/voice calls you don't want
>> this big buffer, around 40ms should be OK, some other use case might
>> need something in between.
>> If you run tinyplay on the DeepBuffer PCM w/o  specifying period size,
>> it will fail to find the minimum and outright fails unless we lower the
>> DB to around 20ms.
>> With 20ms you don't have much power savings in case of audio playback.
>> So, you spam out several PCM devices with different DeepBuffer to
>> accommodate use cases, this is really not something that makes sense.
>>
>> This is the reason why I have reversed the rules and adjusted the
>> DeepBuffer size based on the period size.
>> In this case we still need to limit how large the DB can be, so it is
>> not true that the DeepBuffer equals to the period size, it is caped.
> 
> It seems that the discussion somewhere else:
> 
> 1) applications don't know what they are want, thus driver will enforce
> a configuration (e.g. a forced deep buffer)
> 
> 2) ALSA PCM period mapping to the hardware which allows "deep buffering"

With SOF we don't advertise the use of the DeepBuffer enabled PCM, it is only used on consumer devices where the audio HAL knows how to use it.
The static-DB and the dynamic-DB both works fine with applications, like mplayer, mpv, vlc, the only issue is with pipewire (which is not aware of it).
What I want is to achieve at the end is to advertise this via UCM's low-power-hifi, but due to the bursts, Pipewire can get xrun.

> At the moment, nothing prevents ALSA applications to use the bigger
> period sizes when there are known beforehand like "play background
> music". In other words - power efficiency can be controlled from the
> app.

But with a static-DB and locking t he period size to the DB size would prevent bigger period size use and even with bigger period size, if the DB size is 'small' then the power efficiency is out of the window.
But, if we increase the static-DB size then we limit the minimum period size to scale down.

> The applications can also update PCM buffer at any time, so new
> data (we are speaking about playback) can be feed at any time to make
> the time window for the underrun occurrence shorter when the driver
> transfers data to the hardware.

Yes, pipewire does this, it does not care about the period size while media players do. I guess most application which uses NO_PERIOD_WAKEUP does this, they don't care about period boundaries.
They look at avail (hw_ptr, sw_ptr, delay) and work on manage the data in buffer as close to hw_ptr as possible.

> 
> We may have those configurations (* = future when driver tells the
> initial count of queued periods):
> 

>  period | period count | init_periods  | minimal data latency |
> --------+--------------+---------------+----------------------+---------
>  4ms    | 4            | unsettled (1) | 4ms                  | realtime
> *4ms    | 200          | 25            | 100ms                | semi-realtime
>  1000ms | 2            | 1             | 1000ms               | pwr efficient

SOF specific, but we limit the period size to be min 8ms to unbrake pipewire to avoid xzrun on start and xrun handling and to hint application what is safe.
Also: we cannot scale the DeepBuffer infinitely, it is carved out from the DSP's SRAM, so it is limited.
period size=1000ms with DeepBuffer=100ms is perfectly valid configuration, as well period size=50ms with DeepBuffer=50ms, as well period size=1000ms with 4ms non-deepbuffer.
 
>> Strictly locking the DeepBuffer with period size creates another
>> obstacle for audio applications, audio servers like PW don't care about
>> periods, they work on the buffer with timer based updates and rewriting
>> samples in buffer ahead of the hw_ptr.
> 
> IMHO, the period size describes the expected minimal latency and
> applications can put more samples to the PCM buffer. So the whole
> question is to give suggestions which data threshold is safe for the
> standard operation.

Yes, it is and not. PW allocates big period sizes and manages really low latencies when it comes to audio.
And yes, the question is the 'headroom' that is safe to use by applications when dealing with something which is jumpy

> The timer based queuing should just help to feed data more frequently,
> but it does not mean that applications should not set the period size
> based on the requirements. Ideally, everything should be coordinated -
> period sizes with proper sample feed timing from the application side.

Right, but, but, in normal PCM of SOF, the ShallowBuffer is 4ms, we cannot set constraint for the period size to be min and max 4ms, that would xrun right away.
And this would just bring in the issue of the static DB that we have, if it is big, then applications would break if they want smaller periods.

BTW, should we still keep the dynamic DeepBuffer as a way from the kernel to do things automatically? It will allow unaware ALSA applications to gain this for free, but it needs information to be given to clever ones (like PW) on how to deal with the jumps.

Again: the deep buffer is not in use by user space, we just think that it is a great feature to have and would benefit laptop users if they listen to music with the screen blanked.

-- 
Péter

