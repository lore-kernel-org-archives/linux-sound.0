Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0172DD5F6
	for <linux-sound@vger.kernel.org>; Wed, 10 Sep 2025 09:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757497240; cv=none; b=F9lFOJ+GpaAEXyF28I1psEsYTscmROTTQIpRQaLlXEgNuvU+IDw0ymh2o6AoluifP2rRc1cGOI5CGyPZH6ca6+CN0MbF9UyLW8u4j/d8s8q9vfnxauxVogAlKc794Jzs2JG1NGdMykQgIeM4cfle7qsbhyiX+pR1urjKGmBZByM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757497240; c=relaxed/simple;
	bh=PMrygF5tQEBETNNlK2TURt60yHgbiNe7/3/KcHUD8tk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=dXaseUpAdJUvq/VZ7Y3kYeQIGvpbqy5oB5bYpYmKEeKqKQnGW2dDQ2pvgF1SkVXiGXHfaC73MgcCZjmO8Hc4RG4zZLSwdmMzhjCLbP25Dvy3+sEb1T6nhU8gDVGSVFPy3oo1539iR3ptVOyZsyCNZ5RhykivKlfiGASGbHjukf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nSLTTmZn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nSLTTmZn"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58A97Q4o026494
	for <linux-sound@vger.kernel.org>; Wed, 10 Sep 2025 09:40:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Gclb0Ihbq4U0dzyWeLi7fsQ8/l2l+bvwlN9BvdXuZ0=; b=nSLTTmZnKr6ScU92
	Fyb392PZn7uFi1XNswYjKJ12/rbtN2iAb4OajNPKN0JJJpB8uJi1eJMPeX4greiE
	9sZ5s48WLAUzk+c1QSV2NBPzOGVgcNfQ8zB1t3h8y3dMfbZzQnQbNBl2MH1L9Cz2
	G54kAIe6rivYEbIG/WWRs0vd9NSB/x/3fQWPIOfGMEkNiYMI+kXJNLAd09B4AvWg
	DWjSR1c105Kx7ziFCn6LAPfgdGYLY664rK7gONlhwPZ7mZZOrTMQael2gSyPlNFm
	s9A7krBD1swlKPefKWiUV4bf298daJlUjKy4kopPyzK+pDl1/UORNLNYhmZWBJA5
	1RiLow==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491t37ytw3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 10 Sep 2025 09:40:37 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-329ee69e7deso6462360a91.3
        for <linux-sound@vger.kernel.org>; Wed, 10 Sep 2025 02:40:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757497236; x=1758102036;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Gclb0Ihbq4U0dzyWeLi7fsQ8/l2l+bvwlN9BvdXuZ0=;
        b=iJJODKhzPN29gA9/Bz19mqTvsfbfuKvCnU4uz/xlwOQhePdBoCBx+a6RFinK/BejHn
         04LsBAODvlpqoiixsxae4EgNjfGRxcrfzQLLZgtfU7DojI4VBAZ9mzcGuLZ9GhG4JCXE
         wLR41nDpES+giO36gzt9ve59cI8tfpTF3IOFeREUUVfKb6bB6z64NjCCe1fiv0UKKyTE
         JkqW7h2W3n0ynwG6t0BCeL633lkNnEmRZdLNFHALRx4GJCOvg4r1dV55h4vwMHt0xUfx
         REJa0bSoUUjzGTnZibLsAZhfsIVvFt3QS66ZKrrHs2maV63ukTAP3hiMcT8BbJcmj+dL
         xsew==
X-Forwarded-Encrypted: i=1; AJvYcCVWhCb9brhteEmYqVWP/L+HT2uRUjsgktByAqrO2PHb+xGhYrWed0uwswFKyRqLBr6hP4EWWyPgNAwN0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzONj3lwBz7TGG2pQhdTUtB9idNY04kt/HC9Lfy6QIFTPYnivG+
	ksKa5Eo940TUgc140oA063VBfRDAESsLBqYaBuBwKt1cZGifT7afl1t5ym12VD39DB5Pmj3UWF+
	uc3C1CsR78leRxHqDxv810fewhd3zC4L1sV90ZP0dNHc17ucmoUocy870XZauzmGC+g==
X-Gm-Gg: ASbGncueGnnxq6PxjVnwcqJ+RGIyKW9uRlnrSMNAFbP575BGIe58/XJY/QEoEPOOvJQ
	tmWO3p4NEiQfbX0M5C/Wb7UkzMFrSX6o5F+k6sBIf4Yxv4cbqP74OZNxjsx2nfIiUUfl61HDHEL
	u9Cz1y6LnyScPihpoLsfZ2sheMKX7FerkH6YyU2skgJZ3z9FYYAi7GmbHsBD0o26HLfmcusb/8u
	iB9b320FND6RQgaovxDJS4yfobteJJ41aB/zdYXXllsy77jIojQCl2CI0T398cAJ9tWdg/QCPRS
	jRFUEpy/JXJhEynNHLYPEnBjI1WBsFm/K7YNZngguaTi0+VVTPA10drNQxytYkHTvpYQrcLxdQA
	sPg==
