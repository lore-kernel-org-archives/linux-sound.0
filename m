Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0A931D390
	for <linux-sound@vger.kernel.org>; Wed, 10 Sep 2025 08:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757491538; cv=none; b=Weqb47nDxrdvQBd37eXIvwdetuAZ4LO5ok7jZvfP4ajc9WN2/LcML3TgHkUauodQpY/waPyirqsRU9eeFz4TqpomGTRyPzfnYJaI8KexBkHFbHCoHLkwfEFtpiptl5TVmkhTL0taS9p3X/m8JZ+h3A8L+wJmJ2od2q83bph49IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757491538; c=relaxed/simple;
	bh=ySbA2sA/2khOOpH2bz6CV6pqwbh86FHJpVx+tx+Cv/k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XZ2RgdNEMNsqfO7NtLmwSwbVvdJenEaXWTCZXouDfOMgMvh/QRWcbZYlre+3ofsmggHi/rodoRp14dTkf1KoywleCBj2pNa0+wdAN48LYYXjcWm9PoSYPHHw1aJk1Y5N5BvibHUr1Hv4dvf9p26XrMYe7grdunrlCutK/LGbQMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WKy+c70t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WKy+c70t"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58A7dCra012575
	for <linux-sound@vger.kernel.org>; Wed, 10 Sep 2025 08:05:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XYaeBpAktxucT5u8cP6K6PPyq3Cmk7hqCqU4GrGeJiQ=; b=WKy+c70tm3Inh/q2
	E9pT6dbBplwbEmHFziyVUXXyfjA51xiaLojEPOY6oL6CYb3M/kv1bZPDGyr6hqta
	qU6VNFfrub2z0V2ooxIzAXzJqjfcQ2p1p/IQBq1BuypVa9IA4TSDOlfhX6fyx7Hl
	kJ/Em4OhN3leMM4g+c43OLItOJW2qqjoNCWm77jAWWQkJ+BAxgya3DbOrwFBrR3t
	k+xTzWb72X0oXc7d/bHRJ+luiij5EeB7kysruUuzd/nDN6CUMa1BpYyFJLy1O82M
	9S6MOxlPSrij7bzSoM6yCByp0bbA2mJk29RYYWlIYI4pFu7WN5h6lWKZRx2OSsYF
	30K6jA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4m2y62-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 10 Sep 2025 08:05:36 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-32db3d5f20aso1076469a91.1
        for <linux-sound@vger.kernel.org>; Wed, 10 Sep 2025 01:05:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757491535; x=1758096335;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XYaeBpAktxucT5u8cP6K6PPyq3Cmk7hqCqU4GrGeJiQ=;
        b=PIh0l/2xO4HT9xSS9fiQ7eDFLtMF3RJhi/CMdiyQlqw8tAE/ssDHruc+hhMi3R8nEV
         Arppqv73bEaDN0BztTtrFhWSriDC0r1/0q6o4fUvZdFmZz64YVkb6On6zX+cjdBkUumx
         LBkir+0+dt7RyL3jzCgpao4QHaEI9Xqhb6hjKfqnwJTO/lcaXpe6O3J1MBt2OAK3Nnq7
         pwgpT50Xzd+dIocuI5h+iSLqnGFOMMokMzArfZGcoRaSzPNoY6lkuIjld+PiK4SfQYfs
         PCPGj625wnnkjDvl5tYaCZFTWB1HnO5thZwwRV2ESAyX7g4t9/ZcPQdaoIydhIH8tPeb
         uIxg==
X-Forwarded-Encrypted: i=1; AJvYcCXkHv6xKlbtDQYPvbjwcQEIvnzX2d0i44QUSCQzLWCF6hKs8gLxvyorxpjjUhVJmkdjHXarljDrtmIBGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhHZ+WE2oBEV+u70QM0VYdmer2ZiHayQU35DrpdzPHpLRTQfkX
	0CdOVK4j4zOaDvPF56RNFOrFGxU8zSh4U7Vfpmppm5PzsqurhI6wI99Z/T7r8BWoJtbFLRHBWTR
	2jIzial/wB5nzzsZyadtaf49KZH/3aStnsVFc32LP6b+5D4rKmrKTUCz6LKxZhE1DPg==
