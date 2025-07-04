Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC19E170826
	for <linux-sound@vger.kernel.org>; Fri,  4 Jul 2025 14:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751638698; cv=none; b=SOVy73hV+aNEvI/96vn+rjAfJmug5BE1JQr1Ts+FtB1e0JTYHifPUyBr1xhBAHufNQEwQDZsBu7IzkEwyitYxCX0xtmQywa8K1xhy3qefkfkWQ50a26XAATolwnfkykdGw9VlC8YZ3tizE2ZvHNQWgpgnhA9gLIIte7Kl62/wew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751638698; c=relaxed/simple;
	bh=7Khl+Tc2okM9Yl7n5jd72UL+nmmwtHnAzlrm+YmIZFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jxH2r39YuQULgDqScj7O/1U5NVudUkTSrL+w5Mw7mPUAEpnWkL3TmnjjAZT4+zJtKn2DCUhbhkF/jMPT6ENHfeta28sh/xVMXFx5S1Qv705kGgyUeNa5JL/4tr7YbGscPRTH6tCbbkqpMkUuaINZEB3x2+CyCOJXZ+GpFW5/clA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bSt9JMbd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bSt9JMbd"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5647wgp6000442
	for <linux-sound@vger.kernel.org>; Fri, 4 Jul 2025 14:18:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GBBzmHljWXgoTLIZWSViaVzM
	iA3PILweDxY7boLYrzI=; b=bSt9JMbdcDrVUARY0tqf+hwxdl+8IL3meMTSMAfj
	d2Xdo81IhelAIgOErpvRgOkU/uBOA1Q8LPq30+ohYlA6/qs8vROKVhNWerPKm2ds
	gt2uRFFFyxxDqH3ZtEK4rorDDjpVdMcNU5/pq5I2wtHZyNg7ct0F7b14Xn6M5sXb
	haR5WHx6cSr2pmpU7CA9I68ISr+WHS2cxBU2aYydto+zAP+ZCu0njCIwz+MpinBN
	DyVKilQgS66pA7sTiTpBq4SXWjFkEzlpe/JnpQhfYM3ciBrTOeHYq3ZhpasyuFRk
	0vuQktiy94Uc7ukA6DqZT6Ow5IxSAjKPS7yBzFiFURBhBw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qmm192-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 04 Jul 2025 14:18:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d3d3f6471cso159150185a.3
        for <linux-sound@vger.kernel.org>; Fri, 04 Jul 2025 07:18:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751638694; x=1752243494;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GBBzmHljWXgoTLIZWSViaVzMiA3PILweDxY7boLYrzI=;
        b=GVjPXkW6Qrng0iVxNo7iU6C/LvQHW55Fmkn/Nts0jgdd+gEOix0r3CWUP4EELg8c8Z
         4bOp8k1OULCRjTAZz57eC+ZLAv3XXfEaQmL1fDB+cUrbceocC+aRPyfzzaiGkZKMbDmb
         jUPszBnrXR7klOL34vFxr3Btb1trRRc9rsbnmGazKOL6tL2tFFpAqB5xUWo5Hk2VQWVz
         vabPS061xRrg3Wa30AuAezoyVlrqcTHfkUkq+z/5RyDdy2rrgVsScGAe1gaRv5o+iMRu
         3Yyznf2cD/uDKIU6KUE1Y/+hNKt21MTwiY3971ErGPQiCu99kxlIFYSOIOvQcKblHnzG
         jOjg==
X-Forwarded-Encrypted: i=1; AJvYcCXq8pVHuGtYEa2R2GOVBPTXOP0q7IMvAGzkKvys9u8R2GVF4VQyLpMWTQkLGHgK22Tsi7z8qnVHoEVqgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yysjsm20cMGjYIAeKHh+lRjrRxzvtqUzFoBT31+LlpxpoV3TowP
	AUTfjntPBcyLY8Tvb3E44xvZjovom7mO79l4+tenm3Eeonel7qeolOU7CZ6aGxjM4SEW8tshNJo
	vZPOW3RzN3TYg4ePMvyx7+p3WP1GrycK5K2SUI6qTCqhTbuUxOVNVPR2X02rkA0Phpg==
