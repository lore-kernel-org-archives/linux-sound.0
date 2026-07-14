Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1A63D9DB6
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 08:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784016450; cv=none; b=ic9OczG6hShyuAbTd+9pczGVs9lNW/Et5r8iAF0NEMBuzbBwv7PNH2qJS0acMbsxuZCBKHLnykY34UGSvHQLau83GhW+lf2x5tM5Y8SLCPzCF+xqyFrN5a/OXJevtaMw9ikd0yoNaRF1edY2erywTyW3oMlQQTP8gWAodmshrEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784016450; c=relaxed/simple;
	bh=chPrR3yvSSLbL3nbc1J4St17+dIVVN6Px6STN6fIB6Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KIeZdIS8RFLF1qNmNH5kc5D0dm6pcQDzkkurh8IKdZ2XVGHrD1PyU4UP8jGrZJx9eDi8JvrwViHAEvZqgpJv328xvuT0cmKiC/rXW0r/JdjDnTCZp0B6qhV6KYvKvWUe0el7w1HqdCzLyEPgp8SoluwzJ9aqqH5pAc4IQ9ay0OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P938Z9IV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jIFzCccv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P938Z9IV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jIFzCccv"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6SU5J3929111
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 08:07:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PGw4sWaMKDTzSJPFnL+q7if3PMk6fCh3Zk7dNYZW40I=; b=P938Z9IVDEs6r7UJ
	ru54N4j4Ibb5GMoVKokzQZVMLXHNXAgZmnqAPqXzatK5W6g7+2i6fwCTDIBFChQU
	DXDkiiL2qPdEhYyQbR9NBZtjdQ/NuEpI57gM2Or4popy9dFfDVJjbr4Wad94vMBP
	6LYHpTZArC0A7K67gZY6aVcKwDa7P8bWDmt3y4ANHxQIbjxdOMqKW+9g4XC5ZCxB
	PXWNv7fDCCCeruYiN2sc6sok/T7Weo3VwwzuMmlXdW0CDRCMtij88FAy1ky7pmHS
	ETSsglJcSpHbS0HTReep0Gj9iRrjnyIo4ohGhOisRY/X+5S09TxEPr6m8C0vg66H
	a1M3dA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd37xb105-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 08:07:27 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfe3fa93bso74315481cf.2
        for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 01:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784016447; x=1784621247; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PGw4sWaMKDTzSJPFnL+q7if3PMk6fCh3Zk7dNYZW40I=;
        b=jIFzCccvjI+1jIL8j735fkJ25jwxKfQPNeaQI2hXOm1M1s9J7tjJWugWEVwAdjbi0a
         X15TJTOlNrlNwnN7alCCnC/IMzLKchYiWYzHUntf6FJJpsJyArBxK7VSv/7mmiOMKIgv
         R0937AkYd/DhnUKgWgbEhmoeEA9b5Td+tC8po8lF9oyOrabi/pBQ6kqHvA4NW8aY6ySn
         g15eaeHFbH8PURVG5ld3zU4qEgxgmpti/C/+ya+P67B5vpl7jYT/jgGywr2QqeNblQJI
         XZwAbfKGIzSmLnS/uySCehIZ8LlQIMQIOmqqlHxK1Ua1ubBnFRznvB/Z1cRct+K90mxy
         TOFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784016447; x=1784621247;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PGw4sWaMKDTzSJPFnL+q7if3PMk6fCh3Zk7dNYZW40I=;
        b=cBobfefvl2S2W27OcTv5v7Rf8YK60oVKpwhxtN04VUIvTwSbgqJebOFNP9oAMtqF6s
         gDexqjDoRASwVkUKSVnQNuVBa2hrf4CNvA9Jt8kU/h7eMz1WyODqBmpv5Ihfh4G5BPet
         2DrgiJwKEMnkW934YuEqAnQr/VvmsUwEXliw6SoIwpz1BfXasc2+Va7ALPcXhg9guJX/
         M6+DZwnqoKdELJ7wM5J6cpVFRnxSLw+BzrjOlJxICu23HH9qas8wN5u996l+6CaD6jXz
         8slwSIFaIQV+SuqanIOtk4rwsFKcNV8fq55+HIsDofAxasx66VctZ02vhjRLJwZ+ACFn
         HdXA==
