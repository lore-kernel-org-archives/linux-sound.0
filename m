Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46EC2EC54A
	for <linux-sound@vger.kernel.org>; Thu,  4 Sep 2025 12:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756988984; cv=none; b=Jm8E2jy9wJfNLAKQPWPoqd1jJkf4voxTHi35nbA7yoBUlj3ZEdiA91HlMBPqrjdKwAFx27f0wrnyrP8H7L4ovzey9Zo0/7T/4FFhnvvlvGtxNqbuEEcks9vD37h67z4Iexd7BwNX54PomSmAdyuP2sZBumDbV+b637juLRGr46I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756988984; c=relaxed/simple;
	bh=prRAN2SiSAb/u9+OvVy7joIO67ql8BGArockTzY/cnM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AG5xEabLmMKQOLk++Dm4o4hYUZpxHcG/yip0jIFNyQmq3ZU64SBIA8mGKMGTw42jdygmKi1PNOoNvR+5xg9bWhNKzSYo5f010c/gXr3fH3BbCCUg17bYqU3b4hhuCsQMLv8gUKJvMZYVJ/L8ZUSJExTEDFeSlsS+1PclJAzcL6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KAocQBHd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KAocQBHd"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849XDFO003172
	for <linux-sound@vger.kernel.org>; Thu, 4 Sep 2025 12:29:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8MmD4u7VxkulDeDKbSghx2SZtMVKQSBEQjy2GAas2Xk=; b=KAocQBHdKoC0bMjx
	3LePPTQ6ynVfireF0lNP0G0tG8lCfhmYf8BYPJg4dViUSJcCAFS8bBudYXn69Tog
	pLl2Fjxuy3qXrRwWnnnSKR475Bs4w6c8lyGOAt8W8gxLedwAYBiic7/z3x/ntQs8
	OLVJgOoeb4ArqfSDKrFaDs9m8gLq5mwMXwsre45hJlb1w0Grc58HQuRTXgqqWUrQ
	zn1+ebex5KLaA/FFfeSGMLg5I2NxLNTruJf2syTc90AP+0uVlV7FsiD3SiJqMkka
	YOodrxh99zFwflk7Zw/QNCmDauegOOS0r9H/nFlRjxAi5cAHMxwwwv8+tiqcV7cU
	iRpu8A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ush37bev-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 04 Sep 2025 12:29:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b32216a52cso2504921cf.2
        for <linux-sound@vger.kernel.org>; Thu, 04 Sep 2025 05:29:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756988980; x=1757593780;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8MmD4u7VxkulDeDKbSghx2SZtMVKQSBEQjy2GAas2Xk=;
        b=fZy9L9AqPp7ulcgnlj9Oq1nfQAGa3CWxe6Q0ElasrOY5cBGL9LjvWhsrpp60Wf4IOK
         klOnZrc8+5tga6oNlmmDzrx3mb1g/DWvh2ZW96UpWhOz83NI7Mz6mstv7kr9kiOfCKYt
         uRloBEHEeKE/fVNbHVgOBHnV+aks0bPVMTP2MUywvnld+oi1P/Xncq4jmhlAAvUsVCRs
         PGD7Qxot5TJdtU++cKxQRXQyRrULS6FrBqKsVsOCQw4rVDv2Q5zawOmebKYItv/fOkV0
         Z6SVgQ4lRLT7D0QtXcvVFf6Kp0by1YlKNNVp9rkHamvnyAUMbKN0VmG5hGCVySsjUIxy
         6kog==
X-Forwarded-Encrypted: i=1; AJvYcCVCSHJAy6MQBTImNXkykOCALKRdjL9N/05vIE5bqpoPHP3lHcmAOis4QIb09a9Q3NJbsW3PIoR5jzATPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKN0mTesVXNwsDgRpzPqFZCLNgq/fuaJMUYYxs9fruTNaePxHs
	RRCqJAjyfrnkhKufgG80XB666OhHO8KVAvqE8QfS3hfOQO2BDE1gaREjkdt44ujlwX+p/r/hxZI
	EYga+HkurUhyObU2WpLlqKJWcngPCfLADj5hzUPjHnV3PAd0XQWEKQbXLd3pH0Mrmgg==
