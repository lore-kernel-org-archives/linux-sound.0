Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F6D1F94C
	for <linux-sound@vger.kernel.org>; Sat, 28 Jun 2025 02:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751076136; cv=none; b=FDkl+0cyWYLmgcd7tg6Px7x/ZFreNa/96NoNUpYp3+H4NNFjVJthqNekquqb48mfuFm1Lx046O/ilrw9s17GxeJ4mhGqb+2KJ3aAXfsw9JlXqOg4d421gXOiqtixQBu//pm5G0dI7riQE4Kdzmk7kwEwKa2j0/dMbsR5/RNv+QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751076136; c=relaxed/simple;
	bh=sNp9pe+T/QSoanxRAXrWpirOPqJeTwmcsYRvUmHMWrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QZ+tDXz86Iv1tSq6v1qH0ZErtt/bhPBdDdT1qstw7hRBDJFAaKMP9WH9RJOxEakmghlAN6pzj2gNl3aWDRxyFrX895EJwj6yDt9+O6NUp/hie1hCyId3W+CQmWagit7AiaRjTkrncxwBQ7GB1qHoXU4VzNOIdUIFZk7itwpCxbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=co8Fj+sB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="co8Fj+sB"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55S0DHAu015537
	for <linux-sound@vger.kernel.org>; Sat, 28 Jun 2025 02:02:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=w6cFaqnSskENYcVsGiQcJv3y
	zw/fX5DNOuINgCjQrrA=; b=co8Fj+sBfGcMwktx6wTkh5muUp1Fw7f34NtoYTW7
	bQckDEa43cN933Q7h/1jkGS+1VzMysn7cyH/MqIDx3hsV4QEfEfNNr/2AL7QV/Gb
	E+AQj2jsjIP6JkHPyyNrYhiuTyoGoW6e392BjBn1oGeDRs/bv0XuyE7ywc490FcN
	aZVVlMnvfWvBcP9ojaNBB4A0Rmb60wsF2+L7hdqkclVJsYX1gK7aYjlwJzQmF4hx
	cSimVv8zwaTNv6eQXMxoD8gPoxIE6EA920k3h6xFYyrQjXKn2zBfyCnsxL9o7g/3
	7dm3ZZJq7Yo8WhbZxi0AuVtr77pYLYKxFNQrRWt+jcFykw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfx6qfy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sat, 28 Jun 2025 02:02:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d38c5c3130so63058785a.1
        for <linux-sound@vger.kernel.org>; Fri, 27 Jun 2025 19:02:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751076133; x=1751680933;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w6cFaqnSskENYcVsGiQcJv3yzw/fX5DNOuINgCjQrrA=;
        b=ScUJGpkOebrNOsEemURJfvV7Ki5wKCdwTT5iGPaRylZ5tqpRH3ppq5Iwie0BIQlkRi
         zsP5CLcjGKEym++dKgzql4NgPguxzs7nAjdg1PenMQx8JbDczerCGQNjg5HFK8jhY4Yq
         sPmNxWfkNsUuF4jl6EdUfmSXLCO46LEp4P8SJ9t+crFQBINk4Rm8gApKIs/J3wSd3Y54
         nJvinFmpSSMa1F3dWTeeqiNr4aUJq0Krz1QpH+m6mfEKc2ym7HyQMAVxU+dW9613QSLz
         rwv+4AiVgfO/MJw3l2M33w2r0IkVsXotMNMZBh4k10Q+OYjdcap2FNzaV0hnSQKJx1R0
         0x/w==
X-Forwarded-Encrypted: i=1; AJvYcCWj20CmaZsKpKh96t5jrTycjAElh7VOjv86d6WBEIapVKq/TChiFL/ZPdwcwxEWv9X1MbcblmNxbQ9L9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsVGl2EFVFQnxd6gDMuFtEP1IuRjFC9rrbGm2WioRymzQ8gxl3
	gj0zDCYy72SoMpMQ9MWheTQr8Q0+9yrO7LUuMKqjz6iRQg+ZmTjpo7/Ykg4VuhfIDZSbsirOyPR
	7HUFg/cYxqlxvAwzFIG3SVmMNmNCyrRuVUWSM5prg17TacJal2O44kGypdUdJI7DiRQ==
