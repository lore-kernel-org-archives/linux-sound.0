Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821FB2E92B2
	for <linux-sound@vger.kernel.org>; Thu,  9 Oct 2025 14:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760019945; cv=none; b=MV2K89jP4StMgPFFw9+3/+7nB5PuwXV+t3wlvyMszl/Vk3jSOfu1YIdkJ8+uySMmX1FIvrKiNtk3P5ravmrtfYrIjVSCYOXcAhxZam41b1kjMUfMYj4nUFZ8otRQlsovkH1vw35VRnDKbrxRm9png4StTFNrVCanuFoq9pKOSjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760019945; c=relaxed/simple;
	bh=MaJRnAFy1ncA6eMZY/T15zYs/ef0zF2VYEmtaIsfSTI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=IHAQBb/QDIFyedYAccNFkw0AvyEWfJKBnhIk9LgmdBKlzlOdfdhSkFqVkQwkoxK7zrq/REp5x4d2kvsc7AvR2Qf/oJHBaDRpeANi2nAquX4xjXbQx2MNvcszmZ0vjMnImczf/sKfpCnlGeB5n+D4UZ4nqNzjgaLMIhS5ruzcY7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GgjLfA4D; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GgjLfA4D"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-46e6a6a5e42so5352815e9.0
        for <linux-sound@vger.kernel.org>; Thu, 09 Oct 2025 07:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760019942; x=1760624742; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BptzwX/G3rtzdz+N5BUaxQeG70a/ubuAx0pM4UJNvLE=;
        b=GgjLfA4DTJcOiaPRzMY4NMJzrZHXlyjwTKzjLZKVPCSn1MbBYrGOBhezjbvWfZmufC
         9ahBkr5f9ZI7S856hPDg18dNvreTvAy8oNV8t5sJDzzI4Qad4BAu5KljcjyXrbRo9EoR
         oTKT5p5t4KJ5ky0WjCUCYT4jGeM0KdYkTJj9dcIQSz6BL0/Nk8MoeGkScVJ+XkofhGsp
         7yVCusmYnxSkyG5O7t78jhf2cDAjG5aoilRb1uU7V4UgYFEbCyS2Gth1M57O9ypr4xyo
         7B9JswRbc0OcexR6YREZO2QoYF2t7sREWGEvLA7M7FXD4/ynI4KAT3b7ylxM/9zYcZlK
         WswQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760019942; x=1760624742;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BptzwX/G3rtzdz+N5BUaxQeG70a/ubuAx0pM4UJNvLE=;
        b=GFwU8wnqjYg03J3Emf3/fOtfi5qpECXzfpz/NWVLavDTxsRO3moMVtLOUhhpzTel4F
         N7wYURqEnMO59zrdw4n4P5CcHe5jhOHOtFGGeRQ22SB3BmRd/B0detuYGLeiWsARlkyJ
         Gbyj5ANhAfRC4QasKW6ifYueQKAr3d2z4tTM0WuCNg9tIhPlYUyC3jhJ6PxzNUficMVa
         sNR2m+GEP/mNhdcBy8ug0GJLnT7Iqo4fEH053HJwQ8oFPhOMnwvm+wXE70h5GmJwqu+R
         ojzNrIeHE0XUu/TWEY5z1rXSfG4zbCioxBFt1LmxYe8eTsGA34HXc+w/eU0oa4IYJq+A
         miaw==
X-Gm-Message-State: AOJu0YybL8dVYLAqMYWqc5PULu0a1rTgNPNqK9+UP00CwzcjSLCBd8qS
	De6JLuKguXIAQB+3MQkXccqVbjSk/7MNXKKPILHDu/Mjiqn6DZK1g1HaS93ALKHYNG0=
X-Gm-Gg: ASbGncuRcPF+IUJMeqMfabriWadgU7RY0mhlVXgmebKYrOPpFK0SS3ZvhCgMWW1+Hkz
	8QDO7hoDBR8W32w71eEvKSA+zsfYBx2A/LKqMFwrImb14EbOpMmh8I1Ze9mz5Xygtk5/igt0Sjr
	rnC4P2yuFAZFkK9/e9YuTSaE4rMfMje/LmCGI/gcW6gjYOJSDZEuf0B1z1m10AfwM+eAm+R1m9J
	a7i2QQjaUfJ4F4/+eoV8zHn+H7XP8oG8UYu3GxQn6JYXkgrZztEq3X9MVX6JrkG6H5JJbRDx8tA
	Y14kvpqGPa5BpbeHLuMuEKlVaOukhUhWDpQLd6LEDJKOYHWmAldvy3xvq/bINL6kyJYveytmjzj
	RrCCFbd+x+adZIrzPoomu09bE34jpq3wa2B3rtVa3kV5qI0Q2tF5T6IGO4Yshf1/tlrbhkFJlIy
	99qTBbRuXC8mlin8tQ2iHMvNnTf6I=
