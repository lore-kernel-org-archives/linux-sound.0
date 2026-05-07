Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BC43AEF4A
	for <linux-sound@vger.kernel.org>; Thu,  7 May 2026 08:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778144252; cv=none; b=HnRNKG04MLzHBUVBZFAEqQpwxOyk3OEoHGTh0ju4j6LnIYNBph8EhAi6RBZcI5EB3GVJi6bpgBADyNqgmS5OHMmgexMSXHEnUryr4CjFbZG69aNH4MtEvoSqZpkl9GZbbhH6gQQKqOfolzXv8NjkyILLfbRocu0vNXhJA9leVdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778144252; c=relaxed/simple;
	bh=+WoGGFhtYcbQJjAFrWKoyIYd7RIh1Y7qXYNblfctVHI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N0YyWnENjdH9tIbPxk3XDSUkTyQLlhJXzwW75QVY3tn194JFAKJ60+Dv300A/y3oe/FibNMvKyDBL4+1Ee+w2Sk8Gwu5EbsESyCUL76SXMvtFHujn9opFm4GEH7OTr7fHD3n3FewNIXFCx4e/b5xWnLqs8GHbVO1WqAp+95XQzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X1gDRLoh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RX7z+Res; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X1gDRLoh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RX7z+Res"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6478q73f259326
	for <linux-sound@vger.kernel.org>; Thu, 7 May 2026 08:57:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HwnTa+6y8iyblD7EtUXT7iF9f1ove6W57rU238ZGCj8=; b=X1gDRLohyveGUNtG
	mlNMvk8XAuiAbp+n+u3A3xRxNeXCWIF0JJQbY1bWuo9ryItdV1h8WclUaOq3/E2D
	3+/qrK74OZjqor/mSUq+jGKl7oBl6d0kZixzIi0KtdE4fYM4qytFju6dM1AgLflk
	9viD/2rwnnoGAAYMqKm7QKx3iPZjyA6iOa4kEPqYTTSNwc4XFUoDw2Ep4kDC7Hqa
	Tmrsyeb9l80N9bFDelBbWSl/HPEWhdCVpZxnPPiW/9clVfjLBxsBfWxQDY1PPSJO
	/eiBLn9p4pNG8sp8sDgQBQG2bHXns0BjHV0QoXDGZEkE+TRXTkQOF8OlS4YFYkyt
	kDbwuA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0hr8sbbd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 07 May 2026 08:57:23 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d890580e1so9241371cf.3
        for <linux-sound@vger.kernel.org>; Thu, 07 May 2026 01:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778144243; x=1778749043; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HwnTa+6y8iyblD7EtUXT7iF9f1ove6W57rU238ZGCj8=;
        b=RX7z+ResmH83kUOm8V10wAXRrGiwUoLGVby0Ku8f+i4EY4TgJwHd4OTpErtQLnt5qp
         3KvSljMfuzXfR/P0ZUPeqRAZ1jSQvT7m/nv2YYBDTKDFhzA+/X/hpBdaFYQdFvT3nHo6
         uUaSeZLwORyW/QbC/cFq1Tdkqt/F45zv21p9ZA48qfyYHWVOiXR2yjQcbwGfhqebreW/
         7IwoPnTgTyypBtwtjnuOWAKHAyf0OIW/hwSfovSpqztUE+QSl2WMJEZ5SmjrayiYTbqb
         0VnL1y813Xwp3AghW3JiAII1ynFYW/ZCtEWwWYEgX+V2ZfLAMu4Cn0NVjPoed4wYj4Ii
         HcbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778144243; x=1778749043;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HwnTa+6y8iyblD7EtUXT7iF9f1ove6W57rU238ZGCj8=;
        b=QhsaE0HFQCDQkm26XWI6rAZCCHjeJKj8lb+GXFlQvfbleeEZMcPAxCEq32Pk7+DS2t
         VxhjwjAc88SUkUpTA5++vduSW5ouzFKakHdR95L52K1EL8twoUc3Q3On0DCd5bQNj+CL
         xuzDnC0KS/wBw9EFhK6XVhGX6qx6vgqORY9LAqHaf50ZGMRsMbdpish4zEB53YC3Y4PW
         ek1r8xLm6MuOzANoDP810bb5DWlRDP3jGrTJq5xTfMFt3yPgk3qkusyoBgcU5356DEzc
         /Az65bR1SVP626mfQISkx0kSmFwhHbQUZfAqK5h8kld0mj8/GYAsxTY8SefRtLmG9Kvo
         f7Cw==
