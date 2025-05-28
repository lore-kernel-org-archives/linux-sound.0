Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C0F1632C8
	for <linux-sound@vger.kernel.org>; Wed, 28 May 2025 16:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748448867; cv=none; b=r8kLJwEdQLo2JTnL3yXhFqEv3h1WPZwNUB8rlcgaT3RLLwR+5f9HI0cpC1n2mbJt/xJDKbH8jbaj1ezUKhA2GCr4EXZXImvoapRPSHb3g2DMQEDbhx+RYMOIU73OmYyY2iVm40pmGjmKMRdp6+n7DMTOtbRJMuhr38UbTWbonnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748448867; c=relaxed/simple;
	bh=QJdyxYVj5zDlcJECQEtZD08vxWZcLAjaOvhtB+EnjXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y3+6LtfGzq+I8BIeG062Q5HKSk6FBplhlizH9vtu7vBBCPUMuAj8VOvAG7sqJk/zUwNz/jEsxWVjk7SYlubZAoAoD0IjknsGLyfkpyCiKkc2xsLnWmuvt2oGwf8sAk0Obh49RXqZweWL9Dzd+u8X19yuLZJGHezZlBDWzH9j7MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TmCwf+/Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TmCwf+/Y"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S9HVsG016904
	for <linux-sound@vger.kernel.org>; Wed, 28 May 2025 16:14:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LB6CBliD4k5uqB9EniBQVYzk
	+cEcLB4aVJE1tbd9jHk=; b=TmCwf+/Y8y/kX9iYSyiIi2OD2S9H3JG4G47xZjuH
	ERb/bUjy5JF2WBz6EctGhG8VUpcCBpPFcbSCOvtDeLEFlm90TrdeJbpE0UNnRtBP
	3GmBIZsgU0/KnELrcWWWR1yU3Y8GqOnrvBAiNe76iohXDKVKhoWGgt4arjKEMQFD
	nWLc1xWOOe7ZlBCcVoKXRvOVg3cKV9RfUQPZpO2sb76eA9AQXGpJjgpA1rebdpZW
	z7NiidGLcnd/9zeKsUYg8KqJD1PI7QoZQauFY02doAbepxSbOhwumau+dCvBJmeA
	I7G1RR8lAqJLb1ACsZ2NW3YsKw2x2obsy+kW92xJA9eMXw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46vmgcy932-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 28 May 2025 16:14:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5e2a31f75so1470864385a.1
        for <linux-sound@vger.kernel.org>; Wed, 28 May 2025 09:14:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748448864; x=1749053664;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LB6CBliD4k5uqB9EniBQVYzk+cEcLB4aVJE1tbd9jHk=;
        b=E1VRYorLAupp+ox8IGYDzAWDVg+jXvDvGKnFsWAlL4WTOENHm/nDbduKtZbygs9Gxz
         Gu+UrE6gvF9Xk9Md8Rj/sQCqlQ1omPs3r/of3oIV8h8wsWK/0buvy87z06OyjQa4YCoq
         qo873BDBWt/N7e1i76BXcFukooEdldbUl8jtVWfUDd/0+bnF8nvNda/B+wVEF1Amrg6y
         j2yCbDCAloO4QT8O/s5RF9Piq1Iv36DqbkRIxrhAItkWJLhBZs4omKyDeHhv+nusdBle
         GRIpb7VSoQi7W9HvbkaKHPE8hS5oedU7OZD2Acntc5N54FSOB7K8aN3uyVRQ7dAujSYi
         UC2g==
X-Forwarded-Encrypted: i=1; AJvYcCWsnPVj+ApyTzBUG48YFotHsbKZ2mgRDxRw5f37iGRboO0nhJCS/U9WeAHSKaPiLd8JR9nKg95ZIiwiLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdsCEYknvDDbAr7qHsadlNqwakLhXFO0aq8uImrhbl6mbmIaKF
	5WNYrlKDOyMcJaA7O2GpPnhlD8IC0ON88nWRS7oG7DNqhi03+D3kCjvKHdvxw7XElE6Ey7gNeND
	OaD+X71lqCI0sw1nhWDWiaPn8SZfzWeMmP4tz993hlYC5S0Ua80BIPq51oATsGo2BAg==
