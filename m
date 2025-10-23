Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1B830E0EE
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 10:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761215180; cv=none; b=uWVA+sZQwSltbrI+KuB8XNwn8TtolkM08b52NB8iiCAPlJpr7QPET0RGKsMHzW2BYvZswiG2vYwUStGQzr2duO4A9JbD0TxihHPJEvcEVi1kFap5wrcuqgHgg7MYxmAnOXGkj8W3kMZQaaOP63RF9/PeCEEKBlb7YmMdFwG5wvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761215180; c=relaxed/simple;
	bh=dLHz5GvCqsmxeiBqKMEL3HcMUOaRmWqxPH16ZJ+zr84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pNa17NFLiC12i6dh+ROmddG2OD3U4pDhfc4SJcm2uK2Bq0BqoPP39WqSVkYVA5iA6VkDj1/5t67bYelvNCksIfK1qjf16pFGNe4lioOL99FrevRSRrDGrCk4TymSHUooDHFKphihdmIHGOPmFJk7WwkogvAANTq0LLMvRLJfP14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AaKUTF3e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AaKUTF3e"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6Iddu020167
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 10:26:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JitUmPpOE5T
	5FCzl9njQ018JnbQNGz2uQiWhNK3tWOE=; b=AaKUTF3epbbr6yJaNDjUCsqzLAm
	11y2e6WNB8UIH0mVSKCRRFMKznv1p93IpJS6wXXwKqUnUNbxFlFOG2EQ/OlzxA4c
	9tIAcIsOrIHToT+i59sbKkEbCooFaW0LfPCDclQbIfHIeGNX2K9+C+8Bx966Lqer
	Bm+QfkfGcdrVKXOR3rkyydsG1QyIvGczahYTE2R6yZFeYe+A9810EV9c4oN9m0i0
	ZUr9qSxzY8Dt0kJaCJERKrUM2bdEejoAQl575l/B7Z4Hx5yiVVnchdx48joQRnKQ
	gfsM7PH8mUmztwLPd0Sa7ZJ58TZVJeE0fs+64smAJQBzQgXOgCDVMuuDbEw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v08pr8kx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 10:26:17 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4eb7853480dso22157281cf.0
        for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 03:26:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761215176; x=1761819976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JitUmPpOE5T5FCzl9njQ018JnbQNGz2uQiWhNK3tWOE=;
        b=EF7qaR+SL97BcYlE7NR0A4Kp3Xrs70WxGaPZVBy9qO3AQ2ghnsFzbwhw1DkrSmbs38
         1Vvk3yboudRkOC0SNCC1nyeVOVu+OOxkYqNQ5f3jqptLPQk60KDAIDJ0DpnFNq18bVM0
         8RFiaxiSZqXQY9EDApGfSQZXT4LrIDJ7T/4wOJ/issdzbwulwfix5OASK+BIQixgIySE
         1JzidHGgx8PLkHHBkiSzUd4SI9KnFSM6i97KHFsFaOUSxJ75wsjqkOYk4MZdHedESSAb
         AAc1JKA8SafJT2wWGy4d4sR1LpJs7JaLWL98oaI046Mo7V1hJiduB/VplFVIT8d7387H
         suNA==
X-Forwarded-Encrypted: i=1; AJvYcCUu6fVYz1zy6FdJScqEQGi5ZZt2oetkHoruwxIoHZPacKT+ooLxSWilC0wKXT2C8rNE4hPUYS/O+5klTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwsitoOKcfG0L4o9FGRskRsjr1SZlwOCn+qNe+RWj+ExWvLIa1i
	u8DUa8Rn9h6slFvtJFgp6gqwdo8BX4pi/1789AIdUKyI56pVk5fCeRq4FFnZroR7khF1vEseY+n
	YJZrDMwlHnum9MCadBYIBC+ony+5UeycPkjGG5FApkM1ISc/RkPnAwc34cjO3POECBA==
X-Gm-Gg: ASbGnct+TLjlHZvpFlFt50Yovh3TMXH06LIVQMfRD5ouWh8XShZNTuAa3TzEFdkH9rS
	evSdEWmvQHBpTTy1JY5qBES7LYt118kahq6M+PYkHEaRz+kp/y20sKvIrvK71ea1x4X29V/8pbt
	NwGLFDnz7xV/kc0x1S41f5PqDdJPJFZLNH1lt6f5pQKQdIMNBjbohqgw1tdguc9xAiPgnHCR2Pl
	BhHqn6mX3NVJC4xL9bKkKulVyp41Js07vrALu67ooB5xV42UMzxCUAmzoENeusg5CSsOgpwPH9X
	WF0JGP+rk2PRvpOZ55gZkTZSDofF6XUInInvP2PdJ9vh/a7um657Q9zbd6htz9wqhN8pQ42sWcq
	I+XEgeixJTaVc
X-Received: by 2002:ac8:598b:0:b0:4e8:968d:b14a with SMTP id d75a77b69052e-4e89d28295amr268425361cf.22.1761215176220;
        Thu, 23 Oct 2025 03:26:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEj7fkh7+VmeztYn4QdA68cJbOaNXQj+xi9BZBCSrDbEh6Oo9ctMku5VaXZ9TTwndXPdbnPQw==
X-Received: by 2002:ac8:598b:0:b0:4e8:968d:b14a with SMTP id d75a77b69052e-4e89d28295amr268425171cf.22.1761215175778;
        Thu, 23 Oct 2025 03:26:15 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c427f77bsm92220685e9.3.2025.10.23.03.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 03:26:15 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 17/20] ASoC: qcom: q6afe: Use guard() for spin locks
Date: Thu, 23 Oct 2025 11:24:41 +0100
Message-ID: <20251023102444.88158-18-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMCBTYWx0ZWRfX8scs4qjb5ewj
 BlccyOBfB+ijRFzO38A5N1jotgrNmGsZAm7aADxVFDM+aIMsz3OEIhBJcOdcfgOdY5Hq7mk7Hwt
 UiBYo/X4ku/VCQzxF+wCveBfbHIJcfA9KoHgaEw+XD5JlQ0xNSUwOwYGX8sHMWbYjTEklcruS+q
 Qe5tsnOk70d+vcxkgBJi50hAESrLCHmiVRyg9PMaMY/WA0t9Xkqz+hi04W9sk2tMSKTMR7ksQQr
 CxTEoAmOJQ2N+wyAdsKShd3/HOC3Cz7Ff7MZPSteTjPNgmf8AM4sKhoVJRF55Bl8nR+1RRoeTRm
 oLfmEiv7kgUfSMG0uutKK5m7Lah4Z52Sh1qRniW9/d8+0CofWPXp8Vlk2vK6Q0lx8wWC9Fs+ATl
 us7OnVoarqtE2Jnl0rT+Wlvo8rSEkQ==
X-Proofpoint-GUID: hr9eWR4z3PoLzS54-CMWYPxjVoFZhnWw
X-Authority-Analysis: v=2.4 cv=Up1u9uwB c=1 sm=1 tr=0 ts=68fa02c9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=RrrD4pAD4uqPltEmIwwA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: hr9eWR4z3PoLzS54-CMWYPxjVoFZhnWw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180000

Clean up the code using guard() for spin locks.

No functional changes, just cleanup.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6afe.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
index 56f85f1c2425..980851a12976 100644
--- a/sound/soc/qcom/qdsp6/q6afe.c
+++ b/sound/soc/qcom/qdsp6/q6afe.c
@@ -946,9 +946,8 @@ static struct q6afe_port *q6afe_find_port(struct q6afe *afe, int token)
 {
 	struct q6afe_port *p;
 	struct q6afe_port *ret = NULL;
-	unsigned long flags;
 
-	spin_lock_irqsave(&afe->port_list_lock, flags);
+	guard(spinlock)(&afe->port_list_lock);
 	list_for_each_entry(p, &afe->port_list, node)
 		if (p->token == token) {
 			ret = p;
@@ -956,7 +955,6 @@ static struct q6afe_port *q6afe_find_port(struct q6afe *afe, int token)
 			break;
 		}
 
-	spin_unlock_irqrestore(&afe->port_list_lock, flags);
 	return ret;
 }
 
@@ -1733,7 +1731,6 @@ struct q6afe_port *q6afe_port_get_from_id(struct device *dev, int id)
 	int port_id;
 	struct q6afe *afe = dev_get_drvdata(dev->parent);
 	struct q6afe_port *port;
-	unsigned long flags;
 	int cfg_type;
 
 	if (id < 0 || id >= AFE_PORT_MAX) {
@@ -1810,9 +1807,8 @@ struct q6afe_port *q6afe_port_get_from_id(struct device *dev, int id)
 	port->cfg_type = cfg_type;
 	kref_init(&port->refcount);
 
-	spin_lock_irqsave(&afe->port_list_lock, flags);
+	guard(spinlock)(&afe->port_list_lock);
 	list_add_tail(&port->node, &afe->port_list);
-	spin_unlock_irqrestore(&afe->port_list_lock, flags);
 
 	return port;
 
-- 
2.51.0

