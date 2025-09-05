Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9881805A
	for <linux-sound@vger.kernel.org>; Fri,  5 Sep 2025 11:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757071735; cv=none; b=fIBNm4tR7WrbYFKT2jU3tiL+EbnauD4FlhNZ9r8fHyXxEypsixVUmBK8kxYP8Pjym4R8E2zRxfET3PisI3ha4p45V59p545BZOqY9Er4yJQ/aD2JZUQWatWGUouW/5UAJbWKghLvpysUjfLjg1E1UWXhqIZdEVhOJ6jjW9MyDfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757071735; c=relaxed/simple;
	bh=3ugSzQ8mvx7yn8q1JvCBgipigbi+7LXFxjkVmnr/LK0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Karskv1Mf14uD/tr44M1uavvlU5WaQVUdM1gwAgr62hNGMDbtupXOk1NGh6zaT/G4bFNU7jpMvzdQ8GhF32SQYjzY2YmK+J5bKcmhtcr1yvBHbis+a59741/sKkkClTS6cHS+TGCpSdATeK/WddBT2x377eGMgIuWmNy+x0eYjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S2zS+f7d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S2zS+f7d"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5856h5Oj023074
	for <linux-sound@vger.kernel.org>; Fri, 5 Sep 2025 11:28:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6doEwX7B7ZWbprEQ9MoiuAdrhDwCLb/kSHRWBeUn8+s=; b=S2zS+f7dm6Ryl33w
	gRwg0Dd74Ijj9Oiq3y604bxa6dXaPtSVUEl4UxRChkbrQ4BRD90kxJ5H6I8CQDR5
	sqxP/cMBUAKZFsMlTQZsoVW64GGckIBflvE4b8wGDQgW7qpIVXmp5TrLid+oQXjz
	CS0foQya7UephyMqG6d2VVD2JF0kOPMx8y2vbN6E3KJkIcG/O8LV8IUML7GBirk7
	Fd3n4D9bNiG9Bsurrp0fWDWfiAXagTM+huY8J8ULPixmkylAxnFk6L0bAf/5Mpsy
	3aYvSm9eFEDpa1qJup/E7P5Vuw7NHP0VXX5h5J4RgFwHJGX01HnVy96sSXggi8QX
	er+R1g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0eu4vr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 11:28:53 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7741ef59d18so565685b3a.3
        for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 04:28:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757071732; x=1757676532;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6doEwX7B7ZWbprEQ9MoiuAdrhDwCLb/kSHRWBeUn8+s=;
        b=XOS6G/AIkE6+zmbIrRV+up/5lkWjg5xdW/cNBJ1qutiMeWlNx3s9leCYjJzubz547m
         b06HLE21FRVIM6tLH6U341PHVUn4kNznt6CpfZ2/Gt8wwc6TyO6fUDWrxpnqAaMx0p41
         aEWWdDqXrS2fAMDgSE9Q0bW4uKmLmoWQ4MzDNgd6VSWtGLU04sfQ3V5QAR4JTsjLWVSg
         qqUFoTliWBNMlPj2089IzEtwkVm9Cuk5sMPG2y+HkRC+pDKMC8sYAcypRDQL2e3umoj/
         Fnyh2CmSl7BuTiLvHcz+sSDhHrkBTyTy9uPeZWdFVp6lRYLzaE50gPSBZqhqN6D6pmwV
         784g==
X-Gm-Message-State: AOJu0YwTODazCOH8lNcSWaPowhrV5LUQI5UszESqggBJO9J/yuOnZFyv
	eqEcIA5gotnDAgZTtSZFhozJxx57l6tUnYk1+eOSL3x0H2WCzcLnojdjEqoe0HuZ+T+Lptg4f5h
	+PVYuXyMDF/6mjyGdf2Hav5B1B7TEhhS+MA0bZM7XSCxvyV1OwjU1JUBYrDfPs+vzl4eQXCan7Q
	==
X-Gm-Gg: ASbGncvF6xpvAWadNLfskD82dpQd1ekK1DqmxEUR3vCFBXAFlw0vgv2xck9xDMSTADE
	W0MQ7PsexVZ3nRXapAWcmMZ03RM8y686SqpNVnOwkiflWoTtn+L+KIP9ZeLcBEhiy4erjcJrLg9
	pw3djtHDmp0zoTXmscQCvXVPc04LlKaH3rudO2pgHC1/J6b+s21igduBairmZ65l5WwPMopuucZ
	G7iHloCveIo2zFuFP+GWC9OBA5wtGqBwIDi3jjS8WIsEt4IaiG86dhDo5inOoEE2WPdQteYkcu6
	FgHo1zN4LXmiWb2aLdj+FMNXA2IlIFYz2KToVNpA2Cbk3yMyPPYBq7lwVQ6QCJvaP4LlsgU4xZV
	r6vQ=
