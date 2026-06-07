Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D581DE8BB
	for <linux-sound@vger.kernel.org>; Sun,  7 Jun 2026 07:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780818590; cv=none; b=Iqara2GcQuJq2eTpJTPRlFmVNY3Nsd5r66xgmDxOU5WCUopiNrR6WO0ZE6aI+5YoOzbPgI1pRjux98el4D+QexEPQacNCX4SuqRSmLcLYZaPFHbRTaYYcV9Y0n5DriaVSmp+0mFiUY9uIYRofdXx42uV+ySZUHZrZ+ft+ANJ0Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780818590; c=relaxed/simple;
	bh=oSl2ogZNQGmd87ETOSzNSkSCh4CwHrElkWlKILloB3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nw6x8mIYQZAArHNd3xC3gHGoQHHBWzyKmcwOja5YGf4ADww67vbB89/vrqHayHoIiInzaEPQPkmNks5XhzFpxewWDWFAw9urKflBwShs2gxxyUzDrmQNhTMMA88vw+OWLs3vfead2m4t8f15leDXuiHjijLXPzlvna43QEhZtF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hsWmXFzv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ReLKv625; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hsWmXFzv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ReLKv625"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6577B9Nh4122806
	for <linux-sound@vger.kernel.org>; Sun, 7 Jun 2026 07:49:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=teBGrABVhJlKOgLTq47ixTXW
	2t5GHP5uTDgWHbMXLYY=; b=hsWmXFzvIlp0gBkcRH8W6efCALF31zsiNJF6+8uL
	abO3VPCbK/ndI6+DlbNPt00iqcQQy1afr9/huMWvIUlRuSGEbV1spJsmY+tUq4Tj
	+rxWtGuSSsoxWXKtqpjPZjUR+eqlIUEXul1qAPJvBNv6T3COCixE+p3xRh6jjbXP
	28q3hcRBOxF2AL3Cmnu2R6HEe6j45Z7h21jxMQKPvCPgf0Zemuy07AgDxZYZRqZ3
	EH7BecnwOCLwjesTrxU0FnSZCMGQyJhrLKtZ4/vcnHDmNdz7tNbeDkqBsBShB99a
	TdP2avwVDOWCyZBXFTT4taqoTYx4sumz4o7eRlM1wlUytA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em9k3kpn4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 07 Jun 2026 07:49:47 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9639e28bccbso3675749241.2
        for <linux-sound@vger.kernel.org>; Sun, 07 Jun 2026 00:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780818587; x=1781423387; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=teBGrABVhJlKOgLTq47ixTXW2t5GHP5uTDgWHbMXLYY=;
        b=ReLKv625itXwta9J3sb8DIvaV+9epxszzkczRB4vegDInMjKjX6DFYWn8FXObiYoan
         NovG0oZdM9VW5tN2LakxjoAZ11c8tNLfBic+SU+Bfbw+rKMTLM5YhbFQhNtIN0mPSu0X
         2dKOZoNeuJUlMCYrluMIx7shh8OSGV1GbiLKyaL5POE2N1UvbhVjnMK+FzMPrif3Koi5
         W1AkBk4EfX15X8NCNV+DU/S0xaSXEjcngFJBUoGSPAoA4a/X8NTbGSdfqeHBAIGofdby
         0oq5gRLMiQJyRNpinstwAnBAV39PFRT/5IGWO3DK47C1P4cBQh8PnILZmuzEe5WogmXL
         eogQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780818587; x=1781423387;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=teBGrABVhJlKOgLTq47ixTXW2t5GHP5uTDgWHbMXLYY=;
        b=YMP3okwgWvVNYmUJn85T8eWa9fnB41u3jj8KapQGL5vjRnpCOP4V1WVZq26KBItenm
         5xjNvrqZcJFq1utqTfSLBz4EAnSp+3WU5ayK7964PihK0Mhpos6CLXSrRlsmTp0LEthY
         Q4gshaGY5zUA03VhwAuHZkQz1yH9/vNhGrw6w2NIKe24yYM51yyeHJdSNH/wE4aRiRi0
         LwuiUiNQ50/aUGdto4BhAyiHYPDSIcG/yIjmh5Cmh77TlUmGI0ks+GQl0u6nZ0CNB2Qb
         nvp8mBMZP9VdeEK/zdj7mCttdi0g9DfSYMQRdlxr5a74voG574bhIIvw4ughuXx7K34C
         8Vew==
X-Forwarded-Encrypted: i=1; AFNElJ9me6j1dYFqWFx1b0rssDUOuDJAQxijIRHyTxBGTNNDMKDHn5NUto1YEmWeW9Y95v3xHz3IybEM9R9ZQg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIEQrD8NChlLntdaVmZ08TD/PZSaiKLnwmv+uy0hNVDdcR619s
	VonFZoEWhjXklQvm6zfPs4BDVH/CA07U/5Ob9R3Hru5rtl68A5Rk/aIT1Hw+N4Jt4QB40Ln6rHT
	fvtiucyI90QzH2fgnJenrnM3G2zSUotmEzKZqKV4KM2IkFZWFsg07nQ5OYIv1RpmYkw==
