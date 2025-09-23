Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71E42512EE
	for <linux-sound@vger.kernel.org>; Tue, 23 Sep 2025 03:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758597982; cv=none; b=Tk8cphUaY0ENklt3v3o6zM3flqJzEoxm5QTwZ3OLJxjEpTjjpaey0jZ51ZxXO2p4gol4DwMqMk0JoiOuFyPzICn5ha+c/D1r65ln5JIqKXKrjefW4mWX3wpyZRvxX5rOiw7rK/eLocf/KwwtgnhjWCEEL7r5AVvRmB9QqndtZaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758597982; c=relaxed/simple;
	bh=/9okwRIp4AGyHNqa6uQ0KAc8kzAsFvI6jPY28fzJH5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DzwMX8mmOIBCL7PHRZe4kGwjxZI21D7KGG+lWk/BxAdwkb8rdcxwvdQ1BBI5XB+CgEYacY91hrRPrkRsWFapWs+p2XMuVk5VOa3kVf2XFeHbLERiY/bHk2tnMz35QkTjrpKlOP+qF9e0gMHV6QjkhKmb9YjsxHtz5ucQk6Fy/UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VlR3cQxd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VlR3cQxd"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58N3PtZl008034
	for <linux-sound@vger.kernel.org>; Tue, 23 Sep 2025 03:26:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=F3GWnZoDTq3sp/K2/e/shKmR
	rtysWnVz2jKe17D2uyM=; b=VlR3cQxdPlnuEF5mkZX+P72kr4YNH4WDaB9XC1Qo
	bAN8xNhhz5t+aHGfs4Mk2mMkHLuPmaUxu1R0HMdWoemoXDTP/nnPiFSh3NdzGQp8
	H+EO7hSdqiGKKaawM+jd9Bx0AOETSHA09WawaBmm0inDYLh9wIn2QnuwSGmx3xpt
	3BTQThiRcXApKYW/dmw/YlsRRvF6xJ/pF2HP0Q7tAVANM6SN7eu1u919ehGrjsUI
	IeHCdu8Po3+yUQJrU4OsG77Lp4I3NnlfXH6TN9QwhlOPBqIZEb/+ogkuqiJHwnFv
	1NmhK8j86qCE0iNNgdzT0X2/NZy/HUDd+Q6Vgo+mU/kDHA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyeq8fx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 23 Sep 2025 03:26:20 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-78ea15d3583so86763406d6.1
        for <linux-sound@vger.kernel.org>; Mon, 22 Sep 2025 20:26:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758597978; x=1759202778;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F3GWnZoDTq3sp/K2/e/shKmRrtysWnVz2jKe17D2uyM=;
        b=csa1bWFhfUai9cJAF7st7+Fg9wZ5lB5GAGLduMKoj0soNCGNCmjcH24GQdfwHK1VKV
         j4sqf0IbQ/2pUzYUZa91R49qZsmWAhrnERqI8JZLnfplviQ+O6wxwh87z0GGvUsRrhYO
         h2svAXuzfw2OXtg+b3sZJccQSuLbSbKF4ftLS1i7MiNQYUj5vWK3j3wUfiuEhFMYfRW9
         AEiBug5eugSBU0IwuRDHcQZInRKPeM/AhVCvlPxhBCPzZQt6kg+ycd8N2H6VRTO007h+
         6hIu9IH0Q/h6fBF3PnlaK5zNsOw1C67+/ggwBkfmiNC9+ZJztQMK15mrTRWwA996WOBu
         IYUg==
X-Forwarded-Encrypted: i=1; AJvYcCWp+xVOBbgRHspa2hSjDy8ZLNC3E9JHpQCrvOTZ+bdNYFAq8alEfmC2GZYIBJkiIfr6tVLSUWX1G9KaWw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6esEZB5eDfgYYBl2GL3QxlqR2RmGRMWoeL/e9KZfevbwjqYD+
	EBm6yFZaYQCu7MyfqRtDr2pXrhaq8bfukMXKqLGYMqBxJbLffKqktqS68Ju4ISLm61yFm01rdnK
	GgrMpglOcDylphBxfq7tsF8bcPD+I5JAWlUlM1OZHHLD2MOh/V88hiXCxINfRbpDMbtb/uf5rfg
	==
