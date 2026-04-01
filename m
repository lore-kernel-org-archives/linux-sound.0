Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF4536C0DC
	for <linux-sound@vger.kernel.org>; Wed,  1 Apr 2026 16:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775062447; cv=none; b=L9MBdHyJ7W2Rqk0jqruKUE/ttwkvzOpaaAJGpbjeNiXu6MTOqvDJ4eXKuqIO286oUElT7WtAtsV4RPdLDPtWX+Ik8374vM3S4u2uPNxfgu6ijGmI/BNHivJf/TPwXpUrut+OKxWMprb+U9YGdXUvS3WJa0or441wr16EfIuzaw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775062447; c=relaxed/simple;
	bh=nCrMZGuEmiO8DntA1wydj9M4MdVS8jMj/QsSsUqzP6g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=swLXpiefQ1oGBDtOB864VS8N0Um1Fibrv7b2wAlloq47daEdophcNEOzrnLfGFBgTV9p9fvzpz7ZEkrJ/IT60gUag+R0t7rgryWdGr8Oz+yAvNDr5dXFEe/wfLb670RgK9YNRIxevrrabqiCPKUpQxq1q0n6R0oKbEsbpo3Rm8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DqNeMY2H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JGYCPhDu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DqNeMY2H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JGYCPhDu"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631C5UYP4106686
	for <linux-sound@vger.kernel.org>; Wed, 1 Apr 2026 16:54:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+uyp+dYf9ZUf2TcuRQ8zQQWBhSiyCO9WMkrxwM++H0M=; b=DqNeMY2Hy0g0SzVd
	q0RhJyJ8IsatX7Y1YooTAdf3SejcstYVyN0nj3rzSrtA1ZtkC5y25hRo5uSw44Ef
	K75LWW+k1rgBelUfS1pOJXlgWSFH6BKuPtQokmL1m5obzo9LI0YezcsZUnbp/S9/
	vLZ7YPtquiTNTcPZgOPlLaFq1FlTgjV+v5UAuK2aPxSEV6Dfvyec4VHWTY++112Y
	HHhDfRlGQpM1qdYN/iUAcXB16xQDVFXrc9B/tRsprJlGLjNqBsJcVAJFJulGrUqr
	LMZYQ/ZG/SaDwdZ89aMzhCEzBpWor9DWEtDCnsvIbwbeJwWaabg6JR+RJhQyDizW
	lP16MA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8xt92hdg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 01 Apr 2026 16:54:05 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4661881eso89094271cf.0
        for <linux-sound@vger.kernel.org>; Wed, 01 Apr 2026 09:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775062444; x=1775667244; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+uyp+dYf9ZUf2TcuRQ8zQQWBhSiyCO9WMkrxwM++H0M=;
        b=JGYCPhDukcYXERZhAv6O0epLzLMVRHeZxMi/lRmoecVVw1uv9nNqVRvGuEYkXg88Sg
         QXqH5GJL7WOsx+2qW8f9NjRRsQBwg+p77GjuCxxLvUWe6T+OPKy6Bzha+5FgtLNqLQYF
         ZagdmvZezrO8aOYXCSMNaGJHtjo5cYIpBeXc92RGhG7CkqAFZZZOAfw8l15YuoXpSDqG
         2nceC7FIhkqCO6DYGVjfZC16+i8MhCLFzX3lyBFw2rAzU9oKZWx99AEZWNM1po/xcFAa
         0ZxyPcQX5P3NXzGUzh/NoKXdwD++ABt48vn87o2lS7381FLZxDewOHWo6DQCiXfShJXc
         WTwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775062444; x=1775667244;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+uyp+dYf9ZUf2TcuRQ8zQQWBhSiyCO9WMkrxwM++H0M=;
        b=iXdXaWje58kXaoC8bRX0IcolVNf5DaDmNhljUwt2u2kWQfdzID3xDuIY/keCxOJuw+
         elZU6KeX1zp3BNRq3aCOLyVfY3kE9pQqFRTMKXWR9XXU91WVLH0qwxJWUE4B8Stf45rv
         ZOn4dgf0gZS/cy4y2Sbfcomykn8zOzAGa+6OlGurJYll8tR+qnfxaT2Fk5CXt80R/9x3
         KJ1rGBYN3x8wQ2zATq9gABXUsfGo6UaI1IvsRM+sCsLKTMBVpmwA2UxT0+Gwlhd0WxJf
         mTdIJgLCUYqlPKCpClt31cPXXTovdYX1kpcIYfvFQYtWFb++HTaQ8ZCsLAkO3NJG8K9b
         3B+g==
