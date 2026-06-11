Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BD43659E8
	for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 08:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781165823; cv=none; b=ndGvALpyvo8y98mNWKEBAJ2NuzBxJP127NE5Iswm7P61G7ERkkN9YKsOd3jm7yKl7PR3p5lzES0botSEoRNd7LDwxSlTtMysp8q4bN00WvviY6THV0Xgmep4VRxC4Tw5lv9sISSeFB2P1r4yeLKVe3zeOPKXPJqH8itJhHsZ29I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781165823; c=relaxed/simple;
	bh=WytsYE+L1laCdvMGwP8uN5Ir9iquRk9gtRRzsnpN2nw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MVR7ll+SFfXk/J5H731wiV2RShG8ivs997RylVJtCoTSuuU2dQAml6VQxumOPc5ocI02LrtNQy5Iju+w3dtU4pA2c8uWMrgyveTCUScHSUUNSFlJXqmZRCpHyWsxDzaHa1RieftG1XX4j2/GfABRv6WLacZQyxQ5HdCH4w0IejE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=UBGq3oZg; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="UBGq3oZg"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490b64c8311so83945705e9.3
        for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 01:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781165819; x=1781770619; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zoiq5NgKRX1DRsdChedCw+S75QetxhREZMAZtFGcN0o=;
        b=UBGq3oZgH3qAtJacqvzGzScFzLweVqv2b/zSAs2m1cGWFFmgmF68wVJk9jlDBBjaY/
         azQOQmFey76eFqHfYPBPDePNDkvcvUWwYwa0kO30xnXo+EhKHVHs9WkljSbkInnvYQju
         CCUScCV/042sVOSdrWRuuciFBKMtogPONJBOPIQBD4epMNUQiZAd84QwcMl3DOLVk8ep
         RdnwLcxuGe3fyqmgJr8y1AW73x9fOvhs8eW9zqr3/L9DanQh2W7ycgDFc8hGdLTaesuF
         QO807uj/JFdmIG5Kv7ZLIcUBwFMgN6U71oOzwULVJMdmOyY0bcqE0kawY01yZMB3PJI7
         TN4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781165819; x=1781770619;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Zoiq5NgKRX1DRsdChedCw+S75QetxhREZMAZtFGcN0o=;
        b=fpzYQdmFW5cLU1UOf+AKy8Oh9LSIiYj6Gz+U3HwjST7Xm9Jobcmb2tOK5znJbRWicw
         EvT26iXIGpH754ED3moY1O13MubIZzsMe5orMxc8xJKfN2HCKGUT5k/19dKG0aDeaLHW
         8LYRo3yghH6cUqX1YgN2KFzXlijDKUTrwLseo1ne7RSW7Fhvl5JyvYAWYcB6Lrg/bQPa
         LxqvIOQe2htLgI0Ggwf+tQ75+c34e4z4rs5e6G5GDmNahrSYhAFqls4iA8hv1Gm2037g
         nC/4D3RlpMyQczTeDIV8fZYXEqlPB7o1zXSzkaMNZrHn2VpSUihMJ/IapC0OMfwhBsvQ
         H/CA==
X-Forwarded-Encrypted: i=1; AFNElJ8jZS3y8ovIk8t1kpGUie1GYOJNei9lOgARrbEbFbQs0J9XTSiMGZO+S5W1wGXNgfJqg6WcZ32aT6lBpg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbu/FwwICYMA15o1VY/9ei+OztA2AlqVUmNQ8SgmHekU2IXc8c
	ME2iGdbigpzu6aBTe+B6BcMN0MXiRA42dy5woBCWQGZhn7C5bCkDGrgM/M5teqZgdQc=
X-Gm-Gg: Acq92OGo+aUixGhaaTP9XOvA1/9Tq7IV9LlfeHg7EAP8iKGXAiR5p0CkOcUy47iDSNB
	PTlcnh+dgFdfA2dy0mI10Au5HHfe8qF21QKj8YdxuzlKitw4AEMqZJs7qommoZ2S0mXjd79NTsG
	5LqyFK+85s2Ze/qTNbMQIf6/TbE9vZSNHhzr66BCbEr2IpxyxdHENcSuKH6VOl+01CEM9VmxQ6h
	wVHrrOvO8iBVA5anx706Dr0/pbDreouz/Clx++GDbwTwAITOx9PXUjqn8cdNTBR3C2ThJyCMsAW
	lsx1vhmomk1ts5AQDd/Iep87c0Hnhj8uhJvSVWJsUGhGvAG+uMtwR4riLlTCGBusBtdh6f3x8/V
	UFhJ7gc7wB47XGbLl3PExHEgAWqRqcomYiAxLlne4V2J5THLNLLh+CQ9MumXm239UDCKsBFJG5u
	aXJRHTTPKCkzHHtDKMMfxveN1HwRSmV0rW
