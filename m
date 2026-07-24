Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB3D3B4432
	for <linux-sound@vger.kernel.org>; Fri, 24 Jul 2026 08:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784883194; cv=none; b=EAWra9w7l0URSuVvkS14dTAT06e58jsvy70GKxaL3xeS12GvpIYwdLAbxvx/2lMV/RsBwoLNC7ZXmgSms1v1/uJavGZaatID5uioJr+Rv7NVhWzaewDh72zNVePwoRqLLW+bVfKkP4U6lvFNpBnL19c6jGSr1ALnRGyJAP8Bjrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784883194; c=relaxed/simple;
	bh=iNh1XCLDrmQm4DSIiCjf34/78IrKNQAGBZv7+o5Yrsc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iWzLPvtNktonjLmw15nhB3r2ag9jK8MkmSpY2WHw9OtFq2toM4AVcQxt9KiP2n2X4/8w2fYVw4k2HxDPAI6k/A0C6ytmcs6v+hRywDd6C8j2BQxBH1ujPEDunFKf05QWxM+gtN+sSBI7BXQrEFCeSSnhhVt02owGKEQ2ewDSW7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BWryMePA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AV5W0LTa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BWryMePA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AV5W0LTa"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lKjf1992290
	for <linux-sound@vger.kernel.org>; Fri, 24 Jul 2026 08:53:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4yjdr9lk8K5g17oPrksmiVOVDbA/cHMz1YIR9k2vyLs=; b=BWryMePANinvFrSk
	2WOaSdL8Ya1rAZbrAw3AFxhRQSwi2Un1EycL9un3EreN5M40fcrtXAdMFO8+Ozav
	2xenhDjKVlCI/bo6eQntvwQZESbMm/ZktTp1GHAezWpARwysafWs3848Je/OC7Op
	5rWzU2joC2/ecW5wbzFInbbvm721ACkhVvgUtU6sMMJgaxtKWak2Cd4xz7oi6djg
	W2gjvlDw0TjvCj7pdfxQkSS82c3p9R5TxZfY8/CgPBs1Kxgx24kt0Nqpj+QmSLh+
	e+8WHbbLeH5kZJPUtbiKxUn0yb4fgeaouz83XzI9MiXe01z3cYegbv4XlC6xwnyp
	IMPYzw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm0p50y3u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 24 Jul 2026 08:53:10 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1d30035dso2207591cf.2
        for <linux-sound@vger.kernel.org>; Fri, 24 Jul 2026 01:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784883190; x=1785487990; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4yjdr9lk8K5g17oPrksmiVOVDbA/cHMz1YIR9k2vyLs=;
        b=AV5W0LTaYb35IRwo2Hn1F+8TcxjkvXw4yXz611WXFk7e1yjciiTHlwPvQ50domflRb
         z5zgCfN7787RiTgB71HevWHDeJGUCN9Ou6kXJXcrJ97uoEmTqTwH5GQ0sZLi3BD6k7Pz
         JCH0Zv/JzSxgI8SuqqOYgMHhfpZvC6TagbN4SZxUyhOg5K+jJSwxM2jvY+6HWxrlZVw0
         /053uIxjFpKz2kZqlmPpdxtVjDf1av7t4b/getKnfzrxRnV8jBD3dXSEQ21AYoFt1eMU
         CgHmpiwshaZTvooCE1kPj0A4ibrB3oLdPKquyLvDsQaGXJcsvPKM+T6TKBcRzKpd/Sp3
         skzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784883190; x=1785487990;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4yjdr9lk8K5g17oPrksmiVOVDbA/cHMz1YIR9k2vyLs=;
        b=oVatKsMbA5rrWYa5tk17weGRN0Q0PexVfCMSaMk/rCTaG1kzxFFP8mQXpZmhcrtx8f
         DRmHPOlMtqgl19lyT+Iu0F5gWvQbOS6zvAtA5gqq+qYCR4DPcblOWMsLgED+TGgFsPLb
         s4DWX8qOIevDq35hvIijHBhqTYvOoA52RmGDnyKrfR1WAbj5N+eUCfVt9YkRp0EXPese
         esNYBZI52hJ/6L8qakjROQcnIGrVDeVjBsMV2OiIFDsfOsud7w5QWO8kWa8Js9vJm/Yb
         qr7XbEFYKBP8vFgagFVLD/DbT3gByify1ykPWjNPeykzd34alb34HZJPuozmpz+TMJz5
         yldQ==
X-Forwarded-Encrypted: i=1; AHgh+RqVumJeQat5+ji1ZO42ddTk6GxONKqMoLkWEZwOQlpM9BJbUW+nBLzCfw+xjfPOzhLTuH7IGcN2dqtZKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzF3xmZLRkCIwJ/DL0ENMbgC8Gj8nLtxqR7B/wo8C+KZScT7RKj
	2MtH3WesXqicdnkUQ3TlwWe1eWCLCMNfg4KRgdA7sh5LVhjZr7GjbjdXbRXJxMi+tQCxzKlSxyA
	IjWOw65CcW0kxzKe2mihJWiWRAY2MWLvzGaYUKsozsUD+1YvqxR6WR7EDWfXP9tO6Lw==
