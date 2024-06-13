Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D6513776C
	for <linux-sound@vger.kernel.org>; Thu, 13 Jun 2024 06:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718261041; cv=none; b=cKoYhhjwXlohb+JCzhcoZm3a55t7YA1lKdD2j4UDLyYLAtCaNDKuQ1XxM9VugIrzXaaTEDExqNa04zbEInUuz8IGawg62T+FnXFpWOZDa1vvBhq7J2RrvC1Qk7HmAgarTkyYigZvtFYhJEBIAp7xjE0EasnftEepV8VlV6I2QW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718261041; c=relaxed/simple;
	bh=QII0FQ1S2p0/yi3wPnSF0V5lrlhJhtdgmNN5E84gNO8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=EfsX7zhNZtPsDa5u1835p/UhjWT+JbV8Ul9tL9l4u2lQ6BRJCBhd7oPTdpmGRXmlP+nU/MJr+Vh9SNIJmXUUWNKdooVe1Mn1TrMvXV/pZVrXnHW8D0b3UPayTH1WrSq6jAJhnAoO/chHgdxuvkScYxLomKZlAs4L93R8XyqNAlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AtCihwKO; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AtCihwKO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718261040; x=1749797040;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=QII0FQ1S2p0/yi3wPnSF0V5lrlhJhtdgmNN5E84gNO8=;
  b=AtCihwKOh8JI7MD9khketJ0B68hE0dYLHGzm/vkI1X/6Gn/+qLjspjho
   cFIaQ89AoTphTRjsF9ADvPLoe1dODdhhYMzIfFQOH4keGSX2fblNA2Hql
   vf8o9KR7JWyRH9Z/lM+izfyGKdqrXvlwuugcUmRbDyQBVEKeYJz58Nbo4
   bfvzUk7RatIGRxr1JEM4zAJnXH/WQhMckcHmOTvoAvc4NUApXRi4zJ6t4
   q9G+dlyLxKfOlVFRvUklpWHk/KQ5hnQWEKcbjEjEu1vnNoEjaePwYnKRd
   YKmYXWnA0pn8QBNpV9Onfq6sfEyLHb/cEBAY6alFzVEs3XlhsUbKXfa9m
   g==;
X-CSE-ConnectionGUID: V6aPACEOReWAwO+fXvNVTQ==
X-CSE-MsgGUID: Jw9gf1poTN++rAMF4hzA7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="18916403"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="18916403"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 23:43:59 -0700
X-CSE-ConnectionGUID: MeyNwwcNTqG9JYIeP2u0Ww==
X-CSE-MsgGUID: F2L/aATNRA2Al5HpJQq4Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="44424948"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.34]) ([10.245.244.34])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 23:43:57 -0700
Message-ID: <750f8ab4-f283-44e0-9b6c-57176bdbf59e@linux.intel.com>
Date: Thu, 13 Jun 2024 09:44:26 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] ASoC: topology: Fix references to freed memory
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 Jason Montleon <jmontleo@redhat.com>
References: <20240603102818.36165-1-amadeuszx.slawinski@linux.intel.com>
 <20240603102818.36165-2-amadeuszx.slawinski@linux.intel.com>
 <507e9f6a-7113-4781-8a6d-27e4b87dbe24@linux.intel.com>
 <5bdae438-a976-44c0-b6d3-1aab5167a68e@linux.intel.com>
 <38d7b3e2-33cb-4a81-bad8-73c22679f49f@linux.intel.com>
Content-Language: en-US
In-Reply-To: <38d7b3e2-33cb-4a81-bad8-73c22679f49f@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 13/06/2024 09:29, Péter Ujfalusi wrote:
>>>> +		route->sink = devm_kmemdup(tplg->dev, elem->sink,
>>>> +					   min(strlen(elem->sink), SNDRV_CTL_ELEM_ID_NAME_MAXLEN),
>>
>> Initially I did not see why this breaks, but then:
>>
>> The strlen() function calculates the length of the string pointed to by
>> s, excluding the terminating null byte ('\0').
>>
>> Likely the fix is as simple as:
>> min(strlen(elem->sink) + 1, SNDRV_CTL_ELEM_ID_NAME_MAXLEN)
> 
> or better yet:
> route->sink = devm_kasprintf(tplg->dev, GFP_KERNEL, "%s", elem->sink);

or even better:
route->sink = devm_kstrdup(tplg->dev, elem->sink, GFP_KERNEL);

-- 
Péter
