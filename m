Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949084F390F
	for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 13:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792417067; cv=none; b=NXywWyjHYds/0EM1n597assFm2+vmj6oAA7amOwfYBxk/A00UNoRpMH28PDwsSuJYfzsKC7sCiBAp+IXjYClzEXazwxL0XkUJXBOi1cTlAszdAjQchBX4o6HyKLle49/bJTBKXnevzq+0W0WCF5E2lB7MjwGweMbGzaqUW+Gwqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792417067; c=relaxed/simple;
	bh=Ukli6ucL89G8zs1MgqQcxYZZM3R/1OcrT5RWWqvjlxE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OJvt9UHez9ZPzdlGZgRXcxV9l2XZWnxfCPpbhYnmg7hayzRuB65AkxXwqZW5kYJo5qh0MpVPI23ryD+NHaFDMYa5Q9eF6b6MK3VbZKYtdQBjVd3S5XbDHX0Bi2iDywauBX3HOb8OqyTz3WMZsMSwuWux1YQM2zTCLGN3z+sh0S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EKjOJi1R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ftcF1unV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EKjOJi1R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ftcF1unV"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8P220724559
	for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 13:37:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k1ygSxBiLlTu9L2AA8BzlaX12ReaTq3+7SIiiPvR+UE=; b=EKjOJi1RwNNtvrJv
	Bn8lt1TeCU6cUV5yyv6FZPOoNn77WGCxpeB0i8mA9iXZH21NYDBlgM+Qr/wQBi/M
	lEMbD3dbXyOtzsyEABW6WuPb3W7gEg/kbq6DSfaa0F0iJtNxjf5PJm2w6y9uuA1l
	ztaJzzbQyy7IB9a7JSAOOhPZHKtGe+YWfz3UjuUOswbpDjP4/x5bT5xtOBIVsiRD
	gzCFLN4a2gjzuexBjDFj9Xw9UyzkmMcp9NYgeiRsIEjp5wS3wLj5CkL3FtjNQ0xR
	d9upfGbA1EvRbuDXpbHs9MC5QZUDp9dFtrm/exfTl8UrBY+4MblRWUUyiuObsUU6
	SfjicQ==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf65hajn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 13:37:45 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4ab260600easo4736111b6e.1
        for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 06:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792417065; x=1793021865; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k1ygSxBiLlTu9L2AA8BzlaX12ReaTq3+7SIiiPvR+UE=;
        b=ftcF1unVVwvNcPWtE0zAofs8gAD3WzdlRCht/aHo1jFj/tFcvH92T9X3tiQYz0a/K3
         Hwv8tnM+I6omu+zvuxluiNXCxO3DFBk1914IQgfAxJ4GthZwhlYzvf44iykdVN41K1oS
         U+TZ9RjNFZgWSRbypwFIXrf0O0sXbmuApJq21GpalXJoWQ5Xruh3xBlZ8RqgfWV8RuP3
         YOE6ddFWUBbRfM8VCcr1t2ReT2+rAxqqABZONjKF9uHmP9GaCT7OnPIsk1CpvwyqTRgx
         +Wpt0cX1UFsnQzvbGAvhZ0sst2a/558PWZ1yMXyOj4opZOuM+2xFdRNTLsC7V+DP1YZL
         q3Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792417065; x=1793021865;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k1ygSxBiLlTu9L2AA8BzlaX12ReaTq3+7SIiiPvR+UE=;
        b=ZQba56rbR+mcqLjFm372wITaMK7O83QiRDjzsVNiDQAE7d3ZLi667Q3D/n+OG62y20
         0XY6Ldk/GaNrn8yv8lNtfk9NjTN35wAAIxIqlOdDJJJvL5m3rRFeWRlhWS7zpIf45v9j
         oYHosdlAGu8SBHHFsD+DY9TtylOKX5DuxpWW9UK+c9SYzBCxIdFhHSOVhkHc+8RcmzPL
         hTaeBnkdKUTybQ+nsLYmGmEHukk3t+MKnGNfyLIPBHNubenAN5bT6HQbjKVz/lRijnEL
         uI5WIKaMcjNF1JUgbTo5P5U6qMQirLzAYj7WJdL3exxr97NfuQSw4X47ie7hrYUnwYTd
         NX9w==
