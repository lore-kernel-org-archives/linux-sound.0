Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF3B28A73F
	for <linux-sound@vger.kernel.org>; Wed, 14 May 2025 18:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747248820; cv=none; b=oOEP1wBfJX8cHAySvr5zLnV2A1rQJ+WV20dkNGxiBQ98LmOrHB7N6b6/Ns6l9vIWlJoGtx3/P/EVTve+uVSy4f1MhRCrdBgIz3cNRFu6J1ys1KDJRjjOrfrKrCXZrdRWPkiffDSK2FbpHc66U6dPBpNVUe9qui3pt25pq9TvOhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747248820; c=relaxed/simple;
	bh=DenyVCoE0RAHWPP7ykajv60a+GLIC/b1a2OG1bz8byA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kr6QcRcT7e0vZacZO+A9ugN4dxqnsO7xiDmkQMrllUOkfps43wae5hVC0iRhOKxemooz7eX0+fyoFeaYEeVbYn/H2w0JArSq1Xvb8B4praCC2uSD9wxg9ryCZfRbL/NKasMphCnOrlSpw93zvQW4i9k22r+rLJYTlNQb44+dv6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LGN1rBZc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LGN1rBZc"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAuww2002608
	for <linux-sound@vger.kernel.org>; Wed, 14 May 2025 18:53:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=g1u9AjxY4YHd0zzxyGQLIleU
	CRHdyFyktyL3hnCDzbg=; b=LGN1rBZcyZ6Fb2C93lULqvsXn2Y7OCTNQy9zeHPd
	3qdtlX2oRYfQ836qLHSHeqOUfQJNwnSgjTd8U1YkeMFNjP2EBX/xUnZy1edXmsJQ
	jUNqnPDYUlQUx0CA9ERhLlBCZBx9FC/A8p2X1pAZAlgHeR6gNXWXwzJ13PktAxup
	GMtgaSTpOJ/KzrkZ2OT8gZe4AF3+pBsvW9R/dCK8zWoXbxOP7hA2Bxs+CLCO8eXA
	MAlETUQyovpborVg/Imd1x4aDv0fZEIUEqp4aQWZeSQC83jbMHyUzIm6+fISg/Mp
	1/bU3TU4KhGKi2DymZV41g9xCmMtsL95ON0wF5/LtegNug==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbex3r4w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 14 May 2025 18:53:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7caef20a528so18945285a.0
        for <linux-sound@vger.kernel.org>; Wed, 14 May 2025 11:53:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747248808; x=1747853608;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g1u9AjxY4YHd0zzxyGQLIleUCRHdyFyktyL3hnCDzbg=;
        b=RTXnFxQWWiyMr7334tjwX2waQpQVokXUfYDCOIB2qTLEzrt4QLrsgrlcOwN1FYxKcE
         18W/z3/XOAwGnjUs2DSGHTdRuFBJU3wsx3BP/n5B9VFnHE87lx1wiu8DS5A/pmpRkOWU
         fhNjFAe79BKVA2askcvjkXyiSjvwDqscYC1iWxyeGfu2r/J+5cpAjI8x//lOBGNyOvV7
         NeHSTDYtLQ/pqfEbOK6AlLdtUR+M4qVbDVUIy7j1sY1DKlV1cRucDtc6+/wsVykMqvfF
         YbtegP3ttGtVw2dtpxKobGFUAtc+HX2bDxHIFek5EjiPYcemOytPJrccSZ5La7jlu1qd
         bQCg==
X-Forwarded-Encrypted: i=1; AJvYcCWG0V6qi4CT5AHnKGawmJxjCJazPok8TzqmKyA58QaGFpp6OJRICx2tbAW9r4ENdXTU74qTwFLFd13r2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmfVLK5803Nwpn1RIpOMll2nB5d++zlXxC0yw9DmlRNxwF0siW
	uiqO2SM0lzO4DI2eReb3uXFMf9S90+8IWkS34WgGJknR90VdwLZ2rcbASRyAAwDXUB0azcf9AtT
	gMoa54JHj0OkWHCvkzEWw+Di+/9VDU2WVtrM2CT1rfv5efS4o7u1iZyztyUuPTw==
