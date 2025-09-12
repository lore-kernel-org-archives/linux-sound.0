Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3696326F293
	for <linux-sound@vger.kernel.org>; Fri, 12 Sep 2025 08:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757665963; cv=none; b=LgDhmsqDW84l2UdjRkiwwP/GzTDQCFro4n2vy6nvSPVBdqzvkhKPq8Jmk/C+ntt/kSck6e1yy/9b6iDw1I+RwEiqrz3PPSZcDEGkhGjmUQT6TV1JM9wJMqvOK+5sHMf46tDekXTR5D2oEUkRQbpTt7pGeM8MNN8xr1hrjmPY+mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757665963; c=relaxed/simple;
	bh=t66MAn3Nwvg/BgkzEKFhUiREcUiVPhCJxUavfb35i20=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CHbijZ1UOPcpz0ewZ2ck8PpQ1uXEBxInAOoPRWRORY+cSIsV9gRKHiCp+mSHb2P7cz6M5pn8kLXqL6zq5umFuGpodJWQsut8ZgVpskKUQNCf/tfcF78ERIaSiH31mWBq6FODmHBa7Z3kJCkgkX/My5ogR96M9yduLu1vnTOyDts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HveAS/BL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HveAS/BL"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BMDsDX019591
	for <linux-sound@vger.kernel.org>; Fri, 12 Sep 2025 08:32:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tE9A84HrisC
	i01MLhVRRDnJjMb3SqJek9fgYZmAL/Is=; b=HveAS/BL1UxPgA3ZICkYhLY6gMS
	QZ8j0J6+BwIKOnKehm0FmeyfJcgSONFGrj/yzAyczZ3OLVBlFM4M7VMbOQPCqPN6
	uZJKZvmtztE9rp797meVPMi2eKJaWVJN7lDpG/oHUm7yM7GlQcfDpSFVgw18g8Ik
	733ZRK5aqGafvx/Bqj4pDsj7tJQe7ETrBVAyNn8QLhgPv1LwXkBoubGD1aT1X6SQ
	2T5uxaZ5avl3pvHDiSJwr5lE1G+TYAosdPd/KoznGhIOBidiTCT4t4y9wBvL0Q2Z
	fGutjmT7rFwWD2CSZmkXFJX0/bGrgxwEEHxUChGMSKn95hsVf2U2zYKrWvQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493qphvj3g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 12 Sep 2025 08:32:41 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-76379ed4aa8so31967146d6.2
        for <linux-sound@vger.kernel.org>; Fri, 12 Sep 2025 01:32:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757665960; x=1758270760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tE9A84HrisCi01MLhVRRDnJjMb3SqJek9fgYZmAL/Is=;
        b=Bb5ic5LXGMC6gfuq+BAeqzU7A6oEwuA0bZy3a2yW/d38OmNbSadBpmzfUFqqwJe9SW
         3zh9XIUg0QjWRv67QUnFOlYaLbyQuRvY8kGI3fEsho1rDoDdsr2fY+h6X1vRpXchsFQq
         ufDxH/Yow5fF+EHYGsOn3Hpyg7Nlktdm5Tr4B4QQjKdRI8RnHHjJOw5flXiXrjXYWj/B
         0GD4j6N/Xmnui1Z/gH2xH4nengRmatMpesl3lPBSQCvp3i/JZGPfaONTk6SqzVVaDjqC
         oSDHFLxDX1Fo40rTBnyEmX5xWM4ZPcCsnKGT0pr6AmuW4+uwghiebEB8Fuur6pB07UkR
         jC1A==
X-Forwarded-Encrypted: i=1; AJvYcCVrEyLonrJiYybY+mNKNWW58hLdL4e7eWgt1U1HijOiA1BRB4Zml3r0uQz4MA6+Z/jyH7w17dcEpw+YnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf4w82LX1JS86M38p1IN3WwkO/ILIEUsCDkUVHRv+o00MKC/0O
	0xIXDHrcg9MCC0IAhgexJ854A/wVlyhTBGSf/74XzFvxOOC3UMcGYgwZVNOSv9ZsZxId1Ov37cs
	fy1tAbs9Qm6odK1jz0yfGactOIVOTPQcIlT4shsrE7JNJnrlFVCKSaCm/Ce1hQyBHUQ==
