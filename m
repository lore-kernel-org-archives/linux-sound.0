Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AB51B0F21
	for <linux-sound@vger.kernel.org>; Fri, 31 Jan 2025 12:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738327270; cv=none; b=Q7ttXOLddyPhrKQZfQMNLxE23OYPUzItAQAI+QK5U0fHscE9lfNRLPtuMd+uOaF7LiPfPn2JRVXq7LenAzZr/lJKQPGUJmpmlobqM9mO7lOyS9YWFm+6qiQ9j8aoVij+XIDHKPSdz198NejMHUud9DaRP66j/XmfPC6F9J12gfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738327270; c=relaxed/simple;
	bh=t4ezO4BRB4FgsORpCYHYuAAALV64O+2Hpw/3kG7BRpI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qx0Zzg6B34CZUsjRDO6yOjUUgbwWAq9V+rT+X1A2d4lkwIa8UFelTHHF3ibEQRtWOAUPCTQnwXA72ISClMtEiBqKuJcMlfv+FGUMyOH0wxgw/cH3DisPqrXkgNKI5JE1Vs4KwmaZccLif3wqkMDnSDT/3iS61bLHFK9hxrxS7tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gcU4ujOE; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gcU4ujOE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738327266; x=1769863266;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=t4ezO4BRB4FgsORpCYHYuAAALV64O+2Hpw/3kG7BRpI=;
  b=gcU4ujOE0pRcZDsGxOgr9WmccoYVabH2ULi+PYIh/iUmE5jEDFnh+y5B
   6Dstxv5CW6DHAM9t3YceJ9K32VWUI5TPw9I6Z5PYnCFQNzfT0BrA6ikVl
   JobeHWLPeHjG4jsIC9+B2JUXqePezdCOG5l9TJBJLZAqmzbklYVX5G44g
   53vrL+rwTGkgIs+IHJK2pWuWTlXKPRqAiUhwoBRYGxNDDrlstg2aGLoCa
   X9z3fS5DmgS3TAtDgrwtpXuNEa+9uVU18y9sesqyoe/qV9bfD+Rqbbofr
   3J/MwMUXFnC5tZfiHA/Tl5uE4fHiaR5JLhKxyXkEaW+iOlljPiviU6lY1
   w==;
X-CSE-ConnectionGUID: kusRrUWSTJmqqKopP5/8Ag==
X-CSE-MsgGUID: +Rue6iHXRcOzNS4mqPirMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="41726968"
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; 
   d="scan'208";a="41726968"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 04:41:05 -0800
X-CSE-ConnectionGUID: m//bqru7QSCuDvZwiNrK2w==
X-CSE-MsgGUID: /y8PASg3QIO1SW4ciX5EkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="146805516"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.8.107]) ([10.94.8.107])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 04:41:03 -0800
Message-ID: <fabca478-69cc-436e-b0c4-2ffec183e66a@linux.intel.com>
Date: Fri, 31 Jan 2025 13:41:00 +0100
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
Content-Language: en-US
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <50f5fa11-55f2-4928-97a6-b4758e8d9d52@perex.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/31/2025 10:03 AM, Jaroslav Kysela wrote:
> On 29. 01. 25 15:51, Amadeusz Sławiński wrote:
>> On 1/29/2025 10:25 AM, Cezary Rojewski wrote:
>>> On 2025-01-27 3:54 PM, Jaroslav Kysela wrote:
>>>> On 27. 01. 25 15:45, Amadeusz Sławiński wrote:
> 
> ...
> 
>>>> Also, a bit off-topic, but the driver name (hdaudioB?D?) for this
>>>> particular driver should be corrected, too. It should be like 'hda-
>>>> avs- dsp' or so. If I am not wrong, the SST driver name was 'hda-dsp'.
>>>
>>> We had a discussion or two within the team and yes, we do agree that a
>>> more user-friendly pattern should be provided. Currently card names are
>>> mostly based on machine board device (platform_device) name. There is no
>>> strong technical argument for that - the development was/is simply
>>> focused on bringing new functionality and we did not prioritize the card
>>> naming.
>>>
>>> The task touches all interfaces though, not just HDA. We would like to
>>> streamline or fix the naming for all the interfaces. This time we will
>>> specifically request a review for that : )
>>
>> And we had yet another discussion today ;) Are there some guidelines
>> upstream, about how cards should be named? Currently we need names for:
> I am not aware of any documentation, but it should be user friendly and 
> meaningful. I am talking about driver name not other UI parts, but they 
> should be probably corrected, too.
> 
> The driver name is more related to the kernel module name and it should 
> just identify the affected driver not runtime (like addressing). Runtime 
> descriptors should be put to the components string.
> 
>> HDA, HDMI, DMIC & I2S cards. Here are examples from running systems:
>> HDA:
>> card 0: hdaudioB0D0 [hdaudioB0D0], device 1: HDAudio Analog (*) []
>> HDMI:
>> card 1: hdaudioB0D2 [hdaudioB0D2], device 1: HDMI 0 (*) []
>> DMIC:
>> card 2: avsdmic [avs_dmic], device 2: Digital Microphone (*) []
>> I2S:
>> card 3: avsrt274 [avs_rt274], device 1: Audio (*) []
> 
> You should probably show all card info strings ('cat /proc/asound/cards' 
> or 'alsactl info 0').
> 
> There are basically four strings:
> 
> 1) driver name (used for alsa-lib / ucm configs)
> 2) card short name (for UI)
> 3) card long name (for UI)
> 4) card components (more precise driver/hw identification)
> 
> The components string can be printed using 'amixer -c 0 info' or 
> 'alsactl info 0' command.
> 
> I think that in your case, you just set the short name which is copied 
> to the driver name in the ASoC core. The avs_dmic/avs_rt274 names seems 
> fine, but only the hdaudioB?C? names are really mess (including card 
> short name).
> 
So, as I understand you want something like the following and to 
differentiate cards in UCM using component?

