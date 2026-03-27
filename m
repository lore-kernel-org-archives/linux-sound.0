Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D07345749
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 16:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774630782; cv=none; b=lMeI16DdnXk9HWc9WaTdVedrJZGdN1hFAf5ke2IqWgXJkGkrDqJSjlj8CVQL6aQyVsMlRaYQrgEUjfeSWkNzd44T24guCik036AIpspInzTLjNBL1B9LBDgYZ5T4KGDS1IZDvkcttUQEP7ptttaEMH3+CBqvQ1vnvXoIktHjltM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774630782; c=relaxed/simple;
	bh=Ag33zgD26ud9XbElDqGtWzxhQudw9N/yW2m7KdPW/zk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=WoHMqGFX5NmUt1V2D99rm52BYWb19xr3utqKpCOgcjpAhoz2jw6KxlcueO9YVBu4eOvtWhazjmUHqdJ3rx+0vsjgf1VW5ry0hakLIu+QzTT63SBhBFrHlCStOZVcvKID6HIUcsWi0iMlAHI2GGj+Ux4OB6nMQi1EOMW8yEG4LKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rws02z+F; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rws02z+F"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2bdd40d3c61so2004535eec.1
        for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 09:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774630780; x=1775235580; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BJuLNioM0ARl6ysEFEHRaXGLF4cfsVwInGrcPw4L8AM=;
        b=Rws02z+FH6FlnLqmhIXCQSrOD4UAYCjsZN/nCG7dJMrbxQcA9z7f2Ek4OUGln2/zqB
         iMEPCM+vUpqKb/GHlcpvovkpAGlGog99vIerN1UgVWnq0s/vYauiSYpVuHfeoip3Quzj
         LKWplG3X6QaW6VaYIC6RWIl0AuWnsuvbsH4bfSXdYHgHWTD2WwcmfGhIh0xE2+nKGHlw
         IKrl24un/7Dq/lnsJDw6inGmBSEA2sqV7LsSlvdn2SGV3arTsVnFzdfSM7QQdeEsZK4B
         GOOj155h/1wgLbIo/xVoHA/JF6mNIDck15WImFQQFNZbaCsj41T+pJXELcmEHI1f4cZN
         9ZGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774630780; x=1775235580;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BJuLNioM0ARl6ysEFEHRaXGLF4cfsVwInGrcPw4L8AM=;
        b=bWUyuL49jP8Cl8mE3PV31omYIX0LKcnSNPMhp4LiAcValiPD/yWLSPMYnZFPIoCduG
         JzeTQXB3FduWxBHXlB0E3py6CNJ00IfPIxR4HsHQzHJcsDCz7XwLfUIgwEh1jm5yswdM
         QF+WHhmRx709irw1DUxinbGh+FyLQIbUI7XjPy51dUxGbfOUpUpCLHeaTz+c1Tfmvdtm
         nMQ80cHenWAVGKsTlCGrvj5rpd16cYnTCYLWi8/fqrj5N8frc47u79QmyoEKeBTKXR9W
         /a/bxG0/Py4bvm7KHvyhip9z86IrY2rh8V/E9wLCAc4CK1iwKKCWnnFmHioO3yhfl0YE
         NT0g==
X-Gm-Message-State: AOJu0YxXDEgUA+g1rfrEjpux1ZM/Qd1XN1F14iCaqgt4buMFM0SSLR1m
	M1sgW7sq1VmDfae5kuSsJu7cwZGD+RX27Z2cVc4HfAxuYOhPAlETLQuQ
X-Gm-Gg: ATEYQzypfltAN3YDB5AnglY4wMw43L70kisXIrVZ4N1LvhE32487LjYsRUu6zgjzlDb
	BUUIlXN12poOoy1m/MflsiruuaR6wSsaJQzYwcbPqYKQXTuivmh22pAZ6Q/NOZDReKzYv0FoEkB
	K2YgTMGljhqtD/soeYT28uGSkLDva2MsAyhrH37Ea5spCLSMGQIKoWhoKU6Ye/CiTxweOa95QD4
	fHpaCRzWkCXTeg0wWpSZcuPqSdlUfMdHjwjnNJTVu0WeESTuZqO5gm0Qjcwmj8dxpAYLflne+3L
	hJBymvB4x42iFT4LCwbZB7Q/lkd0Jvm6ZZsXHoMXiD79D2/7wkzaLvnZzVctJC3vC4r6wz30VKi
	ut7WaWjGDviwoKEtiXHWTu2+FRinLtf1cgu/OjCgCn9FLueNm5L4PI98LOiKIAxh5wO0ljKHsGw
	GUT2i7EriCFXlFOJNflJp9Af2fvi4TvXwnlkthhsnE8gfKExQH9/k9LcZJK0AgWdebibX2V8PD
X-Received: by 2002:a05:7300:a584:b0:2c1:3f85:747 with SMTP id 5a478bee46e88-2c185ed6c8emr1889921eec.21.1774630780003;
        Fri, 27 Mar 2026 09:59:40 -0700 (PDT)