X-Gm-Gg: ASbGncvj4KHi+evIpRqEzvuEWF65ngawiBuDvzczvc0Ec8TBAQgmhXIlfrW1xO2w21m
	C7ROGPZmTjpjWHa+psFwqrXjQ1NqFjv86zuhlm51N5OCS5UilU9V3xfIzXZLwrYW9CtXgvpkAgr
	/cqKDJGNJxk62VqkpI3tkxdszmH+Yw0eswbP6nRmsn6uRVK1J1PFF9+LrrFWwJf9KFWbzDgSrKW
	v9qhBn7xhL6fEhCDpC29V8XFbkglRhMGsoXZOC6iaId6wXsFmEoC/u4o6OQbxOINV7SviMCusHv
	DWmedX9yOA4e40o3ya637srnIF/7q1PUdPvSq7cr6e9eJqJsql+Nwg==
X-Received: by 2002:a05:6214:4102:b0:730:df1e:a99d with SMTP id 6a1803df08f44-767bcfa78e3mr24804106d6.17.1757665960319;
        Fri, 12 Sep 2025 01:32:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhdT74E29k2br0fqsuCFK/2Qpd+RB91i3IK7DqDnADWFd8rcV8unpUlG3DNZckWdx7yuUN5w==
X-Received: by 2002:a05:6214:4102:b0:730:df1e:a99d with SMTP id 6a1803df08f44-767bcfa78e3mr24803856d6.17.1757665959871;
        Fri, 12 Sep 2025 01:32:39 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e017c1dd3sm31247265e9.2.2025.09.12.01.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 01:32:39 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, krzk+dt@kernel.org, vkoul@kernel.org
Cc: conor+dt@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 7/7] soundwire: qcom: adding support for v3.1.0
Date: Fri, 12 Sep 2025 09:32:25 +0100
Message-ID: <20250912083225.228778-8-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250912083225.228778-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250912083225.228778-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aPDwqa9m c=1 sm=1 tr=0 ts=68c3daa9 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=2e052FzMMQUWBbw-z-wA:9
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: 2DnnZHL7LpQJWzd-8PHNJxPaqZ_U3ftv
X-Proofpoint-ORIG-GUID: 2DnnZHL7LpQJWzd-8PHNJxPaqZ_U3ftv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTExMDA0MCBTYWx0ZWRfX7kYTwS0O/mpq
 dSJtiSTkZnNAvm3JIJWaoP7Vq1QNY5iOxOHBK+Je+mJZeNGoYSuwVdZr8IIr1ulxFAeubkQJFWn
 tZRZUkYWVKAWZ7bMq1HJpqAa68Uh5yRg9sQVW5jI3mw+vRMwzqg9tMpkbuS3GeSEWpTs0YnQtlo
 l9IdegDCHp0mio79SxZEkkXMCPujG4SDWm6w3evTfMQKfL7al/SYl7sIz8SlrMuaqLEbgbArFkj
 gRUuf/pkwBwAWVGT6qmj3J9Es7FplDEhUWvTe+B4XCn64IT+SxVy85725arpLK0vTWubRObHfLG
 R3z00IzQ2FUVd8pwS20Oh+X4SFtRtwe3q96OurZEJiVXqZxAMevxkU8+VpftgNVoX6IIbKwzFzM
 ApB9CPJV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_03,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509110040

Add support for controller version v3.1.0, which has changes in
register layout and some register fields compared to v2.0.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/soundwire/qcom.c | 37 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 5baf831f49ab..17afc5aa8b44 100644
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
@@ -1785,6 +1819,7 @@ static const struct of_device_id qcom_swrm_of_match[] = {
 	{ .compatible = "qcom,soundwire-v1.6.0", .data = &swrm_v1_6_data },
 	{ .compatible = "qcom,soundwire-v1.7.0", .data = &swrm_v1_5_data },
 	{ .compatible = "qcom,soundwire-v2.0.0", .data = &swrm_v2_0_data },
+	{ .compatible = "qcom,soundwire-v3.1.0", .data = &swrm_v3_0_data },
 	{/* sentinel */},
 };
 
-- 
2.50.0

