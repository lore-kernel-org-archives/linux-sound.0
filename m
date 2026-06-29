Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FC731B100
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 05:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782709415; cv=none; b=AtB6+VYSaFPBSaJ0giPwvrEkQVXNF77UaHspkglphPJNeLaH7E5RgQ+wk8NiAkzActn9u13gHBQlsF4R1uJT9dpGC27zAdNcYSn7zoFrFXM8S0FcLW9iTzNYm3dhganmlcG9DC2gkrBSLcSQ7hw6S4Iw7zToWIqP1AuYxfFr3Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782709415; c=relaxed/simple;
	bh=8GGjHz2/I206+Fi11Ux2KHZMbQvRYWzNU1Gr6HP8wZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LJF8Kp6GcP0BAroMEK1obhDanZGZeW+jiU+r8apJGlI4U4c/QLX6ibO8rth+1JSeFPlZ8VhOWzXTycHWQfWZf+MEPNewOKDj3BTub+u3qd19R7ApOvosqe1qJDSuUdvGfWs3hkNxheYhbukPKbUALN40fjik5iT3GRJPn2UV9cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GYYZqT6G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c9N+vD+T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GYYZqT6G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c9N+vD+T"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NT3D1777389
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 05:03:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W88vWECRU+wrMD9oJnjg+rbsRkfPT9MutHVGHqUs57c=; b=GYYZqT6GAgh/iKVv
	PHMl8k/9bppTUz6ZLT6n/6BHY/t3yDVI2Dyj9X7MaQhyrmg+erO2XqmL7MBB0cnM
	9nh9bi593YU754NyB0hntP+68pgjUmJoWjHhiYpB9PhirnFKeviSaq7nWsINfV9m
	sbH2xAv18wohXAE9tgJpMcuyBMgd/F+eXA04IK/yVZ9qsY0q1u+oc0m7wm05KaAF
	BKzMIX+J4sJDhzE9avTvsqxKznBC5dIPB8Cns4QLLF5VkWGw6h9RkiHe0h0ynYL0
	met+NUZQP2kHRKez4dxMAG61fBQJ5CrDfcZaLhp3dCOKuXh5kDbm2Gw1NY3LKa6k
	b1VXdg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26x8mjy5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 05:03:33 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c889d1eebafso3567383a12.0
        for <linux-sound@vger.kernel.org>; Sun, 28 Jun 2026 22:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782709412; x=1783314212; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W88vWECRU+wrMD9oJnjg+rbsRkfPT9MutHVGHqUs57c=;
        b=c9N+vD+TDAsuf0diE4Nw9f6UsnlHWcih+jGBdx/oF2mkaBDkrsAGpNC/guCjxgafi6
         V52RkJjwkVB9uBB3BofcYaQu7Kf8tpmLRMXtPQeKmECa/abIob46qkriFSzNlJ8EFBkj
         zYsHjlHCskDMO3e4oJnSKrzOgvhrpe8GWk4UjqHNLz8pZwNHy5I7ohFKcS1LFAmJQqQR
         MRACTsa0bwRw8MYfDrtz6IFwQrN0917KIGh547YFxiF6v9V2xeI/rkXPtm2Nypax2aw2
         hutijEZGONpOoOp9xIF5qqQR5rbKuncwrS+67jffPgKmgaSHEsMiwmsC3hF5DClyUAY2
         QHjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782709412; x=1783314212;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W88vWECRU+wrMD9oJnjg+rbsRkfPT9MutHVGHqUs57c=;
        b=Qn3pEzIM8809XGjgv71yyeNgxnHWidONuBjxZbxR7uiARE5Or7sD9RqqkC37cPHMzR
         AxD0OWtgP1FuaZbMr0rkgbxKzkMqOyC/t9ISBDJM0PPU85eAhQBYiksqrOTxCNG2hjRe
         dawVHMsYLGngPNw26K7tlOkPtALlwChCTBoSXGzpcbu24AAzaeqdEHYn7DQywOR0I0/2
         9a4EC0/9bA1AIQSUF4I93rdFR/jQT/ZPymgg0WNfg/UxWjikXSlS+wlQWlf6sw/uwWBc
         jZmM+Y65neh9SSx9gpDJ4Wwj0oIf72ziPL7DwcYWfABuGohHPuVkJmgw70M5urR/O0ta
         oYqw==
