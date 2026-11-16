Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794816111;
	b=daXBh6YoARAapjGppuZ3J2ymazIeZWtei49JVu5VZq01y1NUYqtZ4S2W3pXAwAFQDLdi
	 PTLyYRkaG8YLr4crDV6V4BNWt2veoB61KJHXevUhSc8jUkm4Ia/Y8Iar3Us9Q/DCFKSW5
	 Hy/EGW58phlUr9lsTIP3mlKBGeRx+smuldTCNE0OWA2H5J4OIPgLQTthBMwwQe2gEH+PS
	 FjlFR/75JXVh5YK2lC/Kk5KBrLV0ORexkMdRzEpRGahxlon21QnlBuvHeHtgtPi76fb/Z
	 cu96FQsVUuXGK0pFlXJ4EuhEJOr1ewu09BQy+YLB0C257Vmls511eaSIADwhfJM0HpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794816111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:References:
	 Content-Language:Autocrypt:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=gmlMhyIvZekkIo8rGz6gqK3nrauj87h21DSx+oPeX2o=;
	b=HURrfvT6z4kUnWR40DpNndEbgVvKapZvyQVZdwqmNcApyft2A9GD1455TJdEMscFO3X6
	 mxdO5hQn0azVJe/MNvXbgfPN6CI3/K3LXTItyBPbAInrYpbRQUnb36dhjQxl4Md4Imem1
	 3OfNcf5OZQo/sh4URkbq1HbwHx66zN0sB7TvXbQFVqoeQWbvQF8AnObq9iraR134Bguil
	 oKdAIw/V6SnCq0l/hZwDWe86WLcWmz/ZmXXIbvl7n+x8ppbFQY8CDOhclH6gjAjc1M4LP
	 6S9xs9Kd/WHuHIGpzpGszbktYtaU1bMml11dCB0+kuOQcczvcEmOCw8W3mvquCUMQ0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JOIkFkaK;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E4E606A330
	for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 08:01:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60E4E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JOIkFkaK
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so457954166b.2
        for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 00:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794816109; x=1795420909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gmlMhyIvZekkIo8rGz6gqK3nrauj87h21DSx+oPeX2o=;
        b=JOIkFkaKtGVEWHk8W0HBbsvSExYtwp/lsENBt8NXe4Y87YrqQIYmWOWYDuu36qumUm
         iv6XP8o2CqAPHE2sBROrnA8+5lUs0OVZe1gveUAS8cQHfVFDu1q9WNmHNrAnlfBuLnNs
         bDJvYgDh6veoVr4aiKuqTRjrPOlpEiDADx/DdQ1iA/y804SISLqXij9JzzE1GHqyDm0O
         QiJPP6l8nr83YZfdbZLE+4HG9U37CcJmLM4LKPih1PYiwFjUEQ19P4KlsJ+KoyKS1u60
         BayvtYPDHQlapSBUVkfuUob4uKeU2cSC0RZs135h1i+53Z6R1v0xBrfZitQveRYOv1N0
         lowA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794816109; x=1795420909;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gmlMhyIvZekkIo8rGz6gqK3nrauj87h21DSx+oPeX2o=;
        b=BBdbifKVzHQE6A+etzHun09Dbtpqwo9LOnjRf0zQXQ7hC036ry88yIFxN1KnE6MC7X
         uFyzGsXYD1fHuB3NGXVCg2PjjmScx4/ZWrh4xTPWMYfE7PW6wyR2OslIEymaNZ77ht1o
         2PoRrDR7h+RLa8RqXHjv3M/L4LNsMCVgDvTKZXsQrC+ppmzYeQaFAJ1BA2TitujrbAvr
         X3yow5v08XwkTDKfps4+mFjb5rFA5IJ9mAkQny94jxmjLNizgtAl4EEgt4HjSGWYBgvz
         /yaGJUckn0dpplA8Oxk4vFx0O/1vFR/bo/HHiHL5/+5Es2q2w9S9mY2QaNWJrhyqYEug
         oc7g==
X-Gm-Message-State: APuU4Z+t6EKd1jkEqXxQH0i2PwMDZJgLG0BUr7HZ7SiGvNf2F1wYXiWp
	GvikV4VYb5KgQJODlRx5CEQDVdU0mnSaG/ZXBmp5DihY/3V/Lk4/xUcwicUQdArumaE=