X-Forwarded-Encrypted: i=1; AHgh+RoJf1doSQK4ULnyWP8uvgCrMFF7DHND0YYygMRX953dJVbzum45P2HtaoLBgBrA2xie7mqKQCHE+qS5eg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhUcru2xsBeJHFYoII03d67Co9xHUO5w+TV68u4zPDPhgAr8+y
	JwhEcoRkqh87HUlyTZMHvQpyNozYPVUO2va8cmkghT4laL3Ura1dLdr30UQF16LT8i75lj1ONFl
	+crDsFUGBJtOuqV5ZeKWGIIzzMDxBhXBez/r5u+60JLLkPIrdRWsuhcpPlnwXLaTdtQ==
X-Gm-Gg: AfdE7ckoywL1uVbug0Sur6Qdoni/qPOjLGa2RRNiYHj1FEh/0emF5vOPPUHBmBbuNjL
	+5Nz5RvqUV4jB6XoKYCbk3bNOlqSyAGSQDdVF9nn5DNVBQY4CJEWfIL9giWNhkw7my6QYrSSd4R
	pxvhD+wesdG9Wr0h9NAi9wYE9VXs6KHwfvW5xh4J4fPV0ptPnBnSuoqy/khyh/aHqM3fqFylRFJ
	cFAvQSZiTz2bmMLV/Bl8v/ynzYKQLkRy5rpnLx5ituGbI+sTB3Ip+ci97oix6IAtrqjndI6Ssiz
	iS/WKXSWcRsHQ4LyhdaoD8vvY4VCocF/CVzNG6gMf2Zdj9CPnmRHXIUrPtMlub6Xve2fQuSLhDP
	siZoKy1t8trbVn9iCLQEH7qYFlSMc2b5YgyqFFA==
X-Received: by 2002:ac8:7dca:0:b0:51c:7b13:62f3 with SMTP id d75a77b69052e-51e3c33c1c7mr27597731cf.73.1784016446884;
        Tue, 14 Jul 2026 01:07:26 -0700 (PDT)
X-Received: by 2002:ac8:7dca:0:b0:51c:7b13:62f3 with SMTP id d75a77b69052e-51e3c33c1c7mr27597361cf.73.1784016446415;
        Tue, 14 Jul 2026 01:07:26 -0700 (PDT)
Received: from [192.168.68.109] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-69cd2936143sm955958a12.25.2026.07.14.01.07.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 01:07:25 -0700 (PDT)
Message-ID: <63e5dfd7-b0e6-4dbb-b67a-79a33b0a6477@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 09:07:23 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: qcom,lpass-va-csr: Add HeartBeat
 pulse clock
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
 <20260714-master-v1-1-1ebe5993225e@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260714-master-v1-1-1ebe5993225e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA4MiBTYWx0ZWRfX2lhau0WsYOKW
 Qf77fvwUNUW+r0CHdcQh89ScGTTMOJfTUZGicNcmcgsD92eu3a9e4GyrBqu9xaUPL04gTxe91sh
 qykToJ6xPZt5BxMj7qDOvAd5a/5MEtacqMBeINFTHH2USsorqSFCfczLfNzX1UxjuYjSZi044HC
 8LBqQI34IBmFPtNnwBSKE7zUnw4usNhQLgDpsh67rpoXIpRVrjmCUlhUPjAOt2qZAmJuEZicAlB
 IKmj6WOa7noaB5FTgLkul9zS5lBuSgg0IMhS95owf06BlnruWdwVaa7HAb3m6psNe9TJnPga+6g
 YwQpDpgaz4RAvX7Yc0+NMuQL5ECJZIqv+yAt51Lw25f3fweNCV9zlZ41eAI/CJt3duMuGppXaeV
 GmxSXidgT8IW/XHCFxSZTkMzjTgnnd/A0lvTu2U3wHVAJsOibkKtCuWTZRkx3lgcUWc2GAEEnpC
 VYhMeVTCqbz/6xFuHhA==
