Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98B93EA94A
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 06:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784012044; cv=none; b=oDRkUYUeKvNeYgsVTG8ol4ZGizJkspPWTjekjW/VDqcaUF3dyxoQ/7VxD0SkDnsRX3GWKs7usSC0UcGXVr7VCptijsispW2o8fkBL4jLKyoskqY0y9U8O2ezvmawG86fiUeMzrGkewu/1hpbxA+h0j51dInhM24+BuCed5/9F4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784012044; c=relaxed/simple;
	bh=du1fKzl+zbOOxRTgFJqsNwKglby2lARhz5MLhrd3ZZs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BSW/UtvUbr3IV/wodq1J6TjrrdUIjkESFdkDM+GASrHXF/Y12AD8s7m1TYaIAUWoTtGP/eSDp6iGvNe/G1MiQY+MybkpAY++rDmx98uFqwTMZQf3hwcQ4cQvsTA8yK6VtA9kl28cdFKJvka8UQPLRQfV9mqj+yi9fuDsDt4pUA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hQBcd6TC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NmgoV44U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hQBcd6TC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NmgoV44U"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6STJ13743651
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 06:54:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gcoCHy1edFFqmcEKY7+Mhve73Yrzs7W+rUiD3MzHC+0=; b=hQBcd6TCFMk1uei+
	3DVeRMg8odbYQdEksVZAVFPi6eAk4p6FpJbPhseav4gSz+ZYSAfFawpiYI2DRT+1
	nPsKmA8K4xkxDqfLLPFy8N323iigAyLo0nXcQ7wuwzCNyAfmuzlzYAdDUJ2aapOl
	5aqdR+LhpZ9NaaY65/V/doJvBLTbksxRX+II1jRdBMWx8TCHB7bckWpOJZhR7Ckd
	elSUj17IgFftdJUTyXHxwUATkwDnya16r3yCl3HGbhwxY5Nz404OTiQXmTd+EL6O
	gtjLxoqSDwxR/R+nxhVUgUb88HvrMpnUS++Ux341WfGOgjctQN2VUYIjR2LDwx1R
	gOBoLA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44p2d40-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 06:54:00 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8f2747d334dso10714576d6.1
        for <linux-sound@vger.kernel.org>; Mon, 13 Jul 2026 23:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784012040; x=1784616840; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gcoCHy1edFFqmcEKY7+Mhve73Yrzs7W+rUiD3MzHC+0=;
        b=NmgoV44UZX/ToGg+4sJhf7vHFqDJObFZctCdKAkCNg7Rv1xPuEulc5A0F6szzYGghL
         jW/snnYQIRBeVSVgRrrmMLQKdng9Uc4jOLDuwGlej8YYEGTL1ibOhc5KvoGO0XnBun9p
         yREBQt1Z7f/S98olIqu511u9s8yBU9pWqv3KDBU4w9UjQ4wtgxFX/kkPp5EQM5lkcAg5
         vGnh1ZdhJDIhX3IllckL4i0xS+E3CftBleh3rdC6JX0fw/tAQvP3gjVnYyGHv4CnmN2N
         vzINGyNsS1yYcTpt5abDUQ7XfGzKcqaLnJyvUkTNC6ucV24h8E9E0cdIfnQQ6fJB5+zI
         m1xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784012040; x=1784616840;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gcoCHy1edFFqmcEKY7+Mhve73Yrzs7W+rUiD3MzHC+0=;
        b=MC2taWD6ecb3DE7IAkCAM3PmZQ6TdXrSQ+hC529vmlWjFqIiHoENF4oBwlWsFk4i11
         Xz1n/OAmdA0HFjimmm6j6YUBOEqIUJ5I2LkmkHTcdsofTv717B3eRSFlCR3V9Wbf96y1
         /rSsqtmmWh8gOe5Zssb5J1pFgs6eL+h3coAgmdq77spr2xIW4VQ+TWdikboFwlQaoHnl
         tX2sg04R+jZYlBgmSPK7TnpLp6la3X0xHZVq3KPsJr95ysfvmBrGSzjSKTGNCQivkUkZ
         SPNE1BI6rLEgCV1yKiCzzCtsNlc5sz3GeCz78kazSyLNO6E+2lxqdI63GfB5rjhO5ue9
         zJyg==
