Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48003845CF
	for <linux-sound@vger.kernel.org>; Thu,  7 May 2026 08:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778143916; cv=none; b=bmvM0+yQJZTeANM7dOHhfxGlfrtD9GkNEkQp0CSBgcOxInt3Xw/0d3t0MNOiBHB0jOSRIPsEGCOiqjlAkFI8yQ/R6Vx1H4hi/RgjQmccwO1tnf9s2f7IY8PQWX9AjDokQHeS6y4+3PIyN1RKpHd8e6li3Hpmf3rvn7tWgDsbCT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778143916; c=relaxed/simple;
	bh=Kd56bN3gu6uxbWvn3bhH3wHcIlXHeWTPMbpY4iQk8u8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MxvO9FA8u0jJNC+uoL3wGw/jSMPpLA7Pgkz8/a9BkBRlugoDJ5fqPu672KJqLSUkzaLPrwhNgt3iOUPDRUThR2jyaRiGLnm5gaNxeV7iXIZOVyyMY6u2vJlqEFlCUBvc1+2Q28XFTWd8sjcWvbmuNEUp/bwkg9ERWHv2CUfUitg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N1fLM1Z0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZyNNntsW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N1fLM1Z0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZyNNntsW"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6474sjSB3924172
	for <linux-sound@vger.kernel.org>; Thu, 7 May 2026 08:51:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cP3rLsoC5XmxHXQhD/dEud8ZcY5y3tuze8ltsJwAUjE=; b=N1fLM1Z0z+T1sCHU
	K6ANun0LFiP6FEB/8ZqKww0q1U9nHLArx7YZiOR93LjsaKjNn5iEG95fRBcIgzzS
	NvmNM5NHropjSbZxKI7KlbaiKdrwFPFelhCXK4ZipjHPMiU2K4tXJMexSHjqJctn
	XNP6eVQsxNLhVbBNNta9Ma29hXwash9VCbgVT0J7KiiX7mnaLnPwzEyufwSzEcyn
	wy4xnFgBtLbMS7Ee58d350tGjCLmNzxt6iBlqkG88vz1FbqXXhnI33jzPDy/8wOT
	3Q2daECDpExqQxHK1gTYbDgAbYxoUzac/o2ArDg0xTVN+0CGLVUR45BEAAgIComf
	xH+D9Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0c88aaa9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 07 May 2026 08:51:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5102a9671c8so13257621cf.1
        for <linux-sound@vger.kernel.org>; Thu, 07 May 2026 01:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778143906; x=1778748706; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cP3rLsoC5XmxHXQhD/dEud8ZcY5y3tuze8ltsJwAUjE=;
        b=ZyNNntsWPIwAbgw0URxu/nIwcurE9yuSb7N8mOyekYlZrhxvxNz2cFnpRfVHSYavFF
         o42CIUTC5blyQU/CexIMC5nqYGY7QZri/odzuTHvupgc/B0w2TuB/udh5K/SlgtArtkf
         c1mv2JCRL1tisuYrzPS7phwLu9afMDtoKnQ3wamT2eA6XvtUQC44BO+l7TmVCbPdCZJW
         K4sa8IWdA0BJbgaNNsE/+Z5jJv4yDu+2RIgSy/MvVIG86bgsLrsh7X4tu4/5KC05etoy
         Ekwi5YVuR/BQSlcPBhAT+nF1uae+4oZSioV8VxjNTpFAFmpUvjJFhx/GoswOQtplXhbQ
         MJsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778143906; x=1778748706;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cP3rLsoC5XmxHXQhD/dEud8ZcY5y3tuze8ltsJwAUjE=;
        b=FxwPF2Xt6zPNAXIs6cHh4VOn+kAqY/be5qRGVj/9C+29oO8ZuXDol5aU13CpqA2LFy
         dOL+j9diOLegq18wXQZbDB5Q1IqOr6SgiiNdNPyaWhjLOQKTv/ZsA9NcW3eRGNh5zlSY
         /3/ViLT83TM1EuH/08EMMPWPWo1o6rqPYWFSQEoqvxWgSsFGhkfsjUVxt44FYgiUKFqg
         CMhmzjoJsdit5K12wCApQ1dmrlPZLaOpzOkR9yxbFKnSwHaBBCUDM0oFIs58wAVxmB3F
         hobgq3Mq4A4HnwJ8xnuyIsMxOkpYFB7vfYnyVzYaDoFue6LVa9kDjA4M1Gq7VhyXa+BD
         7/Cg==
