Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013F3243951
	for <linux-sound@vger.kernel.org>; Wed,  6 Aug 2025 14:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754490951; cv=none; b=o1L7twQqNR65CjVKxz/daUMNNNT04Cnm83RNTA0vx1e2hShLVX/cXEnyj0zAUAcc8w+S0Tes6E1nBAvprC/QX3YP9y7I7oHqhjwT/A5RT873Ww8plnaVER9wnt2uHW9bXXOJQugNLlciJ3YJbeC8YhjEyoS3fmievZRv/Mk4Rh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754490951; c=relaxed/simple;
	bh=IzAyAJfpY0pHbWneABeVrlnmE6GZCoVRzfOeZKBvWZw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lITkaxsG3naXCLimpF10Zncs0FKzkFHXHBK3Q15LncLLuOUbpwH7FO3v6PB0OwEru9XhrZV5pEXMrJDqIHzBHnnhaJ7xL0iXvK9Krcj589wAb5pIxWK0xtkoopXfAhL7CPcJoPXnHDjAMRvpOKDWOu2F5pgAy3NN1pCvLiLv5MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ncGQH0HZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ncGQH0HZ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576AMvjv017733
	for <linux-sound@vger.kernel.org>; Wed, 6 Aug 2025 14:35:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TwlR+oMZlALuIJKmyusyfjuF4+MmPOO9KSk2h10iAKA=; b=ncGQH0HZlicVhpPT
	+V8slmxae8bXQI5IjyQAeE4LbwHJ3NsovDM3FpX2x2G+flTtwLNqS2UG97JVK3y2
	xKPS71sxRvd8CxnU9Q3lC1IUOqDYwCKpSus6RHPE/Gxp6Zglh1/mOi/yzF8xO2M7
	t4OPUd7qW4vS7v7mSKenSHB1vFq93Z0d1d1FRIqC8PWzniK/EMqoMiWLYKDE/dfz
	z2uIqjBt+SIouVtAGCJAsBHYDL3Zfa13N/BlDrIbsM39Z31aXmUXgZ54eLZtUgUQ
	QUdbpPMJmh3OOEtTJFJ7lk7HdCWQakskfICL8KpW3XbfrAt6RyBELfF6CfJBpnnk
	cdjUPg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48c5868m2x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 06 Aug 2025 14:35:48 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23ff7d61fb7so9052905ad.1
        for <linux-sound@vger.kernel.org>; Wed, 06 Aug 2025 07:35:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754490947; x=1755095747;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TwlR+oMZlALuIJKmyusyfjuF4+MmPOO9KSk2h10iAKA=;
        b=ivWN+afZqTU65AUnav1vbH0rInWgW0TrkWL0QM2NGRzQzY+nIxEzN45sW48X1qzJPH
         A1bISUzZzOb8kobUg5rmk7u025gEgEkvY9NzQBXqsE+heOogpPheoxKR/8YfVuzqIS1x
         LSr/LYjC1PLaSqIZXYVKprb/k/eCpJr1caE1gTNCI4ZUQOgqWn1cPoHtPAdotVCBfa0u
         vflMvpfs5FJtqWIENUjfzhZa5O7oS8tGveTme7TW3HWic7RU6ms0sP4RzkZ9tKSzLv5Y
         ArLlm9lBpeFRm9anVzjeyl6h++rbJIkqYERl/g2NeOvNPBtFFpK7N2retoEgvMkYj83Y
         DerA==
X-Forwarded-Encrypted: i=1; AJvYcCV/Y4IhKrvdHOip1+bZJT3v3qsbswb+8SDiKHGUXCBcP8AH4UL9+oL9JQx66ccvfUiLNJcLMRHZoyuVqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwF8nEtTyoa9kHom8sM3yo41xqFunAgJ4QY0O/maS7A8VadXeyD
	g5r/wO0+rqoLLEUgwIGftX96ZsXT31xOTPLHNIiTS1R0Wo9mnd069b3gu3P29LXs59v++uICZ72
	Aq8K9FL3qcS6tVok7kLLEDL9PlxFLSpDsdC96oKRd3gtTcdzAgYUQcGss20EtWq02WQ==
