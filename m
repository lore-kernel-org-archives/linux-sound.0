Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCFC286D40
	for <linux-sound@vger.kernel.org>; Tue, 30 Sep 2025 19:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759259824; cv=none; b=Myvp7E51kbyv/CKj3/Z1Zh1MorthDo2K1riOC57Um8HdGQSxzyh5321JY1LJYLvFdGcnL01KJeBgnvdtGFQ+fw73qWyHfU9uvsIT11lidm549wEdP46yQly/ykQA502T82v+bOA5XIw6pg+/q56YulUWqvjODLPBWs6qGCj9jzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759259824; c=relaxed/simple;
	bh=44UG9dRy9/fwmbXTFNYj/VESWJLHlVWNqviEeWagbFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LNdWQRp6V5yUZ+OmrRl3mStDerbQ/JpqHWSSGLaz5D6yKV0ngFZanl1YGODDAxpbTbBF9oifVZnhwn+V2sgA94FKiDKIaOfsV9NWc0LQsmJFJ/plmMMzmCS5FWDibjYz5PVDyCZBaX4KQ44WZvhf5JivFmqqfAdGj/Xu4wyKkTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HeCoswil; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HeCoswil"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UC72Ps026871
	for <linux-sound@vger.kernel.org>; Tue, 30 Sep 2025 19:17:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fIoZL4IX42meIGYJZYMC2O1w
	w+tUNy4ioZpD/pNofyA=; b=HeCoswil0oy1BaLEp8q1C2pWmz6i9r+lSHqgt1dT
	Qkx0d7Z7hD5sp4Wrx0iw4Mm8E4c6fMaB+zTCM761UN+kV3XUGcx/KZBsMgio/Kip
	zFtAdzbBAyPBkc0+nyjtRYbd8RhTS3KQuiDnljECzyVt7wuCYE9jGabdPZr3ObYk
	v81OcjQhpJ/9Du9FQN9tzl7XvywEzTn4qHHwx7oq2feYHNPI4jlVaNs3rF+ZmJGN
	KrgGMxiWXjjKbxm7cz6DS9/U/AgZ3Hsu3lofjw0c23td9txPNLj41JQURqenDRD/
	22yu8cegpvj94L9y1IXSdcyYXnoeoj2BPPVk6ZhSInTDJQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49fyrf3s9w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 30 Sep 2025 19:17:01 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4df60ea7a1bso62017081cf.2
        for <linux-sound@vger.kernel.org>; Tue, 30 Sep 2025 12:17:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759259821; x=1759864621;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fIoZL4IX42meIGYJZYMC2O1ww+tUNy4ioZpD/pNofyA=;
        b=oyhj5anMP1Yiw1rjhorxKscV182620RdwKEvQXMmL+xt4sYwc14JsooCQfsHxl58tI
         s1yESiIlkwrePcSeYpbfdlJiJ9yP8Xh2Iivnt9bbrdytTsHKmNNTqYq02+7KYyDtz4Nr
         AgCCa0unx/08H3kFndpQuIAioCzkEfp5ivKAxFWh5TLCRURb+2SiNKQeQEgIdsd+4H9e
         +iC9L0t12tAqXv5qSsOQO/kAlGITOliJznofIGnvWvFX1lcC5KUq/hUAVt2DHiCtoTjB
         WnCF5x6W1lek93LexbITnN17SJ1Oog+l+82pxIlWZul21+FqZnqRyHVKeg03d8UTs/9o
         4vyw==
X-Forwarded-Encrypted: i=1; AJvYcCUTJu/HNdXHIdahyKbmkHork5ecwDZ6WORWxYUhy+ti2h7QxrHI4VtvU1r3+4Y9+vbQ6T8gQAdBhyfCpA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2uIQKNDckP2JDWNTRNWjb5kcF2f2Vyu1ZmEI5ENeYGmuhYqvB
	civCGfZeXkscVrNA1NAC7QKMv46vToONFFug4hhWpgMd9byUeucZB1wwRWvGuHTJz6tlB2V+Nlr
	sP4yZuohPL0gBtL+W9JIcSpIo2t3yG26sGdNOus+cYmaC/yrnCY3wgeMZkI9SpNWk6Q==
