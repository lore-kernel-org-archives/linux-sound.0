Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315872F617A
	for <linux-sound@vger.kernel.org>; Fri, 31 Oct 2025 14:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761922004; cv=none; b=hYk13fj0+tW5I+GOHssgRK8LDZaljQmf59pVyhf3D5S3Cc7M9bFpZehYNrTswGRc9++xoj2BmSY3dVNcPm7qHu8cIx/GcR391DT8i0pIlvJJVtSLnu+hIEGDFG7joZ+d57WMVbQfGQO5fqZwYxlsZQxIN8RNkpiEY9iCR8XcvYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761922004; c=relaxed/simple;
	bh=jzMI372OwDFBH5n8TtNj5NR2LY0KRBtXcDe0DjYy8tU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pa68t+LwDW65QeYmukGR1BuUzXsjyOeIxjHfHpHVv4ho/U/6fP/xOz7qY0v0rEEaMv/7SHxKeWMynHc9TD3uObDbKvCtVEYNzTkkOPegi66whWLKy2N1Lxn0uGFwfPFL+Qkl4IydJdH4bENTF4/W21ckgNW1IiMlmUM7i44TIBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ANprUrJZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ejvEsMQv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ANprUrJZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ejvEsMQv"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59VEVb9u3115480
	for <linux-sound@vger.kernel.org>; Fri, 31 Oct 2025 14:46:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UdX0k9Bu7csqPDyXGQIuEEoR
	5weAkUXnaL92NORs7r8=; b=ANprUrJZ8c+P74dfVD0Eocp3aWx8/3R/Mx7s/MT3
	18KdjD1DeCR5eITTnIzLd333qhJQhcQ+nOCOucQYDbTRjuzgDhaRs0RFKqc6YXHb
	V41x4xkE2mrMeQxGrCShyQf6lufLM9ae4dOiU6FcjbAuloW4Z0gz+npQ2xycjNY0
	lVkN9oUa3b4yoBOJMU2dJ3CQ2pK3UvT85Oo29qA4hffvH6pd8n9Bn92/YfMKQhl2
	nVZ+DekGNFEZ/VRzd6RT1Y+GraUwxiHVqO1fXGFvnXxvPRFmd73fQvZihW41Xi8Q
	nyOWkDSEJRIyOWJ5+Gr9pVqaXzDZcnN6vobaOtP/jiJBOw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a45b44ga6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 31 Oct 2025 14:46:40 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ecf4540bb6so60146861cf.3
        for <linux-sound@vger.kernel.org>; Fri, 31 Oct 2025 07:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761921999; x=1762526799; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UdX0k9Bu7csqPDyXGQIuEEoR5weAkUXnaL92NORs7r8=;
        b=ejvEsMQvgCcXBenwAfw/fzaZoGcbVjWLPMyvzV1+rQj9c7SrP8XlHTGHPozxl9cvdp
         8t/5o77vmrslNrRKOTsYQ/C0zzh1V1C0E1zEZKEPCmZ+i2Vi+mWksMyOayA7XP+Yowv4
         2Ccp7FUEWjBKN4zMXJQDP2+j/GOpf+Qy8r1db37AknFMTkEFb/coVQR3mIEaoAnGb2AS
         aTR4EWbCm+p96i22zRuc0uLVTe5i7ecF10OWfYRsm1bLLRjN4swDLDgSAjcQ6NYRtkn4
         sMQv3lX4CZWuu67KQmkjYGNJ6GVq/nxg0uA3utuz1fHG3GTGNjp9YxpoLuJ5oevgodxm
         llyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761921999; x=1762526799;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UdX0k9Bu7csqPDyXGQIuEEoR5weAkUXnaL92NORs7r8=;
        b=fzKwY7ONG1pKTpUFJoQkCOkQgpxSgLaKsgdUgHYgXI6zIjvr2EsEuAovtes1xp6sG1
         z5G6yLgHUI143yqfJgZytj8E8ukdDGLAjx/yHrE9QQW0hYKGB6PXUmqOjXzGzS4hCwr0
         mhYzWnfH7IOWwD24Ae/hlW0KO6OHrzEa8/tipeEz9B7akbgCUkGFEy9JvtQGl9nN6KZf
         hWp7Y6dwMeqmUciXp+hAUnCtQY/snlMaroNgQBU6CFGt8wvCoLlVhjpni82RGKCFf2r1
         XXDlNiWii1AVcBBD6QeKmQVvabmmq8m0rnEtGJB30ZdXE+YygOAWTFpSIzT1mzkOa3iJ
         /sng==
X-Forwarded-Encrypted: i=1; AJvYcCVuzaz1JaW2Z54qLHTWkjOkErbA3G33/NXHbhpCWsRKeOjM8a3VVp98+f/HNPkKswqoPhUvbdFxhiOxsw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/8ek7YfuBRQTBPvRovxx4OMmZxKCcQbTzgBKgJbjSWnjEQ0wa
	6qhVY/5qFdjYq8sZ4Yd+Fbi9nZLjemjDI/r0IP7WoZ5cnDQaO0OXYuPwhkzxZ9XnVLdlBPhmOop
	B/V2V4u9ga3Bu08c8w0hzYWEZY+w1aomSE/ElD7WTEdtlQ8JZtmZh1Z72fX8QT7VN20MD2CcvCQ
	==
