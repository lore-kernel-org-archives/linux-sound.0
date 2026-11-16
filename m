Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815524;
	b=0eXMOmeAj79HXuF2J6H53qzT9zRek3dfu7JrOBV9exASvZzWFB+VHk9AF2E42YYGs5U+
	 3ZGCTn2kBFAzC9YPKAwLbVEPjqSYQcL90kkZfQC4apDJKMN2qkJbIxiiveOe9cTuXfe5J
	 9qP7wJipEfrbif4Gm+k5E4gWpKwQjx0Qb/oK0hnwE842+JFxz+fxQNhyI97/ChgCqGb1h
	 IZEAoQ36LBAulgVuLBfil9ovvlOX92FrsuSh8BkYD4JFkF5Mg8C16u7hhZ3aqTdCOgEZ4
	 gN2bJ3Slw7a2Rnm+SfKjGifOPclGxOc061B5w1O2yu2b2A55WcqW6hBZAC9j5pC0aDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815524;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:References:
	 Content-Language:Autocrypt:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=8hZ6vhqouVFsnxOc8QRDh5YUzqwcZIN12aUhWdhK9B4=;
	b=Kx/8i+1xAO6YWEsT6D8hTq9ePT/kURFvbL983ftbMDtM0HGtuOcjyiiMGV9Ugs3yTyjP
	 HS1eG6RHD1i6ZM1VauMxb7/pI6ikWWcOOCMFpAwoUJXmGxSiTf2Q5JVwYHgS991+yAxsD
	 jWsIpUQAsNc+2NoqPxvnm2awxZGD/k6ZCuiU6YAg0uZZSWiDAyQ2wdYQh+hr/nCuWc5a6
	 8m4r6nHihn1lcuXgaPIhj3IqMlVvweTvsoEJNW8zwoZVhldOXRApjlge5lLYtwBQ43Qk8
	 bDWG4eEit/udKbQejoRz+K7l3CbSOM5M1Ux/0AXTiKGfPF2lIUQnGkcQH3PeGMpnjBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Fp+8MZLR;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F385606A31C
	for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 07:52:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F385606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Fp+8MZLR
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so3255055e9.0
        for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 23:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794815521; x=1795420321; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8hZ6vhqouVFsnxOc8QRDh5YUzqwcZIN12aUhWdhK9B4=;
        b=Fp+8MZLR6uRvRI4X3ot4z4y1oHSGvKQG22CBBUSnrv5b1xUXGpQIjlVxvGlRGoit0o
         x7IvYZ8xILv8iYfyYmVIgaiArzXMMOOrw4NF9rt9pX+7KL04KZkZGxt70up95eoUTTWt
         HYUfpoheD7eNLyiG++xsBS9FgDqceoyrqNNQcmjBFMj19GExSZFWxwAttlmdGv7/zarI
         Gfb1BOVi8jyS/9YKRzJMEYgSEjjQJGgvjs9cjVZINU53C3z8q3WpVqQB7gyehOQEcu7N
         0hybdlOUQPex7mv+qbQrcoRiBEF7zLHvanT3+kFD40mU9ze9hQL53/ub8CSygmUqMk7R
         IJ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815521; x=1795420321;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8hZ6vhqouVFsnxOc8QRDh5YUzqwcZIN12aUhWdhK9B4=;
        b=UciX/bDipzdA5b+T68ED1mOq6QC3+LkSb5EOF2CZRzQ5HH7N+F/1C+5ulytqXynYFU
         W8aFzVAFeswwa+uWksgX+gR9OAtTbP3JOGm7XIIT2PJu8HWbgaBHsrakZ2n/RaKoTQUl
         m/FONxL76xf8n0JZJHzc45xz+6NnhLrRVBZIbQm7xJhEr0Ekm5c8z18fpqqg6/SE7vY8
         W9BQFNVyYmr7PNO1ERYIDFoA8D9jTJ6eUl/obEB76doX3GVbXqUFKSp8XSLirWQvi5yK
         OCIYkvNPfm6nsZTW40Xh33ps4Ff0lA8si5ZvadC4tHDQGVO8kuW4xFmAZmCQaCfXwOol
         AlOg==
X-Gm-Message-State: APuU4Z/3//JfFoSI4WamO6mAIhy0maVtoiUqAIVWzy7yKfjOQER/asj1
	B0KiRizTEBDV4wvOHpbMRvSHy5qvxsFnqJB9/U59yViv6xg1QUQgFvTbxIO5cWpAQ3I=
