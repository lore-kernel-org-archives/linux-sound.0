Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18E0249EF
	for <linux-sound@vger.kernel.org>; Tue, 13 Feb 2024 10:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707820026; cv=none; b=oVsyjdhpaGDICT2l7f2g3X4pyN3cUbLkCeSj7sDkkOjPJhXd2CMBBGiaZYNZ5nOpeMmtYvFilPMXm/p3MaqTeuSxj9AirA3maFG85P+qGqmIsnnWN3xMXajgWu3R7flx0RMJvehXJWbVmEA0tyX5b1UU/30H4PGwCXwzoVoctpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707820026; c=relaxed/simple;
	bh=wLSgMc3bJnAeZo1CWOjEKBvGuJBI2cVzMzh2B5Q/wgQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=gCMoycG46Py6fIZyxplpjpdsx5QH6XE4VL30hiWbBIaFvOwYmE7YJfIxnCpSYJAQT9uuKri+58pCiMEePOlrQGkDmVnWZnKnx/gfGHaClh9Via0xssXnsRHXjHubNutvr10dEDXK8+jNEX1OfzB1j9dsOpARo8w34rXKQ1VZLIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sBEXaHcP; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sBEXaHcP"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2d107ae5288so5819281fa.3
        for <linux-sound@vger.kernel.org>; Tue, 13 Feb 2024 02:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707820022; x=1708424822; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4c3xyw/xCs2E5+LzzLXM5z0PjXuIuQUQWO5R/iXN6aQ=;
        b=sBEXaHcPhwB0+FzQ5yjHnwJndmJ28XeYw25Q+bbfEs6Lpn3S3rpuZlpa643OiFaev3
         zCBwBR3EELeuA2/Alwtl+gKofHi8Elkt3Q2asTWU3HMWKEbAMwjzcaqOFwjlfVkoIC5S
         pK1WyKwvVQy6ni6Hw/E/mbykE7iXAXnkkC+naneb19FAegWcXkaStOvjSk8A004sydAg
         AxwLDTiEMjzlDZ9lBDYF3aQe88x7Kp4Npc3R+uDXFZfGUEH2Txt+r6nJe+GYXwPXC7QE
         +HmfCV9Dro9XtTYNPLjb/r/cskw1j3cyyukgrMXMvFrDyqHf4G0qKEIQ9wCsXuMKQ34n
         cIPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707820022; x=1708424822;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4c3xyw/xCs2E5+LzzLXM5z0PjXuIuQUQWO5R/iXN6aQ=;
        b=IhVnpbvW7UbXpCe9sfWJncg7DSVX8LCe/oWx82wdOGJ5/FhEBDdDcdpLdVCwbK8aoN
         2LJBQ4V7THkrucGNDZ6wqxapFDIV2LtECKVMIZR5rtgm3oPdB0GkniT3n+GEVSl8VrNg
         I6cyfkb3eONK/1ZD2Z4kOTaGdVET8k3H8EJA4JsnfZ5imtgDs/c4Tlck80mKXD4yc51W
         PoCIKeFvlPJZzGN8cv+vRsyGkOiAg2ZqwXpOeMIpdoula6lTLnPjG+jb2nu+AYERUQef
         Jf52dQYzfqkC5IgX9XBSD4nENOvE2eKCnpACm8t/5ngtU2dWT0VCJXxCf09bjQx8Mnr5
         oHnA==
X-Gm-Message-State: AOJu0YzEoySvHx3cAk7Kczxgx+G+pZmRvAKtKo4bAkgb7jqKrNOTpno2
	+Z4mlJUyh8EgVlICY2e08tYqE4Oh89ogvedCnC59UniN1y3SXF7I1XSADaDTi0Y=
X-Google-Smtp-Source: AGHT+IHuKNJR46KDTZkQXgqrkgiw2kQoSC8gATB3UY9HLdsK/ekr2G7xO4uo5qQhmNWx/uV2t6T5aQ==
X-Received: by 2002:a05:651c:220c:b0:2d0:d40d:9697 with SMTP id y12-20020a05651c220c00b002d0d40d9697mr2842108ljq.22.1707820021744;
        Tue, 13 Feb 2024 02:27:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVzDhobkhGIrG9q3xJKC52MHcTtp+goBN6WnDQIxmINkGbfXWF5gOZT2IuchNi/rudcx9drENluvxSSxYwPBrVa/Yo0/AWzlRHPOakw/5Bf5hILiF2b9Zv4CqR2CsLOZAqLORBeLd3Zccmw7w2aPDZH7hkWyTGJG8MHPf8ydbI4giufHmVHFdOmR4RzrTqpop1Z++TKxRhTlM0zg0a+5f43yUWASsajh4ug7bha92YREyrHr/JUlHM3Qz3W6MP8PBahCI2WTKCTFU1l1JKrwvSB3tlJco1IEs8ucKtet8HGDQVzg4wzvMZjchnrfUzuHyi3J4r6CQczFl3cYqU2nifdn6niH13N0lo0KmR8NF8A8YJsU1LBWS+yHqAgF1J5MZIM/ZyKjt843pGPFBqcxh2TMF0eKQb4svjyWv3w8bx+I2QazSSvqgIOEFh2rEI5jlDFgM2P1tsnZcnMEXQH2pspXol4oBkMDhCWJHrk8VmIYOk1PDrV4ahV/WFejiGpYlE6zyEY70OAwpCogiEcvS8LlbEryzohGfQQtfKcxyeRlpFDM5pR7YyROzSzXVodK7JKIY5xscPk8IID+Yo2w3TzMGScXrsAC+8/+O8iv8DNbKLqGTg=
