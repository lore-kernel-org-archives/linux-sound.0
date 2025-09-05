Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC5A218ACA
	for <linux-sound@vger.kernel.org>; Fri,  5 Sep 2025 16:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757088880; cv=none; b=DloNFFIdtKesCatKI5mj5LOSjPyj+Pn1QMSnn39/vzDCsZbzYXYH4w4V9sUbYSwqpypSMyP1CIS+ynYjskhKJXqAGFNWShQAch7wNrecBCRCUinrcIEkdH9/TYBC0wvjHN2C3a7O73PPfpq0gIRU6YCTaYC41cIzcT5KlFzfO28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757088880; c=relaxed/simple;
	bh=QzQU6X3d7uC2WCQBqpeq3Z9QU13w7Y+ipPzD8W6kKso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cy8PKI472wl+vfhyBKAK1qo7OD9TP82tcGtpkrzQjPAfPD0kDmMcrQh7yFhSRIgbPFsDS3r+p5/CU0zPgupA98BrGNkeKR9rR4Sf9COwYOHwX3o1rbdqxvvFrtgPx8BlV0230vugr+7DsihUS42aLC9UmHkmNBR9jwhntxu68Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BaZMVkxR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BaZMVkxR"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 585DRZTg018468
	for <linux-sound@vger.kernel.org>; Fri, 5 Sep 2025 16:14:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4uwzJLV0wZH0OwJa1YLvQG99
	I8WF7++RUAwFDj4AzKo=; b=BaZMVkxR8r1DNF/+8QLZHIMpFQhxY8xYFoKWrYHV
	NgHslzkeqfqTzesQZjsFxoMm6i2vT2ZdO2ArCiXlF3Qpz+gYsO3ZljAd4efBEYFj
	xwiTwSDFdL7ftH9yjOhDYgsB7T6CfAAJVIBznI8H8Ao1su8A3+ZTd5tYeNv1kyEN
	1ouYZhAPFJ9Cf5JGpZVPtwetmQzbl3VWVOJe7mZ1wVPCN33J9zaZwwJKmoYQlPO5
	L6c9APEnr8YNTCIqg5cKqo7tuzAwtC/DyaMWATDasOBQRYSpf5LE3o2UDk7wfLvD
	HT8NXpmF/4o39ySa68++vhUvIgC79s5KJ/I8jO54pkSqHg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48yebuukqa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 16:14:38 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b30d6ed3a4so51190421cf.3
        for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 09:14:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757088877; x=1757693677;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4uwzJLV0wZH0OwJa1YLvQG99I8WF7++RUAwFDj4AzKo=;
        b=Fa1nfTxkD13JFQchoNjRu2+bC3yJMULtyV3hMA2PGR4dTWVSpG9Ae9V8/NKBMjWxXd
         JoVY6J+C8bwXvRzSBmC9cV8FG4s0chq4kBueBOvYmLXicXJvtdDCaRQREHJXg3+nmLQn
         /pmv0txUSEl1s7PyEYLxJXkHTP0pzsNDXbgh4rg/65T/UAj8hEXajV+qZzjqQ23hgxYk
         sIExW2wBmJrNXXcs+ENB0BGbibM4jinGA2YCoib76scxuHNskoIhNxRQDSaNEGuFxdyD
         vuXIo33LY+q5HDQ09BODYhrFtNU5JxuIWzBYHoiIrKxso3pAiuhqsLOjdDzMH44/tKsU
         xxaw==
X-Forwarded-Encrypted: i=1; AJvYcCV0C1VPEq7m6qdpieGyxCDWSHidWRVxSWjYMf1b/dVzPRQv6wI8gSvh2G/je//4p6VfBVw1cFOwqfDWvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzU/KJ7JPyQizOsu1VT399vVCf9+tL0u30tTgcBgJdd9qqZfjaw
	AwLDIWZa6JzrDuqIG/YFR/zLuYgoQEqKHiETwH9ehVIsgm6D4/DYzgDXt/5gQr3NJ+oGYiUlFX4
	wAIXXtCjtkIl7fEAZUketkHvvyaRFLIDghQu/iWSGE0QFL9Ye5dzW3A+pCjHi1Cn/ew==
X-Gm-Gg: ASbGncuIWyVwfpFBaGGdOGK4GWq6xVDZhZge/yRP2C9nQFFv03/tvkqN2mBOnf3CuOU
	kQr8kbk/qM3KP26UldgEuNtY3E3iB9SKqFqNeQR2xrQUAam7IhWstZf/JiHcyOPPIjS3KWvM2M+
	GHFKG6dDxJVNf3dnP2OZ985oIt0QrXeRoT9zzVTXZlF7TI0S5LRXwndhY8K/KcPFjXdnIZQfRXe
	clgmY/WKsMpcjdJxvvw59XHeifUhQswaeQWC3Wgzrdfl6W/u2W4T75jhO8Xb75lxu8CEFCnYm20
	o44f148R/6etxqKBYzqSjzcyFoFrTUfjHNEzcYw5N8LmfHUT0iOOz6E64zfRIkzlIlR8JDmcnts
	jTuKisSJF2d3sman9Gru4GcqaPNveXM0Xb/TYDEVtUaRpOLE9zya1