X-Forwarded-Encrypted: i=1; AHgh+RpiEKEjkO3Buw0v9t+jN27QlYVBkfxaC70tWvb/ifedt7Warv3l9P0ui3FujHBtMQzhGKC5CmeNeiMMZg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJhBELQ+NUQ3YMvbDSOihxkfDhce9nRskE/0b/cnk/Y3vmR9Fx
	7iaVa1KF4HZnjl6SI0WOybXt1+g/BLWgd9lGpleavuqL/5/ZF7TpWi2EmdTxTsbSYW+LCB9ps0Z
	U1BW/uTsrBORIVX+dWakLDYFzT6v5/ttlOEzXy40p4vGAtz9gknKYMAbTOJ4JvkVbTA==
X-Gm-Gg: AfdE7cmw1ayqc7FUP+GOtGZthhXaudTet587qLSHt3V8Be4W+uGnZ5p2hSZ4QbzNfOA
	SARHLY36thT1NaYbPbl9KdL48clMbCsUoljzNrmnzpSyJ8YnV2Kh7wAxz66A9yUrA/cSGkutXPn
	jyk0x/go7YXHWldl2l9dHxp3vXkeHA8kq6mZcCLUk82EFvMJvAdyX1Kpw0mJttZhK4HG2RuYmMw
	TOZ+6UDlGD0zbbkGkxFRY/JNZCHtvV4Hl0pVWGjYALQOWk5NcO9WI8Z/Fyy+5z+qZ1QkTWrFme9
	0J/8s9qXl0DRqVHkFBDrWlIOLY2WhV2Qb5daOQ+92DhO1+v4nOqqD/bhPAe97hG88ocgSp1Le/4
	9Qk9bqP/XDgRQG1GHRI8Vrx/ZtBTkpXeez1E=
X-Received: by 2002:a05:6214:4f14:b0:8f2:d8fc:47e4 with SMTP id 6a1803df08f44-90410c668dcmr103925366d6.9.1784012039915;
        Mon, 13 Jul 2026 23:53:59 -0700 (PDT)
X-Received: by 2002:a05:6214:4f14:b0:8f2:d8fc:47e4 with SMTP id 6a1803df08f44-90410c668dcmr103925286d6.9.1784012039462;
        Mon, 13 Jul 2026 23:53:59 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69cd295656fsm862065a12.29.2026.07.13.23.53.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 23:53:58 -0700 (PDT)
Message-ID: <d132334b-f920-4858-b690-baeda6c527a0@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 08:53:55 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ASoC: Add LPASS VA CSR heartbeat pulse clock
To: sarath.ganapathiraju@oss.qualcomm.com,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        prasad.kumpatla@oss.qualcomm.com
References: <20260714-master-v1-0-1ebe5993225e@oss.qualcomm.com>
 <20260714-master-v1-2-1ebe5993225e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260714-master-v1-2-1ebe5993225e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA3MCBTYWx0ZWRfX3flUjUbw7fuY
 2R2Tc9PIUhc6quYPxdBZZg51Hd7YQxWPNp/pYVOi1Gne0f7HOyuAXSm+Z1XVhlemr1D3+UVY8Nu
 Ez2o/RXstUAoR2n+3vn+CnurENIaoc4=
