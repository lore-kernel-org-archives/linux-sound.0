Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A3E1A0BC9
	for <linux-sound@vger.kernel.org>; Thu, 22 May 2025 18:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747937571; cv=none; b=sdRzwL71rZQo0M0XzeKSmUf5jbC+8UV37FixKoZh3uplJvdT/uILU2NFa7s1SkSbUNmZ8sRayP0ReOiWpyYcvH6Gdpd/aXJsjHzPU3j5GyiX/pTdp3iqfQH9dFwJIukSc4MCyUmjZKV88vQk3pyS/8Wr5tGzbdFS0Q7/o8asxjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747937571; c=relaxed/simple;
	bh=4+L3iLZ1PQ+3x9OrSxwxJm5UHnJLQRCjkTTkw4U8OIQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KDpf52hd9g220dxmi5DlTHCemcnjFuONo+NE6V49FLe6+vznZ+D3FlneNJgc8ah29UR8I7GNcsOphAyeXmg+87PQZNo9CXd4xfjouEc+mel/hvdpy1I1mZQGuiKjhqXMIVqKbBAB4X5+naIIj43mYrMOvTt6G4zWRD4Lal/jPX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SvvJmXzs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SvvJmXzs"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MF4FYF020953
	for <linux-sound@vger.kernel.org>; Thu, 22 May 2025 18:12:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rHki3C+ZJvXgoBcG7+ipq9fxEApEk5oINZU9My5zwuc=; b=SvvJmXzs4qhEv6e4
	eu5PSNbUjxTvBr3wpO5xfBrukRDoZnoUGkAbZquRuMqauab4U/JvX1/DCkkCF1Q5
	pgRiYI1cHElaBcsmuGjmrGo2+e9Sju8uoH4jnlcU9We5XJAc1vHw65Ci5kbtkHJX
	+0J3vU8dye65Nz1TCuMoS5Rq7G5UZ8puLgM5q45gb1oQ364chtrxl1j3DV4hJ541
	MSBym109Lw3QrwchAGPl6EpRfg+oFjVhB2OjVfdBYpvRwikJJ/sNYn56djEnlK2l
	WfQMzqYBh4rL3omNI04Oufc7JOuqGvFzG82AcKB8zkudukePlJ3sQO9xCs4lVGp+
	7l3icg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf07g3g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 22 May 2025 18:12:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5af539464so227956885a.0
        for <linux-sound@vger.kernel.org>; Thu, 22 May 2025 11:12:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747937566; x=1748542366;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rHki3C+ZJvXgoBcG7+ipq9fxEApEk5oINZU9My5zwuc=;
        b=wgO8myr7LyEgdLYyypnARzwlIEBeGE6RMwvmisRhB2sTdwaaRV3kDsJshF2WnzuzMs
         srunX5W7GcT9o5T7cyWP5CKO52ZP3kl57B8s3NiMv4op8Sp+TYkL1WgRoqibbqzAHPsY
         yAAvwPKfalSAep3PbL7OHwUU8MQjdk1C6dpCIeFFy34RwRPuC2j4V2opRCLBo3BkfI3m
         ztRW9ZHFRncEm109KM5hnuJ/oOyBQjYlVfFgVhi6RZN+jucFsq5N+s821GbS1Bqbep5m
         VeETDgfzPcZ16kqkU41V9j3F47zfB4+bhCP93MIdQIdNfSsU3ACmIxe2zaQHS0wBUkW6
         Nxfg==
X-Forwarded-Encrypted: i=1; AJvYcCUPMQ6gR2ImYb/tg9EkycSWqBpFDIUZN6VWTbkxXu0YQkxSXRx8HGmceHJ9XRy3EyhvBpnS4Ngm6Va0Mg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJLhc18ZlYjjkC3zM73Y4dnaVo9tOKn9DL3moI7/03JLF33X/F
	+0+xR3szKEDRHHW0kXU0SRpzTbxkVpA/AfCASSEcDvosJZrI/o9hQ4YV7p0vkUEAWGJvLhAOd+J
	Cq3eZ8bS5nMOVl3hnmSqufHuW1eDMpVVuYGW7d+5K85dDZX0FPLnPHPhqLlTfmLGL7Q==
X-Gm-Gg: ASbGnctM9QABDiDUla5mi8n8TPikaR1VDcHAiBlb/2XImxWA5DZsYi1sf1TOX3F+de1
	QgL2ZGujYjO0Ut7oCzGu7Q/zyuON3zfc9cwM8ORtU7YCVSwAFP2KCM2tDYWOHzevqc8MfNmK292
	bdXs/VYJq9V72l2DT07XnA5icgfK5ZuG0Z9gETlpj5jbY3xEz+fnpYRe0LO7fQ7JvEvKbMHLkY/
	GOVhA7SkRNuKGYwQPqk6NXKF3Npe0M+N3qOba9yvssaxZJU3RzJdRmxucabBFJ1qx8GgBNUfkMq
	A+Nkyz/lNyvH0PUbhrkeaQT9o9Tzw8Xk8QMJlF0cd9jt0QSnaIn8H01hAPVXMtJabQ==
