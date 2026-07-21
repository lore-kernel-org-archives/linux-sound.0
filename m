Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2F13BCD3E
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 08:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784623349; cv=none; b=CFqY7BgkJzzTQuberROK833MBdLLKiYNsQ39FSDZDApTskzY328OQebdIVODjZjvw0liGb7jFRKG5o70xj5O78buOnb//Zhrla+xjDVq8lNiCkR8g22gGX+xkNdUGDJCYSgiG/BrmB4F+M2/FJeCEIJICzXj4HIgKwOK9jt+dnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784623349; c=relaxed/simple;
	bh=lKde3pt6Kpj/3hvdYp87BCZT1P8f9xGlS5sZvA4sZTo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N109SfQzdZdwgfpxVLVkFWk8WTj7+m6UulLz8IYpINdEYNIB9cnpvWBcAkddLPU/kEUsCaRPzPl890phxMjXlvw7+HFYHl4xswpvJB5U9553W/PPxnawfsFKC14lHKbc7WikyEc+UVfwWRV/ZPMNXMgFKZQL7cpwExlxGqIWe3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V4rCd6Zc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UloMjjMA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V4rCd6Zc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UloMjjMA"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L832Nr092220
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 08:42:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y5AkV8VLMfHRsyhaijYGLJK/vMYhOnODDI0bAEX0xF0=; b=V4rCd6Zcw28BraVQ
	mbZyHP9leVqn/Z9FYaCzmPh2MHcD+xRurxnW9EOI0m5SpxRhbZZd6Ajd/yvxd5xj
	c6x8N40G+UJNcrBQtInaMBk3qV6DUt0HkVhrlAa/lUBHAjBCbzSvY3VsV4S3RHL1
	mEXXIeWyPr4vOVQ8SV9uRVNF8Rg5Np5IaYPNm3edf2vJPAzY0WIQW1rf8IzEKXBm
	QxKSYAHU4MwViVUJ6VfN510q10HYM2XrIG1Wz+bCXOqV7YYfOXQ1i5py4xGEBBI8
	PvqvpsKjyhuyRpBZRTZkQIQbpNjNxQ0ZN0+8ETIrorwiLRya6yyS0otgj4yrOtbq
	lSbGhA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj01a9hg7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 08:42:27 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c892143db7fso6739837a12.1
        for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 01:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784623346; x=1785228146; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y5AkV8VLMfHRsyhaijYGLJK/vMYhOnODDI0bAEX0xF0=;
        b=UloMjjMAqMfQuuKtP27pv4IackiDTDNxBVoZ8k5ok0VkkL1CCvfYp86bdJGKBUXqi1
         a7a5MOuD1SkXw/370NCmIaGprbdtJ9+IXTklqrdBVNQiAf4HAhfcZvTe/tZA0jlcfGaQ
         Rl/Y6RLbK2oAmjrwLxb8/PAaD//60h0y4Uzpficgvw/aTqi4iIkVAgfcQCvsE8xp08Js
         41861w+s9DXsNGUA2dG0tBwL2DHwiOlIpmgcb8xBDxPY8SZCKFZ4173h+HVLz2dTAhly
         vlKgJpd60y6EdabD8B/eThecn1V8o2nwCvFmhVW0PaXggoGzLGkcu1BgfOAKZV50FO8H
         1OQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784623346; x=1785228146;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y5AkV8VLMfHRsyhaijYGLJK/vMYhOnODDI0bAEX0xF0=;
        b=RTFf0if3H+fBFGiF81huUbk0XAZcBmmShLGzMQZnKaNr2ipy6GL1u5wKcNmGZlbI8k
         p6Wh3wW2EHzYW0hkLznPTPk9fhnUSMaRWwZ+3ESKof/2erLEfV4Ew6pH6YXkNyBJhugz
         adHUFTgIfo2ujO/8KvZqtbTPTypFXn2qj0qgT06YGPjwUfS9b/YT0QQKqIsM3h65PJmm
         B+g/FI3kCwKvA6E06C2V1u04VlQZMeVECJJ+2BWwrkMcyF1HgtFoqVu/ST7tPzyttlgY
         ZfzScOPwHpf6jVtDF6r9tVAIfXocCmYG4V+HJE10lHNBJpSKMFXm6Gf+9LpK+n8XiWGh
         9wBg==
