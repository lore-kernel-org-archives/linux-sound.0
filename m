Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAE826FA46
	for <linux-sound@vger.kernel.org>; Fri, 12 Sep 2025 08:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757665962; cv=none; b=YcpkrQqcEM5vTDXtAFmiBZlZ0dyaz+olJEkbson3sSuSFDUdnWhzwBKAbffIcVhkkGgdFEwcnIAg2duBow46haNeYfE6tTB8kOyTrN0VNHXl5//ouwSgyCXGFSgcJgGdV3elCk9NfVAVMEc1QThlKC74rTQ2qkui171Sov3dmh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757665962; c=relaxed/simple;
	bh=c2cOI9XOIt/7L8H0ddJBtjPq+WkqbCOMXm9NozcqA6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=alcNWOqtrJ5nU99O+24WoNXcTPZIpDBPcLilQSK0pV8uWdKiFtovRg+GjUiKzu2WiRtqBbz31Ml1p+5pSrJKdCEJZkTiA8xR0zHqqOIDPolA48QUOirJ2aQlUbD9jXKmEwbtMrLZ4UdPgBmwCfWpMqgXcUnpFjAfh4cmjFHjf1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OPTb/OrW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OPTb/OrW"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C7PTfR006540
	for <linux-sound@vger.kernel.org>; Fri, 12 Sep 2025 08:32:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=EEkIG5hyNzo
	PjLF8DnQWN27MBxVY+Hnk7IhpuWTJToA=; b=OPTb/OrW8TppZkMialOCFMLb9td
	7oYWRENI1bKP8hQJ2aAe9CSF1ymCedpfjNBl2GoL4AFQIJzEcyusVFb6tQ+oJ4h1
	D8LyUbD1HhHmQJdSXp5tNTxs8jf52mEzRQSsVu+D4VjnJeVns7CftMMPiluugBOM
	qWoBByJ15u3F7SbVy2iEdldiifqX4rWw2VLqD11BPhLpYe214/iGqJDF1z44M5SH
	ynJLCURvh+K8ezLOykL0ATUJucaTmQOFRCSjkKWCkK8ph5PdWanh8aZuUwEJTeLr
	EEDaDbEcNXF0C6usGny6j4IwfxNDWKtaoMtn2wrwzx78ZU8Af1NwGRrXK7A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8aju18-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 12 Sep 2025 08:32:40 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70d7c7e972eso33545206d6.3
        for <linux-sound@vger.kernel.org>; Fri, 12 Sep 2025 01:32:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757665959; x=1758270759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EEkIG5hyNzoPjLF8DnQWN27MBxVY+Hnk7IhpuWTJToA=;
        b=cbpkiQoWNGpdxt3on3W8u6U9ntDv9dxEepYSEsTQxYdq6jxrJ/MhHGSUVGgWV8lmpv
         aJIY2Z+0vOcC8L3yYDA/Gf6MlBgAk9flWB4RS2X0GPgjcaHS54ZaEorTP04pMEYd8Ks5
         rpNQVF05VW4rUQInfxjLOGBu12vqkhgQTl+zYDvfwnu03UVjdTwJQN9dHwe0SI94Wgv2
         stQVYGbuh0oCA73hpVsb3crfOxetbfW5fIDxbIphACUnab/8bClYUgj3nljRcrb6hF9c
         TQHCM7Ozy2fg+EiZfKL7ZKO5Je1UK2+Z6PSZmkorb/4wSSMpOR7CKPrVyVac+K5FrbFh
         ChEw==
X-Forwarded-Encrypted: i=1; AJvYcCUPduQgRovz66wOx8aUo1rAemoOhWxkPeQzUAJqgjVoQGDBsoc9THoqKk0i1spuN7Om4h9XhgZi7WRPVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKIxC4eEuF25IvTsMHiYBmjYALns1UdZbxE8DqvRIlV8/atDPj
	hHdreQCy0taagqbIY3eC07nPd9V3dsz/9asE/+yf5e3j2JxSOols7Onv1a8N/Z3xx03oXfn6hgD
	4pZ5B4/VdS9+wgwNoV1Z0QEH/3fOHiiuCM6zjb0NpFi30+llhudf0DhtO+wi0NMX8lA==
