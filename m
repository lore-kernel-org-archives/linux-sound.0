Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D65BA41
	for <linux-sound@vger.kernel.org>; Fri, 10 May 2024 15:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715355563; cv=none; b=mU/te6dXl/nSf0nfHYkbgQKKhxD1ACvpZ06sFTWEWJlpLG4uDGp7SYQqsYvXqIPydcsNAWBqCvWgRiRm3ysFjJHalSAiqK+w0sgr0BvlIxxSIm5Fdvs4gY2/ZTA8GOq9dKQRZagnKEJsmd/47mOmyUI3XhquBP1FLC6a3u2yzcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715355563; c=relaxed/simple;
	bh=ACx1uvyWtWuXvtWHFMekx8GERUUvgaoNeVkzE29kgyE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MVrdJ8NMmmZjfU475T5nO9H/dexKGCbJ41uu7ZNZa2mKnWewL5KatjGWNZD/KghBWXRytCaLFk8Cg2hnBMfjYqE53cnPs86p/MAqIKLIjsV136NIkapts4oRWqMUDRzsJx1GB+K0sbRmNcwMJAzADR43AwanXfYqng+2Sw+Avk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ggzEC1lF; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ggzEC1lF"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2e538a264e0so13818371fa.1
        for <linux-sound@vger.kernel.org>; Fri, 10 May 2024 08:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715355560; x=1715960360; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zCGimXM0s95/gK/0gBrT6bfMmBtbTT9QqvxRV5ToZt8=;
        b=ggzEC1lFO7oPa94W+0cVHn7tgW3mRDiur8F72FPcjxPmqg28x/638W250ZHHOIoR7r
         FRQ3IiRrOQTUUj1WnUVE4acLXLAtlaMfM3/d6IDSSdAqRLhK6i4CmWEPqxjzOwtQQp5v
         2CJa/9Zgcf8TyQyj+dwp2y7OwE1l/5CaZc+NWYUTgSUC14HZAnUyNUfzMZKK6kc1itFt
         eayiH73qkrfqwfPTdwUTEcvlOfIWL4wpcYGi+e9qz/3GVn3TohdtoCjfqnhMFxlqUwUP
         UbGawxLDmOGdGFPlTwrf5G5XlINQoSQXIu7pZxjh8H6BEUQjbmqr0/vnwjAB0stt3VCT
         Ktfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715355560; x=1715960360;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zCGimXM0s95/gK/0gBrT6bfMmBtbTT9QqvxRV5ToZt8=;
        b=bxrkahmu9To77KSY639Z6iOMAkZk7Zw+LfXUEyT+4oGsSijh6ASn371kVKtEwuBHPd
         IZqU7zUrePBwPPg85PCQhh0tvemgVNohFctnMkIjnk+lDxLtrBBx9HpDUGcmsmOhsxo5
         MSV+U4of1rh76kijpHmPAglz0ugDbuesWqW1OuhnFhMNCk4gU2U/l5VJlxPC+4CWEiRc
         4O/qB0ilZY1U+nOX817OFGUIRFeGID/DNxUjoF86g4/9wzm/HwyjIrw8ze79Hp4e6xmF
         vw9h0BPelXw9JXmQj+O6730TzRk9uiVvu8GLnhPd0ztYdLEJC01uwn4e80FVPZiYEbt8
         Qh8Q==
X-Forwarded-Encrypted: i=1; AJvYcCU2l2de7U4uSTcHasLoS0p3OhPor9TXjdJ1uOYtnbTe/LcNb3lgkOtkDMf+tTcQQxClcXRA5VJuL/0bm0uNvvDStdVP81PKEpYYlwU=
X-Gm-Message-State: AOJu0YyKOgQTNMGr09zjP4h4l8KAMHWzWXV8iwv+UeeMmkvf0VbpWcoJ
	8xUBvtX+LOmRBByzdnUoem1Z/MhoOJoosnM7CZ6tpV/ZUiOMdVIAVIOCq4ztzlo=
X-Google-Smtp-Source: AGHT+IF7TN741mMkhPYgttssExz8B4IDN3HPogI6xNSBiOv89abZm4bMmHO6ARPMs21agKthCxa3lw==
X-Received: by 2002:a2e:7d09:0:b0:2e2:1647:f671 with SMTP id 38308e7fff4ca-2e5205c817emr25268691fa.47.1715355559934;
        Fri, 10 May 2024 08:39:19 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-41ff7a840d2sm27051475e9.39.2024.05.10.08.39.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 May 2024 08:39:19 -0700 (PDT)
Message-ID: <adde3972-f055-464b-83ac-8d8a2d874e29@linaro.org>
Date: Fri, 10 May 2024 16:39:18 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] ASoC: qcom: qdsp6: Set channel mapping instead of
 fixed defaults
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Banajit Goswami <bgoswami@quicinc.com>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240509-asoc-x1e80100-4-channel-mapping-v3-0-6f874552d7b2@linaro.org>
 <20240509-asoc-x1e80100-4-channel-mapping-v3-3-6f874552d7b2@linaro.org>
 <d3c78e43-44a9-4ef2-8e64-00f39b32172c@linaro.org>
 <aa8509c9-7475-40b3-82cb-9bfc1e33b202@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <aa8509c9-7475-40b3-82cb-9bfc1e33b202@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 09/05/2024 12:43, Krzysztof Kozlowski wrote:
> On 09/05/2024 11:17, Srinivas Kandagatla wrote:
>>> diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
>>> index eb9306280988..208b74e50445 100644
>>> --- a/sound/soc/qcom/qdsp6/audioreach.h
>>> +++ b/sound/soc/qcom/qdsp6/audioreach.h
>>> @@ -766,6 +766,7 @@ struct audioreach_module_config {
>>>    /* Packet Allocation routines */
>>>    void *audioreach_alloc_apm_cmd_pkt(int pkt_size, uint32_t opcode, uint32_t
>>>    				    token);
>>> +void audioreach_set_channel_mapping(u8 *ch_map, int num_channels);
>>>    void *audioreach_alloc_cmd_pkt(int payload_size, uint32_t opcode,
>>>    			       uint32_t token, uint32_t src_port,
>>>    			       uint32_t dest_port);
>>> diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
>>> index 00bbd291be5c..8ab55869e8a2 100644
>>> --- a/sound/soc/qcom/qdsp6/q6apm-dai.c
>>> +++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
>>> @@ -243,6 +243,7 @@ static int q6apm_dai_prepare(struct snd_soc_component *component,
>>>    	cfg.num_channels = runtime->channels;
>>>    	cfg.bit_width = prtd->bits_per_sample;
>>>    	cfg.fmt = SND_AUDIOCODEC_PCM;
>>> +	audioreach_set_channel_mapping(cfg.channel_map, runtime->channels);
>>>    
>>
>> Prepare can be called multiple times.. so we have channels overwritten here.
> 
> Which is expected - just like we overwrite number of channels.
This will work in q6apm-dai.c case as there is no set_channel_map callback.

lgtm.

Can you rename audioreach_set_channel_mapping to 
audioreach_set_default_channel_mapping which makes it more obvious that 
we are setting a default channel mappings.


--srini
> 
> Best regards,
> Krzysztof
> 
