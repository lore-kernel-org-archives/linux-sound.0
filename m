Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA72399019
	for <linux-sound@vger.kernel.org>; Thu, 14 May 2026 09:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778750550; cv=none; b=j6POqqUutweCbUEFk7LdumEtwl2K/L9AjYe2ng6aU5oZd/KNqsfS8ppskir5wqipxEe2deuRslkZo3DwVZ2E7DOvNPUT4Mhxv5Ilpywj1ndgtAzGr9yr3MKHGzX/cnfNi5ASQW86SZSm1AUzjwKep1HVT0cgMAdL9DKqnfkOFlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778750550; c=relaxed/simple;
	bh=8qvCgOo9gFGl9XcfkFEwQQd+gul4avO4zIY395CfJiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JoJ7hCVAOX/MtoZz9n+A6Ol7A/KPSbYz0RoASmr9cy8W/3aNMc6blHO5DKp69qbNVSNhHYcPQ85wRCBP5gbxoPQaybFpWV9IyhXvajbgT4vhl2knF3i9Kyxb4u+cJTmHKsoCazwlQsBIk34oWNNtss/0IpNdsnOFVw5nmILFezY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bc7GwRje; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TM9a2plC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bc7GwRje";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TM9a2plC"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E70qwE359782
	for <linux-sound@vger.kernel.org>; Thu, 14 May 2026 09:22:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0bgWw2JnGIEYuwfsPsRuR3+f
	K6lh7stB/T9o5jqNXgo=; b=bc7GwRjeHKoPPdUJGNHWcPwkKOF69aKvhgyV4nzK
	QP+2BpS5bEIWAl2VfNPlsDFX+wYkg0LFyQ9zZJ279EOwXOxPGHJL4mpyucUNKJeG
	cExfN4oaGBDMvf+l7py2Jx/bCJ3B1qfnABosL5bhaur7KUphJ+0ZrRdEkUrQLTQb
	snFEL1OpF0RJdueD5pnW5t0llugHRyUJhjO5Usfrc3ZNNmVhcprBx8FqX+6lGW9R
	uYTOKa103IwSi6di14CJdbOhLQtISBS80wSYVMBm/OUrdvc3K1k7ucaPciskCI+R
	nAv6VlWJQ9mmepd/hgIg8PhV76nP35YWOdoqOEGRpkh+pQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e513ga1a3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 14 May 2026 09:22:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d8e8c47a3so31749101cf.0
        for <linux-sound@vger.kernel.org>; Thu, 14 May 2026 02:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778750547; x=1779355347; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0bgWw2JnGIEYuwfsPsRuR3+fK6lh7stB/T9o5jqNXgo=;
        b=TM9a2plCkMFLbU8nYLbi0RP+yh1s4r7kejiYVc0U9xPh9AzRN0wAbIFdaeMg2YIekT
         M754Cdub5N31lLcUOS69bd79NJuZxj/i7jG8gpzwlpnwYXmXeiz+ZzlfD2rh4u5KeA48
         UoYNjtT5QANpbcAsNFx+czNET+ib4do4J2v7PGsJ2Aafd1T4cU6UOBElnzOm/zHZC/NJ
         zoagAm+dZZmSHpnBPYSWTm9qssSCDzn9JOShHXhfKpY+C/Vnuw9N/aT4B2ehbN9+NM3F
         GDU7f8ySzfsyXcjmiEWho7vN6LhCOfml0rXf40JCHYi83UjtSytupMmnK0NHqDoKzMUx
         9r9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778750547; x=1779355347;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0bgWw2JnGIEYuwfsPsRuR3+fK6lh7stB/T9o5jqNXgo=;
        b=VCj7mWUDDu2nMetfpzz69lT0NKgV37YiP6jl++bKDUrUSW2N/u+fKraQ/cL0thhs+y
         ZvphTjx8W9+1/SBenW7/5+zyaJtjgCg/uth/zqIDnBwFkSYjbXdwQsie6mglUr//0Q+U
         KJUYqqHZ2aMasGh+uyBfTNoHLaJ2PLLluw4bfwtGTAZjyMfY7ylmSqZztr/YJf5+k+bz
         0+4QWajCg1atpIdwXNBJbpFdO8pg1giUElch+pYbCH7CW7I9BTTOZmmeMMyvpjZKR19R
         89/xUnXJWh4wjg2YdP1kapiIeZn21iPat6SWiBQR8SoTIeXXtmHJiyKynX4cog8UDSoQ
         hhdw==
