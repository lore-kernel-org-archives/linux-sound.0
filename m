Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288A3425864
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 18:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784138897; cv=none; b=oC/nscO8RZsdzaHagKgVs/Yhrse864c0D6vsqTVat0JmfkBnWYbODvaUWFcKbRz8AlTYMd8befCWN7fUYAKuu9uPlK+tU0jhQMpmDRE+Q/b67odFn55/W95em3LXyeSsLbnlybMhpxwEzaGUZMWEcra+8hnoFooZOpYLEe6VCkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784138897; c=relaxed/simple;
	bh=mKIBs623jp9oil6dkw2OIDAx86ckyTenDNJ6awWuF0M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uPayFY8pfD+xxoNIQScznHc4WMyj7u5UaCiRokeXPABgLHKDUAv0FVpbCXXcIzjWJSR1P+nytcB/Eoex9/WlcspCoE//0HKe6QGQGpL3216+WeDFWNRPBaGcR8p57XGIMedBP9Or7Fu78UDU88ARZ7JySBKyoVli6EaSHo7OmN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NT0pazKg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TwckjlRo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NT0pazKg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TwckjlRo"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FHBJm41287639
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 18:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4EnkQlStKJrYtpsK0JQwA93q3Oyoc0ORGYNf/iLoitY=; b=NT0pazKg/IrAxKtL
	WvtsmjqL56BHpjsAj+ReAUtkZiCixk3zbwdhsaqhSgdAUMUahOFWfDSzvDJBuKh+
	BPd4ZYaKRWW0wkUXU6DcWOrYw6ElM6CW6Z49AY6cm5Vd1Nzf5PcZIwRcjMyo46PZ
	6eC8pjZmP5Au4xOeHH7LdVgcU6Bt6frj5PuDr0sI8N/HJhScpKvONW06CYsow1Zi
	9HcbhuFjQAOO7UDpmWKPFYydgAkPmohtGqPbiNgbSZvUDedZ5cH3gmfKZU5ZuzIw
	FoLmLCTxyydI7kxZ0ODnQ/v1LK86h9Vrit3RE7h1VyPQYSxAV+WEXVpXRpQ+MnK2
	X5y57g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe68wtkaj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 18:08:11 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84870e7f498so6616477b3a.3
        for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 11:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784138890; x=1784743690; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4EnkQlStKJrYtpsK0JQwA93q3Oyoc0ORGYNf/iLoitY=;
        b=TwckjlRocGqHIvbkCmJZYVamVzNezfsV3GFqFfLiWn//rxpS4Nv2JoeIYUYYGqui26
         UkZTJz7usWjDleYlDJFAPqA/CeHV69R7fvSvz107djc1eo8UyPV/hPD2Ug+uTeAWVqAa
         05Wg9qyCkFBvXiY9gToN+jpBavsgYYfAyId/IIp1lRS2piRSvdjxUVa7w3cNjGzxMs3C
         MYlPLuMKql3dOEA7r+5aWlv/rLsZKpyJzgbdW6vY+42azPlFtINRHhskCmydQyZ/1iST
         2O5zDpeaKBSpaRJzswA6QAy8NlmEQLevKKTTKqZgzs/tNAmINSAD2NmCG+GAAxQMe5dG
         UdyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784138890; x=1784743690;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4EnkQlStKJrYtpsK0JQwA93q3Oyoc0ORGYNf/iLoitY=;
        b=KAly88gTjli+X0Cj8lwB7iemmSN4nFTNUOM9EuqPVc6sPbIfoQxu+we+d+X6IZH38d
         JWRwNqmA+9Ke0BTg/bii+PzsALCwysui0R3WKMB3Y7JWgds+QCaXgbmgYjJTqbpR6zah
         jZbsjaaWQsCO67spZV18FihXaRPLX212ziiZKlPqddzQvp+5yPdH8Dml3bNdbQB+iJAJ
         wD6mg4RfDLJJf36zFKj0A1OOfZd6r122B424DtRafxNOOoUAsYQb+BlwrKycnVxyHlaJ
         u//mqUoZeJqV8wQ75V/TZmYOzJfs77MP+W0mS4FnoK+JDD6ImQHvJNLwd+tEGFL/6HoN
         i/fw==
