Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EED1A3172
	for <linux-sound@vger.kernel.org>; Thu, 22 May 2025 18:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747937636; cv=none; b=a/g+y6wfeJ+zZXTlCRS9ca0KJhyvgjEdFc0w2aLk1AwP6BCLbFVuOXUTe3tG9sL0b4Nz+P86T0fgZlXUvCiw7sycx/dyaUtF0/h8TbGOEZeUxhKXbkxGjxbrQnhBmynZWR0ccQguvmnzYcE/LD0xy4ucWgXUEptrhGqVwoFslJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747937636; c=relaxed/simple;
	bh=91toqZEphZKmE9o/rBckXJd1FNa8ApcyPXqGQ8XvA6g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S1JyJXLQeaJkz2NvZMCiIE13CGAV3MMCvbRPf1sC7/4PIsb921xb+ehdSsLChOxmMHO9g78LqKK4Dh4EXZ9CC971kh5AHhP5dosTrTYVZNIDPxqfSmpEQsdvy5laGvL5GmW1l/IuBhJGQHkWo1934XcGkyOWKz8O37BsXchVOeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m9+C8ZOq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m9+C8ZOq"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MGhK0h011657
	for <linux-sound@vger.kernel.org>; Thu, 22 May 2025 18:13:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cJTXM+7S9NgTzSFFl+A5KpdMXXyd0FhjVTeFKwQdXKU=; b=m9+C8ZOq9cNDiEje
	5wxs2n8HsrWNecyEGl8XPaenZ8l/TfNUGfgDOLHH4O+ymVYY0lcn2F3CHzO33uS/
	T3WKZoKFLDhZ+Cl20uXtYL2HkeIKUNr/pWrRS0SFnpOyOOKEZa65GR2PMTPkegft
	nBSnioF31A6ywD7+UmqSuT+4+C76LNK4DU6queo2R0Lf3e4jICLhTFeiKGwehKAO
	oxqZvWmED6FJua0Bq1UwlzjHSzF9J0snSGtG3Og1o/fKcS8Fo5Qk/2nQ6Azf85+u
	yS9Mj6EJFLE6aH+2py6z1uZlugJB4zxQ5TaLNOP1bRg420ujQgcEJ+3olKFLYy4w
	pTt/0g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwfb760r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 22 May 2025 18:13:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c53d5f85c9so207758085a.1
        for <linux-sound@vger.kernel.org>; Thu, 22 May 2025 11:13:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747937627; x=1748542427;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cJTXM+7S9NgTzSFFl+A5KpdMXXyd0FhjVTeFKwQdXKU=;
        b=Tu7fI37bakzSN4A4mC8cIxiKTC9FPRhiEp6bbggYRa823ims3SnRU2h/rnlf7e2td3
         zGM5Y8O7O91+4o7W9EdNmmnntCGmxGM9S0rXiTTIrRT/hDU+MOn9zuBxu2ls4prakMnE
         IUTBuIvvwDsa/tsdMK5KNgJoJb7c1F60h23b7z8z0HbM380nHPs5Fw4O1gri5TmxWTmO
         fzNVIghRfARV0aYD6ObGkvoo2icVWAx96VllUguvqryMmBWVwLEoPp+Z5TjUu/uVhe0w
         XHZbqL78TMW11LBzUPcMQWzFR0GDHoQdVSaxKLAvwdxV2MsKkPlppSDQDHOtbf966Lup
         T47A==
X-Forwarded-Encrypted: i=1; AJvYcCXDkeSqOGK1+PxurzXSrgYGiFnUgBNuCVmjhGQdmEGrwDeuARK0afsvAeDoaCG6OuISeZxDVeD9AepX9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpVQRsh0T6/c/xJ83peU1jiQ7kdGqywNcz0ve2ZAzniTimKU4h
	bpBxcFAadgZ154NtELwji+YwmOMkhPa8oRTx+BJH6P4Fo6YaCEMZZVIhA4U8eP6AP9PPuGd5NDW
	EF8iMHgA8b6z4kwSQOs1uqBU1VDT+hfwJRmGOfgPF/J1vGeHiBPe6YHwVYHm/VQj9KQ==
X-Gm-Gg: ASbGnctdq3ucvgcs/DIJ77bxJaXBbVbk4E61vniNCizsT6ynC7sZbWOXcakcLehpznF
	M8x/GfO/8/Oy2wcjoZ9pPVfykjciVnRUdoJ+PdtC6/tv0aenmxB8kKB0Ym0UPrsq5WMb5Js7oQg
	95GCfQeTJg79RJWqo9d0vPZ80nlTbnwDOF5XWYJSBJVqE9C/9+BvLpUmUwutoeIMcnSxuaY176p
	w990kUNvAsZmm5R9E5uq2PfDoS9oys4vtFUQK4ckcU2tIAO5aMMelXphj74Acsq6qy/4noX7xOO
	xQ03Qb/GeNqSMFb7xAbUrjBCmcSNZwzkIdH2O2kiHMMD+lihlIZADQ6+tIbOJwI47Q==
