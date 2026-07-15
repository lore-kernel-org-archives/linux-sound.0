Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147823246FE
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 06:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784098734; cv=none; b=Y7d3c+219PZxMrZz29saYIq+XW0Aw80XPi3jQsi8UPHxAy72xj2dOfpSUQ5kzmplOpCMRNrF/3XbBxGhyk61jy3iW8AE3VU4RmGmwkmiNdKo/sek15vYSyEoKLmpFSaRIDglNMV4rHYIF/vU4Pxw0ggzFCKNGkwDeaU52HLLuMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784098734; c=relaxed/simple;
	bh=2F33bP0CzluWiHtV3rOJhAl9WdVxVvWgw0557LH7+2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vqn3xybaOP9/TqxvQd8A4JbIbesuObrN+IT1Fawro6zMqAAXEhzankvZOxPDtXWUpZkJOPjxinB/tf9wS7jXrOXmquC2hMh5HXIsRZBJnZ98Z95znCoStamRaYxn3p78k/YqMyOXddPn+KWPPVfhIazZcyr5GcK/E5zv1qAcVcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zh2XcmcS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dabs0OpS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zh2XcmcS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dabs0OpS"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F6hIrt2795799
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 06:58:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k5rLcyyrbG3p5cljmeoN2CF98kBOhnagbjStEAg0Lso=; b=Zh2XcmcSe/bVKFC4
	evZ53wuZJ5ujyAm1LDk1V0py4eGQ1QtQ0+WmLgSXEcnVxywgI8isRvpYoVLNCZhu
	36tgD26HQFRoASvUlmUHivsz8e7tFwi8xCOHbfneAfCVrWI0g1ZhtPh9dYIdd2za
	4K+FTn3Pd+joJHdTyt48O2AoDt/CzD29NHvGzXQVQL6h68Kq6eIT5YG/chfssL12
	M8oJUkC5tBhdNYDCJWBSw++1+DuETCuBEvQsXlfkHfsJjFuEE/4MJA4nd4RKnc6q
	j7NfbZ/HRRJ8KIsdDQycdvj7YubuLHD+SzkHLw1pSb6OtqIeNmg9MQzqIaoOYd/R
	G08Dyw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe56h81pj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 06:58:52 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-848452dd146so4705247b3a.2
        for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 23:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784098731; x=1784703531; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k5rLcyyrbG3p5cljmeoN2CF98kBOhnagbjStEAg0Lso=;
        b=dabs0OpSD9xZe9so97AfbU7G1+nPMOIFSh+4xim2vfhcZauFULq9AHP70RM4MstL1F
         nuwnwjkVDH9zRFgNwMIwq6I0Tp4v9Q0a2PU1vUSZpwJv3slESbHR4geoA1M2c9kjFBxy
         2lDIL7l50xWvJXQq3F85OitBL0B4n4Oj5l7vrad82qz3K2IH4q2EC/494B1/dJUZ3ivl
         3PShb59AMIJ2CvsafZpT8uQXNYjJRYSVtw9FC063sLCnZwMRCH5Ddb0PCjjcBpNbd6Q7
         NVKd5gAZfc9y7z6T75ARndnsvKgXsN6Qd/Jjzbn7BAkp3lgmXOMhBYDCYRIjnLzh4Prq
         Z0VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784098731; x=1784703531;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k5rLcyyrbG3p5cljmeoN2CF98kBOhnagbjStEAg0Lso=;
        b=UXWTY7gvHc5gd9p2TpaLmG+jqzUAEjhoPxWZSO8fP5kwsT/vNLbskbDqR+rvZhPfkp
         cbSSQL3ADzNTntYXx+4LCgOoBEriY9eu7DQSM0r2YB7IxQy+jh84HR640hyZCm8AFNuO
         5WEuti1jc8ba1g8aaWhCuAa80ExMnjd5uOXYMb8xVhPUu4hcncy4DzoCDXiVP4SKll1u
         l7SIWxz11wNe7AWAGET/jaw9AowvBpV5FFMomqnjDhsdy6TXaZiQTokEs7Nq4xvh4Xi8
         QnA09/JlVcssWWLTUM3ZLmP2EWsCSutug2FPpDBnuL7GtR2TmYIN6Jf/XqRz7lUu2+5F
         poTA==
