Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BDC2D46A9
	for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 08:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760691390; cv=none; b=jU2p5LH2U0ob0Ib9z/wQbXt8t+SYOuKmOTRnsOIvdlCvs5Sm6auz/ejuvdTL9zNQFnyLckgPMaY/04Pxkwo3wRg5eRc1nyjjXuRIsTnFh1/J0611FhD57H4DhQaQ1Y6i+p2tOxBzM0OhPZxFgGROT0DaEEaF7MqQd2AJ07JCqUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760691390; c=relaxed/simple;
	bh=UOMDuytwV5b0FWFmJzLikQVcSaE25eP4RAV2dWnOfww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JhDkvzYfGLEIWeOhs06tVvOlkM9MzgQlqRUGpqRufvj5f4pP5U55AVoLoT0oj2XNyXs+qKqInKYZUIvfnxRkzFeXqHRqGK0DF87/j6784PcIfRDj4/UfOlEf5owIR0/f8xX/g1EiHj2J31gnrtUTIU5HPnVtSkKJy6Hw7tJc0BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E2w0ov/O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E2w0ov/O"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59H7sG67017087
	for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 08:56:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IRPASGCwKLk
	EyaUY/ExfpyqCkRwquY7kf3u//UZGcCA=; b=E2w0ov/OpoeALdj9/AORL6KicqO
	Xjj0RR1g2dWTA09mXMW/5gypmUh6v7JSLfS2iP+w2bGqMWEiMxzbpXYVt8/idCk3
	SC7myjvPKN1pmijmccEhgUA3b6ffb5JW+Gv0G9lKR9JDpUYygcl4i/WnrHKbOynF
	QUJmOnKeaAitD6pC4ndtmCwX4WI15bIU4vVFkGaOw/bOc7T+LFGgNsZ6tQFgFTdS
	Qtke5N1iA73FS73nMeFkXYcMKqePqy2W+a5JAkORuR4fweloIuhLBpaR0JpKU+C5
	q4nAQmvu8s/M5Tz7iAGIdjDcAb0i3aDiPDQlHEHa52rg1vl4l8WAntSTCWQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfm5uqgm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 08:56:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-871614ad3efso582443085a.0
        for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 01:56:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760691387; x=1761296187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IRPASGCwKLkEyaUY/ExfpyqCkRwquY7kf3u//UZGcCA=;
        b=aLRImmHusSoFNGyl+07ap4chRzeaA8XtCdetoZDMaE/ORJKmxYZZToiku5uqnccNsq
         2shyw2Vi3lK/5Z1NFDB4dFl46kmEF/sIJT3RvUCmONtlry6qxSkrcvTUmBHBE7sskV4D
         ZweVsu2/l7vErlmuk3Isz+VQLEy3vTLV3PolvSufKyyWil0mQXTsqq9sJ3gt3jmWqhV7
         fWANWpblWbev5YE3MHLBqVGEAiBLyl8BHysfUJAyGlbj8gyd1eOFwGegoK17ZU2dWT3k
         ZOxQHXjDNpWnxjL9ct431Wv4C8K0UV9bXx3lHIxZs0Cn8F8oEeMPZDVnIXXjTyAudfl/
         3OEw==
X-Forwarded-Encrypted: i=1; AJvYcCUO6JOtj8yKHgEZV++L6B/lVXp7WLbDysTUUlyDXOzTgjnapSVrwM+sj/G7Lku9VnBxqaEou6Pc/olLIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEGNukldmaDkW8gofDGNIQu4/1VmgM8FSMVYQRTVrC52Q9KN0v
	0n2N8SDHtzaicqC3Lln7XTPbavy9x//EuFkqzSsdzUd4xzdbqwmk0fIrA7y2yH3zeIXhez3o7+a
	VzflPjszaJ4CMSk2aNYWgnxyJTJvBgIGcaA64ls9DKN4xT8P+EwZbTXw6tzLnms0IzQ==
X-Gm-Gg: ASbGncv0H+rxw8iMdZHz7UrQb1DWb4GszilkKbbz1p5FOivqGSi3Jnx8P4hg0E7crtO
	MOZIjU3M26KLhM5u0cZkRtTWOVa+gC/Qg76FEb8+omEhU7WZxMDefakDH0jBn1z+W5ZOALWQjSN
	Zue082h9oYCT1giu3754b+Xs8DIFzifpAsG8f5zgi/gSpIKfBR/LwgeT7+GFYcVAl8agAPWMPLj
	TFktNIpL5omwpHGPw58SGuTzyzEP3DUxiOx87C9V9Zq6+9D+HL2cAoveToah+iF+q4Ixf1uiWt4
	3Z+fVHLGu41YGMTvqAj5u3Usm19Ilwwg69r/4B1pE//xpoEsfIpdPQxPb8QdmWtRG9M3YHrz5hZ
	is1wXlkkbagSJ
X-Received: by 2002:ac8:6292:0:b0:4e8:a307:a42b with SMTP id d75a77b69052e-4e8a307aab3mr7543571cf.4.1760691386918;
        Fri, 17 Oct 2025 01:56:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFt2aeEBG2tuomsaj8skDLmIMc21It7yI43sXPDyV3iT1PdQ3O8uYgGBS9IoNvVISB3p2rJGQ==
X-Received: by 2002:ac8:6292:0:b0:4e8:a307:a42b with SMTP id d75a77b69052e-4e8a307aab3mr7543391cf.4.1760691386395;
        Fri, 17 Oct 2025 01:56:26 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4711444d919sm70764985e9.14.2025.10.17.01.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 01:56:25 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 04/12] ASoc: qcom: q6adm: Use automatic cleanup of kfree()
