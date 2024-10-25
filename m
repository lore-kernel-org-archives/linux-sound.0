Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1326E18D62A
	for <linux-sound@vger.kernel.org>; Fri, 25 Oct 2024 19:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729883390; cv=none; b=Hu2pde52ZjZVsI547f0HFx/CRYmBT3I8ggYblT3zt4xm0L7Nm6/ljZCdPNQBbVXnzqK9Dofw1CEW5zIUU9bE+jOhSpCWLQHtj09pkd9QWbo8AzMl8SPEO0yQmwZy6aqqWI24cDk5ii00rzPW6Z3b3ZUOqKl+wA2t0V2o4yYJMNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729883390; c=relaxed/simple;
	bh=dhKR/aQ+DZRpa6YIZ3tSnaDZBmCUP6SdU92htOSb2OA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KyycP6ZdooCq0Ztw3u7kY62ObxshPDghhGNWTCuVfu9RN5k+cSL+isX2qCnKRL5WXFuLdmFJcExApV5Uu6H4GIZezkPlEikXkRz4HBEuyaxuziH+FIA8oABW1uEjLfZfaEP4JitN8M5YSm4YoLLnKoOPEXABkwtd6osjgpqx+SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dw1ksldY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dw1ksldY"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PB21Xd000954
	for <linux-sound@vger.kernel.org>; Fri, 25 Oct 2024 19:09:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OQIAKOePuAkUaYw4BVl0D//aKV946RCGksTSVOUei1M=; b=dw1ksldYF/LyHHSf
	FAt8ElulyOoc42hY1IHjckKYtoEU1vLkIThot5A0KWTcgNCFJuxHua7NnOuEHKZa
	tUrotE65AEXtGKJOiDe0D2r9B1ImiL2LiqblNyQcbBVgUBAsM4wftABMzbF3iyHW
	AlLf1u1Jkd5F2qFe5po0w8imDyxP88O6OeMF28nySm8k6B08+CVZH84h61xYgsTY
	BwJafwkYBL1AmXmbTCN5oDSKJqDOkuXyMBWT3tLlcSn+n/Z5mXL7JAKVmUOuXlMK
	x/otHWAfwRDTGx9IVB2Kx6eX7mx5nWeOWG5GPHuH4rhMqbG5LMQmV/Xbjgyos++y
	XwZ9Jw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ga3s1dc0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 25 Oct 2024 19:09:48 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6cbf5a3192aso4826406d6.1
        for <linux-sound@vger.kernel.org>; Fri, 25 Oct 2024 12:09:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729883387; x=1730488187;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OQIAKOePuAkUaYw4BVl0D//aKV946RCGksTSVOUei1M=;
        b=UjZ1bOvb6zVOuPV9lTCnSEQ328Ghw5kgxQ9e8ghOuJTWsOcRb5THTFTL6M3nnhUzu8
         TERtxOT1H2b19JKGl7Sziaesg7rwJAB/COIRZe9wE06YtK3kxk9aEFTmByAAjvcF0t9Y
         j+I1WPHd+YscfdvEkS+8KGJ9skLg9JR3LlGx5y+egRzTpsbdV7xs0gaCTG1C6+rqg953
         inkmKHUX0XCRFILFlFSrwXqmNFT6VG6Yf1P7rgbK1Xq9u/G8oA7S5m8ogkPkRzjkGnJF
         8gLhzi62W5ooJ+klQGjxDUxPcFG0z/MbuNKdTnCcePDIUyG82DmajPzdWmKMQcVEiP4J
         hrfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUbe0lVrvod2ghvYBtTpevd3Rf6qgOq5wP7d33M7YV0+pDumj3E/VEhLwtcJFo5htrqsaAmCsfEboegw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOp+2ewo6Po+1ID6lCZ5NON39RHp4tDx5byCMn1Dwk9IA4YA1c
	blhiYxJSXgnxYJR7XZ5Cr67nmVBcgNr26H+xZEXOXBpoqlvG6pi7AdUvhf3xcRD0f6oFdXflSSZ
	1XO3XOhX5E7rjaHKuGC8bEzxdTSsQfRmcHyDsVJ6MiRSKeR6Q65zklwe99JW1QQ==
