Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815963;
	b=RC8EBtZSDvWJ6em9LNebYN7WAhqkSZXZvMHgXaD8oAv9kSpU1fnL10wO5M9f4B3EUKgc
	 6jplxTP3z9/tMv74ABk6bpGJyVh/ZN6zqUQqn3f8IRzizHJKxLNlS2MBuE5Hyh4/VVbl+
	 v3QdAyzCJf8CMyC06FG2wURz1CgZqpzDJnQbOnMxro/QfdRqiVqjlkm9AzpdFP1RxUm4t
	 ch+XPOowbM/bRYQsp3OloLpXjcFsanIpVR6WvG52vSwdVgUFFzL9LTKd8iJoPcTSiD1tP
	 z8AEq1WYd6rD68NQ4O6eL5FufihIUQRYxMcBP7Gy6gVzlvB12qR8fEzDwpFlG0eRDkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815963;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:References:
	 Content-Language:Autocrypt:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=EjvetyvqxLjaeSw2J4Je0FZ24N4W0eHwPcS5UoEpsG0=;
	b=V7/7rpoBwp2ye5h6kxmf72ehEa9Y0B++/otKvMgS0hYNlVjtyMyplBmZcPkSuI7TlAbk
	 gSKLkw/MVhSdtURhXyelPvql/cFmQOAUNy1+ULhFncQW+TPGseOyADaGvr4EIlvDjbIex
	 gY6zgfWqdfPO7UegNdBa+QfO7q95UoQDBtiZKRiGZpf4Yj1rWasFn5QYbMB70WA882UKv
	 tuA8N5sb+pHAa7+bYLQKFTSPAOqwXEetNh8OXat9UoH1kj0n7wAa/ORsTOlsz5kotS0hT
	 vIiYNpVAOOzRUaMrgkSqIYFTMYwiJGkDisdQOAPLQJyvTkmgKIkfFEhh8iEJT9BVPww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nOpUDwoG;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AAF606A331
	for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 07:59:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42AAF606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nOpUDwoG
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-49465892f7bso2568362f8f.1
        for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 23:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794815961; x=1795420761; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EjvetyvqxLjaeSw2J4Je0FZ24N4W0eHwPcS5UoEpsG0=;
        b=nOpUDwoGzk/wHg/Bp+Of2YUIaxhFQrZZEVyuZZ89Y6lPT0VGYBaoVPrVXvIZU26D/U
         yBlImfvcXBKEEiBk7wXW0TRWN45cPYMAMaNZgt3gjN0rKvuwijzev03cMfsLdQCRmm9e
         WCYwaYjkWNwvoCPTZnCWV4NIFVJJQljouOD4jbVG6Z6c/Ho8nocRZIIvTUQKKntA8dtQ
         jILjnRi4/thV8WEzDF47rMw4lgjkfaUV/t+uN4W5+m9jFan/uzPUgNZoOPqTEy5dVyQe
         kDp2pd9Hca59jbHV44SXxm2yPySWjxFxovUaW9SIEKbDRlYr26yL/AJAyYOpoitJxeot
         1rGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815961; x=1795420761;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EjvetyvqxLjaeSw2J4Je0FZ24N4W0eHwPcS5UoEpsG0=;
        b=2KeWHJIFf9PK3lROnbBIBw/g8hVmk3XsGplW1pDtgIpG7gpNidw9xajMTerMd7jLe4
         Pb3nUXobEa7ilmSNTF3FM03ph/MwoOo+LFU70rFBY7WlacjVCSr8V94XZ4JIg1WHK9TE
         6yTwFR3hQmWya5859DNHWN5lTl7QW7YWXxPa4h/LuhUw+n/Nj6P6+K34dxFxcB1Lg0U5
         O8P2f6vm2kRGfRFUCcrw+4IPgQF9yOEhi0ko9zFiFfFWgMkLRBw6d2iWX+1jJUGGaWvZ
         7VUjhocpAiDBLqos02Mn0PGYOjUw894fLQImNYSpKxCZ4LoNciI1p1Zla6VXqPlgke8g
         7tfA==
X-Gm-Message-State: APuU4Z/EuQI/4r/4OIrDk/x4fD3wQ+16GQq4rBhSLDwiD7uHnw+jRh/V
	v528xMLa+HXi6cK79Nq6bwVUJ6yEYi0xu+vcnHsgKMliHlkOxutft26r0apmjDp8RBQ=
