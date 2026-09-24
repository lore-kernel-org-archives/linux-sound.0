Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D5E35A3A4
	for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 06:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790230466; cv=none; b=GoKHVF6QA3zA733ntYoaM/VdTK3Fx3N0KBPtbuCchPY1xeea8HJjGdKIKdzG14EIgAaPhQKsYdeLVsLr6oDl1Da+LOCFEjOU53J1Z0Tg63dZoc3/YfT41dnGngahua5L1rA9MVQAAuplIRiQKICh5B8JatYkwyiGXEiks6bXKu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790230466; c=relaxed/simple;
	bh=em62VDQheZ/tLX+NMbb54Whj+Gyvhiw96wEx0zjeExI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ONHz5wNv+Tpmu2P5mDB1/pKFx0Ay2kvS2mMN81zQ5EFsS6tzu72XXO9znY0XPfe9WWL6l2TLEto32rnxl+oDtBIQuh3dMKt0sNYlWkkIIh32Y4MW5IWdGsISjnemBXHG64fycFU+moAYfRWTeN2wXOKx4FDTafimCUvV54xWwMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MNLgSWJE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NLV8Qxew; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MNLgSWJE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NLV8Qxew"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5ePud1148088
	for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 06:14:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	31gZ7OtCFd+aZGFWoKZu0/HFhbNaRl1RagZsu1mV2Cg=; b=MNLgSWJEHqNrWaiw
	lPFT+qTxbWvAZUsT9Wdr/pS3dBk5BJ09LaJdZPmGUTpq0wK4DjMk5yEj5vsftjod
	XmhAJYv4pKZ/fL+ztZANBDvNFGHAFlQOmOfx9ML0Ndrr04W5OXy/tK0NB+KqagzK
	K+lmMFsLLeCM0uK0iLCIyV6qB0jnWLGN4s8J0aTsMQHvEnXEba1T8qtnfD/xFdl8
	l3xQJsZVlsxE+YDDZ5x2dod7FtL97TIitIel2kbfiR4pxa68onzvCtPLlsigr1hp
	sH178lGCUYNk89TKo/ZtCvy0D79BsBQSwgLEquxYUqkLjACfYg583ZmmXB/6+m9y
	uw04tw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvmrra0g5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 06:14:23 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1383723dfddso3445978c88.0
        for <linux-sound@vger.kernel.org>; Wed, 23 Sep 2026 23:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790230462; x=1790835262; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=31gZ7OtCFd+aZGFWoKZu0/HFhbNaRl1RagZsu1mV2Cg=;
        b=NLV8Qxew4RxESKmwKySSB6SWAtNhx98mUETqUZfAhcq/M5a6ryinFYWgkt5d21TT2J
         9Dw0alGAQVmzVHQyqrcxPbilc6EflyifOfDdw6kZFw/S7eBfc3uLt0dpxt5qn6ivc+8+
         2znmDmKQ8NbRFHe1+7WLVQKyOaI4s9RAFUukMjEMk//nW+AI4I/+dYpMpHiriE7Zqfjs
         suiENV3GcvQdYHdPSTe0zOdwVOQh5YxTippOcBySweoeZp27og67f/Iq9C5To5nXIW27
         3xO0xhHy1l281lJoWygpqQXb2eGOULie7599KKxrWXhnX6vNWhc+jAxECXC2vzAkK3gg
         dwWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790230462; x=1790835262;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=31gZ7OtCFd+aZGFWoKZu0/HFhbNaRl1RagZsu1mV2Cg=;
        b=SOuqKCGgsWAuZDsgzTtx8nl+1ZX+aLr4SIhdxdOsxLpl+cuV8ueTIutycRKgkf45jW
         0xUb/scBnsncezmLgSwTH0tGVLX0Ywcw/wWUSRwuqaM25yrWxdJEla/H+a+eZFY8hrQg
         zWDFq1ZpegZFZiQZeL3q6cZkjPQznYhjrIS/bUMhu5apEQikB2YjPib7UVAjWwjcEAf6
         JeDR+/tVA+SZ0QQ9+Dfk9qOP14ONPXbeMVM7hNRBOeRZwR+FNhUaMBpfdVq6Co6UPV7j
         nPm4va4gTIbxLVQpK1f7mADWGmgKyXVBhwVsRgHrUyQ5cZKUDMTYgWAV67uffc+Y3S0K
         GC4Q==
X-Gm-Message-State: AFuF++ncOiLgH4JgWBmEDtUiZvTnhUC6cslg8FtAKlPUe3XH48ZYwVBG
	LJGrNoZSnBU6cEcZqEGHcxXCapEjKnB7IRP3kgXozxNM+6Qu5/SWCptZ0KpXZqHncs05/ClIRHo
	vdMfLk8vNZPSqTEy2/YxdFVZgdFnIiqvCgAxbP0r7p7ZU6kpNNQnMK9VM6Cs21fsGAg==
X-Gm-Gg: AYBFou0tQ/3qZMarnW1ZGpidftOSOgrrRhVkFdC+pK4iUgENxvg8sep+PVEmfwo31EE
	nQ8JOMrUc/Hw4RAkb5Tzfw5tIhgyz8deCQP6xlLHFl/O+jjA6gwOyLgRpFPOswVdyA4cTyru2d7
	MLFen5DKMiebwldA2P1sFlHzINihCtfuZPynCf+dKLyw/r6AWE5TPt0vDnJcIubJtY69QTBR2QS
	ekbAUi57CqKHewWvOne65eAjAyguxXJO3L6nte10M08Rhgzzso2OisHqnfMSmDjw+id/LBx2g0G
	kOvb0uWdEzcITabODJDLBM1uP3Fz3+rsQv9JNurmJlNHf7zfq2wcidesjDviPTgpMlJL6YfDtSI
	dsS5ilkPq4Id2B3yaVH+UlG1r+pDb
X-Received: by 2002:a05:7022:b0c7:b0:144:eab0:9cbc with SMTP id a92af1059eb24-145040b9869mr984367c88.37.1790230462187;
        Wed, 23 Sep 2026 23:14:22 -0700 (PDT)
X-Received: by 2002:a05:7022:b0c7:b0:144:eab0:9cbc with SMTP id a92af1059eb24-145040b9869mr984342c88.37.1790230461549;
        Wed, 23 Sep 2026 23:14:21 -0700 (PDT)
