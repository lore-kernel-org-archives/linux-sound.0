Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D461271A7B
	for <linux-sound@vger.kernel.org>; Wed, 10 Sep 2025 11:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757503084; cv=none; b=MtrtV52qPoosEbAJ3t31gYlSU8U7mENK/LD67uHja8XHNWwwH0ruPfmQBwn6jt9bHaU4ytRvSg8McLXaMgDlPxEmE4+YzcVeJ9vJcPpFE2QuvqKuVtg6TEscOrm//6Act6BOVlMMC+cWvZltceql9/pjaseHPXDGn6NSCkeMGr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757503084; c=relaxed/simple;
	bh=h/Ik0PrqPScBGKfMiCGA3HiX8sIJjeasUwHmqyW7Lu4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R2LE7cs9yJnaKlN3bnhmi8p8ZUDLDFSmFpKV2Ie7pUJduhjVZB5v+FXtK90JFy0VeLQnZoJ+bZilPhCcqhjI6QMLRTH53o9D2Te5ubnRRyqh3qkZrz51aVkHmHugC6OWEMAFQVhD4p4A6EhmmhJGbqFQZtqLC3iscY14IZBSsBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T3ElNoRy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T3ElNoRy"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58AAF5Yc021045
	for <linux-sound@vger.kernel.org>; Wed, 10 Sep 2025 11:18:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NhKm/oaBZ3mEsPk0XzY2622FMSlrhf1J2meKRh2UOq4=; b=T3ElNoRyp/c3OWa3
	V+9woT5I44SESHpt8MV6jpu7nXEX7nDsB16by7giD/zGNLCQFDTC6qi5EfZUhlLg
	E3kL3DyNe2syMFveByGEyH5nOBbmiRE/54I+QoheeWh0YHJ+VE5xEaUGWx2YcAYt
	kvBnPJC5zBN/THcc1JtIIi4HIR2Zt302wCv+XSmto3CCfpGS+h1/W+NUbwG6TuOs
	7Jels76qhhUm9PTELZ9cPvMdTSu69n87Dg87Wp4Jg+5Nlx03FT+xBYj05ldacjPE
	uJQcErmvKuuk9RfmqbLj3CBpuFOlKZsjj2nddD388vvEGN3iVPyoxigAExc25LPr
	xQKWhA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8abhtt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 10 Sep 2025 11:18:02 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-77241858ec1so6485893b3a.0
        for <linux-sound@vger.kernel.org>; Wed, 10 Sep 2025 04:18:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757503081; x=1758107881;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NhKm/oaBZ3mEsPk0XzY2622FMSlrhf1J2meKRh2UOq4=;
        b=jfVDoYnkvaJmLJfDQSuFL04pwOG0OY5PWusVTQfnLJwfjM944xzf3S53+aqWRGK0sE
         EqywwKuHgoG7whDGJNCKHjv4OMpdZT4UOvvA5pdGIab6/v9RjDxQZmMyt9bQ8OCdoHlX
         yGcGlRH+A0fwRTM5F1L6O4s2mU5XRHjBBaJOQrxnNJ6JwDq5DC7xgbYPLQCiJx7MxmQF
         E8eZ6xQC+czxFL3h1tsB7uWFPchS7yO3qHCk+wpUoJ/kFiGj8pJtgb7xB2XwV2Oml0Ie
         dIeieYU2kmgjAkmWjLyAwi+lIucxx7d4uKBNAVhpojpVtm9yXwA8HMBUEokxSNfqoZw3
         7rsg==
X-Forwarded-Encrypted: i=1; AJvYcCX1Jc177MsFersas3hoDa03LQAWyAap8MyoofUF00Wl8nQIYptYYkAqHW+aF6rQCgP/TrRUb1l2Z3A0sw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr8pyAr5vJ9HB5rnKWUNRu3VLsFmYFF/+7F4ooLm7HkWTCz9ZX
	45lcU6J7YLBPz+1LSqlTg27DdD8V4FGsiiRbJE0sC6QTIeldvy7VGb0C6BS2S3SY4EbD77dwXff
	MG92PpTWfbHJAn/k5X6b/7y66qzQ9u8pKbxGDGt2e+eBVOG1PUzAn0G/t85aN2YCOIg==
X-Gm-Gg: ASbGncsJCV8mPu3/Lf05bW2qfaDRj0Er+OT+Zlzj4nb+L5I6PbILY/fz8nqUqzd1/bD
	HM1nb2hwjIRsPlNWAbMXjIeLld81ArNWAOf7Snu8NX/VEhF9bc+Tu1Bas3zXkALLnm160GmUsTh
	LMM2g+sNUWLs2SBR2AUBQiFv1146JR0ZF9DDB0YKPa7jBqiJhbtCKSKJ9atXfSQOf77jZkzBqFo
	RzlILpmb+wDvxMst39oLoJ5a7Dsl+V3DtEe1n1YWgvc1Po8X++/hdnKrz/E+3Ekf1Y3TbvUaVnO
	EMg8XHHhGQrdXs6q0AdSB3PAIxsxc5MOCvrdyUGcUL61iuqolcO1TCa8Em7LqNkHYXQtskx5gou
	RKA==
