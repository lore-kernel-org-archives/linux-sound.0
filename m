Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC663D47CF
	for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 11:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782215971; cv=none; b=izVlozmQ2Bfoncf02vN8zp0x5lretLetDePq7XAFM9Ridp5/VLT5c5TqxguDwGye/1s9n6xhqi4UJMtKiT/QKsRHMf3A6/siVW6VKUEqzILGkuue+e5q8mghC27dSgoetvImUKR35tE4JKVVJ3OGOX7mPtbK/OqiwjT0BaKwLJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782215971; c=relaxed/simple;
	bh=N/3AVGovt15f7wbdWrYGPsjnPnBLGdx20x+VTIjeCAU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YtgJLRRIqoQxThzvStJhh5tJGPltGi+2QvbVcn3oA39P1O5HYMVACO0gzsr3cIeYeddx7p/J4pX2LUzHOgdC5d41shclp+XKoeVOcNajkHX0mw3xzQKMXvgNT5qbJHS9aSBFXU5r7gZ9uR5ExsNsnyvAfcJ7Hcfj5H6wUweo6OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XoE5k9vi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jU8+mOg+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XoE5k9vi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jU8+mOg+"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBZL6L4017099
	for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 11:59:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AeDY1Z/tgJlpDbX7IPSk/ptAPNQ1w+OnQUXLRd5JDUs=; b=XoE5k9vinZh5Yvv2
	OO2HBm0lodKmCxTYcaA+Br6B9oBuNGJRqr0ri5m7si1tBZZZmdCEd8IzSf+pe0WP
	xAOJHibs9YDVhdVXPzwIlK+6/oPh/wO9JgHmT2N/heiY0NIizBRWUA5QiTV+FSw2
	HwAf921GPUZdFIVBevmC5H/KQIWO+m4Y83y1cUuUUOo3jSGPSOYHaU7Z9QhyGw9c
	DibnzKDJXwBxbMdOAg1hmDFYP3uinEAo/kUkqn9v0dPBRrwA9NAhqSCzxKQU4BmT
	Hs6PZTW/WL+N5535yUKr+8WRfp5Xf+lVjL9Ifxj2QbfCg3CfbP63vChuCPSfi47R
	/NF7oA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eygkjj5md-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 11:59:29 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37ca2bf8e39so6064910a91.0
        for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 04:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782215969; x=1782820769; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AeDY1Z/tgJlpDbX7IPSk/ptAPNQ1w+OnQUXLRd5JDUs=;
        b=jU8+mOg+wsgDCxfRcSSIKAwu8Ieh3TsCVRMkIALGveKbIpW/NW9Ht2zBotRfmBuSWR
         XmNEqoqLLJs3H7NrcRmd6iMOvaEeiRzju2p6kUK2T15UDSnLHp5Bf0WBG9NdGRYc5dcK
         pknzIcVQmUT/GVfz8ketSVHR07mRtAfsv0u+guNkVyDF734H+HsspJhH9GZWwp/YchVT
         Gq6waMtOyONfpOyEiJTs3ofrixok1Pvrt3GgdjFebH4/QoHTiuPSUJkERHqiVUtdxXgK
         QCtwuS6w4eHQkQy4WcsNphNbEdtWD5bBXQw2jVUt8o9T/2ozn3rNBPtEhe8a7Ie4V1G3
         3kDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782215969; x=1782820769;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AeDY1Z/tgJlpDbX7IPSk/ptAPNQ1w+OnQUXLRd5JDUs=;
        b=XuKBUrXqfdd+dzKuxbgqpzR8GHB6oKsxFJBdnYMnW596hU9YSQwkS972Wxm58afn1M
         gjlmKcw6yGg5YjOtYZOHw9kTkyAqZZepjCWZ5ycCos0RX37taAZLGI26ryn2aF2bXVrk
         Lf4WhSkBfKRjHK1ILzUwGty/c9ZwJdf2AH2F4IOr4G4qhu3O1D0dGGfTVBq22z1a7E0G
         mwemlyKRcOUyfIU/UHSIMYJql1VFra5TJXYips9g1J4JCRbWrve2LGfd8uiKKBzOrK/B
         TamDbRV2PNsqlzcJb/WSBKnRRmp/fjPsfiqbisRK1rpYFhd7OCbxWibQtwc9ijbTTsY+
         hKMA==
X-Gm-Message-State: AOJu0YzjhnF08uG4C6ihZo0QPmB8jXdLL+Me/499xSR+EbmVp8ENXZB8
	L6xbCdDWjIay1M3JjqsA0xiPkk2A2hDTWSU1grigvapGzIfrgdq9o3purmR4WM8CXYpG2J9L6KQ
	2MHmpErQYsNiIL7C4R54DV9V9yeFb6pHwrOnROiYJSMy6czeRLhdalGew6/huL07E2Iv9c6YjKA
	==
X-Gm-Gg: AfdE7ckMoNR2otB3MuXy4Gi84w52p9eZe63xlszNIxTXcbdX2bhrmfZKV85HVnDLQCR
	u0sGW3xmPpVeDSV9Mxpbb6eEHhMpBkrP4O1kAlzfLzFOk1WnwXlKKSH5HPWmXyuDzmG9CWBBo2/
	gUDKUB4hEuYHZW0HiZVqtwxTMjqqz1+bnnobJJX83m+UE3MJusdalpjWRlh9CQD2Q3kuwzaO9Tp
	ML2qErWnHezJFSuhn/l7TrYKbaJOgMdYVrwOn2IvxIPgoqgOM8/NAK8bXJMb7b634RC4PEtUe+0
	vGeTanrSbxwvt9Efw5rZxTFoXeDkodlDlYjnoW/OpJVdkLIbdmYhNEOwWWvKb97JKgBukqaDOX5
	OA18B8aJGeUZgX4wPzdIGgu3EOLF9ewpKBFXYY+8=
