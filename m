Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3718142EEA2
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 11:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783510727; cv=none; b=X1vtElHbDS/lzVuQ6OvayuHy7jL1SNx06BNrqaCoqWvyKoydll0KIjrWKTUE+DY1RjXM6o4A+QBKpWb4ydHTUU61tNRnsO1+eUP3HPRDUj6qHBBs+/Bbo2QEY/k75Q0F11FuF3CLXXb37OGwzsi7kRiFRUx3G0Y65x6u0rb9otY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783510727; c=relaxed/simple;
	bh=RP90qGDqSky/CUkebrhEdDl8nT1yIbocQhu1kVNkt8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wxj3538lTmmvk9KRZb8ZE2dWIQeYDIPbW/BGuihea3CPRLXr/3Knm4ojlXxj+l2vy2bBlVCYFSi3kxxSyIL6ASkKzJKGg3sBJLqvyiKO77KJzMxy2YhjJycSzfIxeeO05KdxTvnn+/Zl6arClyw5WgnBD5yp4642CVbITOP8Zbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bXBE6Bvp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W/dZDhbU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bXBE6Bvp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W/dZDhbU"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668BSo2i2459137
	for <linux-sound@vger.kernel.org>; Wed, 8 Jul 2026 11:38:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=l1NE81Ewdlfj5M5xJR2l+Mbp
	tJKnZUesnJ2Vfrpi/UA=; b=bXBE6BvpQHfa6Skp7zjliaZMDl6YuAMezNKSzBAk
	ZNh2g6WGUyVw9NI1pFtu7XVBuWLy03KvIVSHX6lAghLdZeORIuvbzfnGKs1Kbdzk
	jx5asKac62QdtUKaScxjsixjZ0Tb13pyxjneVa48iooyHu8kaZC7eVRlfZDMBO8F
	gmriLIT/Ai9UhlnZpusCM/Lk0jIh1IsBzgFOF35LvCVfiOoj4EwEUeVS9BhUI8WV
	L7q3rGZbTa11N7nrR4PW2lsLDizs7DHi2iROFH3XXeevel5eaqKxUQsLJLpkQNPT
	Y2MlBVUKKGOYD1MKZ7C8Fy458lzHWJEdy5gGHSYAdjARxA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f97u1378b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 08 Jul 2026 11:38:45 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-738105fa48fso662763137.1
        for <linux-sound@vger.kernel.org>; Wed, 08 Jul 2026 04:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783510724; x=1784115524; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l1NE81Ewdlfj5M5xJR2l+MbptJKnZUesnJ2Vfrpi/UA=;
        b=W/dZDhbUZSw32gaJonEX6c2rJTwOpuLC8jmrnomY0v7OjbPGbn3Ge4h/tQnewf7X1e
         M66+EMpFjkgbSaXoykL49pMuNGPXHO9RG4On1xDJfO2QoCLGoIoStR/LV9QDSgKSG+rj
         XxJZqvpoJhqWdK3mYn9MucJnmUk7IP+nM34zOy2YzaxnvV8YNYR6oZxElHBokIUqEu/x
         KkSGnT2hKTQ/2cITwfgSl3Y67cdlQeYaBm1d4ZGZ8opulK8uIaH2t8OQV3F0/y1cqcNu
         mneeRlLTB7nEz279nvpjLYm2+4T83IFaok6K8jyRpbauOkHrY4Xf0e6lniX/EavBcxZK
         2PVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783510724; x=1784115524;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l1NE81Ewdlfj5M5xJR2l+MbptJKnZUesnJ2Vfrpi/UA=;
        b=HIH6CjphvgXMMZWopwJOIta7aM3HCmCoarUcWYrqbqjzzVia967z1FsPXbdtQBAzG4
         mi3kySyJZAZI9B56oBtWaixGWCppmjzEFnCTGnCbQ3gHgtgUmDQOoZIbcCnqI6+Nu7qb
         m8ebdIn5eUCToc/HkalvHtRZXGKigWuCOELjXDJzzXUQWWXCuqI8eVLINFvCm+cNupcP
         36yvDXGwmSIe+LqTQhiPJSl7/x47dZ7Cslg94kXqP9CSDsRMYQ0gWncmMn5MPtrHlBz4
         o9VpcysC2Ci5nq/EhiGFAK+199x79EsrW1m3ga6thi34zAK5dTE1Bt46G6ZrTGDF2+BE
         QNNg==
X-Forwarded-Encrypted: i=1; AHgh+Ro+oGaNVZAYZdan3ZxJ8o3KHQ5tS9rVRO0MzSesjDSpRCMTVfI9Jsu3QU5rd5n9qop3arBp53gWLt1vqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJRWrTjCzh2PcjszOeRk3cn1oMwf+VzOJ85yFVLHuX5h2E7Jqu
	Bz1ahaWCl7mA8CBfhwLnRVllESBWX5Ksg3aHZatzy2RcURlSNSIEzLeK8h550NgD386H7MkOl9T
	ZSe+mDrLgedDmF+0vDH+4uEuloDuZx0eZGflgYYdtIwDaiUWNVxTpeRm3AAup3UcFsw==
