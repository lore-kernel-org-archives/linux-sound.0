Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5D526E704
	for <linux-sound@vger.kernel.org>; Fri, 22 Aug 2025 11:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755862375; cv=none; b=QQGfN+dLuBL4h9NZVlvBHdYKHhonp4y6k1Kj7p80kOsMZXy0t1ccJA2rlGgxYqdCcUGPJiS249CtFSD1NBLJISMoqcZ4/+sOrVeJrvo/+cacXl9jjycGXYwv2aJpN15mJ+wmx//x5TMzlgrKlZw4b9QEWMJFzES5BckYi1uEPQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755862375; c=relaxed/simple;
	bh=MbeLJ7GhzWYYPAdLWZcANylSjO7QkTw3HNqWV+nnRtg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MBvlz1yJQgu3XJXp9zwuDSNnmLEHe9RPGCjwoGz61Q6hdG82HhWeT5bDc/jjmk0E+Vv3hvTnhzjcQ7m7BDFnaj5whjUdneYpQ5LFjFpMXvZJZIR2u0vGNSgVoTq3Q/G+aQnOw/NF9JuRzn4d3gDKbv4bgG3Af4rz9AAaDO2BPBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qx9WY6/F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qx9WY6/F"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UdqZ030673
	for <linux-sound@vger.kernel.org>; Fri, 22 Aug 2025 11:32:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hrhxs/e4R9oX+Zmf2Gb0jkfc
	weHfmbU1GnT4MRTHzDA=; b=Qx9WY6/FcSoUrG8bv/KEZuomjvzNDSeK9dMGlMhv
	Ql/oWRuPU6lw1yu4YDaJbDLEZx7s3CK69m3DzWM9VMnxllDyaRqzFETLNW/sV8tB
	FDt7tlhQZwMJrHs41UCGF09mnsFV9dkXtmC7/Mo57/xkjsCNC2hydsmAOF3l5Owc
	6hVVRokWqww7DjbYsfZ+KWlu11JPfb5NI8F2WvmudhINkUeDEsEqALz+ksjTIXeL
	zD951kzedtFa9nibjXklSBmshqi2b1gS+IzVW7kP4orxpLWFyZ+2UG4iNSxTq5gL
	Vvm1MtMpmMomxdMwft5DXLywg9JsUY4UXm8xxsNWiXXVow==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ngtdpvbw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 22 Aug 2025 11:32:53 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70d93f579a1so12229906d6.1
        for <linux-sound@vger.kernel.org>; Fri, 22 Aug 2025 04:32:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755862372; x=1756467172;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hrhxs/e4R9oX+Zmf2Gb0jkfcweHfmbU1GnT4MRTHzDA=;
        b=Im96uCJCBU6MhDDvImAf87k0tlP4KEHQtzQuix7trJd7jDIDaYsGSiGSBF58yvvjeh
         ZdBrBtO1BddLlHSi8qCpqOCWHZtY8dRDWQpQfjcMHZIwqS/9cJgNQZ9xuY3BOpeAuxFH
         V1GvltKOt10+k2NS+6fbw4/IUgDHonBOLUMIfUHOPDr13CqHKdO1wLMPwt1ZX/aavFV+
         CKP81j8IK1VtGLDhqXZGfZDUbwfj8NkzvtSkfBse1ZwX7Ejt3Jg6i1F2mQOgLEZ/h1wJ
         WxKc+zsww4Y+RUlbn6GY3DSMyMsFC4mDQyzkuIYIQ+/BvxrvWV1QoOKU0EZj9mrudMQ2
         Fkmg==
X-Forwarded-Encrypted: i=1; AJvYcCXEhGT5nmIR+H89zlgYGzoAMKjCfev2aH8QDKvS0loQLG7lqDKA1iimzRwrW4LtA8IAzDT67vq3SXPx4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YweVN+bd5L3cQrn0G6lokW/ROVevQg8SRhcPl70R+Pa7SzBKwyu
	lk+pt3ZhOdT/pDWC2FMUm6waRNV8y16SOIo84gZzicb4uKEzJknVBtxjnQajF4A590dO0z9UJmn
	Wpe/BFhXluJDRTQkMk9dhmpjH80Zd48I4fbKARFnA1NYOKe7BpN4Kbj8Q1UK+RfGDVw==
