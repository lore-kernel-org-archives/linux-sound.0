Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E119C2505DB
	for <linux-sound@vger.kernel.org>; Thu,  3 Apr 2025 14:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743690943; cv=none; b=XXA+wAgM5jm/MzSZQfi36KnIz4eY120sgToftioeoCsMz1SI568HKTXsJht60qD+2khPNMtQyM2Y+BiUk3aTJMDn60rOOqylj4Ma1zSSWHmuvJz/EO4Z+ah1kT09+3neoVMLtTo7PEqjabzchFzO8vWtcCne8/Uz32C9NJ+IH2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743690943; c=relaxed/simple;
	bh=1m2wGs6FTluWBIvWlKVwLPxk4luQTmy7WAhmXP544B4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JWvmiHbra3eqYYx06iSM3mME+/zc5+JqFE+iz/3V03A4WT8qrtsaD8DfANV8rHjhSAd11tO2SOvOZGXyef6EQt6xAQOVejEb5y1PD+yN5x5W1QWBQc1W50rGSRNfMMx89wmHOzmTIzm8GxrkRdFTzOxAI3zJvNMLmB875WQzlxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nBsb+/3A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nBsb+/3A"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5339ru27012839
	for <linux-sound@vger.kernel.org>; Thu, 3 Apr 2025 14:35:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FSEa9SjkeYFg5a//J4P8CuYM
	wRw2YqG0kU/I+1N7Dhc=; b=nBsb+/3AxIlWu+/64RWUL8B+g3pXC8PcHkk/GuHM
	cccqYDfPaHRkS2KxsWbk+djIDsisgZouQI+k2E4uMoHeY8qtZMPBM2YcEAkjlHhR
	I/viDr0kpEABjH0DHG5/Jq1bk4A6RAeuUtMB15byZN2iNpnz621Qy3ewJvXxbP3J
	QuwsbMB1wm6CR3GUqKfMtGhjUs+QrRZfkC/zI4KCQREIg26d/QDk4yQHExXzaqxq
	EGUztEqeNfa3ztXj/X/2X3LCYdsD1r8EZYuCeZY6DJ36k+cA+UzwlyR/WztM+Crn
	6fibKvzTNoGdylGaMJFG+Z/vLpxpVL77NyRd/buX0XdWkg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45spnp10ya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 03 Apr 2025 14:35:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5e2a31f75so286313085a.1
        for <linux-sound@vger.kernel.org>; Thu, 03 Apr 2025 07:35:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743690939; x=1744295739;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FSEa9SjkeYFg5a//J4P8CuYMwRw2YqG0kU/I+1N7Dhc=;
        b=ZUq+4YhBCu3rMgmPupvXhsHIgA0ZdaZUBis6WCQHSp4X4xgyhL2x69h/s4LDc4ti8K
         wK3q4fd6LAyMHdFTF16r119sccaghXNGTkF6v5I9PL4hl5JL8lz9FE7r3aht8o+mDGII
         oIrApSoUoLqitfLDxyM8gYAba+/mnfCFdQic7/bPdMGjjEPPtdB+4Wd1AkBHqJlN9Lm9
         8yVh9RHYIQNWRLFWSxrX4JwRIf50CzZkirr7dJPJ+JRW2QH7dhC9sdPpgJXURsDt6v6n
         WUUTym073xjXljtXCvRsMXpbmAuScwvx9tuPkhiwZeFkis2arTDivioEKWLkn8Di7Xuq
         10MQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjnOU7+Br+98c9iE2isN5vKtuZZuUkkcF6ecw7HG3OkI/naTMhYLRf/HSR0osz8eVpRG+mclRnYu8JEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuJagRDdRcPIXzYF3/rTTFcmdxQ9duol3AtMfQlEe8HCSAAtte
	QnttcMwmY5wmazeF1V4ClDIKn7uuIT9U7UhRNnQoEfPV6XoJ/0pGoHE3bkppqIuNRkCvf+KmIDG
	GERhmrcbor99W3QDpjTWqqHfp6Vu+VJMV/PMFvfLLSb+HkTWo1GshI2Xo/MItkA==
X-Gm-Gg: ASbGncuTTDwHMYt8doJVaV+JcuJ4U2Fv0gzcbJKNjdIJE9hikukd/JNX6YroZaPILue
	nZT3ys6b7s88MTJwV6JjkOOjmHp0qTPhWdunZOPo5+URTOUy0vLA5JzsK64teK5CdtU2n1XYOd/
	DSXnl+kVfimFsIvqnNh+TdubDFhauSGaH7cf4vSO8yZ9t/KvciMPwaVTzJDWpJioKWmaOkx1dw5
	73YQxpu875gkhXF+bTuMAoodwzeNkPB67KIj+2io86uphf3ISMmKruDA+abz6Np3z/yYpOgGpzK
	UMpxWGorPIM5bLpfdqoneWmfND6w2/6FP+YLdH4qgpno0WLK/rZbMEBSm/H9/pp420FU4dg9zVN
	5IwI=
