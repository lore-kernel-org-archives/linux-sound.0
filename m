Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDFA3A6B9D
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 07:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785484675; cv=none; b=os6CU9UJ+v9kuFdSr15PtjjRgY4wQAsVHp5jNpmly0wUUImxZ84zLew8V1UVE0MB4uaJzTs28RQ1aMYWw0neUu1axTcKx7GWlgoxvJjgTxspM+4Qdnpu0Tgmlsu+UZvsBYF44iFMpF0uXorNbNVENsDdveyt6YkPXusuddGqSAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785484675; c=relaxed/simple;
	bh=0HBlKBF9zL5J6Q7jKGB+oj3M5HCxfntMGCpeDJrEoiw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=dTVVx2wRlIlx0jMmqZsDFAXSh4JiZeND/w6eEkPm2WqpZmsHVgslIy42b5j5UtT2QG9ofBeN66rSpFBgEt0wOeEOdhggMEDA2ejyKFxHCpe99iecjIxTS95Rt4/U0GmKS43nnO/okn/+gyJzwoHI1xtcQCO9TcT+83CJhGEL+80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mF76Z0Aq; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mF76Z0Aq"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-476a130c138so800625f8f.0
        for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 00:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785484671; x=1786089471; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0uPTfL+vKx+OflOxVTQ1Xmh8r/udQsPx2gi6DfG+i2k=;
        b=mF76Z0AqR3DXDJ+4ZM9q66smvWuci/w+v/Ybx2gfSIWUpNBH1yq+n9maZnYBbkw/Xm
         i6qkeZEKAZNaHM9n0B97HVEBwXh1z3QnmWrxkhBS7tsghWZx36cdJidYOFj2y7+maanX
         lm2AgrLi5AIYi9+11xElMS8cZGfzpfyDNW6ofHkrVav01dPZUZHG0fEc+yzF0ziyC80B
         +n6uFPAWo4qPnnsQ5Hsi7650Q8caYUJT3MS5anD38F7cBjoxz7IuMHlvXRg42TIZeODs
         z2ojlEOqw2Gy1BVo/5O7vQca12CMFFYnE/CHQUpk8/j50kebYiZRBAxnyyRpCAvMwJJ0
         AWJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785484671; x=1786089471;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0uPTfL+vKx+OflOxVTQ1Xmh8r/udQsPx2gi6DfG+i2k=;
        b=VlMl+HbKbncVjxSL9ttxsaQsjjlqWJ60UGEfoClQ7jqO7CdBNNKvpkBJfvmKuVX39r
         09D4qSevKNe/ED0ISJ9cV2OFjNIUBWpwy28//xgQ7+t1bU35WfJv3kNjzHX/HoH9RCC5
         ydaSumiB2hS+HxJYA+1joBoFcLNUMLJk12o9GNZEKDlVIvgsWia35laPPcl3EEEehXhG
         7ylbG067MQLNu9524Ystf64eXnml4PClTPQcnG9R/psb0HZ8vBuyvMiQicy8gZL1XpB9
         OgXmZBZaWXWo3x+SIFYU9EYYUG0Sbc0j9gkF3+idYHWBN0qJkwfxodk+iYc6YJ7gU0gP
         Cj1g==
X-Forwarded-Encrypted: i=1; AHgh+Rob17ZSiLSTTy+02eBDkfmbB8JzShGzUyvQy2xgjaKrQ92tsyprdlnMF1BFxuZFKuDSuZ5vl2nHuxAvPA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2GIhcfGeHHPuI4pu/euHHja2aoN4Mjx/cHb2CxLB+9raiZUVa
	lNTMCdhlSYvyvOzHeS8GCuyEtfpsyuSptxiWRHKhlTNFB+dWVzrC/rfhutHzHCHu54k=
X-Gm-Gg: AR+sD10dV5Q67wHUMBFtxhV4J8IsFsZgP7hM5She2BZwof2PAUJhMMi1EzFC+hEgWGa
	TQdy6eqTOvAP13F9fW1jPtDAW2mCFnLSHMgEW6XmReXaV+/aQQukWyurZntSwExgqi0R0lAgqrj
	0x4UqTJOffdx5DBHqMl9+5b0ZKK3zDD9JthGTCDSOIlhov1vZ6sSt8+Tg1A7hBgk6dt8EeFLau1
	XBw/QV1XsA37Cw2rSnJq8ee7HO2xreDj+a/ig7+pu/TLSKRrnn85I5lf3zDDaVpphRS4YKMLGNG
	rA+7W3NFkOAtBmoj2429dtb+COOCWGNCPTAd0ijBZGTKDflZVT8lYH1wS6VXFQIvmAEaICFIsZr
	H5mstlLPc5nEtDPRCDPIUSaDlmMbPVyNlwxIx8xOsJT9ykiXtMjm7Lqj45dA9+3RlzD85S8AotP
	R7aymlMi8GM4ywUQD/vesSHfm0y2mkfJq+exr0Jpzy1HwcEHTqWlkSO7fsKnOw++ZzKsGCrjeXT
	4XuFFar4k8oFy2tI5rEOY9GoEIzdVM3ST2Y+lB3NQ==
X-Received: by 2002:a5d:5f81:0:b0:473:6e8d:7f3 with SMTP id ffacd0b85a97d-47fd2ab9b0cmr2799659f8f.1.1785484671231;
        Fri, 31 Jul 2026 00:57:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:6c49:d2f1:f94:1fb2? ([2a01:e0a:106d:1080:6c49:d2f1:f94:1fb2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd4562667sm1967400f8f.24.2026.07.31.00.57.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 00:57:50 -0700 (PDT)
Message-ID: <b95b15f8-147e-43d2-b821-6aa92061aaed@linaro.org>
Date: Fri, 31 Jul 2026 09:57:50 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 3/3] ASoC: qcom: sc8280xp: add Ayaneo Pocket S2 card
 with special WSA channel mapping
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, kancy2333@outlook.com, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
References: <20260728-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v3-0-b29f44720178@linaro.org>
 <20260728-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v3-3-b29f44720178@linaro.org>
 <69d28133-29d2-4b80-ae69-20117474d364@sirena.org.uk>
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
In-Reply-To: <69d28133-29d2-4b80-ae69-20117474d364@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/28/26 19:28, Mark Brown wrote:
> On Tue, Jul 28, 2026 at 10:46:45AM +0200, Neil Armstrong wrote:
>> The WSA Speakers are connected on the WSA2 interface, but the
>> WSA and WSA2 links are handled as a single dai and DSP interface, so
>> we need to specify the channel mapping of the Ayaneo Pocket S2 for the
>> WSA dai in order to have functional playback and avoid DSP errors.
> 
>> Let's add a special entry for the Ayaneo Pocket S2 adding a prepare
>> callback in order to set the proper channel mapping.
> 
>> +static int ayaneo_ps2_snd_prepare(struct snd_pcm_substream *substream)
>> +{
>> +	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
>> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
>> +	unsigned int channels = substream->runtime->channels;
>> +
>> +	if (cpu_dai->id != WSA_CODEC_DMA_RX_0)
>> +		return 0;
>> +
>> +	if (channels != 2)
>> +		return -EINVAL;
> 
> Do we need some constraints somewhere (perhaps it's already taken care
> of and I didn't notice)?

Yes channels are already constrained to 2 in the card driver:

132 static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
133                                      struct snd_pcm_hw_params *params)
134 {
...
142         rate->min = rate->max = 48000;
143         snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);
144         channels->min = 2;
145         channels->max = 2;
...
158         return 0;
159 }

Neil
