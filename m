Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792487978;
	b=w4WnqD4ATDcCUkksaKdoFTrkjOFreAt7Zb/rIiMZnUAvia29G+IA7XmuKAoheuD+YTf0
	 LpLEPysM2u2T4KuKYh/9kRXj4xc0soS8MwQnWsQzt8UuF4ot7AqIwglmJBj8sjIqx7bU9
	 vK3PtRd8MwilXu9pnZPUXP7aEBBml4DX5V2qarc67vzYDIgSMgWOLBHId7A2EZSFYFIVM
	 yz3yXOVOyDc/J7MRp7S3VCmlp/BCHquey+en9Natcf8QaPBQjpwInzABsy907ZZaQK6Xi
	 RwIMnwbT+fvJyOjwGr6IuNSy2qS6eQFenjBWRHF911OiY0DARQKVD6QLV6sAoL1cgNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792487978;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=JGq046gGXw4XcOdGnSEHgJIR2O0gujEWvtIf5Ag1ia0=;
	b=45YIoSNdHr4yI6jPbGby1I3nLiz3kB3tCWBvzb0hpAUdPUtP0ubnIrJwPuhXVyW+u3HH
	 akXQ9AYtBD0SrqwsXN2b9/GTRiW/WIDeNhxf36SkABYq/7rjbxQC6SZl1Bsxo2z/qlvUC
	 0RgIN/6WliaB0KHVMRGYHxU5h/BPA6jMfeDT/ZwrSNTZtocA1yYCCBW34plxa67IacrYa
	 xYwXtaltn4rs3WGC7VyH+NF0oxIpE8IDmazm1Bz9ZMLEAxQa17L7i1Fsxoocunkna57EV
	 l8GlosE9gj7YrtsrHwEfzAbbunFIcwlVHLCKDxJx5I+DdR5UJpUyTqwh7WCKSIWWqLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="ZvoC/0Hj";
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F6C606A31E
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 09:19:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19F6C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZvoC/0Hj
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso1895768f8f.1
        for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 02:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792487976; x=1793092776; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JGq046gGXw4XcOdGnSEHgJIR2O0gujEWvtIf5Ag1ia0=;
        b=ZvoC/0HjoWQBe6v4RhWlvN8gU1HwGS3CXsFeZbO9CKrYN76M87wee0pPAkvi3zWerB
         5gbyQCOC4M32KxMEbgF11ebqOvSHUnLNEK3oGaKiw/XUY6VdqRMHSijI2S0xJu6e/6n2
         4QI4NicD7mO6c51s6t8+jOaoGHYam10T2WhM4xRO9RpH/CZC+SHMlZRilh0pbhkT4koW
         Icn25SHGSLXG2rV6FXIoSwoROrRtXxGnufkJqNquKjOVxPzC+bwaXpYZNNEBm4sPtinz
         nwjDdZXQduUeK8bzZPNxIuBsFxCR/YDyVYtsWi9HpsCPzAZjw5A86NjCDccgQeav4zik
         tn/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792487976; x=1793092776;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JGq046gGXw4XcOdGnSEHgJIR2O0gujEWvtIf5Ag1ia0=;
        b=iqQDwRbGS97jBx+dC7+Ej43EIeRrp5NjM92Us+S+HWz6X9BQDT2hLcmlVbj8eMo7q3
         Oot/bk3sWw0VU7Tj3FabNMr4gI8shXO/D6JZArx7h5xhk9DA5DGDRXcq9uKse5Bsu2id
         FwuuD0aOTCDvOqmu9qv59eeWiJtUjIqBGGwp6ztLcq3Wj54oiHSQkkbDYk0IsV1SO74x
         1lnsTVOYXmKsNMCEZibFGvIV7n4dTxMyZiy8kueBPs9b4SrvMAnwo212XMBC/vNGunUh
         VMamixIGV7bsNTxZ0Y3HyBbm4HA8j4n1i9RvCHQp2t9qfwefdSZgvvNRu9yI9RqY0buL
         GYRA==
X-Forwarded-Encrypted: i=1; AKwUvBwC4LBIA9tj3y5PLcJdF7G9oYNGZL+6H4Pa0um5yh9F86It9JBer9NtEK+mlXeGZDWvU++RR19cGvRb4Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYKVn0vCyISEnF+j8t7ScCMVy5uB5GJt5BwrGX6iaDUKk9Jhl+6m
	AW+jr8gdLJNvGXKYCSfWNp82r3BDCjvI3BCcJln2sUrTvALN971vfpOzRkmV1+JIs3A=
X-Gm-Gg: AYBFou2KEOOCo+a5mtmdUuf1z0vNeq3DyrFKAzvI5eHr1zsaVbt8q4U9WxoYT2sekzB
	V3lMtt3wvp2t19+sHcgrXqRd0g/7djPXpzWMN4a6588eZtWNH3XiQg6B9Td/LQU5votl5Iil/4/
	YrEiz3j6tmZteAZFecIZlkd1YlvFbT14jcH83/wbvXWMjBInDwqrrmFocHuUsly38GUO5KtNgY3
	dsjQoWOlsbDxXn2q39pxNdr5sl8h301bhOQMYHMNhlSGpakz8FuTp2aPV5o1MTIVCzQa/MNP37l
	nEg4BdKuK7QYy37nsrkoMwzKoOzfwIrl7xa9nCuXGl5aOaK/vH+uWOM5GIdO3a9KMvbfouXVTmE
	edLzJ224nN2GVepvlnHBop8Gl+68/Ryrj6/LXAzLS5UKcdmLgFe6zGKBV89RFi3XXek4OGMhAJg
	VzlC1qaqJBRbfo69+TEA9FnMeO8I/5uw75Wd9ZZYRPfrf8gLDCPOMbuIWAfQbooZhuce34AoTfe
	Yx0ph+nkxvocI0Cyyz+9uRyM6RLGXrCSz56/3y3WO1Wli2+gxBlIA==
