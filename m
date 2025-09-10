Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D10E2E403
	for <linux-sound@vger.kernel.org>; Wed, 10 Sep 2025 01:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757468022; cv=none; b=EohLvzIaAFOoDmBdstssgMbLKcGmeLo2XS0GG1DbsxMtIdGzmrlQ2w8dRSpcwkNFeOdtTfjcui39duple6YAPaDkIAnDfkIkL/COUU6XmmMwZSb2MdU6WGUEvcma8708etr8yL2PMxver0G2Vi0B9RDiRu+K8sdVAVpbdxKkDlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757468022; c=relaxed/simple;
	bh=To0g8Jg+xkwtnpqecygZmPOMP9jxWEqZDOzHo4UFDF0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nvLmtMuMqdThcFX8mYp6y1fgrB/1UHTZ0fQHlqTJjUmUe12esvihH/ViFYyW1kzxb3/YmGssZ+qQoNOLSau1679CYo9W8ytWPmaXUWAVrvGljsgTgFTZqtOUbC+VwETMcHF2eGV+CuXqThE+pTueSW+y2YWsvCYsXTaVh/XCfcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NEXFFci0; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NEXFFci0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757468020; x=1789004020;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=To0g8Jg+xkwtnpqecygZmPOMP9jxWEqZDOzHo4UFDF0=;
  b=NEXFFci0boLEfV7iuiJl05TpAwGNA1DYS3Bo0vlr+VQ/sMiAmLpUV/MH
   CuolnutxsuA7E1TfiUOua/JaSxg/n8gHnFCRqGAMEoIqcyVaM9LqFX1dd
   ebqhxZUaWgU8G0Y1Z7bNic1e45WA5OOcxxRRECaEgqB1Eok4ynUL+psIG
   85kgQawYqehQAU53e3FUG2IkKT8kN3LQg1b1flA/7ynAPCyUl0GFAkbkY
   0whyhc1nSMWyosArXwZXv+UNy7PZKl3IstdPzmLYC7tYPBJULn1OckIB9
   SUNVJFa0meof3VFrHYtokbcfka2mKf7Yf4PYGEheONaVURxMEohhz3E1v
   A==;
X-CSE-ConnectionGUID: l8yh7V3USy+SjRYaaYUWQw==
X-CSE-MsgGUID: tj3zHmvnSZ6+NEiftmdgpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="58987027"
X-IronPort-AV: E=Sophos;i="6.18,252,1751266800"; 
   d="scan'208";a="58987027"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 18:33:40 -0700
X-CSE-ConnectionGUID: BQ+9NtodQ5mkk5lyaj7o8Q==
X-CSE-MsgGUID: 27hQg/ydRZekVyZ1R4diFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,252,1751266800"; 
   d="scan'208";a="210379581"
Received: from unknown (HELO [10.227.10.84]) ([10.227.10.84])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 18:33:38 -0700
Message-ID: <5093cd04-1501-4e0f-9b30-ec353eab3c3b@linux.intel.com>
Date: Wed, 10 Sep 2025 09:33:27 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/15] ASoC: SDCA: Rely less on the ASoC component in IRQ
 handling
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, rafael@kernel.org, pierre-louis.bossart@linux.dev,
 peter.ujfalusi@linux.intel.com, shumingf@realtek.com, lgirdwood@gmail.com,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 bard.liao@intel.com
References: <20250905143123.3038716-1-ckeepax@opensource.cirrus.com>
 <20250905143123.3038716-8-ckeepax@opensource.cirrus.com>
 <01bc3a67-6ed7-4bb5-8106-531af7f29d63@linux.intel.com>
 <aL7SmSjHTZ0lDm8l@opensource.cirrus.com>
 <aL7rltyvMy/ctrFU@opensource.cirrus.com>
 <7687e3cd-2f66-4092-92aa-774b7ed7e487@linux.intel.com>
 <aL/r1XQmDnK6ZrkF@opensource.cirrus.com>
Content-Language: en-US
From: "Liao, Bard" <yung-chuan.liao@linux.intel.com>
In-Reply-To: <aL/r1XQmDnK6ZrkF@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/9/2025 4:56 PM, Charles Keepax wrote:
> On Tue, Sep 09, 2025 at 09:42:20AM +0800, Liao, Bard wrote:
>> On 9/8/2025 10:43 PM, Charles Keepax wrote:
>>> On Mon, Sep 08, 2025 at 01:56:57PM +0100, Charles Keepax wrote:
>>>> On Mon, Sep 08, 2025 at 06:27:40PM +0800, Liao, Bard wrote:
>>>>> On 9/5/2025 10:31 PM, Charles Keepax wrote:
>>>>>> -int sdca_irq_data_populate(struct snd_soc_component *component,
>>>>>> +int sdca_irq_data_populate(struct device *dev, struct regmap *regmap,
>>>>>> +			   struct snd_soc_component *component,
>>>>>>  			   struct sdca_function_data *function,
>>>>>>  			   struct sdca_entity *entity,
>>>>>>  			   struct sdca_control *control,
>>>>>>  			   struct sdca_interrupt *interrupt)
>>>>>>  {
>>>>>> -	struct device *dev = component->dev;
>>>>>
>>>>> Previously, we assume 'component' will never be null.
>>>>>
>>>>>>  	const char *name;
>>>>>>  
>>>>>> +	if (!dev && component)
>>>>>
>>>>> But now we test 'component'. If we don't assume 'component' is not null
>>>>> any more, we could test 'component' at the very beginning of this function.
>>>>
>>>> Good spot, that was missed when moving from an older version of
>>>> the code. I will get that fixed up.
>>>
>>> Apologies I had slightly misinterpretted this, and thought you
>>> meant we were dereferencing component before testing it in
>>> sdca_irq_data_populate, but we arn't.
>>
>> No, my question is about whether component can be NULL.
> 
> The expectation would be component can not be NULL in
> sdca_irq_populate(), but it could be NULL inside
> sdca_irq_data_populate(), if called from somewhere else.
> 
>> Understood. I had the question because the change below.
>>
>> +	interrupt->dev = dev;
>> +	if (!regmap && component)
>> +		interrupt->function_regmap = component->regmap;
>> +	else
>> +		interrupt->function_regmap = regmap;
>>
>> If both regmap and component are null, the interrupt->function_regmap
>> will be NULL. Is it valid?
> 
> Ok... yeah I see. I guess it depends on the IRQ handler that
> ultimately gets registered. In most cases I would expect the
> handler to need a regmap, however, we don't really validate
> any of the data that is purely for the handler. For example we
> don't validate function/entity/control either, we check dev for
> NULL because it is used for devm allocation of the name string,
> not because it is data for the handler. I think doing it this
> way saves us making assumptions, once we start doing so we start
> to constraint what can be done through the API.

Thanks for explanation. I got it now.


> 
> Thanks,
> Charles
> 