X-Gm-Gg: ASbGncs9W3k6iag+JuV3rouEOnYmCgaxIrYKomX0praAkRKabNOaCI310vRx+EU5CRZ
	IUxEVQKi7UqIJU1q0ALNHzOwrkhZcIhexmygzqZBFmYi4HILT6S8f3Z9sNNoV6zdfLqS4gCZ40X
	a9YqMA5tejj4hqNczF7UsCcnOFc81ymTGbcgfB8XilkRGl0dw2e/lBM8v5bz9p0TP9m87aHEEAL
	Di2NuhR6qDp3qqZM/2/nikniO63tN9Fa9wOHhb6Z//+5D4XcDaVt+6gAhD1BBv/wBUzcKFFrQax
	ByKaPCQCNe59+V4SdqB1MmCP2lJStHeB36nt2MdG26iIEY32xgsSGS1l933lIBs1Q9PRYuhQSPQ
	=
X-Received: by 2002:a05:620a:27ca:b0:7cd:27f9:6ebc with SMTP id af79cd13be357-7ceecbacffemr2728803285a.9.1748448864243;
        Wed, 28 May 2025 09:14:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdCyIX+70l5Hzm07IkuljfZ0EHSRrY4+nEO5CwtACrM9CunKN6HGzblCxhM/txRHf4Vv+kpQ==
X-Received: by 2002:a05:620a:27ca:b0:7cd:27f9:6ebc with SMTP id af79cd13be357-7ceecbacffemr2728800985a.9.1748448863915;
        Wed, 28 May 2025 09:14:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f6a89b8sm339772e87.210.2025.05.28.09.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 09:14:23 -0700 (PDT)
Date: Wed, 28 May 2025 19:14:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com
Subject: Re: [PATCH v1 1/1] ASoC: qcom: sc8280xp: Assign backend ops for
 multi codec dai links
Message-ID: <5yfyabb7h2xode53xdqowuwfzuml4ytjjzi6tlvzj7htconwtf@456qh5trwijk>
References: <20250528150716.2011707-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250528150716.2011707-2-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528150716.2011707-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 6NRwYaczBITc_PP2PxGNRTJs5B-80oP_
X-Proofpoint-GUID: 6NRwYaczBITc_PP2PxGNRTJs5B-80oP_
X-Authority-Analysis: v=2.4 cv=Ws4rMcfv c=1 sm=1 tr=0 ts=68373661 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=MkCF4ZN9ME8HeUR9PkwA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDE0MSBTYWx0ZWRfX7oHiELjMHP/p
 hNArxFUiUknLha3SmO2asW3k7nhP+nNRQW/AEroVezxIsmcimVxkvTPISxehoEG8HnUiODOAJjF
 pfgJS8hLr81RaIfKL3HcP0L1cP2f21tO2XCLPSXEgbjn2Vy5VJbjrrYWVlJp+2TeTlaqJeMQaD4
 E/+Il5GcXi6NOo0cnz+HtmWc0Tk7M9+k5qf1Ya3/Uv0FdV3rw+vBFySfstONPVngNMR7xNs4eW1
 BWAselg66QBDH3EZYVfz+ZL6YlwwZW0dlW6wN2MBHGZy8fJKBzosP11zh3zw0j0CBRDI5vxSod+
 4fJDihyeeoQC9R/5GsW5eGD/a1LQpm4EJpAmq50EOezL8qD45GIUWz8hfNWMmlwnzkDpGG3+osx
 fI6PiH3wDiebWI7zEB3MkzecM5awVU3g2nDsEEqp6TmemNu8bJJlge6V0Ih9QXhJ9dCrndIb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_08,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 mlxlogscore=661 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505280141

On Wed, May 28, 2025 at 08:37:16PM +0530, Mohammad Rafi Shaik wrote:
> In the existing implementation, the link->ops assignment is
> conditioned on link->no_pcm being set, which generally happens
> when a platform entry is present. However, in scenarios where
> there is no platform but multiple codecs in the DAI link,
> backend operations (link->ops) must still be assigned to ensure
> correct codec settings.

Could you please provide an example of such scenarios?

> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  sound/soc/qcom/sc8280xp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

-- 
With best wishes
Dmitry
