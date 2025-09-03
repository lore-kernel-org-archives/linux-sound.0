Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DABA2F0C64
	for <linux-sound@vger.kernel.org>; Wed,  3 Sep 2025 09:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756892071; cv=none; b=XCp8+51Sm8mA+knxC5zE9Eg15sl/dpYoOMFrf6h/TO9lchnLSdnAAthipNgqlmmOVi53lJwJro8mvWoAjlW45SQCuoDZKoynL7Q5u6jb7vJks/Cb9lghMT8qHIFN2GM2qeV8A/b6pFWdBJkJxYgBmJPWqUd3buO1/S9J9cCwTJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756892071; c=relaxed/simple;
	bh=k99mFqKcbrXmSfgyxDpumBLWWztr6/dlbEmY47pyhfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=WlrPYzqLQOPUZ9nE9lvS4mjku4eOxmaf9+kgZIcJpzwEww/CU8oxhoW+LYj385zi9cFWofXbwy8O/0FMsbHXSHaE33Pk3ePxYJorU1cPTD0hYPjLyJkxyBUp56x4u2qRuULk+1OWYgLwfByG4g+/z10osuyMSV1yamUkmjgCTD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D0GFhtF6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D0GFhtF6"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58322TTW019738
	for <linux-sound@vger.kernel.org>; Wed, 3 Sep 2025 09:34:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yyPRprpshXznCs5FcBlCnF9Hsm/bulJY/Z/Gs/qTIaA=; b=D0GFhtF6O96nXgl0
	We9gI44TYrAuD0QNhqjRLS3X2/qW+3ILkHHjPl3sRk30HALepHXgR/oNiNahXobN
	1/WVyZbxYcHPuf5DXNLR9Jyg1IEkVsfFr6NBSfBUTnY0AaEEc7UYSDxgWeTK85mR
	yuRmOgVeXVoNQZqIB42PtV/GM28H8VtqdlbJTkncL0ZVeyfqXFtSZisFAI+rv1uh
	Cm/MkW62AccUO7nAqvMN9Wqm/qw+oVwPbqUfFNEUjJD7X/kAyvkVseIl0Crgl6tL
	Rl0s0rzjWhUNptJumC6GA9jqLnE1pFZ5Bd/lxMZx/JRc/svj6DCvVsumH4otwzc0
	IL2oDg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw033h3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 03 Sep 2025 09:34:28 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b32dfb5c6fso14975401cf.1
        for <linux-sound@vger.kernel.org>; Wed, 03 Sep 2025 02:34:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756892068; x=1757496868;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yyPRprpshXznCs5FcBlCnF9Hsm/bulJY/Z/Gs/qTIaA=;
        b=vvznGM5pco9+nW62z5RdDYOMnEm/+AZRWmzSwLorhLGI18FRoUB3FUqOfxq3cM7O4h
         th580ybGt0YHQ9y/AleZeZ7I5943c6X065kK85XjmuLdJgdzRMJMQYfITsyJuWs0PlO1
         KgD1e3/au7f33034ufvWouTLjAWFQ4N4NN9pJDKuwEQLfeSFYjyZ+u0W7vFrdgGjH/Vp
         LKTfx9tBgF4l6oiqYJ2Z8JcAIQu8XB3GgmFKrpVX2L7Ikn6JDkEjiOGJxjHgvCPzDV2k
         H7DiU5M7023XZeMP5orZL8ZSVRbh2IJrqwr/yYtCPi1d2TQkBvYAgQCwCbsDeC/BaKxX
         iwcw==
X-Forwarded-Encrypted: i=1; AJvYcCWWetKSSL96sllyqZzqd4+sAwRGo27fczOQRHHubFutdaFgxtK01fkFxx0Jj7j5kWbKgpeFP4Ww0kV+MA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8CdkN71shl1bl46lrWVXBUcs4mbYxLKMB5oGfEwcwSH16Gp3q
	jDAFuxeON9U0uu+4gCaxvBMBt1JjkL+O0O46whs4egonkW/nmIUyuKCMzzJS9LAVe0NrloyZ8Pn
	NATFKCum4oH3YFJtpuMC9c8iS98rRkkXe3WpcGmCS77bp35oYBY3gsFOAnRisQC+zug==
