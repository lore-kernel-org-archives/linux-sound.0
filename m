Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF322D73B4
	for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 08:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760691398; cv=none; b=rYFAXK7VHEnxW3uWuP31QS/+jqK6ENz6d2uC2pj31W0npUc4bLv/lEe03Qo5OasCmAfzgbpykmpOxgWh90ZLgVjZKvY+xWJWkeEj9CTocvscF5RxnXOaafAoOVgCd4ZcDEzt/Aw5kdBaZX8axoUwZalHr6nelNRkleYTywLrc7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760691398; c=relaxed/simple;
	bh=dLHz5GvCqsmxeiBqKMEL3HcMUOaRmWqxPH16ZJ+zr84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N+uu4679rWOLrsCVtFdzHLbNdRyjp9yaBQM8Mwo7DTRf27KPpjYJeUKeJhoZSP94q0vNclnqZplVt2DOKchAPKyzVlwJSJX5iqSWH3TAGcEr1rij8CTFIKKG/GqgmY6DFeOAPUiqTwpuGM7uKDtmZcWNCovsvTEU9KXhb4bqBvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MbRHWv50; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MbRHWv50"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59H8M0i2001991
	for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 08:56:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JitUmPpOE5T
	5FCzl9njQ018JnbQNGz2uQiWhNK3tWOE=; b=MbRHWv50ntKOGmN0X9n6fxfL2ml
	35Q9vv4Fv63oV4svLmEMWsGOyDNvScWj/RyIKtA4Upsd4qPcXHQQZqKIs69hojcZ
	rVinsqfYqmoAibeFmErewScQWjS+cgsG0K80HQyJjA/7HFINUWsmmqQBYz9oJtoc
	JV6GsGsAs+YdFwusKIY3xGH2xIpEC6edM+HaafKEMc7r1JuqkWEGVf7UIjfeJHoS
	jLZnfkQlaJm3gz9aigaoP2id2cnVy2lhif3JUKOwlOuFdgFUq6e+NodwHCO7DmQL
	MG22/grPjnsVxT/Q2vNjO/OTyOJzYH8Ur3cmLLDDj0hRoxc4Ts0M+BpyfGw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfa8kk2d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 08:56:35 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-81a8065daf4so27796566d6.0
        for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 01:56:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760691395; x=1761296195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JitUmPpOE5T5FCzl9njQ018JnbQNGz2uQiWhNK3tWOE=;
        b=i6YUMnu6REOR3E2mlGF41CTEEH7ePwfZUZRzb0jE+cr1ujFS3ZwMcUHwC+vbie+Fom
         94AsX1nErpvuD0qgCwz7SpQMRz2kDpQxwl664QnxFH6Hs1wk/sMdvPIePYzP5Aa9kj62
         lV1bfwR/4JjwnigF8wAieH3l0Oftg+Shzfmgohsx0x6TYDv30TV2oq0DYSDE4O68e2ca
         XTGkZ38LqWKz2awep6lUFeAQpdrXUuOVrxj1Fk3u8O4boVsVpG1hCDDpuv+SkiMWu8OM
         Fx8kwFyOmgbYA/aict6fobg8/sYVzD5sUGRmraJV3//noEc6+7/nm0/k+V8t0DPzuiqe
         AyCA==
X-Forwarded-Encrypted: i=1; AJvYcCV5iM3T1+N2DsT3ZHHGOtJ7h0MxJdkcgnAZefvZcoS+pobF1JgLHNJb44/QGfWDU2EY5bqrYnHgZt+3oQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaSWfM1b19k6bkPUwsxtfTxpK5OZOGGJTDWzdvuCG03HWdyovE
	SuRqnIx6O0AjnBX3cl8y1pf/BIPM5lgL3oFqbhw6Sj4LKLDiKAYiENvg94LnISOID4bf0L7ne5G
	I5qibn2zadl50mWozCCIlTI2PJgB5qmbsybN4kT9CujYXr18EBKX+noba6tFEdAivJw==
X-Gm-Gg: ASbGncsZYMnBS49A6K1EKPAxscG7Rh+bxslfkXG6WeW4FPoG1u0l85IpylxOnI7Mj1I
	2Vi3gr9sF/ENgtkJ2evuYNnkIkC23kUbH7PaCm/u2Qjo1DGSWwwj1FnyWcliBWi7N2Tyb3FApxa
	ncnunUbmvRnXXEJQaiLmDuwgyRMdPWeHos4KRWEPYCzyUhYz9fxrhdCu1LgnHNy0sFV/0OXoade
	rrDJOkMuXMVdgXe3H8RO73LhIVoHFCvsBgmcEo2Um6/0YdmCqJQ9hnJBrd1IZ0xh5g1UlaYxqy+
	mYwnGFIwzicN9LbHyHHanANX1o/reLakdrV//iZoLRh8ffKsnfq92RJb9MYh5103ucmeb6wpl+7
	TS3gqjlCgoO5W
X-Received: by 2002:a05:622a:134a:b0:4e6:ef26:3152 with SMTP id d75a77b69052e-4e89d415399mr41172641cf.80.1760691394761;
        Fri, 17 Oct 2025 01:56:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECLncEtQ/xMqZowWNexF5mITfqx6IZzM+n9Z8TxJParb7CY65kZ74qpDXSRgl56uflB/Cpyw==
X-Received: by 2002:a05:622a:134a:b0:4e6:ef26:3152 with SMTP id d75a77b69052e-4e89d415399mr41172511cf.80.1760691394323;
        Fri, 17 Oct 2025 01:56:34 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4711444d919sm70764985e9.14.2025.10.17.01.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 01:56:33 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 09/12] ASoC: qcom: q6afe: Use guard() for spin locks
Date: Fri, 17 Oct 2025 09:53:04 +0100
Message-ID: <20251017085307.4325-10-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: InB8ahspCp-yg9LEMSstfPRtPNrpT7h-
X-Proofpoint-ORIG-GUID: InB8ahspCp-yg9LEMSstfPRtPNrpT7h-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfXzsQsHHUfIkuv
 n/WMiUSFYmReffWZMg/z5Y2XSFoHBrTRgY9lzuIgQjuu3baGjxUa2CToaOILQypnHl9oW+q7sIx
 8h4CDx1p/3rKBE0UzkdvadFL7UywwGuOYBtZhlCCwghiIPT2g8FiNJkjd669Mcw7lVhyAkKWZ2U
 5Mmp0+E2g1b3bYjZuDWPW1PVR/lhtLzQ9e2pibMarIRKPpLOs+ZXGUE0TjMxEHKDqz02ak77C6j
 3+JK9oBfzxToJ5v9xDJpQlOqj4rK4iciK1VcpId3tyHSC6RxPONZkpp6cP73sKE9+RQLFWVyeph
 fxy1cRfIGs8wYVF/dZT/Aijye1PPtfwFkSAj9v2b8+Mrd7VJAFuFhuD5alWOd46pvDKEXXe7mqj
 +3mtrM3wQ3t65B1/nYmSPC4mRYLQ5g==
X-Authority-Analysis: v=2.4 cv=JLw2csKb c=1 sm=1 tr=0 ts=68f204c3 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=RrrD4pAD4uqPltEmIwwA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110017

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

