Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2948A358388
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 13:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784728054; cv=none; b=Sv/ASqjWJB0j/7vmUsVjt0j/ygjsvdq912hjdOP/cwHBOIkaMPXRZnOym3HxBCZXAeu2gYIe4VzvmYNOQzlJutruNMNCT4WKWdGFnkFDFSbfk0r46jVwxe5c0U2vOkRToaplun7rV5oLpNOH8J7ho1eliZNw2VB/5EiA2EzvDWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784728054; c=relaxed/simple;
	bh=wW0T20dhjKI+T4OZcylvOHh0DUZLhH0N1xi4ZsiKy/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i8V41Ni0KXDtDqQrj/fuDDcZdkORH3g4/0h0wgAAW6ZOh6imRsbXcwvPu8yjdfS1fddUiKYWQsFLr77Cbe9r7pNny98/P56GZHx7JlgC4mX2Idj1TSnriRY9U3MWpsxlhw/IAlNrzV01ZbgCYtHszqAB0zQTcqqtfXiHtGCcf30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B2oVv7sd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M1HTGpQY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B2oVv7sd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M1HTGpQY"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWQUE1016987
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 13:47:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SLLFRlAXF6EMp+4dl4HjiUGz
	lwmcmpB5EGdULOLx/BU=; b=B2oVv7sdHgZcuc0bvUrB2ULhZz3oIPfy+SKRLmNO
	ILd8tzRMBTdPFg6czzcyQnNA2HxH+HIlSAJkt1UAa5A7GbWv/JiYtOvYoIcFSKfn
	v5vRTJ2PJeJL9UIRQw9V1M+shW9TYKPAJZiWBrLR7Qwmob8q+Ftd2Sc1bICqLL3A
	w1HQhOrKSFF8uuToY8fkyWURB6Eav/dQjXFWsabwo7AHjr+c4oCRFK7oGxN2Nojv
	X8AyMiYqals62SDQPU+FLMUu427iI/MkyqrlFC7u6Dnbw2jjSLceLV4zF34zVb0s
	xw8uOu+UJ38J007G3oi6vlHARorHXp0zeSfYBwMCcSLoYg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjs929kk2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 13:47:31 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-977107fc2edso4842249241.2
        for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 06:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784728050; x=1785332850; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SLLFRlAXF6EMp+4dl4HjiUGzlwmcmpB5EGdULOLx/BU=;
        b=M1HTGpQYQTxhAAx1CpUXMU1rkB3NCu1EgzRpCABhvObqH7lFdHPZIJ7T6cP1Ff5OlU
         1qjKA9nXlhL7zJgFgVU8RRsdIVibZ0YSPh7yKtp0mz8Sf7oAz+30e3FJ9vyMk+VjpMmG
         hAmKty7ee20CU5FrnG5Gkw0WSeRBexGG1+ZUgBteGCxlEJ4YuzNjB1ropK7xYTkrUWo5
         A4FrZLcwAsEDUZC0csvTqA8Wwuoi60RyCAM3G3mpr2NvsohFD/sEfBIYHTpPBZ82JSU/
         /FOx7gSQuf1fTN6Yp898ZBvMfXMgMbfz991Khz1gYYWsseg/bPcvW6q1Rg1kbbWQXNAu
         1jsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784728050; x=1785332850;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SLLFRlAXF6EMp+4dl4HjiUGzlwmcmpB5EGdULOLx/BU=;
        b=Wz2whLZaJe+Vdk6c/14hHa+kZnrcBm18Cabm6mGLMxWUM/QQFffYxISwvkArI0QCt7
         4aj4BW1QcaN2lkzxn1KSeYxxmAtd8sK3rvh+R8yVYvgt9rgrFEAHejZO4RnwpWMjTePx
         FrN9kQ4AALDNJJRbrETSZE0smYDGLX/aeWA4Ib0Yi+fFXr6c4ZpNttErDF4DOuTdHeBN
         hYvQcqnmv+ONpJz5Um0Qw8jsFF+FaxBxfbXzst6nOwLCPGTsukHs9rf0anmi8333Hj1U
         XSMThZ9CPwrsmqqkYYKbNP9evgv2ud51Dn9egrf/UOzn66SCM7rUEqRpK6aWiDNyrCcK
         RQCQ==
X-Forwarded-Encrypted: i=1; AHgh+RqV1F6wXdRo1wGw+2LS+kO/vZRwyaHYuDbYGy+q/s9x7Udvu3xdnZ2fGzooOKxdgygIN9lWQ/iNwgaxaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZZRttPfK1X70mZknmu9mQObGKYaLDdOfsHpoXojrfm5X7Y1FT
	G8mo6/K9NJ4jifJ5FwNQjZ06M/s52sowio8KIeEPrJKdZjiEK1bDPKDEjfVOKOxy+X6zRSwmA4O
	cshjTkq8kNyu7lqNEjLzxiIOGkrbNFzFNZEW+o0OsYuvfmbe2z4SmUhZ88ym9I5ng5Q==
X-Gm-Gg: AR+sD11z7wg4Hk8rkGq0iDiqU14/q7wnevbHg1XBgIJGy5lre5g2ZJunPlDCJVwqU+s
	hzF9sLjOBkaTtOJecKi/wscjB98tbUagSU3mVyW4KoaYUsfLKbPdbz1nxApA8gCT426opYSd9xU
	XV9mbG1zxD56rlB77Ks62SgCXfYmN3AEO3FFuqsVdTYcAa88jxobPkEcm8cYUol4H6YM5bg1q8+
	uPVaXxHevIyT8apeJP6NAnHuNGGE5pwBIrEUd7OxuoAX2b4Crx4Ax40A498V73mT0m3lw+wc45P
	tsxUjIRZbieLT3N1uxjYOZI0INaLylNQcgyGqMVfpN1oMfgH0LNzmQ3bvQz7Fm2WUBZsvJe8Tvm
	decA+nHFA3G9/LHArczRHuBRwYBH56k3Chn2uT1t5nCuWY0iBHzVfyATl6J+lw22+h08yybsupn
	Ig2bCEr8oSEh4Xsg==
