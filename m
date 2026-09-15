Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2EF3C062D
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 12:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476652; cv=none; b=doDsENf2jxPGZXwaXmlfvW16602bp+pcjX38r0UpcHkbVyWoC299hZWqylL/mZAD0PQ/fCy0YSZZ1TEVNrJMEmFUhjoWsH3WueP2GS3FRcrSs5oQFbBzIKnCZ1OynnzujN2af7gMGsdNVihvCLyDXv+8mNoZHswlopb3j3DjgCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476652; c=relaxed/simple;
	bh=xbo00gOxGqqAUQxgPGO9vMIMMUz7Osk333IDwlJ3L5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eVQ3ErmvfFMEwBbOxBUw6SoVKXpnSU81ntMPj5P2GWAPWbvIqIWXpGuzTnoYH56ooYSpe3xifToMDVO26nkhztv+dK6m/9ELGW2nmfGK+q4dSjfdbpFM7MwERfzGKZ6IMmprgCSh3gF/w0UeDyiZHoVYOUDrRvOznJGniKguUN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j2az10Eq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aDhtduNp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j2az10Eq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aDhtduNp"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9h54E3217419
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 12:50:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hn033UI+u93eN0s7E1KhlfLlzklk26Hwma/EHj+HEo4=; b=j2az10EqKZ5WcnpB
	wDaRkjpswh0LAAluJxB1tx47NCs1JYEMLI/+pPW/1sAMBYeyBCLMlKZ8C8eWNBa9
	5LfF7gkn+tAvfK2BcbB0iPxRgh5sYj+KeZmG1hONqnWIlnvZWHA72S9wdcxhrE0S
	upjuNV9zKpJrrgsduCRVLva4th7Hz7Qq/9oP7R66POAYnzxEUoKiKqxoxhXbOWOB
	g2KiUZbP4DyFnyI0SXVc9FXPJXIu2uMNsREyjXRbrwpFEu7GKsYWpiFzlyc6SUyR
	2btgnkMoGHufkLfMJdAjOTlyKZwqJiTKppntM7/4fn1IaCqSdFmCMny0HbT2bqlE
	lr0v7g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq2y2gy41-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 12:50:49 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53122a93eecso9231171cf.0
        for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 05:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789476649; x=1790081449; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hn033UI+u93eN0s7E1KhlfLlzklk26Hwma/EHj+HEo4=;
        b=aDhtduNpOp5sAisSh2ATB388DS6f/Pv/01dw5hP9XqakM5VCnnQMnZYly1fwZwMlG8
         7XclAT4I/HrtSkMH0sUiwUm+yqdwhhNu4ubKEgLmZO/2cgtlJG2MuAdqTceGYhxjL3Op
         jGdfvw4ZmnOOn2pIlw1PkYeOkx5msztX45TSgQNluKFMLxe4UxFEvjqkCcRbpDdk/kBG
         KImkbVqOdF48wgEQpxCXXewz7f0I03RwGTtp+0qj004mFAaQfW1s79MiRa6buxzHDsqj
         FyWFLYDPD6qRhe6/XUW6KTHckXPVKeD6cpqrR0bGCX/o/imjJJjuNrPKSx9WUV7FNg1c
         sEMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789476649; x=1790081449;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hn033UI+u93eN0s7E1KhlfLlzklk26Hwma/EHj+HEo4=;
        b=tzueW/jzM9l3cSYd5C2Zoq5NFx4F3YR8VrKRWHW4/Ghjp576oXhWEGVdZ8pbyNUVRu
         EO0dArGVbbPL7RabcvvUsNEMuxfSDLdq+itAyxbO4qpwT5qEcxoAwldU51OjAjcr5DoL
         ovSIyGDOigG5hvC72yFVE6ZJ4MppxN3MF5h+Jd4IKIMZs6jcRWb4Hs5zkghlKbktvlKy
         b1j2aiLjb0KHMrS9C6RK3TT8PUz7+Eu/WCNUuP5gnw0pBecDAS5bSiSUZuAOuG8fy3eo
         ONuLO2v/qw9+bxYk6XnvSSXSM0nEIBDV074gBk4WBEe4Ze2GahHY/1br9bmG8gzhqkNC
         CEmQ==
X-Gm-Message-State: AFuF++kU+9XIrs1HtcZjPAUado7azxzIGVvsJkGJpCXhW9Oxe6lkJLFK
	ssFxvQK87ABf1XUITXkiWruO+nzQZZRutP9cHYzVRtIhuFmfPW2BBl/yvfPrtlxw0OykdHyCelD
	BmzOqgr1iDdOqZ8FFY74oXTKUwQy1UWmt1O3C1I5UiyZ/Emp5Qb6GnKSH9FS0F4hqPQ==
