Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F92136996
	for <linux-sound@vger.kernel.org>; Wed, 11 Jun 2025 08:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749631971; cv=none; b=A5NToitwYGh+ncg0WZcwl+ipYhOP4A0PWN2YFIyKYMll8A7y7oLlQLeYiwachjKCgaPjRDV0YoJ1I0XCA74eHLsiMDXjgbQUPZNoLXx6hVlrAknjWg3M7Om5ceo1SBdATmdhbrkCB/Vq36EGIQiT7M2BsAM34BbOrqSnPj1Ha6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749631971; c=relaxed/simple;
	bh=c14YMHEgbALn6Y4bafn7b7WkCB9sVqF4VgosPPTpGRw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZWD3jsUhS9+KB9E2u6fwJ5wRpodChlw9W3H9OPw4WuirdrwiuOu4YZCpsSUf3zNHQZxEDc/xOki+ZKKZruHNpMGw4QoL9qi7zOAwA61VkcN8OJ2aHOcZcxngH8bWnUY70wWf9IIo2knc7bcHY/2q3S674us2ubsgBOgPUNj7FK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OZNRqiYg; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OZNRqiYg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749631969; x=1781167969;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=c14YMHEgbALn6Y4bafn7b7WkCB9sVqF4VgosPPTpGRw=;
  b=OZNRqiYg57ZnExIXTx0b5YPA7SjnfNqq5xOv7fAaLLj/xsLA6aK3JM45
   nOVXr7IzWeKx3qWlfDykh+e98CsCwg9P0eCe2De4DT7kwCqphJrlFQYN5
   PW2noSPJ+3icslmMXQ+1IAt0r3dY3TLPhtHoD61kIcmiiQaFzp4p94riP
   JXBl+hL/7m5ee4fjbLVI6vTSnjRFOzFqxRhbiFoWN18t/eaq0Xm2XQMUc
   TgVQ40Plrenj8v4oEZWjFkw4kAkYk11NZ7DPSN50lT5iQtCr4/znYzmnr
   Ik9+eTij/CQg3UKpmZOpbnjGgas0XrD1Sq91EkisT1xSSEHayke5JFeIc
   Q==;
X-CSE-ConnectionGUID: ig7U6mVCTe+j5U6VfGC2mw==
X-CSE-MsgGUID: +fvXclhqTEmvdzt7CjF5zA==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51866976"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="51866976"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 01:52:48 -0700
X-CSE-ConnectionGUID: 86OPEMEMRdqK/aSeAWFsIA==
X-CSE-MsgGUID: 7JLHOlMNS2+oSa0dPxBgmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="146982578"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO [10.245.246.201]) ([10.245.246.201])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 01:52:47 -0700
Message-ID: <80f629c9-cc51-492c-8a8a-6a1076592319@linux.intel.com>
Date: Wed, 11 Jun 2025 11:52:50 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/37] ASoC: Standardize ASoC menu
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org
References: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
 <5835adae-5dc6-4896-ae04-690ac6893f02@linux.intel.com>
 <cbef2f84-9f83-4cf0-87b3-39173099d136@sirena.org.uk>
 <11029ccf-5128-4fe8-bef8-9fd6de316e37@linux.intel.com>
 <08c118aa-5aee-4eac-8d9f-2821fc2bb970@sirena.org.uk>
 <87cybaj0o3.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <87cybaj0o3.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Morimoto-san,

On 11/06/2025 08:40, Kuninori Morimoto wrote:
>> 'Support for Sound Open Firmware (SOF) platforms'
> 
> OK, thank. So it will be like below in v2...
> 
> 	ASoC support for ... --->
> =>	Support for Sound Open Firmware (SOF) platforms --->
> 	CODEC drivers  --->

Yes, this looks better, thank you.

>> We have quite menu empty sub-menus, partially because they would include
>> something which would not be select-able in this arch (Apple, Au1x, etc)
>> and things that does not even have select-able options (SoundWire things
>> for example).
> 
> In my quick check, for example Apple case, it has only 1 item, I think
> top menu can use "depends on" and we can hide it for non ARCH_APPLE user.

But does it make sense to add a submenu for a single entry?

> But for example Au1x case, it has many items and complex dependency,
> so having "depends on" on top menu is maybe difficult or maybe can do
> via Au1x developer ? (Because I'm not 100% sure about detail dependency)

It might be possible to aggregate them to show the menu entry if any of
the entries would be available for selection?

My other alter-ego is hiding the TI directory somehow...
>> Apart from this, we also discussed that from our side it is OK to move
>> Intel SST, AVS (and it's machine drivers) and the 'Intel Machine
>> drivers' under ASoC support for Intel.
>> This Intel submenu is going to be a bit unorganized as it will contain
>> only a portion of the drivers for Intel hardware and some of the
>> platform drivers (SST/AVS), but we don't want to move things around at
>> this point.
> 
> I'm not 100% sure detail of Intel dependency. So how about this ?
> I will post 1st menu patch-set as v2. And your team will tidyup Intel
> side details after that ? It can avoid my patch-bomb
> I will post v2 if we can agree about this.

Sure, we will figure out something for this. Better to keep this churn
as mechanical with as less functional change as possible.
>>>>> The title already tells that this menu is for ASoC.
>>
>>>> I don't have a strong opinion on that one.
>>
>>> I'm not sure about this now, probably it is better to keep the 'ASoC
>>> support for' in case one searches for symbols? But that will show t*he
>>> path to the menu entry, indicating that it is ASoC.
>>> GPIO for example adds a postfix, some subsystems do not add the
>>> subsystem name in entries.
>>
>>> I guess whichever looks better?
>>
>> Yeah, the reason I don't have a strong opinion is that I mostly edit
>> .config with 'vi .config', people who actually use the UIs will have
>> a relevant opinion here but I don't really.
> 
> I have no strong opinion. Let's remove "ASoC subsystem for" prefix in v2.

--- ALSA for SoC audio support
      ASoC support for Analog Devices  --->
      ASoC support for AMD  --->

VS

--- ALSA for SoC audio support
      Analog Devices  --->
      AMD  --->

At least for Intel (and probably for AMD/NXP/MTK) the later looks better
as not stating that the ASoC support for VendorX is _under_ this menu
item but you can find VendorX related options under that.

In context of SOF vs VendorX this translates better, imho.

-- 
Péter

