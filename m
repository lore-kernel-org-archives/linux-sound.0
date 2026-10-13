Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C74368D41
	for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 09:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791882595; cv=none; b=G07MK/ZFi/uBr3uKSRh1gJMCxlSrxYCK/VzrTufrZLi6TIcVKW3W1eSw2EJAbu/lesapvSXBBO+D7ScpyeBARFvKXsCj7dcfUMf98iEi7279sNLFEkLioWGxhWzRi5JbqFsaEy97PYrc2gu49T2osDEh3pLJgIwPgIBPBC8vFIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791882595; c=relaxed/simple;
	bh=dvOSiE56w7Qm83tAR9oMfBVofaeE/H677OshvkG8l88=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rLnN/Wzyh3YfQEH7RHH7WAOHglR7iJuU33WQLrkXfy3B28DVftKR/+PNud7Zw4rnbvSnFF2MjtvL1ikvk/FZPyNl2QQEsiDyd8Dhufk9DyXhncT1v6LNTXNhSOtgQb1NscEIdTbq0Ao/OH7lUiBJqLhv/Yf7LNvxZJpd6uiRyoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YUfM87e4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ua71yRdN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YUfM87e4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ua71yRdN"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8bEUU302956
	for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 09:09:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pVmMhjXCnL0F6kCOvaVqBvxdEW0fHS/jmnR/FpTpHQM=; b=YUfM87e4+bmfJx+m
	su6PlVNv668YvPg2VqZ15qZaAIABHBCxJcHnh29b7TNZTzGVQ94DIa9hiuZlb9ng
	eXbwEOERs1CFGQIRW320SgaQLqStN1IygunY8WYiNYj2xupw5Noq8A/GwAh18U8S
	y/ANDNs1Q3dch0dSfYMrusL1Qy4iZ/FkYc6O8t7fw1tuXap0F6/J9u7qRVO0row9
	ldX75I1WLuqyys45hlp4V8QXUSOc3qMIjqNsM+E3RMm4zb7WxJlaIZhG6Ti5nuYs
	feTrOfFsw79vhAFMnpcbwI8OVX4ubeS9v2pI3Te8pUPlr3MfH8KYQW/Bi/5x7ffL
	MtZdeg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98sqa1u8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 09:09:53 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39de4e72b33so4005969a91.2
        for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 02:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791882592; x=1792487392; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pVmMhjXCnL0F6kCOvaVqBvxdEW0fHS/jmnR/FpTpHQM=;
        b=Ua71yRdN/tbbKTSwfGxw73VkKWGrtT46jhiaBrxrO701JEewuKFTJPoD0SSM4MF2Fj
         jp5ssaWqIHRCVneh8uFXOdV/KsdRwdKcwVBWuqf3tTE9v9eNiCasnviwik4kUcl3bfUe
         DgBjA4t82QI8Wo8fa5wXMQ3GZnpBXZZmMcIHLzSByGA2SbWgmzI7tiIHwXfNC1tKycWn
         lFF4dxN86MOhwo1kCN4jlbG2Lw6WXbmqPNmKLH3p5xRyEhWwmAXu7fVvHLNyXrAvbh9k
         YTKDBfiDlH2ZpCtvx15IeLaZDacMObZZZVIUF54OffvbzgaHMnpK0pNlWuaIwibaYDEf
         6zZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791882592; x=1792487392;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pVmMhjXCnL0F6kCOvaVqBvxdEW0fHS/jmnR/FpTpHQM=;
        b=0SVsctjIvIw7PQgWUSqmiudtbmmzUZp6cIWvBohR40d/BkibXfyGtyYR4G6ovOtUMq
         SJ5q0EYJ28GsGLg6ykzSUKgkgrBLSTLyPunhUDw0wcud/7q0TfK7eKuPgaNONZsNYMhG
         NC1VKXlwNB72FSjb9JDhIJFp3Vo5cIStCPD8ai830WgRvUslbe7Jq0YTAmsw8ndgCBsI
         3cSlMmmJoebdO9F+OlFyLymvInvpWAxlFrE6NPTL6BDwdBYz24NPdz+QyAZV+mga5/ay
         V4hxT4ATBZ/dSmPwKU4z5cez3rvGbYKv4WdqGhYwtCz74rHLwQw8Jph1d4ZNduNaaITv
         VEFA==