X-Received: by 2002:a05:6102:5804:b0:73e:5068:823d with SMTP id ada2fe7eead31-7475361cd9fmr7968796137.18.1784728050236;
        Wed, 22 Jul 2026 06:47:30 -0700 (PDT)
X-Received: by 2002:a05:6102:5804:b0:73e:5068:823d with SMTP id ada2fe7eead31-7475361cd9fmr7968768137.18.1784728049555;
        Wed, 22 Jul 2026 06:47:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef68b68ebsm5151641fa.10.2026.07.22.06.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:47:28 -0700 (PDT)
Date: Wed, 22 Jul 2026 16:47:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Julian Braha <julianbraha@gmail.com>
Cc: srini@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, arnd@arndb.de
Subject: Re: [PATCH] soc: qcom: fix unmet dependency for QCOM_PDR_MSG
Message-ID: <qhrevlgsup5xtnxhhmon5cjic5utdhc2mdviczylqesw6yjjzv@s3kk2dr5vk7o>
References: <20260719022242.139472-1-julianbraha@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260719022242.139472-1-julianbraha@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzNSBTYWx0ZWRfXx/W3zl2w80kt
 o9hyE13EH4aKbTZt+AaC83YgNG8CosMbm7et/tLoEmDdJYtbab3QYt1oqOCePLuo3zVyGUytzz5
 mD0hLMaNywZ0s9PgKrTjXWXWidcFYUo=
X-Proofpoint-ORIG-GUID: Hegv-75-l0PAv1vE0AbJbp7wq60vviuI
X-Proofpoint-GUID: Hegv-75-l0PAv1vE0AbJbp7wq60vviuI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzNSBTYWx0ZWRfX9TvX5/nte8Fl
 Pah3uMCGo0X3jfQXgm5HLVYU04eI9o40TnQ/OOX+j+JNfJT4CaX0VJmX8OCLgMQYNoG381UzZ0r
 hLCDI+Z03ue1dleEMeeuap0fIGzuUttzdu2HBTG1heTmpO8kzJWnUmKxAOaIT9jxpNqYTFLOTTc
 p+21iUvMGRiXEp6e2ACIzl4rWrgy+hJonrRQKTedVJTpsURBrZdmVyoiD5RhH7EMbpxitZdzW2f
 J3Q7U4u2+jk1g2q1YIPgx2Y3TJBTYyRxDidQ+MlVPv8a6r64yvEOCYjyTQt7L5XHIh5BQNWkB9S
 X4Bky/aRpcytHg+fDCZ7gl/1Xk4VJjUbyoQUGl9o/1LepZ7kzXNuWscpm7Fv78LlQB9ysKYA2nx
 okS53y9rjMQoEXF8kVwnD1BNHC/xMcjXFkoJguXiUos6fJjFpnoGslfwy9GQ3QAAjoVanc8ZXUG
 6GwSv2FZ2vG9xVu9iXw==
X-Authority-Analysis: v=2.4 cv=QahWeMbv c=1 sm=1 tr=0 ts=6a60c9f3 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=pGLkceISAAAA:8
 a=MPo670fqA4mZBiISBWoA:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220135

On Sun, Jul 19, 2026 at 03:22:41AM +0100, Julian Braha wrote:
> QCOM_PDR_MSG is defined in an 'if QCOM_SOC..endif', so its selectors
> QCOM_PDR_HELPERS and SLIM_QCOM_NGD_CTRL also need to ensure QCOM_SOC is
> enabled. Otherwise, QCOM_PDR_MSG has an unmet dependency, such as:
> 
> WARNING: unmet direct dependencies detected for QCOM_PDR_MSG
>   Depends on [n]: QCOM_SOC [=n]
>   Selected by [y]:
>   - QCOM_PDR_HELPERS [=y] && ARCH_QCOM [=y] && NET [=y]
> 
> This unmet dependency was found by kconfirm, a static analysis tool for
> Kconfig.
> 
> Fixes: f2866e6a27f7 ("soc: qcom: Hide all drivers behind selectable menu")

I don't see this commit in linux-next

> Signed-off-by: Julian Braha <julianbraha@gmail.com>
> ---
>  drivers/slimbus/Kconfig  | 2 +-
>  drivers/soc/qcom/Kconfig | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/slimbus/Kconfig b/drivers/slimbus/Kconfig
> index 60b0dcbc0ebb..5dded61191e0 100644
> --- a/drivers/slimbus/Kconfig
> +++ b/drivers/slimbus/Kconfig
> @@ -17,7 +17,7 @@ config SLIM_QCOM_NGD_CTRL
>  	tristate "Qualcomm SLIMbus Satellite Non-Generic Device Component"
>  	depends on HAS_IOMEM && DMA_ENGINE && NET
>  	depends on QCOM_RPROC_COMMON || (COMPILE_TEST && !QCOM_RPROC_COMMON)
> -	depends on ARCH_QCOM || COMPILE_TEST
> +	depends on QCOM_SOC && (ARCH_QCOM || COMPILE_TEST)

This defeats the purpose of COMPILE_TEST.

>  	select QCOM_QMI_HELPERS
>  	select QCOM_PDR_HELPERS
>  	help

-- 
With best wishes
Dmitry
