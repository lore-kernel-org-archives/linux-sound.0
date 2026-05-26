Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3123DEADD
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 11:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779794876; cv=none; b=IFpVvD5urLzZmfxhPaSYNJOLDF09STWx8K97BIPa2HBHOox9wio/XdaLC+FfqtAQtWQ+rJh0LSffUOT8oO6y44LdYXu+T4oMi2til/Qm7ixRpXphDPeSkSVgYYLpS66Qv4kzffbespsNIJooHTqqI4W/FQW1sE6OfZK34CLd+oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779794876; c=relaxed/simple;
	bh=dPhayH+s3jk77gBqlAAl/jB3NUhRXiYbJNyz+yJhwF4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=PEvXHjskNKyEVstcQWHNAZEXaqNwh4BK7XGRrrmUz4arkqy9fbUiPjSltmDgldEr7+PQeMDlenn3flBsbBmxAhoMTPS2W7PAhixpt3P9Byv8IdiKLHkhydODHRUvGMj2IZ9IAzgKvlZgAC4P8oMKQPLf74k1OVmG1h2b64GFNKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L8I0fUKb; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L8I0fUKb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779794875; x=1811330875;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=dPhayH+s3jk77gBqlAAl/jB3NUhRXiYbJNyz+yJhwF4=;
  b=L8I0fUKbok3J1I1xhdEgW7OH71984FjCfxsHnvp0v4EfCQQn0hB14FJM
   A8MNCf2eqQwB6WEZ6pundeFvOUgAIIkBuqYLW7wvC8tuuWvuNMUgAPZCQ
   pMXiNJQwKbTrB6116yrO4fGp5CMFYjty+ZhBY6LGM3MeKJ3P81lULZTVe
   nc+VkWDuLi74CGmkwLZMdDlaz1HGYnYsGAThBSoxHG0Bvg/vmcRFW1Orh
   sWPvtckvXeFLpStIp/cAP+w26N/O/fkyKD+Bsr4f488kLikHkmrAry4qY
   r/stSwTHJeR8LEoMslG7Hd8nVTXdic4kxne7+L1/Lm2flE0F25GVQFo+9
   g==;
X-CSE-ConnectionGUID: 74hubM8mTyCEAA5oWnNU3A==
X-CSE-MsgGUID: xg/tjul5RV+GcjMafpcBNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="90905242"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="90905242"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 04:27:55 -0700
X-CSE-ConnectionGUID: DllnBCmgQFSi3FTNo7bXng==
X-CSE-MsgGUID: 9tKwhvo3TPGenKO6drYrdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="243724565"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO [10.245.244.49]) ([10.245.244.49])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 04:27:52 -0700
Message-ID: <10d5daa6-5ec2-4f46-a204-4df9f83b100c@linux.intel.com>
Date: Tue, 26 May 2026 14:28:03 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: core: Move all users to deferrable card binding
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.com,
 perex@perex.cz, amade@asmblr.net, kuninori.morimoto.gx@renesas.com,
 linux-sound@vger.kernel.org, "Liao, Bard" <bard.liao@intel.com>,
 "Vehmanen, Kai" <kai.vehmanen@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Simon Trimmer <simont@opensource.cirrus.com>
References: <20260430140752.766130-1-cezary.rojewski@intel.com>
 <01d1d642-bf24-4ef4-a30d-56884300407f@linux.intel.com>
 <5d8cbbfb-3884-4c6b-aea8-0c9a76964b3b@intel.com>
 <85045e51-e09b-44c2-9266-3e7ee72c4eb0@sirena.org.uk>
 <b5e82c43-9da1-4a12-af0e-90d4b9feef49@linux.intel.com>
 <d82fa24d-18f9-461d-8535-3266cc92fbb9@sirena.org.uk>
 <1daaad8d-8aee-4911-a24b-26db8b694cfd@linux.intel.com>
 <e6c5e5e0-69f1-4fdc-b7be-f6372e507b37@linux.intel.com>
Content-Language: en-US
In-Reply-To: <e6c5e5e0-69f1-4fdc-b7be-f6372e507b37@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 26/05/2026 14:21, Péter Ujfalusi wrote:
> On 26/05/2026 08:45, Péter Ujfalusi wrote:
>> I also think that detaching from driver defer and use internal card
>> defer is a much better approach, but when majority of new PTL designs
>> will be broken with no patch in sight to prepare the SDCA class stack is
>> a regression.
>>
>> Charles, Bard, Richard, Simon, any thoughts on this?
> 
> I can force the sof_sdw driver to go back to driver defer queue if any of
> the expected (counted for) components yet to be registered, but I'm sure
> this has side-effects...

Yes, this defeats the purpose of the deferrable card concept.

> 
> diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
> index 9d0768f21ba4..e80c3904bc37 100644
> --- a/sound/soc/sdw_utils/soc_sdw_utils.c
> +++ b/sound/soc/sdw_utils/soc_sdw_utils.c
> @@ -2022,6 +2022,7 @@ int asoc_sdw_parse_sdw_endpoints(struct snd_soc_card *card,
>  					soc_aux->dlc.name = component->name;
>  				} else {
>  					soc_aux->dlc.name = codec_info->auxs[j].codec_name;
> +					return -EPROBE_DEFER;
>  				}
>  				soc_aux++;
>  			}
> 
>  
> 

-- 
Péter

