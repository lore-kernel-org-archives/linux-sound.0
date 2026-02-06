Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6641832F75F
	for <linux-sound@vger.kernel.org>; Fri,  6 Feb 2026 10:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770372135; cv=none; b=WoWopKrIRvVmksfhjEc6KQgviOeh13+1XLiQt328+1OW/tNHfK3M7nMLzoiEdvjeBq+/Lv9VCRGijjsGG3UusKbhuc6liy2Y9v4fF9PXMq6Hk9d/OjU56RT7VVkjFg40ZcxBgWqlaaIadLi6uLF3JJ4lXi266vPFHoNdpmQrBsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770372135; c=relaxed/simple;
	bh=i1sNXNPVMosYuGD8AAGDq7TJNCYr0jvjHq4JfafYQ20=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ax1/CAoaCi2sLxRj0oj1pn3pM0DZbdLWdAqshutgOO4pRs4urkRmx4hrswgijW37ClEcieG1Pzt6yqCxyC5adBhmJmK8ARE4om8O08JlA4rzkXWhjkSkbFh5rtBWSNnkxw0I0LKarO0i9vGQKPY7RrX0zzAGH8sR+6KmOGVtQbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=azAZqXR9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aGjGzg+z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="azAZqXR9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aGjGzg+z"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6168bg2f1988903
	for <linux-sound@vger.kernel.org>; Fri, 6 Feb 2026 10:02:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aDHuUROVLA849sayomHF4y/80YyzohWdoaGg7+6EwmQ=; b=azAZqXR98t0B5LMK
	aRJ21DVvBj6Vy8Jl0LFCV076NSyEdVASRIYW2r3qxgABmho7yI3Mk/VS7CG2BrSj
	NFgNw4aHfvJQtcmWg/ATAHHV6FNWq/fX1q9FobH+IgZ5w95ZGqXXCNO2efKTVEH9
	2gAT/+5VwGEXmVA3QmdfhIJq/VYaKeu71/9uvkG0LQPEEH2bSiaGBjSOzSGo1SgQ
	s9/3v+1qayoQAk3ctnLAofgl9ywSIQ1irgNNO0GWKINApJqCZpRealrQCb0uznui
	UiJZYEUTMJba4BBv/il58K/OSxiNjpJSSMLTYHDfxWq25zMycaoOb4xKTfm3fWO9
	qGo4uA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4t0p44wj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 06 Feb 2026 10:02:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c7166a4643so569541985a.0
        for <linux-sound@vger.kernel.org>; Fri, 06 Feb 2026 02:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770372134; x=1770976934; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aDHuUROVLA849sayomHF4y/80YyzohWdoaGg7+6EwmQ=;
        b=aGjGzg+zFFzko6BFVFtiwnvcDxHydfElLAJh/+8Ig3H4MN56l2yTy6hunCa4KvLna2
         U5AaKTVZshrjf3nVdkwaXWVyXz9d2AJqKFaWTpr0CkKrvu+CHGj0JGwAFKqUneasBvMg
         giJ/2jx/7ro2JPZtU/7wntLBLsUiZS9cbgRQwxZjCKA2ecmNWYP5XKhtdFgDse2vcPrJ
         0/E/uQyisghfk6A31bqjZUSKqgKKOwybiDc4eZ8vTauEYKBq4ENsbUojzw1uPhP4zmAu
         7BMQM6Gwa0OHk1Akef2wkuqrbwlNhcKtuBgniJTjjz8DteunYNRmM5sJdMJ7AHzS2bMK
         wWNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770372134; x=1770976934;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aDHuUROVLA849sayomHF4y/80YyzohWdoaGg7+6EwmQ=;
        b=eCamAMwr7Rv6Bf9freUdyPoUYqP5ZGT7PU5QgVbHAKTV0Mh9CIfD2hugfhKauU/hnf
         NKrRnIP+r230pbwQbbYM+RUwZ/95jVvogyOqu3q429Sk2UOCZ0AuBGADNj6LEGpuya0P
         a0IYEqtlXWHava1t7Y3I92xqR8j50gT/KEIwVZJBipTxkrp1zgvbEHEaRHcy9hCnG39l
         zHrUe75H1ah5C5yp9Eb/rG+1JXCHx6+x6ZyNF4ZXf0Kt//zESyPyPt1aI9bMarL6kPsa
         ALXoJ9SKk9/YPAGdjC/9tP1ww4FpFXmcjDNlnb+E9Fr5z2imca6H+bL3N7ihoKYia52f
         qZ8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVVBun6cAWV/dtqZGmehz1tiy91vvRBfGrVQj365Rj8jmhN+V58e2Uc/I+GE7JFOX3ZcO9zB599O3u91g==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl6gBI0tgRCUTaWR/PrW7bGknetbhX5ZQk/B+sTfd139E8MUXn
	lNQPSG1YyZvKOR1MPfueJuzyKe/LCcfQBuwTt3POphTpwLVvGvcDPs7NFSFFiSE8Aedx9mLM4tR
	MdGJN8LYntDiz0X51zh9p3hORWZ7McpOxnNvef9MsEcV8QcduWvsnO4QPhL86pTLd5A==
