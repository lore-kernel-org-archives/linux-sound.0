Received: from mta1.migadu.com (out-250.mta1.migadu.com [95.215.58.250])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD76E5650F4
	for <linux-sound@vger.kernel.org>; Wed,  9 Sep 2026 14:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.250
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963786; cv=none; b=dbMGRO5jy0OajUNrY7jA8uyiQuTDv+LRoYkeDtRAyMP+FmzS9vlk+Nd6OP2wg++cmEmRPoH8LsjgcdO5/uxL/GocO/51kqR1n82UDv+NJKKlKG/xBtr+VVbKwlTdX36IlRkxNrA6dI4hQUQzUn6GBSZwlDv4bM3K5YYu/QDlCQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963786; c=relaxed/simple;
	bh=ZfO77Mwjv87wB/+O4a57WmtKQh6lat9vFA9XksY0MIc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wf7faMQS0+AfQyME0oiD73h4a5S51C+pDIBbY5C7Wb5SnKhrkLz9kOR3yE4qYYoHONOxxcRQ//Jq3jMPanT6j7lpkSlmKYGJg0ZBjad0eAoJkzNs1uYv6HR4I6+6bYCIjNgbBteulTChUkHShdV9gxT75gV48od6mU65typMabU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=hy7wrFbA; arc=none smtp.client-ip=95.215.58.250
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="hy7wrFbA"
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ZfO77Mwjv87wB/+O4a57WmtKQh6lat9vFA9XksY0MIc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788963781; v=1; x=1789568581;
 b=hy7wrFbA5Ok6uEOgjWjdiS5YADbd/Cj2TYyXn77gkm/aFaZ8IFVNMHUxn2HNYIbEm/3NzMjp
 FPEhKl6GWyUkdjs02FEtFKxr2JrsIxYRVVvSObk7anNlxSwd6ISRu6dc6X3J9xg/NdO9PrN1PeE
 SiuB5GqwgJTii+tcW4nay4DE=
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f35f4e32f2b8f3ce;
	Wed, 09 Sep 2026 14:23:01 +0000
X-Mizu-Trace-ID: f35f4e32f2b8f3ce
X-Migadu-Flow: FLOW_OUT
Message-ID: <c54a3b84-cf8d-4336-b39d-eddbfd3de181@linux.dev>
Date: Wed, 9 Sep 2026 14:34:20 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/24] ASoC: SOF: compress: Rename compress ops with
 ipc3 prefix
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, vkoul@kernel.org,
 perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com, broonie@kernel.org,
 srinivas.kandagatla@oss.qualcomm.com
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, daniel.baluta@nxp.com
References: <20260909090949.7503-1-peter.ujfalusi@linux.intel.com>
 <20260909090949.7503-8-peter.ujfalusi@linux.intel.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260909090949.7503-8-peter.ujfalusi@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/9/26 11:09, Peter Ujfalusi wrote:
> From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> 
> In preparation for adding support for compressed offload support for
> IPC4, rename the current compress implementation with the IPC3 prefix.
> Introduce a new field in struct sof_ipc_pcm_ops to save the
> IPC-specific compressed ops pointer. This should be set when the
> component driver ops are assigned during SOF device probe. Expose a couple
> of common functions that will be used by both IPC-specific implementations
> and rename the compress.c file to ipc3-compress.c
> 
> Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
> ---
>  sound/soc/sof/Makefile                        |   2 +-
>  sound/soc/sof/core.c                          |  10 +-
>  sound/soc/sof/{compress.c => ipc3-compress.c} | 145 ++++--------------
>  sound/soc/sof/ipc3-pcm.c                      |   3 +
>  sound/soc/sof/ipc3-priv.h                     |   3 +
>  sound/soc/sof/pcm.c                           |   5 +-
>  sound/soc/sof/sof-audio.c                     |  81 ++++++++++
>  sound/soc/sof/sof-audio.h                     |   5 +
>  8 files changed, 137 insertions(+), 117 deletions(-)
>  rename sound/soc/sof/{compress.c => ipc3-compress.c} (66%)
> 

this looks like a trivial code move:

