Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367D912B94
	for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 01:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773192851; cv=none; b=cbCtqYxbz0jouN26i+4CnXLeJM3Wm9InAxMcpW4IFU6SYYuT81RFBQEPHKwi++GUciZBBFhlkG8Uy/NjNMglnSdr2glSFDiUcFt370yEKBEBBJt1UWaj1p28gLPJM7bUcmBRkX5X3VPS8DNKli/iLTctORCWTTqZmiJtksodrmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773192851; c=relaxed/simple;
	bh=Q8Hc9ooUxbVtdPnIEu0z5CIgsowGg7hwXBssOJd6aG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZH8OVDM6O2VidKjsAdzSOWxTlS2oXedHVgh+7WG72PqIpTB9juVwRhnXtH41go+Rjv74JN+iA6beAZLg6KNhjWxnr7gCCMy9SQQ//MpPruqjBXgHrzogcQqa0GMKJP0INwxmjkDAq32UAM3TRLBTuUAqrggUdmrA+ubQCs83lRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H9C82eBs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PSRWWAti; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H9C82eBs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PSRWWAti"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B009Gu1265898
	for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 01:34:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=t/kScn5c1KsInTDkcb6FS1tb
	UgTxGiH/6Yim6dWg/T4=; b=H9C82eBsch15e9p1UJY0bBXn6Zfuk68BW3fkqHsX
	dsTpDl84zR49d9+ogXS/qkdeoJFOjFxPWCZEblSaE0VTOIfT1LCLeQY8evfVJbDd
	r7ythIWy4yj+1MFN5OVIwIvSbFlYRh5a2Ho0ZXqaQsaw1tqLLA8Ttji6E0jSnIUX
	xoJlFhaUNWeyno3nokGeXQTptVSxMLZBqrQZSOxtM5qz1fMo0SGDWD0kIwKOprv9
	bGJ8h9z3gDTFUgMOE3WnrlXM8gPElKPEyPRW9rZRyLHuM1eoqsJ3+A9onLnDc8hR
	+p2GSiaBeYTyvSN2E3A3Gsc90BKgbj8v89sNhwCsYMXISQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctpkfhsyt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 01:34:09 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9483e4a8662so18948008241.3
        for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 18:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773192848; x=1773797648; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t/kScn5c1KsInTDkcb6FS1tbUgTxGiH/6Yim6dWg/T4=;
        b=PSRWWAtiBtezzETKGHecTKnGEMhRLFqOAf/hdzoF/bbrZWAQatE7PNvua6CZDMUE2i
         S7vob+8JTCqrBSU4DFvqcHJwAQbQHa5imvQ9j4+7lVj7nW4MX/En/eyU9JLUSnDNMhaV
         CTBXn64IKm4RyYbnJuDggnjz1cZuY0htsicJpr1BKs7NA7pG6+5Fk4+bQLY1V5Ob26Qx
         4MuB//d0Ee8DbrhgWtvwUVJcQ2jO9BbFTHShoAY1UEgHHIzagyU6MMm71tCAvOi/P0ca
         7PaQImznxCokXvRGqQMreF7LPFxMhw8sos8dL8GakMsUV1szF4jN1W5upafpQi4WUUWb
         ElSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773192848; x=1773797648;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t/kScn5c1KsInTDkcb6FS1tbUgTxGiH/6Yim6dWg/T4=;
        b=H6IT6AsD+cSxSwSFSgCb4bj3eFJ41diX6l69fSHLQmavY3F+rBPzkzwzB/DQXd8Mf5
         D6dmSb1UZhSzNpH7VSRnud+dw3xMJY+cWubXSJzhIVFbJJ+xhktw5PEnIsr9H7RSjMDp
         UYYpm8P+s0qCMuLl5Wsyh7pdhcs1c3YXyA/YVqNe5WnYpjiD1ro2oeXPiIS3B8ikUWrR
         nLGgk3TGLNPg19NgpMTjRKMRI1iAbuzyA4D72cwfvcjdTOlPTvehEvODW+WctUIAYBp1
         Z2eVElurRUzOYcP27kliJ9uxziHSRnqK7blg9TP4jihTO/kwQ0DX/8Wqbb1gjWP9fscO
         BMfg==
X-Forwarded-Encrypted: i=1; AJvYcCUgIrqX8AX/8OssZH1P+J+SU0fBIGlTvXf9EkiKJ9gO1jO/qQtVErUtzNNAldZVmAfoULcCvlsmGGYUyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDZOotK1qDjC5FhxvPp9LEpdqSmUiH5SFKfbw+TrhsS0MwB209
	L8cAPSP7MFwKTebrPUBXeKO7dRKjHTloMAC5pTa/q5xo7n20q8X+ckAxZQWZyXMvzrq/Qyj0C4h
	mSZxg07XE7+ftaTSmnemqmvZfX9HuqHo2w8YU0MtFmB3EuJXgUisQTHnZeTkVHi601w==
