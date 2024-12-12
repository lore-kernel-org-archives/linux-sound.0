Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57276222D52
	for <linux-sound@vger.kernel.org>; Thu, 12 Dec 2024 17:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734024040; cv=none; b=cQEURuM3uKoCNPLi1Ksx/egfGhqBShEkA/kheatD1096sECmpn1Fphmir8jC6ZLs4z0GOCTconXr24uXjlve1VynOWWEPmMhacuH2/BifKlt64VWSHaEquMTz3XJNt1PBLUnh3h4SJNJhvhg0aLshkYIoskSX+DOd+47YDL7VGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734024040; c=relaxed/simple;
	bh=wVldXEGvzH1k7BfnFQuOJJ+F7XR5my/3uSlz2+Z8LzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YYQU6pPkhER6Y6qVcqgrsTTelQNvVWwGg31dV3lRNYuBxmrWz0j/GF/NCLY2jZDEcioji8c9B9qUP/4zK44hIffCtf5sgmUZttnNdbZGTHFl50CjDj4ygC+VBq8tA5qt+DZKtjXhIu3pgYMXQMR7L4M/gxXNxkx3GeXp0CTd4PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SRnNMPmW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SRnNMPmW"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCCwqQC000445
	for <linux-sound@vger.kernel.org>; Thu, 12 Dec 2024 17:20:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0Kx1TU4YS8jObM52KPLjLHbZ3qgoPlP9G8kSo38Mghs=; b=SRnNMPmWWkK+KGqP
	w+13WrlVEJmGIsFmAUkEnUj55PUpcA6b9YYXvGa27YXABHi2bjl/IUPc9zRBOk4r
	wwhNU4Ir7IdCFBP3fSaHn6whUFZwCHlqjX/pAKa+TyNs9aLQznB2Tlp/elRBlgNO
	OOQ1LSrNOGTtuchqcBFGK+SxzhbJ2whQJM+0VxOsJxWBkFwaWcNoBOO13Jxh+XXO
	sFafjjDYZkf08j2mOs57hLVA+uA1Tplw3eSOCO704a42Pm0DvtXxKqCsTPobiZ2W
	zabGIfGEBEapU3nuQsxqglg2HsbrhJLO8MO52Twdhmds+WLOuzMbsx20ozlCSDK4
	arnzoA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fqes27f9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 12 Dec 2024 17:20:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7b66edf3284so2168385a.2
        for <linux-sound@vger.kernel.org>; Thu, 12 Dec 2024 09:20:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734024036; x=1734628836;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Kx1TU4YS8jObM52KPLjLHbZ3qgoPlP9G8kSo38Mghs=;
        b=CLojfMGTh9zUmwXSok8jNaB9IVW7wz/uQycmfhPcTUGi3j8uufmVakGxzDpFbvC7LX
         ArHHYbL2duiVUFGuFsqf3QtnzsFEo42rscODdjGukB8/eECwvvVBYEde2AS2dcNlKRgO
         jjG0Bh+k+84i7N5erul20ixnp/oGMuuGjNc74Eqot6rW3sHgRKAOZ38ZRG7edZ/l5IJG
         5toXoW0Yw0JLOViTqvISTDZFXhcuF1FsaPH4tLoJ2lIjL0IOL4oHUpCLI8bivzXk3+w9
         CLjIYIRWDkCdUcCZnTOMzHh4UjsgtFHdCWa0TkVP3+P6LsXHMDlpJ0Y5HtWADBT8iPfo
         EE1A==
X-Forwarded-Encrypted: i=1; AJvYcCUwazv8uRQwA6QfiU/4W274GDmrgz3iC5ljB+NrR097uPa18C1FhbQ+JpcbYt0jdE7uZnhEWTkLCNruMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNy1Ee3HExSbaL9/1RKANWZwHv2zvOR0eKw/OCrannrTJfkiMX
	07C5fGkP8qapPOOiUwTsrVb5CEzacmkD1B8YMn/dv9VyUUosyPAolnrEUxcGKVOwEJu5zvPqGv4
	2Qx9F/9VXNyKLZyDAybhw4d7Yt7IuR/kDFgb7F0kgYvdE+nE4f9iBnhqRl5NnAQ==
