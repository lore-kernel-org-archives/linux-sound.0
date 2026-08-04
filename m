Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1B043C7A5
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 08:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785833601; cv=none; b=j98nezRCOmtPsc/HIPN1kBBS84WnZI0z8rysapM6BYJabJ4pvPVCFOZy0WnrXnO8+I9N2fPipZ5ef3Nrgxo5cyHLBtQfo73Kp1VZ3I4a0nig2IjcJ5BJJtsye4Cbiecr7RX6lC7aZxoB3PH3IR48PLJ2FcJPgKRqBWgbUEHKnjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785833601; c=relaxed/simple;
	bh=J2Wo/C371jwz0CUjO5sfRv9DdNjqbeFPtMsLE424/NE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bdk4IUclpvl1o98PMVPMKqTthpFKzZHLEIXX+XBvXC3hPMhsvTCOzttHhknh0Oikexhr4j8f1rWdVJxeI7dtprm7/6s55lYP8iS0psXV3Q+arogNq5C2uGIvdn7CN1bJOe1OgN9Xmn0Nd+sxvBNpG9oVcbPvWSSuufOHAD4qXGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QUCJbheA; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QUCJbheA"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49555a0e68bso14567365e9.2
        for <linux-sound@vger.kernel.org>; Tue, 04 Aug 2026 01:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785833598; x=1786438398; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mD2cnyelQBQlCvR+VLy8TOZKwEmRMo2zf1Q53Rfs+lE=;
        b=QUCJbheAdauzKQV5NpstcknadzF7Ed7TZCN1VG2f2MhVfmK9/Dd2o/1pHlh2pK95uT
         H+OpcdPA0J+po75sJ9cYlbQ+5Y+eqaiC481b53vxVhQ1wZOOSZmftkCuvkWVflcmIivo
         iqDTM3kMG/28N2P4znfmnYJzpWbO6PXqE4dmvuIOQZ5dHf9IULKtyutCUrASIg5AF/tB
         TqJUQbp2Q0thDNrEgqUFOy892CumpfxK1y9pUwu5qz6wuoY+711sG8mIvkrpnsXyHedA
         vRLn7XpvsPg/m+j107X700aRxgBLUlsFXOTQV31qjYluBAXYxZkHE+6DHb3hsbbc7ZcM
         tArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785833598; x=1786438398;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mD2cnyelQBQlCvR+VLy8TOZKwEmRMo2zf1Q53Rfs+lE=;
        b=lHW4Gsp5VTKGYMaWSu+jLqzT0MCY83Wxl7CNFuSzfuPUk29f4WlK3oLemLpmXRs6cy
         e+Za85WVDAVqCHqgYumWQuRn3y9T5UhgLnsOqWWIrn4ZF2a3is9g/JOW0eQNtrfT+WXg
         pgy8ZM2os3GDLwVXOzQXc8Ka0EoaNLqgQ97ss4UgaYGjA9WZkPZIh/SqmVi2eIKppppO
         08agnYLUi++6znwEjkLuZBHC9V4HizO8YP3pZD80z8MKeb6jf5pjpHvv4INAjuhB22cT
         5WcOY3cF5KVDINITGecCr9vX8NSq6G54OYskxk9NYlDukCld3MNXUTkQUaiEjHStAvIu
         5glQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr/uCMN57o5frzIVg/FGEHzs0LjNZz5BFI0nUV5Jo9x38EaTn90LtOsu8EErckfbJ7Azn4j6zzxMHQlzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNZsFdr5PcRQAsGEo5UO6VzWBO5wqihat71vGkdiZirGRLcBnn
	JZXTkh9P81HzdSPb6XRC/twt/tcHbgfQhkvJ3qcBxRyiwYInl6A5Eu5zBKtr33gC
X-Gm-Gg: AR+sD11X64vMvHKCXTIZlt/qYsqmBQfXLztg7ua1ijK4tLtUbgluWSGXfeEpC8Z8as5
	BXW77vrxDVO6opfjz9YOu8wh1yedw+7LTYVK0KvB8vmO/DPLeaw8Au9ddpj4MV7+G/bF9TVVbtQ
	RVQGmLp25pKgHUC6qHeSTXWcsUayQ4i1m+M7zT2HAEnM4DkqPicVIGHcqYBFiF8TUumWvYN1sW7
	zpwW0Y/hgDDRw4Pk90i7oKRaI8DYU6JTtiLk9f6CHyutzUmnFTHpcS4yj/6MZyMMzEzXiPMYGQr
	uZ4jkWLvTdzxmqSheY9/7zxNWAdmTxE43nBma2KfI3mWBO8MPiVR62nHwcCz3xqDAdS8X4er/RD
	aLSHieK/rIIj5kqjiiFnkWPHZR8rJPiK+PBZwokqgC7Ch1qytCFKaTUZqq7PVLqcEriSThG5Qu5
	T0HTXN17Jzs3L5V9F408vUK5h5QhCQAYE2nrK5HmLVyNTzddgaXFPN
