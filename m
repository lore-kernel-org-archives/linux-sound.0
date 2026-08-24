Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05B83E63BD;
	Mon, 24 Aug 2026 06:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787553415; cv=none; b=uYJQfblMVF+MPdh0M7la9/aPKzmGFKk/zcli76+XRSs+vwwkYbT+iyynI9u5BygNrMl+otGe9S8ZVqkl3e/aumYInnk32t8Iwb10qdI4tobsQlNcAlBLz4GfAzPOT7NaAXlAgbXmkaUvYRL5cN8B8sAv7Vh9fw532yhbPTPVnjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787553415; c=relaxed/simple;
	bh=QrjbjHQUedhUvBc1/sKhVWJ/ym9pDs3j40bdniGP3T4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=H0ziuzWwr3fCBbbCLn0QleoBwk2uvlvkavGO9dDHtwFps8utTlFBgatwOl86vM3FIt3UmmDLcRZ6fdqqfjgBr9qHQDwzyWglGgzhJK90OS1eTLqrf7YiK3nkyL4kY8W4fmqqmhNUvD2rOSfDOuqXFH8vkWaUzSHrB1qol1xBkjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bqoMpg32; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bqoMpg32"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O6ScT21982479;
	Mon, 24 Aug 2026 06:36:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yd7zAwNv8TV
	w2zIoWKYg9bhmNkaswOZy3vNsmf2PHus=; b=bqoMpg32jO779obSYnspucBoS/W
	gUO/NApKSHylp56nYVDcgH8Pc6XXqtisI2ScpBvtsy6VyvSz1HMRzS/CpXOZuwCZ
	Q8Ty4bINsJPsBcD7EbdgcXrCCdPRBgwxYlAVnMWwWQJ+BB8k+AZgZCmEnl7Q2eTm
	CalhRpLfLR1HDH8Rz1U/dG0Yz3DIlcDr0e1E+fU67c0t6Vxf8gFDResnpnPF/JLG
	ePhNVgziIKIegTKVfQa8FSlXE6/BeCTTTxplgK72rUj3soIn2AvEGSE4Bj9hT6XY
	DxglJWj6JiMxA2JTnnlhl4VMAdYP4yM/kw9faSez7607be+G2qD1iMWQumA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8gqn812g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Aug 2026 06:36:44 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 67O6aIGd015245;
	Mon, 24 Aug 2026 06:36:41 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 4g74uj2ha4-1;
	Mon, 24 Aug 2026 06:36:41 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67O6aUCS015364;
	Mon, 24 Aug 2026 06:36:41 GMT
Received: from hu-hgautam-hyd.qualcomm.com (hu-hgautam-hyd.qualcomm.com [10.147.247.91])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 67O6aUFI015360;
	Mon, 24 Aug 2026 06:36:40 +0000 (GMT)
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: [PATCH v3 8/9] ASoC: qcom: Add Shikra QAIF support
Date: Mon, 24 Aug 2026 12:06:26 +0530
Message-Id: <20260824063627.3595610-9-harendra.gautam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA1NyBTYWx0ZWRfX5LAhEubOWcZ8
 6vTr4+vChIm0WMUEzEdRlZq2gCGLmp2oSXnG9oZ+69GzPT7BbmmkQfRkL/bQFRxJSHu6LRCfj3V
 czZPmkItbxELy2LRo88vfwRg1mJ2O14=
X-Proofpoint-GUID: JrVBCMY2fgYL50ENtkDITbvZt5rEZoNp
X-Authority-Analysis: v=2.4 cv=fqXsol4f c=1 sm=1 tr=0 ts=6a8be67c cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=rjqYzU_6NLdLAfO1SD4A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA1NyBTYWx0ZWRfXxzCFUtjLQCci
 ctCk9c1si0AcIreQ8bZ04psUeMbUkrAcynw+PIM78VfydzarHZNyjDK7pBeQ+bcOTNB9Gr4pJ2B
 4UFTGEKYYA+TJMjS173aD3GXjdNFOeY1ua1tMvKftSolsJ3VztAdITsg8PbUrHzKAP4rVoW810E
 nSQ0S3KuoUbvFALnk9Z60E7VbuR0LqQT4n4jHcsPTNgBjplRxbA/krt0BJAEIWug004dMpdrvmv
 62rn2kWNlhnB7DSZfeHsi+gCXHR0fNEYM3ux6I+ASKETF+g+xcSkTtnzm17aY0uSTFn3P1M+oUH
 yguTBgJjvy7fFLRCTVJj/+6bQWKw9o4UCwW066GAQXf7sbd68+CpFNMUg5yMTyMTQ6H1eoyuUr9
 oXv3xm0PbNXshwIjrHbqxjkZuUC9Od7EWZJtKK3LB+8xlyuT1sGERFhliaohoUuzjN70HHBVxT2
 Pm+BrarJo5rvuD4u9Rw==
