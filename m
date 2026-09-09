Received: from mta1.migadu.com (out-61.mta1.migadu.com [95.215.58.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F93F5867E5
	for <linux-sound@vger.kernel.org>; Wed,  9 Sep 2026 14:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963796; cv=none; b=D2fN1agpxJj337GSg53O7uFA7/cP4impKcNSPOiCxEW3w1vJad9o57U5gvjJnT60B6tYMnjybJrQfCZdZ/oys58wjQdygiOfF7S+qw9P/lbyOM6BFBCvucmtdWIPZlseUIUCBed5VYpUnnITaYaTmiHU3KsIaLKMAxCZNMrlDSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963796; c=relaxed/simple;
	bh=tC37vZIh/GB9glgoSWa4fHHGgMYuuclXUAJGNvpctSs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sUUw+z6Ng03xQpVljMLPE66Nol+3oFAMgX94SKKripj3g+IEtBjmL2/QZRVcM1S4LB/B2uYTE3kP5jOA7SK9dtdZfC2r56yDSf2WTzcq95cY+YzJp2wTx8SPqkseTu/TOnhJz9uGNrsJqHbOUOKCLplZiH0+VaWejfzslQAWIUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=CxcD7F9Y; arc=none smtp.client-ip=95.215.58.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="CxcD7F9Y"
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=tC37vZIh/GB9glgoSWa4fHHGgMYuuclXUAJGNvpctSs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788963793; v=1; x=1789568593;
 b=CxcD7F9YrfyDo8BZO8ugF5zF/UoCeuAdI9ktAIV3OslU/fz1h6AmZyKfwJzyQAYFPbljOZul
 Lh6dRW6RsIsNd2LYy29/ZYTx+tu2DAjggX0Ou0RkkgOci8wOn3yGAywcbWqZdKUxMrGM1l75iHy
 Livw+mp4xo9azi0ystfbnOsE=
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 21e062c4a89822fa;
	Wed, 09 Sep 2026 14:23:12 +0000
X-Mizu-Trace-ID: 21e062c4a89822fa
X-Migadu-Flow: FLOW_OUT
Message-ID: <6e5326ae-0a0b-4221-980d-65a8ffe8410f@linux.dev>
Date: Wed, 9 Sep 2026 15:37:15 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 23/24] ASoC: SOF: Intel: Kconfig: Select compress
 support for TGL+ platforms
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, vkoul@kernel.org,
 perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com, broonie@kernel.org,
 srinivas.kandagatla@oss.qualcomm.com
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, daniel.baluta@nxp.com
References: <20260909090949.7503-1-peter.ujfalusi@linux.intel.com>
 <20260909090949.7503-24-peter.ujfalusi@linux.intel.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260909090949.7503-24-peter.ujfalusi@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/9/26 11:09, Peter Ujfalusi wrote:
> Select SOF_COMPRESS for TGL and newer platforms, on Intel devices the
> compressed support is available with IPC4 only.

that wording is confusing.

TGL default is IPC3, official IPC4 support started with MTL, didn't it?

> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
> ---
>  sound/soc/sof/intel/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
> index 840d5a36b958..02b41e4ccab2 100644
> --- a/sound/soc/sof/intel/Kconfig
> +++ b/sound/soc/sof/intel/Kconfig
> @@ -213,6 +213,7 @@ config SND_SOC_SOF_INTEL_TGL
>  	select SND_SOC_SOF_HDA_GENERIC
>  	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
>  	select SND_SOC_SOF_INTEL_CNL
> +	select SND_SOC_SOF_COMPRESS
>  
>  config SND_SOC_SOF_TIGERLAKE
>  	tristate "SOF support for Tigerlake"
> @@ -249,6 +250,7 @@ config SND_SOC_SOF_INTEL_MTL
>  	select SND_SOC_SOF_HDA_GENERIC
>  	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
>  	select SND_SOC_SOF_IPC4
> +	select SND_SOC_SOF_COMPRESS
>  
>  config SND_SOC_SOF_METEORLAKE
>  	tristate "SOF support for Meteorlake"