X-Gm-Gg: AZuq6aJ4tA+gp135aS1c8adxacKT15OlJPcaFvhDoYRx0uHR7+p7ORotVVSUMZZefl7
	qoM3kvd4HHYleiZRUq+qpRcH0Dwr4eqluzAJRHQMZ8jLvHIPzz/dGMhBt6CwKZzr1WST66jL2+1
	ZdLK8BXUUAu2aitMaUXuMBaerHovtTDHetEXXhmAXZths/sKQntWcta9aJfA1V2y2RACVmEfvl1
	utlfbxeN7LEPs3mrFgWoD0X8bY3XqPlCvAUTJP58dOX5uxiREpNdbNwXrxwJ91W1g3QZWi6tUot
	qE/69ZubxU0yNgXttWA+0xDS42qk8110jKBlFTyE4icuv+x9Us9KecQ/VYnBkBSCQKihdBhLdfM
	K/6xcqCK9czAMR8c+erLKi7RCpyQXf3vWB2XP
X-Received: by 2002:a05:620a:190e:b0:8c6:abc5:f169 with SMTP id af79cd13be357-8caf17e48b3mr240222185a.73.1770372133631;
        Fri, 06 Feb 2026 02:02:13 -0800 (PST)
X-Received: by 2002:a05:620a:190e:b0:8c6:abc5:f169 with SMTP id af79cd13be357-8caf17e48b3mr240220285a.73.1770372133249;
        Fri, 06 Feb 2026 02:02:13 -0800 (PST)
Received: from [192.168.68.118] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-483206b8ebbsm62560865e9.1.2026.02.06.02.02.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Feb 2026 02:02:12 -0800 (PST)
Message-ID: <8f61563d-8875-4aaa-b94f-1866454367aa@oss.qualcomm.com>
Date: Fri, 6 Feb 2026 05:02:11 -0500
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] ASoC: qcom: q6dsp: add support for LPASS LPI MI2S
 dais
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org,
        perex@perex.cz, tiwai@suse.com, alexey.klimov@linaro.org,
        mohammad.rafi.shaik@oss.qualcomm.com, quic_wcheng@quicinc.com,
        johan@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260205171411.34908-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260205171411.34908-6-srinivas.kandagatla@oss.qualcomm.com>
 <20260206-petite-tireless-iguana-addf9e@quoll>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260206-petite-tireless-iguana-addf9e@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ItITsb/g c=1 sm=1 tr=0 ts=6985bc26 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=M8LtWt04ibze1OfZ8MQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: E3v1MiRMmG3_NtbR-VusbqL26gADaZZS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDA2NyBTYWx0ZWRfX9n+vqEWE4jY/
 NcDesYOrnd1EfO9iiIyRHlJkwakCMKwIKfwvYp7crlDkaxLKvPH9wwVlaxLX+gdczWjnfGP4239
 kIU3qupFXVUFsuJJZ4dgh1n4T4daotMA5ZfI3wZkLvdK5UGQlIqOtHfKqoFMLRHKw8QXIY2nE7h
 gx6Tr4Cx+HBwy6yjNz2C0Lj1kV9Fqk7SpXVdETPymg3estdH+7lehrJSt5vng+R4TZpWu6syYBv
 Orlabg+tm1B0WkPgWvV2al7ND3KmQys2Gm5hj4mP9wQt3WW4efOxQ7T7Jc2K4jubtXs3tb+hJbd
 llXJfEu7+j83LIVjihQl9ojUOeUbY9hieuwqZGodox1evozofj1jIEekcjN1TpS9WcQpP8cMpOc
 r9Uv75niLBe+DOATvVMAkp706fZSsfxf22pFlWjg0qRGL1HAT62mqSyXH+C683nUlOJWdxwKrRX
 M5WOWrD+AmaThm91p/g==
X-Proofpoint-GUID: E3v1MiRMmG3_NtbR-VusbqL26gADaZZS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_03,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060067

On 2/6/26 3:00 AM, Krzysztof Kozlowski wrote:
> On Thu, Feb 05, 2026 at 12:14:06PM -0500, Srinivas Kandagatla wrote:
>> Add new dai ids and dai driver entries ior LPASS LPI MI2S lines
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  .../sound/qcom,q6dsp-lpass-ports.h            | 12 ++++-
>>  sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c      | 47 +++++++++++++++++++
>>  2 files changed, 58 insertions(+), 1 deletion(-)
>>
> 
> It's impossible to reply via korg - wrong address of Conor...
> 
>> diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
>> index 609bc278f726..0febc641f351 100644
>> --- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
>> +++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
>> @@ -140,7 +140,17 @@
>>  #define DISPLAY_PORT_RX_6	134
>>  #define DISPLAY_PORT_RX_7	135
>>  #define USB_RX			136
>> -#define LPASS_MAX_PORT		(USB_RX + 1)
>> +#define	LPI_MI2S_RX_0		137
> 
> Odd indentation appeared.
> 

>> +#define	LPI_MI2S_TX_0		138
>> +#define	LPI_MI2S_RX_1		139
>> +#define	LPI_MI2S_TX_1		140
>> +#define	LPI_MI2S_RX_2		141
>> +#define	LPI_MI2S_TX_2		142
>> +#define	LPI_MI2S_RX_3		143
>> +#define	LPI_MI2S_TX_3		144
>> +#define	LPI_MI2S_RX_4		145
>> +#define	LPI_MI2S_TX_4		146
>> +#define	LPASS_MAX_PORT		(LPI_MI2S_TX_4 + 1)
> 
> Confusing change or actual proof that my previous comments for similar
> patch are valid:
> 1. not a binding> or
> 2. you cannot change this, because you break ABI.
> Choose only one from these options.
Is this because the max port keeps changing?, I can try to see how this
can be dealt within the drivers in next version without adding
LPASS_MAX_PORT to bindings.

--srini
> 
> Drop.
> 
> Best regards,
> Krzysztof
> 

