Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9AD2D0292
	for <linux-sound@vger.kernel.org>; Tue, 28 Apr 2026 20:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777407620; cv=none; b=YK/HgTLeFkG8hNQ6g97LxUmYsj6z1vTa1SFpLPRqLjMq1/VpZeE8J2glpig3wXv7y9zNjfW3JIoeNbca6c/HGmoZo4CVjhvIn9zH42bSdLX4+9UgjGKPjM1zAKdp3eJJRM4qN6bz8ppgzvcutGyYS5o8yV5IMp9A1TGAJ3oGkEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777407620; c=relaxed/simple;
	bh=np8ExKPjrfumKV+s8Olqvcbf0SBmYlrFgmIUW4UC76U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AI0sqs3DRYvuKlIehiJyu90zMf07o/cKhNStIBHxgHGFIUvCQwPonv3EQkcenYJ154JXhQb3NcPCT3uSDTIvqqD7JUF+TA44e8c1f+h9pKqSu/klltst8Tv2kM0innuJLqMpCzAVNrz5kAl5nv32+OcKtGJfETk/S2Dbs6Jv/Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dpMbGoFd; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dpMbGoFd"
Message-ID: <cb90c6dd-5976-4aef-92c4-e7f6b91fda90@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777407615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZcVGt/Hpd4Zcz0OXe6tKXaw5WcCjoJxfu8B8XnnzZJA=;
	b=dpMbGoFd5RQ8/UY8QtdvRFZefexGxKR1UpIU2tYY32/50yfDzh62RYyOXC3f7w1v+aB6li
	Ooyz8bCZ5xVjlXphALJiwFvgapnPKqlUw+Cn/c8E3jMjFEwys3ttykK+Qq4kFxop5/IThX
	EnrRb5ELZecXyVJMkm/RVZVDN60H+3s=
Date: Tue, 28 Apr 2026 22:18:17 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] ASoC: SDCA: Add correct masks whilst reporting SDCA
 jack status
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 peter.ujfalusi@linux.intel.com, linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20260427115925.3801099-1-ckeepax@opensource.cirrus.com>
 <20260427115925.3801099-2-ckeepax@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260427115925.3801099-2-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 4/27/26 13:59, Charles Keepax wrote:
> Currently, all SDCA jacks simply report against a mask of 0xFFFF. This
> works fine for system with a single SDCA jack control as the status
> reflects that single control at all times. However, if two SDCA
> jack controls exist in the system, such as a separate representation for
> input and output, then the second control can cancel reports from the
> other since it will only report its relevant bits and zero in all other
> slots. This is exactly what the mask is for.
> 
> Build up a mask using all the possible states for an SCDA jack control
> at registration time and use that mask when reporting a particular jack.
> It is worth noting this still doesn't handle cases such as two headphone
> jacks as that would require separate ALSA jacks to report to.

I couldn't quite get the last sentence. If you have two functions for separate headphones, where would you have a conflict?
Don't you have separate ALSA jacks created independently by each function?

Or are you referring to a case with two headphone jacks in the same function, which I believe is possible in some optional topologies for e.g. karaoke applications.

> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>  include/sound/sdca_jack.h  |  3 ++
>  sound/soc/sdca/sdca_jack.c | 75 ++++++++++++++++++++++----------------
>  2 files changed, 47 insertions(+), 31 deletions(-)
> 
> diff --git a/include/sound/sdca_jack.h b/include/sound/sdca_jack.h
> index 3ec22046d3ebc..181541f0f4d8c 100644
> --- a/include/sound/sdca_jack.h
> +++ b/include/sound/sdca_jack.h
> @@ -18,10 +18,13 @@ struct snd_soc_jack;
>   * struct jack_state - Jack state structure to keep data between interrupts
>   * @kctl: Pointer to the ALSA control attached to this jack
>   * @jack: Pointer to the ASoC jack struct for this jack
> + * @mask: Possible reported jack status bits for this jack
>   */
>  struct jack_state {
>  	struct snd_kcontrol *kctl;
>  	struct snd_soc_jack *jack;
> +
> +	unsigned int mask;
>  };
>  
>  int sdca_jack_alloc_state(struct sdca_interrupt *interrupt);
> diff --git a/sound/soc/sdca/sdca_jack.c b/sound/soc/sdca/sdca_jack.c
> index 49d317d3b8c85..be2506f38c711 100644
> --- a/sound/soc/sdca/sdca_jack.c
> +++ b/sound/soc/sdca/sdca_jack.c
> @@ -145,6 +145,32 @@ int sdca_jack_alloc_state(struct sdca_interrupt *interrupt)
>  }
>  EXPORT_SYMBOL_NS_GPL(sdca_jack_alloc_state, "SND_SOC_SDCA");
>  
> +static int type_get_mask(enum sdca_terminal_type type)
> +{
> +	switch (type) {
> +	case SDCA_TERM_TYPE_LINEIN_STEREO:
> +	case SDCA_TERM_TYPE_LINEIN_FRONT_LR:
> +	case SDCA_TERM_TYPE_LINEIN_CENTER_LFE:
> +	case SDCA_TERM_TYPE_LINEIN_SURROUND_LR:
> +	case SDCA_TERM_TYPE_LINEIN_REAR_LR:
> +		return SND_JACK_LINEIN;
> +	case SDCA_TERM_TYPE_LINEOUT_STEREO:
> +	case SDCA_TERM_TYPE_LINEOUT_FRONT_LR:
> +	case SDCA_TERM_TYPE_LINEOUT_CENTER_LFE:
> +	case SDCA_TERM_TYPE_LINEOUT_SURROUND_LR:
> +	case SDCA_TERM_TYPE_LINEOUT_REAR_LR:
> +		return SND_JACK_LINEOUT;
> +	case SDCA_TERM_TYPE_MIC_JACK:
> +		return SND_JACK_MICROPHONE;
> +	case SDCA_TERM_TYPE_HEADPHONE_JACK:
> +		return SND_JACK_HEADPHONE;
> +	case SDCA_TERM_TYPE_HEADSET_JACK:
> +		return SND_JACK_HEADSET;
> +	default:
> +		return 0;
> +	}
> +}
> +
>  /**
>   * sdca_jack_set_jack - attach an ASoC jack to SDCA
>   * @info: SDCA interrupt information.
> @@ -154,7 +180,8 @@ EXPORT_SYMBOL_NS_GPL(sdca_jack_alloc_state, "SND_SOC_SDCA");
>   */
>  int sdca_jack_set_jack(struct sdca_interrupt_info *info, struct snd_soc_jack *jack)
>  {
> -	int i, ret;
> +	int i, j;
> +	int ret;
>  
>  	guard(mutex)(&info->irq_lock);
>  
> @@ -162,6 +189,7 @@ int sdca_jack_set_jack(struct sdca_interrupt_info *info, struct snd_soc_jack *ja
>  		struct sdca_interrupt *interrupt = &info->irqs[i];
>  		struct sdca_control *control = interrupt->control;
>  		struct sdca_entity *entity = interrupt->entity;
> +		struct sdca_control_range *range;
>  		struct jack_state *jack_state;
>  
>  		if (!interrupt->irq)
> @@ -169,9 +197,23 @@ int sdca_jack_set_jack(struct sdca_interrupt_info *info, struct snd_soc_jack *ja
>  
>  		switch (SDCA_CTL_TYPE(entity->type, control->sel)) {
>  		case SDCA_CTL_TYPE_S(GE, DETECTED_MODE):
> +			range = sdca_selector_find_range(interrupt->dev, entity,
> +							 SDCA_CTL_GE_SELECTED_MODE,
> +							 SDCA_SELECTED_MODE_NCOLS, 0);
> +			if (!range)
> +				return -EINVAL;
> +
>  			jack_state = interrupt->priv;
>  			jack_state->jack = jack;
>  
> +			for (j = 0; j < range->rows; j++) {
> +				enum sdca_terminal_type type;
> +
> +				type = sdca_range(range, SDCA_SELECTED_MODE_TERM_TYPE, j);
> +
> +				jack_state->mask |= type_get_mask(type);
> +			}
> +
>  			/* Report initial state in case IRQ was already handled */
>  			ret = sdca_jack_report(interrupt);
>  			if (ret)
> @@ -191,7 +233,6 @@ int sdca_jack_report(struct sdca_interrupt *interrupt)
>  	struct jack_state *jack_state = interrupt->priv;
>  	struct sdca_control_range *range;
>  	enum sdca_terminal_type type;
> -	unsigned int report = 0;
>  	unsigned int reg, val;
>  	int ret;
>  
> @@ -213,35 +254,7 @@ int sdca_jack_report(struct sdca_interrupt *interrupt)
>  	type = sdca_range_search(range, SDCA_SELECTED_MODE_INDEX,
>  				 val, SDCA_SELECTED_MODE_TERM_TYPE);
>  
> -	switch (type) {
> -	case SDCA_TERM_TYPE_LINEIN_STEREO:
> -	case SDCA_TERM_TYPE_LINEIN_FRONT_LR:
> -	case SDCA_TERM_TYPE_LINEIN_CENTER_LFE:
> -	case SDCA_TERM_TYPE_LINEIN_SURROUND_LR:
> -	case SDCA_TERM_TYPE_LINEIN_REAR_LR:
> -		report = SND_JACK_LINEIN;
> -		break;
> -	case SDCA_TERM_TYPE_LINEOUT_STEREO:
> -	case SDCA_TERM_TYPE_LINEOUT_FRONT_LR:
> -	case SDCA_TERM_TYPE_LINEOUT_CENTER_LFE:
> -	case SDCA_TERM_TYPE_LINEOUT_SURROUND_LR:
> -	case SDCA_TERM_TYPE_LINEOUT_REAR_LR:
> -		report = SND_JACK_LINEOUT;
> -		break;
> -	case SDCA_TERM_TYPE_MIC_JACK:
> -		report = SND_JACK_MICROPHONE;
> -		break;
> -	case SDCA_TERM_TYPE_HEADPHONE_JACK:
> -		report = SND_JACK_HEADPHONE;
> -		break;
> -	case SDCA_TERM_TYPE_HEADSET_JACK:
> -		report = SND_JACK_HEADSET;
> -		break;
> -	default:
> -		break;
> -	}
> -
> -	snd_soc_jack_report(jack_state->jack, report, 0xFFFF);
> +	snd_soc_jack_report(jack_state->jack, type_get_mask(type), jack_state->mask);
>  
>  	return 0;
>  }

