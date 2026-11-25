Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596411;
	b=XHJZiBR40xaeCk6Rh8P4qkmOGauEjLSKiRdF++9ySfIp6MZTgL/EDjxw3jZmfPE0HYAj
	 xo2Bq/GlHb9jv8vVlbyG4bNgX1cdZrIKyPOXuhdBPJtaL/kSevrm8LQBVxZGb/G59MfYh
	 xeswyT+WWy/ctJgslmRW32BbH1I3YnLhIJnGmWGm76KPWu+1V/SX9e7xfKg/0ntUO4UtO
	 bJEjt8uF2b6x/aQJMj+TkBleZVfdpNKiNCLYenU0em059kUPZhysQOY3A46T4c4bAFd0E
	 3985qJxnpEolSyKcN5uo7qqbdLRwDc4R2MuPe24dapwu833SHD4NoAltpbPQ/5a6IOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596411;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:References:
	 Content-Language:Autocrypt:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=yxb7EQsbpqO3H4nS3rf4UMq78ALObXEsUz180cnLRB4=;
	b=diLBq2VAjW2x/PEEaJckBYoQ76TbmJHQ50VdO913wU85zN3shNYn4qFwwLAZLBrBCcj5
	 g9FJ68p8sEKlzi40wpeej2N838OniHToh9VA7ZeMSFhLD2lcJdk5Wum9d1hQZSud1fMx1
	 uRTo8Tfm1zltFolOIS3e8AGiWqBbYoxrmvmh5ivUD9qoQ7trp9joPQCzeq5ozxDON7sAB
	 Fjl7PDVNuNSmDEvJ/469e4kk1VlqbYO6W+2lgGFkC+kUHsiqAWx/JEIOmFA5+FMNy4J0m
	 JWdB56EgUvTNnF+IBifP3tvHr428xxEBZYYyZQBv4UXFDoZ84QFLUWYiL+kt8FDu2JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HCs5D4UO;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F73F606A31E
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 08:46:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F73F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HCs5D4UO
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-49412eb1474so3530174f8f.3
        for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 00:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795596409; x=1796201209; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yxb7EQsbpqO3H4nS3rf4UMq78ALObXEsUz180cnLRB4=;
        b=HCs5D4UOVsN4uCK96d0/ALHNfx2Pk7+hpvSCNVV9WsdTQ3nOTgOEMWWgKTw9OzyyMz
         fcQYdOS/BgNvF/Kf0u+letqyupQ8rlBfKqhJx7PFLo8/zBrMkgExNMH73IbnA+Tv7h/n
         GrEOPiDiWcfW+aJfHtmEsWiQRCjuix4HUHATexIT4/yhmVC308MIuPUHWht7bPiDB1SP
         mgawjwg8tINKEzk34JZ96qRjTK9m1ih8ruJ65p+DxalOUb78pVed0T+0/ubMHdanGCnW
         0G8bIj3gnhXF49t4qIguye79XvZ8qDt6B05CFUbw8FovjobdHHt9shr1uX8I7Pyzu4ZU
         CzKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596409; x=1796201209;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yxb7EQsbpqO3H4nS3rf4UMq78ALObXEsUz180cnLRB4=;
        b=VWSF4jTlXn0ZDhPF7bIlTdvniyaaE11R5EUCYmZu8CuBvV6hYsBmQpdUi+Qob8bSlI
         Akjc5jTI4vkJy4AOWk7kJ/ZakT4aZwV4wPyWMYwxbkyrgZjsPJNDrybYhQ41T1IC3ul+
         QsfGV72V2jWNhy0SyD7MRBK/iSZ7e0BW+wauabyiIUYnZdHXuZQPTV7lHMoursOVP0Pb
         2ACPwkwd8U4z1aMksZbvo+RLNUziANH3tCkIy0Y7hE1EQp8Ok1rMUPwjXqfCfWJM8a3o
         nRla9CmzFzwORUEV617xhI650Vg2g0BWnhpc3FUozXW0SrgoieFcZmjT9GM8Lv1iWW6x
         ptiw==
