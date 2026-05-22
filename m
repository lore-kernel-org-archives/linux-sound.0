Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9887036B05E
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 19:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779477508; cv=none; b=tV71wWFkYMIzly+vgFz9zrFirJaccMHNrCPxlJcy5U1DKGyl1HAXWLY2VNVYHQ0Do05JzVF+l7LnMybVrQ+z87yoeEd/O73YxdUNuMe9OphOLTkB1JV1fjrNQz2T+Hu0xu/ZucKjGnc+QfI0MK73MNFxyeh9m+frR8MY8eQ26kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779477508; c=relaxed/simple;
	bh=+M7nz02sQlaSb9wXgPlogCaUPVFoVHtTVt/irwnSluM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DoWdAJEtcaDu5vSh25y0Md1+LWRVON3U93lryirN4VOLIxtvKESyl+YpclojBUAS+NIH2+2GIgjwmvO/1oHjtqcUMDRuGs9+LZx1hLBzxmCatkedAiqmoDFYL4HI219t70teBEZu/gHWanPcbVF9l/e2VUlXzBMpLOj3jDvOayQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YhOWlhPz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zlk5My65; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YhOWlhPz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zlk5My65"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MHfgJN3601306
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 19:18:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yfeBdn9I839cIzTOxhmlrtqQXwdT6JRrFiSz3uU8HCA=; b=YhOWlhPz7Tiwrvzq
	Ws7v2hJZsA6WcU+1/L0HmDmpH45ppQdfXCkqhHQR1BO1pJXIsAMtma9wtzIqQsXx
	MuwxhI/NSQSuiSri+fb+vZXLNIsHBp0jFtQL93KK4bEF6XV6kVI2vgsMcUgEVeVW
	3EiU9sFdfF7U3H46r3PiCvi7kmqyotp6QytdKLg8m1dA4A5F5nCJyd7T2TXKYBZh
	aqUUlbozT4njPvtjj4IjSU9CsMLQ29aPfWujyYVLFFsHnextvVMb3qVpmx14hDoM
	5RmHkfLsJvM1HgvO0o5EGaEakyFcZ9FCFHBufImvUg+WB7QkcAU0HGJUcQGlZT81
	jga1xg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eaury0abq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 19:18:26 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3662668b825so14890586a91.3
        for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 12:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779477505; x=1780082305; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yfeBdn9I839cIzTOxhmlrtqQXwdT6JRrFiSz3uU8HCA=;
        b=Zlk5My650i3WGv7CDWIjX5WvW2TElx7oxPsX4HUrDTslSQPh/X4GzrkUKROBgCRuDX
         dUx7ZRFM8VgnyFQ6B6RnGGCNgJ+zN9G/ns7B1w8tZ8LKIRLiv3x14o7YmS1L6TIUCSXT
         mjMSdoAfx0JMaF+dKEnV/8q7CZjMxmEDVJuQTgLB8fi8VgE+6hjmdOstrlCu2KgjGU4c
         QAtqoA2rD3PUjUbxLLj0WZ3u0OEJ6MV3DKMI9wLm0Rak9uA+p05pX9gV3oMeWl8bsEha
         SpBiowN+bLxFRWz7vT496fTL7L3UuvVZEcYDT1h12KQJZAD/vEApj72GF3B3kEz2CU1z
         fkwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779477505; x=1780082305;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yfeBdn9I839cIzTOxhmlrtqQXwdT6JRrFiSz3uU8HCA=;
        b=m1dykMm9z/IDXbPA0rR5tRnLYdewv9e9iA2PGEpO+ct11pRqpbDcbXthbWFDSsfXbL
         3EadaZdgcFH08p5LDwRoTnf6U58oaBzgzCwNexT0Fz8ogliidtJvhSG/xnk7PIUiswYN
         GUE0/YZ3UIEy0BZTbM7Be9vxdicvKi4N+5PUANutMmURnMi/OODv1yUr2S6i3DdJMnuU
         oX0JeAYHCaux+Vu5xnISXUtT/B74iEKSLYopmQJZPoyAQ44Y3PGVm6bNbb1zywcN4SJP
         X3CuFblQUiS3U8X8KOwH+U+MBPKry/tfQK7BTSNETy76KwhYO08QpMrl6aR79GAe1a3s
         4dZw==
X-Forwarded-Encrypted: i=1; AFNElJ9c7KiQY1/nUPi+mE9lm5/s/fYsd4JmgihWUr4elGnno0eImHpe5MvPvN0druHiWTn1TZftErGZRAS0rQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyRGe638wWliOxaFu7pxRgULBjVy2VN24FB0Kmyy3QjAsc6H8H
	SJUrUcl79z7Gr2PoJiD45aaKUtlnZqWocrhWY2r2YNGIAtiZRSPrysr9kI+pbi5cFNkAEZwfadj
	naULF3+hex2HqzKMVqg8IUT+HtPuN9PFBFXQMAVh+xqFOQq5e3voBkoCeZs4sJ7l3Bg==
