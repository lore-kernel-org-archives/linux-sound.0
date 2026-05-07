Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464183806C8
	for <linux-sound@vger.kernel.org>; Thu,  7 May 2026 08:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778142905; cv=none; b=kExnMV+LgGPl43GOB++LsNT2JhmwYxQvCA440rJi8s3rC11HfiLo81aJyeaqDsbeKmO3Vk9v60n+dzunUSO/Q0IRbPRCAsT+6NBJsrMmBSRiLGzckOfuWiUpjSq4xlFUolxEz/u9t7wIVQyh4HTbkUPPDyACS7y8vyiHyOfBHiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778142905; c=relaxed/simple;
	bh=LMqROSuajz+PWuBt0xHHNxUH2N+B0UWtP08N5eUq/EY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nf5TQQyt7LLbbcBeuzUWkTe0fpdbsmVtokPU02GOwCL/Rp6sSqPje6VT29scI+W/dKDSvTbtHKKxzSWcNG7ELHwzmwPjWRfi/yQobYIzLZxFj9xBePDlbHsCaY9kFhQW0A4JUXLLG4SeH+HiFnV2zLHpubN4JIYseYvtfCVJQPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NXU4aRlS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GoGdyGom; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NXU4aRlS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GoGdyGom"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64744AoI151144
	for <linux-sound@vger.kernel.org>; Thu, 7 May 2026 08:35:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZLEprv08ng8QG4vA0GtRduxj5Wj+FiN0/pWFH+mdbAQ=; b=NXU4aRlS/JmpC5eR
	cUlBEq8qGqxgW6cfAxwVVUvXABKgoKQwHwXKDJ0M/MwZtL1tvqB9l2IygQYo4HWk
	WvXIcZT3o5AFiTheHs+9HXFceIjGDaSZ4l3YnLmFyEWM11hdpZpGLmf8QtJWmsqj
	hkIYutdAfDWRS82ZpuOVfyrkAonzScCr07zYbI9b+nlvPoQvbcOVGBMXuu+kZuzB
	AVUJ2Mcg0bMV3db/K9wuiYuJ15uD/GqRH7VxqbiW/SuzlieemXdDE7j1brNP3t28
	YVcXFtDNeb9VyzeS6aR+finbuN9HNi/G8Wi1JKcMron3uUy+E7SnmVuWR/BlB4yM
	QEidkw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kctrxcp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 07 May 2026 08:35:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d8ed08aa4so18332771cf.3
        for <linux-sound@vger.kernel.org>; Thu, 07 May 2026 01:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778142899; x=1778747699; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZLEprv08ng8QG4vA0GtRduxj5Wj+FiN0/pWFH+mdbAQ=;
        b=GoGdyGomDuly17nT7Sjtn2mBXLekLBOjFNtbacHcqs/2TYU2cRMjCyNj5HNi0iE08T
         e74NNNxQlbZg2CI3XHj6dJ4IUxUVRuHCgWMh7rYpLAWrPQ06Xinnj+NAYiWAVImWG2d0
         wGEeUffWcaKmfg+g9okXwvSs9gNWijvPzGj+G2s5svDiQYuD2quBAetICTDezH8iR5eg
         FfaUIMMg67fVsgJ99HjKm96pOHg8vUQeG5zE4dRqaNvkjfg12lx9cAGSBO85CCfkSRae
         WcnN49YssLS/ZB7mtQWPTB5u2Ge/17+fzexJrZrs2DdLd6pdC0J5ld47ktjcb6h2o6B6
         w2Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778142899; x=1778747699;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZLEprv08ng8QG4vA0GtRduxj5Wj+FiN0/pWFH+mdbAQ=;
        b=Z2OwYhpOut/GY7F4vEmoCD+leKS0rsouwJL1hQe/9BNj3Qz8j0LREZFd12AxBbKhEp
         0Twxjcd5kDSIUW0SKnTFmDeMou1F5cLdmU1dY0QiSYOHpgCHG8QOiQ5VD2LlbrDv7AEI
         vc1Kl6cIptVqqw2WzNX+0djmx2bz1zVB+SJ5mCLqPKiqnTPoZ0VMFC0PRT5WYbuB0R+I
         WwxLxA8bf2Dyfx5cmEZTicqdgFrHSWxyrfmsRwH3Zkb6t+MsYNQGPke7OwlCrPU6npTs
         F3arXBaVK5kpXIiphf3GJRcuIMa/XZUc5/T627RmZsAtpQ/1eeDf2vFu9ex0MKEAL9I5
         Jcaw==