X-Received: by 2002:a05:620a:6506:b0:7c3:c9d4:95e3 with SMTP id af79cd13be357-7cd46779c90mr1645451785a.10.1747937626848;
        Thu, 22 May 2025 11:13:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFG1s5LWcfdRcLuprDH7NRf4cIMqfzPMsVHaGaLchl1HpyhV9P/PLyDyxgUXuVubSzGN2Rrhg==
X-Received: by 2002:a05:620a:6506:b0:7c3:c9d4:95e3 with SMTP id af79cd13be357-7cd46779c90mr1645448885a.10.1747937626412;
        Thu, 22 May 2025 11:13:46 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d06cdefsm1130366966b.52.2025.05.22.11.13.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 11:13:45 -0700 (PDT)
Message-ID: <c7d5dbab-0a51-4239-811e-dc68cac18887@oss.qualcomm.com>
Date: Thu, 22 May 2025 20:13:43 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/12] arm64: dts: qcom: qrb4210-rb2: enable wsa881x
 amplifier
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
 <20250522-rb2_audio_v3-v3-10-9eeb08cab9dc@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250522-rb2_audio_v3-v3-10-9eeb08cab9dc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: t4bD9u9MZQyCYTTpd6pfxavzLi9dnOTA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE4NCBTYWx0ZWRfX6g3HfLZo4XKX
 laeyDkVmgINlgFZWEFtYJ2wUN3CofXT9eAen+87IXwpvC2ayRPop+LNUgT0IWtxNe0grt5vVyOj
 WlOGPQyGEAaiDC1e5zCT3IWuLp/OPPTMIIQAPPhcKgzkwOBbDIQVPimyg219fW09YsspBbxYpqN
 OEQLgute3kX1LviVUL3/3Ey99fYxEhTcahAmfpNshzEx5Nz1uzulkf6t1YU6vmnPHniGpqSPvGc
 FPjWkuCIW4IUjg1snqR2HK3FZvAvFm5Qx/S7cLJ4sRFRBoeMNKChoEE2+GBTrQ3UWboZzgYgam4
 Z43o8Kdh+fDJUd6o+y727//k7WGP18aAgLKFNentLffcx+lQblUp/gbgRUxf6QzMmoABoVz3ld2
 4k0Ry8t1b4yO/vcxSqVQFoOFv+3F7aa8Q4DL8WT60pD7kMp9zFoAU7EoPGyXjJYMNaeuDLLJ
X-Proofpoint-GUID: t4bD9u9MZQyCYTTpd6pfxavzLi9dnOTA
X-Authority-Analysis: v=2.4 cv=dLCmmPZb c=1 sm=1 tr=0 ts=682f6961 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=75nCLt9WaoCjErCtZgIA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_08,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220184

On 5/22/25 7:41 PM, Alexey Klimov wrote:
> One WSA881X amplifier is connected on QRB4210 RB2 board
> hence only mono speaker is supported. This amplifier is set
> to work in analog mode only. Also add required powerdown
> pin/gpio.
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> index 6bce63720cfffd8e0e619937fb1f365cbbbcb283..4b878e585227ee6b3b362108be96aad99acba21d 100644
> --- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> @@ -270,6 +270,24 @@ zap-shader {
>  	};
>  };
>  
> +&i2c1 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	wsa881x: amplifier@f {
> +		compatible = "qcom,wsa8815";
> +		reg = <0x0f>;
> +		pinctrl-0 = <&wsa_en_active>;
> +		pinctrl-names = "default";
> +		clocks = <&q6afecc LPASS_CLK_ID_MCLK_2 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +		powerdown-gpios = <&lpass_tlmm 16 GPIO_ACTIVE_LOW>;
> +		mclk-gpios = <&lpass_tlmm 18 GPIO_ACTIVE_HIGH>;
> +		sound-name-prefix = "SpkrMono";
> +		#sound-dai-cells = <0>;
> +		#thermal-sensor-cells = <0>;
> +	};
> +};
> +
>  &i2c2_gpio {
>  	clock-frequency = <400000>;
>  	status = "okay";
> @@ -736,6 +754,14 @@ wcd_reset_n: wcd-reset-n-state {
>  		drive-strength = <16>;
>  		output-high;
>  	};
> +
> +	wsa_en_active: wsa-en-active-state {
> +		pins = "gpio106";

Are there two separate enable pins? Or is the powerdown-gpio something
else?

Konrad