X-Gm-Gg: AYBFou1+kmY4Jvkxdcw8wAwFcubUSg9V3KykY+6d6jpJ7g/+mDffrl5zuWKFT42BmPp
	WEUCxBCBkkZMuima4kVNffRK61NzqCbI2Tgq4yefdS2MIcN3CLb/3shX55oMDsrLckLOhihN54e
	5jUYNwMJ7eNx1p/hDcuzngOpn3YXcBJi0ThnYFZqJ/QmBqFIJvX5g/S2CUb0HloYOhSGJ11vjmG
	bvwaP3rkNIdPTA75Isy/onO5M9jGy44CUG+n/G5xW0ZmbQstzzzjXcVtAfaYSx4MrCu3C10x76c
	tQVb5bXjmn9viq/5tEMyKTPtIaPeqctXAi+RvrOI6Y6bA2bjW2Cxp4uUOABJ0C1ZrvBIHjLvQGK
	JmrVn9qmW1z1TLtuksL3Z8jssDNUiM0o8Bu9gpVkiB29Y0FMv4yvEua56GIT951K226A+29dr0m
	htW6ZLfI/+Kho3jPRsUpj4FIQ5TkuQJTugJjGAaThdMgXADfaC6WU6ac/kbaEmBPj5hTh2zeNvI
	9ihqYM11VnBSaUZ6qX2y6RnuIS3jI7tE8PuY4NkCByAa2S59T/6V35pkHtipMJg7/U0Z+uzjoKA
	UMp4XnZEG6aTLaSZRQibbquocBLr0d4Z8jrCuLtPgfocUSbProcW9MWF+AYVzuqMNVxoa+scpO/
	PuQERIru2dg==
X-Received: by 2002:a17:907:868f:b0:c50:475d:980e with SMTP id a640c23a62f3a-c50963ced7cmr772967366b.38.1794816108385;
        Mon, 16 Nov 2026 00:01:48 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:575d:8fcf:e30d:5aed? ([2a01:e0a:106d:1080:575d:8fcf:e30d:5aed])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5ff2cd05sm18650883f8f.31.2026.11.16.00.01.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 00:01:47 -0800 (PST)
