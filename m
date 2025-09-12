Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F2C2D46B1
	for <linux-sound@vger.kernel.org>; Fri, 12 Sep 2025 08:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757665961; cv=none; b=QccpyCpRUezA9O4wanCh22Dmq6ANtVusj7rd55/LyQySwaaFjIibo0R3EaXD+f9qyy067au9kyVw20HA6LfDmYJET/wj4Ue8StBUcpU30qGjolUq47tFS3ObC5UnZRuvx0k32C7+7BPPdAWkAQXqQidnEXv7Ecggr43iZnpQLsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757665961; c=relaxed/simple;
	bh=KgmQ/hSkjgUTEMmMZfE98tC2KSb+hCTHMqCZHrCUBmY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W94zPqzZIR14FBE8eblA/dhH4EXRyM0Kyrql50vuGcd7l6GM+osFySerVi9fAkRV57eb9CqQ1YVthZhOBfbRQ5AVp+vGaSrAXRkdefb6QKhx86J77g+lh7xwbfQXkCiA1eyqHsplhVTjvnj3iMpLZHBl/i7D0KXnm0YxYQUXMpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jhvp49I5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jhvp49I5"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C71oeO025747
	for <linux-sound@vger.kernel.org>; Fri, 12 Sep 2025 08:32:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TodlzAk3PWj
	NeAOH4IrU296rtTk0ONyPMQfQ4YQJa5U=; b=jhvp49I58uLfG+HrfuQMCZmfBt0
	bmHX6fD4KuKoyXl2eSz6lh9GRcphp6+Q53dSvNcjjnf5jHx29pzp/Zdu8W1nKnpN
	c08Ft7RhS+lfP6UiLFJFiB/1xsB8fE0Iq+cLJtDWptzdyA0O6yszL8a+/+++sN51
	QCAYtRypeCrBt0VBqxwLyBAyNgdkSGUg8dB+SePdStz+Z2LwlT7EHyMmGaE151+1
	g4mfQv7ZxDCBLQvtqg7561r07xsqrqp48u+w59SZwbM9z9mf88RfaMWJSS0AI6fT
	TIvXbiEKP+6AJQEuIvKj+/dnnHFoK9ajwlhzzFTIdeoexUYxPWs24j6G10Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj12sxc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 12 Sep 2025 08:32:38 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-71ffd145fa9so39782296d6.2
        for <linux-sound@vger.kernel.org>; Fri, 12 Sep 2025 01:32:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757665957; x=1758270757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TodlzAk3PWjNeAOH4IrU296rtTk0ONyPMQfQ4YQJa5U=;
        b=u7f94HXxLjNxWdYnUNwq5cfTf8ni7Ie16NkJIokBw30B5sR7I5STy2o5hg0hav5nqF
         L+dqka0SFJg/5R41Ti4TujaphVjMcBRSkyPSiuZGj4DuR/4GXDKdn/3cSZiOwtVzO6iY
         J6ZRUTUqQPW+bgN64W7VyMxxwdDhyjk0tckQL1+W1+tq9wgM6aZ3EiX014wx1PIZiMNt
         YLhFxbwb72wQKs0QBm1yZJAA+rNGk7506udcwuK0jJcbF8GSRSxQYYAdxb5wuVx8Td+x
         2vcowiIy+3nf20H7OjDG881U+xNASAblk8gnzxJ1NSmPdh9KtrwU+CUxLGMzDYm04HYp
         jbuw==
X-Forwarded-Encrypted: i=1; AJvYcCXjpaoAzee7GZ/b/UAtzB2R8BqdXX0QNfiZ72SBIisStR0IFPgO0bRMG5d/s1OA+ova24qijvrvhRUgKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt0s9AcudrZL1PhhDeYDlgzukqLsw6oxg/YoSNioy8EJffDS3N
	BfsnbINul+PXaolIG2xZTF+asC8C6H1dMdTH3GjyG+ByIIu+s+Bd1CA6iPL7/o/czxmV84OoXN8
	0bBEKVM6DW6cEcTTqQ15bJbbUO1XY7M8K7K9CxUKp0/O7sfCZMfY4wtJUFgw7VSw17w==