X-Gm-Gg: Acq92OEug04HuLN4yMq8fslEkti6Bab6eEAtSCbnVDpR6o6XKqqXBqYc65UmZ6O1Guk
	nToaH8WjMLjTwL1cpYcZesDDZX9t4ESU0RQq9Kg9gLOyE3rknbP2PS35Fv+FPQUf52kxy3HT+6z
	2ZxOxb/G82SMVcLnIqLdxEIvZjK4azjn71KswBz1YRoBWOD8LbGTE2FRzN7GadS13jv4ZcxW4DB
	YG9BGie664UgppcA1jf4921dW9b7SVAc9hybLA5AWwQOufEyZJ/Ma5pw07thSa7wVkxwHRcnqwL
	8hELyeeBP+A3fi3Or95metMVAehsbh6pJvsed20b3MYH9nZPZp4B1N/jszajc3hE+OSxHT8CqEZ
	WukWU99/YaVrvmCUz6FoPjywn7S+LTv2Ugc5OHbBEil5GVf+TqMhZQh32d7rkXWdP4PoVjrsrE9
	Ir6/Gmh/dWePNUW9Xmz6pmBVx92rQmin9O/tGgMVSK0Tehzw==
X-Received: by 2002:a05:6102:3f49:b0:62f:5908:648a with SMTP id ada2fe7eead31-6fefe3bbc85mr5850558137.28.1780818587058;
        Sun, 07 Jun 2026 00:49:47 -0700 (PDT)
X-Received: by 2002:a05:6102:3f49:b0:62f:5908:648a with SMTP id ada2fe7eead31-6fefe3bbc85mr5850549137.28.1780818586588;
        Sun, 07 Jun 2026 00:49:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b907269sm2915888e87.34.2026.06.07.00.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 00:49:45 -0700 (PDT)
Date: Sun, 7 Jun 2026 10:49:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>,
        Katsuhiro Suzuki <katsuhiro@katsuster.net>,
        Matteo Martelli <matteomartelli3@gmail.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com
Subject: Re: [PATCH 4/5] ASoC: qcom: sc8280xp: Add per-card data
Message-ID: <t2vwes2xzruqygdjasgi6akwuvephitqbyz3dntiqidbm23bki@uj22cgv72ht5>
References: <20260607-rubikpi-next-20260605-v1-0-7f334e16fea6@thundersoft.com>
 <20260607-rubikpi-next-20260605-v1-4-7f334e16fea6@thundersoft.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260607-rubikpi-next-20260605-v1-4-7f334e16fea6@thundersoft.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDA3NCBTYWx0ZWRfX4RzPIAQ5GeWl
 YwI3i1BuiNW5bff27o/i+ZGq0UmyCitIZH2J8tjX3h6ESXdSkl+H4fbNangFO8vhGXIOrP71biv
 Hwr53xCXyvFEXaWt9GZf/G0OWxgbDFQTTmDVxkaVSBTIOzqw1KA1yXEdnp2AnxvvbBh9CrGo4C5
 QMt9BKL6D5lummSmdPS1lRNSkmdwRTnjx04RuTrzUb+9cy5bme/qXsrOGTXUAWU9/3f6Krr5SBE
 zE0UBPjOYoP16Jty1Tm8KSqCgfeJ8hs0mx5ZIbfeXmY/5wqDgbXVCViiEDMjoNCJmtZBiVLSEZD
 QDhXu9jGBjFWExeBejmjqgA7suOWekh9/j+RKRwPPwz2MY6ddDQb5cXyOtFZjNJvIHogKVtJHbu
 qt67A62j6U9/+YNxpoBY0C8kOPLAKtv1AOMN4OBWcPhdQbhhakl3n5XDPO7tjFteenpu+hlrlx8
 qm6drIcK4Cd/WriJz7A==
X-Proofpoint-ORIG-GUID: GmhBgnc2BQiP7Y2Jp6-nffO-LbzheN_Z
X-Proofpoint-GUID: GmhBgnc2BQiP7Y2Jp6-nffO-LbzheN_Z
X-Authority-Analysis: v=2.4 cv=TIB1jVla c=1 sm=1 tr=0 ts=6a25229b cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=Wdb1h0LgAAAA:8
 a=ucrSXoFAGfgxklnESFQA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
 a=j5gyrzqu0rbr1vhfHjzO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070074

On Sun, Jun 07, 2026 at 02:58:20AM +0800, Hongyang Zhao wrote:
> The sc8280xp machine driver currently uses the OF match data only as a
> driver name, which makes it difficult to describe board-specific MI2S
> codec requirements.
> 
> Convert the match data to a per-card data structure and add data for
> the QCS6490 RubikPi3. The RubikPi3 data configures the ES8316 MI2S DAI
> format, MCLK rate, BE hardware parameters and headset jack pins.

Please don't mix refactoring and actual changes in a single patch. Split
this commit, performing one logical change per commit.

> 
> Add a common headset jack helper which accepts board-specific DAPM pins
> for codecs that are not connected through the WCD TX codec DMA path.
> 
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> ---
>  sound/soc/qcom/common.c   |  75 ++++++++---
>  sound/soc/qcom/common.h   |   6 +-
>  sound/soc/qcom/sc8280xp.c | 319 ++++++++++++++++++++++++++++++++++++++++++----
>  3 files changed, 357 insertions(+), 43 deletions(-)
> 

-- 
With best wishes
Dmitry
