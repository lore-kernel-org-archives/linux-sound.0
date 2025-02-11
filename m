Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD71E1F193C
	for <linux-sound@vger.kernel.org>; Tue, 11 Feb 2025 10:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739271227; cv=none; b=AANBlEa4iByD2EfwwaiXHN3ih8O5Ay4eC+Sb6ZMtgGAI5owmsN+BHjsYWY+QzGWDArymVOxgWZ3ZNGBZR+oy0rxdebTuVD+s6QnW4u7IU1QMI0JEiilB2wEDp/teELYQg9/qFVcUnmnuI1Vqqoc99IyoPvFqzlgVGk/LwVh0d40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739271227; c=relaxed/simple;
	bh=TdP6qszpl7Tv4luXtPG6NFfS7ugOA+gXe07ooKqNteE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FPDCKW4dON3xk069bvz5wJIyaoQqoBN5IdILQxF00O+amSxwWlxkOC4URDF7DYno6QOgb8DaSjFREELHJB1LkPANPzSLvQV8inxRivfEfUGCkAHdFVMmIIocdF5+0U9uPwzsOLKeH2ZAH983oWAQ2V8B4u/WYYm81JOECHrY7NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jpzi5/Ln; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jpzi5/Ln"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739271226; x=1770807226;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=TdP6qszpl7Tv4luXtPG6NFfS7ugOA+gXe07ooKqNteE=;
  b=jpzi5/LneIZSPVE51k7ZpCmR4XQo6WMUvxn7RR/1F7QwDTZFY92NreId
   iN+7gqjpKzrFdnP/HEpo9rMnLZ7MGywY3t1DkMpcwGWf+E+4PtofykM32
   7ouVon/Uirqehigv7WlXYSQUbL8+MRI8ypG5VHShdXlaZa3qNhB0wbCZq
   hMQLC3qBvljEGy2US5hNQ0GpFf6GNsr6SXffa0mKD4oR54UsUnPxsasjT
   jxWF2wZyfsn8xImxPFEDnh36CdJBTEj0Zr1e+/4U2giQIHIEbcEC+CjPK
   KhbCImysiDVPBtLUZFc3Eb851mOeI2yVu45FD5hIU3pDivn551LH/YT48
   A==;
X-CSE-ConnectionGUID: t7ypiqtmSKWo47kjpGSgoQ==
X-CSE-MsgGUID: 82TaB2VLQgCs/2vchxeunQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39120394"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="39120394"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 02:53:45 -0800
X-CSE-ConnectionGUID: DPJd5o9jS9KwYQMXe05wUw==
X-CSE-MsgGUID: 2VCN0Kc8TFCi/vnRZGQ4MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="117560184"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.8.107]) ([10.94.8.107])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 02:53:43 -0800
Message-ID: <4c46ebfa-2892-462f-9f6f-98bec8620e5a@linux.intel.com>
Date: Tue, 11 Feb 2025 11:53:41 +0100
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
Content-Language: en-US
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <675dba40-e559-45bf-b9ec-65f4d4c60923@perex.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/31/2025 5:18 PM, Jaroslav Kysela wrote:
> On 31. 01. 25 13:41, Amadeusz Sławiński wrote:
> 
>> So, as I understand you want something like the following and to
>> differentiate cards in UCM using component?
> 
>> - card: 0
>>     id: avshdaudio
>>     name: avs_hdaudio
>>     longname: LENOVO-20KH006LPB-ThinkPadX1Carbon6th
>>     driver_name: avs_hdaudio
>>     mixer_name: Realtek ALC285
>>     components: HDA:10ec0285,17aa225c,00100002
> 
> The short name (name:) may be better like 'AVS HD-Audio' (almost all 
> ASoC drivers suffers here), but the proposed driver_name is fine from my 
> view.
> 

We had some more discussions, what about something like:

card X: HDAudio [AVS HD-Audio], device X: HDAudio Analog () []
card X: HDMI [AVS HDMI], device X: HDMI 1 () []
card X: ALC274 [AVS I2S ALC274], device X: Audio () []

- card: X
   id: HDAudio
   name: AVS HD-Audio
   longname: LENOVO-20KH006LPB-ThinkPadX1Carbon6th
   driver_name: avs_hdaudio
   mixer_name: Realtek ALC285
   components: HDA:10ec0285,17aa225c,00100002
   controls_count: 14

- card: X
   id: HDMI
   name: AVS HDMI
   longname: LENOVO-20KH006LPB-ThinkPadX1Carbon6th
   driver_name: avs_hdaudio
   mixer_name: Intel Kabylake HDMI
   components: HDA:8086280b,80860101,00100000
   controls_count: 21

- card: X
   id: ALC274
   name: AVS I2S ALC274
   longname: 
IntelCorporation-CannonLakeClientPlatform-0.1-CannonLakeYLPDDR4RVP
   driver_name: avs_rt274
   mixer_name:
   components:
   controls_count: 17

it feels like it is more descriptive.