X-Gm-Gg: ASbGnctOCGUWhW7VP9saRgaRlWJ1iTzz+nnwIRPvNy5whrEVB9Ytdp6l+Q2BzXY+pzg
	iZ4OyZUXINVgUbYudpTjUs5KHZQrVWDczNUreC4nPHeKyKoYeAq9R/9jzRvySpTdyIA2QEeta0Y
	gAivi+TFwC+ZWCSGPxkzilqS/rkfw+9PCtml8gexUFn1EiZPEnhHlI6j/ZUtRyX26m59K9YSlVJ
	2J88wzR93cXGNOsOcuP3HKEpzncFRiH597aF/3YHCtzTxvQpBh79MkuZdvCg6tjIOlEa8foxPKz
	VeI753E82Cb7kuMtnHlv3gIMNhug8QC9isyno4skJnZOFkzCO58MH//BiGULqfUOdoLK+nmc/tz
	UcPo=
X-Received: by 2002:a17:903:1250:b0:240:3cab:a57a with SMTP id d9443c01a7336-2429f9869cbmr43861645ad.12.1754490947328;
        Wed, 06 Aug 2025 07:35:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+NPjGR/ioIEs8rIKpi433E6HkfZN/NsX24RQq9faA59sT+8283L0e/mv+qkQqKGbp1uO9ww==
X-Received: by 2002:a17:903:1250:b0:240:3cab:a57a with SMTP id d9443c01a7336-2429f9869cbmr43861085ad.12.1754490946675;
        Wed, 06 Aug 2025 07:35:46 -0700 (PDT)
Received: from [192.168.1.4] ([110.227.163.12])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef75bdsm160361515ad.11.2025.08.06.07.35.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 07:35:46 -0700 (PDT)
Message-ID: <6d2f71a5-72a6-4ba6-956d-19f053d73c2e@oss.qualcomm.com>
Date: Wed, 6 Aug 2025 20:05:37 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] ASoC: codecs: wsa883x: Add devm action to safely
 disable regulator on device removal
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, quic_pkumpatl@quicinc.com,
        kernel@oss.qualcomm.com
References: <20250727083117.2415725-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250727083117.2415725-3-mohammad.rafi.shaik@oss.qualcomm.com>
 <07faf0cc-a8e6-426d-b397-dfc321a7f3df@kernel.org>
 <aae92260-5169-4af1-97b0-48f364612dca@oss.qualcomm.com>
 <4bc486cb-9d94-4bad-ae07-e9a7aeed481a@kernel.org>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <4bc486cb-9d94-4bad-ae07-e9a7aeed481a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9nejGYuZmZ8i7WMIBnL7NvIK3PpZTY5W
X-Authority-Analysis: v=2.4 cv=MZpsu4/f c=1 sm=1 tr=0 ts=68936844 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Q/58bkKydBp6VmYC+FnXRg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=usrlyX-CWiNRApQyylIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 9nejGYuZmZ8i7WMIBnL7NvIK3PpZTY5W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDA2NCBTYWx0ZWRfX2D8juC4HmD9f
 zAsWboRVTIqOSyd8m6frMEfQ1eWDZmdBUovdzTFehw0I0PuvV7p61Uvh8IZ5ni9LlLbieKjRWkv
 L2d7XoslsFTAg3ff1cuUP2JYykRLZ2XyAFstJDinogpdiVT+rSk2UVd40rG7Ma1J2ZSEWhYgmyN
 q7xrCo9C4Fa/yNdhwuxqlDxyOW5N/dQLtiXlSmnUM2Bq6xMWEI/D1Mp5cvYXlgmF5YUojkPRCR9
 z31gUP5bSaOxbzGakPmxX+klfytjoWOjZiNf2fPUoVZyTtd6RlMC69os4cTIY2wJ1xQtwjGR+KZ
 wW8IbTMZm4hRtz/QwVGTPLViaO5zGKUZ0bl95FmY0y7lQCJVml7gONHCUehARvuaUhCXIuVhuGN
 C3c23nvW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_04,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1011 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060064



