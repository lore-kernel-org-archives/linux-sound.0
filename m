Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395A23DE457
	for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 10:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781518283; cv=none; b=TwnHynammI3tLBDIeLk4zXJVnCShNqCbfbj4mMgCsi4Oe4BDENla07k4O+EXmV85QThamOBQoGqMfSTVO4RWqYv9j9oYh7YnkaWMsEd/Ob8kxZ42g1qTalCLJrEtZRYkepKXYA5B7L7cMcfS6TRcSC5fSum6KoxBGSzGJxlSFLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781518283; c=relaxed/simple;
	bh=/zOHwIGCQ+Bi1+cBLDzzvGTtXR+/DvBkXBf6mgW02Ks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GALSIxLafC5cLuukBdeK4qapOlqwkqK/3CC8HB2KJKZFCVFpWyuQ6pCQ6XtnZoZUxD9ErP1bAwR1Fbl6f94wpUXxU3s+BTttA8baoRuZcMZqMAs8NidXv7gEow7JLSXWb+W+bVRUnY2agpHqhfSGoPMzLZOAAGKPWWNiosRhnAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OlsDlzzA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ttu1GejZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OlsDlzzA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ttu1GejZ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F7U0LN4091281
	for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 10:11:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KsEKd6rZSPjuURj1p8f4rx+xTzM/nFADArhjJGwK24Y=; b=OlsDlzzAGoNZvBr+
	YHTvwyjBvuNxgCQY4IuwkNUCR8LfcEM+TV1NBHa1qnECdh4W1jGBRzZlqJMDt8t3
	rP4yEaL5PakP8I76H0+1C5FZbhfVROS8lUIfQpoC4gqBVItReHroyC7W8bpgXXx7
	+TnMeBj7y4M/ExOTQXqUPtQXYtQFMIHZEozTdotapREvwxlUaOhPnqOTYeOciPZr
	UAB6sQ6sfHhA/ShU8cEaEURbeQYcnhLOZOcEoMgTew9W60hVsGLRbcCbijKoSrWj
	RV8w0V5DTwOK5ldmtKk3NlCW+7Ucur5HJbdl7I/ojqGvc7icQIYr8IV2v4rjLE1A
	GBJnhw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etd2c8n7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 10:11:15 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0c32f4b1bso32118225ad.2
        for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 03:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781518275; x=1782123075; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KsEKd6rZSPjuURj1p8f4rx+xTzM/nFADArhjJGwK24Y=;
        b=Ttu1GejZGy5/at4+ebjLZ/m4/H/unZp+lwKwJjE9vw4ijN6JoknM/lqNi5vObcPx98
         b/jWFWqQ1+RQSFsWn72EeEsU94zn7vLbuQwGWbwiqyYrrmzNC2MoE5ualKCsy3GIRIii
         PRMxgpLwG1AlZk9EYG3Z6N16nA3p28OwaWORJxRJH06DDS4tvDFfXIavZ0HjsF0nU7Iy
         NoOQWXfRlEfhUzF+mShSinR9aCaTqnfERZBpCu1xBZq4NhxrVRUBiNA6UQfM6L5SpHQs
         LxjFwSkPy17mSW7oCx0XFb9xDikaP14qA2hv+mq0D/6Ufjc1wngAcV+BQ0pl4zWVWFUK
         nTUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781518275; x=1782123075;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KsEKd6rZSPjuURj1p8f4rx+xTzM/nFADArhjJGwK24Y=;
        b=if51DvXf0IaOSi3MrIzcRX0RuOK/ctfZ7O6M1E5PgHk9WyThRNTQcMSnR8GxGvhdxj
         77lZ1gNiMR2UTiwzmxZGhiFCs+UnjhQfeOYpIQEZrAdYy5Zj/IePocNUZr1Y6lp4S6aN
         86jRXY2luTdRfT2JWpHiNmg1cDoJtmGzUPEB6ovWTU7kWvWqDDyLvAnYLACdFzq772nd
         fOrqhZ1dcDVPEjlAe1HyAtdV5gfcsi/3FMcCb+vrwmxjRnHbyzdinz2u5w3ZVi9QBkMH
         5++ntKrOyRlz2mzrKkGmzu6k2sE/36UM9LGscy4x/XvR/04O5XMbRV2b5b+2aXhpecvy
         ZujA==