X-Gm-Message-State: AFq9FYL0CC2TnGnmUJCKashDnrlfl/KXlTl9gbKLZV1CFovcTI1qrjFf
	JB+3+34Xv/UP4/qxbfg1XQdOntdFwCUhITCybOUY6AA4um9YZbNYD6Tj+SSuzoMVhtz02JG/F2m
	EBuHKFpKUPMmfPuAya+QB2GrzH88EAuGZ8p3J/s8tf2SX+cAVoWbezniynVBWBSM4eQ==
X-Gm-Gg: AYBFou0Y7c3M6IhlStfFQYMHs0lahg1ojCS6TSwd5BmLSmRPRQkGM1IPUZpeB0fMpCi
	LfOoa8qPzdi198zMTcmOskslsQbTxvVIxHkw0vbUE6aK3KJSlZO4lBS61Q69u/i7bgkJNZm9c2h
	y0iSPzuka6p9/Q5w5zsU7iko1ey2ZDYPpTo8lPMLjarP2aJH1OD7c43jHAOjJw+3TjIe5UMvRTz
	Nc++KhxEPugWM1OSz+mr9p19vlNZmacUtvNDZEqlLBVc72GFs3bHPoDncPWBtQw5+cwv8xH5YK1
	Iqtpzd4otvKsnnKi1aP/f4R+udFFC6AbDjEk4DysF2zelGi6m30RZ5VCEPjbtgxxmH5Cx0PgrYA
	aQkeBX89WHSOXst2IwKLekzlvEK8=
X-Received: by 2002:a17:90b:384a:b0:3a8:c0cd:57f7 with SMTP id 98e67ed59e1d1-3ab3a735f76mr9500149a91.23.1791882592004;
        Tue, 13 Oct 2026 02:09:52 -0700 (PDT)
X-Received: by 2002:a17:90b:384a:b0:3a8:c0cd:57f7 with SMTP id 98e67ed59e1d1-3ab3a735f76mr9500121a91.23.1791882591022;
        Tue, 13 Oct 2026 02:09:51 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38fc9e52sm20346608a91.13.2026.10.13.02.09.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 02:09:50 -0700 (PDT)
Message-ID: <65a55d4c-4a88-4cc0-8c5b-57fc8aecbc8d@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 14:39:43 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] ASoC: qcom: sc8280xp: Add Nord sound card support
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261009-nord-asoc-driver-support-v3-v3-0-0c1897f21ccf@oss.qualcomm.com>
 <20261009-nord-asoc-driver-support-v3-v3-7-0c1897f21ccf@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261009-nord-asoc-driver-support-v3-v3-7-0c1897f21ccf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNiBTYWx0ZWRfX2+9RwlIphswJ
 ckX2zQUFrMk3qF3HHLYdueNTUh5xjCEp/UIMki3azicdO1aW0M2SgCONCtk4XOOzbmKlEmLxSbd
 OuNd1D1AM5vOvR95kUE/uWytDChpvlmjLCJDFQiAkcoeMkDQcFYqixkHwJKoiVaErgjYfnMU2TT
 4DvZB+kG8CDRwk7L9EyskWnIV3hOs4OiofEKWZSepfYHsUlcGEBqTSXZcRrnJlyyegcPJgOREe6
 o5AUzabnhp+T9eyNXKBWTDI/UXkFqUqoSBayE4dmXwkh18YfliXR0jSqbJjDxZqU4MwdyBwvKMp
 9vqO3pYYnUDo4iU0LP6mAhgQbOeFdwdpgDxOQtDcGRez6nJFOjnIQqbTYmjwz4v+9Uo7okkife+
 RTI1BW/EOIKLTbRxvYBbTId6O5nfpZO6+RE8wmgU1ZQ5ywZ7ta+M179Hzm5Z1gVrEA9C3ZSk+C9
 lPLRtZ/oyXD05TU/CKw==
