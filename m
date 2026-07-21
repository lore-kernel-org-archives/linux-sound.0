Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CB1415F1A
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 18:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784657571; cv=none; b=VABXALHryyT69B67Mk7RhHWmzkZklFhjwsPy94RE75v2zyZvjweBIXluYLA8pOjZ8UsjQDwC4V9lGCaa3wrwMiG5t8L9ABPj+UPk0AG1A0bLLwfYXviCJO3T9HtnMgIwBT6SFnEqgvNDr+4vUfSIn0AWS7RnOrKNCXPdrylDSn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784657571; c=relaxed/simple;
	bh=MfM6R9y1EIPiqF6A/ySJpuCb/kr0iyIxe++9V4DMWwk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VKW4lWQzZNLKCgTRx0G9IycnrU9KU5WJO220ZemTVPCzzd3pr8o/vSu888s6SL/qLAMlrFYo21DHr3MbdLP/XcvqhsnQXNFmBahvFKvlU9WOtsQnT6Kx6v4sZZqeoVVsKVzbkGTKw2aS2lmUEZNDZxXs/nF7YnLzqXzN4qU6pGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AS9Dckqs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NtxTGq1m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AS9Dckqs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NtxTGq1m"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LH2g6j2280341
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 18:12:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V8OkojE2VDzFyq67u/mSLTD3XAPgG+tQihom1/t63uw=; b=AS9DckqskwVQglnv
	1WSduSCqSpqOmLOgTRKQ7thhc5VvhM/JXQnyBcAE7AkjK9y1kryzm5kd3dtvGRzu
	vPUQm7LoDCG+zjuWbZiignApDTC3GwWZA1tYfLxZ8rZthlzWPtsy8E9Ro329DsAp
	Med8lQDN+oyoC7/taw95pbABfdzFu4maHQCFDC1vmbDzEKZFsEeTXNHby9mswfrR
	xAsBxBzTRbvT4S8xlHNv7/z5Qv9NvGfTd9cW5pw6Kk6kN9e4tQnczRUAJ8rEfAha
	3fnBV/f0n+C37PqIp014FDysFsJZJ594rRB5W2/6DAxLe1+K9lsITxJKbo92TrXb
	ySednw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6paaayy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 18:12:48 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-96feaeeeb3bso1867804241.3
        for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 11:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784657568; x=1785262368; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V8OkojE2VDzFyq67u/mSLTD3XAPgG+tQihom1/t63uw=;
        b=NtxTGq1mg07w6paYSE8JLy3EP+8D+m3A4OyYo9JEuHQBLWhuH/jxdoQ2wGxDibQfEP
         PP4doZy9VfYxEdBZxaZLI4OKpzM+w32mlTY0SqVS0TXDTbEbrrP3W8ZVtws4umS/xG8R
         1ryCnVzFyQgzWNrmewFkp7YZGiaQ/NA/+rdog7RaSB5UjSAB8DAOG3SoEd3E/DoGl6n0
         drAvVHh6sX6IcSug4i1isJ3w0zYNa2tUF5XHSOqJe8Fasf9KpqCl5fSh4Oz38PNF5wiw
         xJcaELQxgY+v/h6NCgAYgRW0CbJkKQFCPBTXh0O8+TrDlu6rRz4eXDZFHtDwh2VpaO1q
         M2GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784657568; x=1785262368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V8OkojE2VDzFyq67u/mSLTD3XAPgG+tQihom1/t63uw=;
        b=QhRKjmj1nOmn71gCrN0/6DAfDuKHq0fZm8vBTWP1kZOHuIWQ3PzdLbPK0Ru3C7+BQ7
         QKRLp85NDjBO4tN72vmD3dHMqpha6rz5T5wqg2Ny/+RzgHq2y1MJzp4oIHLOHD9Ycf+F
         IHzBddsxAaYjHuI+sek+Ew2n6sRQTdbWPA9Bx1KTs4ROFOQ7xRLnejxoC1j2/hbYSsok
         ZsBmaHUy7tIs+8U67B8pC0CgIXn6qpilRfCI6cMfIrx6/PjlI+sjtHAkLpQCDwN4Gp4j
         yjgq1gaCyTkCL44d1P1b7ENS5JqVJuGN35nwC4RiceK0AzgYLe5XaG560ywMSfc97z40
         7E2w==
X-Forwarded-Encrypted: i=1; AHgh+RqcFhpdWz50Iw2kMyIU1XbbPDfdTI2x2l4uBBNeT0hkhT6UICSLbYnLVVHR34G154cFZQh5JClE64xzUA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7eou7cTfrJDyk9KfeVLQyRsC1JM24OqZa0z6xIyCwyJVR+I0x
	rl/b1GwzQOsg6e4191f3V7XVze1cfTRJcifYrJz68L9LG7gUKrBjOiDG0K4QFBeTXGfPOm+fAVM
	6Azqcq0xEEWb5B8t2DEB3QhWdgBlKJOLeQJpW15gAGYC4klA3B0Mx8d0/YJLL49izfCn3ndgy7Q
	==
X-Gm-Gg: AR+sD13Ph7kW9Z7+hPq4KX2a4j3wBNlYeLRTBWtBCiPGgWiZ9kLIag+8SQxM6Cfsjzb
	Myl4O8RbfdvI0aN0T+BDkel+KW1Dg/ejfmwakeW9xAXKwZSyJQyoxtlkiVyvCOHz4OQ2c0y7pw0
	WUhTggRCXX8XcQa00XbtJ30P+2cegejDtMu2tflldpuQYON6hBrH0bU1xjAfIdwvYG1CjVgtU8y
	Pf/X4hWDp6Ob6BpoD3ZstOpQMXIbk++q52k99tKLhQQuShjpCaBxA8ZDA3RnNBE9+DUKgtIoTlY
	iI55wv48zl/oLDVnGTLMeNuCh8gosuctMsCR4EDIkF+UtO6D43B6Pb/UWwtolX8z80+rNOvUSEy
	M9+Buw+vo7oMMtthpX10ysx7B93MOBiJ1+8+JlLOHg7s6h96HJgbieh+OcDjDDoQ67O4kPC7Fvd
	KeN+x8Ltm2ARPhFg==
X-Received: by 2002:a05:6102:5a88:b0:739:97bf:9189 with SMTP id ada2fe7eead31-747536ede8amr5645168137.19.1784657567065;
        Tue, 21 Jul 2026 11:12:47 -0700 (PDT)
X-Received: by 2002:a05:6102:5a88:b0:739:97bf:9189 with SMTP id ada2fe7eead31-747536ede8amr5645130137.19.1784657566175;
        Tue, 21 Jul 2026 11:12:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef6c41c9bsm596921fa.19.2026.07.21.11.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:12:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 21:12:41 +0300
Subject: [PATCH 1/2] ASoC: qcom: remove ipq806x Storm machine driver
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-drop-sound-storm-v1-1-23ae4a689ffe@oss.qualcomm.com>
References: <20260721-drop-sound-storm-v1-0-23ae4a689ffe@oss.qualcomm.com>
In-Reply-To: <20260721-drop-sound-storm-v1-0-23ae4a689ffe@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6198;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=MfM6R9y1EIPiqF6A/ySJpuCb/kr0iyIxe++9V4DMWwk=;
 b=kA0DAAoBizyKPgIpKNUByyZiAGpftpmhNY2N+aJ+1uuE7V3N+SPgMEt6Zd1Y0Zy36kTjNNt4b
 4kBMwQAAQoAHRYhBExwhJVcsmNW8LiVf4s8ij4CKSjVBQJqX7aZAAoJEIs8ij4CKSjV78IH/05x
 0FcSSGg/e7pKmqGxKPG17riWXusaGv6lSrYy0sTDDqsa1ZT4DZ5jYW7BEvp62Bk031fBRumpfkQ
 XmRtzPer8H329JDkYp3zYNm9mVdIIgcy6wwVaGuNEscJKe9IM0EI4ib8FaUCL85Ho03TlmLQ35y
 gM60XP8Ljht/+anbISJd4kS7nXKqpuif2t55r8qHIPBFiNaxRCSkayNCltdEJAfeeV/cukAdPs6
 f1xoO2dPgfKav0KOBeytvKGoJC9Tr/3X6ui2JHi83j7Vt1bdCYkHW2WLG1J4A4zqMQuRfzustxs
 6H7nfkgskArtJsfU5n/Jun5M+3KJDoaOSKbxOes=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: dGoUpywPNN0smdXySP5obtIDm9ay5CDB
X-Proofpoint-ORIG-GUID: dGoUpywPNN0smdXySP5obtIDm9ay5CDB
X-Authority-Analysis: v=2.4 cv=eYYNubEH c=1 sm=1 tr=0 ts=6a5fb6a0 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=2Pz9WbiNhJHYEZtGnJ8A:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5MSBTYWx0ZWRfX4/Hfmaz/xYtd
 Fph7+fidFw1S+VN0miBTJplmkX+J5upDIzC8d8veg5fAraXyoAVnkxD78D+0t59Z0ZIbgoAVNwF
 J+yPIo2pA3m1Z9SO2C+O6OvHJM54Owm1mITX5MTeXcWq/LUXBI48zOFvjJ0gG+w8+bpXtUYK3a0
 qrwGjOCgQ0jDJ/Oo4tRU0HwdSOz6bcCazk4Acop9AtXsWW2aHPQ/TlUM3bwnNoqeRuCRIgqAtRL
 pJOKXLWDjsQVLxufjLZgBaXYiDCXyjkSZCnsQ0iMw9MTowH8VCK6jk60D7OJY8EoICcvhXXImUD
 Otl5RG0JNlxbEQuh6wW77SgE/npd0QaQuE/t34K9Tkdda9G3slpmd7MeAYYMt6Xuw0QbQHgN8Mc
 KKExUCnCOniZfX2xkli1llIXxMtQWEPBrpGBpB3BoJylILXrAlZba2SLg9n02w0wYJwNoRYmWfT
 C7txLRr7dltQ7gUKw8w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5MSBTYWx0ZWRfX3CLJSxN+sEzJ
 ZlnxJq6Bs3ks5Z65dWnGhAiGpWjdBCXZbeXBFNBQsLYOn3cnTIRwejlUe4kwp2/QKbqcb7qEnXq
 slyddSW2toiIS9MVsSR+/betGWgKjLs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210191

The Storm board machine driver targets Google's IPQ806x-based Storm
reference board (a MAX98357A DAC wired to the LPASS I2S bus). This board
has no upstream device tree, no active users and has seen no functional
changes in years, so the driver is dead weight.

Remove the driver together with its Kconfig entry and Makefile rule.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 sound/soc/qcom/Kconfig  |   9 ---
 sound/soc/qcom/Makefile |   2 -
 sound/soc/qcom/storm.c  | 142 ------------------------------------------------
 3 files changed, 153 deletions(-)

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index e6e24f3b9922..68e3146bf230 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -47,15 +47,6 @@ config SND_SOC_LPASS_SC7280
 	select SND_SOC_LPASS_HDMI
 	select SND_SOC_LPASS_CDC_DMA
 
-config SND_SOC_STORM
-	tristate "ASoC I2S support for Storm boards"
-	depends on GPIOLIB
-	select SND_SOC_LPASS_IPQ806X
-	select SND_SOC_MAX98357A
-	help
-	  Say Y or M if you want add support for SoC audio on the
-	  Qualcomm Technologies IPQ806X-based Storm board.
-
 config SND_SOC_APQ8016_SBC
 	tristate "SoC Audio support for APQ8016 SBC platforms"
 	select SND_SOC_LPASS_APQ8016
diff --git a/sound/soc/qcom/Makefile b/sound/soc/qcom/Makefile
index 985ce2ae286b..bcbb44d17303 100644
--- a/sound/soc/qcom/Makefile
+++ b/sound/soc/qcom/Makefile
@@ -19,7 +19,6 @@ obj-$(CONFIG_SND_SOC_LPASS_SC7180) += snd-soc-lpass-sc7180.o
 obj-$(CONFIG_SND_SOC_LPASS_SC7280) += snd-soc-lpass-sc7280.o
 
 # Machine
-snd-soc-storm-y := storm.o
 snd-soc-apq8016-sbc-y := apq8016_sbc.o
 snd-soc-apq8096-y := apq8096.o
 snd-soc-sc7180-y := sc7180.o
@@ -32,7 +31,6 @@ snd-soc-qcom-sdw-y := sdw.o
 snd-soc-x1e80100-y := x1e80100.o
 snd-soc-qcom-offload-utils-objs := usb_offload_utils.o
 
-obj-$(CONFIG_SND_SOC_STORM) += snd-soc-storm.o
 obj-$(CONFIG_SND_SOC_APQ8016_SBC) += snd-soc-apq8016-sbc.o
 obj-$(CONFIG_SND_SOC_MSM8996) += snd-soc-apq8096.o
 obj-$(CONFIG_SND_SOC_SC7180) += snd-soc-sc7180.o
diff --git a/sound/soc/qcom/storm.c b/sound/soc/qcom/storm.c
deleted file mode 100644
index 1e0eda8c24c4..000000000000
--- a/sound/soc/qcom/storm.c
+++ /dev/null
@@ -1,142 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (c) 2010-2011,2013-2015 The Linux Foundation. All rights reserved.
- *
- * storm.c -- ALSA SoC machine driver for QTi ipq806x-based Storm board
- */
-
-#include <linux/device.h>
-#include <linux/module.h>
-#include <linux/of.h>
-#include <linux/platform_device.h>
-#include <sound/pcm.h>
-#include <sound/pcm_params.h>
-#include <sound/soc.h>
-
-#define STORM_SYSCLK_MULT			4
-
-static int storm_ops_hw_params(struct snd_pcm_substream *substream,
-		struct snd_pcm_hw_params *params)
-{
-	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
-	struct snd_soc_card *card = soc_runtime->card;
-	snd_pcm_format_t format = params_format(params);
-	unsigned int rate = params_rate(params);
-	unsigned int sysclk_freq;
-	int bitwidth, ret;
-
-	bitwidth = snd_pcm_format_width(format);
-	if (bitwidth < 0) {
-		dev_err(card->dev, "invalid bit width given: %d\n", bitwidth);
-		return bitwidth;
-	}
-
-	/*
-	 * as the CPU DAI is the I2S bus master and no system clock is needed by
-	 * the MAX98357a DAC, simply set the system clock to be a constant
-	 * multiple of the bit clock for the clock divider
-	 */
-	sysclk_freq = rate * bitwidth * 2 * STORM_SYSCLK_MULT;
-
-	ret = snd_soc_dai_set_sysclk(snd_soc_rtd_to_cpu(soc_runtime, 0), 0, sysclk_freq, 0);
-	if (ret) {
-		dev_err(card->dev, "error setting sysclk to %u: %d\n",
-			sysclk_freq, ret);
-		return ret;
-	}
-
-	return 0;
-}
-
-static const struct snd_soc_ops storm_soc_ops = {
-	.hw_params	= storm_ops_hw_params,
-};
-
-SND_SOC_DAILINK_DEFS(hifi,
-	DAILINK_COMP_ARRAY(COMP_EMPTY()),
-	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "HiFi")),
-	DAILINK_COMP_ARRAY(COMP_EMPTY()));
-
-static struct snd_soc_dai_link storm_dai_link = {
-	.name		= "Primary",
-	.stream_name	= "Primary",
-	.ops		= &storm_soc_ops,
-	SND_SOC_DAILINK_REG(hifi),
-};
-
-static int storm_parse_of(struct snd_soc_card *card)
-{
-	struct snd_soc_dai_link *dai_link = card->dai_link;
-	struct device_node *np = card->dev->of_node;
-
-	dai_link->cpus->of_node = of_parse_phandle(np, "cpu", 0);
-	if (!dai_link->cpus->of_node) {
-		dev_err(card->dev, "error getting cpu phandle\n");
-		return -EINVAL;
-	}
-	dai_link->platforms->of_node = dai_link->cpus->of_node;
-
-	dai_link->codecs->of_node = of_parse_phandle(np, "codec", 0);
-	if (!dai_link->codecs->of_node) {
-		dev_err(card->dev, "error getting codec phandle\n");
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-static int storm_platform_probe(struct platform_device *pdev)
-{
-	struct snd_soc_card *card;
-	int ret;
-
-	card = devm_kzalloc(&pdev->dev, sizeof(*card), GFP_KERNEL);
-	if (!card)
-		return -ENOMEM;
-
-	card->dev = &pdev->dev;
-	card->owner = THIS_MODULE;
-
-	ret = snd_soc_of_parse_card_name(card, "qcom,model");
-	if (ret) {
-		dev_err(&pdev->dev, "error parsing card name: %d\n", ret);
-		return ret;
-	}
-
-	card->dai_link	= &storm_dai_link;
-	card->num_links	= 1;
-
-	ret = storm_parse_of(card);
-	if (ret) {
-		dev_err(&pdev->dev, "error resolving dai links: %d\n", ret);
-		return ret;
-	}
-
-	ret = devm_snd_soc_register_card(&pdev->dev, card);
-	if (ret)
-		dev_err(&pdev->dev, "error registering soundcard: %d\n", ret);
-
-	return ret;
-
-}
-
-#ifdef CONFIG_OF
-static const struct of_device_id storm_device_id[]  = {
-	{ .compatible = "google,storm-audio" },
-	{},
-};
-MODULE_DEVICE_TABLE(of, storm_device_id);
-#endif
-
-static struct platform_driver storm_platform_driver = {
-	.driver = {
-		.name = "storm-audio",
-		.of_match_table =
-			of_match_ptr(storm_device_id),
-	},
-	.probe = storm_platform_probe,
-};
-module_platform_driver(storm_platform_driver);
-
-MODULE_DESCRIPTION("QTi IPQ806x-based Storm Machine Driver");
-MODULE_LICENSE("GPL");

-- 
2.47.3