Received: from ?IPV6:2a01:e0a:982:cbb0:6dfb:5e62:c51f:304b? ([2a01:e0a:982:cbb0:6dfb:5e62:c51f:304b])
        by smtp.gmail.com with ESMTPSA id m10-20020adff38a000000b0033b0d2ba3a1sm9161150wro.63.2024.02.13.02.27.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 02:27:01 -0800 (PST)
Message-ID: <01bdaec0-c926-4dbb-884d-2215981299ab@linaro.org>
Date: Tue, 13 Feb 2024 11:26:59 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] ASoC: meson: add helpers for clk_disable_unprepare
To: Arnd Bergmann <arnd@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Jerome Brunet <jbrunet@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20240213101220.459641-1-arnd@kernel.org>
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
Organization: Linaro Developer Services
In-Reply-To: <20240213101220.459641-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/02/2024 11:11, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Casting between incompatible function types causes a warning with clang-16
> because it breaks control flow integrity (KCFI) rules:
> 
> sound/soc/meson/aiu.c:243:12: error: cast from 'void (*)(struct clk *)' to 'void (*)(void *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
>    243 |                                        (void(*)(void *))clk_disable_unprepare,
>        |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/linux/device.h:406:34: note: expanded from macro 'devm_add_action_or_reset'
>    406 |         __devm_add_action_or_reset(dev, action, data, #action)
>        |                                         ^~~~~~
> sound/soc/meson/t9015.c:274:4: error: cast from 'void (*)(struct clk *)' to 'void (*)(void *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
>    274 |                         (void(*)(void *))clk_disable_unprepare,
>        |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/linux/device.h:406:34: note: expanded from macro 'devm_add_action_or_reset'
>    406 |         __devm_add_action_or_reset(dev, action, data, #action)
>        |                                         ^~~~~~
> 
> These two meson drivers cast clk_disable_unprepare() into a different type
> in order to have it automatically called from the driver relase. Add
> trivial helpers to do the same using correct types.
> 
> Fixes: 33901f5b9b16 ("ASoC: meson: add t9015 internal DAC driver")
> Fixes: 6ae9ca9ce986 ("ASoC: meson: aiu: add i2s and spdif support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   sound/soc/meson/aiu.c   | 9 ++++++---
>   sound/soc/meson/t9015.c | 9 ++++++---
>   2 files changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
> index 7109b81cc3d0..211f360df284 100644
> --- a/sound/soc/meson/aiu.c
> +++ b/sound/soc/meson/aiu.c
> @@ -209,6 +209,11 @@ static const char * const aiu_spdif_ids[] = {
>   	[MCLK]	= "spdif_mclk_sel"
>   };
>   
> +static void aiu_clk_disable(void *clk)
> +{
> +	clk_disable_unprepare(clk);
> +}
> +
>   static int aiu_clk_get(struct device *dev)
>   {
>   	struct aiu *aiu = dev_get_drvdata(dev);
> @@ -239,9 +244,7 @@ static int aiu_clk_get(struct device *dev)
>   		return ret;
>   	}
>   
> -	ret = devm_add_action_or_reset(dev,
> -				       (void(*)(void *))clk_disable_unprepare,
> -				       aiu->pclk);
> +	ret = devm_add_action_or_reset(dev, aiu_clk_disable, aiu->pclk);
>   	if (ret)
>   		dev_err(dev, "failed to add reset action on pclk");
>   
> diff --git a/sound/soc/meson/t9015.c b/sound/soc/meson/t9015.c
> index 9c6b4dac6893..e0f9a603a5e9 100644
> --- a/sound/soc/meson/t9015.c
> +++ b/sound/soc/meson/t9015.c
> @@ -243,6 +243,11 @@ static const struct regmap_config t9015_regmap_config = {
>   	.max_register		= POWER_CFG,
>   };
>   
> +static void t9015_clk_disable(void *clk)
> +{
> +	clk_disable_unprepare(clk);
> +}
> +
>   static int t9015_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
> @@ -270,9 +275,7 @@ static int t9015_probe(struct platform_device *pdev)
>   		return ret;
>   	}
>   
> -	ret = devm_add_action_or_reset(dev,
> -			(void(*)(void *))clk_disable_unprepare,
> -			priv->pclk);
> +	ret = devm_add_action_or_reset(dev, t9015_clk_disable, priv->pclk);
>   	if (ret)
>   		return ret;
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
