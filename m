Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794816304;
	b=c7SwQ7Ta66Wq5XbHb8yQxqgTZ7cick0RE3R3GSw2KR/DzxDAaZIMi9Wgm5LFHd7MeLvk
	 PY5kqxsNP9oA+5R4gWj/Wh7018l6aEw8lgIlQDKXmH7tdlMub1+677BFkiYj1rSq0uiPP
	 M5JdyQLsYBR6Qj2sKfFCS0uNzzgtyxYDagtek8SjtACC8Y7IDjDpuVTJArthyTUdcVpPq
	 zUtSxyntRnePSZs6iiKFSKM86iCnMMl+Dau/P0IVuzj4PpKlKRdyoNUlCDxvsHuPX5KPI
	 jiYQUD+WOWn3AmccfLNcXAtX8N3leMbbZWvgw91WORCylas4F1vR0kxE0Ei2sq2EfiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794816304;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:References:
	 Content-Language:Autocrypt:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=y1R2N6M3oJAu4skO9jjhh/J+EeOiDnr68oIITnSGPag=;
	b=VnPaSzX4TZQOXYMT0fyMEgwRGd5gg79NVpm5dZ5HoKDXJAyDTFh/7xQP5KpAcdpAl/1S
	 d4ytmS5HQmm6AorIsPRgH6vzmuGHd0M9QHsU9Kw9EbHqhWriittdHyhFauZZOrmGuJO3Q
	 EHjw8tcipDUizLalFrK7vYkgFOHPJTGpETIEvvqGpOqGRg1f/CyKfckn0HkwWEra0UajG
	 gkMEyVJxXtKJXRrs4nv9Er3q3rRpL3o7LtKKpxr/opteeiXxRz6jiJSciEpW/6XH/PmF8
	 r/BEpHYguyFyNHDCWbyVegmUyFDBoqC4Wdf2FXpIBtr6gnF20OyBY/mPJuABpQy91Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=DsDP1t3q;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505E5606A323
	for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 08:05:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 505E5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=DsDP1t3q
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4910b863b84so2270676f8f.0
        for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 00:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794816302; x=1795421102; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y1R2N6M3oJAu4skO9jjhh/J+EeOiDnr68oIITnSGPag=;
        b=DsDP1t3q4gSo2MbZa6tz0CRtQ/ENkpOJw64bGTuQ7mTM7BNmMrrJVk0fDGemkO6ySY
         u7bh1fbkSX6n1Mlk1nG7RpRMhz2e1N4dRog+xibQRLa3+jFbHwfp/ksAM/2JgV2Reswy
         S845Egr1ETUIsWBas99vWMV7WWrYBkrp2lbaIZDfP0qqB/59bddRbibQYRnEb7ytn6Uh
         g48WXedNKs+awhRCgnE5c0p2y5tTzlqT5sCOq56bnSNJCkjQH1lNs0QTmSAVd+aJjG5J
         Knu4/Nv9NMhs+7d93KKifm2N47Smy3OewSnuDMVa6qdw8aO06BRJNLo15LFfnJuh3ooU
         LHrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794816302; x=1795421102;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y1R2N6M3oJAu4skO9jjhh/J+EeOiDnr68oIITnSGPag=;
        b=jkLh3BUY22MooH9OPaNdnN9L6gv5vn2LEPUdm9OwYuecwBrLB2n2e9LJ/0D+11eHjY
         xFQLQ+cRk4nJl0eXCeN94zyoYRhEytfBCB/uHHBg0jSm1/69Cc1Neug+0JT5cW+y8JId
         Q4opBD4nJ52SY/FsnRMQzDSc8W89Up8IffeGcxIZWyuiF1m4JuxSk/EHTHoDCSWUgTH5
         BQIYQIYkf3twB/0u21QLryibRZ8ea68ZRnFlGKwE1WflBuOCFFYoZD88kfHTPIYwHK6u
         i7jITW9ZHqUC9JerQ9OcRmGRwCioK7IZf8csijAF67sU0k0cjuAcetsofLOk0ZuKP3W+
         OIoQ==
X-Gm-Message-State: APuU4Z/kPUDe4gDV3jzgvI2T/LDqJTQ6S/DX4LRoe0FGzg+f+ft9+waK
	7q4yZ5RflFU9S7vTphDBEnebuTepOZvowFSP69CkEQSsFeekNSOPHNzsX/IWE0CIk6Q=
X-Gm-Gg: AYBFou0TB+P6yNEjTxgoV+2dFLzcri4w9X8hdsS31TuV/I4yDTKu7a9rGq0I6RrcMi0
	GMdQ5/VhD7XYaneAMc9anvrmI3OxaG7BPVNiyg6Px6mub2NwnxcBE+vlTD6GEpSTmm7chFv43Y8
	sUZmjLj5eRWjo3D8bQvKlbBp48hXKUYguDXQffKQEFt5LFB44DFygFxF3AtFaPrM1Xbtrl87Ti1
	88B4RN37rcT3zQjRP0LA3215soELwA34gMbW0Z9utOia1FsATzLnBMWAQY6f2rnSv+2KldVfv43
	dvDVUVdyflgiLtjFlrowgrNs/rqY5TOvptRfGyTSAzBzXo/7kWZq/5SXx2sfhofa75a2P0Fj4bu
	bCxAwz33Xqr+Rmy+CdpVhQp9n4CBzDijDGil/YTiwZjSdTBjs+/uHpf9NAE69iofJX0lVmJVcGz
	AniUymeC4T6cI5Dc3E0lgPnIDWZ10bfrDRxQBknLi4I1qzoW/B+hPigCppUbTz+ITHO/BJX1XY2
	sjV/rcpV1H467ZoDNYV5sMXdFXhcZszZEEqMa6W58kF2UhHiAwwWD/VGkQrO5SmQqE0VuXJ1mtl
	IhB9TG34IIu707ggBAEt+M+I9hbLseEkYIkq16qUChsed9/TdrPzX7sNX8Gz8NM0vQ1cSerl34D
	agVmrLM2KSuYcFGrUpWyyZBWH4Jk0APU=