X-Gm-Gg: ATEYQzwUOLQiky7xySnMH0nw8cg1TWQzs6FEEPB/R9Zn4Dje7ihHEL0NdhO+cVhxoSV
	cYREyi904NyJEMkQ/DPWmngdKEXzZol8zZjmPMRezm6G9yWhzc/mdyEyzjr+UiMBDbbYhl+ZrmT
	SkUOpsrADhIiy0YYWlfSZJS+LLaA+rnmKns7Ix4ftANv0hqMu8APr4/OGtM01zdnObtQba4yzDR
	2USfMv56vPcUP4cWH0pWrW91bknYi1E+d3ZMKBqZqUgbi/zcaHyuvYXU0Lp/CTxVpA3CAv/24qw
	pmYFw1AxcbShgbxzJ2iEUR4SUybup0VDE0b5K9oJk3V/Mun+4sd6E1au888r5E3fRJ40UNEVnMH
	smXjBAzUvxNq1dMD4zhJThGqcP51t1NuCkjsUp7cN9z9f/OaQ2PlxLVcx8+enU5TViSzZ7J7dM6
	awcIFPaJHK/wKojupfm0PXoCgZ2caCP7qZ49A=
X-Received: by 2002:a05:6102:4409:b0:5ff:f6ee:1089 with SMTP id ada2fe7eead31-601debc1b95mr329014137.13.1773192848322;
        Tue, 10 Mar 2026 18:34:08 -0700 (PDT)
X-Received: by 2002:a05:6102:4409:b0:5ff:f6ee:1089 with SMTP id ada2fe7eead31-601debc1b95mr329004137.13.1773192847869;
        Tue, 10 Mar 2026 18:34:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e70d66sm1267171fa.40.2026.03.10.18.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 18:34:06 -0700 (PDT)
Date: Wed, 11 Mar 2026 03:34:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 5/7] slimbus: qcom-ngd-ctrl: Initialize controller
 resources in controller
Message-ID: <cnbyqrpmfgofeoybc6kehztsrtyfc5xhwdjhu6qanq4l5434jz@xllc7ichy3y2>
References: <20260309-slim-ngd-dev-v1-0-5843e3ed62a3@oss.qualcomm.com>
 <20260309-slim-ngd-dev-v1-5-5843e3ed62a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-slim-ngd-dev-v1-5-5843e3ed62a3@oss.qualcomm.com>
X-Proofpoint-GUID: 7CLBymq8J1_Um1jircGpXwhvKVCQg66s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAxMSBTYWx0ZWRfXwQT8NDsScl31
 e0XfSJaj42GHVPDzz8gH6L487JZe9jrLs2rqbrFBCLtOJ2Ssb83SRYqIZCrT3Szhc97xv3SHvyt
 c2zIuKjOIf/nEatlejNeatc4b2CH/TPtV40mgcrnRUuLvJlVO7eBf0zxr+2vSpZvEH7JdzVARA/
 cCOE2N8V/njt9gD6sTpPqBZOPyCtinTDSt/hTrtefxfsBxd1M4KzMYLJRqfCmC6g0EWonB07oeo
 VuhxnSqNDLQTgZ0x7rV2U9GncFz9r2XaWRJ16kLPj0knMlIJ6ddquicxRciU/rQQ/5InAQB3wjU
 WLmgEorrthBpWhgb5X6ztkLKIss2qehdpwOzm2RpUE3fZV1ykxhdkiQQhyq6alACuy7YRO144F3
 AtdEljsO7o9vUyHeVlcpGqClHHfo06D32xGCFCOn3U00BjsXhPKkSGO60BZMjWhStiZHKoivgs0
 lKw/NiPQVEGoPNhZdcg==
X-Proofpoint-ORIG-GUID: 7CLBymq8J1_Um1jircGpXwhvKVCQg66s
X-Authority-Analysis: v=2.4 cv=Gq5PO01C c=1 sm=1 tr=0 ts=69b0c691 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=eovvkHS26EnLs4EkxgwA:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110011

On Mon, Mar 09, 2026 at 11:09:06PM -0500, Bjorn Andersson wrote:
> The work structs and work queue are controller resources, create and
> destroy them in the controller context. Creating them as part of the
> child device's probe path seems to be okay now that the controller's
> probe has been updated, but if for some reason the child does not probe
> successfully a SSR or PDR notification will schedule_work() on an
> uninitialized "ngd_up_work".
> 
> Move the initialization of these controller resources to the controller
> probe function to avoid any issues, and to clarify the ownership.
> 
> Fixes: 917809e2280b ("slimbus: ngd: Add qcom SLIMBus NGD driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  drivers/slimbus/qcom-ngd-ctrl.c | 38 ++++++++++++++++----------------------
>  1 file changed, 16 insertions(+), 22 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
