Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7855C3DBD7D
	for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 10:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781088772; cv=none; b=jWUhdw644dWI/zCoRlrs7smYS/6Zk2LtPcX4jSoV5EWFn/RBDBieqURoklbfojpehuMfU/p00dkaR467DZbP+n8jczXnNI+31msjv+duDINiSpvgO3r/qYkLMC50kJ2+c6ZmUX0nR5NbUPM36R0DWsO8rnv8FiXolVzMrioHRlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781088772; c=relaxed/simple;
	bh=+fVsd1Z1+tIzaGhW+BpuLIuaSGTLG0J27IW8uVttLPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WYrwBQG2yGCPtxQGt3dsnHomvIOPQaZ+TCuuPDKoCfZZy6mrZGAMC16SGT2gbZelDsGsqMeDkzk8PY4nl0EY8iI+KdBgujjvoI0O4kORYOR5a+x3/7K3mKvPbHfZUZrdoLEQbhZBcUNLdfEs9E36vwEwL73Y/xO9ATholrf1qFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bz3tNq2I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PXPAEes6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bz3tNq2I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PXPAEes6"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7jF3M948250
	for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 10:52:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TK96IQjgP90UGFdgjcEfW6TzZ2WJM/XtcB+xnxS45I0=; b=bz3tNq2IMi6oxKBJ
	/0CcPf1Q6ZILQx56EV7sbjNaWSukT/dHmMCeu62boRm2mbwH2LhwNwhfgbasC1mE
	iEML19TM0kotrxGdKuylFxjFb2eKb+tfTkvdHLTB4ko07aoUprWS0YgRHFrzNWnm
	6YPMN+agwvhG/8tXWCNKwzAydJQaCERCjyP6KwN4r5rkayRhqBF5Yus3zS9YmrHH
	mUwQ9zu9W+1Qq8J43aziQ5mEET0RuGxY/LQd7SCN8jIt+zeiI+ARHvoJYPsJ+GiT
	cS9yYJQyyhhobAhLiKfebjqpok1qY7BUgTdMY4yC43CJH+oIu9U81bsdVvWpCQTm
	tpbJLQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnnt3ru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 10:52:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-517878a92c5so146045401cf.3
        for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 03:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781088770; x=1781693570; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TK96IQjgP90UGFdgjcEfW6TzZ2WJM/XtcB+xnxS45I0=;
        b=PXPAEes6FuM9eUswKJLn1lqirl3DoTY5t0o7AdR+XG7T8OjFFe3OK3/ttCiZ3Bl7R9
         rME7U3Q4EDzJGkCpZk7B5MhvDGxqNG/tjmluUe3YJ3tKrG7sj6FKgLY1rATbBsO6AsuM
         nZltocGoymir18wuHZuMwy2wCb/DJGLvVJiHB359tSm3Wop+mPrQmyWhGYZYCQ+8NoCm
         wl+2sWqj4mrL0uLb0ByX07MDqfYdX6ql4QrSDxhvYaM2YrI/IVK7EWo2K9RBNk5CpfYO
         IcfNyYykYBWG35a6RcOMcbGs5TB3hgby28XaflC+wkAfqL43kjhQ1v21IuZH4foKO6iM
         WmPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781088770; x=1781693570;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TK96IQjgP90UGFdgjcEfW6TzZ2WJM/XtcB+xnxS45I0=;
        b=YmBjM3tWD8xWABWKjowc1rjWSPHHWcm/Pvo8pC4w18vBVAfMD+u9bJZD2V4Pq2fcA7
         GyFX6nfpn8WOsHw2FrkMnJbjly8lC23nxnR4rc1nB9OSnE8HlMV7RiimPzGi/+RXhpAj
         cyfvOvtOZ0OEmFL9UKY9UxThejkBriA6C7OUxaQm+FhDzF79DS+ZD7UrXaQ29FQrvcOn
         rped7vKfZIKaKMmXxPYzESDMc6m7yNtIlh8CPFDwU0KySry1zBakQ0jFhJdMildanHYM
         9hxQ6wVQwRyajs7foawRInS7Dj6g1O0OSoHNsY/nAQVpJ89UEQSr0IGHkfjJKPShgeRY
         ELyA==
X-Forwarded-Encrypted: i=1; AFNElJ9tu+TatNCiENX5XP0R2f0mgj1hcUljHH/1f/wCXbldbCnPARJzGEohDi2E6hApuRUgzRDWOub/TxJVqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ2Ptkrcv1+KUQiiYl1UokM7qWCdSgjWJ5gGHNqFWOM9CX9Xin
	d/DFNHvJxtcMhvnyTUk87l5MZaM6BcYDismnqgyMuTbwjmUbjnz04iyokqY8Wx7GSoy6mmIRb3D
	ICl0TCy7St9RT7Pv4QGpMHwU3W/2Ccj/5Q2JAXShE5Aml1kxEWmHqWyzk8j+NwetoAQ==
X-Gm-Gg: Acq92OEAn3OXFrvV6Ozg/CfnPOeTKGr+x/5iKs8hnLrIiS6Av8fWSEihLogvm7VOYd6
	QJBpozoCYJpOsK7Tb+G8D2KipJeR3i+U61P/tDs/cNZoAGyCbWPQ5ArAzEVS7V9bEjqjMadqVeR
	2pFEol0YoM7Jec6Ne80F7NSuOLB6M9suEWiuna+nH1DLhDONeQfQ1g0hlEqu/pZeeG5/DbnFvCl
	V9XWT82Vfvx9fjntlywsp2JhaqECycb4+Y2vbA0DFY6XepSZS9OH8DgB2mvPXU0+dJYf4+ngfVv
	wRTW9mCi85gizZO0WjSbvMoeLjpyD/5a91qL+Ov0SWpda2BicpdTsEmG4aw6iZ8ApmNhje0vWiM
	MYFGtSngrUQ4jmbu3K+oeY0BtjFiAAEBKZGnywcmAzxULjpMzYia7f53PAh4=
X-Received: by 2002:a05:622a:53c7:b0:510:1325:58b9 with SMTP id d75a77b69052e-51795c56255mr369073601cf.41.1781088769691;
        Wed, 10 Jun 2026 03:52:49 -0700 (PDT)
X-Received: by 2002:a05:622a:53c7:b0:510:1325:58b9 with SMTP id d75a77b69052e-51795c56255mr369073261cf.41.1781088769303;
        Wed, 10 Jun 2026 03:52:49 -0700 (PDT)
Received: from [192.168.68.125] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-bf055309368sm1154147866b.49.2026.06.10.03.52.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 03:52:48 -0700 (PDT)
Message-ID: <311ceabf-23ff-471b-9553-797c7d76af74@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:52:47 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: codecs: lpass-va-macro: Fix LPASS Codec Version for
 SC7280
To: Luca Weiss <luca.weiss@fairphone.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260526-sc7280-va-macro-2-0-v1-1-2c1b572fa388@fairphone.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260526-sc7280-va-macro-2-0-v1-1-2c1b572fa388@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xFmxa3l6IuBgf-2Xq4HXtoegPXq4i0di
X-Proofpoint-ORIG-GUID: xFmxa3l6IuBgf-2Xq4HXtoegPXq4i0di
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEwMyBTYWx0ZWRfX5hloiKPclpE3
 fsbqn7JsEXhYZBuA97RUZFP56SNbfLUC9iU+R/p5wKANx5OvNF7bt8gXP08dEe5yOD7mdZG1Lgt
 g0mE9BiNG5CcT8oaDRhMDgG+1NRxew+nTuLilJglTmFY85wfxtbpJmLY3qiDaQMCCvmOzAr/0mz
 9DW5Q/OoTzmcLIMXhWlGiP0NJNm/HXWFNGGTOJq5238Jl2djN/aUrrHRxQmYfjE6h6285Q8k+uL
 4MVXHro9NawbH4HhdsuXniMGlX9r//pWLRIHGgb5B7Gr3Wd2b3z4+29lViuvw3Obwg0/QEMzxxW
 SxMAlHJsRi8+f6VRzr648eEEM/2mdnQisOtlK8Rg3T4qB9kYgdrak39FeNsowSG/2PKe+4d+3R1
 ZgOiiz/VWMIBI+TH/RzU7bfAXUE3Ad8psktU1nglNob+6E8TVl1V8k4lJTeYDeOSrghvh0ZuKvt
 9bXaJLOR4tXbPiKOxaw==