X-Gm-Gg: ASbGncvt6OFSEruQik7bVh2Pa5FjuaTS5HEmjLX8wDHvAaQ1RmiurodrWdUc+05FRaR
	tGEx3saQRL8ZTY1hRsFqT3Hce7hAwVf1lXaSIWQ8qssTBtWxwBtLC+CR+sMAkjBcysdRTkTZsJ/
	H0hfEKaBfdNyI4uTZcTOpowFLzVC3in/NkzgCCDN1hcf/ibDpLl2GIY0C4cbqY253mCNzg9npnp
	VaObBDXKDazBbvf00HohyOf3G9mg/CKV3TAC1yFyxJOdq9lB+4IIR2WrIuY8F3Fc4tITyJ7DBSR
	My11ibSJu/fMbmfUqP8PW3SLxDVu9HlydQA2i6Z/VwGe3/CFTWQUUg==
X-Received: by 2002:a05:6214:509d:b0:748:2963:9306 with SMTP id 6a1803df08f44-767c1b9a19bmr24348546d6.36.1757665958525;
        Fri, 12 Sep 2025 01:32:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHi5uYXs44GDSBhvE1LyDjrTdnPHKK6PvLNZ1HNYGMov3/QPJkHxszYpqCiGhuv7YO9wW0/bA==
X-Received: by 2002:a05:6214:509d:b0:748:2963:9306 with SMTP id 6a1803df08f44-767c1b9a19bmr24348206d6.36.1757665957881;
        Fri, 12 Sep 2025 01:32:37 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e017c1dd3sm31247265e9.2.2025.09.12.01.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 01:32:37 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, krzk+dt@kernel.org, vkoul@kernel.org
Cc: conor+dt@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 5/7] soundwire: qcom: prepare for v3.x
Date: Fri, 12 Sep 2025 09:32:23 +0100
Message-ID: <20250912083225.228778-6-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68c3daa8 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KTr9yuUO_FWm3CjRSecA:9
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: _qOq3seSdrJNuy6VgAIKtbnJXcCoCZLk
X-Proofpoint-ORIG-GUID: _qOq3seSdrJNuy6VgAIKtbnJXcCoCZLk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfX4Z0WUJDqmEK/
 GMUNb80+QEK/Q88gAwFCiIlOVYQE1EVNcwbh1BI142ekxJ+f5W6pu70ULTfI0MdjApL93uCv5tE
 dCR5atPI+MdXAX0AS+EmHqMVrBsg8/jcGVKSyEfAAATJhmJWCaRZmK957wFvdyxu2q4d+YrGjx4
 yC+cvWHL2fPENNAuZvuUz7aPyhlwVNMDEu6DgC3dnhvSLXfqjtvDhfH6+J+1Tg2js4wUMs6qD11
 Mxnsz3YijeiSSxqj3jfB9opXrJwU6RstCxxVCsvfWHqhfy11TYd9Mitjxkq/yldMSBZxA6V0Ppa
 UgT7F8SBXsXvnYTzVBmNQdH01/n1lvGxzCL60HcCGLmDBy8FiaWYh8vatBA5pecLrn2T/sykxEB
 NLmOV9tv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_03,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039

cleanup the register layout structs to prepare for adding new 3.x
controller support.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/soundwire/qcom.c | 77 +++++++++++++++++++++++++++++-----------
 1 file changed, 56 insertions(+), 21 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 9e6dc43c1112..5baf831f49ab 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -99,14 +99,15 @@
 #define SWRM_MCP_SLV_STATUS					0x1090
 #define SWRM_MCP_SLV_STATUS_MASK				GENMASK(1, 0)
 #define SWRM_MCP_SLV_STATUS_SZ					2
