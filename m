Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAE817C98
	for <linux-sound@vger.kernel.org>; Tue, 25 Jun 2024 13:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719323289; cv=none; b=ZMwoSz9VZkS+eZWYLtmi4GpQzn3Dbl9mZhhfeWlAgh2IIERzDOKOCoxH6NEGHQqbXLAKQ1oW24yEsM3NIdQggGUrAY7dXGNoKx5+gTEreKil3KmKvcGryapXARc0crFlFPi1T/0K/Be7e6dQu7YkYIfyqK3wSK7rVqzNQkBA9SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719323289; c=relaxed/simple;
	bh=rLtw0kpyxKju24eTW3vtcckN7MU53T9UFLRzoxqvMRM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D/nstbPnQHI+uBSjWlofHwiGwa7W47wSxNDeCCUWrcB8VJ12F8Nx2t5IDRSPfGxeRJ2MSXkjtrskt/Dn57rOZyPPMXBb0gcd/Gvrk0OLCkBHxlz+RV+FudH90fBOS8rCOLjfm8UZw7LB6uitYCW+DdNWWrQwVLiOCLJALYbenhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MMjI1Hpi; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MMjI1Hpi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719323288; x=1750859288;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=rLtw0kpyxKju24eTW3vtcckN7MU53T9UFLRzoxqvMRM=;
  b=MMjI1Hpi7iWmdGKk3rwPiB4fsIHSbE6n+opiwR8tv3hoSKV0uRenxVuY
   CvDVTLjO5xcnFgGHMCA37msA2BdDeiH7mWv1xqszKNGmAu5a5R3mX1TN2
   mdnGEymiE8I1Qvm5EOjohD+oz6v5Q76HX4R15RQBDUiRsBChfgoWUS/ee
   tB1i24Bb6iXmUVuNdk2MsnBlaDmrZPkDwp68ySkEEFXNK5c14tTQC/AyU
   Vs4Kg+/2e9dUT1bp3NpNsJUf3i1etY9g2OlpfD6Lx0iPZvaLqtv7Znmxa
   QwR6o1iRfd78H+2t8NwkXtY2qMdHIquVFWAtuS5RG2g87AVPB0SOPDW2v
   A==;
X-CSE-ConnectionGUID: /mZpOP42S5OHXVOUELOI4g==
X-CSE-MsgGUID: e9yHKr5iRWyLTCV7PtP49Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="16464801"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; 
   d="scan'208";a="16464801"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 06:48:08 -0700
X-CSE-ConnectionGUID: aGOVYfp4QuW+arAOfxG5EQ==
X-CSE-MsgGUID: UHJY94RWT4CvFJhmiNnlQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; 
   d="scan'208";a="74419380"
Received: from ettammin-desk.ger.corp.intel.com (HELO [10.245.246.252]) ([10.245.246.252])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 06:48:05 -0700
Message-ID: <7d79dfb4-5a36-4312-8c25-c93a4e5f9fa2@linux.intel.com>
Date: Tue, 25 Jun 2024 15:48:01 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ALSA: compress_offload: introduce passthrough
 operation mode
To: Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Vinod Koul <vkoul@kernel.org>
References: <20240621164915.410946-1-perex@perex.cz>
 <18c2a323-f0b5-4dea-b502-ce7e7021c555@linux.intel.com>
 <51462bc7-d9da-4e2d-9244-a59184c4d8ed@perex.cz>
 <7fb00353-08f2-4fad-b05e-cdf4b6451cbe@linux.intel.com>
 <626a22b6-7de9-45ba-a702-f4539f2a25a7@perex.cz>
 <69951352-c0c4-4984-bbab-acdfc4add146@linux.intel.com>
 <c2bcc49e-722f-43da-a3a1-ddd92210904f@perex.cz>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <c2bcc49e-722f-43da-a3a1-ddd92210904f@perex.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


> The internal state requirement for multiple tasks is mostly given by the
> used stream structure, so user space will handle this correctly (restart
> stream on demand). You can imagine situation, where too many data are
> queued and user space will receive a signal to do something different,
> so it makes sense to support dequeuing of tasks. The stream state should
> be reset when the task is stopped (removed from the queue) even if there
> are other active tasks after this stopped one.
We are in agreement that the 'drop' (stop now) and 'drain' (keep going
until all data was consumed) capabilities are very much needed. I don't
think controlling the states of intermediate tasks is possible or even
desired though.

> I may also propose kernel API extension to inform user space that all
> active tasks must be canceled in one shot (ioctl).

Did you mean "All active tasks in the same context" - defined by the
open step?

>>>> Also I don't fully get the initial/final stages of processing. It seems
>>>> that the host needs to feed data to the first task in the chain, then
>>>> start it. That's fine for playback, but how would this be used if we
>>>> wanted to e.g. enable an ASRC on captured data coming from an audio
>>>> interface?
>>>
>>> There are no stream endpoints in kernel (no playback, no capture). It's
>>> just about we have some audio data, do something with them and return
>>> them back.
>>>
>>> For an universal media stream router, another API should be designed. I
>>> believe that using dma-buf buffers for I/O is nice and ready to be
>>> reused in another API.
>>
>> Humm, how would this work with the initial ask to enable the ASRC from
>> FSL/NXP? If we leave the ends of the processing chain completely
>> undefined, who's going to use this processing chain? Shouldn't there be
>> at least one example of how existing userspace (alsa-lib, pipewire,
>> wireplumber, etc) might use the API? It's been a while now, but when we
>> introduced the compress API there was a companion 'tinycompress' utility
>> - largely inspired by 'tinyplay' - to showcase how the API was meant to
>> be used.
> 
> I replied this in another answer. The expected users are media
> frameworks like gstreamer or ffmpeg (use this directly as a plugin in
> the processing chain). Maybe audio servers can use this hardware
> acceleration, too.
> 
> I would like to define the basic kernel API (ioctls) in the first stage
> and then continue with a test kernel module, user space library (maybe
> include support in tinycompress) and user space test utility.

Incremental development sounds fine, but at some point we'll need some
sort of development hardware to check how well things work, and what's
missing. In the case of the compress API some 12+ years ago we
completely missed the gapless playback requirement which led to the ugly
partial drain solution. We also underestimated the inertia and effort
needed to change userspace, so much so that the main users of the
compress API are in the Android world. I am not aware of any users of
the compress API in the traditional Gnome/KDE environments.
