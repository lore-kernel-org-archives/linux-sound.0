Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569B028EB
	for <linux-sound@vger.kernel.org>; Fri, 11 Oct 2024 10:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728642141; cv=none; b=Lv1lGql2glXf/6mxpB0q//wEIAcV0Xpe+gV6Z77IFNNk1QgIBJAX3hyZfIaNP4iPJ7McRtn+rGuq9HIcQtsKkikOX+08QHvXp1lJmiCNf3xJP7d5YpZiDcBuFJhJrwABOxOWccphqHrgU/LDSSmd1fpSLc4TtR5NI6PrM8+q7Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728642141; c=relaxed/simple;
	bh=g+8WUo+uDgm7chkc1YGCN7aZ+6WIVWAohA9OkgUaKZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oJspMpZxc2vDDSx6ut4F6465/26OXqsRiab/lynR5Yr/ps7GBLguPqTsYy9CvbO8Cnl+Ji3TWjiFtdMiRmX+Qh+f2EfJCn6cFDMnS4kHSFHTF27sfq+0gkW9CGfoR/mHpTqh/NQGzBpuLCx8x6x0mU8ac+TvGVsDn8rHjfBCNBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RFuVrLrP; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RFuVrLrP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728642139; x=1760178139;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=g+8WUo+uDgm7chkc1YGCN7aZ+6WIVWAohA9OkgUaKZg=;
  b=RFuVrLrPi4hxgDW2P4lBnOdGec8QN5RqfQEjn3Oi4jUej8XFeM6/4H8k
   PPaGQ+Uf2est3gWdsJEdIZunNmUM8flGNOvIZz3MYNwpmq0kuUpuRnxJ0
   Vm/JNBYeplyPpOHonzCxnPvyQbPzZqipiPCB1nakrU9bKi8jOoMQ1YwQm
   ex3IVKOFeYu7rCCmycgb+znLfA70qEbq5WfymaBY8WKKRjTEIIq8hAQXX
   ItFhJh9zPYdifOMj/poitCjgMBrlkwNeTg3Jhez7nFAxqMC9n9YtYOWxU
   SxPg5PQTysKRKRJ0rYaNWNJdIlwV8g7fFU5JREeF7ZPnS3Gik3E/uOav/
   A==;
X-CSE-ConnectionGUID: LOZ/DvyXTaeXFwqkruPiHg==
X-CSE-MsgGUID: +7VqOepAQBugj1NplnzFWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="38618668"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="38618668"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 03:22:19 -0700
X-CSE-ConnectionGUID: hr2TErQYTYqOeZZ7fMm4qQ==
X-CSE-MsgGUID: h9uHU2LpTfWqj+3Nxa7liQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="77172306"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53]) ([10.94.0.53])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 03:22:17 -0700
Message-ID: <d7e02acb-fee1-4d17-94c6-96b07f4938c4@linux.intel.com>
Date: Fri, 11 Oct 2024 12:22:14 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: Intel: avs: Fix return status of
 avs_pcm_hw_constraints_init()
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai
 <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 linux-sound@vger.kernel.org
References: <20241010112008.545526-1-amadeuszx.slawinski@linux.intel.com>
 <172864164240.3853572.8328107515251289485.b4-ty@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <172864164240.3853572.8328107515251289485.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/11/2024 12:14 PM, Mark Brown wrote:
> On Thu, 10 Oct 2024 13:20:08 +0200, Amadeusz Sławiński wrote:
>> Check for return code from avs_pcm_hw_constraints_init() in
>> avs_dai_fe_startup() only checks if value is different from 0. Currently
>> function can return positive value, change it to return 0 on success.
>>
>> Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
>> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
>> --
>>
>> [...]
> 
> Applied to
> 
>     https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> 

Seems like I've messed this one a bit, additional comment should've been 
below '---' instead of '--', as it is now part of patch in tree, should 
I resend?