X-Received: by 2002:a05:600d:8492:b0:490:b355:9c70 with SMTP id 5b1f17b1804b1-490e55e2130mr10999335e9.11.1781165818648;
        Thu, 11 Jun 2026 01:16:58 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1d1b:88ba:5161:3581])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4601f2dc577sm80589967f8f.3.2026.06.11.01.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 01:16:58 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Valerio Setti <vsetti@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
  Jaroslav Kysela <perex@perex.cz>,  Takashi Iwai <tiwai@suse.com>,  Neil
 Armstrong <neil.armstrong@linaro.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-kernel@vger.kernel.org,
  linux-sound@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v2 2/4] ASoC: meson: aiu-encoder-i2s: prepare for
 multiple streams
In-Reply-To: <20260610-reshape-aiu-as-axg-v2-2-cac3663a8b51@baylibre.com>
	(Valerio Setti's message of "Wed, 10 Jun 2026 23:29:26 +0200")
References: <20260610-reshape-aiu-as-axg-v2-0-cac3663a8b51@baylibre.com>
	<20260610-reshape-aiu-as-axg-v2-2-cac3663a8b51@baylibre.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 11 Jun 2026 10:16:56 +0200
Message-ID: <1jik7pebk7.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On mer. 10 juin 2026 at 23:29, Valerio Setti <vsetti@baylibre.com> wrote:

> aiu-encoder-i2s is going to be the interface that handles both playback
> and capture, so this commit does all the required changes to prepare
> for that since so far it only handled playback:
> - probe/remove functions are added to allocate/free per stream data,
>   respectively.
> - 'struc gx_iface' and 'struct gx_stream' are used to store interface or
>   stream associated data, respecively.
> - interface wide rate symmetry is enforced.
> - quirks on bclk are also enforced if/when necessary.
>
> Clock-wise instead of bulk enabling all the clocks on startup and disabling
> them on shutdown, only the peripheral's internal ones are enabled/disabled
> in those functions, whereas MCLK and I2S clock divider are handled in
> prepare/hw_free.
>
> Finally a trigger() callback is also added to start/stop the associated
> I2S data formatter.
>
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>
> ---
>  sound/soc/meson/aiu-encoder-i2s.c | 207 ++++++++++++++++++++++++++++++++++----
>  sound/soc/meson/aiu.h             |   3 +
>  2 files changed, 193 insertions(+), 17 deletions(-)
>
> diff --git a/sound/soc/meson/aiu-encoder-i2s.c b/sound/soc/meson/aiu-encoder-i2s.c
> index 3b4061508c18047fe8d6f3f98061720f8ce238f2..f50b03824ad280afabb31eecc20ccb855defa11e 100644
> --- a/sound/soc/meson/aiu-encoder-i2s.c
> +++ b/sound/soc/meson/aiu-encoder-i2s.c
> @@ -10,6 +10,8 @@
>  #include <sound/soc-dai.h>
>  
>  #include "aiu.h"
> +#include "gx-formatter.h"
> +#include "gx-interface.h"
>  
>  #define AIU_I2S_SOURCE_DESC_MODE_8CH	BIT(0)
>  #define AIU_I2S_SOURCE_DESC_MODE_24BIT	BIT(5)
> @@ -112,6 +114,9 @@ static int aiu_encoder_i2s_set_more_div(struct snd_soc_component *component,
>  					struct snd_pcm_hw_params *params,
>  					unsigned int bs)
>  {
> +	struct aiu *aiu = snd_soc_component_get_drvdata(component);
> +	struct gx_iface *iface = &aiu->i2s.iface;
> +
>  	/*
>  	 * NOTE: this HW is odd.
>  	 * In most configuration, the i2s divider is 'mclk / blck'.
> @@ -126,6 +131,18 @@ static int aiu_encoder_i2s_set_more_div(struct snd_soc_component *component,
>  			return -EINVAL;
>  		}
>  		bs += bs / 2;
> +		iface->bs_quirk = true;
> +	} else {
> +		/*
> +		 * If the bs quirk is currently applied for one stream and another
> +		 * ones tries to setup a configuration for which the quirk is
> +		 * not required, then fail.
> +		 */
> +		if (iface->bs_quirk) {
> +			dev_err(component->dev,
> +				"bclk requirements are incompatible with active stream\n");
> +			return -EINVAL;

This comment is not blocking thing IMO, more a request for future
improvments.

What I do not like here is the user may get an unexpected failure while
setting up the stream, because of something that did not show up the
contrainst we provided. IOW, it is kind of too late.

The problem is not new to this driver, the same applies to the error
returned if bs is not a multiple of 2 :(

It would be nice if this problem could be reflected in the contraints
to avoid returning an error this late in the stream setup.


> +		}
>  	}
>  
>  	/* Use CLK_MORE for mclk to bclk divider */
> @@ -145,14 +162,15 @@ static int aiu_encoder_i2s_set_clocks(struct snd_soc_component *component,
>  				      struct snd_pcm_hw_params *params)
>  {
>  	struct aiu *aiu = snd_soc_component_get_drvdata(component);
> +	struct gx_iface *iface = &aiu->i2s.iface;
>  	unsigned int srate = params_rate(params);
>  	unsigned int fs, bs;
>  	int ret;
>  
>  	/* Get the oversampling factor */
> -	fs = DIV_ROUND_CLOSEST(clk_get_rate(aiu->i2s.clks[MCLK].clk), srate);
> +	fs = DIV_ROUND_CLOSEST(iface->mclk_rate, srate);
>  
> -	if (fs % 64)
> +	if ((fs % 64) || (fs == 0))
>  		return -EINVAL;
>  
>  	/* Send data MSB first */
> @@ -188,24 +206,59 @@ static int aiu_encoder_i2s_hw_params(struct snd_pcm_substream *substream,
>  				     struct snd_pcm_hw_params *params,
>  				     struct snd_soc_dai *dai)
>  {
> +	struct gx_stream *ts = snd_soc_dai_get_dma_data(dai, substream);
> +	struct gx_iface *iface = ts->iface;
>  	struct snd_soc_component *component = dai->component;
>  	int ret;
>  
> -	/* Disable the clock while changing the settings */
> -	aiu_encoder_i2s_divider_enable(component, false);
> +	/*
> +	 * Enforce interface wide rate symmetry only if there is more than
> +	 * 1 stream active.
> +	 */
> +	if (snd_soc_dai_active(dai) > 1) {
> +		if (iface->rate && iface->rate != params_rate(params)) {
> +			dev_err(dai->dev, "can't set iface rate (%d != %d)\n",
> +				iface->rate, params_rate(params));
> +			return -EINVAL;
> +		}
> +	}
>  
>  	ret = aiu_encoder_i2s_setup_desc(component, params);
>  	if (ret) {
> -		dev_err(dai->dev, "setting i2s desc failed\n");
> +		dev_err(dai->dev, "setting i2s desc failed: %d\n", ret);
>  		return ret;
>  	}
>  
>  	ret = aiu_encoder_i2s_set_clocks(component, params);
>  	if (ret) {
> -		dev_err(dai->dev, "setting i2s clocks failed\n");
> +		dev_err(dai->dev, "setting i2s clocks failed: %d\n", ret);
>  		return ret;
>  	}
>  
> +	iface->rate = params_rate(params);
> +	ts->physical_width = params_physical_width(params);
> +	ts->width = params_width(params);
> +	ts->channels = params_channels(params);
> +
> +	return 0;
> +}
> +
> +static int aiu_encoder_i2s_prepare(struct snd_pcm_substream *substream,
> +				   struct snd_soc_dai *dai)
> +{
> +	struct gx_stream *ts = snd_soc_dai_get_dma_data(dai, substream);
> +	struct snd_soc_component *component = dai->component;
> +	int ret;
> +
> +	if (ts->clk_enabled)
> +		return 0;
> +
> +	ret = clk_prepare_enable(ts->iface->mclk);
> +	if (ret)
> +		return ret;
> +
> +	ts->clk_enabled = true;
> +
>  	aiu_encoder_i2s_divider_enable(component, true);
>  
>  	return 0;
> @@ -214,9 +267,24 @@ static int aiu_encoder_i2s_hw_params(struct snd_pcm_substream *substream,
>  static int aiu_encoder_i2s_hw_free(struct snd_pcm_substream *substream,
>  				   struct snd_soc_dai *dai)
>  {
> +	struct gx_stream *ts = snd_soc_dai_get_dma_data(dai, substream);
> +	struct gx_iface *iface = ts->iface;
>  	struct snd_soc_component *component = dai->component;
>  
> -	aiu_encoder_i2s_divider_enable(component, false);
> +	/*
> +	 * If this is the last substream being closed then disable the i2s
> +	 * clock divider and clear 'iface->rate'.
> +	 */
> +	if (snd_soc_dai_active(dai) <= 1) {
> +		aiu_encoder_i2s_divider_enable(component, 0);
> +		iface->rate = 0;
> +		iface->bs_quirk = false;
> +	}
> +
> +	if (ts->clk_enabled) {
> +		clk_disable_unprepare(ts->iface->mclk);
> +		ts->clk_enabled = false;
> +	}
>  
>  	return 0;
>  }
> @@ -224,6 +292,8 @@ static int aiu_encoder_i2s_hw_free(struct snd_pcm_substream *substream,
>  static int aiu_encoder_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
>  {
>  	struct snd_soc_component *component = dai->component;
> +	struct aiu *aiu = snd_soc_component_get_drvdata(component);
> +	struct gx_iface *iface = &aiu->i2s.iface;
>  	unsigned int inv = fmt & SND_SOC_DAIFMT_INV_MASK;
>  	unsigned int val = 0;
>  	unsigned int skew;
> @@ -255,9 +325,12 @@ static int aiu_encoder_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
>  		skew = 0;
>  		break;
>  	default:
> +		dev_err(dai->dev, "unsupported dai format\n");
>  		return -EINVAL;
>  	}
>  
> +	iface->fmt = fmt;
> +
>  	val |= FIELD_PREP(AIU_CLK_CTRL_LRCLK_SKEW, skew);
>  	snd_soc_component_update_bits(component, AIU_CLK_CTRL,
>  				      AIU_CLK_CTRL_LRCLK_INVERT |
> @@ -272,6 +345,7 @@ static int aiu_encoder_i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id,
>  				      unsigned int freq, int dir)
>  {
>  	struct aiu *aiu = snd_soc_component_get_drvdata(dai->component);
> +	struct gx_iface *iface = &aiu->i2s.iface;
>  	int ret;
>  
>  	if (WARN_ON(clk_id != 0))
> @@ -280,11 +354,15 @@ static int aiu_encoder_i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id,
>  	if (dir == SND_SOC_CLOCK_IN)
>  		return 0;
>  
> -	ret = clk_set_rate(aiu->i2s.clks[MCLK].clk, freq);
> -	if (ret)
> -		dev_err(dai->dev, "Failed to set sysclk to %uHz", freq);
> +	ret = clk_set_rate(iface->mclk, freq);
> +	if (ret) {
> +		dev_err(dai->dev, "Failed to set sysclk to %uHz: %d", freq, ret);
> +		return ret;
> +	}
>  
> -	return ret;
> +	iface->mclk_rate = freq;
> +
> +	return 0;
>  }
>  
>  static const unsigned int hw_channels[] = {2, 8};
> @@ -305,15 +383,35 @@ static int aiu_encoder_i2s_startup(struct snd_pcm_substream *substream,
>  					 SNDRV_PCM_HW_PARAM_CHANNELS,
>  					 &hw_channel_constraints);
>  	if (ret) {
> -		dev_err(dai->dev, "adding channels constraints failed\n");
> +		dev_err(dai->dev, "adding channels constraints failed: %d\n", ret);
>  		return ret;
>  	}
>  
> -	ret = clk_bulk_prepare_enable(aiu->i2s.clk_num, aiu->i2s.clks);
> -	if (ret)
> -		dev_err(dai->dev, "failed to enable i2s clocks\n");
> +	/*
> +	 * Enable only clocks which are required for the interface internal
> +	 * logic. MCLK is enabled/disabled from the formatter and the I2S
> +	 * divider is enabled/disabled in "hw_params"/"hw_free", respectively.
> +	 */
> +	ret = clk_prepare_enable(aiu->i2s.clks[PCLK].clk);
> +	if (ret) {
> +		dev_err(dai->dev, "failed to enable PCLK: %d\n", ret);
> +		return ret;
> +	}
> +	ret = clk_prepare_enable(aiu->i2s.clks[MIXER].clk);
> +	if (ret) {
> +		dev_err(dai->dev, "failed to enable MIXER: %d\n", ret);
> +		clk_disable_unprepare(aiu->i2s.clks[PCLK].clk);
> +		return ret;
> +	}
> +	ret = clk_prepare_enable(aiu->i2s.clks[AOCLK].clk);
> +	if (ret) {
> +		dev_err(dai->dev, "failed to enable AOCLK: %d\n", ret);
> +		clk_disable_unprepare(aiu->i2s.clks[MIXER].clk);
> +		clk_disable_unprepare(aiu->i2s.clks[PCLK].clk);
> +		return ret;
> +	}
>  
> -	return ret;
> +	return 0;
>  }
>  
>  static void aiu_encoder_i2s_shutdown(struct snd_pcm_substream *substream,
> @@ -321,14 +419,89 @@ static void aiu_encoder_i2s_shutdown(struct snd_pcm_substream *substream,
>  {
>  	struct aiu *aiu = snd_soc_component_get_drvdata(dai->component);
>  
> -	clk_bulk_disable_unprepare(aiu->i2s.clk_num, aiu->i2s.clks);
> +	clk_disable_unprepare(aiu->i2s.clks[AOCLK].clk);
> +	clk_disable_unprepare(aiu->i2s.clks[MIXER].clk);
> +	clk_disable_unprepare(aiu->i2s.clks[PCLK].clk);
> +}
> +
> +static int aiu_encoder_i2s_trigger(struct snd_pcm_substream *substream,
> +				   int cmd,
> +				   struct snd_soc_dai *dai)
> +{
> +	struct gx_stream *ts = snd_soc_dai_get_dma_data(dai, substream);
> +	int ret;
> +
> +	switch (cmd) {
> +	case SNDRV_PCM_TRIGGER_START:
> +	case SNDRV_PCM_TRIGGER_RESUME:
> +	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +		ret = gx_stream_start(ts);
> +		break;
> +	case SNDRV_PCM_TRIGGER_SUSPEND:
> +	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> +	case SNDRV_PCM_TRIGGER_STOP:
> +		gx_stream_stop(ts);
> +		ret = 0;
> +		break;
> +	default:
> +		ret = -EINVAL;
> +	}
> +
> +	return ret;
> +}
> +
> +static int aiu_encoder_i2s_remove_dai(struct snd_soc_dai *dai)
> +{
> +	int stream;
> +
> +	for_each_pcm_streams(stream) {
> +		struct gx_stream *ts;
> +
> +		ts = snd_soc_dai_dma_data_get(dai, stream);
> +		if (ts)
> +			gx_stream_free(ts);
> +
> +		snd_soc_dai_dma_data_set(dai, stream, NULL);
> +	}
> +
> +	return 0;
> +}
> +
> +static int aiu_encoder_i2s_probe_dai(struct snd_soc_dai *dai)
> +{
> +	struct aiu *aiu = snd_soc_dai_get_drvdata(dai);
> +	struct gx_iface *iface = &aiu->i2s.iface;
> +	int stream;
> +
> +	for_each_pcm_streams(stream) {
> +		struct gx_stream *ts;
> +
> +		if (!snd_soc_dai_get_widget(dai, stream))
> +			continue;
> +
> +		ts = gx_stream_alloc(iface);
> +		if (!ts) {
> +			aiu_encoder_i2s_remove_dai(dai);
> +			return -ENOMEM;
> +		}
> +		snd_soc_dai_dma_data_set(dai, stream, ts);
> +	}
> +
> +	iface->mclk = aiu->i2s.clks[MCLK].clk;
> +	iface->mclk_rate = clk_get_rate(iface->mclk);
> +
> +	return 0;
>  }
>  
>  const struct snd_soc_dai_ops aiu_encoder_i2s_dai_ops = {
> +	.probe		= aiu_encoder_i2s_probe_dai,
> +	.remove		= aiu_encoder_i2s_remove_dai,
>  	.hw_params	= aiu_encoder_i2s_hw_params,
> +	.prepare	= aiu_encoder_i2s_prepare,
>  	.hw_free	= aiu_encoder_i2s_hw_free,
>  	.set_fmt	= aiu_encoder_i2s_set_fmt,
>  	.set_sysclk	= aiu_encoder_i2s_set_sysclk,
>  	.startup	= aiu_encoder_i2s_startup,
>  	.shutdown	= aiu_encoder_i2s_shutdown,
> +	.trigger	= aiu_encoder_i2s_trigger,
>  };
> diff --git a/sound/soc/meson/aiu.h b/sound/soc/meson/aiu.h
> index 0f94c8bf608181112d78402532b832eb50c2d409..68310de0bdf7a97d8de2ff306c159248ee9b0ede 100644
> --- a/sound/soc/meson/aiu.h
> +++ b/sound/soc/meson/aiu.h
> @@ -7,6 +7,8 @@
>  #ifndef _MESON_AIU_H
>  #define _MESON_AIU_H
>  
> +#include "gx-formatter.h"
> +
>  struct clk;
>  struct clk_bulk_data;
>  struct device;
> @@ -25,6 +27,7 @@ struct aiu_interface {
>  	struct clk_bulk_data *clks;
>  	unsigned int clk_num;
>  	int irq;
> +	struct gx_iface iface;
>  };
>  
>  struct aiu_platform_data {

-- 
Jerome