X-Gm-Gg: ASbGnctEYjkZUVGpiwTBfKE1TyivaDlb753bKK8vveME1QF1+TZBvWCc9a7NPJpIWao
	14be1D4LFUKn6qVsGMWfmtq5L7d6IsFNyCYKYWi3jJCMfTFHw3SwU24XvPEelM9evLd5HRqerDs
	ISltNIQ8RXH0Fd1NX7jQfiGf1eux4csdipya8Cm0UcVQtAbJ4AYrfdtMsTpasrMNyoyswk4k/Aq
	FfretT4QvUSf128uONa/ZsA658w4ZfZVFrPR+8mMJGyCXlx2j2l88FU2JvDyOOvW6CSRqYcFrSD
	nnei2xFf/NoJe4Gu0tW2FlU2tQMV6tYAVC3GH/CipKkSEeqjWYOCP6uv5RTCfUgNOEbeZfxR2qe
	5Vi5uHT1+B1d1SheUjwXc4+RfhQKJocjJ/HKGG/9Z7bgKtP0VfRpQ
X-Received: by 2002:ad4:5b87:0:b0:709:f553:f707 with SMTP id 6a1803df08f44-70d972c25f1mr33591266d6.19.1755862371602;
        Fri, 22 Aug 2025 04:32:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXQAzyXjd3aFI95Ax/cuAFmfG034WYhExtNbk9ibR6IrU4TuKhnCk3Qmr/TKCz6E53o1TsvA==
X-Received: by 2002:ad4:5b87:0:b0:709:f553:f707 with SMTP id 6a1803df08f44-70d972c25f1mr33590746d6.19.1755862370948;
        Fri, 22 Aug 2025 04:32:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55e084e46b7sm1165666e87.48.2025.08.22.04.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 04:32:50 -0700 (PDT)
Date: Fri, 22 Aug 2025 14:32:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: broonie@kernel.org, perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        krzysztof.kozlowski@linaro.org, neil.armstrong@linaro.org
Subject: Re: [PATCH v2 6/8] ASoC: codecs: wcd-common: move status_update
 callback to common
Message-ID: <ld3s5vbjjigkbesnyccyxohnekgbwkbae7zwmjd7u23km3f5fq@awxsaee7yj6m>
References: <20250822104927.2621866-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250822104927.2621866-7-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822104927.2621866-7-srinivas.kandagatla@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=LexlKjfi c=1 sm=1 tr=0 ts=68a85565 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=sWKEhP36mHoA:10 a=EUspDBNiAAAA:8 a=5fLxXxe7Dn6VKq7M814A:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: jwAjWcgYKj_6V_GCM0LtxPvd0k9qi1HQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDEzNSBTYWx0ZWRfXxYCWJrfY/XP3
 wFUdl1TkZLEiXjh1iOUqs2UkAU104SGjY49xXRQcniq8wDSBPJR9z2ShbNpZxwUOIE/Ij5Ogi/L
 jlRSH57DPfZcExQAxCNQzPIICpEnx3oTJJz32bF4R3KzVjASHrAnHiK3nI96GKE2czT1N3CibUK
 5yHu/u5R4mZvFy31dYqV94AN90p5wehOD1GwpJlzy8nEkzc/iK4wh8QBeo9Zu0HhUhclG8d0z1Z
 qBC2wTY94V9smnoKEcNoiy73pAT1N6QvToiVnF8KiL3Ljxaaez0K3QsNY+6Xz0hzkHJ7yWCome9
 rSJYkwo91OgT3WhQU3mcQgERyqY/kMR7TjbvNAU6m1xywuAi77ks7PZ+aoiHLE4sIAiQdKLMEP3
 byZ9a3WSZi5J2iGw4ufIylRaN/kG8Q==
X-Proofpoint-ORIG-GUID: jwAjWcgYKj_6V_GCM0LtxPvd0k9qi1HQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200135