# aplay -l
**** List of PLAYBACK Hardware Devices ****
card 0: avshdaudio [avs_hdaudio], device 1: HDAudio Analog (*) []
   Subdevices: 1/1
   Subdevice #0: subdevice #0
card 1: avshdaudio_1 [avs_hdaudio], device 1: HDMI 1 (*) []
   Subdevices: 1/1
   Subdevice #0: subdevice #0
card 1: avshdaudio_1 [avs_hdaudio], device 2: HDMI 2 (*) []
   Subdevices: 1/1
   Subdevice #0: subdevice #0
card 1: avshdaudio_1 [avs_hdaudio], device 3: HDMI 3 (*) []
   Subdevices: 1/1
   Subdevice #0: subdevice #0
root@test-ThinkPad-X1-Carbon-6th:/home/test# cat /proc/asound/cards
  0 [avshdaudio     ]: avs_hdaudio - avs_hdaudio
                       LENOVO-20KH006LPB-ThinkPadX1Carbon6th
  1 [avshdaudio_1   ]: avs_hdaudio - avs_hdaudio
                       LENOVO-20KH006LPB-ThinkPadX1Carbon6th
# alsactl info 0
#
# Sound card
#
- card: 0
   id: avshdaudio
   name: avs_hdaudio
   longname: LENOVO-20KH006LPB-ThinkPadX1Carbon6th
   driver_name: avs_hdaudio
   mixer_name: Realtek ALC285
   components: HDA:10ec0285,17aa225c,00100002
   controls_count: 14
   pcm:
     - stream: PLAYBACK
       devices:
         - device: 1
           id: HDAudio Analog (*)
           name:
           subdevices:
             - subdevice: 0
               name: subdevice #0
     - stream: CAPTURE
       devices:
         - device: 1
           id: HDAudio Analog (*)
           name:
           subdevices:
             - subdevice: 0
               name: subdevice #0
alsactl: rawmidi_device_list:105: snd_ctl_rawmidi_next_device
# alsactl info 1
#
# Sound card
#
- card: 1
   id: avshdaudio_1
   name: avs_hdaudio
   longname: LENOVO-20KH006LPB-ThinkPadX1Carbon6th
   driver_name: avs_hdaudio
   mixer_name: Intel Kabylake HDMI
   components: HDA:8086280b,80860101,00100000
   controls_count: 21
   pcm:
     - stream: PLAYBACK
       devices:
         - device: 1
           id: HDMI 1 (*)
           name:
           subdevices:
             - subdevice: 0
               name: subdevice #0
         - device: 2
           id: HDMI 2 (*)
           name:
           subdevices:
             - subdevice: 0
               name: subdevice #0
         - device: 3
           id: HDMI 3 (*)
           name:
           subdevices:
             - subdevice: 0
               name: subdevice #0
alsactl: rawmidi_device_list:105: snd_ctl_rawmidi_next_device


