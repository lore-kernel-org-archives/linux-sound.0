Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954E419F115
	for <linux-sound@vger.kernel.org>; Fri,  4 Jul 2025 14:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751638724; cv=none; b=OnH2E4w/WvEjEV6KBLxfnJMtkclrOFfeLvBks98zXQBueQWhN/ZMupn5DtcwZumlE8+g/YRF9UL7OCDjkbkk3EnlBYXlPK0YCxsVeGGXLJCbaziqt8u3u77XZgbvxMeXZZ/FjmCLFgzzYKvkOz+NfSlDEmK8KcKTL3iI7Z0JKk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751638724; c=relaxed/simple;
	bh=yKb5SrhL6MrA+CsE4Jh/Jd1VRcCRTY2ajGhaIxgCk1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J7F/ehB6xjuLKLPTQJUDm2JDpxF2e2Hn1xhXIXvCQT1UBRGLPY+IUM1k/1a5KvkEB5EjIu7pDsltax6FuXCpTE4qnIL4tvuoonN5sG6Fr5/tzl/wYk8D2154ikm63NQyn6s3qRgCt1TOVcKMd8OcpLuYALfIjW39i6ayyG2hF3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pNsLn6uq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pNsLn6uq"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564BP99w010767
	for <linux-sound@vger.kernel.org>; Fri, 4 Jul 2025 14:18:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xREkybw2FDzvYMizFF8rWZ1X
	RUqOCyiP8R0mJaXN15M=; b=pNsLn6uq4RZ3H8Q+RCuMq1AJRZwDznFhrdfcmATY
	gVY30zS68KDJfwKvCDEDfRmOZyThi7JVmemTaMliFF7SQ9xhDy7/opU2X+/ClkTQ
	tAF0Q6v95JKP28JtR2SIdTGyMLIF5srt+Rb78aKx0B+E9J/87uXAuuAf/2eJQhaj
	aVs4DO9cPT+g1EZl4vw7VojK6i9B8TfjSQsIgzRYdm9uzl6clfl3+VNdBhJhZ0oV
	B1Eeue3cbvuM7M9Bti+gMhlBnooRtIZnMqEf4vig9NyfiJw1Vpg6mBznD5I/Wah6
	nIqf4jHApFVzOToP5D/zKVJyvKdmibkMA4Ipb0OROIUSCA==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47mw30hax3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 04 Jul 2025 14:18:41 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4066ff1aab8so1096289b6e.2
        for <linux-sound@vger.kernel.org>; Fri, 04 Jul 2025 07:18:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751638720; x=1752243520;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xREkybw2FDzvYMizFF8rWZ1XRUqOCyiP8R0mJaXN15M=;
        b=jZJbumClgf/UHhzovfNqfqYuxREgGv8D57jUSBaQ/6D3suBmF56kCUwysKqhZ23GUB
         T3+4hd588oKYTBNMFJ+GxPi0Ci46gvzmeCnplQd5Y3UUW0sotcMxZaEofp2d9Fl4vhJM
         0fa25uvfwfcezrccyfeQw4o+3ZTADnxFAmlDJWl3KQBaBkI8p78Idg9cQdMKwsD2CUQl
         8Ox6hOxoYgRBtOr9yaNfD6f0VnpQdjCZFJp9+Mb6660VYGC4q0f7qOUcMjHG5iPiKR5X
         TRdOhGsIHZQefcfA8p7pnvhFsqr+6FJImpj04xXkUxpy0fgSY3HBvlycAVpdDSTJKFBr
         UWkg==
X-Forwarded-Encrypted: i=1; AJvYcCWqH76GdfeplIxj//l70wbENIlqFgVf4HNdaKhM0IQrxBlb91EDnfJu7Lg5Lv3QVE3HKZ2lP9aJxVNR6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa30pX3mgTwCYc54WLTxaTCVh6/y3Quv+IP/yBxeA/DnRYHPAQ
	xgV7CyQoazuv581pYVQwwxVntTYzL+VY7hCqIQJ0yTwQRsrEhdKhswSaO0VTzSW33EN7RDmNcp/
	vV4m/Ilu2GPgxJKSr/FLKvVe3raGTSaz9bNs69P+vEGBW4c6h2Ggj3/2iyKAFUffJ6E6y/QL18e
	V0
