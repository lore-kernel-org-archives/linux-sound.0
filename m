Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0A3346E4E
	for <linux-sound@vger.kernel.org>; Thu,  7 May 2026 09:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778144587; cv=none; b=m91fnw+8SZch+5grtDMeCV9qghP6xBCa75fmBUDDv+RbJvhUI6xXCCAbqWUJJj1y0hZPKox0L9LMP7vuA9zk4BHT+fNLQQTq6PcmCDyS6rc/IrsETnkTD+sRpqDLeULgIop+8RppNIQad2QtORCufTld1Id/wnOmIxYjNV4YYPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778144587; c=relaxed/simple;
	bh=5aI9ufeEspbP6oC6uFRabDZP0aBxIPK41cWs+AYJpXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RnlqQcRnOM+/xA4hnqi2rmgx8L17TAII7iDAEPkatfoICauGctvxWVdIyK4hVsx4ZqD1J0wQ8VyeHJfzQJW/UyU2yRM14QToInnuZWRG3H7DA0pPAp+UuV/IJUe/cRcpYxXxKu2cTOnwcfxhuPZ07QiPEBRaXXjWyx2hK1bHbro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JyjiVLNX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XuvmNKjK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JyjiVLNX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XuvmNKjK"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475Psvn3924293
	for <linux-sound@vger.kernel.org>; Thu, 7 May 2026 09:02:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZGaXOPh/VhtEqlgASKzMxEBSPnFHvs3T2iviND934Wo=; b=JyjiVLNXyQm0DlBZ
	10sXw+5GiBcd6zTMT8pKGu72TAosSsyWzXI+0ZB0kT68Qt+BeBaxlCHuXK4M9o9M
	YnrYveghdPyhg1CUgNFhcvIz2qYDNVTOfZkhzfNGlfCtk69QUdJ7LdROqwcS+1Vp
	TiegUKKesEAX0WH/TOicWso8mNCrGZyxb/jNcim7igzvKLDUBmIRDPCkmGXgfqIf
	SKjSJOLfyQ+y8wXbuHTcL3PNrk6ZYUTE+YssNqloTur7RlCQcEsnNIWjNYTPnjB2
	Tv6VzJnUleekidXr1Jq4n3n9sKeVZtQ4vVX9B6d5HZMtv+29LlbgEk324aM07QTm
	E/K7EA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0c88abxy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 07 May 2026 09:02:56 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-57539d5391dso1476464e0c.1
        for <linux-sound@vger.kernel.org>; Thu, 07 May 2026 02:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778144575; x=1778749375; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZGaXOPh/VhtEqlgASKzMxEBSPnFHvs3T2iviND934Wo=;
        b=XuvmNKjKdNRCefo9bUOI/rJBHRT2yy0nU8NnPTNqvehSOUh9ZkvrfkLkVl8mekRm4s
         K6rrvHAjXnOsoHHFyq0C9LJVwWbhQjG+TAKCI3Ah5SduHJQxFcp8C2EYgZNiwfAjsm2c
         g4Q3mj36gHmSXn7o87vC2iO06M6QJ48gSqMgcSCcC8LkkW6OI0vSXx27BXcCKEgOPOJU
         lKxcOxG0f9uPZuxm9ksJUnLh6HLMTzzvwgcUEK2qvLW0li/b6DFZKiR4WqoCZ/jbJ0Dz
         fw4NAwHR9UvavsSCEpvL4a+iOfo7jza7iv+c2OaUBSOsrXdzf4pnZR6bwICDqnzZph1T
         5W3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778144575; x=1778749375;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZGaXOPh/VhtEqlgASKzMxEBSPnFHvs3T2iviND934Wo=;
        b=FNWtkxckVFgJBom+syoG2KRXIwVPw/VM1eOM1V/gJbVGEWptNoYHJkEqkjmSp/Adlq
         6QKArbW7E63VHtVAq7193AWBHhv/7e7u2B67y8A7OmcB6hru3bhaC0uW+GY3G9DW6ab8
         LcXaHCeQyHmXa6iNQ7cRNzHPTU/nFKzmtVDGUz3bhvHMHaW1RqAoMuWlbD/yBSlDCXdy
         AIc8e3Uaf7aaAjiLqy8WQpj2EzdE0swfttcitA42lu1Fe26+P+TtEYwc6B2o3NAUvrao
         kdFyKWEHx3WimQ7dglZM9eIJh3kDjm0itmaOWeIZwEi64P2bxbZWjhEwRgAAPWPEvxFQ
         Wi0A==
