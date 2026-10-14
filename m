Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB754496D34
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 07:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791964505; cv=none; b=ijCttyuXp/PiFPvJvPh06JTLypthCD7FaYLe5fXIwwvKlSSl7faYiqncIXwZ7W5DhGTatZuf/8xlP8iAa3OEkuy4gRoX5IYYpIc+DSi+ffFKUkRtZMnG3dxWLJn0AWNHqn4SX0vyJMeai7BAC7bSCtQvj/7iWEts1hvdHfx5Y4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791964505; c=relaxed/simple;
	bh=x+pkNXyj9mUs8CswHvCXByD7Xf3NSeZHXFpTPVUyCFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D62bi6j3VuhvrzcSDntqOi8aql31QAMqKW66h15GL0KlL86/wOhWFSDtJKBP3wxffXvgjDSBJNZ3zuusxRO/5bdX0kluXExNY+rsb4rNef+ydRFpnDi/9VnZsVdE7gHEmrLMDGhFNViORdrICxNqWYi/tf0PrXQtPCDdz0P3xaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h/JNGlol; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QyS5Q+2S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h/JNGlol";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QyS5Q+2S"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E67hB32685171
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 07:55:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y5Xc6vSxrozHQHSbAl6Ed09G//18eP1xPeeZEIsnEfk=; b=h/JNGlolk7QpnL4X
	gM9HCMvEsAd9HoGHOU2jDcddzbOzt9RGFJt/i07qpSPqcj1wf4mqez7Xi7e9Ya0h
	HP+UxFaxjBISZ+A1SrIzwSekKtYE9vKoCXs25wvGeC72pjt337/4LHv/5rQkK+5J
	WNksCbHAmOaZavwWMZAUrmIq1aASVNBdJosgXyzkxQkIs86EqNCHKwaskcLcQefS
	SdR+39AX+SieMUSgtxCGiDv4HqRchMfAEtroExSQ46yC9sfbCZPt+Ylxral/i17Q
	/vUm7+xuEVu5NwKXG/D73FvcO0dJ0A0RHsDjs4ptlyK4PUD0VDa+1DHBPgEpQWlQ
	5bCJOQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha46u0dnm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 07:55:03 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbb20f82a0eso2795431a12.0
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 00:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791964503; x=1792569303; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y5Xc6vSxrozHQHSbAl6Ed09G//18eP1xPeeZEIsnEfk=;
        b=QyS5Q+2SXVHlDidk8Y+tqX4oxpNb5gEpswW9CF/ql5xyOBtVDJ+8IV9wv8RAjBPTCf
         5cRlhcbN1oebAEZfEQE6QIMlXxaJVrpZ0hcRK5LZC8EcayQQPwugmIsYDEtZF7FNneG9
         xzfYIb3KF9vQNuaqZavoxzG/uwb0Q9O87Vfj5fTNEpJbQcCI6SvhRZLzIgI3t0tL2uFP
         oLF8tMnNnw1Ur1xqoxmsHllXhoB649LtyLvDDeFldyRwTYLChOZ3uP7f8agDrE6PMUar
         4wK8RvQi7AVDvX+/T2GPRWeeiHvJorEdhP2Pidh7yYQJJI/z4BDhBAVWkXvMeV+tVfml
         8rCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791964503; x=1792569303;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y5Xc6vSxrozHQHSbAl6Ed09G//18eP1xPeeZEIsnEfk=;
        b=WF65FgqniN0CNncOzJ/N1Aga67KxwM2tPuJJAnH2zdvZ/kjxPSruz9W6NQ8aaKrD8G
         qoPkt1y83C3y1PoKnDT2AXl+qeb1xUOxzi34eDUFCw+0x76CtjWVkxuziqPjz0jgFuY9
         VKMNZOVcZ1mfDImHDHWQOGhMxBQzSzokEaStx9K1giOPh6Ayg8Q9BTnj4HVaIuuF+BLC
         u0FQMWNMpiW/bpYJsF2BQOwbCsa6fPKWJCO8isvzXHeHEasTPGFQChkcTYk95+MrOd7q
         wFj9j6NXYtTgVTzBgCg6jbf2kFj2/VfU9s28m+L00oo5uKj64Nf4JZaAttkwJWhAxeiE
         rGyQ==
X-Forwarded-Encrypted: i=1; AKwUvBzgHOOZVCTa56rCjWTwosdoP7yMGFjgT0Gsu/rgRkBLH5LXa6lq+FMN7q6vUhur4nqCIkGOQtqMLIyBXg==@vger.kernel.org
X-Gm-Message-State: AFq9FYItvUc6BZwLJjyrESd7ZX87q+pbcLcVD/AAxgGzIx6voXVxcvRD
	ZIKqOuzjeAkXFBxOhw5fTzTYGtQzeaPy+0P9MQw/m5DwBsz/xKutFlta0q4aft+620+mF9+uPfo
	w0uWhZr7C69dduqYBikGypzfXNpZMv6TLrPF54VRd6lEuNTmU+iUqC+h/gf5kmnw9xw==
X-Gm-Gg: AYBFou34+rla+jzqfDH4aRw+qvs9pf6q1PLvMLZ9vFxD3Kzr9swtWMOOET3xT/lkscp
	8yknXSAuxzHecT8Pokp7nB6x4P3SBthP89caKJb/jsWh4UqS+lZEkzkbuk6GPmjbwTB1jU9drxS
	XoTtvaT68gYNmxXpSx1GL4dJCJ4vSDZHGu2Hcelvl7UpeO8m2u668yzVkFbnkNiQSD9kwXVm1mQ
	2B0Mi2DUNVOSCLzdI63zi6+jNKhi7ynqfg+4Fs8sTTOl0hLjW1sIML/yoRLeseEfeygSL1Ncu3K
	QOQyOQ5eQFnmYjBOyrI+XcG1xKu7b/r4nE4BHmkx/154cGrDIW9RnBos2d35iE5DE2RubhAj98P
	Hg0B1b98gUNxacrSiN13FpGkuK1E=
X-Received: by 2002:a05:6a21:9217:b0:3dd:a196:3096 with SMTP id adf61e73a8af0-3e16bf12e59mr13168767637.70.1791964502492;
        Wed, 14 Oct 2026 00:55:02 -0700 (PDT)
X-Received: by 2002:a05:6a21:9217:b0:3dd:a196:3096 with SMTP id adf61e73a8af0-3e16bf12e59mr13168731637.70.1791964501765;
        Wed, 14 Oct 2026 00:55:01 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d802a459asm782006b3a.14.2026.10.14.00.54.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 00:54:59 -0700 (PDT)
Message-ID: <43f28a5f-09a9-4449-b784-ca640a442528@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 13:24:52 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 07/10] ASoC: qcom: Add QAIF PCM operations
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        ajay.nandam@oss.qualcomm.com
References: <20261013-b4-qaif-shikra-audio-v9-0-f3022e28f2fd@oss.qualcomm.com>
 <20261013-b4-qaif-shikra-audio-v9-7-f3022e28f2fd@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261013-b4-qaif-shikra-audio-v9-7-f3022e28f2fd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzMSBTYWx0ZWRfX2xlfezkDxzi1
 RMmRRWWerfjhR/PEo83V274hJGYGdA+NWLq/bvsZKTVy0OoXCjYxecow/N1vvFmEbOsgDBmyVph
 ScgQ87hRE16i1Z9t9N2GwTLxudc+y24=
X-Proofpoint-GUID: hJEL3E3EN5B2uWoawH4DHbYeQhFmnQLl
X-Authority-Analysis: v=2.4 cv=Y6ttIReN c=1 sm=1 tr=0 ts=6acf3557 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=23ijev90tiKKSBFg3Y8A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzMSBTYWx0ZWRfXx3Ub32/8sHRT
 z0J6oXvhrMXSsvG3LTNZMxoPj7vnTb9Pr/MyTdTOr4GhavOjEjGw6fiODfJuM7rtxc+nFIYr7zJ
 12L32JG7c/XFTS1F7Uc0J01fLbq9CEfYpiZ0eBhn7xxqmFPdmUQ+yXrpBZipz7DbdD6TQPUrFNb
 +hz/4T6oVlhhFec6f0nZfm9HotWy2iLgIjlIGCb0fodXyKvDoqgtISPyHKyhPJuyRel1mgL43hG
 maNEXcKY4pJvPpXh3Jdlf2Cj+Rq9LUIifXixDTwH7UltOSxNMSWO4QKvNVawcseDNc7y8/1RDh9
 79aYL0f1QG0lpMkwv33g5Vfe8A5WK6BkPQjHst671p6VNif9W+BmEfjfHQG0/fBVX+mU1rR/jTz
 jwbqmGGcjueR1/r5sgnCMIZ4xm3aVH9tN5/vawG0SgTbg6q9ZKcM2g8YNT5dDt9E7Vt85E2yy1n
 N9yb3Lkh1uHc3FZdZFA==
X-Proofpoint-ORIG-GUID: hJEL3E3EN5B2uWoawH4DHbYeQhFmnQLl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140031



On 10/13/2026 11:21 AM, Harendra Gautam wrote:
> Add the PCM platform callbacks needed to use QAIF DAIs for playback
> and capture.
> 
> Pre-allocate the DMA buffer via snd_pcm_set_fixed_buffer_all() in the
> .pcm_new callback. In open(), reserve a stream DMA index and perform
> the one-time QAIF hardware initialization. Program the DMA configuration
> in hw_params(), set the DMA clock rate and program the DMA base, buffer
> and period registers in prepare(), and report the current DMA position
> from pointer(). Release all resources in close().
> 
> The DMA clocks themselves are prepared and enabled by the CPU DAI
> driver's startup and shutdown callbacks.
> 
> Support mmap() for CIF and AIF paths.
> 
> Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>

LGTM

Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

> ---
>   sound/soc/qcom/qaif-platform.c | 464 +++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 464 insertions(+)
> 
> diff --git a/sound/soc/qcom/qaif-platform.c b/sound/soc/qcom/qaif-platform.c
> new file mode 100644
> index 000000000000..e24c4252825e
> --- /dev/null
> +++ b/sound/soc/qcom/qaif-platform.c
> @@ -0,0 +1,464 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + *
> + * qaif-platform.c -- ALSA SoC PCM platform driver for the Qualcomm Audio Interface (QAIF)
> + */
> +
> +#include <linux/dma-mapping.h>
> +#include <linux/export.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <sound/pcm_params.h>
> +#include <sound/soc.h>
> +#include "qaif-reg.h"
> +#include "qaif.h"
> +
> +#define DRV_NAME "qaif-platform"
> +
> +/* period: 5ms @ 48kHz/1ch/S16 min, 20ms @ 48kHz/8ch/S32 max */
> +#define QAIF_PLATFORM_PERIOD_BYTES_MIN		(48 * 5 * 1 * 2)	/* 480 B */
> +#define QAIF_PLATFORM_PERIOD_BYTES_MAX		(48 * 20 * 8 * 4)	/* 30720 B */
> +#define QAIF_PLATFORM_PERIODS_MIN		2
> +#define QAIF_PLATFORM_PERIODS_MAX		4
> +/* QAIF_PLATFORM_PERIODS_MAX * QAIF_PLATFORM_PERIOD_BYTES_MAX = 122880 B */
> +#define QAIF_PLATFORM_BUFFER_BYTES_MAX		\
> +	(QAIF_PLATFORM_PERIODS_MAX * QAIF_PLATFORM_PERIOD_BYTES_MAX)
> +
> +/* DMA CFG register bit positions */
> +#define QAIF_DMACFG_SHRAM_WM_MASK	GENMASK(11, 0)
> +#define QAIF_DMACFG_BURST4_BIT		BIT(18)
> +#define QAIF_DMACFG_DYNCLK_BIT		BIT(24)
> +
> +/* DMA CTL register bit positions */
> +#define QAIF_DMACTL_ENABLE_BIT		BIT(0)
> +#define QAIF_ALL_CLIENTS_MASK		(QAIF_BITMASK_AIF_RDDMA_WRDMA | \
> +					 QAIF_BITMASK_CIF_RDDMA_WRDMA)
> +
> +static const struct snd_pcm_hardware qaif_platform_hardware = {
> +	.info			=	SNDRV_PCM_INFO_MMAP |
> +					SNDRV_PCM_INFO_MMAP_VALID |
> +					SNDRV_PCM_INFO_INTERLEAVED |
> +					SNDRV_PCM_INFO_PAUSE |
> +					SNDRV_PCM_INFO_RESUME,
> +	.formats		=	SNDRV_PCM_FMTBIT_S16 |
> +					SNDRV_PCM_FMTBIT_S24 |
> +					SNDRV_PCM_FMTBIT_S32,
> +	.rates			=	SNDRV_PCM_RATE_8000_192000,
> +	.rate_min		=	8000,
> +	.rate_max		=	192000,
> +	.channels_min		=	1,
> +	.channels_max		=	8,
> +	.buffer_bytes_max	=	QAIF_PLATFORM_BUFFER_BYTES_MAX,
> +	.period_bytes_min	=	QAIF_PLATFORM_PERIOD_BYTES_MIN,
> +	.period_bytes_max	=	QAIF_PLATFORM_PERIOD_BYTES_MAX,
> +	.periods_min		=	QAIF_PLATFORM_PERIODS_MIN,
> +	.periods_max		=	QAIF_PLATFORM_PERIODS_MAX,
> +	.fifo_size		=	0,
> +};
> +
> +static int qaif_map_ee_resource(struct qaif_drv_data *drvdata)
> +{
> +	const struct qaif_variant *v = drvdata->variant;
> +	struct regmap *map = drvdata->audio_qaif_map;
> +	int ret;
> +
> +	ret = regmap_write(map, QAIF_EE_RDDMA_MAP_REG(v), GENMASK(v->num_rddma - 1, 0));
> +	if (ret)
> +		return ret;
> +	ret = regmap_write(map, QAIF_EE_WRDMA_MAP_REG(v), GENMASK(v->num_wrdma - 1, 0));
> +	if (ret)
> +		return ret;
> +	if (v->num_intf > 0) {
> +		ret = regmap_write(map, QAIF_EE_INTF_MAP_REG(v), GENMASK(v->num_intf - 1, 0));
> +		if (ret)
> +			return ret;
> +	}
> +	ret = regmap_write(map, QAIF_EE_CODEC_RDDMA_MAP_REG(v),
> +			   GENMASK(v->num_codec_rddma - 1, 0));
> +	if (ret)
> +		return ret;
> +	return regmap_write(map, QAIF_EE_CODEC_WRDMA_MAP_REG(v),
> +			    GENMASK(v->num_codec_wrdma - 1, 0));
> +}
> +
> +static int qaif_map_dma_path(struct qaif_drv_data *drvdata)
> +{
> +	struct regmap *map = drvdata->audio_qaif_map;
> +	int ret;
> +
> +	if (drvdata->variant->qxm_type != QAIF_QXM0) {
> +		dev_err(regmap_get_device(map),
> +			"only QXM0 is supported, qxm_type=%d\n",
> +			drvdata->variant->qxm_type);
> +		return -EINVAL;
> +	}
> +
> +	ret = regmap_write(map, QAIF_RDDMA_MAP_QXM, QAIF_QXM0);
> +	if (ret)
> +		return ret;
> +	ret = regmap_write(map, QAIF_WRDMA_MAP_QXM, QAIF_QXM0);
> +	if (ret)
> +		return ret;
> +	ret = regmap_write(map, QAIF_CDC_RDDMA_MAP_QXM, QAIF_QXM0);
> +	if (ret)
> +		return ret;
> +	return regmap_write(map, QAIF_CDC_WRDMA_MAP_QXM, QAIF_QXM0);
> +}
> +
> +static int qaif_config_shram(struct qaif_drv_data *drvdata)
> +{
> +	const struct qaif_variant *v = drvdata->variant;
> +	struct regmap *map = drvdata->audio_qaif_map;
> +	u32 start_addr, shram_len;
> +	int ret, i;
> +
> +	if (v->qxm_type != QAIF_QXM0) {
> +		dev_err(regmap_get_device(map),
> +			"only QXM0 is supported, qxm_type=%d\n",
> +			v->qxm_type);
> +		return -EINVAL;
> +	}
> +
> +	start_addr = v->rddma_shram_start_addr[QAIF_AIF_DMA];
> +	shram_len = v->rddma_shram_len;
> +	for (i = 0; i < v->num_rddma; i++) {
> +		ret = regmap_write(map, QAIF_RDDMA_QXM0_SHRAM_ST_ADDR(i),
> +				   start_addr + (shram_len * i));
> +		if (ret)
> +			return ret;
> +		ret = regmap_write(map, QAIF_RDDMA_QXM0_SHRAM_LEN(i), shram_len);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	start_addr = v->wrdma_shram_start_addr[QAIF_AIF_DMA];
> +	shram_len = v->wrdma_shram_len;
> +	for (i = 0; i < v->num_wrdma; i++) {
> +		ret = regmap_write(map, QAIF_WRDMA_QXM0_SHRAM_ST_ADDR(i),
> +				   start_addr + (shram_len * i));
> +		if (ret)
> +			return ret;
> +		ret = regmap_write(map, QAIF_WRDMA_QXM0_SHRAM_LEN(i), shram_len);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	start_addr = v->rddma_shram_start_addr[QAIF_CIF_DMA];
> +	shram_len = v->rddma_shram_len;
> +	for (i = 0; i < v->num_codec_rddma; i++) {
> +		ret = regmap_write(map, QAIF_CDC_RDDMA_QXM0_SHRAM_ST_ADDR(i),
> +				   start_addr + (shram_len * i));
> +		if (ret)
> +			return ret;
> +		ret = regmap_write(map, QAIF_CDC_RDDMA_QXM0_SHRAM_LEN(i), shram_len);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	start_addr = v->wrdma_shram_start_addr[QAIF_CIF_DMA];
> +	shram_len = v->wrdma_shram_len;
> +	for (i = 0; i < v->num_codec_wrdma; i++) {
> +		ret = regmap_write(map, QAIF_CDC_WRDMA_QXM0_SHRAM_ST_ADDR(i),
> +				   start_addr + (shram_len * i));
> +		if (ret)
> +			return ret;
> +		ret = regmap_write(map, QAIF_CDC_WRDMA_QXM0_SHRAM_LEN(i), shram_len);
> +		if (ret)
> +			return ret;
> +	}
> +	return 0;
> +}
> +
> +static int qaif_init(struct snd_soc_component *component)
> +{
> +	struct qaif_drv_data *drvdata = snd_soc_component_get_drvdata(component);
> +	int ret;
> +
> +	if (drvdata->qaif_hw_configured)
> +		return 0;
> +
> +	ret = qaif_config_shram(drvdata);
> +	if (ret) {
> +		dev_err(component->dev, "failed to config shram: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = qaif_map_ee_resource(drvdata);
> +	if (ret) {
> +		dev_err(component->dev, "failed to map EE resources: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = qaif_map_dma_path(drvdata);
> +	if (ret)
> +		return ret;
> +
> +	drvdata->qaif_hw_configured = true;
> +	return 0;
> +}
> +
> +static int qaif_platform_pcmops_open(struct snd_soc_component *component,
> +				     struct snd_pcm_substream *substream)
> +{
> +	struct snd_pcm_runtime *runtime = substream->runtime;
> +	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
> +	struct qaif_drv_data *drvdata = snd_soc_component_get_drvdata(component);
> +	const struct qaif_variant *v = drvdata->variant;
> +	unsigned int dai_id = cpu_dai->driver->id;
> +	struct qaif_pcm_data *data;
> +	int ret, stream_dma_idx, dma_reg_idx, dir = substream->stream;
> +
> +	dma_reg_idx = v->get_dma_idx(dai_id);
> +	if (dma_reg_idx < 0) {
> +		dev_err(component->dev, "invalid DMA register index for DAI %u: %d\n",
> +			dai_id, dma_reg_idx);
> +		return dma_reg_idx;
> +	}
> +
> +	data = kzalloc(sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +	runtime->private_data = data;
> +
> +	mutex_lock(&drvdata->stream_lock);
> +	stream_dma_idx = v->alloc_stream_dma_idx(drvdata, dir, dai_id);
> +	mutex_unlock(&drvdata->stream_lock);
> +	if (stream_dma_idx < 0) {
> +		ret = stream_dma_idx;
> +		goto err_free_data;
> +	}
> +
> +	data->stream_dma_idx = stream_dma_idx;
> +	data->dma_reg_idx = dma_reg_idx;
> +
> +	if (qaif_is_cif_port(dai_id))
> +		WRITE_ONCE(drvdata->cif_substream[stream_dma_idx], substream);
> +	else
> +		WRITE_ONCE(drvdata->aif_substream[stream_dma_idx], substream);
> +
> +	snd_soc_set_runtime_hwparams(substream, &qaif_platform_hardware);
> +
> +	/*
> +	 * The DMA buffer/period length registers are programmed in 64-bit
> +	 * (8-byte) words, so constrain buffer and period sizes to that step
> +	 * to keep the ALSA and hardware sizes identical.
> +	 */
> +	ret = snd_pcm_hw_constraint_step(runtime, 0,
> +					 SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
> +					 BIT(QAIF_DMA_BYTES_TO_WORDS_SHIFT));
> +	if (ret >= 0)
> +		ret = snd_pcm_hw_constraint_step(runtime, 0,
> +						 SNDRV_PCM_HW_PARAM_PERIOD_BYTES,
> +						 BIT(QAIF_DMA_BYTES_TO_WORDS_SHIFT));
> +	if (ret >= 0)
> +		ret = snd_pcm_hw_constraint_integer(runtime,
> +						    SNDRV_PCM_HW_PARAM_PERIODS);
> +	if (ret < 0) {
> +		dev_err(soc_runtime->dev, "setting constraints failed: %d\n", ret);
> +		if (qaif_is_cif_port(dai_id))
> +			WRITE_ONCE(drvdata->cif_substream[stream_dma_idx], NULL);
> +		else
> +			WRITE_ONCE(drvdata->aif_substream[stream_dma_idx], NULL);
> +		mutex_lock(&drvdata->stream_lock);
> +		v->free_stream_dma_idx(drvdata, stream_dma_idx, dai_id);
> +		mutex_unlock(&drvdata->stream_lock);
> +		goto err_free_data;
> +	}
> +	return 0;
> +
> +err_free_data:
> +	kfree(data);
> +	return ret;
> +}
> +
> +static int qaif_platform_pcmops_close(struct snd_soc_component *component,
> +				      struct snd_pcm_substream *substream)
> +{
> +	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
> +	struct qaif_drv_data *drvdata = snd_soc_component_get_drvdata(component);
> +	const struct qaif_variant *v = drvdata->variant;
> +	struct qaif_pcm_data *data = substream->runtime->private_data;
> +	unsigned int dai_id = cpu_dai->driver->id;
> +
> +	if (qaif_is_cif_port(dai_id))
> +		WRITE_ONCE(drvdata->cif_substream[data->stream_dma_idx], NULL);
> +	else
> +		WRITE_ONCE(drvdata->aif_substream[data->stream_dma_idx], NULL);
> +
> +	mutex_lock(&drvdata->stream_lock);
> +	v->free_stream_dma_idx(drvdata, data->stream_dma_idx, dai_id);
> +	mutex_unlock(&drvdata->stream_lock);
> +
> +	substream->runtime->private_data = NULL;
> +	kfree(data);
> +	return 0;
> +}
> +
> +static int qaif_platform_pcmops_hw_params(struct snd_soc_component *component,
> +					  struct snd_pcm_substream *substream,
> +					  struct snd_pcm_hw_params *params)
> +{
> +	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
> +	struct qaif_drv_data *drvdata = snd_soc_component_get_drvdata(component);
> +	const struct qaif_variant *v = drvdata->variant;
> +	struct qaif_pcm_data *data = substream->runtime->private_data;
> +	unsigned int dai_id = cpu_dai->driver->id;
> +	int idx = data->dma_reg_idx;
> +	int ret;
> +
> +	mutex_lock(&drvdata->stream_lock);
> +	ret = qaif_init(component);
> +	mutex_unlock(&drvdata->stream_lock);
> +	if (ret) {
> +		dev_err(soc_runtime->dev, "qaif_init failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = regmap_update_bits(drvdata->audio_qaif_map,
> +				 qaif_dmacfg_reg(v, idx, substream->stream, dai_id),
> +				 QAIF_DMACFG_BURST4_BIT | QAIF_DMACFG_SHRAM_WM_MASK,
> +				 QAIF_DMACFG_BURST4_BIT | QAIF_DMACTL_WM_5);
> +	if (ret)
> +		dev_err(soc_runtime->dev, "error updating DMA CFG: %d\n", ret);
> +	return ret;
> +}
> +
> +static int qaif_platform_pcmops_hw_free(struct snd_soc_component *component,
> +					struct snd_pcm_substream *substream)
> +{
> +	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
> +	struct qaif_drv_data *drvdata = snd_soc_component_get_drvdata(component);
> +	const struct qaif_variant *v = drvdata->variant;
> +	struct qaif_pcm_data *data = substream->runtime->private_data;
> +	unsigned int dai_id = cpu_dai->driver->id;
> +	int idx = data->dma_reg_idx;
> +	int ret;
> +
> +	ret = regmap_update_bits(drvdata->audio_qaif_map,
> +				 qaif_dmactl_reg(v, idx, substream->stream, dai_id),
> +				 QAIF_DMACTL_ENABLE_BIT, 0);
> +	if (ret) {
> +		dev_err(soc_runtime->dev, "error disabling DMA: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = regmap_write(drvdata->audio_qaif_map,
> +			   qaif_dmacfg_reg(v, idx, substream->stream, dai_id), 0);
> +	if (ret)
> +		dev_err(soc_runtime->dev, "error clearing DMA CFG: %d\n", ret);
> +	return ret;
> +}
> +
> +static int qaif_platform_pcmops_prepare(struct snd_soc_component *component,
> +					struct snd_pcm_substream *substream)
> +{
> +	struct snd_pcm_runtime *runtime = substream->runtime;
> +	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
> +	struct qaif_drv_data *drvdata = snd_soc_component_get_drvdata(component);
> +	const struct qaif_variant *v = drvdata->variant;
> +	struct regmap *map = drvdata->audio_qaif_map;
> +	struct qaif_pcm_data *data = runtime->private_data;
> +	unsigned int dai_id = cpu_dai->driver->id;
> +	int idx = data->dma_reg_idx;
> +	int ret, dir = substream->stream;
> +
> +	ret = clk_set_rate(drvdata->aud_dma_clk, QAIF_DMA_CLOCK_FREQ);
> +	if (ret) {
> +		dev_err(soc_runtime->dev, "error setting aud_dma_clk rate: %d\n", ret);
> +		return ret;
> +	}
> +	ret = clk_set_rate(drvdata->aud_dma_mem_clk, QAIF_DMA_CLOCK_FREQ);
> +	if (ret) {
> +		dev_err(soc_runtime->dev, "error setting aud_dma_mem_clk rate: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = regmap_write(map, qaif_sid_map_reg(dir, dai_id), drvdata->smmu_csid_bits);
> +	if (ret) {
> +		dev_err(soc_runtime->dev, "error writing to SID MAP reg: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = regmap_write(map, qaif_dmabase_reg(v, idx, dir, dai_id),
> +			   lower_32_bits(runtime->dma_addr));
> +	if (ret) {
> +		dev_err(soc_runtime->dev, "error writing to dma base reg: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = regmap_write(map, qaif_dmabuff_reg(v, idx, dir, dai_id),
> +			   (snd_pcm_lib_buffer_bytes(substream) >>
> +			    QAIF_DMA_BYTES_TO_WORDS_SHIFT) - 1);
> +	if (ret) {
> +		dev_err(soc_runtime->dev, "error writing to dma buf reg: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = regmap_write(map, qaif_dmaper_len_reg(v, idx, dir, dai_id),
> +			   (snd_pcm_lib_period_bytes(substream) >>
> +			    QAIF_DMA_BYTES_TO_WORDS_SHIFT) - 1);
> +	if (ret)
> +		dev_err(soc_runtime->dev, "error writing to dma period reg: %d\n", ret);
> +	return ret;
> +}
> +
> +static snd_pcm_uframes_t qaif_platform_pcmops_pointer(struct snd_soc_component *component,
> +						      struct snd_pcm_substream *substream)
> +{
> +	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
> +	struct qaif_drv_data *drvdata = snd_soc_component_get_drvdata(component);
> +	const struct qaif_variant *v = drvdata->variant;
> +	struct regmap *map = drvdata->audio_qaif_map;
> +	struct qaif_pcm_data *data = substream->runtime->private_data;
> +	unsigned int dai_id = cpu_dai->driver->id;
> +	unsigned int base_addr, curr_addr;
> +	int idx = data->dma_reg_idx;
> +	int ret, dir = substream->stream;
> +
> +	ret = regmap_read(map, qaif_dmabase_reg(v, idx, dir, dai_id), &base_addr);
> +	if (ret) {
> +		dev_err(soc_runtime->dev, "error reading from rdmabase reg: %d\n", ret);
> +		return SNDRV_PCM_POS_XRUN;
> +	}
> +
> +	ret = regmap_read(map, qaif_dmacurr_reg(v, idx, dir, dai_id), &curr_addr);
> +	if (ret) {
> +		dev_err(soc_runtime->dev, "error reading from rdmacurr reg: %d\n", ret);
> +		return SNDRV_PCM_POS_XRUN;
> +	}
> +
> +	return bytes_to_frames(substream->runtime,
> +			       (curr_addr - base_addr) %
> +			       snd_pcm_lib_buffer_bytes(substream));
> +}
> +
> +static int qaif_platform_pcmops_mmap(struct snd_soc_component *component,
> +				     struct snd_pcm_substream *substream,
> +				     struct vm_area_struct *vma)
> +{
> +	struct snd_pcm_runtime *runtime = substream->runtime;
> +
> +	return dma_mmap_coherent(component->dev, vma,
> +				 runtime->dma_area, runtime->dma_addr,
> +				 runtime->dma_bytes);
> +}
> +
> +static int qaif_platform_pcm_new(struct snd_soc_component *component,
> +				 struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct snd_pcm *pcm = rtd->pcm;
> +
> +	return snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
> +					    component->dev,
> +					    QAIF_PLATFORM_BUFFER_BYTES_MAX);
> +}
> 

