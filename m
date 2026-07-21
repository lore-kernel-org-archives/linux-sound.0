Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C6E434E39
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 09:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784626099; cv=none; b=Q2+NNjiguUwi6qshM+gfaXpC4N55YZvWhq6BVROBrVseiYzaaCthyY9QYWPekJhF9n5rmWSVkpZDSBd/9N5/V/uDzNU1foVoeoqoQvYfje4kuAZwUK7FMsQ3DHOR0I1bxzFGKPROAzqd4Ad/l7fq7mrd8so1L7a8TceNCLN6Bxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784626099; c=relaxed/simple;
	bh=U06TBo/mKu+eYZDBmVcAl/yURIbM3o/0W20aN+oBebI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IqlErhov+7eeVhjbrqAogpNxBo543u+kzINJe/P1t7SRYWd2QqJPuavhJLRqDvAhk6YZPv6vGB0CnjJj2RSGgPTax24eIZ91nm9Tx+NH8rs2wpRsO32lclLJyNaq/vN3CrVsARE9efs1IHCRYSBH2kWPy9FM/6OPsQiDAEjakbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VSa3/VkS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KI0TWzfn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VSa3/VkS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KI0TWzfn"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L6Ifn2934742
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 09:28:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e4ValDJqxvm9G1fPP8csg7waG171yv9cetqT9BwGI1g=; b=VSa3/VkSvMC4Nxbu
	itTziw8biLB87CwbGyzLOXix44bpWK7zDks49475SWWeHK7Jegn3AQXP//AT4wEq
	khSuMJ/tqIjUFhsP415aWbRDCf+6/dqyaVIRfLWM40eapUfA7YsSG9aCZKWriq2l
	G88ipSXrUOG+jlTUR1EtAGTtLw4Hp/vH34X+0ZypIAARr3VUMrd/nOPpZ/PVASe8
	Q25jX1e2OIb3O+kvBfQKtW9iVHLobYxod1id8O1XCSVZ31kv4hLueZTjLL4phO8j
	j0e9FOsa78oXzz/sYyumucfO+hDtJZw7m1QPZQuyWugXAHx9vns1ZJ5lJj2i3NNd
	XAp+1A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqv5uqhr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 09:28:17 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cf27789c79so62496015ad.2
        for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 02:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784626097; x=1785230897; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e4ValDJqxvm9G1fPP8csg7waG171yv9cetqT9BwGI1g=;
        b=KI0TWzfnk7bmk1lxXO9w+Pc2stPr5b/KVmk8zk7dMu/P+qhHGVSFfJtsPLS1rTXWEK
         nirB/JJtWUP+OpnWoz6grYTFA+w8l9fIgR2nitOWJLCb3FHKZRA0bPrsq/wfg9ffeXqv
         N8OxABKAvS0KjEk4zUCDcD167gzLIAKzjqWXQitmH4gRtFFcwZWl9a6pSrERkheHtpxt
         gEOsdEpEZzIYdbrDN6yj4tY/A1ZrBfyMWvARsZQXAC7o+IiazNEDPsxzrrZ3/FVC4M9l
         c9iB45Tv6iwN0Zx6WmNjXi8NOK63WILuPIGCu7FnATGlzYoympnawjgavNiIGHgIDsAS
         oXxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784626097; x=1785230897;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e4ValDJqxvm9G1fPP8csg7waG171yv9cetqT9BwGI1g=;
        b=etfRzOWadbU+k9r4f7kgJ8tAjOwQH2aDQVQlshQqGPFVyXb452U07vJ+8y8rSDPANx
         m80h5q6SlcsUTplcyC+8nLCMXa9I89wGCvCECUFR2w/Ab7Qgt/noIGzCqH8QXACaSMAB
         C+KgAwLVvlinCX5+RCndzV2W2BdcmrXPyTEYYzdYPANAPI5/yog77VizTHt4Wwe8cEjx
         0VLQ29wBYkoQ9rDBwIpyIZjb2QUPQWs0rF5rpWGHAfZdaq4iDAsna97eTWWZFJolXZaT
         NCkSF6SvWgBvldYYoK3sMhA1PDrss+kInyHAixwRU3auHPHm8xCapaV0AzEkbM5RKu5L
         dUtA==
X-Forwarded-Encrypted: i=1; AHgh+Rqw+sP21AXtUrU0G5UCrzm2F8AWq3JY850EfPWbzkifRjkXmWaSIt8X8GvNqWV3KPZoG0wviQPIZvDHdw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm31PrIv812T3PrqoNoF7mqp6ntHMi4Nr18nvvXfTHillFfql2
	V+eXjvZD0vPx1m/j+jLlv9yp+oivTLv24EGTR4iCQbFhEj7rOp0dmApnU7Jq9PqYcpsJHkQlqhC
	DosKebGJVQq/ZZAAsaV2wfeLsN2uD0QvCs+PbmtZzRNS9BP52NxJxlpqXJB/nBxc2Tw==