-#define SWRM_DP_PORT_CTRL_BANK(n, m)	(0x1124 + 0x100 * (n - 1) + 0x40 * m)
-#define SWRM_DP_PORT_CTRL_2_BANK(n, m)	(0x1128 + 0x100 * (n - 1) + 0x40 * m)
-#define SWRM_DP_BLOCK_CTRL_1(n)		(0x112C + 0x100 * (n - 1))
-#define SWRM_DP_BLOCK_CTRL2_BANK(n, m)	(0x1130 + 0x100 * (n - 1) + 0x40 * m)
-#define SWRM_DP_PORT_HCTRL_BANK(n, m)	(0x1134 + 0x100 * (n - 1) + 0x40 * m)
-#define SWRM_DP_BLOCK_CTRL3_BANK(n, m)	(0x1138 + 0x100 * (n - 1) + 0x40 * m)
-#define SWRM_DP_SAMPLECTRL2_BANK(n, m)	(0x113C + 0x100 * (n - 1) + 0x40 * m)
-#define SWRM_DIN_DPn_PCM_PORT_CTRL(n)	(0x1054 + 0x100 * (n - 1))
+
+#define SWRM_DPn_PORT_CTRL_BANK(offset, n, m)	(offset + 0x100 * (n - 1) + 0x40 * m)
+#define SWRM_DPn_PORT_CTRL_2_BANK(offset, n, m)	(offset + 0x100 * (n - 1) + 0x40 * m)
+#define SWRM_DPn_BLOCK_CTRL_1(offset, n)	(offset + 0x100 * (n - 1))
+#define SWRM_DPn_BLOCK_CTRL2_BANK(offset, n, m)	(offset + 0x100 * (n - 1) + 0x40 * m)
+#define SWRM_DPn_PORT_HCTRL_BANK(offset,  n, m)	(offset + 0x100 * (n - 1) + 0x40 * m)
+#define SWRM_DPn_BLOCK_CTRL3_BANK(offset, n, m)	(offset + 0x100 * (n - 1) + 0x40 * m)
+#define SWRM_DPn_SAMPLECTRL2_BANK(offset, n, m)	(offset + 0x100 * (n - 1) + 0x40 * m)
+
 #define SWR_V1_3_MSTR_MAX_REG_ADDR				0x1740
 #define SWR_V2_0_MSTR_MAX_REG_ADDR				0x50ac
 