X-Forwarded-Encrypted: i=1; AFNElJ/M1+g/xX7oiOeqnq8TarUS1199kQyFLiv89EHUWt6CZWVDsAkd2L+i5l370/7nA9XXOBYRADxLY0BfOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSGgrZBnqil+fF/0xdZ+TTifS3KxOULBhzCwPa3gbsBEWth09k
	2rwE0CO/24TGEwEslofRCcfi7WEwjBuyxC3Ce4ej7JO/hGTYG9ZbSK6qHDM4GNQbgAPwOxcfX6h
	iVJKpBfNxLC9KJqEIh2Wc3qRvrz2Eo7GF9XaEGp40AY+B46VrJfB8rckU0gbBdlKoCA==
X-Gm-Gg: Acq92OHOPy8giXE+p+mBRXqJNM7ASzmYEuGNYmEV22EWDU8vKjAluj5I7M4/SGR8geC
	28Tea5JXndNRdUOXKTqayqnKm+y1QxdfqGldQIiYuExVUucNoFWG1T1xno7eyjjwz9gbc49P1wB
	7nuezyBylww6F+GP7TO88FGLGijEkwCJ7/D6rshpeAsTkiUCtQZNYAnmAewt2qh+qvMwBscMw1b
	ek+TrxJT7CG0KNYWR3C8DFVha03BlloCM4OMTK+B3WW39gXF0FXtakFPac0hTUZWIQh7eW/pYbB
	KUcYAKapQhXnnb1s+AQWNhL9cwaxyr2PKpHPpoudKfTkWA/U/RpFbglo1Er4G2o5r0VDIylYb3s
	QLG9qv5Qc/YV0Sw3QCzCVyv7Q7q/ZG4a71U9+qgdykSsAWPZfKObG+7ixemZvNRgZzeoQB+yxMj
	7OCjHb21LxAcBZMV1BVdiI2s8C+gRFmEUlQVHCWPz9oa7GQw==
X-Received: by 2002:a05:622a:2518:b0:50b:526c:541c with SMTP id d75a77b69052e-5162ff58d84mr87254761cf.50.1778750547465;
        Thu, 14 May 2026 02:22:27 -0700 (PDT)
X-Received: by 2002:a05:622a:2518:b0:50b:526c:541c with SMTP id d75a77b69052e-5162ff58d84mr87254491cf.50.1778750546968;
        Thu, 14 May 2026 02:22:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c944sm363072e87.6.2026.05.14.02.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 02:22:25 -0700 (PDT)
Date: Thu, 14 May 2026 12:22:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: broonie@kernel.org, jens.glathe@oldschoolsolutions.biz,
        linux-sound@vger.kernel.org, lgirdwood@gmail.com, perex@perex.cz,
        tiwai@suse.com, johan@kernel.org, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        val@packett.cool, mailingradian@gmail.com, Stable@vger.kernel.org
Subject: Re: [PATCH] ASoC: qcom: q6apm-dai: Allocate an extra page for PCM
 buffers
