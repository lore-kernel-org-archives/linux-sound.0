Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9F830DEA9
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 10:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761215175; cv=none; b=X2ZXuRCBz0+n+TGWSN3EKCCotbpfw+z4lDAVFjrrHOJQH+Hw1dVCbThPzsRTo5EwOk6hMMCj7I6ELHbmQobyM9UG3OILxhmBHuSCEyoywD4Wm6GDUq5XbJBgb6glShrVxCn+nD1/mpL5GUz1gvQObpuvmWU7qsfb64dKhRis2wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761215175; c=relaxed/simple;
	bh=bilYqDTijOVI3Ym7tdbxk/7Oij4S7gx62HEm/BQXlfo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=khy8C+8spEjnM5oDXbv3j1a6i1Tm05hj0w42yo/hrF9TXOe4itK0dR5aWLGFIVqHSG5Ws9KrYnqsg16iw15LLgd1S8G1AcLFB+h98hBhdPZHKYADLbq5JBRVwvV7fKhMDq3FnNc1ZJwK8ORcGP97eFq+pG8Ej+n4KSsPCpfUZFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K6yzip0L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K6yzip0L"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N7aVK4027073
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 10:26:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Q/jUAXEKNOQ
	5BE1XPscr9ID7DIaSGQKQv9C4H2dtDd4=; b=K6yzip0LtOg/vBX4h04eN0SVE1K
	6TYB/ZgJLcSFk24PlAX0oyfiBnKBJ3lTbZwBTd2DLUwVQZdxMa7VkE3uyiBE4nTe
	2sdMvHz8q6KySEQL/Tdypx0+3OHOAyV6OJ+d37j8+INTfQtKucxBLH5qW+DGJ1Pi
	Eu0FS2nXbKN6E5iO9j+WJAasHFG38NoJrbtSFU0wujldzmumMw81ADnCabo0zjV1
	7VCZQyD9lveQqjGpHE0BAW/sQsYhDSbdBNv3Sc/Dy7sijq+7FgifQ3d/qsi9PYKf
	F0Ta+LmwWRrk7htjMog9ofgNKV2GthyFvc43c31KnQvZBJ0thGS9eoAlmpw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y5x8j43x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 10:26:11 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e89ed6e110so17804331cf.1
        for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 03:26:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761215170; x=1761819970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q/jUAXEKNOQ5BE1XPscr9ID7DIaSGQKQv9C4H2dtDd4=;
        b=Pu3OOgegPfFyPjx5vHsYrZSkOjqklB5vGmlHH81RBKH/+6Y+WvwuHTjaE0TS+PtrvE
         DAMByGQbyzarLiL0NDmk4gnLI6J0nGu6Mq3JRKkb1dNa0W8f9F3wHGo8QTQOepc8urOh
         NajWNqrwU5UjkBo2fQavDmwkyW3TmQ453GVBfEWm8eCCDhKPJGLa4CuiGTJACwkC7lWh
         BlrY2OaFtBDTgvyeU/YB5fKA5LtkZc1rqhMpShSvFJTxrolunRAZmyGLC1wY1oyeSyYP
         HAm4N9mwMNsFlcYflx0ADGUdoyIdgvZYSxmSyvhLYk0IWUPSxIdBe6NRRuILii4fUBfI
         iYLg==
X-Forwarded-Encrypted: i=1; AJvYcCX8O8UOCYZtDz8dcDLr/9OBypLdbyZRnrByM3LuACBZhqUCVSTXtPjeKq3/5s1RGFvsd8GcHnwWREX7kw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMG3RRjCwivMumrE0aCTPiXsXNpZED55THexsIoQSkttCxmMaM
	pYle3p9e6uh1aN4lxsV7Jb4np9JQwxmr3q1VtWT/EcUTtsPbM1QUON2k/DGLnXnX2rM9bsUN5op
	F7uQDpQC6VjQ5EY3xMdtZASF/6X32AZdEtIPA9lNf3VnBrqc7doL+RElNVZCXj7q7a3Dpo99ACg
	==
