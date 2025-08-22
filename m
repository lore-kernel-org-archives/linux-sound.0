Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DAA2F60D2
	for <linux-sound@vger.kernel.org>; Fri, 22 Aug 2025 10:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755859147; cv=none; b=jw5bXT4b42XIkEZh3dHsZz0uLMfIFsDPiml2NhYMo/iWOeiy+nzxrjLzl7yQR8h1liSbEwImdPgCJjSWpNT2PyCP36SjVpZlaNdob/3k+EY+gUKXZ928r/2AWPM1BkUOB7zODRgARq+9cowm54/F6GGr7Pm0JMGFPADVAdNzezg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755859147; c=relaxed/simple;
	bh=jUX/r9RsZcGNRJ/PKy1ft9RmpI77wTYlMOSZQGBL1e8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=l4+FNaTPRh3VI0m74ZdbtjOPkHsFh7YpQARnz4q2iUZOkOYa1eFRzESqVXtjA8GjTtzafIA/vCuDTpngFZbS8Tu6getZsoifCJTxE8//TTpPBVEBXa+cg/CnhLLCQ6syXwknGx3q2GVTOQ3dUHtKvkP4B7ZOPH2JfQhgBAXg2QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KThJm8W6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KThJm8W6"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UOs3020906
	for <linux-sound@vger.kernel.org>; Fri, 22 Aug 2025 10:39:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tEYj78kDDZNqCektDc9Qzj8ZYGHcgUPi5WGwOTOcZMY=; b=KThJm8W6guybmZky
	4Gpe717HgSm+HdEq8UaU8LDF70MF4SVmZismIDipdr06drGLvJ1V1n+BfuWxIUTh
	BASEwGA16njo+Cz2rWgY1M++WLlj0g8SWd7C//SWE39lMr6/GSp2qHjeKTLYc3gg
	qGzBu8wxfCEDiPBGYiI2xH7dFDGbNu8binKDgukMTflrMX8Vwlxy5TUGCeRYJPSy
	J+hVniMCvitFgeFgwdkt89Ur8wjpf7GuR6XNUPFF2w1Xw+xQuCiPg9DiqmTTWMu+
	IcZeXAtZvZF55XZuuHFuUVFSUwtjPwKMzMWszA3HAUkpi7fBGJFt42cr+fdiCVGd
	l2geOw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5290x1a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 22 Aug 2025 10:39:04 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b0fa8190d4so75495981cf.0
        for <linux-sound@vger.kernel.org>; Fri, 22 Aug 2025 03:39:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755859144; x=1756463944;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tEYj78kDDZNqCektDc9Qzj8ZYGHcgUPi5WGwOTOcZMY=;
        b=laRsq9XoWreJY9M8e7kE0vXQtf26PzJ8EfJYeXAsowWU+G1q6JPY0MM6fFK7Jqsmwz
         5bATUB4nfLBV2C0VahH6loqnjo32aLDwMwmBx1nuZppq/APZ4x9Pv6fI7RQzC749CP0B
         3KJ+M7AudZqmTOiOWCWYOBE1s7n81HunOQTtmbpQ7C3ZcutjoTUhsDzkeI5nykoO5qKx
         32LBER8YERB5Gwbn/ge+V93kgoGBTwKzXaOHsj2nox2xXny9WkKISvxBIKeO3EJisa5G
         CH8VSbmWsSs1GeQVQkEYbDy1yK40nt6LtSqmSH516HAQ5BhSR5uMxJ6gwSXqbHeDn2mb
         HIFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKSN/NqjX/ewG386TTcMIn3O36XzcbOHBU33/8N2xw4WP6vAOTJttfgYyThMI8FZoCPhD6u0m1IFG72Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIBTsh9ncviHkTZuvHAcdPhhnUV8SPEF2zaAzrNO6b6M9txhhL
	ZiXHmKLQCQIzyFMQqYvLwBhtL7gRlehbWMPVmaWL5Aj8j7Z6bQqk79nLFZxjkv6PaN4ttlzqKtD
	MpS5YT9ABE1oOW+PHNvJ9lqqxHSQcmbbgRci84iYbX4a4cLqIFCVjH6E2uOFf/zX5BBmTh1uRZw
	==
