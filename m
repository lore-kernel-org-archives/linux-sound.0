Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4780934CDD
	for <linux-sound@vger.kernel.org>; Sat, 27 Jun 2026 08:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782549131; cv=none; b=tW97TSmM7y6iVeqvFMgT7oZz3G/Hv/ksfQEzWZQm/AMp5fwY5XwWjAwj9KisC4VhbQFN2+BeeRVIoLXAtCzbvYDT61nBTiIcwEZlGxhLHSYF8fBzGyksORctQzv36CHtbtWQJP4H73juJb5hvq0qSVQ5I6Fo7mWyqA94TGGENbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782549131; c=relaxed/simple;
	bh=/Ftg0tjgjzU7ohaH0sRr30Ybn6B26tG1BsScM9ZhtR4=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=IHRUgm7RZHdV8ZF9bmbsSD7R4hLxgSUrWkLL6IMLr3a+RqUx4Vg9vO4tZQ0Z/WabW+ibJaQ1a58o96aFeHAyYxSfzP+xw07y6darN39f/jo4/f+jLolBo1Uj5B+85JoeXIi+rY7bc29PkcL7CNwlnoFQQAGhPqi7dvXLtCxh8Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PVMBwktu; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PVMBwktu"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4926f8e02e8so7428105e9.0
        for <linux-sound@vger.kernel.org>; Sat, 27 Jun 2026 01:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782549128; x=1783153928; darn=vger.kernel.org;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KYXg+Vx/ksI9gMSWKRyYdrLcUqW0tkmrmFCDeChjHxg=;
        b=PVMBwktuJuaPwOv/+kO/4yDtHF6Ck5ZFhOg/g2cEI3OKh8b1hpBL6ePgWm4NlpLYBy
         fPVoh2YqjnVJAJ6sMfjbPeeLKCegC/MGxMa3eqx/u1Yw5YJNU/W9XTi+Uiiq8mgM252X
         hTHg6f17jXpL0Vah09IfIDjP8VkUsbqIX9HEl7Yqtf561s5Ng7qQucAy5S5cIu4mGNvz
         p7bg5LSC97A4rityb000wytiDx2/qTRfV79dH1H48rx+C0y0wpwkXMMWNDOI1GwOsPZH
         qLsVv+yqk2ETfBEaEPJBaGqSJj9UfPk+LBMzKcWoBWIXmdafrlfY6BTbK9W41CbzlRR5
         bkuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782549128; x=1783153928;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KYXg+Vx/ksI9gMSWKRyYdrLcUqW0tkmrmFCDeChjHxg=;
        b=DfvCCT61a5SZ27U7Jk+uxRB7hSWE9EeH1FmnvRSWfmKYsNQ/puFzuowvXQILNRi+Ev
         el2vZRkgb9kFMMbr76JKkNW8wLvSbr3x3osGoxm6i60xwjbigj9Kov7lFmpzoeaHKN1b
         joSK8q1LVcgdj0196b8dXRa+qfEAP0i6/OOscXLHbfQW+v/EhayVqS3tDhfsOgLNxhVn
         caeou6GezeFSTcMODno3Kd76WNgRpxz9U2wxXxsOBEyDjRhKfXK6X0wyTALSs0DOLBWp
         cWQdGyhJw8UmluCJtN2M39KG9KZtPNv20IgOL2ACgKdBay3deGqPWZAsOQ6i+lJDPyFQ
         o6og==
X-Gm-Message-State: AOJu0YwI7r89IVYqNin1dSLFjqnhsSeITYIhLLUAiqThL121xRoC1Dbh
	LRN4oHRqoieSZChF0b8fQ6YjfQPEyA1/DV/r/PCLPXUwiMECbsLtJX1u
X-Gm-Gg: AfdE7ckJsaeUVJAhtKpvsfUevxntZ+T2jCjoUDqKA/jrtMOMPK+tH0dJDA5sxEVFBY5
	/ohRLNxLW0zIJfBS5L6HKNeGYfyOY/prr6/8aKp+lxZ1brVgnuifTq3WIIIMlOoEiJ1dHb2By97
	eUSKh5+3rb/nV1pWRCpB2v7hU4+xQWS4jd2jBSpZpvcWxfP5ilfLqCShs0ITh9erTpUPNbtJwMo
	ptM+l3V/mPJ8SzjPPbooW14CwgXUwv0awzI1XNFG7pZorMJ6V/1O6s/oG1afDaBu4+V8EsAVzld
	IVLXhzOKucFSM+S8MUL1+QMOF4tmnz1v1iQWrOThLVwYm2OL92DuiRPmGvX1WKPGZnBBYXUfJsN
	4lyelxP5VfL4S29kY0k1OsTbl27AjXAfDA3IIUAyyrQcj5jF7fEQ1KJVrghbj9yAS5Wu3ULi7p7
	AuLl44+noxQ0luY3ms+EeRyA94Bt76aFU1p1jSVFWJ1MESjEHC/B4sw28gjcaW8Ir7NVvGwzWgW
	2dwyCgY/kEZUrEn7d5gsO72SjbRz/pP4AKN4y85m5ST138=
