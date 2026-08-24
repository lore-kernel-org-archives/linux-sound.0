Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D7536A356;
	Mon, 24 Aug 2026 06:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787553408; cv=none; b=uOlRtb/ZUIGyoTIymPlMnVZPuOXAwCSV5Pu8/MlGKzoPong0FAmaW6FlzFSpmgXPt8LazXuww9G6RCdpS+xAwiuaZFCtCdFyEvMVmXUnI/TyaduVOKzhvqx7bZhb9LCahx0Re623vPQ8YMIrA7gK3j5KJ5rFAZ61FNmTjPVQcso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787553408; c=relaxed/simple;
	bh=DqOYjqULTSMV8p/LtpZzJVJBcQHN/P8NH+zWN6ObZKE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EOOqsTaJ+VR120/7wHIT9VkowcbeKtV+ZrGf7UY5yAqiaV0+3A4/vOuEU/s5iduFPtfSmOjDk5j6ULj/rcghJrwuH9vAuQi+nfQw1tCqkHbwSpwzM/jCKCFTc80lermeCG0xxz3qKiGS2r7t+0YcFAV1pw5yfT7xLM9+FYylxhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mWknn6FR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mWknn6FR"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RTR11577437;
	Mon, 24 Aug 2026 06:36:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ydTcfKTy4GN
	iW0vkPl8ZXuPLcyFyJWAP6Rjhgc6gkb8=; b=mWknn6FRRLYrUEIcUzyS2kCH0cn
	ErAsTXXedpao6oAZTCRV9QEVy+eXL45+jo9xJjzBamQqrBW0JtJhEMGvIUO7OO25
	Zxz+Ij067zyWmBeb7HgEk/bzVDEkbIP0YHD9XX3fbEIgcJVD8eiXvcP+i/QQdAAt
	8Q/2uVpWSy4VqAFj7EGktPXoZgotgXaZweI/bXj4qn+sQ6ed3DkeDlKRv/d+H5+G
	Pde5TK5a2NPhBjAgw7hZCESKqOWJXFtdPD+PK75elG6FqOWKCUiokmST++/EJAu9
	fWJAzyUYYoqcQucy5YIr7DdmatAdJHMi4C9xFnr8X2zSjgc7D5WAoKpvcjw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g74hcwhpf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Aug 2026 06:36:37 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 67O6aYas015441;
	Mon, 24 Aug 2026 06:36:34 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 4g74uj2h73-1;
	Mon, 24 Aug 2026 06:36:34 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67O6aUCG015364;
	Mon, 24 Aug 2026 06:36:34 GMT
Received: from hu-hgautam-hyd.qualcomm.com (hu-hgautam-hyd.qualcomm.com [10.147.247.91])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 67O6aUFC015360;
	Mon, 24 Aug 2026 06:36:34 +0000 (GMT)
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
Subject: [PATCH v3 2/9] ASoC: qcom: Add QAIF shared data structures and variant interface
Date: Mon, 24 Aug 2026 12:06:20 +0530
Message-Id: <20260824063627.3595610-3-harendra.gautam@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: M2T6BhAD3tKATtWhKq2_npJCb6TMJYic
X-Authority-Analysis: v=2.4 cv=U7iiy+ru c=1 sm=1 tr=0 ts=6a8be675 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=saP4gpNJyMUPrehjqOQA:9
X-Proofpoint-GUID: M2T6BhAD3tKATtWhKq2_npJCb6TMJYic
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA1NyBTYWx0ZWRfX8/erXc7O22Cc
 +KgRKCjBw8JSFQQuoG4vH8ZKdHLfq4TuoPg3WNxSBfiscGFwpAYI5CvoCLL26AHu0IUIgC9ydny
 36PdKqFhzvJyBlK/fawanZQs1zDoBM1Psj1hQvfX9Ae6/dmVnGqXyJuw2ByqcP+ZPLBMygyJFpE
 i65dtEsVtOUUQocjHQBY0haYDQRRGlLMeGxJJ0RLHRsz+369Hou0e3UhIawSVdycVjLtAMt4YKF
 TQusYYCgJIwBY5ypGCZodYAW+rjqYn+Ez+5JsGSy61Q7fF7hOfJOl3S/aVjBCv8RNRC4YNkCM7L
 K8fXbBGbbChuHmWo3r6EgYo2jmdzD9ne5Ctpx3kGwn1cEBfiKd9nTl+LxVte3UmMuDifPwa0852
 dyYZSkZHyFhhfFdAczbkF8yRbbTyjkdUAEAbHYkzJbFhbc+YSmc5T086gThlf4amYHC6JMgWPpI
 icycugXlZQTLKhEYLQg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA1NyBTYWx0ZWRfXxd/N6tmMxTWb
 5kwNiUQcNjy/RDZ/1VbAqrEZuEzBaDRYhH1+evi7m48HU3EhcxUXQk4zlcOu6v1WUveQrG3FwwQ
 WAmXRfhlJ5EwD606sRMJ8m+wWjX/Y94=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240057