X-Gm-Message-State: APuU4Z/HkgJfCaBlnbzs9VWQ9F2KZJTz9JQkx0guQiJW3IZoNo0c1N5g
	ZFWaEv6gmPNbhx7pRPzDHfK8YYLWasPtPfdHeup3/E7TXHX4JCUHZVkWdZ9tDDzNdao8UQrB8Sv
	hGzsBdH1zMg==
X-Gm-Gg: AZFdTZdFUb5RDTqXOEkBDICnOBbwyjrlqlowu/gDJeCFQbSBElzdQZ3Ak1I80vPjDNN
	Ratl0grMVaxS7jfSTEPVns3MriziXkemy8cWvj+vtt0FDeF/aHsi5dQHeyQsCON/PiOBJZlXJ21
	vb6unEKy06DczukQztYZb8rgeseQb1XprRgcn+n/NrgkMGRsYgb7K3z6fnDSCHhfQ57OLzCS0my
	nPEZhqD3G/rGoFUrP0u1/8m9j7HFSfSgjiQi4KQZYhiaMLX7ZmsW5Ri93izP16Y2puTnv/abdZd
	jEgwhPVaLbBwsAsUzNZ8rw/SQGxxJBeMSXgS6yVKv0M0cexgaEzZ8v9MuVQCgfYlEW3pddgJvPT
	1c/Eg8O+rduR9oV/AyrPhe9eOyYVKzG5ngo4bWbKXFgZtS78pToonEAhcy2s9P0V6Fl2+RakWHG
	jFLbsT2NfFJ/v2BEKIKSI+P9d3ZLP/QF7BT0McLge0VMijxf6FvSNv0I9PyCmkaFt3CJIxXOTSo
	XBGqG146aDWI8SCgYyd3/+NziD+UF0RPdKrxlu/HqtEZVRoTWKW3VSp+5jWpBbBR+/jD5xCkPhk
	IME8bMg5eaN+viEvlHV+eiO3ysae4SUlUsQPhBgKsxyVpO4okUrZJfc6xO7w32ICWm8OmJDgKmd
	33pvowubM
X-Received: by 2002:a05:6000:2586:b0:4b7:760c:70db with SMTP id ffacd0b85a97d-4b7760c713cmr8367241f8f.4.1795596409091;
        Wed, 25 Nov 2026 00:46:49 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:f368:ae2e:e717:e970? ([2a01:e0a:106d:1080:f368:ae2e:e717:e970])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b3415763f7sm12637052f8f.9.2026.11.25.00.46.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 00:46:48 -0800 (PST)