X-Google-Smtp-Source: AGHT+IHe2JLlSfRzylV1UfRS2+ycvrdB9o6cDd1va7S0HyvWnvfu5gmTNjUam6/53yZOjArw3J9gNw==
X-Received: by 2002:a05:600c:8b41:b0:45d:d88b:cca with SMTP id 5b1f17b1804b1-46fa9a87fc6mr56814495e9.1.1760019941505;
        Thu, 09 Oct 2025 07:25:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:7a0c:da2f:6591:67ee? ([2a01:e0a:3d9:2080:7a0c:da2f:6591:67ee])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8f01a0sm34774628f8f.48.2025.10.09.07.25.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 07:25:41 -0700 (PDT)
Message-ID: <f27cad88-b1fd-41a3-bdb1-b07de3dea8a2@linaro.org>
Date: Thu, 9 Oct 2025 16:25:40 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC v2 2/6] ASoC: dt-bindings: qcom,sm8250: Add clocks
 properties for I2S
To: Srinivas Kandagatla <srini@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20251008-topic-sm8x50-next-hdk-i2s-v2-0-6b7d38d4ad5e@linaro.org>
 <20251008-topic-sm8x50-next-hdk-i2s-v2-2-6b7d38d4ad5e@linaro.org>
 <44606de8-3446-472f-aa6b-25ff8b76e0ec@kernel.org>
 <3620feb6-12bf-48c1-b47a-ccb486e5b5de@linaro.org>
 <c0b71974-65df-47ad-902b-45c2dbe66be0@kernel.org>
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
In-Reply-To: <c0b71974-65df-47ad-902b-45c2dbe66be0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/9/25 16:06, Srinivas Kandagatla wrote:
> 
> 
> On 10/9/25 3:03 PM, Neil Armstrong wrote:
>> On 10/9/25 15:36, Srinivas Kandagatla wrote:
>>>
>>>
>>> On 10/8/25 7:56 PM, Neil Armstrong wrote:
>>>> In order to describe the block and master clock of each I2S bus, add
>>>> the first 5 I2S busses clock entries.
>>>>
>>>> The names (primary, secondary, tertiarty, quaternary, quinary, senary)
>>>> uses the LPASS clock naming which were used for a long time on Qualcomm
>>>> LPASS firmware interfaces.
>>>>
>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>> ---
>>>>    .../devicetree/bindings/sound/qcom,sm8250.yaml      | 21 ++++++++++
>>>> +++++++++++
>>>>    1 file changed, 21 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>>>> b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>>>> index
>>>> 8ac91625dce5ccba5c5f31748c36296b12fac1a6..d1420d138b7ed8152aa53769c4d495e1674275e6 100644
>>>> --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>>>> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>>>> @@ -64,6 +64,27 @@ properties:
>>>>        $ref: /schemas/types.yaml#/definitions/string
>>>>        description: User visible long sound card name
>>>>    +  clocks:
>>>> +    minItems: 2
>>>> +    maxItems: 12
>>>> +
>>>> +  clock-names:
>>>> +    minItems: 2
>>>> +    items:
>>>> +      # mclk is the I2S Master Clock, mi2s the I2S Bit Clock
>>>> +      - const: primary-mi2s
>>>> +      - const: primary-mclk
>>>> +      - const: secondary-mi2s
>>>> +      - const: secondary-mclk
>>>> +      - const: tertiary-mi2s
>>>> +      - const: tertiary-mclk
>>>> +      - const: quaternary-mi2s
>>>> +      - const: quaternary-mclk
>>>> +      - const: quinary-mi2s
>>>> +      - const: quinary-mclk
>>>> +      - const: senary-mi2s
>>>> +      - const: senary-mclk
>>>> +
>>>
>>> I don't this is correct way to handling bitclk and mclks for I2S, these
>>> are normally handled as part of snd_soc_dai_set_sysclk() transparently
>>> without need of any device tree description.
>>>
>>> Also doing this way is an issue as this is going to break existing Elite
>>> based platforms, and the device description should not change across
>>> these both audio firmwares.
>>
>> This is only for AudioReach platforms, on those platforms the
>> clocks are registered in DT and are not accessible by the card.
>>
> Clocks will be acessable via snd_soc_dai_set_sysclk ->
> q6prm_set_lpass_clock once set_sysclk support is added to q6apm-lpass
> i2s dai ops.
> 
> 
>> Device description is obviously different for the AudioReach platforms.
> 
> Why should it be different, its same device.
> We have platforms that use both Elite and Audioreach.

I'm perfectly aware of that, it's the case for sc7280/qcm6490. And I agree
the card bindings is the same, but it doesn't mean the DSP elements are the
same and uses in the same manner.

So let's forget the bindings and forget those clocks entries, and imagine
I'll implement those _sys_sysclk calls like for the Elite platforms.
This means I'll bypass the clock framework by directly setting the PRM
clocks, this is clearly a layer violation.

Neil

> 
> --srini
>>
>> Neil
>>
>>>
>>> thanks,
>>> Srini
>>>
>>>>    patternProperties:
>>>>      ".*-dai-link$":
>>>>        description:
>>>>
>>>
>>
> 