Date: Fri, 17 Oct 2025 09:52:59 +0100
Message-ID: <20251017085307.4325-5-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: yIHiJ61DiS9FrndkJS0xO1LlI1Q-ZqNS
X-Proofpoint-ORIG-GUID: yIHiJ61DiS9FrndkJS0xO1LlI1Q-ZqNS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMCBTYWx0ZWRfXyixzP6+lXWj3
 MAueIdMmgoRf8NyGHDI4//fDk6+EKfBAVAsg7nNMTeNg/pN5SAGGKIL7U+8KiwaHmbSco8k0meX
 qjQJK2w++B+7Yn3bEwHXLZt4hX9E5g6yaxqvGpMa8ewSmgu9VXB2Z+UBCU0EVv0liCpzRJjhVpF
 UIiJpWampOKuyVrATlF8jeAgwXUmlnUk5AgNXmgGc8E+whRSTYNlT3tr4+7QPWkBwqwhfpr2sLE
 13vDrw0FwFfaIsYqfg7tKCrln0NyTULlRtYDOcUsjukEQv9bzE++mS+8MNvKAJPr3uAMBv99Jxo
 YNka8wkzjupFZTRVD/zvN+o+FWjz/67wxYm4gfHTgpxszVo+/r53GZhPJHJfSgUCm85wtHEwNop
 skeB2gr4zPNjqsw71Ax+TXHxmqd+FA==
X-Authority-Analysis: v=2.4 cv=V71wEOni c=1 sm=1 tr=0 ts=68f204bb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=tHfk9jisluZWoJm7kAAA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110020

Its common pattern in q6dsp code to allocate temporary buffer
to send gpr/apr packets and free at the function exit.
Now this can be simplified via __free(kfree) mechanism.

No functional changes.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6adm.c | 33 +++++++++------------------------
 1 file changed, 9 insertions(+), 24 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6adm.c b/sound/soc/qcom/qdsp6/q6adm.c
index 1530e98df165..6477c7875c12 100644
--- a/sound/soc/qcom/qdsp6/q6adm.c
+++ b/sound/soc/qcom/qdsp6/q6adm.c
@@ -325,11 +325,8 @@ static int q6adm_device_open(struct q6adm *adm, struct q6copp *copp,
 	struct q6adm_cmd_device_open_v5 *open;
 	int afe_port = q6afe_get_port_id(port_id);
 	struct apr_pkt *pkt;
-	void *p;
-	int ret, pkt_size;
-
-	pkt_size = APR_HDR_SIZE + sizeof(*open);
-	p = kzalloc(pkt_size, GFP_KERNEL);
+	int ret, pkt_size = APR_HDR_SIZE + sizeof(*open);
+	void *p __free(kfree) = kzalloc(pkt_size, GFP_KERNEL);
 	if (!p)
 		return -ENOMEM;
 
@@ -354,14 +351,9 @@ static int q6adm_device_open(struct q6adm *adm, struct q6copp *copp,
 	ret = q6dsp_map_channels(&open->dev_channel_mapping[0],
 				 channel_mode);
 	if (ret)
-		goto err;
-
-	ret = q6adm_apr_send_copp_pkt(adm, copp, pkt,
-				      ADM_CMDRSP_DEVICE_OPEN_V5);
+		return ret;
 
-err:
-	kfree(pkt);
-	return ret;
+	return q6adm_apr_send_copp_pkt(adm, copp, pkt, ADM_CMDRSP_DEVICE_OPEN_V5);
 }
 
 /**
@@ -464,15 +456,12 @@ int q6adm_matrix_map(struct device *dev, int path,
 	struct q6adm_session_map_node_v5 *node;
 	struct apr_pkt *pkt;
 	uint16_t *copps_list;
-	int pkt_size, ret, i, copp_idx;
-	void *matrix_map;
-	struct q6copp *copp;
-
+	int ret, i, copp_idx;
 	/* Assumes port_ids have already been validated during adm_open */
-	pkt_size = (APR_HDR_SIZE + sizeof(*route) +  sizeof(*node) +
+	struct q6copp *copp;
+	int pkt_size = (APR_HDR_SIZE + sizeof(*route) +  sizeof(*node) +
 		    (sizeof(uint32_t) * payload_map.num_copps));
-
-	matrix_map = kzalloc(pkt_size, GFP_KERNEL);
+	void *matrix_map __free(kfree) = kzalloc(pkt_size, GFP_KERNEL);
 	if (!matrix_map)
 		return -ENOMEM;
 
@@ -510,16 +499,13 @@ int q6adm_matrix_map(struct device *dev, int path,
 		if (port_idx < 0) {
 			dev_err(dev, "Invalid port_id %d\n",
 				payload_map.port_id[i]);
-			kfree(pkt);
 			return -EINVAL;
 		}
 		copp_idx = payload_map.copp_idx[i];
 
 		copp = q6adm_find_copp(adm, port_idx, copp_idx);
-		if (!copp) {
-			kfree(pkt);
+		if (!copp)
 			return -EINVAL;
-		}
 
 		copps_list[i] = copp->id;
 		kref_put(&copp->refcount, q6adm_free_copp);
@@ -552,7 +538,6 @@ int q6adm_matrix_map(struct device *dev, int path,
 
 fail_cmd:
 	mutex_unlock(&adm->lock);
-	kfree(pkt);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(q6adm_matrix_map);
-- 
2.51.0

