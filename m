Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19050129ECB
	for <linux-sound@vger.kernel.org>; Mon, 18 Dec 2023 13:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XEazpVKI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702906756; x=1734442756;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=vmsLSRBTT54/ZoE0Gd5mmHXnPv8UTZ2Uoyyx7a2t1VQ=;
  b=XEazpVKIvtqD29cGnyBSyBq+R1YuvuL7K1yfFlgF2MtJ+pQVAvuOWuon
   7g5HkUW/8t9fTSd8h8GMETuuYolJScEixU7SPYknrvFPbtQhFCfloboZK
   bgHNmDFe+zLqYKz/TK85FL6Ca4SRmsA5HYGlMRxQ4eZ7v3aA2y5KJxTGm
   ZsiDYQuDupAwr19nuwyn14ZdPCXL3HUYQA7iN88VshT0f6ygxHBrlplFd
   wLZW3Z/B/7s27dce4MI8y/tP8pAuv+fu8Rk7cKrUc+kuHRZNqn8/yEyIE
   nq9jwSI5YtpmD0/ivAc8KVahPMpPSe4wxsHEzF6Ri0R+p8dlb8HuyOz3L
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="8868685"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="8868685"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 05:39:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="1022753602"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="1022753602"
Received: from mmaiores-mobl1.ger.corp.intel.com (HELO [10.249.34.197]) ([10.249.34.197])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 05:39:10 -0800
Message-ID: <87b3fc89-f967-4251-b709-0d439c6f1cf7@linux.intel.com>
Date: Mon, 18 Dec 2023 14:20:23 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 08/16] soundwire: bus: add bpt_stream pointer
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
 <20231207222944.663893-9-pierre-louis.bossart@linux.intel.com>
 <ZYAzS3tggqQg8_PW@matsya>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <ZYAzS3tggqQg8_PW@matsya>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/18/23 05:55, Vinod Koul wrote:
> On 07-12-23, 16:29, Pierre-Louis Bossart wrote:
>> Add a convenience pointer to the 'sdw_bus' structure. BPT is a
>> dedicated stream which will typically not be handled by DAIs or
>> dailinks. Since there's only one BPT stream per link, storing the
>> pointer at the link level seems rather natural.
>>
>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> ---
>>  include/linux/soundwire/sdw.h | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
>> index e54c5bbd2b91..8db0cd7d0d89 100644
>> --- a/include/linux/soundwire/sdw.h
>> +++ b/include/linux/soundwire/sdw.h
>> @@ -965,6 +965,7 @@ struct sdw_master_ops {
>>   * @stream_refcount: number of streams currently using this bus
>>   * @btp_stream_refcount: number of BTP streams currently using this bus (should
>>   * be zero or one, multiple streams per link is not supported).
>> + * @bpt_stream: pointer stored for convenience.
>>   */
>>  struct sdw_bus {
>>  	struct device *dev;
>> @@ -996,6 +997,7 @@ struct sdw_bus {
>>  	int hw_sync_min_links;
>>  	int stream_refcount;
>>  	int bpt_stream_refcount;
>> +	struct sdw_stream_runtime *bpt_stream;
> 
> So we are limiting to single stream? Can we have multiple transfers
> queued up, which I guess might imply multiple streams?


Yes for now there is a BTP/BRA single stream active when there are no
audio transfers taking place. This is the only way to guarantee
predictable download/resume times.

There is no mechanism to queue up transfers, be it from the same
peripheral device or different ones. It would be up to the peripheral
driver to wait for the BTP stream to be available.

Adding a queuing mechanism is a bridge too far for now, most platforms
only have 1 or 2 devices only, and a peripheral driver may or may not be
ok with delayed downloads. For now the main ask is to reduce download
times, a single stream is already a good start. There are other
refinements we need to add as well, such as changing clocks to use the
fastest gear. I'd like to proceed with baby steps...
