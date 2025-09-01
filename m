Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E5D26B76C
	for <linux-sound@vger.kernel.org>; Mon,  1 Sep 2025 19:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756756252; cv=none; b=fxJ7YWrpiJfd7iD6A6nZcMsPVWU9mHpVRRnbnK8FOO8FxLslDSdYYA3ZscOcdb3+CoQbLxDQggfW4HWH0N1hzsWALGyMAn6nb+qtimXKnWl4fC/KmJDc5/M4km61HQUWMIdxOtBi4/HUiVZxV7UnMGWY9BKCTXxG32op/aje62g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756756252; c=relaxed/simple;
	bh=vH3oMbsPgp5OYepA+zgye3XPZSMonO8B70jM2paEwes=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HHDTgETnwh3ovlC69XW+bc0rCH3kykue1B8yAjd7AP1mFMQb9mg0r0qFXyfl6UIpQv54bVoJ+NcDPvPETFZBDUjXMd9ljKA+C52mB4P++yPE82sXVPeijRbySK8ED6BROg4+e8drXTZgdpbO3jx62SimqJy4o5evbkgsTpFOqq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QV5jW0QH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QV5jW0QH"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 581B42mE016470
	for <linux-sound@vger.kernel.org>; Mon, 1 Sep 2025 19:50:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bwXgKqG7l6m
	3fBEufVnNvnktN6pG8bwNFgdMC4s7c1E=; b=QV5jW0QH18OTojfVY9GPRf7MqfO
	8zU+pJsFCbow3EwoZFanRU09YzA7QQhBUK770z0/Y6qdeN7ITofrd5o7TDIp/Lon
	B6AqsClxbl0RXagqLHSmrgd/tR9yOUg1tDjskfFCTIYmhfYjNsKF8RWthdYu6/Zh
	CHJrtV6/syUrH0TUmNDEHha1PdaBXWt8c5FLJFgtEkTkicAUBGTsKwqiisxXXG9u
	/dvmNKVwMeC+3LUpU1WqhT23SzE/G8lR29AMIG8UxT0HQoA7AJMM3wxS2OUBizYW
	e+om9OaW/vxtJCj+h4tfuC/uASNl5GTlMObDS4zQ1T4kVN85LDX7HH9EQ0g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ush2wm98-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 01 Sep 2025 19:50:49 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b3349c2c65so29128581cf.1
        for <linux-sound@vger.kernel.org>; Mon, 01 Sep 2025 12:50:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756756248; x=1757361048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bwXgKqG7l6m3fBEufVnNvnktN6pG8bwNFgdMC4s7c1E=;
        b=HRFbM8aAGCZfGi4LHRvChHu1J4ympJ8r9BeFE3Gq6Qd5es9QMOdjJLJxtCms7uP58l
         GKm1n0WV+WnCD5uKDelgifuy4dZHEBWlz2CRVWZgziF/7PKyPzGMDSDJGleyilxi4jzW
         0Qbe1IUXe9VS5wHYBgrKvyXHFt5F3Sd0aWAy4rCgMIfXvWrAXiuYmhx3t4bJ6x0AwcI8
         BK4UcbwjMklMOJgzJFY3ss42UaCOkLr8mSmFRxmkLVj2Y+y+QGIKjzpVnlVELn6XQzbW
         4jEL3cEkmZi/eogw4xqONl1CWO8M1j4vCoqHZK3oGdshlIUK1QeivYRorRxCwvwRiO1l
         /k+w==
X-Forwarded-Encrypted: i=1; AJvYcCXkwz3v4RkbQY+hIy6Nh7Xr+D6orTVTuKdHYMz4KWaT6A/tvCCKpqnoS3sWzoFMzlMlrET4pnAQbzNLXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzarmSu/rxe6fyH5HPl39jwQPGtkA/nqo+G54HajxqLHHyZtMLZ
	J/xuYJVFsXH6SJ01THzgy1b46hMlPBm8T2sYKjL9fE873sfwgJJG7hu1K1WL8zDbA41c94lwKWF
	okxdxzcgJWhKrjZfu+oNYtCpqBf1VcR9i1tpYcH5YvHUg2QmasLDux+ufbAqwEtHo9Q==
