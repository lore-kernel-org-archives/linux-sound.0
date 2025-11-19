Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7871A2E8DE6
	for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 15:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763566508; cv=none; b=h3VuGbKk6+hkZOjhA3IrHy0+o9cH1dcypGxPL2NR0Xb8grWl9tpR42O4ZMUhmbhCeLAjKmw/pWHr3ZDSYJLrOnias+h9Na1VtVuSilsraZ1AljQbNVEilda55Pl29BuNreCXtodPM5+noCoR+S/yFByGUnBBEfruToNgJarYagM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763566508; c=relaxed/simple;
	bh=aWyowoKzJF3LmxjEa5m+k7Ul+P3W6nIhOolyl6OYx8w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DeVnW60v9pGTNiez5At2lv+YdRnxIAGuQWNgDjcwTFvgpzOTeXPuwkQwymTG1UI1aO24+64vdd0eklywC6p81PhWkZrTWgLALjj0wJDz/qqZOfnox0yG9EEkSv6k4kYIU8OG88NeJZfORS+4qvVf60jJ26rYsuapcXSvkwjTzWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iNnE/g2Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F493pHeK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iNnE/g2Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F493pHeK"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ9lgAX3165004
	for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 15:35:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5tDx7NYoUx/VPGlaHHPKM3CRY4d7jWYFUAKx3QSgPPc=; b=iNnE/g2QxMbUwlEa
	9ioCWGkIOXGOarAHE1hmxgUqCSNQ1mXwTyBVkQdkp3X3IqDd1QeoVDhlM1nVZKTt
	WkYzDSa6RFyl309HGcvGEJnpet/mK/MI0gBrfpkiRoCFPLEt3s+QstJ4R+BIJubW
	8OWx/NFZT5oMY74MY0LPCDMDD9LMM0EIfVb04SKAy3BRqH8dmI3+1U/LccmTRbDI
	sP1nkLeMfj6CwuHEvJj3vOpLu2NGUrIkUA5H3uhgZENCEwwglU/axDT8if1WK5hO
	y98O/Nx/VYOKm+c1YhylxqqofrzAH7R9Iln6fm1mOSB/zqtcPC2a/Dhg0s6863XU
	oV7ViA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agvqgup4g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 15:35:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee3dfe072dso39891361cf.2
        for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 07:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763566504; x=1764171304; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5tDx7NYoUx/VPGlaHHPKM3CRY4d7jWYFUAKx3QSgPPc=;
        b=F493pHeKb/xNfZ/NXV2SRLPjSU2NBZ6YYB2T1cCqJB08KvViTWCcYZhqo+5zDrtXqQ
         20X9fHIK1xZSAfPlRXso4Gp8L/NrjJB98XJ09VhEwm6FXAbtanVqhiQYYNeJlBnE8wqI
         VLcysVjgz88CfcJfsVAR6hR5RenRmpNGUpnmYYeebGRHd1wnBOIDcXvVVWf+THinWjAD
         x/m5pXsmjoLx6at2VArRBKEqsscCIGoRRs7oAQfIEfQDkoLull/Ajyjv1hyxS0rrZpvi
         Xg3m9AwCW8m849R8lu50yN+P0Sy9V0go3Ina9UUwl5xbFPsFay2ledlWTBB8fT3lKttD
         MJSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763566504; x=1764171304;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5tDx7NYoUx/VPGlaHHPKM3CRY4d7jWYFUAKx3QSgPPc=;
        b=RUoYOB8afSY+PmSFMh/E7JvqU+CaHyGMZIwkb/oxG1XuqUCGw6bmkbRGFDfA7aNku4
         8Zz3+z5BSDXoCseTUqKT/iSTedclgfjTnHe0yqMPfGYc5hrLWSPHFBuRTMfnH/SrP6eM
         +JpLS66vTUv0J+tMOM2/RYkw3gkdk0utCRwPIQj+UWZrsGF8MGIcE+KvfVqQEPYIqZa8
         DQbAVOxS+qUnz+LsnKMMW5mcbKt4AeIOT0tGchR/cC314W1772i5KU8L6yPpnyO5lQ28
         9ujHlcHWt/K/0QzzRad5nEmZrmp2UK8lk3mg/UZThD0lYF1N+T7he+y8vECu8hGCltXt
         /sIw==
X-Forwarded-Encrypted: i=1; AJvYcCW8yiIf+w4YM47WNveTvVChQGNYqD5InwoMl+FJvLcgZAlrFEmfHAMEiCJCawlWHCe27pg7Pp8//29BSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOGIwJ6XqISJ5NfXpLato3ZPsPintPMjo3scAr0u81SlPN0dhX
	1IzPRmsrfGAp34y3YOgaRsDhvPYUSDr2WWCT8snleFln/fuyR+YvwQqRboRo7aRHNcDRONpX6wt
	I2mwiu9fJ20ESMm3DhNiqTdZWqE4kp3r/yO2w/afHcgBk3crXXDLa4ljkN/UpaSxnjg==
