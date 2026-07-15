Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412CF44C65F
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 12:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784118074; cv=none; b=BriVdFvKyFXOL1HlB8KPF//qDQFoPJ1UYfGRkhrN073xLQlsqnXoDKHHo5kKySeGNguat2QeInl9s4mkVPIRDqk0Au0kY9zIjU1xmJN+EysrwysgjHCX3rQ7e5Th6i8zPl673tpWog9gLxcgft51ftFDfAHEZVHcyCtRqW1QwMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784118074; c=relaxed/simple;
	bh=UsJJVZgPYhuKiJKxmeEoL93b7KKYjSsAtMl1VKGYLh4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CC7EUzOcJYHDJYzGpotMS7nQsbQgUWlXDM7HnDpcp00ufyyemOup2MTSa/0EVZjA34jtgjioSvVZrNdLu5PMZHJkVCpu/Cq7W5SLlvX0IZbW2+35hjrw4bYgwwDcwXyVsxJFeokOXUDTFTAx6RDAlBH9OpUTJC9IWJ/mGh55348=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pHvrERru; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FBAFhXwl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pHvrERru";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FBAFhXwl"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBccC03479972
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 12:21:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Is9fHEtyP37b12SZvzIktO5He1n87/RqMhH8YqHC190=; b=pHvrERrut2Gz5hek
	1IV6OkrK5jZId6+Ke9AqSHdoWv9/RXB14dWpyzis1ZIAsxF7gTIXjfMEClEYr7yK
	pV5Edhzv6NRcsLT/T5hwNZ5hXhBbLwp2aYmFj+bJMw+LkxrDyLKafAVPJ84pVgXb
	ZwfL+dO88+sPB2+9mR53KWsn9/K1jdEu03hAjDIQEoeu9+JL9FM2ykQwOYO16mmK
	RmUSILEISflLCCNKOA29zBUeMwI2p4MlA+cDJkeFGebsq0phTP2gzDjYP5WVTPvx
	cffaOmNA+nbCYhr37s5pEyFd7Jlv3kflxylvS3FmOwJxO+kCVAogd/cyQLWwZRrA
	/eiuow==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe56h99r2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 12:21:12 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-385d2703b64so749949a91.1
        for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 05:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784118072; x=1784722872; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Is9fHEtyP37b12SZvzIktO5He1n87/RqMhH8YqHC190=;
        b=FBAFhXwlumbkrILlGJwZpTQZV/OJYwRTStN/k8Sot/y70DLr8JlLwLPZQ+fwALkK0u
         aEQ6uKNtSr17wYF+ScRonhjPIIsZfXOZKCMTrtrWJdw/stWjU+aL9CL8iEPh5DA1jEx7
         lUPRQgK76gEkgoQxLrGHr9BO33kn2GxPh2KoOkV9aqcU1rS2TOk4LkY+N/nSoV98ipCs
         1z6KUutQl+F7rMDUw9yWBQvl9Xz1vTmFWozs2VkHNz0OLTxIfZxQB4wCe9gjCgdDaDFA
         pf0Y1sgZ8/OdC6lVCetWJ1pBTg7tzLTLY3Yp1sZFFElid/dwXF3x1rICkE+BzSDnA2r/
         6vwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784118072; x=1784722872;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Is9fHEtyP37b12SZvzIktO5He1n87/RqMhH8YqHC190=;
        b=oXGQuNdeSp5Q9ElRFyMnqZhiBXEd9nEFQ9f3elPT6+c8Koetbb36xzIARlTw6EuQ6f
         ZwFTUbbb5SL+nZd/8p8yrlMyFDxT+ZZ6dA8TzlZIylWVMZrkUB7vrvkgV31f9HB4H2CT
         2yQJb0DI+iNTlwMhrLIceeqkYX6g0KwWCrOdy8if27dyJUa6cGO/NXoyNPI7bSC4Rdeq
         iQ4U5aOkQQqY5/188N2VNPoZQTO/wumhIu+td/vLY2Ai/SXwh9WB+L3I3L+ENpo4t7Z9
         YLgSzXrHIjflcqjG/lm/RePjuag0fcAyoqK0s56giUGamdeDdH4+nGj3cd9VZOW7zD+G
         bVkQ==
X-Gm-Message-State: AOJu0YwsECX4mKYIb6YmMhNEw/hybTmnu6s664j59CRGIrYq50Hcx+qo
	bSziZzW8uf4RnRVgo1jtbIcU58QEYwMZ6hymkv3qQGMCa2hfIMb/7qiyeoEKtZ1RXAEe/oJVs9+
	CqFNQAX2eYWA9NbmtntYtVsoRAQ0ZN7lgRB3WP2ZI+GHi9f3Yh3qu8GAfd7IUap9Xkg==
X-Gm-Gg: AfdE7clYnNSMfUDZd7YrWouOy10ohoPSKtA+qqhRcg5/1GS76zrb8kG0Pe+xYAT7mlD
	68DUpnpVPmfw1/jLwzwiMtAXLhc1/dKJTinBS4VlHd0w0Kx7xrXLhpp+mWxgk5aaQ21F/EOgsiH
	KMNWwhfY7eXP5cJ/z66ZBZJP46YZR4u/VFa1EgR4CjC1Xv9/+pSP1KHo0R51fjiPZkQYMt2Lk0B
	9IGSL/vK/nto9OqLrwdwPBYEOO4UBFbyk4KnfEovLmuMgPcC61twVWI2BcBBC1QBDB6EItyjs5k
	9oWxYb4SGCGjGvb3S4ZilFOMOVi5osH8BfeJ2u7SbcvXmqofNqEGouWwITR+/Ki8uNYvfGaq7KW
	MP0QyZAZg1334D3dGLiNdlwEHHtVmcYrug1o2rIE=