X-Gm-Gg: ASbGnctknoEDWEvujY2OjE1cziFn0a1MrZonJsMneoSMI9XwPuWYk7rdmF+WcFYifFo
	R57bZYGhceyyTJbJnhd0WKizKmw+i6ANIu0/GbQA31ZkDtZ18tDeEURtQO8x00Qi3y0TxPF4mlh
	8qGFE0bU5ERXXzC5mEs+S9NoFf2/3rvejqjiS9bb5SBRJajKLjulxwlalJgazwy24SfsPICyxBH
	1u2N0D0Xh+HXVbxdzpsI3L0yKCBKK1DVx/8IS1d3dYHuHoZ748BEl4efj5t4b2hBsBPz2DZ7m/q
	4a1rDoOkQncwv4TO4bGDn79Mua3qhnsD7Bd46/wI6KLDIpNSek++JBti7ojrSDOEQwfni7YcC9w
	=
X-Received: by 2002:a05:620a:2685:b0:7ca:f021:4d3a with SMTP id af79cd13be357-7cd28846e89mr557328785a.39.1747248807895;
        Wed, 14 May 2025 11:53:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEni7d5kUjD2KP2PjQKe+EW9a164yH0fjztcPSlhC8TjwdgfR6PFawkMxitDxR1Q62D/acBqw==
X-Received: by 2002:a05:620a:2685:b0:7ca:f021:4d3a with SMTP id af79cd13be357-7cd28846e89mr557324885a.39.1747248807417;
        Wed, 14 May 2025 11:53:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64cd303sm2361639e87.245.2025.05.14.11.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 11:53:26 -0700 (PDT)
Date: Wed, 14 May 2025 21:53:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] ASoC: q6apm-lpass-dais: Print APM port id in decimal on
 enable error
Message-ID: <xtq5rvhihppgmi47sihvz36k3t5zrj6lmuskoevilzdffrode7@nlxr4go7hwo4>
References: <20250514-topic-asoc_print_hexdec-v1-1-85e90947ec4f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-topic-asoc_print_hexdec-v1-1-85e90947ec4f@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3MiBTYWx0ZWRfX1oFgwJNbt5ad
 KgWK46ash9dae5FRNm99+tcbD9KAOp34ZULXq4tz/cFdZxCj5TYL1NeHVAjTdSSyIzhZKX6qoBr
 8PPCdpdwyciaa/2r4MSPChU23ZN01inAvZQynOE3qwPrn91abmKc2BjEf443zLgCkJNqp+HSejT
 JJirp0YxhzEjnsxY8OHZxtRgTUSbkTV9QpGwoyB3T2jby1meHyyCKyVkGswIyy9kiO2fws5zIUV
 EPR3OwA0ZZHuHemqz5LmlHVRAUPxfb3pOS0NEWZQ4IMx15UzocvnBZwUkv74TuPBk79CYjenf79
 Nzu9K4aOPNjxrZaithMH8pumX0F6tTTT+XSpOv81gReJbK/F4vOp+oWKqgxvdKhb0vkspssyGZs
 WFJO1DhVBZAKfepYX5OoK0j+gJg9AL4Rg2S/buuPoDh740hWsYLeW/UdeBVjm+0x0Q6rXbB3
X-Proofpoint-ORIG-GUID: SaHTrPBjURxL-w4tiHA5sdECue1JYgyu
X-Proofpoint-GUID: SaHTrPBjURxL-w4tiHA5sdECue1JYgyu
X-Authority-Analysis: v=2.4 cv=IcuHWXqa c=1 sm=1 tr=0 ts=6824e6b1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=lIfUitz33hkrLK1uG6cA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 adultscore=0 mlxlogscore=725 bulkscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140172

On Wed, May 14, 2025 at 07:53:38PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Change the port enable failure error message format specifier to make
> it less confusing.
> 
> Take the chance to align the style ('fail'->'Failed') while at it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
