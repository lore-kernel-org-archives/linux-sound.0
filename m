Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A68443AB8
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 08:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784621715; cv=none; b=cK0bgubB9yI3nw6Gy2DypvVKn8rKPYpehAqYY4j68yT/PfRRV9Dct//selzRgARD94h7AKgdhAv+nhKGLMCPYKDRds9oo2MB24bQeFZ4TJzyhXNq8JPg0Hhm9GK8Qwdxng2XL9iTOXbYmevsB/MaZfSv9cDnnMrSYA4Jewwh4e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784621715; c=relaxed/simple;
	bh=Kli47aDfn8sTFT6QxBaC3v33Fczl2UHvcXCdDWn0zlg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cK4GK9RVYTmRuqovwqKDQ4Q29jfbMwV/RXL3V7HD9rgFlN319ZgwJadjtn8mTf+FVUtayCLXYsBpz3fG1+kZ8+Gkz5xpjyQ47PvmaA9tJhb5PIJSqKWVs/kcbQNzzTHZozo3+8BLt229uXTGn81nHIHgDkdU2F+1UgHJ5mpROEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LtoaQrgC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RV72f/Xc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LtoaQrgC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RV72f/Xc"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L4T2Kp527962
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 08:14:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BHqWPTGkcUObPXH+9mFnZ5IGzYXysMrpMFOOmXxYMmM=; b=LtoaQrgChVPO3SON
	nH3yhfABGz6hEUEp5WAyMWPbH5+NX1c5lNiWAeDZ3I5NR2w69jVXqHlB7PVNZ8CB
	pp8PQMa2j3Gr2W7WrHbwMde9fVCggRJEsbItfl0YakdrswYlnWJYoTwNQ6IHwV1x
	hOI0YFpGTOXjh5E8wMGOM+7tJbwPsxoQY1+6CyVpo3JngLXWw6P/+rJ10lAHk1cT
	ID8nyDKZ+esk6FkZ6Uzntrs9fW0fEeABFd/wtBQgiFq5z78oWMwhzTEGV16KTK7w
	LFc7zrusrMHvNZlogORq9Ow3l2Q154Tre+EbkXbp1R8n3LP/YccZbmrG6RAQj8mw
	dJtitw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1se0tp8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 08:14:48 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-848474825ffso5765281b3a.0
        for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 01:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784621687; x=1785226487; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BHqWPTGkcUObPXH+9mFnZ5IGzYXysMrpMFOOmXxYMmM=;
        b=RV72f/XcMUZJ/qZFL7ToqxmFgsuDLc4JoXjGZugpuUvoZSKBIJ+qcpuJZ2dtaUmPZb
         MlaPwNms0SdyG5V3VGqOrfWxNB0vlInmRatwSEd9FITS2r25JEOKoiAH6ZkArmBggm4G
         +YdAteyf8UqMG27Fz3zpN5zaOIl+3Y+i3KWfvozRXZBCw47uW7k/5YleA4TECwh09uVY
         D1Jv7/uLHBGUShr6/l1UJIAjBqVal0UKQTcRvgAjtjY/6RtcHi2X6F79MUPisL5Ny7Mu
         kxIwdvU5aPLn0DXXGNFJ7vJkv+IR99vXLEYFpUvAc3cHM8PhFTC18cWWkEuZ3m/fefE0
         By9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784621687; x=1785226487;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BHqWPTGkcUObPXH+9mFnZ5IGzYXysMrpMFOOmXxYMmM=;
        b=NXUDT3ksPnp/0pSKitb510aACk6C20gLh+9qjPblzSiElvhmXdwZhuGE2PA63DblUh
         5Oam5fnLOrpzjQDp6ZnXF4uqDSyceVE0nKGdrfooNikW0NQXIFLPWtThN2jAQKY9KLBU
         O8K/mnytVUeQQzO+RVHZoqEHW3WDUyVHIpZMDYxBfGVPP+nC2lXNHFZgF7gkxPQGI31G
         do23eFsqOJzg1qgvtMnJqjcQp2AbSfOHLaL4MHdcCVeGzIi9EgWdgsyWcTFlmt3Jp7Rq
         mEagNpaLnk8nLKd67EjcIWgz4iMcFgyrAXK6ijhNtJSwQbXVk8/SoceYLIW0xE9CfkrX
         POYg==
X-Forwarded-Encrypted: i=1; AHgh+RqRYsEaJwjR5qGeiSEDSk8jzdrcuxK+xO9AXBqFaxK+LVpeV8OG8B4P9K4iwRF7gICEPnBRtgvqHOPYAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiMD5kn7Eu3swRHiGJPSepnsmnZAL5cOFDHJ7H7Q9BHPAfpKSe
	vpVk60XP8HeDoliRIL/8joYRXsvYq++TKGUsUpw5LjwqvJusTkOqlDD7/kvjL0Rkeu8Myskn963
	5TSbdvp5e80vhv4CLotw0juAXHeqkDNrxiqcZFXkF9sl5MNhlCWWQlr25S0SkDjt9Jg==
X-Gm-Gg: AR+sD12hHhGhUR6o+5hWeeUdE9y1PpGgmw3LjcIYGIHUgKMfHvSjTElFZjnoICfFJ6y
	EiZ8I8k8Ilktrx50fxnluC066z4KR03SZkESLOWrFQQHPXZ1vrPnr2Fpud07aWmq6+IWPZZ6/Td
	02yPDciYHS9i8UuKKgxSke9pfYxxMzSUxGEystDEpEKmYRFLTorGzqb31rF4clgM2D0KxA+mTAA
	Q2wnXbo/OZkys14JbS1B4IWMNN5bROXdNRfabLzNp5Cj1UyAa1B+26C3jKTzsCL4l906+/QUOwx
	Zr6FVBH71jVT6NwgodNpvY90E5StTcySSmzePc31sHuM0toW51VRW54WomWBYHUfll9yJ38EVoo
	O0AMSn0uvWZCios3QZJLnb6GQ4bWZkAMpSZ1dUSo=
