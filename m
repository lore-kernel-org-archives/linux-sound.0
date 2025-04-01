Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7984B202F99
	for <linux-sound@vger.kernel.org>; Tue,  1 Apr 2025 12:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743509977; cv=none; b=mP9v3FTqqNRm92nK2UKNfmToWxf03yJ8sv1QwPyATCpMKcuV9w2oTuD5ul5GDfrhXG4R3wT3VIaV9NBF3x2wNa3LWAamZSj/5O9DTCms9cSDzQq3vHngsEu2ryx39dA4NwMMz2Bs5DmsO2u4/ZOMuNEQx5YfvBF88sM4WN0tzWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743509977; c=relaxed/simple;
	bh=K8pxSMgvRMeh9buHkkzA5lIpAecKcTWUCP7l9Jy2vyw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=OrKO1MluMz5oJDn7vc4FH3SqNJWa72ak4d0RHWgS0htevJRgLWVvC+lqy5x0W7pDosyx345vqDwRza5/EiCBv5BE8SzJct4FkGd/lakVU/jCwoFDPYHEnTONM3QLEh3fafLbW7n20aLCKLflzQH8ggP/sIlq5FVo4Ea+I/RJNfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XYyYu0vg; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XYyYu0vg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743509975; x=1775045975;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=K8pxSMgvRMeh9buHkkzA5lIpAecKcTWUCP7l9Jy2vyw=;
  b=XYyYu0vgrbLAMo3J24DBfKsxSfoB1KBiVThyuiq1a3AI6PBVSt92z9Uo
   scWzBTxoQO9/ahcxwZz2O4LQrV26191lsCrNNuob+6TTDZODFmxFaqLwK
   gIG0ymL99kHdeg75xFfgAYfhnfv+8AY/PNMqch+7g++dg3EjzAZ0UxCeD
   vk6CHS35P52gfGQ7J8kU9AR2Zji7ebFy2ltKd+MO3TciXdS5yxO1avvUM
   Cdt21vwWXIuMaisETFAz+/kVgi2W+WwZItWvB4UAyCzL3VN14rLj6lkST
   zxERS9ILxKwLkuukdHXMmf7JzZZVv19cH6+MsmLU++nedwV8KiZ4lv1lc
   w==;
X-CSE-ConnectionGUID: EKIv5IGFQD+h8dvp5BAEMw==
X-CSE-MsgGUID: BZuLQFnpRw+zxaeDyzCezw==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="48497688"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="48497688"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 05:19:27 -0700
X-CSE-ConnectionGUID: KPb4FGwITqmSTKQs4KohCg==
X-CSE-MsgGUID: /J+K25BwRvaZutnUbbZLzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="149550290"
Received: from mpelleg-mobl3.ger.corp.intel.com (HELO [10.245.251.179]) ([10.245.251.179])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 05:19:23 -0700
Message-ID: <52a4cc86-8982-48a5-ad4c-35c8d6d52cde@linux.intel.com>
Date: Tue, 1 Apr 2025 15:20:14 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] ASoC: SOF: sof-pcm/pm: Stop paused streams before the
 system suspend
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: lgirdwood@gmail.com, broonie@kernel.org, tiwai@suse.com, perex@perex.cz,
 linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.dev, liam.r.girdwood@intel.com
References: <20250331105631.7436-1-peter.ujfalusi@linux.intel.com>
 <87wmc5319m.wl-tiwai@suse.de>
 <648a5d66-6e68-4287-9dce-20c2a2541e5c@linux.intel.com>