X-Gm-Gg: ASbGncstXRgYP41DzP+qAWmbLapNItYbcymQ+ugIexqG74pwlVZyZL6bN/z30mQ07ed
	yQjDvDx6O0J+TKwSutjgJ2kkHShEf09gj3lRV5ZHv4nT4uzkegGrPsCny2329tHMJnnTJsPgFda
	Inzl0mr/DlXBM/HJzgAyciyWm+eByAfELei2I3bWbSY59Vq/fHdTaiUyKCKAk8vyulB3wMcF5tt
	FjOWZzp3eL82KtS4e6mh3lDcnOHlCirmWOtcmVKr4jkmH5ito3+SF2ASxWt/Mavj9sCRJqlpSCv
	VK5zhuc/rlWQEMf2F5Cvi5mYoa9X4pGiDd59mxwk1rKQxh+DV7/w8flC2q0t8BeJFBnJZeIFgYW
	//zqMk412Vl6JdDgy2rqekFp2AFqt5bUHbBE=
X-Received: by 2002:a05:620a:4403:b0:7d4:2515:6aa8 with SMTP id af79cd13be357-7d5dcd248c2mr370970585a.43.1751638694137;
        Fri, 04 Jul 2025 07:18:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLHIXjNSFpNrcbwpOUhUE81GvbckTMere4MIy6Edcq4yoBKqpL5QpPb0hH2I887hahpywyeA==
X-Received: by 2002:a05:620a:4403:b0:7d4:2515:6aa8 with SMTP id af79cd13be357-7d5dcd248c2mr370965285a.43.1751638693499;
        Fri, 04 Jul 2025 07:18:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384cc5c5sm261767e87.241.2025.07.04.07.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 07:18:12 -0700 (PDT)
Date: Fri, 4 Jul 2025 17:18:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: srinivas.kandagatla@oss.qualcomm.com
Cc: vkoul@kernel.org, broonie@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, lgirdwood@gmail.com, perex@perex.cz,
        tiwai@suse.com, krzysztof.kozlowski@linaro.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/4] soundwire: bus: add sdw_slave_get_current_bank
 helper
Message-ID: <jl2i62jhzfetyy3tc4lmo5cdvjn5xakawyhja3tpwyu4z3ksov@k7ahrflfmvqi>
References: <20250704121218.1225806-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250704121218.1225806-3-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704121218.1225806-3-srinivas.kandagatla@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=6867e2a7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=hef_X4T0R7yqAl_WHRIA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: cnGFgdANLhQ8t1wRXJ0C8DXoR74U2Ajs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDEwOCBTYWx0ZWRfXzTr8FBYpXEXa
 3WsZy9y0mTHUwAhyKDhzQSg6i8NZAE3lObNz6yKZhfAE9OP9pD59IykTNIa0mX2W44bHqw0oD0N
 7FvFcv9cvZ2aWkCzyDlktffwcmvNSNclQIn6TURSPqzgCZlEoi4Rkp2KlkwW6S/MF4ehZ9CAPNC
 X2IelyGnDyCk71ZLZOzWOxYLHdmX2aYS+bIp0voU7nNgz3qtxA37nWRGI+wf8G0aY36i00yNIIK
 hpeGo66qtFwledIp8hyFhmwSEjvxsymo5gWkL3lHrTo7YgXYfYzRZRG9mxjiTEMbg4BZSR+pV3C
 2X/R/ve1NA1EdsTBuN8bdADOATL79IARLOW2L1bAeArNla/IwEtOioCh6H2hADtkUW3S3oGBFdI
 lG1/a8+dwR584gMXxdO6kgxYfVduZmtkT202Qw2hW5cagj9TTMbiv+nVpxK6q4MQIsSfoAf1
X-Proofpoint-GUID: cnGFgdANLhQ8t1wRXJ0C8DXoR74U2Ajs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_05,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=654
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040108

On Fri, Jul 04, 2025 at 01:12:16PM +0100, srinivas.kandagatla@oss.qualcomm.com wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> There has been 2 instances of this helper in codec drivers,
> it does not make sense to keep duplicating this part of code.
> 
> Lets add a helper sdw_get_current_bank() for codec drivers to use it.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  drivers/soundwire/bus.c       | 12 ++++++++++++
>  include/linux/soundwire/sdw.h |  8 ++++++++
>  2 files changed, 20 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
