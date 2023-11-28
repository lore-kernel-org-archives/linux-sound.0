Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mtXn4oid"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80CBB93
	for <linux-sound@vger.kernel.org>; Tue, 28 Nov 2023 09:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701194036; x=1732730036;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=7EyciSBoMRp/uy5JEafkZ9mCsmBqjMjPCjZFngsv27E=;
  b=mtXn4oidljbSyX5ewKO+m6X7mo/rKtdWDqQl2G28KTVQz8DqsyxywNED
   OOXqx/B7A3l6AGbULilmgs3pHeJ7UH+7TgyUtHywDMZRqy4VK5yMTVm5u
   fPiM2bioWjIYqtlHMXw7u/NZWTHrFFDEfqLMpEsH6TZdxoPc9GMhlC3m/
   nXB8i9Hyh8A1r2Fh7Tun0GEe0UvvKIFPKIUBTMe7F6/2+7AefEgDdg2k+
   5WdJpv14raYnO70/jpZPDGq3GI14IIx8UipRkkPVMaBJBfDzTzDErqcw8
   iySsEe0OkcxYs8nwn/1VBof6RAW4M4xoR1AaRJdcVOS/6tCDyZ5/tsKG/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="424127078"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="424127078"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 09:53:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="834715299"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="834715299"
Received: from skumarso-mobl33.amr.corp.intel.com (HELO [10.255.231.208]) ([10.255.231.208])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 09:53:54 -0800
Message-ID: <5e9b0b69-6108-4909-90e8-257c13c2d886@linux.intel.com>
Date: Tue, 28 Nov 2023 09:23:32 -0600
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] ASoC: Intel: soc-acpi-intel-tgl-match: add cs42l43
 and cs56l56 support
Content-Language: en-US
To: Richard Fitzgerald <rf@opensource.cirrus.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, lgirdwood@gmail.com,
 broonie@kernel.org
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com,
 cezary.rojewski@intel.com, yung-chuan.liao@linux.intel.com,
 ckeepax@opensource.cirrus.com, yong.zhi@intel.com, chao.song@linux.intel.com
References: <20231127133448.18449-1-peter.ujfalusi@linux.intel.com>
 <20231127133448.18449-7-peter.ujfalusi@linux.intel.com>
 <9660e9df-2061-4b2c-ba59-5e6f8a61f07d@opensource.cirrus.com>
 <cb768f03-9d46-432e-ad67-8ff1ef075385@linux.intel.com>
 <6038c9fa-8cb1-46e1-b856-d759a3f990b3@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <6038c9fa-8cb1-46e1-b856-d759a3f990b3@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 11/28/23 04:31, Richard Fitzgerald wrote:
> On 27/11/2023 17:36, Pierre-Louis Bossart wrote:
>>
>>>> +static const struct snd_soc_acpi_adr_device cs35l56_0_adr[] = {
>>>> +    {
>>>> +        .adr = 0x00003301FA355601ull,
>>>> +        .num_endpoints = 1,
>>>> +        .endpoints = &spk_r_endpoint,
>>>
>>> Assigning CS35L56 to "left" or "right" endpoints might be confusing.
>>> All CS35L56 in a system receive both left and right channels and by
>>> default they output a mono-mix of left+right.
>>>
>>> The left/right of an amp is determined by the firmware file (.bin) that
>>> is loaded and the current settings of the "Posture" ALSA control. So
>>> this amp might be the left channel after a .bin is loaded.
>>
>> That's a problem if the kernel does not know which amplifier is on which
>> side, no? How would one change the balance if this information is known
>> only within a binary/opaque firmware?
>>
> 
> SDCA allows the posture (orientation) of amplifiers to be changed at
> runtime. CS35L56 is designed as a SDCA device so it doesn't have any
> hardwired position. SDCA doesn't define what the posture numbers mean,
> they are an integer that is system-specific.
> 
> Because SDCA doesn't define the meaning of postures, and an SDCA device
> should work with a generic SDCA driver (which obviously wouldn't have
> hardcoded knowledge of the system) the speaker positions and postures
> are coded into the firmware
> 
> It's difficult to say what is "default". For example, if you say that
> the default for a tablet is left/right/top/bottom, assuming it is
> used in portrait orientation, that would be wrong if the user always
> uses it in landscape.
> 
> Matching by what amp is on what bus doesn't work well here because two
> systems could have the same arrangement of CS35L56 on each bus but use
> them for different purposes. So they could both match the "2 on bus 0, 2
> on bus 1" table entry, but could be left/right/top/bottom on one device
> and left woofer/right woofer/left tweeter/right tweeter on another
> device.

In the absence of any platform firmware information, I am not sure how
we can deal with such systems. The match tables are already hard to
support given that a number of OEMs get the _ADR wrong, the speaker
position is the next-level...

Or did you just volunteer to maintain a DMI quirk table for Cirrus-based
systems :-)

I also bet that at some point the wrong firmware will be loaded on the
wrong amplifiers, that could be fun as well.

> I assume that if the system supports rotation there should be something
> in the UCM or other userland that manages this. At least, it seems like
> it's a UCM problem to decide which speakers are doing what audio.
> If Linux-based distros don't have something like that - well, that just
> means Linux is behind Windows.

SDCA has lots of fancy concepts, posture is one. Last time I checked we
don't have any reports of the hinge angle in Linux so the best we can do
is landscape/portrait, and even that is questionable given that tablets
or detachables have not reached any developers so far. CI automation is
another fun issue, we'll need robotic arms to move the device around and
intelligent alsa-bat-v2 to verify sound levels...

The notion of which speakers do what is something that will clearly take
years to figure out. For now the main issue is to get all parts
connected and basic "loud enough" sound working.

>>> It would be better to have generic names for the endpoint that don't
>>> imply position, for example:
>>>
>>> group1_spk1_endpoint
>>> group1_spk2_endpoint
>>> group1_spk3_endpoint
>>> group1_spk4_endpoint.
>>
>> The notion of endpoint is completely half-baked today and the settings
>> used have no bearing on the behavior and user-experience. I am inches
>> away from sending a patch that removes all of the endpoint definitions,
>> we can re-add them if/when we can get the information from platform
>> firmware.
>>
>>>> +        .name_prefix = "cs35l56-8"
>>>
>>> Can these prefixes be "AMPn" to match the CS35L41, CS35L51 and
>>> CS35L56-hda driver? This prefix is used to find the matching firmware
>>> files and our naming convention for these has been cs35lxx-xxxx-ampn
>>>
>>> Is there anything that depends on the prefixes being "cs35l56-n" ?
>>
>> IIRC this name_prefix is just used for the codec_conf and hence for
>> control names/UCM. At some point userspace/driver need to know if amp5
>> is left or right.
>>
>> We can certainly align on conventions but the values set in this ACPI
>> match table will not be used for firmware download - different scope.
>>
> 
> They are used for our firmware download. Each amp can have its own
> unique firmware file. The ALSA prefix is used to identify which firmware
> file to load to which amp.

The prefix will only be used when the card is created, specifically for
control names.
The firmware should be selected and downloaded when the device shows up
on the bus.
Card creation and device enumeration/initialization happen on different
timelines, if the machine driver is "blacklisted" or unbound I am not
sure what happens.

There is a dependency between machine driver probe and codec firmware
download that I am not able to follow, can you please elaborate?

