Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82DA62D6E40
	for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 08:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760691396; cv=none; b=mQG8j/tQyv5ZFpNAMqFRled8Od6XlaoXDxTCaubfKGG0x/beROJFr1nQIPUhbdRww0wWmuFHGYL/zCAj9d7DYEOTmcSgRNNrKCZ9EL8J1AD7ZHOQhb+oz0N86wk889lxfsJoRmbmVZzgHyvNPeZ3jF9uimeBPjyhIEc6bbX+e0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760691396; c=relaxed/simple;
	bh=SejOUWbTAy/5ROULM2ELVlqM+FZ6nMOhFi6ugNEQavQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TPnRxle6aA4c+4SzWmiGnG2tyfQb20hugcwzwSSl/l0JxLWHBHGbKsG9jPUeKZW7VTvnks3Udek9ZZvQlz2aQsUfYyGVaBYh37XxlbRY8d3847p3YmFxyBAysP19ylgkFPcjyYd0blCzkMbxgAqgT1Es4vGU26BqeHLPxjw5dBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pnZsnm0+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pnZsnm0+"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59H7pg4Q009599
	for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 08:56:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FajSm68u81z
	o6yJDj0yJMvUAWFriu/OwYH2XhH8JyXE=; b=pnZsnm0+Hb9oR1wbNi8+epvF73q
	OKaznn8WpO/oRbhykSLFLstqhHiO3x2ZwjOa7ZdSIlIygv8mXovtCDE/ziu1uF9R
	rTzteedER6JV0Pbc3uFee0uvk8SDWaKhxtmQn+BGM1nvBSoKsPMDyM6o9DwaPdqr
	ggWcZzojk5J65TQccRFEKQbAMHA/JeZfNoOQ/wTP2g7Nph/J+7B8V5LveME1vXdc
	db/8dKg6VDn6JzfhdV5W1i47GpUffrB5yTCz1UjonGjlnVAA7lxkaX2yap7IokGT
	S4ZW74LFaMR/s3oMrVA0q4q+3keU2KujX5kyG1uq+fCneU7pQzt5fmSC72A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0cbeen-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 08:56:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-88f7eff9d5fso626328585a.0
        for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 01:56:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760691392; x=1761296192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FajSm68u81zo6yJDj0yJMvUAWFriu/OwYH2XhH8JyXE=;
        b=s4xrFkV8X6/4gxKfdaZVU7mfh/O68B1m9gJDHknaoMkXK20eEPTMUQA7YbcGlWMsNr
         IfXIem26WkPqy6TMHtDq8fWk3f0BUeSsEyTk1FjLhK9B9taVw//xc5X6ciP5wMRUb1Ay
         0JaZFRxeZ8EW4DTfmLxDtUU2EhCUKSjcF5U0ZzqFyUEFkexT02GehESTAJXc0MhGityJ
         oQaI1Y5wp9zXxiSrRbCq94VpGz9VDm68cSZrOfl99w5oxEN/WUYaj5RcMNBjeQ0MKxTW
         LPoae0ZOWCXU12qaSUrwsseEHY2odBWGZ9XyvrWSRL/YDLNdOxddANp13zM/D6BKotdd
         W8WA==
X-Forwarded-Encrypted: i=1; AJvYcCXfk/3yrXCaTlxKhaGqkQCqjwq8XPGKZW42vS2B4Ib9YfgSLqlwOXKGJioOG8Rzx11q4UzBlECcgScp0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXukRWvIzHdxRDAmyKvhmRkBDJS2uFWsXn7Xy0c7UICKY0QSj5
	09Y/ac5VRi39L105sIja7mfRVIiRzuTs+wl9+HablHvoaaA5145TwDcwqndJ16agKnM0XQzRr7P
	BoD0gklGruz0N847pFZ3G1M1mkTufFZlmtY9ZX/DaQRjjx+1ExqkbjlXoa34Yb+7sZw==
X-Gm-Gg: ASbGncsGMg9S1KvTKW0swWoqs1dKBKOwiKes//4evr60o6jwngVbU6arFJR0zsmCHz2
	xRsz5IEXAUby8aT8TeKKDxREbhGikmQyAM8MCihSOzr7tyK2V1CjJ27jvOx8aBzQREH2NT6SYnR
	LFoiSIQLHjiYAZz25tYohf8Kq2yrjAAbG7BR6eMbu3fvn1sOgj7Q0hYWnFk5d5mbkh2VquPFnOv
	pJk/dk0ZOngmAJTTzJBVpapKorjcgNDWW/D6yzjX5nvsN5PJJlfQ90quFKa7BQrpe6D0clDxGcx
	Cb2eludYI+oKiDl7twvXfTWxWNBLjRzXtVVE4P/vNoeOZxhA8vAfpamnCEVqJIwl263lG+m27E9
	FPBA89EfvTNeh
X-Received: by 2002:a05:622a:587:b0:4e6:ed89:c014 with SMTP id d75a77b69052e-4e89d3a24c9mr33927971cf.55.1760691392400;
        Fri, 17 Oct 2025 01:56:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpa5jj8b7IDxg5bOjcWoHZU0OyEot5cPPW8i+SaTkYNxJ8GuekLCvVvjpxwIH4XJzYIX1FWA==
X-Received: by 2002:a05:622a:587:b0:4e6:ed89:c014 with SMTP id d75a77b69052e-4e89d3a24c9mr33927861cf.55.1760691391958;
        Fri, 17 Oct 2025 01:56:31 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4711444d919sm70764985e9.14.2025.10.17.01.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 01:56:31 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 07/12] ASoc: qcom: q6prm: Use automatic cleanup of kfree()
