Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FD5361DA6
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 19:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779477561; cv=none; b=XVutHaiWcqMJrmgn35QfRMaBTPAdl56cdG5rgvtlVNpMX23sdVcyNL9dsom8QCouRiNeyM2s9BPxvwDg5M+qBmPvMoN28ETYq+IIkMk2nF4uEGqwSgA+gV0HgOROnfOFvHfY3UEfRdGlFA0o/OFb26V/jx60/SLjjgZkwufLk5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779477561; c=relaxed/simple;
	bh=+ZAe4tlkZzKHX7X5t4615D1xJnFK4/IiGNoeCQbEOV8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qi3KL5QJEVQHySOTI9d4ITNwM29CD5jsKYGF1ZAe31IuuPRR1CyDkXRanb9ehue+ZnOvC/8LuHOkacAag3612ZD4ydcg2V6NrjkGiCaiLPLR3YIzI+xxZKnWErSpzGc2gA4/58kivJ9R/AebGXudXNEXNzxHS+Eex9Uyl5GAniw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OclHh4hL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QW1sLW91; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OclHh4hL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QW1sLW91"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MG6QK41816083
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 19:19:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3O3CwZM57IGqkScx7N1v3lEW3tORhTFbt3uo4B8zhv8=; b=OclHh4hLa8vNZEM3
	pQ9Ut99azhlVHeNmeXNU+nWxBQMau0YTx4PjZ9NedKXexMDFAln7nyabkNSw8yTu
	EJHyGAeCmkbkfN29E+65+m949EWXFM64nSo1/AbwommO14gALlWkWFkuKAXjvZ1Y
	NU4mm9tW3aB+Xi9bVFNxDCc0CeeRR6NXqZOF0YWvQEx04Bfiw0fOJ0QKCdHKTWtf
	FqFAuTMqwl6RVRWSLHMCOOiPWPSNq5oQrC1IhdSas58wmKTlu6/uoi3wQCdsHpqT
	dLO8ypeXDsYvHKzjrf5dneicpeBxci8I/PurUOZFY7PC60Y6ImTKNEww9DpuBZ74
	8a7y4w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eafrm3gh2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 19:19:13 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-367fd7b8825so7605201a91.0
        for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 12:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779477553; x=1780082353; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3O3CwZM57IGqkScx7N1v3lEW3tORhTFbt3uo4B8zhv8=;
        b=QW1sLW91BYOjBhieYv8uvLkKLufV5uZfV2mfjTVwPAvBHxMsVRQuwqvFQykuBuWZJS
         Tcelu1Dpb5AmamkkQ0LByd5u2bQ9A/xz2gBbayXwhPHcJ4SELyCWhLbFdMpCXC20zAAt
         mNX3GzvxlWoQg57rMXgyFdNC79Hr8dVVvyOb3fwDIY9V9qVQeZ/m/kS+72b2BYPN+nWy
         FWiLST5OchJuQdV61MAdKV7DoZ6eG1VEeRkKv7KlA00LG75Li84DjdddGf1XdUP2+nsn
         AE3ywTi3Fw6YiHA8OQJPEcSAkSRppjeqBJKTWZYnAqV+NVH3WXjIPxRJ9YoF8561ywDU
         Ff7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779477553; x=1780082353;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3O3CwZM57IGqkScx7N1v3lEW3tORhTFbt3uo4B8zhv8=;
        b=tC7mFJhnBEFNkSLx6mi328NfFaec5u5zlJAb5TWnroptuWtW3KK3tWi1J2MIOBV6bZ
         S9Dpy8Ubm4i+dnjYUCo2ufaFXYcORU3+gMmXHA3ZLUrV/nM1Lm8eGEgMaUlO9UJkJPuY
         PG6IpAn2XUx+OOI93c+g+6jmveEpgvw6R74MOgkqZ1NMKfx870Ku6OpGEg2wqdIV7wLz
         2g6xHlEMuGqGOTtMe916wLuhZ17WNC8gUSCQpTclRWH0lhYMa4kvOrwFqfEpEAJB/Ns9
         fm+9y7NT+Wlbz4tyaYcEkfp6tSora2kWuzN7pKpfVeRsjHjgqwQPOgH3MJgxidKwJvPj
         EMxA==
X-Forwarded-Encrypted: i=1; AFNElJ8p6CyvG2G6OKP5GxvO81i++Y5DOA3DfX78mn1XDqWfpc6PMJKgVgH4RYZAbR0wwTcxHDC+XH4rEvF9sg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzN7Vh46M9qhk4f46paDkNszgUvu5p0rssp7qD1cX1lksDoru80
	JEvDGaSxrW8jPZTu4c8wcHzidTz4nCwu3hLIHsDxmxUk6jc04m96/pcT//f+Xl48de6vrAh1tI9
	EMBa4kYBoECMr3cOdqU9su7ni+imvq70FQCDM5id3mF0Au4tXLU24IlAo3yQjCGxurQ==
