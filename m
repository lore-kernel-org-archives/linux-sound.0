Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11B926FA56
	for <linux-sound@vger.kernel.org>; Mon, 19 May 2025 11:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747652423; cv=none; b=np4wZSjGEvv3x+bYa8U9trgyzh3xymswVSkwMlk/2xOPpAn18V+aIf4Fs5y4hpvTU6NPsUPl7jC9xxIkF6WtW9yxrqEnGwWMeDUrF9veZFEdYA51y7cWNyGLjfQBU1/qYsck58/WnPQEntAdp5P3Pv+V/6TXe4VWdJRfIOQe+Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747652423; c=relaxed/simple;
	bh=fFmjqnxgeSmiyzEOPvUC2pZYL/wVtsRdLROklYyM+Fo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BByyegPUfqAmA8s1cC+nUOdFfNxuaQ6JQogqzZcuxdMZ/kSsdUp+Bbc7Bqt5t02x37HnH2RK2UMOBEiLW17IuzRqigRCbO/h/jz/VpBELTsDTO52CtzInSP6G89ySyho2xdS38Zb3RxVSvSt4k3I3IE5JMqOIbFMvlNfIsNZN04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h4FeyJbI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h4FeyJbI"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9ip3p008568
	for <linux-sound@vger.kernel.org>; Mon, 19 May 2025 11:00:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AR3Ehus8X3xdnq+Qo57YslQ+
	CRLb/Q5bFilFIz2nOhE=; b=h4FeyJbIQExSvfT7G+6p82PPzQbsTO68g4UGOPX+
	Y2/tcD9XHkpP8WKTnJAEsmrC6niddSILbxN5ENl6HC20Kaa5peeX7zFh8wLY/WcT
	0Jl8SxYV+0jFcOG6YmgygBxLGm5AzKHP3iHfUrKV+vYjk1+hdaDuYjqNfhc+lycC
	aiq/g41myBF9oZAeeOW0r+LhIvymBtFRajUgRGRQnpNuuL1bomkzP7BaMR1+he4h
	LvM6C/8umJarqhJ/uXhUryv7wGVb9pdOTAua1AEW0bcMsBX6dsSeHHFAC/t/xezC
	EiMJ5uZPAxLslyOiOOZ8yVfn44WxV8bARPFwnQlyJStqVA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjjsv2fj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 19 May 2025 11:00:20 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8d8f77d4fso15431866d6.0
        for <linux-sound@vger.kernel.org>; Mon, 19 May 2025 04:00:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747652420; x=1748257220;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AR3Ehus8X3xdnq+Qo57YslQ+CRLb/Q5bFilFIz2nOhE=;
        b=fZay7Wior5mngv5bLlx/dFGv9bvXC/2COgZkicYKZQ0ZSd94112d9ov5zKFt6QVLWD
         hCl6qv9SSk5+5lLMSNA6VVU6STIrk9jDzsqn+4D91Xzdg7b6WIFSzsSl5M6WqDKIe26/
         4LpG39E/hbThTLElXoMQKQlCSgRwgEWVnhB4ww9Bm9EpHnPyOPDD+dALg8sNUrpQap/E
         KW9YAq5Eur8HQ6rgCqR43BqxlCVRpT7azwaCmypM0ibZCxmXvMAauxRUFUM4W/uH0pCQ
         LVbpASZ09ZC/U1AUpQ/dL9FPbUUHELzoTgrkv/uESoh0sJWiLjcgjpTUBadFZP58YxO3
         17cw==
X-Forwarded-Encrypted: i=1; AJvYcCWzCGwip4OznLHTwLz9AfcP1+Ku3XNpQYqwNKIltO5unCakbCi3qDlxLrhzXHiUvjbjk0H+8znzkTEqsg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBL/9kEOBIs3hf26QcJeA/wVD1Of7pUeKQ5nENOLFax3XhpiBm
	/ushfCoPc8gogR5yUz1keKEEFvvd3U3ghPW1fGCiNsg4zuAoTnyTlmEHbtr23eZ0bBZDAO2LCuu
	CNKIaD7Z/P9BpqqvV36g3pkUgzkNo5ZCuTns5KV1sJD8xb1I0Sn9K74TK1aDqZZxeoQ==