X-Forwarded-Encrypted: i=1; AJvYcCU7gC30OKipUMwf3SaW7gwq/RBQv7Rcl8WpNOha1iXQ9cjKMnYIrlLIqorO9Bu37bU+sM61RnT1nj2K+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbhq5+Y3KRutns6BMB4NxDqRBkZ/2StpZuP7uWkeg5UU1qfGgQ
	LDaSEVGdDCYTlwIso2drx8t1/5C8VGV/GhA0FztDbdF9hSODb9moLbKg9WxJRAhyUwVIuinLPqE
	SBqUTms46GyMhJQTUcW+z5hqWmYrsRrukyxePUAV7/uV1KI23EQFS91qEe4MMKvcNCg==
X-Gm-Gg: ATEYQzwlL/mABLTFD6PCQyagYmZaYAKel9V1BfowOJG9nVgeGqX699SwV9MvkE7za8B
	SD5FCU/1BfhHdkhV8ftEBTWSkD+0By6/hTfCVgBheUR5zUA/JPKtMphQ8kOGR7ifmXryi5U4vIe
	joDtlEDRRdyWWfljMYEORFyh8pGcWNpz/6Borikpl0NnmIB96RA4al0oCF3x5C3nQEj1daOnrjH
	mHyUQlFRefXhC/inFuXW4ne80HmMq9koTwnK1UyZ1vma6IPjP5FR3aUmOGW0Jq1FVNf7Fw8fb8u
	H617UUnx2suRGSHErzgc2wXG6kEVbmjNlW3dfKLa1yTkSKzRswpKP4u0NT5pndfyHn7y2drcDof
	Wjo2gubM2SmVCs7CpMAOIlPfkl8YDGtpieerACS6NOdKORY4b
X-Received: by 2002:a05:622a:7290:b0:509:aa4:49f0 with SMTP id d75a77b69052e-50d3bd3b45dmr39681361cf.50.1775062444070;
        Wed, 01 Apr 2026 09:54:04 -0700 (PDT)
X-Received: by 2002:a05:622a:7290:b0:509:aa4:49f0 with SMTP id d75a77b69052e-50d3bd3b45dmr39681091cf.50.1775062443589;
        Wed, 01 Apr 2026 09:54:03 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b9c3cec6c31sm6168766b.37.2026.04.01.09.54.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 09:54:02 -0700 (PDT)
Message-ID: <6be87f21-1da0-412a-8662-ef05ca32f3c4@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 16:54:00 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 08/13] ASoC: qcom: q6dsp: Add Senary MI2S audio
 interface support
