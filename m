Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561242DCF47
	for <linux-sound@vger.kernel.org>; Fri, 22 Aug 2025 11:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755861543; cv=none; b=NBbCe3hQQlajEiQwXpM6mhjXbGX8e5MR0pm2xWQN9SYuif6fnVQclUhMSjBumHWThlq6dgxbhXwJn0hNdrRRNSTfUY0sBZrt8EJwhVUFZ8T271boC1SfxaDSY2CKB7aZfG81pmt4jbzLs7CxiKWbRIBLjG0BXazwWG8FHXuL4QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755861543; c=relaxed/simple;
	bh=gjW1E5jQcjS0ncKnacHLHtjFpc2y4txxw5PnY5/3YBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YYjaDokSY8zMZK+99X1kir7NfqzcaJNrZtvePkqNex5y2F46ZMcNbogjAkSnJPCWGbKh3L9iD6H4S74gS1mceH1eIFXAcMPgdOokI1KGZjiU920xAOeHvZNnEa5pVvvIa3te0X141ImZVguPlXNDuL73BCLpGt3B7lUyl48WWqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ht77CVcn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ht77CVcn"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UM9E030532
	for <linux-sound@vger.kernel.org>; Fri, 22 Aug 2025 11:19:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=o6io8yY3zdT7abjrvvZnuU/W
	RzBlcjmfD4PXDAPO+bg=; b=Ht77CVcnLOWR25Y7V3rpkqLm6uzPZ7CC/RY+zKcA
	FLDH4uSFYPAzYSb1WwdychsdrmKTdjTo7xw5O30BpABVZeaNvzbkr42b0eEcA9vW
	Htp47sv33hyFfMIaXGzeWE7/i1AzkWVR/Hl7HlqGAJTBZ2Wr/4qcR0rmDstcAFHj
	GFx7mxf0zJ4emhsXdiGMtEKUf97GP/0A3JqzQCnG6uzdNcGcpAggkA3HCMM7k2F9
	uRv9sguJaC9GMofpUSaBoiP57jieekONlCWeI9OcoGkv4BuazOh66hHvWfk/Fb76
	JRicQIYO5mEQiIukTZCz8aiH6erb9uvJSJz+iNiHbzh92w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ngtdpube-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 22 Aug 2025 11:19:01 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b2b3cd4d00so6773741cf.3
        for <linux-sound@vger.kernel.org>; Fri, 22 Aug 2025 04:19:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755861540; x=1756466340;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o6io8yY3zdT7abjrvvZnuU/WRzBlcjmfD4PXDAPO+bg=;
        b=izLN1KovkaUbS6TiXPnpsVXH3kRvwsSjADcNjnoCCFxoPEVm5WI8FeoTtGeY1eZv6H
         VbGhISuWOhkupFPM2zBtbUUNHU1uX+dB8LGQZnGPX6aXOJz+pTcKS1Gk4ws+M++WG06v
         aUusNbAgZTLNUVUsuFQr4WSv7XRkUm0QElSv4QK7K64tnlsIEIWdssToGXngcKJAiIqp
         qynIb5+r0C5YnjfVX5BRgM+xS+SplooV3u0I8uHW6r2BUpzfqRMvKB35T9yfniuo3No2
         u1w8uDctcOtAN98QfvzoBUvd2g4mTMpBkrwzqYujwcZ18/M4CpfDTG2zLXFQ8hS3OKN+
         KpJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXl+H/1Tk35mx1EtLCTnuSX6VL7GPt0SeSNefuznJr4co+JZ/rWbfniGRVBF5pkvHozgc2COXq551HAfw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvJT+50FtheIbLKVV6negVgiC/fqTPCG72sf2wDL4PzSdfRcXz
	F5T4pjACAXYJ7W99nC6s1hxtyZeGfGgdZITN6Vwr7AqdEwS9vvfrVg5eO73nv8xG26KWeicJd0Y
	BhQofmLHbmi/m0aZX2FgH5FCBywfTzYWZTCvHkAzVf6S0Egs53T+Ic52PVsO4zJen2Q==
X-Gm-Gg: ASbGncvGO+jzVoeHJCAxq9emcnKVylrVkWxEflEoCETvG88ecMMnXV4Ore0dzbKg/V9
	jdRt66l2BcNlg69gsGiLE+UnccYvnYimwMdzJK0douXIA9hb10gJ3ccLDomTXiGzxvzo+TyujJk
	fpIcjCZtHLEY2aaXTfyDUqFgDqxSbK2qPB2AILacGHjxIskTBOtu1CpeJneqESX/y0seI+fhGMA
	V9KXGya58IpBEnihykNaZ+PokARtTlq+2y9WsOENoV/q/N8usSqMS+mE7RYpOpiCagGNp8DPihX
	oK+6HeuhqyJAdBwnZTfz8CgNENwd6OvbzYcBlvEvXEeMErAPj175/OKLUkNfefLgykcOaKFrdE4
	oCZWdOdLLw7Lhxnq+nEPQj0Tn8KzNQoZUD1XzhwYRb8ZfC9KvcDWp
X-Received: by 2002:a05:622a:343:b0:4b0:7021:50f with SMTP id d75a77b69052e-4b2aaa824cfmr28024821cf.33.1755861539893;
        Fri, 22 Aug 2025 04:18:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEk4ooQUwy4SsDbqUvmLri6Kkkne1Ak40MgYMIctMWFEgd8h7TTpELQ+1FzhQRj2zoHeDaDDg==