X-Received: by 2002:adf:e19a:0:b0:48e:6f:a9c1 with SMTP id ffacd0b85a97d-48e07fa6ffamr21235031f8f.54.1792487976218;
        Tue, 20 Oct 2026 02:19:36 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:e3a1:1a65:a394:be54? ([2a01:e0a:106d:1080:e3a1:1a65:a394:be54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d8208b1sm5114545f8f.33.2026.10.20.02.19.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 02:19:35 -0700 (PDT)
Message-ID: <9bf6d1b1-d287-49bf-9755-a3ce42b85823@linaro.org>
Date: Tue, 20 Oct 2026 11:19:34 +0200
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
Subject: Re: [PATCH v2 4/4] ASoC: codecs: wcd939x: fix ref leak and NULL deref
 with USB-C audio
To: Val Packett <val@packett.cool>, Srinivas Kandagatla <srini@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261020082631.1509275-1-val@packett.cool>
 <20261020082631.1509275-5-val@packett.cool>
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
In-Reply-To: <20261020082631.1509275-5-val@packett.cool>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/26 10:26, Val Packett wrote:
> Some code issues were found during review of a port of typec code from
> wcd939x to wcd937x, pointed out by sashiko-bot:
> 
> * wcd939x->wcd_mbhc may be accessed by the typec callbacks which are
>    independent of the ASoC codec lifecycle, don't leave it as NULL/PTR_ERR;
> * wcd939x->typec_switch reference was leaked on unbind, put it there;
> * the device_node reference returned by of_graph_get_remote_node() was
>    being leaked, add a __free annotation to the declaration.
> 
> Fix them in wcd939x as well.
> 
> Cc: stable@vger.kernel.org
> Fixes: 10f514bd172a ("ASoC: codecs: Add WCD939x Codec driver")
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>   sound/soc/codecs/wcd939x.c | 18 ++++++++++++++----
>   1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
> index 26fe0b6313cd..56e041e70fd4 100644
> --- a/sound/soc/codecs/wcd939x.c
> +++ b/sound/soc/codecs/wcd939x.c
> @@ -2466,6 +2466,7 @@ static int wcd939x_mbhc_init(struct snd_soc_component *component)
>   {
>   	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
>   	struct wcd_mbhc_intr *intr_ids = &wcd939x->intr_ids;
> +	struct wcd_mbhc *mbhc;
>   
>   	intr_ids->mbhc_sw_intr = regmap_irq_get_virq(wcd939x->irq_chip,
>   						     WCD939X_IRQ_MBHC_SW_DET);
> @@ -2482,9 +2483,12 @@ static int wcd939x_mbhc_init(struct snd_soc_component *component)
>   	intr_ids->hph_right_ocp = regmap_irq_get_virq(wcd939x->irq_chip,
>   						      WCD939X_IRQ_HPHR_OCP_INT);
>   
> -	wcd939x->wcd_mbhc = wcd_mbhc_init(component, &mbhc_cb, intr_ids, wcd_mbhc_fields, true);
> -	if (IS_ERR(wcd939x->wcd_mbhc))
> -		return PTR_ERR(wcd939x->wcd_mbhc);
> +	mbhc = wcd_mbhc_init(component, &mbhc_cb, intr_ids, wcd_mbhc_fields, true);
> +	if (IS_ERR(mbhc))
> +		return PTR_ERR(mbhc);
> +
> +	/* May be accessed by platform dev typec callbacks, only set if valid */
> +	wcd939x->wcd_mbhc = mbhc;
>   
>   	snd_soc_add_component_controls(component, impedance_detect_controls,
>   				       ARRAY_SIZE(impedance_detect_controls));
> @@ -2499,6 +2503,8 @@ static void wcd939x_mbhc_deinit(struct snd_soc_component *component)
>   	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
>   
>   	wcd_mbhc_deinit(wcd939x->wcd_mbhc);
> +	/* May be accessed by platform dev typec callbacks, clear */
> +	wcd939x->wcd_mbhc = NULL;
>   }
>   
>   /* END MBHC */
> @@ -3171,7 +3177,7 @@ static int wcd939x_populate_dt_data(struct wcd939x_priv *wcd939x, struct device
>   {
>   	struct wcd_mbhc_config *cfg = &wcd939x->mbhc_cfg;
>   #if IS_ENABLED(CONFIG_TYPEC)
> -	struct device_node *np;
> +	struct device_node *np __free(device_node);
>   #endif /* CONFIG_TYPEC */
>   	int ret;
>   
> @@ -3434,6 +3440,10 @@ static void wcd939x_unbind(struct device *dev)
>   	put_device(wcd939x->txdev);
>   	put_device(wcd939x->rxdev);
>   	component_unbind_all(dev, wcd939x);
> +#if IS_ENABLED(CONFIG_TYPEC)
> +	if (wcd939x->typec_analog_mux)
> +		typec_switch_put(wcd939x->typec_switch);
> +#endif /* CONFIG_TYPEC */
>   }
>   
>   static const struct component_master_ops wcd939x_comp_ops = {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