To: Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com
References: <20260330082105.278055-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260330082105.278055-9-srinivas.kandagatla@oss.qualcomm.com>
 <38eb807e-8467-4d7b-9094-3007d0ba9c89@sirena.org.uk>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <38eb807e-8467-4d7b-9094-3007d0ba9c89@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ByYcfjAyEJjh7Qk9vdA_CfwfJFciVeax
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDE1OCBTYWx0ZWRfXyXF36tzYe765
 8cISx4j0I3skr/f6KrLUTbZmnF5f3SnOAIsSBs5HwwNBzRnPvpvgMlCmB06XskmN+InSrQIqF2Y
 KLIYEyv9nM9eoKf/94rWf7HPJbeXErD/nzcWCFcAqCG62Z9617J3g3ePbp6J9D2mRTux6Va7jxs
 Ei4sY0vh/DSP5Z7uxvj5htCfp2UBx5bzpXLiwzLyw62kut+xB/NcsxN7B4/AI3H6c7AtWvcPLnP
 9QZfaVQ0K3jfWFtrplk3m9E9O9X50R0KFX3/jeQ8BBEBfHhaOD2I8AEsiSv/kaBoPyPwBWwrs51
 JvkRukUZgIMe+aykUrAv56ni/drwdVMawwt/fs+mhTKEIiDMLFiGSMWyhMrD6PghTMrJtVg+CDs
 6s+aQqh8gx0Td+TMAnD5UjOkLKGSkM7DC85mGpgE9uvlfmLk6ztvAjO9F538aNA1Zevc9/baNxf
 5R00vnePZaOtW1uAjjw==
X-Proofpoint-ORIG-GUID: ByYcfjAyEJjh7Qk9vdA_CfwfJFciVeax
X-Authority-Analysis: v=2.4 cv=PoGergM3 c=1 sm=1 tr=0 ts=69cd4dad cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=OW1hUYqCZhJZeNE_EJMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010158



On 4/1/26 11:25 AM, Mark Brown wrote:
> On Mon, Mar 30, 2026 at 08:21:00AM +0000, Srinivas Kandagatla wrote:
>> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>>
>> Introduces support for the Senary MI2S audio interface in the Qualcomm
>> q6dsp. Add new AFE port IDs for Senary MI2S RX and TX and include the
>> necessary mappings in the port configuration  to allow audio routing
>> over the Senary MI2S interface.
> 
> This breaks the build:
Yep,
[PATCH v8 09/13] ASoC: qcom: common: validate cpu dai id during parsing

re-ordering these two patches, should fix the issue.

Sorry about this, Is it fine if I send this reorder in v9?

--srini


> 
> In file included from /build/stage/linux/include/dt-bindings/sound/qcom,q6afe.h:7,
>                  from /build/stage/linux/sound/soc/qcom/qdsp6/q6afe.c:5:
> /build/stage/linux/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h:153:33: error: array index in initializer exceeds array bounds
>   153 | #define SENARY_MI2S_RX          147
>       |                                 ^~~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6afe.c:723:10: note: in expansion of macro ‘SENARY_MI2S_RX’
>   723 |         [SENARY_MI2S_RX]  =  { AFE_PORT_ID_SENARY_MI2S_RX,
>       |          ^~~~~~~~~~~~~~
> /build/stage/linux/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h:153:33: note: (near initialization for ‘port_maps’)
>   153 | #define SENARY_MI2S_RX          147
>       |                                 ^~~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6afe.c:723:10: note: in expansion of macro ‘SENARY_MI2S_RX’
>   723 |         [SENARY_MI2S_RX]  =  { AFE_PORT_ID_SENARY_MI2S_RX,
>       |          ^~~~~~~~~~~~~~
> /build/stage/linux/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h:154:33: error: array index in initializer exceeds array bounds
>   154 | #define SENARY_MI2S_TX          148
>       |                                 ^~~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6afe.c:725:10: note: in expansion of macro ‘SENARY_MI2S_TX’
>   725 |         [SENARY_MI2S_TX] =   { AFE_PORT_ID_SENARY_MI2S_TX,
>       |          ^~~~~~~~~~~~~~
> /build/stage/linux/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h:154:33: note: (near initialization for ‘port_maps’)
>   154 | #define SENARY_MI2S_TX          148
>       |                                 ^~~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6afe.c:725:10: note: in expansion of macro ‘SENARY_MI2S_TX’
>   725 |         [SENARY_MI2S_TX] =   { AFE_PORT_ID_SENARY_MI2S_TX,
>       |          ^~~~~~~~~~~~~~
> 