X-Gm-Gg: ASbGnctbMnQIO8MX5wHBG4qfxh+gwSAIrhM0AxL/agIPkQ+pD08gbK+sy/znjKlPV3Y
	Re5vAbYHE6ggpCz7IARZI2Fo+/rrC0Jq4axqkl2EMUTh2O7CdHsjLjeU2lYHoBHL6BLbEDk6uQp
	gJUXPwpxBI0YD67B3ZVxQXRLkY4pod7FF2G8i5xbkwVvY6OeNIM4GaFoMwFTrZdsNv+NQeUHVOD
	+Ois+2tzsV54gPsfldbdadgSPVaTPrQD6oXsNeYaWrMgkkbepoxhjmisVxBbZpgSFpkPMbknu0c
	G6M8mV5eVC9xfDxgKZgL09XJMDVYyI3mLj4zs4desSjlavFqjDfNr7BgXRUIP5dBLfAjJpXNCRO
	IJUFi+AfANUZy68GjzvqESnphlJqnlE9dNcIf
X-Received: by 2002:a05:622a:15d2:b0:4e8:aa9d:f0d9 with SMTP id d75a77b69052e-4edf2130595mr249093701cf.38.1763566504049;
        Wed, 19 Nov 2025 07:35:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFq352RyfTxaD/m6203E2Uf8xLboRspl8BPd52ftBjqoQTWmB0XosHeuF+KICNiiS5/juTXJA==
X-Received: by 2002:a05:622a:15d2:b0:4e8:aa9d:f0d9 with SMTP id d75a77b69052e-4edf2130595mr249093091cf.38.1763566503498;
        Wed, 19 Nov 2025 07:35:03 -0800 (PST)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-595803b33basm4791604e87.36.2025.11.19.07.34.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 07:35:03 -0800 (PST)
Message-ID: <0954c4f6-a50e-477a-9354-0f7c497f6f4b@oss.qualcomm.com>
Date: Wed, 19 Nov 2025 15:34:57 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] ASoC: codecs: lpass-wsa-macro: remove mix path event
To: Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        "open list:QCOM AUDIO (ASoC) DRIVERS" <linux-sound@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20251117051523.16462-1-jonathan@marek.ca>
 <20251117051523.16462-3-jonathan@marek.ca>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20251117051523.16462-3-jonathan@marek.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4wiAFQI9Cy7QU53-vkP2LUkEyB0wGZCi
X-Proofpoint-GUID: 4wiAFQI9Cy7QU53-vkP2LUkEyB0wGZCi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDEyNCBTYWx0ZWRfX15TdIpb6MOEM
 oudvHkqX2IiXaPv29z8hUrt2w+MhR9qLplKATxOU1sDBh2SQNZkjTLYgVjfNw8eOZhhehYPxxyv
 eXIgCQqpV5TOBMitntv2zn9X0HSv2fjruMXOv0iV0G7ywg3EsGfCatM/zMc44PnYJjmBDHrir/M
 LdSg5fIZEFrbtLBBcW3ZGs93vIHeHMamtB2woJwKUnb8k50GlBQaOaZDkNH5a6M1v5IkVgG+xef
 1gInvcbncpo0cVV8VjM+yH1gY0IAicoozidzmjamM0Qw0b+dibi62dwvIPCAhO/etYsOBxK+S5V
 M7Pf16oGqXox4nZBvrbhgaIeZBOGfaH6Dj03ds4AQ==
X-Authority-Analysis: v=2.4 cv=LMJrgZW9 c=1 sm=1 tr=0 ts=691de3a9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=RAbU-raeAAAA:8 a=EUspDBNiAAAA:8
 a=Bn-LY-kQ7RkP1ue-7dgA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=JiizpSU_mAIq9zsZDqn2:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_04,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511190124



On 11/17/25 5:15 AM, Jonathan Marek wrote:
> All it does it disable the mix path clk bit, but this is already managed by
> the WSA_RX_MIX0_CLK/WSA_RX_MIX1_CLK supplies.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---


Tested-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
#on T14s
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

