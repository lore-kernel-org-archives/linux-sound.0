Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9CC3339377;
	Wed, 12 Aug 2026 06:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786515104; cv=none; b=DMvCQEMYMTpCOIJHWBLg8o+mb67pXKt4dWjMNxbLceehXVGv0eer0VoZ0SVCECl3RblKHk297xdYldBYr+dj4k6rIW5m01i69Ou9wYUhg5kg37VKze620EUm9Ti4FEcM9tfEkMJhFGhZnHIv+xwhdxm6Z2Lfttr7wxyBtX7PS3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786515104; c=relaxed/simple;
	bh=5pJ46N6gX1WykQLkyViYxnhpRc5yocTt11xclEC3eg0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kdtJU4TtELPyu4Ufqt3wGadFEJwnxTQ0ZQj+AKlE5TubBxBH8PLRLdn+Amr7iTVpKYr5p8BAoVfUM54vTWdA6TQC0BDLq/h85YcEJGhscX6RCrgrxf1r/NCEIbDse2FahB8KseGsnnuHXSKSsTU1lUpfn41JHAF9+E5s3ESlw9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=dtoyCxWb; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="dtoyCxWb"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE9851596;
	Tue, 11 Aug 2026 23:11:37 -0700 (PDT)
Received: from [192.168.7.252] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 319F63F86F;
	Tue, 11 Aug 2026 23:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786515101; bh=5pJ46N6gX1WykQLkyViYxnhpRc5yocTt11xclEC3eg0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dtoyCxWbiPyCzkXwodRmMBQ1gLxOk7yoIp8TwKgi8W+GO560K7SI6FOswfvAHoQUZ
	 Mfgabkkv9Ht4W/GMwL4DT54BXXgBrU5CbBb2GpMQEa4iPhNqlFZwXFZXcFk9RdciK5
	 D2GBE6SUg9kWh2/DW04fc7HKWgzAzSJlNtLSOPH4=
Message-ID: <8c5e523a-b0ab-4cde-a80d-8f89fa9e5450@arm.com>
Date: Wed, 12 Aug 2026 07:11:38 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2] ASoC: xilinx: formatter_pcm: fix stream_data leak on
 open error
To: Rosen Penev <rosenp@gmail.com>, linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Michal Simek <michal.simek@amd.com>,
 Maruthi Srinivas Bayyavarapu <maruthi.srinivas.bayyavarapu@xilinx.com>,
 "moderated list:ARM/ZYNQ ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260811185140.27149-1-rosenp@gmail.com>
Content-Language: en-GB
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <20260811185140.27149-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/08/2026 19:51, Rosen Penev wrote:
> In xlnx_formatter_pcm_open(), stream_data is allocated and
> adata->play_stream or adata->capture_stream is assigned early.  If a
> later step, such as snd_pcm_hw_constraint_step() or
> snd_pcm_hw_constraint_integer(), fails, the function returns the error
> immediately.  ALSA does not call the close callback when open fails, so
> stream_data is leaked and the stream pointer is left dangling, pointing
> to a substream that ALSA frees.  A later interrupt would then call
> snd_pcm_period_elapsed() on the freed substream.
> 
> Free stream_data and clear the stream pointer on the error paths.
> 
> Fixes: 6f6c3c36f091 ("ASoC: xlnx: add pcm formatter platform driver")
> Assisted-by: opencode:deepseek-v4-flash-free
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> Reviewed-by: Michal Simek <michal.simek@amd.com>

Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>

> ---
>  v2: change goto label from err to error.
>  sound/soc/xilinx/xlnx_formatter_pcm.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/xilinx/xlnx_formatter_pcm.c b/sound/soc/xilinx/xlnx_formatter_pcm.c
> index b50306b0fc06..3d6f1e4046d8 100644
> --- a/sound/soc/xilinx/xlnx_formatter_pcm.c
> +++ b/sound/soc/xilinx/xlnx_formatter_pcm.c
> @@ -383,7 +383,7 @@ static int xlnx_formatter_pcm_open(struct snd_soc_component *component,
>  	if (err) {
>  		dev_err(component->dev,
>  			"Unable to set constraint on period bytes\n");
> -		return err;
> +		goto error;
>  	}
>  
>  	/* Resize the buffer bytes as divisible by 64 */
> @@ -393,7 +393,7 @@ static int xlnx_formatter_pcm_open(struct snd_soc_component *component,
>  	if (err) {
>  		dev_err(component->dev,
>  			"Unable to set constraint on buffer bytes\n");
> -		return err;
> +		goto error;
>  	}
>  
>  	/* Set periods as integer multiple */
> @@ -402,7 +402,7 @@ static int xlnx_formatter_pcm_open(struct snd_soc_component *component,
>  	if (err < 0) {
>  		dev_err(component->dev,
>  			"Unable to set constraint on periods to be integer\n");
> -		return err;
> +		goto error;
>  	}
>  
>  	/* enable DMA IOC irq */
> @@ -411,6 +411,14 @@ static int xlnx_formatter_pcm_open(struct snd_soc_component *component,
>  	writel(val, stream_data->mmio + XLNX_AUD_CTRL);
>  
>  	return 0;
> +
> +error:
> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> +		adata->play_stream = NULL;
> +	else
> +		adata->capture_stream = NULL;
> +	kfree(stream_data);
> +	return err;
>  }
>  
>  static int xlnx_formatter_pcm_close(struct snd_soc_component *component,

-- 
Regards,
Vincenzo

