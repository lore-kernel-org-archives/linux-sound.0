Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170BE25DD04
	for <linux-sound@vger.kernel.org>; Tue,  4 Mar 2025 16:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107359; cv=none; b=bppWImPhcbq/2Xw9n5qiTu32Lxtg470TwCGDC6kAu0Q6+kNWzsNI97beH7gCmOcPMQ7EErUTZhOlwNV9o6UmN08G4oHbIAZOMZRvTiV6XCsh0gy7FYlj2KpTURDJ+S/tV/bb1vhe/h2gJEwu6hT3wdf4fEa0w5oAHfrmuh9mO5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107359; c=relaxed/simple;
	bh=r/DvbsjnuXtNkca7ayYBCnbQtj/RQP12nt2K/ZapVpo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HwtdIgseb3reYvd3wqzI808j3PvpOoaPxsuSQCBJ91CVTC2s67WoB1R2umhX8grcedPJjGB1NX2ArB0bz2uVM+X6/bzprA94r3X3OfCBrRah20CHV14cLwcvxMDy1a95VLysAFk+pTvmyoMzTWw7LKQ1fiSa6HbGSCUDL5qXpcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=niOmmo7I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="niOmmo7I"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524AW7VX025636
	for <linux-sound@vger.kernel.org>; Tue, 4 Mar 2025 16:55:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rwpnOoisIGJ3BRBv2r/rXIZnOMVlOWndF4eZ4cwFlp8=; b=niOmmo7IpsxGmaTv
	+qgeN1IlxDnHG/w3Bs9rW9bIZL50H+O4YmfvbKKEQq1HkF/d3XFJOyZEyoxrjkn6
	MalRhXS3ThQcOxqOUZGdSrgJrIRMJ567daBAWCWbc5t/1y9zDVU1/w6lVmGF8zCw
	GXPnCm+huWVaVJnk9mXibdR/yQj5WW70+ypZ4buQCEJXQj/h/ha7PUhVUfmWJu0+
	Bs5F/vhOz2svWbwytKxOL/DiiFxQ41Y4ye+CuHtNy02hvf6okOtfbJ2VaFv0Nc3e
	6mfHHSWI5uzeQS2WEbAUyX8Ej9p6AaKGUAClP8bK8kPTATVGWve2v6WTD3neZ4UU
	z/zoiA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6vagap-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 04 Mar 2025 16:55:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c3c253eca4so36043485a.0
        for <linux-sound@vger.kernel.org>; Tue, 04 Mar 2025 08:55:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107356; x=1741712156;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rwpnOoisIGJ3BRBv2r/rXIZnOMVlOWndF4eZ4cwFlp8=;
        b=gg1PBzwtdCG1LYSn7BCHPnRmjVXwv5bBGE+Se8o51kMsfIHzSgRmPGIN4W59d7YsvE
         EyvDaRSlJIO5k6vX6lH0qUvD0QrrohDX/PzxtnFoUNsccoJ7NsAcUPlDfhOkc4TgP96W
         EP9xqTrFfRxH31bcdC/RaQv96xSqAyQOc2bWJOqLMJaA+7AKa8VmLDYkIuCDM9SJqinF
         lMNrC0+eg+ojTx/4kumpxt6Y6fiWny5uB0bzVcaBkWz0WoFCsN8PpGGoQbI4mGXy7s/+
         GlznOmtrVSyQdw9T+fIic74Dqi3eJ928Mn2xEgBQcoDuS+qy2psnoDmkO6MC+bSArOFU
         jtNA==
X-Forwarded-Encrypted: i=1; AJvYcCVffwCEW20pjmvnXcgzlFRXi1RTnTunuVW0dtHMt4P2c0Z3aqNiT1K1hx5IvYVuyfvJMKxIWnpYuHruZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzN3Qa/EacH1ewCjab3+Q0ZEGlrcPIww19z+NFkYFSwTboJZFXF
	Kh53Md41KIPC5KlOSBr5cgdNHUDoVZxKJTMOC9McB9Kx+DCzpq2uDcxdHmYzIV/jAFskfmOtb86
	GExVulDjXNod/usL4KJcxdfrCnZ09fN0RMQJk3g2seDVTOnCAC+9l1v2NTwikew==
