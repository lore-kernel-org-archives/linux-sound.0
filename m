Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C20B39902B
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 08:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789114899; cv=none; b=mXOd3ZXfOI+rPnIK3tQK7dkjyrzQL2CIOZvWISodhcRZ2Ed7F3xA4Na20i3LEjopLcG1D6PHU5NDOlFAUW0KLKWwZSVNv9qelC7tumXMwvr95cnZb04tXq+dYTR3CIHO/QCTM9zN+fGXEA3AaQM0Pnpdd5ZOL+XHN5EyZxUs+qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789114899; c=relaxed/simple;
	bh=S0rWZDARH6A1f4Yo6/zewaAb9gLUICVR2PxF4pgM+Ww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t8HKhrvYuFjx32jDV8oC3t/i5LVZbWB5/iDDPF7ht9AiDRW51iYTnSsTInZR2QkIv1sHSL8i1lR4q2Oslo02Kb1IrhuRd9+JJKMABtzzfx88Jz7TAbobre0KtczKWiFupzwda95vt63pL6AcCaQ37Ni+oyMYkz7uY/Gnw/9Hn6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P3IiZRKA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OeCIjQc2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P3IiZRKA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OeCIjQc2"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7klxK3845333
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 08:21:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YEnFPv3tEtq
	VcjX1osqRVFpmPtecUfxnyLtGwHnmdzQ=; b=P3IiZRKAUJQYIq1wX7rdgMbippD
	bCKhTR9U1id+U4YiTWpF1M/x/wuk79pnByaMhnmRBCX2ySNNrkMJVYrtP+s3f6P6
	AVDAa8aOwlSLtxlK3PkRFLC2AR0ugK3p6zXijOi098/G58g1R6ghz3vXS99cMRpD
	Vsu4Y6gbm+dQquI+s24ayu8WuJVl32tyXF8AexT0tl5BGZtPvVv5/nENzcMZmUbh
	jwIHkO8BobydW8QDlYaIBnZfWzJwWph30BosltSTuky7xm3TC6CRldyuW3V3Yvm4
	BbMZuUXjAT3Nzljos9P/rRqJYF7ievOxrsWXy7+7COPl35jsgNF36Z3CMHQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm5q41w3c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 08:21:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939f1847fb9so33855285a.3
        for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 01:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789114895; x=1789719695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YEnFPv3tEtqVcjX1osqRVFpmPtecUfxnyLtGwHnmdzQ=;
        b=OeCIjQc20TGIvEN1MvUay3iNyaiYcfdcpitJpl5HNz2aHcLpB3HPeLE7imnYBXXNNf
         sAkeXiIAGnbcmujFBexdDy/D6cypkgRnqHKC9RHT/1iQU046xPPwkdn/hecOvjYQ4a76
         S+ZNcXMbH5/Z8ZBKYdToH4x8i22HSS1WHhfSRz8snwOl+m51KLyGDDHKBLMVwitUyf9r
         eJTh+EJB7oVfmPfVRHLjVeadngSswCQ+tP3xL8a1ChqTZofJMAlM+01+814kxQpWjU/t
         y4UKgwsFJdmNH3EDSvungFxpWfMcD7YJp2dW78VY3GfIfbKlQnJUyLFgXSy9OXE+1EEC
         WojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789114895; x=1789719695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YEnFPv3tEtqVcjX1osqRVFpmPtecUfxnyLtGwHnmdzQ=;
        b=oMfiEZxoEVCGBJQR6LesbtXoc4sdWQ6GKqiUiWN3qSLkXmZp4jAZAd8W1WMQQwW0Rv
         imNDOYnKBte/bdNu7Cje2qKffFCj+aI+M66UI8GbQDY73kFfPcpk+bDKZBvB1zEQYhKl
         gNMZGNL4jxDbDjuV7C+dO1CpQY86XjAG/wFMenWw3VGRdKwNDOzP9VmU5SJ1ynoDVTMp
         RfW8m/0P4EjTel/f5CfhaBcMGfdqfR0waXNqVaTWJr7RUeRdJzQuESrabXapbewFjA6c
         qR6pjUw3dp2ya8M+PT3Fe1RaDzCy2tyEa64cjliuKXARt2WNN+sqJixcjPzQu/TKaB/u
         J70w==
X-Forwarded-Encrypted: i=1; AKwUvBwROkqAe6EkTsDWARvl+caQoRNqWSy0mevps0YbhZ9KxvVIhzGXyJJaWNLVEsI3wCQDcmN8u81ewmb7Rw==@vger.kernel.org
X-Gm-Message-State: AFuF++lkp4hoNEPkGOe3aG3qbN/TIzJSV5p3lMvfAyLcXpSHwGWiOx4b
	SComAtxGOMiRoDoQnJHDirDSirdv6ut0Iyb0/DUAKZhZrqoYCB1gwYiGTZHjZjIWFmJstOF5asR
	mfzIwRitL7k0QQq1en96MM726kgSpFgW9vbGNHe/rErISIYXpgLBYPcB0lpgGn2mLtw==
