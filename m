Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A8C4734F3
	for <linux-sound@vger.kernel.org>; Wed,  7 Oct 2026 12:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791377490; cv=none; b=Nr/OiiAjJ9NTALyPH1z9J64GwIuNmvgMy09SFzIl1u/RWlCGxJiGwhTpM7ir6MknXMZBiYG0Uqf4XiWwJEK+fD2mZ+z7820X6sJHS6JNTl8Ntk6ACtN9UziB/zqpinOyIMHpgb0sXW9vqhe9cUwkspc6sCziVqOp0dz+Pm/2CeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791377490; c=relaxed/simple;
	bh=Yh+Qn1FxrRhzwIRz7fKF5WN6g4+iXup778g/Qf1o/OY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qIj9gsq6yfJ1Bq5eARO6xVdN1ECtAGWIzAa5nrTUzLZcoyLbAwaK6r27ZMiG1lDRGlSo+VmGAvOaIJsyj39aqDFlqgvAWcFH0s0lqi9ESog5B6xttqrUWyQFatc8vKL+3RMOAJU5puA9BdLZs9kr0LquIZk34wJ99lRIgozFB+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M4ms9/00; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bI0WCY3b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M4ms9/00";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bI0WCY3b"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697BVMEm641552
	for <linux-sound@vger.kernel.org>; Wed, 7 Oct 2026 12:51:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sC6O26SQSLtN/B6et8VWsXOn2YkPcZ8zoEBjKieVz70=; b=M4ms9/00RYMIIzaw
	7wroUm/vK66HpCunxJeKWfwDYkrWHek92yPUPUBXGMlj+dBBaJ9lVpSRRuYrW8sJ
	sOL8xgGYcZabjURvHwYTZKEIeFyaY20dgDkgLflK2MlNhsflcM/HtsGbbF5su9U1
	46PvJnFOaxEO4nrZNcEb0P0VUuIFBxF6MbWziyIYkvlQ6Xqh7gJMAcaIJMZd6d9E
	liIcJky4ahniSvaPYiWJU+nMgtS2sFrwJFtIwhWyxmAU16YArXc9NxapKb+cT9Vv
	T4/fv2nf+mt2THB2owS6G3F1QbxyHrbgvWvWFlcsYlT8r7q5svUzC1sO8wr3bRAO
	ElilxA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c71a42r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 07 Oct 2026 12:51:21 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e4ade8670dso54352615ad.3
        for <linux-sound@vger.kernel.org>; Wed, 07 Oct 2026 05:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791377480; x=1791982280; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sC6O26SQSLtN/B6et8VWsXOn2YkPcZ8zoEBjKieVz70=;
        b=bI0WCY3bNgK7JMq2tsln/PxwC7HK1lv/V+b4qjbXTBerhpVwGXhtjRSiljM7ExsyuS
         l6jMHd4AluAVFvv3xKD7r0fjbj2GxP7RT/SqeRCsZr+aSTjMpjqYjjQ7QXvVWosr717g
         4kEWy+2woXcZraEgG0V+Oh307Xpxmtvtxe049GvnJlgCqdVFMma13lbdJlozm/I+bTV5
         /zQoRy1Ld1bGyod5c51xwe92Ndyy3fhFq/WdWMRLQBNZGL+7/zbozGNtxDNNgqCQYa58
         kEb+d29XMfsPKkA8GlwQYCIxJQCETVZ25QtG+qxX53R0P5ZKdv1ZlxzMNu7MeAGFs9Eb
         RPcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791377480; x=1791982280;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sC6O26SQSLtN/B6et8VWsXOn2YkPcZ8zoEBjKieVz70=;
        b=jqmp4p06PD6wzg615o8+1tVj5aWUSLwTwJ1OiThC9rN9pZVUQUUulX9mS0/Wj9QuPD
         pmVUkU2fb0/k5L5JQF7imxZeUx9PRI/M0nHHSXpq2LA2bdbI5gCKnm3It8xp9axpuDLH
         Q2vpOpI5jTyBP66ysVJ8wrPk9em7XZKq24EpyfM5oULDQMyNu/qmgER2GGSSXRbUFg+h
         h+JcHIZklPl9MTkBQxa0FfIDhRT5M69BRQrc3bIFI5NBwvogvimkdMZJuT0JrtD7wyd/
         61QnfgzNbI5L6x1haOBDgz/tjprFa1t/E7R1BnfMYuUju8JjPUHbOmyzt5MrXnkgJImb
         o9dg==
X-Forwarded-Encrypted: i=1; AKwUvBzR4DRM1439ZWjLb6TuM2HbBRwEqzSizB5wSHbV00bC4iJ3sgtpfmMIKi/TjArUL3r+1EBTev/wnM8W1g==@vger.kernel.org
X-Gm-Message-State: AFq9FYJKvgKzPf4oyL5XbP7HdXHTPA8kMiMwKrCD7+apQgBRtcTHm0DU
	ac9Erh6V6wRNJJEGxfpUBPDbX5x+Oli8FPSE6kJBXZjkwP7GOZXFGyOt3QU/H7Ye7jpAg5ecx+6
	MTNQcUCRrUbTaTkf+NKLS+/P8PnighMrOAHqQHl+PaNDj8C/OH69V5EhFFMbHmx0e2g==