X-Gm-Gg: AR+sD11dkHCw9xsukdswIjoBGSd8ylBgv1wU6ZKncO9NRwDpMDAs8xW4vRsy124Fsle
	SmsO1yaQILB8ZQ3C+QMNMsaEiP5J03wABpMjOgv7D+hUVkfsJF3OpXc5BWwilXXJiCq+7NGgP0B
	cuXLqugqK7wcee+BP9GJJ0xyLW2w0dyxgLbdIyl4JoPWckYHNC5TwK8UW5cFB5AaN26ut7LpjdN
	3+nQ9F8cbIX9bE1wGpplUDA0qkrlF50Lxc90c1nqRBuDyPqCGOKxgegC3bpJgWbipza5a4Ink97
	yqlyNfnSPH/6MARBLdmrph2Jz8TypUyUd++DRNnJBanB62+iz5tIkX+u5fbqUjTrmApcez5GKZw
	qI/GHrjQl8Kd4649kKW47tgRAe1yeDxW9+M9KnfM=
X-Received: by 2002:a17:903:2441:b0:2c9:97a8:aff4 with SMTP id d9443c01a7336-2cf34a30f51mr197917445ad.45.1784626096691;
        Tue, 21 Jul 2026 02:28:16 -0700 (PDT)
X-Received: by 2002:a17:903:2441:b0:2c9:97a8:aff4 with SMTP id d9443c01a7336-2cf34a30f51mr197917115ad.45.1784626096243;
        Tue, 21 Jul 2026 02:28:16 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344b1348sm72292195ad.18.2026.07.21.02.28.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 02:28:15 -0700 (PDT)
Message-ID: <28cde774-bca2-4bb1-8629-f61f1f92c469@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 14:58:07 +0530
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
 <67179d90-6201-462c-9004-9b4cfd114250@oss.qualcomm.com>
 <2d4513e2-7e14-49bc-8b70-6c07c9f99d6b@kernel.org>
 <e2e50e30-6da2-45d9-b472-dae7d41d100d@oss.qualcomm.com>
 <571d0b42-c566-4426-ad55-514c280b9b1b@kernel.org>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <571d0b42-c566-4426-ad55-514c280b9b1b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _Z4GLgerxReT0qbkYVc-17z6_xRcX3EI
X-Proofpoint-ORIG-GUID: _Z4GLgerxReT0qbkYVc-17z6_xRcX3EI
X-Authority-Analysis: v=2.4 cv=e+U2j6p/ c=1 sm=1 tr=0 ts=6a5f3bb1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Wdb1h0LgAAAA:8 a=bwXcMLKI7JprXPFKUcQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=j5gyrzqu0rbr1vhfHjzO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA5OSBTYWx0ZWRfX73pHYwkEn8om
 TZzCQ+gF0OlFVOJ5NQUnIQPBA9jtYJtHmHBFsiwdQw16zRPTKe9i5PvTPSgfxDI60tVwEwyLSM5
 e8fRX3IoJDC80ZTGyhGIqINcydrb4Rg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA5OSBTYWx0ZWRfXx1gVUR/F7Yj+
 3XcA4kb7MsbDxs9BfJJLnyL6H51kp8JhhYdAlZledMvibguS7tatDP8nt7I5NtnCJv5zKX4tJMc
 HGJI83KIlDYngw8uWScC5RLxs5Pe+s1J07k9PtusW8/nDShslJ/ilqlJ7vBWm/edeQXi8SPlPuM
 XUEPamcI90ZPQkNwJnD76tKraCA4X9BQN3YgqDf9GtCD9H1Vs/Qgx+quhk6H9bXpvVyrx49q6qf
 nZjtgGq+4f/pkf8xYLdpGO+gS2VQSa/m5oOdYfDI0++YBI1ZKmfEbEJ+uj3KlZwx7QHgQw65ZYE
 CxPCzFbm9kCaBOZ1ou7nVi5Aqb/u5aRLYPIZviQ5j+0dEyLoL++miM8H2iA21NP2crh2lUNoGkv
 XXTtFSqyEX+UxkDO1DdH2iXWHV02ORnN4yVT531v9He1Yx/+UDPeeCij3GZFsB/36eoLfjPeQwz
 cP9OnYtKoEZ7gLICkQw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210099



