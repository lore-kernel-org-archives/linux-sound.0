Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332822BCF7F
	for <linux-sound@vger.kernel.org>; Wed,  8 Oct 2025 16:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759939731; cv=none; b=NrlWLqz8hhFQq9xj3ysiwA1Pricfl5wJArRG5WdM3063cEKCekoROb5I/fUA3xihSUeAwqKOHh/vUZ6gOVNx3ew3zlg6RYrTqItjwUySxEQ4Jugj03ktosHNxBkFiBdU9FsWa3g1QytSt0FP2qkNrtZWjRsTlkNejx3IGMDPZSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759939731; c=relaxed/simple;
	bh=/8QRT4JYvQJoEiFUqoKv6XYp3suGZTvOAD9gkcmDGbs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kgyAeTIWKElVrHqaLmLyn45e1Qf4POowI18ffSkW5/CnrG3mgLj8NI7e85PDC6o+yaOzC+XyYiW1vZuYOPbLAYU4ir44m9sAKaTCfwxKUlzd9EZEf0BsinDogBXRPKFNcn52ThpWSJ7S4KLq1Al1ERHEIMwGtAAGeff/jIL535Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QxgL5eC1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QxgL5eC1"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890SmW001554
	for <linux-sound@vger.kernel.org>; Wed, 8 Oct 2025 16:08:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EadjyGqEoA7yy7p0yBcMwTqor+vd8CVmNzzcVZ8d0bM=; b=QxgL5eC1Tp2tsIRI
	fFqGDVkgK1KGlVN+dQx+kF6PSCff7xqz8YtjLMBW0XXfDEBtXeVthaY0Q+/jnKHF
	F0Ep2yCoxNXA2Ec1L8NLfjvno9IXrsaz8vST1l7Sk4Jbj1/w3mnzjU67vjeP2+oA
	Kqh7cJnAi513maPQE9K79cVzgczjvjN9eFtaybkKSejRWESr4i1kZ2fcVA35D5pa
	VU4k3y6xptzmTyf9bWpjQEYszVQamskZOXJBoOmjLQprzs1/fhM7JzfDwQHfhVXQ
	5VwDQM2gFamWjUS+c95JV+8cHolO0dY+/0G4hp2ucNrM/uOvtN+9FNN22qB2NCY9
	7Tfamw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49juy735tq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 08 Oct 2025 16:08:47 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-33428befd39so306478a91.0
        for <linux-sound@vger.kernel.org>; Wed, 08 Oct 2025 09:08:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759939727; x=1760544527;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EadjyGqEoA7yy7p0yBcMwTqor+vd8CVmNzzcVZ8d0bM=;
        b=aUcj2jo+uCZegbEoIXYw3j9mEk75/wO2J3wegBUGGSY/LrSuwFI8AStQaF3amiyN3b
         8cQj1HFn6IFTZwbJqxcssjbXMY06kSNvpFyMWJaK7oYxo6BDqPX7XOYi1aAUA9qHG2S6
         ztUIBW8a8Tf3U3qJV8zyPjoUzXYLDH1RcWbX3S0iyVD4eqRSU8tKwpXEdaz4CJU2TAU6
         0S8TuZxN+2KX3DCoE2m08P6nkWKSvsDyyi1+kjoWrpTXsBWlDDn/qX+yKm8AFtcYuql5
         s00+CMfc+5kG60jHmdB5xbWvkwybMXj0cZqOnUR0TwhgffGZI+VwQJUv8ORRZR+o/M5t
         6LfQ==
X-Gm-Message-State: AOJu0Yy6owW2MnjHqVVCsqufAB893WHuBot4y2Ph42g+lVf3kuyNGMMj
	LOtAdVq6F3MsZ7ou4uXFGbDjr9UvzvVvwKDGlVhzWNgFFry6q9IFBTpp3wPFA8JBrLkf+PDOSUg
	ycGNkHVIeVrdLMHipRbOQI9Anp0Op7NA09GwFJnkJZeX4G5zy81ZwklpZanhztv4Obg==
X-Gm-Gg: ASbGncuWXh1kL8lqA4c+5zNMbvJtWMYjGpb9+MDtSQgo0fqlYOuUwd1yK7Y8JqbmYJK
	eAdZ65fhVVSReoZxMM8K82Us1HKmmGENV/BUbUu/tr0ujqOZlSHZV9lIa3UbtdUHWKHIpW1KFs7
	5EPxrkCicGgjDjNpCw0uYpoMbF/71hQYkZI1gea7Xw2LqocjIiBCgprMFxJ9kJhGkR1mDyUwpvI
	ALrc1E9u32NTrAZe6W19GYtebdr7O73BUM+6dicCTZ29a3EjTv+nSZe/ANxsiZfkYzW1ZyPsDXK
	Fhb0Dd4YZ6HrBZOP6uaOJHIJamCiGT0YSOWl9Qi7vJWHtV262rMLU62jvoEtzuPxVRa6lQWlYYS
	MhC1mk3cnEQ==
X-Received: by 2002:a17:90b:1d0a:b0:332:50e7:9d00 with SMTP id 98e67ed59e1d1-33b51118f31mr5680184a91.11.1759939726573;
        Wed, 08 Oct 2025 09:08:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsdh5wKz6+TIrygmcHpwH5Y/NXlAXm9029ErhADPyESV1HZY16vtvxPYKuUeH7km1h74G+9A==
