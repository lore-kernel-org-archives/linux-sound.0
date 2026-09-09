Received: from mta0.migadu.com (out-130.mta0.migadu.com [91.218.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CE65867F9
	for <linux-sound@vger.kernel.org>; Wed,  9 Sep 2026 14:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963827; cv=none; b=NYCaRRtz3b2xZpudHQKOhMMToKf6If0rzqzAzjk7giBLjnM9+yKYZWOYB8ipH0XxxPOpjodJw8JLYH0lPqD9I3N/G37FyWdGQuA/CVu4vpn8MD9UWAV7pDX6wrhftzpIPp8v4erwCDlWkkF4w0bXmTu9ZrP+SaYZdwR+1vI3IwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963827; c=relaxed/simple;
	bh=t1eKOz2MkWDgIJQJpL4pb5hPa5Jrt0yiKJ5b6X9ikkE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U8ylNNNrkq7E5UoOxzKwmFtkMdfI/ZIE5aitMr+N3pAlerCKDA8pUvmMoKauYiuqRQ8ndP0pUQMFfqgiFv9Jq1enCZVx8EKF6ubdr2YOwwfofC+PxGU9sGuV6rJSIEk/3YQIFjekJRRIxq2aacLC7BbjyLKUzXvxVigrBahmQms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rludyM3d; arc=none smtp.client-ip=91.218.175.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rludyM3d"
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=t1eKOz2MkWDgIJQJpL4pb5hPa5Jrt0yiKJ5b6X9ikkE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788963823; v=1; x=1789568623;
 b=rludyM3dXVNL2qhBw9jz7LnCBRHbs6HePJJPmnpzFLL679GA+NBuYpp/uiNynAy+GsaSIkI3
 uWTeV4axFUcZca/qk+SaQs6vhCD16mRuC3QJBbWh/4fv1Y70DZiBVgdLQ+/m+pJxTpQSZPXeaw2
 b0zcxoFsmGRbRW84PeMl4054=
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 371bb726f8cf6c84;
	Wed, 09 Sep 2026 14:23:43 +0000
X-Mizu-Trace-ID: 371bb726f8cf6c84
X-Migadu-Flow: FLOW_OUT
Message-ID: <0522c051-600b-4038-aa7d-77b4121ab966@linux.dev>
Date: Wed, 9 Sep 2026 16:23:42 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/24] ASoC: SOF: ops: Add new platform-specific ops
 for compress
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, vkoul@kernel.org,
 perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com, broonie@kernel.org,
 srinivas.kandagatla@oss.qualcomm.com
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, daniel.baluta@nxp.com
References: <20260909090949.7503-1-peter.ujfalusi@linux.intel.com>
 <20260909090949.7503-14-peter.ujfalusi@linux.intel.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260909090949.7503-14-peter.ujfalusi@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/9/26 11:09, Peter Ujfalusi wrote:
> From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> 
> Add new ops in the struct snd_sof_ops for platform-specific ops for
> compresssed streams. Also, define and set them for the HDA platforms.
> 
> Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Co-developed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
> ---
>  sound/soc/sof/intel/hda-common-ops.c |   8 ++
>  sound/soc/sof/intel/hda-pcm.c        | 142 +++++++++++++++++++++++++++
>  sound/soc/sof/intel/hda-stream.c     |  69 +++++++++----
>  sound/soc/sof/intel/hda.h            |  15 +++
>  sound/soc/sof/ops.h                  |  74 ++++++++++++++
>  sound/soc/sof/sof-priv.h             |  12 +++
>  6 files changed, 301 insertions(+), 19 deletions(-)

this is added 'too-early', there are additional changes in
topology/timestamping that could be applied earlier. Maybe move later
when actual IPC4 compressed support is added?

> 
> diff --git a/sound/soc/sof/intel/hda-common-ops.c b/sound/soc/sof/intel/hda-common-ops.c
> index 746b426b1329..aa91f2b6fd65 100644
> --- a/sound/soc/sof/intel/hda-common-ops.c
> +++ b/sound/soc/sof/intel/hda-common-ops.c
> @@ -57,6 +57,14 @@ const struct snd_sof_dsp_ops sof_hda_common_ops = {
>  	.pcm_pointer	= hda_dsp_pcm_pointer,
>  	.pcm_ack	= hda_dsp_pcm_ack,
>  
> +	.compr_open = hda_dsp_compr_open,
> +	.compr_hw_params = hda_dsp_compr_hw_params,
> +	.compr_hw_free = hda_dsp_stream_compr_hw_free,
> +	.compr_close = hda_dsp_compr_close,
> +	.compr_trigger = hda_dsp_compr_trigger,
> +	.compr_pointer = hda_dsp_compr_pointer,
> +	.compr_get_dai_frame_counter = hda_dsp_compr_get_stream_llp,
> +
>  	.get_dai_frame_counter = hda_dsp_get_stream_llp,
>  	.get_host_byte_counter = hda_dsp_get_stream_ldp,
>  
> diff --git a/sound/soc/sof/intel/hda-pcm.c b/sound/soc/sof/intel/hda-pcm.c
> index 16a364072821..83efc9bdf418 100644
> --- a/sound/soc/sof/intel/hda-pcm.c
> +++ b/sound/soc/sof/intel/hda-pcm.c
> @@ -151,6 +151,71 @@ int hda_dsp_pcm_hw_params(struct snd_sof_dev *sdev,
>  }
>  EXPORT_SYMBOL_NS(hda_dsp_pcm_hw_params, "SND_SOC_SOF_INTEL_HDA_COMMON");
>  
> +int hda_dsp_compr_hw_params(struct snd_sof_dev *sdev,
> +			    struct snd_compr_stream *cstream,
> +			    struct snd_compr_params *params,
> +			    struct snd_sof_platform_stream_params *platform_params)
> +{
> +	struct hdac_stream *hstream = cstream->runtime->private_data;
> +	struct hdac_ext_stream *hext_stream = stream_to_hdac_ext_stream(hstream);
> +	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
> +	struct snd_dma_buffer *dmab;
> +	u32 bits, rate;
> +	int bps;
> +	int ret;
> +
> +	hstream->cstream = cstream;
> +	dmab = cstream->runtime->dma_buffer_p;
> +
> +	/* Use correct format based on the used codec */
> +	switch (params->codec.id) {
> +	case SND_AUDIOCODEC_PCM:
> +		bps = snd_pcm_format_physical_width((snd_pcm_format_t)params->codec.format);
> +		break;
> +	case SND_AUDIOCODEC_VORBIS:
> +		bps = snd_pcm_format_physical_width(SNDRV_PCM_FORMAT_S16_LE);
> +		break;
> +	case SND_AUDIOCODEC_FLAC:
> +	{
> +		struct snd_dec_flac *dec_flac = &params->codec.options.flac_d;
> +
> +		if (dec_flac->sample_size == 16)
> +			bps = snd_pcm_format_physical_width(SNDRV_PCM_FORMAT_S16_LE);
> +		else
> +			bps = snd_pcm_format_physical_width(SNDRV_PCM_FORMAT_S32_LE);
> +		break;
> +	}
> +	default:
> +		bps = snd_pcm_format_physical_width(SNDRV_PCM_FORMAT_S32_LE);
> +	}
> +
> +	if (bps < 0)
> +		return bps;
> +	bits = hda_dsp_get_bits(sdev, bps);
> +	rate = hda_dsp_get_mult_div(sdev, params->codec.sample_rate);
> +
> +	hstream->format_val = rate | bits | (params->codec.ch_out - 1);
> +	hstream->bufsize = cstream->runtime->buffer_size;
> +	hstream->period_bytes = cstream->runtime->fragment_size;
> +	hstream->no_period_wakeup  = false;
> +
> +	/* params is not used so pass NULL */
> +	dmab = cstream->runtime->dma_buffer_p;
> +	ret = hda_dsp_stream_hw_params(sdev, hext_stream, dmab, NULL);
> +	if (ret < 0) {
> +		dev_err(sdev->dev, "%s: hdac prepare failed: %d\n", __func__, ret);
> +		return ret;
> +	}
> +
> +	if (hda)
> +		platform_params->no_ipc_position = hda->no_ipc_position;
> +
> +	platform_params->stream_tag = hstream->stream_tag;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_NS(hda_dsp_compr_hw_params, "SND_SOC_SOF_INTEL_HDA_COMMON");
> +
>  /* update SPIB register with appl position */
>  int hda_dsp_pcm_ack(struct snd_sof_dev *sdev, struct snd_pcm_substream *substream)
>  {
> @@ -184,6 +249,16 @@ int hda_dsp_pcm_trigger(struct snd_sof_dev *sdev,
>  }
>  EXPORT_SYMBOL_NS(hda_dsp_pcm_trigger, "SND_SOC_SOF_INTEL_HDA_COMMON");
>  
> +int hda_dsp_compr_trigger(struct snd_sof_dev *sdev,
> +			  struct snd_compr_stream *cstream, int cmd)
> +{
> +	struct hdac_stream *hstream = cstream->runtime->private_data;
> +	struct hdac_ext_stream *hext_stream = stream_to_hdac_ext_stream(hstream);
> +
> +	return hda_dsp_stream_trigger(sdev, hext_stream, cmd);
> +}
> +EXPORT_SYMBOL_NS(hda_dsp_compr_trigger, "SND_SOC_SOF_INTEL_HDA_COMMON");
> +
>  snd_pcm_uframes_t hda_dsp_pcm_pointer(struct snd_sof_dev *sdev,
>  				      struct snd_pcm_substream *substream)
>  {
> @@ -216,6 +291,20 @@ snd_pcm_uframes_t hda_dsp_pcm_pointer(struct snd_sof_dev *sdev,
>  }
>  EXPORT_SYMBOL_NS(hda_dsp_pcm_pointer, "SND_SOC_SOF_INTEL_HDA_COMMON");
>  
> +int hda_dsp_compr_pointer(struct snd_sof_dev *sdev, struct snd_compr_stream *cstream,
> +			  struct snd_compr_tstamp64 *tstamp)
> +{
> +	struct hdac_stream *hstream = cstream->runtime->private_data;
> +
> +	/* hstream->curr_pos is updated when we receive the ioc */
> +	tstamp->copied_total = hstream->curr_pos;
> +
> +	tstamp->byte_offset = hda_dsp_stream_get_position(hstream, cstream->direction, true);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_NS(hda_dsp_compr_pointer, "SND_SOC_SOF_INTEL_HDA_COMMON");
> +
>  int hda_dsp_pcm_open(struct snd_sof_dev *sdev,
>  		     struct snd_pcm_substream *substream)
>  {
> @@ -342,6 +431,41 @@ int hda_dsp_pcm_open(struct snd_sof_dev *sdev,
>  }
>  EXPORT_SYMBOL_NS(hda_dsp_pcm_open, "SND_SOC_SOF_INTEL_HDA_COMMON");
>  
> +int hda_dsp_compr_open(struct snd_sof_dev *sdev, struct snd_compr_stream *cstream)
> +{
> +	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
> +	struct snd_soc_component *scomp = sdev->component;
> +	struct hdac_ext_stream *dsp_stream;
> +	struct snd_sof_pcm *spcm;
> +	int direction = cstream->direction;
> +
> +	spcm = snd_sof_find_spcm_dai(scomp, rtd);
> +	if (!spcm) {
> +		dev_err(sdev->dev, "%s: can't find PCM with DAI ID %d\n",
> +			__func__, rtd->dai_link->id);
> +		return -EINVAL;
> +	}
> +
> +	dsp_stream = hda_dsp_stream_get(sdev, direction, 0);
> +	if (!dsp_stream) {
> +		dev_err(sdev->dev, "%s: no stream available\n", __func__);
> +		return -ENODEV;
> +	}
> +
> +	/* binding compr stream to hda stream */
> +	cstream->runtime->private_data = &dsp_stream->hstream;
> +
> +	/*
> +	 * Reset the llp cache values (they are used for LLP compensation in
> +	 * case the counter is not reset)
> +	 */
> +	dsp_stream->pplcllpl = 0;
> +	dsp_stream->pplcllpu = 0;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_NS(hda_dsp_compr_open, "SND_SOC_SOF_INTEL_HDA_COMMON");
> +
>  int hda_dsp_pcm_close(struct snd_sof_dev *sdev,
>  		      struct snd_pcm_substream *substream)
>  {
> @@ -361,3 +485,21 @@ int hda_dsp_pcm_close(struct snd_sof_dev *sdev,
>  	return 0;
>  }
>  EXPORT_SYMBOL_NS(hda_dsp_pcm_close, "SND_SOC_SOF_INTEL_HDA_COMMON");
> +
> +int hda_dsp_compr_close(struct snd_sof_dev *sdev, struct snd_compr_stream *cstream)
> +{
> +	struct hdac_stream *hstream = cstream->runtime->private_data;
> +	int direction = cstream->direction;
> +	int ret;
> +
> +	ret = hda_dsp_stream_put(sdev, direction, hstream->stream_tag);
> +	if (ret)
> +		return -ENODEV;
> +
> +	/* unbinding compress stream to hda stream */
> +	hstream->cstream = NULL;
> +	cstream->runtime->private_data = NULL;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_NS(hda_dsp_compr_close, "SND_SOC_SOF_INTEL_HDA_COMMON");
> diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
> index 5097a497188d..ac2a62c4e41f 100644
> --- a/sound/soc/sof/intel/hda-stream.c
> +++ b/sound/soc/sof/intel/hda-stream.c
> @@ -755,13 +755,12 @@ int hda_dsp_stream_hw_params(struct snd_sof_dev *sdev,
>  	return ret;
>  }
>  
> -int hda_dsp_stream_hw_free(struct snd_sof_dev *sdev,
> -			   struct snd_pcm_substream *substream)
> +static int _hda_dsp_stream_hw_free(struct snd_sof_dev *sdev,
> +				   struct hdac_stream *hstream)
>  {
> -	struct hdac_stream *hstream = substream->runtime->private_data;
>  	struct hdac_ext_stream *hext_stream = container_of(hstream,
> -							 struct hdac_ext_stream,
> -							 hstream);
> +							   struct hdac_ext_stream,
> +							   hstream);
>  	int ret;
>  
>  	ret = hda_dsp_stream_reset(sdev, hstream);
> @@ -786,8 +785,21 @@ int hda_dsp_stream_hw_free(struct snd_sof_dev *sdev,
>  
>  	return 0;
>  }
> +
> +int hda_dsp_stream_hw_free(struct snd_sof_dev *sdev,
> +			   struct snd_pcm_substream *substream)
> +{
> +	return _hda_dsp_stream_hw_free(sdev, substream->runtime->private_data);
> +}
>  EXPORT_SYMBOL_NS(hda_dsp_stream_hw_free, "SND_SOC_SOF_INTEL_HDA_COMMON");
>  
> +int hda_dsp_stream_compr_hw_free(struct snd_sof_dev *sdev,
> +				 struct snd_compr_stream *cstream)
> +{
> +	return _hda_dsp_stream_hw_free(sdev, cstream->runtime->private_data);
> +}
> +EXPORT_SYMBOL_NS(hda_dsp_stream_compr_hw_free, "SND_SOC_SOF_INTEL_HDA_COMMON");
> +
>  bool hda_dsp_check_stream_irq(struct snd_sof_dev *sdev)
>  {
>  	struct hdac_bus *bus = sof_to_bus(sdev);
> @@ -1162,19 +1174,9 @@ EXPORT_SYMBOL_NS(hda_dsp_stream_get_position, "SND_SOC_SOF_INTEL_HDA_COMMON");
>  
>  #define merge_u64(u32_u, u32_l) (((u64)(u32_u) << 32) | (u32_l))
>  
> -/**
> - * hda_dsp_get_stream_llp - Retrieve the LLP (Linear Link Position) of the stream
> - * @sdev: SOF device
> - * @component: ASoC component
> - * @substream: PCM substream
> - *
> - * Returns the raw Linear Link Position value
> - */
> -u64 hda_dsp_get_stream_llp(struct snd_sof_dev *sdev,
> -			   struct snd_soc_component *component,
> -			   struct snd_pcm_substream *substream)
> +static u64 hda_dsp_get_llp(struct snd_sof_dev *sdev,
> +			   struct snd_soc_pcm_runtime *rtd, int dir)
>  {
> -	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
>  	struct snd_soc_pcm_runtime *be_rtd = NULL;
>  	struct hdac_ext_stream *hext_stream;
>  	struct snd_soc_dai *cpu_dai;
> @@ -1185,7 +1187,7 @@ u64 hda_dsp_get_stream_llp(struct snd_sof_dev *sdev,
>  	 * The LLP needs to be read from the Link DMA used for this FE as it is
>  	 * allowed to use any combination of Link and Host channels
>  	 */
> -	for_each_dpcm_be(rtd, substream->stream, dpcm) {
> +	for_each_dpcm_be(rtd, dir, dpcm) {
>  		if (dpcm->fe != rtd)
>  			continue;
>  
> @@ -1199,7 +1201,7 @@ u64 hda_dsp_get_stream_llp(struct snd_sof_dev *sdev,
>  	if (!cpu_dai)
>  		return 0;
>  
> -	hext_stream = snd_soc_dai_get_dma_data(cpu_dai, substream);
> +	hext_stream = snd_soc_dai_dma_data_get(cpu_dai, dir);
>  	if (!hext_stream)
>  		return 0;
>  
> @@ -1223,8 +1225,37 @@ u64 hda_dsp_get_stream_llp(struct snd_sof_dev *sdev,
>  
>  	return merge_u64(llp_u, llp_l);
>  }
> +
> +/**
> + * hda_dsp_get_stream_llp - Retrieve the LLP (Linear Link Position) of the stream
> + * @sdev: SOF device
> + * @component: ASoC component
> + * @substream: PCM substream
> + *
> + * Returns the raw Linear Link Position value
> + */
> +u64 hda_dsp_get_stream_llp(struct snd_sof_dev *sdev,
> +			   struct snd_soc_component *component,
> +			   struct snd_pcm_substream *substream)
> +{
> +	return hda_dsp_get_llp(sdev, snd_soc_substream_to_rtd(substream),
> +			       substream->stream);
> +}
>  EXPORT_SYMBOL_NS(hda_dsp_get_stream_llp, "SND_SOC_SOF_INTEL_HDA_COMMON");
>  
> +/**
> + * hda_dsp_compr_get_stream_llp - Retrieve the LLP (Linear Link Position) of the stream
> + * @sdev: SOF device
> + * @cstream: Compress stream
> + *
> + * Returns the raw Linear Link Position value
> + */
> +u64 hda_dsp_compr_get_stream_llp(struct snd_sof_dev *sdev, struct snd_compr_stream *cstream)
> +{
> +	return hda_dsp_get_llp(sdev, cstream->private_data, cstream->direction);
> +}
> +EXPORT_SYMBOL_NS(hda_dsp_compr_get_stream_llp, "SND_SOC_SOF_INTEL_HDA_COMMON");
> +
>  /**
>   * hda_dsp_get_stream_ldp - Retrieve the LDP (Linear DMA Position) of the stream
>   * @sdev: SOF device
> diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
> index 1609589929a1..701578ec35cf 100644
> --- a/sound/soc/sof/intel/hda.h
> +++ b/sound/soc/sof/intel/hda.h
> @@ -683,6 +683,21 @@ snd_pcm_uframes_t hda_dsp_pcm_pointer(struct snd_sof_dev *sdev,
>  				      struct snd_pcm_substream *substream);
>  int hda_dsp_pcm_ack(struct snd_sof_dev *sdev, struct snd_pcm_substream *substream);
>  
> +int hda_dsp_compr_open(struct snd_sof_dev *sdev, struct snd_compr_stream *cstream);
> +int hda_dsp_compr_close(struct snd_sof_dev *sdev, struct snd_compr_stream *cstream);
> +int hda_dsp_compr_hw_params(struct snd_sof_dev *sdev,
> +			    struct snd_compr_stream *cstream,
> +			    struct snd_compr_params *params,
> +			    struct snd_sof_platform_stream_params *platform_params);
> +int hda_dsp_stream_compr_hw_free(struct snd_sof_dev *sdev,
> +				 struct snd_compr_stream *cstream);
> +int hda_dsp_compr_trigger(struct snd_sof_dev *sdev,
> +			  struct snd_compr_stream *cstream, int cmd);
> +int hda_dsp_compr_pointer(struct snd_sof_dev *sdev, struct snd_compr_stream *cstream,
> +			  struct snd_compr_tstamp64 *tstamp);
> +u64 hda_dsp_compr_get_stream_llp(struct snd_sof_dev *sdev,
> +				 struct snd_compr_stream *cstream);
> +
>  /*
>   * DSP Stream Operations.
>   */
> diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
> index 72af1f4ff620..4afc92490fbe 100644
> --- a/sound/soc/sof/ops.h
> +++ b/sound/soc/sof/ops.h
> @@ -15,6 +15,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/kernel.h>
>  #include <linux/types.h>
> +#include <sound/compress_driver.h>
>  #include <sound/pcm.h>
>  #include "sof-priv.h"
>  
> @@ -448,6 +449,79 @@ snd_sof_pcm_platform_hw_params(struct snd_sof_dev *sdev,
>  	return 0;
>  }
>  
> +static inline int
> +snd_sof_compr_platform_open(struct snd_sof_dev *sdev, struct snd_compr_stream *cstream)
> +{
> +	if (sof_ops(sdev) && sof_ops(sdev)->compr_open)
> +		return sof_ops(sdev)->compr_open(sdev, cstream);
> +
> +	return 0;
> +}
> +
> +/* disconnect pcm substream to a host stream */
> +static inline int
> +snd_sof_compr_platform_close(struct snd_sof_dev *sdev, struct snd_compr_stream *cstream)
> +{
> +	if (sof_ops(sdev) && sof_ops(sdev)->compr_close)
> +		return sof_ops(sdev)->compr_close(sdev, cstream);
> +
> +	return 0;
> +}
> +
> +/* host stream hw params */
> +static inline int
> +snd_sof_compr_platform_hw_params(struct snd_sof_dev *sdev,
> +				 struct snd_compr_stream *cstream,
> +				 struct snd_compr_params *params,
> +				 struct snd_sof_platform_stream_params *platform_params)
> +{
> +	if (sof_ops(sdev) && sof_ops(sdev)->compr_hw_params)
> +		return sof_ops(sdev)->compr_hw_params(sdev, cstream, params, platform_params);
> +
> +	return 0;
> +}
> +
> +static inline int
> +snd_sof_compr_platform_hw_free(struct snd_sof_dev *sdev,
> +			       struct snd_compr_stream *cstream)
> +{
> +	if (sof_ops(sdev) && sof_ops(sdev)->compr_hw_free)
> +		return sof_ops(sdev)->compr_hw_free(sdev, cstream);
> +
> +	return 0;
> +}
> +
> +static inline int
> +snd_sof_compr_platform_trigger(struct snd_sof_dev *sdev,
> +			       struct snd_compr_stream *cstream, int cmd)
> +{
> +	if (sof_ops(sdev) && sof_ops(sdev)->compr_trigger)
> +		return sof_ops(sdev)->compr_trigger(sdev, cstream, cmd);
> +
> +	return 0;
> +}
> +
> +static inline int
> +snd_sof_compr_platform_pointer(struct snd_sof_dev *sdev,
> +			       struct snd_compr_stream *cstream,
> +			       struct snd_compr_tstamp64 *tstamp)
> +{
> +	if (sof_ops(sdev) && sof_ops(sdev)->compr_pointer)
> +		return sof_ops(sdev)->compr_pointer(sdev, cstream, tstamp);
> +
> +	return 0;
> +}
> +
> +static inline u64
> +snd_sof_compr_get_dai_frame_counter(struct snd_sof_dev *sdev,
> +				    struct snd_compr_stream *cstream)
> +{
> +	if (sof_ops(sdev) && sof_ops(sdev)->compr_get_dai_frame_counter)
> +		return sof_ops(sdev)->compr_get_dai_frame_counter(sdev, cstream);
> +
> +	return 0;
> +}
> +
>  /* host stream hw free */
>  static inline int
>  snd_sof_pcm_platform_hw_free(struct snd_sof_dev *sdev,
> diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
> index 38753b088fc1..560be58611c0 100644
> --- a/sound/soc/sof/sof-priv.h
> +++ b/sound/soc/sof/sof-priv.h
> @@ -256,6 +256,18 @@ struct snd_sof_dsp_ops {
>  	/* pcm ack */
>  	int (*pcm_ack)(struct snd_sof_dev *sdev, struct snd_pcm_substream *substream); /* optional */
>  
> +	int (*compr_open)(struct snd_sof_dev *sdev, struct snd_compr_stream *cstream);
> +	int (*compr_close)(struct snd_sof_dev *sdev, struct snd_compr_stream *cstream);
> +	int (*compr_hw_params)(struct snd_sof_dev *sdev, struct snd_compr_stream *cstream,
> +			       struct snd_compr_params *params,
> +			       struct snd_sof_platform_stream_params *platform_params);
> +	int (*compr_hw_free)(struct snd_sof_dev *sdev, struct snd_compr_stream *cstream);
> +	int (*compr_trigger)(struct snd_sof_dev *sdev, struct snd_compr_stream *cstream,
> +			     int cmd);
> +	int (*compr_pointer)(struct snd_sof_dev *sdev, struct snd_compr_stream *cstream,
> +			     struct snd_compr_tstamp64 *tstamp);
> +	u64 (*compr_get_dai_frame_counter)(struct snd_sof_dev *sdev,
> +					   struct snd_compr_stream *cstream);
>  	/*
>  	 * optional callback to retrieve the number of frames left/arrived from/to
>  	 * the DSP on the DAI side (link/codec/DMIC/etc).

