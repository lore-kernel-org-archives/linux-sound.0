Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B919227E95
	for <linux-sound@vger.kernel.org>; Tue,  7 Oct 2025 07:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759820575; cv=none; b=fd31fSYYndrUOXHfgSLJAnvhXHE4oGXFSEsse2Aaq63XWyRw04b5MC26JpvE2xaZEFVasB+ND9AMBxB4q7ig+0o8dlxpqN9PdSTj6TtdJjyzz66sEx4/CO4buZPfvaADn5wT6iNJMTByr2Xf3LZIoUQJB2oCW5zBt6f2RUEt2dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759820575; c=relaxed/simple;
	bh=VQt2nmURfiv22OOUeiqX8iNfEzqj2c7uxemMqI9UcU0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=C3ADR9ZrVe/bR4yY27b2GqDZ/FdXsjI5UP4+4lICH2qNMGtUoMoeqaYKK9npk2rItwZ/vhQgxKqa8KoqqcYd1eyt6rb0TfPSgPwiYETy53sLaRHHMH9tfpXo3/uOqnJ3id8YhySKZUesL/MUmWOInufAOFJ87BZ5p6kfdB7Rnjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VYEMfcjr; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VYEMfcjr"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-46e542196c7so38039345e9.0
        for <linux-sound@vger.kernel.org>; Tue, 07 Oct 2025 00:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759820571; x=1760425371; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Eu9SG7BZFTKEWgYnY27MGUVrVuv+Cxtn/DX2TywVQ7c=;
        b=VYEMfcjroRUsOmMVUh5KGcQOmpPftmDvpn0cniHeyKY19mdFVrUuVBL7Qvuqeu+ngt
         wuSw8V4V9Pk/0awrhwcve03T119soaLD+g+Lm+0xdJsIaZyJ2da//emVWYCGAXFuhc3m
         IKCqmBxq713Ffvzrl5tCFXD4KWNZj625+UDze0BTvO5T33xi3CL4bl5BzB0cJGIM9bXX
         Pxnrx8yEhMjlFz5wxCMesE2GaOTV/gHN6HrNHHH/n6AjNLw73h1sQHc0TjplR7AhhBX2
         0s4yrMqeaaPiNfNpbLwRLAza5vajr2AvByLexA64T6TnGdlhJpCcib/2QvapM+Y78aXg
         f5dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759820571; x=1760425371;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Eu9SG7BZFTKEWgYnY27MGUVrVuv+Cxtn/DX2TywVQ7c=;
        b=lxT3+2VvNnSiHR8ppr69Y0UfnaRySIh2MPpQbQ+J78QU9dQexxx22xP7zU2DqkW4kS
         LjSwMmCj3DEb6gGYD8IcsV0/HHR8tQFfD29vGA03/KcHdmk1Gj3vyPAJHuHq2e7cLPlP
         92ywl3QLSj51VCQ+ESu8BAQLOFF+CPwe4lLxtHxYlsUWWpURcM4/DejVatZokTHKxOsl
         aP1jXbw9dO/04kNraizEjaZdGnJkNy4peiMZNPRZUR/BU3mkPCnqJL5kFu3hWiyIHfC6
         AVhCty5Zqb0zcsf8H29f+4YqwOtA+g4Yho0bnCWPDN6zhNRQhvppmfn4IY/zsqaV36Gm
         lQ9w==
X-Forwarded-Encrypted: i=1; AJvYcCVD3I6DiGWFw58sZ3hi2h+zZMbXjspcNKeIiGaKtOXFllq0GHbXM9y26RiOOr96+lPJK+BltbJqKBvNhg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq4FdcbqyJc0/K2X5vk7pFX75SwD/StzbxOOUQF8+8Kl4iQdLs
	KLAvbCW57+BQxV1U9spP+74G4uNRC6wZbQAoRxukHg/HWcZ/7EuNmf5/4sBrEkCWLG4=