X-Received: by 2002:a05:600c:4703:b0:4ba:4928:8aec with SMTP id 5b1f17b1804b1-4bb55a755b2mr211614395e9.9.1794816301471;
        Mon, 16 Nov 2026 00:05:01 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:575d:8fcf:e30d:5aed? ([2a01:e0a:106d:1080:575d:8fcf:e30d:5aed])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55acdfebsm249389925e9.7.2026.11.16.00.05.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 00:05:01 -0800 (PST)
Message-ID: <931bd5ff-2bae-4835-9788-563835e6c4e7@linaro.org>
Date: Mon, 16 Nov 2026 09:05:00 +0100
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
Subject: Re: [PATCH RFC 22/23] arm64: dts: qcom: sm8650-valve-deckard: enable
 audio
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
 <20261113-topic-sm8650-el2-v1-22-5183f6aab9fc@linaro.org>
 <sashiko-outbox-213545@kernel.org>
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
In-Reply-To: <sashiko-outbox-213545@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 20:23, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] arm64: dts: qcom: sm8650-valve-deckard: missing VA DMIC1
>    route in audio-routing
> - [Low] arm64: dts: qcom: sm8650-valve-deckard: unused lpass_rxmacro and
>    lpass_txmacro enabled
> --
> 
> commit 159b85c8d3e0dd02d73b32823f4b0aaab92103dd
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> arm64: dts: qcom: sm8650-valve-deckard: enable audio
> 
> This commit includes sm8650-lpass-cpu.dtsi and configures the SM8650 sound
> card, lpass_cpu, and macro nodes to drive the speakers on Senary MI2S and
> the DMICs on the VA macro.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts b/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
>> index a365caa28cee4..723f7911fc547 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
> 
> [ ... ]
> 
>> @@ -160,6 +161,37 @@ framebuffer_mem: framebuffer-region@af400000 {
>>   		};
>>   	};
>>   
>> +	sound: sound {
>> +		compatible = "qcom,sm8650-sndcard", "qcom,sm8450-sndcard";
>> +		model = "VALVE-DECKARD";
>> +
>> +		audio-routing = "VA DMIC0", "vdd-micb";
> 
> [Severity: Medium]
> Should audio-routing also include "VA DMIC1", "vdd-micb"?
> 
> lpass_vamacro uses dmic01_default and the LPASS_CDC_DMA_VA_TX0 DAI in
> sound/soc/qcom/lpass-sm8650.c sets channels_min = 2.  In
> sound/soc/codecs/lpass-va-macro.c, "VA DMIC0" and "VA DMIC1" are separate
> DAPM ADC widgets, so without routing "VA DMIC1" to "vdd-micb", enabling VA
> DMIC1 without VA DMIC0 will not power the vdd-micb regulator supply.

Will investigate

> 
>> +
>> +		speaker-dai-link {
>> +			link-name = "SPKR Playback";
>> +
>> +			cpu {
>> +				sound-dai = <&lpass_cpu MI2S_SENARY>;
>> +			};
>> +
>> +			codec {
>> +				sound-dai = <&left_spkr_i2s>, <&right_spkr_i2s>;
>> +			};
>> +		};
>> +
>> +		va-dai-link {
>> +			link-name = "VA Capture";
>> +
>> +			cpu {
>> +				sound-dai = <&lpass_cpu LPASS_CDC_DMA_VA_TX0>;
>> +			};
>> +
>> +			codec {
>> +				sound-dai = <&lpass_vamacro 0>;
>> +			};
>> +		};
>> +	};
> 
> [ ... ]
> 
>> +&lpass_rxmacro {
>> +	status = "okay";
>> +};
>> +
>> +&lpass_txmacro {
>> +	status = "okay";
>> +};
>> +
>> +&lpass_vamacro {
>> +	pinctrl-0 = <&dmic01_default>;
>> +	pinctrl-names = "default";
>> +	vdd-micb-supply = <&vreg_l10b_1p8>;
>> +	qcom,dmic-sample-rate = <2400000>;
>> +};
> 
> [Severity: Low]
> Are lpass_rxmacro and lpass_txmacro intentionally enabled here?
> 
> The sound card only uses MI2S_SENARY and lpass_vamacro, and nothing on this
> board consumes DAIs or clocks from lpass_rxmacro or lpass_txmacro.  Probing
> them registers unused ASoC components and calls lpass_macro_pds_init(),
> which holds active runtime PM references on the macro and dcodec power
> domains for the lifetime of the drivers.
> 

Good catch will remove them