X-Received: by 2002:a05:622a:343:b0:4b0:7021:50f with SMTP id d75a77b69052e-4b2aaa824cfmr28024571cf.33.1755861539332;
        Fri, 22 Aug 2025 04:18:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef368d34sm3442811e87.58.2025.08.22.04.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 04:18:58 -0700 (PDT)
Date: Fri, 22 Aug 2025 14:18:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: broonie@kernel.org, perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        krzysztof.kozlowski@linaro.org, neil.armstrong@linaro.org
Subject: Re: [PATCH v2 2/8] ASoC: codecs: wcd: add common helper for wcd
 codecs
Message-ID: <kmm4e5bg7uehmlsgrfhzo4agr6ga6d5gxtpxq5sg4t3wql5p6m@llwyz4kzsj7y>
References: <20250822104927.2621866-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250822104927.2621866-3-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822104927.2621866-3-srinivas.kandagatla@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=LexlKjfi c=1 sm=1 tr=0 ts=68a85225 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=c23LMRYEHR_IeyHnjawA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 00mvLEGbYMgw5ESsd5EDk4MHcEm6Udti
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDEzNSBTYWx0ZWRfX75CwiXs5JuB7
 hCpLTAjsyDK9bkra6ryIq9B6Avc54neA/iAY3vBt9EsfHh4m0EFMd2IQVTXOOi2tpfquw+dnwoL
 zMQwUS/FkdF7xE28HPo0xbRE+30/plQVfFD0V0mr+yMNS2/aFUuRaV/7/UExye7y7/L7+D6/MDT
 ZbXoQ4E+uELA38jpPed13JmVz2+/XTWlxm17wpzMR5eaXopuBNBp2vbcv/fRYQxVUyUMoI9hWgh
 4oiknF9OiLfAy/jrqpWcxXFinD/zIX/vdD6oK/rudGX6B6hHblwLWWlZTQOhFtUbxH0hIdfLTRf
 xpf+6xzQEG7v0Wd3UQMvA2ZGHY3dlncKSA8ttmsd7KYQHGnRnmYIatTPT1TYtXYG5WSk4sPR5B1
 n3yyy7jB22vKLkUx+R0Fuwt9RJzTSA==
X-Proofpoint-ORIG-GUID: 00mvLEGbYMgw5ESsd5EDk4MHcEm6Udti
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200135

On Fri, Aug 22, 2025 at 11:49:21AM +0100, Srinivas Kandagatla wrote:
> All the Qualcomm WCD codecs have most of its code duplicated across all
> these 3/4 drivers. This patch is an attempt to remove those duplicate

See Documentation/process/submitting-patches.rst, "This patch"

> parts by adding a common helper library for these codecs.
> 
> To start with move all the micbias parsing and voltage settings these
> are identical in WCD934x, WCD937x, WCD938x and WCD939x codec driver.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  sound/soc/codecs/Kconfig      |  8 ++++
>  sound/soc/codecs/Makefile     |  2 +
>  sound/soc/codecs/wcd-common.c | 66 ++++++++++++++++++++++++++
>  sound/soc/codecs/wcd-common.h | 24 ++++++++++
>  sound/soc/codecs/wcd934x.c    | 82 +++++++++-----------------------
>  sound/soc/codecs/wcd937x.c    | 75 +++++++----------------------
>  sound/soc/codecs/wcd937x.h    |  6 +--
>  sound/soc/codecs/wcd938x.c    | 87 +++++++---------------------------
>  sound/soc/codecs/wcd938x.h    |  1 +
>  sound/soc/codecs/wcd939x.c    | 89 +++++++----------------------------
>  sound/soc/codecs/wcd939x.h    |  1 +
>  11 files changed, 176 insertions(+), 265 deletions(-)
>  create mode 100644 sound/soc/codecs/wcd-common.c
>  create mode 100644 sound/soc/codecs/wcd-common.h
> 
> diff --git a/sound/soc/codecs/wcd-common.h b/sound/soc/codecs/wcd-common.h
> new file mode 100644
> index 000000000000..08c8e7ce9814
> --- /dev/null
> +++ b/sound/soc/codecs/wcd-common.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.

Please use the correct copyright according to guidelines.

> + */
> +
> +#ifndef __WCD_COMMON_H__
> +#define __WCD_COMMON_H___
> +
> +#define WCD_MIN_MICBIAS_MV	1000
> +#define WCD_DEF_MICBIAS_MV	1800
> +#define WCD_MAX_MICBIAS_MV	2850

These do not belong to a public header.

> +#define WCD_MAX_MICBIAS		4
> +
> +struct wcd_common {
> +	struct device *dev;
> +	int max_bias;
> +	u32 micb_mv[WCD_MAX_MICBIAS];
> +	u32 micb_vout[WCD_MAX_MICBIAS];
> +};
> +
> +int wcd_get_micb_vout_ctl_val(struct device *dev, u32 micb_mv);
> +int wcd_dt_parse_micbias_info(struct wcd_common *common);
> +
> +#endif /* __WCD_COMMON_H___  */

> diff --git a/sound/soc/codecs/wcd939x.h b/sound/soc/codecs/wcd939x.h
> index e70445b1a4bc..f587cf22f86f 100644
> --- a/sound/soc/codecs/wcd939x.h
> +++ b/sound/soc/codecs/wcd939x.h
> @@ -8,6 +8,7 @@
>  #define __WCD939X_H__
>  #include <linux/soundwire/sdw.h>
>  #include <linux/soundwire/sdw_type.h>
> +#include "wcd-common.h"

No need to. Please include headers where they are actually used.

>  
>  #define WCD939X_BASE					   (0x3000)
>  #define WCD939X_ANA_PAGE				   (0x3000)
> -- 
> 2.50.0
> 

-- 
With best wishes
Dmitry
