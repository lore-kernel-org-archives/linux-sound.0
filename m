Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDD2363C77
	for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 11:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774955960; cv=none; b=A11Z2jsK/fsW2rNKJHtP3vUamHDN85bX2t/lOWLrxth/JGhBXWsytXlM76ZgbuWV62X36R99qT1KMh6U+Lydh5ru8Qy4RU+ex5jltRIGNJwBDJwU/JjSaoIhAX2TOk56DB2t4olxCUU5n8CQy12VvEeqvo+QMskONW+wCWlkj1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774955960; c=relaxed/simple;
	bh=7e2DKN5T+Ldsotlah2+jYvMITCK15tyepExrQBaoVYA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ax/A8uGmZLVNDFOr+1fbB4I5L4KL+YXnGNUvUIeQWSRdKZbL3HtrjlFPEx0ZjGrhL8gMc3XtFX0NSoH2BPkXLvDup9a3UOFcsXL7hXk8zFIl6Z4QvKeKoMUfC2koLLKVUYm40rV6DY/ec4EbxN00CXoc8btlYW8JMJi1QIUY+Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gn/44BEU; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gn/44BEU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774955959; x=1806491959;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=7e2DKN5T+Ldsotlah2+jYvMITCK15tyepExrQBaoVYA=;
  b=Gn/44BEUgFKa1mPh70ZMGPcgXL8JE19jOh0uBQIDl1OGLEQejeV4Ehh5
   oidxc5q3BqyoF+zw9Ma3i0cPEt63EWSnV6pet3G7n+vJK5R84cnMxiBOb
   rQTwXPaFGMEUv3+lquh6fWsTxTGfZuyMn+DZvVWTJ7O5yKatSz25pySIB
   qLLn7xpIkmdC3M1tTB3T6N5YD/mggfspIuoodguQXiqlcNTkr1db4wYPB
   HIBEEJULCakc/xxMdSKi+nuMbhkcWMnqhtnc5NFtfFvUbS6o0AF9EXqyN
   MvEzC8pxlfCB4x0qRZmah/Yo/kzsaXamp1LaSBtiz9Kqb1CN2ny4KNWl9
   A==;
X-CSE-ConnectionGUID: iGF+QS0zQqqgLD+rhsR8KA==
X-CSE-MsgGUID: hCyKy3MUQ7+2VveXy6hNsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="93353464"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="93353464"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 04:19:18 -0700
X-CSE-ConnectionGUID: 5JkvFg8fSXyjjaBvRbewIQ==
X-CSE-MsgGUID: 9UDH8d7tQtC6DSmDX5vN5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="227950075"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.218]) ([10.245.245.218])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 04:19:15 -0700
Message-ID: <edd8f698-145f-406a-ab70-988fd63ee7bd@linux.intel.com>
Date: Tue, 31 Mar 2026 14:19:32 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (re)use and (re)definition of snd_pcm_hw_params->fifo_size for
 'jumpy DMA'
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Mark Brown <broonie@kernel.org>,
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
 <878qb8tsib.wl-tiwai@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <878qb8tsib.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 31/03/2026 09:36, Takashi Iwai wrote:
>> We came to the same conclusion with Jaroslav, and the plan is to
>> introduce two new parameter in hw_params:
>> init_chunk and step_chunk, both in frames.
>> init_chunk - is the size of the hw_ptr jump right when the start happens
>> step_chunk - is the runtime jump size which happens every step_chunk time.
>>
>> for example:
>> init_chunk = 100ms
>> step_chunk = 1ms
>> hw_ptr moves 100ms on start (pointing to 101ms), after 1ms of time the
>> hw_ptr will move 1ms ahead to 102ms, in another 1ms it again moves 1ms
>> to 103ms...
>>
>> init_chunk = 100ms
>> step_chunk = 96ms
>> hw_ptr moves 100ms on start (pointing to 101ms), after 96ms of time the
>> hw_ptr will move 96ms ahead to 197ms, in another 96ms it again moves 1ms
>> to 293ms...
> 
> In the second example, where does 1ms offset comes from?
>   hw_ptr moves 100ms on start (pointing to 101ms)

