Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815152;
	b=JE7xAMNVYRkJmRls73HsqOPylKo1Z5VRp019+3oT+gCtHyIQIYutpKtbZw+Qvn8gz8w1
	 MFK8x0IeclPoAb7ZWdcS1ObTY7qv6gOvqv3Zprj7NHEGKdPoJxjO14z1afeT8TYatQXGl
	 dkibYa9q9YpMMpODYXKgutbqxZfEbLY7yIbk7dgEBIetok5K8AN0PKikLFC1ZZIfiT2rT
	 r58UpDi/zVwgVc999AKmzIDx4SYuYDBOXnpyDDLVDOAJqhTeqY+r/O0eq/VdWYO98s7l2
	 cnWDYh+vQoWSS84G16+2Ls2vAz5mJpmL+0ZL1WzwbzDMVW35AWX3sdqJjg1KJqKvnAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815152;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:References:
	 Content-Language:Autocrypt:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=UnB58VtwIqHbFAiwQpoPWYvPypnxq/uodwoMm6+SFKg=;
	b=ekiIdOoGFvt7E0PqkqMocskiStRFHVF2tHz9ORq3X+82+ced9WqGSKN/IkWsVfg8GMtR
	 CAQEB+aWjFd/Ly7epgILMWaty1Udcrx3lNC4/ZsZ38Z853lZ8DAT6E6FgMVTvG7HxpT9u
	 LWwNQ3AnTQHEBzK0mQQHRod7+hcWibgLEi00KApl0xHqbgmnDM1xd7VkBUxQBOM1F/h0W
	 22U/WyOH6R4EnWVxLM5NLLNbfqMm2X13gnanAJ/T6LpcPN8QMLDoRqRB53o/pWtbadS+S
	 ysEUXa5MSZsgeRnPhfEoMfgcT2unkz916uuk1zJLVQ47a54wfAyorOtHfJU3ZxjHGwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uH1UHW+6;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94563606A8A7
	for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 07:45:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94563606A8A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uH1UHW+6
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so6841995e9.3
        for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 23:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794815150; x=1795419950; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UnB58VtwIqHbFAiwQpoPWYvPypnxq/uodwoMm6+SFKg=;
        b=uH1UHW+6Nv9uV3veKzI/XGJ8jLiL8Cjag2K34dTGu0nQzmp/7Tfwie3Z5uy93db4ql
         aL7ODeEcFcKSaY7mUckXRxrYTz9Q7ockBjR4Xr/YUESryIkW0xzPnxrwrtpaI1WwVqrl
         We9+87Ls8rHaXCmS0eC+84jNWIc+0TqoR5QTGeU+wGEm2cGpyHYZ1UghzAJeQen4SNSy
         3r+K1LmY9dED9KAu30Dc71UyUP6ehlBI0Ayz+AzvRRlTqhnAPY60UldSazttB2LsyNuc
         Amor4HzjPqZd2IJX8lnXoCaGga2B8E6JyUfwEBka+NJ2yXdl/nZbOM8xzxOz9iPRVUFo
         RoVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815150; x=1795419950;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UnB58VtwIqHbFAiwQpoPWYvPypnxq/uodwoMm6+SFKg=;
        b=NjC1UWS03wZkTT1mS4fOLU6u3lufqRiDs4UZCsq0+fs3fGNyQnavtYAT6Jo8xj8pl2
         cnP0uVXNaY5JXE7JC9iNkK2s0DcwLU+AVIqUdf9mP331F8f0p5FmorY0Ur02zkEC5zQR
         dwgG+pRSsY2e1AriNkV4PpnDuOQ6KDOMlwRmYDHZjxPhCRxuaN99hzYLawChmYtGwhjY
         Ad3qrK5LXi6Mvh/o5VeMG8BbvjhjpQ2kPOUciyrNHYI9OnPP9nWXF6CuAodYoe6yTQ+K
         s59cj4E6pjGUpRvZvhq2COm0GYAU1Fj1narTGxNpCauGR8952Tmby0SEqsyM0TQHHGLr
         0eiQ==
X-Gm-Message-State: APuU4Z9RKrAePBJ9UNY3FeAVUKF0+rPpF+92SqjxiPMF/4NT8NbdIU6J
	leub6BpPsj+UnUHKni0ov249iDvdylWrMTALkPYvym5utavg3AoEbR4DT8ECqypDgE0=
