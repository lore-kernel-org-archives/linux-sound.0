Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339C54BD348
	for <linux-sound@vger.kernel.org>; Thu,  1 Oct 2026 09:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790847513; cv=none; b=oDjCjcqay62WzYrg8DihTpRCPIkbCv1zopX0jbysHJUpBAZ3KqDVc3RWF7GiD0On7fya8c+hi5neUrrvGzZd84q7Jpi+SdQy92m+VtWRtumSbA3B7UMIs3VIxwPv7GgiXG3XTg/lMUNHgMwVIJP3891SGmpnqb4BpMH8DiZ/pMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790847513; c=relaxed/simple;
	bh=t/In2PBTjIhY7f/B+q+KrPX2DEtGQH6x/iWTsJuuW+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RyP8kyjS7gxkhJnKi5wIz8Jph+qcnOfCQjzH+6c+L9wzklQQJjlyUwFE4phq9Ixr4OO0NgncXZKgcwa1hzQGFI0O7xNUBcqnz2f/f/a3JkQU9MPk/Zk7+Tl/qADEJMljMkD5F7uPfAx1Hsm4ChrQLKiEyPQZmKkK4bsJAzciaNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N/cw2CCU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DDI7ed8G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N/cw2CCU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DDI7ed8G"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xd512337306
	for <linux-sound@vger.kernel.org>; Thu, 1 Oct 2026 09:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=z1gy5tLVZAy
	1AGTzP/YU/Ct9SipMfQIsWe9hXeKMtgQ=; b=N/cw2CCU7qU2J0knfW9nQFScwWJ
	Ln/kXopQpF7JfGbXQ2cOl26SUaDzY4HevP2sY/JlhMLuETuxptnOxuBe/P8dWYYf
	oYoW7I9gvT49aGeUrQsoBSAegk342ULbNKCpRj3i0ZStj9+VYdlnN4P9M40UCWyw
	E+kWUiWvRdmkmONkwpVIXl/LCEdWZb7YYjP2nMo/2Hid2MHvZ7BCeDCvJGY2Lwg1
	WWTtn73VU2cj6i1lLTdyGoUBbNJBze/ssddxMDuoUwqa9Gc0X44hA9Gj36+KvHt/
	Sp3MEwy7mKehGd+FzW1MXseoCMT+nFtcxZ1zfLiuMnxc9Xs6i36tLxArMDg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h14n243tp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 01 Oct 2026 09:38:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a0b66ecd9so967270485a.2
        for <linux-sound@vger.kernel.org>; Thu, 01 Oct 2026 02:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790847508; x=1791452308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z1gy5tLVZAy1AGTzP/YU/Ct9SipMfQIsWe9hXeKMtgQ=;
        b=DDI7ed8Gqvtlo8bjSPi+Y/encIzFGhiUMYHj0CZ9A+/v5C7tILmafGHZypR1/e2kxQ
         YdLsoVXwBg2mQvTd2dYeAzUdGUnr3c0Kks0DbBmU85yJ554nyI/XpLmWhnaRYOscYLqI
         TDLkaNcDmfeMKMp7j6GZSFDGeXB5nldLkc/C86Woh5t7ynjulAwFutSmAu2qLsA5K8ME
         0Z/VM2+AikZlWvKYjkCADBBXfJMiA07WhbFsUd/1BHnbqi/lvI3yaoh+K5ydrUacg6Jh
         rO7aG7EvCLarlobHk8L/y+RDcs1m3CdXTHvi6E3EA5S+aEcjtkLv5ecEGSyheYn1W3mF
         xALg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790847508; x=1791452308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z1gy5tLVZAy1AGTzP/YU/Ct9SipMfQIsWe9hXeKMtgQ=;
        b=u0QOrOit/6IGy5gibkaYfuqV5bzGcaRGE8q9ubSNYbWMTAD7XrqEs2f3v/fdL58lpT
         TFEnemOvFgLczfsOwQuk1567dn/i0yBncA4QCiCEErJdT2C6KJMwHud/wCFzeDdZxZgC
         G0gEERD7j2z68URfdq0D7sdOVOmgRIsJa53ukhQApFBF1/v9O+FnDQ/xpT8DuHKXbT2D
         ootYuALr19B/KhaAPh2kgJxkrvkesN2cz+WeSILkt7ZBMbYTalaRwMK6cUrcXFVfq6x6
         5Z/XnTdcu5pnbDLgBzCfMbSzT8ExwvAM+5E622hJpRXm3zKYUNFWcYq/+LIvx33Itd01
         gRvA==
