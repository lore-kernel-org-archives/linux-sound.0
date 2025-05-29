Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4414321CA1F
	for <linux-sound@vger.kernel.org>; Thu, 29 May 2025 09:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748511006; cv=none; b=oU98w0LM1PGeSNDHqsLoxqSTWz2slWVNYiMgrWT9R8/vrfEBHqjwDJXgtPV/18b9u6lCzXkGGO3rX8aVHsoGWzp1lBc+Sbw4ypXVj/hcotmgeGObBXWGv5WPlGC5D5lQlQJuMmJBJr3xcsY53ZqS4FQ5A+2PznkkfUttF1h6U5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748511006; c=relaxed/simple;
	bh=GWZ47weuVjxdmOTn+geA4pg3AEu96U7nGcqiOqrS+FE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mBq1O4l8m/eBaq91kgJ7KYroyCOtOnrwZd+VEDdR2AnzWCcDAbUQSkqmC7TPPa3tk/KOH54zppLuHD2cllRxLI1CR914uIFPMT1iqIihK2AsBir0UVmnzBXFbz89UbWwIOezdgkuViKPpxOZgFT9IvBvGgqGpMSLkrk28ULn1iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gpM9dJyt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gpM9dJyt"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54T5rw38022443
	for <linux-sound@vger.kernel.org>; Thu, 29 May 2025 09:30:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XhIfxMVlQ8L9RT3lT5uUaRfqIAHopMP4V4S1R9fi38M=; b=gpM9dJyt8bVrOwIe
	LpFoocQC/9ayLPKTKVr1ixHgkCO3/gh4FgJLOmviRgyljkYchTEaXfWcMA1e2Myf
	S+nGj7iHfRGQ5rAeZGvx9VF/wX9/Bi1fSnnzDEnFk+roiqwMHu7JFApoWZLbPOwB
	UcGU0hA25GrmSHpEnwj09HpkVrZenD8mzF1NRkzeeeWzcNKhLqoadMwaA7WdydfK
	GAQZHCVhG1Kf4BCfuBxJIthdwIFrDnOfY9lAikT11DS/dvkI1Fki/7/hZjaGtrHz
	5WH2fFiG/CNuPVode37PEOv+i9d3M8JNtCvwZD9ra4xWekIPC1BxaE2jg0UkQUI+
	tNnwkA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46x6xca5j6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 29 May 2025 09:30:04 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fab1bd8a71so12963226d6.1
        for <linux-sound@vger.kernel.org>; Thu, 29 May 2025 02:30:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748511003; x=1749115803;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XhIfxMVlQ8L9RT3lT5uUaRfqIAHopMP4V4S1R9fi38M=;
        b=nNy67AsVfavabasplVJ/ElkeQXb3iPwOjgpGmuWpzAudwtupOTrXUa/MGOgdDB3NJv
         AJelX5uumPSB65x5wudyi67XRcxcRhGG79+Td5qzmGnsvPtG5yKztSQ0CuwNqcEUu7nm
         AUQxi6q5xMQg1AkWzO32WyHgqUcJUvfLbYlo1KVRmkSjT+aH84ehL6bjHvWcmkvc7p7l
         SILC68CL0s4t6v/rV3a70q/mX9IEU0AKXXHBmhT/jjm3z+KQ34fdL40UtiIMLS8txHN5
         eL7FN7vxaPaWISYLs5aRJyt0o/Kgy7Io4WUvFzI94lZUDWQ33CA+zQ5RzpKJNZ8dt6kG
         8ATw==
X-Gm-Message-State: AOJu0Yxnc0Mg2wwv+8FYOd968bSW+N18zAtrM4IFE9Fz0FjRuKgqjmbL
	K5/U4NL2Rfmt+8p3AmdLY3OYU5uTByPc0I61B0TpdoxJnMbE2AxjDouUA3M7ppFlePDX071GzjB
	XmCR5iQX+1LPNX5qEfoC3aSvQ2GF4nD06sXVBMg8kQhyQulqEU36GWjBReAexJhZeJg==
X-Gm-Gg: ASbGnctheh960DOKh99c+XI0nEzyqavSbb2D4iKjvk6a93nPdfoPgjKbD0Lf0pPSX3v
	GswNnLcRV1yB128qrzeSy9B1sScerSfbYFZOXa0NKeUTTLT8ho8xOBu9tqFXWQkXfrqnVm7wXA4
	9kQzZS7F1n1kX0w+EQi8jmWWbj4i8ryIwUpRcFNL/YIobUS0PgjsxGHtngTz4nQYh8JhbxxNFVX
	Iz8goRdrl3DfescrfvBPsyjyazDbfwo1Qy2m2cA6KkJruCYlDN0aLEm15EAWS8WuYQhq/30lBNy
	EKlSB6G5NnUqiAbi4kuPBAGgIPZgFYJ0cZ7pQg==