X-Forwarded-Encrypted: i=1; AFNElJ9qHywuQvCOnvzE+lPDJ3NmO/y6ZlUS3y548NBUfDosWmWwiVqbJSZCA8QuD28QFzZauG1SVSJBoiS0rw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiGOb99WjuFPrnVXtMlq7h2hRUi6HIH67Exb4iI49peS6hOfeE
	ywHFR1eC5XgLj2NFPG41p2osWpt6mrP/I5Yjx1LE7JSHBKnBcMtHgW077sg/cRfE4ZiGVMkJHIB
	F7IsZU7KFiHG6EotTA3FDD1wlPrftWwavISdGhBAM2opBRLuLVTvJAh4egPRmdGCe9g==
X-Gm-Gg: AeBDieumlQzhD0FD/j3MecCMz7Ary/xrmylBe5w5yaGdjQ6r+YhwTGpxU8tOTGKuD5Q
	qn+Rmdcp7btHeRyVqFpfoV0/q3GL893Zb0Y7/7RzW7GeJf8p8at3+rEjFIchJixu+Qv7OBPWmhp
	nqmzPACtYYoRdMu9lbYwtnNPkPpENMG7/sc2aDN3iU63d5lZBck9eDr6PmrWLqDVnD/wUb8oJsy
	8mDyH/+KUxW9UnojJjvpYhugn+4Aep7+fwOcL3g1cl+VFrQ7toiO3zQvy0Eol7WJtzzqDgPDHOg
	U9/m1dHu+5WfOzN0jBWL0GPELZsqANL+3/UF91l48IpVIj8hqsFL6rVGAkpXNZtpNNUly7m7/gr
	ZgscNDha7XraX9cOVK38EF5GsfLMNCGqebF1oI86qnQj7uP6uJ1FGXEP1bwY=
X-Received: by 2002:a05:622a:1813:b0:50f:bcfe:e8dd with SMTP id d75a77b69052e-51461be0535mr98108141cf.8.1778144242716;
        Thu, 07 May 2026 01:57:22 -0700 (PDT)
X-Received: by 2002:a05:622a:1813:b0:50f:bcfe:e8dd with SMTP id d75a77b69052e-51461be0535mr98107161cf.8.1778144241048;
        Thu, 07 May 2026 01:57:21 -0700 (PDT)
Received: from [192.168.68.112] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48e538b26a3sm201855315e9.9.2026.05.07.01.57.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 01:57:20 -0700 (PDT)
Message-ID: <dd0e22ed-e464-4d61-b354-b396f9694976@oss.qualcomm.com>
Date: Thu, 7 May 2026 08:57:19 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] ASoC: qcom: sm8250: shut down MI2S/TDM AFE port
 clocks
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
 <20260506204142.659778-6-val@packett.cool>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260506204142.659778-6-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: v6kHTyTVrhIl5WSzLhprO0VTKUmqeRBA
X-Authority-Analysis: v=2.4 cv=caHiaHDM c=1 sm=1 tr=0 ts=69fc53f3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=OxOCmRKzI9gie0uB-wgA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: v6kHTyTVrhIl5WSzLhprO0VTKUmqeRBA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA4OCBTYWx0ZWRfX4EvPiplHD06N
 imUVipINhx8f7f7P9y5uTF9wHByphCFhLFZU4dWscO5aly/axWnpQXyUUD5rBQHbagm13LpUUeN
 Rr/KOusoULddHZZssZbGYvtwOsxlBUdWFgdkm+xCO9OJ7PXCDRbigh/oPmMGysIdj3wyu2uf0+K
 m1HNRvGmyIvRa/3ifcYoYKfjB5VEjZyC99QnXxywAQeMpfnc+oeuYqG4Xhhi1TF5naa8w5egXCA
 rrmmfMeeFJ9QNZsiNeulLl/ZDOmtVvPgwLgL8rwSbWV9NlR5Rya+87y/AZD0Pzil9A1vnaErLJw
 RlOQqO9tBmpxRPwnQtRxvYldn+IXM9VSdVrIj5C/VdNWhA46oZKGbbaSC2jtx19QqcRclH9js9I
 2hJl9Q4cPpm6ET87gO+l2rFDwac9eevcQLOn0EXkRa+IHhi+ieuYn/uHiNyUJ8cRQHNnuinPXLX
 OTO5HVJWtfC76eULSuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070088

