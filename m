Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1ECF2E8E08
	for <linux-sound@vger.kernel.org>; Thu,  9 Oct 2025 14:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760018612; cv=none; b=A3vUSTPu3sbYDPmnY8na6cnUJy0ganRvJQxjv8Q5uBuNc8kpul1kdaSTzFOXZkoasD5rVJbtVG6/H5gWCFrGI7rtNLG0OIqBVS1tArS30ZGX4Y3gT5HuTqV5g34YWRGnTbnM8rkPULw5ptU+utNFVeZ1gNPYpGlOs1xP6E4kwL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760018612; c=relaxed/simple;
	bh=jIACOyzuC8X0aT/3uWywgCTxnVramD7znqMR2Du233Y=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=bP+osvp/oJ/7dKK5dp3ThHGnvK4fAUwM66D4o76lu+9c4Y99GR+fiDiEKAgDLk/XIm033kLRtQRdplXAT9tt/W2GtSn+q2ee/FoucLw6U85w6JLuqNKoyLvNDCTMecKNGBdEEEVSmZ8QxH2S7H6bIQCo6zlujqPsAY+vCCmZpjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GoMijZxC; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GoMijZxC"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-46e504975dbso6395075e9.1
        for <linux-sound@vger.kernel.org>; Thu, 09 Oct 2025 07:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760018609; x=1760623409; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ick/ehpBisbwmGXZKKBR8+25U5AyvHRCstQa+Wcmc8=;
        b=GoMijZxC7j3bC8XyvWYkQTadrxmlA24zoCfQBiPHgQwHbAQHh5Kjyw/u31apswsfNJ
         Plwj3wO9nx69blVg81EAjI9q8BO2z0h6eJEnL+y9fyloREBsQ6P48OTS/vgZr+VWKrt8
         NAUODrUSKKEjNAb1ACYAxJavdwk5I9knzNQZM8C+hvEa63VfmjXi42Qdh3pR3fDVU6S+
         sNa6gCVFhnBCSuqo0ZcJRl22xRv/JZaw83nSrdmVWTQKeKAr6KWh82eeNC66B7m/a3Dd
         iubDBTIrp2wCztkgk7SMwcmXjjyRnS99igbnIdTcMI2ai6BAxYKMcBNqDGwA1UFBRd6K
         +R3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760018609; x=1760623409;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6ick/ehpBisbwmGXZKKBR8+25U5AyvHRCstQa+Wcmc8=;
        b=Dt19RxPTgOLbSEfG7KVWJru4DTGHZKnP5TNKFocplwJeyJdNkLlrJbOqjz1fpdKQo6
         2y0cRSM826ztj2CsKTEMlIo9AXb9mymN1447CcMC9OmzWGSxNHpa25ER4lTTYeJ/Jw30
         5gphfI4o358JxDNBEZX0lcPN9tPQwPrvKwcANcbZOqeHYWAU5TrmNKIMrK6XtYB3+UYx
         Nkt0w3/Z3qUDc2P5ikVhVMkqfwXVuysYQqrKxRov+nBAOaw3FmJAikNfPdscnq8kY02/
         SIvyYtHiTS1QsL04v14O8R4kgAgTihJUfGcrBenTzVH8pkPNeb9WcNI2j2ui/nMeGv9B
         8zYw==
X-Gm-Message-State: AOJu0Yxn2OpXH6w1UBHVvJYaSAS5e/LWr+YPxfaqQ9rLLg+OSgLZ9Jxq
	TodbapIzu8PQeWhqiPZPi8lUOml6RCLAwvR6G1LkbHBDpsfNgzN4GSWKy4a5jtpLEqA=
