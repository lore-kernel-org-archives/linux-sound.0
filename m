Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDDA188713;
	Wed,  8 Jan 2025 11:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736334058; cv=none; b=dJ4h0WnCvj9Bj/0yUM3ohxlag1bbzsSYlt4wHu2uJ+bSwAVarB1Pp7pATc4L9MAi2NGpSO8J+t8WonRJBC4NcOUchhzE9uD+d3AlNxnaizARVvssVXYausTUWSoLWfgyKc3LBGjPDvrvCNXZCAFevrsd7mtCU81n5VBQttIVFRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736334058; c=relaxed/simple;
	bh=zyGQtcZopqVVf1MmyYLCihSaTQ90pdF+oGAk1HMuDN0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XXYFVNGD5qyfwpTL4txJoUHAMs0qkh2zuCUEXSxuKbFSf4GG59fijKPBgNjQVLXpmzfgqalJGkawuhcohbw77prQlhjspuKDQKXh0SWCkd5AYMHwaNb3Y1AHDrX54BDDYTtWGctUOO15I1ilRpRyZMkfr+ll3dRSas2YcUw7aWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZYGJkNfq; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZYGJkNfq"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43675b1155bso159823605e9.2;
        Wed, 08 Jan 2025 03:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736334055; x=1736938855; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nfF6qmOoxm6fuPMOfSX3I5ZVSTqP83B7aYDROD3Hgw8=;
        b=ZYGJkNfqCaYC0hGf4T7MDrXheiX9jDPy4lEo7Fpgz57T66ZCgTGMrVwgqw8sucjLNy
         xvzxpY033N29BpRVRHIwRp6Q19qOAxOtIQ7beYyVn0wfdXbU0BMK0zfuZAQFUwtbOwn8
         dZJPuDwxU7iC0jEFFHz6HLr8Yy9QTswVrPP4keBKjQcj53iY6IaYmYckLKmzAyo0uGUr
         u4JQn6gfJOYxt0mIYzMppKf9vlwgHqh/SbGwPIwkjeI6RH0NCuI2jkl60j7YaMAW0KdW
         nqqqoHVA/uaO/GF3fZT6+cIDjDLLKl344MInnmdC/sOq7sJBt3sgQm9kRrlfL0PlCy2s
         2GOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736334055; x=1736938855;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nfF6qmOoxm6fuPMOfSX3I5ZVSTqP83B7aYDROD3Hgw8=;
        b=OpOh/E7hNGKVCVpW4X9R2NvS8JPkCNrhyML6NWRfKaogSoy+XoecHCGPCqH8/4nx5R
         3BHXC2V3EKAhawRKl48wm1u4xUFrqVxj1hu+R9o1nXvSwW4enjO2GcdzLWVYXC62sTvr
         Nzf3tekbyrh/ePlQbb9wu2UusxrVH1+0+3OFKXXaqL00mRX5Oqd5g48WcFk11P66/oY8
         5xdZsKjqEhFVdj81IcpyKBj0PysO383oM8lks7HbpFLYu1O/poXIPqf+Yh2pwI0aklVT
         jcPWBZM5IJPUaDlDeMMTTFayquksRFVad5/Tt4kzfJ42E5C6uPM5f7fG2w9I+gN5zX4A
         21IA==
X-Forwarded-Encrypted: i=1; AJvYcCUuBdCgpGh51iUJs61+8PAO+emy4Z04VROnoY0uCDe0QPp8oiJQWZceJQwJrJgIG5Xx8ZKC7secu1O9gqU=@vger.kernel.org, AJvYcCWzuCmKRnpisAV68SJwnqUPzyESEPuXNbw88PERetGdtyk4zWYZq37THKz67bGEdl9RC0vdtjrcyBwRlHE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+MfLR0PB63mbuFWzjTSWwc+bwtg+Vvs6sCIUOpoRJ6nFTV4W5
	wl+8uqJuwsYqIPIBQxo+CirL+SfwkjteCFa09Jhw5C5BLqtq0UJi
X-Gm-Gg: ASbGncuW9LeQseR73pF1fhosLn+PxxSo47C3fFhwBhOi4t0q3tFMHt91zB/Bk2+8UdD
	Eo5zWdQ2AcbF85rgNSPdapmkB7TV9/PlmHbeH/0VetK3Q2g93y7ZA5RGbbMctCnvMbtmgKVQxDF
	eEJF/lqb8GFwUGtv2+cG8ema53S9hVRcpHN4wzOhuMu/NDI04k1gvEkC+6KiyIXj1V2aknvZ+u9
	Je9GDBNqhxX67QElvg8qS7qkKcM53vFWfJW7n3lPls9y+wcTjW6klTviRxcRcXvkdZ/phKoyx9+
	Cg5cWw==
X-Google-Smtp-Source: AGHT+IF7djzTQ6cnkvgYCpe8Vb67fK69QPDrp5Oo9Lrk3N/toT6EMw2+pE+Qx1jvUfA4kw2REQsNDw==
X-Received: by 2002:a05:600c:4fc6:b0:435:172:5052 with SMTP id 5b1f17b1804b1-436e2686492mr17267625e9.1.1736334054994;
        Wed, 08 Jan 2025 03:00:54 -0800 (PST)
Received: from [192.168.4.226] ([92.120.5.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c829015sm52630214f8f.13.2025.01.08.03.00.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 03:00:54 -0800 (PST)
Message-ID: <197add46-752d-4779-98ff-1cde2543dd63@gmail.com>
Date: Wed, 8 Jan 2025 13:00:51 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] ASoC: simple-card-utils: fix priv->dai_props indexing
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241220151213.2462-1-laurentiumihalcea111@gmail.com>
 <87h66v8bsc.wl-kuninori.morimoto.gx@renesas.com>
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <87h66v8bsc.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/23/2024 2:48 AM, Kuninori Morimoto wrote:
> Hi Laurentiu
>
> Thank you for the patch
>
>> As of commit cb18cd26039f ("ASoC: soc-core: do rtd->id trick at
>> snd_soc_add_pcm_runtime()") the ID stored in the PCM runtime data can
>> no longer be safely used to index the priv->dai_props array. This is
>> because the ID may be modified during snd_soc_add_pcm_runtime(), thus
>> resulting in an ID that's no longer a valid array index.
>>
>> To fix this, use the position of the dai_link stored inside the PCM
>> runtime data relative to the start of the dai_link array as index into
>> the priv->dai_props array.
>>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> (snip)
>> +#define runtime_simple_priv_to_props(priv, rtd)					\
>> +	((priv)->dai_props + ((rtd)->dai_link - (priv)->dai_link))
> Oh yes, indeed.
>
> But I wonder it is needed not only utils, but all drivers
> (= simple-card/audio-graph-card/audio-graph-card2).

At this point I'd say there's no need to do the replacement anywhere else. That's because the code
still using simple_priv_to_props() makes use of the link number to index the array, which is fine.
This is opposed to the PCM runtime data ID that may not correspond to a link number, thus making it
unfit for use as an array index.

>
> Why don't you just replace macro ?
>
> 	- #define simple_priv_to_props(priv, i) // old macro
> 	+ #define simple_priv_to_props(priv, i) // new macro
>
> Or, do you have any reasons ?
>
> In replase case, we would like to have the comment not only git-log but
> on header too.
>
>
> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto

Thanks for taking your time to review this and sorry for the (very) late reply!
