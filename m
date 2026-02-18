Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E80337694
	for <linux-sound@vger.kernel.org>; Wed, 18 Feb 2026 22:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771454259; cv=none; b=OMRPpvsvo/mnzuSnLbQuHkhqzyy1y9gjBJNGlFmm1pJYfe3Udf0d5DXl7hk2S1wCf26w7wFyXUFZMqDlNTqahAKF4zlXErEZpQKoSx3Oe4aBsCcnpngM1eCzM3lGJjq28g+v9W8Vf35/YrRAXiqykb5ZgTx+GdKzohCSSWTVJBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771454259; c=relaxed/simple;
	bh=9dVqXDY0LTUqLurnaE5POkAkdNIedxmUa8hwO20EQWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MxkSecPAEu2NnPeKmb7Z2YVJV4RsFAhBXGgvEWcWlPXgAwivwk8uQaHKkMiZMo7ba8lxFxQzKOSayCSBoQaNurxJPcxMUZlZzn/f19fX3GRHxRFrLnTx8uAYfWOZYR+x+NW9Az4KiBfgcyk6Br2Zl/pC6vnjwXJefi/WuX7V40Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KQUEKXCB; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KQUEKXCB"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b9047e72201so54926866b.2
        for <linux-sound@vger.kernel.org>; Wed, 18 Feb 2026 14:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771454257; x=1772059057; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=88VC8PAAdqBSKkHPJCPW55gpFIgzZNDj1Z17Jhhh5Es=;
        b=KQUEKXCBGVeR294t9YRPRW5BYy2/uHw1mBj2EHjy6eUEd6Vx+rT48J7G+iB8XAbmDQ
         33jcyfTfDtMwC2zMjDiLC/yKvE/feKuYM1CP8yTOoW1LsZNGUct0gdbQRTye9Qvloccw
         r9c5YpQ/tgR4UtV3Oqdrn2TUTvXjeWybiG5a96uKbxaMY5MPP+tUYQZxybe2Db0PjN8p
         wWR2bDAGsYGj3k+WEZAwiKrZUxF254oOtQofe0FkVMV3/UFX5P4nhdkBFsD68TZJgLNB
         8nR5Qznn+8drundU4F7039a3XaWLtkjpHBs/q9MIN92ssNoE87zQUFkfwHM2Fbn/Z3Ib
         uu8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771454257; x=1772059057;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=88VC8PAAdqBSKkHPJCPW55gpFIgzZNDj1Z17Jhhh5Es=;
        b=w1erwlA0rtmPHMA1LeBXSzyjWoZk+9cpEOqQ54Q8Zl9sw74lJiHHj0bz2B/40P190g
         3ttjs/p5HJM2OTuC1h2VHZamwsNtu9V/UmrPeViX8ONoO/LqZxbaU7LcuvQmF3NzHQhW
         C5lbiEqNvQjECwBMLKyHjMaaCDDt4DOumILA8ODs7b8VfivUlPcySHmrcrPhl3UpJw0k
         X9vVUOQl5YAaFQhceJL0y1VKNesKjIT9m4BQKAyLFxmGYTTHr+yaPQvleNsGXgsQiczc
         n31Etoh+gLRGKtM77VNcys2qU79N1AArCYd0t9CHn+9TfIp/lusAlcDZ7HHaWllVY86u
         NXwA==
X-Gm-Message-State: AOJu0YzsIRv3BZuperSvctpYflQGUrTq+2PGe1Btx7qT5VOFPmQEjO+W
	KbRyme8NU2UlJE2+h3huyUn/JI3RzDK/jOq4em+HGN0OtdT+oRd4+gc+
X-Gm-Gg: AZuq6aI8YpLtitK5Xb64/8OstrqQuyQmhoPd7Du5R+59e0Fe7f2uap+TkPRnUvOWE3p
	ImWDKDlReOm0L1d1mqmgpeHv6yA55UgHRuIdxO1o/Kir16OHMs5D1r0Tf0bWYjLzCWYbnCYveGl
	NSED24H4YmhBm3mUXgvhwdg73EPrWu64UiBvnvEfXKs7UNhEgvHUqCzDTD24lH7sm6+R6ujuDJt
	zMAnsuJ1Z8FLSIF2op7QYrpF04NgeTR9CQoO9knZZcEm2DUGKC4ddO7sTogefNKHG1izIwLLWVZ
	1qvcVKFtbPQkPtooJEZJfoLlI+x7jK4aZpTMuKyRLXJVLTs5dvtZ/QNZi1LcpfMgoHw1miUYt9i
	rCc7miwXBTqOIGwv+DZNNvVvAt2kvXbpMqYunjtQBUQlSkGcTkjyt/haHm6lly9xqBn1d4jc4mO
	CaANqYaNOic5JgEw==
X-Received: by 2002:a17:906:794d:b0:b87:756b:cfb3 with SMTP id a640c23a62f3a-b8fc3a32d80mr851341266b.19.1771454256440;
        Wed, 18 Feb 2026 14:37:36 -0800 (PST)
Received: from jekhomev ([46.251.53.180])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc766519fsm475142866b.48.2026.02.18.14.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 14:37:35 -0800 (PST)
Date: Thu, 19 Feb 2026 00:37:35 +0200
From: Yauhen Kharuzhy <jekhor@gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
	Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, Hans de Goede <hansg@kernel.org>
