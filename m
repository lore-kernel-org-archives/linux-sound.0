Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8872192EE
	for <linux-sound@vger.kernel.org>; Sun, 31 Aug 2025 08:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756629550; cv=none; b=cUSdkzrs9yAnbxuwMIvurWpeFOdOGsSYIK4On345QwYhCBsDio7oyOXMFZf0XK7LNsZHG+jDsLaFdesgEmBz76oUx5UR/1BCUnF4r2SFCjSavUu3IQrN7s6POYx/+yXlX/IVd1zAICKCvzJf0CZ489bOvBQQprbGX+Y62ah3it8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756629550; c=relaxed/simple;
	bh=/A+9TjPsnGaaJzFSwqhfMsQkNU5gbU9e8IGwIjA9oLg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j2DhzWBXdd6hMZEaLIiL0BLyc/0I4sp+rHoy1vnkS1HxB3RWGdvXw4/9c5bvOPx22RmiD5K5Y85OGjixrJfTa0RrO8plX1HkxHDWDQaf9vvv8X/eUe789kqCDg+7BqdUpep45l/0QMjcbIkWkvxm53ik5USDOVsIibTksWFjcUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XlRGZkZz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XlRGZkZz"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57V7R6gO026647
	for <linux-sound@vger.kernel.org>; Sun, 31 Aug 2025 08:39:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BRXQM5Xhx9VNwUQ6ACMX0+vtiPfY733mOi6VzYAWoQQ=; b=XlRGZkZz5u+pAihs
	0xyj05uxTBenxYmSvN41H5BBt/3c66Elz8TU5Ix0JBAgGtRruh6ZKIpdQvcOV/fP
	Uhp38GCz5NRS+5NHevT/JK7TEAH0n2TH9bnFWo44sX7S5vo9kTj031fZhlol21mb
	3CtNTl6e4qxSI0svFD4y7DGl+uil0R0aFwqChqWlmum8aDipm55VnbW0VtfpdJ0+
	1+do4QZDE9dyXKqzH3YXtd48E/IgQkG2pgG7mvholxaIbjeEg1jNjL4lvYoVOnz7
	AZWW33HxH6D/sKPC9SIItUy2E+pHyx5DmzkbkiiK+qGEd65PD7AiTpcBxh8GU8tZ
	pVuWlQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urvystkm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 31 Aug 2025 08:39:07 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70de1a3cec7so62538626d6.3
        for <linux-sound@vger.kernel.org>; Sun, 31 Aug 2025 01:39:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756629546; x=1757234346;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BRXQM5Xhx9VNwUQ6ACMX0+vtiPfY733mOi6VzYAWoQQ=;
        b=hDJd//Mbn//VQjadef1hUnLAROew118DFgwsOmMqLXpOJygo+CcEYY7puj1tpnbm6T
         zILcrFW/fAtHLlav7ThOrJGHTxgMiO32TPH87SOD758PWLXV7oqmugJ7PX8yUGLw/Yfo
         KYAFyY/2rY2VF7R2BurMIlZUuAzk8qrlGNaqxCRA9tBs5XvAtKyLwaXUGTUuuNcKxnPh
         OskGuIvaE8V3OhshtxK3h4Fwi+Brj/YbLx5LApgBWxKH8L17uvFw6BYFe9XXLl1ezAq1
         PKFt+mtPhBgY0LnUsn498w0mMCGANIuT1luK76x6fKyjziE3er0OmYIurUi37mVzB4IB
         t7mg==
X-Gm-Message-State: AOJu0YxLfFYOhONT3+9EZgeIR2T+2fYAuzPQQpBGKM/b2nFYVSX2b4qM
	qG+V4Ls9S/mv0IUQk9FL+F65mzwRDN5gW5F24Km0om7cZP6q4EnZRneNTaKnfnEEmZT4D3FaYwu
	zsaJ+8AySK/c26UnLHyNmda0c4OhlCrN4JD0aKl99V2vMY2lCHjrvLaFrSps0jMY2cA==