X-Forwarded-Encrypted: i=1; AKwUvBybrnLv28KaAuUvhb7HAo0cU60JuQCstNIICsWah5UQQnM6wDyM6bdmKY1h4wqA9bPUone0tO25c4Hubg==@vger.kernel.org
X-Gm-Message-State: AFuF++k/uHpnBR6x8R3a5xDXWzy+djzGGomlPqyiKhzNmKXxIRj4df5E
	r5hM/wWLKAfNimeEMMv4B+Zz14vu66xlm9mjlT+abvY4NlJNhf/YNxaDA6FnMLz3lEnQ8EtKg/Q
	SsFx9XVOieNO1UOovjQ/RJa9CjIHHaPx95gyuGJvaKlmo7/cTnB+YJWeGWtOIcyhbBw==
X-Gm-Gg: AYBFou0nJ+vXiE3rt+VhrdUXgi5Qvw5ER0kzatfv95jOOtCsharaYl2Hfc7yaMBe7zb
	4gzIugrw/6MlV64yvlY5Jrzo7seEkB6JJx6eLDkxgQWS6BWBwumNEsie90j6ItmE5ebrY8+t3+o
	ZySe2t7h/KI68nY3JnBhcmyLQ4q3eihqYZaWrCuZObHch+4k/JEnMJZHNw2R42tJuM/qhuXJ81B
	YsJHEq21HM4nQNhjgLOcyT89CeHr7LwNH4Dit+xD1aYf2YdlSdNl5LZX0unkyUi951B10XL8gRT
	S7XGuboyt2k6HAbNNg5R//oxLlhHjnHG5JaPdsrRAxCdZnoiUgOJj3C2XpT+lrSSThbyWKjlYcr
	I9vzKPoOsDTcS
X-Received: by 2002:a05:620a:470a:b0:93c:5f3c:f482 with SMTP id af79cd13be357-93cac15025emr726743585a.33.1790847507477;
        Thu, 01 Oct 2026 02:38:27 -0700 (PDT)
X-Received: by 2002:a05:620a:470a:b0:93c:5f3c:f482 with SMTP id af79cd13be357-93cac15025emr726739185a.33.1790847506919;
        Thu, 01 Oct 2026 02:38:26 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b0692b5d7sm5231750f8f.28.2026.10.01.02.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:38:26 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, vkoul@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        prasad.kumpatla@oss.qualcomm.com, jingyi.wang@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, quic_srivasam@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 2/3] soundwire: qcom: add multi-master support
Date: Thu,  1 Oct 2026 10:38:04 +0100
Message-ID: <20261001093806.634862-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261001093806.634862-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261001093806.634862-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Gr3XaU1C c=1 sm=1 tr=0 ts=6abe2a14 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=ohygZrl5ZXs3QqmOdF4A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzOCBTYWx0ZWRfX1dERd0Edbv+L
 11FZASrRZi/bwy2GeHvRDHE+oRXTd6b3IrIDNHQEUVjWgYS2KNyejUvvvK83nd62c5I4txuA2We
 bzNdEOqSzZzwm8I5Aut6TdnxzRRFvhY=
X-Proofpoint-GUID: caquw-bPwJkmOwktYsG4okbITsozclB8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzOCBTYWx0ZWRfX5TIiLs7bAgvE
 U8ShJ3GtUk9RK8/jRHRv+kSRgec7ZDEPPhhjhPC7gwKNqP02IlU7cN7aMcmY5+zxrESvRbHFkTc
 ybNczlIXxnwY0wAJTHUUYsqQp9hfTN8hsC7RZWxmN6fPjdbbSiZodESSQaSbYiVQ4XKIDWzD3xl
 qWqAR6vM0JSH+G7CbHN48dolgYm5Vq6f2zjgHFUrUgFw04LW+OA0uED08HnrzNHpyPvUDbT1QhQ
 GB8PQmS7y3zi/wtySksyJRgWYOzNcaawcc0IK8oCepvKTWWr3cRrH7eVsYTAFE3lD75QPCiE9HR
 ewxYeIbveKEVACd6UmpeAOXJ572UKBGTv5V6x5bgUNmcJ9L7aWkEbIylS23UdUXkLoX5/Fyiccj
 WCQbl4i4cH1YdsL5xZ7Tm6t1aO/l+m/kL5WhIyVUdG4w3fJFcDiN0jIivoVS4UHy1tDzcZFdcj9
 zElDWLII5OYuyih3a+g==
