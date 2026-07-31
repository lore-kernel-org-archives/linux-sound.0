Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730B21FDE31
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 13:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785503048; cv=none; b=P0D4wh+4kijYDXqMHp5pjeQ1aBo5GYyA9ezh8I57j6H8Ks+EAW8k7iVMvjUUsTFckoK3CvM572H7iLMgfKCxtqpP/lY9AP3/GLk4Rka3XeUTcfvcaTAFhC/hxayVnjDwOsD75JumiPd/03frL02qG+20v/M1404WTfTwLaOQdDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785503048; c=relaxed/simple;
	bh=4iCWeYmZ2CNRsVOLVIj4i2o2bEnPUVuh/Gdu3Uk+XQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fktn948rtWNLnIYE27VzdpgR0tOA8SeS63qy+ipdamIUJV45fsLMqN6FiyJR6nwFYYabCAosRJg5jDVbaMyWDgPd8GkdZPxJ0LEcUq9KnO0xYqfsvaTOHyFpfrOc41wP9HGlcl/GRJl6Qb44VFGqz0jFtj83UsdXS0rNf5MsWFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BoTUkke6; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BoTUkke6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785503045; x=1817039045;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=4iCWeYmZ2CNRsVOLVIj4i2o2bEnPUVuh/Gdu3Uk+XQE=;
  b=BoTUkke6faOUzcq1u14GNeR+noz5pVtLpjbkTiOlOE8ynWgceYB+K/ZI
   vRPCZmDPI9z5BPWWFRafMQGtd4VbGdBqvZ+A+tMNYS01AtcgPDwtUJjaO
   RwdtCIANXETfCh/TORXUtWlqcU7Ihc85tu8wqqMbucBFHHM4oNPFMqZup
   fSXd02VNJQVYb26sZQBmP9eywvFEwFHLCx1Flv3E0XXCuVfXTPm70Hsfn
   XeM6hKhdDawBYbLwh3CoBPRhbVBWGitoVlPioxjiIkSigaFG2qltUJPZ/
   kyDbHETMC7Fge2oMCZrVTWl/R8iQ/APZot+VQWERA9SyPgVDGp5zqcrqG
   A==;
X-CSE-ConnectionGUID: utW0VEysRdqH1WsTjWs4qQ==
X-CSE-MsgGUID: dYH1tgg9Q3GoFESkMTkE0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="85894581"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="85894581"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 06:04:05 -0700
X-CSE-ConnectionGUID: L5DJ7C7HTkKrm1InkKt8jQ==
X-CSE-MsgGUID: wdpQwZ+DSpuVGxIFqq6fPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="265640257"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO [10.245.246.111]) ([10.245.246.111])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 06:04:02 -0700
Message-ID: <ff12793e-1afa-449b-a19b-5c6f0cfbdb94@linux.intel.com>
Date: Fri, 31 Jul 2026 16:04:38 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: SOF: Use high-priority workqueue for PCM period
 elapsed
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 lgirdwood@gmail.com, broonie@kernel.org
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, yuhsuan@google.com
References: <20260730130445.8277-1-peter.ujfalusi@linux.intel.com>
 <c1ed5264-9a03-4436-b17c-8c1f59289b5e@linux.dev>
 <f51125d2-b961-4224-81d0-86e622c00ace@linux.intel.com>
 <d8e791ba-ed68-4c42-8ce6-fecf7af4c699@linux.dev>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <d8e791ba-ed68-4c42-8ce6-fecf7af4c699@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 31/07/2026 15:19, Pierre-Louis Bossart wrote:
>>> period-elapsed for compressed streams:
>>> schedule_work(&spcm->stream[cstream->direction].period_elapsed_work);
>>>
>>> and the SoundWire interrupt handling with additional workqueues:
>>> schedule_work(&amd_manager->amd_sdw_irq_thread);
>>> schedule_work(&amd_manager->amd_sdw_work);
>>> schedule_work(&cdns->work);
>>
>> we also have:
>> sound/soc/sof/core.c:           schedule_work(&sdev->probe_work);
>> sound/soc/sof/intel/ptl.c:      schedule_work(&hdev->mic_privacy.work);
>>
>>> Not sure what the rules are to define what's high-priority and what's
>>> not... It could be that different systems have different requirements...
>>
>> I think the 'rule' is that what is time critical and what can tolerate a
>> bit of a delay. The PCM period is time critical while the others are not
>> that much, that includes the compress elapsed, it is not that real-time
>> as the PCM.
>>
>> But fair point, I will check if anything else would needs to be higher
>> priority than what they are.
> 
> My point is that this change isn't bad in itself, but maybe some systems
> don't care and have other subsystems (graphics, networking, etc) that
> should be given preferred access to the high-priority queue.

That is possible, but on the other hand if that is the case then likely
the kernel have been already modified to tailor for one way or the
other.A device where network latency is the priority is likely have no
audio needs.
> Same for the SoundWire workqueues, one could argue that the command
> protocol overhead is significant for all the device initialization and
> firmware download. Using the higher priority queue could reduce the
> initial 'cold latency' for interactive sounds in a busy system.

I think this is true for every single device and software, everything is
better if it can be faster but everything cannot be at the same time.
> Going back to the PCM stuff, the period_elapsed stuff is also not that
> relevant with timer-based scheduling which relies on snd_pcm_delay().

In case of NO_PERIOD_WAKEUP the elapsed is not used, this helps in case
when the period elapsed is used and user space uses that.

> Could it be that the level of priority should be configurable (Kconfig,
> sysfs, kernel parameter) to let distros pick what they need?

I guess, it could, but what about the graphic, network, touchscreen,
etc? Should they all have the same way to select?

I think audio is a bit special among devices, if there is a slight
scheduling delay it will be noticeable.

Not saying that we should not look for other cases where it would make
noticeable difference, but using high_pri workqueue is not uncommon
among audio drivers where the period elapsed must be handled by a work
for a reason.

-- 
Péter

