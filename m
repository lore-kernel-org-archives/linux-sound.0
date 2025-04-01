Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E1D1F1921
	for <linux-sound@vger.kernel.org>; Tue,  1 Apr 2025 11:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743506873; cv=none; b=XfUz3qbb/Y4fxARwO6hKZShbrciYiuq20PGZJ1wWdXQgjhFjOJ+CHdHLXCJMWW0dOe4uvAOXmPLlLzrCfSStvTrwbXfqzQjRGTvmH3DDv2+aVuT9PVsQ1K9D4xhlMlvgX0jVU3yGaq71PIOL9rIUPvRohGhf7nPbHGB+9JJXqAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743506873; c=relaxed/simple;
	bh=ciKhvjlQFkUmDuYsEqI6+jQGqMc/j45uhCl9GKqmiRQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OII0E8udcAncp6X2ZEm6HUo59fbxl89PcVlm0mkP70QRMOc1iHFN15P4KorkydDoar+aplN4wI5VrH+VR+jtd6Im7nyKhOvGjG0ZkeB6t4otidbKn+UEeFiNBorq3p5vXBr1hM7eNMk1SPzJuVisjYdODJQacGCF+39bjzq0jK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MUb39U0z; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MUb39U0z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743506872; x=1775042872;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ciKhvjlQFkUmDuYsEqI6+jQGqMc/j45uhCl9GKqmiRQ=;
  b=MUb39U0zgWU2szd75bo1QHr2tjp3E6EXpUQf5AhyLVPuFeiim5bqdDBY
   /KNBMEkOEk1UGc2LVDEWqMEBUGFR/twFZ6TmqejjSNIKoBBLVn0apsOzk
   8ZCrgo7nP6yftHRAb52CXubyBpc/llyRHxggLgShkt0kTRXP1waNT5Ck8
   rjt26NgdO8N90zc72VKCRi9bPcO1iKKHpwWuKGnj8iYOPBLZ5cGRLsbIa
   RJo/2Nw4ouZoVwLwMTCv+eBahFiRmQeM7Pf5oQ1cq+ovaJhqfhXU8wwEr
   EoYRHLFHrfzJ/1+5vobSjRN/QDOpfOsp19G714na3fDMbNgwSVMVkzIZh
   w==;
X-CSE-ConnectionGUID: C12DRc4ITT+VUYTYiMNwWg==
X-CSE-MsgGUID: L009yy76ThiGywgaUudzUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="55821280"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="55821280"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 04:27:51 -0700
X-CSE-ConnectionGUID: p0yVZnddS4CM/mkbvAHFOw==
X-CSE-MsgGUID: ymvXDl3TTiOW1vOFyvq82A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="126824918"
Received: from mpelleg-mobl3.ger.corp.intel.com (HELO [10.245.251.179]) ([10.245.251.179])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 04:27:47 -0700
Message-ID: <648a5d66-6e68-4287-9dce-20c2a2541e5c@linux.intel.com>
Date: Tue, 1 Apr 2025 14:28:38 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] ASoC: SOF: sof-pcm/pm: Stop paused streams before the
 system suspend
To: Takashi Iwai <tiwai@suse.de>
Cc: lgirdwood@gmail.com, broonie@kernel.org, tiwai@suse.com, perex@perex.cz,
 linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.dev, liam.r.girdwood@intel.com
References: <20250331105631.7436-1-peter.ujfalusi@linux.intel.com>
 <87wmc5319m.wl-tiwai@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <87wmc5319m.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 31/03/2025 14:09, Takashi Iwai wrote:
> On Mon, 31 Mar 2025 12:56:31 +0200,
> Peter Ujfalusi wrote:
>>
>> Paused streams will not receive a suspend trigger, they will be marked by
>> ALSA core as suspended and it's state is saved.
>> Since the pause stream is not in a fully stopped state, for example DMA
>> might be still enabled (just the trigger source is removed/disabled) we
>> need to make sure that the hardware is ready to handle the suspend.
>>
>> This involves a bit more than just stopping a DMA since we also need to
>> communicate with the firmware in a delicate sequence to follow IP
>> programming flows.
>> To make things a bit more challenging, these flows are different between
>> IPC versions due to the fact that they use different messages to implement
>> the same functionality.
>>
>> To avoid adding yet another path, callbacks and sequencing for handling the
>> corner case of suspending while a stream is paused, and do this for each
>> IPC versions and platforms, we can move the stream back to running just to
>> put it to stopped state.
>>
>> Explanation of the change:
>> Streams moved to SUSPENDED state from PAUSED without trigger. If a stream
>> does not support RESUME then on system resume the RESUME trigger is not
>> sent, the stream's state and suspended_state remains untouched.
>> When the user space releases the pause then the core will reject this
>> because the state of the stream is _not_ PAUSED, it is still SUSPENDED.
>>
>> From this point user space will do the normal (hw_params) prepare and
>> START, PAUSE_RELEASE trigger will not be sent by the core after the
>> system has resumed.
>>
>> Link: https://github.com/thesofproject/linux/issues/5035
>> Link: https://github.com/thesofproject/linux/issues/5341
>> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
>> ---
>> Hi,
>>
>> Please see the problem statement and details of the issue in the commit
>> message.
>>
>> I'm not sure if this should be done in ALSA+ASoC level instead. My fear
>> is that this is changing how things has been working since almost
>> forever and it really puzzles me why it is not affecting other drivers.
>> It is true that in SOF the PAUSED state is not equal to STOPED while
>> it might be so for other vendors (it is for TI stuff for sure).
>>
>> The main point is that when we do a system suspend and a stream is in
>> PAUSED state, it will not be triggered (PAUSED == SUSPENDED/STOPPED
>> assumption?). On resume, if the platform is not supporting RESUME then
>> nothing will be done for the PAUSED stream, but a PAUSE_RELEASE will
>> fail and all sorts of state machine assumption will break in SOF/ASoC
>> stack.
>>
>> I have a PR open for quite long [1] but we would like to find the best
>> solution for us and possibly for others facing the same issue as well.
>>
>> [1] https://github.com/thesofproject/linux/pull/5058
> 
> IMO, this kind of thing should be handled in ALSA core side.
> If we want to avoid possible breakage, a flag can be introduced and
> perform this conditionally, too.  It'll become a bit complex, but
> that's because of the subtle hardware behavior differences,
> unfortunately.

I had hard time to define that flag to act upon for months ;)

It is something of a mix of conditions that needs to be present and
_might_ not really need a new flag:

The PCM device must support SNDRV_PCM_INFO_PAUSE and must not support
SNDRV_PCM_INFO_RESUME.
Given that ALSA core will not trigger the PAUSED streams on suspend,
they just moved to SUSPENDED.
On resume the RESUME is going to be skipped as well as it is not
supported, the PAUSED stream remains SUSPENDED.
If the RESUME is supported then the driver will receive the trigger and
_might_ be able to move things around to match the paused state it was
before suspend.

This patch in a way plays with these rules knowing that on resume the
paused stream is going to fail to release and we will go to a new start,
so internally it would bluntly stops anything which is paused, they will
never going to PAUSE_RELEASE, they will be started w/o the driver's
knowledge of a skipped pause release.

What I'm not sure is how this can be done legitimately in core. Move the
stream from PAUSED to STOPPED without user space knowing it? So after
resume the it thinks that the stream is paused, but the kernel has moved
it to stopped?

In SOF we need a bit higher level triggers to have the delicate
sequencing right for the BE/FE and for the IPC versions.

I think this is where I thought that this is a bit more complicated than
just add a flag and do the trigger.

Note: this workaround do have a small drawback due to what it does: it
will release the pause on the stream for a short period, which might or
might not have audible consequence, but that is still better than broken
audio stack.
> AFAIK, dmaengine PCM code assumes that the paused device can be safely
> suspended / resumed as is.

Yes, but that is a bit different as the DMAengine drivers will handle
the suspend independently and save context, with SOF (on Intel/AMD at
least) we don't use DMAengine for HD-DMA...

> There is a special handling to do pause at snd_dmaengine_pcm_trigger(), for example.

Yes, DMAengine have dmaengine_pause(), but that is optional, not all DMA
drivers have it implemented / supported.
Some DMA driver I still maintain the pause is either a stop or a a
genuine pause and on suspend the context is saved to be restored on resume.
> Also, the suspend/resume after pause worked on other legacy devices,
> as it seems, too.

Yep, they do, but we have the DSP and firmware with it's own state and
BE/FE triggering fun with the addition of the difference of sequencing
IPCs and host operations between IPC versions.

I was surprised when I invested time to figure out why this is happening
to be honest.

---
Péter
