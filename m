Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5EC21ADCB
	for <linux-sound@vger.kernel.org>; Fri,  5 Sep 2025 16:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757090583; cv=none; b=fRPUziwUjhtOg9Fd52YNPcD7oPBkXEyVyOGjIGXzTi5GWVZcnP3+CnzJLWo2t2E33vfr42VRXUrNuMljnrH9PQhqSIVD9VVmxJU6PYhVXRk0N4dfZuuV01Il+rF26/5XXV90vf5OOxlWWi17EqP40yflsOZxf0iTASSCBlRbi4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757090583; c=relaxed/simple;
	bh=VWbyFdvaSUqfRLDRkm9PlbtB313KqeKRKvFGLA9uaRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i+ysnU9HmgQaJLODy2SS773rsH0ZChyG+BSK2sJ2clzyaigR34rhHlwJ5SnVcSGu30edo13bQQHk88yPkvv/HGbStGqCT11QauAoJDxiNaELU3Vk/ciZu0+fLgGgG5wXR0e9eHlfCZKWYaJ2Nsf1ep02Ex1jCCkg9FsdNN6ttpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D7WbpnTy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D7WbpnTy"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 585G4rIV007619
	for <linux-sound@vger.kernel.org>; Fri, 5 Sep 2025 16:43:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OgdWpq37y+9vEpO9XaoifcHS
	/4f84Cp4GGDpq5ttRE0=; b=D7WbpnTyRf26cppQG3eC6BVX+g8Up/JQd7Ryv36J
	HXyqMrewsAR1tvSC8CHscrPM3xfnuDVgtzZUKSk+iI5d/6Tym7s9/snSHjx6oe6s
	Wtn8dagecrfbq34Zv76/LVTCJkO3xCO8/t+oLkYB6cyzUJZjTmWxJYXDilrLklhC
	DbnAuVII7iLASKR55ouugd20mMjO+o+yeZeFRFXRBFyFCgc0+LfNx0sGGk1NVlGk
	IMjzQ579PEFVEgt+Wa2JSm1bUvFtQ7a4F4LWnRcpA8fqVnl5xG0xrt0nfUl6Qg+N
	8OVw2px2sbbAbTL1hZ3QV9S3ASvUFFBNKEk94ZcpxjUaXw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura93qfm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 16:43:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b34c87dad0so54630601cf.3
        for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 09:43:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757090579; x=1757695379;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OgdWpq37y+9vEpO9XaoifcHS/4f84Cp4GGDpq5ttRE0=;
        b=tq+aMcVzxw9iULi5ohnvTDYqzC4QPqIOJcUmjMEFcIefILhZPxdS82qR1EDcIQZljd
         JlhFZsNke3pN5oYIg83w76L/bqPf5T+O1w1n4mo0QdlbF3FUaYpSk8eC42PYMJbgsPxd
         jFIFtrB7Ag7dzObH6Cl70I0LF84HzZ1b2IV4Tut4c4A41tYClvMag2OYCJAA/5Puk6k3
         V9x3BNz9bkyjguvSsi63dPsCYBT7CM958JN6r0mOBHkS2a1VqLgcUAZhovH5qOzmYKtX
         9DjJ5ZIedEUFoIXqPC8Bnwji/sKrhkYez/ColyHQgoCiM6p5rnSsxA1cHn3Rq8VOBx2N
         m70g==
X-Forwarded-Encrypted: i=1; AJvYcCWRxrOVBWAqSY4+s9y66hrtH/zbn/52JtS14eOWjKXyGBrAnGtT+5hbEVwmOkq3+FqI+MfTsITg6HgdOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPQOHoOMMP5qlNx4S06fKVC+XWQ/JD5jLdb6kwRl+CNaB6eriS
	9SBM9S10v2YRw8vxnSIKI8C4r8ESDsJ18h1/qeH2LCZg7emF4n0W1JtFapllPRoTWn1NEZSlsB3
	SSt2Zc7tQt3VasizLYnXKzgRp6bKrnVYuqJ2jzqWNu+otSiIF7/7yNmu0/0jvwF/1Mw==