X-Gm-Gg: ASbGncu0AVVUbvFxncLpNrvTkIPg050YrgVqQ24LUS7B/LWPVv68B0AlCkQWFMFtnPu
	aAVA9mDYATf+N+uNeA2gOFtOLOf7Q3bIQiH/uSBEnXx4IBjB7o5XMsiv27jvEp5s6SPKUWxglqr
	W0dA38LQccNdJQOloTNCI5ryixXAjnsHVuHVH2op4KDSWN/sqMzxOI2i2OEPkCdNUAOB6PtSoEc
	fF5/brbhpXyE0uNcjLcU7dmjmqy82+NRVOEgQFU4F64cMZd7XVlJ3U2zqYVP7XJ/Ou363aoJOXC
	rzwTjJ5fTrbuVLW4mm6mQLPCVb2ed75kJlZWna/ZJlGv9grBVjVP5kdTyUj0Fuun33/1rnNguCe
	Pl0AE6qi+vfbA1XHjKgcaj7ZEdWvFo8u/qqavM4yv+NcD8vlDoEpC
X-Received: by 2002:a05:6214:5184:b0:7a2:7dd5:a529 with SMTP id 6a1803df08f44-7e715457b81mr13988466d6.32.1758597978248;
        Mon, 22 Sep 2025 20:26:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCyCVOG3I8IOeAlxq627lGyS4LI/Q55RrD7NxcdRqumGitid3wdqGpVNnvz0boAGvkOcRioQ==
X-Received: by 2002:a05:6214:5184:b0:7a2:7dd5:a529 with SMTP id 6a1803df08f44-7e715457b81mr13988316d6.32.1758597977705;
        Mon, 22 Sep 2025 20:26:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-57a9a81f52asm2683912e87.124.2025.09.22.20.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 20:26:16 -0700 (PDT)
Date: Tue, 23 Sep 2025 06:26:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ma Ke <make24@iscas.ac.cn>
Cc: srini@kernel.org, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
        tiwai@suse.com, pierre-louis.bossart@linux.dev,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v3] ASoC: wcd934x: fix error handling in
 wcd934x_codec_parse_data()
Message-ID: <unqzejlsp6emzja5ry32smzlinntodgbioyojr5osiqddh2ppi@mtf4e7y4cids>
References: <20250923023828.36647-1-make24@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923023828.36647-1-make24@iscas.ac.cn>
X-Proofpoint-GUID: 9gn7NDdaKwfkNbwxdhPVZ84IPqg6s9yn
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68d2135c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=dSz2rv1DY3fttFFokb4A:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfX0P478R88GEJe
 PmebDoS519Kh4XvnRHHDPo7DreiuQjeIWy6sfTvEO8KmmOtx9C2NGi9f/w8k7kvP3ILnPu1EIrc
 tU6m4LS/3qIKU8RxMELnkIjyIenIr9gvevnKd4GMLFwlzCsdQVa+1STwmxRFf1181zlVzbVT5CJ
 qWv/FlZLL/uVSxJm5TKWrAuY+w9ALqkpWkR7kelxjACE92yzwYvDAuUgu6TGj2KQStylr/7OPSz
 KjFL8Ki9jarl+Xuxeq55zHwBGFQZU1aWvF2nu7sy9a+lQtKEfvJv3IsJfcUssS6sZFvScW0ZQqk
 XkdffybsTGXN3z0ukEG6BfrkePhqRfgRw/Z0CTelmVB1BBCPxxgnuF+ToQ5wL26qJF3XPAN5Izf
 zQGh1POi