X-Forwarded-Encrypted: i=1; AKwUvBx3jrl+5irP7jSFQ6Nx9ulHNc0XfiX9dior8gTL7X8N6RxIGnD4MqwyqVLn2BzvS13B4BYApLk1C9+uMA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIlXpPVTd7CYRgYR1GbmjYKgx1QJ3vbdZ/ea1EY/uBCumpO/41K
	G8qd8V3P3qPHoo6hB1XVvLzGrddT11iP8UBKXCiTWNPQfvIhkqodhNkEMw7jmYHianfFge0xBNR
	0RYBqydjTOydtHNyZjgrukiQ+4UOQUtmaetiUYUM2pDMW23ILRtE/2hOZxFkcWSiqog==
X-Gm-Gg: AYBFou1iYXhPHVsza9KCeySkktgK3ywarWxnwpWP2xWM0OXzMJtvbaw9BE8fGhid3u9
	K7Y4V8C/xkeAqBb62k5KJHOX+q9u90IzDRCQF9Jy6cNWOTcSUo3UOC5feiuRGU/F2qXcIoit2CR
	T5GSuPCKATU+46pzrlYJdf4/SBpBbLXKWCgiiEkU7tQR5GHW3vqFXlQyV8Az3rbIixER+eR/iqY
	/BPSiCJPRrWXkUiG+PLiMtHwBz0z9ZP7Kv8g7uji3a8+uxkF3XacvsTjP7ZEglhrRAyGm6sVJft
	P56AAQEeYdn2svnwGyIIyh3UphZYgb7x1Ok3ZBi9DzcpEuXGi8kJrB80ysFHM5LyOe53WvfJt1V
	Dp4FpkkWk2vEzwlMrn6331b18ByHFsrs7XvE=
X-Received: by 2002:a05:6808:221f:b0:4e7:f052:460c with SMTP id 5614622812f47-53cd39d6a26mr4945085b6e.23.1792417065003;
        Mon, 19 Oct 2026 06:37:45 -0700 (PDT)
X-Received: by 2002:a05:6808:221f:b0:4e7:f052:460c with SMTP id 5614622812f47-53cd39d6a26mr4944995b6e.23.1792417061644;
        Mon, 19 Oct 2026 06:37:41 -0700 (PDT)
Received: from [192.168.0.103] ([124.123.193.51])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5388dd87607sm7601048b6e.13.2026.10.19.06.37.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 06:37:40 -0700 (PDT)
Message-ID: <6680c20a-59f5-4da4-a389-e80b22830ded@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 19:07:30 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/9] ASoC: dt-bindings: qcom: Add Hawi LPASS macro
 codecs
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261014-add_shikra_support_v5-v5-0-fb9f0667e613@oss.qualcomm.com>
 <20261014-add_shikra_support_v5-v5-6-fb9f0667e613@oss.qualcomm.com>
 <20261015-grumpy-salmon-of-holiness-b6e9f4@quoll>
 <9a12fc9c-e766-45d3-a6f8-eb6ff3332434@oss.qualcomm.com>
 <cd256380-fdfd-4359-8611-0901045f66df@kernel.org>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <cd256380-fdfd-4359-8611-0901045f66df@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1NCBTYWx0ZWRfX2r3MQUiMab+y
 0rlisoMy0JOvSt4+fNtsNHHx8/bYkE4mvKsXnP96cG8XreaKyieGwqABtgO3Yy1Kb32xmPAxMHz
 xijcGXfZApRdYGpWe8o3rYY94cokhEY=
