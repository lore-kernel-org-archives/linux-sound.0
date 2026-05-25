Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB8C3803EF
	for <linux-sound@vger.kernel.org>; Mon, 25 May 2026 13:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779714468; cv=none; b=iVZffmRpVq8+yklRJFfOSekdNQWnbgd0W6r7klcjQ+DGVzpIvad9wiTATF6fK7dofx4z+DdP8GLrLQKwy8BUojN/C+cnwsdWnXCfCBZz5D7DvKUqfOh4Ko1E4ZsCF9t+I7TqbcxDoc5C386xuLhUvCWvDI9vBy1p6Zz+nejmfKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779714468; c=relaxed/simple;
	bh=FGh9wbyR5wQdQfoGl5QdsfDgHApADG1vGkiBgzcWpaY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IMBy7ruR+fyRk55y3wctm/OUvbts0kh+vFOAqQW9KR8HTFYBs3F//hwzeyz2WwIxpL5beBiQlxvApQ/lGFNp+3fDnNYJLjl395kFZFxl7C8d7Sp5QC4+wZhvYDFJEvtrZXaWqBxcL7s5e209SxzT8Pj2qAHz6at/3/PNFBOW/WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DC/D71z8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gj8BMHZh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DC/D71z8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gj8BMHZh"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P77blc1851654
	for <linux-sound@vger.kernel.org>; Mon, 25 May 2026 13:07:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RzRZmaAdBmhSzzrkfPycqssxyvsq883C0Kdc/KcJSts=; b=DC/D71z8QIuEE9yE
	J6LYQFcfF3WoXYg3CH72K09dPr7t/U7zFstNCqpQt14dmegsZnHEu4hAv91Xh351
	XJSbG205ZLpjFhz/zhyafNeghE5kqLpi+jP+Bk41+se61hYajslr1K03Zamtwd0G
	f406Pi40hWQPsKkMdty4ikv7+8oOxLgnPLRd/0Ly8GqSiRNsV0vZEHedB/TAWJmU
	4sJJdORNHuUvPj7xI8y5XUC7ipPukIo21wusbJr+y+Yc4hMNHKK2SI/CnOu+iap+
	KDztTk0uOCS8pdUjcWBXME/J8edliqJQS/pOhuutirEqdePpFTL057yHEB7emDhj
	4Getxw==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4asxsbw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 25 May 2026 13:07:46 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-4349dae67dcso1692680fac.1
        for <linux-sound@vger.kernel.org>; Mon, 25 May 2026 06:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779714465; x=1780319265; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RzRZmaAdBmhSzzrkfPycqssxyvsq883C0Kdc/KcJSts=;
        b=Gj8BMHZhSoerspgcvMoMR/xr1KAu+10GHq8ryKysO9dPTchv8C/4yg8LwslUgyYs3b
         OBzW/aGU8JH13CBTutzEipc6YEAeTsGHxH2WJ2/yVRb84+n5waGjeBGwHCUNapZumziD
         qFZWpScp3omkzmCwY9zLrrQBRgVn4WfvF8UUJojYY6nKYFCZXfJEggSNe9iqwFFC3wD8
         YD1+GdttYwVyUqdXu4wtxNKanLspePIEOSup4ZvS7QT1RBnX/2IuoGeuXv9ctor9qxkl
         T/0pNpCNYjPmzmHht21aVlHAo+1tIevXt38cbPQQ0RRRlytaIH0BjsRzKK9hu2TNVxU0
         66Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779714465; x=1780319265;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RzRZmaAdBmhSzzrkfPycqssxyvsq883C0Kdc/KcJSts=;
        b=VKCw7gpKYt2Y7Syu92sUAsNS9yAlaCp7wfkiRrwp3RcZ+EtG3O/Vn2UteqwcQyO517
         pdpoPv4eWKh11dMqDjgOKa4CgJ8gAhX2L2eDp3UC9ferxpno1bCW7eF6hOWrMPWIae/Z
         ZzD+ld+lG+FlDvKRtKK6HtUaQIleMH8D5+A8KqvPV96S6oK8Q+8jiS8+FJpQXJYRqGx6
         oKcHZ4MGEYoelYsLMOybMxyO5MABVBmUeVafjenMPk7A5Nbsz+2xk6dgrrjblhg5lxL5
         t+Afbeat6DCq1OM/58H7VvmWW5l7LRlVh1/p/y6JyN/vcE4SUmf7R6URhDfi0UrWXWcJ
         ToQg==
X-Gm-Message-State: AOJu0YxSRwmPuNjwO4J5hLel6Rjua7KGJuKo64r8vuBMVjrPyZr3c1tU
	BdraG0EIRJnvolfQ5vSxXi4alsEmfgmsJxq/MclTFczlKIs1a+1g2o1x5fY2yZQPCpt2Eg2uoyz
	EjLlNsYJZs3ndDoRZ0EnpS0WaYPNTKYfry67KDv6hGES4x1Yp1tIryjVJLsJgnwSYJg==