X-Forwarded-Encrypted: i=1; AFNElJ/cO4tCpKC2dz8zQm8JNFO6kWRJCsRjelPk2M12wVGifGFs9yRuOGV6hDj2bQps25Q5wQij+YxL93u5cQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwliBIIAKo2ptBEAgzkOhz2IEhbxAahzwS+sh4FQZLb97mujl8N
	SptMPwHTjzjTDHt9zsS1koJJh0fAt5SKAbE3DE8/EzmOKedmVitcEvOao+HNDCL+mVxjn81jWhe
	kJ7h0qn1at7y3YAWcOiQDhPhClQwtwF8D9UEYN+P0FHTj0z+7iHLs10oC2FxWHadAeQ==
X-Gm-Gg: AeBDieuNBe3JlnZOPeS/ZTWtyS+lSK2ggcacVzu3sJBeebVkt/etordrw8xsNA7cChz
	i2JDsU8XLqWxZVvo96/XUZ9HqxB7g2YBShKG40GMH/qecmKcdlfXU7PZWRqE2oH99FOqFCrS/SI
	+o0g9KR+7XYyENWwqBVCmfyEVGl2HRvX7TzIkkN5kRu7jqxIO0bfu67/JRTu1yNAWAkws7fIRGj
	PiOtjqwmL+tYhGlAc1f0p0Dq0dWIQANuWHSQa1VDVhfPkzthD9ZTa9Ajra67fM4yn8CqNUhGLbW
	zCnoZKtbKhCdBqexE3CdYiO86DQYDJi7BPysE/I+WmNvbyAwBMXSVELQt9LWsdUQfb7y79NGJed
	oBw8IVa/tFBWKU1Gup4UXDXbRy7pfSkX8Z6PVmWNewoU0EfyQyLGVm7hLgNE=
X-Received: by 2002:ac8:5807:0:b0:50b:3357:7e70 with SMTP id d75a77b69052e-51461fb3815mr95896711cf.28.1778143905764;
        Thu, 07 May 2026 01:51:45 -0700 (PDT)
X-Received: by 2002:ac8:5807:0:b0:50b:3357:7e70 with SMTP id d75a77b69052e-51461fb3815mr95896411cf.28.1778143905251;
        Thu, 07 May 2026 01:51:45 -0700 (PDT)
Received: from [192.168.68.112] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48e530b05d9sm48930755e9.3.2026.05.07.01.51.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 01:51:44 -0700 (PDT)
Message-ID: <6338e51d-da58-410e-b10a-4a565d467f1f@oss.qualcomm.com>
Date: Thu, 7 May 2026 08:51:42 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] ASoC: qcom: sm8250: add TDM RX support
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
 <20260506204142.659778-5-val@packett.cool>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260506204142.659778-5-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: PvReSVXgNmyeatRz2wIcqPYgIhfIypt4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA4NyBTYWx0ZWRfXxnthvp3i2LfZ
 HMqjpHdh9r/DNF+aw3x5C9Fkp7W/OyRz8+lwHt2dkoHIdCAemkDHjyaJx+CXDPm4hHwXWf/VLuA
 VcUqgobgQKFx1WDPxZspHrdx8M6+lvVWpDwMC2hJWKYFvrF2QzDwxVkhfXBX/8JoRUUZrkdPOe2
 qNdY+OoHN0Hr+yXjdAsoB+ybxtrcca3XRNWdb7Gy6f2O+kf/7zny1LN4xf5Dfhez6GnIEN7dvkc
 TfkptCNmg0RIigvZjBFNjYlml0xv+gCCFpIQVQBbizJdUCtIm6vpcUff89UrHJpmhKnY6X2vBfE
 M/ouIuJzTNHAfRTAZ5Jzc86ZpyWKfy8pQdQRMuycXlzVxZ5sx7j4fuNAEbVTu4fsuIeb6vlQyDB
 G55KfQMAnz0IRc41XMo+MOHrqsrqMTC0MuRnNSElLQd8aIYB53a9t26vkjq8P6W04p2bETMk88K
 T4nmFVAsn3hF+N/DNAA==
