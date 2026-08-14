Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3611471CF0;
	Fri, 14 Aug 2026 13:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786713369; cv=none; b=rEVtov4mu+PqBZMmcFsS8mqCZkyNqEKFc52DvUwDPUfV5oti1Dp4PNHKfgUrF0v+lyXLQ+heL/8BzhxA/Rt3u3Ea+kzbcwjQ4pwNaAPerfP7S9rc77E/FFboPjGdKhlZYqCDBmDgsLKKTW0ruf8sFGQaOW3E1078aOjG2wsCKxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786713369; c=relaxed/simple;
	bh=/GkCJAOgHNfk5IczLPkzG5mVVY1HJW6dtEBkVmVQSR0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fEQo01ELOxGfSQjmQR57upxCZWtI0RwjkJd5sRJYma+yJfJaLHA+uREqrdMNvDmYtHu8b2ONlj6d3IV5Y6QVCwvQJ5Y60lKDhcKkItQk2jPX+PlT9/cxqAHYgMAJehirdFnGcKsbNEy7jMfYrJpraqX+aIFk+prDPiLVkA9l5xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E1/yx6h7; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E1/yx6h7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786713352; x=1818249352;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=/GkCJAOgHNfk5IczLPkzG5mVVY1HJW6dtEBkVmVQSR0=;
  b=E1/yx6h7Ka+PbWip9d5khLPvgXnheh5sGSrXFNi7RZZ8NaB4AyaAsDg3
   SdUs8R+ncK5biaZkbtC1TRgF5vYC6S9YGwYcjltUPZ1EecpKVnxakVoM5
   Bi8x1FhXr3L7v2rV/Gev28tTkox/MuEByd6CkqtqKtoMVhkHaVL39kG2U
   7SMIKcZ/6ojdWhEVFYJGqu50nt+2r0UmE5Aonb5Bt51QPyNM4klMyvS4m
   FxBmGZKeoIQPZTFgxhOzxhLUbxjimc+vxje0dzbcXN86o9c2qeRZbmDvc
   7znAde3emvfJPuCNH4B/LpQL4N+qEI/d7wrQSWDRwqjTD6/aHZ6uzsKSC
   Q==;
X-CSE-ConnectionGUID: QqMnOv0RQ4GJ3bCCgMaNmg==
X-CSE-MsgGUID: x+7HiSQKQ/e2uCYatyh98g==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="104824217"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="104824217"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 06:15:51 -0700
X-CSE-ConnectionGUID: Ptxy3oIUTqCsLMp4tDN7FQ==
X-CSE-MsgGUID: Ro/zgt06RlmgdvlPDkOP+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="263793983"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.246.214]) ([10.245.246.214])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 06:15:49 -0700
Message-ID: <04b1856e-05e2-450e-a68c-4f9a3455e01e@linux.intel.com>
Date: Fri, 14 Aug 2026 16:15:45 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: SOF: validate topology volume range before
 allocation
To: Pengpeng Hou <pengpeng@iscas.ac.cn>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260814081238.25434-1-pengpeng@iscas.ac.cn>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20260814081238.25434-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 14/08/2026 11:12, Pengpeng Hou wrote:
> SOF treats the topology mixer min and max values as non-negative indices
> into its volume table. It stores them in signed fields, allocates max + 1
> entries through an int argument, and later indexes the table with the
> stored range.
> 
> An inverted range is invalid, while a maximum at or above INT_MAX cannot
> be represented safely after the increment or in the signed fields.
> Validate the complete range before storing it or allocating the table.
> 
> Fixes: 311ce4fe7637 ("ASoC: SOF: Add support for loading topologies")
> Assisted-by: Codex:gpt-5
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
> Changes since v1: https://lore.kernel.org/all/20260722041532.14085-1-pengpeng@iscas.ac.cn/
> - validate SOF's non-negative table-index range before signed storage
> - require max + 1 to remain representable by the allocator's int argument
> - rebase on current SOF topology sources

The patch appears to be identical to v1 to my non agent eyes ;)

Acked-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

> 
> The SOF table-index consumers and allocator conversion were reviewed
> statically; no SOF topology or hardware test was performed.
> 
>  sound/soc/sof/topology.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
> index 42a2d90bb705..31dd7a66a9cf 100644
> --- a/sound/soc/sof/topology.c
> +++ b/sound/soc/sof/topology.c
> @@ -846,6 +846,7 @@ static int sof_control_load_volume(struct snd_soc_component *scomp,
>  	struct snd_soc_tplg_mixer_control *mc =
>  		container_of(hdr, struct snd_soc_tplg_mixer_control, hdr);
>  	int tlv[SOF_TLV_ITEMS];
> +	u32 min, max;
>  	unsigned int mask;
>  	int ret;
>  
> @@ -853,6 +854,11 @@ static int sof_control_load_volume(struct snd_soc_component *scomp,
>  	if (le32_to_cpu(mc->num_channels) > SND_SOC_TPLG_MAX_CHAN)
>  		return -EINVAL;
>  
> +	min = le32_to_cpu(mc->min);
> +	max = le32_to_cpu(mc->max);
> +	if (min > max || max >= INT_MAX)
> +		return -EINVAL;
> +
>  	/*
>  	 * If control has more than 2 channels we need to override the info. This is because even if
>  	 * ASoC layer has defined topology's max channel count to SND_SOC_TPLG_MAX_CHAN = 8, the
> @@ -863,12 +869,12 @@ static int sof_control_load_volume(struct snd_soc_component *scomp,
>  		kc->info = snd_sof_volume_info;
>  
>  	scontrol->comp_id = sdev->next_comp_id;
> -	scontrol->min_volume_step = le32_to_cpu(mc->min);
> -	scontrol->max_volume_step = le32_to_cpu(mc->max);
> +	scontrol->min_volume_step = min;
> +	scontrol->max_volume_step = max;
>  	scontrol->num_channels = le32_to_cpu(mc->num_channels);
>  
> -	scontrol->max = le32_to_cpu(mc->max);
> -	if (le32_to_cpu(mc->max) == 1)
> +	scontrol->max = max;
> +	if (max == 1)
>  		goto skip;
>  
>  	/* extract tlv data */
> @@ -878,7 +884,7 @@ static int sof_control_load_volume(struct snd_soc_component *scomp,
>  	}
>  
>  	/* set up volume table */
> -	ret = set_up_volume_table(scontrol, tlv, le32_to_cpu(mc->max) + 1);
> +	ret = set_up_volume_table(scontrol, tlv, max + 1);
>  	if (ret < 0) {
>  		dev_err(scomp->dev, "error: setting up volume table\n");
>  		return ret;
> @@ -911,7 +917,7 @@ static int sof_control_load_volume(struct snd_soc_component *scomp,
>  	return 0;
>  
>  err:
> -	if (le32_to_cpu(mc->max) > 1)
> +	if (max > 1)
>  		kfree(scontrol->volume_table);
>  
>  	return ret;

-- 
Péter