X-Gm-Gg: AfdE7cnR/O2cXxwG5l2RKJuqqc+E6Q9wGpMDnP/1qhhlTs7L1E5fOxzbcJemxag1nwg
	ndP7SVYrR5nEdy36bsr0E3q9MVWb35li+TTN5G5tRLf3rvjCHjO890TNxzZ5FWJiTcmq18QCeLm
	wELMzCbcknvGEeMhRuxkRzPfiL41nBEDHK223cnkXRQGA19jf+C9obU+xKjfbgzDWmszH9jGHZU
	gOGf3rp2c9MB4vr4CsvQ2WtqdhrROvLVdpQl1AvZpV4iXfOVJ1pZEUNCqPf5ApfWQR+QQLlNwHM
	WIwgcY1EkvymlSem2djkCNCVw1HJGyjnkEKq8usZdgQhjN7/P0fsBB6o3S7gkKJUow+wrZs86gd
	x6KLLNR27VaiJGT3hEF88J/ZfBRpIFQHsrDT0fbV0YiJ2gYz5ezoMPKgiOBinafz5xvHVtc6sCL
	HWzqG6ZYO4a1YhkdY8LLjcrwvf
X-Received: by 2002:a05:6102:6045:b0:734:13c9:5ed3 with SMTP id ada2fe7eead31-744c214b646mr3977467137.3.1783510723968;
        Wed, 08 Jul 2026 04:38:43 -0700 (PDT)
X-Received: by 2002:a05:6102:6045:b0:734:13c9:5ed3 with SMTP id ada2fe7eead31-744c214b646mr3977449137.3.1783510723572;
        Wed, 08 Jul 2026 04:38:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13839ccsm4426586e87.37.2026.07.08.04.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:38:42 -0700 (PDT)
Date: Wed, 8 Jul 2026 14:38:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: tiwai@suse.com, linux-kernel@vger.kernel.org,
        Thomas Gleixner <tglx@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] ASoC: pm4125: Switch to irq_domain_create_linear()
Message-ID: <3dquznicr6jh2k7h75mwe3dm3y5ud6r4o3bay4bttuehltqqem@wojfvyzfwnrx>
References: <20260708095840.385526-1-jirislaby@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708095840.385526-1-jirislaby@kernel.org>
X-Proofpoint-ORIG-GUID: kdoJnbjmRYbdZwRNANPU_u4v_Gghsvg1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDExMyBTYWx0ZWRfX4hu9P1soCDlV
 mCAviMOcORacuf2sUHTOBmnZjVxOY9b8t7qdUmBlvQleVfWuIxxdEPYFmUAL+wDJbMFOti81Vqo
 3IP2C3tJXDSuDvMUamLCsdy0ppD4Ax8=
X-Authority-Analysis: v=2.4 cv=F9JnsKhN c=1 sm=1 tr=0 ts=6a4e36c5 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=iox4zFpeAAAA:8 a=EUspDBNiAAAA:8 a=bAM_E-XXpzh7hRjyRewA:9
 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-GUID: kdoJnbjmRYbdZwRNANPU_u4v_Gghsvg1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDExMyBTYWx0ZWRfX7wMpSvwqzTYm
 aj3ANzJwNUi1jwz++elh6ssuZpia5LCXQuMx7iOVY7/WTR1rFoqwy38pmwT1+UI1GLL6fBugiyU
 mUVyVVxtC9BW6SEUuSbDMECP69NVGR2FGQ8M+xSnXCEvqezg3kJ2pklMEeBLeWLzedgQVAVgVg8
 zfL9V1n8WjxVV76zdhaakVD8Q0A3xO6eJ8L7NTXjUCQuGvXczAI9EQVdugSEpKNP24TwYiHvigv
 76MjXVhQ6GlT6XFgTSGGN4tSrRqONoeLPUMYFYwvi41hQJT+PNL/oTO4NH4B2H8Cy8Bhkl0KJ1C
 WD0gN4S1D1YLugWz1Am54ol+kM7Lq6pCxC3NujOvBPEK9W1RAHatnJTo0h7ShL7yxIn6nEz/73+
 JTKhSWs8mOSNluzvhtTlWeF+abBNCf+U4R+GVXR2XgLyJNHQfZE/6Xm5i+TAkEqT4pb6A4nrKVI
 0ZyAt5tscGVP+YsEiXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080113

On Wed, Jul 08, 2026 at 11:58:40AM +0200, Jiri Slaby (SUSE) wrote:
> irq_domain_add_linear() is going away as being obsolete now. Switch to
> the preferred irq_domain_create_linear(). That differs in the first
> parameter: It takes more generic struct fwnode_handle instead of struct
> device_node. Therefore, of_fwnode_handle() is added around the
> parameter.
> 
> Note some of the users can likely use dev->fwnode directly instead of
> indirect of_fwnode_handle(dev->of_node). But dev->fwnode is not
> guaranteed to be set for all, so this has to be investigated on case to
> case basis (by people who can actually test with the HW).
> 
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Cc: Thomas Gleixner <tglx@kernel.org>
> Cc: Srinivas Kandagatla <srini@kernel.org>
> ---
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: linux-sound@vger.kernel.org
> Cc: linux-arm-msm@vger.kernel.org
> ---
>  sound/soc/codecs/pm4125.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
