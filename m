Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E14242901
	for <linux-sound@vger.kernel.org>; Thu,  3 Apr 2025 12:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743682802; cv=none; b=ixUhTqsG71gNZB9T4z6i9bKPPmVQ54LWJH1S16FitJra/+4uqIFiyQNOJ2wqvl8IgEAjpZJoxj55A16jQKfAVSPaEDM79bgobfx0Kl/aiCUNqabUhoiOKyKtXpk79VB82GXF2mDS6T+34Ox7SmLkOK3vu69miX/Wlvg9SxwGqGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743682802; c=relaxed/simple;
	bh=NaAZ4b2SEwl0UDAk3zyED6YV3zE+9mKyjBO0BPkluHM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XoXHOMRe0ApBckhSKiiGRwGwIeU+RsXmbm+EfxAlJUr12DZTpRX6tOwNV1B4Y7KV3nQx4YDfUicq4URYZ72U1zh/Dt9CDU7VXUWoSXLm/DLNtgfha4Kp7lIDr6U1L1t1wNQWuGl3G1OYpfHg8hyx1ekcmzTIpxkl+KvxuMs0TaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gIy51LpP; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gIy51LpP"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so7908775e9.2
        for <linux-sound@vger.kernel.org>; Thu, 03 Apr 2025 05:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743682799; x=1744287599; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Do7g5ZIFeFFdRvHgyZdqL62w5VJxx0jLniscRb1wlqg=;
        b=gIy51LpPKVP+MTrTt0usZrWlF50YaUlux1rK2OWyLbyKeNavbvrSLDRJgt+jBki0/B
         Zw/lQO6lDOsZ07skNj9GiT4+uOGNbL6aYpCOE1D8ls1zwte53LC0//I0+zPbb7MeI5SQ
         vNuN+Dy2MlcEqnNEJwevfeGQkSJJqfL+HAI7v6xx8MkitSyP26jwKqF1/aI2zwiY5wWV
         bOxzm7tDzhg+UpwxKhhrfMzDjij5dTgDpBKOEzGqCwcTqt63bhjFHb8vaJCVDVyi4DOu
         KEhue9jmeauAFDVVyJ2YpoyD+aae3bkgK6PoStxR8sa17odD4BBnHYBbvQFCo9+wE089
         dZXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743682799; x=1744287599;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Do7g5ZIFeFFdRvHgyZdqL62w5VJxx0jLniscRb1wlqg=;
        b=mElY4y3/YT6OgFgSasrHqbAqa2XV3iE5U82t3IHu+/peIF0YTr5RajmLAOpf9wIdc9
         PE0txNSN0dgZq8tAWrUL6ZhqjkPldl/ba3/D+E9/zznL2WeWUWa6aR67e1kXVYGlsR4O
         lX9YcJX8nc28/DN0g6k5fceeDRp+eVQ8gJJJc8IdISr/fUTMNsOX3Y6VtDoyyA6wD/4r
         +Pt9oCFOPl4t5cc+UFhvUtSQPSacRensfE/CXKkdQVrsC9TcJeGSJDVCn/kq/RgFIWYj
         dS5ZTAeKnPA7RgxKk3eq86Mwk6xpnBQdkzq5onlAklQPggaKEiPZ7+OMuRXiWsc+mzLd
         1bhg==
X-Forwarded-Encrypted: i=1; AJvYcCWF5LAa+esvW5CyECoLB0HXz/gOnxbRGOxmkRRAh0MCwEYvvGv2OqzY8r67kpIy3uFKjn0JdqHXicYHGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywkt9hB15Qvp5XRu8WQtCIiqub3DAHDfyFmzoQIvhr75pU7IPNX
	iYDgwZo0OuA/2nbLnp3cfq39YEWUiVTMaL02ieBKHAFFAcvcIpsRaY/5iDp9tuM=
X-Gm-Gg: ASbGncusxmhSyfar5O6xfXfoj7yFhCNXT/qn5LredWuST5zZcdLM6t5v0V+MGcQVKPT
	FZGxYf3KkfoRVvHwsncmUlocUoNOGPPoD8oVFWDVJVcxSh1diSCU/Bb6wGGq1KQ03Nm7porjrCN
	XrPXSxg3Mjy4AuPLuvfozJY8shlehBKUlOv5RkYls9/bDGOJPdu7MxivvaVtH9VkUApSRZZNdtU
	jJ2ZweKmv8YPDkYjueU7j2DUfvwpMAv759XP2PD3cLFvJLH3DuHXloivWhV358BWLdAGAGpCLjJ
	IvbB53DVrTOQtCv8nj0N7mB3r0oKrtjnKavo70BKO4dC893B/3+ZjtVzR9hQy7E=
