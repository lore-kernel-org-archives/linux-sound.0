Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B2B14B94F
	for <linux-sound@vger.kernel.org>; Sat,  2 Nov 2024 09:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730539828; cv=none; b=YTPwYclPQ2qwG1dsW7N56cEA24uqfv2TdSH+FQEx8aiHLoKlsJVk3w5ybDWugef/NRpbTySr1P1LKXL/PuBqXn29f5ViGIU+7utcJfWgV8tW6FLDHtzxvGkCh4KsZZ8BT0KjiNQXTOPgeIbZstJ4SNL8827MA/5Fktp+j8MGvf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730539828; c=relaxed/simple;
	bh=KguoIWYcyHjI/KTVd2RGJJ5CuHRqYCPvOiQw9hWn1/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QSMjxx4wVh4iloW/JRk4yTM3nuFtpbEAkYqOCP6nPOGjJDLB8WAR9FlYUwZVpmJuY2nBZqv7nKOm4RECZXqrMhMKO0zfYR77y+Xyi9AUGgB9XEH9c28o5K7GvTLN8jLSMDd9yQ3+O/vE+WfGrr6dksyR+YCvmWmj9BQrQ1eHrU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UP/DPhS+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UP/DPhS+"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A250bJN030452
	for <linux-sound@vger.kernel.org>; Sat, 2 Nov 2024 09:30:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BkeD2HeLP970ElEG5FogJPdESKQj6KjvxZECpLrGFKk=; b=UP/DPhS+hN4UnU8g
	ja5FeCMt3i4ucwlir98n0a38a929N4aZrmnNupnPPGDVOR1DbNCFo7AEH4zpIBq0
	VXQD4quYSFFaRMn5kQ79ugSI4VroWKgtH9JcLK+Oftbl8cHCnDVDwqFIcn1qcqRS
	aT/EDRGptbt3e3plC31abpiO4qStldL3O9RKHfe6CNszfSBKbkharimssONpqE9i
	q58mB+fiBPHSzbRI2yIKQIVVDtIF+G00ViotW2xbuuXMmAS2jf5+ci0Uba3AOZe/
	/tZdVAOE7NkRucPDvomc+mQ0kuohpwaPPxlW47sKOK73k7KP2j4Lr0GOAcQi+GV/
	rVf/gw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd5cgdfn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sat, 02 Nov 2024 09:30:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7acbd9dc5a6so32277585a.0
        for <linux-sound@vger.kernel.org>; Sat, 02 Nov 2024 02:30:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730539824; x=1731144624;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BkeD2HeLP970ElEG5FogJPdESKQj6KjvxZECpLrGFKk=;
        b=UyTC1xZfjbGhbzZ0E04IklfmFBUBHm6WBublVf21mvQ4Ogh3tZv+AlCXotRIYVi9Ct
         4ohqRS3VQiNs0ndB34KKSi04fmA5dYLYPGnvKXFi9cT/akAmyBCvlvrskOjh15iJ/ak6
         FWeOy8m21krW6G0TGOVWChtfWSAYqL+cZvHJST1NUChRImPgs5kj1bP+vmnrPB7a59+A
         FVSIcBNkBY4FWLH8uUwzezIkQxrR/Geg7t8+BRIvjcHW2A0YFhvQPCGoyddkqXtCXCju
         GEw4NL5nUYW0/EASxdmewejJUbOs9T/R29s31jQEz01O6wRm5JaN0+mW9Itj2meildgk
         wszQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/4QP1s9fA+N9kXiEU4GbSx7X7aGaJ6JqvvOjiCUZ95Y7xRUrQFlu8zsJzewHnEWqDrmyRlXq9Fr4UXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGDGVlddMGTE7rrt0FvUEJQVdreZenKj5xgfQvgjYGUNnFA8yO
	BCnZ5PDOP7efAJFJljSSubu0QsUv7hK78J9IrZ6zpX3IFRpW2WOR6tt7JbsRNxU7UEUpqrwuXMm
	dm4TN3jWFXnL3rLjFGSbQMxoXVyc71Nk1Y0CbtEJ/uGuvpO5iWm1gVTJIpzOmtQ==
X-Received: by 2002:a05:620a:4687:b0:7b1:45be:2e93 with SMTP id af79cd13be357-7b193ed1cc6mr1776340385a.2.1730539824121;
        Sat, 02 Nov 2024 02:30:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTn+cmJ+8XggYZPxMks84hd5eMzE9GVnlaPbjGcGjUXNk5B311VxjwpRp3dbrLk5HLSAW3Dg==
X-Received: by 2002:a05:620a:4687:b0:7b1:45be:2e93 with SMTP id af79cd13be357-7b193ed1cc6mr1776339185a.2.1730539823722;
        Sat, 02 Nov 2024 02:30:23 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e566447a1sm292887066b.176.2024.11.02.02.30.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Nov 2024 02:30:23 -0700 (PDT)
Message-ID: <8078589d-d724-422e-a5f0-f5b6c67deafe@oss.qualcomm.com>
Date: Sat, 2 Nov 2024 10:30:18 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 08/10] arm64: dts: qcom: qrb4210-rb2: enable wsa881x
 amplifier
To: Alexey Klimov <alexey.klimov@linaro.org>, broonie@kernel.org,
        konradybcio@kernel.org, konrad.dybcio@oss.qualcomm.com,
        andersson@kernel.org, srinivas.kandagatla@linaro.org
Cc: tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.baryshkov@linaro.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241101053154.497550-1-alexey.klimov@linaro.org>
 <20241101053154.497550-9-alexey.klimov@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241101053154.497550-9-alexey.klimov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: OiV0xPvHzztWvULX0htIXgh44lpdUxL0
X-Proofpoint-GUID: OiV0xPvHzztWvULX0htIXgh44lpdUxL0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 mlxscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0
 mlxlogscore=838 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411020084

On 1.11.2024 6:31 AM, Alexey Klimov wrote:
> One WSA881X amplifier is connected on QRB4210 RB2 board
> hence only mono speaker is supported. This amplifier is set
> to work in analog mode only. Also add required powerdown
> pins/gpios.
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 45 ++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> index fc71f5930688..76b9ae1b0ebc 100644
> --- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> @@ -63,6 +63,16 @@ hdmi_con: endpoint {
>  		};
>  	};
>  
> +	i2c0_gpio: i2c0 {
> +		compatible = "i2c-gpio";
> +
> +		sda-gpios = <&tlmm 4 GPIO_ACTIVE_HIGH>;
> +		scl-gpios = <&tlmm 5 GPIO_ACTIVE_HIGH>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		status = "disabled";

Does it not work with &i2c1?

Konrad
