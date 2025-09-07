Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96FF19CC3E
	for <linux-sound@vger.kernel.org>; Sun,  7 Sep 2025 12:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757249294; cv=none; b=OvYNkx0Cwi2PIoXSngnP6rzq4UgPC+GIc1J0KwLTppyvrulFkUUPWPC6YaMxdBe3PMZvw9BfEF2bXmIEW1SrvfAHMk/1dG2dr+AYIbbWjXxSJsue3/g9NSbETdrhXWYfGbcYPeNT02BHxoSYw4XXRe1J2bk32SRg1ELAFU2ueWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757249294; c=relaxed/simple;
	bh=fovseDpu+uBVSyhkPuz3suEFYJtmdGB3aLws1MqwV/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=flA3ImgR8k2ypNsNMBgZWPznNh1P3ryJXWb3FSlnbxJIw9GqNy4DP5U/3RcJW6gF0Xd51x/iv/v0DRoJfI3aTeQO2lJZAGHHS/h2flPXPTvRWOaQTPUBQ1JMXW+Hi39jxOUOBwFNcuT7DKmrJY2EYiXzy5rVG4WJ37d1NrSABFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iXCNPexG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iXCNPexG"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5878jKAc032469
	for <linux-sound@vger.kernel.org>; Sun, 7 Sep 2025 12:48:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pfAmweq7JyBuIK2YLoea3uL1qJZjl0HZWJilg59gpOM=; b=iXCNPexGVnqjEcB5
	P527Jno7dswx6qeEqQNsuqyAM8ckrRJhKTDnflfzV7vgDmw9P2GUtv5u6bIN9vja
	8e5sYYjMwgUhas75XLDhK3PYL8N80ssjVLpJR2uh7kbiXLzBfYDuzWN6qkGn31cK
	PLMxu95wtcMla57HF/tmJubrn8kuMUiRL41kWKgQEpy4AGwRM5LJByIiYxF8koxY
	onu0KfDjSMOGTBqtViZli9I6vwXOvquICLqYtMcHgwKZ8lJzFDMc+iCzCt8XEgY6
	2geBnMQwmOz05n4EjXHTW3y97yVYiVnBjiwwCzbLoC7OY1Hpv0h2u45QXyi3HG11
	m2emAA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490d63a28e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 07 Sep 2025 12:48:12 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7722ef6c864so3242173b3a.1
        for <linux-sound@vger.kernel.org>; Sun, 07 Sep 2025 05:48:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757249291; x=1757854091;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pfAmweq7JyBuIK2YLoea3uL1qJZjl0HZWJilg59gpOM=;
        b=fRA9vVnwVdUIoJhqyCE/fwbctE6ce0XuZn9+vFy39lxE62dSGBkqNLvc9sN1WVy6k/
         V3Bo0Rx12CO/XrR9Kd12hHsGvtqyUYTzud8b9uV0V3d5fjt6uHGhN6QAcTdne/+eMzHD
         bCSx/M/zL9CJVkvqr2KSsLumgrvHKK5Ef4aDpYrJ6rIe6yYXoOG75uwhqnTyaAvBi6ie
         9x3HreinPyBCPCfTtzKBiNC9V4i97ECpPab7P0+kU16rbL6RYYHMEOwXLGRJwYmWVlhu
         0kTubxJ9j5BJtpJOE85kehVJi086lEGbmHz04KngK+g/Qk+XwUhX2LuwtyeHL3Bkb8QZ
         p5og==
X-Gm-Message-State: AOJu0YwMms+9Tki7xy+IkyQxpiTPSSh/JKV/akGAX1iPYOrmuQG/iLjs
	rAtQFSybDTBTMqKcIdaSeVg6Sp4bFk/RUy8ldXZFxv5z0gFvuG03+B3ley+PMsrX8RBKMWxE+SA
	qtmKoq3NrHr5EMnsjPquzR+gjzkV6NjyfwN+QP6Y24Z5TtzJSEo53a0b2dP8t/6N+cQ==
X-Gm-Gg: ASbGncsd3SqVWJZziB8MTnIHFdKCkLkuq4h7OdzO0rMHCg8hHhwJbhiJ4hy90t622KN
	lxt+KRY2NuHVDSKL0PtnoeBIhvyrNe9B83cvqHlSsUaKrUpR7HCSxs5Sor3AOA03bEKVqIdXY/S
	YJHz+slWXIuae3rSSVA/j+teM396QZIqYMjdcekV0ou+cx8FKEsTtJOmT97+3QnOLn6awWylwQ6
	dTGXlmr4wmBSpxirWFem+bEY5PoddIQW2Z9mpCLopO5xzPppu9z9rPz87luvE3vi9kBbz833kbs
	dM+I1n7vmafMoyWOSai/CTIu42Kt+t9huot/1s71ZI4ANugml4uqAEG5J+koSRN48LkQyAB1Zq/
	t2zve
X-Received: by 2002:a05:6a20:3943:b0:243:f5ba:aa9c with SMTP id adf61e73a8af0-2534073ed6cmr7506766637.25.1757249289779;
        Sun, 07 Sep 2025 05:48:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENWjF4ugvYWq1kcweui34vJDpxHEqv2vVeVqYw4aUXOwqNAELGDOT7480x/k7bScPoBqYfsg==
X-Received: by 2002:a05:6a20:3943:b0:243:f5ba:aa9c with SMTP id adf61e73a8af0-2534073ed6cmr7506730637.25.1757249289290;
        Sun, 07 Sep 2025 05:48:09 -0700 (PDT)
Received: from [192.168.1.5] ([122.169.129.160])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4d6cde2f0fsm22929103a12.13.2025.09.07.05.48.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Sep 2025 05:48:08 -0700 (PDT)
Message-ID: <eaa235f2-b6be-46e9-bee2-1a4818736d42@oss.qualcomm.com>
Date: Sun, 7 Sep 2025 18:18:03 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] ASoC: qcom: sc8280xp: Fix DAI format setting for
 MI2S interfaces
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        kernel@oss.qualcomm.com, prasad.kumpatla@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
References: <20250905150445.2596140-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250905150445.2596140-4-mohammad.rafi.shaik@oss.qualcomm.com>
 <899db9f0-27f5-4404-8357-4985e084ac99@oss.qualcomm.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <899db9f0-27f5-4404-8357-4985e084ac99@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyOSBTYWx0ZWRfX04qdQeUwI/z9
 49Rw7RVDRgQSIRugUrtsOUiJzaideVvDDJZscjT2Si4/E9/rvcy6UK+T+tARZup+psCuzUxWHrj
 JchyD8/ccQYbfxNa4QMIU68roiMBIQmZYCefZB/0Zz5fa0Rqm1EIycHXycybzje7gD9MJat8xOF
 PtErOrOr6d3oS5hZ34UGEJtpNPOX4LexEfpHtNufhCSZ9F7sLetl5YYvOY+AIF3z5nAoZ+mwakP
 Vpu5MRHFA4l+ps6PZGH+j806QjaHblfSupw+zGqVS3PGraO+KpGmwTe1oCI+PXNxlBGCybn3xAP
 J7OUjAjh6yMhe4uizzL33JXkaczMDS+ut48QzGAOaDGROikiPDRkCM1C8TGLmYCbFH1VCA6yDZk
 rblF84CM
X-Proofpoint-GUID: jKLRPbfIkvVYWwIUH8iyFmNGHrB7EHAH
X-Proofpoint-ORIG-GUID: jKLRPbfIkvVYWwIUH8iyFmNGHrB7EHAH
X-Authority-Analysis: v=2.4 cv=DYgXqutW c=1 sm=1 tr=0 ts=68bd7f0c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=/ZFYPCvVo1eZwIJTb8k6Sw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=YKXIHFROM69d4h8Ztm0A:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-07_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060029



On 9/7/2025 3:30 PM, Srinivas Kandagatla wrote:
> On 9/5/25 4:04 PM, Mohammad Rafi Shaik wrote:
>> The current implementation does not configure the CPU DAI format for
>> MI2S interfaces, resulting in -EIO errors during audio playback and
>> capture. This prevents the correct clock from being enabled for the
>> MI2S interface. Configure the required DAI format to enable proper
>> clock settings. Tested on Lemans evk platform.
>>
>> Fixes: 295aeea6646ad ("ASoC: qcom: add machine driver for sc8280xp")
> 
> Am really not sure if this is a fix, because sc8280xp does not have any
> Mi2S support. If you have added support for MI2S on any other platform
> that uses sc8280xp machine driver, then that is the right fixes tag.
> 

ACK.

You're right, thanks for the clarification.

I'll update the patch based on the inputs provided.

Thanks & Regards,
Rafi.

> --srini
>> Cc: <stable@vger.kernel.org>
>> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>>   sound/soc/qcom/sc8280xp.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
>> index 73f9f82c4e25..3067b95bcdbb 100644
>> --- a/sound/soc/qcom/sc8280xp.c
>> +++ b/sound/soc/qcom/sc8280xp.c
>> @@ -32,6 +32,10 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
>>   	int dp_pcm_id = 0;
>>   
>>   	switch (cpu_dai->id) {
>> +	case PRIMARY_MI2S_RX...QUATERNARY_MI2S_TX:
>> +	case QUINARY_MI2S_RX...QUINARY_MI2S_TX:
>> +		snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
>> +		break;
>>   	case WSA_CODEC_DMA_RX_0:
>>   	case WSA_CODEC_DMA_RX_1:
>>   		/*
> 