Message-ID: <59b8701a-22b5-42e9-b94a-4ed3af6f346f@linaro.org>
Date: Wed, 25 Nov 2026 09:46:48 +0100
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 19/19] ASoC: qcom: sc8280xp: allow using the sc8280xp
 card with lpass-cpu
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261124-topic-sm8650-el2-v2-0-174e159f0f69@linaro.org>
 <20261124-topic-sm8650-el2-v2-19-174e159f0f69@linaro.org>
 <sashiko-outbox-231759@kernel.org>
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
In-Reply-To: <sashiko-outbox-231759@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/24/26 18:56, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] ASoC: qcom: sc8280xp: missing jack cleanup and link exit on
>    DSP Bypass links
> It also noticed 1 related pre-existing issue this patch does not
> introduce:
> - [High] ASoC: qcom: sc8280xp: missing WCD jack cleanup in
>    sc8280xp_snd_exit() [1]
> --
> 
> commit 30357a271c5bc6a19f163b41e5ab561af21084a8
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> ASoC: qcom: sc8280xp: allow using the sc8280xp card with lpass-cpu
> 
> This commit adds init and ops callbacks for DSP Bypass DAI links in the
> sc8280xp machine driver and attaches the WCD jack to LPASS CPU TX codec DMA
> DAIs in qcom_snd_wcd_jack_setup().
> 
>> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
>> index ac4dfb2c2182c..4fcccf7ec4965 100644
>> --- a/sound/soc/qcom/sc8280xp.c
>> +++ b/sound/soc/qcom/sc8280xp.c
> 
> [ ... ]
> 
>> @@ -377,6 +378,37 @@ static int nord_snd_init(struct snd_soc_pcm_runtime *rtd)
>>   	return 0;
>>   }
>>   
>> +static int sc8280xp_lpass_snd_init(struct snd_soc_pcm_runtime *rtd)
>> +{
>> +	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
>> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
>> +	struct snd_soc_card *card = rtd->card;
>> +
>> +	switch (cpu_dai->id) {
>> +	case LPASS_CDC_DMA_WSA_RX0:
>> +	case LPASS_CDC_DMA_WSA_RX1:
>> +		/*
>> +		 * Set limit of -3 dB on Digital Volume and 0 dB on PA Volume
>> +		 * to reduce the risk of speaker damage until we have active
>> +		 * speaker protection in place.
>> +		 */
>> +		snd_soc_limit_volume(card, "WSA_RX0 Digital Volume", 81);
>> +		snd_soc_limit_volume(card, "WSA_RX1 Digital Volume", 81);
>> +		snd_soc_limit_volume(card, "SpkrLeft PA Volume", 17);
>> +		snd_soc_limit_volume(card, "SpkrRight PA Volume", 17);
>> +		break;
>> +	case LPASS_DP_RX:
>> +		return qcom_snd_dp_jack_setup(rtd, &data->dp_jack[0], 0);
>> +	default:
>> +		break;
>> +	}
>> +
>> +	if (data->priv->wcd_jack)
>> +		return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
>> +
>> +	return 0;
>> +}
> 
> [Severity: High]
> This problem wasn't introduced by this patch, but sc8280xp_snd_exit() skips
> headset jack cleanup for WCD jack configurations [1].
> 
> Both sc8280xp_snd_init() and sc8280xp_lpass_snd_init() initialize data->jack
> and set data->jack_setup = true for WCD jack configurations, whereas
> sc8280xp_snd_exit() only calls qcom_snd_headset_jack_cleanup() and clears
> data->jack_setup when dai_data->jack_setup is SC8280XP_JACK_SETUP_CODEC:
> 
> sound/soc/qcom/sc8280xp.c:sc8280xp_snd_exit() {
> 	...
> 	dai_data = sc8280xp_get_dai_data(data->priv, cpu_dai->id);
> 	if (dai_data && dai_data->jack_setup == SC8280XP_JACK_SETUP_CODEC) {
> 		qcom_snd_headset_jack_cleanup(rtd);
> 		data->jack_setup = false;
> 	}
> }
> 
> When a card with a WCD jack unbinds, snd_card_free() frees data->jack.jack
> while codec components retain &data->jack and data->jack_setup remains true.
> On rebind, qcom_snd_headset_jack_init() skips creating a new jack and
> re-registers the dangling data->jack with the codec components, causing a
> use-after-free on the next headset jack event.

This will deserve a fix in a separate serie.

> 
> [ ... ]
> 
>> @@ -549,6 +633,10 @@ static void sc8280xp_add_be_ops(struct snd_soc_card *card)
>>   			link->exit = sc8280xp_snd_exit;
>>   			link->be_hw_params_fixup = sc8280xp_be_hw_params_fixup;
>>   			link->ops = &sc8280xp_be_ops;
>> +		} else if (!link->dynamic) {
>> +			/* DSP Bypass link, neither a DPCM frontend nor a backend */
>> +			link->init = sc8280xp_lpass_snd_init;
>> +			link->ops = &sc8280xp_lpass_ops;
>>   		}
>>   	}
>>   }
> 
> [Severity: Medium]
> Should DSP Bypass links also wire a link->exit callback to call
> qcom_snd_headset_jack_cleanup() and reset data->jack_setup = false?
> 
> Without an exit callback to pair with sc8280xp_lpass_snd_init(), unbinding and
> rebinding a component on a DSP Bypass card with data->priv->wcd_jack set leaves
> data->jack_setup true after snd_card_free() frees data->jack.jack, leading to
> a use-after-free in snd_soc_jack_report() when a jack event is reported.

The current code doesn't clean the jack on exit, this should be fixed globally
in a separate serie.

> 
> [1] https://sashiko.dev/#/bug/linux-70cecd60-74fd-40f1-95c8-8dc260e646ac
> 

