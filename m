Received: from mta1.migadu.com (out-15.mta1.migadu.com [95.215.58.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810E758497E
	for <linux-sound@vger.kernel.org>; Wed,  9 Sep 2026 14:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963789; cv=none; b=ghZuLp1LDbsk6eTvzhaA5XeUL77VBRqrifqPaq+BxhSDEK7LhQutwDjcygYXgHW872dGlG6iCKyVInK31Egr17mtQ5rrKezsmoMz5MOcaSLuel5XwaPKGmZ+nNHfNvGkmGb0IJHs8+bWJCCYjQS+fUtI3aXgOtgt6TuUAmjxZbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963789; c=relaxed/simple;
	bh=7Koplo5H7H8R4q7cVXbV/U4Xhdx9kSShEJ4q0bvYtPQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qgvlAvYkYCOx8YV0krb2F00FfHOxgoqWdRXf3aVvDSn9v5VSLa16wWC5lJw+656Svq22Ms8BCaDX0aQK9C68uEV9aankEFZbYB+F2PQ4bGCkFw8FNQY+EL4OGn2m/WCkCK/KNAy3hiLz0fv9Q0kTBYwRYejFIdFpZ4g9pCuDl/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VOr5FUcX; arc=none smtp.client-ip=95.215.58.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VOr5FUcX"
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=7Koplo5H7H8R4q7cVXbV/U4Xhdx9kSShEJ4q0bvYtPQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788963785; v=1; x=1789568585;
 b=VOr5FUcXGBNnnC2JX7Mx0BqjihnLn9QnNGhpZN4MV9LRumhp+j09GVJInNxJOd49dMXYvQQQ
 fhaObowRov4EHvu6G+7/7mvpnFbQ0KclftQJFy5FO/a/NEcrjRGKuguxWo4n+OeTiIPeBIunc7g
 ffOFlAB04DFzErulnXIB0TZA=
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 535e0c7e8f48cff0;
	Wed, 09 Sep 2026 14:23:04 +0000
X-Mizu-Trace-ID: 535e0c7e8f48cff0
X-Migadu-Flow: FLOW_OUT
Message-ID: <8917f997-f94a-4846-bf6c-47146ce54ae8@linux.dev>
Date: Wed, 9 Sep 2026 14:41:12 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/24] ASoC: SOF: sof-audio: Expose a couple of
 functions
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, vkoul@kernel.org,
 perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com, broonie@kernel.org,
 srinivas.kandagatla@oss.qualcomm.com
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, daniel.baluta@nxp.com
References: <20260909090949.7503-1-peter.ujfalusi@linux.intel.com>
 <20260909090949.7503-11-peter.ujfalusi@linux.intel.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260909090949.7503-11-peter.ujfalusi@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/9/26 11:09, Peter Ujfalusi wrote:
> From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> 
> These are common functions that will also be needed for the IPC4
> compressed support.
> 
> Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
> ---
>  sound/soc/sof/pcm.c       | 6 +++---
>  sound/soc/sof/sof-audio.h | 7 ++++++-
>  2 files changed, 9 insertions(+), 4 deletions(-)

same, move to separate trivial preparation patchset

> diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
> index 941baa48b275..8f59c200b8ec 100644
> --- a/sound/soc/sof/pcm.c
> +++ b/sound/soc/sof/pcm.c
> @@ -66,7 +66,7 @@ void snd_sof_pcm_period_elapsed(struct snd_pcm_substream *substream)
>  }
>  EXPORT_SYMBOL(snd_sof_pcm_period_elapsed);
>  
> -static int
> +int
>  sof_pcm_setup_connected_widgets(struct snd_sof_dev *sdev, struct snd_soc_pcm_runtime *rtd,
>  				struct snd_sof_pcm *spcm, struct snd_pcm_hw_params *params,
>  				struct snd_sof_platform_stream_params *platform_params, int dir)
> @@ -100,8 +100,8 @@ sof_pcm_setup_connected_widgets(struct snd_sof_dev *sdev, struct snd_soc_pcm_run
>  	return 0;
>  }
>  
> -static struct snd_sof_widget *snd_sof_find_swidget_by_comp_id(struct snd_sof_dev *sdev,
> -							      int comp_id)
> +struct snd_sof_widget *snd_sof_find_swidget_by_comp_id(struct snd_sof_dev *sdev,
> +						       int comp_id)
>  {
>  	struct snd_sof_widget *swidget;
>  
> diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
> index bd5bbaf9ae44..1b3e66037584 100644
> --- a/sound/soc/sof/sof-audio.h
> +++ b/sound/soc/sof/sof-audio.h
> @@ -636,7 +636,12 @@ struct snd_sof_pcm *snd_sof_find_spcm_comp(struct snd_soc_component *scomp,
>  					   int *direction);
>  void snd_sof_pcm_period_elapsed(struct snd_pcm_substream *substream);
>  void snd_sof_pcm_init_elapsed_work(struct work_struct *work);
> -
> +int sof_pcm_setup_connected_widgets(struct snd_sof_dev *sdev, struct snd_soc_pcm_runtime *rtd,
> +				    struct snd_sof_pcm *spcm, struct snd_pcm_hw_params *params,
> +				    struct snd_sof_platform_stream_params *platform_params,
> +				    int dir);
> +struct snd_sof_widget *snd_sof_find_swidget_by_comp_id(struct snd_sof_dev *sdev,
> +						       int comp_id);
>  /*
>   * snd_sof_pcm specific wrappers for dev_dbg() and dev_err() to provide
>   * consistent and useful prints.