X-Gm-Gg: ASbGncuXgT40z2TS2+L0yjQSrNGBmb725ds421vwHm4+mLxzLV534tvCk80cELBVmau
	OsdeM8qUCFuurfroCtQ0Sm+RqBk+Z5lGE+hbXwfOQ/99bnjMcscG+j12X00wCR0LXqNa6VHUzpf
	n9WvHP+/HWjp8azyhkj2R+G+ELffJyNtxYb1mioBF4PkqqqLDfFYFZzl7lFzyLGNe8Q2K6JBrJe
	BpfX3vlziAzD14tkAXuWWLkF5a4bM53njVjdXgOOBW58nZ47RyASYJ2bFBCfOqB03m+Obb6sv8e
	7bpEAFuV/6qo3VHCnd8SQCPR7Mh2EwyFHCY1+qiu0O8VyEnbQggfHvrZzIC+AqIYrb8v88U1xb8
	/ti2vqOOx31dp+cYc0plwnei9ydmGjth2WVE=
X-Received: by 2002:a05:6808:16a4:b0:40a:b141:8f57 with SMTP id 5614622812f47-40d0408094fmr1926840b6e.3.1751638720169;
        Fri, 04 Jul 2025 07:18:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE55trtrcvfMvQ50U1in5p4/u5VIdRpePmzlTLLMw+K1L0TgUF2JLfaCgovy4RVVDL8Gwf5PQ==
X-Received: by 2002:a05:620a:8014:b0:7d5:dbdc:ceef with SMTP id af79cd13be357-7d5dcc9a32cmr410173085a.18.1751638708650;
        Fri, 04 Jul 2025 07:18:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55638494e29sm262902e87.102.2025.07.04.07.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 07:18:27 -0700 (PDT)
Date: Fri, 4 Jul 2025 17:18:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: srinivas.kandagatla@oss.qualcomm.com
Cc: vkoul@kernel.org, broonie@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, lgirdwood@gmail.com, perex@perex.cz,
        tiwai@suse.com, krzysztof.kozlowski@linaro.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 4/4] ASoC: codecs: wcdxxxx: use
 sdw_slave_get_current_bank helper
Message-ID: <xglngdprknerf3uoeixiocagoml26kw4zcwrnmb7c25m3zt3ol@2vnglqifcb2e>
References: <20250704121218.1225806-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250704121218.1225806-5-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704121218.1225806-5-srinivas.kandagatla@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=CY4I5Krl c=1 sm=1 tr=0 ts=6867e2c1 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=XXM5SuZbuiGnn3J7RH4A:9 a=CjuIK1q_8ugA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-ORIG-GUID: -mnGzMW47S1urz1WF_G3zudzl1m_ydi3
X-Proofpoint-GUID: -mnGzMW47S1urz1WF_G3zudzl1m_ydi3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDEwOCBTYWx0ZWRfXy3LOV6i/9dsq
 TY9QHRa+peegqwtUzOCbDL9HMH4sX2cAQ1B36Zmgxb41Yu5qD3D2EL8pl1tunAo/yFwxTkSKJ4H
 3Vi8+yLEuHvAwFir7P8+uUX0M+M9GUQUASBGCFUa3lDClTwoGqdR2b2qPM48WHz3N6fuOKwTKMB
 0cs6mypYVyr6y4Ewdv9LCiQNwRYGNASjQZthmvS9+sJxeOu9C4EvH4JcXNRBNpvsv0jy7RTLi5j
 WwKdLm3mDsby0JNSy1B/u7RGUmBmw95J3iQ6aRL4lw9E7u8k/k7ll2gblNt2RUlv4qAw9TODiTG
 Yoi3HaP0w7m/GVFqgtFfevsS28ep0z/6XprI0rUclz4EYpv9WLiFVh6bE/3M6hNusTdmIKAjQWy
 KnvQQ0vxuEtogoeaPva9/3pdg6x/Z/jhPf4XynISMFMQ4wOg8HUCocP0Sm6IIxJnJ0fgA+aV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_05,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=517 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 mlxscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040108

On Fri, Jul 04, 2025 at 01:12:18PM +0100, srinivas.kandagatla@oss.qualcomm.com wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> use sdw_slave_get_current_bank() helper function, rather than duplicating
> this function in every codec driver.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  sound/soc/codecs/wcd938x-sdw.c | 10 ----------
>  sound/soc/codecs/wcd938x.c     |  3 +--
>  sound/soc/codecs/wcd938x.h     |  7 -------
>  sound/soc/codecs/wcd939x-sdw.c |  7 -------
>  sound/soc/codecs/wcd939x.c     |  2 +-
>  sound/soc/codecs/wcd939x.h     |  7 -------
>  6 files changed, 2 insertions(+), 34 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