X-Gm-Gg: ASbGncvlt2cdWSxPvas6jgCgl8auGpcEfEKLXppCtxSbehOy39z5u/7S1u5po7+BizG
	TB0k1qM3OMleAJNw5OTizPbM/49V8xzlFb9k9s8M6+GGzQJ5QdrQARVFXBbzo/7PoZiUQKFV+G7
	2tF7ZHEWZ9ndU7pEQcEAUiCtFpiRr3C1dDT/Iz6qFuBcCCYu6u1zVUMER/vGoH1OyIEzxVnGPPy
	WlZP1I5dsXx6d3H3Lq5X7vs315uwXDnIpKLT0F8YMGXNpd8vJHF/Y7d+cAISP8UuZs9rUhbleU2
	42UoQN3HQZs68k4/2ZmuRF9JLRcilB3Du5fkKSMeAmbCEjic8nhzVw==
X-Received: by 2002:a05:6214:2aa2:b0:728:a449:2187 with SMTP id 6a1803df08f44-767c506125emr25387486d6.62.1757665957330;
        Fri, 12 Sep 2025 01:32:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGnbCRTuZ3Am14fVs/obm0V6pQOSiYhtntw03Q1ZVSbes8Tu/EjmCay9Xcu5Qd4Zj/7NUdRg==
X-Received: by 2002:a05:6214:2aa2:b0:728:a449:2187 with SMTP id 6a1803df08f44-767c506125emr25387346d6.62.1757665956886;
        Fri, 12 Sep 2025 01:32:36 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e017c1dd3sm31247265e9.2.2025.09.12.01.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 01:32:36 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, krzk+dt@kernel.org, vkoul@kernel.org
Cc: conor+dt@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 4/7] soundwire: qcom: deprecate qcom,din/out-ports
Date: Fri, 12 Sep 2025 09:32:22 +0100
Message-ID: <20250912083225.228778-5-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: NKuWCgDHGHZ7YE8Zik8FCe5bAIrPi-zT
X-Proofpoint-GUID: NKuWCgDHGHZ7YE8Zik8FCe5bAIrPi-zT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfXz4cCTV2WAHPf
 QCEvqhkP+mhdCUCbsnAChwXn85pJQ26EiQT0bWCtRWm2lStvViZJM7EdhakcBa0QXTR4o9Dtqo6
 X52h2/4sqQoeIN6Jk+ID5fjNn+rjixypqaYBglQ7PcmrQdsi9wOw9JKsIQWXJeYTDcNCx/Epqg5
 mEskAjL04SgafEVHluR8zlt1GD7LAQ2gcglzWBIJhUyGPdl0oJ3/GyoMqD13gx+3Ix2O4G6sfRg
 dEzqS+POqIMTYF0m9BtINUo1PMI7J5T6p6Ftv9NXd9xgoUc82RZ5aIHQAaIH6DeHGAbkSWftwyN
 wNBiFb6MJpDU0rT2CET1FKZ28KmE+zFJ/GeA14WlxbcBD8vacITbL8ssDrxiU9cPSEmbX76i+4+
 SvTLrWQs
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68c3daa6 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=nfbzo9wS4cg9a-Y7DkQA:9
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_03,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024

Number of input and output ports can be dynamically read from the
controller registers, getting this value from Device Tree is redundant
and potentially lead to bugs.

Remove the code parsing this property along with marking this as
deprecated in device tree bindings.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/soundwire/qcom.c | 141 +++++++++++++++++----------------------
 1 file changed, 62 insertions(+), 79 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index f3ad53ec6e76..9e6dc43c1112 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -128,7 +128,6 @@
 #define MAX_FREQ_NUM						1
 #define TIMEOUT_MS						100
 #define QCOM_SWRM_MAX_RD_LEN					0x1
-#define QCOM_SDW_MAX_PORTS					14
 #define DEFAULT_CLK_FREQ					9600000
 #define SWRM_MAX_DAIS						0xF
 #define SWR_INVALID_PARAM					0xFF