X-Received: by 2002:a05:6a00:3a0b:b0:84a:2b96:5986 with SMTP id d2e1a72fcca58-84beb057d97mr21988287b3a.8.1784621687327;
        Tue, 21 Jul 2026 01:14:47 -0700 (PDT)
X-Received: by 2002:a05:6a00:3a0b:b0:84a:2b96:5986 with SMTP id d2e1a72fcca58-84beb057d97mr21988253b3a.8.1784621686894;
        Tue, 21 Jul 2026 01:14:46 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2adcc78asm7005847b3a.23.2026.07.21.01.14.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 01:14:46 -0700 (PDT)
Message-ID: <67179d90-6201-462c-9004-9b4cfd114250@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 13:44:41 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document
 DAI subnode
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
References: <20260720160226.1026440-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260720160226.1026440-2-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260721-fiery-sheep-of-piety-4fd04b@quoll>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20260721-fiery-sheep-of-piety-4fd04b@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RL4dmJyad-zMPg7dmklEuom-NR_aCzio
X-Authority-Analysis: v=2.4 cv=TIZ1jVla c=1 sm=1 tr=0 ts=6a5f2a78 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=pWr4hPsiy6qYYviyjrMA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA4NSBTYWx0ZWRfX8r4DUQ2mjSAa
 wOSWn886Z2sBjCn/oCmG3crxjUi+clGvv9UyFmdVj2Tfm6J51CdTmb0R1kc6yXUYfdPF10lBRqw
 tpvkMVaVUtaFRtjx4IdKNnGCIOT9vVM=
X-Proofpoint-GUID: RL4dmJyad-zMPg7dmklEuom-NR_aCzio
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA4NSBTYWx0ZWRfX6oFQh9JG2frB
 kSde2U4wGZ+BM15n02wiG+vNu3oyKjtpcwugqLk5Bf+ZxhmM5K2db8Jb6axeE4wh+tPL2yiR2at
 9ReusQGydRQE3sa6D/JU19OITSdGj8krQjEtsSjvGHiPiQB9e8yZ1a8IdMRptM7YV5QOMx7ZqZ4
 IxZWbhIX/8z0k3KtmYdhdNSNUW7fEI8r7ub7Y7I+kZ6sy3ocTdEVK7Sco0zXUPPB9lAuOTdn9Jy
 /HwiHZWPKWcoPfq+vc4NGlW/pGzIYUTAkHuTFT1b1r7RWM5CfSBQuN4KtW8FwRYVoCMNu2c0Ds2
 RaOhqSwsbxdKtnkLaIXkHdk6ci5rqddLAJNe+gJsnU1CFqMqkw+aCeMybk98Fjs2ffQhwYjeZwW
 +X0e28JYhwD8opwnF6oDTM5X/Ap2XUhEp7zWa7AuS2CP8H8ldFJCOgEpQMnoG0yrLczSqtFLMfi
 XrVzdBibgPvidbZjeyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210085



On 7/21/2026 12:18 PM, Krzysztof Kozlowski wrote:
> On Mon, Jul 20, 2026 at 09:32:24PM +0530, Mohammad Rafi Shaik wrote:
>> +# Digital Audio Interfaces
>> +patternProperties:
>> +  '^dai@[0-9a-f]+$':
>> +    type: object
>> +    description:
>> +      Q6DSP Digital Audio Interfaces.
>> +
>> +    properties:
>> +      reg:
>> +        maxItems: 1
>> +        description:
>> +          Digital Audio Interface ID
>> +
>> +      clocks:
>> +        minItems: 1
>> +        items:
>> +          - description: MI2S bit clock
>> +          - description: MI2S external bit clock
>> +          - description: MI2S master clock
>> +
>> +      clock-names:
>> +        minItems: 1
>> +        items:
>> +          - enum: [bclk, eclk, mclk]
>> +          - const: mclk
> 
> This does not match your clocks.
> 

will fix this.

clocks descriptions are misleading because they imply an
ordered bclk + eclk configuration. I'll drop those descriptions.

will keep only

clocks:
    minItems: 1
    maxItems: 2

> I gave you exact syntax to use, then in previous version you used
> something else. So I reminded. Again you used something else.
> 
> If you decide not to use it, sure, your right but YOU CANNOT come with
> clearly invalid code as a substitute.
> 
> NAK

Suggested change: 
https://lore.kernel.org/all/2b4448d0-81f8-410f-b849-0d957a2d2a17@kernel.org/#t
minItems: 1
items:
  - enum: [ bclk, eclk ]
  - const: eclk
  - const: mclk

I tested the suggested schema, but it results in DT binding check failures.

DT binding check errors with the suggested change
1. Only mclk enabled
bedais: dai@10:clock-names:0: 'mclk' is not one of ['bclk', 'eclk']

2. bclk and mclk enabled
bedais:dai@10:clock-names:1: 'eclk' was expected


With the current version of this patch, I do not see any DT binding 
check issues. I tested all supported clock combinations, and 
dt_binding_check passes successfully in each case.

Thanks & Regards,
Rafi.

> 
> Best regards,
> Krzysztof
> 

