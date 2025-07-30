Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E8B2980A4
	for <linux-sound@vger.kernel.org>; Wed, 30 Jul 2025 12:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753880329; cv=none; b=Zk2j2O9VEHHrEToXoloh1NzYf3ShyIC5NIboEI5QssVNBT133owOEGp1JvIFsuXAij9RSDYsFcToyulXbwJebudf2q34H7pQOkQGrC2b5LrAhgTmkd9T9Z1w3n7ubhrDY10ApdqeZ4gJc39oLxZ6hyyagV+nLH8iGutrrB2LYoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753880329; c=relaxed/simple;
	bh=qdoR/T1j974HV75S4tJQPO6oa6KOE5TIDMG6swHUT34=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZGAior/fohkKCQI6eAnNrrtIE1am1+O9aUjeLdpHeka5nwvbHLknZ0IpO06/8jI25c/6pPjGMiXFAeB3frxMWpbuH4/6b6JJUHbU3t51B59pivIE1QfN+BhB4PDCUmYRvNqrvrXWNbn0kjH6yeSTtYpccH7aQwdyiYNURMjx7t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CJqtUTJV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CJqtUTJV"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56UCbP92024946
	for <linux-sound@vger.kernel.org>; Wed, 30 Jul 2025 12:58:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	REl7hvnxlp9SuuNQcg8K3JJn1OMshdLROkXEqPTt0hw=; b=CJqtUTJVteGV3fk3
	UDHOk/lJylpmzDnVz73C8EOi2ZxnN8Yu1s8Aqdl7Z6Buch7wHd3l357Hg7gQ4tlg
	cTk5KsaWtiOowqWEGBb40+85BsWguXPpPef12JVGn6zMzw4pfCzvU8vTUPMJf6pi
	FCkkD9ARE+ggBj+T5DzPr0y5cZ9g+c76aIfqP8UTgMARP6z3W1XhfKv6dYCWp/eu
	HEk8MaH0eMcTMt8t+sndkbk6D4eqmb+qx7ron7c8KBBxMu+BmccryFfjMjdZQ68o
	jOlStstUnEpaE0bWou9w3BhNYUokxWSflslyoswqj9+NJyjfftLE18VqtzxmVU5p
	cIjjdA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484r6qut1w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 30 Jul 2025 12:58:47 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-7073674bc2aso3393146d6.3
        for <linux-sound@vger.kernel.org>; Wed, 30 Jul 2025 05:58:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753880326; x=1754485126;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=REl7hvnxlp9SuuNQcg8K3JJn1OMshdLROkXEqPTt0hw=;
        b=W0I+osn6tsp5mUMBRAERv9S/J+m1lu8zm3FhtHPlJjTWCwEzg90GtdFLKzkzEkSpr3
         teZJn6YYu6sd46+B+Q9FeRqr3RbJRYOWaHPXQcwVXr+j2JB/o145IzOxEv2P3XEqz+tx
         ZJO8IJxHd739RmtP7VgDj9cPhMY+xc0BQw07CSyxp9j/ClJ/zuZqbntPj4+sgs5fPgWl
         eAZlUhOsgtulq62Rrl6uQFUIlxr3nvfZQvBuiwQwpmERNJNAVKTUaF0PATvRcQwz2zi9
         nWsnD6WaC3ZSc7FPHFK6wypFbjxd+nDFQx6DT+TA8molFuEl2mxjRLO+j54cn/lV9TKB
         SV8w==
X-Forwarded-Encrypted: i=1; AJvYcCUwbTwgxvzrlHFgzzOraEJRDiWTiEAwprB+yNF7DKNwbahtq6II/9oEP3O8ZJrRbdScDVZD7mlrapkHSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVGAL6FThDN+YcEPiK3uVfhUiHkADdin2myYufnYXUVT7IiO1h
	EGPNYi1CPkOViJ07COk2lZ0OSp7NrN+v3MDY7r9ZY8YGs1lJqq4h7UpJ1om1EZnjveILEGhT8tl
	CkUns/RYgEb/Rb/wnTJ1ZaLw0WHQvJb7WnBWg5Rx4BPg1pB+LqX7t/Y+dUtaFEPue1A==