X-Gm-Gg: ASbGnct4bIj8xyd7G32d1cFAbaN3RiS+mpwyN62GsnSzXFQ0ZWTThf6uLyWuG1B3qXS
	M1zhJji1OmSi7r63pYnvo4pqul7gKGK2m48B3V6Eqd+l1yWcQ+DVMk+Go+qw9qmdyqrf/nuhqy5
	0dPFzPFj1xgB4ZhjOg9+C/zt67lYffIJVhU45PMDJyZf2FRiH0QgP1h6rvKkwbPV3N+epsYgNkl
	tL8AaQwviz4OJPNBvf0rL0JebU03Dul7E3sq+a7lwABfwG6XFYjlxyXPBhB365+fzAnM79SfqJ9
	6kJZJCIf7lOVjB3ijruQzs40vsbvc04i1dmgPIbpjaFCTEhvMZCypB0JEkQSQxw2MMMyGsJdnV0
	ZoYoH8Llrdh3AdLG//3eSmubw3Wiq1ePrnrLX2TWBYrgXQc+v7jTR
X-Received: by 2002:a05:622a:1388:b0:4b4:8efa:f9e2 with SMTP id d75a77b69052e-4b48efb085dmr127781511cf.29.1757090579336;
        Fri, 05 Sep 2025 09:42:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHDhaPV+DpUqz0Gpu/izEq6Kzs10bxHEYDUSOPCSB94dwofk5NG2Bs5M2Pj/40aa37D42TuQ==
X-Received: by 2002:a05:622a:1388:b0:4b4:8efa:f9e2 with SMTP id d75a77b69052e-4b48efb085dmr127781021cf.29.1757090578802;
        Fri, 05 Sep 2025 09:42:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ab5c15dsm1869487e87.24.2025.09.05.09.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 09:42:57 -0700 (PDT)
Date: Fri, 5 Sep 2025 19:42:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org,
        srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, neil.armstrong@linaro.org,
        krzysztof.kozlowski@linaro.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v3 06/12] ASoC: codecs: wcd: add common helper for wcd
 codecs
Message-ID: <r2vk6rus2ownex4hunrwxutbrbsggmbe7lgiiksetum72y5scn@6kd55k5cdpr4>
References: <20250905154430.12268-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250905154430.12268-7-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905154430.12268-7-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: cXHqK2j6fLlPpus5mPkiU3My-1WIRgSr
X-Proofpoint-GUID: cXHqK2j6fLlPpus5mPkiU3My-1WIRgSr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfX3Bt9Esx26VQ/
 eJI3V5B5Q9rNSTpkiezXMiZls6Bz7sVrSi8ruS4DAqz+VtRYmzg6bdEukl8UxfxojYFDSIjDDnM
 GJ+EHgzpFh1xL3ru10fYieU+TzxuUpapyyaABItKZVDWN27qZ/bThiDVlPHSJBSZG8ZrN2j7hjc
 7INxl6+evnP14o4I7ZKDfPUOuqv9yy8sONXPoFkyK34uRyEDtRNT4Rmtwq6TT9ITZJsQkOUwvZf
 e+Iij8FGp2sQAD/rU9vD89W+ZSFqPVhmqcr8bvkQaL/KwGClLk5+W8Sl1foLZBnf4enUulwq5JQ
 +YGDaiv2uVhvjemvcm4r63a5WNm15Nun6ZTqjmGahS9ptBcUZzOdb34QU6BBBhYZJUBxEDSGCYk
 KLRoexU/
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68bb1314 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=svJh2_vFcTraKgw4RYYA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020

On Fri, Sep 05, 2025 at 04:44:24PM +0100, Srinivas Kandagatla wrote:
> All the Qualcomm WCD codecs have most of its code duplicated across all
> these 3/4 drivers. This is an attempt to remove those duplicate
> parts by adding a common helper library for these codecs.
> 
> To start with move all the micbias parsing and voltage settings these
> are identical in WCD934x, WCD937x, WCD938x and WCD939x codec driver.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  sound/soc/codecs/Kconfig      |  8 ++++
>  sound/soc/codecs/Makefile     |  2 +
>  sound/soc/codecs/wcd-common.c | 70 +++++++++++++++++++++++++++
>  sound/soc/codecs/wcd-common.h | 27 +++++++++++
>  sound/soc/codecs/wcd934x.c    | 82 +++++++++----------------------
>  sound/soc/codecs/wcd937x.c    | 75 +++++++----------------------
>  sound/soc/codecs/wcd937x.h    |  6 +--
>  sound/soc/codecs/wcd938x.c    | 88 +++++++---------------------------
>  sound/soc/codecs/wcd939x.c    | 90 +++++++----------------------------
>  9 files changed, 183 insertions(+), 265 deletions(-)
>  create mode 100644 sound/soc/codecs/wcd-common.c
>  create mode 100644 sound/soc/codecs/wcd-common.h
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