X-Gm-Gg: AYBFou3spkA7FJhFizZaEUqCZVzEe7rM0aEc0BDtfiwejC5beGRATsz1Yy0hA3c2K21
	wrSwOfjO9lIiiZ4lPMHNv2RBzwXRcVWmXCxRbZEwfc13F6Wcsli3Yg8RoiI5VCztAjTp3Y4xGSU
	CmJRrSOtsPbMAtzrKh7+61r8l55cYiGucS307Yf58TM7YJn5+lmF/Dyk+Nco9G4L3gzKZssI1Tq
	IXgMeuakgCTFa+OuMe4d/TJQ2l+U9RChgD//7OjIBMIKM4QPRVtYUcxyUDsDp9UYntxxwAJyaHf
	hOUYH6n1sLcH1NI1DRgN+dZJpSH1/rZu9hM/V/UUl27+yQHatk4TvMZ5E5CkyKqAFHiWHZMyGSN
	yKRUSknlktSHcXiXPZ+yrjY2IM3IwnVCEQwEDO+s=
X-Received: by 2002:a05:622a:64a:b0:530:a450:4eb5 with SMTP id d75a77b69052e-53119e77372mr46820821cf.21.1789476644339;
        Tue, 15 Sep 2026 05:50:44 -0700 (PDT)
X-Received: by 2002:a05:622a:64a:b0:530:a450:4eb5 with SMTP id d75a77b69052e-53119e77372mr46820431cf.21.1789476643936;
        Tue, 15 Sep 2026 05:50:43 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca309989sm127737471cf.4.2026.09.15.05.50.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 05:50:43 -0700 (PDT)
Message-ID: <ff0a3782-b116-4db2-8dfe-16cecab0625a@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 18:20:35 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] ASoC: qcom: lpass-rx-macro: Add shikra compatible
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260910-add_shikra_support-v2-0-fdd2129c696c@oss.qualcomm.com>
 <20260910-add_shikra_support-v2-4-fdd2129c696c@oss.qualcomm.com>
 <16850fda-e68f-4ef4-bdd5-9ad77ac51195@oss.qualcomm.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <16850fda-e68f-4ef4-bdd5-9ad77ac51195@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -WL6DYH5uYr8V0pQLlTNXEXEHDAEr8ev
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE4NiBTYWx0ZWRfX4/H15ITBSEaU
 gxFPE+k6dsm4P+jHgxhXgko8Oc5px9tV2tA3HZivHbnXE3gGY39PPSkNFJXnnE8i3nmEV5hPcJE
 NHp+xTLnnwFnOm4tMsxDuHKRAK1oqHTWfuoiZmJ1I1xanWwGHv9XdfS0h8JrbQVOw9TZMQu/w1Z
 aOhKnbrtbl2pQ1wJ1do8XGPlncdxlNt2OoewKwA22dzO7t+RSXRmnOXCPUlOTE34JKc1wd+Zhiq
 Ng6c4IkfjUmgGH8uKPNv7/+BGphzpsOy7nKbYRPFV4c5byuGKi/01VQG/2uuI1QxNsIdX5ksmPh
 /7mYSn3v9oFQLnoLeOXns61yA223vBfhrnKRI5HiJo3N83AH8vE87i2Bk0HS6BErSlSSJdnU9PQ
 s+PY6XxonTerxs4C3tcqgiBILCb9rVwVDMitEa2JEfRihcml39forF/gJcMhRP5s4+rUzEVGPGk
 5XT2qk/P27a1XYCQ1rg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE4NiBTYWx0ZWRfX4m3kAN9pAhix
 oQFZVJRWosEMdh2UNsuPNUPXWkLeyZQ5OjMiQttWHnMK/n0Y6D/OGpxYCh/kc8QO/YztgtV480u
 zTenpEn7rI968dol/AZvfHIy9hJlqY0=
X-Proofpoint-GUID: -WL6DYH5uYr8V0pQLlTNXEXEHDAEr8ev
X-Authority-Analysis: v=2.4 cv=IcISymqa c=1 sm=1 tr=0 ts=6aa93f29 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=iI-3DXn3oscrbdy4KD8A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150186