X-Gm-Gg: ASbGncuCj7X5QYZVSJ+pF3NV31OUbMAU1a3x02zjQFRHz3VdRrYFGMrTJS6aQEShV3B
	y0y8QhnyAfHvvj8toLlaJR3sKbJXPduyMBxKfiJtD9YEPKEnGxBQWn65sC1TIQEzyT88Jy7rhV+
	Ts+jNBhcFYhtI9i8t7rzBm836YzSLUPy46nIGbsTXwerWdcF7G3FCOj5aPDE1ukpAPXXJowGnY9
	zI1TgjS6dQZpCCMNLlOBqPtqfs4kbRAFjj8qkiHjJBqmZbWIqzeq99OVQ51EYHt06T22bMM2FKa
	BSA8VxhOpP15T+JEWEa8YKd9mwHGeTe1b3vWEYJYWUEGElfn3/3+M7Yt6QcYuKmvFIrwW4FvEux
	W6zBiPgvXxbk41p1RetR/fmb7HSU1Ssk/2ZKrtytBY6ptCoiK1eNgT0htMg==
X-Received: by 2002:a05:622a:4acc:b0:4c7:e39a:388b with SMTP id d75a77b69052e-4e41e15df77mr10119711cf.47.1759259821082;
        Tue, 30 Sep 2025 12:17:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOjGw/13ibdEaq67tmXZnXJFrkmO3DlfDDREr0t+56wazs2jNMn8OyuMT31Gg9i7tKZgg2lQ==
X-Received: by 2002:a05:622a:4acc:b0:4c7:e39a:388b with SMTP id d75a77b69052e-4e41e15df77mr10119381cf.47.1759259820658;
        Tue, 30 Sep 2025 12:17:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583166560d1sm5130604e87.71.2025.09.30.12.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 12:16:59 -0700 (PDT)
Date: Tue, 30 Sep 2025 22:16:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: TangBin <tangbin@cmss.chinamobile.com>
Cc: srini@kernel.org, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
        tiwai@suse.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: codecs: Fix the error of excessive semicolons
Message-ID: <dxuyn3sa55f7k7ecwhxi4v3y6n3kw7nyftkrbmwt2ufobya4bd@ipdy5bz4yrzu>
References: <20250930094103.2038-1-tangbin@cmss.chinamobile.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930094103.2038-1-tangbin@cmss.chinamobile.com>
X-Proofpoint-ORIG-GUID: HPri3avXD-4CdAlSfKNyTkOm8-axZy-L
X-Proofpoint-GUID: HPri3avXD-4CdAlSfKNyTkOm8-axZy-L
X-Authority-Analysis: v=2.4 cv=etzSD4pX c=1 sm=1 tr=0 ts=68dc2cae cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=R5C9hjxsAAAA:8 a=EUspDBNiAAAA:8 a=foHylL8Yi6giCiIZhfYA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDE3NSBTYWx0ZWRfXzUJ2IO8XInMT
 KY5kI4T+OTWgYFAHbJK+Zh+qCJo9fIpm39QpJ8zs95PxwEBZwlgvUwwAb53IeaSC6QoGc9H9wmA
 0BEgPeMKgn9cPP6jWYqlBWwyOqiw7ayfexCz5Ig9nfDp0TpioRiBceavU2qNs65PwIJ694pvSgj
 cylP2iyXXnqdPJdBv+u92nvEdSQji4xLQbRmOlB4Dhb7s7fDlxo4s2Xj1i14nFw+h83++fGwcgb
 wTKD4wrwRo3JMtwtxIQD0aAu4ZKoad7zvHl11x4lOIwf+JNJ9jKVf6ZOiCsyk+RYXp3FLIxOE/3
 5OnynwblgBM/xVJnb+5a4ji9LlX1CfgUgFyY+Qen19GwAviMJ54kjW81SJCo6F0Gl1ruPNPXYOO
 f5HByZfyzXceDRzsGsdplC2LXnK9IQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509290175

On Tue, Sep 30, 2025 at 05:41:03PM +0800, TangBin wrote:
> From: Tang Bin <tangbin@cmss.chinamobile.com>
> 
> Remove unnecessary semicolons in the function
> pm4125_codec_enable_adc and pm4125_micbias_control.
> 
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
> ---
>  sound/soc/codecs/pm4125.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