@@ -195,6 +194,7 @@ struct qcom_swrm_ctrl {
 	int wake_irq;
 	int num_din_ports;
 	int num_dout_ports;
+	int nports;
 	int cols_index;
 	int rows_index;
 	unsigned long port_mask;
@@ -202,7 +202,7 @@ struct qcom_swrm_ctrl {
 	u8 rcmd_id;
 	u8 wcmd_id;
 	/* Port numbers are 1 - 14 */
-	struct qcom_swrm_port_config pconfig[QCOM_SDW_MAX_PORTS + 1];
+	struct qcom_swrm_port_config *pconfig;
 	struct sdw_stream_runtime *sruntime[SWRM_MAX_DAIS];
 	enum sdw_slave_status status[SDW_MAX_DEVICES + 1];
 	int (*reg_read)(struct qcom_swrm_ctrl *ctrl, int reg, u32 *val);
@@ -1153,7 +1153,6 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
 				       struct snd_pcm_hw_params *params,
 				       int direction)
 {
-	struct sdw_port_config pconfig[QCOM_SDW_MAX_PORTS];
 	struct sdw_stream_config sconfig;
 	struct sdw_master_runtime *m_rt;
 	struct sdw_slave_runtime *s_rt;
@@ -1162,6 +1161,10 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
 	unsigned long *port_mask;
 	int maxport, pn, nports = 0, ret = 0;
 	unsigned int m_port;
+	struct sdw_port_config *pconfig __free(kfree) = kcalloc(ctrl->nports,
+								sizeof(*pconfig), GFP_KERNEL);
+	if (!pconfig)
+		return -ENOMEM;
 
 	if (direction == SNDRV_PCM_STREAM_CAPTURE)
 		sconfig.direction = SDW_DATA_DIR_TX;
@@ -1186,8 +1189,7 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
 			continue;
 
 		port_mask = &ctrl->port_mask;
-		maxport = ctrl->num_dout_ports + ctrl->num_din_ports;
-
+		maxport = ctrl->nports;
 
 		list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_node) {
 			slave = s_rt->slave;
@@ -1347,17 +1349,8 @@ static int qcom_swrm_register_dais(struct qcom_swrm_ctrl *ctrl)
 static int qcom_swrm_get_port_config(struct qcom_swrm_ctrl *ctrl)
 {
 	struct device_node *np = ctrl->dev->of_node;
-	u8 off1[QCOM_SDW_MAX_PORTS];
-	u8 off2[QCOM_SDW_MAX_PORTS];
-	u16 si[QCOM_SDW_MAX_PORTS];
-	u8 bp_mode[QCOM_SDW_MAX_PORTS] = { 0, };
-	u8 hstart[QCOM_SDW_MAX_PORTS];
-	u8 hstop[QCOM_SDW_MAX_PORTS];
-	u8 word_length[QCOM_SDW_MAX_PORTS];
-	u8 blk_group_count[QCOM_SDW_MAX_PORTS];
-	u8 lane_control[QCOM_SDW_MAX_PORTS];
-	int i, ret, nports, val;
-	bool si_16 = false;
+	struct qcom_swrm_port_config *pcfg;
+	int i, ret, val;
 
 	ctrl->reg_read(ctrl, SWRM_COMP_PARAMS, &val);
 
@@ -1365,88 +1358,78 @@ static int qcom_swrm_get_port_config(struct qcom_swrm_ctrl *ctrl)
 	ctrl->num_din_ports = FIELD_GET(SWRM_COMP_PARAMS_DIN_PORTS_MASK, val);
 
 	ret = of_property_read_u32(np, "qcom,din-ports", &val);
-	if (ret)
-		return ret;
-
-	if (val > ctrl->num_din_ports)
-		return -EINVAL;
+	if (!ret) { /* only if present */
+		if (val != ctrl->num_din_ports) {
+			dev_err(ctrl->dev, "din-ports (%d) mismatch with controller (%d)",
+				val, ctrl->num_din_ports);
+		}
 
-	ctrl->num_din_ports = val;
+		ctrl->num_din_ports = val;
+	}
 
 	ret = of_property_read_u32(np, "qcom,dout-ports", &val);
-	if (ret)
-		return ret;
+	if (!ret) { /* only if present */
+		if (val != ctrl->num_dout_ports) {
+			dev_err(ctrl->dev, "dout-ports (%d) mismatch with controller (%d)",
+				val, ctrl->num_dout_ports);
+		}
 
-	if (val > ctrl->num_dout_ports)
-		return -EINVAL;
+		ctrl->num_dout_ports = val;
+	}
 
-	ctrl->num_dout_ports = val;
+	ctrl->nports = ctrl->num_dout_ports + ctrl->num_din_ports;
 
-	nports = ctrl->num_dout_ports + ctrl->num_din_ports;
-	if (nports > QCOM_SDW_MAX_PORTS)
-		return -EINVAL;
+	ctrl->pconfig = devm_kcalloc(ctrl->dev, ctrl->nports + 1,
+					sizeof(*ctrl->pconfig), GFP_KERNEL);
+	if (!ctrl->pconfig)
+		return -ENOMEM;
 
-	/* Valid port numbers are from 1-14, so mask out port 0 explicitly */
 	set_bit(0, &ctrl->port_mask);
+	/* Valid port numbers are from 1, so mask out port 0 explicitly */
+	for (i = 0; i < ctrl->nports; i++) {
+		pcfg = &ctrl->pconfig[i + 1];
 
-	ret = of_property_read_u8_array(np, "qcom,ports-offset1",
-					off1, nports);
-	if (ret)
-		return ret;
-
-	ret = of_property_read_u8_array(np, "qcom,ports-offset2",
-					off2, nports);
-	if (ret)
-		return ret;
-
-	ret = of_property_read_u8_array(np, "qcom,ports-sinterval-low",
-					(u8 *)si, nports);
-	if (ret) {
-		ret = of_property_read_u16_array(np, "qcom,ports-sinterval",
-						 si, nports);
+		ret = of_property_read_u8_index(np, "qcom,ports-offset1", i, &pcfg->off1);
 		if (ret)
 			return ret;
-		si_16 = true;
-	}
 
-	ret = of_property_read_u8_array(np, "qcom,ports-block-pack-mode",
-					bp_mode, nports);
-	if (ret) {
-		if (ctrl->version <= SWRM_VERSION_1_3_0)
-			memset(bp_mode, SWR_INVALID_PARAM, QCOM_SDW_MAX_PORTS);
-		else
+		ret = of_property_read_u8_index(np, "qcom,ports-offset2", i, &pcfg->off2);
+		if (ret)
 			return ret;
-	}
 
-	memset(hstart, SWR_INVALID_PARAM, QCOM_SDW_MAX_PORTS);
-	of_property_read_u8_array(np, "qcom,ports-hstart", hstart, nports);
+		ret = of_property_read_u8_index(np, "qcom,ports-sinterval-low", i, (u8 *)&pcfg->si);
+		if (ret) {
+			ret = of_property_read_u16_index(np, "qcom,ports-sinterval", i, &pcfg->si);
+			if (ret)
+				return ret;
+		}
+
+		ret = of_property_read_u8_index(np, "qcom,ports-block-pack-mode",
+						i, &pcfg->bp_mode);
+		if (ret) {
+			if (ctrl->version <= SWRM_VERSION_1_3_0)
+				pcfg->bp_mode = SWR_INVALID_PARAM;
+			else
+				return ret;
+		}
 
-	memset(hstop, SWR_INVALID_PARAM, QCOM_SDW_MAX_PORTS);
-	of_property_read_u8_array(np, "qcom,ports-hstop", hstop, nports);
+		/* Optional properties */
+		pcfg->hstart = SWR_INVALID_PARAM;
+		pcfg->hstop = SWR_INVALID_PARAM;
+		pcfg->word_length = SWR_INVALID_PARAM;
+		pcfg->blk_group_count = SWR_INVALID_PARAM;
+		pcfg->lane_control = SWR_INVALID_PARAM;
 
-	memset(word_length, SWR_INVALID_PARAM, QCOM_SDW_MAX_PORTS);
-	of_property_read_u8_array(np, "qcom,ports-word-length", word_length, nports);
+		of_property_read_u8_index(np, "qcom,ports-hstart", i, &pcfg->hstart);
 
-	memset(blk_group_count, SWR_INVALID_PARAM, QCOM_SDW_MAX_PORTS);
-	of_property_read_u8_array(np, "qcom,ports-block-group-count", blk_group_count, nports);
+		of_property_read_u8_index(np, "qcom,ports-hstop", i, &pcfg->hstop);
 
-	memset(lane_control, SWR_INVALID_PARAM, QCOM_SDW_MAX_PORTS);
-	of_property_read_u8_array(np, "qcom,ports-lane-control", lane_control, nports);
+		of_property_read_u8_index(np, "qcom,ports-word-length", i, &pcfg->word_length);
 
-	for (i = 0; i < nports; i++) {
-		/* Valid port number range is from 1-14 */
-		if (si_16)
-			ctrl->pconfig[i + 1].si = si[i];
-		else
-			ctrl->pconfig[i + 1].si = ((u8 *)si)[i];
-		ctrl->pconfig[i + 1].off1 = off1[i];
-		ctrl->pconfig[i + 1].off2 = off2[i];
-		ctrl->pconfig[i + 1].bp_mode = bp_mode[i];
-		ctrl->pconfig[i + 1].hstart = hstart[i];
-		ctrl->pconfig[i + 1].hstop = hstop[i];
-		ctrl->pconfig[i + 1].word_length = word_length[i];
-		ctrl->pconfig[i + 1].blk_group_count = blk_group_count[i];
-		ctrl->pconfig[i + 1].lane_control = lane_control[i];
+		of_property_read_u8_index(np, "qcom,ports-block-group-count",
+					i, &pcfg->blk_group_count);
+
+		of_property_read_u8_index(np, "qcom,ports-lane-control", i, &pcfg->lane_control);
 	}
 
 	return 0;
-- 
2.50.0

