Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541559;
	b=wj16EMq5ti4zXI8nE2OROXGhtEhrz2FVz2BNrgmopdJzHHHmvIp/k3YXhdkgQNRZgFB0
	 P8nEYJ5ItUFL1glYNbBRUcgphdd5gvkl+rO/zAsUwxUnUoPPGELxCGGS9dEJteyMDWcHN
	 S/bxE61V1qX93QCLKcQ4FgcacxyzXG8XW6VjFhX63RLq7FMYRCCZApAcYpJ0sz+aLx69k
	 GW9Of59pbnAbTrLE4bMpZd5jM02//LoHldnqGo4oglNZlo+3U/ucoADZE7Hs7jqaryPlY
	 uDzM2khmnMQ/5HPWNbmucqnQX0Gel85htLIbDffaLGsPlyBkp3hmHdDlp96JAdDQK+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541559;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=b3tqHfnHT4G87EMsb8tLdAtb3CtbT/N6TqhSYX8nRLo=;
	b=BSvUC1yC19pAr68zMTB/P+tI0EHN/bO2YOoKaMhYe1Ak0OOjL3LpbjLdra/D00DJZa8f
	 w1hha1yBG2+fXKyLPcQBT77OIFjs0lwSiwNgThZaQZmzsQElOvDSo5St+Ur4poCR8gUHm
	 Q0b6fHBTJoJUa541c2ZijTNzVuoqCrfHGLEM43d5frFnFnvpR0pZFKLPqfG+Z5LrTO5vS
	 3R2k34S62/BuIxW5DIp3ZR/9Eg2jyaQEKsuTwn9+8yBN+nr695mtzXZlhBCIyRWSvmVGh
	 BE83eVlGauy1IGdsQmlF+0Ir2BHj+wSZTsq1saL8NQI0ALVtOzfuMcQp+JNz5FHh4fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=REDA8tjw;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439EC606E19D
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 17:32:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 439EC606E19D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=REDA8tjw
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4aa5833c263so4630061f8f.2
        for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 09:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795541556; x=1796146356; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b3tqHfnHT4G87EMsb8tLdAtb3CtbT/N6TqhSYX8nRLo=;
        b=REDA8tjw4ymuBmlRLy46oQ+Z1//FmNc2heudNqyJkLqS3CipqiPTsUIj9HyKvpHqXc
         ZGGM0RklUfMl+j0S+Bd6asOtSaIBIxkBc9IGqM5Uw7AenBLirXDpTU1CiHSPe7njKktJ
         LWpG0XtsET1vcnhDaTOIX+o7nPEtKrNMD0Eg/fhnu8f2rnanS1UdOn4qWerG9XThFVpR
         F53qZ3oomsmkCLh3beltf6hxYYXFk/MCpPYfUyuak4KKy+FnCnb8esxH0aQ2hvUsE1K5
         7Y1riXkRzSNVRWlU/1uCzJXWQHlezKd9zjSb+zJ1rP11trX0NRZl1lrKGPOBRtG1dOHY
         wTwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541556; x=1796146356;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b3tqHfnHT4G87EMsb8tLdAtb3CtbT/N6TqhSYX8nRLo=;
        b=m2iyYz4uNtGOyJ2njBpO7MDwO+Zd1GgjsX6FvLD2GIq8yTIsVe+oQ+nNo8Ry1Tw1+j
         DUiGfFRNODjYcFmjC77hr7PMUzEYMJOVVm8Za3JMsCe3ZBHP6xnbT+ErfpQdvjMNUS+o
         UUB6YjxBGt/H3vTwA0peLs3jsQ4MJpMxVwMGb9ptPbo2sq9QwpBDlMFrx4dbljjR0O56
         Wy3ONfd+NWf0xrKwgVIFjjZTyGrUF/bBPERpfF3SUR9vBIqYKuq8Nee4WLVYdJySAd61
         gNArpeTSFLOs+VXTwCxGwowvlpYatV/LVYdnMDA26X5ugWcL6sRkybnqDn83z8iS8zzI
         B4Eg==
X-Gm-Message-State: APuU4Z95CZMjOqsSo9Ng3uO2R18epg9ed2IfksFUdFl4CK77eN5yjIku
	InwMgPu5HbS0KhrAPOibQmkkxGPCzhDys95cX217zlvIUkEZo4kWKAfWiUcdnwqZjXw=
X-Gm-Gg: AZFdTZdfXKdPG1bo9MSiqbCFWozC/ZSDxb8TBjRxftO7XIVjjdOlzWtSMBDgp39iVVQ
	o0jB/9AOA5yHPhLtmj5PxbYcbABEH6VS4P5N2bfdKO9J8jaw04AgbX5ff+ZGco2BqUXSlXSspxr
	g0vytj6UHDXtBv/uRi8avuJtdAAng6Pf9GUXYGm0IVl6D+LGTqUpYq1k8L1C8dq8K63pylj4aum
	s6fmMQsfQNiDKRlFGoamDRjFZt7KBlzFA6s+c5f7QOAVrERe32Dzi8E4wZJ/8ERaHMVmmyfC6vr
	6pDzZbgnU6lzagpOgXVGNgq5Qdz/l56H/hW3h3UAVCQCMMDs0GyNaT+Pk4orKthsbRdk2O4pzli
	m8dxddEGBo7RW7x+bBNoBXp7IoRXDUSt4xF47JbkaG3Zh3VYUBL7Bw9LM7RGQZADgfTWZYsfQJh
	bEFf6Do0yRykVZOfTsgOtMN2umeBlL2roWZ9TwSYVIhkDNcWmWQAFfi6qrl01IaeOQBGnVk1daK
	nBw8XH3FgqoAzP4pJA5ePNZgw7p2FUW0oA57SZBPAxMgi1h9JPcyLVjfvg6Kf81NLEW03GGFtrP
	QZEE8Z03jhgvYB1yGfsKGRd3rNjqAQAB3NeFWhI/R5AlV+xf4g==
