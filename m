Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63D4A55
	for <linux-sound@vger.kernel.org>; Sat, 23 Mar 2024 01:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711158149; cv=none; b=G+RWeDK8P/bsVn+WG2G3Arn/5CuQ8f67SmJx8Xqemc9EDUGamo00eReVNG1sWv/5p5utCUjNS+v3ETGQS6L/FbFaL6YO/pxbIKGAuIsup13+zy64iTMAsYtnET/0+D0ud7w1yvcVE2yfdVHbDqVBKPSCxBAeDfeeWHFc8FueVto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711158149; c=relaxed/simple;
	bh=PkbywcFQ22gRuuNKCjqZGZXkxAfXTrgx32KNdC4qoyk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G6Qj82WfshN/ld59C9gifc3+eNoEHLDYogkC82YtveY5vmxxn8KvGjTG7V8Mo3gwzrujv9sRkEYzZ5XC16S5SsFvri4acPHmao9w/XNnUvK8q8bBVgjLQDr0O8LSmXglSwMn0ywewtXOns/ZG+tVsbUmaeq3lhk5GyyYfQ31c9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fWmKCAlF; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fWmKCAlF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711158148; x=1742694148;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=PkbywcFQ22gRuuNKCjqZGZXkxAfXTrgx32KNdC4qoyk=;
  b=fWmKCAlFlDJZ1RW/2cDBKqv9mGbJpoyhgbmofj8qXv4v6QE1//RTwtAB
   ZIHXdhU5dlJRI9YDsA8O+UDJSrcTbjjVlD6Itl11yoc6NhfUKiztGQuIi
   YpOYrK60XbhGy3wk7HWwHbzmzRb0I1Im9cHJECl8e7m0ipniFheIx5uYc
   2YGrObqQn/w2pAIEGrKcfTqVAqSkp0t9OELgn11NBKr9GA51PPeItFgII
   9qlHpWp9V9858VKiDI0ngKlxLY/VxiaV/n9PohGyCf8qbbvPL4ekJY95c
   vfMUfwCYDLYksv6gLo9xCswuMkmN16tZJ957SGqMd2LpcUVCtjF5xlduw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="6434631"
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; 
   d="scan'208";a="6434631"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 18:42:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; 
   d="scan'208";a="19636616"
Received: from ajbawden-mobl1.amr.corp.intel.com (HELO [10.212.109.118]) ([10.212.109.118])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 18:42:27 -0700
Message-ID: <473a0261-737e-4e80-ba63-47bce99894bf@linux.intel.com>
Date: Fri, 22 Mar 2024 20:42:26 -0500
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] ASoC: Intel: Disable route checks for Skylake
 boards
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, tiwai@suse.com,
 perex@perex.cz, amadeuszx.slawinski@linux.intel.com, hdegoede@redhat.com
References: <20240308090502.2136760-1-cezary.rojewski@intel.com>
 <20240308090502.2136760-2-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240308090502.2136760-2-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/8/24 03:04, Cezary Rojewski wrote:
> Topology files that are propagated to the world and utilized by the
> skylake-driver carry shortcomings in their SectionGraphs.
> 
> Since commit daa480bde6b3 ("ASoC: soc-core: tidyup for
> snd_soc_dapm_add_routes()") route checks are no longer permissive. Probe
> failures for Intel boards have been partially addressed by commit
> a22ae72b86a4 ("ASoC: soc-core: disable route checks for legacy devices")
> and its follow up but only skl_nau88l25_ssm4567.c is patched. Fix the
> problem for the rest of the boards.
> 
> Link: https://lore.kernel.org/all/20200309192744.18380-1-pierre-louis.bossart@linux.intel.com/
> Fixes: daa480bde6b3 ("ASoC: soc-core: tidyup for snd_soc_dapm_add_routes()")
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
