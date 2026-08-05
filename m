Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6203DD537
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 06:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785911387; cv=none; b=lxGkcQamtCI+EX34WeW5MIitiXu0xxvOIJ7Oq6kj4RjED3VCdmIpmAlwx11MMydsBi4ZbPv8bA36aoHxUBRR2pvVGoC4Nf6d0LrrBqRUPD9g69qhRJYR/lAw8v4fBgKrFuCQTz/Hbpv5Nki5y3Kjiu+jniZ9UKEjPozhyYwg91E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785911387; c=relaxed/simple;
	bh=kD1AtV1IXgU+rEmbAxswgg5f6SHwOdcp4YRjYg7KNcU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=acAg9vrLhIdOFQVo5UxKQ0sTZg3JVqTvQFpm0PhvCOujzo9cHwgpbfwUJvCqkhmwftBAOoWeDqc/UH15cOPQKi2bfpVGy3kGGtGzdt9ZuvTkfddRoqd7NQl6UuAoThjL33LCbKnFdA4GmpghmRCaNvgOfutD3rP1mKcngbU9NVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I1FbPusE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GCjXfRcJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I1FbPusE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GCjXfRcJ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6755kpGB3143067
	for <linux-sound@vger.kernel.org>; Wed, 5 Aug 2026 06:29:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tf9Q0sWvzlnVpeS8vAA4rJPPXWRvGO905jPZFHYDYQo=; b=I1FbPusEYTbDPPuH
	cvIYbnK8OnhsXqt0d+auldqeCPlUOlhKuPmZlMrXDD+1psvsvqpY9i9jU1ZOj+2T
	RqjEIUr/tMyGe5g5Rzibw5X6LEs+un5bGezt1yPSxQ8mVtsmbeR585IROJDdJPCt
	1/Fu0fW8RPvv9/z8Yd09lJiRPxc5f+fZEB+2WBLOyj2/c1Ozs2KBGP3Sg5RQfLAi
	+QlJdEwGiTC79j6am70pTFlB7lqQkMe6aNbr8P3Geyl5AJpYekoH5NTQvqup13iD
	0dVAUFFMSzW3OiSbGYup32t8elgSETG9iRMB2wM5CArCJLZGsO78DJvxW6t8s1q3
	Sn4nZw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fuu3uh4ug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 05 Aug 2026 06:29:39 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ec0f510a9so1391299a91.2
        for <linux-sound@vger.kernel.org>; Tue, 04 Aug 2026 23:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785911379; x=1786516179; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tf9Q0sWvzlnVpeS8vAA4rJPPXWRvGO905jPZFHYDYQo=;
        b=GCjXfRcJjt5+HTbR5Jt5ldocUw6DQM5CR2baKr9gARQ0C3/gwdUDrXjbMgQXCQh3yy
         ttakXUxHILAfVBdJh/0zSO2+4VWDgWZQfEe3vLZyzmFCSI1u5ew0767ludy4Wy09PlJW
         qzzZ0AkOPavmbU2AtGEO8gY6/+5DMZIuePB4V8l+rdrlR0d9uB5seflQI1gju7kkCSCG
         cmyaOOvY1adcM2QU2Tpsw8IYs0tKkgNawERsgYXYsbNKAHGk1QXwQDtOWatMBU/h0691
         WjENAOOG5UM0hIMKtoxrbmpj0GKYRGSxYzhJpulC+Kg1oDIoj5EENEG74qbviwWq9Pm2
         xOdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785911379; x=1786516179;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tf9Q0sWvzlnVpeS8vAA4rJPPXWRvGO905jPZFHYDYQo=;
        b=a3RZLavlyBmrnil3S+A2LU/JUWdkjyKTyvwqbc4kGmT/mHCjoVXFS0hth3f1CrvYRL
         mgKZ5b+GL6UG2OBbFuKcyXucoyuQBRvj4iz0k4zEt9cYF4FKeSZqlBci1JCCLh+3OaH3
         24RG3SOsA54tFAY3pYwGLV1HV3Wv+YaTwS1nASEW2ljybNLpv1NKCsG56XD8J2g9toiA
         z81XXETcF2PyAEJoA9cqYSH8IYnaJov+cEIxWqjfhHFkdS21gjZZIr8f2MnWbIKQFpcS
         zxWsTZLRgViv3J3CmZYPKa3c/yhRzhvSwx8d4rUFg6byZX3DWBUeP+TcVcMbffgrlmzY
         Hv3w==
X-Forwarded-Encrypted: i=1; AHgh+RpbJt75dfD8YrH08cwkiiQSy8VRz4EYNqmmIRqGTPqfYMWH5o1u8ByIre9vG6SBK6Ab1FzjemtxCNdUOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwsHTMKujuN2ZskByOQS7saUp0pWzIdUN37xa6p5PbFxkczedpO
	bp3twjxkFzCpD8qPVolU7sjWGy04l55CRccONVUIRsZxG5iRNrcdwI49mtEuOzKpMtZTq4r/mGW
	GoVPU+0NipPsDSR1NWhzZObhRtGWM7bE7kytMMUUhKkrl/Hi/aloFc/Tzfh1cW+iJX8PuUaiqpg
	==