X-Proofpoint-ORIG-GUID: JrVBCMY2fgYL50ENtkDITbvZt5rEZoNp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240057

Provide the Shikra DMA-to-DAI mappings, DMA and SHRAM layout, clock
names, DAI driver data and power-management hooks required by the QAIF
driver. Add the Kconfig symbol and Makefile entries needed to build the
new variant.

Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
---
 sound/soc/qcom/Kconfig       |  10 +
 sound/soc/qcom/Makefile      |   3 +
 sound/soc/qcom/qaif-shikra.c | 425 +++++++++++++++++++++++++++++++++++
 3 files changed, 438 insertions(+)
 create mode 100644 sound/soc/qcom/qaif-shikra.c

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index e6e24f3b9922..b7088b1e5cad 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -71,6 +71,16 @@ config SND_SOC_QCOM_COMMON
 config SND_SOC_QCOM_SDW
 	tristate
 
+config SND_SOC_QCOM_QAIF
+	tristate "Qualcomm QAIF audio interface support"
+	depends on COMMON_CLK
+	select REGMAP_MMIO
+	help
+	  Say Y or M to enable the Qualcomm Audio Interface (QAIF) driver
+	  for the Shikra audio platform. QAIF is a DMA-based audio
+	  subsystem that moves PCM data between memory and external serial
+	  audio interfaces (AIF) and internal codec interfaces (CIF).
+
 config SND_SOC_QDSP6_COMMON
 	tristate
 
diff --git a/sound/soc/qcom/Makefile b/sound/soc/qcom/Makefile
index 985ce2ae286b..cf50b7a24bcf 100644
--- a/sound/soc/qcom/Makefile
+++ b/sound/soc/qcom/Makefile
@@ -47,3 +47,6 @@ obj-$(CONFIG_SND_SOC_QCOM_OFFLOAD_UTILS) += snd-soc-qcom-offload-utils.o
 
 #DSP lib
 obj-$(CONFIG_SND_SOC_QDSP6) += qdsp6/
