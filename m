Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4675E35CEB4
	for <linux-sound@vger.kernel.org>; Fri,  5 Sep 2025 13:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757080244; cv=none; b=rbQI0Zuc5+M7lIjBhCrvhstft4RACN8onlVN0w/lwZvouMOOdasIKwl1uh81MDu86NiaSKeAFd/MIMXAOAM7teE0npZ/lu4zDd6YioJiO137MA/h0YDxTxz1Ap8nfrZdBLzNOzQ6XCCiHL361AiXpxGhclHC3tmgdNnLCoAqcXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757080244; c=relaxed/simple;
	bh=4XGnut1KQ5kuNGnU7q5t4kWQ8e03NglGs0Fl6o2RhkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X43VvjPeNYnaSTk0Q7xPfubJKSrccV/zt1XcUA3lyOE99Hozq0R6Xnjom++rdzjEvetnknKbvhUTuHKDFqD8+8gVtWXbTxmtA3LeLipJIrCAkjLUnAvIMxonfRRVWrWI6unx2mD0sdVikOQUcSO3RK9xfUOJgFgrejUbAnjR9Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MXEp56+k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MXEp56+k"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5859wQIG004158
	for <linux-sound@vger.kernel.org>; Fri, 5 Sep 2025 13:50:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gEQXFpfF2RLL/Hgz4KyNGpY0
	IZf9BMj2+2h8HwgD2BY=; b=MXEp56+kNC0f0+Vd/QsFAwauK0Ede9zrelhvaL19
	ysQXCRYbW6pWYu7qYVcWq+qAKbZUJO7lr/FHbCEv2+ktYku8QYWufBVv4uFg/qhq
	YonFxqrkHGSaTU+TRrkJ+Vh2FYEGJ2ONex/EOWstxez3VLrzVS8PkTj6dhjWGBYu
	K1e4mrWPZRZSJ8tq4HE9L8G8gY4/WabljOc3sau0AgjnLe/fpwfG9cO8Rstd6SC2
	RspuvTdRgkyEDLLhGaNWdJLQrLNkCETyXyLrR3C5HG63mBDVIymnTm83kJc8g01u
	Tjeo9USBVsIGpR+gjoVwE4Z0bph0IWCN5abnnQgH/TCxjw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0eufdj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 13:50:42 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b5e5f80723so29328061cf.1
        for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 06:50:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757080241; x=1757685041;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gEQXFpfF2RLL/Hgz4KyNGpY0IZf9BMj2+2h8HwgD2BY=;
        b=nX5CQXr87qL5L3AyYO69JCgJCiaDZutYGfugfTUXS7PpaqVbwcjOvyuxxbZlF0LhxT
         dYdAytcFrxLe0Zk+z5uQhQSQq8EFuvOwQO5aaFrQhexiC0eO0GzLdnw+fo5pKEXa/44N
         /OqqpuwmWfrWwrTrSbyXR9cz/SyN69Fp1ldopeS7cmLNP2+M74MCzQh7XQ06esWnmKYW
         RMNWaIDzOwhl8BkNZ2Rm1WoilewREl2a8q+RzWhQU4GqW8iZRsR0qQxbzFxGgHrbUJui
         eALtBVl2osDZxAlU5w3wzgOHonfLjGzsKWaP94EmMjJYYANRf9AELCZMFXBf/rUT18C7
         05RA==
X-Forwarded-Encrypted: i=1; AJvYcCXCxwL934UxxEq1SWy+/2N04xr7c0P1ORMKhFecZmrLkjW13MPXCkpevYtmxDp02nLymtuTjKqnRZ9YqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc+6dcmpH36KJNQzC3Zpl9KMmxd4uR3AOS/OM3B1I5fuKdArrT
	/almFrraTGvnFLDBYiAcw0XwrxaqKWxy2RFdLcw75ltx46RuHDS4rN64BbgkGavlAXeshHlePOa
	hXZvA76Gv0xSxaX0x+ud2XRuzP66hRu+hEPxPPYhEQQH/IfnbfZzBgQuBc2fv2MBbN3WMO99tyQ
	==
X-Gm-Gg: ASbGncsB/VuY0+jUOnLS8FvUxsvVz4cLjghc4Jfbbf0kctCv1dD0j1wKVPCNUtNyId5
	0iucompZ6nNzz9ruLb6LzclbV0z+Z/sSNwEGKPzkvT1SGOH32TFRGv1vjTIbHCH3zl2xgkYTt8G
	WIibFpVS/XNiOv3vLj8SHt/37AggdW2BG013ZsO4Z4d5+2oeufwB0Q2FyouEwHbL8XF/7kD/baV
	mAEWps8tMDyl696bxyqHekHU+6SW7SQr+I0dMrOEVpaEaUKgBIxiigpt8VfYHWbDPzjySs+ebcV
	s8vugMMAuA0MT5X401TFHgBN5cGgV6uFBj787HaZvvKaLK/6CgaBRnzL0zSOwjg5SeJnmMxuNa4
	tp9C0jJK1CDpsYBkL4/tfkOc190gAlJgYvhhdwAj+bhPVKVsy+p00
