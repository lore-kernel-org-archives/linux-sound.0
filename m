Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43672EC08B
	for <linux-sound@vger.kernel.org>; Thu,  4 Sep 2025 11:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756983992; cv=none; b=mw+VqAVZb5ZnxliMjnjj8Vwakfj5l3J/bOKYIQBjtWyRSZqu/p66s7ybG4riwfQjmDGlpZqSZq+45nu4z9kaO7+PnFO09Sb+GCbV8GnynO0Va1eUK17aov5s+NOUThek4GeJbqY8L70uUXgmLr3DE5P41ZWTExin0esVSwu8s8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756983992; c=relaxed/simple;
	bh=5vZcmgBM+9Nv9iip0wHP9dGmRG2D1+tPZM/R2QISb3Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=V1JZsD2REbaPWqJlyuNim3gk3Ncytv9ZfIB2PuZeiHJZsPTiZoBlimo3Dm9UXhGKTynR18GESiZhgvyYi+Ed5HyslXHKojGz2R7EC9fHOAeMafJmuYy+aIN2EfP4F5XaPehFux341KyvFu/S1v6TOZD2i6a4pQJYSAZ8G/N8YhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NYfoP760; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NYfoP760"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849X9DL007622
	for <linux-sound@vger.kernel.org>; Thu, 4 Sep 2025 11:06:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QhYbFIRKKiIOKT8Pi5ddhFvBtwfY5TujA8EjKQzqmHA=; b=NYfoP760/aavXEgn
	NAeSWua4vdb1T2zsy+jZJLjjOyAITEG4X7hv224yW+jBIISzyHdN5NGnhT6NoDSN
	T8qiYfeJsPYpMQV26puRU+9MYHu8/iSQP2cTu3a8X1mY/OBAkNOjI4dc/fl0fCFA
	aAJsKc9MQ6j60ZSvLGeE/5D1swcb746fMbRh8apqsvkyVaPYh64XACZ+NmN2sJM9
	hKo+fva3SaBLMKegUwmaH+hnGjo1LpXEaEgOopn6kafVEVU7K4TqO+5tqMil2oRp
	S8OJCZi/qDoram6vU5TTGnN+EBcjauUfiJp1bFenA/N/y4TwPFywXAhF0o62RYxZ
	q8CzAg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura8y51k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 04 Sep 2025 11:06:29 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-724ee8d2a33so12093886d6.3
        for <linux-sound@vger.kernel.org>; Thu, 04 Sep 2025 04:06:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756983989; x=1757588789;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QhYbFIRKKiIOKT8Pi5ddhFvBtwfY5TujA8EjKQzqmHA=;
        b=jg2St77E7P2twLblLjEv5cDES9ju0jA6HYMrRAtMPWVDzhelkeCOIY63yaGyFYBaJx
         L6LhYn7XaWfJECUcEtyEbCkORFYJkCAcEoKkFwk1BfYmGiJdFzeuWHBaoKz6I/+0VScl
         a6kTU6hz334BTIjo7gJ7tMb0Q4okuj3VXT0uneR1AnNG7EAOHxNPsGd4S44JJnqYLLbW
         vL4gYxx5/JpD/foYCxhTU9SvGjYUBKmc2xoLcCRLadTq6jpL1l8ElW8/SFWoOmsw9x4a
         Lhj8xBKap6UjuHuBHPhx24uB1C+rw+sl6Vvw/cJiq9cTKmqoAzMcvnunNwhSqmQJjixc
         vdeA==
X-Forwarded-Encrypted: i=1; AJvYcCUrZSKq2xXHeQFroed/VRe1zQ8SJGgagSKfnKjo2B2Kkl79wJn5Lp89HxUG/aLchxBzhRpC9CIFB0JHOA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx86BBcxbQMLVo8lOJueR9wsK7uBlb4VdOm6Hw/bFzZEPrX6sP5
	+bSpEq0Zj6reqbutmIxeRyPxO+Jlpnus9369IMK11Iox7WkDohMv1bMEMSS8ev90LAYO3XxGLaI
	iYXUCqYVhukwzgfOCD/KzoSn+8WSPQTKyncLxvE6DXtrpMobj+jhaWWokl81pjtA22g==
X-Gm-Gg: ASbGncu+4urlIvizboWjQn2JbYfg8vb8Gp6eZFnJV2jOAH4a/pyeyxSqRJUbOsiUoGc
	MFqjCnzTaIBH/HrKxOdB8dCECSSNoXGifC3PSactg3nKyu+8FNHxJVZiaz+uKeGFbq45bUo+AZl
	/2/OXq/EC/IaT7wutgQNhpPg/5KYl4btrBW114H8cVz62+eoxiWkSS1+IqBkmU8VHqFSUePv3Np
	klTPO365Tre7ZirTxz9DZwN+P4T07tx9SI7ME5OsjB6FxApjh2W8QLN69Ea4kYOZSATicFq3w2L
	lXlaWTM14vePK3rOuHosX5WTSx7fvvm0RSE5e2bcrg8rxDjqmsZWCHIl60uPSY9Ktwo=
X-Received: by 2002:a05:6214:3015:b0:70d:ba48:f8b1 with SMTP id 6a1803df08f44-70fac86ebe1mr208966406d6.31.1756983988336;
        Thu, 04 Sep 2025 04:06:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiU50o2//fs1eSkv5hsgG79HTu0XUnuA2rf/GSrZwv3jzhD7GlK0nFH1+s4mvAUoYiQMkTNg==
