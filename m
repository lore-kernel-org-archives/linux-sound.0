Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71430129EE3
	for <linux-sound@vger.kernel.org>; Mon, 18 Dec 2023 13:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YvbV1tpU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702906744; x=1734442744;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=J3ELLp5LAeAwAWR1C/4qxH4K8OaxLDU00Y9CzVO+Azo=;
  b=YvbV1tpUn7s+DIyYVckcZfXzZgO0hbC0scX6gAkJ2N1jNrYmq4IcSokO
   oRgHfqp8BPcMb6p65IC6YFo0qCxuYp1eUddAcLWBZOtxqmqFO8CCVAOqR
   cRcyWbh/w9v1lzyQFBlldQIeHjfxWh996Z3ONqHBwxrvI2fPkgCw4M25k
   zXzzUexopgN9QLs6AVDT/4tgB5sjDH5JIpbcCauuSqrVH9UHS8y4ven/v
   /5096A6NGvGE8R2g9BZa7twHksaTqugip90/bhGw+qk+zNyDXEC9FDqA6
   ftYZyUeb0IQxfmIGtplGpIaTChQMma7Q2+XxitlS1Hc/1ULDCeIYvxZ7A
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="8868636"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="8868636"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 05:39:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="1022753474"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="1022753474"
Received: from mmaiores-mobl1.ger.corp.intel.com (HELO [10.249.34.197]) ([10.249.34.197])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 05:38:58 -0800
Message-ID: <a5d0e3a7-e45c-4971-8ad7-7ba19702acf1@linux.intel.com>
Date: Mon, 18 Dec 2023 13:58:47 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/16] Documentation: driver: add SoundWire BRA
 description
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
 <20231207222944.663893-2-pierre-louis.bossart@linux.intel.com>
 <ZYAvoFbEP8RH_x0Y@matsya>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <ZYAvoFbEP8RH_x0Y@matsya>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


>>  Documentation/driver-api/soundwire/bra.rst    | 478 ++++++++++++++++++
> 
> Can we split the cadence parts of this to bra-cadence.rst that way this
> file documents the core parts only

Yes, we can split the Cadence parts out.


>> +Error handling
>> +~~~~~~~~~~~~~~
>> +
>> +The expected response to a 'bra_message' and follow-up behavior may
>> +vary:
>> +
>> +   (1) A Peripheral driver may want to receive an immediate -EBUSY
>> +       response if the BRA protocol is not available at a given time.
>> +
>> +   (2) A Peripheral driver may want to wait until a timeout for the
>> +       on-going transfer to be handled
>> +
>> +   (3) A Peripheral driver may want to wait until existing BRA
>> +       transfers complete or deal with BRA as a background task when
>> +       audio transfers stop. In this case, there would be no timeout,
>> +       and the operation may not happen if the platform is suspended.
> 
> Is this runtime suspend or S3/S4 case?

System suspend (which can also mean S0i1).

I don't think we can have a case where a peripheral driver waits on
something without having done a pm_runtime_get_sync() to prevent
runtime_pm suspend.

> 
>> +BTP/BRA API available to peripheral drivers
>> +-------------------------------------------
>> +
>> +ASoC Peripheral drivers may use
>> +
>> +   - sdw_bpt_stream_open(mode)
>> +
>> +      This function verifies that the BPT protocol with the
>> +      'mode'. For now only BRA is accepted as a mode. This function
>> +      allocates a work buffer internally. This buffer is not exposed
>> +      to the caller.
>> +
>> +     errors:
>> +         -ENODEV: BPT/BRA is not supported by the Manager.
>> +
>> +         -EBUSY: another agent is already using the audio payload for
>> +          audio transfers. There is no way to predict when the audio
>> +          streams might stop, this will require the Peripheral driver
>> +          to fall back to the regular (slow) command channel.
>> +
>> +         -EAGAIN: another agent is already transferring data using the
>> +          BPT/BRA protocol. Since the transfers will typically last
>> +          10s or 100s of ms, the Peripheral driver may wait and retry
>> +          later.
>> +
>> +    - sdw_bpt_message_send_async(bpt_message)
> 
> why not have a single API that does both? First check if it is supported
> and then allocate buffers and do the transfer.. What are the advantages
> of using this two step process

Symmetry is the only thing that comes to my mind. Open - close and send
- wait are natural matches, aren't they?

We do need a wait(), so bundling open() and send() would be odd.

But you have a point that the open() is not generic in that it also
prepares the DMA buffers for transmission. Maybe it's more natural to
follow the traditional open(), hw_params(), hw_free, close() from ALSA.