On 7/28/2025 6:32 PM, Krzysztof Kozlowski wrote:
> On 28/07/2025 14:36, Mohammad Rafi Shaik wrote:
>>
>>
>> On 7/27/2025 3:00 PM, Krzysztof Kozlowski wrote:
>>> On 27/07/2025 10:31, Mohammad Rafi Shaik wrote:
>>>> To prevent potential warnings from _regulator_put() during device
>>>
>>> Warning is either there or not. Either you fix real, specific issue or
>>> not. The code looks correct at first glance, so please describe exactly
>>> how these warnings happen or how what is the bug being fixed.
>>>
>>
>> The current wsa883x codec driver manually enables and disables
>> regulators during probe and remove.
>> In patch v3-0003, reset functionality was added using
>> devm_reset_control_get_optional_shared_deasserted() for shared gpios.
> 
> 
> There is no such code at this point. Each patch is a separate commit and
> must stand on its own. With its own explanation. You cannot say that you
> add bugs later, so you need to fix something now.
> 
> Describe actual problem here. If there is no problem here, describe why
> you are doing this.
> 

Identified the actual root cause of the issue observed in the reset changes.

The failure condition was not properly handled in the reset patch.

I will update the patch to include error handling for failure scenarios 
and ensure regulators are disabled appropriately.

will Drop this patch for next version, only will keep the reset changes.

Thanks & Regards,
Rafi.

>>
>> However, during cleanup, this led to a warning:
>> "WARNING: CPU: 2 PID: 195 at drivers/regulator/core.c:2450
>> _regulator_put+0x50/0x58"
>>
>> This occurs because the regulator is still enabled/released when the
>> devm-managed cleanup path attempts to release it.
> 
> So that patch was broken? You just did not properly clean up there?
> 
>>
>> To resolve this, remove the manual regulator disable logic and instead
>> register a devm-managed cleanup action using devm_add_action_or_reset().
>> This ensures proper cleanup and avoids regulator misuse warnings.
>>
>> For reference, the wsa884x codec driver already follows this approach by
>> using devm actions for regulator management.
>>
>>>> removal, register a devm-managed cleanup action using
>>>> devm_add_action_or_reset() to safely disable the regulator
>>>> associated with the WSA883x codec, ensuring that the regulator
>>>> is properly disabled when the device is removed, even if the
>>>
>>> Device cannot be removed/unloaded, AFAIK, because of suppressed bind.
>>> Regulator is already disabled during error paths, so that part of above
>>> sentences is just misleading.
>>>
>>> How can one trigger the warnings?
>>>
>>
>> The warning in _regulator_put() can be triggered by applying patch
>> v3-0003, which introduces reset functionality using
>> devm_reset_control_get_optional_shared_deasserted().
> 
> 
> There is no such code now. You say "potential warnings" are here.
> 
>>
>> Since the existing driver handles regulator enable/disable manually, the
>> devm-managed reset cleanup path may attempt to release regulators that
>> are still enabled, leading to the warning.
>>
>> This issue highlights the need to replace manual regulator handling with
>> devm_add_action_or_reset() to ensure proper cleanup and avoid such warnings.
>>
>>>
>>>> probe fails or the driver is unloaded unexpectedly.
>>>
>>> How driver can be unloaded unexpectedly?
>>>
>>
>> "Unloaded" might not be the most accurate term here. What I meant is
>> that the driver’s probe can fail due to an error—such as missing
>> resources or improper regulator handling.
> 
> 
> Use standard Linux terms, e.g. probe failure, probe deferral etc.

Ack,

will ensure all upcoming changes are managed effectively.

Thanks & Regards,
Rafi.


> 
> Best regards,
> Krzysztof

