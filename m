Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794478633;
	b=r8tA/NCmMneEqI2Nyq7y5w9eAX2i+MBi8im26lQJpNDcT+PHhmRNRLw435LasLy9/D7e
	 5q/wVk6+VvsEyhyPgdUHGnXa6lGls9sJIMYc2F+csH//wc08QpO9vq6ZNpJpGzMUAe4XB
	 CA+LzffKD8D1ia/rn/TcpRiMhG1nIf2ucpKlwSgBB/mtYnpRofp6XaN0im58aKmLX6zvO
	 SRff5gW7A7u87Ob2m2RsPUmIjJZh6nSZucSKNwHUBbjom+i+Cj0hwM8q4fxcIR4+rNJ9Z
	 XjN3SkaYQj3gdFdMo8n8kPlbrqpevfobmjn5oStnSHVVQ4dNVQw0FJSnHN1AenuBPZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794478633;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=eOYBXWmF+5Om2jGVN1fvtknI+pWWBq/4Rhqhhv9zj+o=;
	b=HznjvjZ/4enakdHf8f5CWzgLt/Lv44VAUDrnZ7Ea8ye0FeT8wghwW1pgT3mqoALGZSwY
	 24nr8BxhQqfTsyUSfvryrvCuxV7ArVTZ1DqDwLRFH0EI8CTG9hifeNW75TYMRU6WE3HCf
	 RAbyv3ClI2bmHtvtIHNGQ/jjGKkOiV195pvYkGdBIsZYuaHKVJYvY1MJBbTWaRQ7CpbUX
	 10Z7C0Evbt4YE7b9piCxBn6BY8YSaHlk1yVDFL62lJgEIJonVdCGWk4Iv+XHYZqkM2XWJ
	 kWxFxlS6Wenl0KDQD9jtDsNazNEKOIjqndCUeggc82MsQMGqajk0nHTdNZ5Dh/BlF0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cuoMsK2Q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EIrkshPR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31080606A338
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 10:17:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31080606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cuoMsK2Q;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EIrkshPR
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC4m5UY3893507
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 10:17:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eOYBXWmF+5Om2jGVN1fvtknI+pWWBq/4Rhqhhv9zj+o=; b=cuoMsK2QqykoR7R8
	6L6tovW/5kKcFiHKGoeF/zGkyc8yiHjBN4zxhG4lpfwmKTADmeBJvLjlqn1wFgby
	ZW16DLzStFBzK2hKfmp2wSNLRqP7NaJsBqfAyuvGrHAUxETa40i9k14uqW5CjYI9
	olfKmp2PI/uFMst+d60L3WFsLg1jd6TEDRDp5/mRLVEHLUjsN699RDodqIdL5t2x
	ZFIQG2mpSfxZBWgy3ztyKZx59frt8xLY33sxbYoQpWHMCmukv6774EI5UcDW15Qi
	teAz9b67TsiEG/x3SFzN4IsvGQwf6ihLdMdPhN584sV+A77TUr0x9DOsyM4Ja8D0
	IjrM6Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6re1485-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 10:17:12 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b0afbf532eso3783029a91.0
        for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 02:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794478631; x=1795083431; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eOYBXWmF+5Om2jGVN1fvtknI+pWWBq/4Rhqhhv9zj+o=;
        b=EIrkshPRJ0LvFGP09mc0HHQhVrKtCz7tk5/lmiOVPLNmAiQbX253VFKcqPQ8NxAB2W
         viMnfF7O15QmTrU10z7cPhfXLJ1+ao23R/o3mLYFaCc5Qwy7jCOFoyOYndFjUcKPbcjE
         2SeueLm1OAbiytwuDHgwKCKN4z748CF4mjR3PSzeOQoDDZv27GG4Lzzpr2c4IpqoWpZ5
         9aLriK1IWkk45S9tlm9uZ9f15mUCcLN5Rc7025KGNb16A1QDYjB7mbGAaVHbNqWcmsvQ
         F65R5Q85+aFUW+9AsTCV0u+heMyO48BRWQ+z2RIDxGXUOid5RWPKAT6Gf4XILiUljqpn
         Gdhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794478631; x=1795083431;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eOYBXWmF+5Om2jGVN1fvtknI+pWWBq/4Rhqhhv9zj+o=;
        b=ZkGodOz26QIVz/N6QW8KJ2BLnZv+1TZ/iGOzBK5I9IgZHLFDUThDMfhpYwcKHKOlES
         pzfLAbe6xsuI6Qb5Lae5PXxvyxNVG+tdCVXhHKJfmwN0vsj+QMgSOedj650+G6qBff2a
         T4DM1U7DG/C+q0nORYOJyOiSQ/GWL3syKoiowELztGskmYRn4ulQVFyrKeaKz+/6QAKJ
         X6wz4bFPMrqtFc/dXrTD6NdXBqi65fgJnTXUs8qztJ5tw4T5xJc0vS9j7d9OtEeyUpWe
         Dxl6f7bbmMZHUaDXJs/TBMX4hjjbC3em/slC82lC90YGBr65y1FUvZhBijhdnuesvdMi
         Kj+Q==
