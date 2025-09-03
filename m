Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABDD2EA14A
	for <linux-sound@vger.kernel.org>; Wed,  3 Sep 2025 11:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756897364; cv=none; b=N9xzbmOQI5mNDpIybPN6Vl55arN1DWr+ihAzKADVLEnxPnK4B/SM0jHBPrwqymP7Npru1Y8RqKXxyeMR4yVzDpzqfxvnOnH3Gn0KUrxflgGPiHrcNJ0VfCHB7nkY2aXoZI1xZRCL1uiYelMnaIFKiQDSU60N/L5Mj0JwWtK1Q6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756897364; c=relaxed/simple;
	bh=34hEZV7N1ziFUgW+/FnL8RnkEjqzCOf3XpT+3kC3pbg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nVheCUIrjkzkEvD3ChDaHNhSd4k7GkY5Qk5cnriCPoulhjErHml4xUeZHObEmckMmlZuCaJD8wdHLiQ5J12b3nAqYwKkQM3WLAQ2YY1WwX6RWU2YaTX46+TeaCL7DnJexxmHz5w1UAVVaaJpdsvB+5jsZ2pXmVxVNaiin3m8Mj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I5p2/y8c; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I5p2/y8c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756897363; x=1788433363;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=34hEZV7N1ziFUgW+/FnL8RnkEjqzCOf3XpT+3kC3pbg=;
  b=I5p2/y8c+HgzNlVsZlbHDNxcQ1IcS7ORuTf9NZKsSK8ccK2pnkpPtdwn
   AOZdxK1mcCt1tguZls/79QsxjErkyNEyuITeFX0hdoJ2UeQi3AqtYU8Uj
   iwli50BhfhFH7IqeUBHNzQZCqCW7EsdzuFnccqkKqieaQf4I0lsLeqHVs
   /BSl0GtKFKpB7WTV+E1c96et4I2F6S2LSH/WI/3aaDfHZWklifG2ayCsC
   tZgUKpLDap5TcL9k7j7fU5W0mwHiAFf/c3i7AQuaqYBF/SjPmZWVih4Ep
   dJDPNzgYCgXr4ZV/zWvj/6Cx9LVsKIwuCEVJXNLRG78rM2vnQCISjh1fb
   A==;
X-CSE-ConnectionGUID: 5ccLY2PfQkmNq8Sy0UII6g==
X-CSE-MsgGUID: xaAmb/ECQHCo6ck5TZl4eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="70584083"
X-IronPort-AV: E=Sophos;i="6.18,235,1751266800"; 
   d="scan'208";a="70584083"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 04:02:42 -0700
X-CSE-ConnectionGUID: ndAfCAvHRm2fpAwIXsJLQw==
X-CSE-MsgGUID: 9sozycEpSTe6Pcurc1GihA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,235,1751266800"; 
   d="scan'208";a="202513475"
Received: from sbockowx-mobl2.ger.corp.intel.com (HELO [10.94.8.84]) ([10.94.8.84])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 04:02:39 -0700
Message-ID: <44bef157-1582-4b7c-b3cc-aa4511477418@linux.intel.com>
Date: Wed, 3 Sep 2025 13:02:24 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/17] ASoC: Intel: avs: Adjust platform names
To: Mark Brown <broonie@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, nathan@kernel.org,
 linux-sound@vger.kernel.org
References: <20250902094853.1231842-1-cezary.rojewski@intel.com>
 <112981f8-9828-409d-8015-1b1fcd390343@sirena.org.uk>
Content-Language: en-US
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <112981f8-9828-409d-8015-1b1fcd390343@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025-09-03 12:58, Mark Brown wrote:
> On Tue, Sep 02, 2025 at 11:48:36AM +0200, Cezary Rojewski wrote:
>> This series is a direct follow up to the recent
>> machine-board-registration changes [1]. Initially, a number of smaller
>> patchsets were part of a bigger block of changes. My attempt to split
>> them up to make the review easier was unfortunately not successful [2].
> 
> Amadeusz, are you OK with these changes?

Yes, I'm fine with them.

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