X-Received: by 2002:a05:600c:a41:b0:499:4d4a:4990 with SMTP id 5b1f17b1804b1-4994d4a4c2dmr3357375e9.3.1785833597825;
        Tue, 04 Aug 2026 01:53:17 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949f68f95sm78928385e9.0.2026.08.04.01.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 01:53:17 -0700 (PDT)
Date: Tue, 4 Aug 2026 09:54:28 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Lars-Peter Clausen <lars@metafoo.de>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	=?utf-8?B?Ik51bm8gU8OhIg==?= <nuno.sa@analog.com>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 04/44] ASoC: codecs: adau*: use .auto_selectable_formats
Message-ID: <anGort4nbJekjyq0@nsa>
References: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
 <877bm6yay6.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <877bm6yay6.wl-kuninori.morimoto.gx@renesas.com>

On Tue, Aug 04, 2026 at 12:40:49AM +0000, Kuninori Morimoto wrote:
> We can use .auto_selectable_formats. Let's adds it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---

Acked-by: Nuno Sá <nuno.sa@analog.com>

>  sound/soc/codecs/adau1372.c | 12 ++++++++++++
>  sound/soc/codecs/adau1373.c | 12 ++++++++++++
>  sound/soc/codecs/adau1701.c | 11 +++++++++++
>  sound/soc/codecs/adau17x1.c | 13 +++++++++++++
>  sound/soc/codecs/adau1977.c | 13 +++++++++++++
>  sound/soc/codecs/adau7118.c | 12 ++++++++++++
>  6 files changed, 73 insertions(+)
> 
> diff --git a/sound/soc/codecs/adau1372.c b/sound/soc/codecs/adau1372.c
> index cc174ec3a1f82..0830d7d2dd7c5 100644
> --- a/sound/soc/codecs/adau1372.c
> +++ b/sound/soc/codecs/adau1372.c
> @@ -881,12 +881,24 @@ static const struct snd_soc_component_driver adau1372_driver = {
>  	.endianness = 1,
>  };
>  
> +static const u64 adau1372_selectable_formats =
> +	SND_SOC_POSSIBLE_DAIFMT_I2S	|
> +	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
> +	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
> +	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
> +	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
> +	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
> +	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
> +	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
> +
>  static const struct snd_soc_dai_ops adau1372_dai_ops = {
>  	.set_fmt = adau1372_set_dai_fmt,
>  	.set_tdm_slot = adau1372_set_tdm_slot,
>  	.set_tristate = adau1372_set_tristate,
>  	.hw_params = adau1372_hw_params,
>  	.startup = adau1372_startup,
> +	.auto_selectable_formats = &adau1372_selectable_formats,
> +	.num_auto_selectable_formats = 1,
>  };
>  
>  #define ADAU1372_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | \
> diff --git a/sound/soc/codecs/adau1373.c b/sound/soc/codecs/adau1373.c
> index 5dd961b233ce9..aa7d3a4b9f588 100644
> --- a/sound/soc/codecs/adau1373.c
> +++ b/sound/soc/codecs/adau1373.c
> @@ -1196,10 +1196,22 @@ static int adau1373_set_dai_sysclk(struct snd_soc_dai *dai,
>  	return 0;
>  }
>  
> +static const u64 adau1373_selectable_formats =
> +	SND_SOC_POSSIBLE_DAIFMT_I2S	|
> +	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
> +	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
> +	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
> +	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
> +	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
> +	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
> +	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
> +
>  static const struct snd_soc_dai_ops adau1373_dai_ops = {
>  	.hw_params	= adau1373_hw_params,
>  	.set_sysclk	= adau1373_set_dai_sysclk,
>  	.set_fmt	= adau1373_set_dai_fmt,
> +	.auto_selectable_formats	= &adau1373_selectable_formats,
> +	.num_auto_selectable_formats	= 1,
>  };
>  
>  #define ADAU1373_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
> diff --git a/sound/soc/codecs/adau1701.c b/sound/soc/codecs/adau1701.c
> index 329ab01b62c00..505d52c636278 100644
> --- a/sound/soc/codecs/adau1701.c
> +++ b/sound/soc/codecs/adau1701.c
> @@ -627,11 +627,22 @@ static int adau1701_startup(struct snd_pcm_substream *substream,
>  #define ADAU1701_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
>  	SNDRV_PCM_FMTBIT_S24_LE)
>  
> +static const u64 adau1701_selectable_formats =
> +	SND_SOC_POSSIBLE_DAIFMT_I2S	|
> +	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
> +	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
> +	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
> +	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
> +	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
> +	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
> +
>  static const struct snd_soc_dai_ops adau1701_dai_ops = {
>  	.set_fmt	= adau1701_set_dai_fmt,
>  	.hw_params	= adau1701_hw_params,
>  	.mute_stream	= adau1701_mute_stream,
>  	.startup	= adau1701_startup,
> +	.auto_selectable_formats	= &adau1701_selectable_formats,
> +	.num_auto_selectable_formats	= 1,
>  	.no_capture_mute = 1,
>  };
>  
> diff --git a/sound/soc/codecs/adau17x1.c b/sound/soc/codecs/adau17x1.c
> index 26d7eb437ad18..45ac226b2f1bc 100644
> --- a/sound/soc/codecs/adau17x1.c
> +++ b/sound/soc/codecs/adau17x1.c
> @@ -776,6 +776,17 @@ static int adau17x1_startup(struct snd_pcm_substream *substream,
>  	return 0;
>  }
>  
> +static const u64 adau17x1_selectable_formats =
> +	SND_SOC_POSSIBLE_DAIFMT_I2S	|
> +	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
> +	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
> +	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
> +	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
> +	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
> +	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
> +	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
> +	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
> +
>  const struct snd_soc_dai_ops adau17x1_dai_ops = {
>  	.hw_params	= adau17x1_hw_params,
>  	.set_sysclk	= adau17x1_set_dai_sysclk,
> @@ -783,6 +794,8 @@ const struct snd_soc_dai_ops adau17x1_dai_ops = {
>  	.set_pll	= adau17x1_set_dai_pll,
>  	.set_tdm_slot	= adau17x1_set_dai_tdm_slot,
>  	.startup	= adau17x1_startup,
> +	.auto_selectable_formats	= &adau17x1_selectable_formats,
> +	.num_auto_selectable_formats	= 1,
>  };
>  EXPORT_SYMBOL_GPL(adau17x1_dai_ops);
>  
> diff --git a/sound/soc/codecs/adau1977.c b/sound/soc/codecs/adau1977.c
> index b42f35b1a6036..b9d9853934216 100644
> --- a/sound/soc/codecs/adau1977.c
> +++ b/sound/soc/codecs/adau1977.c
> @@ -741,6 +741,17 @@ static int adau1977_set_tristate(struct snd_soc_dai *dai, int tristate)
>  		ADAU1977_SAI_OVERTEMP_DRV_HIZ, val);
>  }
>  
> +static const u64 adau1977_selectable_formats =
> +	SND_SOC_POSSIBLE_DAIFMT_I2S	|
> +	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
> +	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
> +	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
> +	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
> +	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
> +	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
> +	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
> +	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
> +
>  static const struct snd_soc_dai_ops adau1977_dai_ops = {
>  	.startup	= adau1977_startup,
>  	.hw_params	= adau1977_hw_params,
> @@ -748,6 +759,8 @@ static const struct snd_soc_dai_ops adau1977_dai_ops = {
>  	.set_fmt	= adau1977_set_dai_fmt,
>  	.set_tdm_slot	= adau1977_set_tdm_slot,
>  	.set_tristate	= adau1977_set_tristate,
> +	.auto_selectable_formats	= &adau1977_selectable_formats,
> +	.num_auto_selectable_formats	= 1,
>  };
>  
>  static struct snd_soc_dai_driver adau1977_dai = {
> diff --git a/sound/soc/codecs/adau7118.c b/sound/soc/codecs/adau7118.c
> index 5ddea63a6612c..9749299bc7f2a 100644
> --- a/sound/soc/codecs/adau7118.c
> +++ b/sound/soc/codecs/adau7118.c
> @@ -418,12 +418,24 @@ static int adau7118_component_probe(struct snd_soc_component *component)
>  	return ret;
>  }
>  
> +static const u64 adau7118_selectable_formats =
> +	SND_SOC_POSSIBLE_DAIFMT_I2S	|
> +	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
> +	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
> +	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
> +	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
> +	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
> +	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
> +	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
> +
>  static const struct snd_soc_dai_ops adau7118_ops = {
>  	.hw_params = adau7118_hw_params,
>  	.set_channel_map = adau7118_set_channel_map,
>  	.set_fmt = adau7118_set_fmt,
>  	.set_tdm_slot = adau7118_set_tdm_slot,
>  	.set_tristate = adau7118_set_tristate,
> +	.auto_selectable_formats = &adau7118_selectable_formats,
> +	.num_auto_selectable_formats = 1,
>  };
>  
>  static struct snd_soc_dai_driver adau7118_dai = {
> -- 
> 2.53.0
> 
