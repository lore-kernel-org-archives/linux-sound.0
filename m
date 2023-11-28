Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="StSWHPxl"
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2251AAB
	for <linux-sound@vger.kernel.org>; Tue, 28 Nov 2023 01:09:33 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-332eeb16e39so2059611f8f.1
        for <linux-sound@vger.kernel.org>; Tue, 28 Nov 2023 01:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701162571; x=1701767371; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ruBsZSrQwJWh8DMQKbh5iJ2P0cf6QJW5qv9vaOwvUVQ=;
        b=StSWHPxlD8xl1n8zHQSoJ05SBS2PVfTXqBTQiCoHMEp6QVWWjLwmt4uGDRrXbtypv3
         cpUS3aspuWjOqmapMSqpqISj5lExge3Cvhs11caNLgZTSjfEiTxirSKxgmynFBHM/q3b
         EU2VXWWxkLa5kRt50v0lfC9mnRil/PFjR9jzl7MORTI12yxrVw/LiD9oS116UTNtWuke
         KZUru+13JFaXvChyc992I+kI9e+FWwl0v9isURkyU5fuTCELDgnagdNZo/5fvh9wqg3g
         nh7lUD1wl0Un5gwQuXTSduDkULhn03IGiGx3DbWPdGRRbJQuCs1PI2RNRV3FfTHzeOPo
         d0NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701162571; x=1701767371;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ruBsZSrQwJWh8DMQKbh5iJ2P0cf6QJW5qv9vaOwvUVQ=;
        b=FRvDgW+/5PI1n8uv1ysoBR8Ay952hjmifF5xi/y0VfQIJolvBfhz5t1wiqKlU5X3yX
         MRRBjTjp+ou1NBZ4PQQwAf0tFPgwmbZQwUZ04K35EeZE+A3A9kjcfYY8nb5bRMaOXc3l
         cHbDFzVeUZcfJwhhjZeElWoVYhQzrpZr4oInk0gw8Gdid41FO/tYUK3xf+uaNWJlyDVu
         59FRlBEH+Wf7CLmt/z2R/D/6OnIhE5LnF2CygpzCKpuSEkqg7dl4u0ci8XNaLLkHGqD5
         zUfntfB8w2JWnpqMEths/yLPDxb+dbWpfjPOZMSsR1zI9oFMtE1vegx6LMYBRn5yHOEa
         AuPw==
X-Gm-Message-State: AOJu0YwP05fX1HDD5wSt06Lfqu2i/iqmoC7FOTBi30ztUCbNRDX1YVfv
	T1kBdri4kxD3PK/qE2dimdQxvw==
X-Google-Smtp-Source: AGHT+IF6HJ4YuzplSZALPIeQl8QyI70POmJ3I9zmAHJ1JutBV7HT0g8vyHKladOrQSsRpog4FtczQw==
X-Received: by 2002:adf:e282:0:b0:333:829:e55c with SMTP id v2-20020adfe282000000b003330829e55cmr2436057wri.10.1701162571548;
        Tue, 28 Nov 2023 01:09:31 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:eada:f40e:7ab3:2afe? ([2a01:e0a:982:cbb0:eada:f40e:7ab3:2afe])
        by smtp.gmail.com with ESMTPSA id e2-20020a5d4e82000000b0032d893d8dc8sm14369433wru.2.2023.11.28.01.09.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 01:09:31 -0800 (PST)
Message-ID: <ee3baf94-4158-4440-8d89-de39fe0aa2f3@linaro.org>
Date: Tue, 28 Nov 2023 10:09:29 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 4/5] ASoC: codecs: Add WCD939x Soundwire slave driver
Content-Language: en-US, fr
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231123-topic-sm8650-upstream-wcd939x-codec-v1-0-21d4ad9276de@linaro.org>
 <20231123-topic-sm8650-upstream-wcd939x-codec-v1-4-21d4ad9276de@linaro.org>
 <ZV+PTynfbRmF0trU@finisterre.sirena.org.uk>
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
Organization: Linaro Developer Services
In-Reply-To: <ZV+PTynfbRmF0trU@finisterre.sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 23/11/2023 18:43, Mark Brown wrote:
> On Thu, Nov 23, 2023 at 03:49:14PM +0100, Neil Armstrong wrote:
>> Add Soundwire Slave driver for the WCD9390/WCD9395 Audio Codec.
> 
>> The WCD9390/WCD9395 Soundwire Slaves will be used by the
> 
> Please avoid using outdated terminology, "device" is probably a good
> alternative here.  There are some usages in APIs that need to be updated
> but still, good to avoid where possible.