@@ -171,6 +172,13 @@ enum {
 	SWRM_REG_CMD_FIFO_RD_CMD,
 	SWRM_REG_CMD_FIFO_STATUS,
 	SWRM_REG_CMD_FIFO_RD_FIFO_ADDR,
+	SWRM_OFFSET_DP_PORT_CTRL_BANK,
+	SWRM_OFFSET_DP_PORT_CTRL_2_BANK,
+	SWRM_OFFSET_DP_BLOCK_CTRL_1,
+	SWRM_OFFSET_DP_BLOCK_CTRL2_BANK,
+	SWRM_OFFSET_DP_PORT_HCTRL_BANK,
+	SWRM_OFFSET_DP_BLOCK_CTRL3_BANK,
+	SWRM_OFFSET_DP_SAMPLECTRL2_BANK,
 };
 
 struct qcom_swrm_ctrl {
@@ -230,6 +238,13 @@ static const unsigned int swrm_v1_3_reg_layout[] = {
 	[SWRM_REG_CMD_FIFO_RD_CMD] = SWRM_V1_3_CMD_FIFO_RD_CMD,
 	[SWRM_REG_CMD_FIFO_STATUS] = SWRM_V1_3_CMD_FIFO_STATUS,
 	[SWRM_REG_CMD_FIFO_RD_FIFO_ADDR] = SWRM_V1_3_CMD_FIFO_RD_FIFO_ADDR,
+	[SWRM_OFFSET_DP_PORT_CTRL_BANK]		= 0x1124,
+	[SWRM_OFFSET_DP_PORT_CTRL_2_BANK]	= 0x1128,
+	[SWRM_OFFSET_DP_BLOCK_CTRL_1]		= 0x112c,
+	[SWRM_OFFSET_DP_BLOCK_CTRL2_BANK]	= 0x1130,
+	[SWRM_OFFSET_DP_PORT_HCTRL_BANK]	= 0x1134,
+	[SWRM_OFFSET_DP_BLOCK_CTRL3_BANK]	= 0x1138,
+	[SWRM_OFFSET_DP_SAMPLECTRL2_BANK]	= 0x113c,
 };
 
 static const struct qcom_swrm_data swrm_v1_3_data = {
@@ -264,6 +279,13 @@ static const unsigned int swrm_v2_0_reg_layout[] = {
 	[SWRM_REG_CMD_FIFO_RD_CMD] = SWRM_V2_0_CMD_FIFO_RD_CMD,
 	[SWRM_REG_CMD_FIFO_STATUS] = SWRM_V2_0_CMD_FIFO_STATUS,
 	[SWRM_REG_CMD_FIFO_RD_FIFO_ADDR] = SWRM_V2_0_CMD_FIFO_RD_FIFO_ADDR,
+	[SWRM_OFFSET_DP_PORT_CTRL_BANK]		= 0x1124,
+	[SWRM_OFFSET_DP_PORT_CTRL_2_BANK]	= 0x1128,
+	[SWRM_OFFSET_DP_BLOCK_CTRL_1]		= 0x112c,
+	[SWRM_OFFSET_DP_BLOCK_CTRL2_BANK]	= 0x1130,
+	[SWRM_OFFSET_DP_PORT_HCTRL_BANK]	= 0x1134,
+	[SWRM_OFFSET_DP_BLOCK_CTRL3_BANK]	= 0x1138,
+	[SWRM_OFFSET_DP_SAMPLECTRL2_BANK]	= 0x113c,
 };
 
 static const struct qcom_swrm_data swrm_v2_0_data = {
@@ -964,10 +986,10 @@ static int qcom_swrm_port_params(struct sdw_bus *bus,
 				 unsigned int bank)
 {
 	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
+	u32 offset = ctrl->reg_layout[SWRM_OFFSET_DP_BLOCK_CTRL_1];
 
-	return ctrl->reg_write(ctrl, SWRM_DP_BLOCK_CTRL_1(p_params->num),
-			       p_params->bps - 1);
-
+	return ctrl->reg_write(ctrl, SWRM_DPn_BLOCK_CTRL_1(offset, p_params->num),
+				p_params->bps - 1);
 }
 
 static int qcom_swrm_transport_params(struct sdw_bus *bus,
@@ -977,9 +999,11 @@ static int qcom_swrm_transport_params(struct sdw_bus *bus,
 	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
 	struct qcom_swrm_port_config *pcfg;
 	u32 value;
-	int reg = SWRM_DP_PORT_CTRL_BANK((params->port_num), bank);
+	int reg, offset = ctrl->reg_layout[SWRM_OFFSET_DP_PORT_CTRL_BANK];
 	int ret;
 
+	reg = SWRM_DPn_PORT_CTRL_BANK(offset, params->port_num, bank);
+
 	pcfg = &ctrl->pconfig[params->port_num];
 
 	value = pcfg->off1 << SWRM_DP_PORT_CTRL_OFFSET1_SHFT;
@@ -991,15 +1015,19 @@ static int qcom_swrm_transport_params(struct sdw_bus *bus,
 		goto err;
 
 	if (pcfg->si > 0xff) {
+		offset = ctrl->reg_layout[SWRM_OFFSET_DP_SAMPLECTRL2_BANK];
 		value = (pcfg->si >> 8) & 0xff;
-		reg = SWRM_DP_SAMPLECTRL2_BANK(params->port_num, bank);
+		reg = SWRM_DPn_SAMPLECTRL2_BANK(offset, params->port_num, bank);
+
 		ret = ctrl->reg_write(ctrl, reg, value);
 		if (ret)
 			goto err;
 	}
 
 	if (pcfg->lane_control != SWR_INVALID_PARAM) {
-		reg = SWRM_DP_PORT_CTRL_2_BANK(params->port_num, bank);
+		offset = ctrl->reg_layout[SWRM_OFFSET_DP_PORT_CTRL_2_BANK];
+		reg = SWRM_DPn_PORT_CTRL_2_BANK(offset, params->port_num, bank);
+
 		value = pcfg->lane_control;
 		ret = ctrl->reg_write(ctrl, reg, value);
 		if (ret)
@@ -1007,20 +1035,23 @@ static int qcom_swrm_transport_params(struct sdw_bus *bus,
 	}
 
 	if (pcfg->blk_group_count != SWR_INVALID_PARAM) {
-		reg = SWRM_DP_BLOCK_CTRL2_BANK(params->port_num, bank);
+		offset = ctrl->reg_layout[SWRM_OFFSET_DP_BLOCK_CTRL2_BANK];
+
+		reg = SWRM_DPn_BLOCK_CTRL2_BANK(offset, params->port_num, bank);
+
 		value = pcfg->blk_group_count;
 		ret = ctrl->reg_write(ctrl, reg, value);
 		if (ret)
 			goto err;
 	}
 
-	if (pcfg->hstart != SWR_INVALID_PARAM
-			&& pcfg->hstop != SWR_INVALID_PARAM) {
-		reg = SWRM_DP_PORT_HCTRL_BANK(params->port_num, bank);
+	offset = ctrl->reg_layout[SWRM_OFFSET_DP_PORT_HCTRL_BANK];
+	reg = SWRM_DPn_PORT_HCTRL_BANK(offset, params->port_num, bank);
+
+	if (pcfg->hstart != SWR_INVALID_PARAM && pcfg->hstop != SWR_INVALID_PARAM) {
 		value = (pcfg->hstop << 4) | pcfg->hstart;
 		ret = ctrl->reg_write(ctrl, reg, value);
 	} else {
-		reg = SWRM_DP_PORT_HCTRL_BANK(params->port_num, bank);
 		value = (SWR_HSTOP_MAX_VAL << 4) | SWR_HSTART_MIN_VAL;
 		ret = ctrl->reg_write(ctrl, reg, value);
 	}
@@ -1029,7 +1060,8 @@ static int qcom_swrm_transport_params(struct sdw_bus *bus,
 		goto err;
 
 	if (pcfg->bp_mode != SWR_INVALID_PARAM) {
-		reg = SWRM_DP_BLOCK_CTRL3_BANK(params->port_num, bank);
+		offset = ctrl->reg_layout[SWRM_OFFSET_DP_BLOCK_CTRL3_BANK];
+		reg = SWRM_DPn_BLOCK_CTRL3_BANK(offset, params->port_num, bank);
 		ret = ctrl->reg_write(ctrl, reg, pcfg->bp_mode);
 	}
 
@@ -1041,9 +1073,12 @@ static int qcom_swrm_port_enable(struct sdw_bus *bus,
 				 struct sdw_enable_ch *enable_ch,
 				 unsigned int bank)
 {
-	u32 reg = SWRM_DP_PORT_CTRL_BANK(enable_ch->port_num, bank);
+	u32 reg;
 	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
 	u32 val;
+	u32 offset = ctrl->reg_layout[SWRM_OFFSET_DP_PORT_CTRL_BANK];
+
+	reg = SWRM_DPn_PORT_CTRL_BANK(offset, enable_ch->port_num, bank);
 
 	ctrl->reg_read(ctrl, reg, &val);
 
-- 
2.50.0

