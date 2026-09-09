Received: from mta1.migadu.com (out-9.mta1.migadu.com [95.215.58.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADCF5678CA
	for <linux-sound@vger.kernel.org>; Wed,  9 Sep 2026 14:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963788; cv=none; b=pIWxK1cCsZuSlnr8Ca2ZPP1P19uqw+2uRcSiccSRxojT4nz91jl8QG4AWczakcJjBZ25zgp884VmExbdeLJ+1CNI5K969dwA3enVG+1fy0++7fIrtatpmyY1HCdrLoaFbKguPqFQpkGX9bF2eSpwJBx4WnAWsO0iUPjP0wGRUJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963788; c=relaxed/simple;
	bh=Tf9zrXTNN0zmJTl5nVRNf5p0V9kogeIlmm8TLBOwR20=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lwZS7f52HqzjFynkNpC7VcSwpW42LypCGlh9T+A11yUt3PMAE2f7TYVvIQvxLr7FpUHn5LdGrSrPlQtENtVafKoY+rkPbADCCbDGRBEmwunNfAXSLQK1k03RiF9AsdeB0fm+v/GJpDOlrDUFTEbuAek8EI8QG2oLoUS+5PuMN6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=CqbbamN7; arc=none smtp.client-ip=95.215.58.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="CqbbamN7"
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Tf9zrXTNN0zmJTl5nVRNf5p0V9kogeIlmm8TLBOwR20=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788963784; v=1; x=1789568584;
 b=CqbbamN7tl9Vxp8GwDCQnERzYn1AgBagbuOqDuYUk3yX2PgbEBibBKa132hhQaa/iHXjBI18
 puwpFECPJf1gMqPKn/cRUtJqhGESt708fPWZI+/XjLO37QZheti2fgc/VS0aafwKkA9dgFhYUmj
 k6gfIzmZpO2bQfQZVF6p2gOY=
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a9149a129d7d54c3;
	Wed, 09 Sep 2026 14:23:03 +0000
X-Mizu-Trace-ID: a9149a129d7d54c3
X-Migadu-Flow: FLOW_OUT
Message-ID: <f57fb6d1-31d8-46cc-be16-aaa85fce99a0@linux.dev>
Date: Wed, 9 Sep 2026 14:39:53 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/24] ASoC: SOF: sof-audio: do not dereference
 swidget->spipe unconditionally on free
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, vkoul@kernel.org,
 perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com, broonie@kernel.org,
 srinivas.kandagatla@oss.qualcomm.com
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, daniel.baluta@nxp.com
References: <20260909090949.7503-1-peter.ujfalusi@linux.intel.com>
 <20260909090949.7503-10-peter.ujfalusi@linux.intel.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260909090949.7503-10-peter.ujfalusi@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/9/26 11:09, Peter Ujfalusi wrote:
> sof_widget_free_unlocked() dereferences swidget->spipe without checking
> it for two things: swidget->spipe->complete for a scheduler widget, and
> swidget->spipe->pipe_widget for the recursive free of the pipeline's
> scheduler widget. Both can be reached with spipe or pipe_widget not
> set, which oopses in the free path - where there is nothing left to
> bail out to.
> 
> Check both before use and cache swidget->spipe in the local spipe
> variable that is already there. A widget with no pipeline has nothing
> to put or complete, and no scheduler widget to free, so skipping is the
> correct behaviour.
> 
> No functional change for a widget that was successfully set up:
> sof_widget_setup_unlocked() already rejects a dynamic pipeline widget
> with no spipe or no spipe->pipe_widget with -EINVAL.
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
> ---
>  sound/soc/sof/sof-audio.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

same, this doesn't seem directly related to compresss offload. Maybe
it's required because of new transitions?

I'd move this earlier or submit as a cleanup separately to reduce the
volume of reviews (24 patches!)

> diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
> index d244e90a734b..0b2f41f4a59b 100644
> --- a/sound/soc/sof/sof-audio.c
> +++ b/sound/soc/sof/sof-audio.c
> @@ -103,7 +103,7 @@ static int sof_widget_free_unlocked(struct snd_sof_dev *sdev,
>  	 * decrement ref count for cores associated with all modules in the pipeline and clear
>  	 * the complete flag
>  	 */
> -	if (swidget->id == snd_soc_dapm_scheduler) {
> +	if (swidget->id == snd_soc_dapm_scheduler && spipe) {
>  		int i;
>  
>  		for_each_set_bit(i, &spipe->core_mask, sdev->num_cores) {
> @@ -115,16 +115,16 @@ static int sof_widget_free_unlocked(struct snd_sof_dev *sdev,
>  					err = ret;
>  			}
>  		}
> -		swidget->spipe->complete = 0;
> +		spipe->complete = 0;
>  	}
>  
>  	/*
>  	 * free the scheduler widget (same as pipe_widget) associated with the current swidget.
>  	 * skip for static pipelines
>  	 */
> -	if (swidget->spipe && swidget->dynamic_pipeline_widget &&
> +	if (spipe && spipe->pipe_widget && swidget->dynamic_pipeline_widget &&
>  	    swidget->id != snd_soc_dapm_scheduler) {
> -		ret = sof_widget_free_unlocked(sdev, swidget->spipe->pipe_widget);
> +		ret = sof_widget_free_unlocked(sdev, spipe->pipe_widget);
>  		if (ret < 0 && !err)
>  			err = ret;
>  	}