X-Received: by 2002:a05:622a:4a8f:b0:4b5:de44:4ec2 with SMTP id d75a77b69052e-4b5de44524bmr73086421cf.78.1757088876924;
        Fri, 05 Sep 2025 09:14:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKI6ICcB8YsU1+RJItro0ZVf3DZvV4LKkRV/LL6vupHTnzLn+/DenDDljZTOEtKsyf4ex7gw==
X-Received: by 2002:a05:622a:4a8f:b0:4b5:de44:4ec2 with SMTP id d75a77b69052e-4b5de44524bmr73086051cf.78.1757088876476;
        Fri, 05 Sep 2025 09:14:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ad523b3sm1816008e87.151.2025.09.05.09.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 09:14:34 -0700 (PDT)
Date: Fri, 5 Sep 2025 19:14:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org,
        srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, neil.armstrong@linaro.org,
        krzysztof.kozlowski@linaro.org, linux-sound@vger.kernel.org,
        Stable@vger.kernel.org
Subject: Re: [PATCH v3 01/12] ASoC: codecs: wcd937x: set the comp soundwire
 port correctly
Message-ID: <as3wxoths3rgy2qpbqwyys6zydhjo3lbueu7ibrwbinxt3sffw@wyprroihsjs7>
References: <20250905154430.12268-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250905154430.12268-2-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905154430.12268-2-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-GUID: KFpgiVlksbm74qKaLrp8WE75_o2QmUqO
X-Authority-Analysis: v=2.4 cv=X+ZSKHTe c=1 sm=1 tr=0 ts=68bb0c6e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=i95AebK-tMX4XhNiilcA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA0MDE2MyBTYWx0ZWRfX914PHUJyfzuQ
 XielxgXAFWnT8Molws4LCq7VpytKedJBvbsm67J7F3dAY3LWbAqn9ZJdyyLagec+JWQ6/bhwAqA
 IYM7w3exH+8V6vpwbGHBvplG0aHC01DIa3qAEXsBT4gezHvcuEmn7kSXz6OqboTpLPyDaOVLZvP
 BTMwpFD7y+LSn4PwlY9GSZ1sksBjYdwL8/sU9tPc25pfTVKmSzaq+0RmI4anRsaOH/j5OLTWwbL
 vwbhgnTCKc0mB//Avbghns/jGl7NGFI1KwT6qydwveMFdFVzABN+cl/A0Rinbef3WmC1pB3htWI
 0xuyPmSQXoWInRZsbxMn8YlT6/YESMLGxLQ0P4iSfgggQiuk7ml6Ynqkyl4xG3b13YJ6lgWrnSG
 ue81sHXW
X-Proofpoint-ORIG-GUID: KFpgiVlksbm74qKaLrp8WE75_o2QmUqO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1011 impostorscore=0 phishscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509040163

On Fri, Sep 05, 2025 at 04:44:19PM +0100, Srinivas Kandagatla wrote:
> For some reason we endup with setting soundwire port for
> HPHL_COMP and HPHR_COMP as zero, this can potentially result
> in a memory corruption due to accessing and setting -1 th element of
> port_map array.

Nit: if passing 0 here might result in a memory corrution, then
corresponding code should be fixed to warn loudly and ignore that 0.

> 
> Fixes: 82be8c62a38c ("ASoC: codecs: wcd937x: add basic controls")
> Cc: <Stable@vger.kernel.org>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  sound/soc/codecs/wcd937x.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
> index 3b0a8cc314e0..de2dff3c56d3 100644
> --- a/sound/soc/codecs/wcd937x.c
> +++ b/sound/soc/codecs/wcd937x.c
> @@ -2046,9 +2046,9 @@ static const struct snd_kcontrol_new wcd937x_snd_controls[] = {
>  	SOC_ENUM_EXT("RX HPH Mode", rx_hph_mode_mux_enum,
>  		     wcd937x_rx_hph_mode_get, wcd937x_rx_hph_mode_put),
>  
> -	SOC_SINGLE_EXT("HPHL_COMP Switch", SND_SOC_NOPM, 0, 1, 0,
> +	SOC_SINGLE_EXT("HPHL_COMP Switch", WCD937X_COMP_L, 0, 1, 0,
>  		       wcd937x_get_compander, wcd937x_set_compander),
> -	SOC_SINGLE_EXT("HPHR_COMP Switch", SND_SOC_NOPM, 1, 1, 0,
> +	SOC_SINGLE_EXT("HPHR_COMP Switch", WCD937X_COMP_R, 1, 1, 0,
>  		       wcd937x_get_compander, wcd937x_set_compander),
>  
>  	SOC_SINGLE_TLV("HPHL Volume", WCD937X_HPH_L_EN, 0, 20, 1, line_gain),
> -- 
> 2.50.0
> 

-- 
With best wishes
Dmitry
