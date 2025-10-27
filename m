Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E045530597A
	for <linux-sound@vger.kernel.org>; Mon, 27 Oct 2025 14:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761575951; cv=none; b=CKQmKMsA6UGYMjWzTAJj7kOILItjdQdC73W1tEV0uLKOgrTj5o2Tr1dTPugra6kZH0dRRdI1jnyGgGuy6BCtMLuK+t5ZciOwazA9PqP+7NcvNscpxOaoj36Y4Ad/xhOfn9XhvlxgGi4gK7xYqzaElCg2RPA9iAPelrgHHMFc40o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761575951; c=relaxed/simple;
	bh=47HzZofMxL0ovAwgF2N0WwWZU4d7Fcqxln3pLvlcFrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OQj/TMtSbY/FBTyFtTZlw+rDwEkoYZnL8ah+MpUNnhGA4+3C1A3yyseoxniPC9M5/nJPG0b4zU3BqyjCjE/rA9Pkxnph0mclW9RwdVfDOJYjv5SRyJvVmc8Wete5Kyzy6hETYiFBB5iVi0asen9px40RGh6bcJLRxxISql/SldU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UUUKXjTp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UUUKXjTp"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59R84h282232116
	for <linux-sound@vger.kernel.org>; Mon, 27 Oct 2025 14:39:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aYCptxushuK85zBtS4ghGUMa
	UfbytrxnOA8EMRRHrZY=; b=UUUKXjTpHCKASlEf0rB5/nCagNQ/5xVg9fGr+oWR
	veStfZsybImG24joodx6e9Ax3C842i0HTslBXrUIkZu7+clFwnfeiuRv2LKIL0tj
	g2kt/2jJ9Que83VTHP10ve/RKnAG8+sMC/g+Hkn4vEhDiWKcbImHukQkelyt6a4E
	pKDmLwpqPkMybRiOq/rJkWvRRY4iK+GVydD543mova5ikhDcuKWXrB7pF6dqYfqn
	rbCwfRJ9Tu7qc5wA0fcVbm4FlblkcEJIx3qLFvAyKobBXtA43zky95lzTNx7azb9
	yhpP3OHVWlA2yNooWa8uvskQTf1LQmPjmsiomSUoSXG6rA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a24wn94nh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 27 Oct 2025 14:39:08 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4eceefa36d0so53011511cf.1
        for <linux-sound@vger.kernel.org>; Mon, 27 Oct 2025 07:39:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761575947; x=1762180747;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aYCptxushuK85zBtS4ghGUMaUfbytrxnOA8EMRRHrZY=;
        b=CaBVX2E/0kwJJthYX5k6R2Y43td9IPs/fGEXvpYeX7/p9jLkOaPJQQQ3kG+jpvJDoH
         4VwKqF+9ffE2S3b4Vs9JN6CLUMFM2vgVYg7RrAaEJ+xWv5WHijhyVarTO1IMQ4kOd6jN
         Af+OQUbVuMT8rEZZlVEWFFman8rMomz31dPanNEIEf21/M9bkxV17lbq8XGupqYnrugQ
         z71ipPt4Ne/Tm1YLK1QFiQtfiTtL2k5ZR2AbBGjobNaTTZmMNKaIMec2yEYiVa3JaO+U
         MknKP28p4Ubbonqx94sqK6BGhMFfXQd48jsQrrhDAmT3SiLqxEirRlsWt7XOkcX5Gmwx
         usvw==
X-Forwarded-Encrypted: i=1; AJvYcCWvrQIovvjcT3PhLX5eBmGc/5qUGv08zpU2sFkNZUEG8R8NUgQnry2Sgwr7LXGhxc8blsGBKe6C1nXNEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcqzufJudejVAMR4vq5Bd4vn4sFI4UPMV9Yx/39OXmpuofZkNh
	BbqkX7FNNt1iXD88gxMwmAdecMDlCqxYmOYiItV0C8v0w3n6M6I0/0dqVEUz8xMuBjoMGeo8bJ7
	5D6Acq2HR+2GcvF3E3oC/k2DKofwGxqVRpoxzxfIbjEezqdJJlsP1VxtnfzjppT5yUw==
