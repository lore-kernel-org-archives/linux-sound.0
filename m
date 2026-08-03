Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6BA2EEE77
	for <linux-sound@vger.kernel.org>; Mon,  3 Aug 2026 15:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785771794; cv=none; b=QkTOLmzEFrfrLdWeeeHwpRQDcZfcXvBL+0WtAl/sr02yq/x0ADf0ZmV8vsDKmhJOll6NrWqIXdnIMBpcQuGIedinsI4cuIZPF2xpCyXRoutT/jGkj+SCDYbhAgf0T44TuvsBiUxzB+8rk6i/Y7uFj0ILKwCe3T9kg04aaQL6g90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785771794; c=relaxed/simple;
	bh=uch/Bpm7NjpfpIugs0DyFSb0tbz4tF6maq+limLa2d4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oLHhJt3Eh0mz7oeFUfaVnuwylavvWckWvrOczDfgq/knRN2QgjSNdJMTQqf+JQ216835A/lIBIKy2/PwnP1OmZsHr6W/2rHS3vh5o342udJ0viYaL8ha35EA38uJ3asEIwPNUYB6zLGrP3wlSfV3BiAL3lFzwOCJRXpI7OwOlmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L2qXc9jB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e54Tn7kt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L2qXc9jB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e54Tn7kt"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673EBv7h1355033
	for <linux-sound@vger.kernel.org>; Mon, 3 Aug 2026 15:43:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vSG6xJrSFYimCCTaJLPWeKHPlAcnuFSrBZk5ZWRLKI8=; b=L2qXc9jB8n8YH85I
	QNF30Pi71Z1Yymis9ItvLRskj6Kv20VdULyUQ83HIkXhP8t4J8Hpfa6ifhb0cr/4
	mAlXwIL1HtzqMhhV3Ta9rmMcjyBabSsDRE6XE4OZi3tE1SOYzeKrGe4cy0ctq5cs
	h7QoFlTJP48uQIfJ5mmQASTDc0I8sJwapED+cVJE3AJyvzbBfT+5Cm2Gn7ACR0SK
	UV+IG4NKFPjjfzYrs0spRKhRk9mrU4LPLJwd76dQkF7ZmcMq/rtS90Rpl/EiCixA
	V3k3zVQ/8UbAU+qocy2B1wK2m8msa9DJO4DSvxtuslpp7AwN79wm7ChOW13LgVsX
	59Wodg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnrdab53-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 03 Aug 2026 15:43:11 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e7b87ce77so9337360a91.0
        for <linux-sound@vger.kernel.org>; Mon, 03 Aug 2026 08:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785771791; x=1786376591; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vSG6xJrSFYimCCTaJLPWeKHPlAcnuFSrBZk5ZWRLKI8=;
        b=e54Tn7kt6ruTf6QIMNzH0kZk65+Um6tISSzjGEG62/vsl1Q02MEHNpYUzZBmn9BztP
         SLKPnF0jovHYUEPIq7fTcENS36SwBHfFa+1C7Sk54g0lBWIKBPEETVIURqyHexWd0+2P
         uyZXTKDIbWnAJFDEsSgzw4WeWyahKMJFj8Jzo9YJNgmsH/X8rqyPQsatMCmKKAxmXZHz
         ocoNW/wYujqwk6z0PCK1OONN3deaNG0HItVF8WrdDEGuZSIPPKO5ENIAVGQw30thCJNx
         QN3KKgvGMqdbzzlAr04DRhmC0GFhRaXIytc4ytrGTIFYsfXjhjDbLZAoXNKsOxRAB/7n
         zbPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785771791; x=1786376591;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vSG6xJrSFYimCCTaJLPWeKHPlAcnuFSrBZk5ZWRLKI8=;
        b=DNXOxyK1JXnszb25j3RrbYVA4iZBVp6JSNEM1u1T1Y7WB1CrOsqCtKSQwv1qBup3q5
         v5dnmTYJiwedL4XJA2DcwgchC0rEV3p6y8Wm5CUiDbReBnz/jwATAz5q58h8oOmWVBoQ
         Ab6Z8N6xuirrHxEV+hqI5TvL2ExU2pizVjzG0lHcbmZYecQlskbD5sl97ZvY/SSSGFOi
         Yf1LVL4b1LPJchb6PAZqAzdpRfcbkI5Zxe91xJpgX7vvqQNrMISDXwroLkkga5ElFkOi
         CSZl2WzmwgSHAId65pb65wjirqTNbbpYOLf7yx18NF1nxjE0IfVAuwMbIZXf+OpkNjc/
         c1eQ==
