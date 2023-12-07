Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VJqyD+oH"
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD36610C2
	for <linux-sound@vger.kernel.org>; Thu,  7 Dec 2023 00:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701937494; x=1733473494;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=QofVFSYs9O79ICYnq3eo2N+6XhGMF2P6AlIdiIAKLE0=;
  b=VJqyD+oH+j33DkQ5+apu9L+H/FHsT4NoH1dmtem71/dntt21/3GCMWzY
   FfDgg9agK/9cUymdo2kJEzsUYXVUWc7nPcfbo4yr6UYpnarrMtI2uD8TJ
   RyEXHq5H0JnRqqUZRjMA+tfmIuuiA0wWdrOtVPmRd4f2uFGBQQMIZE08F
   JqZkJUc8yB/1mdvknv2jM/kS1HvM5aVQ9otzJJHaiWHJUMRqZTHfaijie
   8QNPME58oMg4zE4RCccmUAf+k+E7CdYbeg3tJgAn6FIBqD0T3zySGiR7I
   lY467TQ0weaBYTm/K5ItMHXiIOkHBHoULi/PHSYUX6a6JzKBjBA7eBjJY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1301613"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="1301613"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 00:24:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="862400979"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="862400979"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.8.107]) ([10.94.8.107])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 00:24:51 -0800
Message-ID: <f4dfebd6-db57-4588-a3fe-ab198d2ac366@linux.intel.com>
Date: Thu, 7 Dec 2023 09:24:49 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] ASoC: soc.h: don't create dummy Component via
 COMP_DUMMY()
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
References: <053ec252-e4df-4ccb-80fd-a802dd212b15@linux.intel.com>
 <87h6kuolii.wl-kuninori.morimoto.gx@renesas.com>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <87h6kuolii.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/7/2023 2:21 AM, Kuninori Morimoto wrote:
> 
> Hi Amadeusz
> 
> Thank you for your feedback
> 
>>> --- a/include/sound/soc.h
>>> +++ b/include/sound/soc.h
>>> @@ -938,7 +938,7 @@ snd_soc_link_to_platform(struct snd_soc_dai_link *link, int n) {
>>>    #define COMP_PLATFORM(_name)		{ .name = _name }
>>>    #define COMP_AUX(_name)			{ .name = _name }
>>>    #define COMP_CODEC_CONF(_name)		{ .name = _name }
>>> -#define COMP_DUMMY()			{ .name = "snd-soc-dummy", .dai_name = "snd-soc-dummy-dai", }
>>> +#define COMP_DUMMY()			/* see snd_soc_fill_dummy_dai() */
>>
>> Isn't it effectively making COMP_DUMMY same as COMP_EMPTY, or am I not
>> seeing something? I guess next step could be to just remove all
>> COMP_DUMMY and replace them with COMP_EMPTY to avoid two definitions
>> which are same thing?
> 
> It is a little bit macro magic
> 
> COMP_EMPTY()
> 	static struct snd_soc_dai_link_component name[]	= {{ }},
> 	                                                   ^^^
> COMP_DUMMY()
> 	static struct snd_soc_dai_link_component name[]	= {   },
> 	                                                   ^^^
> EMPTY case will be 1 element array, DUMMY case will be 0 element array.
> So, EMPTY case has empty element, and is not a special/strange array.
> But DUMMY case, it has pointer but 0 size array, very special/strange.
> This patch making this special/strange array on purpose, and convert it
> to asoc_dummy_dlc() on soc-core.c
> Is this good answer for you ?
> 

Yes, thanks!

>>> +		if (dai_link->num_platforms == 0 && dai_link->platforms) {
>>> +			dev_warn(card->dev, "platform don't need dummy Component/DAI\n");
>>
>> I would just replace above print with code comment, no need to spam dmesg.
> 
> OK, will fix in v2
> 
> 
> Thank you for your help !!
> 
> Best regards
> ---
> Renesas Electronics
> Ph.D. Kuninori Morimoto