X-Forwarded-Encrypted: i=1; AFNElJ8rvO6xF6C0tJxYMRPE1m1KEF7FoHKablCwOsk5xr8xqUpnGqwoJDtpZ91c+zWKew8AHvntqcUnRQ7z1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjXJ0PNXBvzAfgQ2VNRgbkCNOS8fvomM37eo9aYAZnNv5InMfo
	iZkG6dsvXfISCwxt8GTHlyQmmaLCHlRrn/AYp/FhYS2+4RmTDgZM7/WdQlF5oTWsN7s78YwLjb+
	k/2xqbfrYP+YujcajKuwdGQBkLFb4VuQRL+Wr1BQr7Zf8wyzf/aRDjLVA3XsnkCj4Ug==
X-Gm-Gg: Acq92OFfhKm3wA9SGuw1r7FBpn9NA1gEoDdNmn+W7hnISRtUj8Yfxels9RQbBTsZTb4
	Z5YXIq0KMjEryGz+T3/F/HIELVCSqbLrHNYFNxXSK8GyhHziE4mTsENA1lazFRQOl5n4XDxTqv6
	UJKuWHaiJT6lISDdL4fzouf7lhr8c2tS4H7k17xAf/bnu2d/79wuyZpkDqpNMXdqGOjXfPUNNAI
	oBEnAyt/2yHqfOfqQdGC1JwWfivAxjYBJfXjzsFk60DKcuRLLXbIIH9+LDeqiKSu58o1irPy2DX
	YGFCWUwonU9E/3K3OTX8IZR1cPq+L8K2wc0pQe1cKHRx/EoPbc8r2LkVL1N4yhxFaoZQ+v8Lqgo
	HBs4uBrTR7W9ouaZV1QkeKr9DXxBGncjZpkCpNC08ZdVrANJH97a0WUOGDJO1
X-Received: by 2002:a17:903:198c:b0:2c1:d49c:8397 with SMTP id d9443c01a7336-2c66416326fmr100240075ad.12.1781518274978;
        Mon, 15 Jun 2026 03:11:14 -0700 (PDT)
X-Received: by 2002:a17:903:198c:b0:2c1:d49c:8397 with SMTP id d9443c01a7336-2c66416326fmr100239765ad.12.1781518274489;
        Mon, 15 Jun 2026 03:11:14 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42c43543asm97760195ad.0.2026.06.15.03.11.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 03:11:14 -0700 (PDT)
Message-ID: <53d0c41d-2455-4df7-b535-1a540c512913@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 15:41:09 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] ASoC: qcom: sc8280xp: ASoC: qcom: sc8280xp:
 enhance machine driver for board-specific config
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260608023011.942228-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260608023011.942228-4-mohammad.rafi.shaik@oss.qualcomm.com>
 <b09da7e1-ddc1-452b-9380-964f9ed3b733@sirena.org.uk>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <b09da7e1-ddc1-452b-9380-964f9ed3b733@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEwNiBTYWx0ZWRfX7KXsnkiaEhme
 pAxIqcL3ZRbuUIaNHZRpspupZjPveQo6IzxBLU+TzV7hSp+gf9PbNaALe17LO5JjTc4v3tuUEB7
 L90+ybWDAzyta5wO4DwHFh9dqerg/3Vfg+ZiGgRM2hyMM+9Bg0lRbTyzp9/BSKRKpVKRRE0Jxm3
 BHLQH5BSFFTA0xgrLO5JJqqviFZr55NXmEPOrjkzH9sUvxatipD07pRJqByfkyWGfdv8CIQwQvw
 Red1lrattCb5NArBbf3Nup+LHH45PfTI7qFzPBLL6LM1DKsjCy+tMji84Ybr2hhKp9eRPFHteFW
 ED5EvpmuQZOtZBCCasf4yXoZW7ihpXcW5OWd6qOOKGrTq+qVKCWaZseWZXnGRyjh3rtTOhGDIfx
 A6aTY+WJHalcgw9UJyd9RcLVJleBQ2A/dMU1T84O1FD8dEHxebMDb3TshJbsejy5OEpwgvmpqnX
 /1WTk4G+xKojf4myuqw==
