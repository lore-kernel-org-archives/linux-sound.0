Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7014334BA39
	for <linux-sound@vger.kernel.org>; Sun, 21 Sep 2025 11:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758455034; cv=none; b=Tt3+OpZ/o4Pv0KbRpvEbmalHFAdT/srHiWNMQRkuHlzzPGlVuwxHLZ4GgLmDbYmmb1lyTFEx9DRtM4CrwvG9lwvA5YhCEpN0YGElUh1GO/tnv7xuD2bqyytkPMoV3MX1K61PPAqPmDFWuG4MROs34nClrp1sjt71lk8hdnlZXNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758455034; c=relaxed/simple;
	bh=+Pn/OVfTwdSSSOXNeOm06iGQ/roCwDtZwhhSb17LvI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UFlaIDXsT4u0KMefqzfYudbrRzZrrOw0uuKWPpuddNh4N7S7HSDTh2ppWzoYjTBsDMeuUgngELibDzd9nl/6ytVNT602E68jZOmONq6u1FRclHW9R8TPBcI2kDaU0gv6kzkVDC85FuRFGflR9mSg/awfzI3MAqj8P8qodoLU9iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nimsq3Nc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nimsq3Nc"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58L8U0wU031587
	for <linux-sound@vger.kernel.org>; Sun, 21 Sep 2025 11:43:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2tz38OrlUOeLMiW/V6pVbFqi
	MiAYEhH1+bQDPLCltYU=; b=Nimsq3NcjCR1Np9YlKps0K9TPHI6pZtKpJKVIutE
	AfHwOLN0/u/XjtyWYsHtAFIf+lEBdJnDX4pjqBrjW1cch+9U+ldIxOkJTLFLuOzT
	KO9B4GljHXJnEbhyJnc+fImVzdzktygSlkTfGyqBqRQA3jQ+tkfi4NSL8TXiBYeh
	KNayi9ZX3m53EEqwfUVLebk/3o8jFkcYvnSR7Dk/hObwqZtsbLASek3AvVlnC13d
	z4zpcb3Ks8ZwRgBYpn/UR6pEaD3gJixdL60gQunqKbpR1X/yDh9jeTr5roCFhzg0
	3LMe//iuWciUS+hDqeuVah4M3L+R+3xoPrYiBeBldpXIrg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499kkhj61y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 21 Sep 2025 11:43:44 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b31bea5896so33665621cf.2
        for <linux-sound@vger.kernel.org>; Sun, 21 Sep 2025 04:43:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758455023; x=1759059823;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2tz38OrlUOeLMiW/V6pVbFqiMiAYEhH1+bQDPLCltYU=;
        b=Khup3DYaLjOSIGMxf432Y7YJE+6nOqVyT3IB+JSnDK3b/PmZlt7YESxFDzuGiLHVNk
         cpH+MKnCUc7mhL4qR86nV2kh8EvUz6qDe8bOPlcw29rdZ1vaue2JSqwzRI/ZWI+ldjtn
         ZzSTCFqjGFt7FGr1CS9xB8hChFIZNZCHOL54vDLwyDDMEnvFt4ci03U87JDLeElo5PxA
         RW+qrJfoZXzhNKNB2CRn6paiY3MqAXAAR6iVzCIixQaOARCuvO/PtINeozEYwHJRGK7/
         QB2eEGHkVol7ReiTvWp6pWkZL1cra5O7tsmGjBHYfMJG9LkoipiM+O8Boz9ZtZ3Ym5Zu
         marQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXp/8a3ul4N//0+10EeRrTVNFCHGtZ07xK0Ns953Pp3WFe6r9WE09Z1yI+AC5OwOf31/GUOiQQKxkjcA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2F62eh4Dp5l5d2e+im8iKwAy/N/zaKYD+aauVdwTL2gV3HKGQ
	n4McL8GNQSbqmNoOAQXRettsBtEZnsFeQ5O+TuQPqWI4rHIUcAhRMgUqvufBuJd3Zov6nhZcAy6
	Cc/wmTTN/sQiSsP6nGunqS07gaL5ydfrh4kw3Bnko+n6GY2vneJECrIRyFM5nisi/aA==
X-Gm-Gg: ASbGnctN0eZZu3p8cL9BVHeG6qtYNIOCGMVFuJzLsCw4akuNT5usTt1xGNVQHZVGL4e
	fl03LMraJzg2LOvXsS4t3U6kns+PvgdaQa1gVP3c21SXbLoWAYDPOKCA4ouvAz5z3/s4jOA2aY6
	Mt0auVdtj2pxNgwn/mipu3xiFlae4AKNC196bogcm7G7wPEWDdrlu+iFp2xQDghBqx2yx2VcmMx
	4gZ6tou7C0zegEuEZJdNZO0NS+8b5p41DY0Dha1+r/erJE+RmFyhpY5ffROJ6QqunOyzHhra/rr
	Ktnu0uobwaNCT+DzOOhPnfGltnrZCBsDjS4vMK7K0+z6a/MM1sUvJ/UP5Zoy1ih9MmyQrKmyiOT
	L/qk4O2uFZHCjQ6Xv23VYWOSayXJigHXtlYZPBdsMBcAjo4B1wHLR