X-Authority-Analysis: v=2.4 cv=BNWDalQG c=1 sm=1 tr=0 ts=6a55ee3f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=q3g3-CpzSg7zKoWD_TMA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: L8dbabKe5eDWYDKctnqxhh5-bSee-wFI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA4MiBTYWx0ZWRfX/IEDy7SaYyNq
 vyntd920n/T+bniveTh3hBRteLQAtM5HN7wFLIbi1n4zbwvIwf2t+IJmfCj2uHMGalIrqvwABGH
 2NCYKh9a1gH52HvKNszLgPCLL9wNrUk=
X-Proofpoint-GUID: L8dbabKe5eDWYDKctnqxhh5-bSee-wFI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140082



On 7/13/26 9:05 PM, Sarath Ganapathiraju via B4 Relay wrote:
> From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
> 
> Add Qualcomm LPASS VA CSR rate generator node that exposes
> the lpass_heartbeat_pulse clock on hawi. Also extend the
> qcom,lpass-va-macro binding to add qcom,hawi-lpass-va-macro with
> its four-clock constraint (mclk, macro, dcodec, heartbeatpulse).
> 
> The HeartBeat Pulse (also known as RateGen Pulse) synchronizes the
> start of the DMAs and Codec Interfaces for the audio usecase
> and can serve as a periodic wakeup source for the DSP.
> 
> Signed-off-by: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
> ---
>  .../bindings/sound/qcom,lpass-va-csr.yaml          | 47 ++++++++++++++++++++++
>  .../bindings/sound/qcom,lpass-va-macro.yaml        | 18 +++++++++

Please split these into two patches, as you are adding two things in here.


--srini
>  2 files changed, 65 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-csr.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-csr.yaml
> new file mode 100644
> index 000000000..794da92ad
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-csr.yaml
> @@ -0,0 +1,47 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/qcom,lpass-va-csr.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm LPASS VA CSR heartbeat pulse clock provider
> +
> +maintainers:
> +  - Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> +  - Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
> +
> +description:
> +  The LPASS VA CSR block contains the rate generator hardware which
> +  produces the heartbeatpulse consumed by the Bolero codec macros
> +  (rx, tx, wsa, va). It is modelled as a clock provider
> +  so consumers can reference it by name in their clocks list.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,hawi-lpass-va-csr
> +
> +  reg:
> +    maxItems: 1
> +    description: Must cover the full VA CSR block (base 0x7EE0000, size 0xE000).
> +
> +  "#clock-cells":
> +    const: 0
> +    description:
> +      Single clock output "lpass_heartbeat_pulse". Consumers reference
> +      it by clock-name "heartbeatpulse" in their clocks list.
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#clock-cells"
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    va-csr@7ee0000 {
> +      compatible = "qcom,hawi-lpass-va-csr";
> +      reg = <0x0 0x07ee0000 0x0 0xe000>;
> +      #clock-cells = <0>;
> +    };
> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
> index aea31fbda..ae4df8967 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
> @@ -19,6 +19,7 @@ properties:
>            - qcom,sm8450-lpass-va-macro
>            - qcom,sm8550-lpass-va-macro
>            - qcom,sc8280xp-lpass-va-macro
> +          - qcom,hawi-lpass-va-macro
>        - items:
>            - enum:
>                - qcom,eliza-lpass-va-macro
> @@ -168,6 +169,23 @@ allOf:
>              - const: macro
>              - const: dcodec
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,hawi-lpass-va-macro
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 4
> +          maxItems: 4
> +        clock-names:
> +          items:
> +            - const: mclk
> +            - const: macro
> +            - const: dcodec
> +            - const: heartbeatpulse
> +
>  unevaluatedProperties: false
>  
>  examples:
> 