X-Gm-Gg: ASbGnctoUy2NnKX1EiqOGoTY5uTYm/eHgg5Nbu+bieJSYucQUMBvXnsunJxfXVbmYx2
	5N/PK7k8lqOOzjiPwrWvklCyDTMcSaqWBVEWxlvZMtn2DQX95ANAsd91b1Qa49IsNuPIZ+mUw4P
	scVAAotNrffqYCMFqoPU5Ks9DFDibjRSQdDvS8r6tM1/azloBxVzkakgVOg6zSnMiT71FxvmPe+
	01gzREH5z3As1ifg/FX4b5XHD734fIo/QFgH+uYZPhf2dccJGSzWhC+f6kBjatRKKH5NgeGnxaG
	GjafspU3htsG2aKgY2gEFNw3kZFsGmUDHsTT6MUR9X+m3fMjF8l5GQ==
X-Received: by 2002:a05:622a:1492:b0:4b3:279b:6986 with SMTP id d75a77b69052e-4b3279b6e1emr92068771cf.78.1756756247891;
        Mon, 01 Sep 2025 12:50:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxW4sRj/3pU8ygE7OoLsbGqEoBt4d/nupXfxoM5c10IIpNaAzuefqWEifbW16rAQrE8kTLTw==
X-Received: by 2002:a05:622a:1492:b0:4b3:279b:6986 with SMTP id d75a77b69052e-4b3279b6e1emr92068381cf.78.1756756247238;
        Mon, 01 Sep 2025 12:50:47 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d7330e4bc9sm4653705f8f.10.2025.09.01.12.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 12:50:46 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, krzk+dt@kernel.org, vkoul@kernel.org
Cc: conor+dt@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 7/7] soundwire: qcom: adding support for v3.1.0
Date: Mon,  1 Sep 2025 20:50:37 +0100
Message-ID: <20250901195037.47156-8-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250901195037.47156-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250901195037.47156-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMiBTYWx0ZWRfXylTtFHbi1oF4
 b8p/9Ek9gCqaHbNtp0RX4pND8f/+MPYDQELaVenzftj9F00qGr7UZyA+aVhst+v/FkxAxe3xT04
 PnJ9PbGIPeyevxHEtJM+HWBwU1fQvSUfpp0NOfFT2hNd7rXCepOxzwvrLeNwPxzjp/AyD1Qw+bv
 j19dmeocb9+9wLy5L+BPJh4VhuB8Ap4dU9MJGfKZJzzU/MFxeHuhl903deXXIjjacjpWd4l2u1Z
 M2fp5CA2zdZb552uFbgjLEfxKTLp527TVfc/zSlOf8y9qZ9wpKonUSNWo/rK1sXUoIeFd9rmP73
 6U8z9FcYiwbrYHs824hWoLLIYMAbhZPk3f43hly8wCF6o2ji0SiZX+GLEMYJZq/XMy0Ch+rQNwV
 waYLPq9h
X-Proofpoint-ORIG-GUID: V6zgtgpR09XqbOGIFH6PNTl35_1FUmLg
X-Proofpoint-GUID: V6zgtgpR09XqbOGIFH6PNTl35_1FUmLg
X-Authority-Analysis: v=2.4 cv=M9NNKzws c=1 sm=1 tr=0 ts=68b5f919 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=W4XR6XjLtGUYRM1o5EgA:9
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300032

Add support for controller version v3.1.0, which has changes in
register layout and some register fields compared to v2.0.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/soundwire/qcom.c | 47 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 46 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index e3d248432d49..ab97d9d8f1d9 100644
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
@@ -99,6 +103,17 @@
 #define SWRM_MCP_SLV_STATUS					0x1090
 #define SWRM_MCP_SLV_STATUS_MASK				GENMASK(1, 0)
 #define SWRM_MCP_SLV_STATUS_SZ					2