X-Proofpoint-GUID: PvReSVXgNmyeatRz2wIcqPYgIhfIypt4
X-Authority-Analysis: v=2.4 cv=X8Zi7mTe c=1 sm=1 tr=0 ts=69fc52a2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=fdbe8OLCKT6xAC55-esA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070087

On 5/6/26 8:33 PM, Val Packett wrote:
> Add support for TDM RX DAIs which are used on some devices to send audio
> data to speaker amplifiers. Channels are assigned based on the codec
> DAI names for a quad-speaker setup such as on the xiaomi-pipa tablet.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  sound/soc/qcom/sm8250.c | 141 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 141 insertions(+)
> 
> diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
> index a675913da943..b64fd3970ba1 100644
> --- a/sound/soc/qcom/sm8250.c
> +++ b/sound/soc/qcom/sm8250.c
> @@ -17,6 +17,10 @@
>  #include "sdw.h"
>  
>  #define MI2S_BCLK_RATE		1536000
> +#define TDM_BCLK_RATE		6144000
> +#define NUM_TDM_SLOTS		8
> +
> +static unsigned int tdm_slot_offset[8] = {0, 4, 8, 12, 16, 20, 24, 28};
static const ?

>  
>  struct sm8250_snd_data {
>  	bool stream_prepared[AFE_PORT_MAX];
> @@ -55,6 +59,89 @@ static void sm8250_snd_exit(struct snd_soc_pcm_runtime *rtd)
>  
>  }
>  
> +static int sm8250_tdm_snd_hw_params(struct snd_pcm_substream *substream,
> +					struct snd_pcm_hw_params *params)
> +{
> +	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> +	struct snd_soc_dai *codec_dai;
> +	unsigned int rx_mask;
> +	int ret = 0, j;
> +	int channels, slot_width;
> +
> +	switch (params_format(params)) {
> +	case SNDRV_PCM_FORMAT_S16_LE:
> +		slot_width = 16;
> +		break;

Any reason only S16?

> +	default:
> +		dev_err(rtd->dev, "%s: invalid param format 0x%x\n",
> +				__func__, params_format(params));
> +		return -EINVAL;
> +	}
> +
> +	channels = params_channels(params);
> +
> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> +		ret = snd_soc_dai_set_tdm_slot(cpu_dai, 0, 0x3,
Please define the magic constants like 0x3 here.

> +				8, slot_width);
> +		if (ret < 0) {
> +			dev_err(rtd->dev, "%s: failed to set tdm slot, err:%d\n",
> +					__func__, ret);
> +			goto end;
> +		}
> +
> +		ret = snd_soc_dai_set_channel_map(cpu_dai, 0, NULL,
> +				channels, tdm_slot_offset);
> +		if (ret < 0) {
> +			dev_err(rtd->dev, "%s: failed to set channel map, err:%d\n",
> +					__func__, ret);
> +			goto end;
> +		}
> +	} else {
> +		ret = snd_soc_dai_set_tdm_slot(cpu_dai, 0xf, 0,
> +				8, slot_width);
> +		if (ret < 0) {
> +			dev_err(rtd->dev, "%s: failed to set tdm slot, err:%d\n",
> +					__func__, ret);
> +			goto end;
> +		}
> +
> +		ret = snd_soc_dai_set_channel_map(cpu_dai, channels,
> +				tdm_slot_offset, 0, NULL);

> +		if (ret < 0) {
> +			dev_err(rtd->dev, "%s: failed to set channel map, err:%d\n",
> +					__func__, ret);
> +			goto end;
> +		}
> +	}
> +
> +	for_each_rtd_codec_dais(rtd, j, codec_dai) {
> +		if (strstr(codec_dai->component->name_prefix, "PL")) {
name prefix can be null.

> +			rx_mask = BIT(0);
> +		} else if (strstr(codec_dai->component->name_prefix, "PR")) {
name prefix comparision is fragile design, this will break very soon.
and this is not a binding too.


This also raises question about the using this generic driver for such
specific combination. Can these be made specific to compatible ?


> +			rx_mask = BIT(1);
> +		} else if (strstr(codec_dai->component->name_prefix, "SL")) {
> +			rx_mask = BIT(2);
> +		} else if (strstr(codec_dai->component->name_prefix, "SR")) {
> +			rx_mask = BIT(3);
> +		} else {
> +			rx_mask = 0;
> +			dev_warn(rtd->dev, "%s: codec DAI name '%s' not recognized\n",
> +				__func__, codec_dai->component->name_prefix);
> +		}
> +		ret = snd_soc_dai_set_tdm_slot(codec_dai, 0, rx_mask,
> +				NUM_TDM_SLOTS, slot_width);



> +		if (ret < 0) {
Can we handle -ENOSUPP?

> +			dev_err(rtd->dev, "%s: failed to set TDM slot, err:%d\n",
> +				__func__, ret);
> +			goto end;
> +		}
> +	}
> +
> +end:
> +	return ret;
> +}
> +
>  static int sm8250_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
>  				     struct snd_pcm_hw_params *params)
>  {
> @@ -120,6 +207,41 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
>  		snd_soc_dai_set_fmt(cpu_dai, fmt);
>  		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>  		break;
> +	case PRIMARY_TDM_RX_0:
> +		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
> +		snd_soc_dai_set_sysclk(cpu_dai,
> +			Q6AFE_LPASS_CLK_ID_PRI_TDM_IBIT,
> +			TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
> +		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
> +		break;
> +	case SECONDARY_TDM_RX_0:
> +		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
> +		snd_soc_dai_set_sysclk(cpu_dai,
> +			Q6AFE_LPASS_CLK_ID_SEC_TDM_IBIT,
> +			TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
> +		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
> +		break;
> +	case TERTIARY_TDM_RX_0:
> +		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
> +		snd_soc_dai_set_sysclk(cpu_dai,
> +			Q6AFE_LPASS_CLK_ID_TER_TDM_IBIT,
> +			TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
> +		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
> +		break;
> +	case QUATERNARY_TDM_RX_0:
> +		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
> +		snd_soc_dai_set_sysclk(cpu_dai,
> +			Q6AFE_LPASS_CLK_ID_QUAD_TDM_IBIT,
> +			TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
> +		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
> +		break;
> +	case QUINARY_TDM_RX_0:
> +		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
> +		snd_soc_dai_set_sysclk(cpu_dai,
> +			Q6AFE_LPASS_CLK_ID_QUIN_TDM_IBIT,
> +			TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
> +		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
> +		break;
>  	default:
>  		break;
>  	}
> @@ -145,10 +267,29 @@ static int sm8250_snd_hw_free(struct snd_pcm_substream *substream)
>  	return qcom_snd_sdw_hw_free(substream, &data->stream_prepared[cpu_dai->id]);
>  }
>  
> +static int sm8250_snd_hw_params(struct snd_pcm_substream *substream,
> +				struct snd_pcm_hw_params *params)
> +{
> +	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> +	int ret = 0;
> +
> +	switch (cpu_dai->id) {
> +	case PRIMARY_TDM_RX_0...QUINARY_TDM_TX_7:
> +		ret = sm8250_tdm_snd_hw_params(substream, params);
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
>  static const struct snd_soc_ops sm8250_be_ops = {
>  	.startup = sm8250_snd_startup,
>  	.shutdown = qcom_snd_sdw_shutdown,
>  	.hw_free = sm8250_snd_hw_free,
> +	.hw_params = sm8250_snd_hw_params,
>  	.prepare = sm8250_snd_prepare,
>  };
>  

