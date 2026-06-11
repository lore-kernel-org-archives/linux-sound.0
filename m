Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5263A8758
	for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 23:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781219814; cv=none; b=mUdEHp2Mhk+54cqIpxm7zlabiMJSd9ghZ6FrQzprpbe45FGlxHWVZ/H1fU0j9KhiXZjShB7osJIu1CPW/aWl1fBm8FxJTgQjMVG9xZEzGGs5lTFbma6VnCpixXi5M/1nCwQhIyGtspBM0SocTT78QwBt0M7dLNEUZ43qiDRp12s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781219814; c=relaxed/simple;
	bh=P8JpD7l/V9dvoH6kAgeapktGWvVCy6U0HHGolaseEd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=btJY0mS1Vh7BDJ24I8gATmkGpMxXc62ky0jR1kK0fD5hx7AxdQXrcxw6rm3JvP7Xtrpl1T0WxdgcgO/cw4CRMMqB8ryaMBXkdIzpKJApVMRzYeQZ9nGTbBG0bY+gqG83RTtTYQPEeTlgjAodw1EJO1zNn/LdKJyBzS83EXq7p6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SrbWffD6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bJvbh4z9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SrbWffD6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bJvbh4z9"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BMTcdR1918540
	for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 23:16:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ChdffMZ8Z7dmt1yvyVudKKwh
	HXnbOd1KVRltY/AFG6Y=; b=SrbWffD6kKfvJC7xGem34vqYMnXA4ekztGaqu1bR
	/IP1SkTZ5wmZA6L+dL2qx0zMEwUyDsqtDJIJLoyDysz2V33aoZHAUGSqssQSn2MB
	OAOObJLfaOkUtnUtyaAB5bwqRiofUEJAjO/aJLLGDxA14PzMzGQCjTg3Jtp+sn3f
	eGYlO3pY1Tztm/YJ651anSByBlf61vloWaswjM/f1BK+USuPwRZHk6fyvkF5r0a3
	AOBqE5Fhy+VjprRQ4Fwj4er+bKW7Sj+ZjvnuNuKPlib5ubVPN8IHp337a9QBiBRI
	/nTLV4zT+3MdkN4kSe3eC4uG0RsYq+aj24V141pc2xVMmw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er0xd1g7q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 23:16:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5179e5ba14cso4699331cf.2
        for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 16:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781219809; x=1781824609; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ChdffMZ8Z7dmt1yvyVudKKwhHXnbOd1KVRltY/AFG6Y=;
        b=bJvbh4z9bsSb7J0wR27wlNe+uZ6X6NR8XUCFcWApBBNAJZaNAfT4po2HCXNk0YrvqR
         vPMIvyJSQy7K/id12F6wjwxA3RnK4rwnWaXriMhRWXt+EBSc29ropdPH75xjv2L298XG
         v9iutJJtvj3cBIIsIe2rLHK0CjSlmrU16x2yJjSm9/OR6pyb61bg4GUy8z5n5XsmsuET
         iGP8K19L36nLmPod/uF1u6mkMY83irIIwgdAx5BFp8+uq7pycsEWFM6Yim1xgHGjTZIk
         qJAw58TtWyIC4Yq06FZ5/gZgikoWBRq7yXyEPs7A4Sh9NaCWsKLGZMxFo4O9K2A+zz2M
         4okg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781219809; x=1781824609;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ChdffMZ8Z7dmt1yvyVudKKwhHXnbOd1KVRltY/AFG6Y=;
        b=n2CxRHwfGiMbA+bGovmALbhLUeYstnCK+Knn7UNP1E/sLLXhp+E5qAveuz1KFCiHG+
         I82yTkbbYdSB1EHRrdhjk6/aVH5qBihxtbj75Ihyww6FxsmSK1M5HFIzquxLUK70D4pG
         CoFtu571TkQxKAYLGJjV+W0ESprdSRW0XIgaA3bMCraIopWAbqd/VY3Uu6sqY0T6orCR
         v/3kKxfU9dGMhvZfCWTkj9PSXAjdAQ9QBQVM2mt0i49XYqCE/MF/m4EA0tfipvLqApo5
         YoD2cm4CtQAqpdeMTbBZ9v3mYv++6rOjt9bMFSw1vdhqFKlFyvL3qoAYeWPGlvP7ZhYp
         Pb/Q==
