Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4B91E8837
	for <linux-sound@vger.kernel.org>; Wed,  2 Apr 2025 09:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743586100; cv=none; b=S0J8JKT3i9AsbSLT9IUCbbpsKnT6CuKk26qxQp8OxDC08c+2WawarJR3hPnrYoBUl+l59HAMqAMU6DPl0HFHW7AKl+22so2T6shJmWO8pwD+NN9TXXnNTpk02iFDDw/2M6UU3vT4QugcJ/csdXs8UIztmOM9bYfsrsgAIxr6tV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743586100; c=relaxed/simple;
	bh=eWxnDkEPjkA89WSO1xw2RmmMXgjn30nZ6VzcUf0AjPE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j3WbT2kBH0r/2P2ExGOhtwK1T3HvOErD18G3nfgb6obJDPYOEn1UC6frKanuisHMgm2f3hkB33ZZKE1ikdUGGtneVbFCEYeeCLXivtXWMXciLl4EO9Ny7c9oq6B/QcfhU3iUq4HcUioP0OitZxd7nWDyw1FkEn2XiG4CHCexwpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dv9mDyEv; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dv9mDyEv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743586099; x=1775122099;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=eWxnDkEPjkA89WSO1xw2RmmMXgjn30nZ6VzcUf0AjPE=;
  b=dv9mDyEvdTfYwBiXpMFfzGjgxn3seMeSHst7CsAg63qZTv5l8BWhK1k8
   Xv+J6PgF9RoCbsc1xk7rTT/5mdQffvYDrO/ly+5YQEp158z2Bd9Q3agdP
   YEbHy00+37l7CbzMXzO7XgGCsDbZ5UrUdDjQXAmG0/vDV5Gt64mLMVZsO
   IUtwigAKihlzIXAfTp7E8SDjuYHVZ1KBbOU8+9t9yKPvDN/z1nbXKU2Jo
   KpMd9yLx2VhSFeuKOmySPK/tyVMwCNEzRX+EsycNKDeiz+z/Gc8oJ9kz2
   SxZWzKVGbajf4+yVJj4yv67g7AEY00S1LIdvxu29g+MGOZ+MK40y4Rdk0
   A==;
X-CSE-ConnectionGUID: MyhELphIQEuJeuRPLibN1g==
X-CSE-MsgGUID: hg0id8/tSxuiVdXk2ZAPoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="44834543"
X-IronPort-AV: E=Sophos;i="6.14,181,1736841600"; 
   d="scan'208";a="44834543"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 02:28:08 -0700
X-CSE-ConnectionGUID: U1keyRC1QmaHGC/IBYyv/g==
X-CSE-MsgGUID: OrpCF9WYToCU+RUsVJdqbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,181,1736841600"; 
   d="scan'208";a="126603274"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.251.214]) ([10.245.251.214])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 02:28:04 -0700
Message-ID: <1417b256-b9e8-4256-b14f-fdee86e202c1@linux.intel.com>
Date: Wed, 2 Apr 2025 12:28:55 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: pcm: Release paused streams before suspend if
 resume is not supported
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>
Cc: lgirdwood@gmail.com, broonie@kernel.org, tiwai@suse.com,
 linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.dev, liam.r.girdwood@intel.com
References: <20250401133652.11617-1-peter.ujfalusi@linux.intel.com>
 <87r02cym1c.wl-tiwai@suse.de> <9e7d5b08-c983-49aa-8076-062d02848da2@perex.cz>
 <87jz83ztn7.wl-tiwai@suse.de> <206300d0-839a-40e9-975e-e58ac689315c@perex.cz>
 <87h637znpp.wl-tiwai@suse.de> <35d35586-4ffb-4d97-963e-a57323f634d3@perex.cz>
 <8734eryn21.wl-tiwai@suse.de> <ad064c22-320f-401a-b173-36a5df6df0ed@perex.cz>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <ad064c22-320f-401a-b173-36a5df6df0ed@perex.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 02/04/2025 11:52, Jaroslav Kysela wrote:
>>>> Actually, this patch follows the same pattern, too.  It calls
>>>> snd_pcm_pause(false) to set the state to RUNNING again, then proceed
>>>> to the suspend action immediately that sets to SUSPENDED.
>>>
>>> The previous state (suspended_state) will be confusing from the
>>> application with the proposed patch, because there will be RUNNING
>>> state instead PAUSED. This previous state is exported via API.
>>
>> No, it won't happen.  The condition of the new behavior is only when
>> SNDRV_PCM_INFO_RESUME isn't set -- that is, no resume is possible,
>> hence no state recovery happens after resume.  From the application
>> POV, it won't change.
> 
> The suspended_state can be obtained in snd_pcm_status64(). With Peter's
> patch, there will be RUNNING instead PAUSED, don't?

Yes, that is true, but it does not matter.
if the SNDRV_PCM_INFO_RESUME is not set, on resume nothing is going to
be done, the state remains SUSPENDED and the suspended_substate also
retained, so:

The stream was in RUNNING, after suspend:
state = SUSPENDED, suspended_state = RUNNING
After resume:
state = SUSPENDED, suspended_state = RUNNING
The the stream goes to xrun and got restarted.

The stream was in RUNNING, after suspend:
Without my patch / with my patch:
state = SUSPENDED, suspended_state = PAUSED / RUNNING
After resume:
state = SUSPENDED, suspended_state = RUNNING / RUNNING

The stream remains "not running" as resume is not supported and
application knows that it had left the stream paused.

When it tries to PAUSE_RELEASE the stream, in both case the core will
look at the state, which is SUSPENDED and thus the pause release fails
(it is not in paused state), so in both cases we go under a restart
(suspended_state is reset, ignored).

>>>> That's another possibility, yes.  Though, IMO, it makes the
>>>> pause-handling a bit more cumbersome.  With Peter's proposal, the
>>>> pause state change is always paired, so the driver doesn't consider
>>>> about that too much; that's the biggest merit.
>>>
>>> It depends, if we agree that releasing pause is a extra thing to do
>>> when we know that this step is just to minimize state changes for
>>> drivers.
>>>
>>> For my view, the drivers may also receive those triggers:
>>>
>>> SNDRV_PCM_TRIGGER_PAUSE_RELEASE_AND_STOP
>>> SNDRV_PCM_TRIGGER_SUSPEND_IN_PAUSE
>>> SNDRV_PCM_TRIGGER_RELEASE_IN_PAUSE
>>>
>>> This will allow to handle all states properly without any side effects
>>> (like short unwanted DMA transfers).
>>>
>>> The drivers should probably activate those triggers conditionally to
>>> not break current state sequences.
>>
>> Hmm, that looks too complex, IMO.
>>
>> Another slightly more straightforward fix would be just to allow the
>> direct state transition from PAUSED to any state.  Then the remaining
>> piece is all about driver implementations.  And, this can be
>> conditionally operated, e.g. only when some extra flag is set.  When
>> no flag is set, we keep applying PAUSE_RELEASE before the transition
>> like now, including Peter's patch, that can work generically (but not
>> always ideally).
> 
> It looks also feasible. My proposal just allows the straight state
> identification from the trigger value in the drivers.

We could also add a flag that the driver can say that 'I know what I'm
doing' and in that case send just simple SUSPEND and trust the driver
that it really knows what it is doing.
However if the driver does not support RESUME, then things get a bit
complicated. I'm not entirely sure what drivers do when they support
RESUME and they went to suspend with paused state...

But, this is not that simple in ASoC, as there we can have at least four
drivers involved (machine, platform, cpu dai, codec), all of them has to
support this new fine graded state dependent trigger, right?

-- 
Péter

