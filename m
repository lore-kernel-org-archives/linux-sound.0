Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7081821FF45
	for <linux-sound@vger.kernel.org>; Tue,  9 Sep 2025 01:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757382154; cv=none; b=PVLt8SuNhGJ8YOMFYaEI+vfuidTS5XXm1NxdVSXjIusBPyibpIUbLOsrGWchjjx+nQW+A2mGVzduQb+kFwAePLcmzwrRzcHjekg8Qi5DedVTnMudN3WoG5TDATJKzsl6pDQOgxRfwjKkPKhom3L6UXBopjQb08xmBhmKZeJ+e5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757382154; c=relaxed/simple;
	bh=KQP3D3FC6Cb3qBPn1Kg6IJbzGqV2kIoSjvKB6W3Qea8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nUR5I+rSjeJLIm8G3hpOAsa2LhwObqdhoDQzBQZfABMWfo/vFq12P3HY8+3JV7jLO03yCw4qpRRzTsqSp950uuf8PtmWdM1LC3H3s6Xac0Y6oprjxKSalW5kgW6rppbggkOJ3/u5ypBnQB2AEUqAb7x+PXSaINOpmX3CoXqBnXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nz3t9I2v; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nz3t9I2v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757382152; x=1788918152;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=KQP3D3FC6Cb3qBPn1Kg6IJbzGqV2kIoSjvKB6W3Qea8=;
  b=nz3t9I2vUHABRyI6dfG2r/s/MypSZxdVF3icWrUn0Uuz1R1NIwKRGSRR
   MeqJ243zq7huKO0apM5uQ6/p//E3WXHN1ewAo55vOuVuCwfzOJKD2UsvA
   ACdGyzA4AR7pKf9C6KKLrJff23/wKjfIDDhjLNT7FJlBPlmj5KLhXXyt7
   b2V621nDgT2CzvBHoRjRT6DmGPJu7n3U3oyOIFwqD/Qe1NmbYy0eE+b01
   W9GphN8mNcz0nTxjhNFKfR+CwLcEv67Ty7BUkzcLC8tUkQNm8zkoEkxv/
   dj9yOnRiBDZyuo4/C42uSO1k4lvPRgwI8I56uWkuqkwW+fPcJd2H/h8Yg
   Q==;
X-CSE-ConnectionGUID: KMDBj3heQpGyvkpnk8pS2Q==
X-CSE-MsgGUID: C8wg8K5cQQWeVJnfYJdDJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="59727284"
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="59727284"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 18:42:31 -0700
X-CSE-ConnectionGUID: rHLuBwQ+ThCJ7jeeqCPtHg==
X-CSE-MsgGUID: 98BJ4mUuSl6lm/ussRafxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="203729964"
Received: from unknown (HELO [10.227.10.84]) ([10.227.10.84])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 18:42:29 -0700
Message-ID: <7687e3cd-2f66-4092-92aa-774b7ed7e487@linux.intel.com>
Date: Tue, 9 Sep 2025 09:42:20 +0800
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
Content-Language: en-US
From: "Liao, Bard" <yung-chuan.liao@linux.intel.com>
In-Reply-To: <aL7rltyvMy/ctrFU@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/8/2025 10:43 PM, Charles Keepax wrote:
> On Mon, Sep 08, 2025 at 01:56:57PM +0100, Charles Keepax wrote:
>> On Mon, Sep 08, 2025 at 06:27:40PM +0800, Liao, Bard wrote:
>>>
>>>
>>> On 9/5/2025 10:31 PM, Charles Keepax wrote:
>>>> In the future some IRQs (mostly File DownLoad) will need to run before
>>>> the soundcard is constructed, as such refactor more of the IRQ handling
>>>> to use raw device and regmap pointers rather than accessing things
>>>> through the component.
>>>>
>>>> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
>>>> ---
>>>
>>>> -int sdca_irq_data_populate(struct snd_soc_component *component,
>>>> +int sdca_irq_data_populate(struct device *dev, struct regmap *regmap,
>>>> +			   struct snd_soc_component *component,
>>>>  			   struct sdca_function_data *function,
>>>>  			   struct sdca_entity *entity,
>>>>  			   struct sdca_control *control,
>>>>  			   struct sdca_interrupt *interrupt)
>>>>  {
>>>> -	struct device *dev = component->dev;
>>>
>>> Previously, we assume 'component' will never be null.
>>>
>>>>  	const char *name;
>>>>  
>>>> +	if (!dev && component)
>>>
>>> But now we test 'component'. If we don't assume 'component' is not null
>>> any more, we could test 'component' at the very beginning of this function.
>>
>> Good spot, that was missed when moving from an older version of
>> the code. I will get that fixed up.
> 
> Apologies I had slightly misinterpretted this, and thought you
> meant we were dereferencing component before testing it in
> sdca_irq_data_populate, but we arn't.

No, my question is about whether component can be NULL.

> 
> The intention of this patch is to allow the user to call
> scda_irq_data_populate with or without a component. If you call
> it with a component and pass NULL for dev/regmap it will use the
> component for those. If you pass dev/regmap, it is fine to pass
> NULL for component, the current user doesn't do this but the user
> added later in the series will.

Understood. I had the question because the change below.

+	interrupt->dev = dev;
+	if (!regmap && component)
+		interrupt->function_regmap = component->regmap;
+	else
+		interrupt->function_regmap = regmap;

If both regmap and component are null, the interrupt->function_regmap
will be NULL. Is it valid?

> 
> Thanks,
> Charles
> 