X-Received: by 2002:a17:90b:1d0a:b0:332:50e7:9d00 with SMTP id 98e67ed59e1d1-33b51118f31mr5680122a91.11.1759939725888;
        Wed, 08 Oct 2025 09:08:45 -0700 (PDT)
Received: from [192.168.1.5] ([122.171.120.114])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b51115ad2sm3930345a91.12.2025.10.08.09.08.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 09:08:45 -0700 (PDT)
Message-ID: <b257d715-cc12-46cc-ba31-7f7fc257f763@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 21:38:40 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ASoC: soc-pcm: Fix mute and unmute control for
 non-dynamic DAI links
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, prasad.kumpatla@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com, stable@vger.kernel.org
References: <20251007023325.853640-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <d9971ca4-1911-4204-b175-1ceeaae7c238@kernel.org>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <d9971ca4-1911-4204-b175-1ceeaae7c238@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IrITsb/g c=1 sm=1 tr=0 ts=68e68c8f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=x3w4O99MFjH9QQBP9/sZlw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=4Xw4QKfpzqBY54n6qe8A:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: Ae3cRgA9d0Fn4WdbxO_Fruy8UjrTJ9Ho
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyOSBTYWx0ZWRfX7BtwHyAEErCL
 YPZPrD4n4xK2yNz0CG31L+IhN+khzwRwHmUmPw9TRwHHLi7SgIK18Syyh/ZLWOkCacCjalPygYH
 fNU4iywM3fSKuCrkGtVwbkMvoj59N3rZOgeQyXP1iuLlX/k1VNJrQgJVyN+ueb9byQ2L/huPNG9
 /qPRg4OLbQ0AT8q4r+QWhwf2ktDzJ5zQVsDVNRwgBQNYv4ycrAh2qO7lXn5LxhLYl9KpkbNjtXO
 byXbzETOtpdTwH29h/MYcs80lhFwBWw+G2RyHwFU2NINc2aI0VG2zitMuCCx3glpDshJDEcU92K
 dcRNZb1rJpShjzk+BU6UIJUd4gNyEeGWGnCPcs562rdocmRLOHbQ6rnlt/OCKkPay87l8GRBhnr
 wAP7O4uj9btprPuRgVep74eZPZhgbA==
X-Proofpoint-ORIG-GUID: Ae3cRgA9d0Fn4WdbxO_Fruy8UjrTJ9Ho
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040029



On 10/8/2025 7:16 PM, Srinivas Kandagatla wrote:
> 
> 
> On 10/7/25 3:33 AM, Mohammad Rafi Shaik wrote:
>> In setups where the same codec DAI is reused across multiple DAI
>> links, mute controls via `snd_soc_dai_digital_mute()` is skipped for
> 
> Please explain the problem.
> 
In Qualcomm audioreach setup, if platform dai not specified in DT, then
cpu dai using as platform and initialize as static dai-link and created
pcm device and link-dynamic == false by default.

In existing setup if dynamic==false, it's skipping trigger snd-ops and 
the codec is always on mute state.

>> non-dynamic links. The trigger operations are not invoked when
>> `dai_link->dynamic == 0`, and mute controls is currently conditioned
> 
> I dont think any of the Qualcomm upstream platforms use this flag.
> 

Yes, we are using dynamic flag and it's set to true in Qualcomm platforms.

Please check: 
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/tree/sound/soc/qcom/qdsp6/topology.c#n1093

>> only on `snd_soc_dai_mute_is_ctrled_at_trigger()`. This patch ensures
>> that mute and unmute is applied explicitly for non-dynamic links.
> How is this resolving the issue, mute on these codecs happens at trigger
> level instead of prepare.
> 
yes agree, but if link->dynamic==false the trigger ops not getting 
called, which leading to codec always on mute state.

Thanks & Regards,
Rafi.

> --srini
>>
>> Fixes: f0220575e65a ("ASoC: soc-dai: add flag to mute and unmute stream during trigger")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>>   sound/soc/soc-pcm.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
>> index 2c21fd528afd..4ed829b49bc2 100644
>> --- a/sound/soc/soc-pcm.c
>> +++ b/sound/soc/soc-pcm.c
>> @@ -949,7 +949,7 @@ static int __soc_pcm_prepare(struct snd_soc_pcm_runtime *rtd,
>>   			SND_SOC_DAPM_STREAM_START);
>>   
>>   	for_each_rtd_dais(rtd, i, dai) {
>> -		if (!snd_soc_dai_mute_is_ctrled_at_trigger(dai))
>> +		if (!snd_soc_dai_mute_is_ctrled_at_trigger(dai) || !rtd->dai_link->dynamic)
>>   			snd_soc_dai_digital_mute(dai, 0, substream->stream);
>>   	}
>>   
>> @@ -1007,7 +1007,7 @@ static int soc_pcm_hw_clean(struct snd_soc_pcm_runtime *rtd,
>>   			soc_pcm_set_dai_params(dai, NULL);
>>   
>>   		if (snd_soc_dai_stream_active(dai, substream->stream) == 1) {
>> -			if (!snd_soc_dai_mute_is_ctrled_at_trigger(dai))
>> +			if (!snd_soc_dai_mute_is_ctrled_at_trigger(dai) || !rtd->dai_link->dynamic)
>>   				snd_soc_dai_digital_mute(dai, 1, substream->stream);
>>   		}
>>   	}
> 

