Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95310309EEF
	for <linux-sound@vger.kernel.org>; Fri,  5 Sep 2025 16:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757090705; cv=none; b=sN717O6KgOUGeXWe0BR/FR5GarG/IrY+T3y+OsC1sTM9GL5gg3LmxktxR60XLRlVh4bfPRNGU46s3TTRiXiKLNlJnU17/5fKVYIkLh7E4GRHeMi6xA/LXuwLxSEBOryfJQ+TwCcot89YB3W3q2tQWWV44/Y7h7ieTquppN0Jjyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757090705; c=relaxed/simple;
	bh=5taBZime/pvFUSuPIcotl7pYepsL1uGKb4MYEuPmZDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bp6qGnOfmlBpa7X5N+FP90cDwPHl56Wi0S0LZOh8IrjKAgCngTCS1jeuarcZpktBVlUwQaBA14EJdllPbQkc74jcg7pIGbqSe3O2O5oP8qwoWbEIt8dTWlFA5s4WUfK+YXrnBZm+YQV4IHe9+Y4Oyadt+HBSb/Ya4bjBfsKIqxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ldSFbhh3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ldSFbhh3"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 585G1KHE013584
	for <linux-sound@vger.kernel.org>; Fri, 5 Sep 2025 16:45:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=prGcEflsEAGkacTiIj0gYdNd
	T0AAZRAHRTty/ORi3tY=; b=ldSFbhh39LkQ8va4c+5m9N1qEY7bvQXjo7vcTmYa
	cMlFnDcXlXR1kp06bxhiVJ10wvNUKQez+bDERQrCPeGo6U+rsyxTmbfNhNlZSrC/
	UMm3sgCZL1XIiIbMvYxHAx81BdSuYXM/Y8KuRBBXNzhPTTy+etEeeauhoikPSLwj
	/2F4/90RZ7zv9zaCeUhhLjyhWWzbZ5emx4Bv7zxW78cvXBdRZR4eOaVYMjpNETKn
	Qpp6Zk5fRHRvPHtiWrswjIUaYWqB1ibcMs3TwvpsjOcG7JJXTM6d7d6v+Qg0QjbB
	xdjsetWnsbwLlm5IcDBJ9IL5+yeQXfCk0qGyIzmrQOh2TQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wyftbp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 16:45:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b339e7d107so60686981cf.0
        for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 09:45:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757090702; x=1757695502;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=prGcEflsEAGkacTiIj0gYdNdT0AAZRAHRTty/ORi3tY=;
        b=N6JH+VxR/e7aKctZisrWhyrUqzgFjbnfSePGe+A6ycJhgKMUoKHMtufR5yvDOIJOHF
         BdRzXhGp94USYCdRDhD0BBiphlo9SwUdSsfEqyPaD0g+HJiis1zsJCaOtyOjzwSvQbj1
         QqoH38OPrvsNI9Q8jEDUXTAXBtyfwqXCfYUCr83ArrnS19069Kd8hk+4jDLf6se+luyu
         NtaU41fPtB3PLLAuLFRHFifKJ7MiD+NR3QI2lpY9WDKDllTKDKMOYJASJlGtz9sCd88q
         1O/4B+/7tPm+rAfBFvqPwy3lgKRVh3U9X4Vm5w0TyVhfD68Cqnbv7KbMgdtJF8AfP9J4
         TT9w==
X-Forwarded-Encrypted: i=1; AJvYcCVX0Q/HsbjiGfhlo/D79ivFcCaBFwX8nkWvclr1RRyY5fEv6hH7bgmpvO0Tmq8nmqxn7GczMrR6+4/7Og==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj1e2FUIF/4iBFIrXc7Af5a74Sx3kPT+L4xy2RfJmckgNCmhL4
	LDACIUSk3zbYl4oOxmQ5yJ9NT7va0iPD3kpqK4g/qc7n3o5zIwwMi2i2LSxSJqRTIpYZ9WlmQF+
	XQ+SOwW/kny/lrzBrMERZ7ZYYFDLHdUuQN5C0RZojSiGscht+tB8Ac5ULvYFAb2Ku8A==