X-Received: by 2002:a17:90b:2248:b0:37f:fd70:6790 with SMTP id 98e67ed59e1d1-38dc81c1b09mr12439684a91.9.1784118071656;
        Wed, 15 Jul 2026 05:21:11 -0700 (PDT)
X-Received: by 2002:a17:90b:2248:b0:37f:fd70:6790 with SMTP id 98e67ed59e1d1-38dc81c1b09mr12439649a91.9.1784118071023;
        Wed, 15 Jul 2026 05:21:11 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e6a714csm1089114eec.14.2026.07.15.05.21.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 05:21:10 -0700 (PDT)
Message-ID: <7b8bdb1d-d626-43f3-b02e-a92132095225@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 17:51:04 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: codecs: lpass-wsa-macro: check clk_set_rate()
 return value
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20260715-xo-sd-codec-wsa-va-clk-set-rate-v1-0-f0c713ff0b4e@oss.qualcomm.com>
 <20260715-xo-sd-codec-wsa-va-clk-set-rate-v1-1-f0c713ff0b4e@oss.qualcomm.com>
 <2bd4fe2c-a42a-4fac-b82e-0c683da5c9a0@intel.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <2bd4fe2c-a42a-4fac-b82e-0c683da5c9a0@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEyMiBTYWx0ZWRfX1BGvmsA902Pb
 JaUk6WVrgNZ/fp6V9VR+trNSAJYiikrsnrk6ZSCOSgFkr7Y1f9V2VDLYVoNipTp75y9T2al69NW
 EXb7kfMN7BkIJYpAZ6Aw8le1ggaGh3M=
X-Proofpoint-ORIG-GUID: ZIXRJCNcSdr5o5rBfEsEzy5V-DkaKHAQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEyMiBTYWx0ZWRfX7HUZlNBsex7V
 R6lGODa14lkC1KLvWmiLTJ+RycoYWJIJrr40J5Bb13RJkkkV0jJEtvJ6Ko0AeR8VbDOeQnntG0F
 V8HKxm2tHO/nt9Gl8UZ0FOgzE/FuAT+sueUwL5GfJEuwSeeE4Kz6Yr8lrB2WPShwq8tTaqk/7K9
 NVz9TC2uKicrVtmQbS6xqSuqWODRl1XQIatLKcJVhkDU7OquCQnYSkpJeQiphOtXYMTut5VtSbG
 oxgnLHDTlqvEruuHUtL00d0n72S2tr48KkAoInY46oFfKiBtZR/ABSMpD1u0R+T6sQntCvnPTu1
 kb4NX6eHO6dbSN+J2WsWAbjPFy9aSpM3N5DcMtBTkQfjha3+AFuyMXc5MnwbnKH5owy9BWyuSpL
 8vrFL4Njw9LzuNoxBlRxaxiXyWWu3rX9O+7G9AC9e7s9CjsVC44yWm8zTY5mWMZGC0DBaZX3e9a
 9aIgYzpZHBpRgXROh0Q==
X-Authority-Analysis: v=2.4 cv=LpKiDHdc c=1 sm=1 tr=0 ts=6a577b38 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=M4EMIQaL5TwLBXTeg4IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: ZIXRJCNcSdr5o5rBfEsEzy5V-DkaKHAQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150122



On 7/15/2026 3:03 PM, Cezary Rojewski wrote:
> On 7/15/2026 10:29 AM, Ajay Kumar Nandam wrote:
>> clk_set_rate() returns 0 on success or a negative errno on failure but
>> the WSA macro probe function was ignoring it. Check the return value and
> 
> _is_ ignoring it. s/was/is/.
> 
> A patch is a proposal, there is no "was" until it is merged.
> 
>> bail out of probe on failure.
>>
>> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
>> ---
>>   sound/soc/codecs/lpass-wsa-macro.c | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/ 
>> lpass-wsa-macro.c
>> index f511816aa4a0..fc9e0a37c042 100644
>> --- a/sound/soc/codecs/lpass-wsa-macro.c
>> +++ b/sound/soc/codecs/lpass-wsa-macro.c
>> @@ -2773,8 +2773,13 @@ static int wsa_macro_probe(struct 
>> platform_device *pdev)
>>       wsa->dev = dev;
>>       /* set MCLK and NPL rates */
>> -    clk_set_rate(wsa->mclk, WSA_MACRO_MCLK_FREQ);
>> -    clk_set_rate(wsa->npl, WSA_MACRO_MCLK_FREQ);
>> +    ret = clk_set_rate(wsa->mclk, WSA_MACRO_MCLK_FREQ);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = clk_set_rate(wsa->npl, WSA_MACRO_MCLK_FREQ);
>> +    if (ret)
>> +        return ret;
>>       ret = devm_pm_clk_create(dev);
>>       if (ret)
>>
> 
> Apart from a nitpick in the commit message, code looks good.

ACK, updated in V2 version

