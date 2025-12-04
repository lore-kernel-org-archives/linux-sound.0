Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2510332779D
	for <linux-sound@vger.kernel.org>; Thu,  4 Dec 2025 11:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764849592; cv=none; b=ELpCjIIVCFArxH2zIXF95ohMnxpcdKshw/4loK7xCy9ynhmxdt9UVMjCETyrph98jPtDF7tiTaaJ0oO0YmqDzjlc4dmJbrlzC1Sl1wk56jdkoGoabIUQHUZkrjp0LS8c7JhP2/MXOAlx4H4MVWQFq+KQIRrS+ItwuZUOzY22zcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764849592; c=relaxed/simple;
	bh=Z2Z76wjYkkj509JoeZPEpODXknLAVhW1ywj//ZG0Lpw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NHubK1/X/imfOVcvQYnVJp+ouQL6tmmxffrX8YjmE+eM1qpLPRaW6wf13W8t7iSHW/AFVgCcNQ+kpQs3RPecq3PhqTw67g6XVr9ZqHBFkz0l24Qa9CHTrD8qKvbiCVLOO4aue5tPg8atKRgk0AZreL0REZr5Fql1UMG4aP0ldAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mF10LHCH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jD4bXXQR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mF10LHCH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jD4bXXQR"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B4AF0Lj1043097
	for <linux-sound@vger.kernel.org>; Thu, 4 Dec 2025 11:59:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AunuRHgsrlBiNTc53FIa0lEirSLzbWjewZXUf8zIGYQ=; b=mF10LHCH+N3dNiZ2
	BzRhKMZ9M7mCqsrOaMuPZcXQD7IXmGQCixT4B0p9LlUOJBj52FbLpJr8yPrlJIUO
	65P7xDRL0UpYPFAQN2Y8DaaptJzhNTKjwEIKR4174OckzzQiwkorQ8LBYjlCzUk7
	HTI9dc6DCeZ9lqv0idvtGbDXyso/0HfzmCjWcuGQKG0l9qopary+HOzp0REX8VOM
	jcwP4fD5pRGjpOC1ga+del7bZTRlzWxLV5KJUi0KN1+NFmoXBkXZoWD6/RurkWEJ
	fmqII+hSIw7B8Kn9tjLb/galYuTFIDOifp8OFxJSK3pUVxeWf2rlnzHlhI0PKaMt
	1nk6LA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au6xp0ng3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 04 Dec 2025 11:59:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b26bc4984bso314969985a.1
        for <linux-sound@vger.kernel.org>; Thu, 04 Dec 2025 03:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764849589; x=1765454389; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AunuRHgsrlBiNTc53FIa0lEirSLzbWjewZXUf8zIGYQ=;
        b=jD4bXXQR3X/ZDATWEsGX2rI4BzfSGJWL1O9GyT1rCaDUDTf1M9v6l2jhASLOiEq2mD
         ILwB2UWthTu5hdlNuYDdlksoxq8YqUgck0CqqdwXNVf19AJdsCA5ABMKPobtiNsq+OwL
         SsVEfMe/PcCLBG3iQG/bei6lLbwIACH9QR8M2VlMLxjS7VP0QNWmIBfzIJmqHeL25oKV
         1EaNvQYnfdjl5fT5Yhuqqpif1LGztM2+1H9SjwWCXT5XVpkVQorGbg6qTZdUznnWEpyk
         +9sv2CclRtUFCiR42Wx9Lr8xoAQvmJzitPQoh+WNT5J9b1hK+JPwhfJkVpOHEgAeumED
         oD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764849589; x=1765454389;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AunuRHgsrlBiNTc53FIa0lEirSLzbWjewZXUf8zIGYQ=;
        b=Yb5TxLpEI1NSjUBYttBXUIR+RvqPqV27ox+nDCYXLPNVhP4ydQnK13TQCiUfqGlqYb
         Ns6p5HlzEPIV4bcsbmQ02UkUBV7sRLxn/8vpgnq3DrerK5e3uCDrZgnenwKjjqFcmVOh
         n+qOAvN/kgJKX2TcRZ95XOG7kOXZ4Nh+EZUpRzZ3kcAnLkeGVvxP7Py91lbSFGn/FPFB
         bqGzfueApl737gFrE/xhlBbuY0EOeKyA8hIupBcTGqnNIA1HpBIXoNIQ+TVgSS1/C762
         deNKyACCf+0y8PTratFaQJX1lg2FZjf5qaXdQNN4xIRqjV4s9cvzJwGF4dNX9FKh6UrR
         mBIw==
X-Forwarded-Encrypted: i=1; AJvYcCUIw7kGuIt70MEfdm3zx4+qP1BuTzVurmjzqWYOrFPN1E1rftJuKNAOGp12rGKUQn55Q/NvqdoSL+EwyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcnlMIotidiKcAA3Wi8ozf2HeWi/VDBZn6kAh1o9RewlIZgHKi
	8AUGXalsgYr9W5QjXWtjhc6QApUkDQ4CVkn8THo8FEjcXQRnUIMS10aEztLEGez6w+H1w+XEpnB
	4JR3zaAo9hgkvXSLZ/0Aym+t9BY1f4bFXcMY7gh0bnAJ0xkFNh/tcX5wSmsEezYN+mQtHXqCcGw
	==