The DMA moved 100ms, so the hw_ptr is now pointing to the data after it,
which is the start of the 101th ms.

> I thought that this 1ms is the step_chunk size in the first example...
> 
>> Note, the first is theoretical, with SOF 1ms step is used only with
>> 'small' DSP side buffer:
>>
>> init_chunk = 4ms
>> step_chunk = 1ms
>> hw_ptr moves 4ms on start (pointing to 5ms), after 1ms of time the
>> hw_ptr will move 1ms ahead to 6ms, in another 1ms it again moves 1ms to
>> 7ms...
> 
> So, init_chunk is the size to be filled up at the start, something
> similar like sw_params.start_threshold, but it's rather a hardware
> requirement.

Yes and no,
yes since there must be init_chunk amount be in the buffer to avoid
immediate xrun.
no, because if even if init_chunk amount is prepared, the application
must provide step_chunk data within step_chunk time, failure to do so
will also result xrun.
init_chunk=100ms
application needs ~5ms to produce new data after start
step_chunk=1ms
in 5ms the when the application is able to produce new data, the hw_ptr
will be 106ms, so it must have provided at least this amount on start.

step_chunk=1ms
in 5ms the when the application is able to produce new data, the hw_ptr
will be 101ms, application can safely rewrite t he data at that
location, it is safe to provide only 100ms of data for start.

> And step_chunk is essentially the hw_ptr granularity?

In essence yes, we can report sub step_chunk position, but in practice
the DMA burst is fast.

>> I'm not sure if we want these to be snd_pcm_uframes_t types in
>> snd_pcm_hw_params or should be u32 simplify the shrinking of reserved..
>>
>> -       unsigned char reserved[48];
>> +       snd_pcm_uframes_t init_chunk;	/* in frames */
>> +       snd_pcm_uframes_t step_chunk;	/* in frames */
>> +       unsigned char reserved[48 - 2 * sizeof(snd_pcm_uframes_t)];
>>
>> with u32 we can simply change the reserved size to 40, which is anyways
>> going to be the case for the snd_pcm_hw_params32{}
> 
> In my idea, it may be configurable, hence it belongs to interval, so
> it's two in ires[9] for the reserved intervals.

I see.

>>> if a device allows a different queue size, it should be configurable
>>> via hw_params.
>>
>> I'm not sure if I follow this statement. the fifo_size is a driver to
>> user space information, driver fills it and user space ignores it ;) - I
>> cannot find any evidence of it's use.
> 
> If a chip has a similar constraint but the init and step sizes are
> adjustable, they should be configurable via hw_params procedure --
> that's my point.

The fifo_size is driver to application information, it is set by the driver.

>> The init_chunk, step_chunk would be similar, the driver sets it and user
>> space would use it.
>>
>> In SOF this will be dynamic and it will depend on the period size:
>> https://github.com/thesofproject/linux/pull/5673/commits/18f3ba5e42212d77019d79ec09b7057a7703d361
> 
> Well, so even in your case, the driver can implement the hw_constraint
> for coupling those numbers, too.  Then application may choose the
> init_chunk or step_chunk, which restricts the period size
> automatically.

We would also need a capability flag to say that this is supported on
the PCM device, right?
But, I see, the kernel places min/max or even step constraint on the
init_chunk and step_chunk, but the step_chunk must be also constrained
and refined in core in correlation with the init_chunk.
Limiting the period size is something I'm not sure about, probably the
minimum size can be limited, but how to calculate it?
The upper constraint is problematic when for example you want some
buffering (~40ms) but still want to have bigger period sizes because you
want bigger buffer and the number of periods are limited already by
hardware.

> If application doesn't choose those, the hw_params
> engine will choose depending on the period size, and application can
> see the values after hw_params call.

Hm, I cannot constrain the period size in open when I don't know if the
user will set the init/step_chunk and if they set it then somehow I need
to use that, but if not set then use the dynamic DB size calculation and
set the interval accordingly?

I guess some of this work must be done by the core, some by the driver..

-- 
Péter

