Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC493033FD
	for <linux-sound@vger.kernel.org>; Wed, 18 Feb 2026 10:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771411918; cv=none; b=fjBlpM0DvL+GoloXRBW6QR2z6GFtO/x6DNFFKIVTAd6X1wz1EaXhBKzDpzrmwaZdwXtS2oVELNyEEzjLR6W3ex93JoQ++9x+8nOnZjVdB/Cil7pjDfaQEyjIMHwBaAm5gg8tANZl+g6d5yBulvHN48uWjYtx2OH7y/6KKyAIzXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771411918; c=relaxed/simple;
	bh=FB5tBEhX7XBYKnECrjfh9Pkc0VS9rDvHZH+oigfzwxg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ATtiJqTxZEOaFxLKsLtbs2dFIuxXVoCicJJmzrDSrKWooc7lFp/Nttfy8pNwXJYai7HC7VokAvy+RHzB0mP9oXfNuYY7KxIl4hrx7B7kQtZ9ADxhTAqCtFWHMmEz9GwHFvIORY2CI6pDVVb32XTOyk1sBv9ZSK2XH2YL7t+ToCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=L05lLSw8; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="L05lLSw8"
Message-ID: <218a9abc-87ab-45e2-8ec5-355cd6bd627b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771411904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iLnlQ31lFnQKK5X6iah0P7xj7CW718n/ceFhkV87OVA=;
	b=L05lLSw8wfnpOVbizn7AsOAg7FgRd7gOTkVrKjuNmC75kRuZEryrEU3RKatdwVOLoWSoWQ
	JN4I7w3gLJ+R0XZgfs3wLlt4XCO7dTv8Z2nWPYfEuTXC3FnyI29nmDWbTOhZssTjTjZY2a
	upa1bRvku0fM3rWUfTt39BXpe7CVQ6I=
Date: Wed, 18 Feb 2026 11:31:38 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v1 1/2] ASoC: Intel: cht_yogabook: Add driver for Lenovo
 Yoga Book tablets
To: Yauhen Kharuzhy <jekhor@gmail.com>, linux-sound@vger.kernel.org,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, Hans de Goede <hansg@kernel.org>
References: <20260217231324.1319392-1-jekhor@gmail.com>
 <20260217231324.1319392-2-jekhor@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260217231324.1319392-2-jekhor@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Thanks for the patch, looks mostly good to me, see below a couple of comments.

> +static int cht_yb_hp_event(struct snd_soc_dapm_widget *w,
> +			   struct snd_kcontrol *k, int event)
> +{
> +	struct snd_soc_card *card = snd_soc_dapm_to_card(w->dapm);
> +	struct cht_mc_private *ctx = snd_soc_card_get_drvdata(card);
> +
> +	dev_dbg(card->dev, "HP event: %s\n",
> +		SND_SOC_DAPM_EVENT_ON(event) ? "ON" : "OFF");
> +
> +	if (SND_SOC_DAPM_EVENT_ON(event)) {
> +		msleep(20);
> +		gpiod_set_value_cansleep(ctx->gpio_hp_en, 1);
> +		msleep(50);
> +	} else {
> +		gpiod_set_value_cansleep(ctx->gpio_hp_en, 0);
> +	}

It'd be worth having a comment on why you need the 2 separate msleep.
IIRC for Broadwell we only had a common 70ms sleep for both enable and disable.

> +
> +	return 0;
> +}
> +
> +static int cht_yb_spk_event(struct snd_soc_dapm_widget *w,
> +			    struct snd_kcontrol *k, int event)
> +{
> +	struct snd_soc_card *card = snd_soc_dapm_to_card(w->dapm);
> +	struct cht_mc_private *ctx = snd_soc_card_get_drvdata(card);
> +
> +	dev_dbg(card->dev, "SPK event: %s\n",
> +		SND_SOC_DAPM_EVENT_ON(event) ? "ON" : "OFF");
> +
> +	/* Black magic from the Lenovo's Android kernel
> +	 * FIXME: Check if it is needed, an original comment:
> +	 * "use gpio GPIO_SPK_EN to enable/disable ext boost pa
> +	 * use mode 3"
> +	 */
> +	if (SND_SOC_DAPM_EVENT_ON(event)) {
> +		gpiod_set_value_cansleep(ctx->gpio_spk_en1, 1);
> +		udelay(2);
> +		gpiod_set_value_cansleep(ctx->gpio_spk_en1, 0);
> +		udelay(2);
> +		gpiod_set_value_cansleep(ctx->gpio_spk_en1, 1);
> +		udelay(2);
> +		gpiod_set_value_cansleep(ctx->gpio_spk_en1, 0);
> +		udelay(2);
> +	}

That seems weird indeed, never seen this before. What happens if that block is removed?

> +	gpiod_set_value_cansleep(ctx->gpio_spk_en1,
> +				 SND_SOC_DAPM_EVENT_ON(event));
> +	gpiod_set_value_cansleep(ctx->gpio_spk_en2,
> +				 SND_SOC_DAPM_EVENT_ON(event));
> +	msleep(50);
> +
> +	return 0;
> +}
> +

> +static int cht_yb_codec_fixup(struct snd_soc_pcm_runtime *rtd,
> +			      struct snd_pcm_hw_params *params)
> +{
> +	struct snd_interval *rate = hw_param_interval(params,
> +			SNDRV_PCM_HW_PARAM_RATE);
> +	struct snd_interval *channels = hw_param_interval(params,
> +						SNDRV_PCM_HW_PARAM_CHANNELS);
> +
> +	/* The DSP will convert the FE rate to 48k, stereo, 24bits */
> +	rate->min = rate->max = 48000;
> +	channels->min = channels->max = 2;
> +
> +	/*
> +	 * set SSP2 to 24-bit
> +	 * Looks like strange black magic because ssp2-port supports S16LE
> +	 * format only, taken from Intel's code
> +	 */

No, SSP2 supports 24 bits in TDM mode. only SSP0 has firmware restrictions to S16LE.

> +	params_set_format(params, SNDRV_PCM_FORMAT_S24_LE);
> +
> +	return 0;
> +}
> +
> +static struct snd_soc_jack_pin cht_yb_jack_pins[] = {
> +	{
> +		.pin = "Headphone",
> +		.mask = SND_JACK_HEADPHONE,
> +	},
> +	{
> +		.pin = "Headset Mic",
> +		.mask = SND_JACK_MICROPHONE,
> +	},
> +};
> +
