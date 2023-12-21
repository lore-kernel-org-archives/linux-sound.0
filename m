Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BF55993E
	for <linux-sound@vger.kernel.org>; Thu, 21 Dec 2023 17:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m+SvaYyx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703179065; x=1734715065;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=xvVupv0DvWA15dLMY7HS32t36cy8IzuFHk6EWLhdBgI=;
  b=m+SvaYyxM7Iq1T+xmP6TslbqBTflwa1s7WEmuTND2zrhy0liIk3zVckk
   r5h1sXZ90jnt7gAQcYRtCjyItnY3dX+G/GF/gLLrj3PJJvfCzBSGxzHrZ
   2glmmxncfj1GjbYRKxd02AhJ/KsC86KATY3cjuazGVfKyMoaV7n6SZU8H
   5Ex89Bx3J9/Uesvjqy3Yt5SdUbuqZ1UEIdA5XlddDIxiwniYUj9NGSf3K
   1Es7qpLCtNwSK3DaCWjF4M+Ng8rom0Ge2k0rqqXw6e8/kPspvi6/EFtuD
   sSNhtN3dqhYxTUheb9oqb/UschpGNxHulAW3DjjSHt9OU/LKFr7q81/9x
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="482190091"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="482190091"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 09:17:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="770011109"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="770011109"
Received: from wdangelo-mobl.ger.corp.intel.com (HELO [10.252.51.4]) ([10.252.51.4])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 09:17:39 -0800
Message-ID: <98600d10-2130-463b-aa61-459bc1293bb8@linux.intel.com>
Date: Thu, 21 Dec 2023 18:15:05 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 09/16] soundwire: crc8: add constant table
Content-Language: en-US
To: Vinod Koul <vkoul@kernel.org>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 broonie@kernel.org, vinod.koul@intel.com,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, srinivas.kandagatla@linaro.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 vijendar.mukunda@amd.com, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Shuming Fan <shumingf@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 Oder Chiou <oder_chiou@realtek.com>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
 <20231207222944.663893-10-pierre-louis.bossart@linux.intel.com>
 <ZYA0gKf3bZgY4X_s@matsya>
 <121b44fb-9d2f-4e1f-beca-a54b16d7e13c@linux.intel.com>
 <ZYROvUA7RrqQknlM@matsya>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <ZYROvUA7RrqQknlM@matsya>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/21/23 15:42, Vinod Koul wrote:
> On 18-12-23, 14:26, Pierre-Louis Bossart wrote:
>>
>>
>> On 12/18/23 06:01, Vinod Koul wrote:
>>> On 07-12-23, 16:29, Pierre-Louis Bossart wrote:
>>>> Add the lookup table required by crc8(). All configuration values were
>>>> directly table from the MIPI SoundWire 1.x specification.
>>>>
>>>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>>>> ---
>>>>  drivers/soundwire/Makefile |   4 +-
>>>>  drivers/soundwire/crc8.c   | 277 +++++++++++++++++++++++++++++++++++++
>>>>  drivers/soundwire/crc8.h   |  11 ++
>>>>  3 files changed, 291 insertions(+), 1 deletion(-)
>>>>  create mode 100644 drivers/soundwire/crc8.c
>>>>  create mode 100644 drivers/soundwire/crc8.h
>>>>
>>>> diff --git a/drivers/soundwire/Makefile b/drivers/soundwire/Makefile
>>>> index 657f5888a77b..170128dd9318 100644
>>>> --- a/drivers/soundwire/Makefile
>>>> +++ b/drivers/soundwire/Makefile
>>>> @@ -5,7 +5,9 @@
>>>>  
>>>>  #Bus Objs
>>>>  soundwire-bus-y := bus_type.o bus.o master.o slave.o mipi_disco.o stream.o  \
>>>> -			sysfs_slave.o sysfs_slave_dpn.o
>>>> +			sysfs_slave.o sysfs_slave_dpn.o \
>>>> +			crc8.o
>>>> +
>>>>  obj-$(CONFIG_SOUNDWIRE) += soundwire-bus.o
>>>>  
>>>>  soundwire-generic-allocation-objs := generic_bandwidth_allocation.o
>>>> diff --git a/drivers/soundwire/crc8.c b/drivers/soundwire/crc8.c
>>>> new file mode 100644
>>>> index 000000000000..b6b984d7f39a
>>>> --- /dev/null
>>>> +++ b/drivers/soundwire/crc8.c
>>>> @@ -0,0 +1,277 @@
>>>> +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
>>>> +// Copyright(c) 2024 Intel Corporation.
>>>> +
>>>> +#include <linux/crc8.h>
>>>> +#include <linux/module.h>
>>>> +#include "crc8.h"
>>>> +
>>>> +/*
>>>> + * the MIPI SoundWire CRC8 polynomial is X^8 + X^6 + X^3 + X^2 + 1, MSB first
>>>> + * The value is (1)01001101 = 0x4D
>>>> + *
>>>> + * the table below was generated with
>>>> + *
>>>> + *	u8 crc8_lookup_table[CRC8_TABLE_SIZE];
>>>> + *	crc8_populate_msb(crc8_lookup_table, SDW_CRC8_POLY);
>>>
>>> Good that you found this API, so next question would be why should we
>>> have this static table in kernel and not generate on probe if bpt is
>>> supported..? Many subsystems use these APIs to generate the tables..
>>
>> The table is going to be the same for all hosts, it's simpler if
>> everyone uses a constant table, no? We're talking about 256 bytes added
>> for the common bus parts, be it with dynamically allocated memory or a
>> static table.
>>
>> I don't mind reverting to a dynamically allocated table populated at
>> boot if that was the consensus.
> 
> Most of the kernel users I looked have dynamically allocated table
> populated at boot, also out of many users how many would support BTP.?
> Your older platforms, current qcom dont, so not point is adding for
> everyone...

All Intel hardware supports BTP/BRA, we just didn't have a compelling
reason to enable it so far. I've seen AMD stating that they also have
BTP/BRA. That's 2/3 of controllers.

I don't mind reverting to a devm_ allocated table, I am not sure I see
the benefits for 256 bytes of constant data.
