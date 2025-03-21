Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E5B1F1936
	for <linux-sound@vger.kernel.org>; Fri, 21 Mar 2025 12:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742560542; cv=none; b=tEPB0IPMaxzS5HLDY3TsyYFLsVlJN/zZYIEeylNLb04l1yCJzu0IRAw5Ir4j5sEx8msyIGZIvXn5N1MrqZ+OXJ/1d7tsyMo+SllZNwIpTqaV/G6ZmaLjw5Qy+DONvGBcDbLFZFdj1qLRvtI728rh4LFmgvudqdipFIl1CY7lFMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742560542; c=relaxed/simple;
	bh=6PRbJ7TQ5aODdbz0m2PU+5RLlhJgh3PHA4Yj0p5qlTQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RCTHjBRjPRYlTthil19hLtAe0Zov45M0X3yVf1uu4i1gybMbHRbZ8WXyw5cexVvNdy626yZ5UqBqvkWOllQ4rnUTMqFWRkyCOUvxHuBcsm1QMyCa1H/KW3EUrzJOlac5gECgELVG9uI7cAs0F/gZ1ZCcgAnPeVlQWsL2QQEjsEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lj4NMOu3; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lj4NMOu3"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e5e34f4e89so3557935a12.1
        for <linux-sound@vger.kernel.org>; Fri, 21 Mar 2025 05:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742560538; x=1743165338; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yv4lZ+YNLUl7ot9RW8qDQsIhZ1LLB6J6i6RU1rh9WlA=;
        b=lj4NMOu3omf+TEDG3c+kA8Vh7ru45E0TBhNissTlAmVNDHnwS7x2W5VO8KdUj1xv5j
         Px7PET9GHb04dmviaQMirOp0Gm4aNeSewG2COqhrDJnxAdRrhHcaWUcFK4NHIEImTGfk
         4oGCuaSzSXvzHL39ELS/YQZjMTxLucQTxI0/nMJ0hcpKy61NayLUktIBPGT4gnN6mIJm
         q4tRRhOkk6DiFko66uUqbIULKbx51Qx+vFw9nUaU39EQ1EsRQ6QJlJQj2SkdHA0Vrlq2
         sSGBlMUtsvaT3b/upJ3UInahdE1N2SbMWOknlKzX/4WU60cldwZ8AQ/jEpjfvkR8xXpP
         ZA0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742560538; x=1743165338;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yv4lZ+YNLUl7ot9RW8qDQsIhZ1LLB6J6i6RU1rh9WlA=;
        b=pXdRn+VzrRcfTM/SiYhpjKCYCEJGEb+FovBh37C/WVbLJJKH3b/RNd8hlo40+T1uIg
         ZRS/niKYxq/UpgTQsj8MJM5Mavc7AloTXYvcoUxUx+GAlblm8uq5lpgBH5KiUOIPOhrc
         pVC7a8jik8UGky71vC6EPhlqIyB6O3J4sBqxY6oNNck8EiWDIWDxMcZpq3PFK9qkTv7c
         jtqA7Gm/aruXfMmOuMCBTcRDUEjuCkq+4x/euYLqS9+HAae318DPR9b2GAKpTdHUWgQE
         9Okmo+Z+OmUCLdNFjx8a3Jgm5t4QPyQV7ftRyIlfeugeXyqBlTTJqzJE1vH5oydnt6kV
         Gd2A==
X-Forwarded-Encrypted: i=1; AJvYcCWL9KIecooWiFTKod6cIVL8oCqhkkPqNDhcWKbUgoPn081pTKvZ3VsvLV2iMOYgTOFNVLURuHVY+ZrxqA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw57xxb0RK3aV2HxTiGUsv/5b8dPGLC326SPrGejgbMXL8xgM+o
	Hn/4JiRn1W2bUasLElb1rdH630B3NZrBXGK5jH9u5/O/SqyLWQcJtCGRTRXDj6E=
X-Gm-Gg: ASbGncvdNZD6ySYBC1zrYMm/Ru5n99tPh+dkGNIChEaIsKoQ5wk2JEzPPDhejcJ+Jub
	Yg/ef8rzjx3s+WjseNQIWau0XBfmoB6WIG4WsDeViJIq4j0mbBIVcW9Ar/1qOo2khO+29xWnQhB
	6YJpC8J0/pPCX8w8KF8XVHO6FKsQgl1DDPndi8o15k7cj+qCNDsVMey3x1UKYMIadYwNw/LuBOS
	9EOcIKa294HqRooYd/+gqyLbOlkVc7cdeSVk4DJBymDGli7gHb4E5m5MXhjjdWmXdrwIlvKSXcI
	HkDvJOzBlCJZhPj0VjbcuJ65qF4Xqm23W8vuHB3ytu81kJk75gtP2JhBaMSG5h+nO38u+Hjqmg=
	=
X-Google-Smtp-Source: AGHT+IG2h1yWDQQeNTqSEG97hM0WQIsywT10+rmqmILs3H3/8OMMRH7lWKNJLMtf+dIGR5DUR3nMqA==
X-Received: by 2002:a05:6402:51d4:b0:5e0:8c55:501 with SMTP id 4fb4d7f45d1cf-5ebcd41677amr2789203a12.7.1742560537711;
        Fri, 21 Mar 2025 05:35:37 -0700 (PDT)
