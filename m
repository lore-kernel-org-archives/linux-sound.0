Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795595927;
	b=BJ/taC06121665nbKPFuvexv++4kWESWd9fvYsOaCz/NhGqDrc22oHhFy1yzo3aUj1s6
	 z4PNNld//wavov53gKK4QZOAaBltM/tbni56q2o3btMmsiobZEzA9PLC5U3Ru/8TNW3jW
	 fIf2W2kXaZ/estW7PGsscz7MOTLYJCqtM8YZZMdD7vjooIGvzk/xWR8z5UW3ZSaEKz6dJ
	 bKd+AXIdoCQrV9czM/7Y6op8W3sui1ck/U0WeRe0Er1V6adW5ShSjgprOQeIIjJbsDXx6
	 dGfeG0Y/N4FIv9kiwwz7DSSfJxxtYXG/Qyr6SehDTq9fxnZvtgwR97jYUBEvr77aI4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:References:
	 Content-Language:Autocrypt:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=50VR4Bii4r0x40VxRkLIljzh8fTduZtxHSfKIR3mJdA=;
	b=Rue149LfBP+TXfN3JRPf9mtWoo84zNBfiikAHsOIC5yRbmQbHRcnkDa7fG5feAG37Suj
	 lw1q3zpcM55TR35wccaIhcQF2JCsQcYTNq+Cyylt0FdFZcrbRg41MxNvWuTlyNXG233G+
	 1MLLQV4j6RLfUCNJpZEuUXtm4u2gcVoH1SZ/RXPEM+MQdS+H1T5nNBZ4B/vZAUq8tq5kP
	 l/NZfwcxpgQI/qJy0CLHZkfLF4I9jjYcDlfHxdf6IFpiWRgx10BXTdS/5qgjDqHG3/OIw
	 scdXn0tXEe5Daw1KdpJHZdkqefUVRNr9oBirPCRQ1MeRMhycW3yBVqffyxXgcGeUMAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uXB0uB9r;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6CA606A336
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 08:38:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D6CA606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uXB0uB9r
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4a357b1c649so3151744f8f.3
        for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 00:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795595925; x=1796200725; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=50VR4Bii4r0x40VxRkLIljzh8fTduZtxHSfKIR3mJdA=;
        b=uXB0uB9rBS61mYCE8m6Y2IuifItmaCmqaGyCD6s5PyydPTNRjrKOswJNpKzWAjGCbL
         WebE5b7ecGwKmy3Jiq48lG2n1vuAbv1fo/sJlA+L3pfdRHxPevEpW8YiRsqMGfsin9HP
         VBfjbaCKfaba6qlxsuy4ZNT2PFo7N8t/o4qFngaEsXTyptDqbU4snsbxibcizetBohGO
         hJqKr12mT1tzTQbKlOYzKAgGEr8kiRsjMHvnvASSUWbFiVnT6pVZAdwAoA9+6GYuupgP
         sDozzWJwML8Gp5MNPdRBDz4hO5/X1XHuskXggAbPUC+5LHEq+zJwq0zPyY5ytMbal+0E
         I4/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795595925; x=1796200725;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=50VR4Bii4r0x40VxRkLIljzh8fTduZtxHSfKIR3mJdA=;
        b=1cjciztxNOHI4mMfqKfk1uSC6E97mAnw1ly3D8e3aZ9HlDjOIO2ZZxjG7YJTNib1ES
         q8WiOYJyPNRth28VdAxyW9PMvTB80JE1eJd3ctZSWGCS0s9MmD8HVbrWY0CVIXrOgr6p
         0W8xVGxoCLBKDoLAsOv6s2fv3UEBVSMDoc0oA6xU9UItHm7sjh/2ciX4uN27hjJEUESN
         LbmNQVcPGHqG0LTlf7UQtByvRR3uP3sunFxEDUCVl3ZnZxc2dIdeMcngWzlFtr+eT09Y
         HTicf7IBkHNLkpkxZyL3nK3zzzyxCQsqQ4ETURDQ46JSu/p5V1gmwS8mMWEiaF16GCos
         Qw8g==
X-Gm-Message-State: APuU4Z+zXWdHg/ivQcHj2rUSap9b+fJjaIa6+2YyPULDsmsD4TGB/PJ8
	rqScwFnohjb5fRRkIRawboJKhIVt64Y7DeJdSRngVKFSi6vwQH9Fjd7npRu+OzrGk74=
