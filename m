Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23E6202F80
	for <linux-sound@vger.kernel.org>; Fri, 14 Mar 2025 17:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741974011; cv=none; b=I9g0yXcGy8dbYUmTuBRAb0IyZb91uRNomH4xA9hUBU/VKJ9UzWxLThqSkaW7Cz9rTm6fbjB08JbO+4jVslfQnO6hDbEmcxErOZwFPT8uv21SVJggHz6hgBvc3WZtpsIOyR+XRPZ6XtP+9YTP1w0O2D4p3c6ojOUxESrBa4s1ojk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741974011; c=relaxed/simple;
	bh=+y5PhC4XzO/VnRIwG5rJiSt/p4JA+JB3Z4/wrDzAWAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pNUiqmLY12hcf8P2q2GM+0CIq6VtuxNtxGQHNg+sSvwKF2sh5nz1fMk8S7D/HbMNXCwmT1HblMrAUMKqBphT1QYq68cYTy/yF+xqsDGhdyNVC+6fv9M3L3N/mkmXwQYZqiql6vCBXsXWW781sjvXvLd3U/s5CcTJ9RHPzuBYy9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xoLqgRv4; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xoLqgRv4"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39127512371so1535208f8f.0
        for <linux-sound@vger.kernel.org>; Fri, 14 Mar 2025 10:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741974008; x=1742578808; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=68pP/H0ssSIUIb0wMm11zyV+DWPe8FTOSDazoy8xF8o=;
        b=xoLqgRv43DEFE8NTmiEA/MhNCCgK6xJqIZ3RbqVbOWKDrcK55lgBeXNbDFV186sd8a
         ooWc/jhZWUmFCkdixADFP2aN+qS7JhtkepiKIgBFFVLEuvMVvmksWIo8wjaJ6Y+vV8t/
         PqDafPH/8ACk3gP3HYiHUzfHhDI3RKd2wDPfvfcTxZeEA4pGGDPkAI1KaqV1MLdHGKRd
         N4PvT7Js1m7EH0Q+zVa7PniE045AdMPY2LWA/DIjpsrzbPzjaQsuzD1af1Qk0Gmk02DO
         N07gsTE9JyqTJDPH8ErRsJXbYuW8aBEbWBTmyZZCod1c74M0ggMLHXg11DezBikId/g8
         x0Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741974008; x=1742578808;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=68pP/H0ssSIUIb0wMm11zyV+DWPe8FTOSDazoy8xF8o=;
        b=SSC5PUzKrL5j5+iC0FR7sYAEARshCRCSleUXlUPYootPnE8jkszKViHf8Nz1+/RBdh
         FLrBQAwc4+mIab0QRF3xkSBs7MJ69plqCT9s4ZA35Qe7ZMq/fRzXfdbq3Anz71O8z7DB
         wrTX6WQG1kh2eosgavTH5UUO/vUzLDWw65MFYsag7Sf7rf0IqFDad7njcjqq++ivYAXa
         8Gym2h0y2uX8VkKi2BG2hafqokaZ/lPTmCuamWdNy0Lh4MQPjw1dIrQx2IUlyqyh354n
         6dx/yGuZVHsCqigcaF8aPozugRBHEq218tyM8CTqRUuK1yj3++u+iSLxfpyh91QnE88S
         LA3A==
X-Forwarded-Encrypted: i=1; AJvYcCXCHRGPd3B9UssG2VOdYgmeJnpLthHayKZXkO9lwBqFHX/zqVvosNe8q1xJKrWWB2JUrhRM0vHOx0+BDw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz3ZdPpYqN20/iR3J8NOeoKA4xRiYTcfbKN2sEnMzE/N2QhawQ
	D4d7ctAPTx0p7I2FlrisXrRgOAZiuzB126M5bjHKNOFNtoHnR7BQ0oXIHTI9hE8=
