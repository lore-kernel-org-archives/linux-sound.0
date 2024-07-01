Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AF113B597
	for <linux-sound@vger.kernel.org>; Mon,  1 Jul 2024 12:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719837250; cv=none; b=qgaI47qXKlzSYw/47BdAo/XyRzcTSG7QtjchY8C2rB3qKqd2HIkvLPPmsov8HfIDc6d73b7/g0A79VSEZnxm9VY2KFuZ/1S0LLZYhZqX+j5EqS2npYyBZTqsyye+dMx3NWYknOK3gcw3tQXoFdYLIMfQfJsnpR63xZw46y2DrhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719837250; c=relaxed/simple;
	bh=kt7z8+rEOdJwKmgSycNoh2R+LGoo0w5oUmgkQgFW4P8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=AKpoT3UWPrT3d1PMGV0bq15shbDesAh/VEZn83KhReU29UzzQdvWa6U5EimXItb2vYvlSTUQlj9+gAg2NCHcc4zUFp7EQ1NdQ06TMiv8PQH61WtY7hJMxbRJAZdwWRIMHmjbPGcXnOzyjPh8E/P2+FGXPJ5GfzO/SnvxaeQkduI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UpqgutNQ; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UpqgutNQ"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-35f06861ae6so1797167f8f.2
        for <linux-sound@vger.kernel.org>; Mon, 01 Jul 2024 05:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719837247; x=1720442047; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a287NlBt1es5eAg2uwHXF+qjhDTjmaYvEUEHcHWzfuk=;
        b=UpqgutNQeO5Q92x3IGAiM/ML8pUfh+d+oqKLPE8yHV+7loyKqmaD8eW+vmmgT01ykE
         PuRi0s79VL/OuG5MELoaCcdCcMZnvoYI6QNluPh95J6chBZToSgE1BnjuSEU9SQWpLES
         gg9PN378ZivNxJCDr9VW/aqGvvKrqkSAgurU6YkT5qCwm+3o/h8WGd9nM3cK5SzY0Wzp
         xfvE3lQe91h+iSs069cvzADUJACSpOvYUUR30rSW2LqyEf+qlzvUZ8gE5qA1L6sgmxND
         hfFYF8TgoqrJANQkv8uWlDJc1ZXisAH7jQY9qY0LdX4+72ZV4QLbxi0tIXXGtIiP0QY3
         RAww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719837247; x=1720442047;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=a287NlBt1es5eAg2uwHXF+qjhDTjmaYvEUEHcHWzfuk=;
        b=B8EYuFDv9mZuyCB0hdszakdXk8J8dg13gnMMSDh7+mlynN+AEZCM4gxyuj0XIrTby5
         H3EcYXXhOoajuXNI3ACRR9lxlbLs/iqMRCsaYyyRN2r85TJ2IwCVBVUC/yiMfmdJIr6e
         Cn+QuJCwK7IuBoG1VIyXB2jHFdQlDymZ4rrablFIgBLJXh1ONkJwkv34Sm6zMdZoOj1K
         NWHsbB3BzU/9kB95Vh2X3LiAlU7xCuJWh6ORxrGzX2WtJBo7sSmUmiyziWJFd+Ka5Ugn
         vAUlFiSzEi00UP4cq/z70e4aRU8luE7505Hal/UBIwg8oTzxv+HSFHbSyXb5kW+0NPgb
         4org==
X-Forwarded-Encrypted: i=1; AJvYcCVWQoyobOaU27zj6C4YPot+0gUvqKQWbzwmL11KWxTQFUOhFSbu6PhGKal4Swujb0+JfeN7gnyb6Kvd5N1e89dp2cnJmBQfcFPmuj8=
X-Gm-Message-State: AOJu0YwIha3+nxPWUK1N+h6KJYL6/k33trODl7vm+IUBIlTvMwwCLJRJ
	wBsBEe+RtZufMybDPE9kSeY/zAYXkAdeEVrhhPsWE8+GwmY4QMa2GY56WCuT6S0=
X-Google-Smtp-Source: AGHT+IFquMweWu7uygXTunNKJ/3190b7nlrlnjvn4mIs9Yb0+U9p0r5GPfWyirnYIWqlNKr3yAsNKA==
X-Received: by 2002:a05:6000:1fa8:b0:366:e9b8:784f with SMTP id ffacd0b85a97d-367756c6fabmr3539122f8f.32.1719837246509;
        Mon, 01 Jul 2024 05:34:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ffea:206f:fd2e:ac5c? ([2a01:e0a:982:cbb0:ffea:206f:fd2e:ac5c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0cd4f4sm9983016f8f.13.2024.07.01.05.34.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 05:34:05 -0700 (PDT)
Message-ID: <34b3617f-3663-40c8-a738-237dd4bd6c54@linaro.org>
Date: Mon, 1 Jul 2024 14:34:05 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] ASoC: codecs: wcd939x: Fix typec mux and switch leak
 during device removal
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20240701122616.414158-1-krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <20240701122616.414158-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/07/2024 14:26, Krzysztof Kozlowski wrote:
> Driver does not unregister typec structures (typec_mux_dev and
> typec_switch_desc) during removal leading to leaks.  Fix this by moving
> typec registering parts to separate function and using devm interface to
> release them.  This also makes code a bit simpler:
>   - Smaller probe() function with less error paths and no #ifdefs,
>   - No need to store typec_mux_dev and typec_switch_desc in driver state
>     container structure.
> 
> Cc: <stable@vger.kernel.org>
> Fixes: 10f514bd172a ("ASoC: codecs: Add WCD939x Codec driver")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Not tested on hardware.
> ---
>   sound/soc/codecs/wcd939x.c | 113 ++++++++++++++++++++++---------------
>   1 file changed, 66 insertions(+), 47 deletions(-)
> 

<snip>

Looks good!


Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

