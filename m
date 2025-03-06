Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FE9204698
	for <linux-sound@vger.kernel.org>; Thu,  6 Mar 2025 10:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741258235; cv=none; b=AwXv2+0o6KqIgPLu7YpQhBqBO8N2WPTPAt9rfIqntbbigLEDxkoYegUgVvCgqUyMJyb7kGemvINlc1kJc2DbpEGTLgKU3/Rgu6NIh4aluqzqRX3CwZ/xkUE8hYaTJvvN+/YcmWlMm5o1gj+SnG+eUnpYOzHl3AiGrpkwCnGVCrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741258235; c=relaxed/simple;
	bh=T/n38NAEWA6etPjtyB+FULHf2WKp/ShGrPNrs/ztVEY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GRsIpuVlzfsT6hSw1JJYeBBnvVB+1xtMIorO4PA5FAU0dPBA8ZZwGrMUnrvJa5tVflrVTLsFJlnfLGFVXTX1TfV6JgwpPjdlaaEwEu4PF140bGhDJUGmbK4MDPDplrfBvvP8YNTpxkbFLPBVBS1ruoSvila3zXN3cv/iylFYbbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B6xqp8Ye; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B6xqp8Ye"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741258234; x=1772794234;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=T/n38NAEWA6etPjtyB+FULHf2WKp/ShGrPNrs/ztVEY=;
  b=B6xqp8Ye+LKZ1lTqb03kUEeL7lT2RShp+vIamzicv/gErlU3XvhT2VKG
   g3oGpLf6rHJjPhpuDRJmU90YfOMx+7t0SCvn9OcOvuy6NZM3AJAOXRixg
   KySu2w2P7ac3hkafef6GrGm2LzEatpyFQn9+bvuxygwGL8OUqwjSS1Vgl
   eNRiPqlh7NkjuqusrdEO/xbSPmEuQZQQUz82y7UC5ft5qk0s6t2Bw4Tv3
   tbLustZTFxtZOMfWOPR2LpkvDkDZ+K2JVtIhsv32YjqUxWrYRtgLZj7aK
   Lvf/htMLgXhAP1O4hHJW+9FkDW/MhW+yyCKAjtpH7gYABEuIAUUl0Wmir
   Q==;
X-CSE-ConnectionGUID: dlYBhId5ShWBekb2hXqZpw==
X-CSE-MsgGUID: UnZ6uOL5SbW6bINcvgg6dA==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="53245331"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; 
   d="scan'208";a="53245331"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 02:50:34 -0800
X-CSE-ConnectionGUID: vSr/iggkQ+GuXENSNZ7G3A==
X-CSE-MsgGUID: 71YzNRiFQFygW+xg0mx+7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; 
   d="scan'208";a="119487472"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.8.107]) ([10.94.8.107])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 02:50:33 -0800
Message-ID: <7b9735d9-8bab-47e4-bee9-77a6c195e562@linux.intel.com>
Date: Thu, 6 Mar 2025 11:50:30 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: soc-pcm: tidyup function name to
 snd_soc_dpcm_be_can_xxx()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
References: <87zfhy537a.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <87zfhy537a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/6/2025 2:59 AM, Kuninori Morimoto wrote:
> We have similar but different function names
> 
> 	snd_soc_dpcm_fe_can_xxx()
> 	snd_soc_dpcm_be_can_xxx()
> 	snd_soc_dpcm_can_be_xxx()
> 	             ~~~~~~
> Let's unified these to can_xx
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>   sound/soc/soc-pcm.c | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index 8d88971bdea3..73b05b8f5a07 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -36,7 +36,7 @@ static inline int _soc_pcm_ret(struct snd_soc_pcm_runtime *rtd,
>   
>   /* is the current PCM operation for this FE ? */
>   #if 0
> -static int snd_soc_dpcm_fe_can_update(struct snd_soc_pcm_runtime *fe, int stream)
> +static int snd_soc_dpcm_can_fe_update(struct snd_soc_pcm_runtime *fe, int stream)
>   {
>   	if (fe->dpcm[stream].runtime_update == SND_SOC_DPCM_UPDATE_FE)
>   		return 1;
> @@ -1632,7 +1632,7 @@ void dpcm_be_dai_stop(struct snd_soc_pcm_runtime *fe, int stream,
>   			return;
>   
>   		/* is this op for this BE ? */
> -		if (!snd_soc_dpcm_be_can_update(fe, be, stream))
> +		if (!snd_soc_dpcm_can_be_update(fe, be, stream))

Not sure if some part of patch is missing, but shouldn't definition of 
snd_soc_dpcm_be_can_update() be converted somewhere? I see only calls 
and _fe variant.


