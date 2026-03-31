Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13E2305E10
	for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 14:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774968619; cv=none; b=cj2uHpEmh5308VmMQtek6LF7g95TSL8jVyGrhf10W6PwHDdOD6364tYrhj9WOP/5ALTe1ZbOa+meb1h51Zs5HZ+r0CyGhIbs9BZeDFAzohIk1ulZZqO5/NNXqqdo0jVabqOiDmh4XlN32S9uaOthbmugutTyOodDh0cT4frie1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774968619; c=relaxed/simple;
	bh=TghwWlNeteFTzlgwBJswWorUET8dacvZmO5RuSApx9c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eac+8oRB8cyKLa08w208xoDCAtd1eVFHOgQk4u0w3h3Yxkr1aOyfVORLjVWd36t4rmh3e7qk50hWGavoGXYPuZlrEjbaiRZgkidQTvfy134slXlS52a2vll2/SGZiBHFuBvhv1tSJAxOpXVQSnaRq0iXU578JP1EItwR7j1KvDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=OYGK3+DS; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="OYGK3+DS"
Message-ID: <803568b7-5c8f-4208-a8c9-3d7357f6e615@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774968616;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EIuwP/+StFH4k29264fRFiaBRtgLKReuPYesjmWA18w=;
	b=OYGK3+DSq0bpSMQlslBVENlTj/wXMRph+KNKBBHJiy8EtKWb6HzBerV7VfYnddE/p5/iZm
	y1euz990u1yoreq02S0Xy25rCv1FCzyy3baq3GMkZxVu5assmoWtVnDdtxJHt60IvoH6Yk
	u0wQBwlvH+HbhUpxMz90oX2880YOwkc=
Date: Tue, 31 Mar 2026 14:28:58 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 1/6] ASoC: sdw_utils: Add ES9356 support functions
To: Zhang Yi <zhangyi@everest-semi.com>, broonie@kernel.org, tiwai@suse.com,
 linux-sound@vger.kernel.org
Cc: peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
References: <20260327095954.3465-1-zhangyi@everest-semi.com>
 <20260327095954.3465-2-zhangyi@everest-semi.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260327095954.3465-2-zhangyi@everest-semi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 3/27/26 10:59, Zhang Yi wrote:
> Add the functions into the machine driver for the es9356
> 
> Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>

not sure I see the benefits of having a patch that only adds the prototypes, maybe squash with patch 3?

> ---
>  include/sound/soc_sdw_utils.h | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/include/sound/soc_sdw_utils.h b/include/sound/soc_sdw_utils.h
> index 98531e500..c18f5016d 100644
> --- a/include/sound/soc_sdw_utils.h
> +++ b/include/sound/soc_sdw_utils.h
> @@ -220,6 +220,17 @@ int asoc_sdw_cs42l43_spk_init(struct snd_soc_card *card,
>  			      struct asoc_sdw_codec_info *info,
>  			      bool playback);
>  
> +/* es9356 codec support */
> +int asoc_sdw_es9356_init(struct snd_soc_card *card,
> +			       struct snd_soc_dai_link *dai_links,
> +			       struct asoc_sdw_codec_info *info,
> +			       bool playback);
> +int asoc_sdw_es9356_amp_init(struct snd_soc_card *card,
> +			       struct snd_soc_dai_link *dai_links,
> +			       struct asoc_sdw_codec_info *info,
> +			       bool playback);
> +int asoc_sdw_es9356_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
> +
>  /* CS AMP support */
>  int asoc_sdw_bridge_cs35l56_count_sidecar(struct snd_soc_card *card,
>  					  int *num_dais, int *num_devs);
> @@ -271,5 +282,8 @@ int asoc_sdw_ti_amp_init(struct snd_soc_card *card,
>  int asoc_sdw_ti_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
>  int asoc_sdw_ti_amp_initial_settings(struct snd_soc_card *card,
>  				     const char *name_prefix);
> +int asoc_sdw_es9356_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
> +int asoc_sdw_es9356_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
> +int asoc_sdw_es9356_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
>  
>  #endif

