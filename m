Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD74381B8
	for <linux-sound@vger.kernel.org>; Tue, 19 Dec 2023 17:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TRte6uDS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703005704; x=1734541704;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=/wQo6ICqc15Zh13giXF+Imb5Y6zr40bNbquSO4cg7VU=;
  b=TRte6uDSs7zUS3gAakXF0btmsR2xFOB5B20XxveVC5wAFR/SPATcEJMU
   y4abS22huV2Y6SmNh0g19IaWIrXegJHte9YSbpn5DGxB6Cxd2SXjQdY90
   e01+scf+HfyREEUMFbhJRKnK1nJJq61Q2AyHTsu04qgiIOzir2hgLIXdh
   dOjUrHK0Z0Xs7yogiXHiWc8u7aMYA9/ccCf5Csu625k7HGXXrKZR2kMA+
   0IJ7v1+uLdGHYxQNI6UFFlH7HMhjNAiurSgNa11D09rGFpO+yBAqIL5IE
   9kHO/ktVax6npv+R4lAMAarSydlqbPk9/feN/ponjYU2RUJyWWz6sLd+6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="2921380"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; 
   d="scan'208";a="2921380"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 09:08:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; 
   d="scan'208";a="17669304"
Received: from hierlema-mobl.ger.corp.intel.com (HELO [10.252.34.230]) ([10.252.34.230])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 09:08:18 -0800
Message-ID: <f24a2a89-3d8a-4a6d-849a-cddbae4c1e03@linux.intel.com>
Date: Tue, 19 Dec 2023 18:08:15 +0100
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
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 vinod.koul@intel.com, Bard liao <yung-chuan.liao@linux.intel.com>,
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
 <38d0c1c9-d60c-4ddd-b2ee-091d1717a377@sirena.org.uk>
 <5b8e74ad-460f-4e68-a17b-3131d810f29b@linux.intel.com>
 <ZXOPWRWvrRddOWpT@finisterre.sirena.org.uk>
 <700e564d-7e87-463a-a764-c4713ddf11cd@linux.intel.com>
 <bec481f0-5361-4090-b69c-1123f83ac8ac@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <bec481f0-5361-4090-b69c-1123f83ac8ac@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/19/23 17:53, Mark Brown wrote:
> On Tue, Dec 19, 2023 at 05:50:30PM +0100, Pierre-Louis Bossart wrote:
> 
>>> grep for regmap_.*async - cs_dsp.c is the upstream example in a driver,
>>> or there's the rbtree cache sync code which uses a back door to go into
>>> an async mode.  Basically just variants of all the normal regmap I/O
>>> calls with a _complete() call you can use to wait for everything to
>>> happen.  The implementation is a bit heavyweight since it was written to
>>> work with fairly slow buses.
> 
>> I spent a fair amount of time this afternoon trying to understand the
>> regmap_async parts, and I am not following where in the code there is an
>> ordering requirement/enforcement between async and sync usages.
> 
> The only actual async implementation is SPI which processes things in
> order of submission, the sync API wraps the async API.
> 
>> Also is this just me spacing out or there is no regmap_raw_read_async()?
> 
> Right, there was never any need.

ok. I am starting to think that we could have a new type of regmap, say
"regmap-sdw-bra", where the use of write_raw_async() would rely on the
send/wait bus primitives, and write_raw() would fallback to the regular
read/write commands. We'd need a mutual exclusion to prevent parallel
async/sync access to the same regmap.

In other words, "memory" areas that are used for firmware downloads
would be moved to a different regmap with async capabilities and no
caching support.
