Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD6C309EF4
	for <linux-sound@vger.kernel.org>; Fri,  5 Sep 2025 16:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757090719; cv=none; b=exPOs/yXJTcNgPkoX/LiiTPkdnVwPH7LEr4XhpOKdZmvxA+tIxH6UCy1cB2Fla+yV3VidKY/G17JJ2DI09+jxpQaJ8w5K17DnyBYp6UW9mKBYGwkgiLO9BSEu/srCl7VYduZnqSjYWGahzvmUls7LQO4BUFXRVnP9oJ3+MmS+I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757090719; c=relaxed/simple;
	bh=mufO7WhSL863WQc5KKR6Rrp1gwzSJEYfE2KGDaW8J34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lx39I8odGPWl6zAuHuPxBQgka/SKOKXcP4Qsho+CGxJXf7Obm0kp+G/rZ0/RyFX/H6iy8Yg/3Sei7NfGsIkziDVfXbN3fpKuiFl9/5JNWf1yfUHTYopLHuwvLy4EAPeusEE0FDcYcbxagOnLuXWiqR6EpSOOXsdlwOqr1f44+ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gpxNGdzG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gpxNGdzG"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 585GVGQd031105
	for <linux-sound@vger.kernel.org>; Fri, 5 Sep 2025 16:45:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+BB3ZZvnv00hg2yX5Hc+9/g3
	ygGWqUcgRjmxZQpicHU=; b=gpxNGdzGUz1nT34yntMjnWt+kyDMKFr/Dp1PbzzE
	NjWJiCVq6wu1N47RR96dzJJGA/w/D/1kR3nhGLQHFnsJMrZ9Saw8zwMhnrEVFYsc
	86fTtI+1JVvt29/bF/havTUBEKdeaz8IBEx1BwkYQCu1GdZW7G55uUM3ylyrU6n1
	v7vYEasZZEmu/ewz2XuQRv2TyrCnuk9Z/UqLaWpLnLYYcQQx3NkjGqkp7VfCZ8eW
	JRZGFm7p/d4hWcDuECWtpS62meo1bA2wOaqpvJTXJ800wCibnJ3dz7q2H0ZyztfS
	UEgNiegsJk/kxCDKbq+nrm8ENdpmBh2XbGrqCW1XflvasQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4903ev01n8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 16:45:17 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-7296c012e7dso36952276d6.2
        for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 09:45:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757090716; x=1757695516;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+BB3ZZvnv00hg2yX5Hc+9/g3ygGWqUcgRjmxZQpicHU=;
        b=Pq6p9rLrD4yOP1yn+ZAgF442JvzI0pzbIT9P0p0ZR2daMmCXjDA6b98dAteyPxVVKn
         LWCN5YXrPMDni5rT4HH2D1VQkhuROOECoXxeI797YtJn71rK4Oal6zV7Xr+1e6I0e/+o
         9+Whc00birpK13ITQMtt4rsJEnO4MOOn3C88upeEdhEhs8UK0Nt1i4FQuMRMggKftz+l
         Zi3Vca53k5TBBz7w0dF+bG0qXeiDR7UKdJG4XMmKoQZvTxS84DtBzZ6f2NRQouedQwzl
         mvkYObYNGFG/hzFBzUUHMBhoPgnfd20RqabHZN+g3ZGRkJeG5FGF2LWR6HotySeDqjpI
         NR8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVvW9hbtPVcTlK/sailiyxCyXGH/PO7JkRX3d7K7Rqn6K/jXOmWpakmcdXZdP+0uI2YsQM0h13Xkphdaw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDDmOJ84En91HIM/nb9tUIpAGkwxV09u3yC9s/MLgx0Gu3vuED
	oKaPkgSe3Zn1hTSrxH1YIKUig3kGQDe1fGA5mtOVLuWZhPfTiXUTv8Le7+Z2ciPRDrSpDqoURLp
	lnl+PekCPrdeju93CVGgax9AJTnDt18HAPdbe21KvNmhkx+CEPZu+LFdHsqkoCh3ryMRcTyC/9Q
	==