Subject: Re: [PATCH v1 1/2] ASoC: Intel: cht_yogabook: Add driver for Lenovo
 Yoga Book tablets
Message-ID: <aZY71atHyeZBE44B@jekhomev>
References: <20260217231324.1319392-1-jekhor@gmail.com>
 <20260217231324.1319392-2-jekhor@gmail.com>
 <218a9abc-87ab-45e2-8ec5-355cd6bd627b@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <218a9abc-87ab-45e2-8ec5-355cd6bd627b@linux.dev>

On Wed, Feb 18, 2026 at 11:31:38AM +0100, Pierre-Louis Bossart wrote:
> Thanks for the patch, looks mostly good to me, see below a couple of comments.
> 
> > +static int cht_yb_hp_event(struct snd_soc_dapm_widget *w,
> > +			   struct snd_kcontrol *k, int event)
> > +{
> > +	struct snd_soc_card *card = snd_soc_dapm_to_card(w->dapm);
> > +	struct cht_mc_private *ctx = snd_soc_card_get_drvdata(card);
> > +
> > +	dev_dbg(card->dev, "HP event: %s\n",
> > +		SND_SOC_DAPM_EVENT_ON(event) ? "ON" : "OFF");
> > +
> > +	if (SND_SOC_DAPM_EVENT_ON(event)) {
> > +		msleep(20);
> > +		gpiod_set_value_cansleep(ctx->gpio_hp_en, 1);
> > +		msleep(50);
> > +	} else {
> > +		gpiod_set_value_cansleep(ctx->gpio_hp_en, 0);
> > +	}
> 
> It'd be worth having a comment on why you need the 2 separate msleep.
> IIRC for Broadwell we only had a common 70ms sleep for both enable and disable.

Actually I don't know, it just a copy-paste from the Lenovo Android
kernel code, and I didn't check what happens if this sleeps are removed,
AFAIR, if there are any sound artifacts or something else.

Will check.

> 
> > +
> > +	return 0;
> > +}
> > +
> > +static int cht_yb_spk_event(struct snd_soc_dapm_widget *w,
> > +			    struct snd_kcontrol *k, int event)
> > +{
> > +	struct snd_soc_card *card = snd_soc_dapm_to_card(w->dapm);
> > +	struct cht_mc_private *ctx = snd_soc_card_get_drvdata(card);
> > +
> > +	dev_dbg(card->dev, "SPK event: %s\n",
> > +		SND_SOC_DAPM_EVENT_ON(event) ? "ON" : "OFF");
> > +
> > +	/* Black magic from the Lenovo's Android kernel
> > +	 * FIXME: Check if it is needed, an original comment:
> > +	 * "use gpio GPIO_SPK_EN to enable/disable ext boost pa
> > +	 * use mode 3"
> > +	 */
> > +	if (SND_SOC_DAPM_EVENT_ON(event)) {
> > +		gpiod_set_value_cansleep(ctx->gpio_spk_en1, 1);
> > +		udelay(2);
> > +		gpiod_set_value_cansleep(ctx->gpio_spk_en1, 0);
> > +		udelay(2);
> > +		gpiod_set_value_cansleep(ctx->gpio_spk_en1, 1);
> > +		udelay(2);
> > +		gpiod_set_value_cansleep(ctx->gpio_spk_en1, 0);
> > +		udelay(2);
> > +	}
> 
> That seems weird indeed, never seen this before. What happens if that block is removed?

Sure. Will check, I cannot remember if I checked this during initial porting...

> 
> > +	gpiod_set_value_cansleep(ctx->gpio_spk_en1,
> > +				 SND_SOC_DAPM_EVENT_ON(event));
> > +	gpiod_set_value_cansleep(ctx->gpio_spk_en2,
> > +				 SND_SOC_DAPM_EVENT_ON(event));
> > +	msleep(50);
> > +
> > +	return 0;
> > +}
> > +
> 
> > +static int cht_yb_codec_fixup(struct snd_soc_pcm_runtime *rtd,
> > +			      struct snd_pcm_hw_params *params)
> > +{
> > +	struct snd_interval *rate = hw_param_interval(params,
> > +			SNDRV_PCM_HW_PARAM_RATE);
> > +	struct snd_interval *channels = hw_param_interval(params,
> > +						SNDRV_PCM_HW_PARAM_CHANNELS);
> > +
> > +	/* The DSP will convert the FE rate to 48k, stereo, 24bits */
> > +	rate->min = rate->max = 48000;
> > +	channels->min = channels->max = 2;
> > +
> > +	/*
> > +	 * set SSP2 to 24-bit
> > +	 * Looks like strange black magic because ssp2-port supports S16LE
> > +	 * format only, taken from Intel's code
> > +	 */
> 
> No, SSP2 supports 24 bits in TDM mode. only SSP0 has firmware restrictions to S16LE.

Thanks, I even don't remember why I added this comment. To be removed.

> 
> > +	params_set_format(params, SNDRV_PCM_FORMAT_S24_LE);
> > +
> > +	return 0;
> > +}
> > +
> > +static struct snd_soc_jack_pin cht_yb_jack_pins[] = {
> > +	{
> > +		.pin = "Headphone",
> > +		.mask = SND_JACK_HEADPHONE,
> > +	},
> > +	{
> > +		.pin = "Headset Mic",
> > +		.mask = SND_JACK_MICROPHONE,
> > +	},
> > +};
> > +

-- 
Yauhen Kharuzhy
