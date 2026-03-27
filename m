Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6678626F2AD
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 03:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774581445; cv=none; b=uku67n7dlVPkjHDq3l9mJAd3LeUflTYKfuOkgucQFxDZ4PT/v3drF/q8Qkqd3DK6rgyna7+VzrWYA/GavKXmnyI+iP61kuZB3k90zh7ORn/IovOiHjvTsBcRfEg54SJ7OVfATxLdB5j1wbImTI1arPGStFMr/gjv0D37CZtHg94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774581445; c=relaxed/simple;
	bh=js/iV+JQYJfOWCqwLXObYEO4q+j9k6QcS/1h0yga8XA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V5CKwjS8srh+/Fkmc3MvXPGjL8DuA2xIKVnrKWCGLvIuTPNekPKypWOoXz83WRN++LUk+VuoYeoHwGC+Nbaw3s1sOECq57SYD0/8bxjCB1eFf5TyYnqvSLq27Dtd28wvt4aX2zCSGQvmkBhK/abwu0sAkjEhpdTGb4qBOrrR13w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jg70meUi; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jg70meUi"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2bdd40d3c61so1499492eec.1
        for <linux-sound@vger.kernel.org>; Thu, 26 Mar 2026 20:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774581443; x=1775186243; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tr4fog4gmIs86XZzl/XYBaiJRPRO3+BQhmPV4D4emLw=;
        b=jg70meUiKZUe8kbUuBHFXYjKlea2Ila1RfjDnh9t2q6ZpHxvFDBpr5uNlVcSvA9S9I
         pfpT0yi9/gQ7HK8cXatRaxhTXSJSMO3FjOfpf7uF6crszqDEkz1ncDAt4cg/hN4n10IC
         525CFZaBWyUzyV9HQcJi4mmYE8/UrGqtrJT0qcu4RLaaRRdtVHniC27MMcHSgqfRq7ls
         VG5ZOHxaxLYO3LXOQDTZYYWDN8RV/b8itkoSnOSlKrDqbyK2u3elXjKZ58nQzgeW7y+Q
         KU7FgToWSnw4dMGsEWEsHlJDQJDefeyiSKX6k2MLJ7b1LkIK656PAnAze56aUevziqFv
         68Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774581443; x=1775186243;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tr4fog4gmIs86XZzl/XYBaiJRPRO3+BQhmPV4D4emLw=;
        b=oZuT07GOpf/qI8BvkUd3yVQuZ1SpIUtLc5oVu3M18cZHz+CE9ZCzHScY29ENSV6tZE
         Ew5UJ4GALJETQIJTtgl34XHsZn4w3GU3ScTlfOUOWb8geWpz5o6zGZdGNWJDH3wADKC7
         EdFprhTKUi10jCX71DzOAtKpdz1VftlTc54mDXGXHA2I/07V2vlH9hiz83/BaixeZWYZ
         Xr+QP4wI0O8lcmIrZz8bdeAC6Cmhke27p5K/xTOnBznknExMvKNVbGLceWTQe6Bt3Q+y
         HdAcAg8YOUrCepCRctO7BqV5M5erv0HlwY1L5lNi71FVFkqY7JxW9gNjJlv1+T4Vl0ML
         ZPyg==
X-Forwarded-Encrypted: i=1; AJvYcCXnaJZnomCRSbUaaupNpYxW2prHh9x+NrXFy5pB0F/6VXvZVmXVzs19h6q2IqG+xlOi5jlaTURSyPRFKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCvk5c05jFGfzL0hPjxCNjCDg02npwQXJJX7CLlm7uXV1BgrnC
	W0wounxlw0y7r+1iN05JYiIpSTWMa7ThBtm1TZoCq3PNFWjKm91Ltch4
X-Gm-Gg: ATEYQzxya47DE2pVEGyc89fjPE7X/AxpJApXSWLLmmnQPj256ECI56RMuPIcaTDC5Pn
	GBpRG1KoIirJ1WPJ1LRMJrEk/9nCoYGDO6bTwTMctuSNKzigzq7AipOYq1kkESRRtTXbGyIuvdJ
	6iDVX64GpULPTziciXe04Fdz+RbAsdNredRQ3NCMe1r5/NXGYybIfMzJOv+axlJ6gMc2N3nUz6y
	ayCyJD768gL9yaT70zYZTqNDg8LG0ZFxFaZGsbNWpRBmOcJl7olhoAfgY7AnXHsw6Ptm/s+9DFZ
	RYaC5ab+rE5KCshb36tIG2Hli+UeV4W3Si8/1ea+AW8GnAAXTW5Mb+qMN3K8Rz4pE3Q/rjksMcn
	FDAE/vQLhtZ4/lNSqu6TiOxoLkwMIXFdlgbLPyi1+7jaq7qEJOwTEspcOLlzKafOOmhfYIVVJ6F
	Zc3TFER0SbXZejPFpuMRSmQnEmx4s24CCq4CkQeHN8Sy9sl3jmXiDXFul8YLIWzdTBzXEy/O+vO
	A==
X-Received: by 2002:a05:693c:3113:b0:2b7:1abc:a6e9 with SMTP id 5a478bee46e88-2c185dd38e1mr617445eec.12.1774581443338;
        Thu, 26 Mar 2026 20:17:23 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-78.user3p.v-tal.net.br. [177.4.161.78])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16ec7f9c9sm5609118eec.12.2026.03.26.20.17.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 20:17:22 -0700 (PDT)
Message-ID: <902117a1-8389-49c5-8c09-0566f1d8447e@gmail.com>
Date: Fri, 27 Mar 2026 00:17:19 -0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: generic: keep fallback dai_name stable across
 rebind
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260326-asoc-generic-fallback-dai-name-rebind-v1-1-ac9da3cbd606@gmail.com>
 <877bqyxej1.wl-kuninori.morimoto.gx@renesas.com>
From: =?UTF-8?Q?C=C3=A1ssio_Gabriel_Monteiro_Pires?=
 <cassiogabrielcontato@gmail.com>
Content-Language: en-US
In-Reply-To: <877bqyxej1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Kuninori

On 3/26/26 22:11, Kuninori Morimoto wrote:
> 
> Hi Cássio
> 
> Thank you for your patch
> 
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
>> ---
> 
> It looks good to me.
> 
> Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> 1 concern is that this function is using goto, ad your code is fixing
> (A) part.
> 
> 	int graph_util_parse_dai(...)
> 	{
> 		...
> 		dai = snd_soc_get_dai_via_args(...);
> 		if (dai) {
> 			...
> =>			goto parse_dai_end;
> 		}
> 
> (A)		...
> 
> 	parse_dai_end:
> 		...
> 	}
> 
> 
> I think it is good timing to use if-else here ?
> 
> 	int graph_util_parse_dai(...)
> 	{
> 		...
> 		dai = snd_soc_get_dai_via_args(...);
> 		if (dai) {
> 			...
> +		} else {
> + (A)			...
> +		}
> 		...
> 	}
> 
> 

That makes sense, and it’s clearer.
I’m going to send the v2 patch with the changes.

> 
> Thank you for your help !!
> 
> Best regards
> ---
> Kuninori Morimoto

-- 
Thanks,
Cássio

