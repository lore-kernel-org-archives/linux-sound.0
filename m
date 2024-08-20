Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C483318E37F
	for <linux-sound@vger.kernel.org>; Tue, 20 Aug 2024 14:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724165922; cv=none; b=dNyXVRVWXfPLQS+sFUjwD/NojsbOx5meHcHFh65jhW6FfPbXRi6QnlkjDyRv3F+XCNy3dxiPSlLTLaZeswbqUHigGHYM6TWLBMf+vgMoE5Z0GecvoJxUQWJ5wK4JME2uG0dp4dM+NQ2zlvXKvd0umLaUaTJChiWxX2XsHFb+jHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724165922; c=relaxed/simple;
	bh=3nlRWUUx0+APZmAWni+foivbTUtkLG+44ynTv/C+yYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ed7r8ndwfnsyZ0j0Bhb6dM5T7CWgPas+IDdGLSY4nXtIO3NTSDhz/B+7hoQkfSvWZKc1Xe1RhAXAoXiAwLrQ6JfqbDts0zZeHXDw2OANAxL/E6dEjWibENaEfA0SjJ6wC0bPbHzDR5sik69QY72TT+2tFK7eXbnAF/VW+5uv3WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ApCAAKi/; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ApCAAKi/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724165921; x=1755701921;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=3nlRWUUx0+APZmAWni+foivbTUtkLG+44ynTv/C+yYk=;
  b=ApCAAKi/RM2G7YCsv14KBWZQiG8VXqthNGffBemzZSzkECUhqsh4A5hX
   2aPc/unEzjlOOwWjNZuVDKilLxxNLHVKXRQAUfh+OLIIcjiWWVHRdAGvY
   9+J/T81skf9WAdL6TxWDMOTqw/mabIz8t5OQYfXR6A05uPK3s95L9Pof1
   w6kLjzOszMgozZ2oGVCrJwYOgWFx7Y7pyNu+LtuMcB2yfzfPDlliXosZd
   8rvzs/nCe1s9a/nHlVQHvqPtV0jyS/2Tci9CTsX3mCnlSOHcck9buIb6L
   LiJYeom0RsemqDc12mX3J+jz3WI6h7va8wcifq3sBHZdBuLFokkHTfI1b
   A==;
X-CSE-ConnectionGUID: kEIA3++KTqmHSTzmUCrvdQ==
X-CSE-MsgGUID: LfoHl3AdTjqSzvE+Hxr18w==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22328658"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; 
   d="scan'208";a="22328658"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 07:58:40 -0700
X-CSE-ConnectionGUID: 03bGcDz6TpGOHvi9j1Qmvw==
X-CSE-MsgGUID: 4U8UvY+bR0qIOucEK51hSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; 
   d="scan'208";a="61064699"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO [10.245.246.176]) ([10.245.246.176])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 07:58:33 -0700
Message-ID: <fe930297-a6f6-43cb-86cf-d49939dc5090@linux.intel.com>
Date: Tue, 20 Aug 2024 16:58:30 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/16] Documentation: driver: add SoundWire BRA
 description
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
 <be277abb-af6c-470f-8237-17f45bd990b8@linux.intel.com>
 <09a5b041-62a8-4c85-9885-045079db796f@sirena.org.uk>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <09a5b041-62a8-4c85-9885-045079db796f@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/20/24 13:53, Mark Brown wrote:
> On Tue, Aug 20, 2024 at 09:48:05AM +0200, Pierre-Louis Bossart wrote:
> 
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
>> Do I get this right that these async capabilities could be used to
>> enable this faster SoundWire protocol, but the regular regmap_write()
>> could still happen in parallel with these async transfers? This could be
>> useful if e.g. there's a jack detection while downloading firmware for
>> another function.
> 
> As far as the regmap core is concerned, yes - with SPI we do wind up
> with ordering but that's because the SPI sync API is a thin wrapper
> around the SPI async API rather than anything regmap does.

ok. I am struggling a bit to adjust the plumbing that was obviously
defined for SPI.

The regmap async_write() doesn't have any wait, but there's a notifier
that needs to be called by *something* that waits. I think the SPI layer
has a set of kthreads but in our case we could just rely on a a
workqueue after 1ms or something and do the wait then for the DMAs to
complete and finally call the notifier to wake-up the regmap stuff.

>> The only thing that would need to be extended is that we'd need
>> additional callbacks to check if the protocol is supported on a given
>> hardware/firmware platform, and if there's no audio stream. In these
>> cases the async writes would be demoted to regular writes. Otherwise the
>> bus would be locked to make sure no reconfiguration takes place while
>> the firmware download happens, and unlocked when the transfer ends.
> 
> Those callbacks seem reasonable.  We already do the demotion to sync for
> buses that don't have async, it'd just need to be made dynamic.

sounds good.