On Fri, Aug 22, 2025 at 11:49:25AM +0100, Srinivas Kandagatla wrote:
> Soundwire update_status, bus_config and interrupt callbacks for wcd937x,
> wcd938x, wcd939x soundwire codecs are exactly identlical, move them to
> common driver to remove this duplicate code.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  sound/soc/codecs/wcd-common.c  | 46 ++++++++++++++++++++++++++++++++++
>  sound/soc/codecs/wcd-common.h  | 10 ++++++++
>  sound/soc/codecs/wcd937x-sdw.c | 28 +++------------------
>  sound/soc/codecs/wcd938x-sdw.c | 41 +++---------------------------
>  sound/soc/codecs/wcd939x-sdw.c | 42 +++----------------------------
>  5 files changed, 67 insertions(+), 100 deletions(-)
> 
> diff --git a/sound/soc/codecs/wcd-common.c b/sound/soc/codecs/wcd-common.c
> index 0c1ffa015403..2592e8ed2d13 100644
> --- a/sound/soc/codecs/wcd-common.c
> +++ b/sound/soc/codecs/wcd-common.c
> @@ -9,9 +9,14 @@
>  #include <linux/printk.h>
>  #include <linux/component.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/soundwire/sdw.h>
> +#include <linux/soundwire/sdw_type.h>
> +#include <linux/regmap.h>
>  
>  #include "wcd-common.h"
>  
> +#define SWRS_SCP_HOST_CLK_DIV2_CTL_BANK(m) (0xE0 + 0x10 * (m))
> +
>  int wcd_get_micb_vout_ctl_val(struct device *dev, u32 micb_mv)
>  {
>  	/* min micbias voltage is 1V and maximum is 2.85V */
> @@ -89,5 +94,46 @@ const struct component_ops wcd_sdw_component_ops = {
>  };
>  EXPORT_SYMBOL_GPL(wcd_sdw_component_ops);
>  
> +int wcd_update_status(struct sdw_slave *slave, enum sdw_slave_status status)
> +{
> +	struct regmap *regmap = dev_get_regmap(&slave->dev, NULL);
> +
> +	if (regmap && status == SDW_SLAVE_ATTACHED) {
> +		/* Write out any cached changes that happened between probe and attach */
> +		regcache_cache_only(regmap, false);
> +		return regcache_sync(regmap);
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(wcd_update_status);
> +
> +int wcd_bus_config(struct sdw_slave *slave, struct sdw_bus_params *params)
> +{
> +	sdw_write(slave, SWRS_SCP_HOST_CLK_DIV2_CTL_BANK(params->next_bank), 0x01);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(wcd_bus_config);
> +
> +int wcd_interrupt_callback(struct sdw_slave *slave, struct irq_domain *slave_irq,
> +		unsigned int wcd_intr_status0, unsigned int wcd_intr_status1,
> +		unsigned int wcd_intr_status2)
> +{
> +	struct regmap *regmap = dev_get_regmap(&slave->dev, NULL);
> +	u32 sts1, sts2, sts3;
> +
> +	do {
> +		handle_nested_irq(irq_find_mapping(slave_irq, 0));
> +		regmap_read(regmap, wcd_intr_status0, &sts1);
> +		regmap_read(regmap, wcd_intr_status1, &sts2);
> +		regmap_read(regmap, wcd_intr_status2, &sts3);
> +
> +	} while (sts1 || sts2 || sts3);
> +
> +	return IRQ_HANDLED;
> +}
> +EXPORT_SYMBOL_GPL(wcd_interrupt_callback);
> +
>  MODULE_DESCRIPTION("Common Qualcomm WCD Codec helpers driver");
>  MODULE_LICENSE("GPL");
> diff --git a/sound/soc/codecs/wcd-common.h b/sound/soc/codecs/wcd-common.h
> index deb78241236b..0cb6365bea4b 100644
> --- a/sound/soc/codecs/wcd-common.h
> +++ b/sound/soc/codecs/wcd-common.h
> @@ -6,11 +6,16 @@
>  #ifndef __WCD_COMMON_H__
>  #define __WCD_COMMON_H___
>  
> +#include <linux/device.h>
> +#include <linux/soundwire/sdw.h>

Just forward-declare structures, there is no need for includes.

> +
>  #define WCD_MIN_MICBIAS_MV	1000
>  #define WCD_DEF_MICBIAS_MV	1800
>  #define WCD_MAX_MICBIAS_MV	2850
>  #define WCD_MAX_MICBIAS		4
>  
> +
> +

Extra empty lines.

>  struct wcd_sdw_ch_info {
>  	int port_num;
>  	unsigned int ch_mask;
> @@ -32,5 +37,10 @@ struct wcd_common {
>  extern const struct component_ops wcd_sdw_component_ops;
>  int wcd_get_micb_vout_ctl_val(struct device *dev, u32 micb_mv);
>  int wcd_dt_parse_micbias_info(struct wcd_common *common);
> +int wcd_update_status(struct sdw_slave *slave, enum sdw_slave_status status);
> +int wcd_bus_config(struct sdw_slave *slave, struct sdw_bus_params *params);
> +int wcd_interrupt_callback(struct sdw_slave *slave, struct irq_domain *slave_irq,
> +		unsigned int wcd_intr_status0, unsigned int wcd_intr_status1,
> +		unsigned int wcd_intr_status2);
>  
>  #endif /* __WCD_COMMON_H___  */

-- 
With best wishes
Dmitry