X-Received: by 2002:a17:90b:4e83:b0:32b:9774:d340 with SMTP id 98e67ed59e1d1-32d43fb9041mr20757075a91.33.1757497233994;
        Wed, 10 Sep 2025 02:40:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHaecEzrQFrPqSdW4dQERZAIFQpKAkVm5A9reVkG5A2GgX835tsdd4acUFKiggHGiBsSO6+GQ==
X-Received: by 2002:a17:90b:4e83:b0:32b:9774:d340 with SMTP id 98e67ed59e1d1-32d43fb9041mr20757048a91.33.1757497233496;
        Wed, 10 Sep 2025 02:40:33 -0700 (PDT)
Received: from [10.92.178.42] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32dbb35576esm1832190a91.16.2025.09.10.02.40.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 02:40:33 -0700 (PDT)
Message-ID: <04554d6c-132d-4f3b-9284-4b54d5047805@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 15:10:27 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] ASoC: dt-bindings: qcom,sm8250: Add QCS8300 sound
 card
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
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
Content-Language: en-US
In-Reply-To: <abc66798-dc91-4860-b0b4-de39a58b5745@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: kjSk2JH-eeAX0D78r1nY0GHe1vkIc58o
X-Proofpoint-GUID: kjSk2JH-eeAX0D78r1nY0GHe1vkIc58o
X-Authority-Analysis: v=2.4 cv=NdLm13D4 c=1 sm=1 tr=0 ts=68c14795 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=ExpgeREpyeptk5CJGqkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA2NiBTYWx0ZWRfX/RJoYo0TcETp
 vgvJDhE97YYlcdc5+Y03HanhfoIxNEg3BsxsYkhJvNg28wlftnTf5kPx78WCXJk6qTZNz4jECHY
 wQYZWg6YqugExSSkiPrGMxTT6Mya2kcOkOg2PtGq1C03COanLcmdXAe4maIJQwKPKFZBQi6DTPS
 79r/P3xO7GkR+7Xb3uP14k5tPKn+VghtRR9hLQDpVzcM7p6wZ7mhZVB5mtB/PsMbeRFCHxqXuWk
 uutJlG89vIZIXgKfc+HBCC46qyqmy7FdEaWduJbmNe3b6oh5QUoZBuhfYWGv40EkHa1wNnaVy5o
 sp5PZ0XBAUhKZN6UJM3ZX1ktxWWiq9nzqgRv9zEPSslROtVxf1tXBt/y3svdgrl0DpX5er0QeMo
 dI8RL6EI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_03,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080066



On 9/10/2025 1:35 PM, Mohammad Rafi Shaik wrote:
> 
> 
> On 9/10/2025 1:09 PM, Krzysztof Kozlowski wrote:
>> On 10/09/2025 09:26, Krzysztof Kozlowski wrote:
>>>> diff --git a/Documentation/devicetree/bindings/sound/ 
>>>> qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/ 
>>>> qcom,sm8250.yaml
>>>> index 8ac91625dce5..eebf80c1d79a 100644
>>>> --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>>>> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>>>> @@ -35,6 +35,7 @@ properties:
>>>>             - qcom,qcm6490-idp-sndcard
>>>>             - qcom,qcs6490-rb3gen2-sndcard
>>>>             - qcom,qcs8275-sndcard
>>>
>>> So what is the point of this compatible? There is no user of it and I
>>> think you added QCS8275 for this case exactly...
>>>
>>> Shall I start reverting commits from Qualcomm because you post patches
>>> "just in case" and turns out they are completely not needed? No single
>>> user of such code?
>>
>>
>> @Mark,
>>
>> In case it wasn't obvious, please do not merge the patch till we get
>> some clarification. For sure it is wrong one way or another: either
>> incomplete or just duplicated.
>>
> 
> The device tree currently uses qcs8275 as the sound compatible, and
> the corresponding Device tree changes have already been applied and merged.
> 
> Reverting this now would break the ABI.
> 
> A new device tree patch with qcs8300 is currently under review:
> 
> https://lore.kernel.org/linux-arm-msm/20250910044512.1369640-1- 
> mohammad.rafi.shaik@oss.qualcomm.com/
> 
> Once the machine driver and device tree patch with qcs8300 are accepted 
> and merged,
> 
> I will promptly submit a cleanup patch to remove of discontinued 
> compatibles from the machine driver.

If the above explanation is acceptable, please help with approvals.

I will submit the cleanup patch to remove discontinued compatibles,once 
the qcs8300 support added in driver and device tree considering ABI 
should not break.

Thanks & Regards,
Rafi.

> 
>> Best regards,
>> Krzysztof
> 