X-Gm-Gg: ASbGncsAKXqUjdFXE9UANXsiLlCutY3160yTIhpByL6oim7AXhMolk+M/yYOpmxIpLN
	okbu/JXB/W7Zdxs0bD0n9/DBxRlPm/qpFc0OLpseLkZgoXpGsIYif0ZAzx6os5nYrk1thxsk65p
	HikBFi2UGPXvHG90XWGd+3H9cVMJ+iJp4jqzedc2Pi0rzxpSGayttXPXKotxHBM4CKwt0rmA7/w
	e/ch2oN8mkhZmiVymKD3G85kc2G6yLmVmhclWIQJCxfQdTjFJmSevOM2/Mf+V+jzuzPtaMRemz3
	mi9q+GGdi9gybpM7D8jphbndvJdpsJ0n6CfflK+hy9OMzyrCzho/UErDerxPmPh5lUI4yF1RBfk
	=
X-Received: by 2002:a05:6214:cc2:b0:6f8:a6fe:24ed with SMTP id 6a1803df08f44-6f8b082861fmr194273996d6.10.1747652417993;
        Mon, 19 May 2025 04:00:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKLoOs77LAAd2FaVlz7S0E17UdAYw+X90/56bpj496u2rqnN6gHMaHcHAnyDBiwJmiqq2D2g==
X-Received: by 2002:a05:6214:cc2:b0:6f8:a6fe:24ed with SMTP id 6a1803df08f44-6f8b082861fmr194269906d6.10.1747652415358;
        Mon, 19 May 2025 04:00:15 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703e7b1sm1779835e87.229.2025.05.19.04.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 04:00:14 -0700 (PDT)
Date: Mon, 19 May 2025 14:00:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: srinivas.kandagatla@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
        perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] ASoC: qcom: sdm845: Add error handling in
 sdm845_slim_snd_hw_params()
Message-ID: <e5k5zslz33in53ivbqttnnkt7whvzfay4uwxmi2o3m2a6c6ahg@5kpjzcyov35h>
References: <20250519075739.1458-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519075739.1458-1-vulab@iscas.ac.cn>
X-Proofpoint-ORIG-GUID: eKuJk5M-bQ-i6BOL1nQdLSyq9iB8Nz6Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwNCBTYWx0ZWRfXy96zNEARgRxm
 wVl7Zwh4HUHcvhkqJkRIoE6eOQhE0/Yvsdb5erdzdQu1C3qTsLRqGbBdHGQFETx5yzVg1RNO6zL
 oeAjQBrnMx4QUqQLxeswQsaohOjqoUpOrtBowABkJNMYntxdprDA/5LDS5hjEJmOjwgarvzGRSp
 opk5tLbWr6O4/+qi8WbvJPk3IZcf8nbQcMMzmqsmpMt/1INQnNHRocp0FE6B+SmJ4f3DYhriDtD
 id2Swhd52/xQT8BBi4LohD8ue1WDdIe9fL/NpC3gHiYxcHgg9Z7aP1ssxO1dy6EIxVh3asOPZci
 z10zHOnWUUqd4ZufpOlFjRuextyGHybWUawUO4Om+7+FiYkr3lb8/2kd/qS/DwI+bdWNoY6K7Xb
 r1d7Tw3ieGOJrmimTNlzKNQ3V7yqp81hZDaqo4k3lZV1mPc+g4cKWuI3Nfj4elEiepVHHOLe
X-Authority-Analysis: v=2.4 cv=K4giHzWI c=1 sm=1 tr=0 ts=682b0f44 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fLaHX3QtLFUqQw0t1l4A:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: eKuJk5M-bQ-i6BOL1nQdLSyq9iB8Nz6Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 mlxlogscore=698 suspectscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190104

On Mon, May 19, 2025 at 03:57:39PM +0800, Wentao Liang wrote:
> The function sdm845_slim_snd_hw_params() calls the functuion
> snd_soc_dai_set_channel_map() but does not check its return
> value. A proper implementation can be found in msm_snd_hw_params().
> 
> Add error handling for snd_soc_dai_set_channel_map(). If the
> function fails and it is not a unsupported error, return the
> error code immediately.
> 
> Fixes: 5caf64c633a3 ("ASoC: qcom: sdm845: add support to DB845c and Lenovo Yoga")
> Cc: stable@vger.kernel.org # v5.6
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  sound/soc/qcom/sdm845.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
