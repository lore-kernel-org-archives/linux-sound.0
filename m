Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDF52E9EA6
	for <linux-sound@vger.kernel.org>; Fri,  5 Sep 2025 10:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757069173; cv=none; b=eRiSwl4U0xCxSHG+o0sth3Zz+C4S0uX7tgrnEI3yvaiE0GFDlVF0SdxYOMdEVfJE/NXcn1rJfe7kj6jR6oWPV+euskBXQsEznUHzHGfGwwvFUId/3XjUXJZRH8hsRUn92nnDj3bN/In1huXQt2OUQvQAk3bxjVpH6rNBWSJzQck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757069173; c=relaxed/simple;
	bh=6duR9AAEjGMbDChCm8l0AFz9pGIbE/3Wj9Ss016HRu8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fCUClqx+EVbM+T3ZSoW5a75KROivOCeVSQffQzUDlyGTnk38clYUnSB99DPH49OnaJXNcAHO707NKZdj29RfjAprgdKSL4O5lel3w/h0A2YeMU44SvBoWpLOcVPQAa8yCCCMZbNyGJWys7XWrARQXOyS4yjdVZcJ/WZ+BFctgpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fILQNVkA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fILQNVkA"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5856cQwM022232
	for <linux-sound@vger.kernel.org>; Fri, 5 Sep 2025 10:46:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J/7Fvq0+FlOaEckovLs1a380VDNkHEU+i14RtfKNleU=; b=fILQNVkAxHT0ZY6O
	jRGEvytkX82/e3eFG6T8msjXcbkGYPu5eTCcgwcbcJU1V3XKXOSgWBYFhYhcMPNj
	FbZowFTJ4+z8+OIWv07RrkRTB3ImRPMbkme2+CvYolzH574tz2r7jQ1FgE1/FYIC
	k6SW/ZVhvnHl6cUD2U3wOuTDqejnuVeGwcoO3EIV1nNSP/Ye3UVx8MGUdful/60g
	oLxuHJZ33m29xrO4iUsx1ktEJWhtYQARmdz69XpCqGLsaxiZGRmAUoP16v9cwlxo
	bd18I6oKU+YdTZ0g1zCZU9fmfA55XsrbhP4pbQTJUvnGqL7Rrb3QU9bDRJPt4w+s
	K56NQg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utk9apun-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 10:46:11 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-729751964dcso31123866d6.3
        for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 03:46:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757069170; x=1757673970;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J/7Fvq0+FlOaEckovLs1a380VDNkHEU+i14RtfKNleU=;
        b=ku8CLjDgwTMn5zg+d7g64G4OFr2hqEpanrXrGYscwUav7bK9MArK+kMhscZC5H05Uz
         8gczC4oe2JK1rrUtembkhHo7Jb6nbXVCvyKaptcFRkXt5C7xL3916DoaVFO1ipU20Skm
         Za5vAMO944/iACc2jufSXVm8Pn4hgFFqdCOfKfkPnmBa79YjXKG7bEeD8DVqXI+xDNoH
         CCO1CvzWThk42r/TryxhPFKq9xtR3KafBknV/UiqcCu4Vp8+01eHp69Fub6wrIyUJdmn
         QZJ7ylSnuhZn5//nyg2kCOHuSo8K3ro08mgeaiXs6+Em/q6NzYID9dnkgHvj5+Kw0z/f
         CjIQ==
X-Gm-Message-State: AOJu0YyRdpFCZc/dlxTafykNiGHcbXqlXMUuvyvqiCEmItEPLmJaCSRS
	9JuhaVT/AAyvIEDAMb6Qr6EkNI8MRj1g0haHXsZBGEZBfbV7znLzY05H6n39OG045kiKkDfdCQJ
	mrRSLnCQd55Ntch4GVzH1i+RGWgE735TpBzFJkI0Ike0ZPM8WclV8dH178PyFlUxW4w==
