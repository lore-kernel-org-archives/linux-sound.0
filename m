Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7B618036
	for <linux-sound@vger.kernel.org>; Tue, 19 Dec 2023 12:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BJf7qCG8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702988839; x=1734524839;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=XjeWIz1mpH5jVwObJLbapYiqEsmu7EHDGU47gm/OWGM=;
  b=BJf7qCG8uqhfbvfBYB26fUfqrKCfCK9iGwTHVYRSkRJ3QawExRQZ9cXR
   S5PJ7HfeARBduIEwdtkDEQ8vvMr0f5N8hYQnxeSLzmP+3n3UOhBQLjrHX
   0WkDTQw+epL3r8vWK7L6K6jSK3F+/HlLjv5mM16faJaqgHSM1O4r4Xn9J
   pIrnCE+m8qaLJjo0A+teIM+jowIfKvxbhFmg+IlTwMkF8fGrYfvWhp22n
   LpDDBQ2iT56ElafG8Z8PueJ7ucI+ygE0f3AmafYqzaXZHo51wB/4dGucV
   ghssiOBLUpTZnIOQg3RY7IJUm2MQrigx9y77xxZd1Nk94NXeMhRDBt5yt
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="14338243"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; 
   d="scan'208";a="14338243"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 04:27:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="1107335187"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; 
   d="scan'208";a="1107335187"
Received: from hierlema-mobl.ger.corp.intel.com (HELO [10.252.34.230]) ([10.252.34.230])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 04:27:14 -0800
Message-ID: <884fa264-8d6b-4ac2-af57-b6fc07040361@linux.intel.com>
Date: Mon, 18 Dec 2023 17:44:15 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 07/16] soundwire: bus: add API for BPT protocol
Content-Language: en-US
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Vinod Koul <vkoul@kernel.org>, linux-sound@vger.kernel.org,
 alsa-devel@alsa-project.org, tiwai@suse.de, broonie@kernel.org,
 vinod.koul@intel.com, Bard liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, srinivas.kandagatla@linaro.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 vijendar.mukunda@amd.com, Richard Fitzgerald <rf@opensource.cirrus.com>,
 Shuming Fan <shumingf@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 Oder Chiou <oder_chiou@realtek.com>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
 <20231207222944.663893-8-pierre-louis.bossart@linux.intel.com>
 <ZYAy9ZM0o3uAk2qY@matsya>
 <4f66f792-79c0-4221-82b5-a0d9ec5a898b@linux.intel.com>
 <20231218145716.GA14858@ediswmail.ad.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20231218145716.GA14858@ediswmail.ad.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/18/23 08:57, Charles Keepax wrote:
> On Mon, Dec 18, 2023 at 02:12:36PM +0100, Pierre-Louis Bossart wrote:
>>> Is this a protocol requirement?
>>
>> No, it's an implementation requirement.
>>
>> We could move this to host-specific parts but then the codec drivers
>> will have to know about alignment requirements for each host they are
>> use with. IOW, it's more work for codec drivers if we don't have a
>> minimum bar for alignment requirement across all platforms.
>>
> 
> I do certainly see that side of the argument and it does probably
> warrant some thought as to how a slave might learn the alignment
> requirements. I guess maybe some sort of core helper function to
> return the alignment? Or putting it in properties the slave can
> access? One could even keep the check here, but just pull the
> value from something system specific.
> 
> The danger with putting it in the core is IMHO:
> 
> a) It rules out certain use-cases, generally I think its a bad
> idea if the framework design prohibits stuff the underlying bus
> could do because someone will, at some point, want to do it.

SoundWire has lots of fancy and borderline nebulous concepts, my take is
"let's do few things and do them well". We can always revisit new usages
later, for now my main objective is "speed up downloads".

> b) The core limit could get a bit out of hand once more
> controllers are added. The core limit needs to be a multiple of
> all the controller limits, if a controller comes along with a
> weird alignment requirement, that gets problematic fast.

I don't have any information on other controllers, but I wouldn't be
surprised if most of the quirks are due to peripheral limitations and
ambiguous interpretations of what 'ACK' means. I tried writing to
reserved parts of the memory or non-existent registers and nothing bad
was reported...
