Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2C5565104
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 17:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791998196; cv=none; b=GVOIZH67dcAihAHNoZbyZcdN8EmBO5m3/4tAYkPZj28bSJZ5M9FojfK+fYY7jU3VDI/OmbDXaH8Pqz+8vCRq/nfer7w5Vs2G1c+FYxj3TSklFBkwCm59JnxJ7b2D3W/7cNgRcbx6SjG1N0dl6aPTNht0NQiCGNZt9BN9KbbL3co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791998196; c=relaxed/simple;
	bh=NtivolCQ1nJosxUI9F7OWFpX9s9PxlP7yMWcyfGE/8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=otLlu2FCrwplqUnBY5SPGgY1ASaZvKTqtQyu4VpBLYYzOcfnzGd8tKWP/j0SUn4LpD2QcvB1E5hdClVsMr+CXiO76OnowIKAnsN7JIgJ2LMGhYz3k9QASmWMtBr2v3BuQXdI21HguupjMNeUsYkkt4QNYcbmDjp+4pER+bwGbCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R26knpqw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qlb5Q3Xa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R26knpqw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qlb5Q3Xa"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EGZhLb3468837
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 17:16:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7SbRzAQqOqMGFrGen933aIJTTXXFDtSgDohs9rQuHzc=; b=R26knpqw1ZB66+aI
	TqCgaSoGNuEN0u6AeVx+S3yB2Pexc+EhmlDjA0flx3pzmD+gKmQKYY/kMm0mqZmH
	aJNVMVVNqaJAcJv2TvH3qeg0GQixhbcaf0oBmUz9G6WNByRlHRPFrFtXhrx30FnQ
	vwafSFqHqMBodongiS1JL64lTb3vD9+07fenxT42P3Xn2+yM0itCNahcfR0dSGXh
	bUofyG0b6iH2btQzMobU5KFwm0PbWxcBPCiapTU74jn4238vbI8gQrn5FdxLs1dS
	upbL8QQYpg2L7grtH+epf4ghq9FHkAGS2DUN4VggHvTbnwEIDFk1JYQUxsSbVz7R
	wzMv+w==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hadd78543-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 17:16:31 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-359b81ad4e8so1802359eec.0
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 10:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791998191; x=1792602991; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7SbRzAQqOqMGFrGen933aIJTTXXFDtSgDohs9rQuHzc=;
        b=Qlb5Q3Xa8/DWZwcNLMBTqOasnqolO5ZKIWnVRJeqPbCZfagqniVhMCrPEM6jToguVa
         qR+QOtrit8r68N1cd9jQhrk8ZDa/+/UBVm2Vr8s7VaHEJ1kGDgWo/4y3PZtM6/Q8o/t9
         l7npmkiXPY7xec3H2NH3NIrtPc1lechC6hDaC4avUn47KtBpqK2O6qQIvIsyW7lF/bXE
         2de0tupBQD9sA6Ek+smGV9MxY+iM9l3ttiUQ45cJKop/p9ln9b0yqBGIXpMY3pOiniNC
         YbVhQevIgc3zil8tTCP08o9rJRSLC22cwRt4tpr/wD28YQwkQdqFFc0sk4Uf1fMCFe4d
         o5oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791998191; x=1792602991;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7SbRzAQqOqMGFrGen933aIJTTXXFDtSgDohs9rQuHzc=;
        b=ppEwHxjUES0dDe0fxHPMZ+t9WU/32zl4zn001yRXG3p6dHhxNZPhZ0jk+fCP8jIVIV
         maglr6FwSpQ+KEfU2laPHY2SKKbDkMa1VaaI8igmaqfJrwOEjlPOXNvyPw5iSZPbncSf
         OFdER77GwmA3ncHhfY9UmvlC9gTYshW7aT+ZUgxQ3CkPDj8JqTl540qeXzX2J7xjeN00
         jBqpWyWKJgMsQiPYfyv2fwz88Dbo5nJS6S/+cghbJeWLRiES3WEWzvaqZpkapeJxR6Aj
         ekRKDb0Pu17afocImLqfwCIfY52BmdCwEpELzIrj9KJ8zn2oiB1MNsx7ZRAWpb/x+ScX
         CjnQ==
X-Forwarded-Encrypted: i=1; AKwUvByGwdBBM28H8ClcOIIfoKVRRx2B76lTvrbfi/MyTbFyUpUaz+RqHoVxdOfBhlLFYMeyfvhedaLAEJVJhA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIY2UMBYV8tf5PFlkfhvfb0p6uj4mUedNpAROFyQWwaQChHhKE2
	YjKDrs8/DO6RuOnl4uN8EN5b1esx+XlyWfTaAYyMyUmNzvrn+Wqcr290ST3MC3GN4jTuFrAavXQ
	EOmTAkCC2z1IuVwEumFXEAomLW1aMlHv5o6+Kh9KdrVIyRNSdDQQzxFHYGSAe4W9sgg==
