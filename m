Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CA52C08A1
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 05:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774588957; cv=none; b=oNA+/FeBXYgyItQMAA1mmAELMQ9aVQMa7MwHp9tFmul6R3pc30I8Z2hYFGK4z73cRXiyKkRjDCBABOuM4f7hXDRQ+YY3klkTtawdYN11Hid8TzgzJt9XKgrEeT/FkzC8gQweaUUfCoVe1MmHYhBHoloo7BunluR+kS5lMZfLoqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774588957; c=relaxed/simple;
	bh=nF5TqH1TAdnJhHK4SWQNSU1qJHPIDEt89K2dGclnAOQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cYk8Ngc9BVxS5bswfBAkhkLq/fNLLEdZQBSUDIP7V449DPMb/JkFcbtGmXan5NmVvX/iMRIu4S4dum8eMBs4LyfWV+Af60ic5qUwvkZr5pez52F4hZre4dksL2zKYaLXVTAF2aPdc9+DWzuQCqq65pg090jUi9Qq5uBEYEDJ6YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QJUvzv6b; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QJUvzv6b"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1279eced0b9so2468056c88.0
        for <linux-sound@vger.kernel.org>; Thu, 26 Mar 2026 22:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774588955; x=1775193755; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ojupnG9q589PUOSu9e9cWlMU3CkrsoS61jVmGGsXX5k=;
        b=QJUvzv6bI9zaZ0P644JLsrp6RJl1KFNJujTVs/VVs8LCSgiA9lsWdiFd4G7hQa7+SD
         jOAdyYDrjegIBoiil5f0uz9F2FAxfHltlsCE87zRpIsaKmcqTiyYA75rL3Ben+A70hZS
         JLLFGpczIscX+f2hcGTc+0AoJVg3FmeD1O+E7tOXisA6nK39tOHZicVLhBc8/qS+2YmS
         1tRoe2zaGPBIh4ESQo+gdSm0SU7YAq/h23mO8ZZm3AY7e/7QHaEp5e/XebxMl8rORhu7
         OYBY1G9I6QmATsCor3z7Dr1nAk5z/wIhEibd9MnuaOhuONe4tgVffzYEc3m1nX8AjAbG
         YzfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774588955; x=1775193755;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ojupnG9q589PUOSu9e9cWlMU3CkrsoS61jVmGGsXX5k=;
        b=VUISQwAzV7R6DKT+X6SVzjQrrQ3FC31hqaegmaQ0QBuQ/ntNTTymfZMNfvunWTjrCL
         iE1PFl1CjuGwFGQpL3s0ll+Qdldg8+vQkL8z+KZ3a3YWlxiKo0C6mVJYXM1JRnxpySmy
         mbokNF8UyFqciIv0AT2SrtCAyJnlhdxvzn+2zn8EY2dV6Rtq63pnXUTEwjTlzIfbw3lC
         e5lTEi87CImPm+LnviXHMQNgvus8QzOwlxxWOl8pfY8C1630BjWnBKE6YHRRCfsPMefQ
         R0VQOCuKPiGWSs3/tY9RKpIVPBekCMHkwmJS/dp//PWDhr8SjwQjZyPT71qUbcr/w4Et
         7Kdg==
X-Gm-Message-State: AOJu0YyX/Cxk8wAzAj2Xu0hrCnE14mXpxtOR6y3mCROG+wILkB3o63n2
	e1iH8LQAKtu4jF9Q4rto349E1+AMmpD00UhuQdZkN9/Nl+5rxL/zUGS1
X-Gm-Gg: ATEYQzxIeEvBRjLpRGzhh9Y3H/SaGU3A+zudAbxQxZB5mGwfnGQbrU/VPU78MJ/D+Am
	EonAuiv8xjuC5vxvctD/jlLK0TSGsfWzVxy7Kiw90A+V1zcStOdHFW5fCpHFJK7q++ptoU8x4ux
	ybrmlkUNI/o0pAOzRzhP1WNYUjeVMKzmmvskYm/91p9SoKymenuyfcgeEGklJstJcFCM/n+Nxdj
	8xLfhHS3al2bFKZ69Kkn8rhZf08yihMHyh2l97wlpC2XwXKG8oV5hKvSWiNHRJ/mNxdMi787ZqO
	p2oI41YXoJPkbBwEl+TuY16zx6qWq0IxyYoU25gAu7MelN1VEo28VGxM4tWEnlVQWeTIQfpquAh
	VJS4yPxVtV7EdwIYme5779RQQ6IqUtSEgjOg3559J20LELB06NqP8twmJijYlE7fvp10pulR3RG
	tcDHqRUfNxFKBTlhIrdK/XaEtlyFe4XbIpsssld27pEx7ZVmdHZsxvdBWyqaCDEByb5mKzLDOvg
	o9rMI8E8OI=