Received: from [192.168.1.8] (177-4-161-78.user3p.v-tal.net.br. [177.4.161.78])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16ee01674sm6200742eec.27.2026.03.27.09.59.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 09:59:39 -0700 (PDT)
Message-ID: <9945416d-4184-4a7a-b17d-e7adbd56af78@gmail.com>
Date: Fri, 27 Mar 2026 13:59:35 -0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: generic: keep fallback dai_name stable across
 rebind
From: =?UTF-8?Q?C=C3=A1ssio_Gabriel_Monteiro_Pires?=
 <cassiogabrielcontato@gmail.com>
To: Mark Brown <broonie@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260327-asoc-generic-fallback-dai-name-rebind-v2-1-1368c57c4a0d@gmail.com>
 <1cac7d61-94e2-427c-ab7a-1b114df62870@gmail.com>
Content-Language: en-US
In-Reply-To: <1cac7d61-94e2-427c-ab7a-1b114df62870@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 3/27/26 02:22, Cássio Gabriel Monteiro Pires wrote:
> On 3/27/26 01:11, Cássio Gabriel wrote:
>> simple_parse_dai() and graph_util_parse_dai() first try to identify a
>> DAI via dai_args. When that works the card can rebind without relying on
>> dlc->dai_name.
>>
>> The fallback path still calls snd_soc_get_dlc(), which returns a
>> borrowed dai_name pointer. If the CPU or codec component is unbound
>> while the sound card stays registered, the generic card keeps that
>> pointer and the next rebind may compare stale memory while matching the
>> DAI.
>>
>> Stage the fallback result in a temporary dai_link_component and move
>> only a card-owned copy of dai_name into the live link component. Use
>> devm_kstrdup_const() so static names are reused and dynamic ones remain
>> valid for the lifetime of the card device.
>>
>> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
>> Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>> ---
>> Changes in v2:
>> - Rework simple_parse_dai() and graph_util_parse_dai() to use if/else
>>   instead of a non-error goto.
>> - Move the fallback snd_soc_get_dlc() handling into the else branch.
>> - Link to v1: https://patch.msgid.link/20260326-asoc-generic-fallback-dai-name-rebind-v1-1-ac9da3cbd606@gmail.com
>> ---
>>  sound/soc/generic/simple-card-utils.c | 52 ++++++++++++++++-------------------
>>  sound/soc/generic/simple-card.c       | 46 ++++++++++++++-----------------
>>  2 files changed, 44 insertions(+), 54 deletions(-)
>>
>> diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
>> index da6353594d61..e5cb602fd248 100644
>> --- a/sound/soc/generic/simple-card-utils.c
>> +++ b/sound/soc/generic/simple-card-utils.c
>> @@ -1128,7 +1128,9 @@ int graph_util_parse_dai(struct simple_util_priv *priv, struct device_node *ep,
>>  	struct device *dev = simple_priv_to_dev(priv);
>>  	struct device_node *node;
>>  	struct of_phandle_args args = {};
>> +	struct snd_soc_dai_link_component resolved_dlc = {};
>>  	struct snd_soc_dai *dai;
>> +	const char *fallback_dai_name;
>>  	int ret;
>>  
>>  	if (!ep)
>> @@ -1152,39 +1154,31 @@ int graph_util_parse_dai(struct simple_util_priv *priv, struct device_node *ep,
>>  		dlc->of_node  = node;
>>  		dlc->dai_name = dai_name;
>>  		dlc->dai_args = dai_args;
>> +	} else {
>> +		/* Get dai->name */
>> +		args.np		= node;
>> +		args.args[0]	= graph_get_dai_id(ep);
>> +		args.args_count	= (of_graph_get_endpoint_count(node) > 1);
>>  
>> -		goto parse_dai_end;
>> -	}
>> +		ret = snd_soc_get_dlc(&args, &resolved_dlc);
>> +		if (ret < 0)
>> +			goto err;
>>  
>> -	/* Get dai->name */
>> -	args.np		= node;
>> -	args.args[0]	= graph_get_dai_id(ep);
>> -	args.args_count	= (of_graph_get_endpoint_count(node) > 1);
>> +		/* Keep fallback dai_name valid across component rebind */
>> +		fallback_dai_name = resolved_dlc.dai_name;
>> +		if (fallback_dai_name) {
>> +			fallback_dai_name = devm_kstrdup_const(dev, fallback_dai_name,
>> +							       GFP_KERNEL);
>> +			ret = -ENOMEM;
>> +			if (!fallback_dai_name)
>> +				goto err;
>> +		}
>>  
>> -	/*
>> -	 * FIXME
>> -	 *
>> -	 * Here, dlc->dai_name is pointer to CPU/Codec DAI name.
>> -	 * If user unbinded CPU or Codec driver, but not for Sound Card,
>> -	 * dlc->dai_name is keeping unbinded CPU or Codec
>> -	 * driver's pointer.
>> -	 *
>> -	 * If user re-bind CPU or Codec driver again, ALSA SoC will try
>> -	 * to rebind Card via snd_soc_try_rebind_card(), but because of
>> -	 * above reason, it might can't bind Sound Card.
>> -	 * Because Sound Card is pointing to released dai_name pointer.
>> -	 *
>> -	 * To avoid this rebind Card issue,
>> -	 * 1) It needs to alloc memory to keep dai_name eventhough
>> -	 *    CPU or Codec driver was unbinded, or
>> -	 * 2) user need to rebind Sound Card everytime
>> -	 *    if he unbinded CPU or Codec.
>> -	 */
>> -	ret = snd_soc_get_dlc(&args, dlc);
>> -	if (ret < 0)
>> -		goto err;
>> +		dlc->of_node = resolved_dlc.of_node;
>> +		dlc->dai_name = fallback_dai_name;
>> +		dlc->dai_args = resolved_dlc.dai_args;
>> +	}
>>  
>> -parse_dai_end:
>>  	if (is_single_link)
>>  		*is_single_link = of_graph_get_endpoint_count(node) == 1;
>>  	ret = 0;
>> diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
>> index 9937a991846e..b24ba1330896 100644
>> --- a/sound/soc/generic/simple-card.c
>> +++ b/sound/soc/generic/simple-card.c
>> @@ -69,7 +69,9 @@ static int simple_parse_dai(struct simple_util_priv *priv,
>>  {
>>  	struct device *dev = simple_priv_to_dev(priv);
>>  	struct of_phandle_args args;
>> +	struct snd_soc_dai_link_component resolved_dlc = {};
>>  	struct snd_soc_dai *dai;
>> +	const char *fallback_dai_name;
>>  	int ret;
>>  
>>  	if (!node)
>> @@ -94,34 +96,28 @@ static int simple_parse_dai(struct simple_util_priv *priv,
>>  		dlc->dai_args = snd_soc_copy_dai_args(dev, &args);
>>  		if (!dlc->dai_args)
>>  			goto end;
>> +	} else {
>> +		ret = snd_soc_get_dlc(&args, &resolved_dlc);
>> +		if (ret < 0)
>> +			goto end;
>>  
>> -		goto parse_dai_end;
>> -	}
>> +		/* Keep fallback dai_name valid across component rebind */
>> +		fallback_dai_name = resolved_dlc.dai_name;
>> +		if (fallback_dai_name) {
>> +			fallback_dai_name = devm_kstrdup_const(dev, fallback_dai_name,
>> +							       GFP_KERNEL);
>> +			ret = -ENOMEM;
>> +			if (!fallback_dai_name) {
>> +				of_node_put(resolved_dlc.of_node);
>> +				goto end;
>> +			}
>> +		}
>>  
>> -	/*
>> -	 * FIXME
>> -	 *
>> -	 * Here, dlc->dai_name is pointer to CPU/Codec DAI name.
>> -	 * If user unbinded CPU or Codec driver, but not for Sound Card,
>> -	 * dlc->dai_name is keeping unbinded CPU or Codec
>> -	 * driver's pointer.
>> -	 *
>> -	 * If user re-bind CPU or Codec driver again, ALSA SoC will try
>> -	 * to rebind Card via snd_soc_try_rebind_card(), but because of
>> -	 * above reason, it might can't bind Sound Card.
>> -	 * Because Sound Card is pointing to released dai_name pointer.
>> -	 *
>> -	 * To avoid this rebind Card issue,
>> -	 * 1) It needs to alloc memory to keep dai_name eventhough
>> -	 *    CPU or Codec driver was unbinded, or
>> -	 * 2) user need to rebind Sound Card everytime
>> -	 *    if he unbinded CPU or Codec.
>> -	 */
>> -	ret = snd_soc_get_dlc(&args, dlc);
>> -	if (ret < 0)
>> -		goto end;
>> +		dlc->of_node = resolved_dlc.of_node;
>> +		dlc->dai_name = fallback_dai_name;
>> +		dlc->dai_args = resolved_dlc.dai_args;
>> +	}
>>  
>> -parse_dai_end:
>>  	if (is_single_link)
>>  		*is_single_link = !args.args_count;
>>  	ret = 0;
>>
>> ---
>> base-commit: d084fd53a2fd5748d4317635b1c1a7dba7edf583
>> change-id: 20260326-asoc-generic-fallback-dai-name-rebind-6381a1c807fd
>>
>> Best regards,
>> --  
>> Cássio Gabriel <cassiogabrielcontato@gmail.com>
>>
> 
> I forgot to add the 'Suggested-by' tag attributing
> the suggestion made by Kuninori. I apologize.
> 
> Should I send a v3 patch adding the tag?

I'm going to send a v3 patch with the tag added.

-- 
Thanks,
Cássio

