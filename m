Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D41E257AED
	for <linux-sound@vger.kernel.org>; Tue, 25 Mar 2025 13:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742909783; cv=none; b=s91tYsGOGYDY1UwPJ2jgsnYrclPtdCZujD2w7Q4YqMM4I1l62fbq+giQ7Nv5oIn3FbbZ+gsyJIesCE8tsUlFebcfcjBk5jL+7Pf1XtXKP/NxdQ9YILP+anggUS/wg8Iy1CH9hi6QU06kzF2Jyt/mzbm5QMHRPUYsOZXMbJISTAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742909783; c=relaxed/simple;
	bh=gPN2utAAjsiMvZu0Nxf/aUkEItSQvAIFsJ0ZxiBeKl4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A3lc/IX4lWSXb9rE05mx/hJWBujFY/vw+q/lzj8fntpvtBNG0DpAfUjKwHu57qbzdGf56SpJqIRREb7pHJD1tnb23RAh2i0XUWHIt6Jk2p9V3BFm2/CCds33aRI6q7rwLzrLus0RsU8segsPtJxlSB5B03zPzKUmsmQSgJj9qfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jWtloS+R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jWtloS+R"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52PDNKnD024710
	for <linux-sound@vger.kernel.org>; Tue, 25 Mar 2025 13:36:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QFtvoYREb3+c0/TlaaDg/yZs
	Di6sSLnunHt2vFjwo44=; b=jWtloS+RIx2O1LdvILEHnrf2TEaHbvmkGL7n7B+q
	4fepTjU4Bw3KeBCRecZBy8Zkh4NMUlt/wIVZXwjVU6wXvMKk6D4JTrLwJN8ZpRPV
	V+N/cut8LT1KbC321/5QXdbT5P3I4KVnOYy8J2t3g84j4DnEj4xTkNbKafqLqVkc
	kjHPdAJLP0SeHa2bAljj5EP5w/K45dZMKlWMFDc6ryDmiNZV1xtTUP2pqYHvN1dc
	oSNor+aHRaeEQcxfGKlJzUuSvI5MK36vgOZ3smxSR5r7ISW6/LQZ5GO9EbbRLV43
	e5CErPHA36A5VTYrQXMvgU3ENHAlVjlyHL9ZfdlOSuoDEg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45k7qjbpfu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 25 Mar 2025 13:36:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5c9abdbd3so235763285a.1
        for <linux-sound@vger.kernel.org>; Tue, 25 Mar 2025 06:36:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742909780; x=1743514580;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QFtvoYREb3+c0/TlaaDg/yZsDi6sSLnunHt2vFjwo44=;
        b=ACg6RlUwrEDzNUJNnPBmOSCXQNvIkSmytgFm4rEUuucq6bIzg3DD2xpTfLsLeG1P4o
         YzPDUvSKLPol/c1L5s4NezKgTaB9uQnbY89mzUMYHu0/WVe25lm9J9fqGETwLSIvz7sb
         BbGJK/3K2JUvW5LzOsemQumkTQQDi/vjtPwaVXNpcaJtSqBKDBaMOX8xDl5F0g+1NqRP
         o0ioOSX53hMCrLu5xcbZLQRa7M4OnfwpxugxXA53vaGLA+EPMhHzZGbAr5z9/c5UBxjL
         fzNkyoMFUu1C4AMHgGIvfr1sCVAXCheLhNSDEsxBkiaKCSshoPShhMBMyItTnhiXCyIJ
         V/EA==
X-Forwarded-Encrypted: i=1; AJvYcCUmmxATZ+2ZXQ00iN1ziJxPP1zKcbuYFs2NTj+mLi8MUZmWOI/zh9jhRyQzegF3I91GvreKacqATvVvfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/0YlO6rb9s6Xr2wk2UHPZvj0MspuCqijV3OUwWz8g0So3aql2
	Txus1Zwx4aFndIXqfIg/MuZvvaYlUKdRP2qiVTqElH7YXI7pey/V7riN73t6WzxuNOGyKjz7MTV
	2rYj84rbffiFsFxCoJo5I146f4UzPdrEyci7DTvNmxycTOoJM2KrNZt5mBtwQuQ==