X-Forwarded-Encrypted: i=1; AHgh+RosjHv0fnh6HO+xT4FPxh933pbcJTzsBSERmZC3vs67syS7FKXZlwdvgp0ZZqeQAXYcbU7dQwutoQLORg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0DYlQzIhYEv+WdOeI4z0+67UG/9FziXUEYsSi2SQK043PN0ng
	ZWVEt4px0PM2ZycbncWOJEkQyuc3W9MtPYB3oeiim5i0pFJkaYn4GOdsmt6CrV9/VtLsAUi8RZw
	oPK9/OjBEIT43FrE0xLADR2aAW8aile4Xx1niygXmIPrMTLDZo9dJXvpy44D63s8Kdg==
X-Gm-Gg: AfdE7clWn9+kQ/z19gxrJgKORRvk2G7OlFv9YEY3o9BwNLjHEeobLTcgQOazpiJXt56
	9ZKbRnToZOOimhhFyXbbZAWEx0vuCk17c2NuGNFfKf+5VR4qGTyRv4wsFf9QbjGmFeV55/UU1n0
	zDPr8SRC7nKexai5+9x7rVXEXmLRG/wa0mUealBePFSRdsau2ZzEAnpOcxNYZiaEn/RhrjzjYmS
	sl+aYB+H34kCmmDyGXq/WOpvK+RCw8VE00DBvXteeYzuX95iQC1Cvrdfu1jft7FGep1ADtSXyI5
	hvaPyeSW+a4BsnLTMLEu0CjR0W2JhXeLvK9+mYOeXGOkO5wYFKoHKaqvMwuoGVJvYwDzq+OkpqX
	NtRLBYwfi0p9Yga+rPZBB4UL/XXoHCG7IYD4e2lly/KJGUfxNMw==
X-Received: by 2002:a05:6a00:450d:b0:847:1b77:6eb9 with SMTP id d2e1a72fcca58-8471c5c5170mr2872769b3a.9.1782709412451;
        Sun, 28 Jun 2026 22:03:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:450d:b0:847:1b77:6eb9 with SMTP id d2e1a72fcca58-8471c5c5170mr2872754b3a.9.1782709412036;
        Sun, 28 Jun 2026 22:03:32 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a40d23ccsm11615264b3a.36.2026.06.28.22.03.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 22:03:31 -0700 (PDT)
Message-ID: <d8659356-1b47-4423-abd8-76ecbd466507@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:33:26 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] ASoC: qcom: lpass-va-macro: Add shikra compatible
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260608172023.2965292-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260608172023.2965292-4-mohammad.rafi.shaik@oss.qualcomm.com>
 <3a0890b2-f9c3-439b-a392-fd13e3da850d@oss.qualcomm.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <3a0890b2-f9c3-439b-a392-fd13e3da850d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA0MSBTYWx0ZWRfX8tUeUw8TO8Gg
 gNq5f+62577yc2NwVfKf0tYOxTL1A4thTIIY7azPZ1Qy02+bav5uwBIrTri02md4Fbh86oguhLL
 nYrIgtIih5vSz6IYdz+pmQOU5Uc9XKs=
