Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B3B20B812
	for <linux-sound@vger.kernel.org>; Tue, 27 May 2025 20:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748379560; cv=none; b=hEscSrYThm2/a1JHkCTmAFLsbLYQBQZOTiFxQdMqS9l0/vGxEXuFgha+3BlgqgtEEu8P/vPc1okS3GMVoUQ3CKyg4LOASlMMKPhJMUlb4+9tD/RhXtudA/r7li8yR5BkFpZMZY7sDU8RXk+vWsldwdzF0PyKAxEqhxG+udpc7hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748379560; c=relaxed/simple;
	bh=hLILqwA03TMgU2GOo5XSBvyoyqXcVa4JHM8elqr5Dmg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DHVfiWuDvm+w0cdP1Gd7OmnM2zee+VaYY8pH+JnCSm+ShbDOJJFDDrMxtrfXDQaKs7fcbTAPOI2mrVpbIGgrUAci/UWILqGPQ/9Zd0KyeQDg8xzTZOJWLv/f4U1ur14fHsIbRd87O9OMf9/r/xdmo5bA+FWfWELLPmRcOCLtbUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Iuw2l/yT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Iuw2l/yT"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RJpZrO007970
	for <linux-sound@vger.kernel.org>; Tue, 27 May 2025 20:59:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7rMdgPJ4nsFZQ+D9Zc2xAqAauQiMo58uxaIZ/TRNt5c=; b=Iuw2l/yTW0MjmIMp
	t6Ayv50oREsH+0S1ypNPrSibzookgtd5XEO76fRmnS24rNTRl5xMu8AHwO11Q42w
	bLJvPUZioycEo+GlRDIUVSvOnyq0bCvJBLlYk1nhoZUp6hp1rx6LMM8J5OEhVyqi
	MeNt4T8XP5reCedY3LPYT3uhT2AuYIVVM1JQXvSMm5au9xojG2tjaiu+g+WQkV7z
	VxO1QxqeJYT2/WsfTUzfLn4QHaOC4qFNhGyvTTsAhAt1BegsRKMhdyYrVPkTvg9j
	HuQfiUlAAm3bveK+BrWuzsmHIJ1OCr1y8Ht0TTbKAxQ2SOr7pxiJVFmQAOtZaXr7
	kmwv3Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u5ek05qm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 27 May 2025 20:59:16 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-47983a580dbso9068921cf.3
        for <linux-sound@vger.kernel.org>; Tue, 27 May 2025 13:59:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748379555; x=1748984355;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7rMdgPJ4nsFZQ+D9Zc2xAqAauQiMo58uxaIZ/TRNt5c=;
        b=f3b+RxhJBR/9SeQbG7YJ3lI3lLT/uEUUFtKpLo48fURGrP4ezUdQ425SAYeGxzBMGX
         qkvpS6EKkcwUzwnN78rdhzWe5Ah2CUHIzOLt6MWZgTfL4LAD1QzaI012/vOr8AL+X1s3
         +W2sZQtRqowFPdzauQHjQmKQTozEU6h+v+duUKl/04A4fmXzKROrm9m+Bpt8JDzfF7O6
         kKNN1K3IaxqnKqf7pBZzCIzowD34c7L5cC+BaYA5u+vBRYyujGBKQED2MM8bQ2F0yziG
         1KHc3JdGPz5RQu6egwfv1GbGPfCoRNrKMTbLcr7R//l9rpOo69x1OYYX3iIogvkkYaJl
         AQ4w==
X-Forwarded-Encrypted: i=1; AJvYcCUEwVAaqa9v/AnsU1InyXR+maYsMmjpYz6k2gaz39pvPyok01o/3L3I9fkjjLmeASY2uOiMe4Fve0Dvwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzI+MveprstGcYG0q74JBMHGyGU/i/sLayCaCxoe2zQmDkf/pqG
	dmftcN/SSEGuFcAYC+YqoWqEzmaLPvQUywSuwPWJD6Uj/clF1r/M9+6fEqQ/X2sBKs4opCOMGjj
	4CKISPGx3P4r9+HWJUgnkagF+f+XhPOTANGkCneXWKf4TfCJKLaIXWT6x/2OaZkw1/w==
X-Gm-Gg: ASbGncuvYKHjl9dPYDUVpsFPY7W2v6nA59+UXUZBsF2/TETt/Lr65cm3Jl+zC0eZb0N
	btuP+F3fdvVb+61z7tItEUSJHgoq2pKX6PeEdMqE2iVY4fvnvTD+HnAcSmZXmilx3wjOWiDGpoC
	TBrzfcQbfkzjw5/OMIdvRPw/IW561kdz+JRvb2XLAmz5fgrrzwG79uFKMwg9g+FYRn95Q7gCh3z
	iKq44vbU5Bh2yw1OI+VK54VBPeGYx1fA/etN8Q1dr4/3SrvLBqnAtjevssivcVfHLFmq/nP12Jd
	ClW2qI5YEsZUjZqU3SMds6xE8BQ8sf+e34VwvjDJAMVak4W2T9zKwPKPEqdZLjD9rQ==
