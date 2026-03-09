Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CFC410D24
	for <linux-sound@vger.kernel.org>; Mon,  9 Mar 2026 19:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773086115; cv=none; b=IWnHltN/cDiH2+BaqlWog3MOt7gQsT+s7xnMqmxX8s1VW3vpNDO0yykqJfpwjWndsEh8l2qa9xr7174r9wClUUdmR36T6ctpQZC4Ka6qHxAbm/AD6uf3q4FVGyhu1kUXg5XNRk0HJti14zMY81YxHW4Xl5Tl75HwlsWWHXGk8zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773086115; c=relaxed/simple;
	bh=W4MrTBic1HBb9ZZN8z9MrPVPIQYMw2XdIROxl0BHWOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fKLJyS3qc/quv8z5SG2mfbpaXDJIdUIUFcIrMzCzxmZB955tLoccQZH/rGEjz4eqkjuRFN/UgL55386YWEq6dIHPdsyPKChafrGv28uqG7L9tVLMYuIe1Aq3p6JHbr1m79VxIM/q8Hs1XQ1p44mBmpBJ6H5ISBGSZRiEamr0oX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UOzv/ayw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RvyXLpSe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UOzv/ayw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RvyXLpSe"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HC0Zv2427877
	for <linux-sound@vger.kernel.org>; Mon, 9 Mar 2026 19:55:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=B9IxQXCxQ9UXI/vzh5L1RtMV
	bGGacONEYx7BpSheQDE=; b=UOzv/aywgzW2EfTCe/ndkr/dIb2B1m0x/XV45O73
	IqAGnL2aL2fBCP/nabJg3s0oDrH/B5pnlM/fDwv4+Nj5Cbp7hmMpIa+M/Wb0jY/m
	I0ZHwgWJCsLt/r7CDximt7OVrOs2qFBOKGMZXiDjpkxgT7e3QUSyXWazv4rqUcZo
	UHG3jjuHbMVjp2CWGXw728P5Oh08QtRfSg9el/ORNS4Pj519cGbH+sRFusFgZzIP
	l+2AsfDNArOiHo+FJaW7kIrOdqGUSBr+QOLJR5EdjHAMm7qziPXI6SMH4dUCC6EI
	MguHLJyuLvXKCdOOrjTofEYn2FR/kdkWR7czvdydrM2urw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct1ekrtfx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 09 Mar 2026 19:55:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd81506677so955568585a.1
        for <linux-sound@vger.kernel.org>; Mon, 09 Mar 2026 12:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773086112; x=1773690912; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B9IxQXCxQ9UXI/vzh5L1RtMVbGGacONEYx7BpSheQDE=;
        b=RvyXLpSeB0itrcyoaDGOESANpMX9+9d12V9f0CsuzU8FifUmhhKZsE80A8gHY2i1cp
         Aw02noeKgWwdhwRQPu7p9Gl8TjvkWA1ZhATrNc5I5/gwZSmt/Mdjlq1FTe3DBAxT5flw
         tia4t8gJSHUTTcpgIu5m04ZFbNhx2TJm2YRiUTmmvVNy0qkm63qwesxqxMwA3Udcg1XE
         DuaTQ4iw43FEF39NErhuFhXESN33uqWoGnehwqbP31Dz8q/0RHpe9nzTvP84Iydm8qsK
         az7YUvGDHBp5m+4FextG4O1Qs5Deh41wkx98n9Tc61cA3eaxx3j2L3i/hfvU4GBRzFHw
         ArTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773086112; x=1773690912;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B9IxQXCxQ9UXI/vzh5L1RtMVbGGacONEYx7BpSheQDE=;
        b=elY9wOMXWL2nptN4ZNEGGlxX7S3QdVujT/G+Sm3rLK6j+BaHYSSTDWKnZ9OpUmXZPs
         lp0Zn7R1vQusn2puhGUamdU/H9cvHX6Fe2UVh/kEVzaOXAZ6yU/WuylH/B9fNm+pDUxw
         xDrSC8I9CntrMDn0tLEM5Lwp9Id1yUdRwCz20zk77aLwu6PYlb8CyZLVhZH72gbb1FN3
         4xV5SPKtLTIrhnicpdp3a25aCl5qMfy1X2RmaJ5kXKul1z3H3vrH2EVyhPncigBbVvaP
         4WNp2qstm9LLszwOPAVqnbu4ovyejV7DA+i1MMxOg2loZmxAkrZHwltTOQsmbVtFU+Ln
         1Aaw==
X-Forwarded-Encrypted: i=1; AJvYcCVe1qdPnUvnT9XQrH1ipqCSgO72/Yf8jijl6kFkv0zaKKKCM8JlPcFrLzSSNAWsz2pbCMlsCd2LvCW37A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJVFjhZeuisUAdw/ic84a1kc1PZZLPsfD0aB6GtrEpo/0lDL1/
	fCUlFYjk0OUpe0VkRdth2G8qdokApr11hif+K81xE+eqZKQw1XxLEYw2a041BpH8BS5Z3rKy7jR
	eKO8G0kVfcdmv/EYzAidfLx8Jxtj1yNMUS3s6Q7wSQquORyX0h6jxHOBJZuti4jH66Q==
