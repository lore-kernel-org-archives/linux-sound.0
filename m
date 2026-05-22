Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC28377EAF
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 19:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779477987; cv=none; b=L1gJ1qpmeqaHzv63J1p9sCroNSEQKRpdYAsftafQ/OLBIM5b76UlwAGnB8INFJPtBYRev2EHeD27FsLw1DAmwA+Aaj7L81PT6lHAzvbOmIDff3L+BQDiz1uG96qMp23uaXFNRVwCgzOxwlJUtl1PrV7p0/BFQOZQLFrDbqSaG7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779477987; c=relaxed/simple;
	bh=wYqSJYotgMtie8NqUqcfDaB+2/iM5ldwntrcWEsF+A4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=efQo+NiFgXFdvS/DsDQpVZh4ilCzznGlb9M37zacRRnFQUuI7DOO3m9xDmmaQvQ/ajHQwrfRuFO518c/BcrMJqtYdzu5MKwDX2cDjHmd4PI4KQ3Sh/pHjSLicoTsseg2KvvqOSl+qjOgMYjP324f5snZNETYmcsBmjOnn0t3sgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GP6PT/Ft; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HHuxchNt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GP6PT/Ft";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HHuxchNt"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MDpWZk2125172
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 19:26:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+61W1UOtIsgDmPVeff6jHolvzf9011GZ05wsL11zWSw=; b=GP6PT/FtYTQcfpYy
	th0UN83zLAZ6yKe3BkkIhAFlKGrFCMJUk5uTpyJz7RfWVSOG9fXmxqh0ud2F/Y6v
	rhyjg7S0B1YE95T3OpjR1kKQifJ8WkJwJgJ9lcsmkkgq2ZtMDuZjd/YIblIdVIcj
	VCwBmq81cwfzEXWYZ79rVhZ4pHsfB0ttf+nyxnHH/5mHR7dDWvLCY66xC+409f5c
	mIpd1ldoXyAMatROf2XyWBN9OFExdWjENbvEPY0YiXrnTwZj3FNnFzgKBTcDGAfz
	HSpT/wGwlCEoBwpl+48tQO2rVfZyQwrCyCtvg6NrsO0bINB9BUgv/u65px08WINX
	huGXhA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eard89cg2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 19:26:25 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2baedd2fd43so52784405ad.1
        for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 12:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779477985; x=1780082785; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+61W1UOtIsgDmPVeff6jHolvzf9011GZ05wsL11zWSw=;
        b=HHuxchNtoQ0l1Bkxnyjfg8nuOE4UIOX8B1cTNHu+biclxjiprP2KkEyCtFkN2J5Ogi
         nM+/j03Vzn1KTv9facVmmhfuSuffgjtZpfSmvJmXPxKl4sVi7qpidGcX5sp3FHW0jHV0
         SHeE780cVTFIvvRfdCEQj0qre9Xpir5P1HLB0T0sBMfi1smHxNuffcxW/oXZkNsxveR6
         opZ5DQozULl3pIuoNMIwChGHiMawZBIzYSKCE5RY4rN2KLu7nhoSNzSTG6gnvSTnTfDS
         MRGeqiTjPwOwfIx77Cem2DBacNm4MY6BzXBmAn+DGlWra4WE6tskhvKo0+LWe7h0TMZG
         CEjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779477985; x=1780082785;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+61W1UOtIsgDmPVeff6jHolvzf9011GZ05wsL11zWSw=;
        b=hz/mh7YES+nLqy9+A11lT6ASLByPemYVOBgPZp9U3c7vhZmbd+DYPBSkk8/FN9o5up
         h3crfA61OkWHiS93MVTtnePT2u6Y394nfJT+m2SxgUQugtgKxdnUpu0MGHYjZwakWkDN
         uJNZZOCZwsXK2GzRPKUI4m9cj10w35RYHNEL+xpL5Wt7ne/8nULbprW67Bxtozlur+Uk
         YJvlAfUnst5xLPRraNiXrjUBurwFyetAjBdyx7RsRsO1iQ8u1dQlVhuZ1DO56DZ6lTxg
         o5aRa0fsS8qxUrYmtRxQJzJ6kaIxRP1pwwUbXqwKwWWD83/mz1G9Q1SO8A8M/9Aulleg
         Ag4Q==
X-Gm-Message-State: AOJu0YxtznZ1/Zqv9T5rRQ3/sKMCe9z3vk69BVpD/5bp9mTBJIYRmZe7
	RRHQ6NTgXMcU821eXZBaOevj1Ve4xCUTqXydPKguEzW9sRpK5GDAAOcyLpH8zcVVzOtxwGPOYbP
	30+MVEu94SoJOyYvKNZEthw9BJ3q12/eLSBUgiZJABEYW6e4hMVtcmSwHLQ9z5mwAGg==