X-Gm-Gg: AYBFou0IJUGABYE/BdGlXxLcQ86iVq2fJJj+HzHFLOV0hPFxhJ9f5txmbWZLlH16Xam
	nklIsC46TGbgT97CGs6NZ296HwKjQltgSAt/MQixMy2Sf1g86kt+xeA9zMI1VepvA4dFyckle/G
	w7zoNHqTyiXu3j06kLuHCNlji/Kr9OnpaZ1og/5DuUzV4YRxNb+N86EgIe34VMmHAxT2dcDllmw
	pNuJMKFu/MVQ1ozOfXlvyUFM/mYCY+tSU3FVNvzKe0DONA6G7EXlwC2mKzGt2q6MNLmNF+Vo4Fh
	HF0KhHjCMltYJTwsdh4FMJRZgDS6UFD0Xwfc3jDOsyVYbbp2g/TqS4GB1khT3ieLsgAaUMnkNqW
	9l4Cqevu6BR33we8xBmUR0fhSWm2Ykn5A
X-Received: by 2002:a17:903:4588:b0:2e4:b37a:d573 with SMTP id d9443c01a7336-2e600545f0emr23100845ad.47.1791377480551;
        Wed, 07 Oct 2026 05:51:20 -0700 (PDT)
X-Received: by 2002:a17:903:4588:b0:2e4:b37a:d573 with SMTP id d9443c01a7336-2e600545f0emr23100655ad.47.1791377480120;
        Wed, 07 Oct 2026 05:51:20 -0700 (PDT)
Received: from [10.219.49.187] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e604852079sm9721535ad.60.2026.10.07.05.51.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 05:51:19 -0700 (PDT)
Message-ID: <c333f1a3-39e7-49f1-b0e0-f3bc0348a242@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 18:21:15 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] arm64: defconfig: Enable Hawi LPASS LPI pinctrl
 driver
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261006053717.3455143-1-prasad.kumpatla@oss.qualcomm.com>
 <20261006053717.3455143-4-prasad.kumpatla@oss.qualcomm.com>
 <1072f38f-8dd5-4e70-a583-c06e402ee90c@kernel.org>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <1072f38f-8dd5-4e70-a583-c06e402ee90c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA1MSBTYWx0ZWRfX01FOvBEGDg17
 MxYNuTSY29vSRAXOkhlzj0Xh4Sy2+E/P0r5O7yByb+jg0WXwHWwe7TrvTRkhOWTxmMVRT8F86CY
 ilx+TPR9RS1K5qkpHGpq843ao62u3+I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA1MSBTYWx0ZWRfX9soBlM287tCj
 jIllFuX8L0N0pkHUr+a3WcuSp8DQ1CB+4GYKTC55+UO+QpUBHNhe31xk9JpB9iClC2xOR5GWLv1
 DcsWUwtR1ee9JHt/5MUXKYzfuqmBqqX1C8eB2llzd/oqIdfT2xlwM4YGBIUaszkASWbhvZrtmp8
 2rvMtn9XqcvC+s4cwsw04QgCON2MfDPlx4BoZMzn0hiT3BcdDMLV26kWY7hia6xi8/ovrni4xZv
 1vzHjHhBSkUnb2qv3yAQpNNfgWW9ssQuAX9TBPMOTkQIsQef9f65FL1KKJ8svuvpP8EYKXx2O5O
 riLTcb9Cx3f3ZdoKb2eUI7wdYRVHCpcOiNPE6s1FXYBcr+CRXIYxCBDmvllPzBuUdOvvAIo9y34
 cMvw9TKoomzHCBhGVvc9d1vrI0whcfWoX4/fZIfDxCDIWDAhONQQDdX5n3uG2geDfhJ/T5yOt9b
 ySrzbuxJyFysjpKX05A==
X-Proofpoint-GUID: CLW1tYqD8E3HcASo9l40EHOvYhESMNLe
X-Proofpoint-ORIG-GUID: CLW1tYqD8E3HcASo9l40EHOvYhESMNLe
X-Authority-Analysis: v=2.4 cv=LvYHWXdc c=1 sm=1 tr=0 ts=6ac64049 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=Ii1R4P4Ja65leNuhIA0A:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070051


On 10/7/2026 1:15 PM, Krzysztof Kozlowski wrote:
> On 06/10/2026 07:37, Prasad Kumpatla wrote:
>> Build the LPASS LPI pinctrl driver as module, as required by the Hawi
>> and Maili platforms to control all the LPI GPIOs.
> You already sent it two weeks ago, so this is not v1.


Thanks for the note.
This patch was previously posted as part of the earlier Hawi/Maili 
series. I'll update the versioning in the next revision to reflect its 
posting history correctly.

>
> It wasn't picked up and this won't be either.
>
> Same comments as for every other defconfig patches. Missing proper
> description, missing rationale why. Hawi and Maili do not need that.

Thanks for the feedback.

I understand your concern regarding the defconfig change.
The defconfig change goes along with the Hawi/Maili DT updates in the 
original series, so I'll keep it there and improve the commit 
description and rationale.
Thanks,
Prasad

>
> Best regards,
> Krzysztof
