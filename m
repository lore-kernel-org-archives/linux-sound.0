Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yHpPwjCz"
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73C61AB
	for <linux-sound@vger.kernel.org>; Tue, 28 Nov 2023 01:18:23 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-332ff20ec45so1203803f8f.1
        for <linux-sound@vger.kernel.org>; Tue, 28 Nov 2023 01:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701163102; x=1701767902; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=alIZsk9jaoixi8xI6abFdPfSRb4k/VWokZ7yMhSkXhg=;
        b=yHpPwjCzDCWEKb+rR6oE5UsgulnQKI/orVCwkVByrga2JVlhqPSKyX37UjR4g4Mj3Z
         BcQW76tdcDUKAy3QJ9fHgIIXCJV9/qnXOgX3cbHvrc3xJnN214El9ZHA/cU22dPLvIdJ
         WyfWCyPEpoonOBpffx0ze6Vy0vqa7B7GtgwcZUGWL9PD1jHZeOH+GsHq7rZ4VlPaTtRO
         71LuX13PgixwxNQhLB1Irgm74rww80r8SPr9stSrT4ifthQ/op0ypmnEhbZerkq8zuUm
         w8/fayJQdedMvXR+EUX4hxzHkDtMw9QP3CQDsjorxnhwycDhl+ZSQBk1xJ+w95arcDak
         vZ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701163102; x=1701767902;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=alIZsk9jaoixi8xI6abFdPfSRb4k/VWokZ7yMhSkXhg=;
        b=KL641lrlXqZjFku4rIgeIsPrfsgevr1Wql/X9c+U/PA6E0NkOoTPkAyuAPqCWS+y6m
         lR9FkTMHlC1VHKxON8NXUPnE+ckwl5V4vU0wq3GdVywgR6eTsORmJTe8QTEJY4KOVf3n
         Weka5IvuUQ/t1yMR+fj0ASFH50uxNDTSi1Ng+WMz3OTPuKdVMO80ZOnEZeNVh1IcVLns
         hOmFqdCHMZAHkmxtmrQ4MH9aFP4vKxqNTNN3nC57i9r2aN3tJSrNPEy+E2Gwbt5yPQbH
         AcS1tnaKro3MjFI5eSHwsrpaHN6s+B6YNzLglUFRb4rp3ji4/FXC2XReDwTNYHsaL0CH
         H7UA==
X-Gm-Message-State: AOJu0YzG85MneYIdUiQZ7BnMdPosWoruZ7DxvyRec36FFYC1nFrD2Y7q
	jscO9LEdVJvEuPypihRotJs6ng==
X-Google-Smtp-Source: AGHT+IHkb5X1Xurk4Pn9b4ECw8tM2B+jV7V3FODalzw3NAPPM68Wjv1hOdA4wYyt9pnPEtXBgf5GyA==
X-Received: by 2002:adf:fe47:0:b0:332:ca1e:711c with SMTP id m7-20020adffe47000000b00332ca1e711cmr11805354wrs.21.1701163101912;
        Tue, 28 Nov 2023 01:18:21 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:eada:f40e:7ab3:2afe? ([2a01:e0a:982:cbb0:eada:f40e:7ab3:2afe])
        by smtp.gmail.com with ESMTPSA id d15-20020adff84f000000b00333097fc050sm1872064wrq.1.2023.11.28.01.18.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 01:18:21 -0800 (PST)
Message-ID: <df3da44d-3181-43a9-9552-ba7e41c05db8@linaro.org>
Date: Tue, 28 Nov 2023 10:18:20 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 5/5] ASoC: codecs: Add WCD939x Codec driver
Content-Language: en-US, fr
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231123-topic-sm8650-upstream-wcd939x-codec-v1-0-21d4ad9276de@linaro.org>
 <20231123-topic-sm8650-upstream-wcd939x-codec-v1-5-21d4ad9276de@linaro.org>
 <ZWB4myckLrpBYLm+@finisterre.sirena.org.uk>
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
In-Reply-To: <ZWB4myckLrpBYLm+@finisterre.sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 24/11/2023 11:19, Mark Brown wrote:
> On Thu, Nov 23, 2023 at 03:49:15PM +0100, Neil Armstrong wrote:
> 
>> +	if (wcd939x->variant == WCD9390) {
>> +		if (mode_val == CLS_H_HIFI || mode_val == CLS_AB_HIFI) {
>> +			dev_info(component->dev, "%s: Invalid HPH Mode, default to CLS_H_ULP\n",
>> +				 __func__);
>> +			mode_val = CLS_H_ULP;
>> +		}
>> +	}
>> +	if (mode_val == CLS_H_NORMAL) {
>> +		dev_info(component->dev, "%s: Invalid HPH Mode, default to class_AB\n",
>> +			 __func__);
>> +		mode_val = CLS_H_ULP;
>> +	}
> 
> This lets people spam the logs from userspace, why not just return an
> error?

Indeed, will switch to an error, seems safer

> 
>> +	if (hphr)
>> +		wcd939x->comp2_enable = value;
>> +	else
>> +		wcd939x->comp1_enable = value;
> 
> Are there really no constraints on the values for these things?

Nop, it's basically boolean, so any value > 0 is true.

> 
>> +static const struct snd_kcontrol_new wcd9390_snd_controls[] = {
>> +	SOC_ENUM_EXT("EAR PA GAIN", wcd939x_ear_pa_gain_enum,
>> +		     wcd939x_ear_pa_gain_get, wcd939x_ear_pa_gain_put),
> 
> Gains should be be named Volume.  Is there no TLV information?

Let me check that, I maybe forgot to add it.

> 
>> +static irqreturn_t wcd939x_wd_handle_irq(int irq, void *data)
>> +{
>> +	return IRQ_HANDLED;
>> +}
> 
> Why even request the interrupt if it's just going to be ignored?

Good question! I'll check this

Thanks,
Neil