X-Forwarded-Encrypted: i=1; AFNElJ+fKNgiXokFecu8TiSpTR1mZmty1xBsu2BG3R6kmKEIVjoo9eJGe19haZnUGihbQQUeeHf+QpQKbHa5kA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf/dwrq/tgyEixhaPNgsUzMS9OPurmEuHw2F6uqJjnZ7XLseRS
	5/BXEtN1YJlCnRn0x2QolMLnjsq7KFEC2rEgXmMF85N9EWHHGYx2Zp7Hvt/JRpoVXfCOHh6j4V8
	YJYi65P+aGVOj7upfFF42rjmdnmkHM5KJb4a1SHLePbYuwVkdgrbHJh7J/E7nVxrMLg==
X-Gm-Gg: AeBDiest/ArBEwJ8nPudJzXWxvZJ6l65ItoheUx3KTS04W52vEu/ojCqbrPKDE6pQ8z
	pj84JBb2XvEt0s1Yg542ZAku+ACuGn2A23jrYbjvCrEuHPwaoeMJxltEke2UZ3IvrgPYth17d1P
	77i1H2n02fz1gGThXO1e7wRhUy7v1FEZ2oUVV26YKGApz6xi86zIXFR1H54ef/so4IhY9Fci/aW
	jSw28kYIzezQHbGat5E5d6yybBpggEPUXZjWL+tSzORLAppWaG4RtWAxINGpKxydPxo1wXGG+Zs
	9ipdyGM430IauNyQQ5wiusV99q+4MNdhvAduE1ySSMqg8jXxrEbiqAlSSWV5MLTpaA4KTBlbRR8
	Zt5Jalu+Dg7Hj0F1i/lT3xSI9Y8YipBORxNuBIO14IJ9ENqQJhwyspbV93ME=
X-Received: by 2002:a05:622a:620a:b0:50b:2d93:97bd with SMTP id d75a77b69052e-51461e671d4mr94196141cf.24.1778142899539;
        Thu, 07 May 2026 01:34:59 -0700 (PDT)
X-Received: by 2002:a05:622a:620a:b0:50b:2d93:97bd with SMTP id d75a77b69052e-51461e671d4mr94195901cf.24.1778142899098;
        Thu, 07 May 2026 01:34:59 -0700 (PDT)
Received: from [192.168.68.112] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-67cd904fe68sm1872140a12.0.2026.05.07.01.34.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 01:34:58 -0700 (PDT)
Message-ID: <f586f504-ab76-4641-a80c-1ba7cc2d58a8@oss.qualcomm.com>
Date: Thu, 7 May 2026 08:34:55 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] ASoC: qcom: sm8250: add Senary MI2S RX support
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
 <20260506204142.659778-4-val@packett.cool>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260506204142.659778-4-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XsPK/1F9 c=1 sm=1 tr=0 ts=69fc4eb4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=-T4oWIldSm4hssfr7QUA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: AqaOfMkK7M7vB5sqN1NujC9xfl_PeQPu
X-Proofpoint-ORIG-GUID: AqaOfMkK7M7vB5sqN1NujC9xfl_PeQPu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA4MiBTYWx0ZWRfX2bN2tslIbCnH
 uVP38TLwdoalmTGefkI1upd7k3Vivaj/l/sTul69JgGSaquOY4bHHAOHM/qaVRg1JXdNmzSp7Vb
 /KiOuXQ0YOmZAXCjswWWZOF4n4WqkRgottAws56CMKg83p9+nap83v5n9qVSsbB2mucrokX9BYA
 RiBT9xgtoCGWvsLDRWaZ9blB/o7PBmqnXS3mYFskLANaIWtBxpe3MaZYOuL90ZXruyKlGQicVxe
 bXTIVU1nLkjR2YJe3Cv4NGEd3XB1s9pdBug63Nj00O8bCNtyhaDJ4eO6nCqBtmtg8AVheGyTX4F
 6P7X211mFlfckShH5U2mnvhUAa8nTTsZ1PyvtUEzDK6zyALf/jxm0p3JyZeewVMhKLz1gcy+4+l
 5qWSJbGMVVjaPAWjOZJNr5DO9mhm9TpNJmJOSeAhW1AVSTWhF7crTuODFOj3+5XJe0hdu++uSXy
 6i5mjIlnhwEAw548hBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070082

On 5/6/26 8:33 PM, Val Packett wrote:
> Add support for the SENARY_MI2S_RX DAI which is used on some devices to
> send audio data to speaker amplifiers.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

>  sound/soc/qcom/sm8250.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
> index f193d0ba63d0..a675913da943 100644
> --- a/sound/soc/qcom/sm8250.c
> +++ b/sound/soc/qcom/sm8250.c
> @@ -112,6 +112,14 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
>  		snd_soc_dai_set_fmt(cpu_dai, fmt);
>  		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>  		break;
> +	case SENARY_MI2S_RX:
> +		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
> +		snd_soc_dai_set_sysclk(cpu_dai,
> +			Q6AFE_LPASS_CLK_ID_SEN_MI2S_IBIT,
> +			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
> +		snd_soc_dai_set_fmt(cpu_dai, fmt);
> +		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
> +		break;
>  	default:
>  		break;
>  	}