Date: Fri, 17 Oct 2025 09:53:02 +0100
Message-ID: <20251017085307.4325-8-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251017085307.4325-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251017085307.4325-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Qa0QnJZjqkHT2LQoG2sem3z0kzP76GbI
X-Proofpoint-ORIG-GUID: Qa0QnJZjqkHT2LQoG2sem3z0kzP76GbI
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68f204c1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=XDFA_cjcnCjOe_gdXw4A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfX6fGySl5MQDi6
 g1ZDuWaqqW7m1E+lMq9AMKb89WOVKgAfAhqiiNpolIz90DD7jRkmNcOU6U1zv0CHTUGI9pT/slc
 GQpt+1tIGYWhV4sGMSFKCJk65ugy0P2z2e4AgvyHRWGJ152pkrwzB8HamxHMCy8ss9ZHOTcpkSx
 4sPXmFsKIwQR7csreXLti6w+DqLMBAQFjYAU8YPQSYyYsj3qggxmMH988ckFexOmtNS3IeIZ5ej
 6QIFUWz2eBbrx+o7cEuSUOo5K09hyIZc6LGDSQ6rQeiirnrhs87l04gPCbS8kwEfSBDUYDY2ZXF
 FeKdt9snP0Az4ce2hG42ITPOqqvXVZH2Kb04BMNl0mBF5d6WVDScs96/rAPxt/HAFlgfO6/D5mv
 9J2Y2yaKYVwq+g/WN4HBANW+DxtZvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022

Its common pattern in q6dsp code to allocate temporary buffer
to send gpr/apr packets and free at the function exit.
Now this can be simplified via __free(kfree) mechanism.

No functional changes.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6prm.c | 27 ++++++---------------------
 1 file changed, 6 insertions(+), 21 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6prm.c b/sound/soc/qcom/qdsp6/q6prm.c
index 81554d202658..0b8fad0bc832 100644
--- a/sound/soc/qcom/qdsp6/q6prm.c
+++ b/sound/soc/qcom/qdsp6/q6prm.c
@@ -62,8 +62,7 @@ static int q6prm_set_hw_core_req(struct device *dev, uint32_t hw_block_id, bool
 	struct prm_cmd_request_hw_core *req;
 	gpr_device_t *gdev = prm->gdev;
 	uint32_t opcode, rsp_opcode;
-	struct gpr_pkt *pkt;
-	int rc;
+	struct gpr_pkt *pkt __free(kfree) = NULL;
 
 	if (enable) {
 		opcode = PRM_CMD_REQUEST_HW_RSC;
@@ -88,11 +87,7 @@ static int q6prm_set_hw_core_req(struct device *dev, uint32_t hw_block_id, bool
 
 	req->hw_clk_id = hw_block_id;
 
-	rc = q6prm_send_cmd_sync(prm, pkt, rsp_opcode);
-
-	kfree(pkt);
-
-	return rc;
+	return q6prm_send_cmd_sync(prm, pkt, rsp_opcode);
 }
 
 int q6prm_vote_lpass_core_hw(struct device *dev, uint32_t hw_block_id,
@@ -116,8 +111,7 @@ static int q6prm_request_lpass_clock(struct device *dev, int clk_id, int clk_att
 	struct apm_module_param_data *param_data;
 	struct prm_cmd_request_rsc *req;
 	gpr_device_t *gdev = prm->gdev;
-	struct gpr_pkt *pkt;
-	int rc;
+	struct gpr_pkt *pkt __free(kfree) = NULL;
 
 	pkt = audioreach_alloc_cmd_pkt(sizeof(*req), PRM_CMD_REQUEST_HW_RSC, 0, gdev->svc.id,
 				       GPR_PRM_MODULE_IID);
@@ -139,11 +133,7 @@ static int q6prm_request_lpass_clock(struct device *dev, int clk_id, int clk_att
 	req->clock_id.clock_attri = clk_attr;
 	req->clock_id.clock_root = clk_root;
 
-	rc = q6prm_send_cmd_sync(prm, pkt, PRM_CMD_RSP_REQUEST_HW_RSC);
-
-	kfree(pkt);
-
-	return rc;
+	return q6prm_send_cmd_sync(prm, pkt, PRM_CMD_RSP_REQUEST_HW_RSC);
 }
 
 static int q6prm_release_lpass_clock(struct device *dev, int clk_id, int clk_attr, int clk_root,
@@ -153,8 +143,7 @@ static int q6prm_release_lpass_clock(struct device *dev, int clk_id, int clk_att
 	struct apm_module_param_data *param_data;
 	struct prm_cmd_release_rsc *rel;
 	gpr_device_t *gdev = prm->gdev;
-	struct gpr_pkt *pkt;
-	int rc;
+	struct gpr_pkt *pkt __free(kfree) = NULL;
 
 	pkt = audioreach_alloc_cmd_pkt(sizeof(*rel), PRM_CMD_RELEASE_HW_RSC, 0, gdev->svc.id,
 				       GPR_PRM_MODULE_IID);
@@ -173,11 +162,7 @@ static int q6prm_release_lpass_clock(struct device *dev, int clk_id, int clk_att
 	rel->num_clk_id = 1;
 	rel->clock_id.clock_id = clk_id;
 
-	rc = q6prm_send_cmd_sync(prm, pkt, PRM_CMD_RSP_RELEASE_HW_RSC);
-
-	kfree(pkt);
-
-	return rc;
+	return q6prm_send_cmd_sync(prm, pkt, PRM_CMD_RSP_RELEASE_HW_RSC);
 }
 
 int q6prm_set_lpass_clock(struct device *dev, int clk_id, int clk_attr, int clk_root,
-- 
2.51.0