X-Received: by 2002:ad4:5c4c:0:b0:6fa:8c15:75c1 with SMTP id 6a1803df08f44-6fac83d3e56mr19275516d6.2.1748511003004;
        Thu, 29 May 2025 02:30:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuhF0a9JamEH2xvLOnY3n8YKcLhz5fVLRzYE43PyF8jU1JcEPEDxsP9ZS8JS0YOd2Xcle+XQ==
X-Received: by 2002:ad4:5c4c:0:b0:6fa:8c15:75c1 with SMTP id 6a1803df08f44-6fac83d3e56mr19275296d6.2.1748511002582;
        Thu, 29 May 2025 02:30:02 -0700 (PDT)
Received: from [192.168.68.109] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a4f009758esm1411669f8f.75.2025.05.29.02.30.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 02:30:02 -0700 (PDT)
Message-ID: <89a1a6ea-3939-4d52-a8d4-478347b1867e@oss.qualcomm.com>
Date: Thu, 29 May 2025 10:30:01 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] ASoC: codecs: wcd937x: Drop unused 'struct
 wcd937x_priv' fields
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Oder Chiou <oder_chiou@realtek.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Shengjiu Wang <shengjiu.wang@gmail.com>,
        Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
References: <20250528-asoc-const-unused-v1-0-19a5d07b9d5c@linaro.org>
 <20250528-asoc-const-unused-v1-5-19a5d07b9d5c@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250528-asoc-const-unused-v1-5-19a5d07b9d5c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDA5MSBTYWx0ZWRfX6pzM6Dvcnx22
 udKp8JwM6mzDGITWL4tmVaBMVe8jEfNVqRzFZ9BUsIVbAoo0LoP7Ns/gYDTRS2rnt0eKrVna0Mf
 lgeNbjJ8oio/oPBFJCiNPn8EpmJta45ty5I87Jwttox/OvahgG1AOw/4TaArBYGc88XWhsHEaVX
 A1Bv4ajoSqfhEiSPImBaIafRqL+fJUNS0g2FiJSd8oCzprw7KFNQXFyIw9Qctlm0xz1JPfjsYi4
 P9aSpTy96FCWatUgQz5/2zhe2tX81SqTxMDeyoyUyXluxQoXtJQONFaCEACr6Kr/E+d9BIw5AS3
 h93H7DsqVsWVMOUjX+Q3/akVPxcd8g5J2qd1GArNvZ2VQiA//9hNbszY4CRb7qrKGZgGoFWbHlh
 9vry3NnFOTV8nqFGN1jR/xt2GN4paltxif/FG/hQdkk+cno9szlIUmBb96mCTD9Em0uqpq9m
X-Proofpoint-GUID: lL5dh6cgLoZhG56jN0xIcbPL-BzCbfx1
X-Proofpoint-ORIG-GUID: lL5dh6cgLoZhG56jN0xIcbPL-BzCbfx1
X-Authority-Analysis: v=2.4 cv=bupMBFai c=1 sm=1 tr=0 ts=6838291c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=pnj4R_TuY2SD5zWdqewA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_04,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 mlxlogscore=827 phishscore=0 mlxscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505290091



On 5/28/25 8:59 PM, Krzysztof Kozlowski wrote:
> 'wcd_regmap_irq_chip' and 'jack' in 'struct wcd937x_priv' are not used
> at all.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini

>  sound/soc/codecs/wcd937x.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
> index b9df58b86ce953427e01ffb8c7eb7e52f9c2392a..126a29e0b3ff96c12fdaba2b9344a3040b455e44 100644
> --- a/sound/soc/codecs/wcd937x.c
> +++ b/sound/soc/codecs/wcd937x.c
> @@ -88,10 +88,8 @@ struct wcd937x_priv {
>  	struct wcd_mbhc_intr intr_ids;
>  	struct wcd_clsh_ctrl *clsh_info;
>  	struct irq_domain *virq;
> -	struct regmap_irq_chip *wcd_regmap_irq_chip;
>  	struct regmap_irq_chip_data *irq_chip;
>  	struct regulator_bulk_data supplies[WCD937X_MAX_BULK_SUPPLY];
> -	struct snd_soc_jack *jack;
>  	unsigned long status_mask;
>  	s32 micb_ref[WCD937X_MAX_MICBIAS];
>  	s32 pullup_ref[WCD937X_MAX_MICBIAS];
> 

