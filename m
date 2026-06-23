Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF793D3CEA
	for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 11:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782215847; cv=none; b=SdHzuMfttCYcIMqxNB3Ugce9/xVHCportpRDOHYQ32mfpxKI8SCgiPVXCG6wGnobbM0UGpYogUuzts1LhAEUmt0GqU6UDA7n1b6r/Nn/GyjW1rgkwRa8zxD0qUMOajNV2KWMrUUWuQYTlZP6QqNTJ+BJVnmTiG6Q4wn0nb2tFi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782215847; c=relaxed/simple;
	bh=ta7lCOY3KxJIlrqtQWrMNmSBkzfFL8jzhc14LhT8NbY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FYIRHtNLP4jY8MaGYV6+sZpddm2Mtv/iADmySo+D9KrXg/cGSSpoLXzy9pwZvrjeU51XkSaxC4LJkimuQUMkFYAmKQ5SzXRAm19YMSDhxolTntHKRLUqiHyRCM1wSplz9LgceOZIA2FlhN5FLjF+/5Nj1APll06/e9tMgx/JW68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S0VVIO2O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LN7EV5ma; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S0VVIO2O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LN7EV5ma"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBY7kM3673905
	for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 11:57:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TINBqYkE26aEktY+EqHl3hxFez9LQ+TsVA+VlTGQXW4=; b=S0VVIO2OBhQfdgaG
	7OzEFAQTUEGVYQrW871GjSkbdL8bv+x24Z9kXKCwVA/0lumnTK9t7JGLCQienIyv
	wWq2iz8+VPzwQOkjlFP6KrCJA3LyWF0HZEzo8EA8IunjBls49e/w1JNzAhH3BZm1
	iBAfgP2koM1OHC8AT1+yOtJAoEN6djiY1Lcnc5M87TCwhY6PH2qo7LC2s7tfDmOO
	guMH3Jg4BLYWAESqLER/p5H+eF9zAHhcpW3lBgsnFnY7M1rfAkqfRqf1eEoxLJNN
	R0AtC/gGqW1nzy2Njj1ATkxHhcpvU1vD9Iuenhhao7DE+6Z8rfNk6d6sTFIiE7R+
	+KJ4Aw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey729v9qh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 11:57:26 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-845438fbd9cso4252921b3a.2
        for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 04:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782215845; x=1782820645; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TINBqYkE26aEktY+EqHl3hxFez9LQ+TsVA+VlTGQXW4=;
        b=LN7EV5madhb6GGSLkt9PbffH8g0j13UE8fefxQhO4xH7dja5AYQfCHGSGIUuLpN4fo
         38E5dtnojY5vAc4mxJkotORSUDQ3D2JxiZU6EphD5npsFAxc50Y8eQdJXY5LmW2zAFoY
         PzEmWj3y8CGdiVY4g7+HXT9cW/oi40nYtJxxheuP1BofgAb+LDa0c6DQeu+nWixqKwoJ
         LUpS1U46ejTgmIG/zUyYy5k3eh33p9JPy7fFPlbdog5OyGl5Kd9PRASxloMgdwfyBMzA
         mi1gaZT/C7AcrLl0EIAgF8vEGZUGGDrcR5hqJMQICouoJfHURaLse5SdnkxYomcZ30Z4
         1SzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782215845; x=1782820645;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TINBqYkE26aEktY+EqHl3hxFez9LQ+TsVA+VlTGQXW4=;
        b=fxNWSMY7bAvb3hM7ifaiFqmXiVs7V3FGl5triXRRyacFFcEuC3NVnVaVpiQPL/rWUz
         9Rs+ELrFbeRabrRar0N2onH+Zl3sblFocspbI5PgHkePYmTo0kR13dS0KOuHSjJGqjDP
         SZ1moHQrjfgHNoP/4VjDI3tU0UyjvrBteyQtsYCWAV6mPKgNQtMthitYQxkYPR98vChU
         NJ1samLiEwHszI71dmTeOvdR6HLt43hilijw6qiVRbemt8ubEcQjBdjfY2OTCBg2TRjP
         xBToL+PP+gqbhowjwln6pwTKTnzbycRAsA2S8qrP1v8nHLqcA5ebagP3ADozsKAavCso
         eZPw==
X-Forwarded-Encrypted: i=1; AFNElJ+Iroof/ENg8OcRS6H7CyJm+3CGzkmIS1nTCkdU1djsUdfcwtbc6gzCVscmoHuyTHBtjvULu6K+V8V4Pg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywtcx/R5KEr2sg3YfeISDC6uoAUiRb/zia5CJs0PTbfI+Ny4p0A
	VCNdUeMSErA9laiaks+zmvJWBDdMkLY5m+3xudDdgtDnb6Bt2ub0ip/lGwBzwO74jXIBfUtSYk5
	fXrjQ6wv2KeXhR1FpctcBwypD1Lkji0Tk+En06BSRe0fVQ22Y3owSSJ+IPhFiGDROqv/myzOteA
	==
