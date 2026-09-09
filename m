Received: from mta1.migadu.com (out-2.mta1.migadu.com [95.215.58.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86363585962
	for <linux-sound@vger.kernel.org>; Wed,  9 Sep 2026 14:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963787; cv=none; b=Q65aX6Bd5gBlPklxma1imRSDSBwhKwqM+khv0F/lXmzkPbkEXzhCb7XBSCLTDCfTr0q3oLv77PYIwQIQ9ssz1GyheOIGT/iC63RnLxMNh9KbHw16Rh7h8AnpDwo3o5JHHDQsCh71j9VbKJWfldk+z9h+XOvM72S63F88PemFLaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963787; c=relaxed/simple;
	bh=EZhEwQ6QGp5HfIjGKy+t+153DwillUikC1BYTzXeyso=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k/kkdvTZqbN4cvrJF4uLoCzQI7B4btRXwcsbcWcG8ROlCXf1N5WDs+Y1Yd6TmFWfSJzkYR2uc3kFWq1W7/jCIv5kje4U4g3LLDU8uNUom8JLFbp5kAlNY9OqAuoHZq79kxra+wMZIPQH875u/xTwbDUf0QFmEjNln9sOTkjGC7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=g+HAfh3j; arc=none smtp.client-ip=95.215.58.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="g+HAfh3j"
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=EZhEwQ6QGp5HfIjGKy+t+153DwillUikC1BYTzXeyso=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788963783; v=1; x=1789568583;
 b=g+HAfh3jhzZaEADuFNdrWN7XjhRZc1DHeqtxmsqBrxmq+W4wR67IasJj2S0Ea94H6W+JU6VB
 rbQXDZIVdR38iCRi0ugTCxk0WBXla2P5BDHOZiMx3ieV8QYA3L606q7ZKIGj7esfXV76txc0xp0
 JrVYmEZ8bbpnUVH8T8ldQufs=
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a8be21bb767692ac;
	Wed, 09 Sep 2026 14:23:02 +0000
X-Mizu-Trace-ID: a8be21bb767692ac
X-Migadu-Flow: FLOW_OUT
Message-ID: <3fa25bea-1525-41d6-b4e3-2b16ddd59e92@linux.dev>
Date: Wed, 9 Sep 2026 14:37:31 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/24] ASoC: SOF: ipc4-pcm: harden pipeline teardown
 races
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, vkoul@kernel.org,
 perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com, broonie@kernel.org,
 srinivas.kandagatla@oss.qualcomm.com
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, daniel.baluta@nxp.com
References: <20260909090949.7503-1-peter.ujfalusi@linux.intel.com>
 <20260909090949.7503-9-peter.ujfalusi@linux.intel.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260909090949.7503-9-peter.ujfalusi@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/9/26 11:09, Peter Ujfalusi wrote:
> Serialize trigger/free with pipeline_state_mutex and validate
> pipeline entries before use.
> 
> Also clear pipeline_list->count when freeing lists to avoid stale
> entries during concurrent teardown.
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
> ---
>  sound/soc/sof/ipc4-pcm.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)

not clear to me what this has to do with compress-offload?

Can this be moved earlier in this patchset, or even submitted separately?

> diff --git a/sound/soc/sof/ipc4-pcm.c b/sound/soc/sof/ipc4-pcm.c
> index 5929ecf6642e..9d4be9ef4403 100644
> --- a/sound/soc/sof/ipc4-pcm.c
> +++ b/sound/soc/sof/ipc4-pcm.c
> @@ -434,12 +434,16 @@ static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
>  	spcm_dbg(spcm, substream->stream, "cmd: %d, state: %d\n", cmd, state);
>  
>  	pipeline_list = &spcm->stream[substream->stream].pipeline_list;
> +	guard(mutex)(&ipc4_data->pipeline_state_mutex);
>  
>  	/* nothing to trigger if the list is empty */
>  	if (!pipeline_list->pipelines || !pipeline_list->count)
>  		return 0;
>  
>  	spipe = pipeline_list->pipelines[0];
> +	if (!spipe || !spipe->pipe_widget || !spipe->pipe_widget->private)
> +		return 0;
> +
>  	pipe_widget = spipe->pipe_widget;
>  	pipeline = pipe_widget->private;
>  
> @@ -487,8 +491,6 @@ static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
>  		return -ENOMEM;
>  	}
>  
> -	guard(mutex)(&ipc4_data->pipeline_state_mutex);
> -
>  	/*
>  	 * IPC4 requires pipelines to be triggered in order starting at the sink and
>  	 * walking all the way to the source. So traverse the pipeline_list in the order
> @@ -501,12 +503,16 @@ static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
>  	if (state == SOF_IPC4_PIPE_RUNNING || state == SOF_IPC4_PIPE_RESET)
>  		for (i = pipeline_list->count - 1; i >= 0; i--) {
>  			spipe = pipeline_list->pipelines[i];
> +			if (!spipe || !spipe->pipe_widget || !spipe->pipe_widget->private)
> +				continue;
>  			sof_ipc4_add_pipeline_to_trigger_list(sdev, state, spipe, trigger_list,
>  							      pipe_priority);
>  		}
>  	else
>  		for (i = 0; i < pipeline_list->count; i++) {
>  			spipe = pipeline_list->pipelines[i];
> +			if (!spipe || !spipe->pipe_widget || !spipe->pipe_widget->private)
> +				continue;
>  			sof_ipc4_add_pipeline_to_trigger_list(sdev, state, spipe, trigger_list,
>  							      pipe_priority);
>  		}
> @@ -546,6 +552,8 @@ static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
>  	/* update PAUSED state for all pipelines just triggered */
>  	for (i = 0; i < pipeline_list->count ; i++) {
>  		spipe = pipeline_list->pipelines[i];
> +		if (!spipe || !spipe->pipe_widget || !spipe->pipe_widget->private)
> +			continue;
>  		sof_ipc4_update_pipeline_state(sdev, SOF_IPC4_PIPE_PAUSED, cmd, spipe,
>  					       trigger_list);
>  	}
> @@ -589,6 +597,8 @@ static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
>  	/* update RUNNING/RESET state for all pipelines that were just triggered */
>  	for (i = 0; i < pipeline_list->count; i++) {
>  		spipe = pipeline_list->pipelines[i];
> +		if (!spipe || !spipe->pipe_widget || !spipe->pipe_widget->private)
> +			continue;
>  		sof_ipc4_update_pipeline_state(sdev, state, cmd, spipe, trigger_list);
>  	}
>  
> @@ -903,13 +913,17 @@ static int sof_ipc4_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
>  static void sof_ipc4_pcm_free(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm)
>  {
>  	struct snd_sof_pcm_stream_pipeline_list *pipeline_list;
> +	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
>  	struct sof_ipc4_pcm_stream_priv *stream_priv;
>  	int stream;
>  
> +	guard(mutex)(&ipc4_data->pipeline_state_mutex);
> +
>  	for_each_pcm_streams(stream) {
>  		pipeline_list = &spcm->stream[stream].pipeline_list;
>  		kfree(pipeline_list->pipelines);
>  		pipeline_list->pipelines = NULL;
> +		pipeline_list->count = 0;
>  
>  		stream_priv = spcm->stream[stream].private;
>  		kfree(stream_priv->time_info);