Sure, I simply kept the current Soundwire kernel terminologies,
I'll change it to Device.

> 
>> +static struct wcd939x_sdw_ch_info wcd939x_sdw_tx_ch_info[] = {
>> +	WCD_SDW_CH(WCD939X_ADC1, WCD939X_ADC_1_4_PORT, BIT(0)),
>> +	WCD_SDW_CH(WCD939X_ADC2, WCD939X_ADC_1_4_PORT, BIT(1)),
>> +	WCD_SDW_CH(WCD939X_ADC3, WCD939X_ADC_1_4_PORT, BIT(2)),
>> +	WCD_SDW_CH(WCD939X_ADC4, WCD939X_ADC_1_4_PORT, BIT(3)),
>> +	// TOFIX support ADC3/4 & DMIC0/1 on port 2
>> +	//WCD_SDW_CH(WCD939X_ADC3, WCD939X_ADC_DMIC_1_2_PORT, BIT(0)),
>> +	//WCD_SDW_CH(WCD939X_ADC4, WCD939X_ADC_DMIC_1_2_PORT, BIT(1)),
>> +	//WCD_SDW_CH(WCD939X_DMIC0, WCD939X_ADC_DMIC_1_2_PORT, BIT(2)),
>> +	//WCD_SDW_CH(WCD939X_DMIC1, WCD939X_ADC_DMIC_1_2_PORT, BIT(3)),
> 
> Why are these commented out?

Future feature support, will remove and add those on my internal TODO list...

> 
>> +static int wcd9390_interrupt_callback(struct sdw_slave *slave,
>> +				      struct sdw_slave_intr_status *status)
>> +{
>> +	struct wcd939x_sdw_priv *wcd = dev_get_drvdata(&slave->dev);
>> +	struct irq_domain *slave_irq = wcd->slave_irq;
>> +	u32 sts1, sts2, sts3;
>> +
>> +	do {
>> +		handle_nested_irq(irq_find_mapping(slave_irq, 0));
>> +		regmap_read(wcd->regmap, WCD939X_DIGITAL_INTR_STATUS_0, &sts1);
>> +		regmap_read(wcd->regmap, WCD939X_DIGITAL_INTR_STATUS_1, &sts2);
>> +		regmap_read(wcd->regmap, WCD939X_DIGITAL_INTR_STATUS_2, &sts3);
>> +
>> +	} while (sts1 || sts2 || sts3);
>> +
>> +	return IRQ_HANDLED;
>> +}
> 
> We do this in the other Qualcomm drivers but it doesn't seem ideal to
> just ignore the interrupts.

It seems we simply ignore IRQs that are not mapped in the regmap_irq,
what would be the ideal way to handle this ?

> 
>> +static int wcd939x_sdw_component_bind(struct device *dev, struct device *master,
>> +				      void *data)
>> +{
>> +	return 0;
>> +}
>> +
>> +static void wcd939x_sdw_component_unbind(struct device *dev,
>> +					 struct device *master, void *data)
>> +{
>> +}
>> +
>> +static const struct component_ops wcd939x_sdw_component_ops = {
>> +	.bind = wcd939x_sdw_component_bind,
>> +	.unbind = wcd939x_sdw_component_unbind,
>> +};
> 
> Do these need to be provided if they can legitimately be empty?

AFAIK yes, component code will crash if those are not defined.
I'll add a comment explaining whey they are no-op.

Thanks,
Neil