X-Forwarded-Encrypted: i=1; AHgh+Rrv7VXLNv8dRieFxVWlXlCzjxs6A6HD1Y81uGcPg5aBlU0+/LMHeXAxTRYu07jdJPYRkLNFNX6EtO+V6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcH1qXFlQGU9MO10re8nRYY5E2RfYR9zRgRbAtPRJWlbNhM3c4
	GiwiHKmv93u62YGK6B4wsvgQtW7otvhY2bbGGwiXtJWTXEBGyxreRH0HXSaeFpyhexCcHsM9D7F
	DL1veSpchZB16TCQsM5i2YvsoEPPtxDOMnY7tL1B641OtstrBe+SZeimEE1oZlpO1Jw==
X-Gm-Gg: AfdE7cl8TuDaYbD+ROCO3gQxvY9CSPlyUmMh0O/46IgiJUIIehBuOYMUtezq9YOymIG
	gN34rOCBcSfS4iA3z1voVWtlAQEhv4NcpyFqcZJJqqJoPSIic/I03l06jmAc/bWeNPu9sofhvSD
	V0WSjbnPU1zALxmZByHHt9porshAgC5dVjQC97UYXmpCdGzoio81BIvOyZxEc4ri4vDAU8s6AW1
	mBnP4K2nCmsy2iRnnHSR4UBFvMnGx1pyFPK3O1/bLR6eEbh/dorZkzAkWjwJAV/ssWFfdyRcjH1
	3lKIpXzdhST8+TTt3c31M4WcfEUz7YVLy/+avGCFAEuVhIUTgh3EXRRf1Zs72oVU3ihnsOHm4fq
	rkBBBy1Hrq2ByG4nHOkVbWNr7Ukq0qV6hAtur5SgUvZ8R8SlV8A==
X-Received: by 2002:a05:6a00:23c3:b0:845:d284:9e11 with SMTP id d2e1a72fcca58-84889756a2cmr15113945b3a.56.1784098731307;
        Tue, 14 Jul 2026 23:58:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:23c3:b0:845:d284:9e11 with SMTP id d2e1a72fcca58-84889756a2cmr15113930b3a.56.1784098730880;
        Tue, 14 Jul 2026 23:58:50 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f6c158bsm2585765b3a.38.2026.07.14.23.58.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 23:58:50 -0700 (PDT)
Message-ID: <5612a63b-4052-41af-8676-9d92811dee9d@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 12:28:44 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document
 DAI subnode
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
References: <20260714145250.2473461-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260714145250.2473461-2-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260715-crafty-cheerful-goat-baba95@quoll>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20260715-crafty-cheerful-goat-baba95@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA2NCBTYWx0ZWRfX/jjGimhFOZEY
 tIQ79RkiY+Zdv3XUljTgu+u89X9w0RruNU/zsZXLVoQfLd2vvT98OVOlOr4OMjy7JD/8H4wjWth
 jeCaPTQ8BcSJ2LBw3ID8PyOI4ymdGPs=
