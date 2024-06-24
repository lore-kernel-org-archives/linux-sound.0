Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8B620330
	for <linux-sound@vger.kernel.org>; Mon, 24 Jun 2024 14:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719238214; cv=none; b=cbw165iJ/KJp+KbaFBlWmgORurRZJlM3lApNqdKMhjkX0bX5yf2xezfsKKVaXykoSQoPwMw0BZKnDe0rVe/ccugMFzj///mbOm8H6QjSyjZAhumDHJvo3ZfES9zxyg4Sh7Hre57IA1t8fBel5VRgEltBnqfvYzvKvZGovEvfTfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719238214; c=relaxed/simple;
	bh=7nokMbzCi/NnAW174PH/yOwYfGRHGd52dbXpJqgHR9Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BT5Afx7LXoXd37S2llbSiMagkmUHyHZigWwDyazYc9qPocJ7EwP8ZHyR1CNoKtLshopjYnfXoHIPkyJSCBqzINA4uPHATEMfDcLJ2IQIvPKP+d4Sj9DYkq32xuYojkOcGhuVFigCHNswhhIwmNImCaopEhlYy/GzePp/4HCKeIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hk6A3zvd; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hk6A3zvd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719238213; x=1750774213;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=7nokMbzCi/NnAW174PH/yOwYfGRHGd52dbXpJqgHR9Y=;
  b=hk6A3zvdcWXU9W+Nbn58f7BaltJ+MGV54jlKDal669B2B4Fyp6K3KmrC
   pb5wO0SWw9UHWnW1ybMHDyjEkbZVTeVal0k6hNb0fLcVcH3H7UBfsqeDN
   EqsA+NtD3kTlF4rW+W0FMP2TX/uqu1/z73aJ9PzyB6BezfCkovLYy9GF9
   y8DwmWCO70Zyl/ZYb3Y/JP2Z/HcdDuiSDy3NWF3m/6c4MrPODb+jAVCo1
   j4s3G6nE9ZPcdDORnMnKnOyynn5C/ZB58YAC2RB5ZProv7BolCORqZ8Rb
   y+nErkmwW2tQ/RCJeYGfvebNA73gt4nZoGA/nEMKUh+jtl6ecszlaTjI+
   Q==;
X-CSE-ConnectionGUID: fjZKOsidQ6K9qWhEQ92Dsg==
X-CSE-MsgGUID: 98I2d8K3STS1clOBGUwL8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="12213963"
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; 
   d="scan'208";a="12213963"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 07:10:12 -0700
X-CSE-ConnectionGUID: BlbRyqP8TNqztRKzGQFv8Q==
X-CSE-MsgGUID: ExZTeQIFTAmqD+MvW8bA4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; 
   d="scan'208";a="43182988"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53]) ([10.94.0.53])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 07:10:11 -0700
Message-ID: <0385e87c-c30a-4e63-8c7c-2e18b54641b6@linux.intel.com>
Date: Mon, 24 Jun 2024 16:10:09 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] ALSA: pcm: reinvent the stream synchronization ID
 API
Content-Language: en-US
To: Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>, Takashi Sakamoto <takaswie@kernel.org>
References: <20240624131127.498605-1-perex@perex.cz>
 <20240624131127.498605-2-perex@perex.cz>
 <28a5fde3-a02a-45c1-b3d7-25ae3fcfcfcc@linux.intel.com>
 <7c29f412-96ab-43cb-8249-e371cab6fb69@perex.cz>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <7c29f412-96ab-43cb-8249-e371cab6fb69@perex.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/24/2024 3:56 PM, Jaroslav Kysela wrote:
> On 24. 06. 24 15:38, Amadeusz Sławiński wrote:
>> On 6/24/2024 3:07 PM, Jaroslav Kysela wrote:
>>> Until the commit e11f0f90a626 ("ALSA: pcm: remove SNDRV_PCM_IOCTL1_INFO
>>> internal command"), there was a possibility to pass information
>>> about the synchronized streams to the user space. The mentioned
>>> commit removed blindly the appropriate code with an irrelevant comment.
>>>
>>> The revert may be appropriate, but since this API was lost for several
>>> years without any complains, it's time to improve it. The hardware
>>> parameters may change the used stream clock source (e.g. USB hardware)
>>> so move this synchronization ID to hw_params as read-only field.
>>>
>>> It seems that pipewire can benefit from this API (disable adaptive
>>> resampling for perfectly synchronized PCM streams) now.
>>>
>>> Note that the contents of ID is not supposed to be used for direct
>>> comparison with a specific byte sequence. The "empty" case is when
>>> all bytes are zero (driver does not offer this information)
>>> and all other cases must be only used for equal comparison among
>>> PCM streams (including different sound cards) if they are using
>>> identical hardware clock.
>>>
>>> Cc: Takashi Sakamoto <takaswie@kernel.org>
>>> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
>>> ---
>>
>> (...)
>>
>>> @@ -420,7 +420,8 @@ struct snd_pcm_hw_params {
>>>        unsigned int rate_num;        /* R: rate numerator */
>>>        unsigned int rate_den;        /* R: rate denominator */
>>>        snd_pcm_uframes_t fifo_size;    /* R: chip FIFO size in frames */
>>> -    unsigned char reserved[64];    /* reserved for future */
>>> +    unsigned char sync[16];        /* R: synchronization ID (perfect 
>>> sync - one clock source) */
>>
>> If it is introduced as new API, can't this be done better? Maybe like:
>> struct sync {
>>     char cardnum[4];
>>     char id[12];
>> };
>> or maybe just:
>> struct sync {
>>     u32 cardnum;
>>     char id[12];
>> };
>> or something like that? It is bit hard to follow in next patch all this
>> params->sync + 4 and memset/strncpy. And having named fields would help.0
> 
> The ID may be not related to one sound card. Multiple cards can share 
> one clock source. It's internal kernel ID generation scheme which may be 
> changed later when there's another demand in future. The applications 
> should handle this as 16-byte blob which is used only for equal 
> comparison among multiple PCM streams.

Ah, yes rereading it few more times it makes sense.

Thanks,
Amadeusz
