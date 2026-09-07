Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9212949E0
	for <linux-sound@vger.kernel.org>; Mon,  7 Sep 2026 05:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788758715; cv=none; b=ZwLbqWh8o0DC9uWGhHGKpCHfbEY/23QdGlIOo7YS9Lr1JSCk7F2oSqOPfZpUWJqgj9QLyIngCoyjBOd5jCboCnk1/SEWyThchXpOiRjtcoJTCpxBV3knVJSeTUg3QUgobv3SrUtIdXDSTv6uGRxSCqEu7v1dHvc6tWZe6a6SH7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788758715; c=relaxed/simple;
	bh=w3xPTBxkyUlodtwW2zWqcIxdbkgceDo8iNvshB6wojY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sDf2S1erOvThcIIbE4mzvOxzQDH3787kHCXquT4rMj8cd+Y/6/8MEwEWJgDvo+/tXKBGeey/sivYPKJpKdjYXsmpEqZmnyIil3VdEwwZyz7koHc4Qh4HOEJLz9wfYAHpcEuD9AJQtEHFehvpNsopGeEGWGoE3nPp3nfMGKQ1qfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g5ArmcOE; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g5ArmcOE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788758713; x=1820294713;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=w3xPTBxkyUlodtwW2zWqcIxdbkgceDo8iNvshB6wojY=;
  b=g5ArmcOEx8aKtsuhIaRrxEho8QwmDCf7s0JlMPFwed0dJE4vl3K3djKX
   tLlWn5w9nszsZEamYoEMlw2pWav8V6Yq+XGqALaL1wTelbeDRsS2V+nYJ
   xUrJ8By7s5AFB+B++Q1nmaIbhOK6zdvVWcagUGdOryheRKLMigiPx02u4
   z3o7eMI/dOHba9SXWcEjySKMV4n6A+NXgqHcc8HqCZj3PuQBcvTpZL0qQ
   /GUwDmaHwYE4DJ1kA6wZZ0YNuXv0LnOtmxrHdxMSPWAzbFfEJlaPxQ6nW
   /6mWV6/heeEUjNxRRMjYERZc7ajbtPwPaBwOldR1QiW54hX+4wZ8QE/rv
   Q==;
X-CSE-ConnectionGUID: WK/j3ACOQWWbvMDy+mTU3w==
X-CSE-MsgGUID: quVGmUSjR6yK23iSfeA7hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="88916899"
X-IronPort-AV: E=Sophos;i="6.25,266,1779174000"; 
   d="scan'208";a="88916899"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2026 22:25:12 -0700
X-CSE-ConnectionGUID: xaI/sZDBRnKHb09EHEikQQ==
X-CSE-MsgGUID: aWtPFMmkTBmPrPPk1PveHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,266,1779174000"; 
   d="scan'208";a="274126925"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.245.187]) ([10.245.245.187])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2026 22:25:10 -0700
Message-ID: <b64906b9-032f-4435-a179-b663f0202796@linux.intel.com>
Date: Mon, 7 Sep 2026 08:25:20 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/23] ASoC: soc-compress: Implement trigger FE-BE
 sequencing as with normal PCMs
To: Mark Brown <broonie@kernel.org>
Cc: vkoul@kernel.org, perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
 srinivas.kandagatla@oss.qualcomm.com, linux-sound@vger.kernel.org,
 kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.dev, daniel.baluta@nxp.com,
 Vijendar.Mukunda@amd.com
References: <20260904073134.29648-1-peter.ujfalusi@linux.intel.com>
 <20260904073134.29648-5-peter.ujfalusi@linux.intel.com>
 <apsf1kjaFG71NpPd@sirena.co.uk>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <apsf1kjaFG71NpPd@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 04/09/2026 22:45, Mark Brown wrote:
> On Fri, Sep 04, 2026 at 10:31:15AM +0300, Peter Ujfalusi wrote:
> 
>> The FE-BE trigger sequence should be dynamic, similarly how soc-pcm.c
>> dpcm_fe_dai_do_trigger() does it.
> 
>> +static int soc_compr_trigger_fe(struct snd_compr_stream *cstream, int cmd)
>> +{
>> +	struct snd_soc_pcm_runtime *fe = cstream->private_data;
>>  	int stream = cstream->direction; /* SND_COMPRESS_xxx is same as SNDRV_PCM_STREAM_xxx */
>> +	bool fe_first;
>>  	int ret;
>>  
>>  	if (cmd == SND_COMPR_TRIGGER_PARTIAL_DRAIN ||
>>  	    cmd == SND_COMPR_TRIGGER_DRAIN)
>>  		return snd_soc_component_compr_trigger(cstream, cmd);
> 
> What about SND_COMPR_TRIGGER_NEXT_TRACK...

That was already missing in the initial patch which added the DPCM
support for compress.

> 
>> +	switch (cmd) {
>> +	case SNDRV_PCM_TRIGGER_START:
>> +	case SNDRV_PCM_TRIGGER_RESUME:
>> +	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
>> +		ret = soc_compr_trigger_fe_be(cstream, cmd, fe_first);
>> +		break;
>> +	case SNDRV_PCM_TRIGGER_STOP:
>> +	case SNDRV_PCM_TRIGGER_SUSPEND:
>> +	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
>> +		ret = soc_compr_trigger_fe_be(cstream, cmd, !fe_first);
>> +		break;
>> +	default:
>> +		ret = -EINVAL;
>> +		break;
> 
> ...otherwise it'll end up with -EINVAL instead of getting passed
> through.  Also a switch statement would be a bit more idiomatic.

OK, I will add the NEXT_TRACK and convert the if to switch.

-- 
Péter