X-Proofpoint-ORIG-GUID: caquw-bPwJkmOwktYsG4okbITsozclB8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010038

v3.1.0+ Qualcomm SoundWire IPs can be paired to expose one logical
bus with more than two DATA lanes. One IP owns SWR_CLK and drives
the bus; the other contributes DATA lanes only.

Only the primary IP handles the SoundWire command protocol on
Column 0 (PING / READ / WRITE and all slave register access); the
dependent IP is data-only and never issues commands. From the
peripherals' perspective a single logical bus is presented.

Support this pairing on the driver side. A device link between the
two IPs enforces correct unbind ordering and keeps the peer resumed
while the primary is active.

Single-master deployments (no qcom,multi-master-mode in DT) are
unaffected.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/soundwire/qcom.c | 205 +++++++++++++++++++++++++++++++++++----
 1 file changed, 186 insertions(+), 19 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 35ffffd541bd..767147a6635d 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -10,6 +10,7 @@
 #include <linux/debugfs.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
+#include <linux/of_platform.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
@@ -111,6 +112,7 @@
 #define SWRM_DPn_PORT_HCTRL_BANK(offset,  n, m)	(offset + 0x100 * (n - 1) + 0x40 * m)
 #define SWRM_DPn_BLOCK_CTRL3_BANK(offset, n, m)	(offset + 0x100 * (n - 1) + 0x40 * m)
 #define SWRM_DPn_SAMPLECTRL2_BANK(offset, n, m)	(offset + 0x100 * (n - 1) + 0x40 * m)
+#define SWRM_DPn_SLOT_STRIDE			0x100
 
 #define SWR_V1_3_MSTR_MAX_REG_ADDR				0x1740
 #define SWR_V2_0_MSTR_MAX_REG_ADDR				0x50ac
@@ -192,6 +194,13 @@ struct qcom_swrm_ctrl {
 	const unsigned int *reg_layout;
 	void __iomem *mmio;
 	struct reset_control *audio_cgcr;
+	u8 num_lanes;
+	bool is_dependent;
+	struct qcom_swrm_ctrl *peer_ctrl;
+	u8 peer_first_lane;
+	u8 num_peer_lanes;
+	bool is_primary;
+	u32 peer_dpn_offset;
 #ifdef CONFIG_DEBUG_FS
 	struct dentry *debugfs;
 #endif
@@ -898,7 +907,9 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 	/* Enable Auto enumeration */
 	ctrl->reg_write(ctrl, SWRM_ENUMERATOR_CFG_ADDR, 1);
 
-	ctrl->intr_mask = SWRM_INTERRUPT_STATUS_RMSK;
+	/* dependent has no sdw_bus; keep IRQ dispatch masked */
+	if (!ctrl->is_dependent)
+		ctrl->intr_mask = SWRM_INTERRUPT_STATUS_RMSK;
 	/* Mask soundwire interrupts */
 	if (ctrl->version < SWRM_VERSION_2_0_0)
 		ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_MASK_ADDR],
@@ -941,8 +952,8 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 	ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CLEAR],
 			0xFFFFFFFF);
 
-	/* enable CPU IRQs */
-	if (ctrl->mmio) {
+	/* dependent has no sdw_bus; leave its CPU IRQs masked */
+	if (ctrl->mmio && !ctrl->is_dependent) {
 		ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CPU_EN],
 				SWRM_INTERRUPT_STATUS_RMSK);
 	}
@@ -1040,9 +1051,41 @@ static int qcom_swrm_pre_bank_switch(struct sdw_bus *bus)
 	u32p_replace_bits(&val, ctrl->cols_index, SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK);
 	u32p_replace_bits(&val, ctrl->rows_index, SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_BMSK);
 
+	if (ctrl->peer_ctrl)
+		ctrl->peer_ctrl->reg_write(ctrl->peer_ctrl, reg, val);
+
 	return ctrl->reg_write(ctrl, reg, val);
 }
 
