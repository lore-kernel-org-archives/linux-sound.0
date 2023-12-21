Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB13627E0
	for <linux-sound@vger.kernel.org>; Thu, 21 Dec 2023 17:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ieFIXUZp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703179060; x=1734715060;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=CQ5BMEY01eCGDObN5YrAljWUIig88/OPg2GM4GEG430=;
  b=ieFIXUZpzWDZkkwyrsETKozNYatN+cuO6hnyR2UcHs/8rpHGFiA2tpPb
   MrGyIsAChwxQZ9Duo6Df3cBBGYljlZbdgDSltjOrXAe8K58X0Eld9OSUl
   Ja5oFsAdbrJaSLJ37PpEBd99F8vHziQ8jtVPU4c1kLph/9UdMCkKbL+t4
   lugxINI07j1zlgS3OaWM9bTTlzAa2B6mL6pmstTX2vkrEKEA0Dye0bGEI
   Tn1NqepMHR0esgxWfayDv2eguNikv9Sfl2M+l399Qf72Bx2nlGwtRYz2H
   evL+2HTfwV74/Xg26XTZA6ic8k2Pb1g8lZaBymjxwdfUVGa5lQXxAK4Jx
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="482190074"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="482190074"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 09:17:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="770011031"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="770011031"
Received: from wdangelo-mobl.ger.corp.intel.com (HELO [10.252.51.4]) ([10.252.51.4])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 09:17:32 -0800
Message-ID: <b3c3339d-978f-4ca0-8450-3c9756f191ed@linux.intel.com>
Date: Thu, 21 Dec 2023 18:09:40 +0100
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
 <87b3fc89-f967-4251-b709-0d439c6f1cf7@linux.intel.com>
 <ZYROLuFZNdwGHReR@matsya>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <ZYROLuFZNdwGHReR@matsya>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/21/23 15:39, Vinod Koul wrote:
> On 18-12-23, 14:20, Pierre-Louis Bossart wrote:
>>
>>
>> On 12/18/23 05:55, Vinod Koul wrote:
>>> On 07-12-23, 16:29, Pierre-Louis Bossart wrote:
>>>> Add a convenience pointer to the 'sdw_bus' structure. BPT is a
>>>> dedicated stream which will typically not be handled by DAIs or
>>>> dailinks. Since there's only one BPT stream per link, storing the
>>>> pointer at the link level seems rather natural.
>>>>
>>>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>>>> ---
>>>>  include/linux/soundwire/sdw.h | 2 ++
>>>>  1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
>>>> index e54c5bbd2b91..8db0cd7d0d89 100644
>>>> --- a/include/linux/soundwire/sdw.h
>>>> +++ b/include/linux/soundwire/sdw.h
>>>> @@ -965,6 +965,7 @@ struct sdw_master_ops {
>>>>   * @stream_refcount: number of streams currently using this bus
>>>>   * @btp_stream_refcount: number of BTP streams currently using this bus (should
>>>>   * be zero or one, multiple streams per link is not supported).
>>>> + * @bpt_stream: pointer stored for convenience.
>>>>   */
>>>>  struct sdw_bus {
>>>>  	struct device *dev;
>>>> @@ -996,6 +997,7 @@ struct sdw_bus {
>>>>  	int hw_sync_min_links;
>>>>  	int stream_refcount;
>>>>  	int bpt_stream_refcount;
>>>> +	struct sdw_stream_runtime *bpt_stream;
>>>
>>> So we are limiting to single stream? Can we have multiple transfers
>>> queued up, which I guess might imply multiple streams?
>>
>>
>> Yes for now there is a BTP/BRA single stream active when there are no
>> audio transfers taking place. This is the only way to guarantee
>> predictable download/resume times.
>>
>> There is no mechanism to queue up transfers, be it from the same
>> peripheral device or different ones. It would be up to the peripheral
>> driver to wait for the BTP stream to be available.
>>
>> Adding a queuing mechanism is a bridge too far for now, most platforms
>> only have 1 or 2 devices only, and a peripheral driver may or may not be
>> ok with delayed downloads. For now the main ask is to reduce download
>> times, a single stream is already a good start. There are other
>> refinements we need to add as well, such as changing clocks to use the
>> fastest gear. I'd like to proceed with baby steps...
> 
> Since the API is async in nature, I think it is very reasonable that we
> add the queue support (a simple list would do) and notify when the
> transfer is complete..

On paper queueing is nice/elegant.

In practice it's likely that there's a bit of configuration needed
before/after each download, e.g. restart the DSP.

It would also be an absolute horror to deal with error flow if one of
the queued transfers did not succeed.

I would be more than happy if we successfully enable a single transfer
across multiple platforms, and look at queueing as a optimization.

BTW even if there are multiple transfers queued, there's still only one
stream active at a given time.

