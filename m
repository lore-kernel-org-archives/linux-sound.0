Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88B42F83DF
	for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 11:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760958913; cv=none; b=DFRg9SYLq2Fk4GpgB1qD1e3RsSSFDEeK+VZmpzFmM3ePfx2VDXzv6nTNW1kfsD79IDUmRdSYB+nZPxptaeGnADVbe95SosVdi9JmRmaBNT5JCz5cq1+eORq0WcgJ3n/Zq3CHlZRTq1VZXOn3upeRTmw6VAW0co71NQS1G3WciQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760958913; c=relaxed/simple;
	bh=YWbj8iYas+DX9yMt0sNRdXjfDT0rRGWpMvpSDzRYiHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Un3KSz2ZcsczWiByD+1uedrw/Pf38Zws2AuRxeD/RUlGkHej3zdy1E3CrkDEQZBbsjwP2xcn5T1g4NP+UIFx7lI5xvi1/WyMFvjc8yWr0LZLnoia3reX+OLaFRolT7oooyRdFOGsFBDa0p8S2GHXQbbHNYIjsCd9SA/8fUtQhZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=irS7Ub8I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="irS7Ub8I"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59JNdQKq030282
	for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 11:15:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ooqu6xaruD9rxcgEW9tOeww9
	DyNGCODFn0WfAlwBaMo=; b=irS7Ub8Iyapyq+02NJLQfMtrrK6cC98obv60e2gL
	yRomT9Dh78EvLqCKh8+/vApjY872VFG9718ZXVzYEJ7XsP3maagA0O8ri0pnAGzc
	GHjlu50E2EF6ZN/e+WYQRTIvyYFpcMx9PXeux1wwW3G8c54r+cnKhj+ETLHTqy5n
	tCgMLJSfmW2rJXeShlN61i/jx8oB51dO45qKjdhkGya63Ewty5OV0y+vTMl2pD23
	ELoVbBMYPz/Y3Q7qhBlXfyUj19zHrg6K7L4reEO5tnN0ryr65Ha5zWkk4KOO+sC1
	7vdP8vvSrYVhVhREeTi9wEOqvMvHiy55CjkZx4R6orYO7A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v2gdvjy6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 11:15:10 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-87a0e9be970so158019186d6.3
        for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 04:15:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760958910; x=1761563710;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ooqu6xaruD9rxcgEW9tOeww9DyNGCODFn0WfAlwBaMo=;
        b=PnOJsseivOVc9ESc5RgUuEYgc+8PhfOcadhxxQPGVtTq3tVDvcQs0YlYlWBcogc90u
         wuLbAH2TPnEBSD/0L/piRLsg+LlWBtyYYAxj0oRDGbZnGg/O7JgxMp8uSjqmpEMTgfYm
         OVdO3+5hWfNPqKKl5plB3bVvH9IMYokHOvBuWM3BaNQ2bjxR0CmhfRnIQehUfoVXlo9z
         sPbmtz8Ly0gz7otvwU/VmF3CIBotLcZOKPvdtd8bcZWfzh2ZGuJAy+jRSd+UGmqQ0P2c
         olDlh7KSDhiIs3crfpkCb7KGx5nLF3H/PqNKIZ80B4QjjBQuVdnpTY5qJGXAVhlec2ep
         dBiw==
X-Forwarded-Encrypted: i=1; AJvYcCUrfAoH3CNW2tINg1ofIxuS5cjyj17ZTG6e6zzZiVTVkuLKH5s/92F9VYHG2G9wgd6v6sjBbK5RmFI2Zg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAcGPw8VqH5DxNWyP0qYMwABiBAlwvlV2KUaK6I6nq44LCmfAh
	M9LSqyfLTlu8zU8EBWnH321Oc2W9nbsbx3mcqG7ifuwuuh6nIbcYxrLW6jB/a6vJF8EKzNT3OFY
	V+qgFkSpzFXIBg/n7ANdnKMjwcj/Lt23W4ffdH8h+FJ+wScCFGlqrPxuPCXZlT0EQPw==
X-Gm-Gg: ASbGncuzw0BNBCJlYHJki+xerAR2uNSwUYilgj9iNM+SridswKFIjHxgASrlEKTK6KC
	cakqzZoj04HvI2nQCg4+X6/Eiof8NHtE7WMX2SCipmhKsRyWYfh/gGi6ZI3gIUCY7+fCy+rnxOF
	JReMeUhJoZjWD9nj1pfwsfJlDDt2mRU8tbOZfPVR4yMIRckzFZVwItlqepKSkkN1dMBfBq7lvCI
	+XhTjCT/CzFJCQMYe+i0YkUkROtZfdSPBPHc2X789kJ45vFp5eVaQl50HReyvUyualZ4Py7W6pE
	VIv8hbE1VlqHM64ZMdiD5IWLMOgdMxAQ11MGjXGymgWKEEXouClflc4OgSY9Rz9LigPPS4ewX4s
	iYN+msFIUnmO6hEj7VAnAyZZBLHdy2P4+T1wvZfcMa1pUfIEI5eyf0wOWlZFOgWxi8g/KoR9HQt
	HsC5UbZqqE5zA=
X-Received: by 2002:ac8:7d55:0:b0:4e8:bb50:a7ee with SMTP id d75a77b69052e-4e8bb50ac5dmr49358481cf.33.1760958909897;
        Mon, 20 Oct 2025 04:15:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHC4943Xl/nY4LqGLDWB9RS+BKQeWqjCvKpSQKEP6uZ3s7Yd5kMgKj44+WxkdFtuLOsGbUgDQ==