X-Gm-Gg: ASbGncvcGU8ZVh7qvidVztew4Pwj2dc1RWKLYEprM93fz+tfF55wkSJk1skIvVp6Oj4
	/9l/oqoJQwnXYCZDnoP/JopRsPAR0LYbZxF0HjHGD0k6dpWSudZjI74/tveTCu434XNYILU6rhH
	SUNXmDdyTsabWL+QNbmnosYw1JM1CIdz03VS3/J68JylvqrcD4JOGukKMx39Hf0K0wXM8bx+lD3
	/5cYk7ddz79CwuQ/mlpkr2wv7OxyhPcXsmGyIh+melGIibXX5BZXOMjzo5NDLMgARU1ygH1ECod
	ERzUQwFJoEC9ikkNYBB2FT3j0NbgCjGwlKirLy0oSbQffhWjPNj5Mv12Cn7ckC/fpFcZgxniFIa
	nvI3Yy5jBYSiBEh8PuP51lA==
X-Received: by 2002:ac8:7c55:0:b0:4b2:d981:9d4a with SMTP id d75a77b69052e-4b30e932ab7mr175134541cf.6.1756988980337;
        Thu, 04 Sep 2025 05:29:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTfxzsYnZYb0m5gz1tPNelxJIih7NJHAZeds3PRFC3JhLe9jDQapqBbetmcr0xmuOXgNFQcw==
X-Received: by 2002:ac8:7c55:0:b0:4b2:d981:9d4a with SMTP id d75a77b69052e-4b30e932ab7mr175134161cf.6.1756988979595;
        Thu, 04 Sep 2025 05:29:39 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b045e576edbsm537149666b.75.2025.09.04.05.29.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 05:29:39 -0700 (PDT)
Message-ID: <cf6b7766-0c67-42fd-a67e-ce349688d9a1@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 14:29:36 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 7/8] arm64: dts: qcom: qcm6490-idp: Add WSA8830
 speakers and WCD9370 headset codec
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        prasad.kumpatla@oss.qualcomm.com,
        Prasad Kumpatla <quic_pkumpatl@quicinc.com>
References: <20250903151337.1037246-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250903151337.1037246-8-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250903151337.1037246-8-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMiBTYWx0ZWRfX2Bi9j/Ppkb3t
 7/BIselb68NOx3xCsOprcyVTxmtT0uaCf8WvR0KkkdwrrObhZvyEjdgr9hR32Dim0/gmSLQkfij
 aMdCE4hwZ+Viqh99U5Nv8W079HcRXxSmfqT1tg0Z++SWqXukgR/YPLR+JLQ1OcnQDRndshYMPjX
 Y01Ao5CrCNx2nnbjp2Ftr46+fNTayx7RIIZwAyQGbQBxwdcWtQZGx9p4EgWvUY7EgsLGSO2AtNY
 FJOTNiaAPAZ9LbqgA+IpcEkdGY6ExzbyP1GlwU02kDQyvqSc9YB3Y6EgFHQmQUwSnmet7zWOcU1
 7RwN45d/2sCpuXy6xhyuIvmJdy0u7dxwnJllLWo+MenaZrIt6Ej9SzYXdAiVOVWSsRaSm/0mI9F
 tcweFLxs
X-Proofpoint-ORIG-GUID: RYZblwlP6f29l8f5uRCHpOxs_sTg-_nU
X-Proofpoint-GUID: RYZblwlP6f29l8f5uRCHpOxs_sTg-_nU
X-Authority-Analysis: v=2.4 cv=M9NNKzws c=1 sm=1 tr=0 ts=68b98635 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=q1CUbaEDzoJ2oNbkCL4A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300032

On 9/3/25 5:13 PM, Mohammad Rafi Shaik wrote:
> Add nodes for WSA8830 speakers and WCD9370 headset codec
> on qcm6490-idp board and enable lpass macros along with
> audio support pin controls.
> 
> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 123 +++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sc7280.dtsi     |  12 +++
>  2 files changed, 135 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> index 8ed6e28b0c29..379ee346a33a 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> @@ -18,6 +18,7 @@
>  #include "pm7325.dtsi"
>  #include "pm8350c.dtsi"
>  #include "pmk8350.dtsi"
> +#include "qcs6490-audioreach.dtsi"
>  
>  /delete-node/ &ipa_fw_mem;
>  /delete-node/ &rmtfs_mem;
> @@ -169,6 +170,30 @@ vph_pwr: vph-pwr-regulator {
>  		regulator-min-microvolt = <3700000>;
>  		regulator-max-microvolt = <3700000>;
>  	};
> +
> +	wcd9370: audio-codec-0 {

nit: the trailing -0 is unnecessary, as there's only one codec

Konrad
