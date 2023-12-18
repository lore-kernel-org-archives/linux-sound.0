Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282BF129EC2
	for <linux-sound@vger.kernel.org>; Mon, 18 Dec 2023 13:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oJkpoGN7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702906762; x=1734442762;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=prKE6A162P9Ju2Tm3VxotcuOr7byQMz2lavfEXsh3+8=;
  b=oJkpoGN7RHXZq4JeYyV2iAXd1tQYdoS8oSQeLwX2FTqvBq4Mkjts0L66
   4D3VsguOQERvcXQXA5W9+pjieFX6IAdhxnRh9BLkGUWnGFBaL8ycLRGWt
   /6vw2QX17z8Dq3MnN4N0vtF05SK5ZhBUP1tRzTXbT3rQLezNnTYYMOktF
   rWIuD66rmuMT7Sz6utmAXuMIHZJwO8rbbOCscI/ejp3znJDccvuCGdFi9
   rxZTYcOqaUAmwlXJAL/M0QcH4efEOQtRMrlMMEFRKNllek5k87QQEdfqT
   GST+ClTRWs88rtAaCAjicgDAA7EKvTPRZImKBlpD4SOFWxNgcTUaunZp9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="8868696"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="8868696"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 05:39:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="1022753675"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="1022753675"
Received: from mmaiores-mobl1.ger.corp.intel.com (HELO [10.249.34.197]) ([10.249.34.197])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 05:39:16 -0800
Message-ID: <121b44fb-9d2f-4e1f-beca-a54b16d7e13c@linux.intel.com>
Date: Mon, 18 Dec 2023 14:26:15 +0100
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
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <ZYA0gKf3bZgY4X_s@matsya>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/18/23 06:01, Vinod Koul wrote:
> On 07-12-23, 16:29, Pierre-Louis Bossart wrote:
>> Add the lookup table required by crc8(). All configuration values were
>> directly table from the MIPI SoundWire 1.x specification.
>>
>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> ---
>>  drivers/soundwire/Makefile |   4 +-
>>  drivers/soundwire/crc8.c   | 277 +++++++++++++++++++++++++++++++++++++
>>  drivers/soundwire/crc8.h   |  11 ++
>>  3 files changed, 291 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/soundwire/crc8.c
>>  create mode 100644 drivers/soundwire/crc8.h
>>
>> diff --git a/drivers/soundwire/Makefile b/drivers/soundwire/Makefile
>> index 657f5888a77b..170128dd9318 100644
>> --- a/drivers/soundwire/Makefile
>> +++ b/drivers/soundwire/Makefile
>> @@ -5,7 +5,9 @@
>>  
>>  #Bus Objs
>>  soundwire-bus-y := bus_type.o bus.o master.o slave.o mipi_disco.o stream.o  \
>> -			sysfs_slave.o sysfs_slave_dpn.o
>> +			sysfs_slave.o sysfs_slave_dpn.o \
>> +			crc8.o
>> +
>>  obj-$(CONFIG_SOUNDWIRE) += soundwire-bus.o
>>  
>>  soundwire-generic-allocation-objs := generic_bandwidth_allocation.o
>> diff --git a/drivers/soundwire/crc8.c b/drivers/soundwire/crc8.c
>> new file mode 100644
>> index 000000000000..b6b984d7f39a
>> --- /dev/null
>> +++ b/drivers/soundwire/crc8.c
>> @@ -0,0 +1,277 @@
>> +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
>> +// Copyright(c) 2024 Intel Corporation.
>> +
>> +#include <linux/crc8.h>
>> +#include <linux/module.h>
>> +#include "crc8.h"
>> +
>> +/*
>> + * the MIPI SoundWire CRC8 polynomial is X^8 + X^6 + X^3 + X^2 + 1, MSB first
>> + * The value is (1)01001101 = 0x4D
>> + *
>> + * the table below was generated with
>> + *
>> + *	u8 crc8_lookup_table[CRC8_TABLE_SIZE];
>> + *	crc8_populate_msb(crc8_lookup_table, SDW_CRC8_POLY);
> 
> Good that you found this API, so next question would be why should we
> have this static table in kernel and not generate on probe if bpt is
> supported..? Many subsystems use these APIs to generate the tables..

The table is going to be the same for all hosts, it's simpler if
everyone uses a constant table, no? We're talking about 256 bytes added
for the common bus parts, be it with dynamically allocated memory or a
static table.

I don't mind reverting to a dynamically allocated table populated at
boot if that was the consensus.
