Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Feb9gHUn"
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7740AD56
	for <linux-sound@vger.kernel.org>; Tue, 28 Nov 2023 01:14:32 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-332e3664665so3127648f8f.0
        for <linux-sound@vger.kernel.org>; Tue, 28 Nov 2023 01:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701162871; x=1701767671; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Kjtii/FN0kaVr+RySKyiRhJOaMJhIbqBNo40CkvcnQ=;
        b=Feb9gHUnxF5TWgegOkqpzm7vTG611/aHD6XL5WWKMVxJOZRkAZL3Ja99GmKpGyahHO
         fPG0WhLmeCc91jECktBjGkTiNRvwdTU2ztOF59Q+eabZ2+6yYddP8REfcRGZ4fpCb2bX
         KXv/V1X5Akq1yorHZG+MBukLRQHZ5ZRUPxzB1I+CpFN6Z5UaIMHqlE82Z97EsjYHxXx+
         wFarlUq42OC8J1K82YOMI6M9bbnyZZVYKOOQI3emB/k0z5PoyiQNe4WD5SzrQoAkrKcW
         Y3m8RH0q5YUu1YPWbTnoeDzvF1kH5RJ1lEguv0MFkCjMw6HQ7H29zDI9hsDOchfJBASr
         5fpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701162871; x=1701767671;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2Kjtii/FN0kaVr+RySKyiRhJOaMJhIbqBNo40CkvcnQ=;
        b=V2/9KVN+Qkr1lHZEBuXDWQ50f+IlRS913n7Yc8aAydkAboZdcGD7Y3XpT2kaBAOzZ3
         pxv4db3iewCQg9l6BvsyI66TKeZ/hsCmY0WiDxnkWxR7xE3fYPJh8ciGuaznRTLY8SB0
         PKWKBIrS8r6EcLlNj+IxL4JGAqmT7hu10SoaHpwuBt+uIH4IFx0RJdroZ91udFRFzPLX
         yXCtnNshVQPNhPRuKoZH6Yuq6xDmN7rHG7/mWLFx8qwzg6xurBayXKrVxajWBAxiFmyx
         EVWuRsvue1N2qxcCZXNPmtwqZC6yTvv7rnOfozkFKDbPL+nNtcd+KCHl1A/uS/83gpfr
         Bytg==
X-Gm-Message-State: AOJu0YwdrHq9Ak+XXCe9Hpqw6cGNk8cOxtX3pXZ2s+Pq5X1DxOJLiGsZ
	iuMhmufWKLBFZw0aZx2wACw3EA==
X-Google-Smtp-Source: AGHT+IEQUMczIYX8hA+zLKx022wQyd14G8CqIVm0T/Hdr+d/ZVMnwjy4MFWloEOBHn7FeV7wpwnPnA==
X-Received: by 2002:a5d:49d1:0:b0:32d:9d99:d0a5 with SMTP id t17-20020a5d49d1000000b0032d9d99d0a5mr9526680wrs.5.1701162870857;
        Tue, 28 Nov 2023 01:14:30 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:eada:f40e:7ab3:2afe? ([2a01:e0a:982:cbb0:eada:f40e:7ab3:2afe])
        by smtp.gmail.com with ESMTPSA id l15-20020a5d560f000000b00332f8f4960fsm7891464wrv.0.2023.11.28.01.14.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 01:14:30 -0800 (PST)
Message-ID: <752f5347-703a-4b38-b2b1-3493d270389c@linaro.org>
Date: Tue, 28 Nov 2023 10:14:29 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/5] ASoC: dt-bindings: document WCD939x Audio Codec
Content-Language: en-US, fr
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231123-topic-sm8650-upstream-wcd939x-codec-v1-0-21d4ad9276de@linaro.org>
 <20231123-topic-sm8650-upstream-wcd939x-codec-v1-2-21d4ad9276de@linaro.org>
 <160fc6c4-b07d-49c5-976b-aa0fa35e4f0f@linaro.org>
 <b637c287-93e5-4214-9275-80fac3c6181b@linaro.org>
 <60c9ba5d-a2b8-43cd-8b8d-2c709b8e5d04@linaro.org>
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
Organization: Linaro Developer Services
In-Reply-To: <60c9ba5d-a2b8-43cd-8b8d-2c709b8e5d04@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/11/2023 10:04, Krzysztof Kozlowski wrote:
> On 28/11/2023 09:59, Neil Armstrong wrote:
>> On 24/11/2023 09:33, Krzysztof Kozlowski wrote:
>>> On 23/11/2023 15:49, Neil Armstrong wrote:
>>>
>>>> +  Qualcomm WCD9390/WCD9395 Codec is a standalone Hi-Fi audio codec IC.
>>>> +  It has RX and TX Soundwire slave devices.
>>>> +  The WCD9390/WCD9395 IC has a functionally separate USB-C Mux subsystem
>>>> +  accessible over an I2C interface.
>>>> +  The Audio Headphone and Microphone data path between the Codec and the USB-C Mux
>>>> +  subsystems are external to the IC, thus requiring DT port-endpoint graph description
>>>> +  to handle USB-C altmode & orientation switching for Audio Accessory Mode.
>>>> +
>>>> +allOf:
>>>> +  - $ref: dai-common.yaml#
>>>> +  - $ref: qcom,wcd93xx-common.yaml#
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    enum:
>>>> +      - qcom,wcd9390-codec
>>>> +      - qcom,wcd9395-codec
>>>
>>> 9395 should be compatible with 9390, so please express it with a list
>>> using fallback. I know that earlier wcd93xx do not follow that concept,
>>> but maybe we will fix them some point as well.
>>
>> I don't get why this would be needed, yes their are compatible but still
>> two separate ICs with different internal capabilities.
>>
>> It the first time I get such request for new documentation
> 
> Maybe it is first time for you, but I ask about this all the time. What
> is important is whether the programming model or how the OS uses the
> device is the same.

I agree for new version of HW, anyway..

> 
> Here the device exposes its version in registers, so you can easily rely
> on the compatibility. That's also the case multiple times talked on the
> mailing lists.

... you're right here version can be determined at runtime.

But, since both are compatible, there's no primary part number, right?

so why use "qcom,wcd9395-codec", "qcom,wcd9390-codec"
when "qcom,wcd9390-codec", "qcom,wcd9395-codec" should
also be valid, so in this can why not use :
"qcom,wcd9390-codec", "qcom,wcd939x-codec"
or
"qcom,wcd9395-codec", "qcom,wcd939x-codec"

?

> 
> Best regards,
> Krzysztof
> 