X-Gm-Gg: ASbGncsf1CQYWiTBYJMdm0HXBZz8CTJI+56gB5LCIYi4Bw6/UuZSftM4GXN6gTJCi31
	r9SH09t1Nkp3cazyj45rOkcbmahOrG5i9iPpmW/tE6qEksdt4/6Xz4NV8RgeQyHKvsoSo0i3yqu
	FHGXj8ZvgrZIvmXnkO54Mq8FdtKq7YTpH8madoMJzQ03Zutd7Oo9TeE5+0xldYp+ueWTtXRDiJ/
	u71Q+8VORK587BVzoTNtuMSeWvsZ7pKVeKFYzHkdWuDClVldSlEMUtV3B5AOWfJij2mbSRB5OiT
	GwW/9K/FNN4dCbuqAvYR0MyvbS1Rd0xGUpr40FtqHl7X4r+ng12RVlCfue+0NDea5MEvLSpxWsT
	ni7Q=
X-Received: by 2002:a05:620a:2613:b0:7c5:4463:29aa with SMTP id af79cd13be357-7c5ba21112amr2537398085a.40.1742909779750;
        Tue, 25 Mar 2025 06:36:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAeE5gudAA1w/fs4f6roUIXv8fjMm3v++opGv4YdUzr/RIMtjswLdIiNSpXtfhsx63sPm7Ug==
X-Received: by 2002:a05:620a:2613:b0:7c5:4463:29aa with SMTP id af79cd13be357-7c5ba21112amr2537392085a.40.1742909779159;
        Tue, 25 Mar 2025 06:36:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d7d7fea69sm18045901fa.59.2025.03.25.06.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 06:36:18 -0700 (PDT)
Date: Tue, 25 Mar 2025 15:36:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: srinivas.kandagatla@linaro.org
Cc: peda@axentia.se, broonie@kernel.org, andersson@kernel.org,
        krzk+dt@kernel.org, ivprusov@salutedevices.com,
        luca.ceresoli@bootlin.com, zhoubinbin@loongson.cn,
        paulha@opensource.cirrus.com, lgirdwood@gmail.com, robh@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, perex@perex.cz,
        tiwai@suse.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, johan+linaro@kernel.org,
        Christopher Obbard <christopher.obbard@linaro.org>
Subject: Re: [PATCH v5 5/6] ASoC: codecs: wcd938x: add mux control support
 for hp audio mux
Message-ID: <vmhrs62ygu2xozcabc6tgy37ta5qskeyks5j3ldponzfijicl4@nudcmxonq7qj>
References: <20250325114058.12083-1-srinivas.kandagatla@linaro.org>
 <20250325114058.12083-6-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250325114058.12083-6-srinivas.kandagatla@linaro.org>
X-Proofpoint-ORIG-GUID: lt8u8uQz2eF6NDA-oVYU8PCDS8xfPxyE
X-Proofpoint-GUID: lt8u8uQz2eF6NDA-oVYU8PCDS8xfPxyE
X-Authority-Analysis: v=2.4 cv=feOty1QF c=1 sm=1 tr=0 ts=67e2b155 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=7I7DV3bktFGIqhyDioEA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_05,2025-03-25_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503250096