X-Forwarded-Encrypted: i=1; AFNElJ+UefvMbKk/kXlzZtvQTMPYzEZYwoOrOmVqNrjdh1AYIT+eLnlLr4msZAokA/FdOycTgh8zQ8CE0UowlA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4q6uNIbn+4XiZWzUMugZSJ10NwSYN7wbqG8OaPo1l6VixKXGP
	X/3gDa3HcSwzKnKysq0kUsIbbE09TcfKx1YIkvkgqm/eW5fYp/ElH3RUEESeM88u/e8r60ID7cR
	bih6zS0m87Yz81Ixz+J7T70zacV3FhMGYo+ynG11htl2pVZG1+4IDjLNBgM5m10iAVw==
X-Gm-Gg: AeBDieseootvaV8B7GAF4oIAwWaaIK/FS2pDXEOmhQVWGQEyXhU2143Bn75GeZpCjG7
	bbHSHlUaUJ9vf+UK61++gzvnnJhOb+V8NCPSlGanQq6KPqDpyiDiAAegkwIKZTvBka574GUja40
	KSUYnraZBWwZuAZgvP8YbCCJrHlES6Y8HFngZ+Z8G5X2aNGNiLkW7ZgbU2so/n5x5gpmrwJLrSh
	8j3uRiv0txtfpVahHA/UlUZlXNEOUoTyVkvjq/3/vyTkMlbyBmdyfXIls7kyalbf15ZGZ4Nd3dx
	x4/MeGNlOe1UBXOYwRHYBOxMR0LdLSL/h1TMuyWhnp0RPQUMWrGI3PO+DmFqd+ksUndz/m9DHWl
	JFjYHX8aMEtYTtnDOVB+woEAMcOH5klwvLb48yd2rFnjHt/mD3+5IILN5a0Q=
X-Received: by 2002:a05:6123:a8:b0:56c:ca03:b668 with SMTP id 71dfb90a1353d-575595d0087mr3834632e0c.3.1778144575612;
        Thu, 07 May 2026 02:02:55 -0700 (PDT)
X-Received: by 2002:a05:6123:a8:b0:56c:ca03:b668 with SMTP id 71dfb90a1353d-575595d0087mr3834615e0c.3.1778144575212;
        Thu, 07 May 2026 02:02:55 -0700 (PDT)
Received: from [192.168.68.112] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-bc8351448a8sm58349766b.50.2026.05.07.02.02.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 02:02:54 -0700 (PDT)
Message-ID: <2f516258-d71d-4b52-a310-1b6ea11455ed@oss.qualcomm.com>
Date: Thu, 7 May 2026 09:02:53 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] ASoC: qcom: sm8250: apply codec_fmt to all codec
 DAIs
To: Val Packett <val@packett.cool>, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Bhushan Shah <bhushan.shah@machinesoul.in>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Antoine Bernard <zalnir@proton.me>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260506204142.659778-1-val@packett.cool>
 <20260506204142.659778-7-val@packett.cool>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260506204142.659778-7-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 66-NkQc9k0PTeI40H9e_FCfu-EfSFOOo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA4OSBTYWx0ZWRfXycFnRbNr6ZWK
 q5mO/AfnZ7X1nvvQ3pO+DR7DqQBfjt8ogWzuWJ5amcOA3/zgdmJ5am/bK9K82omQ2zkvI5BJrHT
 kjBamRehZ9e9TFv9vqk2OyRjkG15b83J4aKcU2P6fmgaxjs+ekY6+LyCHzsUF7DWF0ZuDqVD8hK
 MbBqVL/7ihln16qPIutkah6ORoInUOLRfrd5FxP6GWBTpWGcghw+BeG1deMnZVWjgGbTkjX1/Uy
 mtOmfgyTpwa0GGkN3pgmB22eov1G6aqOlxafgiccm13wav7hVpGM438p0aSuYuboF8LwWIlkvpR
 wlyJTmDcfFGFGu85Jil+oE5SQa25VCgvCRqhbHpJqSl3OwtDjfJWrZWuybPSqEH1mMibJjXUeNj
 KDzzVlKPRO59/yo5wu31NC5jnp9m4ZNO8TaMPnbRl2utNm8NVaUbd1nR6lF/IHr1wA7njd0RYBx
 JaPB74bTtinkFaiVf1Q==
X-Proofpoint-GUID: 66-NkQc9k0PTeI40H9e_FCfu-EfSFOOo
X-Authority-Analysis: v=2.4 cv=X8Zi7mTe c=1 sm=1 tr=0 ts=69fc5540 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=uMHxBK8JrORPa0cVsrYA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070089

