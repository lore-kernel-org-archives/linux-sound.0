Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39ADE481B0
	for <linux-sound@vger.kernel.org>; Wed, 20 Dec 2023 18:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="asQr9Z/L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703096794; x=1734632794;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=BlE59YgYyj+Kss6Xe1C7XI51igbB0E4yxLToN2uPzH4=;
  b=asQr9Z/LUEangM8yrlYabvHcakqla3YXDfmb/zQedXwQiOBAau4X60ME
   sX2bA1L5BrC7T57mRRowpwPRc4F9hwNPoQfxNLFxR26fGYUygXMkq+d//
   JszIgeBLOEsJRN2Hi/D5M7okvNcVeu+ygQl26WSamR/E5YBiy+aOWYXtZ
   NlV8+oDlIdg5iuynCqt2b7ouPUgNdNkQzJLNEOj1wlfjGZCyOYmkqZ8lR
   QCu9LAAWoEi9GfXMfyit5GyJQ/87PUM0JU5ghYcHZCZ/rqMtFmipuKmly
   gjgOaxcovAHFA8+Chh2SG8YE1If2sLVN1hhYjkkzPayXGF29PEpI08QQs
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="375344170"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="375344170"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 10:26:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="810689336"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="810689336"
Received: from amagnus-mobl2.ger.corp.intel.com (HELO [10.249.35.12]) ([10.249.35.12])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 10:26:27 -0800
Message-ID: <546d698c-3e23-4a92-9081-f1bebd6b33ae@linux.intel.com>
Date: Wed, 20 Dec 2023 19:26:24 +0100
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
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org,
 alsa-devel@alsa-project.org, tiwai@suse.de, vinod.koul@intel.com,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, srinivas.kandagatla@linaro.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 vijendar.mukunda@amd.com, Richard Fitzgerald <rf@opensource.cirrus.com>,
 Shuming Fan <shumingf@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 Oder Chiou <oder_chiou@realtek.com>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
 <20231207222944.663893-2-pierre-louis.bossart@linux.intel.com>
 <38d0c1c9-d60c-4ddd-b2ee-091d1717a377@sirena.org.uk>
 <5b8e74ad-460f-4e68-a17b-3131d810f29b@linux.intel.com>
 <ZXOPWRWvrRddOWpT@finisterre.sirena.org.uk>
 <700e564d-7e87-463a-a764-c4713ddf11cd@linux.intel.com>
 <bec481f0-5361-4090-b69c-1123f83ac8ac@sirena.org.uk>
 <f24a2a89-3d8a-4a6d-849a-cddbae4c1e03@linux.intel.com>
 <20231220151631.GD14858@ediswmail.ad.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20231220151631.GD14858@ediswmail.ad.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/20/23 16:16, Charles Keepax wrote:
> On Tue, Dec 19, 2023 at 06:08:15PM +0100, Pierre-Louis Bossart wrote:
>> On 12/19/23 17:53, Mark Brown wrote:
>>> On Tue, Dec 19, 2023 at 05:50:30PM +0100, Pierre-Louis Bossart wrote:
>>>>> grep for regmap_.*async - cs_dsp.c is the upstream example in a driver,
>>>>> or there's the rbtree cache sync code which uses a back door to go into
>>>>> an async mode.  Basically just variants of all the normal regmap I/O
>>>>> calls with a _complete() call you can use to wait for everything to
>>>>> happen.  The implementation is a bit heavyweight since it was written to
>>>>> work with fairly slow buses.
>>>
>>>> I spent a fair amount of time this afternoon trying to understand the
>>>> regmap_async parts, and I am not following where in the code there is an
>>>> ordering requirement/enforcement between async and sync usages.
>>>
>>> The only actual async implementation is SPI which processes things in
>>> order of submission, the sync API wraps the async API.
>>>
>>>> Also is this just me spacing out or there is no regmap_raw_read_async()?
>>>
>>> Right, there was never any need.
>>
>> ok. I am starting to think that we could have a new type of regmap, say
>> "regmap-sdw-bra", where the use of write_raw_async() would rely on the
>> send/wait bus primitives, and write_raw() would fallback to the regular
>> read/write commands. We'd need a mutual exclusion to prevent parallel
>> async/sync access to the same regmap.
>>
>> In other words, "memory" areas that are used for firmware downloads
>> would be moved to a different regmap with async capabilities and no
>> caching support.
> 
> I would be a little inclined to say leave adding a regmap for a
> follow up series, whether we add it to the existing regmap or add
> a new one, or whatever, it should all sit happily on top of the
> API being added in this series. Makes it a little more contained
> to focus on one area at a time, and leave this series as adding
> core support for BRA. But that said, if we really want to I don't
> feel mega strongly on this one.

Right, I was probably going too far down in the details for a December
20 post.

The point I was trying to make it seems there's consensus that regmap
with the async parts would be the API used by SoundWire/ASoC codecs, and
the regmap implementation would rely on the bus/host send/wait routines.

The regmap stuff will need joint work with codec driver folks so it
should indeed be done in a second step when the SoundWire bus/host parts
are available.

Put differently: is there any sustained objection to the proposal of
extending regmap with async BRA transfers?
