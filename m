Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596324;
	b=oaxA6G7mTxFB3BmU7fSrKZlvXU93vfNbyCjt0NtXqFZ86cKlvvoHPnDhSAdRbPE94449
	 U2XVcJPGE9WX7bEtnrv4fZ7fBYShbGgWcvENORlWy6sfZdeAD+/vPwL79KCG4spJlGKlo
	 dCOVJg9mMemifP81XG9MPmUwWGoMv4kWA7xxbW1/vULbJp9ktDttPjhHaD6KzcJjCy4Pl
	 WE0P27aBZENa/WVuQ/bqzoodd9oAiOStHREYcqSW0AIDPaUKwv0sL/Z/LBYQzLwK/gYZo
	 Gu9Ud/fd3BqT8jxXat2Q4LHsq1Lt9zTbw0vxslbNNM2URBgNTElSLTO1M84z+P4zeBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596324;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:References:
	 Content-Language:Autocrypt:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=8hnA+onLUda1A0zp7SeLbz5gSaOIOH6AU5jguSzKjPk=;
	b=4cqn6/TM2hJD6UMLzS4XTynZG5Q2kIgybNzHKO5KxByBKmR5R7YR603DUp+K1FTA6IL0
	 85giRzpHPWLwr+U9Ib8Pl2j5qcH6EC35xQqyI3mCxJsx9UqxmrhhICVny53xYjmhF8htb
	 n2If8YVUZhhOxnxYMnn0Uzf7FD5q89YqEKIUoruUeQtrdKmvHBS+uRekGAofMAo/Bk7TR
	 7Q07poiNSG7YPlj7llf6ds5b8Ub0G0vVIJ2cG/EXfcnDrXX7Ov1Nfg3RvtmDzm8C4o01s
	 qDf8yAjb7qOG9BHZEnCynhdTm9xtPXD1zg6RrUfrh0YFOqnH7YJ6PTa5MTvsoXoJSdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PmLGyL5f;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BF2606A31E
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 08:45:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80BF2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PmLGyL5f
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e3b22e971so2847671f8f.0
        for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 00:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795596323; x=1796201123; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8hnA+onLUda1A0zp7SeLbz5gSaOIOH6AU5jguSzKjPk=;
        b=PmLGyL5fv1es97y0x9Nr6/Xs+qINe30vLqDMczAde/ep+a1PZSCJp8DqdYjTLWi9aY
         TxJ0keMyAZ6N+Cj2y+7DUUsWm3pwrbNCjlqm6vc/LbgS3TX/OI9320Oi/od5uAnViDCb
         982ZjQyG6x1Ukmk+6JjiOvcPPQvuGOAsezWvVnc+AyGUlwgqogQ8Ju1LIH0kMYxoorSF
         XFtiinup+o7iNpUbpMJLZ9ZBq6qAmwUWnmzA0oX8X0dnSWavXi55LA2YXHVJnJuPdI/+
         RuhqYL/uUD5iTdTize8vq583sPG3nf/pMyWYUBeAmGKgYVobGkGud6TKi8RyRYGNt5gE
         7cNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596323; x=1796201123;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8hnA+onLUda1A0zp7SeLbz5gSaOIOH6AU5jguSzKjPk=;
        b=RQjetIbsmbFChSETMzl+DFggZDwclwExSpXXPzeToCdQTE7iyCE9c3WkIKZOx+aG0q
         BYzHt78OYyEqpr2WSW4E5YlgsmnsHsr/7ZHToyE2YfNEZ57dWYjxXcwfz5UfesDWbZDj
         rmzNmDdl++T1hh+b0GfBhFJvs9yRpEiLllj/NsGD1wn9PJrSIueUFEuoBJ9Cpvp5dRFf
         ezuelQELFcKGLJMtCyNSbFry5iGf/6FJ6aGA1C56NHSIS0EXCenJ3KLWVh6HqA6zGmKq
         Za9o/9CLj1ZXLx6LyOFTBNGJc0/7RYsFseJf1BkIsZy6W4/8Mrp3lub5JKfnbrDSqOIg
         aV9A==
X-Gm-Message-State: APuU4Z9NWVIqEkv8vDoAJFeSrd4RIhdvrBtxnP+hTd3cYOtUibe/nlpJ
	u6zEUV2zoxYRw3SLddm0vjxjaOT8JAg1MwS6Y/ngHZwpF4vBCKtXkUvblJDEM92Um30=