X-Gm-Gg: Acq92OETt4oxKKOWgXPPNSd3h8coGt9wQpc/h34Ez15W4f+EO5U/O5flyUyRVXc3uNg
	O2z06K6Quz4sy1PSpBlPq2qFSMaHRQE+TFUf2OD9h1VMs5gotOdQrFxV0sGJEyxAnZyYDAtOkgF
	uP4fnHO92DkqwCQ/30SpFoBAS7uMZ7redn5mNZ5sH0VwlZxFvFpH2+79RQbS9JP0lVEaFKL495X
	1Gr+dNca4KH+SCwV1LOTjsJHYLrZ9CeLbbYqizdme5ul5Po50tF/iAVGyYI9h5Y+fJ3E9YQkOmy
	VyOjOx6UYZioDtgYvyXnMD7onaIhg5klv+PRJ13lkj+S4m8MJpN5wV/8cxe6rLTTMkavR2XFL3v
	5ROXSGrqs88yrngwykTzCjSg6YzFTDFRP0zNMh/7mTblSYg==
X-Received: by 2002:a05:6820:5457:b0:69d:449a:2bed with SMTP id 006d021491bc7-69d7e854c29mr3518787eaf.0.1779714465634;
        Mon, 25 May 2026 06:07:45 -0700 (PDT)
X-Received: by 2002:a05:6820:5457:b0:69d:449a:2bed with SMTP id 006d021491bc7-69d7e854c29mr3518774eaf.0.1779714465275;
        Mon, 25 May 2026 06:07:45 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc62d9520sm393075866b.50.2026.05.25.06.07.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 06:07:44 -0700 (PDT)
Message-ID: <cd70aa70-1e1e-4440-be2b-414c0d331099@oss.qualcomm.com>
Date: Mon, 25 May 2026 15:07:42 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] ASoC: codecs: lpass-wsa-macro: Switch to PM clock
 framework for runtime PM
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com
References: <20260522073324.e18bb240b6f6@oss.qualcomm.com>
 <20260522130459.3411038-1-ajay.nandam@oss.qualcomm.com>
 <9e8c0351-0168-4d94-8610-cf2cc2f030f0@oss.qualcomm.com>
 <1e54db48-e618-4525-abf9-ee65d0a1b71d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1e54db48-e618-4525-abf9-ee65d0a1b71d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEzNSBTYWx0ZWRfX48Xliwv9ISJ4
 S2hmYSnLKqwfLDsUydN/uMITpFOwpNrNWw1v2e3crDEsLQOxR2oVOjfVC3K/pU6dk8QHxYzaGRo
 Iu0qhSnl1bwFyXYXQYmn7rAkkwBgZeIUsirkiL1J61iDupeF2JdqemWXPHFbUgfX3mYiY1k6Zaf
 4HyRFrjmTrPcFM4ZrLGaTx1IlR6bgZKInuMHNpjiqNp0iuIpLzpV4hH9sRrNXEV5cAiPTKF3zKL
 /KbQ1u0CHMq1+gsaN/pBa7NiasK7QmqOXmbB55+rU7K7f1uHkcRqpyXOF5AC/5ntnsJQvjwEJx6
 O9q/flygBVf6SNGUoAXgRByicFZ4CZM08pP02tzUmitjJzuTXWTdFdE3++ShBJo/9bnQQ6tybGi
 oSWwUS8GJD0h+eNVlfArJ7KrZVH0/2xv7iuuqeb8OrnxcGvQE/P9rI8kKKHgiRQDnxmy8xchswy
 MIytHBAnNAOb/P2aDXQ==
X-Proofpoint-ORIG-GUID: osCS2l6IEvB9xIVwiKLBb_XqsLPaDgGJ
X-Proofpoint-GUID: osCS2l6IEvB9xIVwiKLBb_XqsLPaDgGJ
X-Authority-Analysis: v=2.4 cv=c6ebhx9l c=1 sm=1 tr=0 ts=6a1449a2 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EXL2SugY_77LC3pzBmYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250135

On 5/22/26 9:26 PM, Ajay Kumar Nandam wrote:
> 
> 
> On 5/22/2026 6:55 PM, Konrad Dybcio wrote:
>> On 5/22/26 3:04 PM, Ajay Kumar Nandam wrote:
>>> Convert the LPASS WSA macro codec driver to use the PM clock framework
>>> for runtime power management.
>>>
>>> The driver now relies on pm_clk helpers and runtime PM instead of
>>> manually enabling and disabling macro, dcodec, mclk, npl, and fsgen
>>> clocks. Runtime suspend and resume handling is delegated to the PM
>>> core via pm_clk_suspend() and pm_clk_resume(), while existing runtime
>>> PM callbacks continue to manage regcache state.
>>>
>>> This ensures clocks are enabled only when the WSA macro is active,
>>> improves power efficiency on LPASS platforms supporting LPI/island
>>> modes, and aligns the driver with common ASoC runtime PM patterns used
>>> across Qualcomm LPASS codec drivers.
>>>
>>> Keep the SWR gate runtime-PM reference from SWR clock enable until
>>> disable so autosuspend does not gate clocks while SWR is prepared.
>>>
>>> Add a PM dependency for SND_SOC_LPASS_WSA_MACRO so PM clock helpers are
>>> available when this driver is built.
>>>
>>> Suggested-by: Mark Brown <broonie@kernel.org>
>>
>> You added this tag, but was the entire content of this patch sparked
>> by Mark's suggestion?
> 
> Apologies for not including the Reviewed-by tag earlier — that was an oversight on my end.

I'm not sure we're on the same page. Please read:

https://docs.kernel.org/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes

Konrad
