Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AFF4A1DEE
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 14:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789052266; cv=none; b=cDl1qUW3j7S8oHt6fvcD4rshwCrHmV/uruisv6YGLi/5LMSOM8rapJ1AM+xElWM+ObilTYVZkAYMY4g37DKEbfJ6A06Dbtmq9o4fmT9ZDYr4x1B4kTBUUZFn44oP0f0ZC0JTM9/Qk91WmYNQT1hNzhMumfKOqVmnMWgPBhic4NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789052266; c=relaxed/simple;
	bh=tG/L3kHn6KoUTFz7lhLNHl00QEqBtsGKyMaI9mJjIEc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I5rr1xcGMQEk1vCbezn7uM35rU08DPSLVaOY1smu2uuzl4vHZ/9JWsJSdePXmNSumzvnuAn34sLuVOiU0OJ5UJGyEPak8AVyBCfCIBDEt013Iuin7OhMygEfBIRIjQRxCUI+COodGaL8vjfqxfQOTBbXVgbfYcGaSwjWzIb/YR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z2o2kGkL; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z2o2kGkL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789052263; x=1820588263;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=tG/L3kHn6KoUTFz7lhLNHl00QEqBtsGKyMaI9mJjIEc=;
  b=Z2o2kGkLp//QRWxA9tMD/il3dHnqvLQ1uBqmi1DH4YXwWyZ7MkpC6jl7
   VZNMb6eBHS493JeOHSaZo0/9fN2KoMTTihvHYWxVOSmext90I5MKwz5ZZ
   ts0/+S9D3nTA9bb87luxrE8dPP4VdxdhYlL86CYMLZHhRNJ3PRAWtyyz8
   di2FrmXSg75gElvfLpwSJiH3xnKts3yljWOJP25PoGX6UPEkg81muyPSk
   8b06OSDUq2f8mfbG9kGX69gKQw/s6K4bASBtTNiOJZuyRhhMDehb0bgZZ
   0GIf4hHvHxmskcCSh8Ibz6fJAikdrnYy5duFBZVYQiarKSI7b1O46vCDL
   A==;
X-CSE-ConnectionGUID: wZGk9Tz4Tr2r6J0vL76bBA==
X-CSE-MsgGUID: 6JscESrNTyGLQ+ui47MKaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="93195682"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="93195682"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 07:57:43 -0700
X-CSE-ConnectionGUID: XNkzH7g5R3iZ0+DosFhLhw==
X-CSE-MsgGUID: ca974eJ+ShSLEsqo658/Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="295145211"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.173]) ([10.245.245.173])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 07:57:39 -0700
Message-ID: <c0395b03-4c4e-49b4-b9d4-7e5557686988@linux.intel.com>
Date: Thu, 10 Sep 2026 17:57:49 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 23/24] ASoC: SOF: Intel: Kconfig: Select compress
 support for TGL+ platforms
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, vkoul@kernel.org,
 perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com, broonie@kernel.org,
 srinivas.kandagatla@oss.qualcomm.com
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, daniel.baluta@nxp.com
References: <20260909090949.7503-1-peter.ujfalusi@linux.intel.com>
 <20260909090949.7503-24-peter.ujfalusi@linux.intel.com>
 <6e5326ae-0a0b-4221-980d-65a8ffe8410f@linux.dev>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <6e5326ae-0a0b-4221-980d-65a8ffe8410f@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 09/09/2026 16:37, Pierre-Louis Bossart wrote:
> On 9/9/26 11:09, Peter Ujfalusi wrote:
>> Select SOF_COMPRESS for TGL and newer platforms, on Intel devices the
>> compressed support is available with IPC4 only.
> 
> that wording is confusing.
> 
> TGL default is IPC3, official IPC4 support started with MTL, didn't it?

Yes, officially it is from MTL, but I worked on TGL for most of the time
until got access to the actual decoder blobs and a machine where I can
deploy the self built firmware.

The compress works on TGL IPC4 with ffmpeg in firmware ;)
Extremely experimental thing for now.

I think I will leave it like this and reconsider if TGL IPC4 is decided
to be dropped.

> 
>> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
>> Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
>> ---
>>  sound/soc/sof/intel/Kconfig | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
>> index 840d5a36b958..02b41e4ccab2 100644
>> --- a/sound/soc/sof/intel/Kconfig
>> +++ b/sound/soc/sof/intel/Kconfig
>> @@ -213,6 +213,7 @@ config SND_SOC_SOF_INTEL_TGL
>>  	select SND_SOC_SOF_HDA_GENERIC
>>  	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
>>  	select SND_SOC_SOF_INTEL_CNL
>> +	select SND_SOC_SOF_COMPRESS
>>  
>>  config SND_SOC_SOF_TIGERLAKE
>>  	tristate "SOF support for Tigerlake"
>> @@ -249,6 +250,7 @@ config SND_SOC_SOF_INTEL_MTL
>>  	select SND_SOC_SOF_HDA_GENERIC
>>  	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
>>  	select SND_SOC_SOF_IPC4
>> +	select SND_SOC_SOF_COMPRESS
>>  
>>  config SND_SOC_SOF_METEORLAKE
>>  	tristate "SOF support for Meteorlake"
> 

-- 
Péter

