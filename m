Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71191494D8
	for <linux-sound@vger.kernel.org>; Thu,  3 Apr 2025 10:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743675173; cv=none; b=udiOsuEhJlo7aLUx0eibs+q4T3QFWTP5vGbqpDlTmMaNepOkyjUkPNsoZ6ApKHHkmaBxRuMPhqk391DaeWB9A53SKQ2ndkktchqRHDQag3rLWWk3BIkGuXfLOYKlqCqk9X5rBM/fG+UPUTu7sMYFkHdSHdJBcwMfNQd+Je/VEK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743675173; c=relaxed/simple;
	bh=XPlXqDjlj/dLWLGmobqr51/RyyU8UMSkW4DAMrL9ukY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sJXDJIONefBsSsKC2S2lqdMeKV39gxn7YzJ+7C4RB6Rh3H0rrM8wsKe2BZ5DlEL1kJPCckOicU1iNqsKde3BjZ3GdUGeqNQM+FzZ/mQr7tag0iC1vtLz4GJ9ANk8LCEVuVSnmz6Qk1LO7U0CNotVu4Lc1BbUtU4psGTQv6HGgJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DTfUMCea; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DTfUMCea"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743675172; x=1775211172;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=XPlXqDjlj/dLWLGmobqr51/RyyU8UMSkW4DAMrL9ukY=;
  b=DTfUMCeaQ1olRvfdkOMvuXhP1jrVLjhdNKvsmNODqcDr6zBFhJ27JeS5
   YBbGptlQ23XAYPqfkUC2PgJiGoAYtDVyij+MmzTugS/ErK3jDoZX0xLyx
   UGnKqpOxY0iSZaXohXbJDvhNcrQCc0wWUocSxo+s24dqg0Ouz+fdHKiSy
   1txMVmmhoXwDQVolDh+9LjAeaoIOpobRpbAQhTuc9Iq6h7yHOae3uImW8
   hiFFLB0qBuV/OPG9t5eDTQtVVkixQxS+4UlxBIpyIgA85qQVdObJGwUBD
   dZfC5gmQ8h2NYP2XuM+s1pk2/O9Lp+utOTXwnAOGz1wBxfuSytIxYHFCe
   A==;
X-CSE-ConnectionGUID: 2Blre3kxQbSn0Q/KW5mi+g==
X-CSE-MsgGUID: ZrEMSbz8Sd2GDD0Nq5Xfng==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="32676938"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="32676938"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 03:12:51 -0700
X-CSE-ConnectionGUID: AwwDsZcVTFKN/H70ze3B+A==
X-CSE-MsgGUID: 00P8MOPES1OLNISxO6+WIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="126729809"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.251.235]) ([10.245.251.235])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 03:12:47 -0700
Message-ID: <51bf9695-1f70-4749-b70a-2ed4af8c4be7@linux.intel.com>
Date: Thu, 3 Apr 2025 13:13:39 +0300
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
Cc: Jaroslav Kysela <perex@perex.cz>, lgirdwood@gmail.com,
 broonie@kernel.org, tiwai@suse.com, linux-sound@vger.kernel.org,
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com,
 yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
 liam.r.girdwood@intel.com
References: <20250401133652.11617-1-peter.ujfalusi@linux.intel.com>
 <87r02cym1c.wl-tiwai@suse.de> <9e7d5b08-c983-49aa-8076-062d02848da2@perex.cz>
 <87jz83ztn7.wl-tiwai@suse.de> <206300d0-839a-40e9-975e-e58ac689315c@perex.cz>
 <87h637znpp.wl-tiwai@suse.de> <35d35586-4ffb-4d97-963e-a57323f634d3@perex.cz>
 <8734eryn21.wl-tiwai@suse.de> <ad064c22-320f-401a-b173-36a5df6df0ed@perex.cz>
 <87v7rmylc5.wl-tiwai@suse.de> <d4169edb-1dcc-4eef-9f3e-9b8c93cdc648@perex.cz>
 <87o6xeyfkk.wl-tiwai@suse.de>
 <69c52779-ef90-45c5-a024-77f0030bf5cd@linux.intel.com>
 <87jz82ye7b.wl-tiwai@suse.de>
 <8878feb6-362a-4541-91fb-318aea1c0870@linux.intel.com>
 <87o6xe7l4q.wl-tiwai@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <87o6xe7l4q.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 02/04/2025 16:23, Takashi Iwai wrote:
> On Wed, 02 Apr 2025 14:52:48 +0200,
> Péter Ujfalusi wrote:
>>
>>
>>
>> On 02/04/2025 14:50, Takashi Iwai wrote:
>>> On Wed, 02 Apr 2025 13:43:57 +0200,
>>> Péter Ujfalusi wrote:
>>>>
>>>>
>>>>
>>>> On 02/04/2025 14:21, Takashi Iwai wrote:
>>>>>>> On the second thought, yet another variant would be to introduce only
>>>>>>> one new trigger, SNDRV_PCM_TRIGGER_PAUSE_RESET, for resetting the
>>>>>>> PAUSED state as a step before stopping the stream.  This can be
>>>>>>> applied to all cases for snd_pcm_drop() and snd_pcm_suspend(), too.
>>>>>>> If the driver doesn't support this mode, the PCM core may fall back to
>>>>>>> SNDRV_PCM_TRIGGER_PAUSE_RELEASE.
>>>>>>
>>>>>> This looks identical to my proposed
>>>>>> SNDRV_PCM_TRIGGER_PAUSE_RELEASE_AND_STOP which is more
>>>>>> explanatory. It's not clear what PAUSE_RESET should do (probably the
>>>>>> stream should be kept inactive).
>>>>>
>>>>> There is a slight difference.  My proposal, *_TRIGGER_PAUSE_RESET,
>>>>> doesn't have to stop the stream by itself, but it's only a preparation
>>>>> for stopping.  That is, a proper TRIGGER_STOP always follows after
>>>>> TRIGGER_PAUSE_RESET.
>>>>
>>>> But what state that we move after we reset the PAUSE? is it RUNNING
>>>> (iow, equals to PAUSE_RELEASE) or something else?
>>>
>>> It'll be temporarily set to RUNNING.
>>>
>>>> In case of suspend while the state is paused we will:
>>>> TRIGGER_PAUSE_RESET followed by STOP or SUSPEND?
>>>
>>> For suspend, PAUSE_RESET, then SUSPEND.
>>> For dropping, PAUSE_RESET, then STOP.
>>
>> OK, but this is still the same as PAUSE_RELEASE+SUSPEND when it comes to
>> suspended_state, no?
>> I mean you need to move to RUNNING to be suspend, or stop to skip the
>> suspend.
> 
> Yes, and this needs to be addressed.  e.g. save the suspended_state
> beforehand.
> 
>>>> Most drivers are doing the same thing for STOP and SUSPEND trigger,
>>>> however it is possible to do extra steps for SUSPEND to make sure that
>>>> the whole system is in a lowest power state.
>>>
>>> Yes, that's the reason I proposed PAUSE_RESET.  Then the driver can
>>> handle the following stop or suspend operation differently.
>>>
>>> That said, PAUSE_RESET is just another variant of PAUSE_RELEASE.
>>> But this shouldn't actually enable the audio output again, but prepare
>>> for the next SUSPEND or STOP trigger.
>>
>> I'm not sure how this would be seen in ASoC level. Surely we need to
>> have flag per components that it is handling PAUSE_RESET as codecs would
>> like don't want to do it or they migh, hm.
>> But ASoC maintains another set of state for the dpcm:
>> SND_SOC_DPCM_STATE_* and it has this as well among other state-machine
>> things:
>> case SNDRV_PCM_TRIGGER_SUSPEND:
>> 	if (be->dpcm[stream].state != SND_SOC_DPCM_STATE_START)
>> 		goto next;
>>
>> So, this is dpcm level, but one component can support PAUSE_RESET while
>> the other does not and the transitions are not too clear to me.
> 
> It's a good question.  ASoC may have the own intermediate state
> (SND_SOC_DPCM_STATE_PAUSED_RESET) or just use
> SND_SOC_DPCM_STATE_START but leave all to BE trigger (by passing
> SNDRV_PCM_TRIGGER_PAUSE_RESET).
> 
>> But the idea of resurrecting a paused stream with mute held is not bad.
>>
>> I'm still uncertain how this actually works now on systems where RESUME
>> is supported and we suspend while a PCM is in paused...
> 
> Is it a general question about suspend+resume during pause, or the
> behavior change after PAUSE_RESET?  PAUSE_RESET won't be applied to
> the drivers that support RESUME.
> 
> BTW, I'm not pushing to sell PAUSE_RESET so much for now at all.
> Currently rather in a brain storming phase.  Let's try to pick up the
> more appropriate one.

While I think the patch is a good start to handle the current situation
with a minimal change (and a possibility of dropping it when the more
elaborate and likely laborious one is available), this is how it was
before the patch in regards to suspend while paused:

RESUME is suported:
- Stream is PAUSED
- No SUSPEND trigger is sent (stream is not running), state changes to
SUSPENDED, suspended_state is PAUSED
- On resume, no RESUME trigger is sent (suspended state is not RUNNING
or DRAIN), but the state is changed to PAUSED.
- On PAUSE_RELEASE the trigger is sent (how it is handled in driver is
another question as we had suspended the system in between).

RESUME is not suported:
- Stream is PAUSED
- No SUSPEND trigger is sent (stream is not running), state changes to
SUSPENDED, suspended_state is PAUSED
- On resume, no RESUME trigger is sent (resume is not supported), the
state remains to SUSPENDED, suspended_state is PAUSED
On PAUSE_RELEASE the core will raturn error as the state is not PAUSED,
it is SUSPENDED and we go to xrun recovery
- driver received PAUSE_PUSH but never receives PAUSE_RELEASE

I think that the SUSPEND trigger (or a new similar trigger) should be
sent to a PAUSED stream regardless of RESUME support. Imho it is not a
correct assumption that a PAUSED stream is ready for system suspend, it
might not be, it might needs to be prepared for that.
If we use the same SUSPEND trigger than the drivers need to track their
paused state as well to know what to do - we rely on the enforced state
changes in core to do this implicitly atm.

If there is no RESUME support, then it is a bit more complicated as
after the system suspend the audio hardware's state does not matter,
whenever it was RUNNMING or PAUSED we need to go to xrun recovery to
restart, resume is not supported.

But if RESUME is not supported we do need to send the PAUSE_RELEASE to
balance the PUSH.
Should we set XRUN as suspended_state in case of RESUME is not
supported? Or some other state which indicates that whatever we had
before, we are not going to be able to pick up where we were?

The fact that we discuss this shows how much this corner case have been
excercised (we eneded upm disabling this in CI testing for now in SOF).

-- 
Péter