On 5/6/26 8:33 PM, Val Packett wrote:
> These port clocks were never being turned off, leading to increased
> power consumption after a sound was played through any of these ports
> for the first time. Use enable counters to disable the clocks in the
> shutdown callback, similar to how it's done for sdm845.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  sound/soc/qcom/sm8250.c | 150 +++++++++++++++++++++++++++++++---------
>  1 file changed, 119 insertions(+), 31 deletions(-)
> 
> diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
> index b64fd3970ba1..9f0f846a14bb 100644
> --- a/sound/soc/qcom/sm8250.c
> +++ b/sound/soc/qcom/sm8250.c
> @@ -24,6 +24,7 @@ static unsigned int tdm_slot_offset[8] = {0, 4, 8, 12, 16, 20, 24, 28};
>  
>  struct sm8250_snd_data {
>  	bool stream_prepared[AFE_PORT_MAX];
> +	uint32_t clk_count[AFE_PORT_MAX];

In your setup are you sharing BE dais to multiple FE?

if not you would really not need the count, startup and shutdown are
paired for single PCM stream.

If yes, then you need some protection against these counters.



>  	struct snd_soc_card *card;
>  	struct snd_soc_jack jack;
>  	struct snd_soc_jack usb_offload_jack;
> @@ -163,83 +164,95 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
>  	unsigned int fmt = SND_SOC_DAIFMT_BP_FP;
>  	unsigned int codec_dai_fmt = SND_SOC_DAIFMT_BC_FC;
>  	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
> +	struct snd_soc_card *card = rtd->card;
> +	struct sm8250_snd_data *data = snd_soc_card_get_drvdata(card);
>  	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
>  	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
>  
>  	switch (cpu_dai->id) {
>  	case PRIMARY_MI2S_RX:
>  		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
> -		snd_soc_dai_set_sysclk(cpu_dai,
> -			Q6AFE_LPASS_CLK_ID_PRI_MI2S_IBIT,
> -			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
> +		if (++(data->clk_count[PRIMARY_MI2S_RX]) == 1)
> +			snd_soc_dai_set_sysclk(cpu_dai,
> +				Q6AFE_LPASS_CLK_ID_PRI_MI2S_IBIT,
> +				MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
>  		snd_soc_dai_set_fmt(cpu_dai, fmt);
>  		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>  		break;
>  	case SECONDARY_MI2S_RX:
>  		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
> -		snd_soc_dai_set_sysclk(cpu_dai,
> -			Q6AFE_LPASS_CLK_ID_SEC_MI2S_IBIT,
> -			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
> +		if (++(data->clk_count[SECONDARY_MI2S_RX]) == 1)
> +			snd_soc_dai_set_sysclk(cpu_dai,
> +				Q6AFE_LPASS_CLK_ID_SEC_MI2S_IBIT,
> +				MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
>  		snd_soc_dai_set_fmt(cpu_dai, fmt);
>  		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>  		break;
>  	case TERTIARY_MI2S_RX:
>  		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
> -		snd_soc_dai_set_sysclk(cpu_dai,
> -			Q6AFE_LPASS_CLK_ID_TER_MI2S_IBIT,
> -			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
> +		if (++(data->clk_count[TERTIARY_MI2S_RX]) == 1)
> +			snd_soc_dai_set_sysclk(cpu_dai,
> +				Q6AFE_LPASS_CLK_ID_TER_MI2S_IBIT,
> +				MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
>  		snd_soc_dai_set_fmt(cpu_dai, fmt);
>  		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>  		break;
>  	case QUINARY_MI2S_RX:
>  		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
> -		snd_soc_dai_set_sysclk(cpu_dai,
> -			Q6AFE_LPASS_CLK_ID_QUI_MI2S_IBIT,
> -			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
> +		if (++(data->clk_count[QUINARY_MI2S_RX]) == 1)
> +			snd_soc_dai_set_sysclk(cpu_dai,
> +				Q6AFE_LPASS_CLK_ID_QUI_MI2S_IBIT,
> +				MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
>  		snd_soc_dai_set_fmt(cpu_dai, fmt);
>  		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>  		break;
>  	case SENARY_MI2S_RX:
>  		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
> -		snd_soc_dai_set_sysclk(cpu_dai,
> -			Q6AFE_LPASS_CLK_ID_SEN_MI2S_IBIT,
> -			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
> +		if (++(data->clk_count[SENARY_MI2S_RX]) == 1)
> +			snd_soc_dai_set_sysclk(cpu_dai,
> +				Q6AFE_LPASS_CLK_ID_SEN_MI2S_IBIT,
> +				MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
>  		snd_soc_dai_set_fmt(cpu_dai, fmt);
>  		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>  		break;
>  	case PRIMARY_TDM_RX_0:
>  		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
> -		snd_soc_dai_set_sysclk(cpu_dai,
> -			Q6AFE_LPASS_CLK_ID_PRI_TDM_IBIT,
> -			TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
> +		if (++(data->clk_count[PRIMARY_TDM_RX_0]) == 1)
> +			snd_soc_dai_set_sysclk(cpu_dai,
> +				Q6AFE_LPASS_CLK_ID_PRI_TDM_IBIT,
> +				TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
>  		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>  		break;
>  	case SECONDARY_TDM_RX_0:
>  		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
> -		snd_soc_dai_set_sysclk(cpu_dai,
> -			Q6AFE_LPASS_CLK_ID_SEC_TDM_IBIT,
> -			TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
> +		if (++(data->clk_count[SECONDARY_TDM_RX_0]) == 1)
> +			snd_soc_dai_set_sysclk(cpu_dai,
> +				Q6AFE_LPASS_CLK_ID_SEC_TDM_IBIT,
> +				TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
>  		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>  		break;
>  	case TERTIARY_TDM_RX_0:
>  		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
> -		snd_soc_dai_set_sysclk(cpu_dai,
> -			Q6AFE_LPASS_CLK_ID_TER_TDM_IBIT,
> -			TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
> +		if (++(data->clk_count[TERTIARY_TDM_RX_0]) == 1)
> +			snd_soc_dai_set_sysclk(cpu_dai,
> +				Q6AFE_LPASS_CLK_ID_TER_TDM_IBIT,
> +				TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
>  		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>  		break;
>  	case QUATERNARY_TDM_RX_0:
>  		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
> -		snd_soc_dai_set_sysclk(cpu_dai,
> -			Q6AFE_LPASS_CLK_ID_QUAD_TDM_IBIT,
> -			TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
> +		if (++(data->clk_count[QUATERNARY_TDM_RX_0]) == 1)
> +			snd_soc_dai_set_sysclk(cpu_dai,
> +				Q6AFE_LPASS_CLK_ID_QUAD_TDM_IBIT,
> +				TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
>  		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>  		break;
>  	case QUINARY_TDM_RX_0:
>  		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
> -		snd_soc_dai_set_sysclk(cpu_dai,
> -			Q6AFE_LPASS_CLK_ID_QUIN_TDM_IBIT,
> -			TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
> +		if (++(data->clk_count[QUINARY_TDM_RX_0]) == 1)
> +			snd_soc_dai_set_sysclk(cpu_dai,
> +				Q6AFE_LPASS_CLK_ID_QUIN_TDM_IBIT,
> +				TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
>  		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>  		break;
>  	default:
> @@ -249,6 +262,81 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
>  	return qcom_snd_sdw_startup(substream);
>  }
>  
> +static void sm8250_snd_shutdown(struct snd_pcm_substream *substream)
> +{
> +	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
> +	struct snd_soc_card *card = rtd->card;
> +	struct sm8250_snd_data *data = snd_soc_card_get_drvdata(card);
> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> +
> +	switch (cpu_dai->id) {
> +	case PRIMARY_MI2S_RX:
> +		if (--(data->clk_count[PRIMARY_MI2S_RX]) == 0)
> +			snd_soc_dai_set_sysclk(cpu_dai,
> +				Q6AFE_LPASS_CLK_ID_PRI_MI2S_IBIT,
> +				0, SNDRV_PCM_STREAM_PLAYBACK);
> +		break;
> +	case SECONDARY_MI2S_RX:
> +		if (--(data->clk_count[SECONDARY_MI2S_RX]) == 0)
> +			snd_soc_dai_set_sysclk(cpu_dai,
> +				Q6AFE_LPASS_CLK_ID_SEC_MI2S_IBIT,
> +				0, SNDRV_PCM_STREAM_PLAYBACK);
> +		break;
> +	case TERTIARY_MI2S_RX:
> +		if (--(data->clk_count[TERTIARY_MI2S_RX]) == 0)
> +			snd_soc_dai_set_sysclk(cpu_dai,
> +				Q6AFE_LPASS_CLK_ID_TER_MI2S_IBIT,
> +				0, SNDRV_PCM_STREAM_PLAYBACK);
> +		break;
> +	case QUINARY_MI2S_RX:
> +		if (--(data->clk_count[QUINARY_MI2S_RX]) == 0)
> +			snd_soc_dai_set_sysclk(cpu_dai,
> +				Q6AFE_LPASS_CLK_ID_QUI_MI2S_IBIT,
> +				0, SNDRV_PCM_STREAM_PLAYBACK);
> +		break;
> +	case SENARY_MI2S_RX:
> +		if (--(data->clk_count[SENARY_MI2S_RX]) == 0)
> +			snd_soc_dai_set_sysclk(cpu_dai,
> +				Q6AFE_LPASS_CLK_ID_SEN_MI2S_IBIT,
> +				0, SNDRV_PCM_STREAM_PLAYBACK);
> +		break;
> +	case PRIMARY_TDM_RX_0:
> +		if (--(data->clk_count[PRIMARY_TDM_RX_0]) == 0)
> +			snd_soc_dai_set_sysclk(cpu_dai,
> +				Q6AFE_LPASS_CLK_ID_PRI_TDM_IBIT,
> +				0, SNDRV_PCM_STREAM_PLAYBACK);
> +		break;
> +	case SECONDARY_TDM_RX_0:
> +		if (--(data->clk_count[SECONDARY_TDM_RX_0]) == 0)
> +			snd_soc_dai_set_sysclk(cpu_dai,
> +				Q6AFE_LPASS_CLK_ID_SEC_TDM_IBIT,
> +				0, SNDRV_PCM_STREAM_PLAYBACK);
> +		break;
> +	case TERTIARY_TDM_RX_0:
> +		if (--(data->clk_count[TERTIARY_TDM_RX_0]) == 0)
> +			snd_soc_dai_set_sysclk(cpu_dai,
> +				Q6AFE_LPASS_CLK_ID_TER_TDM_IBIT,
> +				0, SNDRV_PCM_STREAM_PLAYBACK);
> +		break;
> +	case QUATERNARY_TDM_RX_0:
> +		if (--(data->clk_count[QUATERNARY_TDM_RX_0]) == 0)
> +			snd_soc_dai_set_sysclk(cpu_dai,
> +				Q6AFE_LPASS_CLK_ID_QUAD_TDM_IBIT,
> +				0, SNDRV_PCM_STREAM_PLAYBACK);
> +		break;
> +	case QUINARY_TDM_RX_0:
> +		if (--(data->clk_count[QUINARY_TDM_RX_0]) == 0)
> +			snd_soc_dai_set_sysclk(cpu_dai,
> +				Q6AFE_LPASS_CLK_ID_QUIN_TDM_IBIT,
> +				0, SNDRV_PCM_STREAM_PLAYBACK);
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	qcom_snd_sdw_shutdown(substream);
> +}
> +
>  static int sm8250_snd_prepare(struct snd_pcm_substream *substream)
>  {
>  	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
> @@ -287,7 +375,7 @@ static int sm8250_snd_hw_params(struct snd_pcm_substream *substream,
>  
>  static const struct snd_soc_ops sm8250_be_ops = {
>  	.startup = sm8250_snd_startup,
> -	.shutdown = qcom_snd_sdw_shutdown,
> +	.shutdown = sm8250_snd_shutdown,
>  	.hw_free = sm8250_snd_hw_free,
>  	.hw_params = sm8250_snd_hw_params,
>  	.prepare = sm8250_snd_prepare,

