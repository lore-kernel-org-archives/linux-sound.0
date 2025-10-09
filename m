Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F23D246BA8
	for <linux-sound@vger.kernel.org>; Thu,  9 Oct 2025 11:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760010287; cv=none; b=Ompruo/Ua1BcKnFzY2PTqrU9OMpSTitEb6KlERCd1ql/VMtDg7Rc7xg64zjB0d+L2hDxhv5o2ksST5/i+T+PV+pQlnV8Xl+V1QD/V7EJbi5ZntB8jdb7clVNoSS9AJFGq4/OE/n02SoAqdEdt8NvzBWIsEx/QztJWtP6biM6gsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760010287; c=relaxed/simple;
	bh=W21u5vszlYb4JTqqHMu+ZKX+OcHuu7JT0mxeHlbgRIE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=CQc7TzzOGHHR7YBMQk/kAF7TSowUr/0SGdxL2tmKNXPDvSP+Xorf6OaPoP2fQtRSD2RIMnXXMCXzLp/ffIHaXdGht2fx/OS75uW3W7P1azWa7L9gGxg/w+1IciJlHC1WV4CQqovMIhZITh3vgSlupKVVsdZYKoC3GXddkjCMabI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ctS7VXd4; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ctS7VXd4"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3f0308469a4so566454f8f.0
        for <linux-sound@vger.kernel.org>; Thu, 09 Oct 2025 04:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760010284; x=1760615084; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mDIkEeJPpHqacANkuSx7d8jTnH0nLItVVRjRAKjBWWc=;
        b=ctS7VXd4ZUOrXstwnbE7PbZVYxVNwLTIqyVtIn4KbQaJd1GkCGgtQcPRopsUOCu6sf
         AUEr1QlThuGLKKBzrkVJaAECG0wa5zUxxr6yFolpBdmjGrzhWg94msT/rTB/iDP2w6PT
         uoKGiLQhkiFC0vlZMWrH8qyXJ7CTUSsfVj0CFPq3iVMqgBJVeK289PBQkEJitcqw220P
         H5cq/qFB6Q4hpo+Vbu6mEpSJzFCpoY+gokXfeX9c+diC1KGemRcux84E/wutuPzTK0+A
         X4NntEwktFrxmmxi2woTSHrQ35/d5vSwlyDwkKJrvUKwd/X42h2SJen4sUQFojdwDGPi
         MBtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760010284; x=1760615084;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mDIkEeJPpHqacANkuSx7d8jTnH0nLItVVRjRAKjBWWc=;
        b=gw81tDuSraAwngkz0U1F+cY6Gg3ppQ7+d/SBpZou+4hdX1VPETrTIvm8k+uf44Gk21
         g8FE5MFuzKKf6fb6pgPZY3ZE9jzzOPxO7PJeyx0vsaABqHd7EniG45wmXPwIja6eDZ6O
         g6FxJcP17wx4bb4CyKGCP2qjAtsz4AF8ka5QN8m9ZjMzBeQfWNc2HOd3GZJpPIlcM6En
         xgqD3jTbu5Wj3lLSZcLbQBupIVfagsKrZ9tjYpDOcpGRCLjf+db97FvEbBpzf2rrI6Mn
         hIIH8JCWS94U7fMtofgaCxtbA5LXyoD8KRzgTisq8mrkOuXx9nfYIBA64P4NI/xV2bRT
         H9Pw==
X-Gm-Message-State: AOJu0Yw361ykaAHoaWESGxWslTDUzV2cNIy/ThyiLPcBOhDbJlG53ocu
	AYEAIWYjnnbIh5Aerd29x64HYHYFTNfKjzazC9whMGMAyjRR1ZNY00oDG+wpGDicuKY=
X-Gm-Gg: ASbGncs/O6gm5rhC32kPHluOCH8o63jZwaH+dQa/0402Qe+18js9tefxApwQcfJe5uY
	vihlO8h5z8dOLl/4XopgmZr3tyKw432mCFsPuXMRiBlmH7VZioxHxVc5PI8nlAdDkEjHiuknW8K
	+lwvWESuriyh7JEpM5MRk0nKGDnAzGwqds9i9IvoBHKcr+jwGrz3VDAgMN4hgnio0KKvBlavH+q
	Lqqhu3XeGO+cN/4LkIkbhQGMwSrr90KU994nB6o6jyjdFTPZWqHwMg7YsFBF1plZ2i7/eQvOKkR
	3YgPUjkv0SSDTvsgc90BVBCSUMfgrxvhZkltm2+kgOcZ80u0npyhYYwuYXGuAMmSjLa4SnJE9k5
	2ahgxGG8oxKUsyp/q6aSEXTvjJF5Mygarb+O3KllICJTqB7SFwflFFWNYtE3n9HDO6osnad4tAw
	uoFA5pETus9PPtcw/y2Pi8cYWMnDG9dVTNWMnHQw==
X-Google-Smtp-Source: AGHT+IHQy+02c30CkzT7quTenPJvh8XFqbTYjEdBna1oZjlHAagSFvWrjY6TgWYAOPG36Theucq0Ag==
X-Received: by 2002:a05:6000:2283:b0:3f3:ba4:29d7 with SMTP id ffacd0b85a97d-4266e8db63cmr4232911f8f.43.1760010283555;
        Thu, 09 Oct 2025 04:44:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:7a0c:da2f:6591:67ee? ([2a01:e0a:3d9:2080:7a0c:da2f:6591:67ee])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fa9c0e35dsm82490225e9.8.2025.10.09.04.44.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 04:44:43 -0700 (PDT)
Message-ID: <60fc5816-e552-4407-bc85-7c1408b4118b@linaro.org>
Date: Thu, 9 Oct 2025 13:44:42 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC v2 3/6] ASoC: soc: qcom: sc8280xp: add support for I2S
 clocks
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20251008-topic-sm8x50-next-hdk-i2s-v2-0-6b7d38d4ad5e@linaro.org>
 <20251008-topic-sm8x50-next-hdk-i2s-v2-3-6b7d38d4ad5e@linaro.org>
 <DDDR31N2P498.3FYKHZRLUS54G@linaro.org>
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
In-Reply-To: <DDDR31N2P498.3FYKHZRLUS54G@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/9/25 13:21, Alexey Klimov wrote:
> On Wed Oct 8, 2025 at 7:56 PM BST, Neil Armstrong wrote:
>> Add support for getting the I2S clocks used for the MI2S
>> interfaces, and enable/disable the clocks on the PCM
>> startup and shutdown card callbacks.
>>
>> The rate can be easily calculated since the card forces 48Hz,
>> 2 channels at 16bit slot size.
> 
> 48 kHz?

Yeah obviously, I'll fix the commit log.

Neil

> 
> 48 Hz rate will result in too narrow analog range to reconstruct anything
> apart from beeps probably.
> 
> Best regards,
> Alexey

