Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB47D22127B
	for <linux-sound@vger.kernel.org>; Sun, 16 Nov 2025 17:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763314220; cv=none; b=T1xFsASplk6cxkQ3q9aJkNqY3AN4wORxIzYKhHc1rNZJUm4/6Yt2JuYT403ezJQVsj2qOTFUzgNYMdzdwmrliY/6niI95o2znzc71QeF+ZHF8fBmnIU3hBDLel3JsZDY0Nig0VHzJBYvdFAlF4u6QDEoHA9/vCk87cMUmTKc/x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763314220; c=relaxed/simple;
	bh=rLIUzVpvtF2bKeD+QR5GRO0v0gT2j/S1FxeNqI/VsUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HAO/S9qqdfyOxRzHtbZApdOXNPiIgUgWwLBfKvSRbrfO3Mz21B0Z8mJR/pBRP4C+KYo0QJaHV6V5Y91HKi3Dr3Su+LiL1z7yNpg+338e4D/NTIMHEv5yuu3qyI7bQwLiOytnG4VqtuYGRP6n6A58EWUFVJ+ZapY4PteOHyAkC+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dy+1mUrR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HxViLrS9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dy+1mUrR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HxViLrS9"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AGAg8xG424589
	for <linux-sound@vger.kernel.org>; Sun, 16 Nov 2025 17:30:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QpRDHGpl1qT5quq98HG8Wg1a
	Mh2E0WQlAnm/n9VxUrI=; b=Dy+1mUrRCwjfx8L/7K9e6CVGvSv3FXb+R1xOUTdc
	4ER3hHgMVN5Jz24vvd+m15YMWvoXlQ8m2PukLCrsH9ADFdrYdMNRbnCYDwu4ii49
	AKHfS+ByHkm/T7JEndttcuUhnm2Ab7kXNdwOGWSuZxPKZKM6HepTKjG6NnX1Ir8+
	2TgVEJ97MWJVu2R8U64P/SloSz+wyJEcKxr0bSzm38l7USeJsy8AcaJAWPyeSfco
	pP7yO9UHX09lTmNNu6IJKuZgmAIcMvt9VCtuIhbXRhArUdS5OjJjYSV+zZDh/Oq6
	kIGtj8eY7Ze97oOhg2GwCVxaN/1E07Een9uXXx1SFZgfNA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejph2e5b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 16 Nov 2025 17:30:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b1d8f56e24so995926485a.2
        for <linux-sound@vger.kernel.org>; Sun, 16 Nov 2025 09:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763314217; x=1763919017; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QpRDHGpl1qT5quq98HG8Wg1aMh2E0WQlAnm/n9VxUrI=;
        b=HxViLrS9lH+DdsHBM1wgsvoM1Jk9chtQsm04g0wo2Uid8vO4ysFzonvXU909QrOW8a
         iAI90+dBfxZOgfe8uh4CzBHPIYpaEE3D96agEzCQ+uCKEX3wn2H9T9jF4UKQtG4gdvD/
         bFEM9MNuaLpjLRtSGYMa4UffV1VrDW/p/TZOFNVQl4y1iltBUzuc1j5rfnE1RZozII5m
         BR2tnYTj9tDxgrt3mrFuPsWwWPmhMtQDLTVfJ1DOidI/CxdN90R7V1BXDJsMwhuqlNxx
         6kZXLqsWPPJ+bzeuDOfljKWsDaCS4DVWvg5Lc6EXEkOW4LKrmrTxycGTIeU9VF8jBSFk
         CHEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763314217; x=1763919017;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QpRDHGpl1qT5quq98HG8Wg1aMh2E0WQlAnm/n9VxUrI=;
        b=BvPylAasP6adDIplmxUseHoUXKyr5RSTN7lIQjbggIe6Y7ZbE+RDlVrUzwanjf8z7p
         ex7ttqWkPF14TgkZVGLW4f/tg4ibh81guqBW44qYWT5vMH5THgyRN41VeVTn8OOZQaqG
         0XE7lOpoM9xS8IsekCz/D0PHaw3V37FbkS/Xptg7SsvQcBUnmglLh7ELlBI3sqwHfnSV
         yhRlFZukMrkIbQ/aBgoFsqmtdjavmtILl4J7utRTAafd03dsE8pNAplyUGh1DbzRpGjC
         ecrjuulkS2SyiBiosWpAiYyJVeOkoNSDGoSpV8YnqphhvOgu+WFr7sVhEW0Ao1R9cMLJ
         /lWA==
X-Forwarded-Encrypted: i=1; AJvYcCXbLpkVGbIr6N2Vt2szRS93WEpwWC23uV6GQZCKtq5Moel1tiRhOT51N5pqUZcsHWmlavPs+4sRIsqEEA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm5Kfpj1U8sky2TmeRDQy6CEo1Z8GhxQQkjSFW0sQtd+vyGy8i
	4xOh33xmRehkIoCbxF8Jw5ynyfHyFE17dLrZpFgdulnLxKV2Sy20t/IWJNQAPF0gsTJ/8AJUvru
	ge9qK9EMG03/baMUu2A4O59cVMRyBq0wUXgMXiHQAmPLOGxt3JEi9LtApVR1hNp235g==