X-Received: by 2002:a05:6214:226a:b0:6cb:6006:c98b with SMTP id 6a1803df08f44-6d1856f3e3emr3588606d6.5.1729883386796;
        Fri, 25 Oct 2024 12:09:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1yvo5ILCZ6WNeCZo2BbfR4S28Mxk13BcIHq+yxhWX35e3arJcxXhddb8ebAWrPzpveqGVig==
X-Received: by 2002:a05:6214:226a:b0:6cb:6006:c98b with SMTP id 6a1803df08f44-6d1856f3e3emr3588356d6.5.1729883386486;
        Fri, 25 Oct 2024 12:09:46 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b330bc227sm99095566b.183.2024.10.25.12.09.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 12:09:46 -0700 (PDT)
Message-ID: <33736e2e-7ac2-4ec1-9d83-eb8360942bbb@oss.qualcomm.com>
Date: Fri, 25 Oct 2024 21:09:42 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: qrb4210-rb2: add HDMI audio
 playback support
To: Alexey Klimov <alexey.klimov@linaro.org>, linux-sound@vger.kernel.org,
        srinivas.kandagatla@linaro.org, broonie@kernel.org
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        perex@perex.cz, tiwai@suse.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dmitry.baryshkov@linaro.org,
        krzysztof.kozlowski@linaro.org, caleb.connolly@linaro.org,
        linux-kernel@vger.kernel.org, a39.skl@gmail.com
References: <20241018025452.1362293-1-alexey.klimov@linaro.org>
 <20241018025452.1362293-6-alexey.klimov@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241018025452.1362293-6-alexey.klimov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: fnnqNF91t3_iLwzTuFRHp_PPBPw808U3
X-Proofpoint-GUID: fnnqNF91t3_iLwzTuFRHp_PPBPw808U3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1011
 impostorscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410250147

On 18.10.2024 4:54 AM, Alexey Klimov wrote:
> Add sound node and dsp-related piece to enable HDMI audio
> playback support on Qualcomm QRB4210 RB2 board. That is the
> only sound output supported for now.
> 
> The audio playback is verified using the following commands:
> 
> amixer -c0 cset iface=MIXER,name='SEC_MI2S_RX Audio Mixer MultiMedia1' 1
> aplay -D hw:0,0 /usr/share/sounds/alsa/Front_Center.wav
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 55 ++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> index 1888d99d398b..5f671b9c8fb9 100644
> --- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> @@ -6,6 +6,8 @@
>  /dts-v1/;
>  
>  #include <dt-bindings/leds/common.h>
> +#include <dt-bindings/sound/qcom,q6afe.h>
> +#include <dt-bindings/sound/qcom,q6asm.h>
>  #include <dt-bindings/usb/pd.h>
>  #include "sm4250.dtsi"
>  #include "pm6125.dtsi"
> @@ -103,6 +105,51 @@ led-wlan {
>  		};
>  	};
>  
> +	sound {
> +		compatible = "qcom,qrb4210-rb2-sndcard";
> +		pinctrl-0 = <&lpi_i2s2_active>;
> +		pinctrl-names = "default";
> +		model = "Qualcomm-RB2-WSA8815-Speakers-DMIC0";
> +		audio-routing = "MM_DL1",  "MultiMedia1 Playback",
> +				"MM_DL2",  "MultiMedia2 Playback";

I'm seeing a lot of double spaces in this patch

> +
> +		mm1-dai-link {
> +			link-name = "MultiMedia1";
> +			cpu {

Please add a newline between the subnode

Looks nice otherwise

Konrad