X-Gm-Gg: ASbGncsihu0+VMTfULxP31ux3LeDI1tUWPLGF3nNFWnrRfp9G521ocUISsb3V1puGju
	mfJCSJUclLD+EUZpx7ExuJkJJkDc9Cj6doaEM6704CCy2VGwbC4fciGF7l33uhynOlwwux27BGL
	jW2Lc6XTT2maehHRb2l3Cb1Yf93u19pzcqnrXtP/FwZTlBrrr+sBMBGKd47VrCv4R33/6g/XsPO
	kcVsobbrICDdZ5SFUp6Hqny/p9sCexS6qnPKaM8YZHdH7dLgEl9wg3AuB/YBU/zm/8n+IUR03WE
	yVSt6/+FVGmNtOh1+UNk+QJO48uyrE+Oi3oM89DgvbNy9zkt9I9aX4LVJiefMiMZaylp5uQ+aZ+
	gz9KnZBnJNuu/
X-Received: by 2002:ac8:5792:0:b0:4e8:ac66:ee42 with SMTP id d75a77b69052e-4e8ac66f458mr252665471cf.27.1761215170458;
        Thu, 23 Oct 2025 03:26:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWFQYJgDTadBI0CLEt07gUG/hH7KmtA4wCHAIN4ey5J4mMmr8Q6aFMeRo7VX/EjbM4dYegVg==
X-Received: by 2002:ac8:5792:0:b0:4e8:ac66:ee42 with SMTP id d75a77b69052e-4e8ac66f458mr252665271cf.27.1761215169907;
        Thu, 23 Oct 2025 03:26:09 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c427f77bsm92220685e9.3.2025.10.23.03.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 03:26:09 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 12/20] ASoc: qcom: q6adm: Use automatic cleanup of kfree()
Date: Thu, 23 Oct 2025 11:24:36 +0100
Message-ID: <20251023102444.88158-13-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: m_7xVKl-cs21UNurzQc3CazqKSCLB-oa
X-Proofpoint-GUID: m_7xVKl-cs21UNurzQc3CazqKSCLB-oa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2NCBTYWx0ZWRfX/J1S2x9dePSI
 mTItvD696+DtAbgi3ydD5O1y3wsJ0kcbiTPakiV0/83o9xiK4SwEFutsrV0ktTN3SU1cW2yZv58
 tOq//mzq78CfeEF9JkoyqcRQct+N5m98mAYAabohyrzmQqFJhP3HHTGIewUDp/kiEJeWYG5ZgK3
 6gg1RbrnRkfSdpYgheecVBV/jhsA1WOujsfywF1oVV9AfDXiCWYNyi1nTgNHvl71XVRBKD48/Og
 LX3Hk9osfbwrdOPcby9eeHzkjbH1nWr3h+mNf2VUMtDJkTf3qM2iA5Bll5QXQqtibX72H0cDGYJ
 OoIOFWycKhwiWlA2WAeP2UwOgeXjnpF4EvwsOc0YAip/v9wBgzep67Vgf/G5AfKmvyfjZhVZwCB
 rBZDtBQ0poCVPGQvHqTzV4s60/Wkdw==
X-Authority-Analysis: v=2.4 cv=UOTQ3Sfy c=1 sm=1 tr=0 ts=68fa02c3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=EQMblWJGb8QQpEaKAwIA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220164

Its common pattern in q6dsp code to allocate temporary buffer
to send gpr/apr packets and free at the function exit.
Now this can be simplified via __free(kfree) mechanism.

No functional changes.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6adm.c | 33 +++++++++------------------------
 1 file changed, 9 insertions(+), 24 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6adm.c b/sound/soc/qcom/qdsp6/q6adm.c
index 75a029a696ac..0b8d06ec8b26 100644
--- a/sound/soc/qcom/qdsp6/q6adm.c
+++ b/sound/soc/qcom/qdsp6/q6adm.c
@@ -330,11 +330,8 @@ static int q6adm_device_open(struct q6adm *adm, struct q6copp *copp,
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
 
@@ -359,14 +356,9 @@ static int q6adm_device_open(struct q6adm *adm, struct q6copp *copp,
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
@@ -469,15 +461,12 @@ int q6adm_matrix_map(struct device *dev, int path,
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
 
@@ -515,16 +504,13 @@ int q6adm_matrix_map(struct device *dev, int path,
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
@@ -557,7 +543,6 @@ int q6adm_matrix_map(struct device *dev, int path,
 
 fail_cmd:
 	mutex_unlock(&adm->lock);
-	kfree(pkt);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(q6adm_matrix_map);
-- 
2.51.0