X-Gm-Gg: AfdE7ckP8cI38ORMlFPMDJNVUIOclO1Pdq3oVUJguVvZWM58F6xNBi1xxJnAqn00gTn
	Q0fT7a11462cGilj/9aB7Yzy2KqLDAvg3S7ZKJDUUlzrz7XTzMpfKiV8miHD9/+DBDoaNLRVOQm
	9oatSeCHUc52SGUxbZ4/GMyHMXrcu9SuYJ79kzBvIjs8uoD1WnFt7GcGd1PmXfefu053X4uO0S+
	R2lUecxKKTpkCICxDfoyESS/nEwpa4zJ7+zN/EaOtPYfPTNQn/Q1iRAB/I9s/drWwxA3QILCL0h
	1FCFEX6Sq90ZYGjgsSlzmwE3axXT2KXSEoIrtL/QUAUQGu0ZL+TwkGmnpJtXtfta24Km4Nqa+Fb
	ki7mjdaZ3QIzTklWxz4NSJbrjVLsZry0zuoLCMbE=
X-Received: by 2002:a05:6a00:4c1a:b0:82f:390a:69df with SMTP id d2e1a72fcca58-845508bbac3mr20987616b3a.35.1782215845370;
        Tue, 23 Jun 2026 04:57:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c1a:b0:82f:390a:69df with SMTP id d2e1a72fcca58-845508bbac3mr20987573b3a.35.1782215844896;
        Tue, 23 Jun 2026 04:57:24 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ec335csm10473084b3a.49.2026.06.23.04.57.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 04:57:24 -0700 (PDT)
Message-ID: <103ebcbe-685f-48e4-bf5a-4a0625e03a05@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 17:27:20 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/3] ASoC: qcom: lpass: Switch VA/WSA macros to PM
 clock framework
To: Mark Brown <broonie@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260623071708.2822269-1-ajay.nandam@oss.qualcomm.com>
 <7dccd968-6a58-4dd4-8ef8-5aa3f8591bf3@oss.qualcomm.com>
 <7c4c3a7a-ad8f-4603-a0ec-2332f296234b@sirena.org.uk>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <7c4c3a7a-ad8f-4603-a0ec-2332f296234b@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA5NyBTYWx0ZWRfX9ul8IZIKfGbN
 iT1kE/vhKkZXGkdjm34WLVR1o6foQNJDXwnGq9D+jzZDv/vZ7tsUf61117PVfUh6tLXIlh2E9qr
 18omzg60OKX8zPKy50XHYjF0x80GMfM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA5NyBTYWx0ZWRfX30hjXhOpJD+r
 juzXSj/F5MG6bdocM7zB3MYBH6ZezTN49X2JOJRjd4234Pu0bwMSpMReio7XezyW9Oz3E2f01/l
 mn3c/EWcrwSq8KglKrSd57l1xHroDgZtBcuoMTtev9zpMseUHEHufxFxXY0ypT+HXerGO+rhFio
 KSNphaKoZRK1CoFioD6alCfUTMzx5zOE/bu79K6ULag15g94GB/TPmAaD6tz1cHvge92TLyI2II
 WEum4YZVejvOwO06eHMcPhJ+Zw2a6niGqAsMl3Oa9i3PrXNs+ZXTD8TRfi88OlxFSI1mBBEBuyF
 TbYuWAZxZ01Al9lF+MEdRChXe4AZ/gLC0v9868mSHOTyWxUT9JVEevYsUdQF7ruf75XXTP0msfz
 YIKseI9Fx09ZC3+mTVWyQqKdKD8HNrwj7kKYYynZzcU5gwEJbe8+1/L2tVWQaQOzt++7K3ixFaO
 5vmJWfgDaNNE+kOVpwQ==
X-Proofpoint-ORIG-GUID: in3cGUgUHdWx5DT7ucn7uJBY3UePc5ke
X-Proofpoint-GUID: in3cGUgUHdWx5DT7ucn7uJBY3UePc5ke
X-Authority-Analysis: v=2.4 cv=eN0jSnp1 c=1 sm=1 tr=0 ts=6a3a74a6 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=BE5Ahrv33Z5kx7RYN1UA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230097



On 6/23/2026 4:55 PM, Mark Brown wrote:
>> On 6/23/26 9:17 AM, Ajay Kumar Nandam wrote:
>>> Hi,
>>>
>>> This series converts LPASS WSA and VA macro codec drivers to the PM clock
>>> framework for runtime PM clock handling, and keeps WSA MCLK-output clock
>>> registration resource-managed.
>>>
>>> Changes since v5:
>>> - Rebased to current linux-next/master and regenerated as a standalone
>>>    series that applies cleanly.
>> Switch to using the b4 tool (https://b4.docs.kernel.org/). You sent
>> all messages as a separate thread.
> Also you already appear to have sent a v6 of this:

I did attempt to resend this series, but it seems I missed adding the 
RESEND tag and ended up breaking the threading—apologies for the confusion.

You’re right, there is already a v6 posted earlier. I will ensure proper 
versioning and threading going forward, and will use the b4 tool for 
future submissions as suggested.

Ajay Kumar Nandam

> 
>     https://lore.kernel.org/all/20260604124823.3467457-1- 
> ajay.nandam@oss.qualcomm.com/