Received: from [192.168.68.117] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5ebcd0c774esm1257920a12.59.2025.03.21.05.35.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 05:35:37 -0700 (PDT)
Message-ID: <b1aed195-b2e6-4f48-ba10-3049d74085a9@linaro.org>
Date: Fri, 21 Mar 2025 12:35:36 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] ASoC: codecs: wcd938x: add mux control support for
 hp audio mux
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: peda@axentia.se, broonie@kernel.org, andersson@kernel.org,
 krzk+dt@kernel.org, ivprusov@salutedevices.com, luca.ceresoli@bootlin.com,
 zhoubinbin@loongson.cn, paulha@opensource.cirrus.com, lgirdwood@gmail.com,
 robh@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
 perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, johan+linaro@kernel.org
References: <20250320115633.4248-1-srinivas.kandagatla@linaro.org>
 <20250320115633.4248-5-srinivas.kandagatla@linaro.org>
 <rdvsnxuc6by6sci56sh7thzpxo5cqi7q24fnmc7hi5yrfszwrg@kqjpiilko3xo>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <rdvsnxuc6by6sci56sh7thzpxo5cqi7q24fnmc7hi5yrfszwrg@kqjpiilko3xo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 20/03/2025 14:03, Dmitry Baryshkov wrote:
> On Thu, Mar 20, 2025 at 11:56:32AM +0000, srinivas.kandagatla@linaro.org wrote:
>> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>
>> On some platforms to minimise pop and click during switching between
>> CTIA and OMTP headset an additional HiFi mux is used. Most common
>> case is that this switch is switched on by default, but on some
>> platforms this needs a regulator enable.
>>
>> move to using mux control to enable both regulator and handle gpios,
>> deprecate the usage of gpio.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   sound/soc/codecs/Kconfig   |  2 ++
>>   sound/soc/codecs/wcd938x.c | 38 ++++++++++++++++++++++++++++++--------
>>   2 files changed, 32 insertions(+), 8 deletions(-)
>>
>> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
>> index ee35f3aa5521..b04076282c8b 100644
>> --- a/sound/soc/codecs/Kconfig
>> +++ b/sound/soc/codecs/Kconfig
>> @@ -2226,6 +2226,8 @@ config SND_SOC_WCD938X
>>   	tristate
>>   	depends on SOUNDWIRE || !SOUNDWIRE
>>   	select SND_SOC_WCD_CLASSH
>> +	select MULTIPLEXER
>> +	imply MUX_GPIO
> 
> Why? This is true for a particular platform, isn't it?

We want to move the codec to use gpio mux instead of using gpios directly

So this become codec specific, rather than platform.

> 
>>   
>>   config SND_SOC_WCD938X_SDW
>>   	tristate "WCD9380/WCD9385 Codec - SDW"
>> diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
>> index f2a4f3262bdb..b7a235eef6ba 100644
>> --- a/sound/soc/codecs/wcd938x.c
>> +++ b/sound/soc/codecs/wcd938x.c
>> @@ -19,6 +19,7 @@
>>   #include <linux/regmap.h>
>>   #include <sound/soc.h>
>>   #include <sound/soc-dapm.h>
>> +#include <linux/mux/consumer.h>
>>   #include <linux/regulator/consumer.h>
>>   
>>   #include "wcd-clsh-v2.h"
>> @@ -178,6 +179,8 @@ struct wcd938x_priv {
>>   	int variant;
>>   	int reset_gpio;
>>   	struct gpio_desc *us_euro_gpio;
>> +	struct mux_control *us_euro_mux;
>> +	u32 mux_state;
>>   	u32 micb1_mv;
>>   	u32 micb2_mv;
>>   	u32 micb3_mv;
>> @@ -3243,9 +3246,16 @@ static bool wcd938x_swap_gnd_mic(struct snd_soc_component *component, bool activ
>>   
>>   	wcd938x = snd_soc_component_get_drvdata(component);
>>   
>> -	value = gpiod_get_value(wcd938x->us_euro_gpio);
>> +	if (!wcd938x->us_euro_mux) {
>> +		value = gpiod_get_value(wcd938x->us_euro_gpio);
>>   
>> -	gpiod_set_value(wcd938x->us_euro_gpio, !value);
>> +		gpiod_set_value(wcd938x->us_euro_gpio, !value);
> 
> This looks like a separate topic, but why is 'active' being ignored?

We should be able to use it.. will fix it in next version for mux usecase.

--srini
> 
>> +	} else {
>> +		mux_control_deselect(wcd938x->us_euro_mux);
>> +		wcd938x->mux_state = !wcd938x->mux_state;
>> +		if (mux_control_select(wcd938x->us_euro_mux, wcd938x->mux_state))
> 
> Can't it just be 'mux_control_select(wcd938x->us_euro_mux, active)' ?
> 
>> +			dev_err(component->dev, "Unable to select us/euro mux state\n");
>> +	}
>>   
>>   	return true;
>>   }
> 