X-Authority-Analysis: v=2.4 cv=JN+uIMKb c=1 sm=1 tr=0 ts=6acdf561 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=-2NoP3fm8nS2ubuM0EoA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNiBTYWx0ZWRfX08jIPlmJ/w+9
 Gs3P0RVc7IhilNf1DU4qlxM1P1e5vhBX9tRqOQiLmsnfeSFTgJfVyYM4F731uD7f6fshzJYRLpr
 uBG9rrF0FPa8R7p4GNu2LI/+v3lg4OM=
X-Proofpoint-ORIG-GUID: bvWIOqO7bJ3Djyl3yhRMDegLkaqtNutU
X-Proofpoint-GUID: bvWIOqO7bJ3Djyl3yhRMDegLkaqtNutU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130036



On 10/9/2026 6:42 PM, Mohammad Rafi Shaik wrote:
> Add support for the Nord Ride and RRD sound cards by introducing the
> qcom,nord-sndcard compatible and associated platform-specific data.
>   
> Nord uses external codecs for its playback and capture paths and requires
> board-specific DAI and clock configuration. Configure the codec DAI format
> for DSP_A operation and enable MI2S bit clock handling for the platform.
>   
> Add a platform-specific sound card initialization callback to configure
> the ADAU1979 capture codec to use LRCLK as its system clock source. This
> configuration is done during DAI link initialization so that the codec
> clock source and associated rate constraints are established before the
> capture stream is opened.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---

> +static int nord_snd_init(struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> +	int ret;
> +
> +	switch (cpu_dai->id) {
> +	case AIF_TDM_TX_8:
> +		/*
> +		 * adau1979 PLL clocked from LRCLK, no external MCLK. Selecting
> +		 * the source also installs the PLL rate constraint, which the
> +		 * codec applies from its startup() callback, so it has to be
> +		 * in place before the first stream is opened. The frequency is
> +		 * unused for an LRCLK-sourced PLL.
> +		 */
> +		ret = snd_soc_component_set_sysclk(codec_dai->component,
> +						   ADAU1977_SYSCLK,
> +						   ADAU1977_SYSCLK_SRC_LRCLK,
> +						   48000, SND_SOC_CLOCK_IN);
> +		if (ret && ret != -ENOTSUPP)
> +			return ret;

If this link is always connected to the ADAU1979, should we be ignoring 
-ENOTSUPP here?

snd_soc_component_set_sysclk() returns -ENOTSUPP when the component does 
not provide a .set_sysclk() callback. In that case we'd continue without 
applying the LRCLK clock source configuration, while the commit message 
states that this setup is required before startup.

Is there a case where AIF_TDM_TX_8 can be paired with a component that
legitimately lacks .set_sysclk() support?

> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
>   static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
>   				  struct snd_pcm_hw_params *params)
>   {
> @@ -552,6 +593,15 @@ static const struct qcom_snd_soc_common kaanapali_priv_data = {
>   	.wcd_jack = true,
>   };
>   
> +static const struct qcom_snd_soc_common nord_priv_data = {
> +	.driver_name = "nord",
> +	.mi2s_bclk_enable = true,
> +	.codec_dai_fmt = SND_SOC_DAIFMT_CBC_CFC |
> +			 SND_SOC_DAIFMT_NB_NF |
> +			 SND_SOC_DAIFMT_DSP_A,
> +	.snd_init = nord_snd_init,
> +};
> +
>   static const struct qcom_snd_soc_common qcs9100_priv_data = {
>   	.driver_name = "sa8775p",
>   	.dapm_widgets = sc8280xp_dapm_widgets,
> @@ -677,6 +727,7 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
>   	{ .compatible = "qcom,hawi-sndcard", .data = &hawi_priv_data },
>   	{ .compatible = "qcom,kaanapali-sndcard", .data = &kaanapali_priv_data },
>   	{ .compatible = "qcom,maili-sndcard", .data = &hawi_priv_data },
> +	{ .compatible = "qcom,nord-sndcard", .data = &nord_priv_data },
>   	{ .compatible = "qcom,qcm6490-idp-sndcard", .data = &qcm6490_priv_data },
>   	{ .compatible = "qcom,qcs615-sndcard", .data = &qcs615_priv_data },
>   	{ .compatible = "qcom,qcs6490-rb3gen2-sndcard", .data = &qcs6490_priv_data },
> 

