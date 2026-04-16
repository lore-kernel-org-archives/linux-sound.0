Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF22392819
	for <linux-sound@vger.kernel.org>; Thu, 16 Apr 2026 11:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776340531; cv=none; b=Fej9RqPF9uaqOmF2kLHdyH/as8VISDZ2v6nlCM8F3PfaTeCVqn34vAxLv5BYtwOAlQXb9PVZUyiH/LjIBzG6yosOb/x62Xfymx9Q1X8w33CbbvuO28ckaD9XTypnsilCwkhtG2T0ybCC+qVySi82w7vcMKfmrb5TCOtU2iGD43I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776340531; c=relaxed/simple;
	bh=s07xyFEM3K0s/4ToldgrmCA6O5xZjLxj37ncRd3W7WM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ugDfdtVd1UYQWnmzOyWP6ER9PMYSKeI4pIi3RIBHDUiadAvqqHce2A247+62iSqz/PMdu1gVvWN84aitg3DqXGWlBv8B3cW0I7WofZq7HomvCsar3OTic7tQmx3fSp3/QUF3Y1p/nnfZHbeDQ6ZWAmd7Ko9UXUc7fVbn8fn0OA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cfNiYrBF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I5t2SzNU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cfNiYrBF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I5t2SzNU"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63GAXrFl1245093
	for <linux-sound@vger.kernel.org>; Thu, 16 Apr 2026 11:55:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o6NEGa2bH8D4qzhZrxX1FAi3DMIdvR8dA4e0BmblBlw=; b=cfNiYrBF8hpHbgMy
	6pS4OY89Fa7KN8rqsvW4dIvEPU3rW80TluzQyH6AE5uW/wwnmprHljGTWBh2LCxZ
	AttH9FJKY5VuyY0gR5cujYitbQYv+WOCjsiXWL4pxrD8n76HX6Q5nOPscFxUD/2t
	njHvo+O3VekZCFj9JZCiRXHOhHfu7mAmLibW1XtoXxmBbFioS2oclYnXoFRjPcOS
	+qiT/OhtZDTTGO+Z2BN5TpFFiDpK36JKa96qMdSX4NXGtOWUNnukMhvwbc1UTyI/
	lMm2JKJEteB3HCOqwfdGs5W23ZsdDe7wwSeiOuaEBlSBoDsnvljNtj+nA6t3F6GZ
	ANVpXQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djx4k87ej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 16 Apr 2026 11:55:22 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35845fcf0f5so732644a91.0
        for <linux-sound@vger.kernel.org>; Thu, 16 Apr 2026 04:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776340522; x=1776945322; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o6NEGa2bH8D4qzhZrxX1FAi3DMIdvR8dA4e0BmblBlw=;
        b=I5t2SzNUHE62RlJ5BWf09pWkoQpBqJu+UCNmobXOaRDdMyDOlTIr9RE6xH+NhU7FzL
         l0WVAdnnzxTP4SsmGZfMq9G4XFn0goASjMaH1N3N5eoLPggkp2j8LTBzBdUI0e2+I7B/
         au3SyrH0C+vD5iD+IVtg3pAbwgVTHvvjiTT/LYOdvVkaXOMAlb8QrTB/2TA4iX+QpHVV
         Q9PbXa4y8T4uteGOphh48TLjCdK/bs7Fkt3X1u237DBxbXxApWDDz22+CrwC9op9mWZB
         aadzpOciV3YH7bd+mWnUt0YLWtUghGHtONA9c4H0uqHOmUCSDDryXkmguIrZXShNBD7p
         2G+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776340522; x=1776945322;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o6NEGa2bH8D4qzhZrxX1FAi3DMIdvR8dA4e0BmblBlw=;
        b=MFlfyguvKWM90XH9bsJXc7i77Ls8zfr9U60rxbXUlfI+xct2dxsKR8WbkOevo6yIBn
         vsmVyjcXPGQGc8s9nh73ALIcWPamh5TemjL2GDnURJIjOR3eJyaTRluZGhT+LVBB1f8p
         fzDqDIrJzqIidqN5ENrAVyWAyTBx+nk3VhmTfRtKmnaEjejkCTtMJr/4XmLobuuhjnws
         H27VZHjo3AnVTCRbar1re1sTv8dfqkhEHdmKY3Pvn4XObyo/JQUpKSm2lY6K6Ksozl3t
         OJlG9ZUdm1FJghq41NwlmmkQ3XZrbZQeSAcqtdQ5U6U4Aa8bYV9T+IFj3tEN7LqHbjXH
         2LCQ==
X-Gm-Message-State: AOJu0YzM5vfFONkMDCgW+y3LTbIAd47BRCu5dtP09qtEK1FOs5YAXrBl
	oa13ZLr19ZOBEsA4rFphr0N46ev7dXByNmvHpc19pdewJvvnm0u47FWS6w0UF76VdImk9zBCaP7
	32wThlqSIUsRAHFALK8DkLNCib4wmH0/JWU1h8148a+yU7CsM3AfXTsWhJC3n1ZKcb4nsz05Ung
	==