X-Gm-Gg: ASbGnct0URE8mcYQCWiM3vRpE7hFEJ1nUhksm8uL5r4bta2/xmZFhCyM/oqZuiatEQt
	nYbYN+6ZDEIEKApgjDRDJ2H7vUgsDkLinloqvUL4ou7rK6uaaotuEqE50cq3jLrPtlbGdAacxdx
	9a+pxJhg/FRMz250oipT2Hl9yy7sw6sXznFQkurh7PabaT3szY8fxRiIJIBRtRLe+pnaCxeOyIj
	gbzCjX2kYu7Zw/tF0pTgMzUb6roask7aTI2VnvbiNR+n2sbRH9PgFTvUjfD7W7ITJWBX6Co5Ydy
	pMSgy/rZ6+O+Q2Pjj52rej5RrWz5zIOnmBmVVsMPHWzdsaOpEcxJQy8DcvisXJJ/DS4=
X-Received: by 2002:ad4:594a:0:b0:72c:cc04:c3b6 with SMTP id 6a1803df08f44-72ccc04c48dmr22168966d6.31.1757069169781;
        Fri, 05 Sep 2025 03:46:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENRTTCwihhjXzgztLbzF3k7QDm2kkG3ZKRYNv9pLyaHqZ4H+c5PLsgbiWtYQtvOUfDYu5mfA==
X-Received: by 2002:ad4:594a:0:b0:72c:cc04:c3b6 with SMTP id 6a1803df08f44-72ccc04c48dmr22168666d6.31.1757069169201;
        Fri, 05 Sep 2025 03:46:09 -0700 (PDT)
Received: from [192.168.68.119] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45dd05d0c43sm37831165e9.2.2025.09.05.03.46.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 03:46:08 -0700 (PDT)
Message-ID: <fb126ef2-aa44-4a67-9188-3483b07b73d6@oss.qualcomm.com>
Date: Fri, 5 Sep 2025 11:46:07 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] ASoC: qcom: sc8280xp: Fix DAI format setting for
 MI2S interfaces
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        prasad.kumpatla@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
References: <20250905104020.2463473-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250905104020.2463473-4-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250905104020.2463473-4-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: j86XhrngGmigU0IeXrT4miEVoBA2f0Cm
X-Proofpoint-ORIG-GUID: j86XhrngGmigU0IeXrT4miEVoBA2f0Cm
X-Authority-Analysis: v=2.4 cv=ccnSrmDM c=1 sm=1 tr=0 ts=68babf73 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=4EjxHe3qrgCn2qlGiy0A:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MiBTYWx0ZWRfX05ZRer7L24Rt
 BxfS8vJRRHjtl3Q4YG2WjHsB7gFZYu7/l7eKXK3vMTHNM/afzGrZ2nP6raeuR2YtzexPwNMVnzN
 6VNvHtHXmDEORnkmnG4SWgEnAsz4sJdONof+ToIXgWiwA0spsJztqrfZ4syexO1W9MMKVVOmqm1
 8FMbSa7GCMM8dRuvQ67YLoS9N4fto6nUy6KZ9m8O4YshZe4NOq0W+7iHRw7K4SIOu5B7b8QiNg/
 Vx30s7BzutF6Ze5alrJdBVFfc9s8feLO7QwJNRP5tert9fXpl3ZVmfkra/sNr8VHP7xYgr2/hxt
 6W3PETBx75hQhW7G+gPcKm6D065ClPuSyohncgCH9ry0+WO4fBqlT3Hf4uNn4yFKJtyZLIBrIwr
 m2WafTEd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_03,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300042

On 9/5/25 11:40 AM, Mohammad Rafi Shaik wrote:
> The current implementation does not configure the CPU DAI format for
> MI2S interfaces, resulting in -EIO errors during audio playback and
> capture. This prevents the correct clock from being enabled for the
> MI2S interface. Configure the required DAI format to enable proper
> clock settings. Tested on Lemans evk platform.
> 
> Fixes: 295aeea6646ad ("ASoC: qcom: add machine driver for sc8280xp")
Why? this is not a fix, this is an enhancement to the machine driver.

> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---

other than that,  LGTM

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini

>  sound/soc/qcom/sc8280xp.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index 73f9f82c4e25..2fd06354923a 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -32,6 +32,9 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
>  	int dp_pcm_id = 0;
>  
>  	switch (cpu_dai->id) {
> +	case PRIMARY_MI2S_RX...QUATERNARY_MI2S_TX:
> +		snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
> +		break;
>  	case WSA_CODEC_DMA_RX_0:
>  	case WSA_CODEC_DMA_RX_1:
>  		/*