X-Gm-Gg: AYBFou02uk4njUqFtFr7GCnxwqNHrhHXmCgWpvWLti2MKUY64IJK+Th3Bf3Mkp0EsKW
	gTQ7kiY/xlSENPlJ0vZ54w9g+yrp+SJuf3h9xeO7EIGXo5fY9Q+1OYHdcmbhcFbMgVXW7l0q1kY
	XQwR2P4nz08VaXczVIjVHU3m38j5RnV7NB7OrXUVI7aqtY7eep7pUhufd4tIIUi+Rq9XoOePI7O
	FJbEA/PBXvF6iji1BGwubOUJyQvxX2GHIWaD8mLEl0Z+RG+ux61FCGetlTEVcRgtZk8aXZV5oen
	7H8EmdYIEzZyL0WGgt11rMpmJNUWUArsAySmG0FjYeBm2KQ0DZXRiKN4VbiINeu9JANro4hL/8w
	4Z6Xa4wL7rAEUnvsrpWkMGanoeJiww/4/7ZszSqaAEXZoWmqhmw68kX9ySBLbB3wyhjvGvDeXbW
	cxxxuLNSFkMfDnpwmcYt6bBzoLTjiMVZXyGFfIkF9GLzCPPtOcC8o0t0s7i3OBW1gHQGOdwxJKl
	Fb+a8sJUPl7ZgOgXjTqcE0oe3J/CK2Q2lkdDPP8LSGyhO9Dn9yuTcfwFtTbyaRSlCBTpsl/kNhz
	IMo964/L5DYdPZmGWEYkoB/J7r+FCpe8O0puNw+ivAQ1BscdziQkYL2AvuiUxnZm372R9qVDPJS
	BFuOTUNaz
X-Received: by 2002:a05:6000:992:b0:48d:c29e:40c3 with SMTP id ffacd0b85a97d-49c71e3db14mr19030193f8f.33.1794815960914;
        Sun, 15 Nov 2026 23:59:20 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:575d:8fcf:e30d:5aed? ([2a01:e0a:106d:1080:575d:8fcf:e30d:5aed])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c602dsm20167439f8f.46.2026.11.15.23.59.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 23:59:20 -0800 (PST)
