Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4612C21EF
	for <linux-sound@vger.kernel.org>; Wed,  3 Dec 2025 08:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764750295; cv=none; b=PQH4gcsjHraD+z54BrZZY7aZORuHFEvqK/SxPszQZCVXPS++2pigBKtfPYyFq81CLHPciCRFurU9YEtkV17tE8w4/Z7mK357WKgSYJ/zx7EktjudSVdE0FEW4GUZSAUx+M7bITr8o/4fHT6SZS70n73+eNU8Em29AI23h/O7I7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764750295; c=relaxed/simple;
	bh=shO0z90gTGWwW3ALZBNjCFepr0kxAiw8L+nJz4d8F8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qa1M+3QjrlRdskEC5MYJ2kCOpI8wszrkjnm43G1S6KmvCuewrH4qsP7izY4ZqzTHrIsuw2YW6wwaRakKZofkPrVpBf2f5n9leCw16mlpVqT3pgvnEBjlKt7fjHPlN8+58jswF7sK2Q2sNzQaOxRDIdwWEHggTqg0iaY18EwzYgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ptziOfUg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XH3vfMFP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ptziOfUg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XH3vfMFP"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B37dXoI919642
	for <linux-sound@vger.kernel.org>; Wed, 3 Dec 2025 08:24:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6XhxI6gy/uvV6B2ez/PZVwvZxyoyIGJD8E0BhCFc8sg=; b=ptziOfUg1VeRec0V
	bJPi5oFzsUMLf/ds+ZXJerz2IGvbACDYbxKRxa4NWoB6rREsg+P02lpI+SbFGXMI
	4I7WqLbAc+l3lU0FnkUJshGCeK10pbzbpc173yb62kRTbXxwOcQXVzgGLD1RbEeY
	mKsDh+XZNpUO/xSSfKGWstsXWPc5A+FGdrDZwIBn5lkYIEdQUSkyj1fchmsSJSyb
	CcviGzepvBTXGD81j/cY6l+f+mgfS5mwv4/6mUT1XJFRlmYar1EhuB6/uvTn2xYT
	6uP8pODYfnjbl9ROLJrf2UVnQezwK5uh9PKI4temQC7zMZC1KHu/WQzFctoXr+OQ
	XhPxCg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4at8eb1kwc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 03 Dec 2025 08:24:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2ea3d12fcso1240759685a.0
        for <linux-sound@vger.kernel.org>; Wed, 03 Dec 2025 00:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764750291; x=1765355091; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6XhxI6gy/uvV6B2ez/PZVwvZxyoyIGJD8E0BhCFc8sg=;
        b=XH3vfMFPO+fOZXE2UMByay8Jm+BUP6pVIiWrRMsF7LuFPeNVsm2q8K/WQGr7ofTucN
         rfi801rtKoBw47Z7HLqcORLTFcrqqLP4iGtpPrVGdJ7xputMf4v5bbxW3PGeO8ietlMp
         VS3s4Aktm1xnrlXfiCJF/Z1yPolQvhZvbm0eL+q8cYZwhynSxdlSX/wGmUNg00RIrHK9
         MBI9Lg7k8OIBMxYUTb/M0MZF4fc159hPhWj7FAJnX+5NVg3k9/Kyddgwb7KP3FJC2BtX
         z9Ga2QHO4Ec/ehvyk4dQAGJlACM5w9teX2mh+lseADHxz5G7PTVAoNlUVLkK3Iu/CDlD
         3Hpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764750291; x=1765355091;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6XhxI6gy/uvV6B2ez/PZVwvZxyoyIGJD8E0BhCFc8sg=;
        b=nv63iYLX/656O2KKnyOQ2RHw+ha28q970onUA26ZfUfPmtmtl13Eg9Y+q5izlt4EWZ
         Lo+eTcVoKz7OV79P9KYRdGy5R8PZ2YolmtOstWFEOEOllQzvbeTNF14sTzsYmURrFS0F
         ASt0NCSC+UEnyMOtu8kAGn15bKWYkDe7+mzygOAoGT6gC6sB1afoYwNgNIeORUkXP2oP
         fNhFwwAsvFtR2HAQS/8BlkPYwXHe7OzUPMi8FV4jBULX786QSahh7l4PCOKrb9yuhYEJ
         IH64qnF/W4ftZsH5kWhMRSUTpPse/wdrOMmjygxAJnuGjMaVbAoGtWYZHTB9tIdJrlx5
         kF+w==
X-Gm-Message-State: AOJu0Yyurp+3z1xg0ZhT3gyL9C/SgJ+wI/h6KDPpMKyU5KFxxRMMYmqe
	I2URnZp98IZqmn7E0zNvmf4RPMPjEt4UjugwFFbVaU4S38UxG8WoacyoQ1GP5Maa/myCM2V/GBT
	UpV3EFjCmBXGfaTnYWwy41GVxMChQEpG+oB93BYIn79cBYvRRXoYQS/SpcKVlgt+Uqg==