Message-ID: <2pe7rk7jhc36osc6i4rxeyw342mvza2m7i4ztsmm6pjgwtlemc@k4gkw5b4jg7g>
References: <20260514090607.2435484-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514090607.2435484-1-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDA5MiBTYWx0ZWRfX+PeCS9g1EL7z
 /kgHErB+4s/l+WrSxoWEJJ2zR5zKHGoUwRrh88O0AIRNTAQpTFPrwmVDjHlmKQso7de76r0OgSz
 cZ02PthzZWNnKdNh2ArzdSlz3xYHVlhWtsNDcbl78kYTTXd1x2Cr0VwFDrAxMgISSSXN6rp+aAT
 ckU2+1GE7Mfg6O1Cm6eg3VYQk7xCVw+QdlR0lVL3UAYpBS1g95bKml+wY4ObPkHwBBXvOpO8n/u
 m2G/XJTswXKp/nj+iZGgCynDrKjVp4E6BTzCOqwdpROv+M2pdiz5VJYR+5uyn5mj7J0auBd+N85
 zFsW5wDqEFtglR/c2IgIt+XUnOKE5zJ398kV20+IdV4xwWGjadjTFpUXF/ZNNfb0k5GakT0Tuw7
 TrsVHmb5r4ToAuozx+IBYXNRbRL0xYRlO28woXlEi/QMGN80KrbGaeTWJ06UP4CXf6tH55Mi4UN
 Dhp4EVgd41lQGs7pY0A==
X-Proofpoint-ORIG-GUID: OxW91410yRGoP9BOEvnd7niW8QDbXisT
X-Authority-Analysis: v=2.4 cv=Iba3n2qa c=1 sm=1 tr=0 ts=6a059454 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8 a=_Q0duRmiTN8AZcyA_C4A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-GUID: OxW91410yRGoP9BOEvnd7niW8QDbXisT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140092

On Thu, May 14, 2026 at 09:06:07AM +0000, Srinivas Kandagatla wrote:
> Some Old DSP firmware versions use 32-bit address arithmetic and size for
> validating the PCM buffer address range. If a buffer is allocated near
> the top of the 32-bit address space, arithmetic calculations involving
> the end address can overflow and fail checks.

Should we limit the workaround to those platforms only?

> 
> Work around this by increasing the preallocated PCM buffer size by one
> page. The DSP is still passed the usable buffer size, excluding the extra
> page, which prevents the firmware from seeing an end address that crosses
> the 32-bit boundary.
> 
> This was not hit before because PCM buffer allocation and DSP-side
> mapping happened at different points, and the size mapped on the DSP was
> usually nperiods * period_size. Therefore the mapped size was unlikely to
> match the full preallocated buffer size exactly, although the issue was
> still possible. With early buffer mapping on the DSP, the full
> preallocated buffer is mapped during PCM creation, making the failure
> reproducible at boot.
> 
> Fixes: 8ea6e25c8536 ("ASoC: qcom: q6apm: Add support for early buffer mapping on DSP")
> Cc: Stable@vger.kernel.org
> Reported-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> Closes: https://lore.kernel.org/all/7f10abbd-fb78-4c3a-ab90-7ca78239891a@oldschoolsolutions.biz/
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  sound/soc/qcom/qdsp6/q6apm-dai.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
> index ede19fdea6e9..3a1be41df096 100644
> --- a/sound/soc/qcom/qdsp6/q6apm-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
> @@ -497,7 +497,12 @@ static int q6apm_dai_pcm_new(struct snd_soc_component *component, struct snd_soc
>  {
>  	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
>  	struct snd_pcm *pcm = rtd->pcm;
> -	int size = BUFFER_BYTES_MAX;
> +	/*
> +	 * Allocate one extra page as a workaround for a DSP bug where 32-bit
> +	 * address arithmetic can overflow when the buffer is placed near the
> +	 * end of the addressable range.
> +	 */
> +	int size = BUFFER_BYTES_MAX + PAGE_SIZE;
>  	int graph_id, ret;
>  	struct snd_pcm_substream *substream;
>  
> -- 
> 2.47.3
> 

-- 
With best wishes
Dmitry