X-Authority-Analysis: v=2.4 cv=epLvCIpX c=1 sm=1 tr=0 ts=6a294202 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=Vj5VumI9SRvEE-TA0EoA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100103


Thanks Luca for the patch,

On 5/26/26 4:03 PM, Luca Weiss wrote:
> According to both the static definition in downstream...
> 
>   yupik-audio-overlay.dtsi: qcom,bolero-version = <4>;
>   #define BOLERO_VERSION_2_0 0x0004)
> 
> and the runtime detection:
> 
>   CDC_VA_TOP_CSR_CORE_ID_0=0x1
>   CDC_VA_TOP_CSR_CORE_ID_1=0xf
> 
> SC7280 has LPASS Codec Version 2.0 and not, as declared with
> sm8250_va_data LPASS_CODEC_VERSION_1_0.
> 
> Create new va_macro_data with .version not set to use the runtime
> detection and correctly get .version = LPASS_CODEC_VERSION_2_0.
> 
> Fixes: 77212f300bfd ("ASoC: codecs: lpass-va-macro: set the default codec version for sm8250")

Can you help me understand if this change was fixing any issue, if so
can you pl add CC stable

> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> I'm fairly confident this is correct, but please someone double check
> this if they can.

Yes, you are correct, this is actually Bolero 1.1.0 Version where things
have changed in codec. if you read major number it will be 1
This has been artificially tagged as 2.0 in the driver.
So the change that you are doing is correct.



Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
> ---
>  sound/soc/codecs/lpass-va-macro.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
> index 528d5b167ecf..58a5798823d7 100644
> --- a/sound/soc/codecs/lpass-va-macro.c
> +++ b/sound/soc/codecs/lpass-va-macro.c
> @@ -244,6 +244,11 @@ static const struct va_macro_data sm8250_va_data = {
>  	.version = LPASS_CODEC_VERSION_1_0,
>  };
>  
> +static const struct va_macro_data sc7280_va_data = {
> +	.has_swr_master = false,
> +	.has_npl_clk = false,
> +};
> +
>  static const struct va_macro_data sm8450_va_data = {
>  	.has_swr_master = true,
>  	.has_npl_clk = true,
> @@ -1755,7 +1760,7 @@ static const struct dev_pm_ops va_macro_pm_ops = {
>  };
>  
>  static const struct of_device_id va_macro_dt_match[] = {
> -	{ .compatible = "qcom,sc7280-lpass-va-macro", .data = &sm8250_va_data },
> +	{ .compatible = "qcom,sc7280-lpass-va-macro", .data = &sc7280_va_data },
>  	{ .compatible = "qcom,sm6115-lpass-va-macro", .data = &sm8450_va_data },
>  	{ .compatible = "qcom,sm8250-lpass-va-macro", .data = &sm8250_va_data },
>  	{ .compatible = "qcom,sm8450-lpass-va-macro", .data = &sm8450_va_data },
> 
> ---
> base-commit: 550604d6c9b9efc8d068aff94dc301694a7afdee
> change-id: 20260526-sc7280-va-macro-2-0-f0d4591a611b
> 
> Best regards,
> --  
> Luca Weiss <luca.weiss@fairphone.com>
> 