X-Received: by 2002:a05:6000:2c13:b0:4a6:dfe3:fd93 with SMTP id ffacd0b85a97d-4abb41f4dc6mr28624862f8f.40.1795541555311;
        Tue, 24 Nov 2026 09:32:35 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm29560057f8f.44.2026.11.24.09.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:32:35 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 24 Nov 2026 18:32:24 +0100
Subject: [PATCH v2 17/19] ASoC: qcom: add SM8650 LPASS CPU driver
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-topic-sm8650-el2-v2-17-174e159f0f69@linaro.org>
References: <20261124-topic-sm8650-el2-v2-0-174e159f0f69@linaro.org>
In-Reply-To: <20261124-topic-sm8650-el2-v2-0-174e159f0f69@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, 
 Venkata Prasad Potturu <quic_potturu@quicinc.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rohit kumar <quic_rohkumar@quicinc.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=25117;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=/hXEhDUTOsMNTP5Bxukz/5pMsjOsh1K7hBvCPZhJAs8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBcoiA3ouDdLDEg95PYFWfp3qZYhOKg3ZJLnEDstF
 pRvylZWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawXKIgAKCRB33NvayMhJ0aPkEA
 C5qu6a0RAajXzfL0c+b74+eFmYG6K3+Pm/Q9EfqsRe3qM02hevyHLMtj/lP0XecBChLO0/aGeBPkd1
 njIqGckM5zeuiEehEAUoxXqsGTO+AAwqc0bzEZYh4xGcBJB9wxYZ3E5vADGwDZOBcyyGiD3KLJYSM8
 YoUdkZz4GaAyRgWx1RiuJMi0/KRX6d2r2QFDS7zz6xJmmAFxs3gEnaJ2W0ue6cSh+qtfpzMd3KUw37
 jcx57LmESxANF/X77IB96f/mztY43kBrGNLAnBiLI44qd9/RU2eDavRr6qvCuUXE63WTghMq+yTkas
 iGAQkAQMbg6EiytRKrq25+qbSgVYk8Bv+qCPvAgh81DjFqIwgTHoDmxRw8FtOJ4YTuJ2bceHmfzW8V
 TAb8j9IhlBC+vX8z8u2AFBVf3xEw10ej+4MKa4fi26eE1dP4anlIgKFmcheA2xwMh/oUqScdJshUyi
 1CK2dPSLH51i/orQahYh0XCKfWWytSEDo4N77M52oGXLj4N6xyF4FgZE2UInwiYo8VHwedvwDWo99g
 hO3TC7xvWoloLNIzshOks1AbswZwE1tqjVqVplRdvDcNDSdanaYR7n99RKb3HgnstL1oL+Slfic5PV
 w6ZydgsdXKdol2UVZHgLhfdv5A+rhTnAI2C+L3185wDd65z9Z0eZF+sja6qA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Without the ADSP firmware, the SM8650 LPASS audio interfaces must be
driven directly by the application processor.

Add the SM8650 lpass-cpu variant with the Primary, Secondary, Tertiary,
Senary & Septenary MI2S, DP and codec DMA DAIs, their LPAIF instances,
clocks and LPM DMA buffers.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 sound/soc/qcom/Kconfig        |  12 +
 sound/soc/qcom/Makefile       |   2 +
 sound/soc/qcom/lpass-sm8650.c | 653 ++++++++++++++++++++++++++++++++++++++++++
 sound/soc/qcom/lpass.h        |   2 +-
 4 files changed, 668 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index f6d810931a9a..d9b626cd1bc9 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -47,6 +47,18 @@ config SND_SOC_LPASS_SC7280
 	select SND_SOC_LPASS_HDMI
 	select SND_SOC_LPASS_CDC_DMA
 
+config SND_SOC_LPASS_SM8650
+	tristate "Qualcomm SM8650 LPASS CPU DAI support"
+	depends on COMMON_CLK
+	select SND_SOC_LPASS_CPU
+	select SND_SOC_LPASS_PLATFORM
+	select SND_SOC_LPASS_HDMI
+	select SND_SOC_LPASS_CDC_DMA
+	help
+	  Support for the MI2S, codec DMA & DP interfaces of the Qualcomm
+	  SM8650 LPASS, when driven by Linux instead of the ADSP firmware.
+	  Say Y or M if you want to use audio on such SM8650 based boards.
+
 config SND_SOC_STORM
 	tristate "ASoC I2S support for Storm boards"
 	depends on GPIOLIB
diff --git a/sound/soc/qcom/Makefile b/sound/soc/qcom/Makefile
index cf50b7a24bcf..b2c5f9f387b6 100644
--- a/sound/soc/qcom/Makefile
+++ b/sound/soc/qcom/Makefile
@@ -8,6 +8,7 @@ snd-soc-lpass-ipq806x-y := lpass-ipq806x.o
 snd-soc-lpass-apq8016-y := lpass-apq8016.o
 snd-soc-lpass-sc7180-y := lpass-sc7180.o
 snd-soc-lpass-sc7280-y := lpass-sc7280.o
+snd-soc-lpass-sm8650-y := lpass-sm8650.o
 
 obj-$(CONFIG_SND_SOC_LPASS_CPU) += snd-soc-lpass-cpu.o
 obj-$(CONFIG_SND_SOC_LPASS_CDC_DMA) += snd-soc-lpass-cdc-dma.o
@@ -17,6 +18,7 @@ obj-$(CONFIG_SND_SOC_LPASS_IPQ806X) += snd-soc-lpass-ipq806x.o
 obj-$(CONFIG_SND_SOC_LPASS_APQ8016) += snd-soc-lpass-apq8016.o
 obj-$(CONFIG_SND_SOC_LPASS_SC7180) += snd-soc-lpass-sc7180.o
 obj-$(CONFIG_SND_SOC_LPASS_SC7280) += snd-soc-lpass-sc7280.o
