Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E902613D617
	for <linux-sound@vger.kernel.org>; Thu, 13 Jun 2024 11:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718277038; cv=none; b=T3awvXG6EDenYA8ckDsRvPdiQ9w7Wj0GoYS39M8vKLoGu7zLP/Hm5075jpbnELbn7GMOcE/ZRhRhUmJTwwqbHgLDNTtrwqaifGm+Qbn87dv7ghJxluFXo8O3uIyRIlT/kTePuoPVfyWn6FmZgyZIdbhk4NPYBPomLIgDCN1JK98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718277038; c=relaxed/simple;
	bh=7uq/Fw+OV5n0LPS9W3NvyyAT4Rlpf4BZ9H0W/4B5Evg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fpFg/TesJcRAiTAKh2tHgnYRcu3sXXNhkKUuckPhrDRMOIKIEirHOnk1KfAKdZHeXPFQRp4/1mQ/LBZxvsayJSLZ1u2j2lBZU3fwp0cUo6ULDM/ZPpg/LfWveVKg0z6tP/XekuU05M9wzxM85gCG1UqnFGj67+wedVIEcBJqF4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=grAffJG7; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="grAffJG7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718277037; x=1749813037;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=7uq/Fw+OV5n0LPS9W3NvyyAT4Rlpf4BZ9H0W/4B5Evg=;
  b=grAffJG7+XyBpB9+refGoqc2b2Aah6fGkcvm4obAdHzjre7ZNqBHx94s
   wLRKXiAGQFTWSnyuuf5YC25XcoX1K/6LApEJUDNnXuduhgljXW3ikzmG7
   Ix4fhBg1WsA7FID1WUIi1JzI5mtrNwOQAOigJC+KW/kfxPHkgwgM0qU4S
   xiXivgL0Dpez+3Sz6BvS6dVipn0oBo3akss4KR+aoPYUc/b4mPJFc9KDP
   uxL1+PnXy1XuXD9koOV29e13skitkGaltRPUpyP61uvE1mPFZ/UJA6c6Z
   VKdnm9dyi0uU3iiGbAc8rjiZfvc3fB1fOF6i5ha+jErsvHbp1zLaiL7/g
   g==;
X-CSE-ConnectionGUID: BQkZZ2a1SGSf46YQpOzM+Q==
X-CSE-MsgGUID: 6FwfjqZIRMS3LRdtDeY6Bg==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="25766215"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="25766215"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 04:10:36 -0700
X-CSE-ConnectionGUID: ErkRo2aIQ/OhwWGzmTLeQg==
X-CSE-MsgGUID: UhJkB7AASbi4PeMY5deyPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="40746649"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.34]) ([10.245.244.34])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 04:10:35 -0700
Message-ID: <0fdbae0e-e540-4c35-a555-5b2607526115@linux.intel.com>
Date: Thu, 13 Jun 2024 14:11:02 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: topology: Fix route memory corruption
To: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai
 <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
References: <20240613090126.841189-1-amadeuszx.slawinski@linux.intel.com>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Content-Language: en-US
In-Reply-To: <20240613090126.841189-1-amadeuszx.slawinski@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 13/06/2024 12:01, Amadeusz Sławiński wrote:
> It was reported that recent fix for memory corruption during topology
> load, causes corruption in other cases. Instead of being overeager with
> checking topology, assume that it is properly formatted and just
> duplicate strings.

Reviewed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

> Reported-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Closes: https://lore.kernel.org/linux-sound/171812236450.201359.3019210915105428447.b4-ty@kernel.org/T/#m8c4bd5abf453960fde6f826c4b7f84881da63e9d
> Suggested-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> ---
>  sound/soc/soc-topology.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
> index 0225bc5fc425a..4b166294602fa 100644
> --- a/sound/soc/soc-topology.c
> +++ b/sound/soc/soc-topology.c
> @@ -1052,21 +1052,15 @@ static int soc_tplg_dapm_graph_elems_load(struct soc_tplg *tplg,
>  			break;
>  		}
>  
> -		route->source = devm_kmemdup(tplg->dev, elem->source,
> -					     min(strlen(elem->source), maxlen),
> -					     GFP_KERNEL);
> -		route->sink = devm_kmemdup(tplg->dev, elem->sink,
> -					   min(strlen(elem->sink), maxlen),
> -					   GFP_KERNEL);
> +		route->source = devm_kstrdup(tplg->dev, elem->source, GFP_KERNEL);
> +		route->sink = devm_kstrdup(tplg->dev, elem->sink, GFP_KERNEL);
>  		if (!route->source || !route->sink) {
>  			ret = -ENOMEM;
>  			break;
>  		}
>  
>  		if (strnlen(elem->control, maxlen) != 0) {
> -			route->control = devm_kmemdup(tplg->dev, elem->control,
> -						      min(strlen(elem->control), maxlen),
> -						      GFP_KERNEL);
> +			route->control = devm_kstrdup(tplg->dev, elem->control, GFP_KERNEL);
>  			if (!route->control) {
>  				ret = -ENOMEM;
>  				break;

-- 
Péter
