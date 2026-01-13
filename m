Received: from sender-op-o10.zoho.eu (sender-op-o10.zoho.eu [136.143.169.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A874621FF4D;
	Tue, 13 Jan 2026 22:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768343527; cv=pass; b=OnHc57k28yz/krZHzegSANRlEqbR0KnarVZNUfiiJQ0U8YEnnUt4lasPMcpXwcDYPQRwmpMJsSYmGgiy731yyPemWxMjVVUEZ+82VL0y3eiRraCx426NU1NIvyfMCxlGm2tmSVLh1h//w5vncSz5h/UugQ/KK5HLAl5UOPu9o5E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768343527; c=relaxed/simple;
	bh=UOYbegi7a6dqhsA+W4GCJNFjcpQmsOXTZzXv16agnws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b4pZNlIuDkE1uJdXbMpGlnk2R2iThcPTdfe6x8s/zm7WLhwkITeCXXXAz40vLNtI+nJY5dRN30kyPd6EZVT+8TpnxxRLUFRL8k1jESRXdZ1QJ7ecNA81EaRKJiOmxvs/bB3hOAcWmoHDj05EbvflUH8386ZAI74byzQn1jJYmuQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redaril.me; spf=pass smtp.mailfrom=redaril.me; dkim=pass (1024-bit key) header.d=redaril.me header.i=fabio@redaril.me header.b=fjnaIfKY; arc=pass smtp.client-ip=136.143.169.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redaril.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redaril.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redaril.me header.i=fabio@redaril.me header.b="fjnaIfKY"
ARC-Seal: i=1; a=rsa-sha256; t=1768343505; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=C9wZM60ameuR8OpujqtNlNn+oaC+dwPR1DB7T6Q+9aNhZLZogqyKs2oXAy/V0gaS52JPorB51MymO8HtjOrCPvL2+tww4vpB3xZiL/THWSplJKLKc44Glu95En1TfBWpp/yXSkB5BOm9qSpsEz9AwtFHe16QXBaqz74N2Jk4sGg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1768343505; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=td4HrYnb1nLoKv3gu1RGNicQZqY5fD/wpwCFjZvsKgo=; 
	b=FHr+iSTOv7yYeUHradhpQmifxWd6U4lNKF1bUbqWNWJh+cP8+fpIKvKx+CILf6ccK0DyAaK8k1QnyucW5yvCTIF3tXR12mWNNpsv5RWL4majDjtPWAMIAJPr/wqEtNXpKZGwsHg8L+7UULieUqySE9tFOu7hKRErCM41ZuUC39A=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=redaril.me;
	spf=pass  smtp.mailfrom=fabio@redaril.me;
	dmarc=pass header.from=<fabio@redaril.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768343505;
	s=zmail; d=redaril.me; i=fabio@redaril.me;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=td4HrYnb1nLoKv3gu1RGNicQZqY5fD/wpwCFjZvsKgo=;
	b=fjnaIfKYY/oUuBLV3vPdX2YUzQ3+ZgLNiPF/8ZSg/RDGumfEgtk1dwrVlf05N3gA
	eAutWTUeBnE7h1nHX54SC7PDSsxdJTiZOKFZJAHfbbBQy1gB7fSQNAO+8H1KRbl1dzY
	SfNcXPSfxL2y4+kGFaOCER5jEcffRJ9Jxe5xxzaQ=
Received: by mx.zoho.eu with SMTPS id 1768343504418258.52013884644464;
	Tue, 13 Jan 2026 23:31:44 +0100 (CET)
Message-ID: <0a2a46e6-f1b2-4820-8d75-60b8f51cae66@redaril.me>
Date: Tue, 13 Jan 2026 23:31:42 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 3/3] ASoC: simple-card: Split alloc and init logics in probe
 function
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Fabio Forni <development@redaril.me>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260112231855.193030-1-development@redaril.me>
 <20260112231855.193030-4-development@redaril.me>
 <87tswqp7gl.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Fabio <fabio@redaril.me>
In-Reply-To: <87tswqp7gl.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I don't think dev_err_probe() should be called when -ENOMEM is thrown
as I think it's obvious what failed. It also seems to do anything at all
per commit d6137f25b191. Do you agree with that commit?

>>   	if (np && of_device_is_available(np)) {
>> -
>>   		ret = simple_parse_of(priv, li);
>>   		if (ret < 0)
>> -			goto err;
>> +			dev_err_probe(dev, ret,
>> +				      "components missing or uninitialized");
> 
[snip]
> 
> Is it clear error message ? It failed parse DT or something ?

That's exactly the part that made me provide this patch. There's so much going
on in simple_parse_of(). I think it may fail when a phandle of the wrong type
is passed in any of the simple-card node.
But I'm certain it can also fail when the DT is correct but kernel modules
of the simple-card's components aren't loaded yet, since this very case happened
to me. "components missing or uninitialized" basically sums it up, without saying
"parse error" that suggests a purely syntactic error. If you don't agree with that
message I can dive into the rabbit hole and learn what's going on inside simple_parse_of().

> with aligned. I like aligned code ;) ?

Blame clang-format style! I have autoformatting enabled. I'll manually fix the alignment :)

---

I'll fix the other errors in v2. And sorry for those missing `return`s, I shouldn't code in
the night...

On 13/01/26 03:33, Kuninori Morimoto wrote:
> 
> Hi Fabio
> 
> Thank you for your patch
> 
>> It wasn't clear to me when different simple_probe's gotos were to be used,
>> plus some allocation errors and snd_soc* errors were printed as if they were
>> a parsing error. This commit:
>>
>>   1. Splits the allocation logic and the initialization logic, respectively in
>>      simple_probe and simple_probe_merge_components
>>   2. Adds more error messages to improve the debugging experience
>>   3. Reduces the cognitive load of gotos, as there is now only one label (I concede
>>      that's subjective).
>>
>> This commit also documents simple_util_init_priv.
>>
>> Signed-off-by: Fabio Forni <development@redaril.me>
>> ---
> (snip)
>> +/**
>> + * simple_util_init_priv - Initializes private data of a simple audio card.
>> + * @priv: Private data to initialize. Must be pre-allocated.
>> + * @li: Links of the card. Cannot be NULL.
>> + *
>> + * Returns:
>> + * * %0       - OK.
>> + * * %-ENOMEM - Could not allocate memory.
>> + */
> 
> This should be separate patch.
> 
>> diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
>> index 298f8cc98130..b8004aa8f452 100644
>> --- a/sound/soc/generic/simple-card.c
>> +++ b/sound/soc/generic/simple-card.c
>> @@ -706,47 +706,26 @@ static int simple_soc_probe(struct snd_soc_card *card)
>>   	return simple_ret(priv, ret);
>>   }
>>   
>> -static int simple_probe(struct platform_device *pdev)
>> +static int simple_probe_merge_components(const struct device *dev,
>> +					 struct simple_util_priv *priv,
>> +					 struct link_info *li)
>>   {
>> -	struct simple_util_priv *priv;
>> -	struct device *dev = &pdev->dev;
>> -	struct device_node *np = dev->of_node;
>> -	struct snd_soc_card *card;
>> +	const struct device_node *np = dev->of_node;
>> +	struct snd_soc_card *card = simple_priv_to_card(priv);
>>   	int ret;
>>   
>> -	/* Allocate the private data and the DAI link array */
>> -	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>> -	if (!priv)
>> -		return -ENOMEM;
>> -
>> -	card = simple_priv_to_card(priv);
>> -	card->owner		= THIS_MODULE;
>> -	card->dev		= dev;
>> -	card->probe		= simple_soc_probe;
>> -	card->driver_name       = "simple-card";
>> -
>> -	ret = -ENOMEM;
>> -	struct link_info *li __free(kfree) = kzalloc(sizeof(*li), GFP_KERNEL);
>> -	if (!li)
>> -		goto end;
>> -
>> -	ret = simple_get_dais_count(priv, li);
>> -	if (ret < 0)
>> -		goto end;
>> -
>> -	ret = -EINVAL;
>>   	if (!li->link)
>> -		goto end;
>> +		return -EINVAL;
> 
> no dev_err_probe() ?
> 
>>   
>> -	ret = simple_util_init_priv(priv, li);
>> +	ret = simple_get_dais_count(priv, li);
>>   	if (ret < 0)
>> -		goto end;
>> +		dev_err_probe(dev, ret, "failed to count DAIs");
> 
> Here is missing return ?
> 
>>   	if (np && of_device_is_available(np)) {
>> -
>>   		ret = simple_parse_of(priv, li);
>>   		if (ret < 0)
>> -			goto err;
>> +			dev_err_probe(dev, ret,
>> +				      "components missing or uninitialized");
> 
> Here is missing return ?
> 
> Is it clear error message ? It failed parse DT or something ?
> 
>> @@ -756,57 +735,85 @@ static int simple_probe(struct platform_device *pdev)
>>   		struct snd_soc_dai_link *dai_link = priv->dai_link;
>>   		struct simple_dai_props *dai_props = priv->dai_props;
>>   
>> -		ret = -EINVAL;
>> -
>>   		cinfo = dev->platform_data;
>> -		if (!cinfo) {
>> -			dev_err(dev, "no info for asoc-simple-card\n");
>> -			goto err;
>> -		}
>> +		if (!cinfo)
>> +			return dev_err_probe(dev, -EINVAL,
>> +					     "no info for asoc-simple-card\n");
>> +
>> +		if (!cinfo->name || !cinfo->codec_dai.name || !cinfo->codec ||
>> +		    !cinfo->platform || !cinfo->cpu_dai.name)
> 
> I like aligned condition, same as original code.
> 
>> +			return dev_err_probe(
>> +				dev, -EINVAL,
>> +				"insufficient simple_util_info settings\n");
> 
> This can be 2 or 1 line ?
> 
>> +		cpus = dai_link->cpus;
>> +		cpus->dai_name = cinfo->cpu_dai.name;
>> +
>> +		codecs = dai_link->codecs;
>> +		codecs->name = cinfo->codec;
>> +		codecs->dai_name = cinfo->codec_dai.name;
>> +
>> +		platform = dai_link->platforms;
>> +		platform->name = cinfo->platform;
>> +
>> +		card->name = (cinfo->card) ? cinfo->card : cinfo->name;
>> +		dai_link->name = cinfo->name;
>> +		dai_link->stream_name = cinfo->name;
>> +		dai_link->dai_fmt = cinfo->daifmt;
>> +		dai_link->init = simple_util_dai_init;
> 
> I like tag aligned code, same as original
> 
>> +		memcpy(dai_props->cpu_dai, &cinfo->cpu_dai,
>> +		       sizeof(*dai_props->cpu_dai));
>> +		memcpy(dai_props->codec_dai, &cinfo->codec_dai,
>> +		       sizeof(*dai_props->codec_dai));
> 
> These can be 1 line (with aligned. I like aligned code ;) ?
> 
> 	memcpy(dai_props->cpu_dai,   &cinfo->cpu_dai,   sizeof(*dai_props->cpu_dai));
> 	memcpy(dai_props->codec_dai, &cinfo->codec_dai, sizeof(*dai_props->codec_dai));
> 
>> +static int simple_probe(struct platform_device *pdev)
>> +{
>> +	struct simple_util_priv *priv;
>> +	struct device *dev = &pdev->dev;
>> +	struct snd_soc_card *card;
>> +	int ret;
>>   
>> -		codecs			= dai_link->codecs;
>> -		codecs->name		= cinfo->codec;
>> -		codecs->dai_name	= cinfo->codec_dai.name;
>> +	/* Allocate the private data and the DAI link array */
>> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>> +	if (!priv)
>> +		return -ENOMEM;
>>   
>> -		platform		= dai_link->platforms;
>> -		platform->name		= cinfo->platform;
>> +	card = simple_priv_to_card(priv);
>> +	card->owner = THIS_MODULE;
>> +	card->dev = dev;
>> +	card->probe = simple_soc_probe;
>> +	card->driver_name = "simple-card";
> 
> I like to have tab align here, same as original code.
> 
>> -		card->name		= (cinfo->card) ? cinfo->card : cinfo->name;
>> -		dai_link->name		= cinfo->name;
>> -		dai_link->stream_name	= cinfo->name;
>> -		dai_link->dai_fmt	= cinfo->daifmt;
>> -		dai_link->init		= simple_util_dai_init;
>> -		memcpy(dai_props->cpu_dai, &cinfo->cpu_dai,
>> -					sizeof(*dai_props->cpu_dai));
>> -		memcpy(dai_props->codec_dai, &cinfo->codec_dai,
>> -					sizeof(*dai_props->codec_dai));
>> -	}
>> +	struct link_info *li __free(kfree) = kzalloc(sizeof(*li), GFP_KERNEL);
>> +	if (!li)
>> +		return -ENOMEM;
> 
> no dev_err_probe() ?
> 
>> +	ret = simple_util_init_priv(priv, li);
>> +	if (ret < 0)
>> +		return ret;
> 
> no dev_err_probe() ?
> 
> It is calling simple_util_init_priv() (A) without calling
> simple_get_dais_count() (B).
> ((B) simple_get_dais_count() fill li->num[x].xxx count, and
>   (A) simple_util_init_priv() will use it)
> 
> I think it doesn't work correctly ?
> 
> Thank you for your help !!
> 
> Best regards
> ---
> Kuninori Morimoto