X-Received: by 2002:a05:600c:1d86:b0:490:d354:bcf4 with SMTP id 5b1f17b1804b1-49266885dc4mr137850515e9.27.1782549128405;
        Sat, 27 Jun 2026 01:32:08 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3102-4c14-1900-f233-a94f-4a5a-3424.310.pool.telefonica.de. [2a02:3102:4c14:1900:f233:a94f:4a5a:3424])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4705f8ea729sm4138301f8f.0.2026.06.27.01.32.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Jun 2026 01:32:07 -0700 (PDT)
Subject: Re: [PATCH v2 2/4] ASoC: codecs: pcm*: use .auto_selectable_formats
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
References: <87mrwmhvjd.wl-kuninori.morimoto.gx@renesas.com>
 <87jyrqhvid.wl-kuninori.morimoto.gx@renesas.com>
From: Kirill Marinushkin <k.marinushkin@gmail.com>
Message-ID: <fc52e1d6-ced8-22bf-1a29-742d2c06411a@gmail.com>
Date: Sat, 27 Jun 2026 10:32:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <87jyrqhvid.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Reviewed-by: Kirill Marinushkin <k.marinushkin@gmail.com>


On 6/23/26 3:54 AM, Kuninori Morimoto wrote:
> We can use .auto_selectable_formats. Let's adds it.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reviewed-by: Kirill Marinushkin <k.marinushkin@gmail.com>
> ---
>   sound/soc/codecs/pcm1681.c | 7 +++++++
>   sound/soc/codecs/pcm1754.c | 6 ++++++
>   sound/soc/codecs/pcm1789.c | 7 +++++++
>   sound/soc/codecs/pcm179x.c | 6 ++++++
>   sound/soc/codecs/pcm186x.c | 9 +++++++++
>   sound/soc/codecs/pcm3060.c | 8 ++++++++
>   sound/soc/codecs/pcm512x.c | 9 +++++++++
>   7 files changed, 52 insertions(+)
>
> diff --git a/sound/soc/codecs/pcm1681.c b/sound/soc/codecs/pcm1681.c
> index cb923cecb47fc..60fdbe5c4e054 100644
> --- a/sound/soc/codecs/pcm1681.c
> +++ b/sound/soc/codecs/pcm1681.c
> @@ -199,10 +199,17 @@ static int pcm1681_hw_params(struct snd_pcm_substream *substream,
>   	return pcm1681_set_deemph(component);
>   }
>   
> +static const u64 pcm1681_selectable_formats =
> +	SND_SOC_POSSIBLE_DAIFMT_I2S	|
> +	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
> +	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
> +
>   static const struct snd_soc_dai_ops pcm1681_dai_ops = {
>   	.set_fmt	= pcm1681_set_dai_fmt,
>   	.hw_params	= pcm1681_hw_params,
>   	.mute_stream	= pcm1681_mute,
> +	.auto_selectable_formats	= &pcm1681_selectable_formats,
> +	.num_auto_selectable_formats	= 1,
>   	.no_capture_mute = 1,
>   };
>   
> diff --git a/sound/soc/codecs/pcm1754.c b/sound/soc/codecs/pcm1754.c
> index b68a528000be8..bb15da1c24aa2 100644
> --- a/sound/soc/codecs/pcm1754.c
> +++ b/sound/soc/codecs/pcm1754.c
> @@ -78,10 +78,16 @@ static int pcm1754_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
>   	return 0;
>   }
>   
> +static const u64 pcm1754_selectable_formats =
> +	SND_SOC_POSSIBLE_DAIFMT_I2S	|
> +	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J;
> +
>   static const struct snd_soc_dai_ops pcm1754_dai_ops = {
>   	.set_fmt = pcm1754_set_dai_fmt,
>   	.hw_params = pcm1754_hw_params,
>   	.mute_stream = pcm1754_mute_stream,
> +	.auto_selectable_formats = &pcm1754_selectable_formats,
> +	.num_auto_selectable_formats = 1,
>   };
>   
>   static const struct snd_soc_dai_driver pcm1754_dai = {
> diff --git a/sound/soc/codecs/pcm1789.c b/sound/soc/codecs/pcm1789.c
> index 3ab381e9a8566..f06e353743aaa 100644
> --- a/sound/soc/codecs/pcm1789.c
> +++ b/sound/soc/codecs/pcm1789.c
> @@ -164,11 +164,18 @@ static int pcm1789_trigger(struct snd_pcm_substream *substream, int cmd,
>   	return ret;
>   }
>   
> +static const u64 pcm1789_selectable_formats =
> +	SND_SOC_POSSIBLE_DAIFMT_I2S	|
> +	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
> +	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
> +
>   static const struct snd_soc_dai_ops pcm1789_dai_ops = {
>   	.set_fmt	= pcm1789_set_dai_fmt,
>   	.hw_params	= pcm1789_hw_params,
>   	.mute_stream	= pcm1789_mute,
>   	.trigger	= pcm1789_trigger,
> +	.auto_selectable_formats	= &pcm1789_selectable_formats,
> +	.num_auto_selectable_formats	= 1,
>   	.no_capture_mute = 1,
>   };
>   
> diff --git a/sound/soc/codecs/pcm179x.c b/sound/soc/codecs/pcm179x.c
> index f52ff66b6e644..cb70927872aa0 100644
> --- a/sound/soc/codecs/pcm179x.c
> +++ b/sound/soc/codecs/pcm179x.c
> @@ -142,10 +142,16 @@ static int pcm179x_hw_params(struct snd_pcm_substream *substream,
>   	return 0;
>   }
>   
> +static const u64 pcm179x_selectable_formats =
> +	SND_SOC_POSSIBLE_DAIFMT_I2S	|
> +	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J;
> +
>   static const struct snd_soc_dai_ops pcm179x_dai_ops = {
>   	.set_fmt	= pcm179x_set_dai_fmt,
>   	.hw_params	= pcm179x_hw_params,
>   	.mute_stream	= pcm179x_mute,
> +	.auto_selectable_formats	= &pcm179x_selectable_formats,
> +	.num_auto_selectable_formats	= 1,
>   	.no_capture_mute = 1,
>   };
>   
> diff --git a/sound/soc/codecs/pcm186x.c b/sound/soc/codecs/pcm186x.c
> index 0d1103fe4e04d..461ec74e87521 100644
> --- a/sound/soc/codecs/pcm186x.c
> +++ b/sound/soc/codecs/pcm186x.c
> @@ -473,11 +473,20 @@ static int pcm186x_set_dai_sysclk(struct snd_soc_dai *dai, int clk_id,
>   	return 0;
>   }
>   
> +static const u64 pcm186x_selectable_formats =
> +	SND_SOC_POSSIBLE_DAIFMT_I2S	|
> +	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
> +	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
> +	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
> +	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
> +
>   static const struct snd_soc_dai_ops pcm186x_dai_ops = {
>   	.set_sysclk = pcm186x_set_dai_sysclk,
>   	.set_tdm_slot = pcm186x_set_tdm_slot,
>   	.set_fmt = pcm186x_set_fmt,
>   	.hw_params = pcm186x_hw_params,
> +	.auto_selectable_formats = &pcm186x_selectable_formats,
> +	.num_auto_selectable_formats = 1,
>   };
>   
>   static struct snd_soc_dai_driver pcm1863_dai = {
> diff --git a/sound/soc/codecs/pcm3060.c b/sound/soc/codecs/pcm3060.c
> index 8974200652e7e..f01c46583e897 100644
> --- a/sound/soc/codecs/pcm3060.c
> +++ b/sound/soc/codecs/pcm3060.c
> @@ -164,10 +164,18 @@ static int pcm3060_hw_params(struct snd_pcm_substream *substream,
>   	return 0;
>   }
>   
> +static const u64 pcm3060_selectable_formats =
> +	SND_SOC_POSSIBLE_DAIFMT_I2S	|
> +	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
> +	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
> +	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
> +
>   static const struct snd_soc_dai_ops pcm3060_dai_ops = {
>   	.set_sysclk = pcm3060_set_sysclk,
>   	.set_fmt = pcm3060_set_fmt,
>   	.hw_params = pcm3060_hw_params,
> +	.auto_selectable_formats = &pcm3060_selectable_formats,
> +	.num_auto_selectable_formats = 1,
>   };
>   
>   #define PCM3060_DAI_RATES_ADC	(SNDRV_PCM_RATE_16000 | SNDRV_PCM_RATE_32000 | \
> diff --git a/sound/soc/codecs/pcm512x.c b/sound/soc/codecs/pcm512x.c
> index fdef98ce52f19..12163ca7899a7 100644
> --- a/sound/soc/codecs/pcm512x.c
> +++ b/sound/soc/codecs/pcm512x.c
> @@ -1505,12 +1505,21 @@ static int pcm512x_mute(struct snd_soc_dai *dai, int mute, int direction)
>   	return ret;
>   }
>   
> +static const u64 pcm512x_selectable_formats =
> +	SND_SOC_POSSIBLE_DAIFMT_I2S	|
> +	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
> +	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
> +	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
> +	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
> +
>   static const struct snd_soc_dai_ops pcm512x_dai_ops = {
>   	.startup = pcm512x_dai_startup,
>   	.hw_params = pcm512x_hw_params,
>   	.set_fmt = pcm512x_set_fmt,
>   	.mute_stream = pcm512x_mute,
>   	.set_bclk_ratio = pcm512x_set_bclk_ratio,
> +	.auto_selectable_formats = &pcm512x_selectable_formats,
> +	.num_auto_selectable_formats = 1,
>   	.no_capture_mute = 1,
>   };
>   