X-Gm-Gg: Acq92OE3dmDiZhiaKRWMB9yQ2hA1v4mRDq1L55qGmEDyxKBlNg1yWUcnoVNL7YOcNfj
	4krD9TntF7R6kPM+q6mCVTRwl7mnviI0ppsZD15h/pADq36JCsZ26VcQ8O0luk+pGGTfozQLsjh
	uA1DHLE/nS0Z55IaWO29hUS5A5ae9TVCSXQOOfuVdXtLW3HGO5G3gJZXdm971OdCcKnjrmoVRlq
	OPDuFDyRcAis43YS7RwvWdpAGUVaa3yntKulLCmZkH+hHn+x4TorUIS9kXZ+fHOzk09+V5Nf9QC
	lojEW/d9l+qsvcbQdvkbUoqheKVkvD3nNABltVEscwrT9t9mA+OjK5oyWyZAynLBv8+aGNxG1OY
	z8UQBIXsoN65TrL25tWQWzXzckXiaSVPelVspc1ptkGT1pIZAC3xD45sYfPtm
X-Received: by 2002:a17:90b:3d09:b0:367:cb53:7435 with SMTP id 98e67ed59e1d1-36a678478c0mr5065136a91.24.1779477505473;
        Fri, 22 May 2026 12:18:25 -0700 (PDT)
X-Received: by 2002:a17:90b:3d09:b0:367:cb53:7435 with SMTP id 98e67ed59e1d1-36a678478c0mr5065109a91.24.1779477505007;
        Fri, 22 May 2026 12:18:25 -0700 (PDT)
Received: from [192.168.1.6] ([223.230.21.136])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8520560ff8sm2218068a12.24.2026.05.22.12.18.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 12:18:24 -0700 (PDT)
Message-ID: <ab1a5b2a-416f-4c0e-9384-ed0ca536d1c0@oss.qualcomm.com>
Date: Sat, 23 May 2026 00:48:19 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] ASoC: codecs: lpass-wsa-macro: Switch to PM clock
 framework for runtime PM
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com
References: <20260522073324.e18bb240b6f6@oss.qualcomm.com>
 <20260522130459.3411038-1-ajay.nandam@oss.qualcomm.com>
 <0c408230-61cc-4751-938a-06e715744c66@sirena.org.uk>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <0c408230-61cc-4751-938a-06e715744c66@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE5MiBTYWx0ZWRfX35I4njmNAEmM
 tAddjO9MaPvL/hoD+t36Uo8y8bEssocYzBCu/Xa3g+H0FL2+TYVM+wOEmJxwbiYbR5fSt9DEqL9
 Ku68016zxTh4p0TABtVgSvsDLu6MiqVfA8g+2hyh2zTebDNrn2Na0VF+tszqZR++O3JlhS0Puv5
 BmV7ewTZZo8mgVOuSoDQvp6nQ41BzPNoCcZa0hzVgrb12/cJkyYK9c4s0HjCXa7ngo7QEm4hAQv
 CN/07x1ven0QnQL2cCsaVtnre6rnwkVCvAymsOHmFBo/sKQ61a3ig4GRkyNocMS05YmhseEt+27
 RfJdD9qlDpvCulb5TXywseo56/vTvUhd5nzZAbd1EJioMDmc5C5MKUMh5ga9weZec/FvL0exA3j
 ChE+pcTYvdFhqOapejZo/aiU1hQGrwrzwQbZqgGxpBkWIDXK8kHC/kxIy11zrY3G52slbpbnlph
 PyGQ6oogQUWYtF6KzHw==
X-Proofpoint-ORIG-GUID: UPoOGXvAy2zVnMRMQUgnZ95i90QAtKn5
X-Authority-Analysis: v=2.4 cv=d8fFDxjE c=1 sm=1 tr=0 ts=6a10ac02 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=dyxLLOf8pC0bdfPLpLFr6A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=knVCPYfzRBhieiZ2OR0A:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: UPoOGXvAy2zVnMRMQUgnZ95i90QAtKn5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220192



On 5/22/2026 6:47 PM, Mark Brown wrote:
> On Fri, May 22, 2026 at 06:34:40PM +0530, Ajay Kumar Nandam wrote:
> 
>> The driver now relies on pm_clk helpers and runtime PM instead of
>> manually enabling and disabling macro, dcodec, mclk, npl, and fsgen
>> clocks. Runtime suspend and resume handling is delegated to the PM
>> core via pm_clk_suspend() and pm_clk_resume(), while existing runtime
>> PM callbacks continue to manage regcache state.
> 
>>   config SND_SOC_LPASS_WSA_MACRO
>>   	depends on COMMON_CLK
>> +	depends on PM
>>   	select REGMAP_MMIO
>>   	select SND_SOC_LPASS_MACRO_COMMON
>>   	tristate "Qualcomm WSA Macro in LPASS(Low Power Audio SubSystem)"
> 
> Shouldn't this be PM_CLK?  That's what the APIs are actually conditional
> on, currently this will work out since PM_CLK depends on PM and HAVE_CLK
> but the indirection leaves a window for things to break in future.

ACK, agreed with your statement will update in V6

Thanks
Ajay Kumar