X-Received: by 2002:ac8:7d83:0:b0:472:1812:23da with SMTP id d75a77b69052e-49f47630c37mr84826061cf.11.1748379555459;
        Tue, 27 May 2025 13:59:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEaYekLkmo2BG5Pkfq3xfSc6Y+Hng4HuX9BBnuMsjjWtwndv7TrykICaXHG2nFcN8TMXJpH/Q==
X-Received: by 2002:ac8:7d83:0:b0:472:1812:23da with SMTP id d75a77b69052e-49f47630c37mr84825781cf.11.1748379555029;
        Tue, 27 May 2025 13:59:15 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad89f069990sm11141466b.8.2025.05.27.13.59.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 13:59:14 -0700 (PDT)
Message-ID: <79e5e4c3-1b92-4170-8213-163c879f120e@oss.qualcomm.com>
Date: Tue, 27 May 2025 22:59:11 +0200
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <c7d5dbab-0a51-4239-811e-dc68cac18887@oss.qualcomm.com>
 <DA72DKCKVX7T.269HYJZNIABOB@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DA72DKCKVX7T.269HYJZNIABOB@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GIgIEvNK c=1 sm=1 tr=0 ts=683627a4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=LxWmpggGlPGpR5rMoasA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: rNo69Ma0KAnwM2SXpv7mTQ630x-6hYwL
X-Proofpoint-GUID: rNo69Ma0KAnwM2SXpv7mTQ630x-6hYwL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE3NyBTYWx0ZWRfX4nlj5qlexNfn
 LgLvY3XUjiN2wBkHJPhF5gCoye3PKSWcTH12SjaiaEBOhQBivImDWcQbhZ9viW2TbPyiGfiNtSm
 EJMIY/KTQLc+ADxQG6/uK6HPx388XS/x2+mHJZvkDWPpn9LckzCrydz8TwYcfwtdv0Pz6B7T9rl
 +B3viTcf40KN5mx4pJHcr2JI+iXmWZ9iQZ7fvtPivKWv/VTfE3c0Qoq3r/fWVfwONscxgnZWFzt
 epuwYZ8Bs900Tlds5zXVD8p9d5hQKayvLF6eVcg5TTqxCvhVsJqD3ApgpCmT5R/+A9iacbyAYun
 Wb+XgN4d42k0QLj5nntFcd0/g5vYKxV8bRT+JL67Wxub8slEEoqoykreDGYWMekNyhGYFAA5x5E
 SxRtpG1e6dx7gU4P1xql3MZDPvHxE3I2whEl7kBx8hrFwNHQbkxwM3CEGc6DTGUx1lqTxfLZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_10,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1011 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0
 suspectscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270177

On 5/27/25 5:55 PM, Alexey Klimov wrote:
> On Thu May 22, 2025 at 7:13 PM BST, Konrad Dybcio wrote:
>> On 5/22/25 7:41 PM, Alexey Klimov wrote:
>>> One WSA881X amplifier is connected on QRB4210 RB2 board
>>> hence only mono speaker is supported. This amplifier is set
>>> to work in analog mode only. Also add required powerdown
>>> pin/gpio.
>>>
>>> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>>> ---
>>>  arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 26 ++++++++++++++++++++++++++
>>>  1 file changed, 26 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
>>> index 6bce63720cfffd8e0e619937fb1f365cbbbcb283..4b878e585227ee6b3b362108be96aad99acba21d 100644
>>> --- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
>>> +++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
>>> @@ -270,6 +270,24 @@ zap-shader {
>>>  	};
>>>  };
>>>  
>>> +&i2c1 {
>>> +	clock-frequency = <400000>;
>>> +	status = "okay";
>>> +
>>> +	wsa881x: amplifier@f {
>>> +		compatible = "qcom,wsa8815";
>>> +		reg = <0x0f>;
>>> +		pinctrl-0 = <&wsa_en_active>;
>>> +		pinctrl-names = "default";
>>> +		clocks = <&q6afecc LPASS_CLK_ID_MCLK_2 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
>>> +		powerdown-gpios = <&lpass_tlmm 16 GPIO_ACTIVE_LOW>;
>>> +		mclk-gpios = <&lpass_tlmm 18 GPIO_ACTIVE_HIGH>;
>>> +		sound-name-prefix = "SpkrMono";
>>> +		#sound-dai-cells = <0>;
>>> +		#thermal-sensor-cells = <0>;
>>> +	};
>>> +};
>>> +
>>>  &i2c2_gpio {
>>>  	clock-frequency = <400000>;
>>>  	status = "okay";
>>> @@ -736,6 +754,14 @@ wcd_reset_n: wcd-reset-n-state {
>>>  		drive-strength = <16>;
>>>  		output-high;
>>>  	};
>>> +
>>> +	wsa_en_active: wsa-en-active-state {
>>> +		pins = "gpio106";
>>
>> Are there two separate enable pins? Or is the powerdown-gpio something
>> else?
> 
> No, should be only one. I think 106 on tlmm is wired into 16 on lpass tlmm.
> We need to assign gpio function to such pins, aren't we?

Well, we can just poke at them from lpass_tlmm

Konrad