Message-ID: <23f7de38-a5be-4de4-b026-e97deab9535c@linaro.org>
Date: Mon, 16 Nov 2026 08:59:19 +0100
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
Subject: Re: [PATCH RFC 17/23] ASoC: qcom: add SM8650 LPASS CPU driver
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
 <20261113-topic-sm8650-el2-v1-17-5183f6aab9fc@linaro.org>
 <sashiko-outbox-213544@kernel.org>
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
In-Reply-To: <sashiko-outbox-213544@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 20:22, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [High] ASoC: qcom: wrong lpm_type for lpass-rxtx-lpaif in
>    sm8650_lpaif_mi2s_desc[]
> - [Medium] ASoC: qcom: missing set_bit() for RX channels in
>    sm8650_lpass_alloc_dma_channel()
> --
> 
> commit ee9ae911e7b58d190ad971326ccfe23116c1a06b
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> ASoC: qcom: add SM8650 LPASS CPU driver
> 
> This commit adds the SM8650 LPASS CPU DAI driver variant supporting MI2S,
> DisplayPort, and codec DMA audio interfaces when driven directly by the
> application processor.
> 
>> diff --git a/sound/soc/qcom/lpass-sm8650.c b/sound/soc/qcom/lpass-sm8650.c
>> new file mode 100644
>> index 0000000000000..42050f56a4847
>> --- /dev/null
>> +++ b/sound/soc/qcom/lpass-sm8650.c
>> @@ -0,0 +1,651 @@
> 
> [ ... ]
> 
>> +static int sm8650_lpass_alloc_dma_channel(struct lpass_data *drvdata,
>> +					  int direction, unsigned int dai_id)
>> +{
> 
> [ ... ]
> 
>> +	case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
>> +		chan = find_first_zero_bit(&drvdata->rxtx_dma_ch_bit_map,
>> +					   v->rxtx_rdma_channels);
>> +		if (chan >= v->rxtx_rdma_channels)
>> +			return -EBUSY;
>> +		break;
>> +	case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
>> +		chan = find_next_zero_bit(&drvdata->rxtx_dma_ch_bit_map,
>> +					  v->rxtx_wrdma_channel_start +
>> +					  v->rxtx_wrdma_channels,
>> +					  v->rxtx_wrdma_channel_start);
>> +		if (chan >= v->rxtx_wrdma_channel_start + v->rxtx_wrdma_channels)
>> +			return -EBUSY;
>> +		set_bit(chan, &drvdata->rxtx_dma_ch_bit_map);
>> +		break;
>> +	case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
>> +		chan = find_next_zero_bit(&drvdata->va_dma_ch_bit_map,
>> +					  v->va_wrdma_channel_start +
>> +					  v->va_wrdma_channels,
>> +					  v->va_wrdma_channel_start);
>> +		if (chan >= v->va_wrdma_channel_start + v->va_wrdma_channels)
>> +			return -EBUSY;
>> +		set_bit(chan, &drvdata->va_dma_ch_bit_map);
>> +		break;
>> +	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
>> +		chan = find_first_zero_bit(&drvdata->wsa_dma_ch_bit_map,
>> +					   v->wsa_rdma_channels);
>> +		if (chan >= v->wsa_rdma_channels)
>> +			return -EBUSY;
>> +		break;
> 
> [Severity: Medium]
> Should the LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9 and
> LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9 cases call set_bit() on
> drvdata->rxtx_dma_ch_bit_map and drvdata->wsa_dma_ch_bit_map before
> breaking?
> 
> Without set_bit(), channel 0 is never marked as allocated (even though
> sm8650_lpass_free_dma_channel() clears the bit on close), so subsequent
> allocations from those bitmaps will hand out channel 0 again and overwrite
> drvdata->rxtx_substream[0] or drvdata->wsa_substream[0] in
> lpass_platform_pcmops_open().


Good catch, will fix

> 
> [ ... ]
> 
>> +/* MI2S mapping over LPAIF instances */
>> +static const struct lpaif_mi2s_desc sm8650_lpaif_mi2s_desc[] = {
>> +	{
>> +		.reg_name = "lpass-lpaif",
>> +		.irq_name = "lpass-irq-lpaif",
>> +		.lpm_type = LPASS_LPM_NONE,
>> +		.port_desc = (const struct mi2s_port_desc[]) {
>> +			{ .intf = 0, .id = MI2S_PRIMARY, },
>> +			{ .intf = 1, .id = MI2S_SECONDARY, },
>> +		},
>> +		.port_desc_count = 2,
>> +	},
>> +	{
>> +		.reg_name = "lpass-rxtx-lpaif",
>> +		.irq_name = "lpass-irq-rxtxif",
>> +		.lpm_type = LPASS_VA_CDC_LPM,
>> +		.port_desc = (const struct mi2s_port_desc[]) {
>> +			{ .intf = 0, .id = MI2S_QUATERNARY, },
>> +		},
>> +		.port_desc_count = 1,
>> +	},
> 
> [Severity: High]
> Should the lpass-rxtx-lpaif descriptor use LPASS_RXTX_CDC_LPM instead of
> LPASS_VA_CDC_LPM?
> 
> lpass-rxtx-lpaif is in the Audio CC / RXTX domain (clocked by
> audio_cc_ext_if1_ibit), so setting LPASS_VA_CDC_LPM maps MI2S_QUATERNARY
> DMA buffers from the 12 KiB VA LPM region (va_cdc_dma_lpm_buf) and enables
> va_mem0 in lpass_cpu_daiops_startup() instead of using the 64 KiB RXTX LPM
> region and audio_cc_codec_mem0..3.  If MI2S_QUATERNARY is enabled
> alongside LPASS_CDC_DMA_VA_TX0, lpass_platform_allocate_lpm() also fails
> probe with -EINVAL because VA Codec DMA already consumes all 12 KiB of VA
> LPM, and if MI2S_QUATERNARY is enabled alongside MI2S_QUINARY without VA
> Codec DMA, va_cdc_dma_lpm_remain underflows and assigns an offset past the
> end of the 12 KiB VA LPM buffer.
> 

Good catch, will fix
