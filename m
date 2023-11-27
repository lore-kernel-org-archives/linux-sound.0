Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DEA0kM6Z"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB7E0198
	for <linux-sound@vger.kernel.org>; Mon, 27 Nov 2023 10:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701110501; x=1732646501;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=t/U4i/4g24Q1NaSjgGg1AJ5lREjmE/Glz7Quo6T5yL0=;
  b=DEA0kM6ZQiXRnBhGBgDgtid1IbL3N5bOQANUh+RiVM7QFQKpFKNpr16X
   meTNQKi0lQmX1QP7GzE8/fKuf1rHVDcukTd2RhHFtcigHT/do5B+RV7iL
   qQUzJmLybGBAyqBPVX7hYuBCCt7GU12/AnCsAdR0ydUh59CphjMrqCJ/z
   kCZMsCD95LzxyFUNrTQpNRBOYNBv7llmiIEBO2xBC+7A2zj0AKut2IdhH
   kerC6LS1MvV79m3KPMJjwz6tioaCy4uJJ3GdjXGLgQpvR09SSAZt53oH4
   Y5e8zqhT9+KM140TUPnMg7JAVecHBAkuE0VwDESuVleK1mZ/I7thHipf+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="392517683"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="392517683"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 10:41:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="891820922"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="891820922"
Received: from alanpai-mobl.amr.corp.intel.com (HELO [10.209.65.171]) ([10.209.65.171])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 10:41:40 -0800
Message-ID: <cb768f03-9d46-432e-ad67-8ff1ef075385@linux.intel.com>
Date: Mon, 27 Nov 2023 11:36:35 -0600
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
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <9660e9df-2061-4b2c-ba59-5e6f8a61f07d@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


>> +static const struct snd_soc_acpi_adr_device cs35l56_0_adr[] = {
>> +    {
>> +        .adr = 0x00003301FA355601ull,
>> +        .num_endpoints = 1,
>> +        .endpoints = &spk_r_endpoint,
> 
> Assigning CS35L56 to "left" or "right" endpoints might be confusing.
> All CS35L56 in a system receive both left and right channels and by
> default they output a mono-mix of left+right.
> 
> The left/right of an amp is determined by the firmware file (.bin) that
> is loaded and the current settings of the "Posture" ALSA control. So
> this amp might be the left channel after a .bin is loaded.

That's a problem if the kernel does not know which amplifier is on which
side, no? How would one change the balance if this information is known
only within a binary/opaque firmware?

> It would be better to have generic names for the endpoint that don't
> imply position, for example:
> 
> group1_spk1_endpoint
> group1_spk2_endpoint
> group1_spk3_endpoint
> group1_spk4_endpoint.

The notion of endpoint is completely half-baked today and the settings
used have no bearing on the behavior and user-experience. I am inches
away from sending a patch that removes all of the endpoint definitions,
we can re-add them if/when we can get the information from platform
firmware.

>> +        .name_prefix = "cs35l56-8"
> 
> Can these prefixes be "AMPn" to match the CS35L41, CS35L51 and
> CS35L56-hda driver? This prefix is used to find the matching firmware
> files and our naming convention for these has been cs35lxx-xxxx-ampn
> 
> Is there anything that depends on the prefixes being "cs35l56-n" ?

IIRC this name_prefix is just used for the codec_conf and hence for
control names/UCM. At some point userspace/driver need to know if amp5
is left or right.

We can certainly align on conventions but the values set in this ACPI
match table will not be used for firmware download - different scope.

>> +    },
>> +    {
>> +        .adr = 0x00003201FA355601ull,
>> +        .num_endpoints = 1,
>> +        .endpoints = &spk_3_endpoint,
>> +        .name_prefix = "cs35l56-7"
>> +    }
>> +};
>> +
>> +static const struct snd_soc_acpi_adr_device cs35l56_1_adr[] = {
>> +    {
>> +        .adr = 0x00013701FA355601ull,
>> +        .num_endpoints = 1,
>> +        .endpoints = &spk_l_endpoint,
>> +        .name_prefix = "cs35l56-1"
>> +    },
>> +    {
>> +        .adr = 0x00013601FA355601ull,
>> +        .num_endpoints = 1,
>> +        .endpoints = &spk_2_endpoint,
>> +        .name_prefix = "cs35l56-2"
>> +    }
>> +};
>> +
>> +static const struct snd_soc_acpi_link_adr tgl_cs42l43_cs35l56[] = {
>> +    {
>> +        .mask = BIT(3),
>> +        .num_adr = ARRAY_SIZE(cs42l43_3_adr),
>> +        .adr_d = cs42l43_3_adr,
>> +    },
>> +    {
>> +        .mask = BIT(0),
>> +        .num_adr = ARRAY_SIZE(cs35l56_0_adr),
>> +        .adr_d = cs35l56_0_adr,
>> +    },
>> +    {
>> +        .mask = BIT(1),
>> +        .num_adr = ARRAY_SIZE(cs35l56_1_adr),
>> +        .adr_d = cs35l56_1_adr,
>> +    },
>> +    {}
>> +};
>> +