X-Gm-Gg: AYBFou3IiQ+vYBnR+CWUH6OocbjQ8i5lMGC2jFqRIENUSnqq0iqftHcoUlrvFNhItGO
	H5xjqkIxqW82C1i9AUvQONiCJEttJkHHzTzAHGVS2VUMjtIt9SF0cyNiDXWMmabCuxLEyJbqlnn
	d+jDg9M7G1BoZwW3UgEKyy+E7RfSjtzdQ/mLS49GFXMLfah2d6BVzZC+yhd6UCrjAeCbjxRJq4s
	tmafGEEImiS1n1YOZyyOf2XhTQbC5wkgmHm5x5QoyCM7xVp44mGPb2DC6Y3tgoFop+jCSgc0fMA
	zKYf0UitYOejnrCB+pX1Z+5uAoLI1Aw/iUgpFvuLQEU/smgAFNHRm/jg9kSuLnRms+8NOTrJsut
	ACPRgEJsRTzT12yCrflNX2DRcyp2aeoEaaFGHdr8hVyzrpdNvu2nfrjFeciCTGR4nN0O/oVb01V
	5FYv8F9YUGmPmfDJC9DlMZftZ5S4Vw6sy5NxxfGPT93qhahwNpYop4nNdSJZ8MUA2Jg6oO7aAkG
	pKBF6c7osctS3FNNqDG8Kz9PUGQXICETAxa1SRosRc4WLEPMrWWuk+UJph2zdr0UT51Fb7wVpa/
	dbDS0BVauEiYSd2zfRJLgCSIafDSBlRjtKbjoJDecYKlTEIp+SLvqbrdbtwdAUQyng/Ej0fF7RY
	zw9Xne6dQkQ==
X-Received: by 2002:a05:600c:a44:b0:4a2:a6e:80f5 with SMTP id 5b1f17b1804b1-4bb55a45045mr214478045e9.11.1794815149872;
        Sun, 15 Nov 2026 23:45:49 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:575d:8fcf:e30d:5aed? ([2a01:e0a:106d:1080:575d:8fcf:e30d:5aed])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb6caae30csm89916945e9.2.2026.11.15.23.45.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 23:45:49 -0800 (PST)
Message-ID: <04b0fbb4-6083-4321-a907-f3b23a4c90f1@linaro.org>
Date: Mon, 16 Nov 2026 08:45:49 +0100
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC 07/23] ASoC: dt-bindings: qcom,lpass-cpu: document the
 SM8650 LPASS
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
 <20261113-topic-sm8650-el2-v1-7-5183f6aab9fc@linaro.org>
 <sashiko-outbox-213486@kernel.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <sashiko-outbox-213486@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 19:57, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] ASoC: dt-bindings: qcom,lpass-cpu: split unwieldy per-compatible
>    schema
> --
> 
> commit f17c7c8f20845c2d15f821f60a13b5f93656ae8d
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> ASoC: dt-bindings: qcom,lpass-cpu: document the SM8650 LPASS
> 
> This commit adds the qcom,sm8650-lpass-cpu compatible string and its
> register, clock, and interrupt definitions to the qcom,lpass-cpu binding
> schema.
> 
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
>> index 3a559bd07a79b..f431173a0e880 100644
>> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
>> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
>> @@ -23,32 +23,33 @@ properties:
>>         - qcom,apq8016-lpass-cpu
>>         - qcom,sc7180-lpass-cpu
>>         - qcom,sc7280-lpass-cpu
>> +      - qcom,sm8650-lpass-cpu
>>   
>>     reg:
>>       minItems: 1
>> -    maxItems: 6
>> +    maxItems: 8
>>       description: LPAIF core registers
>>   
>>     reg-names:
>>       minItems: 1
>> -    maxItems: 6
>> +    maxItems: 8
>>   
>>     clocks:
>>       minItems: 3
>> -    maxItems: 10
>> +    maxItems: 16
>>   
>>     clock-names:
>>       minItems: 1
>> -    maxItems: 10
>> +    maxItems: 16
>>   
>>     interrupts:
>>       minItems: 1
>> -    maxItems: 4
>> +    maxItems: 6
>>       description: LPAIF DMA buffer interrupt
>>   
>>     interrupt-names:
>>       minItems: 1
>> -    maxItems: 4
>> +    maxItems: 6
>>   
>>     qcom,adsp:
>>       $ref: /schemas/types.yaml#/definitions/phandle
>> @@ -59,6 +60,8 @@ properties:
>>       maxItems: 3
>>       description: Phandle to apps_smmu node with sid mask
>>   
>> +  dma-coherent: true
>> +
>>     power-domains:
>>       maxItems: 1
>>   
>> @@ -241,6 +244,65 @@ allOf:
>>           - iommus
>>           - power-domains
>>   
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,sm8650-lpass-cpu
>> +
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 16
>> +          maxItems: 16
> 
> [Severity: Low]
> Should this binding be split into separate schema files (sharing common DAI
> definitions via a common schema ref if needed) instead of adding another
> large per-compatible if-then block to qcom,lpass-cpu.yaml?
> 
> Each SoC variant here has substantially different reg, clock, and interrupt
> counts and names.  Fitting qcom,sm8650-lpass-cpu into the same schema also
> widens the top-level maxItems limits and enables dma-coherent at the top
> level, which relaxes validation for older compatibles like qcom,lpass-cpu
> and qcom,apq8016-lpass-cpu whose if-then blocks only constrain clocks and
> clock-names.
> 

Will follow maintainers preference here
