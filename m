Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC0223A980
	for <linux-sound@vger.kernel.org>; Wed,  2 Apr 2025 12:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743598322; cv=none; b=na9P+A8jSXgikhHclXqOf5NItD0icCdLJ/Sh4fC55wpcpz09bHa0u1J7V/j++xq/1V7iNt/MwMHyyxB0ZzqgKvy9TMdTiMrQg5/L0REJi5dfHKF6wgSlAOc/6x5a8FBl0HTKCHKhTh0eLHEUVNE4ZMS4rJtXGYo531UkwBErhYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743598322; c=relaxed/simple;
	bh=AvatdzCAqiSqmFN+hiQtpvNJon9uaaYvHKBzkdVJIr0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pSwyUvW4wz3T6BaZalJQoWotmpBk1h0KRIqO/su7h7sokJz9di6Xy7cA9g1I51nUdtAGEjQk10S/HI24uKVi5DNBSnUuWrHSfjgiBDfPArT9JQkDh3Vxy+x45V9OpQxL19PjTwcAvT6sB/6UL+X2imWYU6izL9A1/uRaMVwBcyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X0EuXTPW; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X0EuXTPW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743598321; x=1775134321;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=AvatdzCAqiSqmFN+hiQtpvNJon9uaaYvHKBzkdVJIr0=;
  b=X0EuXTPWf+4sZ5IG/4U+qRK5qK+qGl1nIzSbRWR8WNSH8DzcCHXEH8QO
   lWBIq9YGaVn2PTZ+0eAT5pjseJFDDmcc4KiS6/cKZopdC2RDOR9joPeqL
   5sgtHR5TeuiF4NboBkv52sxPBX33+dfhc81fSQxRgwBdgz4dE8HPQaAzV
   Y1LIcD1Nk82MelbOdru2xtvoBQBuFQ/M+zFUM0lIw4108U7X2qoLoP1K2
   qfCKAwsYyis+fBlxO+gW90X2brk32KtQ5uTH7nUId4U64LDd6CbRm+54Y
   pLdNc79SANSSEb4KXaMMwSiWS6rSw84+a6+cuIh8zLFxa1htjPxUMRns7
   Q==;
X-CSE-ConnectionGUID: yo4C/h1gT+u9KD9QO5q1Hg==
X-CSE-MsgGUID: c2t6XZC1Q3yNAqKH6VSujA==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="48625968"
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; 
   d="scan'208";a="48625968"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 05:52:01 -0700
X-CSE-ConnectionGUID: OdCyzS/OQo6GZ/kXBW9Cvw==
X-CSE-MsgGUID: IIwYBM23RWSDQrDKV1M0fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; 
   d="scan'208";a="126510340"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.251.214]) ([10.245.251.214])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 05:51:56 -0700
Message-ID: <8878feb6-362a-4541-91fb-318aea1c0870@linux.intel.com>
Date: Wed, 2 Apr 2025 15:52:48 +0300
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
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <87jz82ye7b.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 02/04/2025 14:50, Takashi Iwai wrote:
> On Wed, 02 Apr 2025 13:43:57 +0200,
> Péter Ujfalusi wrote:
>>
>>
>>
>> On 02/04/2025 14:21, Takashi Iwai wrote:
>>>>> On the second thought, yet another variant would be to introduce only
>>>>> one new trigger, SNDRV_PCM_TRIGGER_PAUSE_RESET, for resetting the
>>>>> PAUSED state as a step before stopping the stream.  This can be
>>>>> applied to all cases for snd_pcm_drop() and snd_pcm_suspend(), too.
>>>>> If the driver doesn't support this mode, the PCM core may fall back to
>>>>> SNDRV_PCM_TRIGGER_PAUSE_RELEASE.
>>>>
>>>> This looks identical to my proposed
>>>> SNDRV_PCM_TRIGGER_PAUSE_RELEASE_AND_STOP which is more
>>>> explanatory. It's not clear what PAUSE_RESET should do (probably the
>>>> stream should be kept inactive).
>>>
>>> There is a slight difference.  My proposal, *_TRIGGER_PAUSE_RESET,
>>> doesn't have to stop the stream by itself, but it's only a preparation
>>> for stopping.  That is, a proper TRIGGER_STOP always follows after
>>> TRIGGER_PAUSE_RESET.
>>
>> But what state that we move after we reset the PAUSE? is it RUNNING
>> (iow, equals to PAUSE_RELEASE) or something else?
> 
> It'll be temporarily set to RUNNING.
> 
>> In case of suspend while the state is paused we will:
>> TRIGGER_PAUSE_RESET followed by STOP or SUSPEND?
> 
> For suspend, PAUSE_RESET, then SUSPEND.
> For dropping, PAUSE_RESET, then STOP.

OK, but this is still the same as PAUSE_RELEASE+SUSPEND when it comes to
suspended_state, no?

I mean you need to move to RUNNING to be suspend, or stop to skip the
suspend.
>> Most drivers are doing the same thing for STOP and SUSPEND trigger,
>> however it is possible to do extra steps for SUSPEND to make sure that
>> the whole system is in a lowest power state.
> 
> Yes, that's the reason I proposed PAUSE_RESET.  Then the driver can
> handle the following stop or suspend operation differently.
> 
> That said, PAUSE_RESET is just another variant of PAUSE_RELEASE.
> But this shouldn't actually enable the audio output again, but prepare
> for the next SUSPEND or STOP trigger.

I'm not sure how this would be seen in ASoC level. Surely we need to
have flag per components that it is handling PAUSE_RESET as codecs would
like don't want to do it or they migh, hm.
But ASoC maintains another set of state for the dpcm:
SND_SOC_DPCM_STATE_* and it has this as well among other state-machine
things:
case SNDRV_PCM_TRIGGER_SUSPEND:
	if (be->dpcm[stream].state != SND_SOC_DPCM_STATE_START)
		goto next;

So, this is dpcm level, but one component can support PAUSE_RESET while
the other does not and the transitions are not too clear to me.

But the idea of resurrecting a paused stream with mute held is not bad.

I'm still uncertain how this actually works now on systems where RESUME
is supported and we suspend while a PCM is in paused...

-- 
Péter