X-Gm-Gg: ASbGnctGDbKNo9pIZgmzsnqS2w8a+o4rGzS2fQELnkf4UggbpR7Nn09tXQak1CCPNSv
	2AZb4BoKzdfCImPsvVYjNrFTG0AMyzf7WvTcY6WuW7n36wzpM2ttKddgPsf0uYQo+Nj2nllH02g
	coClsG96S4xZxLH4FtUHbTnvpb6jM857WNkUm2IOujfsDLBrgP89h7RLsykmwFdWOiI+HriXzk+
	8c+mNiP1w38bLlBEj1UUcJSeGpSbcpFwm22nb9G0NxFARMwrEzhM1DwMMRaYkWb2evPrOZaXGM+
	9Ad9c6hHBn1JcFaYPfUqfXhJRI/Xb6y1J9EYofY55fig1l9Ifv86XhgKBuPNM3Sscqy4Ebq6bSZ
	Rwf4wk2Pkse+7oYF9s0LRLtkCADpw+3DRE/oJwDNX2sQYW7/Cojur
X-Received: by 2002:a05:6214:f09:b0:709:12b6:5a8f with SMTP id 6a1803df08f44-70fac7ba44cmr313993566d6.28.1757090701580;
        Fri, 05 Sep 2025 09:45:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHADphYCXf8LFxn7W9jBvqaJTxDjvxZRV3ILFEB18XoXpLrtUdbQ1fD4T3t9TthbsGZ/gU9Cg==
X-Received: by 2002:a05:6214:f09:b0:709:12b6:5a8f with SMTP id 6a1803df08f44-70fac7ba44cmr313993006d6.28.1757090701061;
        Fri, 05 Sep 2025 09:45:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5619682eaecsm376145e87.123.2025.09.05.09.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 09:45:00 -0700 (PDT)
Date: Fri, 5 Sep 2025 19:44:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org,
        srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, neil.armstrong@linaro.org,
        krzysztof.kozlowski@linaro.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v3 10/12] ASoC: codecs: wcd-common: move status_update
 callback to common
Message-ID: <7rizn5ckjyyxx3aabni3xgrxi3lr563q555llq677lcnehyowm@ys7uf3dlk6sx>
References: <20250905154430.12268-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250905154430.12268-11-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905154430.12268-11-srinivas.kandagatla@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68bb138e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=sWKEhP36mHoA:10 a=EUspDBNiAAAA:8 a=Wf3XbFnT1CmmG50OB2QA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 8qiU37T4fkzQtXExRy4VG1z3ZmzQJE3D
X-Proofpoint-ORIG-GUID: 8qiU37T4fkzQtXExRy4VG1z3ZmzQJE3D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfX4EOTbIQyOGoZ
 I1ubdLkRJFp9C7/olqkXJNtACPPnvi2Xdn5T6UrK0pYgYhbkz/SbfLqEh4UayHjo75UhX4my0wt
 VTBGICzCKPgzd8SMdyH7xKN7U55HnXDAmFo0o9cfcnPO9pRQzmkhKPMTmBb0dBqPyug8AuZp1On
 7J83SbX2H10qByOB9tI2diLv0NyNv1TfKY6WQAE7vITaw/bu78bz+hxqa+H9xzAqs0cxtbNc3El
 e+jMi0bR4jkkMFXYpwtPtwaFim4Djm2fpqRxwNHAXSwmhT16nDJc1MUigA446NE3kIOFKJggVVF
 VUrLnVK3YJWEI/P4jXGTdh8j8myinVbaiDAPkZ+Qb0bmf8sBgRCnbC0YflBDN28iZ330qaC4xCy
 HQTUwNo3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101

On Fri, Sep 05, 2025 at 04:44:28PM +0100, Srinivas Kandagatla wrote:
> Soundwire update_status, bus_config and interrupt callbacks for wcd937x,
> wcd938x, wcd939x soundwire codecs are exactly identlical, move them to
> common driver to remove this duplicate code.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  sound/soc/codecs/wcd-common.c  | 46 ++++++++++++++++++++++++++++++++++
>  sound/soc/codecs/wcd-common.h  |  5 ++++
>  sound/soc/codecs/wcd937x-sdw.c | 28 +++------------------
>  sound/soc/codecs/wcd938x-sdw.c | 41 +++---------------------------
>  sound/soc/codecs/wcd939x-sdw.c | 42 +++----------------------------
>  5 files changed, 62 insertions(+), 100 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
