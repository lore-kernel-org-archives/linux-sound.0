Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FDC29D269
	for <linux-sound@vger.kernel.org>; Mon, 27 Oct 2025 06:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761546024; cv=none; b=UKis44Kb3OzOcDhuaQhgJUXxgDKokJBDgqLtR3lmepttm/+5ccPRwdbM2u1HPDsGU6yjEPeVrtPentN849KHlirAWJxT3V2UkZIRHN0aqzZa0DzEBb+kRswvoWZ4M0UEIE7cFxmz7pRPtaTZNtqUsJvLnM7epKAzKtv3dev+s5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761546024; c=relaxed/simple;
	bh=cYOwmBcJL8KWAWFytRCqagQ7s5dZJTLZmTTFd4BdXcI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gFGY0Nxpoh4g9pHDih//CfIQ+/eF2aGCjcoof8KXsiemmNS3ucWDwWw2JwmsXgOtJLJ+kW3/e08CutOcDOBy+dy/yl5peFL+hxVs59BfifC+BOSPSCUzJ7U6U61U9/474a6LHDUJF9ZvOeiPra4tkxkVSlKKPeSKt33dGreiwP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d1e3mvl0; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d1e3mvl0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761546022; x=1793082022;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=cYOwmBcJL8KWAWFytRCqagQ7s5dZJTLZmTTFd4BdXcI=;
  b=d1e3mvl0ZCbIazoVHAJUPHPqlOalwH4YkY0uFOPTESyWuJqyq/KsTgKC
   m9XvWAPiFvVe6EkLUgUJMSkJUh8R+wvGGuiMIUg1XRg8W8LMzejRE1nsW
   ro+5LRmwOERGd+AmHmErLG77Zb8AsDxvYdqcVzACnznvULaS1cmc2lmeG
   UO/fYyh4WHjjnEzwi1BvfbMUxDYpzw1RdB9VSI9Hv3B1CPOv/UVSExVPv
   WymYSBqcwoYVlmTTWCkpUg/plifi46/RcOsV7pkKxe4QOQ156sgkiozeF
   /nRIKGGqBHcnmny2WwPPGFFqEXnqcWW1YKZ0sr7UHE4Dogzro0So68dnr
   g==;
X-CSE-ConnectionGUID: +/pt945pRluwypyZaoJg8g==
X-CSE-MsgGUID: Umbo4LCbRWSBDvWMiDkyDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="81045909"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="81045909"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 23:20:21 -0700
X-CSE-ConnectionGUID: s4rXXpahTVqwaTVW9EHOHA==
X-CSE-MsgGUID: pT+iq6ctT+aNPd92+86yGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="184858254"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.246.27]) ([10.245.246.27])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 23:20:19 -0700
Message-ID: <25cbc999-bb13-453f-8210-c0fd38866d2d@linux.intel.com>
Date: Mon, 27 Oct 2025 08:20:26 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: soc-pcm: Preserve hw parameters from components in
 dpcm_runtime_setup_fe
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, linux-sound@vger.kernel.org,
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com,
 yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
 shengjiu.wang@nxp.com
References: <20251023081404.3740-1-peter.ujfalusi@linux.intel.com>
 <87pla8oowa.wl-kuninori.morimoto.gx@renesas.com>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Content-Language: en-US
In-Reply-To: <87pla8oowa.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Morimoto-san,

On 27/10/2025 08:11, Kuninori Morimoto wrote:
> 
> Hi Peter
> 
> Thank you for the patch
> 
>> Component drivers can prepare snd_pcm_hardware struct based on the hardware
>> capabilities which information should not be discarded.
>>
>> Only touch the rates, channels_max and formats if they were left to 0,
>> otherwise keep the provided configuration intact for the parameter cross
>> checking decision.
>>
>> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
>> ---
> (snip)
>> -	soc_pcm_hw_init(hw);
>> -
>> -	if (formats)
>> -		hw->formats &= formats;
>> +	/*
>> +	 * Initialize only pcm hardware patameters that has not been initialized
>> +	 * and preserve the configuration which might have been provided by
>> +	 * component drivers
>> +	 */
>> +	if (!hw->rates)
>> +		hw->rates = UINT_MAX;
>> +	if (!hw->rate_max)
>> +		hw->rate_max = UINT_MAX;
>> +	if (!hw->channels_max)
>> +		hw->channels_max = UINT_MAX;
>> +	if (!hw->formats)
>> +		hw->formats = ULLONG_MAX;
> 
> soc_pcm_hw_init() is used from only 2 functions
> 
> 	(a) snd_soc_runtime_calc_hw()
> 	(b) dpcm_runtime_setup_fe()
> 
> And this patch fixed not to use it in (b).
> Setting same variable in multiple method is not good idea, IMO.
> 
> How about like this ?

This is how the RFC was done, but decided to not modify
soc_pcm_hw_init() with an added bool.
Other option would be to add a new function which would do only
conditional initialization.

https://lore.kernel.org/linux-sound/20251020073750.27784-1-peter.ujfalusi@linux.intel.com/

> 
> 	static void soc_pcm_hw_init(struct snd_pcm_hardware *hw, boot force)
> 	{
> 		if (force || !hw->rates)
> 			hw->rates		= UINT_MAX;
> 		if (force || !hw->rate_max)
> 			hw->rate_max		= UINT_MAX;
> 		if (force || !hw->channels_max)
> 			hw->channels_max	= UINT_MAX;
> 		if (force || !hw->formats)
> 			hw->formats		= ULLONG_MAX;
> 
> 		hw->rate_min		= 0;
> 		hw->channels_min	= 0;

This way we would loose the rate_min, channel_min from components, see
my RFC which covers this, but it is using reverse condition (preserve vs
force).
The force boolean might be better than the preserve_config as parameter
if the preference is to modify the soc_pcm_hw_init()

> 	}
> 
> 	int snd_soc_runtime_calc_hw(...)
> 	{
> 		...
> 		soc_pcm_hw_init(hw, true);
> 		...
> 	}
> 
> 	int dpcm_runtime_setup_fe(...)
> 	{
> 		...
> 		soc_pcm_hw_init(hw, false);
> 		...
> 	}
> 
> 
> Thank you for your help !!
> 
> Best regards
> ---
> Kuninori Morimoto

-- 
Péter