X-Received: by 2002:a05:620a:628a:b0:7c0:b81f:7af9 with SMTP id af79cd13be357-7cd4672fd7bmr1648092685a.6.1747937566294;
        Thu, 22 May 2025 11:12:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKApsZc0tAvzeoyie/NaHZmrsLj7RHyx8qKKdLeYJhqJZ/GOhS6Az5AsscGMsme0KdMurL7Q==
X-Received: by 2002:a05:620a:628a:b0:7c0:b81f:7af9 with SMTP id af79cd13be357-7cd4672fd7bmr1648090685a.6.1747937565936;
        Thu, 22 May 2025 11:12:45 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d43830esm1123536966b.98.2025.05.22.11.12.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 11:12:44 -0700 (PDT)
Message-ID: <a8b2f310-2b1b-454b-9977-f74d975e6e66@oss.qualcomm.com>
Date: Thu, 22 May 2025 20:12:42 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/12] arm64: dts: qcom: sm4250: add description of
 soundwire and dmic pins
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
 <20250522-rb2_audio_v3-v3-8-9eeb08cab9dc@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250522-rb2_audio_v3-v3-8-9eeb08cab9dc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4Gt9ufUVJjX5a7yo4ueaajqGuYLRy7Nn
X-Proofpoint-ORIG-GUID: 4Gt9ufUVJjX5a7yo4ueaajqGuYLRy7Nn
X-Authority-Analysis: v=2.4 cv=ZP3XmW7b c=1 sm=1 tr=0 ts=682f691f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=tiPGpea89PUxzv1JMdAA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE4MyBTYWx0ZWRfXzJ+keBCoKiKU
 rNwcxPu5JzYT1jBd7U8PmFhX6ob4EW42nG00tqVnt6a6ftO1lqZaQ6VE2lTNLLMyxkcapIHTWql
 iBRkt/MIivUNkeQHCL3ki3XznAMFC6T0R6bh4005wAAZVsA4kn+ovfWWsfL5XmJZOXvYK3Xjf5E
 +IuM1w7a4Da7kSUvLY1fe0QI88P2NDYu0MLI2Aow1oKOF3uqZmVkOc1fixMbDxXg17GUGXNKo6C
 px9y9KFsHUBlwkQdZcIux+VtKsUtce2VnZxQuWi4lu+wIqXmBVn6jHOGCRxqT2lxag+AE1AvhWc
 NXnJq1O+eOBxCoiLOcFLkJe6lRvFZ0CsrubWBWa+aExYnvD0XkGm6r/vAdfq1k8gC2bVoRX9KpP
 qepItIE+thjkrbzVHW2URhc+etXL4gBqMZTCnGVNJD53sb44FMwxSnut6RypuT9ND9tyh905
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_08,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 impostorscore=0 phishscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220183

On 5/22/25 7:40 PM, Alexey Klimov wrote:
> Adds data and clock pins description (their active state) of
> soundwire masters and onboard DMIC.
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm4250.dtsi | 62 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm4250.dtsi b/arch/arm64/boot/dts/qcom/sm4250.dtsi
> index cd8c8e59976e5dc4b48d0e14566cf142895711d5..723391ba9aa21d84ba2dda23932c20bd048fbe80 100644
> --- a/arch/arm64/boot/dts/qcom/sm4250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm4250.dtsi
> @@ -37,10 +37,36 @@ &cpu7 {
>  	compatible = "qcom,kryo240";
>  };
>  
> +&swr0 {
> +	pinctrl-0 = <&lpass_tx_swr_active>;
> +	pinctrl-names = "default";
> +};
> +
> +&swr1 {
> +	pinctrl-0 = <&lpass_rx_swr_active>;
> +	pinctrl-names = "default";
> +};
> +
>  &lpass_tlmm {
>  	compatible = "qcom,sm4250-lpass-lpi-pinctrl";
>  	gpio-ranges = <&lpass_tlmm 0 0 27>;
>  
> +	lpass_dmic01_active: lpass-dmic01-active-state {
> +		clk-pins {
> +			pins = "gpio6";
> +			function = "dmic01_clk";
> +			drive-strength = <8>;
> +			output-high;
> +		};
> +
> +		data-pins {
> +			pins = "gpio7";
> +			function = "dmic01_data";
> +			drive-strength = <8>;
> +			input-enable;
> +		};

Other SoCs put these in the common dtsi

Konrad