X-Received: by 2002:a05:6214:3015:b0:70d:ba48:f8b1 with SMTP id 6a1803df08f44-70fac86ebe1mr208965996d6.31.1756983987822;
        Thu, 04 Sep 2025 04:06:27 -0700 (PDT)
Received: from [192.168.68.119] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45b9c234b24sm94775045e9.16.2025.09.04.04.06.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 04:06:27 -0700 (PDT)
Message-ID: <b396807c-309c-445c-85f4-b9c7ec5f1b88@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 12:06:26 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] ASoC: qcom: audioreach: Add support for Speaker
 Protection module
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250904102558.143745-3-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250904102558.143745-3-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8qNP7tiV8M7NpIGY_iSV2hrdVjXnLTRx
X-Proofpoint-GUID: 8qNP7tiV8M7NpIGY_iSV2hrdVjXnLTRx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfX+vKyXDHoNLbj
 YKndMlV/BlTLStHQPCFoBScfhAj3ne0vwUk+yKl5dXjkyJnttXqOalGXDYLAC1Hn8XSOIOhqu9s
 ENgQN3YpkN20s5sMojB/B57xDzNw8QoBGfn+Sg6fD4pYjLzkvtW1lEJe464TtTNakQcgM0n0Z9U
 mJiw1kFFOP5S8yaoLjTJaZy5erPmMAdu2YqWM7tt6I4WedfqGQyLVQKP9za7HHSLxsyYVsZOtEA
 rgbXROJ3QBLZ/eXWbweLM9SShDh+OcxeJFXeQUwMP5oHQ7/diVtNP8eIYwzQ1gnI+ou2Nss75HY
 mJ/UC9lbeP1GkiHYR7Wgq9WwDUFmffCZtN+vS3wn+qkS8QX1YH85Pwul57C98aPloVuuFwTYp3T
 0zqd+3/m
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68b972b5 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=jR5H-ETkXLhSoB5CPuAA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020



On 9/4/25 11:25 AM, Krzysztof Kozlowski wrote:
> Speaker Protection is capability of ADSP to adjust the gain during
> playback to different speakers and their temperature.  This allows good
> playback without blowing the speakers up.
> 
> Implement parsing MODULE_ID_SPEAKER_PROTECTION from Audioreach topology
> and sending it as command to the ADSP.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
> ---
> 
> Changes in v2:
> 1. Add and use PARAM_ID_SP_OP_MODE_NORMAL
> ---
>  sound/soc/qcom/qdsp6/audioreach.c | 13 +++++++++++++
>  sound/soc/qcom/qdsp6/audioreach.h | 12 ++++++++++++
>  2 files changed, 25 insertions(+)
> 
> diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
> index f4c53e84b4dc..3b7dffd696e7 100644
> --- a/sound/soc/qcom/qdsp6/audioreach.c
> +++ b/sound/soc/qcom/qdsp6/audioreach.c
> @@ -1250,6 +1250,15 @@ static int audioreach_gain_set(struct q6apm_graph *graph, struct audioreach_modu
>  	return rc;
>  }
>  
> +static int audioreach_speaker_protection(struct q6apm_graph *graph,
> +					 struct audioreach_module *module,
> +					 uint32_t operation_mode)
> +{
> +	return audioreach_send_u32_param(graph, module, PARAM_ID_SP_OP_MODE,
> +					 operation_mode);
> +}
> +
> +
>  int audioreach_set_media_format(struct q6apm_graph *graph, struct audioreach_module *module,
>  				struct audioreach_module_config *cfg)
>  {
> @@ -1299,6 +1308,10 @@ int audioreach_set_media_format(struct q6apm_graph *graph, struct audioreach_mod
>  	case MODULE_ID_GAPLESS:
>  		rc = audioreach_gapless_set_media_format(graph, module, cfg);
>  		break;
> +	case MODULE_ID_SPEAKER_PROTECTION:
> +		rc = audioreach_speaker_protection(graph, module,
> +						   PARAM_ID_SP_OP_MODE_NORMAL);
> +		break;
>  	default:
>  		rc = 0;
>  	}
> diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
> index 790fba96e34d..9f6ddcf081ee 100644
> --- a/sound/soc/qcom/qdsp6/audioreach.h
> +++ b/sound/soc/qcom/qdsp6/audioreach.h
> @@ -31,6 +31,7 @@ struct q6apm_graph;
>  #define MODULE_ID_MP3_DECODE		0x0700103B
>  #define MODULE_ID_GAPLESS		0x0700104D
>  #define MODULE_ID_DISPLAY_PORT_SINK	0x07001069
> +#define MODULE_ID_SPEAKER_PROTECTION	0x070010E2
>  
>  #define APM_CMD_GET_SPF_STATE		0x01001021
>  #define APM_CMD_RSP_GET_SPF_STATE	0x02001007
> @@ -542,6 +543,17 @@ struct data_logging_config {
>  	uint32_t mode;
>  } __packed;
>  
> +/* Speaker Protection */
> +#define PARAM_ID_SP_OP_MODE			0x080011e9
> +#define PARAM_ID_SP_OP_MODE_NORMAL		0
> +#define PARAM_ID_SP_OP_MODE_CALIBRATION		1
> +#define PARAM_ID_SP_OP_MODE_FACTORY_TEST	2
> +#define PARAM_ID_SP_OP_MODE_VALIDATION		3
> +
> +struct param_id_sp_op_mode {
> +	uint32_t operation_mode;
> +} __packed;
> +
>  #define PARAM_ID_SAL_OUTPUT_CFG			0x08001016
>  struct param_id_sal_output_config {
>  	uint32_t bits_per_sample;

