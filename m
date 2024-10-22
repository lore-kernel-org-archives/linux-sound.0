Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6106E1A0BFE
	for <linux-sound@vger.kernel.org>; Tue, 22 Oct 2024 15:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729609894; cv=none; b=BaBMg7Defaj5ENV+nhZN5Y2N9o/OzgRlo1siE0MDwJHF0E5meUmpuHABi4JXuNEw8H/novdA7HdFx2zBvcA7EHz2G+1vTqxv5OD9ePvC8WEEnKytMwHF5mMER9wXWh93k4VU5jyX/3az7Y22bVKNnH338ldH8uAC1s4WNoZwcew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729609894; c=relaxed/simple;
	bh=RSb1bsRvKHa77xO0n+Y/I5M/4K4LnbNIBh8fZzG/o0M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dfpSv1FpIjK1sMrqLPWmY5+yz14rowNiz3XkO4x2LbtAirbZ2v96ebUUBM+WCa9Dq/3SKvhyJCvH7Q1aYYhB0HAzI/BTl8t7aDk36j34J7NswPfv5X7EFlDbf8nO9Kx5imRuOMrBKkBbKr5l1tIYar/qGpWqyzuS+iSKUoBMPi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hTEIqUwN; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hTEIqUwN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729609893; x=1761145893;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=RSb1bsRvKHa77xO0n+Y/I5M/4K4LnbNIBh8fZzG/o0M=;
  b=hTEIqUwNgYO5+LYAqECek/uVRUICHvk7hcb63hMfOtqVP6Q/HBm7BGIs
   47YlRsVbRRczRPv4Edtv/KBRT08d+kuRNW2Uz9cErv4uh5yKNh3kX6X0L
   7nkY+iEiciBU6pf5a1vpMOig7tBMRMaRDatZ2EiriI0KQiwZhXUNKHDS9
   m+ysCMGmB7Bqj64coHs69UYApg+6AUqOTYB5NLrqIuAZBRpm5kDPdybB5
   cY4yLtD1jZSwcT+7YDfiqnnyu0U32/KtYkru3LLHUoMAhyvXIn/2rtQN7
   MQdj1EB/YfL6yul5B8AwndmOMj94iA4QXTh5NT6jyY43R2lbadmrOtZcm
   w==;
X-CSE-ConnectionGUID: 1TFBKHB6Tcul32VoutFfTA==
X-CSE-MsgGUID: PL15oZUkRXOxUjc6/FhbSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="16779954"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="16779954"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 08:11:33 -0700
X-CSE-ConnectionGUID: DvDj3VMkTvu1+PHFxDS6Lg==
X-CSE-MsgGUID: QIMm4ZxWRPSWNhxjJ7j2Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="84717787"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53]) ([10.94.0.53])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 08:11:31 -0700
Message-ID: <0c620aa7-ddad-42ae-b82f-91c4aaf80c83@linux.intel.com>
Date: Tue, 22 Oct 2024 17:11:28 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/4] Add support for detection
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>, linux-sound@vger.kernel.org
References: <20241016130228.1013227-1-amadeuszx.slawinski@linux.intel.com>
 <87y12ory4x.wl-tiwai@suse.de>
 <51db28da-7eb8-401a-b86e-98d95f896643@linux.intel.com>
 <87r08grwgd.wl-tiwai@suse.de>
 <57dbb306-cccd-4f5d-87d3-cab8aef85dda@linux.intel.com>
 <bb3cc47b-0a5a-4604-9343-17e0be3c7a06@perex.cz>
Content-Language: en-US
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <bb3cc47b-0a5a-4604-9343-17e0be3c7a06@perex.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/18/2024 7:15 PM, Jaroslav Kysela wrote:
> On 18. 10. 24 16:16, Amadeusz Sławiński wrote:
> 
>> Our use case is to:
> 
> Inlined my proposal:
> 
>> 1. Program DSP with all pipelines it needs to implement whole scenario
>> (hw_params)
> 
> SNDRV_PCM_IOCTL_HW_PARAMS
> 
>> 2. Perform additional configuration from usespace
> 
> Can be done using control API (/dev/snd/controlC*). E.g. We have already:
> 
> numid=19,iface=PCM,name='ELD',device=3
> numid=32,iface=PCM,name='Playback Channel Map',device=3
> 
> Those controls can be R/W as you like.
> 
>> 3. Start detection pipelines
> 
> SNDRV_PCM_IOCTL_PREPARE
> 

Will check, but from what I recall streams should not be started in 
prepare due to it being used for xrun recovery, but maybe it doesn't 
matter for detection ones.

>> 4. Wait for event to happen (it can take however long necessary, for
>> example hours)
> 
> Can be done using control API (/dev/snd/controlC*). There is a mechanism 
> for event handling already.
> 
> Something like (boolean type):
> 
> iface=PCM,device=2,name="Event X"   # first event type
> iface=PCM,device=2,name="Event Y"   # second event type ...
> 
> The PCM stream may be active only when at least one event from the above 
> set is active.
> 
>> 5. When event happens start drain pipelines and process data in
>> userspace likes in standard capture scenario
> 
> SNDRV_PCM_IOCTL_START
> 
> The driver may set the correct timestamp when the capturing was started. 
> The sample buffers are already allocated and ready for transfers, so we 
> can assume that the time window between the event notification (event) 
> and START ioctl is small, so no samples should be lost.
> 
>> 6. When no more data is needed, either stop drain pipelines and go back
>> to 3 or just close stream
> 
> SNDRV_PCM_IOCTL_STOP / DRAIN, SNDRV_PCM_IOCTL_HW_PARAMS or close(fd)
> 
> Basically, I think that this extension can be implemented with minimal 
> changes to the PCM API - it's just about to slightly extend existing APIs.
> 
>                  Jaroslav
> 