+
+#define SWRM_V3_DP0_PORT_CTRL_BANK(n, m)	(0x1124 + 0x100 * (n - 1) + 0x40 * m)
+#define SWRM_V3_DP0_PORT_CTRL_2_BANK(n, m)	(0x1128 + 0x100 * (n - 1) + 0x40 * m)
+#define SWRM_V3_DP_PORT_CTRL_BANK(n, m)		(0x1224 + 0x100 * (n - 1) + 0x40 * m)
+#define SWRM_V3_DP_PORT_CTRL_2_BANK(n, m)	(0x1228 + 0x100 * (n - 1) + 0x40 * m)
+#define SWRM_V3_DP_BLOCK_CTRL_1(n)		(0x122C + 0x100 * (n - 1))
+#define SWRM_V3_DP_BLOCK_CTRL2_BANK(n, m)	(0x1230 + 0x100 * (n - 1) + 0x40 * m)
+#define SWRM_V3_DP_PORT_HCTRL_BANK(n, m)	(0x1234 + 0x100 * (n - 1) + 0x40 * m)
+#define SWRM_V3_DP_BLOCK_CTRL3_BANK(n, m)	(0x1238 + 0x100 * (n - 1) + 0x40 * m)
+#define SWRM_V3_DP_SAMPLECTRL2_BANK(n, m)	(0x123C + 0x100 * (n - 1) + 0x40 * m)
+
 #define SWRM_DP_PORT_CTRL_BANK(n, m)	(0x1124 + 0x100 * (n - 1) + 0x40 * m)
 #define SWRM_DP_PORT_CTRL_2_BANK(n, m)	(0x1128 + 0x100 * (n - 1) + 0x40 * m)
 #define SWRM_DP_BLOCK_CTRL_1(n)		(0x112C + 0x100 * (n - 1))
@@ -304,6 +319,32 @@ static const struct qcom_swrm_data swrm_v2_0_data = {
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
+	[SWRM_OFFSET_DP_BLOCK_CTRL_1]		= 0x122C,
+	[SWRM_OFFSET_DP_BLOCK_CTRL2_BANK]	= 0x1230,
+	[SWRM_OFFSET_DP_PORT_HCTRL_BANK]	= 0x1234,
+	[SWRM_OFFSET_DP_BLOCK_CTRL3_BANK]	= 0x1238,
+	[SWRM_OFFSET_DP_SAMPLECTRL2_BANK]	= 0x123C,
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
@@ -928,7 +969,10 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 	ctrl->slave_status = 0;
 	ctrl->reg_read(ctrl, SWRM_COMP_PARAMS, &val);
 
-	ctrl->wr_fifo_depth = FIELD_GET(SWRM_COMP_PARAMS_WR_FIFO_DEPTH, val);
+	if (ctrl->version >= SWRM_VERSION_3_1_0)
+		ctrl->wr_fifo_depth = FIELD_GET(SWRM_V3_COMP_PARAMS_WR_FIFO_DEPTH, val);
+	else
+		ctrl->wr_fifo_depth = FIELD_GET(SWRM_COMP_PARAMS_WR_FIFO_DEPTH, val);
 
 	return 0;
 }
@@ -1778,6 +1822,7 @@ static const struct of_device_id qcom_swrm_of_match[] = {
 	{ .compatible = "qcom,soundwire-v1.6.0", .data = &swrm_v1_6_data },
 	{ .compatible = "qcom,soundwire-v1.7.0", .data = &swrm_v1_5_data },
 	{ .compatible = "qcom,soundwire-v2.0.0", .data = &swrm_v2_0_data },
+	{ .compatible = "qcom,soundwire-v3.1.0", .data = &swrm_v3_0_data },
 	{/* sentinel */},
 };
 
-- 
2.50.0