X-Gm-Gg: ASbGncsRcxx5TFsVUicBForQ+/TAFjYHMrPhtQ+jfhV5vL7A9osXYIkKhu3LA5q6Z9q
	1Z2yfeInygPwC9hNj9yFeypLqiCtDevObw7N4q1B3Hp5OP9sdU7x0aSf3Tpmlqc0ReAGd9ei5gC
	fM6z3uVNoBRX5yPEZ6bgAVJENK/Il7nH3YPyjaW0qhbP+PkMsQwmUCtYTlNJ0mm5n2uscgX1B3s
	LXYiUp45eSoshb2U6TqFdmrY9vxgMxVrY6VwRZ5piE73b+o49mAkVRJ6srQYJh/FDzqhmhof6XI
	oAr8Qrf/CSG8XG7Y0NQ9gJRrmdilBPVt9cz0/wSMClbuCnBIV0t2usGsoMAIHy0/mt5GX7xkUeI
	TH87hUBeCsvsIuhXHGlGeRu0Jy9bo0ZWaGjSn1Q==
X-Received: by 2002:a05:620a:4152:b0:8b2:77aa:73d3 with SMTP id af79cd13be357-8b5e47cd418mr785599385a.2.1764849588752;
        Thu, 04 Dec 2025 03:59:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBKeXuvgnAH0RGBAiYnsEJ+LzL0ta0Y5whhhF0V/X25RtrRgy1+l0WJJ7rxStV0tp23Dj6Ow==
X-Received: by 2002:a05:620a:4152:b0:8b2:77aa:73d3 with SMTP id af79cd13be357-8b5e47cd418mr785596285a.2.1764849588245;
        Thu, 04 Dec 2025 03:59:48 -0800 (PST)
Received: from [192.168.1.29] ([178.197.195.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d3319ccsm2725492f8f.34.2025.12.04.03.59.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 03:59:47 -0800 (PST)
Message-ID: <67ead532-6e38-4504-bfda-1cf7e998c885@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 12:59:45 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] ASoC: SDCA: functions: Fix confusing cleanup.h syntax
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20251203-asoc-wrong-cleanup-h-continued-v1-0-5142be4874fb@oss.qualcomm.com>
 <20251203-asoc-wrong-cleanup-h-continued-v1-3-5142be4874fb@oss.qualcomm.com>
 <aTFv2zyDC13VXg2R@opensource.cirrus.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <aTFv2zyDC13VXg2R@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RKW+3oi+ c=1 sm=1 tr=0 ts=693177b6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FPK7cjBCgYbqzSTDLBmM0Q==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=w1d2syhTAAAA:8
 a=hgqmikm6mg9FZg2aGYQA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: DNiBzlnD_N6PwTt4NQG1JI5YMOQeOxop
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA5NyBTYWx0ZWRfX5iUV14AIfm1a
 Yim7CoUh+erkdlyoVAWnwr10uWvK0yO43Eha2CNnSoSAWOV+USGvYSODfONSJqfcJpWuo+C+f91
 xFbSU/KabI83USa1MsW5asDqsCaAHxPwC2b9mezUmpg8v39rHUeptkk4oHqLX2nQTmU99yrpbvm
 HnOAJj2KCPTboaYUhS3XK0GwOs8lwGB+qmGeVCm/7ez5Kt71ht4OZCUQY1iO2CFzR8yMR+gTcJ/
 zuQsWoLvG2aKWi0QL2ltY2+Pf/129l94/91Qg/kjMUPBf5vMbkAvr1lHUELaTc1IquzvkhfLrDY
 TA8i0APRMlPWDx+TwmWzYQk2FBT8HpTWVbKgpwluKhsERv1wdjugNAoFxdQZAa/sMbqPUc6MQ8Z
 7NHCBLytr3MbU4ZEcCTuDKH8ofrzdw==
X-Proofpoint-ORIG-GUID: DNiBzlnD_N6PwTt4NQG1JI5YMOQeOxop
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_03,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040097

On 04/12/2025 12:26, Charles Keepax wrote:
> On Wed, Dec 03, 2025 at 05:12:40PM +0100, Krzysztof Kozlowski wrote:
>> Initializing automatic __free variables to NULL without need (e.g.
>> branches with different allocations), followed by actual allocation is
>> in contrary to explicit coding rules guiding cleanup.h:
>>
>> "Given that the "__free(...) = NULL" pattern for variables defined at
>> the top of the function poses this potential interdependency problem the
>> recommendation is to always define and assign variables in one statement
>> and not group variable definitions at the top of the function when
>> __free() is used."
>>
>> Code does not have a bug, but is less readable and uses discouraged
>> coding practice, so fix that by moving declaration to the place of
>> assignment.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> ---
> 
> Hmm... yeah a fair point. Can't say I love the inline
> declarations but I guess I will get used to it.
> 
> I wonder if for consistency we should do something about
> the __free in find_sdca_init_table as well. One could move
> the alloc to before the error checks, does risk doing an
> unecessary alloc but its on the error path so I don't feel like
> performance matters. Or rather than sizeof(*raw) we could just
> do sizeof(struct raw_init_write)?

If there is a reason to deviate from the declaration+allocation rule,
then sure go for it. This is style, so it describes only the preference.
But if you do not have a reason, then coding style described in
cleanup.h should be used (or don't use cleanup.h).

> 
> But if you would rather leave as is I don't mind either so:

Yep. Few sdca-related files use that exception. The
find_sdca_init_table() at least has a reason - it uses sizeof(*raw) as
you mentioned, so that's why I decided not to change it. Just too much
churn.

But I want to fix all the cases where '= NULL' is used without any need.


> 
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> 
> Thanks,
> Charles


Best regards,
Krzysztof