X-Gm-Gg: AYBFou1eMGxQkL5keyqghgTwYTsY9LS3JgZy2PVUXSL7TLWOpcTnVjajXdWn4E0wuPt
	uy5cG3+bpqeHrAFn/gNdB0KOg4dKbeHAngZ9ms6gdT8N2dR4s/dg4WwdL/8CaPFhPscG0+uVOyq
	HzOvIsREBuwqTsKwF2wf4/TRPSQ/+jxEv37OnIYp1Un3wVsqAbBEMv6EbqUclYqeA1JK6idKM9H
	LwibNWokXThnj6dvZMA/l4T+En0svOEv/Yc1P5PZzI/Y9F49Ecd/iiHge7jc0DWF2N+wES++vH+
	oVPQ6glHwHIjo9boNdTFpj381MyhLGC49qN0E1V0q5tI4r/pnPurMaW7ceLmQLNJswJB6lWgcNS
	IAet5yXAAiy6IfQ==
X-Received: by 2002:a05:620a:462b:b0:92e:7533:ef63 with SMTP id af79cd13be357-939ea13c7b0mr376866485a.13.1789114894920;
        Fri, 11 Sep 2026 01:21:34 -0700 (PDT)
X-Received: by 2002:a05:620a:462b:b0:92e:7533:ef63 with SMTP id af79cd13be357-939ea13c7b0mr376862785a.13.1789114894435;
        Fri, 11 Sep 2026 01:21:34 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34e608sm4488880f8f.23.2026.09.11.01.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 01:21:33 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, vkoul@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        prasad.kumpatla@oss.qualcomm.com, jingyi.wang@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, quic_srivasam@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 2/3] soundwire: qcom: add multi-master support
Date: Fri, 11 Sep 2026 09:21:10 +0100
Message-ID: <0097b59e2b96d692b9fb542e207ee43f9dd44a7f.1789114385.git.srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1789114385.git.srinivas.kandagatla@oss.qualcomm.com>
References: <cover.1789114385.git.srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: vUYcViyVV6zeFtUxTMBZWAcI0qNCCbOQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDExNiBTYWx0ZWRfX51QNDQ3ByRbk
 TRkL5K1ynZyzRnw6cDyilza+MREjKWb610bLycFkawj+XrishSNBNYuAP2AGWDWZgOTMky+tPFO
 4gt03ct7rUT7D5/Yh5UimhsZ2N978l0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDExNiBTYWx0ZWRfXzlw7Rx6DYiB8
 hLlY8/Ar3z0qLbC+KF/EHTeONDnmhvilQweKVVMC6V/aUZOT9h1GcCrbE5s5TzBudipx53SMEp4
 bTLHA6gMaupQYF1u0fHFlMHjNeLMkcNPdFZErHdZfpLXZU6SRJvkqWX9vwdVC9X6BWStyThbrFM
 5Sn3D/i09eUdCuxCtAw5n9U0nQXExSTiy8D8hbh85XAdbgns5S9+BjEYjavpzwRAyqZWDDmEJ4J
 SlIw9jA3tCqBthmCy5ksJEN+52TxcKI/rSgzNZGB2oZrW0gN1eVyI3NrQXoCz3vmqGwXI5pCsym
 JYJial0blMLDU2YXd4aADCSUoGKRmT8X3oCmutjD2AEFa75O0rMG3Dhbtr1qZwcWMDO7noUeY9r
 8kKX1vAfey4cNcf0ex6S9s37oOV9HKyBi34UYvftHJwQgMRxYOP6YoQJchPU5+n5Q7GvVwUamdy
 7fFug1tfWm8kho8aLag==
X-Proofpoint-ORIG-GUID: vUYcViyVV6zeFtUxTMBZWAcI0qNCCbOQ
X-Authority-Analysis: v=2.4 cv=Wsa+otfv c=1 sm=1 tr=0 ts=6aa3ba0f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=YIMJjSul5AlPl1THYWsA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110116

v3.1.0+ Qualcomm SoundWire IPs can be paired to expose one logical
bus with more than two DATA lanes. One IP owns SWR_CLK and drives
the bus; the other contributes DATA lanes only.

Support this pairing on the driver side. A device link between the
two IPs enforces correct unbind ordering and keeps the peer resumed
while the primary is active.