X-Received: by 2002:a05:620a:468b:b0:7c5:5f38:ba59 with SMTP id af79cd13be357-7c76df517e8mr348234285a.3.1743690939487;
        Thu, 03 Apr 2025 07:35:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGc/cEfWzx2Wfy64eS8G1A7dG8YoCCPzhDGIItveQ5Hmu8uSfR/I3Ew3NmsqMJkdBvpIZR0lw==
X-Received: by 2002:a05:620a:468b:b0:7c5:5f38:ba59 with SMTP id af79cd13be357-7c76df517e8mr348231385a.3.1743690939090;
        Thu, 03 Apr 2025 07:35:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e5c1a7csm174057e87.70.2025.04.03.07.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 07:35:38 -0700 (PDT)
Date: Thu, 3 Apr 2025 17:35:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: srinivas.kandagatla@linaro.org
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Manikantan R <quic_manrav@quicinc.com>
Subject: Re: [PATCH v3 2/2] ASoC: codecs:lpass-wsa-macro: Fix logic of
 enabling vi channels
Message-ID: <pzyw3swuj4gqynxtp7kxbludyf6qq7fdfjaphw73tezzqocrda@i3f2knhbocme>
References: <20250403124247.7313-1-srinivas.kandagatla@linaro.org>
 <20250403124247.7313-3-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403124247.7313-3-srinivas.kandagatla@linaro.org>
X-Proofpoint-ORIG-GUID: fYfeI-RfxSP4oJcg_PdCQQyitvZKcoUM
X-Authority-Analysis: v=2.4 cv=N/gpF39B c=1 sm=1 tr=0 ts=67ee9cbc cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=kyQVAf1Qy8rE2pkpK9oA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: fYfeI-RfxSP4oJcg_PdCQQyitvZKcoUM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_06,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 adultscore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 spamscore=0 phishscore=0 suspectscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504030067

On Thu, Apr 03, 2025 at 01:42:47PM +0100, srinivas.kandagatla@linaro.org wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> Existing code only configures one of WSA_MACRO_TX0 or WSA_MACRO_TX1
> paths eventhough we enable both of them. Fix this bug by adding proper
> checks and rearranging some of the common code to able to allow setting
> both TX0 and TX1 paths
> 
> Without this patch only one channel gets enabled in VI path instead of 2
> channels. End result would be 1 channel recording instead of 2.

Could you please rearrange the code to make the patch more obvious?

