Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF7A3E5A29;
	Mon, 24 Aug 2026 06:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787553411; cv=none; b=BLPWawe+SlaSNA55idw7SIj0ZM7p0T3wg9BcWEXtwwfXoiXlY1UMdvlnhLF2nVLypFeddPb5f+1p8rPCUty7lR4aT3GEnTjFhsK6gsgxKE89UOYqZV/Mn1uCyR/VW2v9moZfbS+jQmR1tCqSsDdyr4sDxtJ8WtTx+/yvOEsnzPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787553411; c=relaxed/simple;
	bh=jtRU9bNmR7XniAOxe9eM4k0BWWgMbycUUfOOyIzc9fg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sCGbdvxsfVJMpeoRmcwpF+RC+Sf3fHI+KDjn90AO4lbrFoYc9dr4Xlyl6sNfbTn60QnSoaU5dGBl+LSXS2Dgcr+yjjITGhcSR58oUNhS5F9nXRnNSi1bUP2IVif9v8wQNVN7G7P0dE8ga+8Bf6BvPMC4CRELot4eHtzvf7oa31E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UiDiWoyr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UiDiWoyr"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RIq21008611;
	Mon, 24 Aug 2026 06:36:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cgPFSBPBEBZ
	zodghEvIBQ2dlKodVLyv13+1aousfTZM=; b=UiDiWoyrMYjNUL3lpBXnyZAL7cy
	Gn4v2Udq/PazLYo/LpxXd69bNPozQ0ZPTGbZSaDRHpG5xwaN2bMNiSrxtPjEzr5B
	0NyJQAh9xKJzp7LUTLqL2jVktuPG9wARZHWdv9IeeKWE3nSC2ZxCUJgY3bvRUC1j
	pLar+uKq0xjGhiPttZqgupOtShGGpGMIc/Ksqiwo1YMfbGOlYG5xyhAkkqVZmofB
	0Y5okAx3bvIIH0JTJn2ovp0oiN0wyJ05lcM5Tlw2RIPAFGCAi+D+CK2mvp0u7Q7k
	MJSNlxwGMCdjbRo38W/u8sQI8nc7hDhksncMWfiL6TwtLbturt5ou2MtyDw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g74xhdgnk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Aug 2026 06:36:38 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 67O6aZmX015482;
	Mon, 24 Aug 2026 06:36:35 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 4g74uj2h7n-1;
	Mon, 24 Aug 2026 06:36:35 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67O6aUCI015364;
	Mon, 24 Aug 2026 06:36:35 GMT
Received: from hu-hgautam-hyd.qualcomm.com (hu-hgautam-hyd.qualcomm.com [10.147.247.91])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 67O6aUFD015360;
	Mon, 24 Aug 2026 06:36:35 +0000 (GMT)
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
Subject: [PATCH v3 3/9] ASoC: qcom: Add QAIF hardware register map
Date: Mon, 24 Aug 2026 12:06:21 +0530
Message-Id: <20260824063627.3595610-4-harendra.gautam@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: RanlQN6hynpGhFOv6vACbWYjWHY_b4iI
X-Authority-Analysis: v=2.4 cv=GdQnWwXL c=1 sm=1 tr=0 ts=6a8be677 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=lZfL7hTs5R9vjdWfsbYA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA1NyBTYWx0ZWRfX8dewZe58xopy
 Cfn3IEfZRxqYozQWXcZJ4X+aZ1om9cR2mkXyBLwQJnY67XoMbSkEkVSNrf7S5kgg/qYDPgFGB7A
 JhswoCbECks3D+QLL/M4qr26VmQOyKrvAMs59AHE+d3afC3MvPzxxdZgjZqVI1TRErYDRhVnaxx
 yeluU8tW5kmOxKD3y/3DCKTVU5oA4p6H2FNy1H+IToB8zSc84suNSz9y3MhaAfl8CBXn66g42cW
 WmZPkf7ov8coAL54Pp5ewg1XvsXIpxHFQAgYC+7fCMFL5xEe7w67OWtczimvKM+yLofo/qNO48u
 BxEJ/x1ujLakB2gyhTwVNVO3BzhHP47LLM3UT+SDcDNZcYVuRZtIzyJEz2oF2YEQnutVXkd8k0X
 8NkdC95dxV6UxXZx1uXCv4KNQ88h7kudfhCktAAwhbsl3sXNhr54jd7pZQYWuCDB+8Ud64OqloC
 C8pLceZ9V4GnBdqANlA==
X-Proofpoint-GUID: RanlQN6hynpGhFOv6vACbWYjWHY_b4iI
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA1NyBTYWx0ZWRfXzpx/tVJZuQW0
 qYjA34IyIoVmOOG8023Q+2i8gWDn3UYzrdRfhQ1U/cokJ27RZXCR8iz4b939N82Yw2DWGD6Iheb
 V0yx2UzvVQJHMeqeB9qrdEbjM0/6GSI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1011 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240057

The QAIF driver needs a common register map to program the core registers,
audio interfaces, AIF/CIF DMA channels, interrupt registers, SHRAM/QXM
routing, and SID maps. Add accessor helpers so the driver can select the
proper AIF or CIF DMA register set based on the DAI ID.

Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
---
 sound/soc/qcom/qaif-reg.h | 458 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 458 insertions(+)
 create mode 100644 sound/soc/qcom/qaif-reg.h

