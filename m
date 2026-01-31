Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287C619F121
	for <linux-sound@vger.kernel.org>; Sat, 31 Jan 2026 06:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769842048; cv=none; b=dJNVbVLMZoqfweMCPxp2ioMjWhZAUwB+X/k+Y1kqC3lynJPo3h0HITIuK8IfDuxdza3VBSbWGmJOcClMPwbS72xzXNDIWeIz/WRMQ/YOyCN6yzIBkfGausLyMfXpURFXPi4hnGfn3xihR6hDsOnqa4fOq2x4ebqIMIl6aOdprcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769842048; c=relaxed/simple;
	bh=d+C/XgD6fiotDEpOe9IIGJSGoB5I1mOVaKwM56sPW5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qC22n9VwvZUJyHmk+5PxbkAjEajPV/Kalup4z/H5PwtxRZ4zEPYw1BND7f2VELOmDwqxORBj4bpwiGeHeYLzfS9w+H70uETW2jvjwHKLO0Seb/YP1gk3DkEqZWPxArZwnyH31px6wEBtHsz6epvbTmI9UYXsfndSndVd3VGXRx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZoiKiec3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IX2ohJUC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZoiKiec3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IX2ohJUC"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60V4bib71061411
	for <linux-sound@vger.kernel.org>; Sat, 31 Jan 2026 06:47:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lxgQvhgem5eV1WuXxeaQiHKq
	HYhMae2bq2UrsW+VFlE=; b=ZoiKiec3nB/jXc0tqUWzatIuiFHlRXonSXHt8R/c
	H5SPYvXIZH/aLL00q732ZbWF9I4HjahSjRb8LRJowfmdgXrhxOT6PP7hQsJpqdzu
	eBL6RvpRBaGVNlkCtdVx/pFcx4grf3SMU+cjn4HOV+GCpOyRP9n5w25e1YeAT3vT
	sPmjL8UG4lV+jDPFIXFoZz57aekJKxsCl2F9ZE/lCiUo+XoXjqNU+9j9ptWhOdoe
	PsD0tVXRgOx+qivUJMpHF7VX5O12LJEKSrWr7ruxfimF8pnnTeJsVdfQCzsQx69m
	RIMS9Rr2kiLIltBtnOoKtc8g+eYDx7sJYD8WQpiq5Ptf+g==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1avng8n1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sat, 31 Jan 2026 06:47:26 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5eea68151f3so2812677137.1
        for <linux-sound@vger.kernel.org>; Fri, 30 Jan 2026 22:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769842045; x=1770446845; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lxgQvhgem5eV1WuXxeaQiHKqHYhMae2bq2UrsW+VFlE=;
        b=IX2ohJUCJWl0LsYTEUNQyG7+eIFRvkmmHEQa0te6uUKShbUsmkZi53jiOuV7SPPJy1
         1F6bKfp7I8Y1URzc65PUlSyC5SSlOrgdmIrZDNUwC4FoVgLWdRPdQyUswXMsdnsaQ8Gu
         J0rUEQ/FMZ1ajy63kAMCCOHFqJV8tdA0P1dUCMAQ5LdSjxUVU+rtutnfedGcVOPlJ3Eg
         frfwCciIO20ZAN6GSD8Oo//xxeM3bZ+EAwI6cpK8gvpxFcG2wNPPFFdbhuK4xWiJB5w/
         mm2eowpCmlx4DKVSNtIjWF62LHS5Vq2Dc76kPswbN2Ex5up4eYe8KquxZEc3Cz3LPuHt
         f4OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769842045; x=1770446845;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lxgQvhgem5eV1WuXxeaQiHKqHYhMae2bq2UrsW+VFlE=;
        b=j864bgJELUyGbOydIl7whzeGid/lfNCwTX7lP1/De2+PUmyOS1XKMI8EsS9Itj/3y1
         yF5i0U+fT3f1l9nwPedDiRP5gA+aVIKuzSfAj9Nf10wKiVT/iKqhKI5PaRSUsg0/bzGG
         6hqP+nyCZU9Qq2IpTdQ6BbdViMMnbVPwX0FhoBOozLhE6gc2Ir3dEH+HWkhYu70YY4yj
         YHkby8CRi1hIstd9pEn0NFsBmKNXvB2IAAzdojNBK0jmHTGPHSpLh3mbB0p4bm1aix13
         Jlj+fll99w83tpeCsaGhd7U99j/A2tElK7lkbVD4sIR8LbYHKclv2l/7Enxi1jrzdZWU
         sBjA==