X-Received: by 2002:a05:6a00:3d55:b0:772:260f:d7b1 with SMTP id d2e1a72fcca58-7723e3604bcmr25696926b3a.16.1757071732601;
        Fri, 05 Sep 2025 04:28:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmc040gyAr2RK4dN/YRekXNfa1QiCwtAj8aUqPxAsXMK2YDB2EQlpTKgbizPwP+r6FMgGAKQ==
X-Received: by 2002:a05:6a00:3d55:b0:772:260f:d7b1 with SMTP id d2e1a72fcca58-7723e3604bcmr25696900b3a.16.1757071732064;
        Fri, 05 Sep 2025 04:28:52 -0700 (PDT)
Received: from [10.219.49.245] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a26abd1sm21340180b3a.8.2025.09.05.04.28.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 04:28:51 -0700 (PDT)
Message-ID: <0ecedbbf-4c08-416c-9ce4-64af42f3e215@oss.qualcomm.com>
Date: Fri, 5 Sep 2025 16:58:46 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] ASoC: qcom: sc8280xp: Fix DAI format setting for
 MI2S interfaces
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        prasad.kumpatla@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
References: <20250905104020.2463473-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250905104020.2463473-4-mohammad.rafi.shaik@oss.qualcomm.com>
 <b321019f-3ff6-4c6b-8285-77ca291492a2@oss.qualcomm.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <b321019f-3ff6-4c6b-8285-77ca291492a2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: DX4lxF8a0jpKBPDCGwMNCBqOoRT1Uf7i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfX462TnX2e9NBM
 LTOE6PRFtzAT93G507mj0xSsGs++w2CkLM2S7httuRvQd95DWJ53BZlzqW7pW3D6GnIwDxmYbhi
 +EdRM9RuiZqx0JZaEr6s2qtxbt/J/8JWTPg7mmPVhfH9Yu/M604vaXVk18BaBl78DfdEDm1Wd46
 cVAfQbyjLVNvMODQf9F5n2FuApWIYd54c6CnARR2sDPpdyDaGXlFfjNSOr6HlmaJffyP1GOc35E
 eRKdYNMso/YTrrSFxRvcwI3CaCGrU6irtQtnLMXndxkHK4eQPoW9HC8oPsiQ/y5rrocC+llmnbX
 GJhCxJpQXQnMaatyQl2mCR4MgdbkaMMIxP5aIYNF8xWa9EsgEnqelnPycshGSc51sOPGzl2E9sx
 Hf6stS7t
X-Proofpoint-ORIG-GUID: DX4lxF8a0jpKBPDCGwMNCBqOoRT1Uf7i
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68bac975 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=drAcfRgjDz_GiM-E-9oA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_03,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004



On 9/5/2025 4:16 PM, Konrad Dybcio wrote:
> On 9/5/25 12:40 PM, Mohammad Rafi Shaik wrote:
>> The current implementation does not configure the CPU DAI format for
>> MI2S interfaces, resulting in -EIO errors during audio playback and
>> capture. This prevents the correct clock from being enabled for the
>> MI2S interface. Configure the required DAI format to enable proper
>> clock settings. Tested on Lemans evk platform.
>>
>> Fixes: 295aeea6646ad ("ASoC: qcom: add machine driver for sc8280xp")
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>>   sound/soc/qcom/sc8280xp.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
>> index 73f9f82c4e25..2fd06354923a 100644
>> --- a/sound/soc/qcom/sc8280xp.c
>> +++ b/sound/soc/qcom/sc8280xp.c
>> @@ -32,6 +32,9 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
>>   	int dp_pcm_id = 0;
>>   
>>   	switch (cpu_dai->id) {
>> +	case PRIMARY_MI2S_RX...QUATERNARY_MI2S_TX:
> 
> there's a discontiguous (i.e. asking for another 'case') QUINARY MI2S
> 

Ack,

it can be handled with another case because discontinuous id's.

> there's also a SENARY MI2S, but that we don't define upstream today
> 
yes.

As for SENARY_MI2S, since it's not defined upstream yet no need handle now.

Thanks & Regards,
Rafi.> Konrad