X-Forwarded-Encrypted: i=1; AL+hErEeVAWuLRQh/vMC/JqAcGNRMVE9iYrjm5uqXNMLYeWlRRS2o+S8gfunqDyhVa0GrIVclz0Ej88I97k+YA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9iz6rar5Gx/yhKSMLfV0thGv6kcxV78XP9jkmU59aQRyuwEXES
	L/Mvv9obWCdTTgKvlgnYBkGQVmJZ4uWV8EGlK5gOht6PWIvGZ8jK6ILoaEuixibqUs6uUVKSu6K
	SY3AHzsXxajBdpmHPKNFYGCJu3ZA7Pz+Yd54dgS/APpvOMf16jAfAhcB2vg/f7+vMVA==
X-Gm-Gg: AYBFou1g5Hsl8iA96GLl+sk6+Se8khh6AabvzyDF18lp0y07Guk1GZD9r+qdgkweRHi
	Yc83bVMZdTUZcfNEPsDRU1JNDbZaU3ifmrnO4X8SP5l3dT0+Q/IxbUsvTsVE/p4uvUIPu+nhnI9
	HBO0Jnb+0P/QyeI8Z/VFoS+KrqnUWbX0W2PhFo/cQIFqTtixBm4g+Z6DocUFP4X63Ek1mMYKXkr
	W3rxju7X1jaRaxkjWdHdJkUrn4Dlkzz5QOGD4fAJmXPU9d88yPWirns3k0pgHq+0DLHsVi3XMo9
	dpE5/6dPVLiYkhf2/AcmFLoSIhi6gPtAQnOTyagGA8zzjqqQqhEMiq/DDm1dbB9h4pAwseZyxiZ
	43sRp9LejZ5Ita1bMU22C6rV2YJqeEqohzD/J85cXXT5ZuS7Ejq1sXZrYOqibAglAUZySZvvnpt
	eaHYkPW8Ev+KU=
X-Received: by 2002:a17:90b:4d05:b0:3b0:dbc5:c56b with SMTP id 98e67ed59e1d1-3b182e0f24bmr4440799a91.6.1794478631453;
        Thu, 12 Nov 2026 02:17:11 -0800 (PST)
X-Received: by 2002:a17:90b:4d05:b0:3b0:dbc5:c56b with SMTP id 98e67ed59e1d1-3b182e0f24bmr4440782a91.6.1794478630919;
        Thu, 12 Nov 2026 02:17:10 -0800 (PST)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d04336sm4026476a91.7.2026.11.12.02.17.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 02:17:10 -0800 (PST)
Message-ID: <25ecc2ac-434f-4eea-b144-51fbc683201f@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 15:47:05 +0530
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
Subject: Re: [PATCH v6 v6 4/9] ASoC: qcom: lpass-va-macro: Add shikra
 compatible
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com>
 <20261106-add_shikra_support-v6-4-2cda302237cc@oss.qualcomm.com>
 <179436005594.790675.8837636459182556844.b4-review@b4>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <179436005594.790675.8837636459182556844.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bApRHFZNNEtXTSknYMyoGatV-CC_SfJI
