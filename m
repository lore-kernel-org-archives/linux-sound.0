Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349FD35DA43
	for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 01:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773192619; cv=none; b=gVVEqOT5AFtgug4rN7f6JVxbt463bbNtoSmemC6s0ATeAbPPiTFWxkhFKNFoYV5w8IAScm3O54gZBrK4TOkQKvPd7vhA40yPpHbUPqf35gfjPtnJByA9bC2fyYFPpoJPIXToBpP9EobsRbsRvfYkYdqxtoRBn2pkU38G6gIIStQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773192619; c=relaxed/simple;
	bh=KhYfk5La3zPS9sY/f9J+v3gPXX+NIozeZDPHjR1XfM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o4aN/EYR/TEAivjMrVs4PVJ3aOe02W2HmMeJFNE7uDoHRFGoApQex9JlX9cG+IgsThNB1YRHVZDWEQa2/xIWCOJ6fgcdjC4jYY1p63OpGpsekKY2NzvKN0aVIlBIPH4kq4o/8F+AfNsKjpM9q9VinlejxskcjApzsIJEbupnoUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PNdLaoif; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dcldvMY/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PNdLaoif";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dcldvMY/"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AInS4I3760444
	for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 01:30:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bkxQqKRENO2AomQ27AYoBHJA
	PGDEOt3uW5XK36rzZco=; b=PNdLaoifCFCbxWyrergbYQ4vzvXT+4kj3Rt9chIe
	VFIp47pPwAezmxzfoOoTI7xIeKDRP7//mGEElrYEzxMOky2udA4oBiNQXajJROit
	NQwtKb1daUGdP5ug3KcrerHTh5CX9SlCAqKKigeazCiVTeQnOT87MmWgMlyLx/Et
	VUKHZYKs26M+LR0i3Ia/JzCSjqucQjTPbRNgpd6dt5ku8hU/2kJrvcnwf8UDWQCa
	BACVFiMCc7yKVcnWA++6PWRu32T8T9VAb9oPQq9OHpyygylCwW57PPtDD03Cbwi4
	3PB8tXWLbTA9ZQBwOrNhulq+w4bkj5K0/Y/N0gaA3RrPig==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctk8ujpfk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 01:30:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd91c0262fso1194810885a.1
        for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 18:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773192616; x=1773797416; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bkxQqKRENO2AomQ27AYoBHJAPGDEOt3uW5XK36rzZco=;
        b=dcldvMY/eXunl99OqFTEhJl+9OLTiDhrBvmSKj5z1JlNwmDuzD/3OjXucn3VtNeif9
         vwBJ+rRMRZgH32PBPZ/PZZFxmqphZeS+70DTit/Fi5bJ4PSUGaWx4dWQ1unWTlEFr2Ez
         4Dp25fpjqswkUNda0SdQX+4Sostv1v8Ow9tiXsUYUc9ANgg1Bjywv/GyjwWk1PIUVU3E
         wXgKkYCPu4FY7an6XVuksAxlaN9Jb7Ea03w/yPYOUjCDj38ZwKkUMqqpUzLS5+RLCUuS
         gVBusc/C76XWgw7iLwFisf9ufVt/hd94YdDWa3tbl74g/O3j53T3c+7FKo0PthwlBF5B
         uZnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773192616; x=1773797416;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bkxQqKRENO2AomQ27AYoBHJAPGDEOt3uW5XK36rzZco=;
        b=beTKVHhnexSS27K0dcWqBqcPMAHrIUs349dl4LE2pRXILqHd9MRo7kQPp9Mq3Etkxi
         zzlZQJV0nrXGZYhOhfYm6yEPr7hEWzgrvUuviou3fXLfRn4rq7/xETu2ErZ9DVywMEfu
         5XzL5lXHPO6G1ZL4+894yOhMfmPlH+MCCjFyVSg94QLsAio/QyYVthFxt9SRd6rE/3NK
         ky5pZ+Vkg8s8/dt9L1h/g1PtH+RtSmILu4xy4CM06HaWYi/qIQgrpg3An0lPA+ApcJGz
         qPcTpG6AVBUIcwpjo8H/IOW3kGbYg252XIT4e1fXMv8p1APrJtp9DGbEeVsXTNPWp1Cx
         yz9g==
X-Forwarded-Encrypted: i=1; AJvYcCX+kV7TBqccYop7e2uSyRA+cfVuEToLEQWVXnaDY2bKdqaMBYzpuKYrP+d1qEXmhDvU6Glz7f0bMPPsTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMEihTzNLelGfkl5elVTKIYV4ZPPSnWlC516MAeulxKzXp1bbc
	vr30H8TaTHI5QOSYFkiSxSt0k1DxtCkSvdiWFXhwbFpKANeNB00PLSUQoJ2/FMuufjGfD0HQ7tp
	2RsuHir13Cae8G1LLFeU481EVjkOT64GpjwGF7ns0SvJwlt8twcuD+AJnEWoFEiHd3g==