+static struct qcom_swrm_ctrl *
+qcom_swrm_port_target(struct qcom_swrm_ctrl *ctrl, u8 port_num, u32 *reg)
+{
+	u8 lane = ctrl->pconfig[port_num].lane_control;
+
+	if (ctrl->peer_ctrl && lane >= ctrl->peer_first_lane &&
+	    lane < ctrl->peer_first_lane + ctrl->num_peer_lanes) {
+		*reg -= ctrl->peer_dpn_offset;
+		return ctrl->peer_ctrl;
+	}
+	return ctrl;
+}
+
+static int qcom_swrm_port_reg_write(struct qcom_swrm_ctrl *ctrl, u8 port_num,
+				    u32 reg, u32 val)
+{
+	struct qcom_swrm_ctrl *tgt = qcom_swrm_port_target(ctrl, port_num, &reg);
+
+	return tgt->reg_write(tgt, reg, val);
+}
+
+static int qcom_swrm_port_reg_read(struct qcom_swrm_ctrl *ctrl, u8 port_num,
+				   u32 reg, u32 *val)
+{
+	struct qcom_swrm_ctrl *tgt = qcom_swrm_port_target(ctrl, port_num, &reg);
+
+	return tgt->reg_read(tgt, reg, val);
+}
+
 static int qcom_swrm_port_params(struct sdw_bus *bus,
 				 struct sdw_port_params *p_params,
 				 unsigned int bank)