X-Proofpoint-ORIG-GUID: jCcleYcHwM3Jb3yaAk1uAbfYRxkPEcVd
X-Authority-Analysis: v=2.4 cv=Y5ptIReN c=1 sm=1 tr=0 ts=6ad61d29 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=BrlcFtHvR1PXzI/wv7BzPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=4TWVGNFFVB-82TrN4G0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1NCBTYWx0ZWRfXwpEPDgmHXFcV
 qLeevgzEPZEJELvUbx2hSrzjl5TEhWKEuAdZrkiFp3JMGlA4oT6JKCSgxDNEPJe08HJE48H1oLR
 5fNHQX9OQ+9u1C06JMAqVHV7Kcg1KB2JLjy1Kpw4iqK9z+exutE81DMGgVODhmaP8TQpAhnnvyC
 Z6cGYIhfwHuV/B40lBW34eKzrZG5p2i/707p2ei/OXTv1RGf/Yi7UfcButq8ZTQ9z60eLMNO2WH
 oW6xe/dlK5CAmZvIw26GXR0nJ8OGIBzgcfAWhmK09CL3l9Uhg0CCEWuRfNcEIe8hCRYVlX1R1S6
 aKVF74PXI4LQSnfbWUHnGvNnykHSQ0S6Un3nvJmJ4ZeL8HZwWaUIfkkDhj4PiS0zh3PTq6jUZn9
 Iwb48PhwBt5C8xYH3AmxU5rcxugKaoZP74sV6oS2EGoov/Y4pdo8NltE66kQqy7WSxCOTntQF7/
 X2DGfovrmUOPFGyQt2w==
X-Proofpoint-GUID: jCcleYcHwM3Jb3yaAk1uAbfYRxkPEcVd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190054


On 10/16/2026 7:21 PM, Krzysztof Kozlowski wrote:
> On 16/10/2026 10:14, Prasad Kumpatla wrote:
>> On 10/15/2026 3:08 PM, Krzysztof Kozlowski wrote:
>>> Are you sure you are not using source clock names?
>> On Hawi this RX input is sourced from the LPR vote (LPASS_HW_LPR_VOTE)
> That the source clock name. Look, where LPASS_HW_LPR_VOTE is used:
>
>> instead of the MACRO vote used on sm8550:
>>
>>       clocks = <&q6prmcc LPASS_CLK_ID_RX_CORE_TX_MCLK ...>,
>>                <&q6prmcc*LPASS_HW_LPR_VOTE* ...>,
> Here.  LPASS_HW_LPR_VOTE is the name in q6prmcc.
>
>>                <&q6prmcc LPASS_HW_DCODEC_VOTE ...>,
>>                <&lpass_vamacro>;
>>       clock-names = "mclk",*"lpr"*, "dcodec", "fsgen";
>>
>> "lpr" is the same style of name as the existing "macro"/"dcodec" entries,
> That's the same vote as here, no? Vote for main block (macro)?

No, LPR and MACRO are different votes - they request different param_ids:

     bool lpr_req = (hw_block_id == Q6PRM_HW_LPR_VOTE);
     param_data->param_id = lpr_req ? PARAM_ID_RSC_CPU_LPR
                                    : PARAM_ID_RSC_HW_CORE;
     if (lpr_req)
             req->lpr_state = LPR_CPU_SS_SLEEP_DISABLE;
     else
             req->hw_clk_id = hw_block_id;

It's not the macro vote. LPR is the vote to put the LPASS block into
sleep-disable before accessing the LPAIF registers, so the name reflects
that different vote rather than the macro one.

This LPR Vote is common accross all the LPASS macros to use for Hawi and Maili LPASS versions .
I will reframe the commit message to reflect same in next revision.

Thanks,
Prasad

>
>> not a parent/source name. An sm8550 fallback can't be used here because it
>> pins input #2 to "macro", which no longer matches the LPR source on Hawi;
>> the other three inputs are unchanged, so RX gets its own clock-names.
>>
>> Thanks,
>> Prasad
>>
>
> Best regards,
> Krzysztof