X-Forwarded-Encrypted: i=1; AFNElJ8S1jxi4g61Da87fwJlwZxNlWhIcycW9U+sJK2OEdprkdV7HPOY7z2YYjscEnZPHjFs8MsbmxYrIKtDJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzijVciTqg96ZqwtUqqcPywmKAGIkL11crNJYf6mYhw25J1/1gm
	kx8ku9LSXyskkausuh3XYFUBEpydTF7r4F/0m8aQBFXEnLLrOv75VbQpDrTV6IHVEP6f1IsA0GE
	Oq7CkdzRDMOnvlAYtHDDUPfbHNfY4R9ePIo6CohBVsvaGa65mbxW47XKT17QSj7vXGg==
X-Gm-Gg: Acq92OF6Mky1OrXUIgxXkc5++pP3H+b/6tXdWpTk+dmReINK/RE0S0BpBG6GyP/SRoz
	tddNCbx4y95AmQOxOvP6tyH42090LBVq4Ist5WASKZcpxBVgdMn2cwAqF0s9bwa5X4Vu/YKCc6C
	mWwJGpdYn9XfvVeEub4m8yIWRaBPQSE0nEyxpyagkVtgtYiopZpWL65TG9Fu0Bw7VlKZ9VhQTSg
	/4lYZrPMDjBbaLS6cwIq8/xTDm9JQZJ9dYdKcVyshObqE+NdBljXGwidLmgwnK/cdbfiw9LioX6
	7dxEkr5fdqNYiZpG0cz3I/RLnaqxbgzUCCk/muq3fwi2oKYY7+JReBJa53ycwE0jQ0BoxsS7Rit
	EJwWIvFRrOt93oSdx2tQH5yD5fhYTksfNsIx9rg3n+lYu90MWW3lCU/L2khkiJJnjjce69YrEoq
	zweCJxvAgO6bpnNbO9oKYcqnXeukAHEY5JWec=
X-Received: by 2002:a05:622a:1aa3:b0:517:a023:39a9 with SMTP id d75a77b69052e-517fe5cc7cbmr3573821cf.28.1781219808707;
        Thu, 11 Jun 2026 16:16:48 -0700 (PDT)
X-Received: by 2002:a05:622a:1aa3:b0:517:a023:39a9 with SMTP id d75a77b69052e-517fe5cc7cbmr3573411cf.28.1781219808273;
        Thu, 11 Jun 2026 16:16:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e16a134sm13744e87.27.2026.06.11.16.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 16:16:45 -0700 (PDT)
Date: Fri, 12 Jun 2026 02:16:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: Re: [PATCH v1 2/2] ASoC: qcom: sc8280xp: add Shikra EVK machine
 variants
Message-ID: <qcvb4wvfsk6twtvkvkechysrihngaugnhe3po6qbqjrfmqcml5@mn453je73fm6>
References: <20260611112946.954172-1-ajay.nandam@oss.qualcomm.com>
 <20260611112946.954172-3-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611112946.954172-3-ajay.nandam@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: ddfDxB3_fzn1ePqJd3Wa1QBcUig0S7vJ
X-Proofpoint-GUID: ddfDxB3_fzn1ePqJd3Wa1QBcUig0S7vJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDIzMyBTYWx0ZWRfX/QTLw8uXU+rI
 RZY2q5TlHmuX8mD3Q30yXup4z4bPMYce68FCf8Qf4wcMxrpFf5/DjybEb/OG39KYk2NrWQK7dhT
 B2ogr2Vw0wTvKf5lXJsSzSwPfFzi5poYTXeq0lyiGBM7M/Gk+Tk3poAtXYiz2CNfHuVbfbY7f7P
 /yrb5lNFCeieql3dGBfrSNCbianTw2KmUJL0z5vGGziQ54XSO4jcI9Do4Py675z9UCrLHLn91Q3
 RvtMvyp0fMAUbzCOU62twowf+9xvFt+KL1A5k9K2AHepnFJtN8xo/Paz1pytFEgUW4H50RpAfwZ
 zHwsRxNNFIU4t+fI9XYAd7nlTGfCidEcPY1ZLBHZvBE9Jq+H5oW9ccfLma7rZpX4W07vNLhYKGs
 i6okorxDrJbHA0+/Q8110uQwrmCi4LSAhu8aQnSvjYtID9nJ59dMg0ZLzS/VevjYnwFiZF3hS3H
 2sn6B1Se2vMhBg43b+w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDIzMyBTYWx0ZWRfXyzsBb4caqKiK
 6985hsklHdTLP11bhrAa4Xk9QwnZKSAH/tGpFU7UMUj/FbMNz/YdZ4hvciBSRpjtW9fRwPc3TIe
 M2VwQteyeOhsLQrIZO6AKcl1TJsnSKk=