On 7/21/2026 2:16 PM, Krzysztof Kozlowski wrote:
> On 21/07/2026 10:42, Mohammad Rafi Shaik wrote:
>>
>>
>> On 7/21/2026 1:50 PM, Krzysztof Kozlowski wrote:
>>> On 21/07/2026 10:14, Mohammad Rafi Shaik wrote:
>>>>
>>>>
>>>> On 7/21/2026 12:18 PM, Krzysztof Kozlowski wrote:
>>>>> On Mon, Jul 20, 2026 at 09:32:24PM +0530, Mohammad Rafi Shaik wrote:
>>>>>> +# Digital Audio Interfaces
>>>>>> +patternProperties:
>>>>>> +  '^dai@[0-9a-f]+$':
>>>>>> +    type: object
>>>>>> +    description:
>>>>>> +      Q6DSP Digital Audio Interfaces.
>>>>>> +
>>>>>> +    properties:
>>>>>> +      reg:
>>>>>> +        maxItems: 1
>>>>>> +        description:
>>>>>> +          Digital Audio Interface ID
>>>>>> +
>>>>>> +      clocks:
>>>>>> +        minItems: 1
>>>>>> +        items:
>>>>>> +          - description: MI2S bit clock
>>>>>> +          - description: MI2S external bit clock
>>>>>> +          - description: MI2S master clock
>>>>>> +
>>>>>> +      clock-names:
>>>>>> +        minItems: 1
>>>>>> +        items:
>>>>>> +          - enum: [bclk, eclk, mclk]
>>>>>> +          - const: mclk
>>>>>
>>>>> This does not match your clocks.
>>>>>
>>>>
>>>> will fix this.
>>>>
>>>> clocks descriptions are misleading because they imply an
>>>> ordered bclk + eclk configuration. I'll drop those descriptions.
>>>>
>>>> will keep only
>>>>
>>>> clocks:
>>>>       minItems: 1
>>>>       maxItems: 2
>>>>
>>>>> I gave you exact syntax to use, then in previous version you used
>>>>> something else. So I reminded. Again you used something else.
>>>>>
>>>>> If you decide not to use it, sure, your right but YOU CANNOT come with
>>>>> clearly invalid code as a substitute.
>>>>>
>>>>> NAK
>>>>
>>>> Suggested change:
>>>> https://lore.kernel.org/all/2b4448d0-81f8-410f-b849-0d957a2d2a17@kernel.org/#t
>>>> minItems: 1
>>>> items:
>>>>     - enum: [ bclk, eclk ]
>>>>     - const: eclk
>>>>     - const: mclk
>>>>
>>>> I tested the suggested schema, but it results in DT binding check failures.
>>>>
>>>> DT binding check errors with the suggested change
>>>> 1. Only mclk enabled
>>>> bedais: dai@10:clock-names:0: 'mclk' is not one of ['bclk', 'eclk']
>>>>
>>>> 2. bclk and mclk enabled
>>>> bedais:dai@10:clock-names:1: 'eclk' was expected
>>>>
>>>>
>>>> With the current version of this patch, I do not see any DT binding
>>>> check issues. I tested all supported clock combinations, and
>>>> dt_binding_check passes successfully in each case.
>>>
>>> Your clocks told story that you have up to three clocks, so indeed if
>>> you do not have three clocks then my syntax is not accurate.
>>>
>>> Before we go further, where is upstream DTS using this?
>>
>> Currently, the Shikra DTS changes already present on the mailing list
>> include this patch as a dependency:
>> https://lore.kernel.org/all/20260616201315.2565115-7-mohammad.rafi.shaik@oss.qualcomm.com/
>>
>> +&q6apmbedai {
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +	dai@40 {
>> +		reg = <SECONDARY_TDM_RX_0>;
>> +		clocks = <&q6prmcc LPASS_CLK_ID_AUD_INTF2_IBIT
>> +				 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
>> +		clock-names = "bclk";
>> +	};
>> +};
>>
>>
>> RubikPi3 DTS patch series uses both mclk and bclk:
>> https://lore.kernel.org/all/20260715-rubikpi-next-20260605-v2-6-67601d7a8581@thundersoft.com/
>>
> 
> Thanks, I did not see "eclk" used.
> 

Yes, you're right. We have not used eclk in any upstream DTS so far 
since no such board using this.

include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h#L156
#define LPASS_CLK_ID_PRI_MI2S_IBIT	1  (bclk)
#define LPASS_CLK_ID_PRI_MI2S_EBIT	2  (eclk)

My mistake—I understand it now. Both represent bit clocks; one is an 
internal bit clock (IBIT) and the other is an external bit clock (EBIT).

Since they are functionally the same clock type, we can use a single 
clock name (bclk) for both cases. At this point, only mclk and bclk are 
required, so there is no need to introduce a separate eclk clock name.

Sorry for the confusion earlier, i understood wrongly.

so can we keep like below syntex.

      clocks:
         minItems: 1
         maxItems: 2

       clock-names:
         minItems: 1
         items:
           - enum: [bclk, mclk]
           - const: mclk

This allows:
bclk
mclk
bclk, mclk

Thanks & regards,
Rafi.

> Best regards,
> Krzysztof