X-Gm-Gg: AR+sD119d4hCipnUmdt0nVj3Rf7CI7Ey+ntHmJD0ex8DSNeZkVFVq8aTIPgXmCyDToc
	JwnzcPwn7P+/OEfP6KVBA55qM1DQOvqiZoW6xSxheqCg6aQsmckcEHqSiEJ+cuRkfwWCiAUN60s
	/VHc+e3T/NcVbmo4o0r/w0vRbBj1EYG8QownDoHVtQOOh83EA1FX6gczcSn3boioqchdnRza+L6
	iO1/EHfkS+JprSRSjV8S2wGTpsnKcFR9lvk8Jsl/BRSucBeqOVXH0Cyl3hobOtj3swMgeIY2WnA
	lKI3uoFvwa24SVqDqJJuZ0OC/doqYlidYeUbxbInPjqD0NYGbByXT5jU3EPQ9DOI/Tt/Xo4+1WI
	l9S1CbnX2SU5FdvrZbIREMVL8nhEzqiXhB+I=
X-Received: by 2002:a17:90b:1c0a:b0:38d:f096:a1dc with SMTP id 98e67ed59e1d1-3903c58a715mr4480784a91.11.1785911379370;
        Tue, 04 Aug 2026 23:29:39 -0700 (PDT)
X-Received: by 2002:a17:90b:1c0a:b0:38d:f096:a1dc with SMTP id 98e67ed59e1d1-3903c58a715mr4480764a91.11.1785911378992;
        Tue, 04 Aug 2026 23:29:38 -0700 (PDT)
Received: from [192.168.0.100] ([49.204.17.188])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38febfdae56sm3598635a91.2.2026.08.04.23.29.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 23:29:38 -0700 (PDT)
Message-ID: <7089bf29-acdd-49c4-a32e-82e266019910@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 11:59:32 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/7] dt-bindings: sound: qcom,q6dsp-lpass-ports: add
 Audio IF clocks
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
References: <20260804070307.117119-1-prasad.kumpatla@oss.qualcomm.com>
 <20260804070307.117119-4-prasad.kumpatla@oss.qualcomm.com>
 <20260804201645.GA1781336-robh@kernel.org>
 <8e362b9f-c19e-477b-b01a-74597858edfd@oss.qualcomm.com>
 <b814a4be-7c20-45e4-8abd-5e67a6a3b5a1@kernel.org>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <b814a4be-7c20-45e4-8abd-5e67a6a3b5a1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA0OCBTYWx0ZWRfX2vhlXYoXP72A
 Lz5y6eqFQKcgAQr7aoWZ/S++laLNOy1eqlsiDzx99nm44jpeJyNVhusxbateNm2SAjIM42TTuqR
 peZTUEgqu1Nr+vqRir87+eQbUoK62Pk=
X-Proofpoint-GUID: YUW8dk3OEtgnDGTwocxszw27Sz7vn70s
X-Authority-Analysis: v=2.4 cv=B5aJFutM c=1 sm=1 tr=0 ts=6a72d854 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=/JTPBhwEQko7YaD0RKblyA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=F0gcz5h779UazcyIt8cA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: YUW8dk3OEtgnDGTwocxszw27Sz7vn70s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA0OCBTYWx0ZWRfX5Kgqif/FyGqT
 56ssmbaY1TcHL1Ye2Jg1HiEohE6mcDtTOrqtonJsJMzqRB9eGG7aze9Wxo4gRWmbMqdO92p12st
 23HkJPzW6J7yg/wCKVm8f3EIgG9Ush+3pFmkzXPHNcbnSz12NksCpV3542Dg6UB41K43J9BGcJ1
 pglQghwDn6WAYYbW9Ywu+vMoCCp2fiL4Mi/6d+Xanyef6Cnb++dPYjHfzlLUy2oQTbSMafDWOs+
 MJ5CUanQMYMx01Gn/n14imKT0BpPMKAxWWMMNzvPIuE8YwV5w7gEppJlv7DJMWY5QmyGoDZzM8Q
 NYbaeGepygWAWSC7fo3ZevwEsJlxrqnJ/G0G1Vjkx2AREzRyLypHqBrjmhggob8iKAQ6VmZRoEY
 fj1SPmOiQBVI8YtgDN7QTgMkALYxHrmWS0yajpEAckh3a8In6waCx+LcglhcLf72Xo5iZQN6kh+
 GLYGXgY3eP1YEH9qpgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_02,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050048


On 8/5/2026 11:40 AM, Krzysztof Kozlowski wrote:
> On 05/08/2026 06:40, Prasad Kumpatla wrote:
>> On 8/5/2026 1:46 AM, Rob Herring wrote:
>>>>    #define LPASS_CLK_ID_RX_CORE_MCLK2_2X_MCLK	70
>>>>    
>>>> +#define LAPSS_CLK_ID_QAIF_IF0_IBIT		71
>>> LPASS_ as saskiho points out.
>> Hi Rob,
>>
>> Thanks for catching this. The change has already picked, so I'll send a
>> follow-up patch to correct the typo.
> You received several sashiko (6!) replies immediately after sending yet
> you did not respond to them leading to Mark picking up this patchset.

Hi Krzysztof,

Thanks for pointing that out, and apologies for not following up on the
reported typo sooner. I had noted the issue, but unfortunately did not send
the fix before the series was applied. I'll send a follow-up patch to correct the typo.

Thanks to you and Sasikho for catching it.

Thanks,
Prasad

>
> Best regards,
> Krzysztof