X-Gm-Gg: AYBFou1gtKLORWzndvl5A4CADZWt7T0zOeY7kP45ljQLRlPfORvsWBGqeRroWL/Cnl0
	kNgoj6deTXC+Yc/cJ0rO0da1WUBNJs9aoVklSMmPzqXF7VJ0gFgPzFPZNMeOvjRJd7rC6dMa4Pg
	CJNE7LPcFsgPi/Ye6bUO160+kHuNEhInf/APlyc6HJGx/WMSZi8/5mBiCCDb86cDnI1cSG9IsaK
	/F/NvOpU9VAzYH6GYth4CtT1EBYG6OjY6ve+CL00ksyOSonPpeLhTWtNcwxD5Z6GuvbXkaEUwSm
	BLgHXzXZETyUOKDewAgE8dD6i5sOTlqd/2DDEzoEZvYjpVRgMYdBGKGazqqyvdd+iPu4mprZSrt
	twYvg4k6AHYxPI6yG/e3jtydA/+pPhTOTTcVn9P234rKagFSCMNMolLXLThwCZR4isirRAP0+MO
	rg/ene1OnPJUzwmIcYcC2nBv2aoukmTHehUTS/YgAn4xdC91Zbj4sXrwl7+jF0iWqSH8g+6vHLm
	JXbBjv2Gpvq3VNoSgU+DJsshTp+VTB7k/WuxLUfrj7/MrcmmXLWIF3MhmCb5gsfNyIA6SzxqW8s
	LG0oBwxusI7/kazI/M68ljse5ywU1k9FeYIRsxjq0cD3Nm+ON+E7aqzjFWPVDCiheIbt9gc3gPq
	97zgdlSjH
X-Received: by 2002:a05:600c:3b93:b0:4bb:6f67:ca0b with SMTP id 5b1f17b1804b1-4bb6f67caf0mr75284045e9.29.1794815510779;
        Sun, 15 Nov 2026 23:51:50 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:575d:8fcf:e30d:5aed? ([2a01:e0a:106d:1080:575d:8fcf:e30d:5aed])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb732a2a9csm36296965e9.3.2026.11.15.23.51.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 23:51:50 -0800 (PST)