X-Gm-Gg: ASbGncvYt458ml+NHGCn2Hn8w9sLWXhJgyq6J8pfkV8BN5VfHdsMMr0jsK3yolKDnYg
	QO+D8fda8Swiav8wfkpcFwzxYA04bSHCmksqQmbkfaJgnIkHIhE1xmAt+Hm+jrvGztwFFnxlu95
	gEvtwzRuMgcVYYGSNFBr31WeJWuZRzWY7+ynHAYeoaukjekq7WEKBSvJLg5bTJCoZKOvAZdQ/KN
	V4g4yJU2A4aiv1NCsritFkQN6jzR34rWp22hdNE8r/3aij2/BuQnSIQlElAZzaPa5IIRMoGK3KU
	Ls2m7drGNIzKKHP0CCbVM13URIHzi/TFIoD9CcTfTonUNcks8hKR85u6Xk1B1Aw=
X-Google-Smtp-Source: AGHT+IH78OxZy3COSxNQ/R2QpNx/WSsG5NmsZ858z5YdVxy8Zi13E8ydSZy8fnTU59kmbAhJ0dXxlQ==
X-Received: by 2002:adf:a39b:0:b0:397:5de8:6937 with SMTP id ffacd0b85a97d-3975de869d5mr3233289f8f.41.1741974007940;
        Fri, 14 Mar 2025 10:40:07 -0700 (PDT)
Received: from [192.168.68.117] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-395c8e43244sm6339791f8f.60.2025.03.14.10.40.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 10:40:07 -0700 (PDT)
Message-ID: <9e42378b-b9b6-47f9-a7f5-0e003afc3ebb@linaro.org>
Date: Fri, 14 Mar 2025 17:40:05 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] ASoC: qdsp6: q6apm-dai: set 10 ms period and
 buffer alignment.
To: Johan Hovold <johan@kernel.org>
Cc: broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 krzysztof.kozlowski@linaro.org, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dmitry.baryshkov@linaro.org, johan+linaro@kernel.org
References: <20250314143220.6215-1-srinivas.kandagatla@linaro.org>
 <20250314143220.6215-5-srinivas.kandagatla@linaro.org>
 <Z9Rdc-EWhEH8IQPu@hovoldconsulting.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <Z9Rdc-EWhEH8IQPu@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 14/03/2025 16:46, Johan Hovold wrote:
> On Fri, Mar 14, 2025 at 02:32:19PM +0000, Srinivas Kandagatla wrote:
>> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>
>> DSP expects the periods to be aligned to fragment sizes, currently
>> setting up to hw constriants on periods bytes is not going to work
>> correctly as we can endup with periods sizes aligned to 32 bytes however
>> not aligned to fragment size.
>>
>> Update the constriants to use fragment size, and also set at step of
>> 10ms for period size to accommodate DSP requirements of 10ms latency.
>>
>> Fixes: 9b4fe0f1cd79 ("ASoC: qdsp6: audioreach: add q6apm-dai support")
> 
> For all of the patches, if the intention is that they should be
> backported to stable they should have a CC stable tag here.

Ideally yes. It would nice to get these back ported to stable.
> 
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   sound/soc/qcom/qdsp6/q6apm-dai.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
>> index 90cb24947f31..a636f9280645 100644
>> --- a/sound/soc/qcom/qdsp6/q6apm-dai.c
>> +++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
>> @@ -231,7 +231,6 @@ static int q6apm_dai_prepare(struct snd_soc_component *component,
>>   	cfg.bit_width = prtd->bits_per_sample;
>>   	cfg.fmt = SND_AUDIOCODEC_PCM;
>>   	audioreach_set_default_channel_mapping(cfg.channel_map, runtime->channels);
>> -
> 
> nit: unrelated change
Fixed in v5.

--srini
> 
>>   	if (prtd->state) {
>>   		/* clear the previous setup if any  */
>>   		q6apm_graph_stop(prtd->graph);
> 
> Johan