X-Gm-Gg: ASbGncvrRi41eP2P7u+Du/rOaPC3KVsVc+kRgnrNpW5u9SGaEzrTi6FzY+8nKp4bZLv
	ZPCP9Hr0apaNAEDbmvU3J0ZJTxyNsNq5D9JKyyeYv8HfDGtRcpbl45Y/7sBZfGIf7+g+UIOKtcX
	0hOYw2Yu0Fw3Tlj3KBkrTNH0h3LevKV3X8WrHDsXuK4EujR5p/5tgJyLJG1A2goj01+ilC2KUr6
	bt32bMWE6+7sakNCOh3vXAzUpa4mzA86EQDKhv89+1xIzVLSHEyf+GNKQFdrmP7VMbdUoHrtl3M
	sevWky5UOGrAM5S6i29yKIHIyjA1N18wY/MpMg==
X-Received: by 2002:a05:620a:460c:b0:7b6:e196:2219 with SMTP id af79cd13be357-7b6f88ed8c5mr67432385a.2.1734024036073;
        Thu, 12 Dec 2024 09:20:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGicxkJf3ENFhs4jDVWOE8vh5/6sw8tekuW8ZQkM73188uhx/Pnj1T+/I1+utYPkNjFa46aJA==
X-Received: by 2002:a05:620a:460c:b0:7b6:e196:2219 with SMTP id af79cd13be357-7b6f88ed8c5mr67429385a.2.1734024035567;
        Thu, 12 Dec 2024 09:20:35 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6a7e199aasm366108666b.28.2024.12.12.09.20.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 09:20:35 -0800 (PST)
Message-ID: <70647a37-6196-4179-803d-35add798fa0b@oss.qualcomm.com>
Date: Thu, 12 Dec 2024 18:20:32 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/14] ASoC: codecs: wsa881x: split into common and
 soundwire drivers
To: Alexey Klimov <alexey.klimov@linaro.org>, broonie@kernel.org,
        konradybcio@kernel.org, konrad.dybcio@oss.qualcomm.com,
        andersson@kernel.org, srinivas.kandagatla@linaro.org
Cc: tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.baryshkov@linaro.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241212004727.2903846-1-alexey.klimov@linaro.org>
 <20241212004727.2903846-8-alexey.klimov@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241212004727.2903846-8-alexey.klimov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _QZ4ri_ypAt__QhXg8AUjNEF7-zub4aV
X-Proofpoint-ORIG-GUID: _QZ4ri_ypAt__QhXg8AUjNEF7-zub4aV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 priorityscore=1501 bulkscore=0 phishscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120124

On 12.12.2024 1:47 AM, Alexey Klimov wrote:
> This is required in order to introduce wsa881x driver that works
> in analog mode and is configurable via i2c only.
> Functional changes, if any, are kept to be minimal and common
> parts or parts that can be shared are moved into wsa881x-common
> helper driver.
> The regmap config structure now contains 0x3000 offset as required
> by soundwire spec.
> 
> While at this, also fix the typo in WSA881X_ADC_EN_SEL_IBIAS
> register name and rename wsa881x_set_sdw_stream() to
> wsa881x_set_stream().
> 
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

[...]