X-Gm-Gg: AR+sD12iSbR7mpmy6QWb7w10FGTpBRfB3ZeT0+tC7SzSEEAQ494T9SllXIDFS6sWUUi
	HN1EFvhp4NSYoG+q3pdO2F8cHf7MigN58qIJ3VijKhtYUSMFudBVVPDUlar8Jv1p3CqepotEy/G
	/WtvIpISuDlAYbOmgIiZvkO2Wuzo50X05Gg5+Nygi+4gFBitxYbsgccX9BDD6Rg+RuyfTr21h0N
	rFaDMot69AU1m1uY59wnr6nmJy9Q6IKjpDgzKaRGvrUtjlhUFi5w0g1KGgSkcd5oTWKL9i49KOb
	MdUktvDnPPOS/MiaM4JYercvNoz8SWW9FcrE5xOM0JVhWck0YhhZFB97daWrgYkKTgEQRqkhq7v
	De+6D6/HSajP0CvLshvQCQu+Mlxk=
X-Received: by 2002:a05:622a:588c:b0:51c:7b12:6000 with SMTP id d75a77b69052e-5283dfdfa20mr57309301cf.76.1784883190193;
        Fri, 24 Jul 2026 01:53:10 -0700 (PDT)
X-Received: by 2002:a05:622a:588c:b0:51c:7b12:6000 with SMTP id d75a77b69052e-5283dfdfa20mr57309131cf.76.1784883189715;
        Fri, 24 Jul 2026 01:53:09 -0700 (PDT)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f85c52fc0sm22315058f8f.23.2026.07.24.01.53.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 01:53:08 -0700 (PDT)
Message-ID: <edcb955d-92d5-4506-afe4-270f7814d23e@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 09:53:06 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] ASoC: qcom: q6prm: add support for LPASS LPR
 resource voting
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20260722120217.3609506-1-prasad.kumpatla@oss.qualcomm.com>
 <20260722120217.3609506-3-prasad.kumpatla@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260722120217.3609506-3-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Pq6jqQM3 c=1 sm=1 tr=0 ts=6a6327f6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=9brZCF5o_kxjRrlj0w4A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: XZ9j1pMcLrnrfplQeHWnAFUzqe2ipOO2
X-Proofpoint-ORIG-GUID: XZ9j1pMcLrnrfplQeHWnAFUzqe2ipOO2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA3OSBTYWx0ZWRfX5RcS3EvJ8vKa
 FfN9lS3ql0qV18EgZcv2Uwf2mhFXDlcPn3HEqzcN10EeQ8V6KDwhWUwAn+okB47+2BN4rvsVXnp
 2DpuaOGM27ygqcAkiNq8n+5klTHXb0Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA3OSBTYWx0ZWRfX7mW/Pi1VGh8c
 c/WDTvD+fYPB7ktApi/eu3oZGhl/8btmGZBoDHGyGspXe5pOCaoUt3CNWVKMAQP1nSsYg6YCSS2
 7ZMQJ3iwOnwMYSvpWZP57jsEFQlFdW6UH0pzchsr79a49M+uI7Lzax1aEwKs8RNQwNc8dFuKMSq
 hIxWRQLisRY6uvLDBj1RvjpquRs3w9386lr9Ajk1ttRS/n94VYSih+ovdD5Z2uI+Zj1KFWA5HWd
 it9qpcTG2goX5T7TSgmxHTxS+1+xB+hAiCaBP7NYxtn1eW0/kd4KelZegq6VPPDKlB9NPnW1y+l
 e8DFoSGy6KDTFaC6PI4KCAtbnIMy6id2qqHTP0OsBug7yG4cQMvxFd9zwX2KoDlWKr5sOmFgU1z
 hU/yw6X8ZAVlQk3o8vSKnfgJUr2h1O4gucq7Hk2GOc5SHD5p/5nUN+kjRFPuH25RulglZqeGQQq
 TxYowvox3R4oiLDc91g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240079

On 7/22/26 1:02 PM, Prasad Kumpatla wrote:
> Add support for issuing LPASS low-power resource (LPR) votes through
> the PRM interface.
> 
> Some platforms (e.g. Hawi) require the LPASS to be kept active via LPR
> resource voting instead of the existing hardware core vote mechanism.
> Handle this by introducing support for PARAM_ID_RSC_CPU_LPR when the
> LPR vote clock ID is requested.
> 
> For LPR requests, use the appropriate parameter ID and payload format
> to disable CPU subsystem sleep, ensuring that the LPASS register space
> remains accessible.
> 
> Also add the corresponding clock mapping for LPASS_HW_LPR_VOTE and
> update Q6DSP_MAX_CLK_ID to 105 to keep the q6dsp clock ID range
> consistent with the dt-bindings.
> 
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> ---
>  sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c |  2 +-
>  sound/soc/qcom/qdsp6/q6prm-clocks.c       |  2 ++
>  sound/soc/qcom/qdsp6/q6prm.c              | 16 +++++++++++++---
>  sound/soc/qcom/qdsp6/q6prm.h              |  1 +
>  4 files changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c b/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
> index 03838582a..ab7d20580 100644
> --- a/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
> +++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
> @@ -12,7 +12,7 @@
>  #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
>  #include "q6dsp-lpass-clocks.h"
>  
> -#define Q6DSP_MAX_CLK_ID			104
> +#define Q6DSP_MAX_CLK_ID			105

