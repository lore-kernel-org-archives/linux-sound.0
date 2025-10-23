Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7882630E82D
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 10:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761215178; cv=none; b=XqdiN3SOcwEhFxc1emiowMXfoEc73ebhbMUcla0YyOERTrcHm5bFuipBulna5ZQiRPWbB/wJMxJuIWmb3XlP7QzxAODEojmip9OaALL0bGPY0r79Azib/CSAVf4jGlvllzEMiyCtfU1ijr0YgsaysZaQO8Z65KxkF5mz/nRPeKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761215178; c=relaxed/simple;
	bh=SejOUWbTAy/5ROULM2ELVlqM+FZ6nMOhFi6ugNEQavQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o99Lc9+BtjoJ7koRzWLnud3pOcWllIoTPlodrxldqCD//5FswrqK2OSqsCO9hhYxafK8eofOIhuAxheMO25OPwbjGWNDe+AKNSwgS4ncV8rjlXg7fbvJLc08rxyZQDlssHLjXJgwHhxji+sb+RfLgOrAoe5zHdN74tGcRxAKvnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D2dLk21D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D2dLk21D"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6rrQn028865
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 10:26:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FajSm68u81z
	o6yJDj0yJMvUAWFriu/OwYH2XhH8JyXE=; b=D2dLk21D+aPzeguIg6XY3m9IK+x
	vNKSrzGTtSzyNDixO9MQPNzn9eQr4EOPkOMJTYKcSVHBzyYi/Mw1QlOprTyAYB4L
	EAoZVidPNo8NvmCdAyu81ha9+g1GCd80AiTCJg2P4PhEiDvAHWkxZOUikzaS6cxt
	cdoi9GDSlDrQTT60zYx9g9DfHuEpc4hazA5wFhhHoT6O3IDyuZj2D1NdUwXNFVos
	n8Vc546wV4VhKUm5h87Xgu96Gq8wTmTwbRD6QI2ISEaJ6oVV7vNPle1PiSUYzswU
	CJ1xTP+K85TjZQnwIk3g1IOfdkClPCzu827lapjBlCf1XICqIxQO8IVuFDg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49w08wdp1y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 10:26:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e8a3d0fb09so8808341cf.1
        for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 03:26:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761215174; x=1761819974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FajSm68u81zo6yJDj0yJMvUAWFriu/OwYH2XhH8JyXE=;
        b=s4lkw94QS4H/qXBNRgHs31FWm4mS8HzktudPl+yCd8WRLzj8ucK6+zzCwnZU9GkE0d
         t2k5HQxuDXfwVPuwAlsPypBYGGJRxcdkOB1lW0zGa6bVVz21XRIoPdbaIkLmcK/hPUUy
         7UFt67xXr1y8vn8oWMPth1d+8iBurUtxeOZwMEr84aSHGMqfKJGl1MtC9mCghqHyFFVx
         rG850B9yJNB91EcJcUyM9lJjlGw6HBbItPP//3L8Mz4W7wIPonPYDARqWKxW/O+ZGTFX
         Zgc80NS6u7lPIz2Iw9iI3wGZ1VWedChxqL9Txf0Zc5l7m0L+QW9VHYo4AZI7S9veiwAk
         LwwA==
X-Forwarded-Encrypted: i=1; AJvYcCVU+hDGiwwtiqV5Uo7hvERixqzGumZdE26zoSP+H8mBpSPJx+NxszmWncMsU/5zaZf8DatCEIFo9Z8N4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOTOsnSZqt90k7iA+cv05g2kn9Pqp4Rf0VGmP5oScriLHer+xX
	HbZj/mpQxynsPczfpazVSaRkkcqn43wMv9u4u2ac+33gWucjXmMS2/rIgeR6qnKfk8U/ENGzkpc
	lx78dQMO1p8xkJVYNbLELy1axueoEA5Ubzz6/1je5snFIbgpK8R+yoCFbJxKmFt+26qjAFzOmDg
	==
X-Gm-Gg: ASbGncudE33/mu0VpMKXii6JU2utLP3vFfNBBNYved/jE0nPWxTHZnUyoc8oA2tULPd
	ix/QC7qW/CZQB2FGccKlYSeU/p5jLjvvIBY+t1IUfCzdQPQ1Wjs456b9FxWVVtmh05qEmMUTPw5
	+NpC+qcrwWeRpSqpK4UZ+ZPdunABzcXLzIWC0H2NlATWumTw54dp3jnuVqoUgRSChhi58iKN235
	9yO+N/UpTMJQ6MHvHpv6Al34bSD5eb+LJGAl82kqb5vGH0RjYB2mZtTJNEkV2Q6BsiFDF+6Ah4/
	f6g//4EDGl97D218JRLPCVlj1kRqSU59P6szE55jt/Fo7OMlYr4dIYNat4XZOV/AhGU7kfyvRdS
	2R2N4VYko1Kf6
X-Received: by 2002:a05:622a:1114:b0:4e8:aa11:586a with SMTP id d75a77b69052e-4e8aa115bbfmr248237601cf.53.1761215174261;
        Thu, 23 Oct 2025 03:26:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLF+Hw8CW8MbahSfA8tACDLOuC6rzyi9L5cROc7gcuF/UeO13IMGr98DKx00AXgM1vVR7AVA==
X-Received: by 2002:a05:622a:1114:b0:4e8:aa11:586a with SMTP id d75a77b69052e-4e8aa115bbfmr248237361cf.53.1761215173810;
        Thu, 23 Oct 2025 03:26:13 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c427f77bsm92220685e9.3.2025.10.23.03.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 03:26:13 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 15/20] ASoc: qcom: q6prm: Use automatic cleanup of kfree()
Date: Thu, 23 Oct 2025 11:24:39 +0100
Message-ID: <20251023102444.88158-16-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023102444.88158-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251023102444.88158-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 1AAVNZhjVideaOOPNqhgF0IywVkZ6z5z
X-Proofpoint-GUID: 1AAVNZhjVideaOOPNqhgF0IywVkZ6z5z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE5MDA5MCBTYWx0ZWRfX4TrVSWyxhrlN
 u1IETRJCd/1LqbVvxQJ4EBG0AkoEq2Ld1nFvHm6rU7EV/x/4p0AvoR1ufdEDtPeQOxzGfP4s/pm
 QJYxlzthWXhEHYErZOBfxvOTJMs77Kilp3w4tSkczsH6o2DxdUiLO0MSKGLo/pgOmNEc2oCqRkB
 IVgzYTd8r0tzQ9xSl0emPOtJAxCb3mJILAnppgwwBgpo1j8tGVulkdYbY+Bwt7PMkwOS5qh840K
 GDRr2+C21tX8m4nWYfuddEgbjBdZKg9kjHS2g20Jx61FhAVF+MdBzsLufiaQvmStByVdrrgQ7ZB
 VQAjaeKyDoEZGCE2jT1hnq+ERSv0GErq5hipB7Pi1LQn8k/Pln4O7x7OZ6OOWae207OgMPdVHRM
 7E0WwSNRlfSe3Yo22m3WywQPcD9oFQ==
X-Authority-Analysis: v=2.4 cv=V5NwEOni c=1 sm=1 tr=0 ts=68fa02c7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=XDFA_cjcnCjOe_gdXw4A:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510190090

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

