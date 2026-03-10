Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B3143D508
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 09:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773135032; cv=none; b=Un0xZVobNwM8tMyC/Ogy9875hUPVlT9oA+ppnuP4qpGMJG6tSleqY9ek8iqXOt5nKpQPY7tIMTrVDwE1LqZc4p2s1XMvYBvO/uIY+u6r8kunFLzb7pMk6HmlY39IMKJdR/wQHD/lKfO36nIQ7JrttE8CMd1Rqg4U1Bw9f1XQsHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773135032; c=relaxed/simple;
	bh=uqXuGfflSEpE8YFEEerWxYrmt5kvu2j/BNRVMxIXBBg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s7FXfC7CHGsuWakQWWzoRA0V5XP1mH9A0n9A3VVmy6Li+AeFnk41TUDSBqRiPuQ5Q2QkE5vPvPXzi+xVx7UySuEFIPnM2+0E0JCs9CgKynV3KS4Wk7IzUmye423GqBZk94eoAhVrQ1ZHgs1hTk9D0GTtYpPlyg9zNwKYKbbF06Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cm2OhGvt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YtSBOEez; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cm2OhGvt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YtSBOEez"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A97oPh3587441
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 09:30:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	URVuKpK3lvRK8s9gUYJAp+UYjsaDU/GsAGApoR62pDc=; b=cm2OhGvtTYEt9RpB
	6j0D+baogyV+DR4pchS5uD1givux7lgEpcjqsv5Xia3OX4NKwqNnKV2g5DaaSCxH
	kJQlwT5EsShN8C60PBIdYUYCjubAvoLnRpdl8xV6SfeiSUTEGV00GXYQC9JxWgnt
	Zvj7WQfM+7vOmb9bKe1b9lZQPHJM4CUyHjwEL+EFebFkh+AzawFG8sdUa7Rb+d1U
	NGgMwQ3ZsFPGEG+a8HfCcxSAioMidtSscaqETgo6B3ADpxx8amuxIWw0NpN5zjvw
	0+tW6iqmKYczBQW+2D7YT1wJAwM8eTnw/mUdrletruD05biNNHQcgYOCS3SukWTT
	n55JCw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct1eku5vj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 09:30:30 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35980a994d6so51388417a91.1
        for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 02:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773135030; x=1773739830; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=URVuKpK3lvRK8s9gUYJAp+UYjsaDU/GsAGApoR62pDc=;
        b=YtSBOEezPSG4/1SXwrQqB6vtvh2WD9DFBc2WyssH/xpsffzahv6MLEHaW2pfMUUZ16
         jQ3bjaP3bzUnP4cmIPekDyZnbix7rlwOxcxu8uwnPGbS59WRxw4YL4N4qNK+TEg/V2wo
         YEc95KUqeaQVOh8SLCF/I9Ow5OBX70ahV0GS3iHCHVZBqKKym79IOTa+kBL+lImSzO47
         exK6Ho9JxXq39deIhucghbfKp/zmvV+5MA8iOMvsxqY6ai79HO9D7e2hSlHrGHPmQ8+x
         ali95hktk59h5nG6oY4pbUjrQWN0iGbnq+ACRl0QV8O9N+dfeU8F41EzR4bWo3q/iKoY
         1D6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773135030; x=1773739830;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=URVuKpK3lvRK8s9gUYJAp+UYjsaDU/GsAGApoR62pDc=;
        b=gJtCj5YQX7ZWQMStU4nVDiEn1Hm7bMgDIFFyHxNf7YAv4KjkyiRpoeOpVb3CiLNWyf
         sROHuxX0buVtUT+ik471XELBgIUo6AiXL7sCIxzNYoHWby/TpoKsSxkoiM7C7FnUTbbZ
         prbiptux9cpbLi8n+Wsrk2AaPbUPXsZVBDOXb3EgiUagOcxYiV/vJM4CvTA3mQmapbUZ
         NJHDR/wdgz2xx4pHzLHu89kRAgjGvuH+4/F1G1uAZlnKmpDDoxTxTgNKr8dX4d3tZnCW
         fzic0PoBTPMKcbya9STV7t/A4wD29ywZrWrDY8UZXv8+m1jaGozicHSBq33kkHox98bL
         M1BQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpzH+8shDs8BVryoSxHwF+ISwLpg5oUMhkrrWkuLj9XxmU2cWmsEFejZC5yiXqxdQTtXY6wp/QiaDg3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy4VMlhMdHAL37IhmLLokCcDuWeObI+ti1XJZRPITphwC4bnyQ
	1gIkj9nChUTivbIflmB8nTjp14vryttK7jmt797bhKDpsKKf2bqZV6lIP6qaKBgzZ2JRacsCi1n
	stwIp4IBhYh/v3FXoqa7ZDuyX2hgVI2vK5uKmu8ne91mr2vaE2iI8Y+I9utTegWrRlg==