On 5/6/26 8:33 PM, Val Packett wrote:
> With MI2S and TDM interfaces, multiple codecs typically share one bus.
> All codecs on the bus should receive the same format configuration, so
> apply the codec_fmt to all of them.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  sound/soc/qcom/sm8250.c | 33 ++++++++++++++++++++++-----------
>  1 file changed, 22 insertions(+), 11 deletions(-)
> 
> diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
> index 9f0f846a14bb..7bfe6d282231 100644
> --- a/sound/soc/qcom/sm8250.c
> +++ b/sound/soc/qcom/sm8250.c
> @@ -167,7 +167,8 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
>  	struct snd_soc_card *card = rtd->card;
>  	struct sm8250_snd_data *data = snd_soc_card_get_drvdata(card);
>  	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> -	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
> +	struct snd_soc_dai *codec_dai;
> +	int j;
>  
>  	switch (cpu_dai->id) {
>  	case PRIMARY_MI2S_RX:
> @@ -177,7 +178,8 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
>  				Q6AFE_LPASS_CLK_ID_PRI_MI2S_IBIT,
>  				MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
>  		snd_soc_dai_set_fmt(cpu_dai, fmt);
> -		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
> +		for_each_rtd_codec_dais(rtd, j, codec_dai)
> +			snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);

failures ignored,

Can we add a helper function would be nice here.

--srini

>  		break;
>  	case SECONDARY_MI2S_RX:
>  		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
> @@ -186,7 +188,8 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
>  				Q6AFE_LPASS_CLK_ID_SEC_MI2S_IBIT,
>  				MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
>  		snd_soc_dai_set_fmt(cpu_dai, fmt);
> -		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
> +		for_each_rtd_codec_dais(rtd, j, codec_dai)
> +			snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>  		break;
>  	case TERTIARY_MI2S_RX:
>  		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
> @@ -195,7 +198,8 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
>  				Q6AFE_LPASS_CLK_ID_TER_MI2S_IBIT,
>  				MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
>  		snd_soc_dai_set_fmt(cpu_dai, fmt);
> -		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
> +		for_each_rtd_codec_dais(rtd, j, codec_dai)
> +			snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>  		break;
>  	case QUINARY_MI2S_RX:
>  		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
> @@ -204,7 +208,8 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
>  				Q6AFE_LPASS_CLK_ID_QUI_MI2S_IBIT,
>  				MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
>  		snd_soc_dai_set_fmt(cpu_dai, fmt);
> -		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
> +		for_each_rtd_codec_dais(rtd, j, codec_dai)
> +			snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>  		break;
>  	case SENARY_MI2S_RX:
>  		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
> @@ -213,7 +218,8 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
>  				Q6AFE_LPASS_CLK_ID_SEN_MI2S_IBIT,
>  				MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
>  		snd_soc_dai_set_fmt(cpu_dai, fmt);
> -		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
> +		for_each_rtd_codec_dais(rtd, j, codec_dai)
> +			snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>  		break;
>  	case PRIMARY_TDM_RX_0:
>  		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
> @@ -221,7 +227,8 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
>  			snd_soc_dai_set_sysclk(cpu_dai,
>  				Q6AFE_LPASS_CLK_ID_PRI_TDM_IBIT,
>  				TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
> -		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
> +		for_each_rtd_codec_dais(rtd, j, codec_dai)
> +			snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>  		break;
>  	case SECONDARY_TDM_RX_0:
>  		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
> @@ -229,7 +236,8 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
>  			snd_soc_dai_set_sysclk(cpu_dai,
>  				Q6AFE_LPASS_CLK_ID_SEC_TDM_IBIT,
>  				TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
> -		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
> +		for_each_rtd_codec_dais(rtd, j, codec_dai)
> +			snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>  		break;
>  	case TERTIARY_TDM_RX_0:
>  		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
> @@ -237,7 +245,8 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
>  			snd_soc_dai_set_sysclk(cpu_dai,
>  				Q6AFE_LPASS_CLK_ID_TER_TDM_IBIT,
>  				TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
> -		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
> +		for_each_rtd_codec_dais(rtd, j, codec_dai)
> +			snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>  		break;
>  	case QUATERNARY_TDM_RX_0:
>  		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
> @@ -245,7 +254,8 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
>  			snd_soc_dai_set_sysclk(cpu_dai,
>  				Q6AFE_LPASS_CLK_ID_QUAD_TDM_IBIT,
>  				TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
> -		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
> +		for_each_rtd_codec_dais(rtd, j, codec_dai)
> +			snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>  		break;
>  	case QUINARY_TDM_RX_0:
>  		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
> @@ -253,7 +263,8 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
>  			snd_soc_dai_set_sysclk(cpu_dai,
>  				Q6AFE_LPASS_CLK_ID_QUIN_TDM_IBIT,
>  				TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
> -		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
> +		for_each_rtd_codec_dais(rtd, j, codec_dai)
> +			snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>  		break;
>  	default:
>  		break;