X-Received: by 2002:ac8:7f88:0:b0:4b5:eea8:3658 with SMTP id d75a77b69052e-4b5eea83886mr16446601cf.63.1757080240719;
        Fri, 05 Sep 2025 06:50:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9MeUrOkje/yhcJw0U3KyLgE4LLXgaLmVOt6iaIs6F82Zo+mL6i2IiNuAwDQlzVrfywNScMA==
X-Received: by 2002:ac8:7f88:0:b0:4b5:eea8:3658 with SMTP id d75a77b69052e-4b5eea83886mr16446201cf.63.1757080239973;
        Fri, 05 Sep 2025 06:50:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ace9c65sm1789340e87.85.2025.09.05.06.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 06:50:39 -0700 (PDT)
Date: Fri, 5 Sep 2025 16:50:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: broonie@kernel.org, perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        krzysztof.kozlowski@linaro.org, neil.armstrong@linaro.org
Subject: Re: [PATCH v2 2/8] ASoC: codecs: wcd: add common helper for wcd
 codecs
Message-ID: <6igcrtfra6h75v5g3wucokxw3ncj3k66ui3jnhfpdf2lmxc3tm@3hzihrpgjaz3>
References: <20250822104927.2621866-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250822104927.2621866-3-srinivas.kandagatla@oss.qualcomm.com>
 <kmm4e5bg7uehmlsgrfhzo4agr6ga6d5gxtpxq5sg4t3wql5p6m@llwyz4kzsj7y>
 <f6a631bb-d17d-4eba-adfc-4db08540f5a0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6a631bb-d17d-4eba-adfc-4db08540f5a0@oss.qualcomm.com>
X-Proofpoint-GUID: ts5bH_pyale9Q5msOcpegb5_ArBr5Q9c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfX5wmDRzbbsNdT
 +lfHS15BERmNjvm1M+kPviLQbxaK6rF9CdxnIwsnKjdS0he3pjvrRiYGJew8vzhUOIW7nI8cmgb
 y2JxzYaohJNwD0eRoQbni8DIRZtMD5iDoFWmg5Gic4C1ajUgbn3TuP1RNfBb/VLaHos3m854qJW
 mB1Gg9MYVHsVeeIN8SNN09fX4iClGbEjB/yzo4g8iDgiwwBteOIXKtPOldF79W29VwNoBxhW9qZ
 h9Wm0zhqv3C9G63I+IaKY7+DTqE3AcgV3phP70bC4tQIvbQsvPejCVRnpOwahjrr3k4qfEzazsM
 9jrW6SDHmsqYETnny3CE3+usWxOxZUE96+wIbkE07FK1bahkn2OMT8Eny/2h86zqhpO54Wc2X9U
 42T6Z4d0
X-Proofpoint-ORIG-GUID: ts5bH_pyale9Q5msOcpegb5_ArBr5Q9c
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68baeab2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=vlklIGvXIyMSkDzfuDYA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004

On Fri, Sep 05, 2025 at 08:03:49AM +0100, Srinivas Kandagatla wrote:
> Sorry for some reason I did not notice this email!.
> 
> On 8/22/25 12:18 PM, Dmitry Baryshkov wrote:
> >> + */
> >> +
> >> +#ifndef __WCD_COMMON_H__
> >> +#define __WCD_COMMON_H___
> >> +
> >> +#define WCD_MIN_MICBIAS_MV	1000
> >> +#define WCD_DEF_MICBIAS_MV	1800
> >> +#define WCD_MAX_MICBIAS_MV	2850
> > These do not belong to a public header.
> 
> 
> All the wcd codecs have same MICBIAS circuitry, this is the internal
> micbias circuit we are talking about here.
> 
> Actual micbias value comes from device tree, but these are min/max
> ranges that are supported by all WCD codecs.
> 
> Why do you think it should not be part of common header?

Because they are not used by any of the users of the header.

> 
> --srini
> > 
> >> +#define WCD_MAX_MICBIAS		4
> >> +
> >> +struct wcd_common {
> >> +	struct device *dev;
> >> +	int max_bias;
> >> +	u32 micb_mv[WCD_MAX_MICBIAS];
> >> +	u32 micb_vout[WCD_MAX_MICBIAS];
> >> +};
> >> +
> >> +int wcd_get_micb_vout_ctl_val(struct device *dev, u32 micb_mv);
> >> +int wcd_dt_parse_micbias_info(struct wcd_common *common);
> >> +
> >> +#endif /* __WCD_COMMON_H___  */
> 

-- 
With best wishes
Dmitry
