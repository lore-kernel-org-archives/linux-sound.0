Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017262D543A
	for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 08:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760691392; cv=none; b=i+e+NpGx2HLC7AC263UC9aAY3EvGY1Ybx6qTJDyt1U1zW9DP5pbZuS12wTrPPftkE0tp/siKAe+K4cxkAXUHORgO4y/BBau+vahnE8lciP62iS8KuB2QITcIgD+bLj3XLlJmMer/ZsXf+gZAcaZJxHsM3mTJbBpCUGOBNychDao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760691392; c=relaxed/simple;
	bh=yBNFWfi7nb0NEEgHL4lbgPtCESQBjN8cUW0xWV+hUrs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gIA2dz37tZ9bEacdktaniDkMDPZ3O6LVvcbSlQmnSme8ZBhFxg48D5AHGtq6H8xRKiKLsq13AeDLprcNrBIIdWB/5aXnDKx0/EqEk3YJUkyA33o9peLKSurLQZzPGMWtHcb6QHZTaWt2TFXMz2XWgUiarVlz1i3GTPHdIPhOOmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uww1N1ua; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uww1N1ua"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59H88U9l029768
	for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 08:56:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nDvlp40m+Ni
	viZ7Prwo/9bXT1BrtIsyNq1nV9QUwJU8=; b=Uww1N1uaGi2FFme7I1wBWjSasQC
	UC7KEVUT6M7RGACcM9I6LHdfcAbrDaWnrOCAWRez7gyz//R+I79xTnkjXv6vXJO6
	gISuVFCDPphBj/fD+W6iyRX4f14GizHC/4Pz2WSZNxjPuFWlB4x54tsurhdHneT2
	YBN+tVzXeTd1ysKe3XIuN/TeauwyRSDqejeA/kb5b4A8Q0MRpa6121qXwYvEDUWM
	AAhDAjlNQ9JGx99ooR67w+AZ3SepEJ/kNXNBYLIQ6yQ5AJWFTt5OmoK2Lcr45cGe
	c9peTsMf5rAThxJXa/xgYSnWia06cXffGzLHO2BtQrJFvhJTi+sMukDXc5w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49u1h0u71u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 08:56:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-88d842aa73aso863103785a.0
        for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 01:56:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760691389; x=1761296189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nDvlp40m+NiviZ7Prwo/9bXT1BrtIsyNq1nV9QUwJU8=;
        b=GruZNBRcrPIpaFmYp8uilqZq2iQIc5k5jGyi9vn72wfMlI4afU9tFt/EMm6a9cT8m3
         iVA2AyQqopq24E7ztuDFuF7LGq/DmUOMKPlBnpQVh/kvFdV9m/TtQpbqwf+xYehAJdnx
         XeGm0GuDnA8Nll5fEbVoo1knbmi4xBmzQr9SCh15oo6/fnZzjiDjQBpFxeF/Omm8Hkhd
         pKoXo0RPgOiyY0NHEfKLEgKbvwLz8jafOC4KMNcSBkrGD508jg+PW+HpSOyMpNT8qXS4
         0CAgYJBn5YXT2D70rQUgGi1Ur9+lbuUI8+6/v1V9m1AqCsidC/JBDlW/dJShNdFrCOuy
         Q9bA==
X-Forwarded-Encrypted: i=1; AJvYcCV4AtpnLwJKbFuFhsrdtFpsqeTIzKRXmqlplKzlUnHGKGqvDEJEtErtbZ5e71kxONKd2WvWfgv6mT7H7w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz17RMxgvSYSucMeX3LbsbrfdfUOQG+QVPdU6cS5OoFnqq89NZI
	eboSuKzC50AWRYVXTDnIJgA8pRpWK03qFBHPTy78lZiTsD0XSAhPCmSCs6hWoTk4Y+E06VVlztM
	7wEXp6DKzhPgM9/5pUdcxLzcbZo95G1DIRHbKIaWh5V2dDMmQBScMLvcxUd+wKJExvw==
X-Gm-Gg: ASbGnct3aLo5G04/Usd9UijvH4cE1OBTV1SqJfc94zS8zmuIqyIzeOfkaDYWEWWxJ4d
	QTK6fRr7OVl8rTExxugeF/eS/ECM61QspDxPWFYY42O0pmdQzP++sZV0sxnswF5DbiPt9jnOD6s
	41KE6nUpCtPeBRC3vuNwVlxItljrponNZ6kax1UULSousPLaVGA6AHZCRzsddodRloF3O0He8S+
	p1ddDkqJq1LY4cOXrP1RfMKARkkZnZwz8AqSmfLb3rs31HilWc07Rb9LkfoNKnazajJGNE7eVZq
	6ZvUAgdtQyYf/LCu8BufSWjcUYRyWtw4gMGcYHUIf2s/vr0UBmrE9QDgAh8cDZshPGsj7xq0N0R
	xMhZkDb4Y27qZ
X-Received: by 2002:a05:620a:d89:b0:84b:226b:bf4b with SMTP id af79cd13be357-8907011469dmr371064285a.44.1760691389038;
        Fri, 17 Oct 2025 01:56:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUPr93d8Ajmplggb+ldAlBxbQLvNV0HTydv4xrmLHHI5+c/49iamayVLMQxclCht+/wql+7w==
X-Received: by 2002:a05:620a:d89:b0:84b:226b:bf4b with SMTP id af79cd13be357-8907011469dmr371060085a.44.1760691387891;
        Fri, 17 Oct 2025 01:56:27 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4711444d919sm70764985e9.14.2025.10.17.01.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 01:56:27 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 05/12] ASoc: qcom: q6afe: Use automatic cleanup of kfree()
Date: Fri, 17 Oct 2025 09:53:00 +0100
Message-ID: <20251017085307.4325-6-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=esXSD4pX c=1 sm=1 tr=0 ts=68f204be cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=92AZDs2nESXm7HPk3LYA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: bDKGRWCefxs29u0JDPA6fMUwW2FyHfC_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE2MDA5OSBTYWx0ZWRfX6BXuNrN+N/vk
 Okc/vPqFcTQP11ZoJ6VCcrlaG0XI34A3ALfdgJ+0ofGE4zZt4k2EBrQkPaXjlToysicMwywT4LK
 vHt7oFkPARqw4fsgmvLKASOpnjc84wW+spabxkWqos3aXVeAtt8+vh5VCA1EcMLfOrsYos2EagZ
 /NOL5mZ0Nu08GrnEoBEllaHZDgOJY8DrpEBg9du+5pg6Gq4IZ1CT5PyrbffpVQ8oggwlu0mAHys
 ra14XANdgXdDz9rbizUemqvqZg9Shi3EfuS4+DS6WIxAl/W9PKf38sKU7s17yv/v5xL5EW/sReq
 RS7f+QoRqAOzA6SX0YxvbpWakTr+bLW1MYuUEOS7tw+fe0S6xDhaWJqzhzkWHgpSbzym2PJm0Tv
 W9YlgGiDVdfes9tVJqUaUaJtSWL1ig==
X-Proofpoint-ORIG-GUID: bDKGRWCefxs29u0JDPA6fMUwW2FyHfC_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510160099

Its common pattern in q6dsp code to allocate temporary buffer
to send gpr/apr packets and free at the function exit.
Now this can be simplified via __free(kfree) mechanism.

No functional changes.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6afe.c | 41 +++++++++++-------------------------
 1 file changed, 12 insertions(+), 29 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