X-Received: by 2002:a05:7022:6281:b0:128:d352:bf8a with SMTP id a92af1059eb24-12ab28e607fmr563594c88.33.1774588954541;
        Thu, 26 Mar 2026 22:22:34 -0700 (PDT)
Received: from [192.168.1.8] (177-4-161-78.user3p.v-tal.net.br. [177.4.161.78])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16ec7f9c9sm5890932eec.12.2026.03.26.22.22.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 22:22:34 -0700 (PDT)
Message-ID: <1cac7d61-94e2-427c-ab7a-1b114df62870@gmail.com>
Date: Fri, 27 Mar 2026 02:22:30 -0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: generic: keep fallback dai_name stable across
 rebind
To: Mark Brown <broonie@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260327-asoc-generic-fallback-dai-name-rebind-v2-1-1368c57c4a0d@gmail.com>
From: =?UTF-8?Q?C=C3=A1ssio_Gabriel_Monteiro_Pires?=
 <cassiogabrielcontato@gmail.com>
Content-Language: en-US
In-Reply-To: <20260327-asoc-generic-fallback-dai-name-rebind-v2-1-1368c57c4a0d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 3/27/26 01:11, Cássio Gabriel wrote:
> simple_parse_dai() and graph_util_parse_dai() first try to identify a
> DAI via dai_args. When that works the card can rebind without relying on
> dlc->dai_name.
> 
> The fallback path still calls snd_soc_get_dlc(), which returns a
> borrowed dai_name pointer. If the CPU or codec component is unbound
> while the sound card stays registered, the generic card keeps that
> pointer and the next rebind may compare stale memory while matching the
> DAI.
> 
> Stage the fallback result in a temporary dai_link_component and move
> only a card-owned copy of dai_name into the live link component. Use
> devm_kstrdup_const() so static names are reused and dynamic ones remain
> valid for the lifetime of the card device.
> 
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
> Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> Changes in v2:
> - Rework simple_parse_dai() and graph_util_parse_dai() to use if/else
>   instead of a non-error goto.
> - Move the fallback snd_soc_get_dlc() handling into the else branch.
> - Link to v1: https://patch.msgid.link/20260326-asoc-generic-fallback-dai-name-rebind-v1-1-ac9da3cbd606@gmail.com
> ---
>  sound/soc/generic/simple-card-utils.c | 52 ++++++++++++++++-------------------
>  sound/soc/generic/simple-card.c       | 46 ++++++++++++++-----------------
>  2 files changed, 44 insertions(+), 54 deletions(-)
> 
> diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
> index da6353594d61..e5cb602fd248 100644
> --- a/sound/soc/generic/simple-card-utils.c
> +++ b/sound/soc/generic/simple-card-utils.c
> @@ -1128,7 +1128,9 @@ int graph_util_parse_dai(struct simple_util_priv *priv, struct device_node *ep,
>  	struct device *dev = simple_priv_to_dev(priv);
>  	struct device_node *node;
>  	struct of_phandle_args args = {};
> +	struct snd_soc_dai_link_component resolved_dlc = {};
>  	struct snd_soc_dai *dai;
> +	const char *fallback_dai_name;
>  	int ret;
>  
>  	if (!ep)
> @@ -1152,39 +1154,31 @@ int graph_util_parse_dai(struct simple_util_priv *priv, struct device_node *ep,
>  		dlc->of_node  = node;
>  		dlc->dai_name = dai_name;
>  		dlc->dai_args = dai_args;
> +	} else {
> +		/* Get dai->name */
> +		args.np		= node;
> +		args.args[0]	= graph_get_dai_id(ep);
> +		args.args_count	= (of_graph_get_endpoint_count(node) > 1);
>  
> -		goto parse_dai_end;
> -	}
> +		ret = snd_soc_get_dlc(&args, &resolved_dlc);
> +		if (ret < 0)
> +			goto err;
>  
> -	/* Get dai->name */
> -	args.np		= node;
> -	args.args[0]	= graph_get_dai_id(ep);
> -	args.args_count	= (of_graph_get_endpoint_count(node) > 1);
> +		/* Keep fallback dai_name valid across component rebind */
> +		fallback_dai_name = resolved_dlc.dai_name;
> +		if (fallback_dai_name) {
> +			fallback_dai_name = devm_kstrdup_const(dev, fallback_dai_name,
> +							       GFP_KERNEL);
> +			ret = -ENOMEM;
> +			if (!fallback_dai_name)
> +				goto err;
> +		}
>  
> -	/*
> -	 * FIXME
> -	 *
> -	 * Here, dlc->dai_name is pointer to CPU/Codec DAI name.
> -	 * If user unbinded CPU or Codec driver, but not for Sound Card,
> -	 * dlc->dai_name is keeping unbinded CPU or Codec
> -	 * driver's pointer.
> -	 *
> -	 * If user re-bind CPU or Codec driver again, ALSA SoC will try
> -	 * to rebind Card via snd_soc_try_rebind_card(), but because of
> -	 * above reason, it might can't bind Sound Card.
> -	 * Because Sound Card is pointing to released dai_name pointer.
> -	 *
> -	 * To avoid this rebind Card issue,
> -	 * 1) It needs to alloc memory to keep dai_name eventhough
> -	 *    CPU or Codec driver was unbinded, or
> -	 * 2) user need to rebind Sound Card everytime
> -	 *    if he unbinded CPU or Codec.
> -	 */
> -	ret = snd_soc_get_dlc(&args, dlc);
> -	if (ret < 0)
> -		goto err;
> +		dlc->of_node = resolved_dlc.of_node;
> +		dlc->dai_name = fallback_dai_name;
> +		dlc->dai_args = resolved_dlc.dai_args;
> +	}
>  
> -parse_dai_end:
>  	if (is_single_link)
>  		*is_single_link = of_graph_get_endpoint_count(node) == 1;
>  	ret = 0;
> diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
> index 9937a991846e..b24ba1330896 100644
> --- a/sound/soc/generic/simple-card.c
> +++ b/sound/soc/generic/simple-card.c
> @@ -69,7 +69,9 @@ static int simple_parse_dai(struct simple_util_priv *priv,
>  {
>  	struct device *dev = simple_priv_to_dev(priv);
>  	struct of_phandle_args args;
> +	struct snd_soc_dai_link_component resolved_dlc = {};
>  	struct snd_soc_dai *dai;
> +	const char *fallback_dai_name;
>  	int ret;
>  
>  	if (!node)
> @@ -94,34 +96,28 @@ static int simple_parse_dai(struct simple_util_priv *priv,
>  		dlc->dai_args = snd_soc_copy_dai_args(dev, &args);
>  		if (!dlc->dai_args)
>  			goto end;
> +	} else {
> +		ret = snd_soc_get_dlc(&args, &resolved_dlc);
> +		if (ret < 0)
> +			goto end;
>  
> -		goto parse_dai_end;
> -	}
> +		/* Keep fallback dai_name valid across component rebind */
> +		fallback_dai_name = resolved_dlc.dai_name;
> +		if (fallback_dai_name) {
> +			fallback_dai_name = devm_kstrdup_const(dev, fallback_dai_name,
> +							       GFP_KERNEL);
> +			ret = -ENOMEM;
> +			if (!fallback_dai_name) {
> +				of_node_put(resolved_dlc.of_node);
> +				goto end;
> +			}
> +		}
>  
> -	/*
> -	 * FIXME
> -	 *
> -	 * Here, dlc->dai_name is pointer to CPU/Codec DAI name.
> -	 * If user unbinded CPU or Codec driver, but not for Sound Card,
> -	 * dlc->dai_name is keeping unbinded CPU or Codec
> -	 * driver's pointer.
> -	 *
> -	 * If user re-bind CPU or Codec driver again, ALSA SoC will try
> -	 * to rebind Card via snd_soc_try_rebind_card(), but because of
> -	 * above reason, it might can't bind Sound Card.
> -	 * Because Sound Card is pointing to released dai_name pointer.
> -	 *
> -	 * To avoid this rebind Card issue,
> -	 * 1) It needs to alloc memory to keep dai_name eventhough
> -	 *    CPU or Codec driver was unbinded, or
> -	 * 2) user need to rebind Sound Card everytime
> -	 *    if he unbinded CPU or Codec.
> -	 */
> -	ret = snd_soc_get_dlc(&args, dlc);
> -	if (ret < 0)
> -		goto end;
> +		dlc->of_node = resolved_dlc.of_node;
> +		dlc->dai_name = fallback_dai_name;
> +		dlc->dai_args = resolved_dlc.dai_args;
> +	}
>  
> -parse_dai_end:
>  	if (is_single_link)
>  		*is_single_link = !args.args_count;
>  	ret = 0;
> 
> ---
> base-commit: d084fd53a2fd5748d4317635b1c1a7dba7edf583
> change-id: 20260326-asoc-generic-fallback-dai-name-rebind-6381a1c807fd
> 
> Best regards,
> --  
> Cássio Gabriel <cassiogabrielcontato@gmail.com>
> 

I forgot to add the 'Suggested-by' tag attributing
the suggestion made by Kuninori. I apologize.

Should I send a v3 patch adding the tag?

-- 
Thanks,
Cássio

