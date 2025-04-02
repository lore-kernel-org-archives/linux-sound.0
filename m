Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83ED223370E
	for <linux-sound@vger.kernel.org>; Wed,  2 Apr 2025 08:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.48.224.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743583956; cv=none; b=J8MMpc5mYHN/58LXn8xUV3qrD5ZOs1rObP8XSl1SgLco9A0sEU1ELCgQ0rdjDuw59UgsCLQWO6swMEnFiJtVa+m1XOLahxw+OO9uCjurp7On9B2WLU9nqUi96GI2OQ/KnfbJo2dtvqi7qMlCzUP39p5Wiy6+EVrHaqXdx5pwpX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743583956; c=relaxed/simple;
	bh=HpzSOOG7mMocODUPPwo2SEpoaC754uHtYaaFlZgrYNo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g4ezTamZRe5fDCoaBWeRytC/3pZtn1mynnA5P3+8KiLPLIZpyFZh2mV8Z8Y+MnxsIJnB4SMENK4eOdZRE3ncvJKEdWaed9WaWjBzRKflMOE7axYphl0RSYKrLbvrMEYpqIzlCkhqDA+L8eTPx7GgfM1COsSfvkVVUEhbLX79+2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz; spf=pass smtp.mailfrom=perex.cz; dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b=gWs6Satk; arc=none smtp.client-ip=77.48.224.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perex.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b="gWs6Satk"
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 473864B3B;
	Wed,  2 Apr 2025 10:52:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 473864B3B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1743583948; bh=1w4c2lCsxXXc1RgJBRubkOqSkT1Ocdv1Wigx+MSpxNo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gWs6SatkhZkdFeRzrMtdz8lZZbH8JdL+WYdvre1PQRSsy1kvOM8CUocZniLkGIwLA
	 s+guLnRmQCSF6TspXaJRQpplQ9lwUs3Nxn5vrqvGvIglHkaZJr88O+Avvl/oCxEyrx
	 qMoSDj1uxCqsnV6apUwsZ1iPAsLwZkNKNFdwM7YI=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Wed,  2 Apr 2025 10:52:17 +0200 (CEST)
Message-ID: <ad064c22-320f-401a-b173-36a5df6df0ed@perex.cz>
Date: Wed, 2 Apr 2025 10:52:16 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: pcm: Release paused streams before suspend if
 resume is not supported
To: Takashi Iwai <tiwai@suse.de>
Cc: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, lgirdwood@gmail.com,
 broonie@kernel.org, tiwai@suse.com, linux-sound@vger.kernel.org,
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com,
 yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
 liam.r.girdwood@intel.com
References: <20250401133652.11617-1-peter.ujfalusi@linux.intel.com>
 <87r02cym1c.wl-tiwai@suse.de> <9e7d5b08-c983-49aa-8076-062d02848da2@perex.cz>
 <87jz83ztn7.wl-tiwai@suse.de> <206300d0-839a-40e9-975e-e58ac689315c@perex.cz>
 <87h637znpp.wl-tiwai@suse.de> <35d35586-4ffb-4d97-963e-a57323f634d3@perex.cz>
 <8734eryn21.wl-tiwai@suse.de>
Content-Language: en-US
From: Jaroslav Kysela <perex@perex.cz>
Autocrypt: addr=perex@perex.cz; keydata=
 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
In-Reply-To: <8734eryn21.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02. 04. 25 10:39, Takashi Iwai wrote:
> On Wed, 02 Apr 2025 10:09:36 +0200,
> Jaroslav Kysela wrote:
>>
>> On 01. 04. 25 21:27, Takashi Iwai wrote:
>>> On Tue, 01 Apr 2025 20:46:15 +0200,
>>> Jaroslav Kysela wrote:
>>>>
>>>> On 01. 04. 25 19:19, Takashi Iwai wrote:
>>>>> On Tue, 01 Apr 2025 18:58:40 +0200,
>>>>> Jaroslav Kysela wrote:
>>>>>>
>>>>>> On 01. 04. 25 16:49, Takashi Iwai wrote:
>>>>>>> On Tue, 01 Apr 2025 15:36:52 +0200,
>>>>>>> Peter Ujfalusi wrote:
>>>>>>>>
>>>>>>>> Streams moved to SUSPENDED state from PAUSED without trigger. If a stream
>>>>>>>> does not support RESUME then on system resume the RESUME trigger is not
>>>>>>>> sent, the stream's state and suspended_state remains untouched.
>>>>>>>> When the user space releases the pause then the core will reject this
>>>>>>>> because the state of the stream is _not_ PAUSED, it is still SUSPENDED.
>>>>>>>>
>>>>>>>>     From this point user space will do the normal (hw_params) prepare and
>>>>>>>> START, PAUSE_RELEASE trigger will not be sent by the core after the
>>>>>>>> system has resumed.
>>>>>>
>>>>>> Why you expect to see PAUSE_RELEASE trigger before SUSPEND trigger
>>>>>> when resume is not supported ? I think that the driver has complete
>>>>>> information:
>>>>>>
>>>>>> PAUSE -> SUSPEND [-> no RESUME]
>>>>>>
>>>>>> The driver should stay in the suspend state until a new stream
>>>>>> re-initialization is invoked.
>>>>>>
>>>>>> It looks like that other logic should be moved to the end driver (if
>>>>>> some parts must be reinitialized in the suspend phase when the resume
>>>>>> is not supported). I don't think that this is job for PCM core nor SoC
>>>>>> PCM core routines.
>>>>>>
>>>>>> The SUSPEND trigger is always invoked, isn't?
>>>>>
>>>>> No, that's a part of the problems.  The ops->suspend is called only
>>>>> for the running state, while at snd_pcm_post_suspend(), the state is
>>>>> changed to SUSPENDED.  The original state is saved as
>>>>> suspended_state, and this can be restored via snd_pcm_resume(), but
>>>>> only if the driver supports the full resume.
>>>>>
>>>>> We may allow calling ops->suspend also for PAUSED state, too.  But
>>>>> then each driver would need to have to handle this state change, too.
>>>>> Currently, when snd_pcm_prepare(), *_drop() or *_drain() is called at
>>>>> PAUSED state, the core automatically releases the pause beforehand.
>>>>
>>>> Thanks for those hints. I don't think that the pause release is sufficient
>>>> for this case - the stream must be stopped, too. Actually, all mentioned
>>>> prepare/drop/drain routines immediately changes state when the pause is
>>>> released.
>>>
>>> Actually, this patch follows the same pattern, too.  It calls
>>> snd_pcm_pause(false) to set the state to RUNNING again, then proceed
>>> to the suspend action immediately that sets to SUSPENDED.
>>
>> The previous state (suspended_state) will be confusing from the
>> application with the proposed patch, because there will be RUNNING
>> state instead PAUSED. This previous state is exported via API.
> 
> No, it won't happen.  The condition of the new behavior is only when
> SNDRV_PCM_INFO_RESUME isn't set -- that is, no resume is possible,
> hence no state recovery happens after resume.  From the application
> POV, it won't change.