X-Gm-Gg: Acq92OE0tcWs31T8M+fFP5Af9abkrmOwpAwjJtdHoxd9QbNmKyC0gluqc/ZHkBHQcY1
	4XmXfqF8Knu/NM3YL/W55DK463ot+HG3LwoLu+FRnpewk+HuruLFGeukq6aYPRMNMlZDFydfaDB
	jsMaSvD4K+rakmFq30Iff3yScLcvK0Lw2CAeFV5X46aF08yipBa89yUWW35jAjkUemVZ49tkmE1
	tfiMmxJ3QDn9MVE/H2QmTkrmdM4WEVOglsXBysqPQZICv6+mpimwg73dMVSH4VSTxJF6D4MJ4Bf
	0ZFj2blVmYEqEWsvuUzkREB7E9DLU5xStE97IEjjFhe9eZdbyr94NMaL0FZv0G2XZY28+ZgeC8T
	ync3VAFx5dixr2/sey+renHQbJIkkJLPDDJRM8Iupd/g1VT1DVQ==
X-Received: by 2002:a17:90b:4c50:b0:369:bddb:79bd with SMTP id 98e67ed59e1d1-36a676c6a95mr4836873a91.25.1779477552862;
        Fri, 22 May 2026 12:19:12 -0700 (PDT)
X-Received: by 2002:a17:90b:4c50:b0:369:bddb:79bd with SMTP id 98e67ed59e1d1-36a676c6a95mr4836847a91.25.1779477552393;
        Fri, 22 May 2026 12:19:12 -0700 (PDT)
Received: from [192.168.1.6] ([223.230.21.136])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a721282e7sm2599195a91.0.2026.05.22.12.19.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 12:19:12 -0700 (PDT)
Message-ID: <675fefdb-a9e3-4eb3-abf9-65ef8f104603@oss.qualcomm.com>
Date: Sat, 23 May 2026 00:49:07 +0530
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
        Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com
References: <20260522073324.e18bb240b6f6@oss.qualcomm.com>
 <20260522130459.3411038-1-ajay.nandam@oss.qualcomm.com>
 <0c408230-61cc-4751-938a-06e715744c66@sirena.org.uk>
 <3ffcf6a0-e975-4eb4-9a4e-d6afb583e0b3@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <3ffcf6a0-e975-4eb4-9a4e-d6afb583e0b3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: JvvySt-NHq0V1doAc_1SP48zap7OKOTm
X-Authority-Analysis: v=2.4 cv=Zekt8MVA c=1 sm=1 tr=0 ts=6a10ac31 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=dyxLLOf8pC0bdfPLpLFr6A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EXL2SugY_77LC3pzBmYA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE5MiBTYWx0ZWRfX1WI7pMm3YS61
 pfjloR3EbGiLUKUwMQTeqMTf5Tr5a9K4YPAXlAU75h/YwnGPsoVfusyQObuOifjbrDuJLyf6Npl
 RGJ+i/+XxABhVfo8FxqPXwOrtPEn1A/KO4abmRi/07K4N5VVFFijOd8sMonKuqxU9sWipKQvSex
 Eo+8X0ba4eaIEiN4VQMRDl00M6DUEhG0xZGVeu8/ppB64OSMgGP1PgehkE+ejGXcuI08yn8cS9x
 tG5dHIA09+62Iw+mT+BvhqCd02RqvLyf258fSd4br52wpkuzcuXgNUEs7tdt5t/PGgFkFSDE4Ob
 2q1JEZyuJWpIa45G70D3dus4wEi+vAWhgkE2AEYlFJxA4pEnCiaF756ZosE1Ri5eOub2ifdsa70
 OukwEEptNiphXrwGmAyOjjXrHjap4DL/jAH/WwgnVUo1102VGJeEocr1KvC2MPOciNKOSp3IkjA
 sqm8lNwg9mLKFUhfaew==
X-Proofpoint-GUID: JvvySt-NHq0V1doAc_1SP48zap7OKOTm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220192



On 5/22/2026 8:07 PM, Konrad Dybcio wrote:
> On 5/22/26 3:17 PM, Mark Brown wrote:
>> On Fri, May 22, 2026 at 06:34:40PM +0530, Ajay Kumar Nandam wrote:
>>
>>> The driver now relies on pm_clk helpers and runtime PM instead of
>>> manually enabling and disabling macro, dcodec, mclk, npl, and fsgen
>>> clocks. Runtime suspend and resume handling is delegated to the PM
>>> core via pm_clk_suspend() and pm_clk_resume(), while existing runtime
>>> PM callbacks continue to manage regcache state.
>>
>>>   config SND_SOC_LPASS_WSA_MACRO
>>>   	depends on COMMON_CLK
>>> +	depends on PM
>>>   	select REGMAP_MMIO
>>>   	select SND_SOC_LPASS_MACRO_COMMON
>>>   	tristate "Qualcomm WSA Macro in LPASS(Low Power Audio SubSystem)"
>>
>> Shouldn't this be PM_CLK?  That's what the APIs are actually conditional
>> on, currently this will work out since PM_CLK depends on PM and HAVE_CLK
>> but the indirection leaves a window for things to break in future.
> 
> Yeah, leaving it as-is sounds like a bad idea

ACK, will update in V6

Thanks
Ajay Kumar

> 
> Konrad

