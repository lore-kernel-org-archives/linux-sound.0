Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213EC36AEA
	for <linux-sound@vger.kernel.org>; Tue, 19 Dec 2023 16:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PQnneuqI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703004641; x=1734540641;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=o/k8w+KwAgcQoxX0YyOLJxZiQxvyrpoQFrxkS7/kYkc=;
  b=PQnneuqI8uAt847flFT7BVdlTwbMHlEAOTC2ParFvcX0as2G3hq2pUvk
   OINf8+FZydSZ7RfEcRWQD7E58BjFGcht36Qzz0LdiGjGssKPFIfW6aw1U
   fh9kxxRpM+SqQPKveMiq3Sb9TY4Xi0ZAy/EKTdFY3Z/qG++E2l4UIHpkN
   xZI/5RTjbrUr8LlxCJjPEIg0rOOVJ6j21Si1gXIn06rphqR4iCmQfYGSX
   y1zwUDSQvoOseyxl+j902f4/cJbin4FnEG6dgJepSC2vWWdwxX/p5TXBo
   lOw5bPZfy3anmfDSZIf+ymUm/W4uy0dynboA6YyVLWzFeRMt/OBGFe7Xc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="399518882"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; 
   d="scan'208";a="399518882"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 08:50:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="949224088"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; 
   d="scan'208";a="949224088"
Received: from hierlema-mobl.ger.corp.intel.com (HELO [10.252.34.230]) ([10.252.34.230])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 08:50:33 -0800
Message-ID: <700e564d-7e87-463a-a764-c4713ddf11cd@linux.intel.com>
Date: Tue, 19 Dec 2023 17:50:30 +0100
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
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <ZXOPWRWvrRddOWpT@finisterre.sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



>>> This feels a lot like it could map onto the regmap async interface, it
>>> would need a bit of a rework (mainly that currently they provide
>>> ordering guarantees with respect to both each other and sync I/O) but
>>> those could be removed with some care) but it's got the "here's a list
>>> of I/O, here's another call to ensure it's all actually happened" thing.
>>> It sounds very much like how I was thinking of the async API when I was
>>> writing it and the initial users.
> 
>>> It's this bit that really got me thinking it could fit well into regmap.
> 
>> I really don't know anything about this async interface, if you have
>> pointers on existing examples I am all ears....I am not aware of any
>> Intel platform or codec used on an Intel platform making use of this API.
> 
> grep for regmap_.*async - cs_dsp.c is the upstream example in a driver,
> or there's the rbtree cache sync code which uses a back door to go into
> an async mode.  Basically just variants of all the normal regmap I/O
> calls with a _complete() call you can use to wait for everything to
> happen.  The implementation is a bit heavyweight since it was written to
> work with fairly slow buses.

I spent a fair amount of time this afternoon trying to understand the
regmap_async parts, and I am not following where in the code there is an
ordering requirement/enforcement between async and sync usages.

I do see this comment in the code

 * @async_write: Write operation which completes asynchronously,
optional and must serialise with respect to non-async I/O.

But that 'must' is a requirement on the codec side, isn't it?

When using regmap_raw_write_async(), the lock is released immediately. I
don't see anything at the regmap level that would prevent a codec driver
from using regmap_raw_write() immediately.

That's probably a violation of the API to do so, but it's the same
problem I was referring earlier in the conversation where 'regular'
read/writes cannot happen in parallel with BTP/BRA transactions.

Also is this just me spacing out or there is no regmap_raw_read_async()?