X-Gm-Gg: ASbGnctx1tDAkXHFbYlIn6MQJq04+7MMRULafVWKw4C2nBKV9tIG9JgeurMNR5fY1k8
	IbBzv+89l8ocHRWr2JCD3eXFm/M1eyxnCC6ixEExHtSKWZA/+y9A54X224sJtVX8J4+JOYNIok8
	6aBLgVNtK2J5eHyQ4hJRttZLrxWjrGdDhudUyyiVCUjWeFMQwiljLy3v/zcgMUo5m6BvTPISyFP
	twyoHe9btHV1mK9mSFmh3YGhVuy1Rq8WPBxwjq8Y/0f/EczJl1EW/D1/rQAzoIerVlSFCm+2aSD
	2K/9K88kNqOcFscEfg+t6YZlcVfsqfYPGyYZ73g9tokK3YVcaXban5AXBri+qTHs8NkBRw0KuHy
	mJbx94PMZ1fvI7NM0BiQkSrMfBm/F/oAuyBFXjnN4sRcXz7EWBTI4DoddysW4Tqu/yZfeZGMMO9
	GCKCsgWB9yejCV
X-Received: by 2002:ac8:5990:0:b0:4ed:142:ed5d with SMTP id d75a77b69052e-4ed310a7801mr43843001cf.50.1761921998671;
        Fri, 31 Oct 2025 07:46:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGi6GBRFMR5w7J7UxJRxg2+honWi0anDWZEWvntIfeGPZkEcmVDVsf45tO5pji3r2PVZfKHqA==
X-Received: by 2002:a05:622a:a6c5:b0:4ed:32d8:30d7 with SMTP id d75a77b69052e-4ed32d831cemr37045831cf.81.1761921987203;
        Fri, 31 Oct 2025 07:46:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37a1bfb45ddsm4029761fa.15.2025.10.31.07.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 07:46:26 -0700 (PDT)
Date: Fri, 31 Oct 2025 16:46:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: robh@kernel.org, broonie@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org, perex@perex.cz,
        tiwai@suse.com, srini@kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        alexey.klimov@linaro.org, konradybcio@kernel.org
Subject: Re: [PATCH v3 0/6] ASoC: codecs: lpass-macro: complete sm6115 support
Message-ID: <dsgivtqhje3wnx2iuma3ngnq5kanmt6eautay57raf23vcxi2i@y5b3sg3mn5mh>
References: <20251031120703.590201-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031120703.590201-1-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDEzMyBTYWx0ZWRfXy3DK+AqpGsc2
 yW4dpcsZ9sYQCMCgBfO6iJgeqQdxVJkOAck2CwSr2PAJhOiic8BYFk6ZpZRH7o0hjzX45MX1vC9
 6lOlXW2KPXC+5VcxWYUafcMaCmmPrYShCpYfvFIwHw7eWHObvTLuFzC0DKQmZckjjL2uNIYaqq2
 Qah4ForWQxgsDM9ouUMtCCyGM7sKjK3nyWVy6vcF60be5yAtjRb3VglJsvEFZGKpoLYQipsf206
 of8Wn0mQBHITcXWBUzYw80oiEHaJEd0+cl555Y2YDMkitXnxRRv7/7bVC/LaqsJfT2aFYO2lLq/
 f2iu34gsCJoFfjOGtS5m9nY06SZMkKCbZdC6GNPLv0vE7WCU+S/O4at8Km0YMWj/yUDnYF/bIYy
 Kh80SvDt9zYUpXaqoo1we2osBB5jaA==
X-Authority-Analysis: v=2.4 cv=KePfcAYD c=1 sm=1 tr=0 ts=6904cbd1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=zc_iMHaRStx1I2ifTa0A:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: kUYaRB0YOtkW-QElqJiI28DgGPEMMlcF
X-Proofpoint-GUID: kUYaRB0YOtkW-QElqJiI28DgGPEMMlcF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_04,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310133

On Fri, Oct 31, 2025 at 12:06:57PM +0000, Srinivas Kandagatla wrote:
> This patch series fixes SM6115 lpass codec macro support and adding

Nit: adds

> missing dt-bindings to complete support for SM6115.
> 
> SM6115 lpass codec macro support is added partially and broken to some
> extent, Fix this broken support and add complete lpass macro support for
> this SoC.

What exactly is broken?

> 
> 
> Changes since v2:
> 	- fixed a wrong patch that was sent in v1.
> 
> Changes since v1:
> 	- cleaned up va-macro bindings for clock-names.
> 	- cleaned up va-macro codec driver to include soundwire reset
> 	  for sm6115
> 	- updated tx and rx codec driver and bindings to have a dedicated 
> 	compatible due to changes in number of clocks.
> 
> Srinivas Kandagatla (6):
>   ASoC: codecs: lpass-tx-macro: fix SM6115 support
>   ASoC: dt-bindings: qcom,lpass-rx-macro: Add sm6115 LPASS RX
>   ASoC: dt-bindings: qcom,lpass-va-macro: re-arrange clock-names
>   ASoC: dt-bindings: qcom,lpass-va-macro: Add sm6115 LPASS VA
>   ASoC: codecs: lpass-va-macro: add SM6115 compatible
>   ASoC: codecs: lpass-rx-macro: add SM6115 compatible
> 
>  .../bindings/sound/qcom,lpass-rx-macro.yaml   | 18 +++++++
>  .../bindings/sound/qcom,lpass-va-macro.yaml   | 49 +++++++++++++------
>  sound/soc/codecs/lpass-rx-macro.c             |  3 ++
>  sound/soc/codecs/lpass-tx-macro.c             |  3 +-
>  sound/soc/codecs/lpass-va-macro.c             |  1 +
>  5 files changed, 59 insertions(+), 15 deletions(-)
> 
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry
