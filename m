Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB2D2441B0
	for <linux-sound@vger.kernel.org>; Tue, 11 Feb 2025 13:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739282201; cv=none; b=gG2mUsikClY0A02KdWifdwkPLQ1JlRgavfCQvc/TJxoAfS2RfNnlOgrzshW4ZqPkcGpVN3DJDTU6N9mhMwK3VC11M6+XQ2QSc8kvtPUymHN3n1Tq/0Sht9AWSeTLw7BUmug2wH6KjVysbP0ZndeIJxpO88u1EDhGeN3HVJK37vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739282201; c=relaxed/simple;
	bh=XWaEg94MUu1/7FbP5HxtfUyCDz5Wd0I+Acvx7bZ5QzE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jfXREJXvtGBFqm3/cl8YF/nijgRIP2XPATsEBvz+q6t0W0kwMttNrHwc3SLtuqpVugjn32FFqgCHWsejsdyhqc3a9pVkmITe3kGH8PLPP0gQ5zd5WF3di3GQNv0DVrwCnF6/zabwUNSJsaS4j62QrTchIR49Fit1J6w98TAhlYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LKgdgyjU; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LKgdgyjU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739282200; x=1770818200;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=XWaEg94MUu1/7FbP5HxtfUyCDz5Wd0I+Acvx7bZ5QzE=;
  b=LKgdgyjU00zWXU0UvwcP0C4nGRBqz+Y9m4lxCc01XEKx3WVYsKLYqn2w
   J/TY9eN4I47pYvZEXo4Ra3lo/9WwvrrF6L5kM06jdCW+D2ejZ0WqSdlCt
   QMSUy2my3lBKuKyBbIDN6uk5ZOCjySCDi02KDfM8mULJcZYUpSDLTLZw0
   koNvCGdQDg1rzdcZ689r8O9CQa5Ay/7AZjcMmpatVyMn6bsAlz2hYAKM3
   ufNnNHlVQBNO6SczaTRUNu4+coHbpA0UTH7js6pfLl60rV+B6oBZiC4de
   HvMMgIoN+R55X++Ex3+YpuCM9VfqjqmyoSppU4wCyd2qkpTxxZM85T9Bx
   g==;
X-CSE-ConnectionGUID: V4Z0dyXfQmGgCp2d/j4Xuw==
X-CSE-MsgGUID: CqujCaD8RMuvRYPTshECZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="62369745"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="62369745"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 05:56:39 -0800
X-CSE-ConnectionGUID: MFZzyBEOSI6XCT3JDUkQzA==
X-CSE-MsgGUID: H91+G/lBQ429gadT4fX5FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="117433111"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.8.107]) ([10.94.8.107])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 05:56:38 -0800
Message-ID: <5ff3e844-884b-4fca-b0fd-17bbe6e43801@linux.intel.com>
Date: Tue, 11 Feb 2025 14:56:35 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: core: Change device numbering
To: Jaroslav Kysela <perex@perex.cz>,
 Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
References: <20250127144445.2739017-1-amadeuszx.slawinski@linux.intel.com>
 <f8f2b8f9-527e-486d-ae83-34abd13ef968@linux.intel.com>
 <6fcbc9d3-93d4-4485-9f9f-5bef61476ef3@perex.cz>
 <811c03ef-03a2-44a3-969b-5a2d55f2f876@intel.com>
 <2a772972-3011-4083-9d5d-e1bfe297998b@linux.intel.com>
 <50f5fa11-55f2-4928-97a6-b4758e8d9d52@perex.cz>
 <fabca478-69cc-436e-b0c4-2ffec183e66a@linux.intel.com>
 <675dba40-e559-45bf-b9ec-65f4d4c60923@perex.cz>
 <4c46ebfa-2892-462f-9f6f-98bec8620e5a@linux.intel.com>
 <d895d47a-7705-4cc5-aefc-5ea87fb79c84@perex.cz>
Content-Language: en-US
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <d895d47a-7705-4cc5-aefc-5ea87fb79c84@perex.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/11/2025 2:30 PM, Jaroslav Kysela wrote:
> On 11. 02. 25 11:53, Amadeusz Sławiński wrote:
>> On 1/31/2025 5:18 PM, Jaroslav Kysela wrote:
>>> On 31. 01. 25 13:41, Amadeusz Sławiński wrote:
>>>

>>
>> We had some more discussions, what about something like:
>>
>> card X: HDAudio [AVS HD-Audio], device X: HDAudio Analog () []
>> card X: HDMI [AVS HDMI], device X: HDMI 1 () []
>> card X: ALC274 [AVS I2S ALC274], device X: Audio () []
>>
>> - card: X
>>     id: HDAudio
>>     name: AVS HD-Audio
>>     longname: LENOVO-20KH006LPB-ThinkPadX1Carbon6th
>>     driver_name: avs_hdaudio
>>     mixer_name: Realtek ALC285
>>     components: HDA:10ec0285,17aa225c,00100002
>>     controls_count: 14
>>
>> - card: X
>>     id: HDMI
>>     name: AVS HDMI
>>     longname: LENOVO-20KH006LPB-ThinkPadX1Carbon6th
>>     driver_name: avs_hdaudio
>>     mixer_name: Intel Kabylake HDMI
>>     components: HDA:8086280b,80860101,00100000
>>     controls_count: 21
>>
>> - card: X
>>     id: ALC274
>>     name: AVS I2S ALC274
>>     longname:
>> IntelCorporation-CannonLakeClientPlatform-0.1-CannonLakeYLPDDR4RVP
>>     driver_name: avs_rt274
>>     mixer_name:
>>     components:
>>     controls_count: 17
>>
>> it feels like it is more descriptive.
> 
> It looks much better for driver name and card (short) name. It also 
> shows, how the DMI auto-generated long names are really broken and 
> confusing for users.
> 

Well, those can be set to something better, it's just that ASoC defaults 
to DMI if there is no longname provided. So if you have any suggestions, 
we can do it while also changing card names.
But do note that it allows for differentiating between different 
machines using same card in case we need to do something custom for UCM 
on one of them:
2680 
access("/usr/share/alsa/ucm2/conf.d/avs_hdaudio/LENOVO-20KH006LPB-ThinkPadX1Carbon6th.conf", 
R_OK) = -1 ENOENT (No such file or directory)
2680  access("/usr/share/alsa/ucm2/conf.d/avs_hdaudio/avs_hdaudio.conf", 
R_OK) = -1 ENOENT (No such file or directory)
so while not pretty I'm not sure if we can do any better, without 
breaking above possibility. And in most cases UCM based on driver name 
should be enough, which looks pretty enough.

