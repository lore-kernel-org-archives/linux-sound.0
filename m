Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD182DD5F6
	for <linux-sound@vger.kernel.org>; Wed, 25 Mar 2026 07:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774423824; cv=none; b=N9D3r903qVWoqw0FAIED/uBszyemm0P86p7corOwOZm3tvD/TbbGixwWDPbnco7DT0+aOgOyhJledssOfjY6jNHco+qCY4VGWb3tgaPQd00JkOJACN9mvJOxY1pgxmSSUc6raed2Ld7/uXGFvOij23x7gWysGkWzXVpdsGN9hg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774423824; c=relaxed/simple;
	bh=dKZnm1NKIAInWCR3adC+CxY3O2RaJO81lRLtHVc1WPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MzZOyionkMI7e+bnHjC/3mrEdcatBWq7/nGqtwtTZILbc0DfJO6BLMnsQIbQEdHDDpJUTyj6VYGJUi7xaMfHU8HH0q1FgmjIeIeY095IkVQMH0Tuhy/EDK8K5jWcS+hSYGruThM4uhPVAb/mkdmX5rayLpVoiLCrvjZaUKS4MAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XBoNjTZz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fcT2v8M1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XBoNjTZz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fcT2v8M1"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OMecRu2276760
	for <linux-sound@vger.kernel.org>; Wed, 25 Mar 2026 07:30:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0fCloKeIgd9lSWMeOiu2m3Pb
	uQlaLl7gCecj/rK1QsQ=; b=XBoNjTZzL7ikRyuUs9/zZoTMq59YRd65FylItvcD
	P9vx8DwQaKnCmfjLMtk6rNXcyYTzO/CFbHofGluc1V4a6F2+iVQMvJ4mHf0Nfp45
	74G9Bheu1yyy/SOeUSGTtxVWAW67+iG3L8ad8+Ccr24ejf64lWCgHU7gEPY20Ry4
	Dgci9qVhd5MtyX+wy4d8Gl6DDbUTazYUMA8q3VYJRS/NUVR+dllLss6G+wBpWOIe
	2ODfCz52gi+1l0TvTPdpvSB5eO3tOfNV0XRRVvd/xc0LcobffUnsgTQ0MTP/3f/f
	wWQSM7ixJXBplmZ0OiWFrpzy+6UiKFSplD4yTNTcIJR34w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d40rasy5q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 25 Mar 2026 07:30:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b3544bc7bso21038651cf.2
        for <linux-sound@vger.kernel.org>; Wed, 25 Mar 2026 00:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774423820; x=1775028620; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0fCloKeIgd9lSWMeOiu2m3PbuQlaLl7gCecj/rK1QsQ=;
        b=fcT2v8M18JLrkNZIYtZADSy5b17JOI4S4ZGyMS3oOcoefeEukc9tJqiuv8/9HuGtTE
         UNJ6Sj+sHExUD2IuVPyu0alrjjOJwpibkVhhBz/oOuK2HzmuV6ugd2s0yegimvxYv9lJ
         SJV/OehiakwoGuZJnlCDU917cvQTp8JfSkTvv6Vd3JWJT7Jcyl429N1mMF9ZDC8jZUFh
         3HMm0cJ30hMw5yvKR9IExP6bsqxQYHTWWWM0J2fnVbEVfI7IRV4d2Cvj4qFk946BKhnB
         y71UONGzkCHv71VPPwPmgwnwXhiV9rKwDPP053xBjO9s1wTjYzp9qtKXzY4ExVqF80pJ
         KtEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774423820; x=1775028620;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0fCloKeIgd9lSWMeOiu2m3PbuQlaLl7gCecj/rK1QsQ=;
        b=lep7hEDmnL1TLf89CNnD94fsW+fE+WBdfS3b+6OITk4X0czhswQ8UNS0vfPkILAYk0
         ky9I8NN0y9TKNmsfXTZ16nYdgdyE8enAsVXwZl6SEAqUgF1UchITb9Lzdar49IGNpXqw
         03wWzTfcPbmWP/YVIQaE4Wm2Ovor/DQ9nSH9rs6uJCQ5DUY/TjKEItOkgwPwfPaMa5F+
         bTdNoyaDNO1NfX8q6pmGWD3PTRThwDay4wz+3dWDaf0g9oLJE1RdNSGndVC32wJ1c0qO
         xW+LiNLPICtR7KNUe12umlUgfg/zXMSppgxrbgWf3stU1HVkxlxaHON4J4gM3/0O0AeM
         B8xA==