On Tue, Mar 25, 2025 at 11:40:57AM +0000, srinivas.kandagatla@linaro.org wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> On some platforms to minimise pop and click during switching between
> CTIA and OMTP headset an additional HiFi mux is used. Most common
> case is that this switch is switched on by default, but on some
> platforms this needs a regulator enable.
> 
> move to using mux control to enable both regulator and handle gpios,
> deprecate the usage of gpio.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
> ---
>  sound/soc/codecs/Kconfig   |  1 +
>  sound/soc/codecs/wcd938x.c | 50 +++++++++++++++++++++++++++++---------
>  2 files changed, 39 insertions(+), 12 deletions(-)
> 
> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> index ee35f3aa5521..a2829d76e108 100644
> --- a/sound/soc/codecs/Kconfig
> +++ b/sound/soc/codecs/Kconfig
> @@ -2226,6 +2226,7 @@ config SND_SOC_WCD938X
>  	tristate
>  	depends on SOUNDWIRE || !SOUNDWIRE
>  	select SND_SOC_WCD_CLASSH
> +	select MULTIPLEXER
>  
>  config SND_SOC_WCD938X_SDW
>  	tristate "WCD9380/WCD9385 Codec - SDW"
> diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
> index dfaa3de31164..209d0b64c8be 100644
> --- a/sound/soc/codecs/wcd938x.c
> +++ b/sound/soc/codecs/wcd938x.c
> @@ -19,6 +19,7 @@
>  #include <linux/regmap.h>
>  #include <sound/soc.h>
>  #include <sound/soc-dapm.h>
> +#include <linux/mux/consumer.h>
>  #include <linux/regulator/consumer.h>
>  
>  #include "wcd-clsh-v2.h"
> @@ -178,6 +179,8 @@ struct wcd938x_priv {
>  	int variant;
>  	int reset_gpio;
>  	struct gpio_desc *us_euro_gpio;
> +	struct mux_control *us_euro_mux;
> +	unsigned int mux_state;
>  	u32 micb1_mv;
>  	u32 micb2_mv;
>  	u32 micb3_mv;
> @@ -3237,15 +3240,22 @@ static void wcd938x_dt_parse_micbias_info(struct device *dev, struct wcd938x_pri
>  
>  static bool wcd938x_swap_gnd_mic(struct snd_soc_component *component)
>  {
> -	int value;
> -
> -	struct wcd938x_priv *wcd938x;
> -
> -	wcd938x = snd_soc_component_get_drvdata(component);
> +	struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
> +	struct device *dev = component->dev;
> +	int ret;
>  
> -	value = gpiod_get_value(wcd938x->us_euro_gpio);
> +	if (wcd938x->us_euro_mux) {
> +		mux_control_deselect(wcd938x->us_euro_mux);
> +		ret = mux_control_try_select(wcd938x->us_euro_mux, !wcd938x->mux_state);
> +		if (ret) {
> +			dev_err(dev, "Error (%d) Unable to select us/euro mux state\n", ret);
> +			return false;


I really don't see any improvement here. If mux_control_try_select()
fails, then on the next toggle mux_control_deselect() would still try to
deselect the mux, although the driver no longer owns it. Likewise in the
remove path the mux_control_deselect() is called unconditionally. I
understand that this driver is the only user of the MUX, so currently
there seems to be no need for any special handling. However if the
hardware design gets more complicated, we can easily face the situation
when selecting the MUX state errors out.

> +		}
> +	} else {
> +		gpiod_set_value(wcd938x->us_euro_gpio, !wcd938x->mux_state);
> +	}
>  
> -	gpiod_set_value(wcd938x->us_euro_gpio, !value);
> +	wcd938x->mux_state = !wcd938x->mux_state;
>  
>  	return true;
>  }

[...]

> @@ -3581,6 +3604,9 @@ static void wcd938x_remove(struct platform_device *pdev)
>  	pm_runtime_set_suspended(dev);
>  	pm_runtime_dont_use_autosuspend(dev);
>  
> +	if (wcd938x->us_euro_mux)
> +		mux_control_deselect(wcd938x->us_euro_mux);
> +
>  	regulator_bulk_disable(WCD938X_MAX_SUPPLY, wcd938x->supplies);
>  	regulator_bulk_free(WCD938X_MAX_SUPPLY, wcd938x->supplies);
>  }
> -- 
> 2.39.5
> 

-- 
With best wishes
Dmitry
