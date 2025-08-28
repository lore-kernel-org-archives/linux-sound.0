Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0CE2857C7
	for <linux-sound@vger.kernel.org>; Thu, 28 Aug 2025 10:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756377144; cv=none; b=ANB1luyA9O5MKp07T52yUT99IqeLCACGAiOOkYZ3uFfaeo/gBLsdRuQ/Ug3N/4o+i6i4zCLA4nF3sAkRPpGJYwzydd+es9IN+al5ly6VZY4atFYjsWVuhJpVmhHoHPfkWNKdLNYpCle+lTSL6MQmbhx0xo6zhtjO+uW3JrDK3pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756377144; c=relaxed/simple;
	bh=dt9wxlmAwg0N5A5qd4O6cT01R165bdElqjuRlYhrIZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JvDS6E/jSKMKns/k1OG8quk/iJPSuCMdZIC2TJH5UjNvRxyb/Sga/BwhYWneqWEes+AP8RTOe7SgtCfsl49kUMR9/h6+Hi3UEyOrrXDLOBHTTmHUSW1W9pYeRStN4WrjX1d9Jx3d9vJyOyTHcXa+4QAuX0Lb7MfCLA6e770V+2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IeHJaJ9a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IeHJaJ9a"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57S61VB4027480
	for <linux-sound@vger.kernel.org>; Thu, 28 Aug 2025 10:32:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pF1QVg0WiTnUKPs8/wG6SRgz
	3ikdq5fxvM7PGeVRu+U=; b=IeHJaJ9a4NYIPb/H4JVKvsKJhliLe7FlwSqYJ2ls
	gMrbQAuyXe1VhxJVUhcz+1aTlrRcLXMBZF2mmFBiEpu1P7KJXCO+h5B9/6+R1AN1
	5h6sD7ED1qBKixhFGSIxN3dn+AN+tAAKyqasMH5u1cbBeCoTRgE9f51zs/Lfpdf4
	YNCMFOmL4sySKZalRsnbcvsurPvL0vPuah6RbUDLxcCFSrFOUMOFRYlsCa3fHtEk
	gIydrKMNqaG6QdOHCAUjB5lPO9qtwAro0ElKPt9pLu1eBvnJrekLw18++XKRFzTQ
	2BaavOZZzA4gyX/k4WKWveAIPyUgox3AjFD/fwVdGamDaw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48se16xwb3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 28 Aug 2025 10:32:22 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70dd6d25992so19097656d6.2
        for <linux-sound@vger.kernel.org>; Thu, 28 Aug 2025 03:32:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756377141; x=1756981941;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pF1QVg0WiTnUKPs8/wG6SRgz3ikdq5fxvM7PGeVRu+U=;
        b=v7F5uc+9pfZFljxDAWcQFIMGrNv45OgS7ONsYcr9KJHI9lDsSCX/U/E0T6tQDOA3zJ
         5DijInbn3gcuJDRqyvL0YlfPIf/CD+N5qU5k3S2/9WFRY4EXeq7BDIVy59pLTAX9aRxU
         cTjEbJU+sNvD6V2lXsdzC7CHm3FM4y+i68w+Q8/ajxFXS06xIZyIWNdTReUohDhZAfmZ
         +cDYr0735KhtWec9JBqLzXl0hDwyFVLkhfzufy43ROAWNpLSlh7Hk4zPDuSQPXFXwSAU
         XXUkQ/Oa+xHxhSweJJTETgeaGtiek+1eUis4FZVQkXVea1e4rncyq34oEgoTHqJWBKGt
         ZvDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXq9fcnjTk1jwin23sY+2vvDLFxy9rMxuKjuZCWYakthErF/TkraItGpPegKDYWDsSe4Y/A1X+hy5ypWw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd9DrtsOmtrHxUYN58FzOteLnxobkZn6GDESSGcuhpd43gcJ5D
	MpWfje+XhuZpLsGWqVwo4lUtSw2FWkXkYPIoiRsQyNBql1LXrmk3csRX2BmsBuaO9Cy4z8uauy/
	zI24Uxv36ix1n9izZHApdLb0C92E5alejrod/mnfWMcipvdOUIqQsIHcGEmx4bfPoCy1RMsD4TA
	xq
