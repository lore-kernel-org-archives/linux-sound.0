Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DE52FC89F
	for <linux-sound@vger.kernel.org>; Thu,  4 Sep 2025 10:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756983415; cv=none; b=s+yBb8CGCyWiP7zi10c24c1zKdi2q9bpgOa0bcb26sGA1jZNj3Pf83l+rE75UHzD8hDcVpbaWOQpbOsQiH8Hd/b/zWwCzQE9bRHRU6onvsA9mzR9TRIcwfWwQmloIs9/e2nLcjGTIBkxPnh4lvdonUZdUT0M+7Bt+C/4yx0t5k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756983415; c=relaxed/simple;
	bh=cDbUjx0sul7Ld8NAml0P9RB4bTXO2/6aIeTTun2M03c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fQpP+zd5AoYmfyYNjSqutWZUZc2LFyKWWM1P/Fi6ZW0ghFaB1QD+PSRf1Wcf3puq7mfzOsm6TSjWfp6QYWAuSJN5uPGLvDFg/zGuh1rXE5rThZbmXEMA0s7fVn+xUIUQ0rOE4Jn7oKfQFWerL8Q4nyYI3kVBKZrRJ5wF+RZ5Sp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YdRkPVSa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YdRkPVSa"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849XGHa007823
	for <linux-sound@vger.kernel.org>; Thu, 4 Sep 2025 10:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=p6zH1ji2py6
	p7TMrlf20HqiWhyTErSKTHz4p6GLgtuE=; b=YdRkPVSaX1EPD11Un3N1a0v8BzV
	zzuBOvQZwMYFbyalMbATPBGxiIfA0z0v/4CBNPhT22ASHrKNJ+fw2e1Tdkdoqewa
	oqaX7rRpFJ+aFx5lyWw3SaRX6hdKGtGC/tOYFlxwP3D40GzUEfOu2HrXJ5SKEP5l
	xmIw3OZM0Jxz0C1GxtRWn5BaEh8OmPJ4k24JI7DieqYrGLAWlgK3vB2idpydqhbt
	EwG31Px0aBIBAHWT67JCITfHIZsIiCYHWTJZo3T/WqdnS0A8vyJnc9c0ubZ317s/
	c6Paynbr7y4LjRnz747xqbT3K6yHEklqKyA3BzzuWOzGxEttbQ5Lvy0g3Hg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura8y45a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 04 Sep 2025 10:56:53 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70d7c7e972eso13927076d6.3
        for <linux-sound@vger.kernel.org>; Thu, 04 Sep 2025 03:56:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756983412; x=1757588212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p6zH1ji2py6p7TMrlf20HqiWhyTErSKTHz4p6GLgtuE=;
        b=kpAZK7/ZL9Zy//0WhybkE4MQ7fHMVfqUdlrBaDcPxSFg9TChwrkEczjUNVjmWz6kKk
         DphcQDm6iZgRbWEIVWiobfe35nNs0mQHJG+wsE7oCnKUZmX501CFMPPlg+l4tFg6XIPB
         gFnIx4FSCwEiw54AMDWuaZ/R9HqJq4irAKqz+ZzW7ZeF05Ah+ssbf82xB8kN/OsNf6gO
         Ev9c3AU3D+rz2YZsdlwySVSnm0Tgopsu19Za8fbu/jhaC/RGxcvpVXLCf6LTE0fjxVDf
         ozSyz4iLR5EgdPqirlXtpBzr6Hi2ZfptzMj9tMpCljA/cv/KWXC2ndbbe9abRb8u6vNU
         vXvw==
X-Forwarded-Encrypted: i=1; AJvYcCXESno4IA3P/Ke+zDIznXenDPJXNbvOGjur0/oaCAu6bkBw/V1C2/9EaBmZTAFHHX6SdgyfO5OGIE4mPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjzB1PyA9NSfQ7yzGCWJXUy0fZlgggnmLIN6nK7ymYDT/7vQcT
	AiD2q13ohTmfFE2Tv0zHxyJfEfdT3oM7zD22m+CD9cDLO8Ja+QRglNS7ua6qh+b4FDkGjhVD8Xp
	Al2jTRyTWxy/VemXur8IsK76vyJPQgUuCbKwTaoaqXJSO3WdraeSn5AkyqIC8wyfsEA==