X-Forwarded-Encrypted: i=1; AHgh+Rq3yffL4Qwfu0GL6gFaSFB065z3dTRqrqrPeQNoLvP8FKa+neHVx7MpnfYihBFXVFE/s8WbKviRPq1H8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrqpdG4uEIgLZOJFlUAOkRcvDJlUgB0cRZONvVaBRVPhETbKqV
	lLdGJGZoyrhw05lT139GTWxZTIvxvprblYlCfRM4WqiBg2+A3tQR6nP90ijBv6va7R4PhR3zPB7
	kqGo3ClK2sxsDGXtw6G3GijKIISjmbIJGMQWOhI2VF8T7H4kUO5NRVbEalxl/rijj4Q==
X-Gm-Gg: AfdE7clUGLUaXCogwtUp/cJXNQiMzXblNDNbwyUUmLDwpN1I6TeSdUaZfuiDkZeX+pw
	4FqkHkBuyyUXkIEOMY9JBKFPlEk2B+Qq98KPue9knrs/sDfeEJrq/zibo+BAlzoFZ8m4JOli2jJ
	+loSENOZ0Pi1+cnt/CyAxjH0j+2X8nL+QxBoWreVtVNY02XbDniQd0QWnEx76TVp3fPX5DPOyOH
	f2n7g4W7yRJNggBFvg8n3zg+HgfgcAPkc6wprLDNH3lApoLY8ci919d97bufqW0Cr0ZJ/vDVYnT
	x41/IaPz78DiFurt6hwi78vgzdSoe/qLJ4c7Ujpdruhe9BzbO1iDV8+g9+3QIVTDj/WSdWD00vy
	AXIbORAbPdfS/WdChhzsgDrHJgDb2HYrIhXIz9B2TwvXL32SkvA==
X-Received: by 2002:a05:6a20:cc0e:b0:3c0:9c19:65a0 with SMTP id adf61e73a8af0-3c36c44c6f2mr3864088637.72.1784138890302;
        Wed, 15 Jul 2026 11:08:10 -0700 (PDT)
X-Received: by 2002:a05:6a20:cc0e:b0:3c0:9c19:65a0 with SMTP id adf61e73a8af0-3c36c44c6f2mr3864037637.72.1784138889706;
        Wed, 15 Jul 2026 11:08:09 -0700 (PDT)