Content-Language: en-US
In-Reply-To: <648a5d66-6e68-4287-9dce-20c2a2541e5c@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 01/04/2025 14:28, Péter Ujfalusi wrote:
> 
> 
> On 31/03/2025 14:09, Takashi Iwai wrote:
>> On Mon, 31 Mar 2025 12:56:31 +0200,
>> Peter Ujfalusi wrote:
>>>
>>> Paused streams will not receive a suspend trigger, they will be marked by
>>> ALSA core as suspended and it's state is saved.
>>> Since the pause stream is not in a fully stopped state, for example DMA
>>> might be still enabled (just the trigger source is removed/disabled) we
>>> need to make sure that the hardware is ready to handle the suspend.
>>>
>>> This involves a bit more than just stopping a DMA since we also need to
>>> communicate with the firmware in a delicate sequence to follow IP
>>> programming flows.
>>> To make things a bit more challenging, these flows are different between
>>> IPC versions due to the fact that they use different messages to implement
>>> the same functionality.
>>>
>>> To avoid adding yet another path, callbacks and sequencing for handling the
>>> corner case of suspending while a stream is paused, and do this for each
>>> IPC versions and platforms, we can move the stream back to running just to
>>> put it to stopped state.
>>>
>>> Explanation of the change:
>>> Streams moved to SUSPENDED state from PAUSED without trigger. If a stream
>>> does not support RESUME then on system resume the RESUME trigger is not
>>> sent, the stream's state and suspended_state remains untouched.
>>> When the user space releases the pause then the core will reject this
>>> because the state of the stream is _not_ PAUSED, it is still SUSPENDED.
>>>
>>> From this point user space will do the normal (hw_params) prepare and
>>> START, PAUSE_RELEASE trigger will not be sent by the core after the
>>> system has resumed.
>>>
>>> Link: https://github.com/thesofproject/linux/issues/5035
>>> Link: https://github.com/thesofproject/linux/issues/5341
>>> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
>>> ---
>>> Hi,
>>>
>>> Please see the problem statement and details of the issue in the commit
>>> message.
>>>
>>> I'm not sure if this should be done in ALSA+ASoC level instead. My fear
>>> is that this is changing how things has been working since almost
>>> forever and it really puzzles me why it is not affecting other drivers.
>>> It is true that in SOF the PAUSED state is not equal to STOPED while
>>> it might be so for other vendors (it is for TI stuff for sure).
>>>
>>> The main point is that when we do a system suspend and a stream is in
>>> PAUSED state, it will not be triggered (PAUSED == SUSPENDED/STOPPED
>>> assumption?). On resume, if the platform is not supporting RESUME then
>>> nothing will be done for the PAUSED stream, but a PAUSE_RELEASE will
>>> fail and all sorts of state machine assumption will break in SOF/ASoC
>>> stack.
>>>
>>> I have a PR open for quite long [1] but we would like to find the best
>>> solution for us and possibly for others facing the same issue as well.
>>>
>>> [1] https://github.com/thesofproject/linux/pull/5058
>>
>> IMO, this kind of thing should be handled in ALSA core side.
>> If we want to avoid possible breakage, a flag can be introduced and
>> perform this conditionally, too.  It'll become a bit complex, but
>> that's because of the subtle hardware behavior differences,
>> unfortunately.
> 
> I had hard time to define that flag to act upon for months ;)
> 
> It is something of a mix of conditions that needs to be present and
> _might_ not really need a new flag:
> 
> The PCM device must support SNDRV_PCM_INFO_PAUSE and must not support
> SNDRV_PCM_INFO_RESUME.
> Given that ALSA core will not trigger the PAUSED streams on suspend,
> they just moved to SUSPENDED.
> On resume the RESUME is going to be skipped as well as it is not
> supported, the PAUSED stream remains SUSPENDED.
> If the RESUME is supported then the driver will receive the trigger and
> _might_ be able to move things around to match the paused state it was
> before suspend.
> 
> This patch in a way plays with these rules knowing that on resume the
> paused stream is going to fail to release and we will go to a new start,
> so internally it would bluntly stops anything which is paused, they will
> never going to PAUSE_RELEASE, they will be started w/o the driver's
> knowledge of a skipped pause release.
> 
> What I'm not sure is how this can be done legitimately in core. Move the
> stream from PAUSED to STOPPED without user space knowing it? So after
> resume the it thinks that the stream is paused, but the kernel has moved
> it to stopped?
> 
> In SOF we need a bit higher level triggers to have the delicate
> sequencing right for the BE/FE and for the IPC versions.
> 
> I think this is where I thought that this is a bit more complicated than
> just add a flag and do the trigger.

Having said all of this, the following small diff works well with SOF
stack, for aplay this is fine at least ;)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 6c2b6a62d9d2..6d8389642e37 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -1694,8 +1694,14 @@ static int snd_pcm_do_suspend(struct
snd_pcm_substream *substream,
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	if (runtime->trigger_master != substream)
 		return 0;
-	if (! snd_pcm_running(substream))
-		return 0;
+	if (! snd_pcm_running(substream)) {
+		if (runtime->info & SNDRV_PCM_INFO_RESUME ||
+		    runtime->state != SNDRV_PCM_STATE_PAUSED)
+			return 0;
+
+		/* release the paused stream to suspend */
+		snd_pcm_pause(substream, false);
+	}
 	substream->ops->trigger(substream, SNDRV_PCM_TRIGGER_SUSPEND);
 	runtime->stop_operating = true;
 	return 0; /* suspend unconditionally */

So, if the PCM device does not support resuming, then release the pause
before going the suspend.

-- 
Péter