X-Gm-Gg: ASbGncvToDRUYAZaWsbltIPjeHH4XSJHlAglncuyVax75xbMD1zm6gwGLLp8MQvciNS
	Ih0+NrVvXN3QVQlTAG2Z/vY+dvCHDcm73GLod6MyBRNO8CgGLrwLhsjZ3uYPm+LEK0tikRPGMDx
	U3k3AO5Itv5B7dI6i79qe5s2zxzbhadoj17mv2Jk3zeDP4uyVvSVy36ok2126KymY3qB29K3aCt
	eEJ1JG20ZmMtB3XSeafJ1wmF8eyA1Uf/k0oRiF2xVOzQjcNqG0aJyo1NRWfo9Nuk2BnE0mtBDMY
	jnmASCKOF9uhWdUkI9rNDlO/c4XnpgixMS9Y4Vb8uDg3GDcFpXiu9ZhYjGFMBlkDTKgRF0nAw9i
	Ezv2gjEpq2+BmahtNzMXwTw==
X-Received: by 2002:ac8:5710:0:b0:4ab:723e:fba7 with SMTP id d75a77b69052e-4b313ea00camr144441211cf.7.1756892068013;
        Wed, 03 Sep 2025 02:34:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFDTBcppto8XLOKJk5x/oor9svNZrww9ip34CnGvwDiPoUfu5cpSAuZRsl2sn0sMXTVgM2Iw==
X-Received: by 2002:ac8:5710:0:b0:4ab:723e:fba7 with SMTP id d75a77b69052e-4b313ea00camr144440971cf.7.1756892067585;
        Wed, 03 Sep 2025 02:34:27 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aff0ed6ffebsm1200591966b.32.2025.09.03.02.34.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 02:34:27 -0700 (PDT)
Message-ID: <666b4115-3e81-42c8-8519-f6d7b16c66df@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 11:34:25 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ASoC: qcom: audioreach: Add support for VI Sense
 module
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250821141625.131990-3-krzysztof.kozlowski@linaro.org>
 <20250821141625.131990-4-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250821141625.131990-4-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UgMXnULsV0v9Y3F-kmIqyoA36DiwRy_E
X-Proofpoint-ORIG-GUID: UgMXnULsV0v9Y3F-kmIqyoA36DiwRy_E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfXxn86hxioqxKH
 rUW+fRkuePKwyzm0wOoVXSahuq9EEPJQKRIIAXU7W7/naMeOrwqguxrC7NgFRHxs+qKcAsq8slr
 mwhEpNZyadxnM3mdkL6i9E/FPYIUZLDPIGI9KlwQHodtw9/CF38xtlQduiQBlp57l6bdulMN1RH
 8SAr9BGtEZghNtFZ1fnYjJehqfMoRhpDNA7sHsx2IQVrWUIcx3oGsepzTZj24biSUUBRX3ZzM0O
 jSinqc5MJ6cczSFkZfvH0AW0SsKxepse56yVH9q042GjTjhCV4XKiITtYLVIo90BxtszdC7/HKK
 00kVm+cX+MSnhw1EhmXmpBseXH4vKLJlOtTm9bkvFDUnQSWH96ikHkMPhUFd8jYyHLXWmT6GiiC
 SKGC7T2A
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b80ba5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=rH1WamYxNCqinqo8aXAA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027

On 8/21/25 4:16 PM, Krzysztof Kozlowski wrote:
> VI Sense module in ADSP is responsible for feedback loop for measuring
> current and voltage of amplifiers, necessary for proper calibration of
> Speaker Protection algorightms.  Implement parsing
> MODULE_ID_SPEAKER_PROTECTION_VI from Audioreach topology and sending it
> as command to the ADSP.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

[...]

> +	uint32_t num_channels = mcfg->num_channels;

u32

[...]

> +		/*
> +		 * Map speakers into Vsense and then Isense of each channel.
> +		 * E.g. for PCM_CHANNEL_FL and PCM_CHANNEL_FR to:
> +		 * [ 1, 2, 3, 4]

"[1"

Konrad