>  sound/soc/codecs/lpass-wsa-macro.c | 46 +++---------------------------
>  1 file changed, 4 insertions(+), 42 deletions(-)
> 
> diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
> index 6f16d54aee401..06570e474c850 100644
> --- a/sound/soc/codecs/lpass-wsa-macro.c
> +++ b/sound/soc/codecs/lpass-wsa-macro.c
> @@ -1563,36 +1563,6 @@ static int wsa_macro_enable_vi_feedback(struct snd_soc_dapm_widget *w,
>  	return 0;
>  }
>  
> -static int wsa_macro_enable_mix_path(struct snd_soc_dapm_widget *w,
> -				     struct snd_kcontrol *kcontrol, int event)
> -{
> -	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
> -	u16 path_reg;
> -
> -	switch (w->shift) {
> -	case WSA_MACRO_RX_MIX0:
> -		path_reg = CDC_WSA_RX0_RX_PATH_MIX_CTL;
> -		break;
> -	case WSA_MACRO_RX_MIX1:
> -		path_reg = CDC_WSA_RX1_RX_PATH_MIX_CTL;
> -		break;
> -	default:
> -		return 0;
> -	}
> -
> -	switch (event) {
> -	case SND_SOC_DAPM_POST_PMU:
> -		break;
> -	case SND_SOC_DAPM_POST_PMD:
> -		snd_soc_component_update_bits(component, path_reg,
> -					      CDC_WSA_RX_PATH_MIX_CLK_EN_MASK,
> -					      CDC_WSA_RX_PATH_MIX_CLK_DISABLE);
> -		break;
> -	}
> -
> -	return 0;
> -}
> -
>  static void wsa_macro_hd2_control(struct snd_soc_component *component,
>  				  u16 reg, int event)
>  {
> @@ -2475,30 +2445,22 @@ static const struct snd_soc_dapm_widget wsa_macro_dapm_widgets_v2_1[] = {
>  	SND_SOC_DAPM_MUX("WSA_RX0 INP0", SND_SOC_NOPM, 0, 0, &rx0_prim_inp0_mux_v2_1),
>  	SND_SOC_DAPM_MUX("WSA_RX0 INP1", SND_SOC_NOPM, 0, 0, &rx0_prim_inp1_mux_v2_1),
>  	SND_SOC_DAPM_MUX("WSA_RX0 INP2", SND_SOC_NOPM, 0, 0, &rx0_prim_inp2_mux_v2_1),
> -	SND_SOC_DAPM_MUX_E("WSA_RX0 MIX INP", SND_SOC_NOPM, WSA_MACRO_RX_MIX0,
> -			   0, &rx0_mix_mux_v2_1, wsa_macro_enable_mix_path,
> -			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
> +	SND_SOC_DAPM_MUX("WSA_RX0 MIX INP", SND_SOC_NOPM, 0, 0, &rx0_mix_mux_v2_1),
>  	SND_SOC_DAPM_MUX("WSA_RX1 INP0", SND_SOC_NOPM, 0, 0, &rx1_prim_inp0_mux_v2_1),
>  	SND_SOC_DAPM_MUX("WSA_RX1 INP1", SND_SOC_NOPM, 0, 0, &rx1_prim_inp1_mux_v2_1),
>  	SND_SOC_DAPM_MUX("WSA_RX1 INP2", SND_SOC_NOPM, 0, 0, &rx1_prim_inp2_mux_v2_1),
> -	SND_SOC_DAPM_MUX_E("WSA_RX1 MIX INP", SND_SOC_NOPM, WSA_MACRO_RX_MIX1,
> -			   0, &rx1_mix_mux_v2_1, wsa_macro_enable_mix_path,
> -			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
> +	SND_SOC_DAPM_MUX("WSA_RX1 MIX INP", SND_SOC_NOPM, 0, 0, &rx1_mix_mux_v2_1),
>  };
>  
>  static const struct snd_soc_dapm_widget wsa_macro_dapm_widgets_v2_5[] = {
>  	SND_SOC_DAPM_MUX("WSA_RX0 INP0", SND_SOC_NOPM, 0, 0, &rx0_prim_inp0_mux_v2_5),
>  	SND_SOC_DAPM_MUX("WSA_RX0 INP1", SND_SOC_NOPM, 0, 0, &rx0_prim_inp1_mux_v2_5),
>  	SND_SOC_DAPM_MUX("WSA_RX0 INP2", SND_SOC_NOPM, 0, 0, &rx0_prim_inp2_mux_v2_5),
> -	SND_SOC_DAPM_MUX_E("WSA_RX0 MIX INP", SND_SOC_NOPM, WSA_MACRO_RX_MIX0,
> -			   0, &rx0_mix_mux_v2_5, wsa_macro_enable_mix_path,
> -			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
> +	SND_SOC_DAPM_MUX("WSA_RX0 MIX INP", SND_SOC_NOPM, 0, 0, &rx0_mix_mux_v2_5),
>  	SND_SOC_DAPM_MUX("WSA_RX1 INP0", SND_SOC_NOPM, 0, 0, &rx1_prim_inp0_mux_v2_5),
>  	SND_SOC_DAPM_MUX("WSA_RX1 INP1", SND_SOC_NOPM, 0, 0, &rx1_prim_inp1_mux_v2_5),
>  	SND_SOC_DAPM_MUX("WSA_RX1 INP2", SND_SOC_NOPM, 0, 0, &rx1_prim_inp2_mux_v2_5),
> -	SND_SOC_DAPM_MUX_E("WSA_RX1 MIX INP", SND_SOC_NOPM, WSA_MACRO_RX_MIX1,
> -			   0, &rx1_mix_mux_v2_5, wsa_macro_enable_mix_path,
> -			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
> +	SND_SOC_DAPM_MUX("WSA_RX1 MIX INP", SND_SOC_NOPM, 0, 0, &rx1_mix_mux_v2_5),
>  };
>  
>  static const struct snd_soc_dapm_route wsa_audio_map[] = {