Received: from [192.168.1.25] ([122.183.173.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98209ffsm10084659c88.4.2026.09.23.23.14.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 23:14:21 -0700 (PDT)
Message-ID: <8cee4223-eaad-4326-9ab8-ec6ef9345e8f@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 11:44:07 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] ASoC: qcom: lpass-rx-macro: Add shikra compatible
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com>
 <20260922-add_shikra_support-v1-3-6c6cb6444caf@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20260922-add_shikra_support-v1-3-6c6cb6444caf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAyNiBTYWx0ZWRfX+DdEQVIWD9ty
 tNzei1N9ImY26ezciDU1VMeUShaBdCtUCO42b//eNMfkfJJ1/P3G3Q9S0LZtCnhA+ktAF1nUQMn
 3c2/1w2YBAPrnvEj1xYsMqASgrIMCHiYeVM/NJU4eYS/Oqzz8u3Oim+QgvfjBkAe1jhlKFjDttl
 tJJROabgO6dtF4kmJ248VR9lsjL1g1lJcU5+UdCmTLwI2wkNMnciTtmh9iUvvteYjKgIYdYgYB+
 JAJlna0ugVJ1mutpsLPZpTNhB5NvynfB4CP3eeeB2hHGuKh1iCS7T/GuvfEhxjXvgTeuzkft8cv
 A9ku4Oqk8wwbv2UUkyMmdCJbBmB9agdlQlvnfAZYxReqH2fM93q6KtYkAfhXl2hYMq87TcLy5Wb
 1aOU4X4Roai6OgY04N/TbRWsJkWGzrluRrzd8dzYMtL1biMRWksxeHT3d4/MVAutaIyYzwHXP+8
 9vbVI098WdULUrao+Yg==
X-Authority-Analysis: v=2.4 cv=TYwDJhQh c=1 sm=1 tr=0 ts=6ab4bfbf cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=uk8ae9/F1LYL5lfeGCaUoA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Bjo1vDIwfTV5L2TfZyQA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAyNiBTYWx0ZWRfXyI0/tG9uWPT5
 kpK9kKpqKpoc+ll8mr0eFFVcJf8Uu9sohydL51hoO7cn4TglsSFalktWAinjNXADdFuMCzZpwhf
 OdFMwERjIS2ZKgUOzmN4H4irh/ipQoY=
X-Proofpoint-GUID: TFzzGvXMtZ4UfxuenBlvRoEiSUbtdgyR
X-Proofpoint-ORIG-GUID: TFzzGvXMtZ4UfxuenBlvRoEiSUbtdgyR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240026



On 9/22/2026 3:12 PM, Mohammad Rafi Shaik wrote:
> Add shikra RX macro compatible data and hook it into the LPASS codec
> v4.1 flow.
> 
> The RX macro register layout of LPASS codec v4.1 matches the v2.5+
> layout, so reuse the existing v2.5 register access helpers, controls
> and widgets for it.
> 
> v4.1 additionally requires the FS counter to be bypassed before it is
> enabled during MCLK enable. This is a property of the codec version and
> not of the board, so key it off the version detected by the VA macro
> rather than off match data.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

LGTM

Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>


> ---
>   sound/soc/codecs/lpass-macro-common.h |  3 +++
>   sound/soc/codecs/lpass-rx-macro.c     | 14 ++++++++++++++
>   2 files changed, 17 insertions(+)
> 
> diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
> index 573b2145e1c4..b52665b11e35 100644
> --- a/sound/soc/codecs/lpass-macro-common.h
> +++ b/sound/soc/codecs/lpass-macro-common.h
> @@ -30,6 +30,7 @@ enum lpass_codec_version {
>   	LPASS_CODEC_VERSION_2_7,
>   	LPASS_CODEC_VERSION_2_8,
>   	LPASS_CODEC_VERSION_2_9,
> +	LPASS_CODEC_VERSION_4_1,
>   };
>   
>   struct lpass_macro {
> @@ -70,6 +71,8 @@ static inline const char *lpass_macro_get_codec_version_string(int version)
>   		return "v2.8";
>   	case LPASS_CODEC_VERSION_2_9:
>   		return "v2.9";
> +	case LPASS_CODEC_VERSION_4_1:
> +		return "v4.1";
>   	default:
>   		break;
>   	}
> diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
> index c41eb8de6160..93ceee878b78 100644
> --- a/sound/soc/codecs/lpass-rx-macro.c
> +++ b/sound/soc/codecs/lpass-rx-macro.c
> @@ -60,6 +60,7 @@
>   #define CDC_RX_FS_MCLK_CNT_ENABLE	BIT(0)
>   #define CDC_RX_FS_MCLK_CNT_CLR_MASK	BIT(1)
>   #define CDC_RX_FS_MCLK_CNT_CLR		BIT(1)
> +#define CDC_RX_FS_CNT_BYPASS		BIT(7)
>   #define CDC_RX_CLK_RST_CTRL_SWR_CONTROL	(0x0108)
>   #define CDC_RX_SWR_CLK_EN_MASK		BIT(0)
>   #define CDC_RX_SWR_RESET_MASK		BIT(1)
> @@ -652,6 +653,7 @@ struct rx_macro {
>   	bool is_ear_mode_on;
>   	bool hph_pwr_mode;
>   	bool hph_hd2_mode;
> +	bool fs_cnt_bypass;
>   	struct snd_soc_component *component;
>   	unsigned long active_ch_mask[RX_MACRO_MAX_DAIS];
>   	unsigned long active_ch_cnt[RX_MACRO_MAX_DAIS];
> @@ -1613,6 +1615,7 @@ static bool rx_is_rw_register(struct device *dev, unsigned int reg)
>   	case LPASS_CODEC_VERSION_2_6:
>   	case LPASS_CODEC_VERSION_2_7:
>   	case LPASS_CODEC_VERSION_2_8:
> +	case LPASS_CODEC_VERSION_4_1:
>   		return rx_2_5_is_rw_register(dev, reg);
>   	default:
>   		break;
> @@ -2045,6 +2048,11 @@ static int rx_macro_mclk_enable(struct rx_macro *rx, bool mclk_enable)
>   					   CDC_RX_CLK_MCLK2_ENABLE);
>   			regmap_update_bits(regmap, CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL,
>   					   CDC_RX_FS_MCLK_CNT_CLR_MASK, 0x00);
> +
> +			if (rx->fs_cnt_bypass)
> +				regmap_set_bits(regmap, CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL,
> +						CDC_RX_FS_CNT_BYPASS);
> +
>   			regmap_update_bits(regmap, CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL,
>   					   CDC_RX_FS_MCLK_CNT_EN_MASK,
>   					   CDC_RX_FS_MCLK_CNT_ENABLE);
> @@ -3652,6 +3660,7 @@ static int rx_macro_component_probe(struct snd_soc_component *component)
>   	case LPASS_CODEC_VERSION_2_6:
>   	case LPASS_CODEC_VERSION_2_7:
>   	case LPASS_CODEC_VERSION_2_8:
> +	case LPASS_CODEC_VERSION_4_1:
>   		controls = rx_macro_2_5_snd_controls;
>   		num_controls = ARRAY_SIZE(rx_macro_2_5_snd_controls);
>   		widgets = rx_macro_2_5_dapm_widgets;
> @@ -3837,8 +3846,10 @@ static int rx_macro_probe(struct platform_device *pdev)
>   	case LPASS_CODEC_VERSION_2_6:
>   	case LPASS_CODEC_VERSION_2_7:
>   	case LPASS_CODEC_VERSION_2_8:
> +	case LPASS_CODEC_VERSION_4_1:
>   		rx->rxn_reg_stride = 0xc0;
>   		rx->rxn_reg_stride2 = 0x0;
> +		rx->fs_cnt_bypass = (rx->codec_version == LPASS_CODEC_VERSION_4_1);
>   		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_2_5_defaults);
>   		reg_defaults = kmalloc_objs(struct reg_default, def_count);
>   		if (!reg_defaults)
> @@ -3951,6 +3962,9 @@ static const struct of_device_id rx_macro_dt_match[] = {
>   	}, {
>   		.compatible = "qcom,sc8280xp-lpass-rx-macro",
>   		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
> +	}, {
> +		.compatible = "qcom,shikra-lpass-rx-macro",
> +		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
>   	},
>   	{ }
>   };
> 