X-Gm-Gg: ASbGncsrECjFBtgn4AxyTXLUVb/klnWCPgRqP0bG19o3hYhOc3rSZQ4xu+Z5brWQ075
	jKlFFqkBfKNgs89QKuv1CnNF0ifgF342uub97q35/fA//iXXoRCdu4MtPo2PSfnWdDtymZ5kyxl
	LtH3TuHC4iSioqIgTrDRDXlIeqiLtJV5Rix7VyPHzIsJtuwBEm2XAeZBoy3ZGkGalFE31zhAhZ+
	PRnU5hq6bAAjFjS5FeqIgJuc+rK49M74Ga8A/h90RASCx9gSCOCA2ax/0rYbub96MBxfybI1LpY
	K79LUQdjpb9RHMc+OVLvuHhoyEHttTZUpytAVoGLAW1qFPbS1EtV5Q==
X-Received: by 2002:ac8:5786:0:b0:4b4:56b2:5c79 with SMTP id d75a77b69052e-4b456b25f12mr77527501cf.55.1756983412461;
        Thu, 04 Sep 2025 03:56:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVAmaOkeqxxSS+c44mWKZuQbv7AlFSAQvl4Q6yYrKh7XwoOYj94b3r96hztV8VrBImkHgytw==
X-Received: by 2002:ac8:5786:0:b0:4b4:56b2:5c79 with SMTP id d75a77b69052e-4b456b25f12mr77527251cf.55.1756983411972;
        Thu, 04 Sep 2025 03:56:51 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d0a1f807f9sm26462334f8f.38.2025.09.04.03.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 03:56:51 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, krzk+dt@kernel.org, vkoul@kernel.org
Cc: conor+dt@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 7/7] soundwire: qcom: adding support for v3.1.0
Date: Thu,  4 Sep 2025 11:56:16 +0100
Message-ID: <20250904105616.39178-8-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250904105616.39178-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250904105616.39178-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: FRG36zGXR3xu8mzju_0ggTE9EBuo2P2z
X-Proofpoint-GUID: FRG36zGXR3xu8mzju_0ggTE9EBuo2P2z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfXx5/tDsqoeXT/
 xYjdgWibQyThosJKJcG4TgfUeNuWi3Kkef7tzxy/FXcztxdJz64WinhEUhW9PXgh6qsKWzij+CR
 RdGth8WsHBghniEQjbFpgNBklIomR4k/W+uUTwX4ZOJhV9FFDKdU++iCaH40VxnQhfW20dz4p+R
 pEuFPOQWoaEvRs/KkJvBdJsTaSnIMurqw9NgzKBfFCOi/+xmEnVns2qdAYq3b1ri8TPltM3VVlT
 C2n+8d9wCu2xRNc/cTyzl9Y9sWqpU+itJX5+nVwUvmLHcGq94R6z2NABsbaDWpiflTrpt/9z0sr
 rtmgxssrdchCSzlOTnWZ2cF59p6RzA9p45vPVW/ggczmukhd9q/P5ATBc2DF1K4ZtBGm7Har/8D
 bepFn5YR
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68b97075 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=2e052FzMMQUWBbw-z-wA:9
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020

Add support for controller version v3.1.0, which has changes in
register layout and some register fields compared to v2.0.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/soundwire/qcom.c | 37 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 3d4d0c443977..a7b6d9ecc3ba 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -31,6 +31,7 @@
 #define SWRM_VERSION_1_5_1					0x01050001
 #define SWRM_VERSION_1_7_0					0x01070000
 #define SWRM_VERSION_2_0_0					0x02000000
+#define SWRM_VERSION_3_1_0					0x03010000
 #define SWRM_COMP_HW_VERSION					0x00
 #define SWRM_COMP_CFG_ADDR					0x04
 #define SWRM_COMP_CFG_IRQ_LEVEL_OR_PULSE_MSK			BIT(1)
@@ -40,6 +41,9 @@
 #define SWRM_COMP_PARAMS_RD_FIFO_DEPTH				GENMASK(19, 15)
 #define SWRM_COMP_PARAMS_DOUT_PORTS_MASK			GENMASK(4, 0)
 #define SWRM_COMP_PARAMS_DIN_PORTS_MASK				GENMASK(9, 5)