X-Gm-Gg: ASbGncu2lPxLvbVDRtTrN2Qj4dFu5uzkUwXcgTKlGQj5Ar1liDMrMbAFZCu9Kc9ItsO
	3fTrIieMWyAemZz5J2E4NEZIPismfwUoB8rDB0TjmiRIreMTrJFwrGYhq9NMc83VOMzhls5LzWZ
	8JUjie4ReTi59xr/N06h/sCc/Q4TVxGAyRV4isIIXqqaxpZYtSiwslCW/t7q5/oaeeYWviIh3gw
	cP4i3JRedk1TEB9VwUnMpqNyHBBusZl7Gyof4PAbLBtvKY1A7AgulZpYKBufwO22QOCPTQIA6E6
	FxWWNop95LHmYuRIXiF71Gqj47AoMxefFpZvJyrIX4sR+lEZUnFmrFnEFTb2eVOsMfY=
X-Received: by 2002:a05:6214:5193:b0:70d:e501:1f9b with SMTP id 6a1803df08f44-70fac74ade3mr33464356d6.23.1756629546590;
        Sun, 31 Aug 2025 01:39:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBzQ3HC5YME0UyGE1nyvjX0lufS8HE9JEN+POL+K35U2LzfmYAtT8yaQCjtNiPDfZCBh4nHw==
X-Received: by 2002:a05:6214:5193:b0:70d:e501:1f9b with SMTP id 6a1803df08f44-70fac74ade3mr33464266d6.23.1756629546197;
        Sun, 31 Aug 2025 01:39:06 -0700 (PDT)
Received: from [192.168.68.118] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45b6ee66bddsm189016035e9.0.2025.08.31.01.39.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Aug 2025 01:39:05 -0700 (PDT)
Message-ID: <f5cc1395-a3b7-4d5b-b8b0-d97de718e691@oss.qualcomm.com>
Date: Sun, 31 Aug 2025 09:39:04 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] ASoC: qcom: audioreach: Fix lpaif_type
 configuration for the I2S interface
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20250822171440.2040324-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250822171440.2040324-2-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250822171440.2040324-2-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zg_QZjJv89xrai6-ujXz2iTFSRdWmb8m
X-Proofpoint-ORIG-GUID: zg_QZjJv89xrai6-ujXz2iTFSRdWmb8m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX+2zsv4oVM31G
 vkqMmVO6a9cUegbk9aFZd4VFkzCkDCzsVwqdmEqKu8ylpsUHOAv9TtyU2bAP3ZOtK46AZtS3Vq9
 CiGZKBFQqUMuY8UAG+nFZhVamVKeyPQHtcUfF2r/zuLxG5b8h4Sp77XkVhCTMzHis8Gt3pK5eKE
 j/J56kfQ716YzuxBX0j0FKM/PoGWg5txybp1nR8WOMtBkBBEJ7Io4sDI35uhAD2su2ttJXcUcaB
 2gFYHG1dX4jduoOy1H1SUvtV0n1EsjRLIwb9sIcuIVXQhQ9J+SDcUpZQZBsUXRgJp3eI8P7Zo/g
 ZGqx+EoUK+oY1kcyY6SGntc/vkWrXOQ/ziJq3ok+a0dt4tv8FfLNNXjMKnpBtYixsCv2vJXMoSx
 DR3yrCSB
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b40a2b cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KWf2NDoUiaxIZHtpWeoA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-31_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027



On 8/22/25 6:14 PM, Mohammad Rafi Shaik wrote:
> Fix missing lpaif_type configuration for the I2S interface.
> The proper lpaif interface type required to allow DSP to vote
> appropriate clock setting for I2S interface.
> 
> Fixes: 25ab80db6b133 ("ASoC: qdsp6: audioreach: add module configuration command helpers")
Missing CC Stable.

> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>


@Neil, this might help on the I2S Playback issue that you have been
hitting on SM8650.

--srini
>  sound/soc/qcom/qdsp6/audioreach.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
> index f4c53e84b4dc..6d7b1a4b0b2a 100644
> --- a/sound/soc/qcom/qdsp6/audioreach.c
> +++ b/sound/soc/qcom/qdsp6/audioreach.c
> @@ -995,6 +995,7 @@ static int audioreach_i2s_set_media_format(struct q6apm_graph *graph,
>  	param_data->param_id = PARAM_ID_I2S_INTF_CFG;
>  	param_data->param_size = ic_sz - APM_MODULE_PARAM_DATA_SIZE;
>  
> +	intf_cfg->cfg.lpaif_type = module->hw_interface_type;
>  	intf_cfg->cfg.intf_idx = module->hw_interface_idx;
>  	intf_cfg->cfg.sd_line_idx = module->sd_line_idx;
>  