X-Gm-Gg: ATEYQzxwvDlQfT1T00IooVhsXdTSLqltrW7hYZA35R2l4hQbrJTSvPBscNyPnT6v0wH
	C8lovhvbkZsCRJoo6mgXmZnuUv4FnQTUoXyDNAzma4nBY/PgqJIuvz/ru3G86iPj1N9mJ/lEZJq
	eDFgAKwJxNVZ/pG9Z4Fad3/43PtWGkN85vWKVvjTnt0vX8pWNXtvFIWVlOZ/S+1mqIqkbJTSZr3
	TIQchsAThhrurcjMzawBl7RoRsOzlwEHaitEibBS1W4P6Gt9uV4pEmd0utK7ewuRg28j5oLqxop
	3AAbSJKv1MaIu2eiDh6cvHXMnhRWTBuzOHP8DF1zQBN5lrPIlmck0m0NdvZO5G4Ue+egaWd4nto
	S6F6V3DEG7Gasrj2da6iRklcJLlwWfRKOgCLz0lX2K2tGHcxCm/bnz+an6NwL9QlHdxY4E0BWis
	aDAz4ezlCbvsm/h/HBc4BzU5ggDLmG6l1C1sY=
X-Received: by 2002:a05:620a:2983:b0:8cd:926f:6474 with SMTP id af79cd13be357-8cda19f768bmr127379585a.25.1773192616512;
        Tue, 10 Mar 2026 18:30:16 -0700 (PDT)
X-Received: by 2002:a05:620a:2983:b0:8cd:926f:6474 with SMTP id af79cd13be357-8cda19f768bmr127375585a.25.1773192616014;
        Tue, 10 Mar 2026 18:30:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a155f33be6sm128000e87.7.2026.03.10.18.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 18:30:13 -0700 (PDT)
Date: Wed, 11 Mar 2026 03:30:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/7] slimbus: qcom-ngd-ctrl: Fix up platform_driver
 registration
Message-ID: <xgqxuvyiclvrhlaeozvdo43qb2dw6omvm4av56k6ftmnykiwq7@23cotrwzjnyh>
References: <20260309-slim-ngd-dev-v1-0-5843e3ed62a3@oss.qualcomm.com>
 <20260309-slim-ngd-dev-v1-1-5843e3ed62a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-slim-ngd-dev-v1-1-5843e3ed62a3@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: PesEpyZoyyZPpMGjMAuX2GaHl_wIRCBi
X-Proofpoint-GUID: PesEpyZoyyZPpMGjMAuX2GaHl_wIRCBi
X-Authority-Analysis: v=2.4 cv=YcmwJgRf c=1 sm=1 tr=0 ts=69b0c5a9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=507G7j8PtStOqQvpsA0A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAxMCBTYWx0ZWRfX+fwxnTmZOwdM
 P0+UefPGNTNEcsZtzQlRDN0oUkfDdvffFGsv71EYSu4Um3aD0PZXM1KhsEslpfio0Rj/KmFge4M
 CaMTFBxDFyQBC6GsrGx8QGenS4hUHqcc91vOkylubQnUKLbFx7QY2J9afuWm3e63lHdqTDBgufH
 i1z9hV9xHojDc80KJ7xwvrl/nLeUFKXGhv3ku1ufx0PTEt3/PdEY3QBjRHq10G+paN4MHiOifJy
 PxEsBhWlAPWflWqdBwdk31QXt3Yj49ZsJyRHczLihqO3I67LsWmb1O4Z4OFztCD9OtH9HZZ6bJo
 UFj4sGfgBRcF74fVw1UQ1/B8Gs0dTjU5AUDoK/6C50vVZRHLSVMIWF8HEeXARr/T4rr2DOYX/Mr
 xNJefni/XnkwoDE1aMBpl4ycFfcrSLw7kc9Qm7aCqt0GaNzxjCeOTLCqmi4zWmwEZw4fwbM8/Iy
 pk1/m4zEaXc8Kme6p9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110010

On Mon, Mar 09, 2026 at 11:09:02PM -0500, Bjorn Andersson wrote:
> Device drivers should not invoke platform_driver_register()/unregister()
> in their probe and remove paths. They should further not rely on
> platform_driver_unregister() as their only means of "deleting" their
> child devices.
> 
> Introduce a helper to unregister the child device and move the
> platform_driver_register()/unregister() to module_init()/exit().
> 
> Fixes: 917809e2280b ("slimbus: ngd: Add qcom SLIMBus NGD driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  drivers/slimbus/qcom-ngd-ctrl.c | 36 +++++++++++++++++++++++++++++++++---
>  1 file changed, 33 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