+#define SWRM_V3_COMP_PARAMS_WR_FIFO_DEPTH			GENMASK(17, 10)
+#define SWRM_V3_COMP_PARAMS_RD_FIFO_DEPTH			GENMASK(23, 18)
+
 #define SWRM_COMP_MASTER_ID					0x104
 #define SWRM_V1_3_INTERRUPT_STATUS				0x200
 #define SWRM_V2_0_INTERRUPT_STATUS				0x5000
@@ -296,6 +300,32 @@ static const struct qcom_swrm_data swrm_v2_0_data = {
 	.reg_layout = swrm_v2_0_reg_layout,
 };
 
+static const unsigned int swrm_v3_0_reg_layout[] = {
+	[SWRM_REG_FRAME_GEN_ENABLED] = SWRM_V2_0_LINK_STATUS,
+	[SWRM_REG_INTERRUPT_STATUS] = SWRM_V2_0_INTERRUPT_STATUS,
+	[SWRM_REG_INTERRUPT_MASK_ADDR] = 0, /* Not present */
+	[SWRM_REG_INTERRUPT_CLEAR] = SWRM_V2_0_INTERRUPT_CLEAR,
+	[SWRM_REG_INTERRUPT_CPU_EN] = SWRM_V2_0_INTERRUPT_CPU_EN,
+	[SWRM_REG_CMD_FIFO_WR_CMD] = SWRM_V2_0_CMD_FIFO_WR_CMD,
+	[SWRM_REG_CMD_FIFO_RD_CMD] = SWRM_V2_0_CMD_FIFO_RD_CMD,
+	[SWRM_REG_CMD_FIFO_STATUS] = SWRM_V2_0_CMD_FIFO_STATUS,
+	[SWRM_REG_CMD_FIFO_RD_FIFO_ADDR] = SWRM_V2_0_CMD_FIFO_RD_FIFO_ADDR,
+	[SWRM_OFFSET_DP_PORT_CTRL_BANK]		= 0x1224,
+	[SWRM_OFFSET_DP_PORT_CTRL_2_BANK]	= 0x1228,
+	[SWRM_OFFSET_DP_BLOCK_CTRL_1]		= 0x122c,
+	[SWRM_OFFSET_DP_BLOCK_CTRL2_BANK]	= 0x1230,
+	[SWRM_OFFSET_DP_PORT_HCTRL_BANK]	= 0x1234,
+	[SWRM_OFFSET_DP_BLOCK_CTRL3_BANK]	= 0x1238,
+	[SWRM_OFFSET_DP_SAMPLECTRL2_BANK]	= 0x123c,
+};
+
+static const struct qcom_swrm_data swrm_v3_0_data = {
+	.default_rows = 50,
+	.default_cols = 16,
+	.sw_clk_gate_required = true,
+	.max_reg = SWR_V2_0_MSTR_MAX_REG_ADDR,
+	.reg_layout = swrm_v3_0_reg_layout,
+};
 #define to_qcom_sdw(b)	container_of(b, struct qcom_swrm_ctrl, bus)
 
 static int qcom_swrm_ahb_reg_read(struct qcom_swrm_ctrl *ctrl, int reg,
@@ -919,7 +949,11 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 	swrm_wait_for_frame_gen_enabled(ctrl);
 	ctrl->slave_status = 0;
 	ctrl->reg_read(ctrl, SWRM_COMP_PARAMS, &val);
-	ctrl->wr_fifo_depth = FIELD_GET(SWRM_COMP_PARAMS_WR_FIFO_DEPTH, val);
+
+	if (ctrl->version >= SWRM_VERSION_3_1_0)
+		ctrl->wr_fifo_depth = FIELD_GET(SWRM_V3_COMP_PARAMS_WR_FIFO_DEPTH, val);
+	else
+		ctrl->wr_fifo_depth = FIELD_GET(SWRM_COMP_PARAMS_WR_FIFO_DEPTH, val);
 
 	return 0;
 }
@@ -1765,6 +1799,7 @@ static const struct of_device_id qcom_swrm_of_match[] = {
 	{ .compatible = "qcom,soundwire-v1.6.0", .data = &swrm_v1_6_data },
 	{ .compatible = "qcom,soundwire-v1.7.0", .data = &swrm_v1_5_data },
 	{ .compatible = "qcom,soundwire-v2.0.0", .data = &swrm_v2_0_data },
+	{ .compatible = "qcom,soundwire-v3.1.0", .data = &swrm_v3_0_data },
 	{/* sentinel */},
 };
 
-- 
2.50.0