> +
> +int wsa881x_digital_mute(struct snd_soc_dai *dai, int mute, int stream)
> +{
> +	struct snd_soc_component *component = dai->component;
> +
> +	if (mute)
> +		snd_soc_component_update_bits(component,
> +					      WSA881X_SPKR_DRV_EN, 0x80, 0x00);
> +	else
> +		snd_soc_component_update_bits(component,
> +					      WSA881X_SPKR_DRV_EN, 0x80, 0x80);

mute ? 0x00 : BIT(7)

you can even return it for good measure

> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(wsa881x_digital_mute);
> +
> +void wsa881x_init_common(struct wsa881x_priv *wsa881x)
> +{
> +	struct regmap *rm = wsa881x->regmap;
> +	unsigned int val = 0;
> +
> +	/* Bring out of analog reset */
> +	regmap_update_bits(rm, WSA881X_CDC_RST_CTL, 0x02, 0x02);
> +
> +	/* Bring out of digital reset */
> +	regmap_update_bits(rm, WSA881X_CDC_RST_CTL, 0x01, 0x01);
> +	regmap_update_bits(rm, WSA881X_CLOCK_CONFIG, 0x10, 0x10);
> +	regmap_update_bits(rm, WSA881X_SPKR_OCP_CTL, 0x02, 0x02);
> +	regmap_update_bits(rm, WSA881X_SPKR_MISC_CTL1, 0xC0, 0x80);
> +	regmap_update_bits(rm, WSA881X_SPKR_MISC_CTL1, 0x06, 0x06);
> +	regmap_update_bits(rm, WSA881X_SPKR_BIAS_INT, 0xFF, 0x00);
> +	regmap_update_bits(rm, WSA881X_SPKR_PA_INT, 0xF0, 0x40);
> +	regmap_update_bits(rm, WSA881X_SPKR_PA_INT, 0x0E, 0x0E);
> +	regmap_update_bits(rm, WSA881X_BOOST_LOOP_STABILITY, 0x03, 0x03);
> +	regmap_update_bits(rm, WSA881X_BOOST_MISC2_CTL, 0xFF, 0x14);
> +	regmap_update_bits(rm, WSA881X_BOOST_START_CTL, 0x80, 0x80);
> +	regmap_update_bits(rm, WSA881X_BOOST_START_CTL, 0x03, 0x00);
> +	regmap_update_bits(rm, WSA881X_BOOST_SLOPE_COMP_ISENSE_FB, 0x0C, 0x04);
> +	regmap_update_bits(rm, WSA881X_BOOST_SLOPE_COMP_ISENSE_FB, 0x03, 0x00);

All these could use some #defines..

> +
> +	regmap_read(rm, WSA881X_OTP_REG_0, &val);
> +	if (val)
> +		regmap_update_bits(rm, WSA881X_BOOST_PRESET_OUT1, 0xF0, 0x70);

And this, a comment..

> +
> +	regmap_update_bits(rm, WSA881X_BOOST_PRESET_OUT2, 0xF0, 0x30);
> +	regmap_update_bits(rm, WSA881X_SPKR_DRV_EN, 0x08, 0x08);
> +	regmap_update_bits(rm, WSA881X_BOOST_CURRENT_LIMIT, 0x0F, 0x08);
> +	regmap_update_bits(rm, WSA881X_SPKR_OCP_CTL, 0x30, 0x30);
> +	regmap_update_bits(rm, WSA881X_SPKR_OCP_CTL, 0x0C, 0x00);
> +	regmap_update_bits(rm, WSA881X_OTP_REG_28, 0x3F, 0x3A);
> +	regmap_update_bits(rm, WSA881X_BONGO_RESRV_REG1, 0xFF, 0xB2);
> +	regmap_update_bits(rm, WSA881X_BONGO_RESRV_REG2, 0xFF, 0x05);
> +}
> +EXPORT_SYMBOL_GPL(wsa881x_init_common);
> +
> +int wsa881x_probe_common(struct wsa881x_priv **wsa881x, struct device *dev)
> +{
> +	struct wsa881x_priv *wsa;
> +
> +	wsa = devm_kzalloc(dev, sizeof(*wsa), GFP_KERNEL);
> +	if (!wsa)
> +		return -ENOMEM;
> +
> +	wsa->dev = dev;
> +	wsa->sd_n = devm_gpiod_get_optional(dev, "powerdown",
> +					    GPIOD_FLAGS_BIT_NONEXCLUSIVE);
> +	if (IS_ERR(wsa->sd_n))
> +		return dev_err_probe(dev, PTR_ERR(wsa->sd_n),
> +				     "Shutdown Control GPIO not found\n");
> +	/*
> +	 * Backwards compatibility work-around.
> +	 *
> +	 * The SD_N GPIO is active low, however upstream DTS used always active
> +	 * high.  Changing the flag in driver and DTS will break backwards
> +	 * compatibility, so add a simple value inversion to work with both old
> +	 * and new DTS.
> +	 *
> +	 * This won't work properly with DTS using the flags properly in cases:
> +	 * 1. Old DTS with proper ACTIVE_LOW, however such case was broken
> +	 *    before as the driver required the active high.
> +	 * 2. New DTS with proper ACTIVE_HIGH (intended), which is rare case
> +	 *    (not existing upstream) but possible. This is the price of
> +	 *    backwards compatibility, therefore this hack should be removed at
> +	 *    some point.
> +	 */
> +	wsa->sd_n_val = gpiod_is_active_low(wsa->sd_n);
> +	if (!wsa->sd_n_val)
> +		dev_warn(dev,
> +			 "Using ACTIVE_HIGH for shutdown GPIO. Your DTB might be outdated or you use unsupported configuration for the GPIO.");
> +
> +	dev_set_drvdata(dev, wsa);
> +	gpiod_direction_output(wsa->sd_n, !wsa->sd_n_val);
> +
> +	*wsa881x = wsa;
> +
> +	return 0;

There's no usage of wsa881x, so you can drop this dance

Konrad