X-Gm-Gg: ASbGncssjL+JbXJmSPdMj5Z6c637Nxzm5sYcA3/SRy+WTdnrLZR2nDzVk9F6kHfjAIb
	nAq1c36OouPj5rCG55b26UQI5F82REQ9o2qsLtEv5BECoALub7XDTrUwkwS3tIfoxzwe831HvmI
	BCZP5nH4IGPN7C2OFaImaamCbqcAP0Xb8NWfv4rVavpM1DLKetCYFeLhEo3WFaUN/E3sjUDTNT5
	C0KULoay4R3BllqVPsc6IkXUfB8Np9K6LiedNaElO/+vRU22vD7fGSzsrmaAsKVqbakZto3RrOg
	eLBGPvYBsw1CKy77JXaIzV2r47ozpadQLoW5VF+7msJQyOs5TQi58bITkmjZmMNEzhU=
X-Received: by 2002:a05:622a:389:b0:4af:bfd:82bf with SMTP id d75a77b69052e-4b29ff9063fmr57492511cf.17.1755859143792;
        Fri, 22 Aug 2025 03:39:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDI6VWxl67USh3oUaMFJLIrKflkLf1xshpbfrxke76ywOQuvAn1j74aJhLi/r7gO3jGaiwLQ==
X-Received: by 2002:a05:622a:389:b0:4af:bfd:82bf with SMTP id d75a77b69052e-4b29ff9063fmr57492281cf.17.1755859143324;
        Fri, 22 Aug 2025 03:39:03 -0700 (PDT)
Received: from [192.168.68.118] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3c5826751d5sm3527432f8f.14.2025.08.22.03.39.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Aug 2025 03:39:02 -0700 (PDT)
Message-ID: <2566eea5-a153-42e6-9a43-1c0af5a4c11c@oss.qualcomm.com>
Date: Fri, 22 Aug 2025 11:39:02 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: qcom: audioreach: Add support for Speaker
 Protection module
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250821141625.131990-3-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250821141625.131990-3-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I4c8hNgg c=1 sm=1 tr=0 ts=68a848c8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=jR5H-ETkXLhSoB5CPuAA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: quA-h-CtRXT88A8IwmpHDqI31kr8C5h_
X-Proofpoint-ORIG-GUID: quA-h-CtRXT88A8IwmpHDqI31kr8C5h_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX8gqGRM+vot9Q
 b1oXmmkO5fCdiqV9JJzYICNtD27q4/Bg/zKG/1D9dFWf/tBxk+LS82WxZYtjipMsoKWvf+LoQaD
 0SvEQweYsNXwAJSRFgB9iU9t4Wf630OSc7CrxosAvxTmc8QLq6mCf27U+u1WSg1irayjGH2QSo6
 QdJ0G1ZWI0nXuOQGTaS2PzzadXon4w5mvIJd9nS5Nv1XzZmzEF6uygw3bmFMgoH/KXZCWH0x2z5
 ed8y6ECBySkHZQmxxrrYOCZCyLnloODEPEZkJiO8imFggrrwHO5cy9cPSDCpkD/JGkiTG81UEx8
 a4sx4q/ya4Ap7i6UI/IxG4flh+wq2af9UXroOpmJQVr65QEu+JT6AmCw9mnhWfum/pHZph7mNY+
 +fyeya69577ovaSpFWqD/fnM2+CkEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

Thanks Krzysztof for doing this.

On 8/21/25 3:16 PM, Krzysztof Kozlowski wrote:
> Speaker Protection is capability of ADSP to adjust the gain during
> playback to different speakers and their temperature.  This allows good
> playback without blowing the speakers up.
> 
> Implement parsing MODULE_ID_SPEAKER_PROTECTION from Audioreach topology
> and sending it as command to the ADSP.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  sound/soc/qcom/qdsp6/audioreach.c | 13 +++++++++++++
>  sound/soc/qcom/qdsp6/audioreach.h | 11 +++++++++++
>  2 files changed, 24 insertions(+)
> 
> diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
> index f4c53e84b4dc..b7f1fc835dc2 100644
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
> +						   PARAM_ID_SP_OP_MODE_CALIBRATION);

Are we leaving this in calibration mode forever? When does the mode change?

> +		break;
>  	default:
>  		rc = 0;
>  	}
> diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
> index 790fba96e34d..0ad566e45e09 100644
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
> @@ -542,6 +543,16 @@ struct data_logging_config {
>  	uint32_t mode;
>  } __packed;
>  
> +/* Speaker Protection */
> +#define PARAM_ID_SP_OP_MODE			0x080011e9


Are we missing

#define PARAM_ID_SP_OP_MODE_NORMAL		0
?

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