+obj-$(CONFIG_SND_SOC_LPASS_SM8650) += snd-soc-lpass-sm8650.o
 
 # Machine
 snd-soc-storm-y := storm.o
diff --git a/sound/soc/qcom/lpass-sm8650.c b/sound/soc/qcom/lpass-sm8650.c
new file mode 100644
index 000000000000..53c155e1b639
--- /dev/null
+++ b/sound/soc/qcom/lpass-sm8650.c
@@ -0,0 +1,653 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Based on lpass-sc7280.c:
+ * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2026, Linaro Limited. All rights reserved.
+ */
+
+#include <linux/module.h>
+#include <sound/pcm.h>
+#include <sound/soc.h>
+#include <linux/pm.h>
+
+#include <dt-bindings/sound/qcom,lpass.h>
+
+#include "lpass-lpaif-reg.h"
+#include "lpass.h"
+
+static struct snd_soc_dai_driver sm8650_lpass_cpu_dai_driver[] = {
+	{
+		.id = MI2S_PRIMARY,
+		.name = "Primary MI2S",
+		.playback = {
+			.stream_name = "Primary Playback",
+			.formats	= SNDRV_PCM_FMTBIT_S16,
+			.rates = SNDRV_PCM_RATE_48000,
+			.rate_min	= 48000,
+			.rate_max	= 48000,
+			.channels_min	= 2,
+			.channels_max	= 2,
+		},
+		.ops    = &asoc_qcom_lpass_cpu_dai_ops,
+	}, {
+		.id = MI2S_SECONDARY,
+		.name = "Secondary MI2S",
+		.playback = {
+			.stream_name = "Secondary MI2S Playback",
+			.formats = SNDRV_PCM_FMTBIT_S16,
+			.rates = SNDRV_PCM_RATE_48000,
+			.rate_min	= 48000,
+			.rate_max	= 48000,
+			.channels_min	= 2,
+			.channels_max	= 2,
+		},
+		.ops	= &asoc_qcom_lpass_cpu_dai_ops,
+	}, {
+		.id = MI2S_TERTIARY,
+		.name = "Tertiary MI2S",
+		.playback = {
+			.stream_name = "Tertiary MI2S Playback",
+			.formats = SNDRV_PCM_FMTBIT_S16,
+			.rates = SNDRV_PCM_RATE_48000,
+			.rate_min	= 48000,
+			.rate_max	= 48000,
+			.channels_min	= 2,
+			.channels_max	= 2,
+		},
+		.ops	= &asoc_qcom_lpass_cpu_dai_ops,
+	}, {
+		.id = MI2S_QUATERNARY,
+		.name = "Quaternary MI2S",
+		.playback = {
+			.stream_name = "Quaternary MI2S Playback",
+			.formats = SNDRV_PCM_FMTBIT_S16,
+			.rates = SNDRV_PCM_RATE_48000,
+			.rate_min	= 48000,
+			.rate_max	= 48000,
+			.channels_min	= 2,
+			.channels_max	= 2,
+		},
+		.ops	= &asoc_qcom_lpass_cpu_dai_ops,
+	}, {
+		.id = MI2S_QUINARY,
+		.name = "Quinary MI2S",
+		.playback = {
+			.stream_name = "Quinary MI2S Playback",
+			.formats = SNDRV_PCM_FMTBIT_S16,
+			.rates = SNDRV_PCM_RATE_48000,
+			.rate_min	= 48000,
+			.rate_max	= 48000,
+			.channels_min	= 2,
+			.channels_max	= 2,
+		},
+		.ops	= &asoc_qcom_lpass_cpu_dai_ops,
+	}, {
+		.id = MI2S_SENARY,
+		.name = "Senary MI2S",
+		.playback = {
+			.stream_name = "Senary MI2S Playback",
+			.formats = SNDRV_PCM_FMTBIT_S16,
+			.rates = SNDRV_PCM_RATE_48000,
+			.rate_min	= 48000,
+			.rate_max	= 48000,
+			.channels_min	= 2,
+			.channels_max	= 2,
+		},
+		.ops	= &asoc_qcom_lpass_cpu_dai_ops,
+	}, {
+		.id = MI2S_SEPTENARY,
+		.name = "Septenary MI2S",
+		.playback = {
+			.stream_name = "Septenary MI2S Playback",
+			.formats = SNDRV_PCM_FMTBIT_S16,
+			.rates = SNDRV_PCM_RATE_48000,
+			.rate_min	= 48000,
+			.rate_max	= 48000,
+			.channels_min	= 2,
+			.channels_max	= 2,
+		},
+		.ops	= &asoc_qcom_lpass_cpu_dai_ops,
+	}, {
+		.id = LPASS_DP_RX,
+		.name = "Hdmi",
+		.playback = {
+			.stream_name = "DP Playback",
+			.formats = SNDRV_PCM_FMTBIT_S24,
+			.rates = SNDRV_PCM_RATE_48000,
+			.rate_min	= 48000,
+			.rate_max	= 48000,
+			.channels_min	= 2,
+			.channels_max	= 2,
+		},
+		.ops	= &asoc_qcom_lpass_hdmi_dai_ops,
+	}, {
+		.id = LPASS_CDC_DMA_RX0,
+		.name = "CDC DMA RX",
+		.playback = {
+			.stream_name = "WCD Playback",
+			.formats = SNDRV_PCM_FMTBIT_S16,
+			.rates = SNDRV_PCM_RATE_48000,
+			.rate_min	= 48000,
+			.rate_max	= 48000,
+			.channels_min	= 2,
+			.channels_max	= 2,
+		},
+		.ops	= &asoc_qcom_lpass_cdc_dma_dai_ops,
+	}, {
+		.id = LPASS_CDC_DMA_TX3,
+		.name = "CDC DMA TX",
+		.capture = {
+			.stream_name = "WCD Capture",
+			.formats = SNDRV_PCM_FMTBIT_S16,
+			.rates = SNDRV_PCM_RATE_48000,
+			.rate_min	= 48000,
+			.rate_max	= 48000,
+			.channels_min	= 1,
+			.channels_max	= 1,
+		},
+		.ops	= &asoc_qcom_lpass_cdc_dma_dai_ops,
+	}, {
+		.id = LPASS_CDC_DMA_VA_TX0,
+		.name = "CDC DMA VA",
+		.capture = {
+			.stream_name = "DMIC Capture",
+			.formats = SNDRV_PCM_FMTBIT_S16,
+			.rates = SNDRV_PCM_RATE_48000,
+			.rate_min	= 48000,
+			.rate_max	= 48000,
+			.channels_min	= 2,
+			.channels_max	= 4,
+		},
+		.ops	= &asoc_qcom_lpass_cdc_dma_dai_ops,
+	}, {
+		.id = LPASS_CDC_DMA_WSA_RX0,
+		.name = "CDC DMA WSA RX",
+		.playback = {
+			.stream_name = "WSA Playback",
+			.formats = SNDRV_PCM_FMTBIT_S16,
+			.rates = SNDRV_PCM_RATE_48000,
+			.rate_min	= 48000,
+			.rate_max	= 48000,
+			.channels_min	= 2,
+			.channels_max	= 2,
+		},
+		.ops	= &asoc_qcom_lpass_cdc_dma_dai_ops,
+	},
+};
+
+static int sm8650_lpass_alloc_dma_channel(struct lpass_data *drvdata,
+					  int direction, unsigned int dai_id)
+{
+	const struct lpass_variant *v = drvdata->variant;
+	unsigned long *ch_map;
+	unsigned int port_id;
+	int chan = 0;
+
+	switch (dai_id) {
+	case MI2S_PRIMARY ... MI2S_QUINARY:
+	case MI2S_SENARY ... MI2S_SEPTENARY:
+		port_id = mi2s_port_id(dai_id);
+		ch_map = &drvdata->mi2s_lpaif[port_id]->dma_ch_bit_map;
+		if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
+			chan = find_first_zero_bit(ch_map, v->rdma_channels);
+
+			if (chan >= v->rdma_channels)
+				return -EBUSY;
+		} else {
+			chan = find_next_zero_bit(ch_map,
+						  v->wrdma_channel_start +
+						  v->wrdma_channels,
+						  v->wrdma_channel_start);
+
+			if (chan >= v->wrdma_channel_start + v->wrdma_channels)
+				return -EBUSY;
+		}
+		set_bit(chan, ch_map);
+		break;
+	case LPASS_DP_RX:
+		chan = find_first_zero_bit(&drvdata->hdmi_dma_ch_bit_map,
+					   v->hdmi_rdma_channels);
+		if (chan >= v->hdmi_rdma_channels)
+			return -EBUSY;
+		set_bit(chan, &drvdata->hdmi_dma_ch_bit_map);
+		break;
+	case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
+		chan = find_first_zero_bit(&drvdata->rxtx_dma_ch_bit_map,
+					   v->rxtx_rdma_channels);
+		if (chan >= v->rxtx_rdma_channels)
+			return -EBUSY;
+		set_bit(chan, &drvdata->rxtx_dma_ch_bit_map);
+		break;
+	case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
+		chan = find_next_zero_bit(&drvdata->rxtx_dma_ch_bit_map,
+					  v->rxtx_wrdma_channel_start +
+					  v->rxtx_wrdma_channels,
+					  v->rxtx_wrdma_channel_start);
+		if (chan >= v->rxtx_wrdma_channel_start + v->rxtx_wrdma_channels)
+			return -EBUSY;
+		set_bit(chan, &drvdata->rxtx_dma_ch_bit_map);
+		break;
+	case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
+		chan = find_next_zero_bit(&drvdata->va_dma_ch_bit_map,
+					  v->va_wrdma_channel_start +
+					  v->va_wrdma_channels,
+					  v->va_wrdma_channel_start);
+		if (chan >= v->va_wrdma_channel_start + v->va_wrdma_channels)
+			return -EBUSY;
+		set_bit(chan, &drvdata->va_dma_ch_bit_map);
+		break;
+	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
+		chan = find_first_zero_bit(&drvdata->wsa_dma_ch_bit_map,
+					   v->wsa_rdma_channels);
+		if (chan >= v->wsa_rdma_channels)
+			return -EBUSY;
+		set_bit(chan, &drvdata->wsa_dma_ch_bit_map);
+		break;
+	case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
+		chan = find_next_zero_bit(&drvdata->wsa_dma_ch_bit_map,
+					  v->wsa_wrdma_channel_start +
+					  v->wsa_wrdma_channels,
+					  v->wsa_wrdma_channel_start);
+		if (chan >= v->wsa_wrdma_channel_start + v->wsa_wrdma_channels)
+			return -EBUSY;
+		set_bit(chan, &drvdata->wsa_dma_ch_bit_map);
+		break;
+	default:
+		break;
+	}
+
+	return chan;
+}
+
+static int sm8650_lpass_free_dma_channel(struct lpass_data *drvdata, int chan, unsigned int dai_id)
+{
+	unsigned int port_id;
+
+	switch (dai_id) {
+	case MI2S_PRIMARY ... MI2S_QUINARY:
+	case MI2S_SENARY ... MI2S_SEPTENARY:
+		port_id = mi2s_port_id(dai_id);
+		clear_bit(chan, &drvdata->mi2s_lpaif[port_id]->dma_ch_bit_map);
+		break;
+	case LPASS_DP_RX:
+		clear_bit(chan, &drvdata->hdmi_dma_ch_bit_map);
+		break;
+	case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
+	case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
+		clear_bit(chan, &drvdata->rxtx_dma_ch_bit_map);
+		break;
+	case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
+		clear_bit(chan, &drvdata->va_dma_ch_bit_map);
+		break;
+	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
+	case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
+		clear_bit(chan, &drvdata->wsa_dma_ch_bit_map);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int sm8650_lpass_init(struct platform_device *pdev)
+{
+	struct lpass_data *drvdata = platform_get_drvdata(pdev);
+	const struct lpass_variant *variant = drvdata->variant;
+	struct device *dev = &pdev->dev;
+	int ret, i;
+
+	drvdata->clks = devm_kcalloc(dev, variant->num_clks,
+				     sizeof(*drvdata->clks), GFP_KERNEL);
+	if (!drvdata->clks)
+		return -ENOMEM;
+
+	drvdata->num_clks = variant->num_clks;
+
+	for (i = 0; i < drvdata->num_clks; i++)
+		drvdata->clks[i].id = variant->clk_name[i];
+
+	ret = devm_clk_bulk_get(dev, drvdata->num_clks, drvdata->clks);
+	if (ret) {
+		dev_err(dev, "Failed to get clocks %d\n", ret);
+		return ret;
+	}
+
+	ret = clk_bulk_prepare_enable(drvdata->num_clks, drvdata->clks);
+	if (ret) {
+		dev_err(dev, "sm8650 clk_enable failed\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int sm8650_lpass_exit(struct platform_device *pdev)
+{
+	struct lpass_data *drvdata = platform_get_drvdata(pdev);
+
+	clk_bulk_disable_unprepare(drvdata->num_clks, drvdata->clks);
+	return 0;
+}
+
+static int sm8650_lpass_dev_resume(struct device *dev)
+{
+	struct lpass_data *drvdata = dev_get_drvdata(dev);
+
+	return clk_bulk_prepare_enable(drvdata->num_clks, drvdata->clks);
+}
+
+static int sm8650_lpass_dev_suspend(struct device *dev)
+{
+	struct lpass_data *drvdata = dev_get_drvdata(dev);
+
+	clk_bulk_disable_unprepare(drvdata->num_clks, drvdata->clks);
+	return 0;
+}
+
+static const struct dev_pm_ops sm8650_lpass_pm_ops = {
+	SYSTEM_SLEEP_PM_OPS(sm8650_lpass_dev_suspend, sm8650_lpass_dev_resume)
+};
+
+/* MI2S mapping over LPAIF instances */
+static const struct lpaif_mi2s_desc sm8650_lpaif_mi2s_desc[] = {
+	{
+		.reg_name = "lpass-lpaif",
+		.irq_name = "lpass-irq-lpaif",
+		.lpm_type = LPASS_LPM_NONE,
+		.port_desc = (const struct mi2s_port_desc[]) {
+			{ .intf = 0, .id = MI2S_PRIMARY, },
+			{ .intf = 1, .id = MI2S_SECONDARY, },
+		},
+		.port_desc_count = 2,
+	},
+	{
+		.reg_name = "lpass-rxtx-lpaif",
+		.irq_name = "lpass-irq-rxtxif",
+		.lpm_type = LPASS_RXTX_CDC_LPM,
+		.port_desc = (const struct mi2s_port_desc[]) {
+			{ .intf = 0, .id = MI2S_QUATERNARY, },
+		},
+		.port_desc_count = 1,
+	},
+	{
+		.reg_name = "lpass-va-lpaif",
+		.irq_name = "lpass-irq-vaif",
+		.lpm_type = LPASS_VA_CDC_LPM,
+		.port_desc = (const struct mi2s_port_desc[]) {
+			{ .intf = 0, .id = MI2S_QUINARY, },
+		},
+		.port_desc_count = 1,
+	},
+	{
+		.reg_name = "lpass-wsa-lpaif",
+		.irq_name = "lpass-irq-wsaif",
+		.lpm_type = LPASS_RXTX_CDC_LPM,
+		.port_desc = (const struct mi2s_port_desc[]) {
+			{ .intf = 0, .id = MI2S_SENARY, },
+		},
+		.port_desc_count = 1,
+	},
+	{
+		.reg_name = "lpass-aud-lpaif",
+		.irq_name = "lpass-irq-audif",
+		.lpm_type = LPASS_RXTX_CDC_LPM,
+		.port_desc = (const struct mi2s_port_desc[]) {
+			{ .intf = 0, .id = MI2S_SEPTENARY, },
+			{ .intf = 1, .id = MI2S_TERTIARY, },
+		},
+		.port_desc_count = 2,
+	},
+};
+
+static const struct lpass_variant sm8650_data = {
+	.i2sctrl_reg_base		= 0x1000,
+	.i2sctrl_reg_stride		= 0x1000,
+	.i2s_ports			= 3,
+	.irq_reg_base			= 0x9000,
+	.irq_reg_stride			= 0x1000,
+	.irq_ports			= 5,
+	.rdma_reg_base			= 0xe000,
+	.rdma_reg_stride		= 0x1000,
+	.rdma_channels			= 3,
+	.rxtx_rdma_reg_base		= 0xe000,
+	.rxtx_rdma_reg_stride		= 0x1000,
+	.rxtx_rdma_channels		= 5,
+	.wsa_rdma_reg_base		= 0xe000,
+	.wsa_rdma_reg_stride		= 0x1000,
+	.wsa_rdma_channels		= 5,
+	.hdmi_rdma_reg_base		= 0x64000,
+	.hdmi_rdma_reg_stride		= 0x1000,
+	.hdmi_rdma_channels		= 1,
+	.dmactl_audif_start		= 1,
+	.wrdma_reg_base			= 0x1a000,
+	.wrdma_reg_stride		= 0x1000,
+	.wrdma_channel_start		= 5,
+	.wrdma_channels			= 3,
+	.rxtx_irq_reg_base		= 0x9000,
+	.rxtx_irq_reg_stride		= 0x1000,
+	.rxtx_irq_ports			= 5,
+	.rxtx_wrdma_reg_base		= 0x1a000,
+	.rxtx_wrdma_reg_stride		= 0x1000,
+	.rxtx_wrdma_channel_start	= 5,
+	.rxtx_wrdma_channels		= 4,
+	.va_wrdma_reg_base		= 0x1a000,
+	.va_wrdma_reg_stride		= 0x1000,
+	.va_wrdma_channel_start		= 5,
+	.va_wrdma_channels		= 3,
+	.va_irq_reg_base		= 0x9000,
+	.va_irq_reg_stride		= 0x1000,
+	.va_irq_ports			= 5,
+	.wsa_irq_reg_base		= 0x9000,
+	.wsa_irq_reg_stride		= 0x1000,
+	.wsa_irq_ports			= 5,
+	.wsa_wrdma_reg_base		= 0x1a000,
+	.wsa_wrdma_reg_stride		= 0x1000,
+	.wsa_wrdma_channel_start	= 5,
+	.wsa_wrdma_channels		= 4,
+
+	.loopback			= REG_FIELD_ID(0x1000, 17, 17, 3, 0x1000),
+	.spken				= REG_FIELD_ID(0x1000, 16, 16, 3, 0x1000),
+	.spkmode			= REG_FIELD_ID(0x1000, 11, 15, 3, 0x1000),
+	.spkmono			= REG_FIELD_ID(0x1000, 10, 10, 3, 0x1000),
+	.micen				= REG_FIELD_ID(0x1000, 9, 9, 3, 0x1000),
+	.micmode			= REG_FIELD_ID(0x1000, 4, 8, 3, 0x1000),
+	.micmono			= REG_FIELD_ID(0x1000, 3, 3, 3, 0x1000),
+	.wssrc				= REG_FIELD_ID(0x1000, 2, 2, 3, 0x1000),
+	.bitwidth			= REG_FIELD_ID(0x1000, 0, 1, 3, 0x1000),
+
+	.rdma_dyncclk			= REG_FIELD_ID(0xe000, 21, 21, 3, 0x1000),
+	.rdma_bursten			= REG_FIELD_ID(0xe000, 20, 20, 3, 0x1000),
+	.rdma_wpscnt			= REG_FIELD_ID(0xe000, 16, 19, 3, 0x1000),
+	.rdma_intf			= REG_FIELD_ID(0xe000, 12, 15, 3, 0x1000),
+	.rdma_fifowm			= REG_FIELD_ID(0xe000, 1, 5, 3, 0x1000),
+	.rdma_enable			= REG_FIELD_ID(0xe000, 0, 0, 3, 0x1000),
+
+	.wrdma_dyncclk			= REG_FIELD_ID(0x1a000, 22, 22, 3, 0x1000),
+	.wrdma_bursten			= REG_FIELD_ID(0x1a000, 21, 21, 3, 0x1000),
+	.wrdma_wpscnt			= REG_FIELD_ID(0x1a000, 17, 20, 3, 0x1000),
+	.wrdma_intf			= REG_FIELD_ID(0x1a000, 12, 16, 3, 0x1000),
+	.wrdma_fifowm			= REG_FIELD_ID(0x1a000, 1, 5, 3, 0x1000),
+	.wrdma_enable			= REG_FIELD_ID(0x1a000, 0, 0, 3, 0x1000),
+
+	.rxtx_rdma_dyncclk		= REG_FIELD_ID(0xe000, 21, 21, 10, 0x1000),
+	.rxtx_rdma_bursten		= REG_FIELD_ID(0xe000, 20, 20, 10, 0x1000),
+	.rxtx_rdma_wpscnt		= REG_FIELD_ID(0xe000, 16, 19, 10, 0x1000),
+	.rxtx_rdma_intf			= REG_FIELD_ID(0xe000, 12, 15, 10, 0x1000),
+	.rxtx_rdma_fifowm		= REG_FIELD_ID(0xe000, 1, 11, 10, 0x1000),
+	.rxtx_rdma_enable		= REG_FIELD_ID(0xe000, 0, 0, 10, 0x1000),
+
+	.rxtx_rdma_codec_enable		= REG_FIELD_ID(0xe050, 30, 30, 10, 0x1000),
+	.rxtx_rdma_codec_pack		= REG_FIELD_ID(0xe050, 29, 29, 10, 0x1000),
+	.rxtx_rdma_codec_fs_sel		= REG_FIELD_ID(0xe050, 25, 27, 10, 0x1000),
+	.rxtx_rdma_codec_fs_delay	= REG_FIELD_ID(0xe050, 21, 24, 10, 0x1000),
+	.rxtx_rdma_codec_intf		= REG_FIELD_ID(0xe050, 16, 19, 10, 0x1000),
+	.rxtx_rdma_codec_ch		= REG_FIELD_ID(0xe050, 0, 7, 10, 0x1000),
+
+	.rxtx_wrdma_dyncclk		= REG_FIELD_ID(0x1a000, 22, 22, 7, 0x1000),
+	.rxtx_wrdma_bursten		= REG_FIELD_ID(0x1a000, 21, 21, 7, 0x1000),
+	.rxtx_wrdma_wpscnt		= REG_FIELD_ID(0x1a000, 17, 20, 7, 0x1000),
+	.rxtx_wrdma_intf		= REG_FIELD_ID(0x1a000, 12, 16, 7, 0x1000),
+	.rxtx_wrdma_fifowm		= REG_FIELD_ID(0x1a000, 1, 11, 7, 0x1000),
+	.rxtx_wrdma_enable		= REG_FIELD_ID(0x1a000, 0, 0, 7, 0x1000),
+
+	.rxtx_wrdma_codec_enable	= REG_FIELD_ID(0x1a050, 30, 30, 7, 0x1000),
+	.rxtx_wrdma_codec_pack		= REG_FIELD_ID(0x1a050, 29, 29, 7, 0x1000),
+	.rxtx_wrdma_codec_fs_sel	= REG_FIELD_ID(0x1a050, 25, 27, 7, 0x1000),
+	.rxtx_wrdma_codec_fs_delay	= REG_FIELD_ID(0x1a050, 21, 24, 7, 0x1000),
+	.rxtx_wrdma_codec_intf		= REG_FIELD_ID(0x1a050, 16, 19, 7, 0x1000),
+	.rxtx_wrdma_codec_ch		= REG_FIELD_ID(0x1a050, 0, 7, 7, 0x1000),
+
+	.va_wrdma_dyncclk		= REG_FIELD_ID(0x1a000, 22, 22, 3, 0x1000),
+	.va_wrdma_bursten		= REG_FIELD_ID(0x1a000, 21, 21, 3, 0x1000),
+	.va_wrdma_wpscnt		= REG_FIELD_ID(0x1a000, 17, 20, 3, 0x1000),
+	.va_wrdma_intf			= REG_FIELD_ID(0x1a000, 12, 16, 3, 0x1000),
+	.va_wrdma_fifowm		= REG_FIELD_ID(0x1a000, 1, 11, 3, 0x1000),
+	.va_wrdma_enable		= REG_FIELD_ID(0x1a000, 0, 0, 3, 0x1000),
+
+	.va_wrdma_codec_enable		= REG_FIELD_ID(0x1a050, 30, 30, 3, 0x1000),
+	.va_wrdma_codec_pack		= REG_FIELD_ID(0x1a050, 29, 29, 3, 0x1000),
+	.va_wrdma_codec_fs_sel		= REG_FIELD_ID(0x1a050, 25, 27, 3, 0x1000),
+	.va_wrdma_codec_fs_delay	= REG_FIELD_ID(0x1a050, 21, 24, 3, 0x1000),
+	.va_wrdma_codec_intf		= REG_FIELD_ID(0x1a050, 16, 19, 3, 0x1000),
+	.va_wrdma_codec_ch		= REG_FIELD_ID(0x1a050, 0, 7, 3, 0x1000),
+
+	.wsa_rdma_dyncclk		= REG_FIELD_ID(0xe000, 21, 21, 10, 0x1000),
+	.wsa_rdma_bursten		= REG_FIELD_ID(0xe000, 20, 20, 10, 0x1000),
+	.wsa_rdma_wpscnt		= REG_FIELD_ID(0xe000, 16, 19, 10, 0x1000),
+	.wsa_rdma_intf			= REG_FIELD_ID(0xe000, 12, 15, 10, 0x1000),
+	.wsa_rdma_fifowm		= REG_FIELD_ID(0xe000, 1, 11, 10, 0x1000),
+	.wsa_rdma_enable		= REG_FIELD_ID(0xe000, 0, 0, 10, 0x1000),
+
+	.wsa_rdma_codec_enable		= REG_FIELD_ID(0xe050, 30, 30, 10, 0x1000),
+	.wsa_rdma_codec_pack		= REG_FIELD_ID(0xe050, 29, 29, 10, 0x1000),
+	.wsa_rdma_codec_fs_sel		= REG_FIELD_ID(0xe050, 25, 27, 10, 0x1000),
+	.wsa_rdma_codec_fs_delay	= REG_FIELD_ID(0xe050, 21, 24, 10, 0x1000),
+	.wsa_rdma_codec_intf		= REG_FIELD_ID(0xe050, 16, 19, 10, 0x1000),
+	.wsa_rdma_codec_ch		= REG_FIELD_ID(0xe050, 0, 7, 10, 0x1000),
+
+	.wsa_wrdma_dyncclk		= REG_FIELD_ID(0x1a000, 22, 22, 7, 0x1000),
+	.wsa_wrdma_bursten		= REG_FIELD_ID(0x1a000, 21, 21, 7, 0x1000),
+	.wsa_wrdma_wpscnt		= REG_FIELD_ID(0x1a000, 17, 20, 7, 0x1000),
+	.wsa_wrdma_intf			= REG_FIELD_ID(0x1a000, 12, 16, 7, 0x1000),
+	.wsa_wrdma_fifowm		= REG_FIELD_ID(0x1a000, 1, 11, 7, 0x1000),
+	.wsa_wrdma_enable		= REG_FIELD_ID(0x1a000, 0, 0, 7, 0x1000),
+
+	.wsa_wrdma_codec_enable		= REG_FIELD_ID(0x1a050, 30, 30, 7, 0x1000),
+	.wsa_wrdma_codec_pack		= REG_FIELD_ID(0x1a050, 29, 29, 7, 0x1000),
+	.wsa_wrdma_codec_fs_sel		= REG_FIELD_ID(0x1a050, 25, 27, 7, 0x1000),
+	.wsa_wrdma_codec_fs_delay	= REG_FIELD_ID(0x1a050, 21, 24, 7, 0x1000),
+	.wsa_wrdma_codec_intf		= REG_FIELD_ID(0x1a050, 16, 19, 7, 0x1000),
+	.wsa_wrdma_codec_ch		= REG_FIELD_ID(0x1a050, 0, 7, 7, 0x1000),
+
+	.hdmi_tx_ctl_addr		= 0x1000,
+	.hdmi_legacy_addr		= 0x1008,
+	.hdmi_vbit_addr			= 0x610c0,
+	.hdmi_ch_lsb_addr		= 0x61048,
+	.hdmi_ch_msb_addr		= 0x6104c,
+	.ch_stride			= 0x8,
+	.hdmi_parity_addr		= 0x61034,
+	.hdmi_dmactl_addr		= 0x61038,
+	.hdmi_dma_stride		= 0x4,
+	.hdmi_DP_addr			= 0x610c8,
+	.hdmi_sstream_addr		= 0x6101c,
+	.hdmi_irq_reg_base		= 0x63000,
+	.hdmi_irq_ports			= 1,
+
+	.hdmi_rdma_dyncclk		= REG_FIELD_ID(0x64000, 14, 14, 4, 0x1000),
+	.hdmi_rdma_bursten		= REG_FIELD_ID(0x64000, 13, 13, 4, 0x1000),
+	.hdmi_rdma_burst8		= REG_FIELD_ID(0x64000, 15, 15, 4, 0x1000),
+	.hdmi_rdma_burst16		= REG_FIELD_ID(0x64000, 16, 16, 4, 0x1000),
+	.hdmi_rdma_dynburst		= REG_FIELD_ID(0x64000, 18, 18, 4, 0x1000),
+	.hdmi_rdma_wpscnt		= REG_FIELD_ID(0x64000, 10, 12, 4, 0x1000),
+	.hdmi_rdma_fifowm		= REG_FIELD_ID(0x64000, 1, 5, 4, 0x1000),
+	.hdmi_rdma_enable		= REG_FIELD_ID(0x64000, 0, 0, 4, 0x1000),
+
+	.sstream_en			= REG_FIELD(0x6101c, 0, 0),
+	.dma_sel			= REG_FIELD(0x6101c, 1, 2),
+	.auto_bbit_en			= REG_FIELD(0x6101c, 3, 3),
+	.layout				= REG_FIELD(0x6101c, 4, 4),
+	.layout_sp			= REG_FIELD(0x6101c, 5, 8),
+	.set_sp_on_en			= REG_FIELD(0x6101c, 10, 10),
+	.dp_audio			= REG_FIELD(0x6101c, 11, 11),
+	.dp_staffing_en			= REG_FIELD(0x6101c, 12, 12),
+	.dp_sp_b_hw_en			= REG_FIELD(0x6101c, 13, 13),
+
+	.mute				= REG_FIELD(0x610c8, 0, 0),
+	.as_sdp_cc			= REG_FIELD(0x610c8, 1, 3),
+	.as_sdp_ct			= REG_FIELD(0x610c8, 4, 7),
+	.aif_db4			= REG_FIELD(0x610c8, 8, 15),
+	.frequency			= REG_FIELD(0x610c8, 16, 21),
+	.mst_index			= REG_FIELD(0x610c8, 28, 29),
+	.dptx_index			= REG_FIELD(0x610c8, 30, 31),
+
+	.soft_reset			= REG_FIELD(0x1000, 31, 31),
+	.force_reset			= REG_FIELD(0x1000, 30, 30),
+
+	.use_hw_chs			= REG_FIELD(0x61038, 0, 0),
+	.use_hw_usr			= REG_FIELD(0x61038, 1, 1),
+	.hw_chs_sel			= REG_FIELD(0x61038, 2, 4),
+	.hw_usr_sel			= REG_FIELD(0x61038, 5, 6),
+
+	.replace_vbit			= REG_FIELD(0x610c0, 0, 0),
+	.vbit_stream			= REG_FIELD(0x610c0, 1, 1),
+
+	.legacy_en			=  REG_FIELD(0x1008, 0, 0),
+	.calc_en			=  REG_FIELD(0x61034, 0, 0),
+	.lsb_bits			=  REG_FIELD(0x61048, 0, 31),
+	.msb_bits			=  REG_FIELD(0x6104c, 0, 31),
+
+	.clk_name			= (const char*[]) {
+							"core_cc_sysnoc_mport_core",
+						},
+	.num_clks			= 1,
+
+	.dai_driver			= sm8650_lpass_cpu_dai_driver,
+	.num_dai			= ARRAY_SIZE(sm8650_lpass_cpu_dai_driver),
+	.dai_osr_clk_names		= (const char *[]) {
+							"core_cc_ext_mclk0",
+							"core_cc_ext_mclk0",
+							"core_cc_ext_mclk0",
+							"core_cc_ext_mclk0",
+							"core_cc_ext_mclk0",
+							"core_cc_ext_mclk0",
+							"core_cc_ext_mclk0",
+							},
+	.dai_bit_clk_names		= (const char *[]) {
+							"core_cc_ext_if0_ibit",
+							"core_cc_ext_if1_ibit",
+							"audio_cc_ext_if5_ibit",
+							"audio_cc_ext_if1_ibit",
+							"aon_cc_ext_if1_ibit",
+							"audio_cc_ext_if2_ibit",
+							"audio_cc_ext_if4_ibit",
+							},
+	.mi2s_desc			= sm8650_lpaif_mi2s_desc,
+	.num_mi2s_desc			= ARRAY_SIZE(sm8650_lpaif_mi2s_desc),
+	.init				= sm8650_lpass_init,
+	.exit				= sm8650_lpass_exit,
+	.alloc_dma_channel		= sm8650_lpass_alloc_dma_channel,
+	.free_dma_channel		= sm8650_lpass_free_dma_channel,
+};
+
+static const struct of_device_id sm8650_lpass_cpu_device_id[] = {
+	{.compatible = "qcom,sm8650-lpass-cpu", .data = &sm8650_data},
+	{}
+};
+MODULE_DEVICE_TABLE(of, sm8650_lpass_cpu_device_id);
+
+static struct platform_driver sm8650_lpass_cpu_platform_driver = {
+	.driver = {
+		.name = "sm8650-lpass-cpu",
+		.of_match_table = of_match_ptr(sm8650_lpass_cpu_device_id),
+		.pm = pm_ptr(&sm8650_lpass_pm_ops),
+	},
+	.probe = asoc_qcom_lpass_cpu_platform_probe,
+	.remove = asoc_qcom_lpass_cpu_platform_remove,
+	.shutdown = asoc_qcom_lpass_cpu_platform_shutdown,
+};
+
+module_platform_driver(sm8650_lpass_cpu_platform_driver);
+
+MODULE_DESCRIPTION("SM8650 LPASS CPU DRIVER");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
index 9e18606ef3b8..a37b980f69ff 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -166,7 +166,7 @@ struct lpaif_mi2s_desc {
 	const char *reg_name;
 	const char *irq_name;
 	enum lpass_lpm lpm_type;
-	struct mi2s_port_desc *port_desc;
+	const struct mi2s_port_desc *port_desc;
 	unsigned int port_desc_count;
 };
 

-- 
2.34.1