X-Forwarded-Encrypted: i=1; AHgh+RpPlOwSooUVeJBCnrv5ETGO/GRPl9TW8+h9k2ACpSf26gAXGAhJImEjuUlR1rM0tXDxOCEo8v0o1K2P9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrThRiHtPJhf1jZBmSmsZZtP0oY8pC7GmJsjC0ASj9LQaI1T1+
	IN0Ie0B5tlSKnZ2llw8jSC9asstpBWUNFRpTtb9wZgIRK8FSjVcz4B4JLCjQKiu4wfkbZYVdwEa
	u90P4I6+05rCzzKdjefn2pxHuEo9YmLUhMDc/63+QQwVX7RF9BVjjzSja+DmBHKmksw==
X-Gm-Gg: AR+sD12qQBpbRJLM6LDu+7PZYv0m92eD15v3xIfX3DV96NM+OvlnxBmvUoCzZifyZtA
	oKIuA9WKddMcmjfO5OBObHm1oG15FKGrQHbH2AMR4fWPZ9HSlsrth2aROF4wUd5T6p0iLHcBqVJ
	yTUymiak/csOZfYcDKbZ1id+1Huh0lWDLGW/4o26jnyTMhlOcSONe151SyFC39GX7gXsP1L20r+
	to2hL+/z78F7laPGh30IgEGP5lXTNKwXIuWRZwPsdrXh4Sopl1eIZshEKvQS+yLo2ySlqObrU/j
	z1ABW5GyKUBplLJpez3W7DmukwpP5ZfyQcO02a686uhQWXBJVTPWVWAiDPq11OOM1ees03jHo2R
	R0eiyE2qHeaU/2V82twztQLy421NWBDVtiQ==
X-Received: by 2002:a17:90b:3e8a:b0:37f:c2a8:ce45 with SMTP id 98e67ed59e1d1-38fbc3e7dc1mr9145691a91.4.1785771791052;
        Mon, 03 Aug 2026 08:43:11 -0700 (PDT)
X-Received: by 2002:a17:90b:3e8a:b0:37f:c2a8:ce45 with SMTP id 98e67ed59e1d1-38fbc3e7dc1mr9145671a91.4.1785771790553;
        Mon, 03 Aug 2026 08:43:10 -0700 (PDT)
Received: from [10.219.49.187] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fec124c5dsm9210a91.12.2026.08.03.08.43.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 08:43:09 -0700 (PDT)
Message-ID: <084f16eb-2d7e-4cb7-843b-e2dc1722aeb0@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 21:13:05 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/7] ASoC: qcom: qdsp6: add topology-driven Audio IF
 support
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260801054610.4047089-1-prasad.kumpatla@oss.qualcomm.com>
 <20260801054610.4047089-2-prasad.kumpatla@oss.qualcomm.com>
 <ce580ddc-6bd0-4e34-b399-ef2919e6bf6a@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <ce580ddc-6bd0-4e34-b399-ef2919e6bf6a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE0MCBTYWx0ZWRfXwJa4mryx35XU
 hZHcvW0M5M9w5MY+g8CiiMGzltkQWyp16zg2xBL/9xz4INzieJxUvL6RilcEc4ISLAsRqqBZtdw
 V7CxGVavtyAKnN/HOxBODGKMB+m/NoA=
X-Authority-Analysis: v=2.4 cv=f/94wuyM c=1 sm=1 tr=0 ts=6a70b70f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=k7EgXL6YDVTv4WvjHTwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: zsnfjEimNMAYhjYcCyHk28QITRFi3KrI
X-Proofpoint-ORIG-GUID: zsnfjEimNMAYhjYcCyHk28QITRFi3KrI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE0MCBTYWx0ZWRfXzGVDsOTTCnp0
 3UTqs88SgEPL2cMppUU/DA8wgjeSrGvnPD1Mtxpguif+A9JjZKyHuhdgzn3BOH5P+7WZ7fwdmdD
 +qiggp6VxrdOYfw8MqBM81KTdsGLtHeLJw/Wx7A8HI7ugz/bZOhqcxLc5IGgl8d8bGbvc3Da3nK
 zh1S74hntoj0ytc0MEPuL83ED2BXx2EsnGGGFpnqaQGDj6J1dTvyIMpeu+NFK1xoKf0f4DcpHgB
 Wka0B6CDPTwWCrERRj+Do8a+dZgJuAG/2GgzuQRxF5KiVCRHUh0eargIjt7S7BJLt0GcG6TAo9k
 YxqTYGl94HnH0e7cwqxn7ekEsYdudJTPzmsK7VU16wOpXoJU6ixr/I+Qb0ocerr4yH3wTNBw3f/
 eJ7PZRnjWCvAD9aZeYG9PPmkYOhRSpXtVaA+iHs7d/WiQM/lRFHsYfEf16ceAGMNTbPiu2lcsTg
 0XwzpYGhfKjDdGqSdxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_03,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030140