X-Gm-Gg: AeBDiesD4Y3Uo55wASiQ1sFc3Nhq2aUB5pFciKTvPrsTcbrxJRPOASYHp/C0LbvR4mU
	6yPX6yhedwvvV+0InrZ+aV04jiBsZZmZewvjZ6mTMzDoJlRp9zjpIqyK3Md2VQzuaj5UQK1p75D
	g0FNhcAAvNPAbZZGjoHBaQa38h+GrwTGUrT3fy4P2HSa3+JNmlP3tMbPG4L+GESwKAa+M9nwXWc
	EP9AYgjdL17Spp/V/34muFQN3bZigDqUv98+O5zIC6LzBlPashMjEbPJZpK0+hA5z39ZjRD07BY
	NCab9f+crwd3hNQKfbWTcG3RwV5vxI2A+iZrjFCD4K1H5+7JwsEN+t/TLFlvnluluPwHLS8qIaa
	+8hbxhKK8R6jww91YdTdhd7YpIP3KYUKGBCmuwGvhM74Yt43DSw==
X-Received: by 2002:a17:90b:3cc7:b0:35f:bb17:39f with SMTP id 98e67ed59e1d1-3612f26da35mr3254460a91.1.1776340521977;
        Thu, 16 Apr 2026 04:55:21 -0700 (PDT)
X-Received: by 2002:a17:90b:3cc7:b0:35f:bb17:39f with SMTP id 98e67ed59e1d1-3612f26da35mr3254431a91.1.1776340521490;
        Thu, 16 Apr 2026 04:55:21 -0700 (PDT)
Received: from [10.219.49.106] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35fce719729sm2273435a91.0.2026.04.16.04.55.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 04:55:21 -0700 (PDT)
Message-ID: <598c5171-3083-4122-9901-10d1812d54f8@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 17:25:16 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] ASoC: codecs: lpass-wsa-macro: Guard optional NPL
 clock rate programming
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, srinivas.kandagatla@oss.qualcomm.com
References: <20260413121824.375473-1-ajay.nandam@oss.qualcomm.com>
 <20260413121824.375473-4-ajay.nandam@oss.qualcomm.com>
 <07c73c75-5ce8-46f2-bcfb-bb6d7fe0afca@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <07c73c75-5ce8-46f2-bcfb-bb6d7fe0afca@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qhlffCFXS8-U4sfci2LfjXIS9EVZHKcn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDExMiBTYWx0ZWRfX1XCFJAnc/5cs
 FBRN5cOwef/gigawdclofB7TcPoB82uGxxBNOLL6iiLnTFpltMpnh1545HxPzs7I8/4RANCR11L
 mQxJhjXaMJxbVU1n50QxDpLQtX7noD5Bo+9SbRMGHJMzCWBhcfaapoqQoV2wX2MsuK67LxPfi5o
 bXQdhXdAHcrJJRjfFuWaKoRFEeNzArFOxfKtMRp5x6uHgoYfImxmPeI5cY3P26QyWILLsxdn7eX
 Zdsk0KxBbgcjTVAdRQ6vrEHPmLNbeXsIb0vJ9ADqBJ7fH+1TYmUO5F8CCRBIbNIOskhq3L3b6ky
 P+jWYh0YvKt5R0Rcdn6MroKwgq/qerXv3pO+u1qNlPq3hB03jKUsf6nq1zWaixvWKWohnZqC8Vu
 pqLb+DOpwDkU5JHcv80nq4dD1qX8RVW8iquT+i3HblhtfThkaWNFEOgVRhQkOVNtgrqBDhg3BIQ
 5lSuh+P+c3JGblortWQ==
X-Authority-Analysis: v=2.4 cv=H47rBeYi c=1 sm=1 tr=0 ts=69e0ce2b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=-w0wuxjKlsJx7c5tfiQA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: qhlffCFXS8-U4sfci2LfjXIS9EVZHKcn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 adultscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604160112



On 4/14/2026 2:17 PM, Konrad Dybcio wrote:
> On 4/13/26 2:18 PM, Ajay Kumar Nandam wrote:
>> The NPL clock is only present on some platforms.  When it is absent,
>> wsa->npl remains NULL, but the driver unconditionally programs its rate.
>>
>> Guard clk_set_rate() for the NPL clock so platforms without NPL do not
>> attempt to access it.
>>
>> No functional change on platforms that provide the NPL clock.
>>
>> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
>> ---
> 
> If you dig into the definition of the function..
> 
> --- drivers/clk/clk.c ---
> 
> int clk_set_rate(struct clk *clk, unsigned long rate)
> {
>          int ret;
> 
>          if (!clk)
>                  return 0;
> 
> So let's drop this patch

ACK, will drop in next series.

Thanks
Ajay Kumar Nandam

> 
> Konrad