Message-ID: <4810f117-3003-45dd-9b57-d7e400c50560@linaro.org>
Date: Mon, 16 Nov 2026 09:01:47 +0100
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
Subject: Re: [PATCH RFC 19/23] ASoC: qcom: sc8280xp: allow using the sc8280xp
 card with lpass-cpu
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
 <20261113-topic-sm8650-el2-v1-19-5183f6aab9fc@linaro.org>
 <sashiko-outbox-213522@kernel.org>
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
In-Reply-To: <sashiko-outbox-213522@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 20:12, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issues to consider:
> - [High] ASoC: qcom: sc8280xp: DAI ID collision in
>    sc8280xp_snd_hw_params()
> - [Medium] ASoC: qcom: sc8280xp: DAI ID collision in
>    sc8280xp_be_hw_params_fixup()
> - [Medium] ASoC: qcom: sc8280xp: missing lpass-cpu jack DAI IDs in
>    sc8280xp_snd_init()
> --
> 
> commit 3e03c7d28b8733d89a72bc91c60e7c4086af115e
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> ASoC: qcom: sc8280xp: allow using the sc8280xp card with lpass-cpu
> 
> This commit adds LPASS Codec DMA DAI IDs and attaches DAI link callbacks
> unconditionally so the sc8280xp machine driver can be used with
> lpass-cpu DAI links.
> 
>> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
>> index 8cc75a7ad866d..ff57fb9051a26 100644
>> --- a/sound/soc/qcom/sc8280xp.c
>> +++ b/sound/soc/qcom/sc8280xp.c
> 
> [ ... ]
> 
>> @@ -242,6 +243,8 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
>>   	switch (cpu_dai->id) {
>>   	case WSA_CODEC_DMA_RX_0:
>>   	case WSA_CODEC_DMA_RX_1:
>> +	case LPASS_CDC_DMA_WSA_RX0:
>> +	case LPASS_CDC_DMA_WSA_RX1:
>>   		/*
>>   		 * Set limit of -3 dB on Digital Volume and 0 dB on PA Volume
>>   		 * to reduce the risk of speaker damage until we have active
> 
> [Severity: Medium]
> Does switching on cpu_dai->id here without checking rtd->dai_link->no_pcm
> collide with Q6DSP TDM DAI IDs, while leaving DisplayPort and WCD headset
> jack setup broken on lpass-cpu links?
> 
> LPASS_CDC_DMA_WSA_RX0 and LPASS_CDC_DMA_WSA_RX1 (36 and 37) have the same
> values as PRIMARY_TDM_RX_6 and PRIMARY_TDM_TX_6 on AudioReach DPCM links.
> Meanwhile, for lpass-cpu links, LPASS_DP_RX is missing from the
> DisplayPort cases below (skipping qcom_snd_dp_jack_setup()), and
> qcom_snd_wcd_jack_setup() only attaches the jack to the codec component
> for LPI_MI2S_RX_0 and TX_CODEC_DMA_TX_0..3, ignoring
> LPASS_CDC_DMA_TX0..3.

Thanks for the analysys, will try to fix it

> 
>> @@ -323,6 +326,10 @@ static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
>>   		}
>>   		break;
>>   	}
>> +	case LPASS_CDC_DMA_TX0:
>> +	case LPASS_CDC_DMA_TX1:
>> +	case LPASS_CDC_DMA_TX2:
>> +	case LPASS_CDC_DMA_TX3:
>>   	case TX_CODEC_DMA_TX_0:
>>   	case TX_CODEC_DMA_TX_1:
>>   	case TX_CODEC_DMA_TX_2:
> 
> [Severity: Medium]
> Does adding LPASS_CDC_DMA_TX0..LPASS_CDC_DMA_TX3 to
> sc8280xp_be_hw_params_fixup() alter PRIMARY_MI2S and SECONDARY_MI2S DPCM
> backends instead of affecting lpass-cpu links?
> 
> In sc8280xp_add_be_ops(), sc8280xp_be_hw_params_fixup() is only wired up
> when link->no_pcm == 1 (AudioReach DPCM backend links), so it never runs
> on non-DPCM lpass-cpu links.  On DPCM links where it does run,
> LPASS_CDC_DMA_TX0..LPASS_CDC_DMA_TX3 (16..19) alias PRIMARY_MI2S_RX,
> PRIMARY_MI2S_TX, SECONDARY_MI2S_RX and SECONDARY_MI2S_TX (16..19),
> changing their minimum channel constraint from 2 to 1.
> 

Right, I'll try to fix that properly

>> @@ -533,12 +540,11 @@ static void sc8280xp_add_be_ops(struct snd_soc_card *card)
>>   	int i;
>>   
>>   	for_each_card_prelinks(card, i, link) {
>> -		if (link->no_pcm == 1) {
>> -			link->init = sc8280xp_snd_init;
>> -			link->exit = sc8280xp_snd_exit;
>> +		link->init = sc8280xp_snd_init;
>> +		link->exit = sc8280xp_snd_exit;
>> +		link->ops = &sc8280xp_be_ops;
>> +		if (link->no_pcm == 1)
>>   			link->be_hw_params_fixup = sc8280xp_be_hw_params_fixup;
>> -			link->ops = &sc8280xp_be_ops;
>> -		}
>>   	}
>>   }
> 
> [Severity: High]
> When sc8280xp_be_ops is attached to non-DPCM lpass-cpu links, does
> sc8280xp_snd_hw_params() misidentify LPASS_CDC_DMA_TX0..7 as MI2S DAIs
> and fail stream setup with -ENOTSUPP?
> 
> sound/soc/qcom/sc8280xp.c:sc8280xp_snd_hw_params() {
>      ...
> 	switch (cpu_dai->id) {
> 	case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
>      ...
> 		if (mi2s_mclk_enable) {
> 			ret = snd_soc_dai_set_sysclk(cpu_dai,
> 						     LPAIF_MI2S_MCLK, mclk_freq,
> 						     SND_SOC_CLOCK_OUT);
> 			if (ret)
> 				return ret;
> 		}
>      ...
> 	case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
> 	case AIF_TDM_RX_0 ... AIF_TDM_TX_12:
> 		return sc8280xp_tdm_hw_params(substream, params);
>      ...
> }
> 
> LPASS_CDC_DMA_TX0..LPASS_CDC_DMA_TX7 (16..23) share the same numeric IDs
> as PRIMARY_MI2S_RX..QUATERNARY_MI2S_TX (16..23).  On platforms such as
> sm8650 where mi2s_mclk_enable and mi2s_bclk_enable are set in
> sm8650_priv_data, starting a capture stream on LPASS_CDC_DMA_TX0..7 calls
> snd_soc_dai_set_sysclk() on the LPASS Codec DMA DAI, which does not
> implement .set_sysclk and returns -ENOTSUPP.
> 
> Conversely, actual lpass-cpu MI2S DAI IDs do not match the Q6DSP MI2S
> ranges: MI2S_PRIMARY..MI2S_QUINARY (0..4) hit the default case and skip
> format and clock setup, while MI2S_SENARY..MI2S_SEPTENARY (34..35) fall
> into PRIMARY_TDM_RX_0..QUINARY_TDM_TX_7 (24..103) and are routed to
> sc8280xp_tdm_hw_params().
> 

Hmm, yeah this is quite a regression, I'll try fix it