X-Gm-Gg: ASbGnctYz4VyJvjdKNvYfU8Yv4UWol+O60Dd23IeBwIniW6GGSGX9jFCSrpTRrHF6va
	Bo+av24jkPDSpkAACwfXheXnZ2bnuL5nJlj/aFmVPS77Ki3tTDik34hFnM+w55tMAN0n3V696ZJ
	LZEsmgDNpk4KFQJ85aRbvRasjEHdpO6TbwlbPFCGgj+f3SZ5vAniQXhuvc83kYGshtBCCLoG7YI
	TvbrptDMgNwkaPTAxmDKELYhnszm+w70Zw6CnxJ2kA1bVXLJed2m5+15MZVSnIylcDHOYfpvYPt
	y0s5jzlJo9cXoAUjEmdA1HXqZMTGYKHq8AG30H4S+X/XVfQaEKwij17Uy0uckbRy3yOgEw==
X-Received: by 2002:a05:6214:2aad:b0:6e4:2e03:c54c with SMTP id 6a1803df08f44-6e8a0d9dac7mr95886726d6.10.1741107356038;
        Tue, 04 Mar 2025 08:55:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFq7ahIUoFMNjamlq8ir9GJJn9WalD116NggZ7aKriJAYx3f0Ea4t1Gl6p2rtknS5Dwsag77w==
X-Received: by 2002:a05:6214:2aad:b0:6e4:2e03:c54c with SMTP id 6a1803df08f44-6e8a0d9dac7mr95886526d6.10.1741107355648;
        Tue, 04 Mar 2025 08:55:55 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm366330566b.131.2025.03.04.08.55.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 08:55:55 -0800 (PST)
Message-ID: <f9ce1585-d3d5-460a-8374-4a5f1733bdd6@oss.qualcomm.com>
Date: Tue, 4 Mar 2025 17:55:52 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: qcm2290: add LPASS LPI pin
 controller
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20250302-rb1_hdmi_sound_first-v1-0-81a87ae1503c@linaro.org>
 <20250302-rb1_hdmi_sound_first-v1-4-81a87ae1503c@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250302-rb1_hdmi_sound_first-v1-4-81a87ae1503c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -jr3p3L5-wjE1xQnSQ5IIhEV1MOUoQsq
X-Authority-Analysis: v=2.4 cv=bPnsIO+Z c=1 sm=1 tr=0 ts=67c7309c cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=3rbz0kGMDrCPfV1SW24A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: -jr3p3L5-wjE1xQnSQ5IIhEV1MOUoQsq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_07,2025-03-03_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 spamscore=0 mlxscore=0 clxscore=1015 bulkscore=0 mlxlogscore=967
 phishscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503040135

On 2.03.2025 3:49 AM, Alexey Klimov wrote:
> Add the Low Power Audio SubSystem Low Power Island (LPASS LPI) pin
> controller device node required for audio subsystem on Qualcomm
> QRB2210 RB1. QRB2210 is based on qcm2290 which is based on sm6115.
> 
> While at this, also add description of lpi_i2s2 pins (active state)
> required for audio playback via HDMI/I2S.
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qcm2290.dtsi | 41 +++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> index 2c90047f7dd867580836284721c60ed5983f3f34..623046ba833b6da284ffa4e30e65ea4ae5fb77a2 100644
> --- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> @@ -18,6 +18,7 @@
>  #include <dt-bindings/power/qcom-rpmpd.h>
>  #include <dt-bindings/soc/qcom,apr.h>
>  #include <dt-bindings/sound/qcom,q6asm.h>
> +#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
>  
>  / {
>  	interrupt-parent = <&intc>;
> @@ -650,6 +651,46 @@ data-pins {
>  			};
>  		};
>  
> +		lpass_tlmm: pinctrl@a7c0000 {
> +			compatible = "qcom,qcm2290-lpass-lpi-pinctrl",
> +				     "qcom,sm6115-lpass-lpi-pinctrl";
> +			reg = <0x0 0x0a7c0000 0x0 0x20000>,
> +			      <0x0 0x0a950000 0x0 0x10000>;

The nodes look good, but this addition isn't correctly sorted

Konrad