This change does not belong to this patch, please add a new one for this
change.


other than that LPR changes looks good to me.

Once MAX is removed from this patch you can add

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
>  #define Q6DSP_LPASS_CLK_ROOT_DEFAULT		0
>  
>  
> diff --git a/sound/soc/qcom/qdsp6/q6prm-clocks.c b/sound/soc/qcom/qdsp6/q6prm-clocks.c
> index 4c574b48a..2b2b3872e 100644
> --- a/sound/soc/qcom/qdsp6/q6prm-clocks.c
> +++ b/sound/soc/qcom/qdsp6/q6prm-clocks.c
> @@ -63,6 +63,8 @@ static const struct q6dsp_clk_init q6prm_clks[] = {
>  		       "LPASS_HW_MACRO"),
>  	Q6DSP_VOTE_CLK(LPASS_HW_DCODEC_VOTE, Q6PRM_HW_CORE_ID_DCODEC,
>  		       "LPASS_HW_DCODEC"),
> +	Q6DSP_VOTE_CLK(LPASS_HW_LPR_VOTE, Q6PRM_HW_LPR_VOTE,
> +		       "LPASS_HW_LPR_VOTE"),
>  };
>  
>  static const struct q6dsp_clk_desc q6dsp_clk_q6prm __maybe_unused = {
> diff --git a/sound/soc/qcom/qdsp6/q6prm.c b/sound/soc/qcom/qdsp6/q6prm.c
> index 04892fb44..1f3ce4cc0 100644
> --- a/sound/soc/qcom/qdsp6/q6prm.c
> +++ b/sound/soc/qcom/qdsp6/q6prm.c
> @@ -31,10 +31,16 @@ struct q6prm {
>  #define PARAM_ID_RSC_HW_CORE		0x08001032
>  #define PARAM_ID_RSC_LPASS_CORE		0x0800102B
>  #define PARAM_ID_RSC_AUDIO_HW_CLK	0x0800102C
> +#define PARAM_ID_RSC_CPU_LPR		0x08001A6E
> +
> +#define LPR_CPU_SS_SLEEP_DISABLE	0x1
>  
>  struct prm_cmd_request_hw_core {
>  	struct apm_module_param_data param_data;
> -	uint32_t hw_clk_id;
> +	union {
> +		u32 hw_clk_id;
> +		u32 lpr_state;
> +	};
>  } __packed;
>  
>  struct prm_cmd_request_rsc {
> @@ -62,6 +68,7 @@ static int q6prm_set_hw_core_req(struct device *dev, uint32_t hw_block_id, bool
>  	struct prm_cmd_request_hw_core *req;
>  	gpr_device_t *gdev = prm->gdev;
>  	uint32_t opcode, rsp_opcode;
> +	bool lpr_req = (hw_block_id == Q6PRM_HW_LPR_VOTE);
>  
>  	if (enable) {
>  		opcode = PRM_CMD_REQUEST_HW_RSC;
> @@ -82,10 +89,13 @@ static int q6prm_set_hw_core_req(struct device *dev, uint32_t hw_block_id, bool
>  
>  	param_data->module_instance_id = GPR_PRM_MODULE_IID;
>  	param_data->error_code = 0;
> -	param_data->param_id = PARAM_ID_RSC_HW_CORE;
> +	param_data->param_id = lpr_req ? PARAM_ID_RSC_CPU_LPR : PARAM_ID_RSC_HW_CORE;
>  	param_data->param_size = sizeof(*req) - APM_MODULE_PARAM_DATA_SIZE;
>  
> -	req->hw_clk_id = hw_block_id;
> +	if (lpr_req)
> +		req->lpr_state = LPR_CPU_SS_SLEEP_DISABLE;
> +	else
> +		req->hw_clk_id = hw_block_id;
>  
>  	return q6prm_send_cmd_sync(prm, pkt, rsp_opcode);
>  }
> diff --git a/sound/soc/qcom/qdsp6/q6prm.h b/sound/soc/qcom/qdsp6/q6prm.h
> index a988a3208..bd5ee0c40 100644
> --- a/sound/soc/qcom/qdsp6/q6prm.h
> +++ b/sound/soc/qcom/qdsp6/q6prm.h
> @@ -87,6 +87,7 @@
>  #define Q6PRM_LPASS_CLK_ROOT_DEFAULT	0
>  #define Q6PRM_HW_CORE_ID_LPASS		1
>  #define Q6PRM_HW_CORE_ID_DCODEC		2
> +#define Q6PRM_HW_LPR_VOTE		3
>  
>  int q6prm_set_lpass_clock(struct device *dev, int clk_id, int clk_attr,
>  			  int clk_root, unsigned int freq);

