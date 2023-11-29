Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dyXgapQi"
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8DEE13E
	for <linux-sound@vger.kernel.org>; Wed, 29 Nov 2023 10:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701283542; x=1732819542;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=FN4I76ZU7Cwagn6Bgl8OaeZ+LRU0T1R0zOgimIt+bG4=;
  b=dyXgapQi9bk2iRvXuhJtkm8lVXIJebF9ZJzmJ3n7M0FH2W2UZWpCHQGG
   3ccWC14Cqq96RCWq+Fc98Yd5GtN4PXdKayaReU6iDlIpIyZPCi2fDUWW4
   qhXmztiOPVNKDHlr10SR9yQ1qHeof3OVdvG+IZ+lgBIQz/vSLIKVn1Gg4
   qVGAiLTfiU45yDvZfyds7pzkWuK91Sp+IspiUBQlCUnjZjhWmPoS1MtLO
   OXDgKpqGHT0AZHiIxGjAPQjaUXYWsHKPHfOj2S5wKF3kxmt5pNnD+ihzL
   e2emQVJenZcneUI9t/JumkSLhiV1mdeScsjAhrVm2zwPFNeHgn0on1Pqi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="383602783"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="383602783"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 10:45:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="942421659"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="942421659"
Received: from caw1-mobl1.amr.corp.intel.com (HELO [10.255.229.136]) ([10.255.229.136])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 10:45:41 -0800
Message-ID: <7bae01ac-a0de-47d9-9bd3-6bdfc48e02c1@linux.intel.com>
Date: Wed, 29 Nov 2023 10:39:08 -0600
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
 <5e9b0b69-6108-4909-90e8-257c13c2d886@linux.intel.com>
 <d2de7d4c-3984-4737-b879-a1fa829007ff@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <d2de7d4c-3984-4737-b879-a1fa829007ff@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


>>>>>> +        .name_prefix = "cs35l56-8"
>>>>>
>>>>> Can these prefixes be "AMPn" to match the CS35L41, CS35L51 and
>>>>> CS35L56-hda driver? This prefix is used to find the matching firmware
>>>>> files and our naming convention for these has been cs35lxx-xxxx-ampn
>>>>>
>>>>> Is there anything that depends on the prefixes being "cs35l56-n" ?
>>>>
>>>> IIRC this name_prefix is just used for the codec_conf and hence for
>>>> control names/UCM. At some point userspace/driver need to know if amp5
>>>> is left or right.
>>>>
>>>> We can certainly align on conventions but the values set in this ACPI
>>>> match table will not be used for firmware download - different scope.
>>>>
>>>
>>> They are used for our firmware download. Each amp can have its own
>>> unique firmware file. The ALSA prefix is used to identify which firmware
>>> file to load to which amp.
>>
>> The prefix will only be used when the card is created, specifically for
>> control names.
>> The firmware should be selected and downloaded when the device shows up
>> on the bus.
>> Card creation and device enumeration/initialization happen on different
>> timelines, if the machine driver is "blacklisted" or unbound I am not
>> sure what happens.
>>
>> There is a dependency between machine driver probe and codec firmware
>> download that I am not able to follow, can you please elaborate?
>>
> 
> The codec driver has to choose which firmware to load from under
> /lib/firmware. It does this using a combination of SSID (to identify the
> target product), the ALSA prefix string (to identify which amp) and
> in some systems a GPIO on the motherboard to select between different
> models of speaker when they have multiple suppliers. This results in a
> firmware name like:
> 
> cs35l56-<silicon rev>-dsp1-misc-<SSID>[-<SPEAKER MODEL>]-<ALSA PREFIX>
> 
> You can see this if you look in the linux-firmware repo under cirrus/
> for cs35l41 firmware files (though the ALSA PREFIX section in those
> cases is not "AMPn" because they are not SDCA parts with rotation,
> they have a fixed left/right assignment.)
> 
> We have to be careful of the length of the prefix. The 44 characters of
> an ALSA control name get eaten up very quickly when we start creating
> fully-qualified names for controls published by the firmware. So "AMPn"
> was nice because it was descriptive enough but only uses 5 characters
> of the 44.
> 
> Having said that, I've calculated that we have enough characters (just)
> to use a prefix of "cs35l56-n". If there's a reason why that is
> necessary/desirable for SOF or SoundWire then we could do that. But we'd
> intended to use "AMPn" prefixes.
> 
> We just need to decide whether to go with "AMPn". Or switch to using
> "cs35l56-n" for the ALSA prefix (the therefore the qualifier at the end
> of the firmware filename).

Yes we have similar issues with control names in topology, the limit is
hit very quickly.

I think you missed my point though that the ALSA prefix is only set when
the card is created, which can be sometime after the firmware needs to
be downloaded. I guess you could pick the firmware in the component
probe, which happens during the card creation, but that could be
sub-optimal. Given the download times you want the download to proceed
as early as possible.
