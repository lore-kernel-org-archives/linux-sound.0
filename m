Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7902080DF
	for <linux-sound@vger.kernel.org>; Mon,  3 Feb 2025 14:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738592600; cv=none; b=TFubfx9tPOrg9B8xfXskKTnRyBdmJN3KhMwoShKhLlZDJsUl2FeAnWT8plfsx9+DFPfaL3Qrm1TfcrzAknhDaJI6qLvNzIDUin00s5L2XJ2VR4owX7/MbWIpKEkS0SSLRzQjgMyIpQblf1ftFE88NiFvjTzpxVw5zSjSRu9KUM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738592600; c=relaxed/simple;
	bh=5TY83yTZMJt+WJR243C9KKqHeLZC/2FOoflW1n4/Z9M=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=RSrwm6e7UPqpQQqa7drHSvnTV6BOSAPyeCZ69xD7NY10KJ/HtG1mkGGuUAobZhPLo2RuUoPKzNb/p//KajzpfEUXKVAX5fC9nHslJIluJP6BaXwQI/+UbfXtG2b7TngUFI+AvcerS1GPLNYrRJLU7QkdAA4C1DbRmACM5W9vq0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AH0xFT/g; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AH0xFT/g"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-437a92d7b96so45001045e9.2
        for <linux-sound@vger.kernel.org>; Mon, 03 Feb 2025 06:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738592594; x=1739197394; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JETyfRXJq12Xcur9F4/dJvLidwKyQCSflTktFGp74z4=;
        b=AH0xFT/gSXsYN8U0P66GC+3kW9Bm6hEmydQvCwHxugz63BOtxzLhV7VsvpvP42oIEb
         kePx3QVahc1EWSyQ1XEuJGSblEvAWBLWBSPYoe0im9V1AndQWRqcMq5IwoeH3b8T7f+o
         Squ1kDvy+dV2DflSZxxkSB4cRlqdChRrcbKcN14trUQuBvLejH7ZP4F+ibRxxMpz7Y5K
         nOyDw7bl0t0LOiZsILE3bRYT10eNzYOQhbh9i5pAlYtKtSabGtFvU3DhHudiuNofnTIH
         ZJr25W7qhUS0TOQNhsnyFM2habLvjgdpA1YCKKYyQCmxkKkFokpn+eEASxxlrh+Ej9rl
         xukQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738592594; x=1739197394;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JETyfRXJq12Xcur9F4/dJvLidwKyQCSflTktFGp74z4=;
        b=X2K8J1sA63dEOUTYB+E0jwaGqGjAm+pBX9fSGrdw2Wl+22YsSN+bGGhIKleCC3AaNZ
         gIa2Q/ebb4Rotkr3AdjDgEtbHMQu66aMvplvZod5fDI+n8QuZ3TDg2VX2RGN5MMciF28
         tZVJPe1K+xhf6l/Q+T3Rfhn7PH4yrOb186TSoNvaOr9vPu9RSE3abculNdkkXqOvOPhZ
         8ZblRycyakDYYkIIC1e9Q5ey1C8xOQsJYmwgXWk8cwGM7M4Y1WnDRq3TEExgW3DcuAmt
         Pm99d9ou5S/fXDm0q8U8QnKpt2wv99aLfZI2CngYvECmc7tfXCZW/SM3IgGDejTLMKiZ
         O91A==
X-Gm-Message-State: AOJu0YytK6IM/3S8xFDm4Iaid6ipryrchIZFeWaTXZ8YF8QUgBucZuMX
	ZbIwCeQGhvAuflkGP++X2HZZ1VpIe2+Zb6D+MLbAJzHian0d3nB6ZpoccwzVdk0=
X-Gm-Gg: ASbGncvmyJfZlSfd1R396EIR1iVbyak2JxhvmWtIuYv3RAhbw6F/sbXwvF7X6HTbHY2
	Yfc+7ZSCC3y1fhQQxVUC5CgNphM+19SmhDrJG5msGvMiCgnBgZ6RuoThifp7TBJa4Pg9+4Ft9VT
	KuLQu/5mrLVWgTYQTY27V/OJIjrRMbo5jKl5peMiv95O/Gz/vyGt0SPx6ExMazecX5WpymR+GSZ
	NIsuat44ht95wnUE6GoEGfETfgYc101K0/aGyaEoa3U15dPJsb7XtLFd7Z+8xWCy/nxPqC3WqSl
	bnBZn+imhM5l8+I5dopfxMcVBr3tK7I58HFByzkJT//DqP0nTWKFLQ06yIZyBDmf8ZhS
X-Google-Smtp-Source: AGHT+IGYuz4oqLCApkYRCF33w+FsChPj8LKIA3wn1kEgbPVMNx0W3DLx862n4J8wcI9T6dUA+xOH4A==
X-Received: by 2002:a05:6000:1faa:b0:385:fa3d:1988 with SMTP id ffacd0b85a97d-38c5194ca8emr19688381f8f.8.1738592594608;
        Mon, 03 Feb 2025 06:23:14 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:e2ce:628f:fe98:a052? ([2a01:e0a:982:cbb0:e2ce:628f:fe98:a052])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1b61f1sm13142299f8f.68.2025.02.03.06.23.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 06:23:14 -0800 (PST)
Message-ID: <df4580ff-7b45-4485-9664-4cae731b7c53@linaro.org>
Date: Mon, 3 Feb 2025 15:23:13 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] ASoC: qcom: sc8280xp: enable primary mi2s
To: Danila Tikhonov <danila@jiaxyga.com>, srinivas.kandagatla@linaro.org,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux@mainlining.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20250203113857.34728-1-danila@jiaxyga.com>
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
In-Reply-To: <20250203113857.34728-1-danila@jiaxyga.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/02/2025 12:38, Danila Tikhonov wrote:
> When using primary mi2s on sc8280xp-compatible SoCs, the correct clock
> needs to get enabled to be able to use the mi2s interface.
> 
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---
>   sound/soc/qcom/sc8280xp.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index 311377317176..03687de1ebb0 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -14,6 +14,8 @@
>   #include "common.h"
>   #include "sdw.h"
>   
> +#define MI2S_BCLK_RATE	1536000
> +
>   struct sc8280xp_snd_data {
>   	bool stream_prepared[AFE_PORT_MAX];
>   	struct snd_soc_card *card;
> @@ -25,13 +27,24 @@ struct sc8280xp_snd_data {
>   
>   static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
>   {
> +	unsigned int codec_dai_fmt = SND_SOC_DAIFMT_BC_FC;
> +	unsigned int fmt = SND_SOC_DAIFMT_BP_FP;
>   	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
> +	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
>   	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
>   	struct snd_soc_card *card = rtd->card;
>   	struct snd_soc_jack *dp_jack  = NULL;
>   	int dp_pcm_id = 0;
>   
>   	switch (cpu_dai->id) {
> +	case PRIMARY_MI2S_RX:
> +		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
> +		snd_soc_dai_set_sysclk(cpu_dai,
> +			Q6AFE_LPASS_CLK_ID_PRI_MI2S_IBIT,
> +			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);

How is this possible ? sc8280xp uses the q6prm clock driver, and there's no
way this call sets the Q6PRM_LPASS_CLK_ID_PRI_MI2S_IBIT, or I totally missed
something.

And prm is neither a dai nor has the set_sysclk callback.

Neil

> +		snd_soc_dai_set_fmt(cpu_dai, fmt);
> +		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
> +		break;
>   	case WSA_CODEC_DMA_RX_0:
>   	case WSA_CODEC_DMA_RX_1:
>   		/*