X-Proofpoint-ORIG-GUID: 9gn7NDdaKwfkNbwxdhPVZ84IPqg6s9yn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_01,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004

On Tue, Sep 23, 2025 at 10:38:28AM +0800, Ma Ke wrote:
> wcd934x_codec_parse_data() contains a device reference count leak in
> of_slim_get_device() where device_find_child() increases the reference
> count of the device but this reference is not properly decreased in
> the success path. Add put_device() in wcd934x_codec_parse_data() and
> add devm_add_action_or_reset() in the probe function, which ensures
> that the reference count of the device is correctly managed.
> 
> Memory leak in regmap_init_slimbus() as the allocated regmap is not
> released when the device is removed. Using devm_regmap_init_slimbus()
> instead of regmap_init_slimbus() to ensure automatic regmap cleanup on
> device removal.
> 
> Calling path: of_slim_get_device() -> of_find_slim_device() ->
> device_find_child(). As comment of device_find_child() says, 'NOTE:
> you will need to drop the reference with put_device() after use.'.
> 
> Found by code review.
> 
> Cc: stable@vger.kernel.org
> Fixes: a61f3b4f476e ("ASoC: wcd934x: add support to wcd9340/wcd9341 codec")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
> Changes in v3:
> - added a wrapper function due to the warning report from kernel test robot;
> Changes in v2:
> - modified the handling in the success path and fixed the memory leak for regmap as suggestions.
> ---
>  sound/soc/codecs/wcd934x.c | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
> index 1bb7e1dc7e6b..d9d8cf64977a 100644
> --- a/sound/soc/codecs/wcd934x.c
> +++ b/sound/soc/codecs/wcd934x.c
> @@ -5831,6 +5831,15 @@ static const struct snd_soc_component_driver wcd934x_component_drv = {
>  	.endianness = 1,
>  };
>  
> +static void wcd934x_put_device_action(void *data)
> +{
> +	struct device *dev = data;
> +
> +	if (dev) {

Can it be NULL here? Can put_device() cope with NULL being passed to it?

> +		put_device(dev);
> +	}
> +}
> +
>  static int wcd934x_codec_parse_data(struct wcd934x_codec *wcd)
>  {
>  	struct device *dev = &wcd->sdev->dev;
> @@ -5847,11 +5856,13 @@ static int wcd934x_codec_parse_data(struct wcd934x_codec *wcd)
>  		return dev_err_probe(dev, -EINVAL, "Unable to get SLIM Interface device\n");
>  
>  	slim_get_logical_addr(wcd->sidev);
> -	wcd->if_regmap = regmap_init_slimbus(wcd->sidev,
> +	wcd->if_regmap = devm_regmap_init_slimbus(wcd->sidev,
>  				  &wcd934x_ifc_regmap_config);
> -	if (IS_ERR(wcd->if_regmap))
> +	if (IS_ERR(wcd->if_regmap)) {
> +		put_device(&wcd->sidev->dev);
>  		return dev_err_probe(dev, PTR_ERR(wcd->if_regmap),
>  				     "Failed to allocate ifc register map\n");
> +	}
>  
>  	of_property_read_u32(dev->parent->of_node, "qcom,dmic-sample-rate",
>  			     &wcd->dmic_sample_rate);
> @@ -5893,6 +5904,10 @@ static int wcd934x_codec_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> +	ret = devm_add_action_or_reset(dev, wcd934x_put_device_action, &wcd->sidev->dev);
> +	if (ret)
> +		return ret;
> +
>  	/* set default rate 9P6MHz */
>  	regmap_update_bits(wcd->regmap, WCD934X_CODEC_RPM_CLK_MCLK_CFG,
>  			   WCD934X_CODEC_RPM_CLK_MCLK_CFG_MCLK_MASK,
> -- 
> 2.17.1
> 

-- 
With best wishes
Dmitry
