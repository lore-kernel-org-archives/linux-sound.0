Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148B2135A7F
	for <linux-sound@vger.kernel.org>; Mon, 20 May 2024 13:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716213461; cv=none; b=spT46lPmYPRx/j1zTFjgvdLLYLlUTNXN8bKfmj3wT25ajkML9XmamnyfdtZNiLzOabCcCg/YSeGLFrAUt/zFIIAeT1Bkpv1IpoVYgPTURaFntAYSomOxGiUAIKH+q3XBnt3f7ngoU0Wqdqc6ShOSaNdIkWUj3KtPecc7QCx471A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716213461; c=relaxed/simple;
	bh=hz1NbHsnS8VM83jZDGbfce0Y04Ax0FINz964pXTrpYI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d6nU1AGIF1756Q+XseuYsuK498p9R2byr8O32rDj5cQZyRAri5KXDJL+eyzY7pn5DnwJmwzkgHgnG6KBZGcWyJfia88BD5nW4PtXktCpLQ03OkKbTrobi7ExZ/e45Dk9HBHTMsx9ukBOBQ48AFxlMm48Z/E5tMvMkHE4reRZ39c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I6QBEyaz; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I6QBEyaz"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a5a2d0d8644so634055566b.1
        for <linux-sound@vger.kernel.org>; Mon, 20 May 2024 06:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716213458; x=1716818258; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QRamhVuVMRjdbf0PqzgKHE62r/5JU7p/yeFWq/4P6B8=;
        b=I6QBEyaznV5STDV3cEsmZy978mJeVIIREHEybfI+K6Q9MNMQsrNcn6izfUsDtr6RrP
         kblzMuXYvrpXWLuFrw4qVPXZ/yNg1EInLdKyP8M10gO+HUQorf29wWWNwvCPcvTtTv2Y
         psgZw9XE1/HQXdL509yw2dULwY6bgF5hiyXmSmdjTY9w6tHjXIcnnH+J3B9Sf/Qe20ET
         7xnTEPFzR6Ad/LJehT4AFMhJY7BJzwD0EO/8aZyoVJJegcdrv08UWWiUZM6LXwaox6bu
         uPi2L/JEGukIA10kmcDJSSFUM20daqXBO5OjYofzjx8Nv+hUWJXtVVP60Xu9TFq3oZsy
         ybaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716213458; x=1716818258;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QRamhVuVMRjdbf0PqzgKHE62r/5JU7p/yeFWq/4P6B8=;
        b=KGLw0aNdNL3qhussz8KTsVB2mU66/I1icgUGEMcE7MF7f6PJDkZaFin/6Rz2OnrBU/
         hJtnY77idHD7hhatF3ZhebMxD0RNHS7sLps7Pk7TzZDJF/XISq3VKZaAmg81lGaWfkxt
         T0EEBB0VTkDU3oJ4kYa7H/UUMBTU1I7VP2rC9KhfES0o2lJT4z6inlrjMYqTffWPwgDh
         3jwzWxVUizPNssCt0s/n6M9QY1Yb/fCzB3/maGEmOYTElJPNJbK7zkzdO/vZ9W5icZ/9
         2Ze7fyxDFzfRTzrD8HBw+ucv/PuoWMb0GiPVPGiSHysGr0rnfxxrDXs3pwqpGi6EVLkM
         rsqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtI5Ox6rs+BhdB+DiTaUYEXUtOZ9XMm3+TY0zZ3SfdBNbDbE7sQEmkDZYDztqs1EG3qs3PP0raq3OsDjyrwiel1uYeL5PddMzD/bs=
X-Gm-Message-State: AOJu0YxNj/dG/xGL4ddGD1tvc9a9YozbGB1vsEAznnB+SRAuLC7spLjh
	VHj9UZ8zn0zPh7ha/r41vd0aVl8YJnucTdxVLL7+JBTr3PtxsvJGUpF8FVIIJzE=
X-Google-Smtp-Source: AGHT+IHJ4TjOsch17ekDhKwGOmXGwBjMLnonRjbcmiUS/hMsvvp7nSgXL34tLdwpY+FNeQ7sGb2ZSw==
X-Received: by 2002:a17:906:1d05:b0:a59:c9b1:cb68 with SMTP id a640c23a62f3a-a5a2d55a759mr2047316166b.7.1716213458224;
        Mon, 20 May 2024 06:57:38 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a179c7da8sm1469644366b.99.2024.05.20.06.57.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 May 2024 06:57:37 -0700 (PDT)
Message-ID: <7b9d66a9-22b4-4fdc-a6a5-dda737a4f932@linaro.org>
Date: Mon, 20 May 2024 15:57:35 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] ASoC: qcom: qdsp6: Set channel mapping instead of
 fixed defaults
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
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
 <adde3972-f055-464b-83ac-8d8a2d874e29@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <adde3972-f055-464b-83ac-8d8a2d874e29@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/05/2024 17:39, Srinivas Kandagatla wrote:
> 
> 
> On 09/05/2024 12:43, Krzysztof Kozlowski wrote:
>> On 09/05/2024 11:17, Srinivas Kandagatla wrote:
>>>> diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
>>>> index eb9306280988..208b74e50445 100644
>>>> --- a/sound/soc/qcom/qdsp6/audioreach.h
>>>> +++ b/sound/soc/qcom/qdsp6/audioreach.h
>>>> @@ -766,6 +766,7 @@ struct audioreach_module_config {
>>>>    /* Packet Allocation routines */
>>>>    void *audioreach_alloc_apm_cmd_pkt(int pkt_size, uint32_t opcode, uint32_t
>>>>    				    token);
>>>> +void audioreach_set_channel_mapping(u8 *ch_map, int num_channels);
>>>>    void *audioreach_alloc_cmd_pkt(int payload_size, uint32_t opcode,
>>>>    			       uint32_t token, uint32_t src_port,
>>>>    			       uint32_t dest_port);
>>>> diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
>>>> index 00bbd291be5c..8ab55869e8a2 100644
>>>> --- a/sound/soc/qcom/qdsp6/q6apm-dai.c
>>>> +++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
>>>> @@ -243,6 +243,7 @@ static int q6apm_dai_prepare(struct snd_soc_component *component,
>>>>    	cfg.num_channels = runtime->channels;
>>>>    	cfg.bit_width = prtd->bits_per_sample;
>>>>    	cfg.fmt = SND_AUDIOCODEC_PCM;
>>>> +	audioreach_set_channel_mapping(cfg.channel_map, runtime->channels);
>>>>    
>>>
>>> Prepare can be called multiple times.. so we have channels overwritten here.
>>
>> Which is expected - just like we overwrite number of channels.
> This will work in q6apm-dai.c case as there is no set_channel_map callback.
> 
> lgtm.
> 
> Can you rename audioreach_set_channel_mapping to 
> audioreach_set_default_channel_mapping which makes it more obvious that 
> we are setting a default channel mappings.

Ack.

Best regards,
Krzysztof