QAIF exposes AIF DMA paths for external audio interfaces and CIF DMA paths
for the internal codec interface. The two drivers need a common place to
describe DMA channel allocation, regmap fields, interrupt dispatch, SHRAM
buffer tracking and per-stream runtime data.

Introduce the QAIF driver data, AIF and CIF register-field descriptions,
IRQ mapping helpers and SoC variant descriptor. The variant descriptor
describes the register layout, DMA channel counts, clock names, DAI table
and platform callbacks used by the QAIF driver code.

Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
---
 sound/soc/qcom/qaif.h | 302 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 302 insertions(+)
 create mode 100644 sound/soc/qcom/qaif.h

diff --git a/sound/soc/qcom/qaif.h b/sound/soc/qcom/qaif.h
new file mode 100644
index 000000000000..c8d170684d05
--- /dev/null
+++ b/sound/soc/qcom/qaif.h
@@ -0,0 +1,302 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef SND_SOC_QCOM_QAIF_H
+#define SND_SOC_QCOM_QAIF_H
+
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/interrupt.h>
+#include <linux/mutex.h>
+#include <linux/regmap.h>
+#include <linux/types.h>
+#include <sound/pcm.h>
+#include <dt-bindings/sound/qcom,qaif.h>
+
+struct snd_pcm_substream;
+struct snd_soc_dai_driver;
+struct snd_soc_dai_ops;
+struct platform_device;
+
+#define QAIF_CIF_DMA_INTF_ONE_CHANNEL		0x01
+#define QAIF_CIF_DMA_INTF_TWO_CHANNEL		0x03
+#define QAIF_CIF_DMA_INTF_FOUR_CHANNEL		0x0f
+#define QAIF_CIF_DMA_INTF_SIX_CHANNEL		0x3f
+#define QAIF_CIF_DMA_INTF_EIGHT_CHANNEL		0xff
+
+#define QAIF_AIF_SLOT_WIDTH(bits)		((bits) - 1)
+#define QAIF_AIF_SAMPLE_WIDTH(bits)		((bits) - 1)
+
+/* Watermark level 5 encoded as N-1: hardware field value = watermark - 1 */
+#define QAIF_DMACTL_WM_5			4
+
+#define QAIF_DMA_BYTES_TO_WORDS_SHIFT		3
+#define QAIF_DMA_CLOCK_FREQ			38400000
+
+#define QAIF_MAX_AIF_CFG_CNT			4
+#define QAIF_MAX_LANES				8
+
+#define QAIF_MAX_MI2S_PORTS			8
+#define QAIF_MI2S_SLOTS				2
+#define QAIF_MAX_AIF_DMA_IDX			8
+#define QAIF_MAX_CIF_DMA_IDX			8
+
+/* SID map register CSID field (WRDMA_SID/RDDMA_SID), bits [4:0] */
+#define QAIF_CSID_MASK				GENMASK(4, 0)
+
+static inline bool qaif_is_cif_dma_port(int dai_id)
+{
+	if (dai_id >= QAIF_CDC_DMA_RX0 && dai_id <= QAIF_CDC_DMA_VA_TX9)
+		return true;
+	return false;
+}
+
+static inline bool qaif_is_mi2s_port(int dai_id)
+{
+	return dai_id >= QAIF_MI2S_AIF0 && dai_id <= QAIF_MI2S_AIF12;
+}
+
+static inline bool qaif_is_tdm_port(int dai_id)
+{
+	return dai_id >= QAIF_TDM_AIF0 && dai_id <= QAIF_TDM_AIF12;
+}
+
+static inline bool qaif_is_aif_port(int dai_id)
+{
+	return qaif_is_mi2s_port(dai_id) || qaif_is_tdm_port(dai_id);
+}
+
+enum qxm_sel {
+	QAIF_QXM0 = 0,
+	QAIF_QXM1 = 1,
+};
+
+enum qaif_irq_type {
+	QAIF_AIF_IRQ = 0,
+	QAIF_CIF_IRQ = 1,
+	QAIF_IRQ_TYPE_MAX,
+};
+
+enum qaif_dma_type {
+	QAIF_AIF_DMA = 0,
+	QAIF_CIF_DMA = 1,
+};
+
+struct qaif_aif_config {
+	u32 sync_mode;
+	u32 sync_src;
+	bool invert_sync;
+	u32 sync_delay;
+	u32 slot_width;
+	u32 slot_en_rx_mask;
+	u32 slot_en_tx_mask;
+	bool loopback_en;
+	bool ctrl_data_oe;
+	u32 lane_en_mask;
+	u32 lane_dir_mask;
+	bool full_cycle_en;
+	u32 slot_num;
+};
+
+struct qaif_pcm_data {
+	/* Flat slot in aif_substream[]/aif_dma_heap[] (or cif_*) used to track
+	 * this stream. Direction-encoded: playback uses the raw DMA channel
+	 * number (0..num_rddma-1), capture adds wrdma_start so playback and
+	 * capture of the same DAI occupy distinct slots.
+	 * Set by alloc_stream_dma_idx(); bounded by QAIF_MAX_AIF/CIF_DMA_IDX.
+	 */
+	int stream_dma_idx;
+	/* Hardware channel number (0-based within its DMA bank) passed to
+	 * register address helpers (e.g. QAIF_RDDMA_CFG_REG(v, chan)).
+	 * Direction-agnostic: the register helpers select RDDMA or WRDMA bank
+	 * based on stream direction, so both directions of the same DAI share
+	 * the same value. Set by get_dma_idx().
+	 */
+	int dma_reg_idx;
+};
+
+/* Named 0-based DMA channel indices used as the dma_idx of a
+ * qaif_dmaidx_dai_map entry, so board tables reference channels by name.
+ */
+enum qaif_dma_idx {
+	QAIF_DMA_IDX0 = 0,
+	QAIF_DMA_IDX1,
+	QAIF_DMA_IDX2,
+	QAIF_DMA_IDX3,
+	QAIF_DMA_IDX4,
+	QAIF_DMA_IDX5,
+	QAIF_DMA_IDX6,
+	QAIF_DMA_IDX7,
+};
+
+/* Associates a DAI ID with its physical DMA channel index on a given
+ * board/variant. @dai_id is the DAI to match; @dma_idx (a qaif_dma_idx value)
+ * is the 0-based hardware channel that get_dma_idx() returns for it.
+ */
+struct qaif_dmaidx_dai_map {
+	unsigned int dai_id;
+	int dma_idx;
+};
+
+struct qaif_dma_mem_info {
+	dma_addr_t dma_addr;
+	size_t alloc_size;
+	void *vaddr;
+};
+
+struct qaif_drv_data {
+	struct clk *mi2s_bit_clk[QAIF_MAX_MI2S_PORTS];
+	struct clk_bulk_data *clks;
+	int num_clks;
+	struct clk *aud_dma_clk;
+	struct clk *aud_dma_mem_clk;
+	void __iomem *audio_qaif;
+	struct regmap *audio_qaif_map;
+	int audio_qaif_irq;
+	struct mutex stream_lock; /* serializes stream open/close */
+	bool qaif_hw_configured;
+	const struct qaif_variant *variant;
+	struct qaif_aif_config aif_intf_cfg[QAIF_MAX_AIF_CFG_CNT];
+	unsigned long aif_dma_idx_bit_map;
+	unsigned long cif_dma_idx_bit_map;
+	struct snd_pcm_substream *aif_substream[QAIF_MAX_AIF_DMA_IDX];
+	struct snd_pcm_substream *cif_substream[QAIF_MAX_CIF_DMA_IDX];
+	u32 smmu_csid_bits;		/* SMMU stream ID bits from DT iommus cell */
+	struct qaif_dma_mem_info *aif_dma_heap[QAIF_MAX_AIF_DMA_IDX];
+	struct qaif_dma_mem_info *cif_dma_heap[QAIF_MAX_CIF_DMA_IDX];
+};
+
+enum qaif_summary_irq_bitmask {
+	QAIF_SUMMARY_BITMASK_AIF_PERIOD_RDDMA		= BIT(0),
+	QAIF_SUMMARY_BITMASK_AIF_UNDERFLOW_RDDMA	= BIT(1),
+	QAIF_SUMMARY_BITMASK_AIF_ERR_RSP_RDDMA		= BIT(2),
+	QAIF_SUMMARY_BITMASK_AIF_PERIOD_WRDMA		= BIT(3),
+	QAIF_SUMMARY_BITMASK_AIF_OVERFLOW_WRDMA		= BIT(4),
+	QAIF_SUMMARY_BITMASK_AIF_ERR_RSP_WRDMA		= BIT(5),
+	QAIF_SUMMARY_BITMASK_CIF_PERIOD_RDDMA		= BIT(18),
+	QAIF_SUMMARY_BITMASK_CIF_UNDERFLOW_RDDMA	= BIT(19),
+	QAIF_SUMMARY_BITMASK_CIF_ERR_RSP_RDDMA		= BIT(20),
+	QAIF_SUMMARY_BITMASK_CIF_PERIOD_WRDMA		= BIT(24),
+	QAIF_SUMMARY_BITMASK_CIF_OVERFLOW_WRDMA		= BIT(25),
+	QAIF_SUMMARY_BITMASK_CIF_ERR_RSP_WRDMA		= BIT(26),
+};
+
+enum qaif_client_status_register_bitmask_info {
+	QAIF_BITMASK_AIF_RDDMA_WRDMA	= GENMASK(5, 0),
+	QAIF_BITMASK_CIF_RDDMA_WRDMA	= GENMASK(26, 18),
+};
+
+struct qaif_irq_map {
+	u32 client_id;
+	u32 mask;
+	/*
+	 * Called from the hard IRQ handler (asoc_platform_qaif_irq()) with
+	 * @status holding the summary interrupt status. Must not sleep.
+	 */
+	irqreturn_t (*client_irq_handler)(struct qaif_drv_data *drvdata, u32 status);
+};
+
+enum qaif_dma_dir {
+	QAIF_DMA_RDDMA = 0,
+	QAIF_DMA_WRDMA = 1,
+};
+
+enum qaif_irq {
+	QAIF_IRQ_PERIOD = 0,
+	QAIF_IRQ_OVERFLOW,
+	QAIF_IRQ_UNDERFLOW,
+	QAIF_IRQ_ERROR,
+};
+
+enum qaif_irq_op {
+	QAIF_IRQ_CLEAR = 0,
+	QAIF_IRQ_ENABLE,
+	QAIF_IRQ_DISABLE,
+};
+
+enum qaif_client_info {
+	QAIF_CLIENT_ID_AIF_DMA = 0,
+	QAIF_CLIENT_ID_CIF_DMA,
+};
+
+struct qaif_variant {
+	u32 ee;				/* Hardware EE index assigned to this driver instance */
+
+	u32 num_rddma;
+	u32 num_wrdma;
+	u32 wrdma_start;
+	u32 num_codec_rddma;
+	u32 num_codec_wrdma;
+	u32 codec_wrdma_start;
+	u32 num_intf;
+
+	u32 rddma_reg_base;
+	u32 rddma_stride;
+	u32 codec_rddma_reg_base;
+	u32 codec_rddma_stride;
+	u32 wrdma_reg_base;
+	u32 wrdma_stride;
+	u32 codec_wrdma_reg_base;
+	u32 codec_wrdma_stride;
+
+	u32 rddma_irq_reg_base;
+	u32 rddma_irq_stride;
+	u32 codec_rddma_irq_reg_base;
+	u32 codec_rddma_irq_stride;
+	u32 wrdma_irq_reg_base;
+	u32 wrdma_irq_stride;
+	u32 codec_wrdma_irq_reg_base;
+	u32 codec_wrdma_irq_stride;
+
+	/* QSB master port selector; only QAIF_QXM0 is supported today */
+	enum qxm_sel qxm_type;
+	/* All *_len values below are SHRAM sizes in 64-bit words */
+	u32 rd_len;
+	u32 rddma_shram_len;
+	/* SHRAM start offsets (in 64-bit words), indexed by enum qaif_dma_type */
+	u32 rddma_shram_start_addr[2];
+	u32 wr_len;
+	u32 wrdma_shram_len;
+	u32 wrdma_shram_start_addr[2];
+
+	const char * const *clk_name;
+	int num_clks;
+	struct snd_soc_dai_driver *dai_driver;
+	int num_dai;
+	const char * const *dai_bit_clk_names;
+	/*
+	 * Optional per-AIF configuration tables, indexed by AIF interface
+	 * index (0..num_intf-1). NULL if the variant does not use them.
+	 */
+	const bool *aif_full_cycle_en;
+	const bool *aif_ctrl_data_oe;
+	const bool *aif_loopback_en;
+
+	/* Returns a direction-encoded flat slot index for use in
+	 * aif_substream[]/cif_substream[] and the dma_idx_bit_map.
+	 * Playback returns the raw channel number; capture adds wrdma_start (or
+	 * codec_wrdma_start) so both directions of the same DAI get distinct
+	 * slots. Sets the corresponding bit atomically; returns -EBUSY if
+	 * already open, -EINVAL if @dai_id or the computed index is out of range.
+	 */
+	int (*alloc_stream_dma_idx)(struct qaif_drv_data *data, int direction,
+				    unsigned int dai_id);
+	/* Clears the bit set by alloc_stream_dma_idx. */
+	int (*free_stream_dma_idx)(struct qaif_drv_data *data, int chan,
+				   unsigned int dai_id);
+	/* Returns the hardware channel number (0-based within its DMA bank)
+	 * for @dai_id, direction-agnostic. Used as dma_reg_idx.
+	 */
+	int (*get_dma_idx)(unsigned int dai_id);
+};
+
+extern const struct snd_soc_dai_ops asoc_qcom_qaif_cif_dai_ops;
+extern const struct snd_soc_dai_ops asoc_qcom_qaif_aif_cpu_dai_ops;
+
+int asoc_qcom_qaif_cpu_platform_probe(struct platform_device *pdev);
+int asoc_qcom_qaif_platform_register(struct platform_device *pdev);
+extern const struct dev_pm_ops asoc_qcom_qaif_pm_ops;
+
+#endif /* SND_SOC_QCOM_QAIF_H */
-- 
2.34.1