X-Gm-Gg: ASbGncvRvfr1DtbIMXl9HM5WaH+njGSebjG4ajvWH/itx2twWhIP7BGD6qLEv1FtpJy
	6iitBC6PSLhHAJ6En1iAG6c7wuN4az65Xw2nD60xVAg2g1wl0M5NSMXMq7sw69oDIt8Vl1re36q
	EKMaqLZneFp7Mz9RYvSw0O87wEeRiLg0L/LhuLQy5hYkjXjjeYuyKSJFN6BFQ7ZkCDYWvb8QmBd
	WRbK3Yhm6NHbNvf6Pq/DwZSfYLK1YUZIPCh/RuLvH1Ru8kw2OoY2Scpxnp9EOHR1My/lVORBZsi
	JskX6HfXl4n+XNS7zzNSvIdngu1jeZrVnebs4hVXbayE/j6A/9gi7Vb/M5h4174VNzxS/oNPTE8
	UGArYAyv5v6MONHb6te224jVh+/tNiJ3qOQD+fTDJhH/qWaeAmQMiY/Rylm+7zfwwFXouaQ/EXM
	7e2yIcXUNFrNeh
X-Received: by 2002:a05:622a:210:b0:4e8:b739:6b5d with SMTP id d75a77b69052e-4ed075af157mr2499731cf.46.1761575946951;
        Mon, 27 Oct 2025 07:39:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE25V05R9DFD8UMFppmwdaHhnps1+EhW4/tRntEoJQnX+uPBq3zljmulhRuh9PeNVhTxFxKCA==
X-Received: by 2002:a05:622a:210:b0:4e8:b739:6b5d with SMTP id d75a77b69052e-4ed075af157mr2499321cf.46.1761575946421;
        Mon, 27 Oct 2025 07:39:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f41cddsm2320354e87.17.2025.10.27.07.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 07:39:05 -0700 (PDT)
Date: Mon, 27 Oct 2025 16:39:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Miaoqian Lin <linmq006@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] slimbus: ngd: Fix reference count leak in
 qcom_slim_ngd_notify_slaves
Message-ID: <ke5p44nthtwvmptp374xtkkc7giwvnxwheyx4ohz6fugdwinta@w5timotaxhkq>
References: <20251027060601.33228-1-linmq006@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027060601.33228-1-linmq006@gmail.com>
X-Authority-Analysis: v=2.4 cv=XIY9iAhE c=1 sm=1 tr=0 ts=68ff840c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=Y9G3A3km2bKrLaHVutgA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: MmNoChYUqHATGf4lWuCKMgwrFmJ4Yii_
X-Proofpoint-ORIG-GUID: MmNoChYUqHATGf4lWuCKMgwrFmJ4Yii_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDEzNiBTYWx0ZWRfX8hob6wJ00Z1x
 AFZ4/xmCt2ADaOC2afUOSfD/Xc/pmc3Bi39su/ibqCXhsWGVQ4lH/q2SqYnknBMgBIV4F7jwC2D
 +YOWXG+ZywLmalI0/7VJ/G7yelbPdpH51CJEKD4s3Qlh9MG1YrRxB6ZZJVGm8yf65aX3AsspL6K
 th+mfyy3ATVrUrSlXblWYHyxlZFteQwOuCLLLChWIx5OJmttw4k+wnJW+PQnWN7wdgdXJy8681w
 nsrpE7747hZaAkjZKGOgQVkOSh55+fBuYAvnwlIwd6eV1AB9efjXb6vHkwBsLG+X/rGnKfYOkFn
 seFzbDi/cPYlA08+0KgO4bkkL4NNBj88LBe3uOcFuOCM60bNu92owLWQhE2HiAM6z/zcD8tOb5I
 3l/KOWfCZe+N8ZR6Sq1utBQdrPqfLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_06,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510270136

On Mon, Oct 27, 2025 at 02:06:01PM +0800, Miaoqian Lin wrote:
> The function qcom_slim_ngd_notify_slaves() calls of_slim_get_device() which
> internally uses device_find_child() to obtain a device reference.
> According to the device_find_child() documentation,
> the caller must drop the reference with put_device() after use.
> 
> Found via static analysis and this is similar to commit 4e65bda8273c
> ("ASoC: wcd934x: fix error handling in wcd934x_codec_parse_data()")
> 
> Fixes: 917809e2280b ("slimbus: ngd: Add qcom SLIMBus NGD driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
>  drivers/slimbus/qcom-ngd-ctrl.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