X-Gm-Gg: ASbGnct+3BLpCuVDMAWbU6I9OTvNgG21NVcA8r54roqI9DxuZTt2LB6TpH4M19Ehn21
	XlREioV/iPgZthGlUn29l6Dp0r/O+u4zJ2PW6YS+bEYGvGVzmHu455aNdz2kZ1la/o2Y6TTdjzp
	xYvTuWeH86ov6OIdBzTCzxgz0ci5O3e/T+BRCZjFL2KL9rBvNKwyvq8DwlvrUP5el+zNKSYoz29
	xo5jFWxVbZ6ZRLwGaDkKwQ8Rf9MJiypB15Swa/N6L+Z+J+k01mkCqZp8zHqH7L68v1G9afOp/PX
	kei1CIzJnyksHNpbgKZQr0kSCSqZYFL8ROvfGf5aSf1W3reFAixe681A2/vS7qqrPQyUyBagZ+H
	VVbFLy2eIHK9ZjPLjfEGwbCbNeRvgBtRMxe6543AqJvgeGWiGiTFN
X-Received: by 2002:a05:6214:21cb:b0:70f:a719:5666 with SMTP id 6a1803df08f44-70fac92194bmr255761986d6.61.1757090715892;
        Fri, 05 Sep 2025 09:45:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHACuxE4FbwHplU4elaXyi4HGgfYTCOOuIKAhIyRCUSvfhISyirF3xqoqTDPYeTt0l18tebKQ==
X-Received: by 2002:a05:6214:21cb:b0:70f:a719:5666 with SMTP id 6a1803df08f44-70fac92194bmr255761626d6.61.1757090715396;
        Fri, 05 Sep 2025 09:45:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ad4c63csm1858374e87.143.2025.09.05.09.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 09:45:14 -0700 (PDT)
Date: Fri, 5 Sep 2025 19:45:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org,
        srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, neil.armstrong@linaro.org,
        krzysztof.kozlowski@linaro.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v3 11/12] ASoC: codecs: wcd938x: get regmap directly
Message-ID: <4jj3ofvjiqzdyseezuhup6ig5hfio4y3siqqmxhvpse2yyvnqm@xa3jtgee6vpu>
References: <20250905154430.12268-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250905154430.12268-12-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905154430.12268-12-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA1MDE2MiBTYWx0ZWRfXzJe6+C+3V7Be
 RIBcYqgGT3RC87ONpFrWmnhkKQk4OYjmNHVhxBlSk3kcT7L1172YJ6QlH3EVt3WQnAJo4Rq+H2N
 5Ke757E1/AVy2ljh3CAddWhgpVTpa8OzfHtI4l/Z50e4Dofs+KwzC3loq73LFiGT4aLyEmrMAia
 uceF5dbG7Cw89HbaMSwGG8+g+blMoMqDPWvMCqb5zeNPz9PGC1yv9fqeo7O9YzBQClzSOk0wlEW
 Nb0N+e6f6/iorRO0VNjjjyyLMhSmBF273BDsXDBpigEt2yXseiITDJfX4Uum6GKqqnUVcL18Dsw
 m+uS1sBPEKiiSkM8uDgg7Al35BwHmjClYdyNx2K5bJ83cKBgANQSd4quuUZ/c8OhULIpl2//DUn
 dYdU7jDY
X-Proofpoint-GUID: qFNbREkGZOkUaSrL5ESs4Y3s4bg5l1er
X-Proofpoint-ORIG-GUID: qFNbREkGZOkUaSrL5ESs4Y3s4bg5l1er
X-Authority-Analysis: v=2.4 cv=drbbC0g4 c=1 sm=1 tr=0 ts=68bb139d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=azzZ5_6gx0kgBHoxRwcA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509050162

On Fri, Sep 05, 2025 at 04:44:29PM +0100, Srinivas Kandagatla wrote:
> Remove usage of dev_get_regmap, as this its more efficient to directly
> reference the pointer.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  sound/soc/codecs/wcd938x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
