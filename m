Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82453199B8
	for <linux-sound@vger.kernel.org>; Wed, 29 Jan 2025 14:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738162363; cv=none; b=COVZiYCZdiCgUfWvtdiM6NAPQQBBWaF0/cdw0SFm4N20czip20IkzXeP3x+0TJUu9Mo1RStrlkns4mukD7Gbc/mA+4tGV8hndPllmUOR++bMQxhj+uag6qIYtcHUoIdt9gvFjPPL1q0UirubnMlHBKUdsVmvHTG5xx4vJeO8UDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738162363; c=relaxed/simple;
	bh=pMqTp9o43TKI+p7xy4SniwYoJ63cWJTeyWzDIDQVY10=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jsDkBUzeGoFuDY8hOmT8sIbStn/qen12qJ+Hs+HJLM9zU/9rT3ltXwTgW0rmM+7jXk82a3b7Aj7dPwvJ24BNZ4PlXcdAojGvuIXRmuFtjI4vGdyzfflF98n4TB7rjX+MR48fiTZ/hpvEGm68MjKHHBikOexXWLqcupuP1FwTc4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lVMUPOaD; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lVMUPOaD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738162362; x=1769698362;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=pMqTp9o43TKI+p7xy4SniwYoJ63cWJTeyWzDIDQVY10=;
  b=lVMUPOaDankfWG0Uh1cwWP8gTpZng51wYdJQ88SeoiB+7Nlyn392Y8UH
   f4+IcZzx/b2P4sIh7FOfjsSyJ02CM7tLsDaQUhpQ9RoNv6qW6YAToT4FN
   i/gU0jaCTYw73iGuK1thU7Lvd0n+oGYBaegqgvHbggo8dOKUiLNGHuiiU
   gudsJABbjP/i8acRBm8G/H3ZEfCB20dFQ4GB2884MeGnLA5+T0wahK2Em
   i66FqYXJTKpFVfIC/6fs1agk8iDLyJGB+p42QKgGhLJdNJbpQ3cSEZDhQ
   sRWZf2eDL36dfs8x636knF4+ls7FgM3K+H63f6lHKUuU1zqnkvy4cNEry
   Q==;
X-CSE-ConnectionGUID: R/h0pTMuShqInoYs+SGkXA==
X-CSE-MsgGUID: msfUSKJAQvi6bFH2sfRlRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="38817299"
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; 
   d="scan'208";a="38817299"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 06:51:47 -0800
X-CSE-ConnectionGUID: 9JiRdbkzQXOS+pmu6U7Xgw==
X-CSE-MsgGUID: xIu30g+lTu2POYZNUusyEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="146249669"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53]) ([10.94.0.53])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 06:51:44 -0800
Message-ID: <2a772972-3011-4083-9d5d-e1bfe297998b@linux.intel.com>
Date: Wed, 29 Jan 2025 15:51:41 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: core: Change device numbering
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
References: <20250127144445.2739017-1-amadeuszx.slawinski@linux.intel.com>
 <f8f2b8f9-527e-486d-ae83-34abd13ef968@linux.intel.com>
 <6fcbc9d3-93d4-4485-9f9f-5bef61476ef3@perex.cz>
 <811c03ef-03a2-44a3-969b-5a2d55f2f876@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <811c03ef-03a2-44a3-969b-5a2d55f2f876@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/29/2025 10:25 AM, Cezary Rojewski wrote:
> On 2025-01-27 3:54 PM, Jaroslav Kysela wrote:
>> On 27. 01. 25 15:45, Amadeusz Sławiński wrote:
>>> On 1/27/2025 3:44 PM, Amadeusz Sławiński wrote:
>>>> Currently ASoC cards when enumerating create CPUs rtds first and CODECs
>>>> rtds second. This causes device number on cards to not start from 0, 
>>>> but
>>>> from number of present CPUs. During that it does count number of rtds
>>>> and uses it as device number visible in userspace.
>>>>
>>>> This patch changes device visible to userspace, when listing cards:
>>>>
>>>> Before:
>>>> card 0: hdaudioB0D0 [hdaudioB0D0], device 1: HDAudio Analog (*) []
>>>> card 1: hdaudioB0D2 [hdaudioB0D2], device 1: HDMI1 (*) []
>>>> card 1: hdaudioB0D2 [hdaudioB0D2], device 2: HDMI2 (*) []
>>>> card 1: hdaudioB0D2 [hdaudioB0D2], device 3: HDMI3 (*) []
>>>>
>>>> After:
>>>> card 0: hdaudioB0D0 [hdaudioB0D0], device 0: HDAudio Analog (*) []
>>>> card 1: hdaudioB0D2 [hdaudioB0D2], device 0: HDMI1 (*) []
>>>> card 1: hdaudioB0D2 [hdaudioB0D2], device 1: HDMI2 (*) []
>>>> card 1: hdaudioB0D2 [hdaudioB0D2], device 2: HDMI3 (*) []
>>>>
>>>> It is done by skipping back end devices and only counting front end
>>>> ones.
>>>>
>>>> Now there are few concerns I have:
>>>> - while rtd->id is not used much, few drivers seem to be using it as
>>>>     index into a table, above may break this use (although
>>>>     "include/sound/simple_card_utils.h: * the ID stored in rtd->id 
>>>> may not be a valid array index."
>>>>     suggests that maybe it is a bad idea anyway, but I'm not sure how
>>>>     generic that comment is)
>>>> - this will break user scripts, with hardcoded device IDs
>>>> - this will also break some UCMs with hardcoded IDs
>>>>
>>>> Now my main question is, if such patch would even be considered?
>>>> Perhaps device IDs are not considered as "stable" interface and can be
>>>> changed and my above worries are unnecessary.
>>>>
>>>> Patch is a result of discussion from:
>>>> https://github.com/alsa-project/alsa-ucm-conf/pull/499
>>>> and as such I may consider others ways of fixing the problem.
>>>
>>> And it should've been RFC in topic... :( Sorry about that.
>>
>> Looking to UCM configs, most of ASoC cards have PCM devices starting 
>> from zero. So this id is not used for all ASoC cards.
> 
> Most of the ASoC does not utilize topology and there is no strict 
> guideline: initialize FE first, BE last. What Amadeusz proposes is to 
> skip BEs when counting the 'devices' for the userspace as these are not 
> touchable by them anyway. I believe this is a good direction and does 
> not limit one's action when playing with the ASoC-topology feature.
> 

And it seems that apparently other topology users set .use_dai_pcm_id in 
struct snd_soc_component_driver. Which tells the code to use PCM ID 
values from topology as device IDs. Although the more I look at this the 
more this looks to be a workaround due to how ASoC counts devices, which 
this RFC fixes. But at least for now we are also looking to set this 
flag, as to avoid potentially impacting ASoC core.

>> Also, a bit off-topic, but the driver name (hdaudioB?D?) for this 
>> particular driver should be corrected, too. It should be like 'hda- 
>> avs- dsp' or so. If I am not wrong, the SST driver name was 'hda-dsp'.
> 
> We had a discussion or two within the team and yes, we do agree that a 
> more user-friendly pattern should be provided. Currently card names are 
> mostly based on machine board device (platform_device) name. There is no 
> strong technical argument for that - the development was/is simply 
> focused on bringing new functionality and we did not prioritize the card 
> naming.
> 
> The task touches all interfaces though, not just HDA. We would like to 
> streamline or fix the naming for all the interfaces. This time we will 
> specifically request a review for that : )

And we had yet another discussion today ;) Are there some guidelines 
upstream, about how cards should be named? Currently we need names for: 
HDA, HDMI, DMIC & I2S cards. Here are examples from running systems:
HDA:
card 0: hdaudioB0D0 [hdaudioB0D0], device 1: HDAudio Analog (*) []
HDMI:
card 1: hdaudioB0D2 [hdaudioB0D2], device 1: HDMI 0 (*) []
DMIC:
card 2: avsdmic [avs_dmic], device 2: Digital Microphone (*) []
I2S:
card 3: avsrt274 [avs_rt274], device 1: Audio (*) []

Additionally is there a way to alias card name? We would like to still 
allow users to use current names, to keep backward compatibility at 
least for some time.