X-Gm-Gg: ATEYQzzuHhIUjpTlRbbzsVFvnEU+tuIoLYei8banQGiqbXbwQQgnfICYkZZ28LMw94X
	PYEwlL43VgPIIIHkFDf8/H/4Z9YgaH8qqYdqKa4JzhtsUxbZuZWsukNG5BIJdq3UUkSYLhyD5jO
	oyVZFRGeYb28Z8HAjcoKMbgah/1pdmQNwE2pnSTI5nkf13XNXt/h82DzJfK9ITAVLW4w3xss33U
	b+DeLVP0RuR39kmOs1FDtuBVuZlPhkiu2ywJVhSJO9/2orhoG4r5IeNfNiQICmyqc45b+1/ok4O
	ywrE9YJItdUU2XfJdCPxlwElJ8Mv3lTwaiUnfk47dlFpfePaezRbaOBNZpKMemXEwlhT+UTQqhv
	udQMAaTpQ4zfwIeEBUR0Mo3bWhILbLGIkYo22aAGGINFfCYyEfSYsfWOdY44y
X-Received: by 2002:a17:90b:1e53:b0:34c:99d6:175d with SMTP id 98e67ed59e1d1-359be283016mr12464095a91.2.1773135028925;
        Tue, 10 Mar 2026 02:30:28 -0700 (PDT)
X-Received: by 2002:a17:90b:1e53:b0:34c:99d6:175d with SMTP id 98e67ed59e1d1-359be283016mr12464050a91.2.1773135028372;
        Tue, 10 Mar 2026 02:30:28 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359f05ee478sm2395579a91.2.2026.03.10.02.30.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 02:30:27 -0700 (PDT)
Message-ID: <fdc64e6f-386e-4f4e-8890-841c59710dc0@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 15:00:21 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] ASoC: qcom: qdsp6: q6prm: add the missing LPASS
 MCLK clock IDs
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
References: <20260309111300.2484262-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260309111300.2484262-3-mohammad.rafi.shaik@oss.qualcomm.com>
 <cafce8ef-5297-46ea-a14d-8a12bdf2f181@kernel.org>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <cafce8ef-5297-46ea-a14d-8a12bdf2f181@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: w3Tn2eB6O3_vAS7vAstnJvPZs7Mr74fx
X-Proofpoint-ORIG-GUID: w3Tn2eB6O3_vAS7vAstnJvPZs7Mr74fx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA4MCBTYWx0ZWRfXy5IvWuQr63lh
 AhJ78IT8g8sKJlELXk9CmK2PVdXQ/vhI1BusRGflNE1Dg4HnfySb5Gy/HT8QVL9E1wXV48PWYEd
 zbm33SOersVdR4jFd6p7ZHHzemIhDcH5/NHuhuiMbUWtGmGT8g9yLlQoXblxOJGQM0SnrwdFBOY
 K+7WW39qjs82nBez9TFzOSEvzwuNchLJr+xpwhOBSTq74o0znrgjoddXjQlpZgZQ4WRNmWHlhT9
 iSpzhiDxET8RfhfoRMKdqpj+gWUqTiqP9Lql4GlprwDKbe9Q99MWu2AR0uOl25scnUF9GAsulbU
 5pEt4LdmifyW+//61/horfYJ0TUhrkUVlFlE7W6NrbAJo7j13yIrigfPgnf6KLkQQlxX5PP5ldu
 0iQ8jXS6jeZFfQmUDf+X1O7KiQldytwBHrbqnzIJjenaC4BO8dEYGsOTNcsCngkTfr+oL67TLrj
 b/tLstalFfJ2O8DCDwg==