X-Proofpoint-GUID: opyzgu62A_MAkUNVrtfDQPuYYWYMGjMt
X-Proofpoint-ORIG-GUID: opyzgu62A_MAkUNVrtfDQPuYYWYMGjMt
X-Authority-Analysis: v=2.4 cv=BZroFLt2 c=1 sm=1 tr=0 ts=6a55dd09 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=9XzChZoegFnburFei4AA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA3MCBTYWx0ZWRfX3VRXNdpiEaoY
 atoo3zNY8MnlffdWm/iob8HO3U18cnsPrSYFCL6jwJ6yYDxgsn13PIHDv2KOcb0W0KaVaB9UdnD
 eVbHRzYq4jR85/wfeDhHWTJ4axfznIMJUwmDd5axOD4jlpAXvWDDuMVQ29qq1S3Gv+DwCey11iv
 HAHa/PgnQ9986IEEn4qvmNbFVbYEyLFKuDXmP7CAk5VTBvrY+iZUvx0Icr+981OObV+CfrlQEAB
 r23vT6JtIo6GZ4cJr2uivi2qw/Y3uY0uFgnA31VVGCe8z8ip9ehKr6nmNjRXopd0RqtaZx2VlIB
 LAWgn9Wx82qF8NjwKqMhoy0MttN0VDRo3eUn1tsjZpZk3YnJReQ3nIQOdHu9WHL8iaTjFOX4WW2
 akeS/7BFee/WBvvBLHqMnNFbuW6lvDCauO6YGqckG3+1aQJL9YLsfzz8mfAXC/zoBLBeHn+iqav
 vWCum1IVMkU7wkHbYoA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140070

On 7/13/26 10:05 PM, Sarath Ganapathiraju via B4 Relay wrote:
> From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
> 
> The HeartBeat Pulse (also known as RateGen Pulse) synchronizes the
> start of the DMAs and Codec Interfaces for the audio usecases
> and can serve as a periodic wakeup source for the DSP.
> 
> Add the LPASS VA CSR driver that models the rate generator as a clock
> provider so it is enabled and disabled automatically alongside the
> other clocks during runtime PM resume and suspend.
> 
> Signed-off-by: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
> ---

[...]

> +#define LPASS_RATE_GEN_CTRL		0xD000
> +#define LPASS_RATE_GEN_COUNTER_0	0xD004
> +#define LPASS_RATE_GEN_DELAY		0xD010

lowercase hex, please

> +
> +#define LPASS_RATE_GEN_MAX_REG		LPASS_RATE_GEN_DELAY
> +
> +#define LPASS_RG_CTRL_EN		BIT(0)
> +
> +struct lpass_va_csr_data {
> +	u32 counter_0;
> +	u32 delay;
> +};
> +
> +static const struct lpass_va_csr_data hawi_csr_data = {
> +	.counter_0 = 0x960,
> +	.delay = 0x16,
> +};
> +
> +static const struct regmap_config lpass_rate_gen_regmap_config = {
> +	.name = "lpass_rate_gen",
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +	.max_register = LPASS_RATE_GEN_MAX_REG,
> +	.cache_type = REGCACHE_MAPLE,
> +};
> +
> +struct lpass_va_csr {
> +	struct regmap *regmap;
> +	const struct lpass_va_csr_data *data;
> +	struct clk_hw hb_hw;
> +};
> +
> +#define to_lpass_va_csr(_hw) container_of(_hw, struct lpass_va_csr, hb_hw)
> +
> +static int heartbeat_pulse_enable(struct clk_hw *hw)
> +{
> +	struct lpass_va_csr *csr = to_lpass_va_csr(hw);
> +
> +	regmap_write(csr->regmap, LPASS_RATE_GEN_COUNTER_0, csr->data->counter_0);
> +	regmap_write(csr->regmap, LPASS_RATE_GEN_DELAY, csr->data->delay);
> +	regmap_update_bits(csr->regmap, LPASS_RATE_GEN_CTRL,
> +			   LPASS_RG_CTRL_EN, LPASS_RG_CTRL_EN);

regmap_set_bits()

> +
> +	return 0;
> +}
> +
> +static void heartbeat_pulse_disable(struct clk_hw *hw)
> +{
> +	struct lpass_va_csr *csr = to_lpass_va_csr(hw);
> +
> +	regmap_update_bits(csr->regmap, LPASS_RATE_GEN_CTRL,
> +			   LPASS_RG_CTRL_EN, 0);

regmap_clear_bits()

> +}
> +
> +static int heartbeat_pulse_is_enabled(struct clk_hw *hw)
> +{
> +	struct lpass_va_csr *csr = to_lpass_va_csr(hw);
> +	unsigned int val;
> +
> +	regmap_read(csr->regmap, LPASS_RATE_GEN_CTRL, &val);
> +
> +	return !!(val & LPASS_RG_CTRL_EN);

regmap_test_bits()

Konrad