X-Received: by 2002:a05:622a:289:b0:4b7:9581:a211 with SMTP id d75a77b69052e-4c06f84409bmr97544681cf.24.1758455023258;
        Sun, 21 Sep 2025 04:43:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcgRW/31bOxLKwY8qsOfsclAMytFaKWAzuOnLefGy2cQabOY5f9ALQUf9IAhjpMBxBBPDADQ==
X-Received: by 2002:a05:622a:289:b0:4b7:9581:a211 with SMTP id d75a77b69052e-4c06f84409bmr97544541cf.24.1758455022788;
        Sun, 21 Sep 2025 04:43:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-57c56d47591sm659763e87.50.2025.09.21.04.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 04:43:42 -0700 (PDT)
Date: Sun, 21 Sep 2025 14:43:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ma Ke <make24@iscas.ac.cn>
Cc: srini@kernel.org, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
        tiwai@suse.com, pierre-louis.bossart@linux.dev,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] ASoC: wcd934x: fix error handling in
 wcd934x_codec_parse_data()
Message-ID: <lqgi66r4voh5z4p7mrjiulxvy6gky6mzn6rq2yresuhqfzsnt3@xcgvnxxd7qnq>
References: <20250921095927.28065-1-make24@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250921095927.28065-1-make24@iscas.ac.cn>
X-Proofpoint-ORIG-GUID: nSYNalsSV1OymsOGQYUi8lZuCgxyEsQ8
X-Proofpoint-GUID: nSYNalsSV1OymsOGQYUi8lZuCgxyEsQ8
X-Authority-Analysis: v=2.4 cv=JMo7s9Kb c=1 sm=1 tr=0 ts=68cfe4f0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=YRiNdvbt-P8spsNBmjsA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyMiBTYWx0ZWRfX54FMx+O4pWGO
 nv8QwylKcWX+o8qvppfpi8AMK6VCgDiFvnqp9B8RkYVOYfPqs+b7kwdbiZXTkkFcAeLYG96y+fV
 Zap9N7DhrKGeQESlBTclgNqbWGmBwel37akHAdPGLMMJaSOhOL7eaKP/+d7H7UlmtWDZkFtfXzU
 kMEgkSInyBoLQvBiG1nSKXpOIXLe+FFp6FZa22gt2J6OPRnvpKCCwICwK6dS/bHYqDhux4SVTEv
 /SzXNchG45+z9CjKkyXLoZ0lT/lNH+jkbH/zxLUWnOASwznFEnlGralvZMExku/3HgyoU470phc
 YiMcUP+iT4njZsoJT9v1b6qAQXE0DMpzEymKZowez3o22DT+5gP8hzkE/epiAEqcPGCT0e4UdYK
 o696/5hr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-21_03,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509200022

On Sun, Sep 21, 2025 at 05:59:27PM +0800, Ma Ke wrote:
> wcd934x_codec_parse_data() contains a device reference count leak in
> of_slim_get_device() where device_find_child() increases the reference
> count of the device but this reference is not properly decreased in
> the success path. Add put_device() in wcd934x_codec_parse_data(),
> which ensures that the reference count of the device is correctly
> managed.
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
>  sound/soc/codecs/wcd934x.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
> index 1bb7e1dc7e6b..9ffa65329934 100644
> --- a/sound/soc/codecs/wcd934x.c
> +++ b/sound/soc/codecs/wcd934x.c
> @@ -5849,10 +5849,13 @@ static int wcd934x_codec_parse_data(struct wcd934x_codec *wcd)
>  	slim_get_logical_addr(wcd->sidev);
>  	wcd->if_regmap = regmap_init_slimbus(wcd->sidev,
>  				  &wcd934x_ifc_regmap_config);

regmap code doesn't increase refcount of the device, so we need to keep
the reference till the remove time. The code also leaks the memory for
regmap, so this code needs additional fixes anyway.

> -	if (IS_ERR(wcd->if_regmap))
> +	if (IS_ERR(wcd->if_regmap)) {
> +		put_device(&wcd->sidev->dev);

This call is correct

>  		return dev_err_probe(dev, PTR_ERR(wcd->if_regmap),
>  				     "Failed to allocate ifc register map\n");
> +	}
>  
> +	put_device(&wcd->sidev->dev);

But this one needs to be deferred until remove time (e.g. by using
devres)

>  	of_property_read_u32(dev->parent->of_node, "qcom,dmic-sample-rate",
>  			     &wcd->dmic_sample_rate);
>  
> -- 
> 2.17.1
> 

-- 
With best wishes
Dmitry