> 
> Fixes: 2c4066e5d428 ("ASoC: codecs: lpass-wsa-macro: add dapm widgets and route")
> Cc: stable@vger.kernel.org
> Co-developed-by: Manikantan R <quic_manrav@quicinc.com>
> Signed-off-by: Manikantan R <quic_manrav@quicinc.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  sound/soc/codecs/lpass-wsa-macro.c | 112 +++++++++++++++++------------
>  1 file changed, 68 insertions(+), 44 deletions(-)
> 
> diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
> index ac119847bc22..c9e7f185f2bc 100644
> --- a/sound/soc/codecs/lpass-wsa-macro.c
> +++ b/sound/soc/codecs/lpass-wsa-macro.c
> @@ -1469,46 +1469,11 @@ static int wsa_macro_mclk_event(struct snd_soc_dapm_widget *w,
>  	return 0;
>  }
>  
> -static int wsa_macro_enable_vi_feedback(struct snd_soc_dapm_widget *w,
> -					struct snd_kcontrol *kcontrol,
> -					int event)
> -{
> -	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
> -	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
> -	u32 tx_reg0, tx_reg1;
> -	u32 rate_val;
>  
> -	switch (wsa->pcm_rate_vi) {
> -	case 8000:
> -		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_8K;
> -		break;
> -	case 16000:
> -		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_16K;
> -		break;
> -	case 24000:
> -		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_24K;
> -		break;
> -	case 32000:
> -		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_32K;
> -		break;
> -	case 48000:
> -		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_48K;
> -		break;
> -	default:
> -		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_8K;
> -		break;
> -	}

This can go to the wsa_macro_enable_disable_vi_sense().

> -
> -	if (test_bit(WSA_MACRO_TX0, &wsa->active_ch_mask[WSA_MACRO_AIF_VI])) {
> -		tx_reg0 = CDC_WSA_TX0_SPKR_PROT_PATH_CTL;
> -		tx_reg1 = CDC_WSA_TX1_SPKR_PROT_PATH_CTL;
> -	} else if (test_bit(WSA_MACRO_TX1, &wsa->active_ch_mask[WSA_MACRO_AIF_VI])) {
> -		tx_reg0 = CDC_WSA_TX2_SPKR_PROT_PATH_CTL;
> -		tx_reg1 = CDC_WSA_TX3_SPKR_PROT_PATH_CTL;
> -	}
> -
> -	switch (event) {
> -	case SND_SOC_DAPM_POST_PMU:
> +static void wsa_macro_enable_disable_vi_sense(struct snd_soc_component *component, bool enable,
> +						u32 tx_reg0, u32 tx_reg1, u32 val)
> +{
> +	if (enable) {
>  		/* Enable V&I sensing */
>  		snd_soc_component_update_bits(component, tx_reg0,
>  					      CDC_WSA_TX_SPKR_PROT_RESET_MASK,
> @@ -1518,10 +1483,10 @@ static int wsa_macro_enable_vi_feedback(struct snd_soc_dapm_widget *w,
>  					      CDC_WSA_TX_SPKR_PROT_RESET);
>  		snd_soc_component_update_bits(component, tx_reg0,
>  					      CDC_WSA_TX_SPKR_PROT_PCM_RATE_MASK,
> -					      rate_val);
> +					      val);

No need for extra renames, they complicate reviewing.

>  		snd_soc_component_update_bits(component, tx_reg1,
>  					      CDC_WSA_TX_SPKR_PROT_PCM_RATE_MASK,
> -					      rate_val);
> +					      val);
>  		snd_soc_component_update_bits(component, tx_reg0,
>  					      CDC_WSA_TX_SPKR_PROT_CLK_EN_MASK,
>  					      CDC_WSA_TX_SPKR_PROT_CLK_ENABLE);
> @@ -1534,9 +1499,7 @@ static int wsa_macro_enable_vi_feedback(struct snd_soc_dapm_widget *w,
>  		snd_soc_component_update_bits(component, tx_reg1,
>  					      CDC_WSA_TX_SPKR_PROT_RESET_MASK,
>  					      CDC_WSA_TX_SPKR_PROT_NO_RESET);
> -		break;
> -	case SND_SOC_DAPM_POST_PMD:
> -		/* Disable V&I sensing */
> +	} else {
>  		snd_soc_component_update_bits(component, tx_reg0,
>  					      CDC_WSA_TX_SPKR_PROT_RESET_MASK,
>  					      CDC_WSA_TX_SPKR_PROT_RESET);
> @@ -1549,6 +1512,67 @@ static int wsa_macro_enable_vi_feedback(struct snd_soc_dapm_widget *w,
>  		snd_soc_component_update_bits(component, tx_reg1,
>  					      CDC_WSA_TX_SPKR_PROT_CLK_EN_MASK,
>  					      CDC_WSA_TX_SPKR_PROT_CLK_DISABLE);
> +	}
> +}
> +
> +static void wsa_macro_enable_disable_vi_feedback(struct snd_soc_component *component,
> +						 bool enable, u32 rate)
> +{
> +	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
> +	u32 tx_reg0, tx_reg1;
> +
> +	if (test_bit(WSA_MACRO_TX0, &wsa->active_ch_mask[WSA_MACRO_AIF_VI])) {
> +		tx_reg0 = CDC_WSA_TX0_SPKR_PROT_PATH_CTL;
> +		tx_reg1 = CDC_WSA_TX1_SPKR_PROT_PATH_CTL;
> +		wsa_macro_enable_disable_vi_sense(component, enable, tx_reg0, tx_reg1, rate);

As you are refactoring this piece of code, do you need tx_reg0 / tx_reg1
variables? Can you inline them instead?

> +	}
> +
> +	if (test_bit(WSA_MACRO_TX1, &wsa->active_ch_mask[WSA_MACRO_AIF_VI])) {
> +		tx_reg0 = CDC_WSA_TX2_SPKR_PROT_PATH_CTL;
> +		tx_reg1 = CDC_WSA_TX3_SPKR_PROT_PATH_CTL;
> +		wsa_macro_enable_disable_vi_sense(component, enable, tx_reg0, tx_reg1, rate);
> +
> +	}
> +

Extra empty line.

> +}
> +
> +static int wsa_macro_enable_vi_feedback(struct snd_soc_dapm_widget *w,
> +					struct snd_kcontrol *kcontrol,
> +					int event)
> +{
> +	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
> +	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
> +	u32 rate_val;
> +
> +	switch (wsa->pcm_rate_vi) {
> +	case 8000:
> +		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_8K;
> +		break;
> +	case 16000:
> +		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_16K;
> +		break;
> +	case 24000:
> +		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_24K;
> +		break;
> +	case 32000:
> +		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_32K;
> +		break;
> +	case 48000:
> +		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_48K;
> +		break;
> +	default:
> +		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_8K;
> +		break;
> +	}
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_POST_PMU:
> +		/* Enable V&I sensing */
> +		wsa_macro_enable_disable_vi_feedback(component, true, rate_val);
> +		break;
> +	case SND_SOC_DAPM_POST_PMD:
> +		/* Disable V&I sensing */
> +		wsa_macro_enable_disable_vi_feedback(component, false, rate_val);
>  		break;
>  	}
>  
> -- 
> 2.39.5
> 

-- 
With best wishes
Dmitry