index 7b59d514b432..56f85f1c2425 100644
--- a/sound/soc/qcom/qdsp6/q6afe.c
+++ b/sound/soc/qcom/qdsp6/q6afe.c
@@ -1077,11 +1077,9 @@ static int q6afe_set_param(struct q6afe *afe, struct q6afe_port *port,
 	struct afe_svc_cmd_set_param *param;
 	struct afe_port_param_data_v2 *pdata;
 	struct apr_pkt *pkt;
-	int ret, pkt_size;
-	void *p, *pl;
-
-	pkt_size = APR_HDR_SIZE + sizeof(*param) + sizeof(*pdata) + psize;
-	p = kzalloc(pkt_size, GFP_KERNEL);
+	int ret, pkt_size = APR_HDR_SIZE + sizeof(*param) + sizeof(*pdata) + psize;
+	void *pl;
+	void *p __free(kfree) = kzalloc(pkt_size, GFP_KERNEL);
 	if (!p)
 		return -ENOMEM;
 
@@ -1112,7 +1110,6 @@ static int q6afe_set_param(struct q6afe *afe, struct q6afe_port *port,
 	if (ret)
 		dev_err(afe->dev, "AFE set params failed %d\n", ret);
 
-	kfree(pkt);
 	return ret;
 }
 
@@ -1131,11 +1128,9 @@ static int q6afe_port_set_param_v2(struct q6afe_port *port, void *data,
 	struct q6afe *afe = port->afe;
 	struct apr_pkt *pkt;
 	u16 port_id = port->id;
-	int ret, pkt_size;
-	void *p, *pl;
-
-	pkt_size = APR_HDR_SIZE + sizeof(*param) + sizeof(*pdata) + psize;
-	p = kzalloc(pkt_size, GFP_KERNEL);
+	int ret, pkt_size = APR_HDR_SIZE + sizeof(*param) + sizeof(*pdata) + psize;
+	void *pl;
+	void *p __free(kfree) = kzalloc(pkt_size, GFP_KERNEL);
 	if (!p)
 		return -ENOMEM;
 
@@ -1168,7 +1163,6 @@ static int q6afe_port_set_param_v2(struct q6afe_port *port, void *data,
 		dev_err(afe->dev, "AFE enable for port 0x%x failed %d\n",
 		       port_id, ret);
 
-	kfree(pkt);
 	return ret;
 }
 
@@ -1285,7 +1279,7 @@ int q6afe_port_stop(struct q6afe_port *port)
 	int port_id = port->id;
 	int ret = 0;
 	int index, pkt_size;
-	void *p;
+	void *p __free(kfree) = NULL;
 
 	index = port->token;
 	if (index < 0 || index >= AFE_PORT_MAX) {
@@ -1316,7 +1310,6 @@ int q6afe_port_stop(struct q6afe_port *port)
 	if (ret)
 		dev_err(afe->dev, "AFE close failed %d\n", ret);
 
-	kfree(pkt);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(q6afe_port_stop);
@@ -1676,7 +1669,7 @@ int q6afe_port_start(struct q6afe_port *port)
 	int ret, param_id = port->cfg_type;
 	struct apr_pkt *pkt;
 	int pkt_size;
-	void *p;
+	void *p __free(kfree) = NULL;
 
 	ret  = q6afe_port_set_param_v2(port, &port->port_cfg, param_id,
 				       AFE_MODULE_AUDIO_DEV_INTERFACE,
@@ -1722,7 +1715,6 @@ int q6afe_port_start(struct q6afe_port *port)
 		dev_err(afe->dev, "AFE enable for port 0x%x failed %d\n",
 			port_id, ret);
 
-	kfree(pkt);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(q6afe_port_start);
@@ -1845,11 +1837,8 @@ int q6afe_unvote_lpass_core_hw(struct device *dev, uint32_t hw_block_id,
 	struct afe_cmd_remote_lpass_core_hw_devote_request *vote_cfg;
 	struct apr_pkt *pkt;
 	int ret = 0;
-	int pkt_size;
-	void *p;
-
-	pkt_size = APR_HDR_SIZE + sizeof(*vote_cfg);
-	p = kzalloc(pkt_size, GFP_KERNEL);
+	int pkt_size = APR_HDR_SIZE + sizeof(*vote_cfg);
+	void *p __free(kfree) = kzalloc(pkt_size, GFP_KERNEL);
 	if (!p)
 		return -ENOMEM;
 
@@ -1871,7 +1860,6 @@ int q6afe_unvote_lpass_core_hw(struct device *dev, uint32_t hw_block_id,
 	if (ret < 0)
 		dev_err(afe->dev, "AFE failed to unvote (%d)\n", hw_block_id);
 
-	kfree(pkt);
 	return ret;
 }
 EXPORT_SYMBOL(q6afe_unvote_lpass_core_hw);
@@ -1883,11 +1871,8 @@ int q6afe_vote_lpass_core_hw(struct device *dev, uint32_t hw_block_id,
 	struct afe_cmd_remote_lpass_core_hw_vote_request *vote_cfg;
 	struct apr_pkt *pkt;
 	int ret = 0;
-	int pkt_size;
-	void *p;
-
-	pkt_size = APR_HDR_SIZE + sizeof(*vote_cfg);
-	p = kzalloc(pkt_size, GFP_KERNEL);
+	int pkt_size = APR_HDR_SIZE + sizeof(*vote_cfg);
+	void *p __free(kfree) = kzalloc(pkt_size, GFP_KERNEL);
 	if (!p)
 		return -ENOMEM;
 
@@ -1911,8 +1896,6 @@ int q6afe_vote_lpass_core_hw(struct device *dev, uint32_t hw_block_id,
 	if (ret)
 		dev_err(afe->dev, "AFE failed to vote (%d)\n", hw_block_id);
 
-
-	kfree(pkt);
 	return ret;
 }
 EXPORT_SYMBOL(q6afe_vote_lpass_core_hw);
-- 
2.51.0