X-Received: by 2002:a05:6a20:728f:b0:249:824c:c60d with SMTP id adf61e73a8af0-2533e8532a2mr22929853637.20.1757503081337;
        Wed, 10 Sep 2025 04:18:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnc6VtP/lNIoPuxQr0V1E0W1udZTbdHFQEsB8FXlg0iy1ie0KmwDB44W1EzlUeQ+BUVyKU6g==
X-Received: by 2002:a05:6a20:728f:b0:249:824c:c60d with SMTP id adf61e73a8af0-2533e8532a2mr22929798637.20.1757503080852;
        Wed, 10 Sep 2025 04:18:00 -0700 (PDT)
Received: from [10.92.178.42] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-774662f2fd4sm4875868b3a.93.2025.09.10.04.17.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 04:18:00 -0700 (PDT)
Message-ID: <4c6e7e6b-2ef4-4ea8-8bf2-26c7aa8c94b8@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 16:47:54 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] ASoC: dt-bindings: qcom,sm8250: Add QCS8300 sound
 card
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, prasad.kumpatla@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
References: <20250905142647.2566951-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250905142647.2566951-2-mohammad.rafi.shaik@oss.qualcomm.com>
 <43090acb-ea36-4015-b14f-78d44d789d42@kernel.org>
 <a9507045-b900-49ee-8841-0f8fd30816ba@kernel.org>
 <abc66798-dc91-4860-b0b4-de39a58b5745@oss.qualcomm.com>
 <a8dcffa4-c578-46d7-8fdf-cd4f5a29a2a6@kernel.org>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <a8dcffa4-c578-46d7-8fdf-cd4f5a29a2a6@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68c15e6a cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=gMGxrbJpmBSKcSsSh8cA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: nWh7xRGlke3-Vqbl4Vk3JoGUlx9Guplm
X-Proofpoint-ORIG-GUID: nWh7xRGlke3-Vqbl4Vk3JoGUlx9Guplm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfX9Pn6oZVfCZn7
 PFivxGURY4B01/d7gY1xXNnkYYwZ82GcKrmaEOAojAE0l5pz4vdOljec0Ousu09x2er6Xt/PCGY
 u3aB+X2gvYaXN9VDRfXUydC/R3MwzOj4e8jDyjtCRmeSioku/LUvkvaMeBnoYr45Mk7WvljZHXD
 74lvqFcVqStUDbixdDB8+PXn7ZahsU9zugEtcYuwGQD6c+tywmi4VflP/r49si/V8zGKQVdyO/2
 KcVDP0Sy8VDSwVYnIMl7OIMNUUhZEhVCYlks/HlQlHvDMwcFMoxfbtymHsgiiEXan3GhHQs6mIC
 w5emRK4gcj+SOA2PrG09GsF4omBBxq+JfHY5TM00V8yypr00Ml3yyxmFWyI0EdKjlm6YLv9rUJk
 BB5gL3uk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_01,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039



On 9/10/2025 3:13 PM, Krzysztof Kozlowski wrote:
> On 10/09/2025 10:05, Mohammad Rafi Shaik wrote:
>>
>>
>> On 9/10/2025 1:09 PM, Krzysztof Kozlowski wrote:
>>> On 10/09/2025 09:26, Krzysztof Kozlowski wrote:
>>>>> diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>>>>> index 8ac91625dce5..eebf80c1d79a 100644
>>>>> --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>>>>> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>>>>> @@ -35,6 +35,7 @@ properties:
>>>>>              - qcom,qcm6490-idp-sndcard
>>>>>              - qcom,qcs6490-rb3gen2-sndcard
>>>>>              - qcom,qcs8275-sndcard
>>>>
>>>> So what is the point of this compatible? There is no user of it and I
>>>> think you added QCS8275 for this case exactly...
>>>>
>>>> Shall I start reverting commits from Qualcomm because you post patches
>>>> "just in case" and turns out they are completely not needed? No single
>>>> user of such code?
>>>
>>>
>>> @Mark,
>>>
>>> In case it wasn't obvious, please do not merge the patch till we get
>>> some clarification. For sure it is wrong one way or another: either
>>> incomplete or just duplicated.
>>>
>>
>> The device tree currently uses qcs8275 as the sound compatible, and
>> the corresponding Device tree changes have already been applied and merged.
>>
>> Reverting this now would break the ABI.
> 
> If reverting would break ABI then:
> 
>>
>> A new device tree patch with qcs8300 is currently under review:
>>
>> https://lore.kernel.org/linux-arm-msm/20250910044512.1369640-1-mohammad.rafi.shaik@oss.qualcomm.com/
> 
> This is ABI break thus NAK.
> 
>>
>> Once the machine driver and device tree patch with qcs8300 are accepted
>> and merged,
>>
>> I will promptly submit a cleanup patch to remove of discontinued
>> compatibles from the machine driver.
> 
> So this is the same hardware? Then no, we do not rename compatibles.
> 

Agree, the existing compatible is discontinued naming convention,
will remove existing qcs8275 and go with qcs8300.

Thanks.

> Best regards,
> Krzysztof