The suspended_state can be obtained in snd_pcm_status64(). With Peter's patch, 
there will be RUNNING instead PAUSED, don't?

>> The pause release / stop patterns provide a short time window to
>> process some samples which may cause unwanted pops (especially for
>> playback). So perhaps,
>> we can address this in core (new triggers like PAUSE_RELEASE_AND_STOP), too.
> 
> That's true.  To be noted, the very same thing is applied to other
> operations like snd_pcm_drop() or snd_pcm_prepare(), so it's not only
> about the case of suspend.

Yes, I meant all places.

>>>> Maybe a new trigger may be added to notify drivers like:
>>>>
>>>> --- a/sound/core/pcm_native.c
>>>> +++ b/sound/core/pcm_native.c
>>>> @@ -1694,8 +1694,10 @@ static int snd_pcm_do_suspend(struct snd_pcm_substream *substream,
>>>>           struct snd_pcm_runtime *runtime = substream->runtime;
>>>>           if (runtime->trigger_master != substream)
>>>>                   return 0;
>>>> -       if (! snd_pcm_running(substream))
>>>> +       if (! snd_pcm_running(substream)) {
>>>> +               substream->ops->trigger(substream, SNDRV_PCM_TRIGGER_SUSPEND_WHEN_IDLE);
>>>>                   return 0;
>>>> +       }
>>>>           substream->ops->trigger(substream, SNDRV_PCM_TRIGGER_SUSPEND);
>>>>           runtime->stop_operating = true;
>>>>           return 0; /* suspend unconditionally */
>>>>
>>>> With this, the states won't be changed - the driver without resume support
>>>> can shut down all necessary things.
>>>
>>> That's another possibility, yes.  Though, IMO, it makes the
>>> pause-handling a bit more cumbersome.  With Peter's proposal, the
>>> pause state change is always paired, so the driver doesn't consider
>>> about that too much; that's the biggest merit.
>>
>> It depends, if we agree that releasing pause is a extra thing to do
>> when we know that this step is just to minimize state changes for
>> drivers.
>>
>> For my view, the drivers may also receive those triggers:
>>
>> SNDRV_PCM_TRIGGER_PAUSE_RELEASE_AND_STOP
>> SNDRV_PCM_TRIGGER_SUSPEND_IN_PAUSE
>> SNDRV_PCM_TRIGGER_RELEASE_IN_PAUSE
>>
>> This will allow to handle all states properly without any side effects
>> (like short unwanted DMA transfers).
>>
>> The drivers should probably activate those triggers conditionally to
>> not break current state sequences.
> 
> Hmm, that looks too complex, IMO.
> 
> Another slightly more straightforward fix would be just to allow the
> direct state transition from PAUSED to any state.  Then the remaining
> piece is all about driver implementations.  And, this can be
> conditionally operated, e.g. only when some extra flag is set.  When
> no flag is set, we keep applying PAUSE_RELEASE before the transition
> like now, including Peter's patch, that can work generically (but not
> always ideally).

It looks also feasible. My proposal just allows the straight state 
identification from the trigger value in the drivers.

>>> (BTW, I thought the state change PAUSED -> XRUN were possible, but
>>> actually it's not; this is another corner case to be addressed, I
>>> guess.)
>>
>> Which code (lines) do you mean?
> 
> snd_pcm_xrun() and snd_pcm_stop_xrun().  As far as I read the code,
> the state transition won't happen when it's in PAUSED state.

Yes, paused state should be handled there, too. But the pause release 
operation looks really suspicious for xrun.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