X-Gm-Gg: ASbGncs57GF55MlyEHkTxXEuIu8njRexSl+kVyzeX2V/jzU3oc4cQ71qhxfjzRTcjrS
	dtd4xWhvTf3DlP/sR8ifSQNDigAmaQbxpZBdQNJMQuURTjp5VcIJt+252P9VOHAaIhnIBx9LNHg
	BmZLrtoKpnsVI4Dmjo9LI/EiRAgeBUP+aj4n1ehtBT5mAhglQsSLT39l0T/Q77az98lFdiJ97Xp
	2TcH+eRO4NabQ0Mgy24kBH6RSwyQGSnykDb55QTjMx2hGW7w4GDUP/qjGOur13QMBDD2YIzR2OK
	eXNnPyMGHBH6x0lj3tfqxEtDcAzOcfuLxtNPK/QCQFYa/mLJucQtBAE+33n9JG2GGBfNv0+d4hA
	RFu0OvhAB/rN24E5/lVphqdbxmNOtwfNZKqfC
X-Received: by 2002:a05:620a:4402:b0:8b2:f0dd:2a89 with SMTP id af79cd13be357-8b5e5927c55mr190979385a.37.1764750291511;
        Wed, 03 Dec 2025 00:24:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGk0eE9WLO3kY72PxlTPf3oB2KqFtDPAzLzhAMJ1Y400cFaxK3Enp46I6A+kwlwr5/jlhVdiw==
X-Received: by 2002:a05:620a:4402:b0:8b2:f0dd:2a89 with SMTP id af79cd13be357-8b5e5927c55mr190977885a.37.1764750291050;
        Wed, 03 Dec 2025 00:24:51 -0800 (PST)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4792a79dd66sm35915695e9.6.2025.12.03.00.24.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 00:24:50 -0800 (PST)
Message-ID: <3cddb94b-a63d-4b75-95b7-7fd0378fda1d@oss.qualcomm.com>
Date: Wed, 3 Dec 2025 08:24:49 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] ASoC: qcom: audioreach: Drop unused
 audioreach_control_load_mix() arguments
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251129-b4-container-of-const-asoc-qcom-v1-0-67a3d3320371@oss.qualcomm.com>
 <20251129-b4-container-of-const-asoc-qcom-v1-1-67a3d3320371@oss.qualcomm.com>
 <f029c82f-444e-40c7-a50b-493ce8ae159f@oss.qualcomm.com>
 <2ac6ccd1-9d35-49cf-aec6-771622e24876@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <2ac6ccd1-9d35-49cf-aec6-771622e24876@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=e98LiKp/ c=1 sm=1 tr=0 ts=692ff3d4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=98aQCdHbM1csXaQqDRQA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 5aJC2bmL4RrtKN_OmEtNHhy2d9p1HEjZ
X-Proofpoint-GUID: 5aJC2bmL4RrtKN_OmEtNHhy2d9p1HEjZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDA2NSBTYWx0ZWRfX/hcC5lEc2Tgf
 bHQaDZ5l4R7kYtsuKoO4H6XzCDTE3ppnFrcHIsk66qZPLTt1/GXFLp7k2fJlMFGRcfgo+LJ7trF
 71/XCxiPPkuJ0YGQlp0Z7JZ8tl8yxO2dY1XRokdOY+JOhLBNQQSvEByL/iqPB1dq5RAdTSZjl0M
 MSX6OvdR4APTcVa4Rm4bquQ7NHT7pVUAwJyUckxiB5lJI80FvZTWbcB/NnoAsHQIuvAwOMHFiff
 JGhrsSkVuXEARxEmNCJcivc8MbrVFCKNQZ8XIm1bih4YMW+g1vAv0bk83ttMfjpy/tBaeb7YrP+
 qecAliKFr/4LDpSNvtpQ4BaTVakyON0QKb1Lw8eL+j3LtH0SfDNXyASEFNjMTWyHXrTXpvsumrH
 fCEVrBnzM+S8JVNCb517ROYIi/TWgw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-02_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512030065

On 12/3/25 8:05 AM, Krzysztof Kozlowski wrote:
> On 01/12/2025 16:21, Srinivas Kandagatla wrote:
>>
>>
>> On 11/29/25 2:02 PM, Krzysztof Kozlowski wrote:
>>> Simplify the audioreach_control_load_mix() function by removing its
>>> unused arguments.
>>
>> TBH, this is an unnecessary cleanup.
>>
>> There are 1000+ of such instances in all over the kernel, if we audit this.
>>
>> Functions will have more arguments than that gets used in the
>> implementations for various reasons, consistency, future use etc..
>>
>> I dont see any point in this type of cleanups.
>>
> 
> 
> Sure, no problem. Just please confirm - you mean only this patch
> dropping the arguments?
Yes please, just drop this patch.


--srini>
> Best regards,
> Krzysztof