diff --git a/sound/soc/qcom/qaif-reg.h b/sound/soc/qcom/qaif-reg.h
new file mode 100644
index 000000000000..fc968d584487
--- /dev/null
+++ b/sound/soc/qcom/qaif-reg.h
@@ -0,0 +1,458 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * qaif-reg.h -- QAIF ALSA SoC CPU-Platform DAI driver register header
+ */
+#ifndef SND_SOC_QCOM_QAIF_REG_H
+#define SND_SOC_QCOM_QAIF_REG_H
+
+#include "qaif.h"
+
+#define QAIF_SUMMARY_IRQSTAT_REG(v)			(0x19188 + (0x1000 * ((v)->ee)))
+
+/* Core HW info */
+#define QAIF_HW_VERSION_REG				(0x0000)
+#define QAIF_HW_INFO_REG				(0x0004)
+#define QAIF_HW_INFO2_REG				(0x0008)
+
+/* Interface lane and channel info */
+#define QAIF_AUD_INTF_LANE_INFO_REG			(0x0020)
+#define QAIF_AUD_INTF_LANE_INFO2_REG			(0x0024)
+#define QAIF_CDC_TX_INTF_CH_INFO_REG(n)			(0x0028 + (0x4 * (n)))
+#define QAIF_CDC_RX_INTF_CH_INFO_REG(n)			(0x0068 + (0x4 * (n)))
+#define QAIF_QXM1_SHRAM_LENGTH_INFO_REG			(0x0088)
+#define QAIF_QXM0_SHRAM_LENGTH_INFO_REG			(0x008C)
+#define QAIF_NUM_AUD_INTF_TO_RAIL_INFO_REG		(0x0090)
+
+/* Debug/control and status */
+#define QAIF_DEBUG_CTL_REG				(0x0200)
+#define QAIF_WRDMA_LOOPBACK_EN_REG			(0x0204)
+#define QAIF_WRDMA_LOOPBACK_SEL_REG			(0x0208)
+#define QAIF_SHRAM_DYNAMIC_CLK_GATING_EN_REG		(0x0300)
+#define QAIF_AXI_STATUS_REG				(0x0304)
+#define QAIF_QSB_DYNAMIC_CLK_GATING_EN_REG		(0x0308)
+#define QAIF_START_STOP_CTRL_BYPASS_EN_REG		(0x030C)
+#define QAIF_QXM0_AXI_ATTR_CFG_REG			(0x040C)
+
+/* QXM request/grant debug */
+#define QAIF_QXM0_AUD_WR_REQ_GNT_DBG_STAT_REG		(0x0500)
+#define QAIF_QXM1_AUD_WR_REQ_GNT_DBG_STAT_REG		(0x0504)
+#define QAIF_QXM0_CODEC_RX_WR_REQ_DBG_STAT_REG		(0x0508)
+#define QAIF_QXM0_CODEC_RX_WR_GNT_DBG_STAT_REG		(0x050C)
+#define QAIF_QXM1_CODEC_RX_WR_REQ_DBG_STAT_REG		(0x0510)
+#define QAIF_QXM1_CODEC_RX_WR_GNT_DBG_STAT_REG		(0x0514)
+#define QAIF_QXM0_AUD_RD_REQ_GNT_DBG_STAT_REG		(0x0518)
+#define QAIF_QXM1_AUD_RD_REQ_GNT_DBG_STAT_REG		(0x051C)
+#define QAIF_QXM0_CODEC_TX_RD_REQ_DBG_STAT_REG		(0x0520)
+#define QAIF_QXM0_CODEC_TX_RD_GNT_DBG_STAT_REG		(0x0524)
+#define QAIF_QXM1_CODEC_TX_RD_REQ_DBG_STAT_REG		(0x0528)
+#define QAIF_QXM1_CODEC_TX_RD_GNT_DBG_STAT_REG		(0x052C)
+#define QAIF_QXM0_EXT_RDDMA_RD_REQ_GNT_DBG_STAT_REG	(0x0530)
+#define QAIF_QXM1_EXT_RDDMA_RD_REQ_GNT_DBG_STAT_REG	(0x0534)
+
+/* QSB transaction debug */
+#define QAIF_QSB_AUD_WR_TXN_DBG_STAT_REG		(0x0538)
+#define QAIF_QSB_CODEC_RX_WR_TXN_ERR_DBG_STAT_REG	(0x053C)
+#define QAIF_QSB_CODEC_RX_WR_TXN_OKAY_DBG_STAT_REG	(0x0540)
+#define QAIF_QSB_AUD_ADDR_SENT_DBG_STAT_REG		(0x0544)
+#define QAIF_QSB_CODEC_TX_RD_ADDR_SENT_DBG_STAT_REG	(0x0548)
+#define QAIF_QSB_EXT_RDDMA_RD_ADDR_SENT_DBG_STAT_REG	(0x054C)
+#define QAIF_QSB_CODEC_RX_WR_ADDR_SENT_DBG_STAT_REG	(0x0550)
+#define QAIF_QSB_AUD_RD_TXN_DBG_STAT_REG		(0x0554)
+#define QAIF_QSB_CODEC_TX_RD_TXN_ERR_DBG_STAT_REG	(0x0558)
+#define QAIF_QSB_CODEC_TX_RD_TXN_RCVD_DBG_STAT_REG	(0x055C)
+#define QAIF_QSB_EXT_RDDMA_RD_TXN_DBG_STAT_REG		(0x0560)
+#define QAIF_QSB_MISC_DBG_STATUS_REG			(0x0564)
+
+/* Global spare and HWE */
+#define QAIF_GLOBAL_SPARE_IN_REG			(0x0B00)
+#define QAIF_GLOBAL_SPARE_OUT_REG			(0x0B04)
+#define QAIF_HWE_CFG_REG				(0x0B08)
+
+/* SID maps */
+#define QAIF_WRDMA_SID_MAP_REG				(0x1B00)
+#define QAIF_CDC_WRDMA_SID_MAP_REG			(0x1B40)
+#define QAIF_RDDMA_SID_MAP_REG				(0x1C00)
+#define QAIF_CDC_RDDMA_SID_MAP_REG			(0x1C40)
+
+/* EE overlap interrupts */
+#define QAIF_EE_OVERLAP_IRQ_EN_REG			(0x1D00)
+#define QAIF_EE_OVERLAP_IRQ_RAW_STATUS_REG		(0x1D04)
+#define QAIF_EE_OVERLAP_IRQ_CLEAR_REG			(0x1D08)
+#define QAIF_EE_OVERLAP_IRQ_FORCE_REG			(0x1D0C)
+
+/*
+ * EE (Execution Engine) assignment and map registers.
+ *
+ * The EE offset (v->ee) is an address/index offset relative to the
+ * platform-defined QAIF/EE base and lets the hardware route the AIF
+ * operation to the correct EE context. It is hardware/platform-specific and
+ * must match the mapping defined for the selected QAIF AIF/lane in the
+ * hardware programming guide. It is not a runtime data offset and must not
+ * be changed based on the stream configuration.
+ */
+#define QAIF_EE_RDDMA_ASSIGNMENT_REG(v)			(0x19148 + (0x1000 * ((v)->ee)))
+#define QAIF_EE_WRDMA_ASSIGNMENT_REG(v)			(0x19150 + (0x1000 * ((v)->ee)))
+#define QAIF_EE_INTF_ASSIGNMENT_REG(v)			(0x19158 + (0x1000 * ((v)->ee)))
+#define QAIF_EE_CODEC_RDDMA_ASSIGN_REG(v)		(0x19308 + (0x1000 * ((v)->ee)))
+#define QAIF_EE_CODEC_WRDMA_ASSIGN_REG(v)		(0x19318 + (0x1000 * ((v)->ee)))
+#define QAIF_EE_RDDMA_MAP_REG(v)			(0x1920 + (0x1000 * ((v)->ee)))
+#define QAIF_EE_WRDMA_MAP_REG(v)			(0x1940 + (0x1000 * ((v)->ee)))
+#define QAIF_EE_INTF_MAP_REG(v)				(0x1960 + (0x1000 * ((v)->ee)))
+#define QAIF_EE_CODEC_RDDMA_MAP_REG(v)			(0x1980 + (0x1000 * ((v)->ee)))
+#define QAIF_EE_CODEC_WRDMA_MAP_REG(v)			(0x1A00 + (0x1000 * ((v)->ee)))
+
+/* EE rate-detection and VFR interrupts */
+#define QAIF_EE_RATE_DET_IRQ_EN_REG(v)			(0x190F0 + (0x1000 * ((v)->ee)))
+#define QAIF_EE_RATE_DET_IRQ_STAT_REG(v)		(0x190F4 + (0x1000 * ((v)->ee)))
+#define QAIF_EE_RATE_DET_IRQ_RAW_STAT_REG(v)		(0x190F8 + (0x1000 * ((v)->ee)))
+#define QAIF_EE_RATE_DET_IRQ_CLEAR_REG(v)		(0x190FC + (0x1000 * ((v)->ee)))
+#define QAIF_EE_RATE_DET_IRQ_FORCE_REG(v)		(0x19100 + (0x1000 * ((v)->ee)))
+
+#define QAIF_EE_VFR_IRQ_EN_REG(v)			(0x19104 + (0x1000 * ((v)->ee)))
+#define QAIF_EE_VFR_IRQ_STATUS_REG(v)			(0x19108 + (0x1000 * ((v)->ee)))
+#define QAIF_EE_VFR_IRQ_RAW_STATUS_REG(v)		(0x1910C + (0x1000 * ((v)->ee)))
+#define QAIF_EE_VFR_IRQ_CLEAR_REG(v)			(0x19110 + (0x1000 * ((v)->ee)))
+#define QAIF_EE_VFR_IRQ_FORCE_REG(v)			(0x19114 + (0x1000 * ((v)->ee)))
+
+/* EE AUD_INTF underflow/overflow interrupts */
+#define QAIF_EE_AUD_INTF_UF_IRQ_EN_REG(v)		(0x19160 + (0x1000 * ((v)->ee)))
+#define QAIF_EE_AUD_INTF_UF_IRQ_STAT_REG(v)		(0x19164 + (0x1000 * ((v)->ee)))
+#define QAIF_EE_AUD_INTF_UF_IRQ_RAW_STAT_REG(v)		(0x19168 + (0x1000 * ((v)->ee)))
+#define QAIF_EE_AUD_INTF_UF_IRQ_CLEAR_REG(v)		(0x1916C + (0x1000 * ((v)->ee)))
+#define QAIF_EE_AUD_INTF_UF_IRQ_FORCE_REG(v)		(0x19170 + (0x1000 * ((v)->ee)))
+
+#define QAIF_EE_AUD_INTF_OF_IRQ_EN_REG(v)		(0x19174 + (0x1000 * ((v)->ee)))
+#define QAIF_EE_AUD_INTF_OF_IRQ_STAT_REG(v)		(0x19178 + (0x1000 * ((v)->ee)))
+#define QAIF_EE_AUD_INTF_OF_IRQ_RAW_STAT_REG(v)		(0x1917C + (0x1000 * ((v)->ee)))
+#define QAIF_EE_AUD_INTF_OF_IRQ_CLEAR_REG(v)		(0x19180 + (0x1000 * ((v)->ee)))
+#define QAIF_EE_AUD_INTF_OF_IRQ_FORCE_REG(v)		(0x19184 + (0x1000 * ((v)->ee)))
+
+/* EE L2 Period IRQ mux selection */
+#define QAIF_EE_L2_PERIOD_IRQ_0_3_MUX_SEL_REG(v)	(0x19F00 + (0x1000 * ((v)->ee)))
+#define QAIF_EE_L2_PERIOD_IRQ_4_7_MUX_SEL_REG(v)	(0x19F04 + (0x1000 * ((v)->ee)))
+
+/* AUD_INTF block (per interface, stride 0x1000 starting at 0x4000) */
+#define QAIF_AUD_INTF_REG_ADDR(offset, i)		(0x4000 + (offset) + (0x1000 * (i)))
+
+#define QAIF_AUD_INTF_CTL_REG(i)			QAIF_AUD_INTF_REG_ADDR(0x0000, (i))
+#define QAIF_AUD_INTF_SYNC_CFG_REG(i)			QAIF_AUD_INTF_REG_ADDR(0x0004, (i))
+#define QAIF_AUD_INTF_BIT_WIDTH_CFG_REG(i)		QAIF_AUD_INTF_REG_ADDR(0x0008, (i))
+#define QAIF_AUD_INTF_FRAME_CFG_REG(i)			QAIF_AUD_INTF_REG_ADDR(0x000C, (i))
+#define QAIF_AUD_INTF_ACTV_SLOT_EN_TX_REG(i)		QAIF_AUD_INTF_REG_ADDR(0x0010, (i))
+#define QAIF_AUD_INTF_ACTV_SLOT_EN_RX_REG(i)		QAIF_AUD_INTF_REG_ADDR(0x0030, (i))
+#define QAIF_AUD_INTF_LANE_CFG_REG(i)			QAIF_AUD_INTF_REG_ADDR(0x0050, (i))
+#define QAIF_AUD_INTF_MI2S_CFG_REG(i)			QAIF_AUD_INTF_REG_ADDR(0x0054, (i))
+#define QAIF_AUD_INTF_CFG_REG(i)			QAIF_AUD_INTF_REG_ADDR(0x0058, (i))
+#define QAIF_AUD_INTF_CHAR_CTL_REG(i)			QAIF_AUD_INTF_REG_ADDR(0x005C, (i))
+#define QAIF_AUD_INTF_CHAR_CFG_REG(i)			QAIF_AUD_INTF_REG_ADDR(0x0060, (i))
+#define QAIF_AUD_INTF_CHAR_DATA_REG(i)			QAIF_AUD_INTF_REG_ADDR(0x0064, (i))
+#define QAIF_AUD_INTF_CHAR_DATA_EXT_REG(i)		QAIF_AUD_INTF_REG_ADDR(0x0068, (i))
+#define QAIF_AUD_INTF_CHAR_SYNC_REG(i)			QAIF_AUD_INTF_REG_ADDR(0x006C, (i))
+#define QAIF_AUD_INTF_INIT_DBG_STATUS_REG(i)		QAIF_AUD_INTF_REG_ADDR(0x0FF0, (i))
+#define QAIF_AUD_INTF_TX_DBG_STATUS_REG(i)		QAIF_AUD_INTF_REG_ADDR(0x0FF4, (i))
+#define QAIF_AUD_INTF_RX_DBG_STATUS_REG(i)		QAIF_AUD_INTF_REG_ADDR(0x0FF8, (i))
+
+/* RATE_DET block (per detector, stride 0x1000 starting at 0x1E000) */
+#define QAIF_RATE_DET_REG_ADDR(offset, det)		(0x1E000 + (offset) + (0x1000 * (det)))
+
+#define QAIF_RATE_DET_CONFIG_REG(det)			QAIF_RATE_DET_REG_ADDR(0x0000, (det))
+#define QAIF_RATE_DET_TARGET1_CONF_REG(det)		QAIF_RATE_DET_REG_ADDR(0x0004, (det))
+#define QAIF_RATE_DET_TARGET2_CONF_REG(det)		QAIF_RATE_DET_REG_ADDR(0x0008, (det))
+#define QAIF_RATE_DET_BIN_REG(det)			QAIF_RATE_DET_REG_ADDR(0x000C, (det))
+#define QAIF_RATE_DET_STC_DIFF_REG(det)			QAIF_RATE_DET_REG_ADDR(0x0010, (det))
+#define QAIF_RATE_DET_SEL_REG(det)			QAIF_RATE_DET_REG_ADDR(0x0014, (det))
+#define QAIF_RATE_DET_TIMEOUT_CFG_REG(det)		QAIF_RATE_DET_REG_ADDR(0x0018, (det))
+
+#define QAIF_WRDMA_MAP_QXM				(0x1000)
+#define QAIF_CDC_WRDMA_MAP_QXM				(0x1004)
+#define QAIF_RDDMA_MAP_QXM				(0x1010)
+#define QAIF_CDC_RDDMA_MAP_QXM				(0x1014)
+#define QAIF_RDDMA_QXM1_SHRAM_ST_ADDR(i)		(0x1100 + (0x4 * (i)))
+#define QAIF_CDC_RDDMA_QXM1_SHRAM_ST_ADDR(i)		(0x1140 + (0x4 * (i)))
+#define QAIF_RDDMA_QXM0_SHRAM_ST_ADDR(i)		(0x1200 + (0x4 * (i)))
+#define QAIF_CDC_RDDMA_QXM0_SHRAM_ST_ADDR(i)		(0x1240 + (0x4 * (i)))
+#define QAIF_RDDMA_QXM1_SHRAM_LEN(i)			(0x1300 + (0x4 * (i)))
+#define QAIF_CDC_RDDMA_QXM1_SHRAM_LEN(i)		(0x1340 + (0x4 * (i)))
+#define QAIF_RDDMA_QXM0_SHRAM_LEN(i)			(0x1400 + (0x4 * (i)))
+#define QAIF_CDC_RDDMA_QXM0_SHRAM_LEN(i)		(0x1440 + (0x4 * (i)))
+#define QAIF_WRDMA_QXM1_SHRAM_ST_ADDR(i)		(0x1500 + (0x4 * (i)))
+#define QAIF_CDC_WRDMA_QXM1_SHRAM_ST_ADDR(i)		(0x1540 + (0x4 * (i)))
+#define QAIF_WRDMA_QXM0_SHRAM_ST_ADDR(i)		(0x1600 + (0x4 * (i)))
+#define QAIF_CDC_WRDMA_QXM0_SHRAM_ST_ADDR(i)		(0x1640 + (0x4 * (i)))
+#define QAIF_WRDMA_QXM1_SHRAM_LEN(i)			(0x1700 + (0x4 * (i)))
+#define QAIF_CDC_WRDMA_QXM1_SHRAM_LEN(i)		(0x1740 + (0x4 * (i)))
+#define QAIF_WRDMA_QXM0_SHRAM_LEN(i)			(0x1800 + (0x4 * (i)))
+#define QAIF_CDC_WRDMA_QXM0_SHRAM_LEN(i)		(0x1840 + (0x4 * (i)))
+
+/* RDDMA */
+static inline u32 qaif_rddma_reg_addr(const struct qaif_variant *v,
+				      u32 offset, u32 i)
+{
+	return v->rddma_reg_base + offset + v->rddma_stride * i;
+}
+
+#define QAIF_RDDMA_CTL_REG(v, i)			qaif_rddma_reg_addr(v, 0x00, (i))
+#define QAIF_RDDMA_CFG_REG(v, i)			qaif_rddma_reg_addr(v, 0x04, (i))
+#define QAIF_RDDMA_BASE_ADDR_REG(v, i)			qaif_rddma_reg_addr(v, 0x08, (i))
+#define QAIF_RDDMA_BUFF_LEN_REG(v, i)			qaif_rddma_reg_addr(v, 0x10, (i))
+#define QAIF_RDDMA_CURR_ADDR_REG(v, i)			qaif_rddma_reg_addr(v, 0x14, (i))
+#define QAIF_RDDMA_PERIOD_LEN_REG(v, i)			qaif_rddma_reg_addr(v, 0x1C, (i))
+#define QAIF_RDDMA_PERIOD_CNT_REG(v, i)			qaif_rddma_reg_addr(v, 0x20, (i))
+#define QAIF_RDDMA_SHRAM_WORDCNT_REG(v, i)		qaif_rddma_reg_addr(v, 0x24, (i))
+#define QAIF_RDDMA_FRAME_STATUS_REG(v, i)		qaif_rddma_reg_addr(v, 0x28, (i))
+#define QAIF_RDDMA_FRAME_STATUS_EXTN_REG(v, i)		qaif_rddma_reg_addr(v, 0x2C, (i))
+#define QAIF_RDDMA_FRAME_STATUS_CLR_REG(v, i)		qaif_rddma_reg_addr(v, 0x30, (i))
+#define QAIF_RDDMA_SET_BUFF_CNT_REG(v, i)		qaif_rddma_reg_addr(v, 0x34, (i))
+#define QAIF_RDDMA_SET_PERIOD_CNT_REG(v, i)		qaif_rddma_reg_addr(v, 0x38, (i))
+#define QAIF_RDDMA_STC_LSB_REG(v, i)			qaif_rddma_reg_addr(v, 0x3C, (i))
+#define QAIF_RDDMA_STC_MSB_REG(v, i)			qaif_rddma_reg_addr(v, 0x40, (i))
+#define QAIF_RDDMA_PERIOD_DET_STAT_REG(v, i)		qaif_rddma_reg_addr(v, 0x44, (i))
+#define QAIF_RDDMA_PERIOD_DET_CLR_REG(v, i)		qaif_rddma_reg_addr(v, 0x48, (i))
+#define QAIF_RDDMA_FORMAT_ERR_REG(v, i)			qaif_rddma_reg_addr(v, 0x4C, (i))
+#define QAIF_RDDMA_AHB_BYPASS_REG(v, i)			qaif_rddma_reg_addr(v, 0x50, (i))
+#define QAIF_RDDMA_SHUTDOWN_STAT_REG(v, i)		qaif_rddma_reg_addr(v, 0x54, (i))
+#define QAIF_RDDMA_PADDING_CFG_REG(v, i)		qaif_rddma_reg_addr(v, 0x58, (i))
+#define QAIF_RDDMA_STATUS_REG(v, i)			qaif_rddma_reg_addr(v, 0x60, (i))
+#define QAIF_RDDMA_DBG_STATUS_REG(v, i)			qaif_rddma_reg_addr(v, 0xFF0, (i))
+
+static inline u32 qaif_codec_rddma_reg_addr(const struct qaif_variant *v,
+					    u32 offset, u32 i)
+{
+	return v->codec_rddma_reg_base + offset + v->codec_rddma_stride * i;
+}
+
+#define QAIF_CDC_RDDMA_CTL_REG(v, i)			qaif_codec_rddma_reg_addr(v, 0x00, (i))
+#define QAIF_CDC_RDDMA_CFG_REG(v, i)			qaif_codec_rddma_reg_addr(v, 0x04, (i))
+#define QAIF_CDC_RDDMA_BASE_ADDR_REG(v, i)		qaif_codec_rddma_reg_addr(v, 0x08, (i))
+#define QAIF_CDC_RDDMA_BUFF_LEN_REG(v, i)		qaif_codec_rddma_reg_addr(v, 0x10, (i))
+#define QAIF_CDC_RDDMA_CURR_ADDR_REG(v, i)		qaif_codec_rddma_reg_addr(v, 0x14, (i))
+#define QAIF_CDC_RDDMA_PERIOD_LEN_REG(v, i)		qaif_codec_rddma_reg_addr(v, 0x1C, (i))
+#define QAIF_CDC_RDDMA_PERIOD_CNT_REG(v, i)		qaif_codec_rddma_reg_addr(v, 0x20, (i))
+#define QAIF_CDC_RDDMA_SHRAM_WORDCNT_REG(v, i)		qaif_codec_rddma_reg_addr(v, 0x24, (i))
+#define QAIF_CDC_RDDMA_FRAME_STAT_REG(v, i)		qaif_codec_rddma_reg_addr(v, 0x28, (i))
+#define QAIF_CDC_RDDMA_FRAME_STAT_EXTN_REG(v, i)	qaif_codec_rddma_reg_addr(v, 0x2C, (i))
+#define QAIF_CDC_RDDMA_FRAME_STAT_CLR_REG(v, i)		qaif_codec_rddma_reg_addr(v, 0x30, (i))
+#define QAIF_CDC_RDDMA_SET_BUFF_CNT_REG(v, i)		qaif_codec_rddma_reg_addr(v, 0x34, (i))
+#define QAIF_CDC_RDDMA_SET_PERIOD_CNT_REG(v, i)		qaif_codec_rddma_reg_addr(v, 0x38, (i))
+#define QAIF_CDC_RDDMA_STC_LSB_REG(v, i)		qaif_codec_rddma_reg_addr(v, 0x3C, (i))
+#define QAIF_CDC_RDDMA_STC_MSB_REG(v, i)		qaif_codec_rddma_reg_addr(v, 0x40, (i))
+#define QAIF_CDC_RDDMA_PERIOD_DET_STAT_REG(v, i)	qaif_codec_rddma_reg_addr(v, 0x44, (i))
+#define QAIF_CDC_RDDMA_PERIOD_DET_CLR_REG(v, i)		qaif_codec_rddma_reg_addr(v, 0x48, (i))
+#define QAIF_CDC_RDDMA_FORMAT_ERR_REG(v, i)		qaif_codec_rddma_reg_addr(v, 0x4C, (i))
+#define QAIF_CDC_RDDMA_AHB_BYPASS_REG(v, i)		qaif_codec_rddma_reg_addr(v, 0x50, (i))
+#define QAIF_CDC_RDDMA_SHUTDOWN_STAT_REG(v, i)		qaif_codec_rddma_reg_addr(v, 0x54, (i))
+#define QAIF_CDC_RDDMA_PADDING_CFG_REG(v, i)		qaif_codec_rddma_reg_addr(v, 0x58, (i))
+#define QAIF_CDC_RDDMA_INTF_CFG_REG(v, i)		qaif_codec_rddma_reg_addr(v, 0x5C, (i))
+#define QAIF_CDC_RDDMA_STATUS_REG(v, i)			qaif_codec_rddma_reg_addr(v, 0x60, (i))
+#define QAIF_CDC_RDDMA_DBG_STATUS_REG(v, i)		qaif_codec_rddma_reg_addr(v, 0xFF0, (i))
+#define QAIF_CDC_RDDMA_INTF_DBG_STATUS_REG(v, i)	qaif_codec_rddma_reg_addr(v, 0xFF4, (i))
+
+/* WRDMA */
+static inline u32 qaif_wrdma_reg_addr(const struct qaif_variant *v,
+				      u32 offset, u32 i)
+{
+	return v->wrdma_reg_base + offset + v->wrdma_stride * i;
+}
+
+#define QAIF_WRDMA_CTL_REG(v, i)			qaif_wrdma_reg_addr(v, 0x00, (i))
+#define QAIF_WRDMA_CFG_REG(v, i)			qaif_wrdma_reg_addr(v, 0x04, (i))
+#define QAIF_WRDMA_BASE_ADDR_REG(v, i)			qaif_wrdma_reg_addr(v, 0x08, (i))
+#define QAIF_WRDMA_BUFF_LEN_REG(v, i)			qaif_wrdma_reg_addr(v, 0x10, (i))
+#define QAIF_WRDMA_CURR_ADDR_REG(v, i)			qaif_wrdma_reg_addr(v, 0x14, (i))
+#define QAIF_WRDMA_PERIOD_LEN_REG(v, i)			qaif_wrdma_reg_addr(v, 0x1C, (i))
+#define QAIF_WRDMA_PERIOD_CNT_REG(v, i)			qaif_wrdma_reg_addr(v, 0x20, (i))
+#define QAIF_WRDMA_SHRAM_WORDCNT_REG(v, i)		qaif_wrdma_reg_addr(v, 0x24, (i))
+#define QAIF_WRDMA_FRAME_STATUS_REG(v, i)		qaif_wrdma_reg_addr(v, 0x28, (i))
+#define QAIF_WRDMA_FRAME_STATUS_EXTN_REG(v, i)		qaif_wrdma_reg_addr(v, 0x2C, (i))
+#define QAIF_WRDMA_FRAME_STATUS_CLR_REG(v, i)		qaif_wrdma_reg_addr(v, 0x30, (i))
+#define QAIF_WRDMA_SET_BUFF_CNT_REG(v, i)		qaif_wrdma_reg_addr(v, 0x34, (i))
+#define QAIF_WRDMA_SET_PERIOD_CNT_REG(v, i)		qaif_wrdma_reg_addr(v, 0x38, (i))
+#define QAIF_WRDMA_STC_LSB_REG(v, i)			qaif_wrdma_reg_addr(v, 0x3C, (i))
+#define QAIF_WRDMA_STC_MSB_REG(v, i)			qaif_wrdma_reg_addr(v, 0x40, (i))
+#define QAIF_WRDMA_PERIOD_DET_STAT_REG(v, i)		qaif_wrdma_reg_addr(v, 0x44, (i))
+#define QAIF_WRDMA_PERIOD_DET_CLR_REG(v, i)		qaif_wrdma_reg_addr(v, 0x48, (i))
+#define QAIF_WRDMA_FORMAT_ERR_REG(v, i)			qaif_wrdma_reg_addr(v, 0x4C, (i))
+#define QAIF_WRDMA_AHB_BYPASS_REG(v, i)			qaif_wrdma_reg_addr(v, 0x50, (i))
+#define QAIF_WRDMA_SHUTDOWN_STAT_REG(v, i)		qaif_wrdma_reg_addr(v, 0x54, (i))
+#define QAIF_WRDMA_DBG_STATUS_REG(v, i)			qaif_wrdma_reg_addr(v, 0xFF0, (i))
+
+static inline u32 qaif_codec_wrdma_reg_addr(const struct qaif_variant *v,
+					    u32 offset, u32 i)
+{
+	return v->codec_wrdma_reg_base + offset + v->codec_wrdma_stride * i;
+}
+
+#define QAIF_CDC_WRDMA_CTL_REG(v, i)			qaif_codec_wrdma_reg_addr(v, 0x00, (i))
+#define QAIF_CDC_WRDMA_CFG_REG(v, i)			qaif_codec_wrdma_reg_addr(v, 0x04, (i))
+#define QAIF_CDC_WRDMA_BASE_ADDR_REG(v, i)		qaif_codec_wrdma_reg_addr(v, 0x08, (i))
+#define QAIF_CDC_WRDMA_BUFF_LEN_REG(v, i)		qaif_codec_wrdma_reg_addr(v, 0x10, (i))
+#define QAIF_CDC_WRDMA_CURR_ADDR_REG(v, i)		qaif_codec_wrdma_reg_addr(v, 0x14, (i))
+#define QAIF_CDC_WRDMA_PERIOD_LEN_REG(v, i)		qaif_codec_wrdma_reg_addr(v, 0x1C, (i))
+#define QAIF_CDC_WRDMA_PERIOD_CNT_REG(v, i)		qaif_codec_wrdma_reg_addr(v, 0x20, (i))
+#define QAIF_CDC_WRDMA_SHRAM_WORDCNT_REG(v, i)		qaif_codec_wrdma_reg_addr(v, 0x24, (i))
+#define QAIF_CDC_WRDMA_FRAME_STAT_REG(v, i)		qaif_codec_wrdma_reg_addr(v, 0x28, (i))
+#define QAIF_CDC_WRDMA_FRAME_STAT_EXTN_REG(v, i)	qaif_codec_wrdma_reg_addr(v, 0x2C, (i))
+#define QAIF_CDC_WRDMA_FRAME_STAT_CLR_REG(v, i)		qaif_codec_wrdma_reg_addr(v, 0x30, (i))
+#define QAIF_CDC_WRDMA_SET_BUFF_CNT_REG(v, i)		qaif_codec_wrdma_reg_addr(v, 0x34, (i))
+#define QAIF_CDC_WRDMA_SET_PERIOD_CNT_REG(v, i)		qaif_codec_wrdma_reg_addr(v, 0x38, (i))
+#define QAIF_CDC_WRDMA_STC_LSB_REG(v, i)		qaif_codec_wrdma_reg_addr(v, 0x3C, (i))
+#define QAIF_CDC_WRDMA_STC_MSB_REG(v, i)		qaif_codec_wrdma_reg_addr(v, 0x40, (i))
+#define QAIF_CDC_WRDMA_PERIOD_DET_STAT_REG(v, i)	qaif_codec_wrdma_reg_addr(v, 0x44, (i))
+#define QAIF_CDC_WRDMA_PERIOD_DET_CLR_REG(v, i)		qaif_codec_wrdma_reg_addr(v, 0x48, (i))
+#define QAIF_CDC_WRDMA_FORMAT_ERR_REG(v, i)		qaif_codec_wrdma_reg_addr(v, 0x4C, (i))
+#define QAIF_CDC_WRDMA_AHB_BYPASS_REG(v, i)		qaif_codec_wrdma_reg_addr(v, 0x50, (i))
+#define QAIF_CDC_WRDMA_SHUTDOWN_STAT_REG(v, i)		qaif_codec_wrdma_reg_addr(v, 0x54, (i))
+#define QAIF_CDC_WRDMA_INTF_CFG_REG(v, i)		qaif_codec_wrdma_reg_addr(v, 0x58, (i))
+#define QAIF_CDC_WRDMA_DBG_STATUS_REG(v, i)		qaif_codec_wrdma_reg_addr(v, 0xFF0, (i))
+#define QAIF_CDC_WRDMA_INTF_DBG_STATUS_REG(v, i)	qaif_codec_wrdma_reg_addr(v, 0xFF4, (i))
+
+static inline u32 qaif_rddma_irq_reg_addr(const struct qaif_variant *v,
+					  enum qaif_irq_type dma_type,
+					  u32 offset)
+{
+	if (dma_type == QAIF_AIF_IRQ)
+		return v->rddma_irq_reg_base + offset +
+		       v->rddma_irq_stride * v->ee;
+	return v->codec_rddma_irq_reg_base + offset +
+	       v->codec_rddma_irq_stride * v->ee;
+}
+
+/* RDDMA Period Interrupts */
+#define QAIF_EE_RDDMA_PERIOD_IRQ_EN_REG(v, i)		qaif_rddma_irq_reg_addr(v, i, 0x00)
+#define QAIF_EE_RDDMA_PERIOD_IRQ_STAT_REG(v, i)		qaif_rddma_irq_reg_addr(v, i, 0x08)
+#define QAIF_EE_RDDMA_PERIOD_IRQ_RAW_STAT_REG(v, i)	qaif_rddma_irq_reg_addr(v, i, 0x10)
+#define QAIF_EE_RDDMA_PERIOD_IRQ_CLR_REG(v, i)		qaif_rddma_irq_reg_addr(v, i, 0x18)
+#define QAIF_EE_RDDMA_PERIOD_IRQ_FORCE_REG(v, i)	qaif_rddma_irq_reg_addr(v, i, 0x20)
+/* RDDMA Underflow Interrupts */
+#define QAIF_EE_RDDMA_UF_IRQ_EN_REG(v, i)		qaif_rddma_irq_reg_addr(v, i, 0x28)
+#define QAIF_EE_RDDMA_UF_IRQ_STAT_REG(v, i)		qaif_rddma_irq_reg_addr(v, i, 0x30)
+#define QAIF_EE_RDDMA_UF_IRQ_RAW_STAT_REG(v, i)		qaif_rddma_irq_reg_addr(v, i, 0x38)
+#define QAIF_EE_RDDMA_UF_IRQ_CLR_REG(v, i)		qaif_rddma_irq_reg_addr(v, i, 0x40)
+#define QAIF_EE_RDDMA_UF_IRQ_FORCE_REG(v, i)		qaif_rddma_irq_reg_addr(v, i, 0x48)
+/* RDDMA Error Response Interrupts */
+#define QAIF_EE_RDDMA_ERR_RSP_IRQ_EN_REG(v, i)		qaif_rddma_irq_reg_addr(v, i, 0x50)
+#define QAIF_EE_RDDMA_ERR_RSP_IRQ_STAT_REG(v, i)	qaif_rddma_irq_reg_addr(v, i, 0x58)
+#define QAIF_EE_RDDMA_ERR_RSP_IRQ_RAW_STAT(v, i)	qaif_rddma_irq_reg_addr(v, i, 0x60)
+#define QAIF_EE_RDDMA_ERR_RSP_IRQ_CLR_REG(v, i)		qaif_rddma_irq_reg_addr(v, i, 0x68)
+#define QAIF_EE_RDDMA_ERR_RSP_IRQ_FORCE_REG(v, i)	qaif_rddma_irq_reg_addr(v, i, 0x70)
+
+static inline u32 qaif_wrdma_irq_reg_addr(const struct qaif_variant *v,
+					  enum qaif_irq_type dma_type,
+					  u32 offset)
+{
+	if (dma_type == QAIF_AIF_IRQ)
+		return v->wrdma_irq_reg_base + offset +
+		       v->wrdma_irq_stride * v->ee;
+	return v->codec_wrdma_irq_reg_base + offset +
+	       v->codec_wrdma_irq_stride * v->ee;
+}
+
+/* WRDMA Period Interrupts */
+#define QAIF_EE_WRDMA_PERIOD_IRQ_EN_REG(v, i)		qaif_wrdma_irq_reg_addr(v, i, 0x00)
+#define QAIF_EE_WRDMA_PERIOD_IRQ_STAT_REG(v, i)		qaif_wrdma_irq_reg_addr(v, i, 0x08)
+#define QAIF_EE_WRDMA_PERIOD_IRQ_RAW_STAT_REG(v, i)	qaif_wrdma_irq_reg_addr(v, i, 0x10)
+#define QAIF_EE_WRDMA_PERIOD_IRQ_CLR_REG(v, i)		qaif_wrdma_irq_reg_addr(v, i, 0x18)
+#define QAIF_EE_WRDMA_PERIOD_IRQ_FORCE_REG(v, i)	qaif_wrdma_irq_reg_addr(v, i, 0x20)
+/* WRDMA Overflow Interrupts */
+#define QAIF_EE_WRDMA_OF_IRQ_EN_REG(v, i)		qaif_wrdma_irq_reg_addr(v, i, 0x28)
+#define QAIF_EE_WRDMA_OF_IRQ_STAT_REG(v, i)		qaif_wrdma_irq_reg_addr(v, i, 0x30)
+#define QAIF_EE_WRDMA_OF_IRQ_RAW_STAT_REG(v, i)		qaif_wrdma_irq_reg_addr(v, i, 0x38)
+#define QAIF_EE_WRDMA_OF_IRQ_CLR_REG(v, i)		qaif_wrdma_irq_reg_addr(v, i, 0x40)
+#define QAIF_EE_WRDMA_OF_IRQ_FORCE_REG(v, i)		qaif_wrdma_irq_reg_addr(v, i, 0x48)
+/* WRDMA Error Response Interrupts */
+#define QAIF_EE_WRDMA_ERR_RSP_IRQ_EN_REG(v, i)		qaif_wrdma_irq_reg_addr(v, i, 0x50)
+#define QAIF_EE_WRDMA_ERR_RSP_IRQ_STAT_REG(v, i)	qaif_wrdma_irq_reg_addr(v, i, 0x58)
+#define QAIF_EE_WRDMA_ERR_RSP_IRQ_RAW_STAT(v, i)	qaif_wrdma_irq_reg_addr(v, i, 0x60)
+#define QAIF_EE_WRDMA_ERR_RSP_IRQ_CLR_REG(v, i)		qaif_wrdma_irq_reg_addr(v, i, 0x68)
+#define QAIF_EE_WRDMA_ERR_RSP_IRQ_FORCE_REG(v, i)	qaif_wrdma_irq_reg_addr(v, i, 0x70)
+
+static inline u32 qaif_dmacfg_reg(const struct qaif_variant *v,
+				  u32 i, int dir, unsigned int dai_id)
+{
+	if (qaif_is_cif_dma_port(dai_id))
+		return dir == SNDRV_PCM_STREAM_PLAYBACK ?
+			QAIF_CDC_RDDMA_CFG_REG(v, i) :
+			QAIF_CDC_WRDMA_CFG_REG(v, i);
+	return dir == SNDRV_PCM_STREAM_PLAYBACK ?
+		QAIF_RDDMA_CFG_REG(v, i) : QAIF_WRDMA_CFG_REG(v, i);
+}
+
+static inline u32 qaif_dmactl_reg(const struct qaif_variant *v,
+				  u32 i, int dir, unsigned int dai_id)
+{
+	if (qaif_is_cif_dma_port(dai_id))
+		return dir == SNDRV_PCM_STREAM_PLAYBACK ?
+			QAIF_CDC_RDDMA_CTL_REG(v, i) :
+			QAIF_CDC_WRDMA_CTL_REG(v, i);
+	return dir == SNDRV_PCM_STREAM_PLAYBACK ?
+		QAIF_RDDMA_CTL_REG(v, i) : QAIF_WRDMA_CTL_REG(v, i);
+}
+
+static inline u32 qaif_dmabuff_reg(const struct qaif_variant *v,
+				   u32 i, int dir, unsigned int dai_id)
+{
+	if (qaif_is_cif_dma_port(dai_id))
+		return dir == SNDRV_PCM_STREAM_PLAYBACK ?
+			QAIF_CDC_RDDMA_BUFF_LEN_REG(v, i) :
+			QAIF_CDC_WRDMA_BUFF_LEN_REG(v, i);
+	return dir == SNDRV_PCM_STREAM_PLAYBACK ?
+		QAIF_RDDMA_BUFF_LEN_REG(v, i) : QAIF_WRDMA_BUFF_LEN_REG(v, i);
+}
+
+static inline u32 qaif_dmacurr_reg(const struct qaif_variant *v,
+				   u32 i, int dir, unsigned int dai_id)
+{
+	if (qaif_is_cif_dma_port(dai_id))
+		return dir == SNDRV_PCM_STREAM_PLAYBACK ?
+			QAIF_CDC_RDDMA_CURR_ADDR_REG(v, i) :
+			QAIF_CDC_WRDMA_CURR_ADDR_REG(v, i);
+	return dir == SNDRV_PCM_STREAM_PLAYBACK ?
+		QAIF_RDDMA_CURR_ADDR_REG(v, i) : QAIF_WRDMA_CURR_ADDR_REG(v, i);
+}
+
+static inline u32 qaif_dmaper_cnt_reg(const struct qaif_variant *v,
+				      u32 i, int dir, unsigned int dai_id)
+{
+	if (qaif_is_cif_dma_port(dai_id))
+		return dir == SNDRV_PCM_STREAM_PLAYBACK ?
+			QAIF_CDC_RDDMA_PERIOD_CNT_REG(v, i) :
+			QAIF_CDC_WRDMA_PERIOD_CNT_REG(v, i);
+	return dir == SNDRV_PCM_STREAM_PLAYBACK ?
+		QAIF_RDDMA_PERIOD_CNT_REG(v, i) : QAIF_WRDMA_PERIOD_CNT_REG(v, i);
+}
+
+static inline u32 qaif_dmaper_len_reg(const struct qaif_variant *v,
+				      u32 i, int dir, unsigned int dai_id)
+{
+	if (qaif_is_cif_dma_port(dai_id))
+		return dir == SNDRV_PCM_STREAM_PLAYBACK ?
+			QAIF_CDC_RDDMA_PERIOD_LEN_REG(v, i) :
+			QAIF_CDC_WRDMA_PERIOD_LEN_REG(v, i);
+	return dir == SNDRV_PCM_STREAM_PLAYBACK ?
+		QAIF_RDDMA_PERIOD_LEN_REG(v, i) : QAIF_WRDMA_PERIOD_LEN_REG(v, i);
+}
+
+static inline u32 qaif_dmabase_reg(const struct qaif_variant *v,
+				   u32 i, int dir, unsigned int dai_id)
+{
+	if (qaif_is_cif_dma_port(dai_id))
+		return dir == SNDRV_PCM_STREAM_PLAYBACK ?
+			QAIF_CDC_RDDMA_BASE_ADDR_REG(v, i) :
+			QAIF_CDC_WRDMA_BASE_ADDR_REG(v, i);
+	return dir == SNDRV_PCM_STREAM_PLAYBACK ?
+		QAIF_RDDMA_BASE_ADDR_REG(v, i) : QAIF_WRDMA_BASE_ADDR_REG(v, i);
+}
+
+static inline u32 qaif_sid_map_reg(int dir, unsigned int dai_id)
+{
+	if (qaif_is_cif_dma_port(dai_id))
+		return dir == SNDRV_PCM_STREAM_PLAYBACK ?
+			QAIF_CDC_RDDMA_SID_MAP_REG :
+			QAIF_CDC_WRDMA_SID_MAP_REG;
+	return dir == SNDRV_PCM_STREAM_PLAYBACK ?
+		QAIF_RDDMA_SID_MAP_REG : QAIF_WRDMA_SID_MAP_REG;
+}
+
+#endif /* SND_SOC_QCOM_QAIF_REG_H */
-- 
2.34.1

