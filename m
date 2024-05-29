Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EDA13DDB2
	for <linux-sound@vger.kernel.org>; Wed, 29 May 2024 11:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716981571; cv=none; b=g0gguJbkE7gFXOfBsKkfk5lYpAQanOscufuMecQbpebSuN5HAdYEiCLdm+kbfgKp9xogspETy3kDCAHW4BYCaGzbtd5JhYENn91loLkG1B9X3ecBiZ5wE8QhRWFBzIwNVvL7oixiTF+2xbe3fPI0MeCXCkFST2jvERtQ6onkXUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716981571; c=relaxed/simple;
	bh=AjLvNySCb2aKO/sJ5GTC3L4wbtSsIrqljephCeZrSD8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=cenbb4bGnezvVg5vCvGd7dehft4Mr1IkzB6yCRH7ihu3NIRsakKZTC63kfX+8RaedSAGq3jsf0gn1V+ED1pd07jLGBF5+KPIUgLGU6kVzkVbMhq6Ll0dgV1lxzU9rihPUkim2xC/6+PArbYJZiXC5VfpD2q9+jrT+mfRCloZVpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jpHA5cfF; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jpHA5cfF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716981570; x=1748517570;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=AjLvNySCb2aKO/sJ5GTC3L4wbtSsIrqljephCeZrSD8=;
  b=jpHA5cfFyIlTDntuk+wO2XRHqTv2GiCdBR5+42WI62l6OZVYs3TjmGpc
   dk5yXJ2z1sz5j+26L3067Xle8CKsWruyG6yrPyRDYD/7P4I25ytjyHjkN
   I+3UdfpJ9+mpSQKlkTfjvzsVh0VUTSx826ZUBN29z8sZ/As0ApSwejYmP
   lZbhy2n2mNYD4ySNJ6D6bok3XCbgmZ7QXrf/A0/H97S2Rr8HKNmi2Onnq
   y9osnwNvRQaS80+xvJyJwn1R5QraP2vRd0N2aUzlmqthZ7kUri4befEtV
   AoiMdrCG6M3JeaCJj4iAz8u2LI7SHRcb8KSuLTWqnuCdERyh74OyxkGNf
   g==;
X-CSE-ConnectionGUID: vT5MmEiCQ4yUCZKP+XRIaw==
X-CSE-MsgGUID: bN4gMgxtSASYBf1NKLjlNA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="24510124"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; 
   d="scan'208";a="24510124"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 04:19:29 -0700
X-CSE-ConnectionGUID: PFHYczcVTpCL9rL08DY7Hw==
X-CSE-MsgGUID: rxeYOMyLSTKIDpoFFlR3Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; 
   d="scan'208";a="39839089"
Received: from unknown (HELO [10.124.223.77]) ([10.124.223.77])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 04:19:27 -0700
Message-ID: <d4c5e7a3-710b-4ff1-95a3-395dd780fed3@linux.intel.com>
Date: Wed, 29 May 2024 14:19:37 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: SOF: ipc4-topology: Add support for NHLT with
 16-bit only DMIC blob
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com,
 seppo.ingalsuo@linux.intel.com
References: <20240516075611.18018-1-peter.ujfalusi@linux.intel.com>
Content-Language: en-US
In-Reply-To: <20240516075611.18018-1-peter.ujfalusi@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Mark,

On 16/05/2024 10:56, Peter Ujfalusi wrote:
> The ACPI NHLT table always had 32-bit DMIC blob even if 16-bit was also
> present and taken as a 'rule' which obviously got broken and there is at
> least one device on the market which ships with only 16-bit DMIC
> configuration blob.
> This corner case has never been supported and it is going to need topology
> updates for DMIC copier to support multiple formats.
> 
> As for the kernel side: if the copier supports multiple formats and the
> preferred 32-bit DMIC blob is not found then we will try to get a 16-bit
> DMIC configuration and look for a 16-bit copier config.

Please ignore this patch, I will send it again along with few more patch
building on this to close the gaps with the logic of selecting the NHLT
blob.

> Fixes: f9209644ae76 ("ASoC: SOF: ipc4-topology: Correct DAI copier config and NHLT blob request")
> Link: https://github.com/thesofproject/linux/issues/4973
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Reviewed-by: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> ---
>  sound/soc/sof/ipc4-topology.c | 25 ++++++++++++++++++++++---
>  1 file changed, 22 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
> index beff10989324..521b4dcba601 100644
> --- a/sound/soc/sof/ipc4-topology.c
> +++ b/sound/soc/sof/ipc4-topology.c
> @@ -1483,6 +1483,8 @@ snd_sof_get_nhlt_endpoint_data(struct snd_sof_dev *sdev, struct snd_sof_dai *dai
>  					   dir, dev_type);
>  
>  	if (!cfg) {
> +		bool get_new_blob = false;
> +
>  		if (format_change) {
>  			/*
>  			 * The 32-bit blob was not found in NHLT table, try to
> @@ -1490,7 +1492,20 @@ snd_sof_get_nhlt_endpoint_data(struct snd_sof_dev *sdev, struct snd_sof_dai *dai
>  			 */
>  			bit_depth = params_width(params);
>  			format_change = false;
> +			get_new_blob = true;
> +		} else if (linktype == SOF_DAI_INTEL_DMIC && !single_format) {
> +			/*
> +			 * The requested 32-bit blob (no format change for the
> +			 * blob request) was not found in NHLT table, try to
> +			 * look for 16-bit blob if the copier supports multiple
> +			 * formats
> +			 */
> +			bit_depth = 16;
> +			format_change = true;
> +			get_new_blob = true;
> +		}
>  
> +		if (get_new_blob) {
>  			cfg = intel_nhlt_get_endpoint_blob(sdev->dev, ipc4_data->nhlt,
>  							   dai_index, nhlt_type,
>  							   bit_depth, bit_depth,
> @@ -1513,8 +1528,8 @@ snd_sof_get_nhlt_endpoint_data(struct snd_sof_dev *sdev, struct snd_sof_dai *dai
>  
>  	if (format_change) {
>  		/*
> -		 * Update the params to reflect that we have loaded 32-bit blob
> -		 * instead of the 16-bit.
> +		 * Update the params to reflect that different blob was loaded
> +		 * instead of the requested bit depth (16 -> 32 or 32 -> 16).
>  		 * This information is going to be used by the caller to find
>  		 * matching copier format on the dai side.
>  		 */
> @@ -1522,7 +1537,11 @@ snd_sof_get_nhlt_endpoint_data(struct snd_sof_dev *sdev, struct snd_sof_dai *dai
>  
>  		m = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
>  		snd_mask_none(m);
> -		snd_mask_set_format(m, SNDRV_PCM_FORMAT_S32_LE);
> +		if (bit_depth == 16)
> +			snd_mask_set_format(m, SNDRV_PCM_FORMAT_S16_LE);
> +		else
> +			snd_mask_set_format(m, SNDRV_PCM_FORMAT_S32_LE);
> +
>  	}
>  
>  	return 0;

-- 
Péter