> -static void sof_set_transferred_bytes(struct sof_compr_stream *sstream,
> -				      u64 host_pos, u64 buffer_size)
> -{
> -	u64 prev_pos;
> -	unsigned int copied;
> -
> -	div64_u64_rem(sstream->copied_total, buffer_size, &prev_pos);
> -
> -	if (host_pos < prev_pos)
> -		copied = (buffer_size - prev_pos) + host_pos;
> -	else
> -		copied = host_pos - prev_pos;
> -
> -	sstream->copied_total += copied;
> -}
> -
> -static void snd_sof_compr_fragment_elapsed_work(struct work_struct *work)
> -{
> -	struct snd_sof_pcm_stream *sps =
> -		container_of(work, struct snd_sof_pcm_stream,
> -			     period_elapsed_work);
> -
> -	snd_compr_fragment_elapsed(sps->cstream);
> -}
> -
> -void snd_sof_compr_init_elapsed_work(struct work_struct *work)
> -{
> -	INIT_WORK(work, snd_sof_compr_fragment_elapsed_work);
> -}
> -
> -/*
> - * sof compr fragment elapse, this could be called in irq thread context
> - */
> -void snd_sof_compr_fragment_elapsed(struct snd_compr_stream *cstream)
> -{
> -	struct snd_soc_pcm_runtime *rtd;
> -	struct snd_compr_runtime *crtd;
> -	struct snd_soc_component *component;
> -	struct sof_compr_stream *sstream;
> -	struct snd_sof_pcm *spcm;
> -
> -	if (!cstream)
> -		return;
> -
> -	rtd = cstream->private_data;
> -	crtd = cstream->runtime;
> -	sstream = crtd->private_data;
> -	component = snd_soc_rtdcom_lookup(rtd, SOF_AUDIO_PCM_DRV_NAME);
> -
> -	spcm = snd_sof_find_spcm_dai(component, rtd);
> -	if (!spcm) {
> -		dev_err(component->dev,
> -			"fragment elapsed called for unknown stream!\n");
> -		return;
> -	}
> -
> -	sof_set_transferred_bytes(sstream, spcm->stream[cstream->direction].posn.host_posn,
> -				  crtd->buffer_size);
> -
> -	/* use the same workqueue-based solution as for PCM, cf. snd_sof_pcm_elapsed */
> -	schedule_work(&spcm->stream[cstream->direction].period_elapsed_work);
> -}
> -
> -static int create_page_table(struct snd_soc_component *component,
> -			     struct snd_compr_stream *cstream,
> -			     unsigned char *dma_area, size_t size)
> -{
> -	struct snd_dma_buffer *dmab = cstream->runtime->dma_buffer_p;
> -	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
> -	int dir = cstream->direction;
> -	struct snd_sof_pcm *spcm;
> -
> -	spcm = snd_sof_find_spcm_dai(component, rtd);
> -	if (!spcm)
> -		return -EINVAL;
> -
> -	return snd_sof_create_page_table(component->dev, dmab,
> -					 spcm->stream[dir].page_table.area, size);
> -}

...

> +#if IS_ENABLED(CONFIG_SND_SOC_SOF_COMPRESS)
> +static void sof_set_transferred_bytes(struct sof_compr_stream *sstream,
> +				      u64 host_pos, u64 buffer_size)
> +{
> +	u64 prev_pos;
> +	unsigned int copied;
> +
> +	div64_u64_rem(sstream->copied_total, buffer_size, &prev_pos);
> +
> +	if (host_pos < prev_pos)
> +		copied = (buffer_size - prev_pos) + host_pos;
> +	else
> +		copied = host_pos - prev_pos;
> +
> +	sstream->copied_total += copied;
> +}
> +
> +static void snd_sof_compr_fragment_elapsed_work(struct work_struct *work)
> +{
> +	struct snd_sof_pcm_stream *sps = container_of(work, struct snd_sof_pcm_stream,
> +						      period_elapsed_work);
> +
> +	snd_compr_fragment_elapsed(sps->cstream);
> +}
> +
> +void snd_sof_compr_init_elapsed_work(struct work_struct *work)
> +{
> +	INIT_WORK(work, snd_sof_compr_fragment_elapsed_work);
> +}
> +
> +/*
> + * sof compr fragment elapse, this could be called in irq thread context
> + */
> +void snd_sof_compr_fragment_elapsed(struct snd_compr_stream *cstream)
> +{
> +	struct snd_soc_pcm_runtime *rtd;
> +	struct snd_compr_runtime *crtd;
> +	struct snd_soc_component *component;
> +	struct sof_compr_stream *sstream;
> +	struct snd_sof_pcm *spcm;
> +
> +	if (!cstream)
> +		return;
> +
> +	rtd = cstream->private_data;
> +	crtd = cstream->runtime;
> +	sstream = crtd->private_data;
> +	component = snd_soc_rtdcom_lookup(rtd, SOF_AUDIO_PCM_DRV_NAME);
> +
> +	spcm = snd_sof_find_spcm_dai(component, rtd);
> +	if (!spcm) {
> +		dev_err(component->dev, "fragment elapsed called for unknown stream!\n");
> +		return;
> +	}
> +
> +	sof_set_transferred_bytes(sstream, spcm->stream[cstream->direction].posn.host_posn,
> +				  crtd->buffer_size);
> +
> +	/* use the same workqueue-based solution as for PCM, cf. snd_sof_pcm_elapsed */
> +	schedule_work(&spcm->stream[cstream->direction].period_elapsed_work);
> +}
> +
> +int snd_sof_compr_create_page_table(struct snd_soc_component *component,
> +				    struct snd_compr_stream *cstream,
> +				    unsigned char *dma_area, size_t size)
> +{
> +	struct snd_dma_buffer *dmab = cstream->runtime->dma_buffer_p;
> +	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
> +	int dir = cstream->direction;
> +	struct snd_sof_pcm *spcm;
> +
> +	spcm = snd_sof_find_spcm_dai(component, rtd);
> +	if (!spcm)
> +		return -EINVAL;
> +
> +	return snd_sof_create_page_table(component->dev, dmab,
> +					 spcm->stream[dir].page_table.area, size);
> +}
> +#endif

but then there is also the addition of new ops and renames.

This patch does a lot of things, most of them trivial but overall it's a
lot to review.

maybe split this patch in two with the code move in a first patch, then
the file rename and introduction of new ops?