X-Authority-Analysis: v=2.4 cv=eIEeTXp1 c=1 sm=1 tr=0 ts=69afe4b6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=D19gQVrFAAAA:8 a=EUspDBNiAAAA:8 a=0x9H3M7g5i9H74ZWH3cA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=W4TVW4IDbPiebHqcZpNg:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100080



On 3/9/2026 7:37 PM, Srinivas Kandagatla wrote:
> 
> 
> On 3/9/26 11:12 AM, Mohammad Rafi Shaik wrote:
>> Add the missing LPASS MCLK ids for the q6prm ADSP.
>>
>> Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
> 
> 
> This patch has already been submitted previously by Neil, Please pick
> the patch from https://lkml.org/lkml/2025/10/6/828
> 

ACK,

sure will pick Neil patch and replace with current patch.

Best Regards,
Rafi.

> 
> --srini
>>   sound/soc/qcom/qdsp6/q6prm-clocks.c |  5 +++++
>>   sound/soc/qcom/qdsp6/q6prm.h        | 11 +++++++++++
>>   2 files changed, 16 insertions(+)
>>
>> diff --git a/sound/soc/qcom/qdsp6/q6prm-clocks.c b/sound/soc/qcom/qdsp6/q6prm-clocks.c
>> index 4c574b48a..51b131fa9 100644
>> --- a/sound/soc/qcom/qdsp6/q6prm-clocks.c
>> +++ b/sound/soc/qcom/qdsp6/q6prm-clocks.c
>> @@ -42,6 +42,11 @@ static const struct q6dsp_clk_init q6prm_clks[] = {
>>   	Q6PRM_CLK(LPASS_CLK_ID_INT5_MI2S_IBIT),
>>   	Q6PRM_CLK(LPASS_CLK_ID_INT6_MI2S_IBIT),
>>   	Q6PRM_CLK(LPASS_CLK_ID_QUI_MI2S_OSR),
>> +	Q6PRM_CLK(LPASS_CLK_ID_MCLK_1),
>> +	Q6PRM_CLK(LPASS_CLK_ID_MCLK_2),
>> +	Q6PRM_CLK(LPASS_CLK_ID_MCLK_3),
>> +	Q6PRM_CLK(LPASS_CLK_ID_MCLK_4),
>> +	Q6PRM_CLK(LPASS_CLK_ID_MCLK_5),
>>   	Q6PRM_CLK(LPASS_CLK_ID_WSA_CORE_MCLK),
>>   	Q6PRM_CLK(LPASS_CLK_ID_WSA_CORE_NPL_MCLK),
>>   	Q6PRM_CLK(LPASS_CLK_ID_VA_CORE_MCLK),
>> diff --git a/sound/soc/qcom/qdsp6/q6prm.h b/sound/soc/qcom/qdsp6/q6prm.h
>> index a988a3208..8296370e3 100644
>> --- a/sound/soc/qcom/qdsp6/q6prm.h
>> +++ b/sound/soc/qcom/qdsp6/q6prm.h
>> @@ -52,6 +52,17 @@
>>   /* Clock ID for QUINARY MI2S OSR CLK  */
>>   #define Q6PRM_LPASS_CLK_ID_QUI_MI2S_OSR                         0x116
>>   
>> +/* Clock ID for MCLK1 */
>> +#define Q6PRM_LPASS_CLK_ID_MCLK_1				0x300
>> +/* Clock ID for MCLK2 */
>> +#define Q6PRM_LPASS_CLK_ID_MCLK_2				0x301
>> +/* Clock ID for MCLK3 */
>> +#define Q6PRM_LPASS_CLK_ID_MCLK_3				0x302
>> +/* Clock ID for MCLK4 */
>> +#define Q6PRM_LPASS_CLK_ID_MCLK_4				0x303
>> +/* Clock ID for MCLK5 */
>> +#define Q6PRM_LPASS_CLK_ID_MCLK_5				0x304
>> +
>>   #define Q6PRM_LPASS_CLK_ID_WSA_CORE_MCLK			0x305
>>   #define Q6PRM_LPASS_CLK_ID_WSA_CORE_NPL_MCLK			0x306
>>   
> 