X-Gm-Gg: ASbGnctBh67s/gbQfaA3OOHlCukTBkCjOn7keLH/JD4qwfCWWboiNtoOZ9dt0Oh2clF
	o8t8U88PwxBiRMVIu2kP5RRjtBULHmWoW8EO7mjT7JBjmUzkk9vW94eyufsopzPc6l7qIM95dWB
	B2+62YWIlvxgwiYBAV4njE1Bb68LnyUlGg+ddBid0stkIT1hVUN7xeyxBaUuHUxnuvR9zmwTh19
	dyFACgyeLm3kC2saLuU43yuoXPVuTD8BGI1ya+8/vNIDgXjoQlihrCb7uBgtcP96J1nufMYDnI3
	nv+zkIc3D0/DkoQLfF3ABsSyby0ywFPkGJt4c3i5kf2ni0LZW771UT9vB8ZXzs9QWVldHa/hagb
	F3zlPTnOq3OTqB16J7HOvkuMf7YhvJHkS07fBIxe6xmerS8Vf3wRP
X-Received: by 2002:a05:6214:d6d:b0:70d:fd26:f234 with SMTP id 6a1803df08f44-70dfd26fc03mr810016d6.59.1756377140462;
        Thu, 28 Aug 2025 03:32:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9RHmS+Ep97yyR3FC0zlcb74IJbJ/77cI8edf8G9P9RRNhQsn1iB3HWlX/2n/MLMZQ0ByuXw==
X-Received: by 2002:a05:6214:d6d:b0:70d:fd26:f234 with SMTP id 6a1803df08f44-70dfd26fc03mr809586d6.59.1756377139998;
        Thu, 28 Aug 2025 03:32:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f35c9a063sm3239190e87.112.2025.08.28.03.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 03:32:19 -0700 (PDT)
Date: Thu, 28 Aug 2025 13:32:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        "open list:QCOM AUDIO (ASoC) DRIVERS" <linux-sound@vger.kernel.org>,
        "open list:QCOM AUDIO (ASoC) DRIVERS" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] ASoC: qcom: use int type to store negative error
 codes
Message-ID: <o6ui2oopflsxb7dyrdet3ti57zgms4lywrhibyks64qk3tmh53@vhlrrhpb4zr3>
References: <20250828075406.386208-1-rongqianfeng@vivo.com>
 <20250828075406.386208-4-rongqianfeng@vivo.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250828075406.386208-4-rongqianfeng@vivo.com>
X-Proofpoint-GUID: 63-ArBtc_1mYfSH_lIIkHW2HlhdG1La5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDEyMCBTYWx0ZWRfX+MEIlp89UZum
 q7EHtUO+IKbTgoZQF4rlP0A3Jiuh7QLJzrb4RMX0DCZrXEDaR9UfvPdbKPtcHF8c2gbRRQmYTMf
 GYsVW33xdiYbQkJIc6Qy1F4oGVzZC859zHS0N/eCPZSlNHj1qGkA0jlPqfydWkKAR/x/Jr3qJGw
 y/C+Y76c9YyeiAfX7cWCRUhh6rtfz0/PsLkdxh/02g0z7Hf1gkM/Q0ptTdOfAsxK+SF1KyNlAZw
 GRU1m2KB0kcGr6j6ZNk74wgcQGtnXZ00zlx3NgMVCwcXg403VZPFBBTLAx56qIewOmZof739rbr
 3+dWxAJ888be4/DCsF2EefWBmh2omn/TQ/i1jFD7IysFuzt0LDFNkq56scmcWQx0vEWawWYcZJ9
 CSPrCJs5
X-Proofpoint-ORIG-GUID: 63-ArBtc_1mYfSH_lIIkHW2HlhdG1La5
X-Authority-Analysis: v=2.4 cv=CNYqXQrD c=1 sm=1 tr=0 ts=68b03036 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=1WtWmnkvAAAA:8 a=EUspDBNiAAAA:8 a=IPwh2cHtyxZVSPeiaZcA:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508260120

On Thu, Aug 28, 2025 at 03:53:59PM +0800, Qianfeng Rong wrote:
> Change the 'ret' variable from unsigned int to int to store negative error
> codes or zero returned by regmap_field_write().
> 
> Storing the negative error codes in unsigned type, doesn't cause an issue
> at runtime but it's ugly as pants. Additionally, assigning negative error
> codes to unsigned type may trigger a GCC warning when the -Wsign-conversion
> flag is enabled.
> 
> No effect on runtime.
> 
> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
> ---
>  sound/soc/qcom/lpass-cdc-dma.c | 3 ++-
>  sound/soc/qcom/lpass-hdmi.c    | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