X-Gm-Gg: ASbGncvs4zaQTcqavJwdfzWAI5qnES8qnjiomvnjTUIkll+sr1UTUTaAn+y8s2Z/dvW
	ny7+/vyDRN+y90pPUX4taW6DKhB11u175uutlaspibKd+TkKO52VLtt4K4ypT3c6M1l0+bwfkLm
	LysampheLSYesbNzYZvhKRpHt51AJ67Nhbx+OXUMsDDtON/u4vt6yako2/PyI0AHqsJwT/hiiby
	3vGEIn9n8jewPBiJh9xkCo7/sVPPtCjQ5uO3UupFrWGu9sKq3+Ggxbnv1KnsOg/LLGMLoPw/QOh
	TB2P9Pqr4lA2sYCWeFZBwPdq3E8rNV0RfR4CydufrtrWB9hSOtYt39WuNK+s/URqLrMXFuYDQcq
	fAFTLaQ9KG2J5HWmPkKTS+lcGX0PW45GLGQp+JrY7ry8leDebO7ZnS1qvsaTYPr76PLjaYrtdwI
	ObROpOyJH5ObxVhzNImHxngBOB/JE=
X-Google-Smtp-Source: AGHT+IHu4c6+ptDhkN4aNfSg9CdsgG1+qNA6BXPpkqBLPR4xEgumTflTyMVuyYYTTO8lbW2LKQ7Lgg==
X-Received: by 2002:a05:600c:528d:b0:46e:6339:79c5 with SMTP id 5b1f17b1804b1-46fa298df05mr14854985e9.5.1759820571006;
        Tue, 07 Oct 2025 00:02:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:bd88:41d2:33ce:f74a? ([2a01:e0a:3d9:2080:bd88:41d2:33ce:f74a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8abe49sm24270805f8f.21.2025.10.07.00.02.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 00:02:50 -0700 (PDT)
Message-ID: <87ce48a0-488e-428f-99ab-a203dcde5b0e@linaro.org>
Date: Tue, 7 Oct 2025 09:02:48 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC 3/6] ASoC: soc: qcom: sc8280xp: add support for I2S
 clocks
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20251006-topic-sm8x50-next-hdk-i2s-v1-0-184b15a87e0a@linaro.org>
 <20251006-topic-sm8x50-next-hdk-i2s-v1-3-184b15a87e0a@linaro.org>
 <DDBPDACTUFEW.1VVHN1P0PC6YO@linaro.org>
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
In-Reply-To: <DDBPDACTUFEW.1VVHN1P0PC6YO@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/7/25 03:35, Alexey Klimov wrote:
> On Mon Oct 6, 2025 at 7:37 PM BST, Neil Armstrong wrote:
>> Add support for getting the I2S clocks used for the MI2S
>> interfaces, and enable/disable the clocks on the PCM
>> startup and shutdown card callbacks.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   sound/soc/qcom/sc8280xp.c | 104 +++++++++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 103 insertions(+), 1 deletion(-)
>>
>> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
>> index 78e327bc2f07767b1032f09af7f45b947e7eb67a..ad4ee5c6fab8994f18de572842f3dab6f4f5397e 100644
>> --- a/sound/soc/qcom/sc8280xp.c
>> +++ b/sound/soc/qcom/sc8280xp.c
>> @@ -4,6 +4,8 @@
>>   #include <dt-bindings/sound/qcom,q6afe.h>
>>   #include <linux/module.h>
>>   #include <linux/platform_device.h>
>> +#include <linux/clk.h>
>> +#include <linux/of_clk.h>
> 
> ^^

I'll fix that

> 
> [..]
> 
>>   static const struct snd_soc_ops sc8280xp_be_ops = {
>> -	.startup = qcom_snd_sdw_startup,
>> +	.startup = sc8280xp_snd_startup,
>>   	.shutdown = sc8280xp_snd_shutdown,
>>   	.hw_params = sc8280xp_snd_hw_params,
>>   	.hw_free = sc8280xp_snd_hw_free,
>> @@ -162,6 +222,44 @@ static void sc8280xp_add_be_ops(struct snd_soc_card *card)
>>   	}
>>   }
>>   
>> +static const char * const i2s_bus_names[I2S_MAX_CLKS] = {
>> +	"primary",
>> +	"secondary",
>> +	"tertiary",
>> +	"quaternary",
>> +	"quinary",
>> +};
>> +
>> +static int sc8280xp_get_i2c_clocks(struct platform_device *pdev,
>> +				   struct sc8280xp_snd_data *data)
>> +{
> 
> Could you please confirm that this should be _i2c_ clocks?

Damn, typo, it should obviously be i2s

Neil

> 
> [..]
> 
> Best regards,
> Alexey

