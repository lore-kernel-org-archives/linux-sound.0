Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6078122F0F
	for <linux-sound@vger.kernel.org>; Fri,  5 Jan 2024 09:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perex.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b="CL+Uoo1f"
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id C822DD06;
	Fri,  5 Jan 2024 10:27:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz C822DD06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1704446878; bh=W64n/gipCajVgna07Sl9Q4Izp/Un7hG4ZmD0CRENdP4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CL+Uoo1fl2z+vGIOTeH/61mfWSQJD/z2OWVdy3SWrZ8/q/+BSDtD3ldWNCET6EU4J
	 RfoKIfpXKzNaaa3L0PMv3y6V9cvAL8M/u/t8JmQwUvHxvBEJ+lXvQZ4P6BMOGFxi0t
	 nu8XI9obI9DWZa0ptKMAWO6hI0UzhWz+bAL7Ht1A=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Fri,  5 Jan 2024 10:27:52 +0100 (CET)
Message-ID: <4a85b80e-8df2-464c-b744-cad325d31603@perex.cz>
Date: Fri, 5 Jan 2024 10:27:52 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: hda: generic: Always add LED controls
Content-Language: en-US
To: Bernhard Seibold <mail@bernhard-seibold.de>
Cc: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Richard Fitzgerald
 <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>
References: <20240104155838.7514-1-mail@bernhard-seibold.de>
 <871qaxkq43.wl-tiwai@suse.de>
 <3253emuy3njov4thaognxfb4c4e32e2cj5xr25k4wjd4iewfl5@cz6sf4nhxdv7>
 <5aa91315-1f14-473f-877e-5d6b1aa3327a@perex.cz>
 <quafrf7nulmb6gwap5hu3qzkpx4ihyae4nuko7vff5ouohooub@ntpvfuf2bv6u>
From: Jaroslav Kysela <perex@perex.cz>
Autocrypt: addr=perex@perex.cz; keydata=
 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
In-Reply-To: <quafrf7nulmb6gwap5hu3qzkpx4ihyae4nuko7vff5ouohooub@ntpvfuf2bv6u>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05. 01. 24 0:41, Bernhard Seibold wrote:
> On Thu, Jan 04, 2024 at 10:46:04PM +0100, Jaroslav Kysela wrote:
>> On 04. 01. 24 20:14, Bernhard Seibold wrote:
>>> On Thu, Jan 04, 2024 at 05:41:48PM +0100, Takashi Iwai wrote:
>>>> On Thu, 04 Jan 2024 16:58:38 +0100,
>>>> Bernhard Seibold wrote:
>>>>>
>>>>> LEDs for mute and microphone mute can be added to any system via the
>>>>> audio-mute and audio-micmute triggers, e.g. via USB HID devices.
>>>>> Therefore, add the LED controls unconditionally.
>>>>
>>>> Hmm...  Won't your change lead to the sysfs entries always,
>>>> i.e. creating sysfs entries even if the device has no LED at all?
>>>
>>> This patch is not affecting create_mute_led_cdev, that function is still
>>> only called for some special systems via fixups, to create the actual
>>> LED classdevs that are present on there.
>>>
>>> What I'm trying to change is to have the led-ctls always available. They
>>> serve as input to the audio-mute and audio-micmute triggers, and these
>>> triggers should work on any system with HD Audio, not just a few.
>>>
>>> It would be even better to move the whole functionality into the sound
>>> core so that it works with other drivers as well, but since yesterday was
>>> the first time I even looked at sound code, I wouldn't even know where
>>> to start.
>>
>> You can attach controls using sysfs for special use cases. If the system has
>> audio LED driver controlled in other code, the HDA driver should be notified
>> somehow to create triggers, otherwise the default (current) functionality is
>> fine in my eyes.
> 
> I've got a USB keyboard that has LEDs for mute and for microphone mute,
> and these currently do not work as expected. I'm not sure how special
> that use-case is, but I don't think expecting users to manually fiddle
> around in sysfs to get their keyboard LEDs working is a good solution.

I see your point (and tracked your name to hid-lenovo.c which creates 
mute/micmute LED drivers for Lenovo keyboards). The question is, if the audio 
triggers should be enabled blindly (all time) or when a LED driver exists and 
is active (runtime). In later case, this can be covered using new udev rules. 
Obviously, no manual configuration from users is expected.

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