X-Forwarded-Encrypted: i=1; AHgh+RqzN51iQe1p+3UN9tKQ848JTHega4wXJx8rBSOx+M4PCtnNGpFiqTkO1xdarL1cqzTf/usTv3M7g6gx5g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwW6bBPXii4q1s65EKPo2NUm92Ys3z59ir9srvopZqSrkn4/3ZR
	6z4sPakktync6ScT0Rlrjs9PY3lGsUCnFhZ3RiTIUL3XdGBnCZ+/USIIGWKJO3P0BC7XxBy3qNo
	pZhyHKVqszPEntZEX4xaflEkjBac7PbMWuKV5kJXLNLZl06LgqTWFoX5rFza//JWJZw==
X-Gm-Gg: AfdE7cmwrC7P6EKbaY3+yxP+BMVgo6bdvIF02827ZXCqiIvUAcGyytOFfjjOwVYXFWq
	tOB58wPAPIGZgu9rFRWr+lT648vf4LRes0d365IG4crjK92TZgZ52HUfWrVykI7v8i0Gt/diXjp
	pp/F/7BmAg51BNkirk7UTcOAHPIsTjNzeBBxG5xot1mkVdQlI0ZC1PLWsGE8/V1qeY6hcFD5WQY
	Ly7Edj6mKCG4WpYqXeTAbkaIv8Fq1McqkSs1WpQJJp/mpGMK4n8Mu46jmLGuyUKf11cN3dQLzhQ
	WlrQZFLjSOMy52akgec/UGm5Qj0d9SBM8JW1cNYn/efxg++968/uYj1cdwS6dZrMvbHsT95B95p
	Ri1VfaQIf3aPIpqfUNULW1219fIuAGhfElkg37w0=
X-Received: by 2002:a05:6a21:48f:b0:3c1:817:7938 with SMTP id adf61e73a8af0-3c3ada3e378mr20031143637.67.1784623346465;
        Tue, 21 Jul 2026 01:42:26 -0700 (PDT)
X-Received: by 2002:a05:6a21:48f:b0:3c1:817:7938 with SMTP id adf61e73a8af0-3c3ada3e378mr20031113637.67.1784623346008;
        Tue, 21 Jul 2026 01:42:26 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb517ba73b4sm5722861a12.4.2026.07.21.01.42.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 01:42:25 -0700 (PDT)
Message-ID: <e2e50e30-6da2-45d9-b472-dae7d41d100d@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 14:12:20 +0530
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
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <2d4513e2-7e14-49bc-8b70-6c07c9f99d6b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BL6DalQG c=1 sm=1 tr=0 ts=6a5f30f3 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Wdb1h0LgAAAA:8 a=4BztS5KMpPGOG9ln_IAA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=j5gyrzqu0rbr1vhfHjzO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA5MSBTYWx0ZWRfX1F545Eo1VoJ3
 Z0LlWRZC14ViJu36jPCcZjsCW0io/hzQTBb+grDqUQHC0QDSup1d8awzb5hUvbe6w8dO/lFwF0U
 k4HlTtHDXTVl1rgTYZA5fjoF/PsyamNuFyb8TeB/2+hRzvo2u85AGLhLIgydbcKLQxsGf6m52gD
 xYFrKbo6Yazp/dBAVld8ZZtnGr1CIqceTTP5sCKlqNtgkzEu8R94STPANsDqzX+ZiCpPcFmSoK1
 MMNmwog6/9q7qEAQR/ieVse8zFxTxd2nFR53pHr7bEzQMoKSKi8sKuEWoeMBTARM5wWEB7j2tyG
 3zQ93dPRfgh5YoS+/nHzTs0QNRQ25JgdwN5B+K3A9RiN24BpFzrXfpBQjsYww+fzUAlyFay6pGX
 S+BX/gsPsDWl6X3/hiywOj0aP7OkbbBEUuH0VeuUOIruy1ZDqVgxLmBjEAieLUkymQzlS1B71AF
 phVQQkXanLUxQV3F6Pw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA5MSBTYWx0ZWRfX69q2zKPwHB3l
 Mx6RE5ovyciqiSCadPhamK/itJIz/WKeFfLQZLXTwOcVc0mGmsc08xpgoUbNstau8oeWQgfxyy9
 ausGkjMU5byFKn5jlHbzG9yv/YqfEso=
