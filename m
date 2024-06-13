Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB2A136E0F
	for <linux-sound@vger.kernel.org>; Thu, 13 Jun 2024 06:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718260174; cv=none; b=Sis++FU2ki1TJ3V1hZ2j8HhBCfVANdTcElDf/vhCoquDxau4kQiMTP+tovt65+nV/ILtcpucAm0zYNOwhtEyYqDfO6kQDnEtONZtzvO7w5jLhUISGpSgwa3cSXs6C5jhRYJqgw2d/3GSS8D5tQqME1Jvhv9EhztyHygPuEpwDVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718260174; c=relaxed/simple;
	bh=mEaeeil3cCE8Lyqx9jY6Tj4nxbwiA0TLyAoqgrnn/SE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=QR7TnZLIDb+rJsxIs/GNrScIbTlOOGzT5cjfPbc5D1mEhUFZ3Op8M7O3cpEi8R7qigJ17k2ar+VgWdhgqhR2UZBR/36IbFE18+bxcdAlJ4K0RLhoHhOcBqTspPxdluR5JBf7vxH23Vg90UgxgUhM6fGKGflJmetqqv7xQQ8wEU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a+S5959a; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a+S5959a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718260173; x=1749796173;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=mEaeeil3cCE8Lyqx9jY6Tj4nxbwiA0TLyAoqgrnn/SE=;
  b=a+S5959aa88wDa+R4EavxCGXwOS4wnATpBUF44qUX3tLOtOYL4CIA7nq
   EEmw3/hdnxHO0E9br96UUIXaYE0kpV5B2oNhXoggT/IE6JEPeqLdkivd/
   hojxRgafn/6cRRm4sTsRmqUDj/8hOUPdGmUvJTt7m5LTn6aOt2F39IVP9
   vmJHJ9E4nQu9NqaiczHbY5vz09BCdF1Pyivs2YaoQzgzP+Tyb6uwVP9A7
   6uAw85/nMeeYAn9dJ1P4Z3Vl7XZH2xiuJrsqJtMFRZSP/Wg/lXesz6Uro
   m4FG1mXEbPHMFwLrIHOUvPNnmqyzGPQI81HgPwL3y8SnLHoVxVfaa5YiD
   A==;
X-CSE-ConnectionGUID: Ts1+UgCbRTmYMCw035VT+w==
X-CSE-MsgGUID: h6O9NckRSBeSpA+nlCqvQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="18914607"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="18914607"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 23:29:32 -0700
X-CSE-ConnectionGUID: 8XNtO4wdSq+lFDth2sIfkg==
X-CSE-MsgGUID: mk/pL3n6Q36i22nlukWr4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="44420900"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.34]) ([10.245.244.34])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 23:29:30 -0700
Message-ID: <38d7b3e2-33cb-4a81-bad8-73c22679f49f@linux.intel.com>
Date: Thu, 13 Jun 2024 09:29:59 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] ASoC: topology: Fix references to freed memory
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 Jason Montleon <jmontleo@redhat.com>
References: <20240603102818.36165-1-amadeuszx.slawinski@linux.intel.com>
 <20240603102818.36165-2-amadeuszx.slawinski@linux.intel.com>
 <507e9f6a-7113-4781-8a6d-27e4b87dbe24@linux.intel.com>
 <5bdae438-a976-44c0-b6d3-1aab5167a68e@linux.intel.com>