@@ -1050,8 +1093,9 @@ static int qcom_swrm_port_params(struct sdw_bus *bus,
 	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
 	u32 offset = ctrl->reg_layout[SWRM_OFFSET_DP_BLOCK_CTRL_1];
 
-	return ctrl->reg_write(ctrl, SWRM_DPn_BLOCK_CTRL_1(offset, p_params->num),
-				p_params->bps - 1);
+	return qcom_swrm_port_reg_write(ctrl, p_params->num,
+					SWRM_DPn_BLOCK_CTRL_1(offset, p_params->num),
+					p_params->bps - 1);
 }
 
 static int qcom_swrm_transport_params(struct sdw_bus *bus,
@@ -1072,7 +1116,7 @@ static int qcom_swrm_transport_params(struct sdw_bus *bus,
 	value |= pcfg->off2 << SWRM_DP_PORT_CTRL_OFFSET2_SHFT;
 	value |= pcfg->si & 0xff;
 
-	ret = ctrl->reg_write(ctrl, reg, value);
+	ret = qcom_swrm_port_reg_write(ctrl, params->port_num, reg, value);
 	if (ret)
 		goto err;
 
@@ -1081,7 +1125,7 @@ static int qcom_swrm_transport_params(struct sdw_bus *bus,
 		value = (pcfg->si >> 8) & 0xff;
 		reg = SWRM_DPn_SAMPLECTRL2_BANK(offset, params->port_num, bank);
 
-		ret = ctrl->reg_write(ctrl, reg, value);
+		ret = qcom_swrm_port_reg_write(ctrl, params->port_num, reg, value);
 		if (ret)
 			goto err;
 	}
@@ -1091,7 +1135,10 @@ static int qcom_swrm_transport_params(struct sdw_bus *bus,
 		reg = SWRM_DPn_PORT_CTRL_2_BANK(offset, params->port_num, bank);
 
 		value = pcfg->lane_control;
-		ret = ctrl->reg_write(ctrl, reg, value);
+		if (ctrl->peer_ctrl && value >= ctrl->peer_first_lane &&
+		    value < ctrl->peer_first_lane + ctrl->num_peer_lanes)
+			value -= ctrl->peer_first_lane;
+		ret = qcom_swrm_port_reg_write(ctrl, params->port_num, reg, value);
 		if (ret)
 			goto err;
 	}
@@ -1102,7 +1149,7 @@ static int qcom_swrm_transport_params(struct sdw_bus *bus,
 		reg = SWRM_DPn_BLOCK_CTRL2_BANK(offset, params->port_num, bank);
 
 		value = pcfg->blk_group_count;
-		ret = ctrl->reg_write(ctrl, reg, value);
+		ret = qcom_swrm_port_reg_write(ctrl, params->port_num, reg, value);
 		if (ret)
 			goto err;
 	}
@@ -1112,10 +1159,10 @@ static int qcom_swrm_transport_params(struct sdw_bus *bus,
 
 	if (pcfg->hstart != SWR_INVALID_PARAM && pcfg->hstop != SWR_INVALID_PARAM) {
 		value = (pcfg->hstop << 4) | pcfg->hstart;
-		ret = ctrl->reg_write(ctrl, reg, value);
+		ret = qcom_swrm_port_reg_write(ctrl, params->port_num, reg, value);
 	} else {
 		value = (SWR_HSTOP_MAX_VAL << 4) | SWR_HSTART_MIN_VAL;
-		ret = ctrl->reg_write(ctrl, reg, value);
+		ret = qcom_swrm_port_reg_write(ctrl, params->port_num, reg, value);
 	}
 
 	if (ret)
@@ -1124,7 +1171,8 @@ static int qcom_swrm_transport_params(struct sdw_bus *bus,
 	if (pcfg->bp_mode != SWR_INVALID_PARAM) {
 		offset = ctrl->reg_layout[SWRM_OFFSET_DP_BLOCK_CTRL3_BANK];
 		reg = SWRM_DPn_BLOCK_CTRL3_BANK(offset, params->port_num, bank);
-		ret = ctrl->reg_write(ctrl, reg, pcfg->bp_mode);
+		ret = qcom_swrm_port_reg_write(ctrl, params->port_num, reg,
+					       pcfg->bp_mode);
 	}
 
 err:
@@ -1142,14 +1190,14 @@ static int qcom_swrm_port_enable(struct sdw_bus *bus,
 
 	reg = SWRM_DPn_PORT_CTRL_BANK(offset, enable_ch->port_num, bank);
 
-	ctrl->reg_read(ctrl, reg, &val);
+	qcom_swrm_port_reg_read(ctrl, enable_ch->port_num, reg, &val);
 
 	if (enable_ch->enable)
 		val |= (enable_ch->ch_mask << SWRM_DP_PORT_CTRL_EN_CHAN_SHFT);
 	else
 		val &= ~(0xff << SWRM_DP_PORT_CTRL_EN_CHAN_SHFT);
 
-	return ctrl->reg_write(ctrl, reg, val);
+	return qcom_swrm_port_reg_write(ctrl, enable_ch->port_num, reg, val);
 }
 
 static const struct sdw_master_port_ops qcom_swrm_port_ops = {
@@ -1562,6 +1610,73 @@ static int swrm_reg_show(struct seq_file *s_file, void *data)
 DEFINE_SHOW_ATTRIBUTE(swrm_reg);
 #endif
 
+static int qcom_swrm_multi_master_setup(struct qcom_swrm_ctrl *ctrl)
+{
+	struct of_phandle_args args;
+	struct qcom_swrm_ctrl *peer;
+	struct platform_device *pdev;
+	u32 offset;
+	int ret;
+
+	ret = of_parse_phandle_with_fixed_args(ctrl->dev->of_node,
+					       "qcom,multi-master-peer",
+					       1, 0, &args);
+	if (ret)
+		return -EINVAL;
+
+	pdev = of_find_device_by_node(args.np);
+	of_node_put(args.np);
+	if (!pdev)
+		return -EPROBE_DEFER;
+
+	if (!pdev->dev.driver) {
+		ret = -EPROBE_DEFER;
+		goto out;
+	}
+
+	if (pdev->dev.driver != ctrl->dev->driver) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	peer = platform_get_drvdata(pdev);
+	if (!peer || !peer->is_dependent) {
+		ret = -EPROBE_DEFER;
+		goto out;
+	}
+
+	if (!ctrl->num_lanes || !peer->num_lanes ||
+	    ctrl->num_lanes + peer->num_lanes > SDW_MAX_LANES) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	offset = args.args[0];
+	if (offset < ctrl->num_lanes) {
+		dev_err(ctrl->dev, "qcom,multi-master-peer: offset %u < num-lanes %u\n",
+			offset, ctrl->num_lanes);
+		ret = -EINVAL;
+		goto out;
+	}
+
+	if (!device_link_add(ctrl->dev, &pdev->dev,
+			     DL_FLAG_AUTOREMOVE_CONSUMER | DL_FLAG_PM_RUNTIME)) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	ctrl->peer_ctrl = peer;
+	peer->peer_ctrl = ctrl;
+	ctrl->peer_first_lane = ctrl->num_lanes;
+	ctrl->num_peer_lanes = peer->num_lanes;
+	ctrl->peer_dpn_offset = offset * SWRM_DPn_SLOT_STRIDE;
+
+	ret = 0;
+out:
+	put_device(&pdev->dev);
+	return ret;
+}
+
 static int qcom_swrm_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1576,6 +1691,9 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	if (!ctrl)
 		return -ENOMEM;
 
+	if (!of_property_read_u32(dev->of_node, "num-lanes", &val))
+		ctrl->num_lanes = val;
+
 	memset(ctrl->page1_cache, 0xff, sizeof(ctrl->page1_cache));
 	memset(ctrl->page2_cache, 0xff, sizeof(ctrl->page2_cache));
 
@@ -1636,9 +1754,19 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	ctrl->bus.compute_params = &qcom_swrm_compute_params;
 	ctrl->bus.clk_stop_timeout = 300;
 
-	ret = qcom_swrm_get_port_config(ctrl);
-	if (ret)
-		goto err_clk;
+	if (of_property_match_string(dev->of_node, "qcom,multi-master-mode",
+				     "dependent") < 0) {
+		ret = qcom_swrm_get_port_config(ctrl);
+		if (ret)
+			goto err_clk;
+	}
+
+	if (of_property_match_string(dev->of_node, "qcom,multi-master-mode", "primary") >= 0) {
+		ret = qcom_swrm_multi_master_setup(ctrl);
+		if (ret)
+			goto err_clk;
+		ctrl->is_primary = true;
+	}
 
 	params = &ctrl->bus.params;
 	params->max_dr_freq = DEFAULT_CLK_FREQ;
@@ -1678,7 +1806,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 						"swr_wake_irq", ctrl);
 		if (ret) {
 			dev_err(dev, "Failed to request soundwire wake irq\n");
-			goto err_init;
+			goto err_clk;
 		}
 	}
 
@@ -1689,6 +1817,16 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 		ctrl->bus.controller_id = val;
 	}
 
+	if (of_property_match_string(dev->of_node, "qcom,multi-master-mode", "dependent") >= 0) {
+		ctrl->is_dependent = true;
+		dev_dbg(dev,
+			"Qualcomm SoundWire multi-master dependent v%x.%x.%x registered (%u lanes)\n",
+			(ctrl->version >> 24) & 0xff,
+			(ctrl->version >> 16) & 0xff,
+			ctrl->version & 0xffff, ctrl->num_lanes);
+		return 0;
+	}
+
 	ret = sdw_bus_master_add(&ctrl->bus, dev, dev->fwnode);
 	if (ret) {
 		dev_err(dev, "Failed to register Soundwire controller (%d)\n",
@@ -1697,6 +1835,10 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	}
 
 	qcom_swrm_init(ctrl);
+
+	if (ctrl->is_primary && ctrl->peer_ctrl)
+		qcom_swrm_init(ctrl->peer_ctrl);
+
 	wait_for_completion_timeout(&ctrl->enumeration,
 				    msecs_to_jiffies(TIMEOUT_MS));
 	ret = qcom_swrm_register_dais(ctrl);
@@ -1724,6 +1866,17 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 err_master_add:
 	sdw_bus_master_delete(&ctrl->bus);
 err_clk:
+	/* tear down cross-link + mask peer IRQs before devres frees us */
+	if (ctrl->is_primary && ctrl->peer_ctrl) {
+		struct qcom_swrm_ctrl *peer = ctrl->peer_ctrl;
+
+		peer->reg_write(peer,
+				peer->reg_layout[SWRM_REG_INTERRUPT_CPU_EN], 0);
+		/* disable peer SWRM; releases shared SWR_CLK */
+		peer->reg_write(peer, SWRM_COMP_CFG_ADDR, 0);
+		peer->peer_ctrl = NULL;
+		ctrl->peer_ctrl = NULL;
+	}
 	clk_disable_unprepare(ctrl->hclk);
 err_init:
 	return ret;
@@ -1733,7 +1886,21 @@ static void qcom_swrm_remove(struct platform_device *pdev)
 {
 	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(&pdev->dev);
 
-	sdw_bus_master_delete(&ctrl->bus);
+	/* delete bus before dropping peer_ctrl; in-flight ops deref it */
+	if (!ctrl->is_dependent)
+		sdw_bus_master_delete(&ctrl->bus);
+
+	if (ctrl->is_primary && ctrl->peer_ctrl) {
+		struct qcom_swrm_ctrl *peer = ctrl->peer_ctrl;
+
+		peer->reg_write(peer,
+				peer->reg_layout[SWRM_REG_INTERRUPT_CPU_EN], 0);
+		/* disable peer SWRM; releases shared SWR_CLK */
+		peer->reg_write(peer, SWRM_COMP_CFG_ADDR, 0);
+		peer->peer_ctrl = NULL;
+		ctrl->peer_ctrl = NULL;
+	}
+
 	clk_disable_unprepare(ctrl->hclk);
 }
 
-- 
2.53.0