X-Received: by 2002:ac8:7d55:0:b0:4e8:bb50:a7ee with SMTP id d75a77b69052e-4e8bb50ac5dmr49358161cf.33.1760958909367;
        Mon, 20 Oct 2025 04:15:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591def28beasm2429223e87.114.2025.10.20.04.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 04:15:08 -0700 (PDT)
Date: Mon, 20 Oct 2025 14:15:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: broonie@kernel.org, gregkh@linuxfoundation.org, srini@kernel.org,
        rafael@kernel.org, dakr@kernel.org, make24@iscas.ac.cn, steev@kali.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] regmap: slimbus: fix bus_context pointer in
 __devm_regmap_init_slimbus
Message-ID: <asrczgrmisaqzhin37jzgylm6ez2mlxtsbe6qp5mqgfecprup4@yb32qzna367s>
References: <20251020015557.1127542-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020015557.1127542-1-alexey.klimov@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMCBTYWx0ZWRfX0oysR1DDb7KL
 Q/K2n/gKxA1dali91TGw4s/ANIbGLqifNc0GcGCvU4jgy0xCDS7HW3f+sHB8BTsGYpvcTdAI/Km
 TTSPVaJ5GwceGsNsqcya2KKo/R0StZeoTxseqP4JJlh1Z0gE/Qb8+f9TvDku35e8ZELQQrwIPrl
 xWkbr9dyUBHhNHEA9pGRoH0K6hVRfQFFrEf2Xz0JCm2T/ZkerVMRKoZaICUz+Or/t1N9aZUNxY1
 UKHSVG52wWUOUGLtwdFSZn8j5jbv3Y92y4Mh1idpEvUQ7gu8ev7/aQN1mMnxmngT0nl4MauJ6J6
 Cdyxgjenj6tBobNB3SKgn0ppOh3e2Erc72+FFbWFnCCqTCQqCX64UEt0FgpmU0tI9D+LaTmkMWG
 d08M7fxt56H+KtKeL/U2WwGCOgDSpw==
X-Authority-Analysis: v=2.4 cv=KqFAGGWN c=1 sm=1 tr=0 ts=68f619be cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=FQcGyLhEAAAA:8 a=KKAkSRfTAAAA:8 a=flUO-uPbEbLbV0svWUEA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=09nrmc514_O-33C_6P4G:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: dPbZIAdTnzFeS79skznIBTJTD-I6qoWf
X-Proofpoint-ORIG-GUID: dPbZIAdTnzFeS79skznIBTJTD-I6qoWf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180020

On Mon, Oct 20, 2025 at 02:55:57AM +0100, Alexey Klimov wrote:
> Commit 4e65bda8273c ("ASoC: wcd934x: fix error handling in
> wcd934x_codec_parse_data()") revealed the problem in slimbus regmap.
> That commit breaks audio playback, for instance, on sdm845 Thundercomm
> Dragonboard 845c board:
> 
> 
> The __devm_regmap_init_slimbus() started to be used instead of
> __regmap_init_slimbus() after the commit mentioned above and turns out
> the incorrect bus_context pointer (3rd argument) was used in
> __devm_regmap_init_slimbus(). It should be &slimbus->dev. Correct it.
> The wcd934x codec seems to be the only (or the first) user of
> devm_regmap_init_slimbus() but we should fix till the point where
> __devm_regmap_init_slimbus() was introduced therefore two "Fixes" tags.
> 
> Fixes: 4e65bda8273c ("ASoC: wcd934x: fix error handling in wcd934x_codec_parse_data()")
> Fixes: 7d6f7fb053ad ("regmap: add SLIMbus support")
> Cc: stable@vger.kernel.org
> Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Cc: Ma Ke <make24@iscas.ac.cn>
> Cc: Steev Klimaszewski <steev@kali.org>
> Cc: Srinivas Kandagatla <srini@kernel.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
> 
> The patch/fix is for the current 6.18 development cycle
> since it is fixes the regression introduced in 6.18.0-rc1.
> 
>  drivers/base/regmap/regmap-slimbus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/base/regmap/regmap-slimbus.c b/drivers/base/regmap/regmap-slimbus.c
> index 54eb7d227cf4..edfee18fbea1 100644
> --- a/drivers/base/regmap/regmap-slimbus.c
> +++ b/drivers/base/regmap/regmap-slimbus.c
> @@ -63,7 +63,7 @@ struct regmap *__devm_regmap_init_slimbus(struct slim_device *slimbus,
>  	if (IS_ERR(bus))
>  		return ERR_CAST(bus);
>  
> -	return __devm_regmap_init(&slimbus->dev, bus, &slimbus, config,
> +	return __devm_regmap_init(&slimbus->dev, bus, &slimbus->dev, config,

Looking at regmap_slimbus_write(), the correct bus context should be
just 'slimbus' (which is equal to '&slimbus->dev', because dev is the
first field in struct slimbus_device. So, while the patch is correct,
I'd suggest just passing slimbus (and fixing __regmap_init_slimbus()
too).

>  				  lock_key, lock_name);
>  }
>  EXPORT_SYMBOL_GPL(__devm_regmap_init_slimbus);
> -- 
> 2.47.3
> 

-- 
With best wishes
Dmitry