Content-Language: en-US
In-Reply-To: <5bdae438-a976-44c0-b6d3-1aab5167a68e@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 13/06/2024 09:27, Péter Ujfalusi wrote:
> 
> 
> On 13/06/2024 08:58, Pierre-Louis Bossart wrote:
>>
>>
>> On 6/3/24 12:28, Amadeusz Sławiński wrote:
>>> Most users after parsing a topology file, release memory used by it, so
>>> having pointer references directly into topology file contents is wrong.
>>> Use devm_kmemdup(), to allocate memory as needed.
>>>
>>> Reported-by: Jason Montleon <jmontleo@redhat.com>
>>> Link: https://github.com/thesofproject/avs-topology-xml/issues/22#issuecomment-2127892605
>>> Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
>>> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
>>> ---
>>
>> This patch breaks the Intel SOF CI in spectacular ways, with the widgets
>> names completely garbled with noise such as
>>
>> host-copier.5.playbackpid.socket
>> host-copier.5.playbackrt@linux.intel.com>
>> dai-copier.HDA.iDisp3.playbackrun_t:s0
>> host-copier.31.playback\xff`\x86\xba\x034\x89\xff\xff@N\x83\xb83\x89\xff\xff\x10\x84\xe9\x8b\xff\xff\xff\xffS\x81ی\xff\xff\xff\xff\x0f
>>
>> https://github.com/thesofproject/linux/pull/5057#issuecomment-2164470192
>>
>> I am going to revert this patchset in the SOF tree.
>>
>>>  sound/soc/soc-topology.c | 27 ++++++++++++++++++++++-----
>>>  1 file changed, 22 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
>>> index 90ca37e008b32..75d9395a18ed4 100644
>>> --- a/sound/soc/soc-topology.c
>>> +++ b/sound/soc/soc-topology.c
>>> @@ -1060,15 +1060,32 @@ static int soc_tplg_dapm_graph_elems_load(struct soc_tplg *tplg,
>>>  			break;
>>>  		}
>>>  
>>> -		route->source = elem->source;
>>> -		route->sink = elem->sink;
>>> +		route->source = devm_kmemdup(tplg->dev, elem->source,
>>> +					     min(strlen(elem->source),
>>> +						 SNDRV_CTL_ELEM_ID_NAME_MAXLEN),
>>> +					     GFP_KERNEL);
>>> +		route->sink = devm_kmemdup(tplg->dev, elem->sink,
>>> +					   min(strlen(elem->sink), SNDRV_CTL_ELEM_ID_NAME_MAXLEN),
> 
> Initially I did not see why this breaks, but then:
> 
> The strlen() function calculates the length of the string pointed to by
> s, excluding the terminating null byte ('\0').
> 
> Likely the fix is as simple as:
> min(strlen(elem->sink) + 1, SNDRV_CTL_ELEM_ID_NAME_MAXLEN)

or better yet:
route->sink = devm_kasprintf(tplg->dev, GFP_KERNEL, "%s", elem->sink);

> 
>>> +					   GFP_KERNEL);
>>> +		if (!route->source || !route->sink) {
>>> +			ret = -ENOMEM;
>>> +			break;
>>> +		}
>>>  
>>>  		/* set to NULL atm for tplg users */
>>>  		route->connected = NULL;
>>> -		if (strnlen(elem->control, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) == 0)
>>> +		if (strnlen(elem->control, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) == 0) {
>>>  			route->control = NULL;
>>> -		else
>>> -			route->control = elem->control;
>>> +		} else {
>>> +			route->control = devm_kmemdup(tplg->dev, elem->control,
>>> +						      min(strlen(elem->control),
>>> +							  SNDRV_CTL_ELEM_ID_NAME_MAXLEN),
>>> +						      GFP_KERNEL);
>>> +			if (!route->control) {
>>> +				ret = -ENOMEM;
>>> +				break;
>>> +			}
>>> +		}
>>>  
>>>  		/* add route dobj to dobj_list */
>>>  		route->dobj.type = SND_SOC_DOBJ_GRAPH;
>>
>> 97ab304ecd95c0b1703ff8c8c3956dc6e2afe8e1 is the first bad commit
>> commit 97ab304ecd95c0b1703ff8c8c3956dc6e2afe8e1
>> Author: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
>> Date:   Mon Jun 3 12:28:15 2024 +0200
>>
>>     ASoC: topology: Fix references to freed memory
>>
>>     Most users after parsing a topology file, release memory used by it, so
>>     having pointer references directly into topology file contents is wrong.
>>     Use devm_kmemdup(), to allocate memory as needed.
>>
>>     Reported-by: Jason Montleon <jmontleo@redhat.com>
>>     Link:
>> https://github.com/thesofproject/avs-topology-xml/issues/22#issuecomment-2127892605
>>     Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
>>     Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
>>     Link:
>> https://lore.kernel.org/r/20240603102818.36165-2-amadeuszx.slawinski@linux.intel.com
>>     Signed-off-by: Mark Brown <broonie@kernel.org>
>>
>>  sound/soc/soc-topology.c | 27 ++++++++++++++++++++++-----
>>  1 file changed, 22 insertions(+), 5 deletions(-)
>>
>>
> 

-- 
Péter