X-Authority-Analysis: v=2.4 cv=D+N37PRj c=1 sm=1 tr=0 ts=6a41fca5 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=G8B2rSO7KOTdLhCsa_sA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: cUnlwPXvs9fjn__evVB6peZvS1q3-LMK
X-Proofpoint-ORIG-GUID: cUnlwPXvs9fjn__evVB6peZvS1q3-LMK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA0MSBTYWx0ZWRfX2J2R7/WyA+lq
 8YJrx8X4RTFP8KV5TnNFPf3gKNRUJgTgugUnz97qigOE0nq4sEhR4AGi45vbqcwDRegYxI5vj/+
 Iw9Y9z1b2ZSIZMtz83ZpfpLNOXeDaiZ+JzOQVsLLO9f4MmkBTs328FI+Rm0S02jH4zU9QaHb/ZA
 xfzGALEsNJzp1DgH/Guoe4leAmUyp6WtLvjoHSktpmcoz+Apz4KXe361ihfrfICl4Wbi4Z8JcRe
 cA+ssZpJrtSJcSgdhtygljNJ84hvej6LZUTr6U/TxBNi05TZBrWcdZtFuCtqGnW/fAirbFbFkNo
 oLXedptS8kA6lasGE0C+cdS/dBY1KOewpGzkD/wqB5lgXRxhK/nVZZ4UIT8EyspDm3I9tdjxKpJ
 Ey6oHTMHw1oY/mlbyJ7zeEn/nfCRt0oZr10+l+WgC+RCqMgya8iyekWg+EeHQewnC3sx1vo3scg
 MNd+jx4zSKhS31LbI2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290041



On 6/9/2026 2:45 PM, Konrad Dybcio wrote:
> On 6/8/26 7:20 PM, Mohammad Rafi Shaik wrote:
>> Add shikra specific VA macro data and register programming needed by
>> the LPASS codec v4.0 implementation.
>>
>> This adds a shikra regmap/default table covering the ADPT register
>> range, wires new match data flags (bypass FS control and ADPT block
>> presence), and enables the ADPT control programming path during TX
>> decimator bring-up.
>>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +/* ADPT control registers - Shikra adaptive filter blocks */
>> +#define CDC_VA_CDC_ADPT0_ADPT_CTRL		(0x0800)
>> +#define CDC_VA_CDC_ADPT0_ADPT_GAIN_0		(0x0804)
>> +#define CDC_VA_CDC_ADPT0_ADPT_GAIN_1		(0x0808)
>> +#define CDC_VA_CDC_ADPT0_DH_FSM_CTRL		(0x080C)
>> +#define CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_0	(0x0810)
>> +#define CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_1	(0x0814)
>> +#define CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_2	(0x0818)
>> +#define CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_3	(0x081C)
>> +#define CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_4	(0x0820)
>> +#define CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_5	(0x0824)
> 
> Please use lowercase hex and drop the parentheses
> 

will fix it in the next revision.

> [...]
> 
>> +static const struct reg_default va_shikra_defaults[] = {
>> +	/* VA macro */
>> +	{ CDC_VA_CLK_RST_CTRL_MCLK_CONTROL, 0x00},
>> +	{ CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL, 0x00},
>> +	{ CDC_VA_CLK_RST_CTRL_SWR_CONTROL, 0x00},
> 
> lowercase hex likewise, please keep a consistent space before the closing
> curly bracket
> 

Ack,

> [...]
> 
>> +		if (va->bypass_fs_control)
>> +			regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL,
>> +					   0x80, 0x80);
> 
> regmap_set_bits()
> 
> [...]
> 
>>   	case SND_SOC_DAPM_POST_PMU:
>> +		if (va->has_adpt_block)
>> +			snd_soc_component_update_bits(comp, adapt_ctrl, 0xFF, 0x00);
> 
> Can you define these magic numbers?
> 

sure, will define and use the same.

> [...]
> 
>> +	va->regmap = devm_regmap_init_mmio(dev, base,
>> +					   data->regmap_config ? data->regmap_config
>> +						: &va_regmap_config);
> 
> data->regmap_config ?: &va_regmap_config
> 

Will fix in the next revision,

Thanks & regards,
Rafi.

> Konrad