Received: from [192.168.1.5] ([122.164.226.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd432e848sm3411187c88.9.2026.07.15.11.08.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 11:08:09 -0700 (PDT)
Message-ID: <847396bb-2cc1-4f45-bd81-33ab55d3af6f@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 23:38:00 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] ASoC: qcom: sc8280xp: Add RubikPi 3 sound card
 support
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>,
        Katsuhiro Suzuki <katsuhiro@katsuster.net>,
        Matteo Martelli <matteomartelli3@gmail.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Srinivas Kandagatla
 <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Roger Shimizu <rosh@debian.org>, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260715-rubikpi-next-20260605-v2-0-67601d7a8581@thundersoft.com>
 <20260715-rubikpi-next-20260605-v2-5-67601d7a8581@thundersoft.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20260715-rubikpi-next-20260605-v2-5-67601d7a8581@thundersoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0vq3jFtu7Aym067090ASRVgTiuFVbRrs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDE4MCBTYWx0ZWRfX9WJYKnNpB4M7
 4hHY388CK1U+LxuQM3LT4/5Z7NZ66LAiNC95w9bZBgJuS9h+UCd+oj5tOAcjahZs/eWk9QfKvJk
 meYTb/+E+Jdkrxcx4Kv6uIrGsK8PSanuQwJm2LJ5yDryz1rcA5JR032AL9YBatCAtPTbrWsAEsI
 V3IMBS1CZUBKHpPs68+wzcliGThriOCBMQUD0cbVwAmRA06Lh6qmCZ7nxo3dWJvZHgiLnF3fzdr
 JGkK04Rw2f8HzWwsChvtdGAHCMfTKYQiUbh2TqaUulkg1tazhkU8vc5WV/ZHCKtgQhcAwQDGDWG
 u50egxLXjCTj0jHjWHaFLp0dPXDN48mh0WMEKGg9L4l/tpGfbOANv0LwHtIImGim4IYIQRLPOoi
 /z8d8Ay1498NOH180xrxb6gEzqDjCvFl1wRr0qbRDgzN3AKR6lVemw2CIyQ49AoKjWcQs3+MrJs
 gXAxV/YsLbbmnzn804w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDE4MCBTYWx0ZWRfXz2JFC97M91m7
 0+1wa8R4IehhA0fimVDp09VJQAm1WfeTL4jtEvIznhJcYTV+HJ5UWb6VF8z9gA7E7ZcM/4oHoDn
 23HvDDFK4pigCtmdgUYMy2LEkU6U9T8=
X-Authority-Analysis: v=2.4 cv=LbgMLDfi c=1 sm=1 tr=0 ts=6a57cc8b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=n9TYrBAzqQq97mF55NlG6Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=Wdb1h0LgAAAA:8 a=0ecicO8UAopkaP5Vd3UA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=j5gyrzqu0rbr1vhfHjzO:22
X-Proofpoint-GUID: 0vq3jFtu7Aym067090ASRVgTiuFVbRrs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150180



On 7/15/2026 7:32 PM, Hongyang Zhao wrote:
> RubikPi 3 connects an ES8316 codec to the primary MI2S interface for
> headset playback and capture, and an LT9611 bridge to the quaternary
> MI2S interface for HDMI audio.
> 
> Add board-specific DAI data for these links. Configure both directions
> of the primary interface for I2S with normal clock polarity and the
> codec as bit and frame clock consumer. Program the LPASS MCLK and BCLK,
> drive the ES8316 with its required 19.2 MHz MCLK, and enable the generic
> codec jack-detection setup on the playback link.
> 
> Configure the quaternary playback link with the same I2S clock format.
> Do not request a codec sysclk for this link because the LT9611 HDMI
> codec DAI does not implement set_sysclk().
> 
> Select this configuration through the RubikPi 3 sound-card compatible.
> 
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> ---
>   sound/soc/qcom/sc8280xp.c | 39 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 39 insertions(+)
> 
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index 885ec1e3e575..1354eecb56c9 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -410,6 +410,41 @@ static const struct snd_soc_common qcs6490_priv_data = {
>   	}),
>   };
>   
> +static const struct snd_soc_common qcs6490_rubikpi3_priv_data = {
> +	.driver_name = "qcs6490",
> +	.dapm_widgets = sc8280xp_dapm_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
> +	SC8280XP_DAI_DATA(

Where is SC8280XP_DAI_DATA() defined?

> +		{
> +			.id = PRIMARY_MI2S_RX,
> +			.codec_dai_fmt = SND_SOC_DAIFMT_I2S |
> +					 SND_SOC_DAIFMT_NB_NF |
> +					 SND_SOC_DAIFMT_BC_FC,

codec_dai_fmt appears to be identical for all MI2S DAIs. Can this be 
moved into the common initialization path instead of being specified per 
DAI.

> +			.mclk_rate = 19200000,

Is this mclk frequency fixed ?

Typically, audio MCLK is expected to be 12.288 MHz or 24.576 MHz.

> +			.codec_sysclk_set = true,
> +			.mi2s_mclk_enable = true,

Drop this mclk_enable flag; your already enabled from the codec node.

is not ?

+&i2c0 {
+	status = "okay";
+
+	es8316: audio-codec@11 {
+		compatible = "everest,es8316";
+		reg = <0x11>;
+		#sound-dai-cells = <0>;
+
+		clocks = <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "mclk";
+

> +			.mi2s_bclk_enable = true,
> +			.jack_setup = SC8280XP_JACK_SETUP_CODEC,

.jack_setup is not part of snd_soc_common

Best regards,
Rafi

> +		},
> +		{
> +			.id = PRIMARY_MI2S_TX,
> +			.codec_dai_fmt = SND_SOC_DAIFMT_I2S |
> +					 SND_SOC_DAIFMT_NB_NF |
> +					 SND_SOC_DAIFMT_BC_FC,
> +			.mclk_rate = 19200000,
> +			.codec_sysclk_set = true,
> +			.mi2s_mclk_enable = true,
> +			.mi2s_bclk_enable = true,
> +		},
> +		{
> +			.id = QUATERNARY_MI2S_RX,
> +			.codec_dai_fmt = SND_SOC_DAIFMT_I2S |
> +					 SND_SOC_DAIFMT_NB_NF |
> +					 SND_SOC_DAIFMT_BC_FC,
> +		}
> +	),
> +};
> +
>   static const struct snd_soc_common qcs8275_priv_data = {
>   	.driver_name = "qcs8300",
>   	.dapm_widgets = sc8280xp_dapm_widgets,
> @@ -480,6 +515,10 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
>   	{ .compatible = "qcom,sm8550-sndcard", .data = &sm8550_priv_data },
>   	{ .compatible = "qcom,sm8650-sndcard", .data = &sm8650_priv_data },
>   	{ .compatible = "qcom,sm8750-sndcard", .data = &sm8750_priv_data },
> +	{
> +		.compatible = "thundercomm,qcs6490-rubikpi3-sndcard",
> +		.data = &qcs6490_rubikpi3_priv_data,
> +	},
>   	{}
>   };
>   
> 