X-Gm-Gg: ASbGncvN/Tf64SbB2Ly5D3JrXqS2jmYjvE7662cTJ88X24lKaPVE6ml8/YeZ2kWOqB3
	MVGhuHBXRLffEPIcfqd5/AXcdCdDzvfOAlkY7BMi5oTjFAkiq7mABlUk8blHRFPz3szezf9k/tN
	PqlSFfqVGi/82CZHzszThEIYf/eBg4yiW+CcPrbDcWdqmmlSocwHD3qDRk+fMyzIBZm6duTECMF
	v9uy6+NYaVnuC5K5AFqgbUrJPbAmijUEGd+HgiIv9udeSyxfM7P+zvdzcedeRo66q42NNChDRPP
	Pxuxg4TS+EYbq2QWjElU1IyjhzbKNp/CFzXh3vL0iLO9b7JstMrNQF6fM0GeP1K/Hmd415Gl04b
	YCgTM3QlSiBqrQI0WWyJ81yLTgV6/I1yxnY4=
X-Received: by 2002:a05:620a:aa17:b0:7d3:90ab:800 with SMTP id af79cd13be357-7d44392359emr700974985a.4.1751076132887;
        Fri, 27 Jun 2025 19:02:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF12VuS84LoNNAk+G2kfyBlFl+od3zmjm4qe4Mm6a14+ByrTTticLF4T4ykVkcNtc/sQk9zmw==
X-Received: by 2002:a05:620a:aa17:b0:7d3:90ab:800 with SMTP id af79cd13be357-7d44392359emr700970985a.4.1751076132462;
        Fri, 27 Jun 2025 19:02:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2403fasm649184e87.37.2025.06.27.19.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 19:02:10 -0700 (PDT)
Date: Sat, 28 Jun 2025 05:02:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: srinivas.kandagatla@oss.qualcomm.com
Cc: vkoul@kernel.org, broonie@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, lgirdwood@gmail.com, perex@perex.cz,
        tiwai@suse.com, krzysztof.kozlowski@linaro.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/4] soundwire: bus: add of_sdw_find_device_by_node helper
Message-ID: <cy5cpzoidygeptqwxvnnjilads4npayv2zvu7hfff74defmygv@zglnb7ur4rw2>
References: <20250627155103.441547-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250627155103.441547-2-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627155103.441547-2-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-GUID: nIX3mnqGlrfJBXKKMbyu9idiV9B-11PK
X-Proofpoint-ORIG-GUID: nIX3mnqGlrfJBXKKMbyu9idiV9B-11PK
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685f4d25 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=wpCz0eZ45CY81w7ywFIA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDAxNCBTYWx0ZWRfXw/CUv/GwqynZ
 zkgYUH2wPeEx2QKKTh8Rqx7YFGIIENcdjSSR5shS0gcngUmCPlxsYTa403KPzi67ZLqq6GzFWcy
 KUc4gs0B45+SEdGxcn8OfLqGv9L3227XQraf+3F5d+uUaWHNqObW1BHZeqAM7F2XP+jthwLk2YW
 1pzSvDr8at9ZoYGx9d82peyuS3eSxPUajKtgx4/l4HITBvEuJKSH/V/EFVLN/hW8/0nv8JIaNsB
 QHUbMRUK/WHeH3FsnhoaS841/FE+7q18SF5jR7qYiCwx71/3asE0NfztxbcoJY3oEUf1+UEcYbS
 xyPz9Y5g+vTngjIZf6A/OmcjmFyiq5gonw4L7kFjNE9BWRqE4JzVlmOMWjJvcFqFh2bT9l2YbWO
 LNTh2VwKcvYABd5J/u1D0gQmP6dizqYL20wFuT8Q83n1pF4f7vhBK6vSfNxCy1yP4ezMx763
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=663 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506280014

On Fri, Jun 27, 2025 at 04:51:00PM +0100, srinivas.kandagatla@oss.qualcomm.com wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> There has been more than 3 instances of this helper in multiple codec
> drivers, it does not make sense to keep duplicating this part of code.
> 
> Lets add a helper of_sdw_find_device_by_node for codec drivers to use it.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  drivers/soundwire/slave.c     | 6 ++++++
>  include/linux/soundwire/sdw.h | 9 +++++++++
>  2 files changed, 15 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