On 8/2/2026 6:29 PM, Srinivas Kandagatla wrote:
> On 8/1/26 6:46 AM, Prasad Kumpatla wrote:
>> Add topology parsing and media-format programming for Audio IF source and
>> sink modules.
>>
>> Add the Audio IF module IDs, the required topology tokens, and a dedicated
>> topology loader that stores the parsed interface configuration in the
>> AudioReach module state. Also add the Audio IF media-format path that
>> sends the interface configuration, hardware endpoint media format, and
>> frame-duration parameters for Audio IF modules.
>>
>> This keeps the serial-interface configuration topology-driven while still
>> allowing the machine driver to provide runtime slot and media format
>> settings. The same Audio IF path can then be reused for TDM, PCM, and I2S
>> style backends.
>>
>> The new UAPI tokens (AR_TKN_U16_MODULE_SYNC_SRC=262 through
>> AR_TKN_U8_MODULE_INV_EXT_BIT_CLK=276) are added, together with the value
>> defines used by the sync source, sync mode, data delay, interface mode,
>> bit clock type, and polarity tokens.
>>
>> MODULE_ID_AUDIO_IF_SINK (0x0700117C) and MODULE_ID_AUDIO_IF_SOURCE
>> (0x0700117D) are introduced in this patch.
>>
>> This Module is validated on Hawi and Shikra platforms.
>>
>> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
>> ---
> Small nits below.
>
>>   include/uapi/sound/snd_ar_tokens.h |  89 ++++++++++++++++++++++++
>>   sound/soc/qcom/qdsp6/audioreach.c  |  93 +++++++++++++++++++++++++
>>   sound/soc/qcom/qdsp6/audioreach.h  |  84 +++++++++++++++++++++++
>>   sound/soc/qcom/qdsp6/topology.c    | 105 +++++++++++++++++++++++++++++
>>   4 files changed, 371 insertions(+)
>>
>> diff --git a/include/uapi/sound/snd_ar_tokens.h b/include/uapi/sound/snd_ar_tokens.h
>> index 6b8102eaa121..bda65311cfa9 100644
>> --- a/include/uapi/sound/snd_ar_tokens.h
>> +++ b/include/uapi/sound/snd_ar_tokens.h
>> @@ -168,6 +168,58 @@ enum ar_event_types {
>>    *						LOG_WAIT = 0,
>>    *						LOG_IMMEDIATELY = 1
>>    *
>> + * %AR_TKN_U16_MODULE_SYNC_SRC:			Frame sync source
>> + *						AR_AUDIO_IF_SYNC_SRC_EXTERNAL = 0,
>> + *						AR_AUDIO_IF_SYNC_SRC_INTERNAL = 1
>> + *
>> + * %AR_TKN_U16_MODULE_CTRL_DATA_OUT_ENABLE:	Enable data-out tri-state control
>> + *						AR_AUDIO_IF_CTRL_DATA_OE_DISABLE = 0,
>> + *						AR_AUDIO_IF_CTRL_DATA_OE_ENABLE = 1
>> + *
>> + * %AR_TKN_U32_MODULE_SLOT_MASK:			Active TDM slot bitmask
>> + *
>> + * %AR_TKN_U16_MODULE_NSLOTS_PER_FRAME:		Number of slots per TDM frame
>> + *
>> + * %AR_TKN_U16_MODULE_SLOT_WIDTH:		Slot width in bits (16 or 32)
>> + *
>> + * %AR_TKN_U16_MODULE_SYNC_MODE:			Frame sync mode
>> + *						AR_AUDIO_IF_FRAME_SYNC_MODE_SHORT = 0,
>> + *						AR_AUDIO_IF_FRAME_SYNC_MODE_ONE_SLOT = 1,
>> + *						AR_AUDIO_IF_FRAME_SYNC_MODE_LONG = 2
>> + *
>> + * %AR_TKN_U16_MODULE_CTRL_INVERT_SYNC_PULSE:	Invert frame sync pulse polarity
>> + *						AR_AUDIO_IF_SYNC_NORMAL = 0,
>> + *						AR_AUDIO_IF_SYNC_INVERTED = 1
>> + *
>> + * %AR_TKN_U16_MODULE_CTRL_SYNC_DATA_DELAY:	Data delay relative to frame sync
>> + *						AR_AUDIO_IF_DATA_DELAY_NONE = 0,
>> + *						AR_AUDIO_IF_DATA_DELAY_1_CYCLE = 1,
>> + *						AR_AUDIO_IF_DATA_DELAY_2_CYCLE = 2
>> + *
>> + * %AR_TKN_U16_MODULE_INTF_MODE:			Audio IF interface mode
>> + *						AR_AUDIO_IF_INTF_MODE_TDM = 0,
>> + *						AR_AUDIO_IF_INTF_MODE_PCM = 1,
>> + *						AR_AUDIO_IF_INTF_MODE_I2S = 2
>> + *
>> + * %AR_TKN_U16_MODULE_QAIF_TYPE:			QAIF hardware port type index
> What are the supported types for this?

Hi Srini,

Thanks for the review.
Below are supported types. I will add them as well in next revision.
Range: 0x0 - QAIF
              0x1 - QAIF_VA

>
>> + *
>> + * %AR_TKN_U32_MODULE_ACTIVE_LANE_MASK:		Active lane bitmask for multi-lane
>> + *
>> + * %AR_TKN_U32_MODULE_FRAME_SYNC_RATE:		Frame sync rate in Hz
>> + *
>> + * %AR_TKN_U16_MODULE_BIT_CLK_TYPE:		Bit clock type
>> + *						AR_AUDIO_IF_BIT_CLK_INTERNAL = 0,
>> + *						AR_AUDIO_IF_BIT_CLK_EXTERNAL = 1,
>> + *						AR_AUDIO_IF_BIT_CLK_SKIP = 2
>> + *
>> + * %AR_TKN_U8_MODULE_INV_INT_BIT_CLK:		Invert internal bit clock
>> + *						AR_AUDIO_IF_CLK_NORMAL = 0,
>> + *						AR_AUDIO_IF_CLK_INVERTED = 1
>> + *
>> + * %AR_TKN_U8_MODULE_INV_EXT_BIT_CLK:		Invert external bit clock
>> + *						AR_AUDIO_IF_CLK_NORMAL = 0,
>> + *						AR_AUDIO_IF_CLK_INVERTED = 1
>> + *
>>    * %AR_TKN_DAI_INDEX:				dai index
>>    *
>>    */
>> @@ -240,6 +292,43 @@ enum ar_event_types {
>>   #define AR_TKN_U32_MODULE_LOG_TAP_POINT_ID	260
>>   #define AR_TKN_U32_MODULE_LOG_MODE		261
>>   
>> +#define AR_TKN_U16_MODULE_SYNC_SRC		262
>> +#define AR_TKN_U16_MODULE_CTRL_DATA_OUT_ENABLE	263
>> +#define AR_TKN_U32_MODULE_SLOT_MASK		264
>> +#define AR_TKN_U16_MODULE_NSLOTS_PER_FRAME	265
>> +#define AR_TKN_U16_MODULE_SLOT_WIDTH		266
>> +#define AR_TKN_U16_MODULE_SYNC_MODE		267
>> +#define AR_TKN_U16_MODULE_CTRL_INVERT_SYNC_PULSE	268
>> +#define AR_TKN_U16_MODULE_CTRL_SYNC_DATA_DELAY	269
>> +#define AR_TKN_U16_MODULE_INTF_MODE		270
>> +#define AR_TKN_U16_MODULE_QAIF_TYPE		271
>> +#define AR_TKN_U32_MODULE_ACTIVE_LANE_MASK	272
>> +#define AR_TKN_U32_MODULE_FRAME_SYNC_RATE	273
>> +#define AR_TKN_U16_MODULE_BIT_CLK_TYPE		274
>> +#define AR_TKN_U8_MODULE_INV_INT_BIT_CLK	275
>> +#define AR_TKN_U8_MODULE_INV_EXT_BIT_CLK	276
>> +
>> +#define AR_AUDIO_IF_SYNC_SRC_EXTERNAL		0
>> +#define AR_AUDIO_IF_SYNC_SRC_INTERNAL		1
>> +#define AR_AUDIO_IF_CTRL_DATA_OE_DISABLE	0
>> +#define AR_AUDIO_IF_CTRL_DATA_OE_ENABLE		1
>> +#define AR_AUDIO_IF_INTF_MODE_TDM		0
>> +#define AR_AUDIO_IF_INTF_MODE_PCM		1
>> +#define AR_AUDIO_IF_INTF_MODE_I2S		2
>> +#define AR_AUDIO_IF_FRAME_SYNC_MODE_SHORT	0
>> +#define AR_AUDIO_IF_FRAME_SYNC_MODE_ONE_SLOT	1
>> +#define AR_AUDIO_IF_FRAME_SYNC_MODE_LONG	2
>> +#define AR_AUDIO_IF_SYNC_NORMAL			0
>> +#define AR_AUDIO_IF_SYNC_INVERTED		1
>> +#define AR_AUDIO_IF_DATA_DELAY_NONE		0
>> +#define AR_AUDIO_IF_DATA_DELAY_1_CYCLE		1
>> +#define AR_AUDIO_IF_DATA_DELAY_2_CYCLE		2
>> +#define AR_AUDIO_IF_BIT_CLK_INTERNAL		0
>> +#define AR_AUDIO_IF_BIT_CLK_EXTERNAL		1
>> +#define AR_AUDIO_IF_BIT_CLK_SKIP		2
>> +#define AR_AUDIO_IF_CLK_NORMAL			0
>> +#define AR_AUDIO_IF_CLK_INVERTED		1
>> +
>>   #define SND_SOC_AR_TPLG_MODULE_CFG_TYPE 0x01001006
>>   struct audioreach_module_priv_data {
>>   	__le32 size;	/* size in bytes of the array, including all elements */
>> diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
>> index e6e9eb2e85aa..6a11f2932ba5 100644
>> --- a/sound/soc/qcom/qdsp6/audioreach.c
>> +++ b/sound/soc/qcom/qdsp6/audioreach.c
>> @@ -152,6 +152,13 @@ struct apm_i2s_module_intf_cfg {
>>   
>>   #define APM_I2S_INTF_CFG_PSIZE ALIGN(sizeof(struct apm_i2s_module_intf_cfg), 8)
>>   
>> +struct apm_audio_if_module_intf_cfg {
>> +	struct apm_module_param_data param_data;
>> +	struct param_id_audio_if_intf_cfg cfg;
>> +} __packed;
>> +
>> +#define APM_AUDIO_IF_INTF_CFG_PSIZE ALIGN(sizeof(struct apm_audio_if_module_intf_cfg), 8)
>> +
>>   struct apm_module_hw_ep_mf_cfg {
>>   	struct apm_module_param_data param_data;
>>   	struct param_id_hw_ep_mf mf;
>> @@ -168,6 +175,13 @@ struct apm_module_frame_size_factor_cfg {
>>   
>>   #define APM_FS_CFG_PSIZE ALIGN(sizeof(struct apm_module_frame_size_factor_cfg), 8)
>>   
>> +struct apm_module_hw_ep_frame_duration_cfg {
>> +	struct apm_module_param_data param_data;
>> +	struct param_id_hw_ep_frame_duration frame_duration;
>> +} __packed;
>> +
>> +#define APM_HW_EP_FRAME_DURATION_PSIZE ALIGN(sizeof(struct apm_module_hw_ep_frame_duration_cfg), 8)
>> +
>>   struct apm_module_hw_ep_power_mode_cfg {
>>   	struct apm_module_param_data param_data;
>>   	struct param_id_hw_ep_power_mode_cfg power_mode;
>> @@ -1042,6 +1056,81 @@ static int audioreach_i2s_set_media_format(struct q6apm_graph *graph,
>>   	return q6apm_send_cmd_sync(graph->apm, pkt, 0);
>>   }
>>   
>> +static int audioreach_audio_if_set_media_format(struct q6apm_graph *graph,
>> +						const struct audioreach_module *module,
>> +						const struct audioreach_module_config *cfg)
>> +{
>> +	struct apm_module_hw_ep_frame_duration_cfg *fd_cfg;
>> +	struct apm_module_param_data *param_data;
>> +	struct apm_audio_if_module_intf_cfg *intf_cfg;
>> +	struct apm_module_hw_ep_mf_cfg *hw_cfg;
>> +	int ic_sz = APM_AUDIO_IF_INTF_CFG_PSIZE;
>> +	int ep_sz = APM_HW_EP_CFG_PSIZE;
>> +	int fd_sz = APM_HW_EP_FRAME_DURATION_PSIZE;
>> +	int size = ic_sz + ep_sz + fd_sz;
>> +	u32 slot_mask = cfg->slot_mask ? cfg->slot_mask : module->slot_mask;
>> +	u16 nslots_per_frame = cfg->nslots_per_frame ?
>> +				 (u16)cfg->nslots_per_frame : module->nslots_per_frame;
>> +	u16 slot_width = cfg->slot_width ? (u16)cfg->slot_width : module->slot_width;
>> +	void *p;
>> +
>> +	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(size, APM_CMD_SET_CFG, 0);
>> +	if (IS_ERR(pkt))
>> +		return PTR_ERR(pkt);
>> +
>> +	p = (void *)pkt + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
>> +	intf_cfg = p;
>> +
>> +	param_data = &intf_cfg->param_data;
>> +	param_data->module_instance_id = module->instance_id;
>> +	param_data->error_code = 0;
>> +	param_data->param_id = PARAM_ID_AUDIO_IF_INTF_CFG;
>> +	param_data->param_size = ic_sz - APM_MODULE_PARAM_DATA_SIZE;
>> +	intf_cfg->cfg.qaif_type = module->qaif_type;
>> +	intf_cfg->cfg.intf_idx = (u16)module->hw_interface_idx;
>> +	intf_cfg->cfg.intf_mode = module->intf_mode;
>> +	intf_cfg->cfg.ctrl_data_out_enable = module->ctrl_data_out_enable;
>> +	intf_cfg->cfg.active_slot_mask = slot_mask;
>> +	intf_cfg->cfg.nslots_per_frame = nslots_per_frame;
>> +	intf_cfg->cfg.slot_width = slot_width;
>> +	intf_cfg->cfg.active_lane_mask = module->active_lane_mask;
>> +	intf_cfg->cfg.frame_sync_rate = module->frame_sync_rate;
>> +	intf_cfg->cfg.frame_sync_src = module->sync_src;
>> +	intf_cfg->cfg.frame_sync_mode = module->sync_mode;
>> +	intf_cfg->cfg.invert_frame_sync_pulse = module->ctrl_invert_sync_pulse;
>> +	intf_cfg->cfg.frame_sync_data_delay = module->ctrl_sync_data_delay;
>> +	intf_cfg->cfg.bit_clk_type = module->bit_clk_type;
>> +	intf_cfg->cfg.inv_int_bit_clk = module->inv_int_bit_clk;
>> +	intf_cfg->cfg.inv_ext_bit_clk = module->inv_ext_bit_clk;
>> +
>> +	p += ic_sz;
>> +	hw_cfg = p;
>> +	param_data = &hw_cfg->param_data;
>> +	param_data->module_instance_id = module->instance_id;
>> +	param_data->error_code = 0;
>> +	param_data->param_id = PARAM_ID_HW_EP_MF_CFG;
>> +	param_data->param_size = ep_sz - APM_MODULE_PARAM_DATA_SIZE;
>> +
>> +	hw_cfg->mf.sample_rate = cfg->sample_rate;
>> +	hw_cfg->mf.bit_width = cfg->bit_width;
>> +	hw_cfg->mf.num_channels = cfg->num_channels;
>> +	hw_cfg->mf.data_format = module->data_format;
>> +
>> +	p += ep_sz;
>> +	fd_cfg = p;
>> +	param_data = &fd_cfg->param_data;
>> +	param_data->module_instance_id = module->instance_id;
>> +	param_data->error_code = 0;
>> +	param_data->param_id = PARAM_ID_HW_EP_FRAME_DURATION;
>> +	param_data->param_size = fd_sz - APM_MODULE_PARAM_DATA_SIZE;
>> +	fd_cfg->frame_duration.frame_duration_in_us = AUDIO_IF_FRAME_DURATION_US;
>> +	fd_cfg->frame_duration.allow_frame_duration_normalization = AUDIO_IF_FRAME_DURATION_NORMALIZATION_ENABLE;
>> +	fd_cfg->frame_duration.min_normalized_frame_dur_us = AUDIO_IF_FRAME_DURATION_MIN_US;
>> +	fd_cfg->frame_duration.max_normalized_frame_dur_us = AUDIO_IF_FRAME_DURATION_MAX_US;
>> +
>> +	return q6apm_send_cmd_sync(graph->apm, pkt, 0);
>> +}
>> +
>>   static int audioreach_logging_set_media_format(struct q6apm_graph *graph,
>>   					       const struct audioreach_module *module)
>>   {
>> @@ -1411,6 +1500,10 @@ int audioreach_set_media_format(struct q6apm_graph *graph,
>>   		if (!rc)
>>   			rc = audioreach_module_enable(graph, module, true);
>>   		break;
>> +	case MODULE_ID_AUDIO_IF_SOURCE:
>> +	case MODULE_ID_AUDIO_IF_SINK:
>> +		rc = audioreach_audio_if_set_media_format(graph, module, cfg);
>> +		break;
>>   
>>   	default:
>>   		rc = 0;
>> diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
>> index 62a2fd79bbcb..924e85f4fdf6 100644
>> --- a/sound/soc/qcom/qdsp6/audioreach.h
>> +++ b/sound/soc/qcom/qdsp6/audioreach.h
>> @@ -36,6 +36,8 @@ struct q6apm_graph;
>>   #define MODULE_ID_SPEAKER_PROTECTION	0x070010E2
>>   #define MODULE_ID_SPEAKER_PROTECTION_VI	0x070010E3
>>   #define MODULE_ID_OPUS_DEC		0x07001174
>> +#define MODULE_ID_AUDIO_IF_SINK		0x0700117C
>> +#define MODULE_ID_AUDIO_IF_SOURCE	0x0700117D
>>   
>>   #define APM_CMD_GET_SPF_STATE		0x01001021
>>   #define APM_CMD_RSP_GET_SPF_STATE	0x02001007
>> @@ -544,6 +546,68 @@ struct param_id_i2s_intf_cfg {
>>   #define PORT_ID_I2S_OUPUT		1
>>   #define I2S_STACK_SIZE			2048
>>   
>> +#define PARAM_ID_AUDIO_IF_INTF_CFG	0x08001B11
>> +
>> +#define AUDIO_IF_INTF_MODE_TDM		AR_AUDIO_IF_INTF_MODE_TDM
>> +#define AUDIO_IF_INTF_MODE_PCM		AR_AUDIO_IF_INTF_MODE_PCM
>> +#define AUDIO_IF_INTF_MODE_I2S		AR_AUDIO_IF_INTF_MODE_I2S
> Dead code.
Ack, will remove.
>
>
>> +
>> +/*
>> + * struct param_id_audio_if_intf_cfg - Audio interface configuration
>> + * @qaif_type: Audio interface type (e.g. QAIF, QAIF_VA)
>> + * @intf_idx: Interface instance index
>> + * @intf_mode: Interface operating mode (TDM/PCM/I2S)
>> + * @ctrl_data_out_enable: Enable sharing of data-out signal with other masters
>> + * @active_slot_mask: Bitmask indicating active slots
>> + * @nslots_per_frame: Number of slots per audio frame
>> + * @slot_width: Width of each slot in bits
>> + * @active_lane_mask: Bitmask of active data lanes
>> + * @frame_sync_rate: Frame sync rate in Hz
>> + * @frame_sync_src: Frame sync source selection
>> + * @frame_sync_mode: Frame sync mode configuration
>> + * @invert_frame_sync_pulse: Invert frame sync polarity when set
>> + * @frame_sync_data_delay: Data delay from frame sync in bit clocks
>> + * @bit_clk_type: Bit clock type (internal / external)
>> + * @inv_int_bit_clk: Invert internal bit clock when set
>> + * @inv_ext_bit_clk: Invert external bit clock when set
>> + *
>> + * This structure defines configuration parameters for the Qualcomm
>> + * Audio Interface (QAIF) block. It is used to program interface
>> + * characteristics such as slot configuration, clocking and frame
>> + * synchronization behaviour.
>> + */
>> +struct param_id_audio_if_intf_cfg {
>> +	uint16_t qaif_type;
>> +	uint16_t intf_idx;
>> +	uint16_t intf_mode;
>> +	uint16_t ctrl_data_out_enable;
>> +	uint32_t active_slot_mask;
>> +	uint16_t nslots_per_frame;
>> +	uint16_t slot_width;
>> +	uint32_t active_lane_mask;
>> +	uint32_t frame_sync_rate;
>> +	uint16_t frame_sync_src;
>> +	uint16_t frame_sync_mode;
>> +	uint16_t invert_frame_sync_pulse;
>> +	uint16_t frame_sync_data_delay;
>> +	uint16_t bit_clk_type;
>> +	uint8_t inv_int_bit_clk;
>> +	uint8_t inv_ext_bit_clk;
>> +} __packed;
>> +
>> +#define PARAM_ID_HW_EP_FRAME_DURATION	0x08001B2F
>> +#define AUDIO_IF_FRAME_DURATION_US			1000
>> +#define AUDIO_IF_FRAME_DURATION_NORMALIZATION_ENABLE	1
>> +#define AUDIO_IF_FRAME_DURATION_MIN_US			1
>> +#define AUDIO_IF_FRAME_DURATION_MAX_US			100000
>> +
>> +struct param_id_hw_ep_frame_duration {
> Any reason why no kernel doc for this?
Will Update in Next revision.
>
>> +	uint32_t frame_duration_in_us;
>> +	uint32_t allow_frame_duration_normalization;
>> +	uint32_t min_normalized_frame_dur_us;
>> +	uint32_t max_normalized_frame_dur_us;
>> +} __packed;
>> +
>>   #define PARAM_ID_DISPLAY_PORT_INTF_CFG		0x08001154
>>   
>>   struct param_id_display_port_intf_cfg {
>> @@ -877,6 +941,23 @@ struct audioreach_module {
>>   	uint32_t data_format;
>>   	uint32_t hw_interface_type;
>>   
>> +	/* Audio IF module (TDM/PCM/I2S) */
>> +	u32 slot_mask;
>> +	u32 active_lane_mask;
>> +	u32 frame_sync_rate;
>> +	u16 qaif_type;
>> +	u16 sync_src;
>> +	u16 ctrl_data_out_enable;
>> +	u16 nslots_per_frame;
>> +	u16 slot_width;
>> +	u16 intf_mode;
>> +	u16 sync_mode;
>> +	u16 ctrl_invert_sync_pulse;
>> +	u16 ctrl_sync_data_delay;
>> +	u16 bit_clk_type;
>> +	u8 inv_int_bit_clk;
>> +	u8 inv_ext_bit_clk;
>> +
>>   	/* PCM module specific */
>>   	uint32_t interleave_type;
>>   
>> @@ -907,6 +988,9 @@ struct audioreach_module_config {
>>   	u32	channel_allocation;
>>   	u32	sd_line_mask;
>>   	int	fmt;
>> +	u32	slot_mask;
>> +	u16	nslots_per_frame;
>> +	u16	slot_width;
>>   	struct snd_codec codec;
>>   	u8 channel_map[AR_PCM_MAX_NUM_CHANNEL];
>>   };
>> diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
>> index 1f69fba6de26..3dd0a5c29a6e 100644
>> --- a/sound/soc/qcom/qdsp6/topology.c
>> +++ b/sound/soc/qcom/qdsp6/topology.c
>> @@ -753,6 +753,105 @@ static int audioreach_widget_i2s_module_load(struct audioreach_module *mod,
>>   	return 0;
>>   }
>>   
>> +static int audioreach_widget_audio_if_module_load(struct audioreach_module *mod,
>> +						  const struct snd_soc_tplg_vendor_array *mod_array)
>> +{
>> +	const struct snd_soc_tplg_vendor_value_elem *mod_elem;
>> +	int tkn_count = 0;
>> +	u32 val;
>> +
>> +	mod_elem = mod_array->value;
>> +
>> +	while (tkn_count < le32_to_cpu(mod_array->num_elems)) {
>> +		val = le32_to_cpu(mod_elem->value);
>> +		switch (le32_to_cpu(mod_elem->token)) {
>> +		case AR_TKN_U32_MODULE_HW_IF_IDX:
>> +			if (val > U16_MAX)
> this check is inconsistent with supported range.

Good catch. The token represents a U32 value and the |U16_MAX| check is 
unnecessarily restrictive.
I'll update the validation accordingly.

Thanks,
Prasad

>
>
>> +				return -EINVAL;
>> +			mod->hw_interface_idx = val;
>> +			break;
>> +		case AR_TKN_U32_MODULE_FMT_DATA:
>> +			mod->data_format = val;
>> +			break;
>> +		case AR_TKN_U16_MODULE_SYNC_SRC:
>> +			if (val > U16_MAX)
>> +				return -EINVAL;
>> +			mod->sync_src = (u16)val;
>> +			break;
>> +		case AR_TKN_U16_MODULE_CTRL_DATA_OUT_ENABLE:
>> +			if (val > U16_MAX)
>> +				return -EINVAL;
>> +			mod->ctrl_data_out_enable = (u16)val;
>> +			break;
>> +		case AR_TKN_U32_MODULE_SLOT_MASK:
>> +			mod->slot_mask = val;
>> +			break;
>> +		case AR_TKN_U16_MODULE_NSLOTS_PER_FRAME:
>> +			if (val > U16_MAX)
>> +				return -EINVAL;
>> +			mod->nslots_per_frame = (u16)val;
>> +			break;
>> +		case AR_TKN_U16_MODULE_SLOT_WIDTH:
>> +			if (val > U16_MAX)
>> +				return -EINVAL;
>> +			mod->slot_width = (u16)val;
>> +			break;
>> +		case AR_TKN_U16_MODULE_INTF_MODE:
>> +			if (val > U16_MAX)
>> +				return -EINVAL;
>> +			mod->intf_mode = (u16)val;
>> +			break;
>> +		case AR_TKN_U16_MODULE_SYNC_MODE:
>> +			if (val > U16_MAX)
>> +				return -EINVAL;
>> +			mod->sync_mode = (u16)val;
>> +			break;
>> +		case AR_TKN_U16_MODULE_CTRL_INVERT_SYNC_PULSE:
>> +			if (val > U16_MAX)
>> +				return -EINVAL;
>> +			mod->ctrl_invert_sync_pulse = (u16)val;
>> +			break;
>> +		case AR_TKN_U16_MODULE_CTRL_SYNC_DATA_DELAY:
>> +			if (val > U16_MAX)
>> +				return -EINVAL;
>> +			mod->ctrl_sync_data_delay = (u16)val;
>> +			break;
>> +		case AR_TKN_U16_MODULE_QAIF_TYPE:
>> +			if (val > U16_MAX)
>> +				return -EINVAL;
>> +			mod->qaif_type = (u16)val;
>> +			break;
>> +		case AR_TKN_U32_MODULE_ACTIVE_LANE_MASK:
>> +			mod->active_lane_mask = val;
>> +			break;
>> +		case AR_TKN_U32_MODULE_FRAME_SYNC_RATE:
>> +			mod->frame_sync_rate = val;
>> +			break;
>> +		case AR_TKN_U16_MODULE_BIT_CLK_TYPE:
>> +			if (val > U16_MAX)
>> +				return -EINVAL;
>> +			mod->bit_clk_type = (u16)val;
>> +			break;
>> +		case AR_TKN_U8_MODULE_INV_INT_BIT_CLK:
>> +			if (val > U8_MAX)
>> +				return -EINVAL;
>> +			mod->inv_int_bit_clk = (u8)val;
>> +			break;
>> +		case AR_TKN_U8_MODULE_INV_EXT_BIT_CLK:
>> +			if (val > U8_MAX)
>> +				return -EINVAL;
>> +			mod->inv_ext_bit_clk = (u8)val;
>> +			break;
>> +		default:
>> +			break;
>> +		}
>> +		tkn_count++;
>> +		mod_elem++;
>> +	}
>> +
>> +	return 0;