X-Proofpoint-ORIG-GUID: nbi6du1pU_RqOBpFVNB4WyAWp_2GqHpa
X-Proofpoint-GUID: nbi6du1pU_RqOBpFVNB4WyAWp_2GqHpa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210091



On 7/21/2026 1:50 PM, Krzysztof Kozlowski wrote:
> On 21/07/2026 10:14, Mohammad Rafi Shaik wrote:
>>
>>
>> On 7/21/2026 12:18 PM, Krzysztof Kozlowski wrote:
>>> On Mon, Jul 20, 2026 at 09:32:24PM +0530, Mohammad Rafi Shaik wrote:
>>>> +# Digital Audio Interfaces
>>>> +patternProperties:
>>>> +  '^dai@[0-9a-f]+$':
>>>> +    type: object
>>>> +    description:
>>>> +      Q6DSP Digital Audio Interfaces.
>>>> +
>>>> +    properties:
>>>> +      reg:
>>>> +        maxItems: 1
>>>> +        description:
>>>> +          Digital Audio Interface ID
>>>> +
>>>> +      clocks:
>>>> +        minItems: 1
>>>> +        items:
>>>> +          - description: MI2S bit clock
>>>> +          - description: MI2S external bit clock
>>>> +          - description: MI2S master clock
>>>> +
>>>> +      clock-names:
>>>> +        minItems: 1
>>>> +        items:
>>>> +          - enum: [bclk, eclk, mclk]
>>>> +          - const: mclk
>>>
>>> This does not match your clocks.
>>>
>>
>> will fix this.
>>
>> clocks descriptions are misleading because they imply an
>> ordered bclk + eclk configuration. I'll drop those descriptions.
>>
>> will keep only
>>
>> clocks:
>>      minItems: 1
>>      maxItems: 2
>>
>>> I gave you exact syntax to use, then in previous version you used
>>> something else. So I reminded. Again you used something else.
>>>
>>> If you decide not to use it, sure, your right but YOU CANNOT come with
>>> clearly invalid code as a substitute.
>>>
>>> NAK
>>
>> Suggested change:
>> https://lore.kernel.org/all/2b4448d0-81f8-410f-b849-0d957a2d2a17@kernel.org/#t
>> minItems: 1
>> items:
>>    - enum: [ bclk, eclk ]
>>    - const: eclk
>>    - const: mclk
>>
>> I tested the suggested schema, but it results in DT binding check failures.
>>
>> DT binding check errors with the suggested change
>> 1. Only mclk enabled
>> bedais: dai@10:clock-names:0: 'mclk' is not one of ['bclk', 'eclk']
>>
>> 2. bclk and mclk enabled
>> bedais:dai@10:clock-names:1: 'eclk' was expected
>>
>>
>> With the current version of this patch, I do not see any DT binding
>> check issues. I tested all supported clock combinations, and
>> dt_binding_check passes successfully in each case.
> 
> Your clocks told story that you have up to three clocks, so indeed if
> you do not have three clocks then my syntax is not accurate.
> 
> Before we go further, where is upstream DTS using this?

Currently, the Shikra DTS changes already present on the mailing list 
include this patch as a dependency:
https://lore.kernel.org/all/20260616201315.2565115-7-mohammad.rafi.shaik@oss.qualcomm.com/

+&q6apmbedai {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	dai@40 {
+		reg = <SECONDARY_TDM_RX_0>;
+		clocks = <&q6prmcc LPASS_CLK_ID_AUD_INTF2_IBIT
+				 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "bclk";
+	};
+};


RubikPi3 DTS patch series uses both mclk and bclk:
https://lore.kernel.org/all/20260715-rubikpi-next-20260605-v2-6-67601d7a8581@thundersoft.com/

Thanks & regards,
Rafi.

> 
> Best regards,
> Krzysztof