X-Gm-Gg: AZFdTZdgi8uFz6g47GlPjsEQ9wjrNMjNmBrOTvxyoT0tE7nyEs8GOa5DUHPjsaNlz1v
	2VpTHDBb4dG5SZ+R7Y4KCAXA753sdj24W9WgTvlD8BsPTNDBb5OivBb6O4OY6qWeitJDcnnCTqo
	QnYQIID5CH7xOusP9eybt7bIO+0utYATW3j6QQtCZePiIrSTZdnyk1K6qkZh0qjmj3cd4IIGncI
	QA0pTEAv2X2M/F/OR4vtbNyg1rfJnWt/DiLjV9+GRlzwLLiBY9tISJDGqX51BFWtj8MgreEsT7R
	y0ij9TP3aFD+pgLjuWKopVnBmrG0dkbPwaQLylOkuPyUfqGgSZi7WsswHKFhiH32OXC+XXajxca
	q0+ggW7OsSLjBDUj0D08nLHXd8AaXGhW7AGJnhse0QoN2od8nFBBsefUwnFKTj8scLrpVWzECzE
	SSa4uwCQPywLdvo0+zC4nLREOFQdXeg1ynyBSJ7wCDDIAbYx/qJmkCTlu8pNCFeadDqOmMLDd+j
	yOQttJrCJXB2SajrapKN/WF2x5fIyPpv+zAMb+WjS19vZddHefvddqBW41V/4kMAPtNJqKsjwc2
	Sr8kq1OdedXk/b6x/frPp+CqVKReQKjoin0R/eog/4pa5OsKgiKi+w24hTHgsSqm7vSUg41u3EI
	DPFjYPpZ0
X-Received: by 2002:a05:600c:3b1d:b0:4bb:6991:2330 with SMTP id 5b1f17b1804b1-4bb8881a890mr351422185e9.22.1795596322739;
        Wed, 25 Nov 2026 00:45:22 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:f368:ae2e:e717:e970? ([2a01:e0a:106d:1080:f368:ae2e:e717:e970])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a680355sm27677872f8f.27.2026.11.25.00.45.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 00:45:22 -0800 (PST)
Message-ID: <5d181d25-53ac-479b-8966-82096c53cb5f@linaro.org>
Date: Wed, 25 Nov 2026 09:45:21 +0100
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
Subject: Re: [PATCH v2 18/19] ASoC: qcom: sdw: allow LPASS_CDC_DMA_WSA_RX0 as
 soundwire dai
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261124-topic-sm8650-el2-v2-0-174e159f0f69@linaro.org>
 <20261124-topic-sm8650-el2-v2-18-174e159f0f69@linaro.org>
 <sashiko-outbox-231744@kernel.org>
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
In-Reply-To: <sashiko-outbox-231744@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/24/26 18:48, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found no new issues
> in this patch, but noticed 1 related pre-existing issue it does not
> introduce:
> - [Critical] ASoC: qcom: use-after-free in qcom_snd_sdw_startup() [1]
> --
> 
> commit 7f273de8112390d0dc0ac3f44c88e5ff3276352c
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> ASoC: qcom: sdw: allow LPASS_CDC_DMA_WSA_RX0 as soundwire dai
> 
> This commit allows LPASS_CDC_DMA_WSA_RX0 to be initialized as a SoundWire
> DAI and restricts LPASS CPU DAI ID matching to DSP bypass links so that
> overlapping DSP DAI IDs are not matched.
> 
>> diff --git a/sound/soc/qcom/sdw.c b/sound/soc/qcom/sdw.c
>> index 6576b47a4c8c3..669fb63207c91 100644
>> --- a/sound/soc/qcom/sdw.c
>> +++ b/sound/soc/qcom/sdw.c
> [ ... ]
>> @@ -71,7 +74,7 @@ int qcom_snd_sdw_startup(struct snd_pcm_substream *substream)
>>   	u32 rx_ch_cnt = 0, tx_ch_cnt = 0;
>>   	int ret, i, j;
>>   
>> -	if (!qcom_snd_is_sdw_dai(cpu_dai->id))
>> +	if (!qcom_snd_is_sdw_dai(rtd))
>>   		return 0;
>>   
>>   	sruntime = sdw_alloc_stream(cpu_dai->name, SDW_STREAM_PCM);
> 
> [Severity: Critical]
> This problem wasn't introduced by this patch, but can [1]
> qcom_snd_sdw_startup() leave dangling sruntime pointers in already
> configured codec DAIs on error?
> 
> The loop below calls snd_soc_dai_set_stream() on each codec_dai, and if
> snd_soc_dai_get_channel_map(), a later codec_dai, or
> snd_soc_dai_set_channel_map() fails, the err_set_stream path releases
> sruntime without clearing the stream pointers on the codecs that were
> already set up:
> 
> sound/soc/qcom/sdw.c:qcom_snd_sdw_startup() {
> 	...
> 	for_each_rtd_codec_dais(rtd, i, codec_dai) {
> 		ret = snd_soc_dai_set_stream(codec_dai, sruntime,
> 					     substream->stream);
> 		if (ret < 0 && ret != -ENOTSUPP) {
> 			...
> 			goto err_set_stream;
> 		} else if (ret == -ENOTSUPP) {
> 			continue;
> 		}
> 
> 		ret = snd_soc_dai_get_channel_map(codec_dai, &tx_ch_cnt, tx_ch,
> 						  &rx_ch_cnt, rx_ch);
> 		if (ret != 0 && ret != -ENOTSUPP) {
> 			...
> 			goto err_set_stream;
> 		}
> 		...
> 	}
> 	...
> err_set_stream:
> 	sdw_release_stream(sruntime);
> 
> 	return ret;
> }
> 
> Subsequent stream accesses or teardown on those codecs will then trigger a
> use-after-free on the freed sruntime.

It's not related to this serie, it deserves a separate fix.

> 
> [1] https://sashiko.dev/#/bug/linux-3eb5665f-b54d-4f37-aa26-a95e56e5e77e
> 

