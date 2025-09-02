Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05723337687
	for <linux-sound@vger.kernel.org>; Tue,  2 Sep 2025 16:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756829562; cv=none; b=kmzLTmpN/OjFqEr0QX3Y07uEhBQYDUJeA1ctbiq3WxrPoVCajeNKOM9N5bi1ZUpwPzIynBxX9gz0OVtAJoAv/rai7mASs6mUs4oE2+4+nJmtOqxmqagRkP62CV5wLaLvaDJLcI6pb7p9FVlxV9ndycxT+geVu8jAZGNKMUh7Omg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756829562; c=relaxed/simple;
	bh=cDbUjx0sul7Ld8NAml0P9RB4bTXO2/6aIeTTun2M03c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H02fUkRx6GoziW1b9mTG98lv87cAtmv/yOy0aKH9DYUtrdRYbSJNIPy/ij5yp8BGbALICvCVgbnZ1ZfvRAeJTPjgU8FIfdZ07gpNtVN8zI8sWdIZysSB+eh4o+xw511zgWbbye0uEPKqC7R3g2U36s4WK3432eRBW3t6pUg5Y9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jNniZDQ/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jNniZDQ/"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582EqAlc001385
	for <linux-sound@vger.kernel.org>; Tue, 2 Sep 2025 16:12:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=p6zH1ji2py6
	p7TMrlf20HqiWhyTErSKTHz4p6GLgtuE=; b=jNniZDQ/HuuRMY7vxY/SDIYphgO
	HnPY7Ec9mAL+NzRujGmW4/Al5s7zsWObl3L322QNjswDxOSXOC0SmQMLkeySP92z
	QgCytiQFdQWQWwZh0ieIykydbxKxe2wSpHQzX1Yhsoge3S9PwWHIb2jfhsI02vQ/
	/VxJy0eydnAsuqDD4pmle+csTgNx1qSZ3EeV6AiIirAfQxxTkvhOGfPXujbBNcYx
	zhncxjX8SfL6TaV9GyDEAMFWZxr9fc68HGWLINGUeBMVd2M8cvu2YSvt4JtS+Ept
	hBQFmNr47LYwSTPS/CSUsVwXE7nxSlWT8MDJV5525SvzRCoPTd+NVu/eefA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wy4ad1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 02 Sep 2025 16:12:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b35083d560so11346961cf.3
        for <linux-sound@vger.kernel.org>; Tue, 02 Sep 2025 09:12:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756829559; x=1757434359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p6zH1ji2py6p7TMrlf20HqiWhyTErSKTHz4p6GLgtuE=;
        b=OaWMnJMiPg3JF3Z5daxG91V8zxn67DdfZS+kthRfGOz8Ngk4doZ6H6OIMiH/gRGw7d
         7nyeH3KtFs99wjLtfrCuq16AMg1pmfKDdWtsLi1RYeF5TxUF4Yot0+wUM0sR0AHnWKuz
         zwW+YZqHiotfveVghgsF4WYh6Zj6Sx7tQolMrOL3L1Vy5Tq2xTN8Kvu1/imfpAYZ1Et3
         p1JokkLLYxXc7i3dsNnuXoepO5H2k2m2QkvCteGIMv03YrxN1BY69Vu3v/s9ZsWRneBH
         03J7I4fsYXzFw/XlUDjErmbwrquW6Bux2N21MD3ve8bwUmrAgnS1Rgcj86XFSZYmYUPT
         s4Uw==
X-Forwarded-Encrypted: i=1; AJvYcCWwgZDsIe07KF0AcLp/iTP88gv0YKp9fDUYda5MhPiLOkjAzZpr0ADLjwvwBChMs+WR59W2u0IDBSV++Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7z7qkWC7nCmQtP9WQnT/E6tHIQCDhUEHUJDwQVBJhfxC015gg
	KpyfwgWsuFdyqHmadOOS0qPUNqy5x9qgEBodF//oCgKk4vjmd6qUgvtdfNk6mESL4h/1qEEPsbt
	WKFF84377UienGes65YEr9R4tAPsqAn5gB8vyC4LgHYwOr5vs8AO8n31JxE+wqkkn0g==
X-Gm-Gg: ASbGncta2z28kxhrbgAon2wHJ51gz4Or55q/1ErMH8sKSGOU0WKa7i0zK4AquZgrywK
	VL3EeXPZDT2OoXp+Q511EK94iST3l/0x0xrwja79z3saSS2YNUQkdELUnOuTeOvRMpMh0qgyjU6
	OPp99zmjaXi6oO2GmtXsVFpeKjMoxdTfQMnalYJ0TVlWjuQqFp21mrJqVkuEfwtSNv544xrBI4f
	Gk5zDViEjiJubgBv+0/sUMw2MckC4NlcJhkKrWZPt8OM0d5TAAK6Hl0NmiHWmBEgX3xbyN2vDIJ
	42gawZcMGvrEA2vFv8852zB5ye0Slzf5+pHS+oyngECSEouQZkDHCQ==
X-Received: by 2002:ac8:5f85:0:b0:4b3:81b:c598 with SMTP id d75a77b69052e-4b31d80cc48mr143181181cf.9.1756829558818;
        Tue, 02 Sep 2025 09:12:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/2aSVAGC3oxLVCCAX9s65bT1/9R+lpOycsHDEcdffv1fXpb8bVJBWCm7x5TQMfvcz1MFwig==
X-Received: by 2002:ac8:5f85:0:b0:4b3:81b:c598 with SMTP id d75a77b69052e-4b31d80cc48mr143180711cf.9.1756829558337;
        Tue, 02 Sep 2025 09:12:38 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f0d32a2sm309894655e9.9.2025.09.02.09.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 09:12:37 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, krzk+dt@kernel.org, vkoul@kernel.org
Cc: conor+dt@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 7/7] soundwire: qcom: adding support for v3.1.0
Date: Tue,  2 Sep 2025 17:11:56 +0100
Message-ID: <20250902161156.145521-8-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250902161156.145521-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250902161156.145521-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68b71778 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=2e052FzMMQUWBbw-z-wA:9
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: Feugg6mTHmhQuz7X_zZPe35dZeSwvKBn
X-Proofpoint-ORIG-GUID: Feugg6mTHmhQuz7X_zZPe35dZeSwvKBn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfXzz/6+iEP1fOi
 ltPao8ZGGraEPy8zoUFDsyi8ml41m02GHDLk3bD+YdLIF6yvho8Dj9njy9tzyP6BqUuE8GcVSNA
 wwIn+YV016OLr7EJxiY35oZM9efZr4jABAqW8nMIvUQSv7UppFntZPautzGkTDqyhRk7ENsdwG0
 8RWWza8POINet2EjhrS2FamNv+Ql6ktCHNN0yDL2ErIcqoELa1LtgLTF/OCm5tVuLgo68e2M3Xw
 /E8yjt3zRyscDBWQQvVD7rmX+h0lYv9Xd/fqLE12cAToBC0i4O2BAJvjKUvn02jeWJifXr8Nix7
 W5jKUxh6RVXAmSWEk1DD/9Ko75fhwdIoaMaswVOGMnzDC1/bE18DpCCCovbSHC01dO4yP3E8v6t
 iIkebhfD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101

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