X-Gm-Gg: ASbGncs33YRhTU/Hc4k780poXB++IUdkwLylK+xz4JbizIoTxKi8QPYHDwZjEDKLzXc
	6VNGSLFSr0JRY7C1Mc0ff38oLMBvM4WO6or9Am9Nu88EykmqiCcOXg/zQyVmSDuGEAzqGPt2J5A
	tyTaBi3huidXv3LAY2oB/EqedHNue8eE95p+d+107kXtuNJd6rVWi6ejE1276r6a0wrkBt761i2
	AhhuBtcg5ABhW75ltDgy0XfZHC97L/3cw8LkkaimKYHioBDIVSdCjx/Bvj4pVDskv0hSNj9gK8G
	3A+TwtcMgJIdT4C8jHlnLN8H0hwmWT8nqHSAXe+ne5I3EDI/NL4osFS26IaHlsJLlig7GKOG6xC
	6vnIPftEo2mtMGPrSsrbjp05nwqmoJbvtz6wOfIeFEjOaciFpy7E5Q1JjHhyUWm7eFLtdYFrTJC
	NDUi3xN0jO80E4wHPRtbrKuGFpx60=
X-Google-Smtp-Source: AGHT+IGivr9oE8gO06kQl7Up/pCh869X25XIBSN9Z2sjlK7nHplkbmEOxZNSH3sQ2PDnuNDmndVZkw==
X-Received: by 2002:a05:600c:46d1:b0:46e:36f8:1eb7 with SMTP id 5b1f17b1804b1-46fa9a98e73mr54759945e9.10.1760018608808;
        Thu, 09 Oct 2025 07:03:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:7a0c:da2f:6591:67ee? ([2a01:e0a:3d9:2080:7a0c:da2f:6591:67ee])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fab36ed3bsm40963255e9.0.2025.10.09.07.03.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 07:03:28 -0700 (PDT)
Message-ID: <3620feb6-12bf-48c1-b47a-ccb486e5b5de@linaro.org>
Date: Thu, 9 Oct 2025 16:03:27 +0200
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
In-Reply-To: <44606de8-3446-472f-aa6b-25ff8b76e0ec@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/9/25 15:36, Srinivas Kandagatla wrote:
> 
> 
> On 10/8/25 7:56 PM, Neil Armstrong wrote:
>> In order to describe the block and master clock of each I2S bus, add
>> the first 5 I2S busses clock entries.
>>
>> The names (primary, secondary, tertiarty, quaternary, quinary, senary)
>> uses the LPASS clock naming which were used for a long time on Qualcomm
>> LPASS firmware interfaces.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   .../devicetree/bindings/sound/qcom,sm8250.yaml      | 21 +++++++++++++++++++++
>>   1 file changed, 21 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>> index 8ac91625dce5ccba5c5f31748c36296b12fac1a6..d1420d138b7ed8152aa53769c4d495e1674275e6 100644
>> --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>> @@ -64,6 +64,27 @@ properties:
>>       $ref: /schemas/types.yaml#/definitions/string
>>       description: User visible long sound card name
>>   
>> +  clocks:
>> +    minItems: 2
>> +    maxItems: 12
>> +
>> +  clock-names:
>> +    minItems: 2
>> +    items:
>> +      # mclk is the I2S Master Clock, mi2s the I2S Bit Clock
>> +      - const: primary-mi2s
>> +      - const: primary-mclk
>> +      - const: secondary-mi2s
>> +      - const: secondary-mclk
>> +      - const: tertiary-mi2s
>> +      - const: tertiary-mclk
>> +      - const: quaternary-mi2s
>> +      - const: quaternary-mclk
>> +      - const: quinary-mi2s
>> +      - const: quinary-mclk
>> +      - const: senary-mi2s
>> +      - const: senary-mclk
>> +
> 
> I don't this is correct way to handling bitclk and mclks for I2S, these
> are normally handled as part of snd_soc_dai_set_sysclk() transparently
> without need of any device tree description.
> 
> Also doing this way is an issue as this is going to break existing Elite
> based platforms, and the device description should not change across
> these both audio firmwares.

This is only for AudioReach platforms, on those platforms the
clocks are registered in DT and are not accessible by the card.

Device description is obviously different for the AudioReach platforms.

Neil

> 
> thanks,
> Srini
> 
>>   patternProperties:
>>     ".*-dai-link$":
>>       description:
>>
> 