X-Gm-Gg: ASbGncujUc1h/0cJQdgp10dbI0X26XMNonXfvsjCDjECeOtHorqGdr4Ne+M96UumXOO
	sxmXfprT8moDICYsTmLl/cNZHRXIs7O9H5e42gxy5z0XxPcKAj+iat6FzSHP5Wl01yrMD4/LpDk
	zM7dYu9y69S9YAZSsr/t9vk26C8ywmpYI0zlNOVL70XR4CmS6g0FEE82qsC6p6KGJ2fPs5Am2DE
	C2mDyFhKLZeSYbRx2mDu4f0j1OhqFHjc3FqaMw6bnPDqx75Ipci4NxdcolgLOC76+M965XhRBQR
	ehizSN7up5hh0k7tbfIXPvV+1ysDTHQitvZ7OXjUfjaqA8c8nej/2bwiJ/ajbSu/bidUNxVIkLw
	vp1ynG2FNVuWzYuUQd7GSgXSD+dWYcaWYFI+QxVpXGOiohgoDOZyqS17HvepXs9iqOd3dFVcA+W
	QBivbNVY4OdvrJ
X-Received: by 2002:a05:620a:294a:b0:8b2:eae0:bbf4 with SMTP id af79cd13be357-8b2eae0be74mr198742485a.19.1763314216464;
        Sun, 16 Nov 2025 09:30:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFuqqDIWmmV48P/IbEy/yagen7lKWupdKBUw0Q4ll39gz4EIjYybj1UFJ8Ia9tQNRLOsVTrvg==
X-Received: by 2002:a05:620a:294a:b0:8b2:eae0:bbf4 with SMTP id af79cd13be357-8b2eae0be74mr198738785a.19.1763314215893;
        Sun, 16 Nov 2025 09:30:15 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803b32fdsm2555671e87.34.2025.11.16.09.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 09:30:15 -0800 (PST)
Date: Sun, 16 Nov 2025 19:30:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ma Ke <make24@iscas.ac.cn>
Cc: srini@kernel.org, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
        tiwai@suse.com, alexey.klimov@linaro.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        akpm@linux-foundation.org, stable@vger.kernel.org
Subject: Re: [PATCH] ASoC: codecs: Fix error handling in pm4125 audio codec
 driver
Message-ID: <ogsbudy3yezzbazyg47m5oy7lxllfh7rjwn44z3mksw3jlee2q@ep5xllgyfxkh>
References: <20251116033716.29369-1-make24@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251116033716.29369-1-make24@iscas.ac.cn>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE2MDE0NCBTYWx0ZWRfX3g9qd9cnauYW
 LtRA1EJUDlalaxMaEFtbBqlAl0gSW2vNbOmRtZJ2cNis+z9+YFGZxyNSkIVVduZVumhZItcD5m9
 Sfv7q2o0d0R6oCB/VI144/+RtMJCc6qFmZrJVQT8hf9exoT+AUR0mNwQqS5EXyS8L95P3IkAIzi
 aJuXieaRTwJgJwK7DcXLvu3+XcvRRa+BL7H1ocyXNnoeoJhTu9mitqtm3GSMny24VZcAD0QnvJZ
 ajD3VvnY6DXfMH69flahmaoY0LJZnwHobe2xPQtDEC4sBXwvXj+qW3nSYIU9g7SWJazgQZfOF8f
 nMCh3TNICcPgLy7KESKssYxWZtuCtTUpz/EVf1px6DVSvxAxExZbJftFVb7T0vXb3Q19giwTTT/
 nzX1RXsbH3d9PCBhP1xO8Ya+odqtxQ==
X-Proofpoint-GUID: dpI3kK_vYGyzo4doQ-m1WSNekISiQ49B
X-Authority-Analysis: v=2.4 cv=E4vAZKdl c=1 sm=1 tr=0 ts=691a0a29 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-HseujzHLsh4AEBK8acA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: dpI3kK_vYGyzo4doQ-m1WSNekISiQ49B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-16_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511160144

On Sun, Nov 16, 2025 at 11:37:16AM +0800, Ma Ke wrote:
> pm4125_bind() acquires references through pm4125_sdw_device_get() but
> fails to release them in error paths and during normal unbind
> operations. This could result in reference count leaks, preventing
> proper cleanup and potentially causing resource exhaustion over
> multiple bind/unbind cycles.
> 
> Calling path: pm4125_sdw_device_get() -> bus_find_device_by_of_node()
> -> bus_find_device() -> get_device.
> 
> Found by code review.
> 
> Cc: stable@vger.kernel.org
> Fixes: 8ad529484937 ("ASoC: codecs: add new pm4125 audio codec driver")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
>  sound/soc/codecs/pm4125.c | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