+
+snd-soc-qcom-qaif-y := qaif-cpu.o qaif-platform.o qaif-shikra.o
+obj-$(CONFIG_SND_SOC_QCOM_QAIF) += snd-soc-qcom-qaif.o
diff --git a/sound/soc/qcom/qaif-shikra.c b/sound/soc/qcom/qaif-shikra.c
new file mode 100644
index 000000000000..484ffaa5b304
--- /dev/null
+++ b/sound/soc/qcom/qaif-shikra.c
@@ -0,0 +1,425 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * qaif-shikra.c -- ALSA SoC CPU-Platform DAI driver for QTi QAIF
+ */
+
+#include <linux/module.h>
+#include <linux/pm.h>
+#include <sound/pcm.h>
+#include <sound/soc.h>
+#include "qaif.h"
+
+static const struct qaif_dmaidx_dai_map shikra_mi2s_dma_dai_map[] = {
+	{ QAIF_MI2S_AIF0, QAIF_DMA_IDX0 },
+	{ QAIF_MI2S_AIF1, QAIF_DMA_IDX1 },
+	{ QAIF_MI2S_AIF2, QAIF_DMA_IDX2 },
+	{ QAIF_MI2S_AIF3, QAIF_DMA_IDX3 },
+};
+
+static const struct qaif_dmaidx_dai_map shikra_tdm_dma_dai_map[] = {
+	{ QAIF_TDM_AIF0, QAIF_DMA_IDX0 },
+	{ QAIF_TDM_AIF1, QAIF_DMA_IDX1 },
+	{ QAIF_TDM_AIF2, QAIF_DMA_IDX2 },
+	{ QAIF_TDM_AIF3, QAIF_DMA_IDX3 },
+};
+
+static const struct qaif_dmaidx_dai_map shikra_cif_rx_dma_dai_map[] = {
+	{ QAIF_CDC_DMA_RX0, QAIF_DMA_IDX0 },
+	{ QAIF_CDC_DMA_RX1, QAIF_DMA_IDX1 },
+};
+
+static const struct qaif_dmaidx_dai_map shikra_cif_va_dma_dai_map[] = {
+	{ QAIF_CDC_DMA_VA_TX0, QAIF_DMA_IDX0 },
+	{ QAIF_CDC_DMA_VA_TX1, QAIF_DMA_IDX1 },
+};
+
+static struct snd_soc_dai_driver shikra_qaif_cpu_dai_driver[] = {
+	{
+		.id = QAIF_MI2S_AIF0,
+		.name = "MI2S AIF Zero",
+		.playback = {
+			.stream_name = "MI2S AIF Zero Playback",
+			.formats	= SNDRV_PCM_FMTBIT_S16 |
+					  SNDRV_PCM_FMTBIT_S32,
+			.rates		= SNDRV_PCM_RATE_8000_192000,
+			.channels_min	= 1,
+			.channels_max	= 2,
+		},
+		.capture = {
+			.stream_name = "MI2S AIF Zero Capture",
+			.formats	= SNDRV_PCM_FMTBIT_S16 |
+					  SNDRV_PCM_FMTBIT_S32,
+			.rates		= SNDRV_PCM_RATE_8000_192000,
+			.channels_min	= 1,
+			.channels_max	= 2,
+		},
+		.ops = &asoc_qcom_qaif_aif_cpu_dai_ops,
+	}, {
+		.id = QAIF_MI2S_AIF1,
+		.name = "MI2S AIF One",
+		.playback = {
+			.stream_name = "MI2S AIF One Playback",
+			.formats	= SNDRV_PCM_FMTBIT_S16 |
+					  SNDRV_PCM_FMTBIT_S32,
+			.rates		= SNDRV_PCM_RATE_8000_192000,
+			.channels_min	= 1,
+			.channels_max	= 2,
+		},
+		.capture = {
+			.stream_name = "MI2S AIF One Capture",
+			.formats	= SNDRV_PCM_FMTBIT_S16 |
+					  SNDRV_PCM_FMTBIT_S32,
+			.rates		= SNDRV_PCM_RATE_8000_192000,
+			.channels_min	= 1,
+			.channels_max	= 2,
+		},
+		.ops = &asoc_qcom_qaif_aif_cpu_dai_ops,
+	}, {
+		.id = QAIF_MI2S_AIF2,
+		.name = "MI2S AIF Two",
+		.playback = {
+			.stream_name = "MI2S AIF Two Playback",
+			.formats	= SNDRV_PCM_FMTBIT_S16 |
+					  SNDRV_PCM_FMTBIT_S32,
+			.rates		= SNDRV_PCM_RATE_8000_192000,
+			.channels_min	= 1,
+			.channels_max	= 2,
+		},
+		.capture = {
+			.stream_name = "MI2S AIF Two Capture",
+			.formats	= SNDRV_PCM_FMTBIT_S16 |
+					  SNDRV_PCM_FMTBIT_S32,
+			.rates		= SNDRV_PCM_RATE_8000_192000,
+			.channels_min	= 1,
+			.channels_max	= 2,
+		},
+		.ops = &asoc_qcom_qaif_aif_cpu_dai_ops,
+	}, {
+		.id = QAIF_MI2S_AIF3,
+		.name = "MI2S AIF Three",
+		.playback = {
+			.stream_name = "MI2S AIF Three Playback",
+			.formats	= SNDRV_PCM_FMTBIT_S16 |
+					  SNDRV_PCM_FMTBIT_S32,
+			.rates		= SNDRV_PCM_RATE_8000_192000,
+			.channels_min	= 1,
+			.channels_max	= 2,
+		},
+		.capture = {
+			.stream_name = "MI2S AIF Three Capture",
+			.formats	= SNDRV_PCM_FMTBIT_S16 |
+					  SNDRV_PCM_FMTBIT_S32,
+			.rates		= SNDRV_PCM_RATE_8000_192000,
+			.channels_min	= 1,
+			.channels_max	= 2,
+		},
+		.ops = &asoc_qcom_qaif_aif_cpu_dai_ops,
+	}, {
+		.id = QAIF_TDM_AIF0,
+		.name = "TDM AIF Zero",
+		.playback = {
+			.stream_name = "TDM AIF Zero Playback",
+			.formats	= SNDRV_PCM_FMTBIT_S16 |
+					  SNDRV_PCM_FMTBIT_S24 |
+					  SNDRV_PCM_FMTBIT_S32,
+			.rates		= SNDRV_PCM_RATE_8000_192000,
+			.channels_min	= 1,
+			.channels_max	= 8,
+		},
+		.capture = {
+			.stream_name = "TDM AIF Zero Capture",
+			.formats	= SNDRV_PCM_FMTBIT_S16 |
+					  SNDRV_PCM_FMTBIT_S24 |
+					  SNDRV_PCM_FMTBIT_S32,
+			.rates		= SNDRV_PCM_RATE_8000_192000,
+			.channels_min	= 1,
+			.channels_max	= 8,
+		},
+		.ops = &asoc_qcom_qaif_aif_cpu_dai_ops,
+	}, {
+		.id = QAIF_TDM_AIF1,
+		.name = "TDM AIF One",
+		.playback = {
+			.stream_name = "TDM AIF One Playback",
+			.formats	= SNDRV_PCM_FMTBIT_S16 |
+					  SNDRV_PCM_FMTBIT_S24 |
+					  SNDRV_PCM_FMTBIT_S32,
+			.rates		= SNDRV_PCM_RATE_8000_192000,
+			.channels_min	= 1,
+			.channels_max	= 8,
+		},
+		.capture = {
+			.stream_name = "TDM AIF One Capture",
+			.formats	= SNDRV_PCM_FMTBIT_S16 |
+					  SNDRV_PCM_FMTBIT_S24 |
+					  SNDRV_PCM_FMTBIT_S32,
+			.rates		= SNDRV_PCM_RATE_8000_192000,
+			.channels_min	= 1,
+			.channels_max	= 8,
+		},
+		.ops = &asoc_qcom_qaif_aif_cpu_dai_ops,
+	}, {
+		.id = QAIF_TDM_AIF2,
+		.name = "TDM AIF Two",
+		.playback = {
+			.stream_name = "TDM AIF Two Playback",
+			.formats	= SNDRV_PCM_FMTBIT_S16 |
+					  SNDRV_PCM_FMTBIT_S24 |
+					  SNDRV_PCM_FMTBIT_S32,
+			.rates		= SNDRV_PCM_RATE_8000_192000,
+			.channels_min	= 1,
+			.channels_max	= 8,
+		},
+		.capture = {
+			.stream_name = "TDM AIF Two Capture",
+			.formats	= SNDRV_PCM_FMTBIT_S16 |
+					  SNDRV_PCM_FMTBIT_S24 |
+					  SNDRV_PCM_FMTBIT_S32,
+			.rates		= SNDRV_PCM_RATE_8000_192000,
+			.channels_min	= 1,
+			.channels_max	= 8,
+		},
+		.ops = &asoc_qcom_qaif_aif_cpu_dai_ops,
+	}, {
+		.id = QAIF_TDM_AIF3,
+		.name = "TDM AIF Three",
+		.playback = {
+			.stream_name = "TDM AIF Three Playback",
+			.formats	= SNDRV_PCM_FMTBIT_S16 |
+					  SNDRV_PCM_FMTBIT_S24 |
+					  SNDRV_PCM_FMTBIT_S32,
+			.rates		= SNDRV_PCM_RATE_8000_192000,
+			.channels_min	= 1,
+			.channels_max	= 8,
+		},
+		.capture = {
+			.stream_name = "TDM AIF Three Capture",
+			.formats	= SNDRV_PCM_FMTBIT_S16 |
+					  SNDRV_PCM_FMTBIT_S24 |
+					  SNDRV_PCM_FMTBIT_S32,
+			.rates		= SNDRV_PCM_RATE_8000_192000,
+			.channels_min	= 1,
+			.channels_max	= 8,
+		},
+		.ops = &asoc_qcom_qaif_aif_cpu_dai_ops,
+	}, {
+		.id = QAIF_CDC_DMA_RX0,
+		.name = "CDC DMA RX0",
+		.playback = {
+			.stream_name = "WCD Playback0",
+			.formats = SNDRV_PCM_FMTBIT_S16,
+			.rates = SNDRV_PCM_RATE_48000,
+			.rate_min	= 48000,
+			.rate_max	= 48000,
+			.channels_min	= 1,
+			.channels_max	= 2,
+		},
+		.ops	= &asoc_qcom_qaif_cif_dai_ops,
+	}, {
+		.id = QAIF_CDC_DMA_RX1,
+		.name = "CDC DMA RX1",
+		.playback = {
+			.stream_name = "WCD Playback1",
+			.formats = SNDRV_PCM_FMTBIT_S16,
+			.rates = SNDRV_PCM_RATE_48000,
+			.rate_min	= 48000,
+			.rate_max	= 48000,
+			.channels_min	= 1,
+			.channels_max	= 2,
+		},
+		.ops	= &asoc_qcom_qaif_cif_dai_ops,
+	}, {
+		.id = QAIF_CDC_DMA_VA_TX0,
+		.name = "CDC DMA VA_TX0",
+		.capture = {
+			.stream_name = "DMIC Capture0",
+			.formats = SNDRV_PCM_FMTBIT_S16,
+			.rates = SNDRV_PCM_RATE_48000,
+			.rate_min	= 48000,
+			.rate_max	= 48000,
+			.channels_min	= 1,
+			.channels_max	= 4,
+		},
+		.ops	= &asoc_qcom_qaif_cif_dai_ops,
+	}, {
+		.id = QAIF_CDC_DMA_VA_TX1,
+		.name = "CDC DMA VA_TX1",
+		.capture = {
+			.stream_name = "DMIC Capture1",
+			.formats = SNDRV_PCM_FMTBIT_S16,
+			.rates = SNDRV_PCM_RATE_48000,
+			.rate_min	= 48000,
+			.rate_max	= 48000,
+			.channels_min	= 1,
+			.channels_max	= 4,
+		},
+		.ops	= &asoc_qcom_qaif_cif_dai_ops,
+	},
+};
+
+static int shikra_qaif_get_dma_idx(unsigned int dai_id)
+{
+	const struct qaif_dmaidx_dai_map *map;
+	int i, size;
+
+	switch (dai_id) {
+	case QAIF_MI2S_AIF0 ... QAIF_MI2S_AIF12:
+		map = shikra_mi2s_dma_dai_map;
+		size = ARRAY_SIZE(shikra_mi2s_dma_dai_map);
+		break;
+	case QAIF_TDM_AIF0 ... QAIF_TDM_AIF12:
+		map = shikra_tdm_dma_dai_map;
+		size = ARRAY_SIZE(shikra_tdm_dma_dai_map);
+		break;
+	case QAIF_CDC_DMA_RX0 ... QAIF_CDC_DMA_RX9:
+		map = shikra_cif_rx_dma_dai_map;
+		size = ARRAY_SIZE(shikra_cif_rx_dma_dai_map);
+		break;
+	case QAIF_CDC_DMA_VA_TX0 ... QAIF_CDC_DMA_VA_TX9:
+		map = shikra_cif_va_dma_dai_map;
+		size = ARRAY_SIZE(shikra_cif_va_dma_dai_map);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	for (i = 0; i < size; i++) {
+		if (map[i].dai_id == dai_id)
+			return map[i].dma_idx;
+	}
+	return -EINVAL;
+}
+
+static int shikra_qaif_alloc_stream_dma_idx(struct qaif_drv_data *drvdata,
+					    int direction,
+					    unsigned int dai_id)
+{
+	const struct qaif_variant *v = drvdata->variant;
+	int dma_idx, index;
+
+	dma_idx = shikra_qaif_get_dma_idx(dai_id);
+	if (dma_idx < 0)
+		return dma_idx;
+
+	switch (dai_id) {
+	case QAIF_MI2S_AIF0 ... QAIF_MI2S_AIF12:
+	case QAIF_TDM_AIF0 ... QAIF_TDM_AIF12:
+		index = (direction == SNDRV_PCM_STREAM_PLAYBACK) ?
+			dma_idx : v->wrdma_start + dma_idx;
+		if (index >= QAIF_MAX_AIF_DMA_IDX)
+			return -EINVAL;
+		if (test_and_set_bit(index, &drvdata->aif_dma_idx_bit_map))
+			return -EBUSY;
+		break;
+	case QAIF_CDC_DMA_RX0 ... QAIF_CDC_DMA_RX9:
+	case QAIF_CDC_DMA_VA_TX0 ... QAIF_CDC_DMA_VA_TX9:
+		index = (direction == SNDRV_PCM_STREAM_PLAYBACK) ?
+			dma_idx : v->codec_wrdma_start + dma_idx;
+		if (index >= QAIF_MAX_CIF_DMA_IDX)
+			return -EINVAL;
+		if (test_and_set_bit(index, &drvdata->cif_dma_idx_bit_map))
+			return -EBUSY;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return index;
+}
+
+static int shikra_qaif_free_stream_dma_idx(struct qaif_drv_data *drvdata,
+					   int index,
+					   unsigned int dai_id)
+{
+	if (qaif_is_aif_port(dai_id))
+		clear_bit(index, &drvdata->aif_dma_idx_bit_map);
+	else
+		clear_bit(index, &drvdata->cif_dma_idx_bit_map);
+	return 0;
+}
+
+static const struct qaif_variant shikra_qaif_data = {
+	.ee = 0,
+
+	.num_rddma = 4,
+	.num_wrdma = 4,
+	.wrdma_start = 4,
+
+	.num_codec_rddma = 4,
+	.num_codec_wrdma = 4,
+	.codec_wrdma_start = 4,
+	.num_intf = 4,
+
+	.rddma_reg_base = 0x8000,
+	.rddma_stride = 0x1000,
+	.codec_rddma_reg_base = 0xc000,
+	.codec_rddma_stride = 0x1000,
+
+	.wrdma_reg_base = 0x11000,
+	.wrdma_stride = 0x1000,
+	.codec_wrdma_reg_base = 0x15000,
+	.codec_wrdma_stride = 0x1000,
+
+	.rddma_irq_reg_base = 0x19000,
+	.rddma_irq_stride = 0x1000,
+	.codec_rddma_irq_reg_base = 0x191A0,
+	.codec_rddma_irq_stride = 0x1000,
+
+	.wrdma_irq_reg_base = 0x19078,
+	.wrdma_irq_stride = 0x1000,
+	.codec_wrdma_irq_reg_base = 0x19290,
+	.codec_wrdma_irq_stride = 0x1000,
+
+	.qxm_type = QAIF_QXM0,
+	.rd_len = 512,
+	.rddma_shram_len = 64,
+	.rddma_shram_start_addr = {0, 256},
+	.wr_len = 512,
+	.wrdma_shram_len = 64,
+	.wrdma_shram_start_addr = {0, 256},
+
+	.clk_name		= (const char * const []) {
+					"lpass_config",
+					"lpass_core_axim",
+					"bus",
+				},
+	.num_clks		= 3,
+
+	.dai_driver		= shikra_qaif_cpu_dai_driver,
+	.num_dai		= ARRAY_SIZE(shikra_qaif_cpu_dai_driver),
+
+	.dai_bit_clk_names	= (const char * const []) {
+					"aif_if0_ibit",
+					"aif_if1_ibit",
+					"aif_if2_ibit",
+					"aif_if3_ibit",
+				},
+	.aif_full_cycle_en	= (const bool []) { false, false, false, false },
+	.aif_ctrl_data_oe	= (const bool []) { false, false, false, false },
+	.aif_loopback_en	= (const bool []) { false, false, false, false },
+	.alloc_stream_dma_idx	= shikra_qaif_alloc_stream_dma_idx,
+	.free_stream_dma_idx	= shikra_qaif_free_stream_dma_idx,
+	.get_dma_idx		= shikra_qaif_get_dma_idx,
+};
+
+static const struct of_device_id shikra_qaif_cpu_device_id[] = {
+	{ .compatible = "qcom,shikra-qaif-cpu", .data = &shikra_qaif_data },
+	{}
+};
+MODULE_DEVICE_TABLE(of, shikra_qaif_cpu_device_id);
+
+static struct platform_driver shikra_qaif_cpu_platform_driver = {
+	.driver = {
+		.name = "shikra-qaif-cpu",
+		.of_match_table = shikra_qaif_cpu_device_id,
+		.pm = pm_ptr(&asoc_qcom_qaif_pm_ops),
+	},
+	.probe = asoc_qcom_qaif_cpu_platform_probe,
+};
+module_platform_driver(shikra_qaif_cpu_platform_driver);
+
+MODULE_DESCRIPTION("Qualcomm Audio Interface (QAIF) Shikra variant driver");
+MODULE_AUTHOR("Harendra Gautam <harendra.gautam@oss.qualcomm.com>");
+MODULE_LICENSE("GPL");
-- 
2.34.1

