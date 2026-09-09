Received: from mta0.migadu.com (out-83.mta0.migadu.com [91.218.175.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EAE5678E5
	for <linux-sound@vger.kernel.org>; Wed,  9 Sep 2026 14:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963790; cv=none; b=ST9U+tfozbmtoahs03fjtXC/lZEZkC9mru+h/o5CfAJvpzVmBSRyJI3lOUJU754/SwLxOZ3Tsr3ItVv8ka2leg7jqNVuT3IdNR0hRo3j7NQTt7rqUITXQfwwCZaWajhK8zOm/repT734AxDQWUkYhRntrBupLYoJcvrAJ/GZFUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963790; c=relaxed/simple;
	bh=al7K8gfcKMCHsx5sFrUfKjgXrWCv4euEOf6Wh1C7fD4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BlkUhmcmuhCb4oPZMelBET1ZJC9OkkI3AU+6W6KQKL+YGRsTvnf1O4+7XoFf1Y+H6PpvvJXZpXJfX+mn7m1OXFLfW5nOUy6kbyJtgbxEXGOrAb2VyLdYRAQvgYq7xZIu92qCnZ+6xhIA4fD6YiiS2jLXX3pcoVWE2MOA+iPU0R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=M3tor/rb; arc=none smtp.client-ip=91.218.175.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="M3tor/rb"
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=al7K8gfcKMCHsx5sFrUfKjgXrWCv4euEOf6Wh1C7fD4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788963786; v=1; x=1789568586;
 b=M3tor/rbuda1ymRUh9NQ062E+AYAP5pleOHJWXIPkj/qTxO6beaaqWytxYcFcWm1WDOVKtB+
 UZJ+7gRTTdEMrNm2mF3nuqxKWB3ZC1t9xwERyU4VIMThjdh0X5evJNjZxSLsKXBGWbe85f7WHPO
 eFIHx+XZlL9MDhvX4hXKB0VU=
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6f9e99ac30dc3b1d;
	Wed, 09 Sep 2026 14:23:05 +0000
X-Mizu-Trace-ID: 6f9e99ac30dc3b1d
X-Migadu-Flow: FLOW_OUT
Message-ID: <837e06dc-6291-4d25-9e48-93044b7d5b62@linux.dev>
Date: Wed, 9 Sep 2026 14:43:29 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/24] ASoC: SOF: pcm: Modify the signature of a couple
 of PCM IPC ops
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, vkoul@kernel.org,
 perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com, broonie@kernel.org,
 srinivas.kandagatla@oss.qualcomm.com
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, daniel.baluta@nxp.com
References: <20260909090949.7503-1-peter.ujfalusi@linux.intel.com>
 <20260909090949.7503-12-peter.ujfalusi@linux.intel.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260909090949.7503-12-peter.ujfalusi@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/9/26 11:09, Peter Ujfalusi wrote:
> From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> 
> In order to reuse the pipeline triggering logic for compressed support
> with IPC4, modify the signature of the trigger and hw_free PCM IPC ops
> so that they can be reused.
> 
> Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
> ---
>  sound/soc/sof/ipc3-pcm.c  | 26 +++++++---------------
>  sound/soc/sof/ipc4-pcm.c  | 45 ++++++++++++++++++++-------------------
>  sound/soc/sof/pcm.c       |  7 +++---
>  sound/soc/sof/sof-audio.h |  7 +++---
>  4 files changed, 39 insertions(+), 46 deletions(-)

also a prerequisite patch that should be submitted separately before the
bigger changes.

> 
> diff --git a/sound/soc/sof/ipc3-pcm.c b/sound/soc/sof/ipc3-pcm.c
> index 1d0c80466f6a..42f93e596598 100644
> --- a/sound/soc/sof/ipc3-pcm.c
> +++ b/sound/soc/sof/ipc3-pcm.c
> @@ -14,23 +14,18 @@
>  #include "sof-audio.h"
>  
>  static int sof_ipc3_pcm_hw_free(struct snd_soc_component *component,
> -				struct snd_pcm_substream *substream)
> +				struct snd_pcm_substream *substream,
> +				struct snd_sof_pcm *spcm, int dir)
>  {
>  	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
> -	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
>  	struct sof_ipc_stream stream;
> -	struct snd_sof_pcm *spcm;
> -
> -	spcm = snd_sof_find_spcm_dai(component, rtd);
> -	if (!spcm)
> -		return -EINVAL;
>  
> -	if (!spcm->prepared[substream->stream])
> +	if (!spcm->prepared[dir])
>  		return 0;
>  
>  	stream.hdr.size = sizeof(stream);
>  	stream.hdr.cmd = SOF_IPC_GLB_STREAM_MSG | SOF_IPC_STREAM_PCM_FREE;
> -	stream.comp_id = spcm->stream[substream->stream].comp_id;
> +	stream.comp_id = spcm->stream[dir].comp_id;
>  
>  	/* send IPC to the DSP */
>  	return sof_ipc_tx_message_no_reply(sdev->ipc, &stream, sizeof(stream));
> @@ -141,20 +136,15 @@ static int sof_ipc3_pcm_hw_params(struct snd_soc_component *component,
>  }
>  
>  static int sof_ipc3_pcm_trigger(struct snd_soc_component *component,
> -				struct snd_pcm_substream *substream, int cmd)
> +				struct snd_pcm_substream *substream,
> +				struct snd_sof_pcm *spcm, int cmd, int dir)
>  {
> -	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
>  	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
>  	struct sof_ipc_stream stream;
> -	struct snd_sof_pcm *spcm;
> -
> -	spcm = snd_sof_find_spcm_dai(component, rtd);
> -	if (!spcm)
> -		return -EINVAL;
>  
>  	stream.hdr.size = sizeof(stream);
>  	stream.hdr.cmd = SOF_IPC_GLB_STREAM_MSG;
> -	stream.comp_id = spcm->stream[substream->stream].comp_id;
> +	stream.comp_id = spcm->stream[dir].comp_id;
>  
>  	switch (cmd) {
>  	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> @@ -172,7 +162,7 @@ static int sof_ipc3_pcm_trigger(struct snd_soc_component *component,
>  		stream.hdr.cmd |= SOF_IPC_STREAM_TRIG_STOP;
>  		break;
>  	default:
> -		spcm_err(spcm, substream->stream, "Unhandled trigger cmd %d\n", cmd);
> +		spcm_err(spcm, dir, "Unhandled trigger cmd %d\n", cmd);
>  		return -EINVAL;
>  	}
>  
> diff --git a/sound/soc/sof/ipc4-pcm.c b/sound/soc/sof/ipc4-pcm.c
> index 9d4be9ef4403..6e8522d03a2b 100644
> --- a/sound/soc/sof/ipc4-pcm.c
> +++ b/sound/soc/sof/ipc4-pcm.c
> @@ -412,28 +412,23 @@ static int sof_ipc4_chain_dma_trigger(struct snd_sof_dev *sdev,
>  }
>  
>  static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
> -				      struct snd_pcm_substream *substream, int state, int cmd)
> +				      struct snd_pcm_substream *substream, int state, int cmd,
> +				      struct snd_sof_pcm *spcm, int dir)
>  {
>  	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
> -	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
>  	struct snd_sof_pcm_stream_pipeline_list *pipeline_list;
>  	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
>  	struct ipc4_pipeline_set_state_data *trigger_list;
>  	struct snd_sof_widget *pipe_widget;
>  	struct sof_ipc4_pipeline *pipeline;
>  	struct snd_sof_pipeline *spipe;
> -	struct snd_sof_pcm *spcm;
>  	u8 *pipe_priority;
>  	int ret;
>  	int i;
>  
> -	spcm = snd_sof_find_spcm_dai(component, rtd);
> -	if (!spcm)
> -		return -EINVAL;
> +	spcm_dbg(spcm, dir, "cmd: %d, state: %d\n", cmd, state);
>  
> -	spcm_dbg(spcm, substream->stream, "cmd: %d, state: %d\n", cmd, state);
> -
> -	pipeline_list = &spcm->stream[substream->stream].pipeline_list;
> +	pipeline_list = &spcm->stream[dir].pipeline_list;
>  	guard(mutex)(&ipc4_data->pipeline_state_mutex);
>  
>  	/* nothing to trigger if the list is empty */
> @@ -454,9 +449,9 @@ static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
>  	if (pipeline->use_chain_dma) {
>  		struct sof_ipc4_timestamp_info *time_info;
>  
> -		time_info = sof_ipc4_sps_to_time_info(&spcm->stream[substream->stream]);
> +		time_info = sof_ipc4_sps_to_time_info(&spcm->stream[dir]);
>  
> -		ret = sof_ipc4_chain_dma_trigger(sdev, spcm, substream->stream,
> +		ret = sof_ipc4_chain_dma_trigger(sdev, spcm, dir,
>  						 pipeline_list, state, cmd);
>  		if (ret || !time_info)
>  			return ret;
> @@ -465,12 +460,16 @@ static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
>  			/*
>  			 * Record the DAI position for delay reporting
>  			 * To handle multiple pause/resume/xrun we need to add
> -			 * the positions to simulate how the firmware behaves
> +			 * the positions to simulate how the firmware behaves.
> +			 * Chained DMA does not support compress streams. We should
> +			 * never get here with compress.
>  			 */
> -			u64 pos = snd_sof_pcm_get_dai_frame_counter(sdev, component,
> -								    substream);
> +			if (substream) {
> +				u64 pos = snd_sof_pcm_get_dai_frame_counter(sdev, component,
> +									    substream);
>  
> -			time_info->stream_end_offset += pos;
> +				time_info->stream_end_offset += pos;
> +			}
>  		} else if (state == SOF_IPC4_PIPE_RESET) {
>  			/* Reset the end offset as the stream is stopped */
>  			time_info->stream_end_offset = 0;
> @@ -533,7 +532,7 @@ static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
>  	 */
>  	ret = sof_ipc4_set_multi_pipeline_state(sdev, SOF_IPC4_PIPE_PAUSED, trigger_list);
>  	if (ret < 0) {
> -		spcm_err(spcm, substream->stream, "failed to pause all pipelines\n");
> +		spcm_err(spcm, dir, "failed to pause all pipelines\n");
>  		/*
>  		 * workaround: if the firmware is crashed or the IPC timed out
>  		 * while setting the pipeline state we must ignore the error
> @@ -566,7 +565,7 @@ static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
>  		 * Invalidate the stream_start_offset to make sure that it is
>  		 * going to be updated if the stream resumes
>  		 */
> -		time_info = sof_ipc4_sps_to_time_info(&spcm->stream[substream->stream]);
> +		time_info = sof_ipc4_sps_to_time_info(&spcm->stream[dir]);
>  		if (time_info)
>  			time_info->stream_start_offset = SOF_IPC4_INVALID_STREAM_POSITION;
>  
> @@ -576,7 +575,7 @@ static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
>  	/* else set the RUNNING/RESET state in the DSP */
>  	ret = sof_ipc4_set_multi_pipeline_state(sdev, state, trigger_list);
>  	if (ret < 0) {
> -		spcm_err(spcm, substream->stream,
> +		spcm_err(spcm, dir,
>  			 "failed to set final state %d for all pipelines\n",
>  			 state);
>  		/*
> @@ -609,7 +608,8 @@ static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
>  }
>  
>  static int sof_ipc4_pcm_trigger(struct snd_soc_component *component,
> -				struct snd_pcm_substream *substream, int cmd)
> +				struct snd_pcm_substream *substream,
> +				struct snd_sof_pcm *spcm, int cmd, int dir)
>  {
>  	int state;
>  
> @@ -631,14 +631,15 @@ static int sof_ipc4_pcm_trigger(struct snd_soc_component *component,
>  	}
>  
>  	/* set the pipeline state */
> -	return sof_ipc4_trigger_pipelines(component, substream, state, cmd);
> +	return sof_ipc4_trigger_pipelines(component, substream, state, cmd, spcm, dir);
>  }
>  
>  static int sof_ipc4_pcm_hw_free(struct snd_soc_component *component,
> -				struct snd_pcm_substream *substream)
> +				struct snd_pcm_substream *substream,
> +				struct snd_sof_pcm *spcm, int dir)
>  {
>  	/* command is not relevant with RESET, so just pass 0 */
> -	return sof_ipc4_trigger_pipelines(component, substream, SOF_IPC4_PIPE_RESET, 0);
> +	return sof_ipc4_trigger_pipelines(component, substream, SOF_IPC4_PIPE_RESET, 0, spcm, dir);
>  }
>  
>  static int ipc4_ssp_dai_config_pcm_params_match(struct snd_sof_dev *sdev,
> diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
> index 8f59c200b8ec..42738f12fa33 100644
> --- a/sound/soc/sof/pcm.c
> +++ b/sound/soc/sof/pcm.c
> @@ -152,7 +152,7 @@ static int sof_pcm_hw_params(struct snd_soc_component *component,
>  	 * between. At least ALSA OSS emulation depends on this.
>  	 */
>  	if (spcm->prepared[substream->stream] && pcm_ops && pcm_ops->hw_free) {
> -		ret = pcm_ops->hw_free(component, substream);
> +		ret = pcm_ops->hw_free(component, substream, spcm, substream->stream);
>  		if (ret < 0)
>  			return ret;
>  
> @@ -223,7 +223,8 @@ static int sof_pcm_stream_free(struct snd_sof_dev *sdev,
>  
>  		/* free PCM in the DSP */
>  		if (pcm_ops && pcm_ops->hw_free) {
> -			ret = pcm_ops->hw_free(sdev->component, substream);
> +			ret = pcm_ops->hw_free(sdev->component, substream, spcm,
> +					       substream->stream);
>  			if (ret < 0) {
>  				spcm_err(spcm, substream->stream,
>  					 "pcm_ops->hw_free failed %d\n", ret);
> @@ -458,7 +459,7 @@ static int sof_pcm_trigger(struct snd_soc_component *component,
>  		snd_sof_pcm_platform_trigger(sdev, substream, cmd);
>  
>  	if (pcm_ops && pcm_ops->trigger)
> -		ret = pcm_ops->trigger(component, substream, cmd);
> +		ret = pcm_ops->trigger(component, substream, spcm, cmd, substream->stream);
>  
>  	switch (cmd) {
>  	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
> index 1b3e66037584..0610f2ab844d 100644
> --- a/sound/soc/sof/sof-audio.h
> +++ b/sound/soc/sof/sof-audio.h
> @@ -125,9 +125,10 @@ struct sof_ipc_pcm_ops {
>  	int (*hw_params)(struct snd_soc_component *component, struct snd_pcm_substream *substream,
>  			 struct snd_pcm_hw_params *params,
>  			 struct snd_sof_platform_stream_params *platform_params);
> -	int (*hw_free)(struct snd_soc_component *component, struct snd_pcm_substream *substream);
> -	int (*trigger)(struct snd_soc_component *component,  struct snd_pcm_substream *substream,
> -		       int cmd);
> +	int (*hw_free)(struct snd_soc_component *component, struct snd_pcm_substream *substream,
> +		       struct snd_sof_pcm *spcm, int dir);
> +	int (*trigger)(struct snd_soc_component *component, struct snd_pcm_substream *substream,
> +		       struct snd_sof_pcm *spcm, int cmd, int dir);
>  	int (*dai_link_fixup)(struct snd_soc_pcm_runtime *rtd, struct snd_pcm_hw_params *params);
>  	int (*pcm_setup)(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm);
>  	void (*pcm_free)(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm);

