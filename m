Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339864962B
	for <linux-sound@vger.kernel.org>; Mon, 24 Jun 2024 09:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719220429; cv=none; b=QPkqUECHIrkigxxlk/9RyHersz7BcrWz7Sis2e6ny48wbffFpWXZNdwaUHXqFKRwZhuYAGLdbuLiZ419vQ9y+fwsW/Cin7KuLS2WrIo+Y29Apx8U3yf1rCZq82/nvqwBzu8EyM8SCZovFp0OedKV01yGXJ1VjYpP/DjWK/lR0Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719220429; c=relaxed/simple;
	bh=ufsRwuU40L7G2oCl+wF6UjtXIgQPePYuv6wBpl0bUqc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Bb2sPRpei2t1EpE0qWxW84mkPjq+GMb+wIeEKuxcYG1fIgN+iDYKimvH0uM08+nY52rHdvre+htV71wGyqiRKjS8lTn5njJvC3aYHfthM2tC027/bX1nYeN4GDgAMDX/BTCtqGVkIwAF1r2fFQbg3AcBZ6lx65ykqgzAau2x2lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IsnW0J61; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IsnW0J61"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52ce6c8db7bso844394e87.1
        for <linux-sound@vger.kernel.org>; Mon, 24 Jun 2024 02:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719220426; x=1719825226; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oOevBNkVhYIcr8pbBqOPvOA/lrQWJ845j8cyO+bYz2I=;
        b=IsnW0J61jOXPpxhS5v1RmBcI2yyj8KuicdybZWkY36lKshtzLLgZaDqa59J5cnGC5+
         JouRKW30Jkc71liSRvDBeYvjQ4OkS2LSI/rPtzTK+Rb0wC1NPzNHaQtX1r1AMxh5qQBB
         h2xlewYPWdbfcZoIdj8WqODLbLrHsqBJ4Dnvmwsx4zWYkfAb+lcUUkX18++2fba6WOm2
         FUH/EScnXfS45kreBoHH5M5RofmhCgwztIAlIW8yZHaPu5+qRRA7uDSZNhvr8/+5qTS2
         fQRI8cbB9NcWtc3Cv8vlmEE4mWg6nm9NQuQsqiq0XCiJef3873RmQGrHadQBIxP/lW0O
         t6Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719220426; x=1719825226;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oOevBNkVhYIcr8pbBqOPvOA/lrQWJ845j8cyO+bYz2I=;
        b=r5LvalEMaIW2n7HI0MtIRaVeiAlIdXvb/Or6ilS57RbShWZd2Ds75IEbnbdhj4//RA
         QVOU4UKpN+nSleLuv/ONDfWV13qaqlx//uvqbQLPKGiPZeO1dFmxoswKSp62rJuIdvoI
         uC5GONYOs0O5OGZN2IwVgUbgb5SCb6ZPjWUL8FEQ0LGVrEHfyU3w5dFNnZBGChVKaJmY
         4C6sx6SLgl7hqmUy/2GWIEGz3V1cWynq32E8MmyrSngGhQ9GnI3m8HVURmoDajyvqWH5
         2wj206Hr61r7Pk6dPVFluZcz1yCkTg7g3lZNzdgBj289r5+gtB8bLZKOuFsbQFDEXPvs
         wdrA==
X-Forwarded-Encrypted: i=1; AJvYcCVUm0cklFxUA0P9lcyDI46YwSDpNXzVajY/n4/iHh97Ly7vOHbwvgrm5g0QJkmtFRLbJj8Fd/DOJzT4lPbn/0WfB2dkXPSTjdxl0NU=
X-Gm-Message-State: AOJu0YylHRV08jAtYVWPI2kUtHw2b5Z7mnPQxRPMcCtGvApDqt30FPUJ
	1cspEgHts2mmgPWgl8+qXfFFVehbl5z1TMN1hBhavqh0fjdwVZCvvINnZeGdYLA=
X-Google-Smtp-Source: AGHT+IFT6E3/HxWZCXNTGcsaZvG14/jf6JozIKOheCtzxeEIMVBx7L3FWBo7hjcvHrXO1eRjGh6JeQ==
X-Received: by 2002:ac2:5633:0:b0:52c:d753:2829 with SMTP id 2adb3069b0e04-52ce1835212mr2238989e87.19.1719220425922;
        Mon, 24 Jun 2024 02:13:45 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:cf01:774b:55fd:ab74? ([2a01:e0a:982:cbb0:cf01:774b:55fd:ab74])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424817a8ec8sm127741265e9.11.2024.06.24.02.13.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 02:13:45 -0700 (PDT)
Message-ID: <5318f6e2-7bb2-4ed5-b0aa-585a6a2d8a5d@linaro.org>
Date: Mon, 24 Jun 2024 11:13:44 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] ASoC: dt-bindings: amlogic,gx-sound-card: drop minItems
 for audio-widgets
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240605-topic-amlogic-upstream-bindings-fixes-audio-widgets-v1-1-65bd7cc2e09b@linaro.org>
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
In-Reply-To: <20240605-topic-amlogic-upstream-bindings-fixes-audio-widgets-v1-1-65bd7cc2e09b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mark,

On 05/06/2024 11:40, Neil Armstrong wrote:
> Like "audio-routing" drop the minItems: 2 from the "audio-widgets", because
> any limit here - lower or upper- is rather meaningless.
> 
> This will also fix `dtbs_check` warnings like:
> sound: audio-widgets: ['Speaker', '7J4-14 LEFT', 'Speaker', '7J4-11 RIGHT'] is too long
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
> index d4277d342e69..0ecdaf7190e9 100644
> --- a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
> +++ b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
> @@ -23,7 +23,6 @@ properties:
>   
>     audio-widgets:
>       $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> -    minItems: 2
>       description: |-
>         A list off component DAPM widget. Each entry is a pair of strings,
>         the first being the widget type, the second being the widget name
> 
> ---
> base-commit: c3f38fa61af77b49866b006939479069cd451173
> change-id: 20240605-topic-amlogic-upstream-bindings-fixes-audio-widgets-00e1afcda10b
> 
> Best regards,

Gentle ping !

Thanks,
Neil