X-Proofpoint-ORIG-GUID: BvEAdmPoxNUj89-_qQkjX18ydtxPTI6R
X-Proofpoint-GUID: BvEAdmPoxNUj89-_qQkjX18ydtxPTI6R
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEwNiBTYWx0ZWRfXwnTPjy8nKT7E
 X4tUMPIDBhSIdNqdrR+k+fAzMcgxLT5RJCpfpgXPyeZWNwCK544Dzz14mC0Xvjd6pefqPK3w9nj
 m4lyjRlcdnZyrRCRjCFfdX11UtsjDbo=
X-Authority-Analysis: v=2.4 cv=MsRiLWae c=1 sm=1 tr=0 ts=6a2fcfc3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=YMgT65kl-x7urRY1OA0A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150106



On 6/8/2026 5:38 PM, Mark Brown wrote:
> On Mon, Jun 08, 2026 at 08:00:11AM +0530, Mohammad Rafi Shaik wrote:
>> The sc8280xp machine driver is currently written with a largely
>> SoC-centric view and assumes a uniform audio topology across all boards.
> 
>> +static inline int sc8280xp_get_mclk_freq(struct snd_pcm_hw_params *params)
>> +{
>> +	int rate = params_rate(params);
>> +
>> +	switch (rate) {
>> +	case SNDRV_PCM_RATE_11025:
>> +	case SNDRV_PCM_RATE_44100:
>> +	case SNDRV_PCM_RATE_88200:
> 
> rate is in Hz but these are bitmasks.
> 

Yes right, thanks for pointing out.

Comparing the sampling rate value from params_rate(params) against 
bitmasks like SNDRV_PCM_RATE_44100 is an error. I will update the 
switch-case to use literal frequency values (e.g., 44100, 88200) or 
appropriate rate constants to ensure the sampling rate is correctly 
identified.

>> +		return I2S_MCLK_RATE(44100);
>> +	default:
>> +		break;
>> +	}
> 
> The function only works since it ignores invalid values.
> 

Ack, will fix in next version.

>> +static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
>> +				  struct snd_pcm_hw_params *params)
>> +{
> 
>> +
>> +		if (data->snd_soc_common_priv->codec_dai_fmt)
>> +			snd_soc_dai_set_fmt(codec_dai,
>> +					    data->snd_soc_common_priv->codec_dai_fmt);
> 
> Should we error check the functions we call here?
> 

Agreed. I will add proper return value checks for snd_soc_dai_set_fmt 
and snd_soc_dai_set_sysclk to ensure any configuration failures are 
caught and reported during hw_params.

>> +		if (data->snd_soc_common_priv->mi2s_mclk_enable)
>> +			snd_soc_dai_set_sysclk(cpu_dai,
>> +					       LPAIF_MI2S_MCLK, mclk_freq,
>> +					       SND_SOC_CLOCK_IN);
>> +
>> +		if (data->snd_soc_common_priv->mi2s_bclk_enable)
>> +			snd_soc_dai_set_sysclk(cpu_dai,
>> +					       LPAIF_MI2S_BCLK, bclk_freq,
>> +					       SND_SOC_CLOCK_IN);
> 
> Is SND_SOC_CLK_IN right here?  The flag sounds like it's enabling the
> clock on the DAI but this is configuring the DAI to consume a clock.

Good catch. Since the CPU DAI is providing the MCLK/BCLK to the codec in 
this configuration (Master mode), it should be configured as 
SND_SOC_CLOCK_OUT. I will change these to SND_SOC_CLOCK_OUT to correctly 
reflect that the DAI is the clock source.

> 
>> +		if (data->snd_soc_common_priv->codec_sysclk_set)
>> +			snd_soc_dai_set_sysclk(cpu_dai,
>> +					       0, mclk_freq,
>> +					       SND_SOC_CLOCK_IN);
> 
> This is configuring the CPU not CODEC.

will fix typo error. The call should indeed target the codec_dai when 
the codec_sysclk_set flag is enabled. I will fix the function call to 
use the correct DAI pointer.

Thanks & Regards,
Rafi.