X-Received: by 2002:a17:90b:4a4c:b0:35c:30a8:330 with SMTP id 98e67ed59e1d1-37dd15bf1b7mr2558290a91.0.1782215968759;
        Tue, 23 Jun 2026 04:59:28 -0700 (PDT)
X-Received: by 2002:a17:90b:4a4c:b0:35c:30a8:330 with SMTP id 98e67ed59e1d1-37dd15bf1b7mr2558262a91.0.1782215968224;
        Tue, 23 Jun 2026 04:59:28 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d4f2d2702sm10091200a91.12.2026.06.23.04.59.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 04:59:27 -0700 (PDT)
Message-ID: <84167531-b252-425c-bea5-49992a9c4500@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 17:29:23 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] ASoC: codecs: lpass-va-macro: Switch to PM clock
 framework for runtime PM
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, broonie@kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, srini@kernel.org
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260623071708.2822269-3-ajay.nandam@oss.qualcomm.com>
 <89c4fb14-9884-44a0-8921-fc361a9303f9@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <89c4fb14-9884-44a0-8921-fc361a9303f9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA5OCBTYWx0ZWRfX4jmDA2eGFr+E
 sxeFTEeKFKT7oFcSk4LoO/1qVuBtiiAvFvKCGjRMk8E9AbyFbnLHEThnLsMpjzf6Iy4fAshoXqW
 0z2cX9P/zLmrFwuddCK/uPfQ0v/GS2brdutyCFrvkz069081TOpKLdcosyyevqUVGbOq/X5OeR1
 Hgoy/0ImexIezLEtEpNiUGKGe05PMAzQFhU2+RPutK2eVd4WHxoKrfc5liIrOvNs0r72ariXTl2
 utI1q2oBdkNoFIUdNeGwa4QWIRfUbgBpLPlq6lXDSqd+ZP5uAbXLxHF1oF0fTMuujKqAl09CEU/
 oQ81JUNJBevBr9m9lD0WQDPbo797xIn/1pKiFEZMWMRk1CjONXxKB7GiX2IomVhy2IcogoIJ6e6
 uNn/mOzABQepkKP5UxYWigvjoMfxtUcD4x6QjOD9jM7O9DuH7vEjYghN3NiuPYnjQCyAuD+z6Zp
 OfYyEMAJonqnqRNhOpQ==
X-Proofpoint-GUID: fACEl6352aQkXnutSQGOp1PN9q5bK8P0
X-Authority-Analysis: v=2.4 cv=SoKgLvO0 c=1 sm=1 tr=0 ts=6a3a7521 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=dF8yuam3Ay0lu1q_4Y0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA5OCBTYWx0ZWRfX35CKq13uxa3z
 qXpGlhumzaU5RjB+NCJollQhzKMnUmxrZspM7/qbQssOqw82SLyZ6116Gh/E9MGY8DWvRC8EZG7
 REClRRd5l1EPfzF7DqSoc331m5hbguA=
X-Proofpoint-ORIG-GUID: fACEl6352aQkXnutSQGOp1PN9q5bK8P0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230098



On 6/23/2026 4:09 PM, Konrad Dybcio wrote:
>> Convert the LPASS VA macro codec driver to runtime PM clock management by
>> using the PM clock framework.
>>
>> Replace manual macro/dcodec/mclk/npl clock handling with PM clock helpers
>> and runtime PM callbacks, and keep runtime PM references around fsgen clock
>> gating so PM-clock-managed clocks remain active while fsgen is enabled.
>>
>> Set autosuspend delay to 100 ms so PM-clock-managed votes are dropped soon
>> after idle while still avoiding suspend/resume churn on short gaps.
>>
>> Add a PM_CLK dependency to SND_SOC_LPASS_VA_MACRO since this patch
>> introduces PM clock APIs.
>>
>> Improve failure unwind paths: handle runtime PM put errors in probe/fsgen
>> paths and restore regcache state correctly on resume failure.
>>
>> Signed-off-by: Ajay Kumar Nandam<ajay.nandam@oss.qualcomm.com>
>> ---
> [...]
> 
>> --- a/sound/soc/codecs/lpass-va-macro.c
>> +++ b/sound/soc/codecs/lpass-va-macro.c
>> @@ -11,6 +11,7 @@
>>   #include <linux/of_platform.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/pm_runtime.h>
>> +#include <linux/pm_clock.h>
> includes should be sorted
> 

ACK, I’ll fix the include ordering in the next version

> [...]
> 
>> +static int va_macro_setup_pm_clocks(struct device *dev)
>> +{
>> +	int ret;
>> +
>> +	ret = devm_pm_clk_create(dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = of_pm_clk_add_clks(dev);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return 0;
>>   }
> Can't these 2 calls simply be part of .probe()?

The helper was added to keep the PM clock setup isolated, but I agree 
it’s simple enough to inline into probe(). I’ll move it there in the 
next revision.

Ajay Kumar Nandam

> 
> Konrad

