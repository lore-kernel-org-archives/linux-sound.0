Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12D2154BEA
	for <linux-sound@vger.kernel.org>; Fri, 31 Jan 2025 09:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.48.224.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738314209; cv=none; b=kjrHNGL3KhqXcMMsbveb38WfCy3CGvNr+BRyIXt5KX6y8YALKEYLsDfsdA8vMhZAbej0jD6VViS5pA7VceLLz4pbOthP30gB/40svo7g42IU6BcyrJlbaneUHHX9ejiYdbuqo5RBs2Stni2vbb54YmbhH/y4ojK3IIGpKxhPK/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738314209; c=relaxed/simple;
	bh=e21hBXdZnkMGNFt/lWlNcrKqUNg3wb8ugLJoQMgtZ+E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h6BlZFDw+YYkbOPFEvcIRfg0JNCERjqRIMAL46s4sb+JrKtOjdcddmwXqwy/wxJ+qnEligteNo390Oc/z2hFABUpeH+9dI1TrHkaE4ltquGM2sEAMn1dsICb+yHCj0CNXCxw0I39GVHBokEgYX6YlI76KkdwMIS0bCho1IkkWnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz; spf=pass smtp.mailfrom=perex.cz; dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b=QFJNrzUO; arc=none smtp.client-ip=77.48.224.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perex.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b="QFJNrzUO"
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id D3A5E4C72;
	Fri, 31 Jan 2025 10:03:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz D3A5E4C72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1738314196; bh=LiWzpVjrCkqan9bOi6ORlgdWj44EkqoYzzNMiF8ekBs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QFJNrzUOaNOSsQpyFnvv9n1zB0iF7oEpkrFgBaBIW/Jrz2yLH8aTjWOnRw7tT8/S8
	 rMxFSUmoA4oL+mGmybWnmA2a6fITlya8fZ+bF26dkH/wMlEkU0OoQvD5F49jio55ih
	 M7c0tibZst0fKFAaBYbCWY/n5Z1n2NOjEgcLO83I=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Fri, 31 Jan 2025 10:03:11 +0100 (CET)
Message-ID: <50f5fa11-55f2-4928-97a6-b4758e8d9d52@perex.cz>
Date: Fri, 31 Jan 2025 10:03:10 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: core: Change device numbering
To: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
References: <20250127144445.2739017-1-amadeuszx.slawinski@linux.intel.com>
 <f8f2b8f9-527e-486d-ae83-34abd13ef968@linux.intel.com>
 <6fcbc9d3-93d4-4485-9f9f-5bef61476ef3@perex.cz>
 <811c03ef-03a2-44a3-969b-5a2d55f2f876@intel.com>
 <2a772972-3011-4083-9d5d-e1bfe297998b@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Content-Language: en-US
Autocrypt: addr=perex@perex.cz; keydata=
 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
In-Reply-To: <2a772972-3011-4083-9d5d-e1bfe297998b@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29. 01. 25 15:51, Amadeusz Sławiński wrote:
> On 1/29/2025 10:25 AM, Cezary Rojewski wrote:
>> On 2025-01-27 3:54 PM, Jaroslav Kysela wrote:
>>> On 27. 01. 25 15:45, Amadeusz Sławiński wrote:

...

>>> Also, a bit off-topic, but the driver name (hdaudioB?D?) for this
>>> particular driver should be corrected, too. It should be like 'hda-
>>> avs- dsp' or so. If I am not wrong, the SST driver name was 'hda-dsp'.
>>
>> We had a discussion or two within the team and yes, we do agree that a
>> more user-friendly pattern should be provided. Currently card names are
>> mostly based on machine board device (platform_device) name. There is no
>> strong technical argument for that - the development was/is simply
>> focused on bringing new functionality and we did not prioritize the card
>> naming.
>>
>> The task touches all interfaces though, not just HDA. We would like to
>> streamline or fix the naming for all the interfaces. This time we will
>> specifically request a review for that : )
> 
> And we had yet another discussion today ;) Are there some guidelines
> upstream, about how cards should be named? Currently we need names for:
I am not aware of any documentation, but it should be user friendly and 
meaningful. I am talking about driver name not other UI parts, but they should 
be probably corrected, too.

The driver name is more related to the kernel module name and it should just 
identify the affected driver not runtime (like addressing). Runtime 
descriptors should be put to the components string.

> HDA, HDMI, DMIC & I2S cards. Here are examples from running systems:
> HDA:
> card 0: hdaudioB0D0 [hdaudioB0D0], device 1: HDAudio Analog (*) []
> HDMI:
> card 1: hdaudioB0D2 [hdaudioB0D2], device 1: HDMI 0 (*) []
> DMIC:
> card 2: avsdmic [avs_dmic], device 2: Digital Microphone (*) []
> I2S:
> card 3: avsrt274 [avs_rt274], device 1: Audio (*) []

You should probably show all card info strings ('cat /proc/asound/cards' or 
'alsactl info 0').

There are basically four strings:

1) driver name (used for alsa-lib / ucm configs)
2) card short name (for UI)
3) card long name (for UI)
4) card components (more precise driver/hw identification)

The components string can be printed using 'amixer -c 0 info' or 'alsactl info 
0' command.

I think that in your case, you just set the short name which is copied to the 
driver name in the ASoC core. The avs_dmic/avs_rt274 names seems fine, but 
only the hdaudioB?C? names are really mess (including card short name).

> Additionally is there a way to alias card name? We would like to still
> allow users to use current names, to keep backward compatibility at
> least for some time.

We don't have this possibility in the kernel API. For user space (alsa-lib, 
UCM) we can use symlinks. As I already suggested, it would be probably best to 
create CONFIG_XXXXX_OBSOLETE option which can be turned on by default with 
proper description and let distribution maintainers to turn it off when 
alsa-lib / UCM / whatever related configs are updated in the user space.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