X-Google-Smtp-Source: AGHT+IHYXVxVN/xLoKK1v9Nlhe06FvQtwGVbb6msfL6zmA7WaejsGqkzo/0fvzRlouUTsIjQ6pcmjA==
X-Received: by 2002:a05:600c:468c:b0:43d:83a:417d with SMTP id 5b1f17b1804b1-43db622a42emr214509885e9.12.1743682798706;
        Thu, 03 Apr 2025 05:19:58 -0700 (PDT)
Received: from [192.168.68.117] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43ec34be2ffsm16874945e9.22.2025.04.03.05.19.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 05:19:58 -0700 (PDT)
Message-ID: <8613cf45-d202-4577-868c-8caf771c7bc4@linaro.org>
Date: Thu, 3 Apr 2025 13:19:57 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/6] ASoC: codecs: wcd938x: add mux control support for
 hp audio mux
To: Johan Hovold <johan@kernel.org>
Cc: peda@axentia.se, broonie@kernel.org, andersson@kernel.org,
 krzk+dt@kernel.org, ivprusov@salutedevices.com, luca.ceresoli@bootlin.com,
 zhoubinbin@loongson.cn, paulha@opensource.cirrus.com, lgirdwood@gmail.com,
 robh@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
 perex@perex.cz, tiwai@suse.com, dmitry.baryshkov@oss.qualcomm.com,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 johan+linaro@kernel.org, Christopher Obbard <christopher.obbard@linaro.org>
References: <20250327100633.11530-1-srinivas.kandagatla@linaro.org>
 <20250327100633.11530-6-srinivas.kandagatla@linaro.org>
 <Z-z_ZAyVBK5ui50k@hovoldconsulting.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <Z-z_ZAyVBK5ui50k@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 02/04/2025 10:12, Johan Hovold wrote:
> On Thu, Mar 27, 2025 at 10:06:32AM +0000, Srinivas Kandagatla wrote:
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
>> Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
> 
>> @@ -3261,11 +3276,26 @@ static int wcd938x_populate_dt_data(struct wcd938x_priv *wcd938x, struct device
>>   		return dev_err_probe(dev, wcd938x->reset_gpio,
>>   				     "Failed to get reset gpio\n");
>>   
>> -	wcd938x->us_euro_gpio = devm_gpiod_get_optional(dev, "us-euro",
>> -						GPIOD_OUT_LOW);
>> -	if (IS_ERR(wcd938x->us_euro_gpio))
>> -		return dev_err_probe(dev, PTR_ERR(wcd938x->us_euro_gpio),
>> -				     "us-euro swap Control GPIO not found\n");
>> +	wcd938x->us_euro_mux = devm_mux_control_get(dev, NULL);
> 
Thanks Johan,
> Running with this patch on the CRD I noticed that this now prints an
> error as there is no optional mux (or gpio) defined:
> 
> 	wcd938x_codec audio-codec: /audio-codec: failed to get mux-control (0)

This is not from codec driver, mux control is throwing up this.

> 
> You need to suppress that error in mux_get() to allow for optional muxes
> to be looked up like this.
I have a plan for this,

I proposed some changes to mux api for exclusive apis at 
https://lkml.org/lkml/2025/3/26/955

This should also allow us to easily add an optional api, which I plan to 
do once i get some feedback on this patch.

--srini

> 
>> +	if (IS_ERR(wcd938x->us_euro_mux)) {
>> +		if (PTR_ERR(wcd938x->us_euro_mux) == -EPROBE_DEFER)
>> +			return -EPROBE_DEFER;
>> +
>> +		/* mux is optional and now fallback to using gpio */
>> +		wcd938x->us_euro_mux = NULL;
>> +		wcd938x->us_euro_gpio = devm_gpiod_get_optional(dev, "us-euro", GPIOD_OUT_LOW);
>> +		if (IS_ERR(wcd938x->us_euro_gpio))
>> +			return dev_err_probe(dev, PTR_ERR(wcd938x->us_euro_gpio),
>> +					     "us-euro swap Control GPIO not found\n");
>> +	} else {
>> +		ret = mux_control_try_select(wcd938x->us_euro_mux, wcd938x->mux_state);
>> +		if (ret) {
>> +			dev_err(dev, "Error (%d) Unable to select us/euro mux state\n", ret);
>> +			wcd938x->mux_setup_done = false;
>> +			return ret;
>> +		}
>> +		wcd938x->mux_setup_done = true;
>> +	}
> 
> Johan