X-Gm-Gg: AZFdTZek5Fpy05bv2Vdki+ZO+H6McQ6n4OHwxe/c8m1haxSVz7osyQe0DQ5QeHocPCk
	7bAK0l+ISRXSzKmITpIQGD4Fgy+1ZhT7F8o4CTTNIBQG3CH9nipm7DowL2jzYo+V2QasFu9qHFt
	6fez4Spey+5Mayax/30CYGwOLdiF9UGKsiLvRmNzev5O1Sir68xultrqsJn78FHk9sbRKPv2//J
	ZY3QdDHktkM3+EtrgDv0xdYHmTa/8+Nzg7o+DgJvLRtzuxcBxidx6IZ869GlaXcSGq8DG3z1f29
	h3A17ovNzwbyPwtvtgEOCQTSB7LiFcxMvHqR5TpLqIH/p+ZVG5Za1/GYEFFxgSvBs7k5s9WleLN
	ienzID7BdsweBVf/XGOeiyD5Q8WAGa9cetS0T0FqEEVAg4A0++J+A2n3KwwEkzOrWL3V8Jkjuq/
	gb4skzjabCdeQi9lXHCXcH4apc9jtu48vb+40wT5tIuuBmyNjAARwUY7HQ1/UVNfzNB2Gl4LyoN
	4TgVizmmKkcYSqbvL2HrSvX9sLcIjMTNorRarqjQ2gvHw8qGKJyeNmCjKla45cVkQnxf6JIg55t
	I88qKgMClpfEq0fJUF2k19JZweglRMHg2TSXEL4lGGAkehVMJmUoQAixkA9AAcnCOWsB7V36dLA
	ar4dQNpQfgw==
X-Received: by 2002:a05:6000:200f:b0:4b7:6dcb:e906 with SMTP id ffacd0b85a97d-4b76dcbea3emr7646897f8f.43.1795595925303;
        Wed, 25 Nov 2026 00:38:45 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:f368:ae2e:e717:e970? ([2a01:e0a:106d:1080:f368:ae2e:e717:e970])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab5ffcad11sm31544013f8f.0.2026.11.25.00.38.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 00:38:45 -0800 (PST)
Message-ID: <0144c378-919d-4c44-a306-dfadea6a7617@linaro.org>
Date: Wed, 25 Nov 2026 09:38:44 +0100
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
Subject: Re: [PATCH v2 10/19] ASoC: qcom: lpass-cdc-dma: add support for WSA
 codec DMA
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261124-topic-sm8650-el2-v2-0-174e159f0f69@linaro.org>
 <20261124-topic-sm8650-el2-v2-10-174e159f0f69@linaro.org>
 <sashiko-outbox-231736@kernel.org>
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
In-Reply-To: <sashiko-outbox-231736@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/24/26 18:44, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] ASoC: qcom: unchecked clk_prepare_enable() in
>    lpass_cdc_dma_daiops_startup()
> --
> 
> commit b77682a3d9ba3fc802985eb7a7f2cb05c5db3350
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> ASoC: qcom: lpass-cdc-dma: add support for WSA codec DMA
> 
> This commit adds WSA codec DMA interface handling to the LPASS codec DMA
> driver, wiring up the WSA DMA control handles, interface types, and
> codec_mem1 clock in DAI startup and shutdown.
> 
>> diff --git a/sound/soc/qcom/lpass-cdc-dma.c b/sound/soc/qcom/lpass-cdc-dma.c
>> index 2dc8c75c4bf08..d7f85a4f9d999 100644
>> --- a/sound/soc/qcom/lpass-cdc-dma.c
>> +++ b/sound/soc/qcom/lpass-cdc-dma.c
> 
> [ ... ]
> 
>> @@ -184,6 +211,11 @@ static int lpass_cdc_dma_daiops_startup(struct snd_pcm_substream *substream,
>>   		clk_set_rate(drvdata->va_mem0, CODEC_MEM_HZ_NORMAL);
>>   		clk_prepare_enable(drvdata->va_mem0);
>>   		break;
>> +	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
>> +	case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
>> +		clk_set_rate(drvdata->codec_mem1, CODEC_MEM_HZ_NORMAL);
>> +		clk_prepare_enable(drvdata->codec_mem1);
>> +		break;
>>   	default:
>>   		dev_err(soc_runtime->dev, "%s: invalid  interface: %d\n", __func__, dai->id);
>>   		break;
>> @@ -205,6 +237,10 @@ static void lpass_cdc_dma_daiops_shutdown(struct snd_pcm_substream *substream,
>>   	case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX0:
>>   		clk_disable_unprepare(drvdata->va_mem0);
>>   		break;
>> +	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
>> +	case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
>> +		clk_disable_unprepare(drvdata->codec_mem1);
>> +		break;
>>   	default:
>>   		dev_err(soc_runtime->dev, "%s: invalid  interface: %d\n", __func__, dai->id);
>>   		break;
> 
> [Severity: Medium]
> Should lpass_cdc_dma_daiops_startup() check and return errors from
> clk_set_rate() and clk_prepare_enable() on drvdata->codec_mem1?
> 
> If clk_prepare_enable() fails and startup returns 0, the substream opens
> with an unclocked LPM memory bank, and lpass_cdc_dma_daiops_shutdown() will
> later call clk_disable_unprepare(drvdata->codec_mem1) on close, either
> underflowing the clock refcounts or disabling the shared clock while
> another WSA stream is using it.
> 

Ultimately yes, but the actual code doesn't, so this will probably deserve a follow-up fix as it's not related to this serie.