X-Gm-Gg: ASbGnctG5duvQC9aLCyw7bcaRkcEzVZ27zFvRLHe2Q6tNq30RKxw6LcLugcHVdy7ZMY
	ZkcDgA72daCAldrbtHeYKriiqn0ybU5lXwDyHHtMZo/CVafsbaDum5gvJpjDvGaa3xX/F1sgZiO
	MYllYfJaNQ1Yixp5YPf1wdOC+DYmujcvkynaP1CMVWhUzdo4xJyekbNuV9nfJSaOrw8CiFeMHeB
	4x3UEe4x+ZDl7r96EKyVhDnVIbBxVQi52v+ahs+YMUov/N59M9u8tA1XgLQe/DXzwUbA0rOc9HM
	007t+IicMUo//Hy6h88BQgyZKIjGJrQbz39eugVjYmadQ3kOdG3kWtAaOzEevy+1Q+l80cyKxel
	RSQ==
X-Received: by 2002:a17:90b:2790:b0:32b:95b9:3eb0 with SMTP id 98e67ed59e1d1-32d43dfeba4mr20454138a91.0.1757491535174;
        Wed, 10 Sep 2025 01:05:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwpBIFx5Xpby4qmNhy57ZfSegfbBowNYPbtWU+5wKfhmtUyGL3qm0r094IiFctzCJY6Z+uaA==
X-Received: by 2002:a17:90b:2790:b0:32b:95b9:3eb0 with SMTP id 98e67ed59e1d1-32d43dfeba4mr20454097a91.0.1757491534672;
        Wed, 10 Sep 2025 01:05:34 -0700 (PDT)
Received: from [10.92.178.42] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32dbb5f3deesm1590684a91.14.2025.09.10.01.05.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 01:05:34 -0700 (PDT)
Message-ID: <abc66798-dc91-4860-b0b4-de39a58b5745@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 13:35:28 +0530
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
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <a9507045-b900-49ee-8841-0f8fd30816ba@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX6lp531ksocUG
 DhYvgqU2/y+8C8iNnnHawOrinn6vgbR5Gx9pQMD8O+n4D2OnwmhoNqd6l57bKhbbRO9l3JZ44+Y
 Lxnq4KXffuAgc9YvCgb8ZbWBlNuQqDimPo2W/ma0KmupJZ0U+b/xFZShBLimckhWPRzyri4clXX
 Qw0G4vi5H+c6D5Y/r/zWnDJJtjxdL/NWw6gETyCfjCECyrokpcaOZc9h8Wg2SwbUoaHXWqE7Qo4
 dv4YJSzM21dBzVzfAWBMmeJzMQeflGZ7Lm+0rivhR9/t48mdTBK9Spu6mVV3put0DLTSOg/4SsR
 foRgmsqGt+INCsO3+8uBohp7tyOTTcLVkP5XewMV6hGl/L0GsGqPSDrgFUrlZjc6QET/BJ5v4oD
 t7T/0/qo
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68c13150 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=8rL0g7Y-MTaYnKc9o8EA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: aVQQkygDK4vbdW13-3rBbB01gW1SsskI
X-Proofpoint-ORIG-GUID: aVQQkygDK4vbdW13-3rBbB01gW1SsskI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_03,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038



On 9/10/2025 1:09 PM, Krzysztof Kozlowski wrote:
> On 10/09/2025 09:26, Krzysztof Kozlowski wrote:
>>> diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>>> index 8ac91625dce5..eebf80c1d79a 100644
>>> --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>>> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>>> @@ -35,6 +35,7 @@ properties:
>>>             - qcom,qcm6490-idp-sndcard
>>>             - qcom,qcs6490-rb3gen2-sndcard
>>>             - qcom,qcs8275-sndcard
>>
>> So what is the point of this compatible? There is no user of it and I
>> think you added QCS8275 for this case exactly...
>>
>> Shall I start reverting commits from Qualcomm because you post patches
>> "just in case" and turns out they are completely not needed? No single
>> user of such code?
> 
> 
> @Mark,
> 
> In case it wasn't obvious, please do not merge the patch till we get
> some clarification. For sure it is wrong one way or another: either
> incomplete or just duplicated.
> 

The device tree currently uses qcs8275 as the sound compatible, and
the corresponding Device tree changes have already been applied and merged.

Reverting this now would break the ABI.

A new device tree patch with qcs8300 is currently under review:

https://lore.kernel.org/linux-arm-msm/20250910044512.1369640-1-mohammad.rafi.shaik@oss.qualcomm.com/

Once the machine driver and device tree patch with qcs8300 are accepted 
and merged,

I will promptly submit a cleanup patch to remove of discontinued 
compatibles from the machine driver.

> Best regards,
> Krzysztof