On 9/14/2026 5:11 PM, Srinivas Kandagatla wrote:
> On 9/10/26 10:46 AM, Mohammad Rafi Shaik wrote:
>> Add shikra RX macro compatible data and hook it into the existing
>> LPASS codec v4.1 flow.
>>
>> The RX macro register layout of LPASS codec v4.1 matches the v2.5+
>> layout, so reuse the existing v2.5 register access helpers, controls
>> and widgets for it.
>>
>> v4.1 additionally requires the FS counter to be bypassed before it is
>> enabled during MCLK enable. This is a property of the codec version and
>> not of the board, so key it off the version detected by the VA macro
>> rather than off match data.
>>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>>   sound/soc/codecs/lpass-rx-macro.c | 17 +++++++++++++++++
>>   1 file changed, 17 insertions(+)
>>
>> diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
>> index 2e74ec1a5..83372123c 100644
>> --- a/sound/soc/codecs/lpass-rx-macro.c
>> +++ b/sound/soc/codecs/lpass-rx-macro.c
>> @@ -60,6 +60,7 @@
>>   #define CDC_RX_FS_MCLK_CNT_ENABLE	BIT(0)
>>   #define CDC_RX_FS_MCLK_CNT_CLR_MASK	BIT(1)
>>   #define CDC_RX_FS_MCLK_CNT_CLR		BIT(1)
>> +#define CDC_RX_FS_CNT_BYPASS		BIT(7)
>>   #define CDC_RX_CLK_RST_CTRL_SWR_CONTROL	(0x0108)
>>   #define CDC_RX_SWR_CLK_EN_MASK		BIT(0)
>>   #define CDC_RX_SWR_RESET_MASK		BIT(1)
>> @@ -1613,6 +1614,7 @@ static bool rx_is_rw_register(struct device *dev, unsigned int reg)
>>   	case LPASS_CODEC_VERSION_2_6:
>>   	case LPASS_CODEC_VERSION_2_7:
>>   	case LPASS_CODEC_VERSION_2_8:
>> +	case LPASS_CODEC_VERSION_4_1:
>>   		return rx_2_5_is_rw_register(dev, reg);
>>   	default:
>>   		break;
>> @@ -2045,6 +2047,16 @@ static int rx_macro_mclk_enable(struct rx_macro *rx, bool mclk_enable)
>>   					   CDC_RX_CLK_MCLK2_ENABLE);
>>   			regmap_update_bits(regmap, CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL,
>>   					   CDC_RX_FS_MCLK_CNT_CLR_MASK, 0x00);
>> +
>> +			/*
>> +			 * From LPASS codec v4.1 onwards the FS counter has to be
>> +			 * bypassed before it is enabled, otherwise the fsgen
>> +			 * output does not come up.
>> +			 */
>> +			if (rx->codec_version >= LPASS_CODEC_VERSION_4_1)
> this pattern match is fragile,
> 
>> +				regmap_set_bits(regmap, CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL,
>> +						CDC_RX_FS_CNT_BYPASS);
> 
> Please use this as a flag.

Ack,

Will introduce a flag or switch-case mechanism to handle this configuration.

Best Regards,
Rafi.

>> +
>>   			regmap_update_bits(regmap, CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL,
>>   					   CDC_RX_FS_MCLK_CNT_EN_MASK,
>>   					   CDC_RX_FS_MCLK_CNT_ENABLE);
>> @@ -3652,6 +3664,7 @@ static int rx_macro_component_probe(struct snd_soc_component *component)
>>   	case LPASS_CODEC_VERSION_2_6:
>>   	case LPASS_CODEC_VERSION_2_7:
>>   	case LPASS_CODEC_VERSION_2_8:
>> +	case LPASS_CODEC_VERSION_4_1:
>>   		controls = rx_macro_2_5_snd_controls;
>>   		num_controls = ARRAY_SIZE(rx_macro_2_5_snd_controls);
>>   		widgets = rx_macro_2_5_dapm_widgets;
>> @@ -3837,6 +3850,7 @@ static int rx_macro_probe(struct platform_device *pdev)
>>   	case LPASS_CODEC_VERSION_2_6:
>>   	case LPASS_CODEC_VERSION_2_7:
>>   	case LPASS_CODEC_VERSION_2_8:
>> +	case LPASS_CODEC_VERSION_4_1:
>>   		rx->rxn_reg_stride = 0xc0;
>>   		rx->rxn_reg_stride2 = 0x0;
>>   		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_2_5_defaults);
>> @@ -3949,6 +3963,9 @@ static const struct of_device_id rx_macro_dt_match[] = {
>>   	}, {
>>   		.compatible = "qcom,sc8280xp-lpass-rx-macro",
>>   		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
>> +	}, {
>> +		.compatible = "qcom,shikra-lpass-rx-macro",
>> +		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
>>   	},
>>   	{ }
>>   };
>>
> 

