Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF9C220F5E
	for <linux-sound@vger.kernel.org>; Tue, 21 Oct 2025 06:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761028120; cv=none; b=lQSkPR+ZaAo7vfRemUhyGOuHODtIecGQ0/hZdm1OHLee4R8j4ZKyOqKC+vA+oVWQwPiLZsgPIkRX2p0UwH40oVb3k3D8dBhTsOFNGqIQ2kGLbxBqQ/szlqGNj4J7ovvYs+ekpxdEXVS/7UxCVPXANHOocm0hk5QeVbykAIK/ZT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761028120; c=relaxed/simple;
	bh=7ZT5+/3pyK91GJFrcF5ExafDCugXS/qOHYOtKxtUsJc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=kY4I8/0ZjGCaOb23pRXsXMZfwg5KjoEAw514S13RfnD2VfEb5R6qZ+OoRqB8PVgAi+1K/Ykj2B2RMBaOwgzyr69VCAaxcb5Dle7PJYMgocxamp9Zty4+cJnbp9PaHt1bHj2NGXqNeKyCkm+NPT+pKIE0oUCpIgenBYKzRtEix2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pjso2CWE; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pjso2CWE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761028118; x=1792564118;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=7ZT5+/3pyK91GJFrcF5ExafDCugXS/qOHYOtKxtUsJc=;
  b=Pjso2CWEH0BEOhJkOTgVgjdv853ajzqrDEAEYZYA546qeUyfoN1lN6hT
   sY+dFU+2ZzbO++YWAkuy2dVgQXGSsh3TffH6dlx1qKtzKYbHPdiajLpyY
   o/xmAEEXSdbqR5J/p6K5rUvp1oV3as4qUhL3O6xdv93VXCGPc9tp6pSr9
   YFQACyd5klsecPcCRNRi3kUs1KcZDQXNOXtbHyvXZPrtPHWPDas+9lWYa
   tSpPVV7HkyUSM/FrMYQDgU37h2zgKKwv4MXByWBVBmlBkcbU2jmnegJLR
   IeN36gFyo9m27hIN9xsvNFm45t0kz1G/zsLlJpaDa0qnMJZ/F1O0JC1TH
   g==;
X-CSE-ConnectionGUID: VfYcz374Q+W/LUgQt0r4Vw==
X-CSE-MsgGUID: +FIoOYpxQhGm4dExzTMQ9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66981949"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="66981949"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 23:28:38 -0700
X-CSE-ConnectionGUID: PTEkKSSrTuqffG+f+XtvLw==
X-CSE-MsgGUID: D/8rDcP3QAOdQoN+08Mlnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; 
   d="scan'208";a="183537143"
Received: from ettammin-desk.ger.corp.intel.com (HELO [10.245.246.42]) ([10.245.246.42])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 23:28:35 -0700
Message-ID: <28e44e42-28c3-4c8c-99f4-c31592c7494a@linux.intel.com>
Date: Tue, 21 Oct 2025 09:28:39 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] ASoC: soc-pcm: Use conditional PCM hardware parameter
 initialization
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.dev, shengjiu.wang@nxp.com
References: <20251020073750.27784-1-peter.ujfalusi@linux.intel.com>
Content-Language: en-US
In-Reply-To: <20251020073750.27784-1-peter.ujfalusi@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 20/10/2025 10:37, Peter Ujfalusi wrote:
> Component drivers can prepare snd_pcm_hardware struct based on the hardware
> capabilities which information should not be discarded.
> 
> Only touch the rates, channels_max and formats if they were left to 0,
> otherwise keep the provided configuration intact for the parameter cross
> checking decision.
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> ---
> Hi,
> 
> this patch in essence extends the special casing of formats done by
> 083a25b18d6a ("ASoC: soc-pcm: fix hw->formats cleared by soc_pcm_hw_init() for dpcm")
> 
> Other parameters might have been set in the same way as the formats
> and preserving these are equally important.
> 
> A case for this is SOF used with HDA codec (analog or more importantly, HDMI)
> where the hw-> params are set based on the connected display/device and
> should be preserved so we can report correct rate, format and channels
> supported by the equipment.
> 
> If the hw-> parameters are left uninitialized then we still need to
> set the UINT/ULLONG_MAX for the refining code to work.
> 
> This applies only for FE setup, in other cases we shall (as before) do
> a full re-initialization.
> 
> I think this makes sense and I cannot think where this might flop, but
> sent as RFC to see what people think. 
> 
> Br,
> Peter
> 
> 
>  sound/soc/soc-pcm.c | 39 ++++++++++++++++++++++++++-------------
>  1 file changed, 26 insertions(+), 13 deletions(-)
> 
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index 2c21fd528afd..e4bbcf4bcc9d 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -570,14 +570,31 @@ static void soc_pcm_apply_msb(struct snd_pcm_substream *substream)
>  	soc_pcm_set_msb(substream, cpu_bits);
>  }
>  
> -static void soc_pcm_hw_init(struct snd_pcm_hardware *hw)
> +static void soc_pcm_hw_init(struct snd_pcm_hardware *hw, bool preserve_config)
>  {
> -	hw->rates		= UINT_MAX;
> -	hw->rate_min		= 0;
> -	hw->rate_max		= UINT_MAX;
> -	hw->channels_min	= 0;
> -	hw->channels_max	= UINT_MAX;
> -	hw->formats		= ULLONG_MAX;
> +	if (preserve_config) {
> +		/*
> +		 * preserve the configuration which might be done by components
> +		 * Note: if the rates/rate_max/channels_max/formats are left to
> +		 * 0 we still need to initialize them for the parameter updates
> +		 * to work
> +		 */
> +		if (!hw->rates)
> +			hw->rates = UINT_MAX;
> +		if (!hw->rate_max)
> +			hw->rate_max = UINT_MAX;
> +		if (!hw->channels_max)
> +			hw->channels_max = UINT_MAX;
> +		if (!hw->formats)
> +			hw->formats = ULLONG_MAX;
> +	} else {
> +		hw->rates = UINT_MAX;
> +		hw->rate_min = 0;
> +		hw->rate_max = UINT_MAX;
> +		hw->channels_min = 0;
> +		hw->channels_max = UINT_MAX;
> +		hw->formats = ULLONG_MAX;
> +	}
>  }
>  
>  static void soc_pcm_hw_update_rate(struct snd_pcm_hardware *hw,
> @@ -626,7 +643,7 @@ int snd_soc_runtime_calc_hw(struct snd_soc_pcm_runtime *rtd,
>  	unsigned int cpu_chan_min = 0, cpu_chan_max = UINT_MAX;
>  	int i;
>  
> -	soc_pcm_hw_init(hw);
> +	soc_pcm_hw_init(hw, false);
>  
>  	/* first calculate min/max only for CPUs in the DAI link */
>  	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
> @@ -1738,13 +1755,9 @@ static void dpcm_runtime_setup_fe(struct snd_pcm_substream *substream)
>  	struct snd_pcm_hardware *hw = &runtime->hw;
>  	struct snd_soc_dai *dai;
>  	int stream = substream->stream;
> -	u64 formats = hw->formats;
>  	int i;
>  
> -	soc_pcm_hw_init(hw);
> -
> -	if (formats)
> -		hw->formats &= formats;
> +	soc_pcm_hw_init(hw, true);

Instead of changing the soc_pcm_hw_init() it might be better to move the
relevant implementation inline here. I will do this for the patch.

>  
>  	for_each_rtd_cpu_dais(fe, i, dai) {
>  		const struct snd_soc_pcm_stream *cpu_stream;

-- 
Péter

