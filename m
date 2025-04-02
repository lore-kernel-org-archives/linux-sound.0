Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930A1367
	for <linux-sound@vger.kernel.org>; Wed,  2 Apr 2025 06:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743576053; cv=none; b=cIo9k7FNJYNmZtK9bE7HYRKQkkr/+ge6FV6cAjIx62sR8sTHHMUiCFlngQ5Av7UyeIApLlr4wAW5mDJvqrd9MEVfhiS9EjmK3SoCnDyC//xzFT3PED4EeeYTh2Gr6hVlKAbAskM+VrCrmQhidOzQTigpoXUzGvFjA72vOBDbZmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743576053; c=relaxed/simple;
	bh=367QqgmG2FNnOA8FGuda5FaMyiDaEcZfBo/5V4khB9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b6pnK198Pz1Dtn4H0I6xDBQaNLPI3yYglHHbWmmAQdmyj6dLiVwxXutHctLDqZV9BwxKSF8019sWbgbfZQper1fUpqSN+1qclbtXNee6rTBs5HCa07MFdlTYxc/Ri3FrMWPEEz9laA1heRHOc3vTGK53aU3dB8vf1LXxY5YL2s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kqz1utYa; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kqz1utYa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743576052; x=1775112052;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=367QqgmG2FNnOA8FGuda5FaMyiDaEcZfBo/5V4khB9o=;
  b=kqz1utYaoYhVHE6FMjxddgpc317Lxzm62PgldKQpF5bnzr1MB/ULanjr
   6qS/1v2GzHJSi+MbAvugRM5mfCijzKR1N6ynTZKmoJh/9LUpuI3QUuWes
   g8OcnZvekml99fK+ksDZBxXIu51SGTGUGyAcGShzaQ7GawgPMP3+zkfRO
   hO8Of9JEAM8n8nyHQNopVEBY/31SsaBKUiPPKTQBChc5Tgw4w+wtBh1wM
   ksPWBS/RmAbdVNsmk1thnzRyg4xmXRULGBwByBnHT35ScGEBDRSmmkAiU
   EeerHvF0QsEU5CHtSLGBKN5hRh4nVbkSEN93f1deqG4n0fuXZhr2H/zRz
   g==;
X-CSE-ConnectionGUID: wtfeSENWSEOjCF+EL5CErA==
X-CSE-MsgGUID: Dr9wE1D5SOeEKKcbe5yPnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="44175382"
X-IronPort-AV: E=Sophos;i="6.14,295,1736841600"; 
   d="scan'208";a="44175382"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 23:40:51 -0700
X-CSE-ConnectionGUID: QI/hsEE9RjKT+T/o5Y5qZA==
X-CSE-MsgGUID: PjQrgIU2TnSR/dwG7b8rRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,295,1736841600"; 
   d="scan'208";a="131584339"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.251.214]) ([10.245.251.214])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 23:40:47 -0700
Message-ID: <9c8c96a5-f6ba-4a62-956c-ccfc8af996eb@linux.intel.com>
Date: Wed, 2 Apr 2025 09:41:39 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: pcm: Release paused streams before suspend if
 resume is not supported
To: Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>
Cc: lgirdwood@gmail.com, broonie@kernel.org, tiwai@suse.com,
 linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.dev, liam.r.girdwood@intel.com
References: <20250401133652.11617-1-peter.ujfalusi@linux.intel.com>
 <87r02cym1c.wl-tiwai@suse.de> <9e7d5b08-c983-49aa-8076-062d02848da2@perex.cz>
 <87jz83ztn7.wl-tiwai@suse.de> <206300d0-839a-40e9-975e-e58ac689315c@perex.cz>
 <87h637znpp.wl-tiwai@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <87h637znpp.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 01/04/2025 22:27, Takashi Iwai wrote:
> On Tue, 01 Apr 2025 20:46:15 +0200,
> Jaroslav Kysela wrote:
>>
>> On 01. 04. 25 19:19, Takashi Iwai wrote:
>>> On Tue, 01 Apr 2025 18:58:40 +0200,
>>> Jaroslav Kysela wrote:
>>>>
>>>> On 01. 04. 25 16:49, Takashi Iwai wrote:
>>>>> On Tue, 01 Apr 2025 15:36:52 +0200,
>>>>> Peter Ujfalusi wrote:
>>>>>>
>>>>>> Streams moved to SUSPENDED state from PAUSED without trigger. If a stream
>>>>>> does not support RESUME then on system resume the RESUME trigger is not
>>>>>> sent, the stream's state and suspended_state remains untouched.
>>>>>> When the user space releases the pause then the core will reject this
>>>>>> because the state of the stream is _not_ PAUSED, it is still SUSPENDED.
>>>>>>
>>>>>>   From this point user space will do the normal (hw_params) prepare and
>>>>>> START, PAUSE_RELEASE trigger will not be sent by the core after the
>>>>>> system has resumed.
>>>>
>>>> Why you expect to see PAUSE_RELEASE trigger before SUSPEND trigger
>>>> when resume is not supported ? I think that the driver has complete
>>>> information:
>>>>
>>>> PAUSE -> SUSPEND [-> no RESUME]
>>>>
>>>> The driver should stay in the suspend state until a new stream
>>>> re-initialization is invoked.
>>>>
>>>> It looks like that other logic should be moved to the end driver (if
>>>> some parts must be reinitialized in the suspend phase when the resume
>>>> is not supported). I don't think that this is job for PCM core nor SoC
>>>> PCM core routines.
>>>>
>>>> The SUSPEND trigger is always invoked, isn't?
>>>
>>> No, that's a part of the problems.  The ops->suspend is called only
>>> for the running state, while at snd_pcm_post_suspend(), the state is
>>> changed to SUSPENDED.  The original state is saved as
>>> suspended_state, and this can be restored via snd_pcm_resume(), but
>>> only if the driver supports the full resume.
>>>
>>> We may allow calling ops->suspend also for PAUSED state, too.  But
>>> then each driver would need to have to handle this state change, too.
>>> Currently, when snd_pcm_prepare(), *_drop() or *_drain() is called at
>>> PAUSED state, the core automatically releases the pause beforehand.
>>
>> Thanks for those hints. I don't think that the pause release is sufficient
>> for this case - the stream must be stopped, too. Actually, all mentioned
>> prepare/drop/drain routines immediately changes state when the pause is
>> released.
> 
> Actually, this patch follows the same pattern, too.  It calls
> snd_pcm_pause(false) to set the state to RUNNING again, then proceed
> to the suspend action immediately that sets to SUSPENDED.