X-Gm-Message-State: AOJu0YwVE1FVaV2hAkl40nHQjwJB8dN+HT1TR04+TnvS6yjAORffUJUW
	PTapbKFUwhFrIlJyfZyfaZR74qKuURdXD9KhP8xNuOhqwuLfGdwVaH4TZXEN4H7sfQWB8JggWFm
	6/81VkY8EZvvKMYIHFwcxGJSvSjBcpl+UyhRjcLMj/JLIKnD9bWiXDuzpe614dWDr3jsUWjlPDw
	==
X-Gm-Gg: AZuq6aIZoQ9hMimTI5zS2NasD/XdcnC6I8xeOgrVDR5h+sB8Y9efjzPye2wg//E+W8t
	+/lxxMp9u3VTo/F9qNKOtruogrsdBNZnJ3JI/Oh0p2H3yAvrEDn+MPD9SoNIPPV0aXH7xu6Lhdw
	OhlDvRZb4luKKBR0oBG2uRTISYzVXodSV9QHT/kTyy5tO+dD8J7bwef2bwqeJ9GS5O6cwgSXvH0
	qDRUh8BO0LRh7PW4rBr2hVRC1qwY/xdos7AgzCQ+3d34iAqYJV8EP7bvIqAn1cu7aNM1B8Qwgxj
	4vEtRXBujA8E036/DPxlufNBhVZ7j116LHBdHQJSFFxEmNFS+6MmdRosdoEI6mVs5jqgBOhLQ3C
	YQOdgQ1LRbykh3Bi+LFw86frkfJokWTYPvxr6cOMrGX5BYixnWebzP7NBoI+t0YxP4Dinsd/4dD
	DfAVcT0boiJDTZOFx+PJGEDH0=
X-Received: by 2002:a05:6102:c13:b0:5db:f031:84c7 with SMTP id ada2fe7eead31-5f8e25af0ccmr1734476137.30.1769842045070;
        Fri, 30 Jan 2026 22:47:25 -0800 (PST)
X-Received: by 2002:a05:6102:c13:b0:5db:f031:84c7 with SMTP id ada2fe7eead31-5f8e25af0ccmr1734470137.30.1769842044633;
        Fri, 30 Jan 2026 22:47:24 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074b2dddsm2177867e87.61.2026.01.30.22.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 22:47:22 -0800 (PST)
Date: Sat, 31 Jan 2026 08:47:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH] sound: wcd-mbhc-v2: remove unnecessary module_init/exit
 functions
Message-ID: <jwyujnzrusnnpczbw6lnzzi74miypm3bkwohcplbfquihdcguq@xyhonwtmb2nh>
References: <20260131020111.46108-1-enelsonmoore@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260131020111.46108-1-enelsonmoore@gmail.com>
X-Proofpoint-ORIG-GUID: WoxSsOwJrIU8yR2Bldd8VDiaeHgZNTP-
X-Authority-Analysis: v=2.4 cv=bPMb4f+Z c=1 sm=1 tr=0 ts=697da57e cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=OBgr-n6dxthDnl-XeRYA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: WoxSsOwJrIU8yR2Bldd8VDiaeHgZNTP-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDA1NSBTYWx0ZWRfXxhVNDnzjXi83
 Lb0AJl5rHIwc38NfIZ3xsFpaavne5ICcg4OfA48KEha0pKdAw3hSJ8SZyqTdS1NS9XMNleSxdgE
 VXgOszWM6UJRq5g+vL3SSoDafswkPUWTJUIusSRxZSpf6EBg9cTNwDfbh89iMxFvlwJXM9H/Nnj
 9D26UYqWqTTjl8od9pk6AqgqLiM5I0gSGAJkp0esStwT9ggWvzE+xuQVel3Goxb2VcO6FvBmU+2
 8pos2fGunqeuAMQFKJQY6UrWHUUHYVcEBP14nCWE0X3AcdnC5SeqEsCRvBlB0xYUOU4EdiDelSp
 jY2NQAZzgbWxXt23akA2LK3GelJfYtcH7Zew7g1QsdioCndyWbY5XB3kjxd+o6EDFAqTm5sQ7f+
 765DEwiUG7RLXB6PaJgFJiqWSRD88fKE/+a8JSyv0RrI4/BbcD68w5A28wA2fEec+cLkAKTX1jY
 w4eKtaW7IDGX2WwuJrQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 suspectscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601310055

On Fri, Jan 30, 2026 at 06:01:10PM -0800, Ethan Nelson-Moore wrote:
> The wcd-mbhc-v2 driver has unnecessary empty module_init and
> module_exit functions. Remove them. Note that if a module_init function
> exists, a module_exit function must also exist; otherwise, the module
> cannot be unloaded.
> 
> Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
> ---
>  sound/soc/codecs/wcd-mbhc-v2.c | 12 ------------
>  1 file changed, 12 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry
