Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88AC4A8FDD
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 12:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789475928; cv=none; b=FMrrWy1U0jsKLYKB2M/XFcQUYa0FSGGGPNYZ4rqlws1HNQUo/ZnnkOjFhNV9TXWMJpkoyPeOE5ktTP/LFXruuEVodN4hJ6gPB1nqvv4Ox6pzI2i596VBkpnWYJFtpIXz7BxxscScgK2TAjJWwMOCRorRnJfzVILer4mCvxOtgUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789475928; c=relaxed/simple;
	bh=kyartu+TMLpCL1WbkdOyGgGRHw9vqTHR01SIfwa6v9I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H/6h5ArE0VEBChHNOJtZFnxr4eTmbld/unUtXfOgmuMHNh4LWUAtD2wJCuJeJulSSQvOzZUifB7z4hUEZ2wYDs5YaXK3VZAeUSobjHW/kMcVV+UQoRssJof2/ElqqgJ5eHejDXF5WlzZL41NTezDzaEFiCIbcNKetqcZp7ViT6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PGEO591F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HPMHIYLd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PGEO591F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HPMHIYLd"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9hEgh2833238
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 12:38:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	To3gckJSL+lLtFYBc12foP5EN1xKQrTgxmIAPgJMM+A=; b=PGEO591FcLUMG99/
	fnQ+jUhO/tzgozvU9My8C3uHW+BQQD0+E9Z0zCGUDelTen9HoHxYKL7dBeEpokVf
	FLuctwmWDKcuwWniju+WFstJB9D9XdqEE11k3nCA4Q97TpZ5lVjWrfmAmwe5pTmo
	ujDW/grERFEUFEhMiQ2fk3wIHtg930N0pYa9ZgEgudF4DamOoNi6BXbtwm0ZCeiK
	uHJzG+/8jyXizs78DSq7DLKrOPmm+U4nbBqePxNUf/eUPDeHuIIAop1PbkICQaFX
	rRsdD1Bs7shj/HwG95Cq7XU/Cr7fNOFwixhg6yUDywVV3fpDJZnWukDAHBOJWaB7
	Bvbjgg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpxyd9tt7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 12:38:44 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1b80835d5so5630661a12.2
        for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 05:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789475924; x=1790080724; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=To3gckJSL+lLtFYBc12foP5EN1xKQrTgxmIAPgJMM+A=;
        b=HPMHIYLdaPcOkO+mKiG6akwAwYErAX3cpF2jjWeKd7ux6AyRGy7GaogTa6FFF8uoSI
         K+qbLam6OMgHWtyPlMLNOTLz8JRlU9cYmSImCQRids3rQ5I+5SCcqLJ5ziXM2GnhKS0s
         QNO5fXXW/Js50/Lzm8T/du/hkx0KlozQKTKGs2WBn9fZAvEMK8LMTLmS9pEOqaVx6H7X
         0PgGXKwj1ZehrE2P5BHVT+XYcnS4AOOpBK7iUjYRjg1v8TM2cZH7FKWJPQvWSqPx/IDP
         3ZXjtkZe46d8mdeQ9VEkOlkERh2jWeROyGuOX0ve113f8PbCoepKBAbFkgyDVYfnbQrt
         TfVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789475924; x=1790080724;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=To3gckJSL+lLtFYBc12foP5EN1xKQrTgxmIAPgJMM+A=;
        b=hRoKXKc1EEJrfqNjRP19WluDmMPpiROnTXGYpdSNPjzsdHQDGUt21AZ/4eVxH+4MKp
         LWGgz0J7aNuGE4bd7AtX5aUepkCcVunULK1KgamlTEbKckUE+4DIJsY66XDM8LxzRCIH
         K8mbSwuESclLoU4Zce7Cj5PEZf+CUxL6gL6w4PKdcmUqqJUFDakl9dDQ7fVDdVyWvYaW
         Wj3RypWrdfMev+0BTC7Ezty5081bcft9SePGMyjAn2YvOIUNMqvtxGA5Fx5fvKo3dUg/
         Ur2XUkj/suq7oaJK4x/E472gITA+e6dgbT+/Zb0z6elYSisRnE6yXuROUrrLI7oFqA+m
         LiRg==
X-Forwarded-Encrypted: i=1; AKwUvByUgCcUVQUGDSok87H38bQfIuPCUUNij/nDvrwXPqiV6UfFLX9xvecX0VzUeSgb/uLY1h2YyIHI6RAloA==@vger.kernel.org
X-Gm-Message-State: AFuF++m450JKc88hqJ+aVYnCRxJiw0T34lvNrchy9pg8Zzai5Dx9Z+4O
	NQpB9cFNRltb90dqKBYoVHVbiekYnW+5CuBRmTyccidB1xlvaiRSC3gH5WxvUZUaNHQ0TWzvxA5
	9hmewMsY9NQ6omeWmYq9mJy1kVG+MvR3PkVtcc9r1fepSZ3tgTpb+s40Ko1JUmDO55w==
X-Gm-Gg: AYBFou3hZcCa7nfvZtphDGc7FjFNWfaEAFS/w6aGV1HfIVDzNzCwGwbzkPYhpeSvVVU
	lEdRaXMhGR17PRooJfmp+E1wixW3j169SMCZX8VPY8ya2ek6HifL4bNV0VEevjfxzDH2OATsyXh
	Cm+kk/T+w//MjGlo8suX0+QcliYlSjzLwB8TWetVSpueGWMQs38uuV5y4LWpg6hfpXppz/Ud7jq
	f9PUS5g2nREVNotu5SJ/fEJiOYc5tya1uhC3SdFO49FUWlbvcg32XbQZzzXzzOl3N9KxPjD8rn3
	cd92ub/d53kLSY/Uk8WDwbVazYPfyqM7Y0+HJiGaaVKFDvCy2BVRuLYfSUha6HNQNzZYI1+6dNM
	qIXZPK9L0ggNRLmBikmiEslYy7aXPPN07WlGZ7TQ=
X-Received: by 2002:a17:90a:e188:b0:398:b88c:2b7b with SMTP id 98e67ed59e1d1-39debf93d89mr17438010a91.8.1789475923949;
        Tue, 15 Sep 2026 05:38:43 -0700 (PDT)
X-Received: by 2002:a17:90a:e188:b0:398:b88c:2b7b with SMTP id 98e67ed59e1d1-39debf93d89mr17437941a91.8.1789475923437;
        Tue, 15 Sep 2026 05:38:43 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfda7d765sm5280661a91.10.2026.09.15.05.38.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 05:38:43 -0700 (PDT)
Message-ID: <3d5a1cb8-defa-4252-8faa-8219752c59a9@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 18:08:38 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] ASoC: dt-bindings: qcom: Add Shikra RX and VA
 macro compatibles
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260910-add_shikra_support-v2-0-fdd2129c696c@oss.qualcomm.com>
 <20260910-add_shikra_support-v2-1-fdd2129c696c@oss.qualcomm.com>
 <20260913-melodic-violet-dogfish-fb834c@quoll>
 <2345a7db-d9da-4a21-98e6-e3d622174a9f@kernel.org>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <2345a7db-d9da-4a21-98e6-e3d622174a9f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE4MiBTYWx0ZWRfX+5uZRxt8zfpu
 GSS8BBGOn6pfHq+9UAKR42m1QYdSa5k8Nwf26gQ6AVgNaxaZGttKI5uGapNPSJvRx4UPdBcx2+z
 tM2OzO75d/wMnabw+uDIfK9M39RTMxc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE4MiBTYWx0ZWRfX4FClkfn7QkrL
 BPj87Ds06UetwXQyxoKM0wwx2HR9UcW3oJLa5nBp2ZE3+OqomEmNq2eilCLJ7nPXStJaYo8JgbT
 Y4JviTS63pyEQG+YuQGMc2c3lzTfcSCoZrT7cBtD8BYI1ZrMYGHt87HRwEmO5HTTzJ6/0fMo9C+
 kOORuaGCxQhboi8wcS30ofxuDxDFjYILaN8go/SwoqWuDKaThz97vBKKghs0YaF0y+t7a2mIbN0
 03wSOfV5iLia391KIJVqrf7ATpq2UxPi2nlwAbUArXEHuCm3KuB4m64jn2MmJS4+4wDCQ0hIk/R
 3bnLWWZkToWq+X5xhHKj+GoT7BY9Y8vEwNA02udrvG13d1Iqx7FqRCzG1iUpDF02kYulRRX9g3C
 qOzP3/LLc317GIoTDkW1Uj+Fnhw6sxwYq1t8xX05hF8yrY1UKRQAlo3J8C675IH8ewSgymEiJqO
 kobborHT/IEbhYvaSSw==
X-Proofpoint-ORIG-GUID: sRbW3hUX_qKuqAsAMwDJ1_3arjoXy7Lc
X-Authority-Analysis: v=2.4 cv=LYepeTfi c=1 sm=1 tr=0 ts=6aa93c54 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=IbSSN7kqFlyucIwrSVkA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: sRbW3hUX_qKuqAsAMwDJ1_3arjoXy7Lc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150182



On 9/13/2026 2:19 PM, Krzysztof Kozlowski wrote:
> On 13/09/2026 10:48, Krzysztof Kozlowski wrote:
>> On Thu, Sep 10, 2026 at 03:16:52PM +0530, Mohammad Rafi Shaik wrote:
>>> Add bindings for Qualcomm shikra rx and va macro codec.
>>>
>>> Shikra integrates LPASS codec version 4.1, which is not backwards
>>> compatible with the already described compatibles.
>>
>> OK, so it is not compatible with anything so far, thus existing
>> constraints from the binding do not apply. Then why are the clock inputs
>> flexible?
>>
> 
> Heh, and you already received EXACTLY the same feedback at v1, which you
> completely ignored.
> 
> So now second time...

Sorry for overlooking this feedback. I had initially intended to handle 
the clock constraints in a separate DT series, but that was not the 
right approach.

This was my mistake.

I will update the patch to add the required clock constraints for the 
new Shikra LPASS codec bindings and address the issue in the next revision.

Best Regard's
Rafi.

> 
> Best regards,
> Krzysztof