X-Gm-Gg: Acq92OGfmf7EjTrXYciH//5JYC70a4l2hgx2OBylwlowuNWxiio1Yjm7EuQMtf1KpKK
	5Mppo70BFZ8So1qLWXjMPNrsXK3Au8/aZfyKsrAZV6sjsUs1O2Ff3Jld4QwPzdlubwVlN9A03iJ
	Wg6ZWJmqjbJtHrSyD4SMbGtQmSLQBTqWskVKE0glQXyqLoSWV1QdrNxZRZ1GZwC3JFTol76p5L6
	krt0AyeiCMzuvu26QgOFuSvaqsOHNqBxsDYKt5gSbZmoG1uvtzgTRlqEVfr4ETU4e11gssNMYpz
	8TzDCZf3uwfeL/l6Xsy3FN03a2bYX2Mpr6laSdoWqV/468J/vUdtegkKso+XjxajH52eDU420RY
	LJYyCDPI9jD/z+AydBZyZ6kNIIrF+yZETDs09GBm4Slcy2ZklCg==
X-Received: by 2002:a17:902:e785:b0:2b4:5f96:184d with SMTP id d9443c01a7336-2beb05a4873mr50117215ad.5.1779477984883;
        Fri, 22 May 2026 12:26:24 -0700 (PDT)
X-Received: by 2002:a17:902:e785:b0:2b4:5f96:184d with SMTP id d9443c01a7336-2beb05a4873mr50116935ad.5.1779477984437;
        Fri, 22 May 2026 12:26:24 -0700 (PDT)
Received: from [192.168.1.6] ([223.230.21.136])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56ca7fcsm24750295ad.27.2026.05.22.12.26.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 12:26:24 -0700 (PDT)
Message-ID: <1e54db48-e618-4525-abf9-ee65d0a1b71d@oss.qualcomm.com>
Date: Sat, 23 May 2026 00:56:19 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] ASoC: codecs: lpass-wsa-macro: Switch to PM clock
 framework for runtime PM
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com
References: <20260522073324.e18bb240b6f6@oss.qualcomm.com>
 <20260522130459.3411038-1-ajay.nandam@oss.qualcomm.com>
 <9e8c0351-0168-4d94-8610-cf2cc2f030f0@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <9e8c0351-0168-4d94-8610-cf2cc2f030f0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Fus1OWrq c=1 sm=1 tr=0 ts=6a10ade1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=dyxLLOf8pC0bdfPLpLFr6A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=UFEU4FUi6niC1vJbelAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: F49rK55eNHAe7chzHxCJ0vk6B11YPWLH
X-Proofpoint-GUID: F49rK55eNHAe7chzHxCJ0vk6B11YPWLH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE5MyBTYWx0ZWRfXwRdG6l5ydxsM
 xjjN8e6kDPf41fEDyuFZDBrB48QJam6X0LlxbS84xkbLpmz6L4DAgiCBSPBe+arhfEHS7NZZCBC
 i84DTWgeZLTHznN8ZZf5Z5FHkSFgv0VlGeRQuZw2tRI5B0buvWuz7soC/c0RVJvQSHlhICVRpdR
 NMGvyGERFyzJA/UX4bqpsvp2SMgHvFlALFJpKtWGZUXMhEtvyf1hHGfzS3nCqX1b/oSilBYAJOY
 pqVAU5JVfJeTOqEHtmpennYLOhc9CRaHtW4SPuAm4cDOgE9FJnemj9mZDHCf41WdASMHZlR7j54
 AX/XWTr7JkqlMJEG9TMeJB8wt6h5I9t1xvf7oeNgQog7G/LptAaYZoOhNjr5yJoqOSYCbpQuzSl
 V+4T2nF/sCcgAAPK38Sgy1BAb2CwT2h8DZ0YRGoUzWiB6eLvls9m2fpNn/pnfXLWigw5xNzgSs2
 6I9BXfKfOwb8253I0VQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220193



On 5/22/2026 6:55 PM, Konrad Dybcio wrote:
> On 5/22/26 3:04 PM, Ajay Kumar Nandam wrote:
>> Convert the LPASS WSA macro codec driver to use the PM clock framework
>> for runtime power management.
>>
>> The driver now relies on pm_clk helpers and runtime PM instead of
>> manually enabling and disabling macro, dcodec, mclk, npl, and fsgen
>> clocks. Runtime suspend and resume handling is delegated to the PM
>> core via pm_clk_suspend() and pm_clk_resume(), while existing runtime
>> PM callbacks continue to manage regcache state.
>>
>> This ensures clocks are enabled only when the WSA macro is active,
>> improves power efficiency on LPASS platforms supporting LPI/island
>> modes, and aligns the driver with common ASoC runtime PM patterns used
>> across Qualcomm LPASS codec drivers.
>>
>> Keep the SWR gate runtime-PM reference from SWR clock enable until
>> disable so autosuspend does not gate clocks while SWR is prepared.
>>
>> Add a PM dependency for SND_SOC_LPASS_WSA_MACRO so PM clock helpers are
>> available when this driver is built.
>>
>> Suggested-by: Mark Brown <broonie@kernel.org>
> 
> You added this tag, but was the entire content of this patch sparked
> by Mark's suggestion?

Apologies for not including the Reviewed-by tag earlier — that was an 
oversight on my end.

Thanks
Ajay Kumar

> 
> Konrad