X-Gm-Gg: AYBFou1Q4nxF7a5Lq2fXgaBxm1kpoGrFhemmaUVjdiVHSu4huawHM7UrU2yYLkqnzeS
	X+hVTzilnwsX8UDFBtysKvxUgzXQeW3Ipcs50/wdQycdlc1N3QQcycEZQIjPFo/4sHNo5T3WAKb
	nVcN1PfdcWvEBsam+yEwiAfJSuRiKXfhnUym5we8rPI6sJiQ9Le/Z0vH4NjQlGKURHiMrzmgsNG
	P0xaqV9bDsfJBQKLNvLeS9CJ4kFYRWZANF8dOROWNEpx2E4w/dTno0Euhp2t9IAxHznOYoS51d3
	NfCc2LxVBM6Y4Z8XXQaxnfzUenTllCXz37ko3fIXcA2IiPRfr21QugaydzgGZGgVTndQOh6Aikj
	fmJSkLGn9s+h2Jzr+3GFoY8F3OVrIbbEoAJURsfs=
X-Received: by 2002:a05:7022:b9c:b0:144:fb42:52 with SMTP id a92af1059eb24-16a61d5bd24mr35223570c88.28.1791998190347;
        Wed, 14 Oct 2026 10:16:30 -0700 (PDT)
X-Received: by 2002:a05:7022:b9c:b0:144:fb42:52 with SMTP id a92af1059eb24-16a61d5bd24mr35223517c88.28.1791998189644;
        Wed, 14 Oct 2026 10:16:29 -0700 (PDT)
Received: from [192.168.1.5] ([223.230.101.206])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-17dc865cbffsm11282540c88.6.2026.10.14.10.16.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 10:16:29 -0700 (PDT)
Message-ID: <c8c453a5-3c4e-484c-9567-4a8d51fcff38@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 22:46:21 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] ASoC: dt-bindings: ti,pcm1681: Document the
 optional SCK clock
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261009-nord-asoc-driver-support-v3-v3-0-0c1897f21ccf@oss.qualcomm.com>
 <20261009-nord-asoc-driver-support-v3-v3-1-0c1897f21ccf@oss.qualcomm.com>
 <20261013-supportive-imported-spider-c6e28d@quoll>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20261013-supportive-imported-spider-c6e28d@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BaVNQbt2 c=1 sm=1 tr=0 ts=6acfb8ef cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=89gBhgtN2V0NwPD6rb2Hew==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=UYrAC0ybtJ6TP4zHPckA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: eTbrzHZX138UyGlJoEYleKZs1m1Zt8FR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2OCBTYWx0ZWRfX5+b/IPhOKT2m
 gqLk6DvA0GFF4ULnPQFsg4rReu7Xobvp48yjnq39Vu6wthDQrWr4vuLVx711QwZucQc1SEIYQWH
 YY85zWWtVlYxQXXTn9YQ27DyIBWFEZ9omXJPG71KmHLAUoTt65na2dd9UE+dkGxiWM4NJpWAZvN
 j34rUUIStdvqxW9qz9AhN2wK3N4O0AbEKNQt/7tyacXs9vlIACSelfIfE6LYF/fcLwon5LlpgI8
 hefLWG61TxgqXad1cmh43yZiY9/8ZCzx04l+HkRVGkTdCpqMLbAfe7Qk4TnbVTBhhs1B33MBc6U
 Ze1UTOUO4T2n1EipvlLcEW4YkRjrkNAU8z10BDegMYwH/ApbBhrGoCtCaA/RvOuGHHHe9IgTR5p
 VG52sw99EJcPGpSnp9S1/14oRrBspgDRn4LAtn/6rd37z4DRPf7j8fSWk1RCwlUYFouT+4kMH/X
 OVM++kelaiTrefoWVxg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2OCBTYWx0ZWRfX5uykwXFID380
 4ewnztm9hfxxqdHjG3m1aCFUe2TuyVUcOI7LENIo7l9/4huvDX2K+7ZHRBq3SSJPVQ0Vdyo5usU
 ZFcUs5wvyaPO/uh2Zm/8YQWsz5ZscYo=
X-Proofpoint-ORIG-GUID: eTbrzHZX138UyGlJoEYleKZs1m1Zt8FR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140068



On 10/13/2026 12:31 PM, Krzysztof Kozlowski wrote:
> On Fri, Oct 09, 2026 at 06:42:47PM +0530, Mohammad Rafi Shaik wrote:
>> The PCM1681 can use an external system clock supplied on the SCK input
>> pin. Platforms that provide this clock need a way to describe the clock
>> connection in Device Tree.
>>
>> Document the optional 'clocks' and 'clock-names' properties and define
>> the clock name as "sck" to represent the external system clock source.
>>
>> This allows boards using an externally supplied SCK clock to accurately
>> describe the hardware configuration.
>>
>> Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/sound/ti,pcm1681.yaml | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/ti,pcm1681.yaml b/Documentation/devicetree/bindings/sound/ti,pcm1681.yaml
>> index 1f0e6787a..1b3803518 100644
>> --- a/Documentation/devicetree/bindings/sound/ti,pcm1681.yaml
>> +++ b/Documentation/devicetree/bindings/sound/ti,pcm1681.yaml
>> @@ -21,6 +21,13 @@ properties:
>>     reg:
>>       maxItems: 1
>>   
>> +  clocks:
>> +    maxItems: 1
>> +    description: System clock (SCK)
>> +
>> +  clock-names:
>> +    const: sck
> 
> Drop the names. If they are needed for any reason, then use the same
> name other device uses already, so scki.

Ack,

Yes, the clock name is required as it represents the system clock.

I’ll use scki, consistent with the other implementations.

Best Regards,
Rafi.

> 
> Best regards,
> Krzysztof
> 