X-Forwarded-Encrypted: i=1; AJvYcCUZfCIGPE632vjI/k8fm1A2b+ar+h55p5ZD7Sf7cSbF3gqtLxdRZ8pDsRtFlPhVxYx3n7cbC/ipbyAmCw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw16FAa++irYE/Lp1HkW6KWTR/FCzVnBJSoJ74pLGb8XaFBkddd
	MDK27O5b05dpyhwMQOQi3w+jliLjT/smx71ieLYhExWBldesiddBQ8UA1cO8zIy9Cxlq9ejTpPJ
	amUTednbMZH2Ro3aiEct5/eVZ5oZsy/IieHFmyxOAyEezXZCm4ymI6Hr66HxDahLQzQ==
X-Gm-Gg: ATEYQzzivuzIJI8dqZjOO5cRwtSy1V4TpnFTFCpfOdPAZ509O0KRRAk2Tt4cLtQd9hP
	+Rq1qYEw+7C5p2Mhn3VqF34nr4cUd2KDg/ka4QDpuFeGsI3Cyui5Pdzv0Y/E+dyCTC46G4gxdRb
	WTVkmTnXMdZezVz9qWBrBxvESZGPyH+f/eGW7eWJ+nQwUbxKyIY00E1PS/i5PNdtvJhRT3Co0Wq
	0VwCI4IFHRHUDO5TLuQa2xddaFlt24ceW3QbS2T8bQQ7r6GVz4w6ywYX40kXxSVgwKl00xD++KA
	u6lW8/GYK7TjRzlgRnOZyeIGpbCpLLAQYDfucEYpbIks2He3bKHWp1bd8IPzekb9w8nuzt5f0Dp
	4e894kV9HkNvwKaacz4CdA+c7lRENGvSt4QIRrx3FH3K3T7y9OdAuZ+8it/YTUnIAQZAcI8oTcg
	5/JFGmqa7TJoylKlTDHfyIw1I6CsQsofL5heM=
X-Received: by 2002:a05:622a:2985:b0:50b:4cae:e37d with SMTP id d75a77b69052e-50b80f2a30dmr29477931cf.71.1774423820229;
        Wed, 25 Mar 2026 00:30:20 -0700 (PDT)
X-Received: by 2002:a05:622a:2985:b0:50b:4cae:e37d with SMTP id d75a77b69052e-50b80f2a30dmr29477481cf.71.1774423819692;
        Wed, 25 Mar 2026 00:30:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf9ac6d55sm38145881fa.40.2026.03.25.00.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 00:30:18 -0700 (PDT)
Date: Wed, 25 Mar 2026 09:30:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: Re: [PATCH v1] ASoC: qcom: audioreach: explicitly enable speaker
 protection modules
Message-ID: <sf2hegu7qqiq56nftimjpvf2hj4jiti3zxjex75pmcjuoaqkel@4rosfzs5zvcl>
References: <20260325054408.1994556-1-ravi.hothi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325054408.1994556-1-ravi.hothi@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Jvr8bc4C c=1 sm=1 tr=0 ts=69c38f0d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=8CM6PFMxr7d9lmg1EjMA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: D9GlT3DmICuCXO7jW5X2ixKTwaxWDGmX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA1MSBTYWx0ZWRfX+FzM/jK44L5E
 MyjOyLN4GW5JBNqjGORPoCdMMrKTuZz/wOC+3nNGtlR3+cKXUhvzXp+N2dmrpw9Vao8uKjsMNcI
 MxEL/zEP8HMrhL3XnstBXgjPBP6KgH84tTVC6aX+i5jttxehba/RmcJp2c2yFtcPCeN7nxnHsd3
 AqHGLmJ8Vw5c3UFlnwdRMj1q5ETVh3p6XSu2ujO5qAF43zhcvK082AgsgmNsyCvrrwbshvbQWkz
 gqeUUCef82aKOmCWgCm5322Z+q9gFOlzAcAYVoWMQXvGWjyjkh5kxlYjuqtTqi96q5N3Bc7x6FU
 X8DY/r49gohQ1hnIu6xFl2kiS9rd73pbK3g0gjy88uvskIucm51N+27iF7/ByzEwvxWaJnkQaaR
 PXjkSGVJq+n7uLy47pWzWfQwUT7KBTAqs++lV/3iOAlxAwv8xhoK3G01V4RrVU7HdJ78JNV1pCe
 tkRwlIzxFXb/5SS6g3Q==
X-Proofpoint-GUID: D9GlT3DmICuCXO7jW5X2ixKTwaxWDGmX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250051

On Wed, Mar 25, 2026 at 11:14:08AM +0530, Ravi Hothi wrote:
> Speaker protection and VI feedback modules are disabled by default.
> Explicitly enable them when configuring speaker protection.
> 
> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

Fixes?

> ---
>  sound/soc/qcom/qdsp6/audioreach.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 

-- 
With best wishes
Dmitry