X-Gm-Gg: ATEYQzy0dCrTEiEr2tr3oK8Isda/R2ZsYxo34nW2tXmIf7jmrsUIzOfPZAe0ENxhRnY
	zeIPvq2e/1IBIAOm9y90/eCQWKGue3N1jWwd4jRcAwshwfBnlJQjmPGy48bXU6KjoVeMp/6lX3Q
	4qq+wn1xCp2UPD1aolWDc47DMsEfw92q943IFh0zUPqLFmjpQhRqN8Ms4b5a20VNs4bRQG8q/7m
	L59ls654de4Oqx9XoBVewjDGbqoq8o5+Humkc540GgJWcvfmjp3JxLvCz1AJvXRhxdFOWFhhFvm
	fQJ8YzKIQ6Hgs6wjg+7P67ryXv0hSdgDq3PFoFTj7cXiqqFCSdWPZAJnZxDnugkKcyLOFaegZTE
	uUHX+h3wKK9vSRn4IBwO4yowRkdBBukYhU5arQ8Hrxurw03CE1VTLmo5LbmtjtfFRd0bC/C+srD
	ffKRELS52q/meGkX9tiDBP79KhFqAlDWS1Cs4=
X-Received: by 2002:a05:620a:4543:b0:8cb:71d4:d0fb with SMTP id af79cd13be357-8cd6d48496emr1526153885a.36.1773086111835;
        Mon, 09 Mar 2026 12:55:11 -0700 (PDT)
X-Received: by 2002:a05:620a:4543:b0:8cb:71d4:d0fb with SMTP id af79cd13be357-8cd6d48496emr1526148185a.36.1773086111226;
        Mon, 09 Mar 2026 12:55:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a5d0726fbsm1040101fa.41.2026.03.09.12.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 12:55:10 -0700 (PDT)
Date: Mon, 9 Mar 2026 21:55:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH v1 1/4] ASoC: dt-bindings: qcom,q6apm-lpass-dais:
 Document DAI subnode
Message-ID: <3ml7bphfd7abn6mat47yagw7l7whv5hia7ifkbh6yi7gdg24j7@2p4sihkcowjd>
References: <20260309111300.2484262-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260309111300.2484262-2-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309111300.2484262-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Proofpoint-GUID: qPKsmIyudDkt3_1t1jChAEolLEI4ZNNP
X-Proofpoint-ORIG-GUID: qPKsmIyudDkt3_1t1jChAEolLEI4ZNNP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE3NyBTYWx0ZWRfX0EUSh76yoXRs
 C001ARCAlzhPk+jo4ETLeSjZWbN/gUi2s/FA9HqtTWmL+c7k1jUJnzcLoigL9fvifAaREAV4PEr
 AKVJA3XtcffMoQjfLZCuXZJH9BPewWcHsy+e6+LFKZvEFmC7zYLmaxCXJtePfedNqQWey7lV4jc
 Y6BMIvsSc7mKKY+pD/JReBB39oweOcUINKSVAaew8GxRL6EKHL6dZcJahzLJpzowENBQdNlli1t
 OYwF05YOPDtT1aExgC0/7r4UL/I5BsIqPWdtc6HVxxetzJSGjNEFBMxG5LwFfBrJfE/jMmeHBms
 gUe7hZofL4Na9Hovz9xDeQCLQhx9V+rve20G53GVfwbATd58BCrelUMC1/r8oZEWkQvbTX+wBiW
 Q+rnmORINXAml2riFGXEVDD8hw3XDaJQnO2UhcKj0bLklCHbWSpBy2yqQmW4O/k+/EhJP/nLkPv
 wfnCiqhV4/ecVMHoiKw==
X-Authority-Analysis: v=2.4 cv=eIEeTXp1 c=1 sm=1 tr=0 ts=69af25a0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=oeFafo8-zzntoLF-tkkA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090177

On Mon, Mar 09, 2026 at 04:42:57PM +0530, Mohammad Rafi Shaik wrote:
> Extend the qcom,q6apm-lpass-dais device tree binding to explicitly
> describe Digital Audio Interface (DAI) child nodes.
> 
> Add #address-cells and #size-cells to allow representation of multiple
> DAI instances as child nodes, and define a dai@<id> pattern to document
> per-DAI properties such as the interface ID and associated clocks.

Is there a physical device being represented by this DAI subnode?

> 
> Qualcomm platforms like talos integrate third-party audio codecs or use
> different external audio paths. These designs often require additional
> configuration such as explicit MI2S MCLK settings for audio to work.
> 
> Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  .../bindings/sound/qcom,q6apm-lpass-dais.yaml | 41 ++++++++++++++++++-
>  1 file changed, 40 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
> index 2fb95544d..1d770cbcb 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
> @@ -21,6 +21,34 @@ properties:
>    '#sound-dai-cells':
>      const: 1
>  
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +# Digital Audio Interfaces
> +patternProperties:
> +  '^dai@[0-9]+$':
> +    type: object
> +    description:
> +      Q6DSP Digital Audio Interfaces.
> +
> +    properties:
> +      reg:
> +        description:
> +          Digital Audio Interface ID
> +
> +      clocks:
> +        minItems: 1
> +        maxItems: 3
> +
> +      clock-names:
> +        minItems: 1
> +        maxItems: 3
> +
> +    additionalProperties: false
> +
>  required:
>    - compatible
>    - '#sound-dai-cells'
> @@ -29,7 +57,18 @@ unevaluatedProperties: false
>  
>  examples:
>    - |
> -    dais {
> +    #include <dt-bindings/sound/qcom,q6afe.h>
> +
> +    bedais {
>          compatible = "qcom,q6apm-lpass-dais";
>          #sound-dai-cells = <1>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        dai@16 {

What is @16 in this case? What kind of address or ID correspondings to
the PRIMARY_MI2S_RX?

> +           reg = <PRIMARY_MI2S_RX>;
> +           clocks = <&q6prmcc LPASS_CLK_ID_MCLK_1
> +                              LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +           clock-names = "mclk";
> +        };
>      };
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