X-Gm-Gg: ASbGncs6z857IWuP5mN2ROH8Mk0O/u5LjAoka/7wkZf8ECGTcaEm8gXMm4wLpR5VpHC
	7f64ibuU242L+B+xUcxCuSrHLE5WlG+iOCz32YUcQm937i6btrC2OAyfYyta91BxyTRurTymGvK
	RKKXrBGHk+tcIVDLEJ8Xfs4vVH6sTj00Dy7AISabPLM8fhjbFULlWR93pVsB5/8rOpL0c5sht8J
	jggvb5laZI8jWuDPQ2RXvOb9rQ8i7pp4+a9sfBJaXP6lMhtElpCMdH7RlB6AWKtLc4+J57DMIOl
	bAZbX+iRfMhVgf0xnIueHYDgb0ZfwGiqNSylhT7Bdvzs7vG5bgUvdWtrzwQSO278LDz1MKGyTNA
	ienIZOXGk7ul6pESpWQ==
X-Received: by 2002:a05:620a:2546:b0:7e6:3c48:408e with SMTP id af79cd13be357-7e66eec65e9mr236934685a.0.1753880326023;
        Wed, 30 Jul 2025 05:58:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvVN/RcoYodTnfrZL516pu8LNotIBvCtHLo8vMi2gcHequN79TtT5m4Nb7CMoeTdOjan/dqw==
X-Received: by 2002:a05:620a:2546:b0:7e6:3c48:408e with SMTP id af79cd13be357-7e66eec65e9mr236931885a.0.1753880325583;
        Wed, 30 Jul 2025 05:58:45 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6154cf801fbsm3305166a12.31.2025.07.30.05.58.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 05:58:45 -0700 (PDT)
Message-ID: <7217ab5f-680a-41f1-9b90-3d68d4ce5e96@oss.qualcomm.com>
Date: Wed, 30 Jul 2025 14:58:42 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/9] arm64: dts: qcom: qcs6490-rb3gen2: Add WSA8830
 speakers amplifier
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        kernel@oss.qualcomm.com,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250720173215.3075576-1-quic_pkumpatl@quicinc.com>
 <20250720173215.3075576-7-quic_pkumpatl@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250720173215.3075576-7-quic_pkumpatl@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA5MiBTYWx0ZWRfX9CW8x6W9H5T7
 ZFk46KSTjET6atlnlheQZvYAta8cPX3Yl7al4ud1ZXKI3KcpuiUj4874nG5lUm5YA1GB+byrS7B
 Z+7iCj0HgZoGRhqNc80W9QHJPyphrFQsk2IOU/X8EsjoCCo01pXVh9gPDwXcHwwSbAOmyidt8KA
 6IkqbzIjt8+lMaWrk/auNeYbThNwWbZj1LEUvtwMlYTts/w4sLlMRlQjfdEnyh0f7Fr0+M/9O4e
 bp2xggp51B5pcaQQERIUa+hSdCoEOOjLQukDcsAyP78Fxt2CMqE/y6xEQPrwoc4C5vPltExtKrG
 eIycg4HCpD88IBPnBMpQxu9tBi3BsC1OXyU9P5/u5QAYL6P7TubX0Fiem3NI6SG07u+r0md0tm/
 vlUxNNnlmKVEWIaDaH3P3jrBlzLM3lHnhVY9zTHKAgKSVEKmH6hEGYFCZ8u8Ox9h1tOuMWRh
X-Proofpoint-ORIG-GUID: qec-ut3oBxL-z2qQ8U-k0ysx3ouc9nhu
X-Authority-Analysis: v=2.4 cv=ea89f6EH c=1 sm=1 tr=0 ts=688a1707 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=_z6rx1Am3YmXwjxqEOgA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: qec-ut3oBxL-z2qQ8U-k0ysx3ouc9nhu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_04,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 mlxlogscore=678 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507300092

On 7/20/25 7:32 PM, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> 
> Add nodes for WSA8830 speakers amplifier on qcs6490-rb3gen2 board.
> 
> Enable lpass_wsa and lpass_va macros along with pinctrl settings
> for audio.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> ---

[...]

> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index ff5b3568c39d..fff92fd836ab 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -2872,21 +2872,27 @@ lpass_tlmm: pinctrl@33c0000 {
>  			lpass_dmic01_clk: dmic01-clk-state {
>  				pins = "gpio6";
>  				function = "dmic1_clk";
> +				drive-strength = <8>;
> +				bias-disable;
>  			};
>  
>  			lpass_dmic01_data: dmic01-data-state {
>  				pins = "gpio7";
>  				function = "dmic1_data";
> +				bias-pull-down;
>  			};
>  
>  			lpass_dmic23_clk: dmic23-clk-state {
>  				pins = "gpio8";
>  				function = "dmic2_clk";
> +				drive-strength = <8>;
> +				bias-disable;
>  			};
>  
>  			lpass_dmic23_data: dmic23-data-state {
>  				pins = "gpio9";
>  				function = "dmic2_data";
> +				bias-pull-down;

If you're adding drive-strength to one, please add it to all of
the configs

Konrad