X-Proofpoint-ORIG-GUID: fNL7U7PnLqew9qJpbhrdrZoFYlJz01sb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA2NCBTYWx0ZWRfX4Aj3a9POARKZ
 iDfqDrro9zBaEG+VVRD+3Os7Eu4XtxZCgynTRhyInzHbrLD/nVbULkzd06zTuzhQaa2qcCr9CwP
 hJFkxYOlsiQJe1wMrbnft2HCnijqmSJ6S1pn4mUrk7Esl9raCzz5lgIVNjhg32U9MByrb1yt3ES
 fcXJCAh9iPLWxFlxGuW8v5VCcVhmw2k6jiC+ID8Dn0nDb239RzqGg9biqw+Qc4qDV4Sb7cgPcPB
 go6Dttcb1aSg4mxwWGesNXx3ff+HYXASx3vnMVoKRO+AdkPml7QGmR4m0uxGfEPhdGsRp1eqouk
 8lorP7sZuoPMGbkN2DUWkneYq5RxFjzg8J3IQP5BDuycvTeRAmBMXmwNLXWwhbjDi8D/Xw3W5En
 6TkNHRJULtT1g9OJVhqXA6SWU5wSoW5BwVhIbNFQhCtkcxTLbLT7Xs1Df4KJwI5DIovHFnzSBoN
 KnBM2YY+cQSqX7dJYUg==
X-Authority-Analysis: v=2.4 cv=LpKiDHdc c=1 sm=1 tr=0 ts=6a572fac cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=LJDSKmyOq5XDa4FDNxEA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: fNL7U7PnLqew9qJpbhrdrZoFYlJz01sb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150064



On 7/15/2026 11:35 AM, Krzysztof Kozlowski wrote:
> On Tue, Jul 14, 2026 at 08:22:48PM +0530, Mohammad Rafi Shaik wrote:
>> Extend the qcom,q6apm-lpass-dais device tree binding to explicitly
>> describe Digital Audio Interface (DAI) child nodes.
>>
>> Add #address-cells and #size-cells to allow representation of multiple
>> DAI instances as child nodes, and define a dai@<id> pattern to document
>> per-DAI properties such as the interface ID and associated clocks.
>>
>> On platforms such as Monaco and Lemans, third-party codecs are hardware
>> wired to the SoC and do not always have an in-tree codec driver to manage
>> their clocks. For these designs, clock line enablement must be driven
>> from the platform side, and this series provides the necessary support
>> for that.
>>
>> On QAIF-based platforms such as Shikra and Hawi, responsibility for voting
>> I2S MCLK and BCLK has moved from the DSP to the kernel. This series
>> introduces the required device tree binding support to represent and
>> vote for these clocks from the kernel.
>>
>> Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>>   .../bindings/sound/qcom,q6apm-lpass-dais.yaml | 89 +++++++++++++++++++
>>   1 file changed, 89 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
>> index 2fb95544d..b37c62ccd 100644
>> --- a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
>> +++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
>> @@ -21,6 +21,82 @@ properties:
>>     '#sound-dai-cells':
>>       const: 1
>>   
>> +  '#address-cells':
>> +    const: 1
>> +
>> +  '#size-cells':
>> +    const: 0
>> +
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
>> +        maxItems: 2
>> +        description: MI2S clocks (mclk, bclk and/or eclk).
>> +
>> +      clock-names:
>> +        minItems: 1
>> +        maxItems: 2
>> +
>> +    allOf:
>> +      - oneOf:
>> +          - properties:
> 
> Please don't do such stuff. Did you find it somewhere? If yes, then
> where - so we can remove it?
> 

It was not copied from another binding.

It was my attempt to model the valid clock combinations.

> I gave you the close-to-exact syntax I expect. It was nothing like this.

clocks:
   minItems: 1
   maxItems: 3


clock-names:
   minItems: 1
   maxItems: 3
   items:
     enum:
       - mclk
       - bclk
       - eclk

The enum version does not enforce the positional relationship between 
clocks and clock-names,

which is why I tried the oneOf approach.

My concern with the suggested syntax is that mclk is not mandatory for 
all platforms.

For example, HAWI only requires bclk and does not use mclk, so requiring 
mclk as the first clock-name would reject valid DTs.

Is there a preferred binding pattern for expressing optional mclk while 
still preserving the positional mapping between clocks and clock-names?

can you please suggest better approach to fix this if any.

Thanks & regards,
Rafi

> 
> Best regards,
> Krzysztof
> 