Single-master deployments (no qcom,multi-master-mode in DT) are
unaffected.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/soundwire/qcom.c | 171 +++++++++++++++++++++++++++++++++++----
 1 file changed, 156 insertions(+), 15 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 35ffffd541bd..a5f39868161a 100644
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
@@ -1040,9 +1049,41 @@ static int qcom_swrm_pre_bank_switch(struct sdw_bus *bus)
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
@@ -1050,8 +1091,9 @@ static int qcom_swrm_port_params(struct sdw_bus *bus,
 	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
 	u32 offset = ctrl->reg_layout[SWRM_OFFSET_DP_BLOCK_CTRL_1];
 
-	return ctrl->reg_write(ctrl, SWRM_DPn_BLOCK_CTRL_1(offset, p_params->num),
-				p_params->bps - 1);
+	return qcom_swrm_port_reg_write(ctrl, p_params->num,
+					SWRM_DPn_BLOCK_CTRL_1(offset, p_params->num),
+					p_params->bps - 1);
 }
 
 static int qcom_swrm_transport_params(struct sdw_bus *bus,
@@ -1072,7 +1114,7 @@ static int qcom_swrm_transport_params(struct sdw_bus *bus,
 	value |= pcfg->off2 << SWRM_DP_PORT_CTRL_OFFSET2_SHFT;
 	value |= pcfg->si & 0xff;
 
-	ret = ctrl->reg_write(ctrl, reg, value);
+	ret = qcom_swrm_port_reg_write(ctrl, params->port_num, reg, value);
 	if (ret)
 		goto err;
 
@@ -1081,7 +1123,7 @@ static int qcom_swrm_transport_params(struct sdw_bus *bus,
 		value = (pcfg->si >> 8) & 0xff;
 		reg = SWRM_DPn_SAMPLECTRL2_BANK(offset, params->port_num, bank);
 
-		ret = ctrl->reg_write(ctrl, reg, value);
+		ret = qcom_swrm_port_reg_write(ctrl, params->port_num, reg, value);
 		if (ret)
 			goto err;
 	}
@@ -1091,7 +1133,10 @@ static int qcom_swrm_transport_params(struct sdw_bus *bus,
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
@@ -1102,7 +1147,7 @@ static int qcom_swrm_transport_params(struct sdw_bus *bus,
 		reg = SWRM_DPn_BLOCK_CTRL2_BANK(offset, params->port_num, bank);
 
 		value = pcfg->blk_group_count;
-		ret = ctrl->reg_write(ctrl, reg, value);
+		ret = qcom_swrm_port_reg_write(ctrl, params->port_num, reg, value);
 		if (ret)
 			goto err;
 	}
@@ -1112,10 +1157,10 @@ static int qcom_swrm_transport_params(struct sdw_bus *bus,
 
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
@@ -1124,7 +1169,8 @@ static int qcom_swrm_transport_params(struct sdw_bus *bus,
 	if (pcfg->bp_mode != SWR_INVALID_PARAM) {
 		offset = ctrl->reg_layout[SWRM_OFFSET_DP_BLOCK_CTRL3_BANK];
 		reg = SWRM_DPn_BLOCK_CTRL3_BANK(offset, params->port_num, bank);
-		ret = ctrl->reg_write(ctrl, reg, pcfg->bp_mode);
+		ret = qcom_swrm_port_reg_write(ctrl, params->port_num, reg,
+					       pcfg->bp_mode);
 	}
 
 err:
@@ -1142,14 +1188,14 @@ static int qcom_swrm_port_enable(struct sdw_bus *bus,
 
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
@@ -1562,6 +1608,68 @@ static int swrm_reg_show(struct seq_file *s_file, void *data)
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
@@ -1576,6 +1684,9 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	if (!ctrl)
 		return -ENOMEM;
 
+	if (!of_property_read_u32(dev->of_node, "num-lanes", &val))
+		ctrl->num_lanes = val;
+
 	memset(ctrl->page1_cache, 0xff, sizeof(ctrl->page1_cache));
 	memset(ctrl->page2_cache, 0xff, sizeof(ctrl->page2_cache));
 
@@ -1636,9 +1747,19 @@ static int qcom_swrm_probe(struct platform_device *pdev)
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
@@ -1689,6 +1810,16 @@ static int qcom_swrm_probe(struct platform_device *pdev)
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
@@ -1696,7 +1827,11 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 		goto err_clk;
 	}
 
+	if (ctrl->is_primary && ctrl->peer_ctrl)
+		qcom_swrm_init(ctrl->peer_ctrl);
+
 	qcom_swrm_init(ctrl);
+
 	wait_for_completion_timeout(&ctrl->enumeration,
 				    msecs_to_jiffies(TIMEOUT_MS));
 	ret = qcom_swrm_register_dais(ctrl);
@@ -1733,7 +1868,13 @@ static void qcom_swrm_remove(struct platform_device *pdev)
 {
 	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(&pdev->dev);
 
-	sdw_bus_master_delete(&ctrl->bus);
+	if (ctrl->is_primary && ctrl->peer_ctrl) {
+		ctrl->peer_ctrl->peer_ctrl = NULL;
+		ctrl->peer_ctrl = NULL;
+	}
+
+	if (!ctrl->is_dependent)
+		sdw_bus_master_delete(&ctrl->bus);
 	clk_disable_unprepare(ctrl->hclk);
 }
 
-- 
2.53.0