Message-ID: <56275bdd-e71a-4f59-8933-6a0752268fef@linaro.org>
Date: Mon, 16 Nov 2026 08:51:49 +0100
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
Subject: Re: [PATCH RFC 13/23] ASoC: qcom: lpass: support mapping I2S ports to
 multiple LPAIFs
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
 <20261113-topic-sm8650-el2-v1-13-5183f6aab9fc@linaro.org>
 <sashiko-outbox-213497@kernel.org>
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
In-Reply-To: <sashiko-outbox-213497@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 20:04, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] ASoC: qcom: lpass: NULL deref in lpass_cpu_daiops_probe() on
>    unprobed LPAIF
> --
> 
> commit 4c412765d7dfc4828c0e1ec1c2ada16e697ee595
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> ASoC: qcom: lpass: support mapping I2S ports to multiple LPAIFs
> 
> This commit adds an optional lpaif_mi2s_desc descriptor to struct
> lpass_variant so MI2S ports can be mapped to and probed across multiple
> LPAIF instances.
> 
>> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
>> index f8b9b2ec90553..411eecd9cbb93 100644
>> --- a/sound/soc/qcom/lpass-cpu.c
>> +++ b/sound/soc/qcom/lpass-cpu.c
>> @@ -1079,6 +1079,8 @@ static void of_lpass_cpu_parse_dai_data(struct device *dev,
>>   			data->mi2s_capture_sd_mode[port_id] =
>>   				of_lpass_cpu_parse_sd_lines(dev, node,
>>   						    "qcom,capture-sd-lines");
>> +
>> +			set_bit(port_id, &data->lpaif_port_enable);
>>   		} else {
>>   			dev_err(dev, "invalid dai id: %d\n", id);
>>   			continue;
>> @@ -1121,12 +1123,33 @@ static int lpass_cpu_init_lpaif(struct platform_device *pdev, int idx,
>>   	struct regmap_config cfg = lpass_cpu_regmap_config;
>>   	struct device *dev = &pdev->dev;
>>   	void __iomem *base;
>> -	int ret;
>> +	int ret, i;
>> +
>> +	/* Only probe an LPAIF if one of the port is described in DT */
>> +	if (v->mi2s_desc) {
>> +		const struct lpaif_mi2s_desc *desc = &v->mi2s_desc[idx];
>> +		bool enabled = false;
>> +
>> +		for (i = 0; i < desc->port_desc_count; ++i) {
>> +			unsigned int port_id = mi2s_port_id(desc->port_desc[i].id);
>> +
>> +			if (test_bit(port_id, &drvdata->lpaif_port_enable)) {
>> +				enabled = true;
>> +				break;
>> +			}
>> +		}
>> +
>> +		if (!enabled)
>> +			return 0;
>> +	}
> 
> [ ... ]
> 
>> @@ -1283,8 +1320,30 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
>>   
>>   		port_id = mi2s_port_id(variant->dai_driver[i].id);
>>   
>> -		drvdata->mi2s_lpaif[port_id] = &drvdata->lpaif[0];
>> -		drvdata->mi2s_intf[port_id] = port_id;
>> +		if (variant->mi2s_desc) {
>> +			unsigned int lpaif_idx, lpaif_port;
>> +			const struct lpaif_mi2s_desc *desc;
>> +
>> +			for (lpaif_idx = 0; lpaif_idx < variant->num_mi2s_desc; ++lpaif_idx) {
>> +				desc = &variant->mi2s_desc[lpaif_idx];
>> +
>> +				for (lpaif_port = 0;
>> +				     lpaif_port < desc->port_desc_count;
>> +				     ++lpaif_port) {
>> +					if (desc->port_desc[lpaif_port].id !=
>> +							variant->dai_driver[i].id)
>> +						continue;
>> +
>> +					drvdata->mi2s_lpaif[port_id] =
>> +						&drvdata->lpaif[lpaif_idx];
>> +					drvdata->mi2s_intf[port_id] =
>> +						desc->port_desc[lpaif_port].intf;
>> +				}
>> +			}
>> +		} else {
>> +			drvdata->mi2s_lpaif[port_id] = &drvdata->lpaif[0];
>> +			drvdata->mi2s_intf[port_id] = port_id;
>> +		}
> 
> [Severity: Medium]
> Can this cause a NULL pointer dereference in lpass_cpu_daiops_probe() when
> a sound card links to an MI2S DAI whose LPAIF was skipped by
> lpass_cpu_init_lpaif()?
> 
> of_lpass_cpu_parse_dai_data() only sets lpaif_port_enable for MI2S ports
> that have an explicit child node under the lpass-cpu DT node, while
> leaving child nodes optional when using the default 8-channel SD line
> configuration.  When lpass_cpu_init_lpaif() returns 0 early because
> lpaif_port_enable is not set for any port on that LPAIF, lpaif->drvdata,
> lpaif->map and lpaif->i2sctl remain NULL, and lpass_platform_init_lpaif()
> likewise skips initializing lpaif->rd_dmactl and lpaif->wr_dmactl.
> 
> However, asoc_qcom_lpass_cpu_platform_probe() still points
> drvdata->mi2s_lpaif[port_id] at &drvdata->lpaif[lpaif_idx] (or leaves it
> NULL if the DAI is not listed in variant->mi2s_desc) and registers all
> variant->dai_driver DAIs.  Unlike the platform suspend/resume paths,
> lpass_cpu_daiops_probe() and lpass_platform_pcmops_open() do not check
> whether the LPAIF was initialized before dereferencing lpaif and passing
> lpaif->map to regmap_write():
> 
> sound/soc/qcom/lpass-cpu.c:lpass_cpu_daiops_probe() {
> 	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
> 	unsigned int port_id = mi2s_port_id(dai->driver->id);
> 	struct lpass_lpaif *lpaif = drvdata->mi2s_lpaif[port_id];
> 	int ret;
> 
> 	/* ensure audio hardware is disabled */
> 	ret = regmap_write(lpaif->map,
> 			LPAIF_I2SCTL_REG(drvdata->variant, drvdata->mi2s_intf[port_id]), 0);
>      ...
> }
> 
> Checking !lpaif || !lpaif->drvdata in lpass_cpu_daiops_probe() and
> returning -ENODEV would prevent probing an uninitialized LPAIF.
> 

Will add the checks
