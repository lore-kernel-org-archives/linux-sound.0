Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53271119E
	for <linux-sound@vger.kernel.org>; Mon,  4 Mar 2024 21:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709586170; cv=none; b=USMae87PT+hDkfZLowH9u/e9WisCKuKZs4luxhpoCzvkM87pTXQ59KmSsAcYbMBDLYd0Xxy6jJMHmCTsxE9hMURh0B83mFLcVPETgCzG57X8IS4d6F2MMIEarcwDQaVw6oIWLcpgdzrP6e9puoHl3Gn3UM31swoLxE2H8sJakzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709586170; c=relaxed/simple;
	bh=dRyORiaaDkhOJHe//rVljh2VmfBmbMd7knOY/VOeJyE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QxuQBRVxuUy6mQ7d9bn49N9nOKlkaBVdwDJP0DoDXr5W6mjlYsjZdPOOxAPbzEIsStaeaJfIgrsNUXDzI4/dzu05EIC9b5aUwyvRtPQL3ORHU0gzfWKG2NStbPA2/wUaCh75AM0fmdZE1ZsOAexIBhQDWMfLpdbQW/g/gN1ImGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ALCO/SI1; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ALCO/SI1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709586169; x=1741122169;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=dRyORiaaDkhOJHe//rVljh2VmfBmbMd7knOY/VOeJyE=;
  b=ALCO/SI13HT/niWsXxavTY+G1ztmGyAy9Pfj5nlbntjA9viOXzJ9Nz/u
   gjWm1lyz4NqY/SsvtuAbYtoqZUctMJy6kUnY28lii4BMjo+5EBxjZg8zy
   G92d7CfZTYqBTr14/+pUlIgULCI7OHyanJsZbH+dqPzblrBW5CbvVCoOo
   gTIAxi/Q8DgGcS2PC6uHNHdg34jvowiR+6dsY37QlimJmEX/RsSb9dyG2
   lcBFPSR5g724jfBMav1CDf097sz8avV1QcFIsWol2Qr7d2w7g94k9pDYQ
   Q9d4VFdxBGR0iIOyblnmV9g9rsu3CqB/I9fm9RPhfzVefi3832AYct3p5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="3962381"
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="3962381"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 13:02:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="9066810"
Received: from cryoung-mobl2.amr.corp.intel.com (HELO [10.212.71.160]) ([10.212.71.160])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 13:02:47 -0800
Message-ID: <eca552eb-9d5b-4990-a98f-85dc1da3a96c@linux.intel.com>
Date: Mon, 4 Mar 2024 15:02:46 -0600
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] ASoC: Intel: Disable route checks for Skylake boards
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, tiwai@suse.com,
 perex@perex.cz, amadeuszx.slawinski@linux.intel.com, hdegoede@redhat.com
References: <20240304190536.1783332-1-cezary.rojewski@intel.com>
 <20240304190536.1783332-2-cezary.rojewski@intel.com>
 <ff674cfa-19d4-4de4-80ec-9be88f8cb4a4@linux.intel.com>
 <87c39d2f-fac0-4414-9c9f-53e45de70e79@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87c39d2f-fac0-4414-9c9f-53e45de70e79@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 3/4/24 14:40, Cezary Rojewski wrote:
> On 2024-03-04 8:28 PM, Pierre-Louis Bossart wrote:
>> On 3/4/24 13:05, Cezary Rojewski wrote:
>>> Topology files that are propagated to the world and utilized by the
>>> skylake-driver carry shortcomings in their SectionGraphs.
>>>
>>> Since commit daa480bde6b3 ("ASoC: soc-core: tidyup for
>>> snd_soc_dapm_add_routes()") route checks are no longer permissive. Probe
>>> failures for Intel boards have been partially addressed by commit
>>> a22ae72b86a4 ("ASoC: soc-core: disable route checks for legacy devices")
>>> and its follow up but only skl_nau88l25_ssm4567.c is patched. Fix the
>>> problem for the rest of the boards.
>>>
>>> Link:
>>> https://lore.kernel.org/all/20200309192744.18380-1-pierre-louis.bossart@linux.intel.com/
>>> Fixes: daa480bde6b3 ("ASoC: soc-core: tidyup for
>>> snd_soc_dapm_add_routes()")
>>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
>>> ---
>>>   sound/soc/intel/boards/bxt_da7219_max98357a.c       | 1 +
>>>   sound/soc/intel/boards/bxt_rt298.c                  | 1 +
>>>   sound/soc/intel/boards/glk_rt5682_max98357a.c       | 1 +
>>>   sound/soc/intel/boards/kbl_da7219_max98357a.c       | 1 +
>>>   sound/soc/intel/boards/kbl_da7219_max98927.c        | 4 ++++
>>>   sound/soc/intel/boards/kbl_rt5660.c                 | 1 +
>>>   sound/soc/intel/boards/kbl_rt5663_max98927.c        | 2 ++
>>>   sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c | 1 +
>>>   sound/soc/intel/boards/skl_hda_dsp_generic.c        | 1 +
>>
>> This HDAudio machine driver is shared with the SOF-based solutions and I
>> see no reason to change the route checking...
>>
>> I don't agree with this change. Why can't you fix the broken topologies
>> instead, if indeed they 'carry shortcomings'?
>>
>> Same for glk, this an SOF-based solution.
> 
> Perhaps the flag could be set conditionally for those two?
> 
> Even when you address the problem in the topology file, you do not get
> any confirmation user replaced the invalid file. skylake-driver topology
> were not part of any firmware-alike package. Please note that I actually
> did all that I believe could be done to repair those topologies and
> provided valid references at avs-topology/for-skylake-driver [1].

Humm, the commit daa480bde6b3 ("ASoC: soc-core: tidyup for
snd_soc_dapm_add_routes()") dates from August 2019 and was included in
kernel 5.4.

Why are we seeing issues on route checks with the Skylake driver in
2024? Are we saying that the card creation failed for the last 5 years?

I must be missing something here.