X-Proofpoint-GUID: bApRHFZNNEtXTSknYMyoGatV-CC_SfJI
X-Authority-Analysis: v=2.4 cv=NJhAaE6g c=1 sm=1 tr=0 ts=6af59228 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=ea197RGUULTvqYrq9asA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0MCBTYWx0ZWRfXydf9Xu5uxodN
 Jiiye3BTjLy2XwwzpcptVSwJ8BjPD/l3fxpdtsD2Wrw7VS4ChULBqXkm82ZhjbDDQ7iJ6M0LXPJ
 azf+FRZzt4ifz1/81eSFFdGVlmMwp80=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0MCBTYWx0ZWRfX8VxfGFkJdC4a
 a0UUu2AOnod2Cz5lNlhNQLI9TrghfwjgsVA8OQzrMsxfjVHd6IJFkqMu2dA6jT2NUw+LUXFsEoI
 hSAeSDiYqDjUcu8u/lWlm5ULxzPoO9obF7Q1DxVb6SX7UeE4da+n6bcSaX7O9vfQrDPtBQoums8
 Mne8qQxKH5YFQFney8a6h/VoBgsaMEs0B5hTtG1bqfoI35kam64Huw/3yJTFBuqHmWR8Y3iOtOu
 29dIWF78NuStQnZzaHThVvIZU9cgWv9ZIUDwLhkuGQDX6z8caCo3G8M627xhLyWkZqu2INvJSZs
 VKcfGcqenuv9Nmtwp5wEr4AX028K/csWOcfsZeWsTwFLNAJcAusQRMPLPZ2N8CIOhvmOYBaTirA
 wLBaVGhWX3bzIqTph8Y6FZ7BJ35gfj0VlJ85lQT3aDUvpRWN55oZhhCsUJ6u1nR2tOZ7L97gECz
 vzDZtaBkERv1iDPxpGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015
 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120040



On 11/11/2026 6:50 AM, Mark Brown wrote:
>> Add shikra specific VA macro data and register programming needed by
>> the LPASS codec v4.1 implementation.
> 
>> +/* LPASS codec v4.1 adaptive filter (ADPT) blocks */
>> +#define CDC_VA_CDC_ADPT0_ADPT_CTRL		0x0800
>> +#define CDC_VA_ADPT_CTRL_EN_MASK		GENMASK(7, 0)
> 
> Is the enable mask really 8 bits wide?
> 

Good catch Mark, it's actually 6 bits. will current in next version.


>> +static const struct reg_default va_4_1_defaults[] = {
>> +	/* VA macro */
>> +	{ CDC_VA_CLK_RST_CTRL_MCLK_CONTROL, 0x00},
>> +	{ CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL, 0x00},
>> +	{ CDC_VA_CLK_RST_CTRL_SWR_CONTROL, 0x00},
>> +	{ CDC_VA_TOP_CSR_TOP_CFG0, 0x00},
>> +	{ CDC_VA_TOP_CSR_DMIC0_CTL, 0x00},
>> +	{ CDC_VA_TOP_CSR_DMIC1_CTL, 0x00},
>> +	{ CDC_VA_TOP_CSR_DMIC2_CTL, 0x00},
>> +	{ CDC_VA_TOP_CSR_DMIC3_CTL, 0x00},
>> +	{ CDC_VA_TOP_CSR_DMIC_CFG, 0x80},
>> +	{ CDC_VA_TOP_CSR_DEBUG_BUS, 0x00},
>> +	{ CDC_VA_TOP_CSR_DEBUG_EN, 0x00},
>> +	{ CDC_VA_TOP_CSR_TX_I2S_CTL, 0x0C},
>> +	{ CDC_VA_TOP_CSR_I2S_CLK, 0x00},
>> +	{ CDC_VA_TOP_CSR_I2S_RESET, 0x00},
>> +	{ CDC_VA_TOP_CSR_CORE_ID_0, 0x00},
>> +	{ CDC_VA_TOP_CSR_CORE_ID_1, 0x00},
>> +	{ CDC_VA_TOP_CSR_CORE_ID_2, 0x00},
>> +	{ CDC_VA_TOP_CSR_CORE_ID_3, 0x00},
>> +	{ CDC_VA_TOP_CSR_SWR_MIC_CTL0, 0xEE},
>> +	{ CDC_VA_TOP_CSR_SWR_MIC_CTL1, 0xEE},
>> +	{ CDC_VA_TOP_CSR_SWR_MIC_CTL2, 0xEE},
>> +	{ CDC_VA_TOP_CSR_SWR_CTRL, 0x06},
>> +	/* VA core */
>> +	{ CDC_VA_TX0_TX_PATH_CTL, 0x04},
> 
> Are we missing defaults for the mux registers?

I missed in this version. will fix in next revision

Best Regards,
Rafi.

> 