X-Authority-Analysis: v=2.4 cv=O6UJeh9W c=1 sm=1 tr=0 ts=6a2b41e1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=deNja2eX8ZM74omoRk4A:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_05,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110233

On Thu, Jun 11, 2026 at 04:59:46PM +0530, Ajay Kumar Nandam wrote:
> Add machine-driver support for Qualcomm Shikra EVK variants by matching
> dedicated compatible strings and applying board-specific audio behavior.
> 
> Shikra platforms are available as CQM, CQS, and IQS variants with
> different audio components and processing architectures:
> 
> - CQM/CQS use an I2S-based path with WSA885x amplifiers and
>   PM4125 + Rouleur codec components.
> - CQM runs in DSP-bypass mode, where the complete audio pipeline runs
>   on CPU only and no DSP is involved.
> - CQS uses modem-DSP based audio processing.
> - IQS uses a third-party MAX98091 codec with modem-DSP support.
> 
> Introduce variant-specific handling so codec controls, DAPM widgets, and
> clock programming match the board design and avoid invalid clock setup on
> variants where it is not applicable.

To me it looks like several independent changes being squashed into one
commit.

> 
> Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---
>  sound/soc/qcom/common.c   |  2 ++
>  sound/soc/qcom/sc8280xp.c | 58 +++++++++++++++++++++++++++++++++++++--
>  sound/soc/qcom/sdw.c      |  3 ++
>  3 files changed, 61 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
> index f42c98ded..32d6c09b2 100644
> --- a/sound/soc/qcom/common.c
> +++ b/sound/soc/qcom/common.c
> @@ -3,6 +3,7 @@
>  // Copyright (c) 2018, The Linux Foundation. All rights reserved.
>  
>  #include <dt-bindings/sound/qcom,q6afe.h>
> +#include <dt-bindings/sound/qcom,qaif.h>
>  #include <linux/module.h>
>  #include <sound/jack.h>
>  #include <linux/input-event-codes.h>
> @@ -430,6 +431,7 @@ int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
>  	}
>  
>  	switch (cpu_dai->id) {
> +	case QAIF_CDC_DMA_RX0:
>  	case TX_CODEC_DMA_TX_0:
>  	case TX_CODEC_DMA_TX_1:
>  	case TX_CODEC_DMA_TX_2:
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index e5d23e244..4c985f81c 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -37,6 +37,25 @@ static struct snd_soc_dapm_widget sc8280xp_dapm_widgets[] = {
>  	SND_SOC_DAPM_SPK("DP7 Jack", NULL),
>  };
>  
> +static struct snd_soc_dapm_widget shikra_cqm_dapm_widgets[] = {
> +	SND_SOC_DAPM_HP("Headphone Jack", NULL),
> +	SND_SOC_DAPM_MIC("Mic Jack", NULL),
> +};

No speakers?

> +
> +static const struct snd_soc_dapm_widget shikra_iqs_dapm_widgets[] = {
> +	SND_SOC_DAPM_HP("Headphone", NULL),
> +	SND_SOC_DAPM_MIC("Headset Mic", NULL),
> +	SND_SOC_DAPM_MIC("Int Mic", NULL),
> +	SND_SOC_DAPM_SPK("Speaker", NULL),
> +};
> +
> +static const struct snd_kcontrol_new shikra_iqs_controls[] = {
> +	SOC_DAPM_PIN_SWITCH("Headset Mic"),
> +	SOC_DAPM_PIN_SWITCH("Headphone"),
> +	SOC_DAPM_PIN_SWITCH("Int Mic"),
> +	SOC_DAPM_PIN_SWITCH("Speaker"),
> +};

No controls for CQM/CQS variants? Why? Or rather why do we need
kcontrols for IQS?

> +
>  struct snd_soc_common {
>  	const char *driver_name;
>  	const struct snd_soc_dapm_widget *dapm_widgets;
> @@ -49,6 +68,7 @@ struct snd_soc_common {
>  	bool codec_sysclk_set;
>  	bool mi2s_mclk_enable;
>  	bool mi2s_bclk_enable;
> +	bool dsp_bypass;
>  };
>  
>  struct sc8280xp_snd_data {
> @@ -219,6 +239,10 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
>  	int mclk_freq = sc8280xp_get_mclk_freq(params);
>  	int bclk_freq = sc8280xp_get_bclk_freq(params);
>  
> +    /* Skip DSP configuration when operating in CPU-only (bypass) mode */
> +	if (data->snd_soc_common_priv->dsp_bypass)
> +		return 0;
> +

How are e.g. MI2S signals configured / routed?

>  	switch (cpu_dai->id) {
>  	case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
>  	case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
> @@ -239,7 +263,7 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
>  					       SND_SOC_CLOCK_IN);
>  
>  		if (data->snd_soc_common_priv->codec_sysclk_set)
> -			snd_soc_dai_set_sysclk(cpu_dai,
> +			snd_soc_dai_set_sysclk(codec_dai,
>  					       0, mclk_freq,
>  					       SND_SOC_CLOCK_IN);
>  		break;
> @@ -284,7 +308,7 @@ static void sc8280xp_add_be_ops(struct snd_soc_card *card)
>  	int i;
>  
>  	for_each_card_prelinks(card, i, link) {
> -		if (link->no_pcm == 1) {
> +		if (link->no_pcm == 1 || link->num_codecs > 0) {
>  			link->init = sc8280xp_snd_init;
>  			link->be_hw_params_fixup = sc8280xp_be_hw_params_fixup;
>  			link->ops = &sc8280xp_be_ops;
> @@ -375,6 +399,33 @@ static struct snd_soc_common sc8280xp_priv_data = {
>  	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
>  };
>  
> +static const struct snd_soc_common shikra_cqm_priv_data = {
> +	.driver_name = "shikra",
> +	.dapm_widgets = shikra_cqm_dapm_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(shikra_cqm_dapm_widgets),
> +	.dsp_bypass = true,
> +};
> +
> +static const struct snd_soc_common shikra_cqs_priv_data = {
> +	.driver_name = "shikra",
> +	.dapm_widgets = shikra_cqm_dapm_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(shikra_cqm_dapm_widgets),
> +	.mi2s_bclk_enable = true,
> +	.codec_sysclk_set = true,
> +};
> +
> +static const struct snd_soc_common shikra_iqs_priv_data = {
> +	.driver_name = "shikra",
> +	.dapm_widgets = shikra_iqs_dapm_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(shikra_iqs_dapm_widgets),
> +	.controls = shikra_iqs_controls,
> +	.num_controls = ARRAY_SIZE(shikra_iqs_controls),
> +	.codec_dai_fmt = SND_SOC_DAIFMT_CBP_CFP |
> +			 SND_SOC_DAIFMT_NB_NF |
> +			 SND_SOC_DAIFMT_I2S,
> +	.codec_sysclk_set = true,
> +	.mi2s_bclk_enable = true,
> +};
> +
>  static struct snd_soc_common sm8450_priv_data = {
>  	.driver_name = "sm8450",
>  	.dapm_widgets = sc8280xp_dapm_widgets,
> @@ -408,6 +459,9 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
>  	{.compatible = "qcom,qcs9075-sndcard", .data = &qcs9100_priv_data},
>  	{.compatible = "qcom,qcs9100-sndcard", .data = &qcs9100_priv_data},
>  	{.compatible = "qcom,sc8280xp-sndcard", .data = &sc8280xp_priv_data},
> +	{.compatible = "qcom,shikra-cqm-sndcard", .data = &shikra_cqm_priv_data},
> +	{.compatible = "qcom,shikra-cqs-sndcard", .data = &shikra_cqs_priv_data},
> +	{.compatible = "qcom,shikra-iqs-sndcard", .data = &shikra_iqs_priv_data},
>  	{.compatible = "qcom,sm8450-sndcard", .data = &sm8450_priv_data},
>  	{.compatible = "qcom,sm8550-sndcard", .data = &sm8550_priv_data},
>  	{.compatible = "qcom,sm8650-sndcard", .data = &sm8650_priv_data},
> diff --git a/sound/soc/qcom/sdw.c b/sound/soc/qcom/sdw.c
> index 6576b47a4..0be743cec 100644
> --- a/sound/soc/qcom/sdw.c
> +++ b/sound/soc/qcom/sdw.c
> @@ -4,6 +4,7 @@
>  
>  #include <dt-bindings/sound/qcom,lpass.h>
>  #include <dt-bindings/sound/qcom,q6afe.h>
> +#include <dt-bindings/sound/qcom,qaif.h>
>  #include <linux/module.h>
>  #include <sound/soc.h>
>  #include "sdw.h"
> @@ -41,6 +42,8 @@ static bool qcom_snd_is_sdw_dai(int id)
>  	switch (id) {
>  	case LPASS_CDC_DMA_TX3:
>  	case LPASS_CDC_DMA_RX0:
> +	case QAIF_CDC_DMA_VA_TX0:
> +	case QAIF_CDC_DMA_RX0:
>  		return true;
>  	default:
>  		break;
> -- 
> 2.34.1

-- 
With best wishes
Dmitry