My original RFC patch did the PAUSE_RELEASE followed by STOP in SOF code
to clear out the paused streams on suspend:
https://lore.kernel.org/linux-sound/20250331105631.7436-1-peter.ujfalusi@linux.intel.com/

Which if I convert it on top of the applied patch would look like this
in core (+ pending comment update):

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index a16d15ee98fa..c1bd993c650c 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -1741,8 +1741,10 @@ static int snd_pcm_suspend(struct
snd_pcm_substream *substream)
 	 * to handle them properly when the system resumes.
 	 */
 	if (runtime->state == SNDRV_PCM_STATE_PAUSED &&
-	    !(runtime->info & SNDRV_PCM_INFO_RESUME))
+	    !(runtime->info & SNDRV_PCM_INFO_RESUME)) {
 		snd_pcm_pause(substream, false);
+		return snd_pcm_stop(substream, SNDRV_PCM_STATE_SETUP);
+	}

 	return snd_pcm_action(&snd_pcm_action_suspend, substream,
 			      ACTION_ARG_IGNORE);


But what I like about the current way is that it is bringing the paused
stream handling in line with other triggers as Takashi-san mentioned.
Paused cannot be directly stopped for example, it needs to be released,
then stopped. Drivers don't need special state machines to handle all
permutations of state changes.

>> Maybe a new trigger may be added to notify drivers like:
>>
>> --- a/sound/core/pcm_native.c
>> +++ b/sound/core/pcm_native.c
>> @@ -1694,8 +1694,10 @@ static int snd_pcm_do_suspend(struct snd_pcm_substream *substream,
>>         struct snd_pcm_runtime *runtime = substream->runtime;
>>         if (runtime->trigger_master != substream)
>>                 return 0;
>> -       if (! snd_pcm_running(substream))
>> +       if (! snd_pcm_running(substream)) {
>> +               substream->ops->trigger(substream, SNDRV_PCM_TRIGGER_SUSPEND_WHEN_IDLE);
>>                 return 0;
>> +       }
>>         substream->ops->trigger(substream, SNDRV_PCM_TRIGGER_SUSPEND);
>>         runtime->stop_operating = true;
>>         return 0; /* suspend unconditionally */
>>
>> With this, the states won't be changed - the driver without resume support
>> can shut down all necessary things.
> 
> That's another possibility, yes.  Though, IMO, it makes the
> pause-handling a bit more cumbersome.  With Peter's proposal, the
> pause state change is always paired, so the driver doesn't consider
> about that too much; that's the biggest merit.

I agree with this sentiment. If we do something like this then all
drivers (which might have similar issue, a note on this later) needs to
be updated and have some magic done, and in case of SOF that would be:
substream->ops->trigger(substream, SNDRV_PCM_TRIGGER_PAUSE_RELEASE);
substream->ops->trigger(substream, SNDRV_PCM_TRIGGER_STOP/SUSPEND);

to handle the messy FE/BE/DSP sequencing.
> But I'm all ears about this issue.  Let's see.
> 
> (BTW, I thought the state change PAUSED -> XRUN were possible, but
> actually it's not; this is another corner case to be addressed, I
> guess.)

Overnight I was thinking of how the suspend while a stream is handled or
can be handled if the PCM supports RESUME.
The paused stream is not a stopped stream and it is not receiving
SUSPEND as it is not running either, but a paused stream might be only
having it's DMA trigger source disabled to stop the hw_ptr moving while
a stopped one have the DMA disabled along with all analog/digital
components.
I'm not sure if sending the SUSPEND trigger to a paused stream is a
solution either as that will surely need different handling as it is not
expected currently (and again SOF have a delicate dance around triggers
starting in ASoC level, but might work).

Note on the pause in general: for few years now pause is in reality a
niche feature and most drivers will never see it used. PA. PW, Chrome,
Android don't use it much or at all, so hitting a suspend while the
stream is paused is a CI thing mostly. mplayer/mpv (kodi might as well)
do pause directly when using ALSA and the PCM supports it, but they work
w/o SNDRV_PCM_INFO_PAUSE just fine.

-- 
Péter

