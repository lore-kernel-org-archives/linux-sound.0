Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEC73A641B
	for <linux-sound@vger.kernel.org>; Sun,  5 Jul 2026 19:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280481; cv=none; b=GBo8EsxZyHrI4QzWkLg3BketANS9fR4Mwn/tRxJptFJrewI3gVX8Ogpmdp9mBfDba1T/W03N9G+mS4x1WbYyVspQw6K6Q1sKmsrEwgi0kErJEVshCTXw6kzqqwrpW1gdaTp/XA/IlwcmaA39VDGwYhvCx6jl3zI7BGKsOrYOssw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280481; c=relaxed/simple;
	bh=OCsNVf+w7PW5jkH9T0VzU3MYi5Wxwjk0gfKFHah6WG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tXW/jCNZsnCgKuvsUC+cYngH19v+FCH7SwgDf18neZEaZzMUs0qagh6TIUDwjRAmXj9wsHl2GEsFj+d1uQHifepQpJNjZRMF46l1WgqEBgSH3wghOgQCJiYzDRDjjGHkYazku0DFDNuHTfPffmvMVtUpQ5XS/e8OeMvpSrj8HwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PVhvB4ar; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X+jJCCQ4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PVhvB4ar";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X+jJCCQ4"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665JBLKq2520800
	for <linux-sound@vger.kernel.org>; Sun, 5 Jul 2026 19:41:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VVldA6NTRnp
	wPp0U9xX7eE/7+mcCmlhnYAOTkmKf4Os=; b=PVhvB4arTRaJVhF2SofLv+u1aVD
	jK8zIqELdsOTMECr0irbXF13Py7AAvUWwCcgloBqNe5sydVgobN3ykdNbR62SDhl
	xSdi8gXykZAYDggG/l29V+pDv8vxNl/8bfs3RsFDtihqoBwh9TvV8ccwG6jurLqz
	hXyA3tzVzG/9j/LFOunKeib03MEp2rrcHiuWykXLV2BW7biJwWZULRxuE/380H/W
	jxvEJrmSgF/oSVLpQz6WOjtRFsfVbrSe0a7iY0325hYiJ5tqlT9bhtEQhpDaeG/2
	q5Zdnz1hGEN80AyPY0gPhol8PR+yZE2CguSboTpYR821bg4icMzfKXPz3+g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6td3ba35-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 05 Jul 2026 19:41:18 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2caf4173b1cso41674635ad.3
        for <linux-sound@vger.kernel.org>; Sun, 05 Jul 2026 12:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280478; x=1783885278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VVldA6NTRnpwPp0U9xX7eE/7+mcCmlhnYAOTkmKf4Os=;
        b=X+jJCCQ4rZNaH2QZPG0tZitzpUKqRrCOmuWF8J6cmnJ3Nezh1CbmYLLK3XFP/GW9Z1
         NZDdKt/HmKptEKSYSuSDjjeeCqArYdiH9LH5ds5rIZGHZqQcIDd7ilrT2+NMj0H2pQNc
         YXGiMP11RX308CqgyQ9qahuXGTw35xLR9bY8jQ6vV3UPasFMOeEz4Bn6i8n3vv8oXC+v
         8/q9SY35tZd5ymgEIzC38hWwU7FPnfggW/aRH/c+Nk0ZD/ocJvFlWX1+Gqcv8vZkZav1
         l+1xsS9fA6P9cv6WvY+n+8ZjiCX7ulw0dGUd152yINSkzYgwat5NwxLIITzc5E3CrlEk
         kUpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280478; x=1783885278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VVldA6NTRnpwPp0U9xX7eE/7+mcCmlhnYAOTkmKf4Os=;
        b=CGUmjEzLTE2l2uXKhjjbrcQYHplY24vXusu3ef0hu6ed5JhW3mGd2C7g65B5yAA4XB
         b2f8LcMyDwCyWXasUbNEy1hIJru3YlZcrU/k0etfl/R9VKPKDqYuggywAOtmy4ONCloK
         NWm4WcU3AQ0e+kkR8tHvVyc2an3coODnKu26lHHaYe4JInHOTgfXtOujK2psht/6fL6y
         lkC1gd8BjLbaguXf1CC/dXh6J1hw5Uor5D6Df8/ZA12BxXy+nBxUTrUyrSt4hS1chHAp
         Sb8unTlGl3cdbm+NTUMEJ9DOqWdLcayCw72HT5GORLYCII2OJBiDP/FeVHW+yPaHXHMT
         eN8A==
X-Forwarded-Encrypted: i=1; AHgh+Rqi15D/uYBRxaviwWmLgMKBghXfVaDyMQRGf3OkLPK7FaewlrdTxIxj667POtrwEOz6feFtlXZfxJVwDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvyeGM0cvk1TS4HIciLBZ6G7JNiQ6iGcvlXdVr7h8FL82oGewD
	Tdi5HYvXBLonGmpY5Sw6UGHZPhCt5jA+vXf2djASzz6w+0ygqkW4SiSBevcmKjdR55vSLKR7tyn
	4Zpg0zatMFQzDnaYY8fv2IuNkqMPn8+ZW0ENZnTBvt5PPRs9P5OOllXvN3NK2n1F7ug==
X-Gm-Gg: AfdE7ckL3eyxGv5iABLaDLLPk0R2j0EjHeNkp9zhs6NntmNvtHAt46WBqOVfaa9mtRa
	yloZVQvvPXnMnUxCeg7Zl8/NLUSdnqpy8/aAXIQimyIldQ4JQ7gcteBEeLpecibcB/9Kjnqb4l/
	CrC1GLKFkr3wfe2AANnu5YQGm0aLRpbkOFIWVxyoNiuBxt0B1pi+X8l2DDVaI2IXQJhYSEG1or6
	6J/GLyPw3Prv0B7mGPo7oTiqghtyG66c3LN0We4CAEBb307SlI8TapeUNjNF6u6Wykx4Fv50rBR
	542B6r9lmJbqkQABLXiroowBxyJCsvVoYgVem31jfrHVLPy+veN6q7VzxFI9pdtdgxoF9Hgb9pl
	wO1ShSXQvl3XpPAiwtdmsnr3f3kn5toQCY9qGsA==
X-Received: by 2002:a17:902:ce12:b0:2c9:c46b:1286 with SMTP id d9443c01a7336-2cbb9eba53bmr79826185ad.34.1783280478039;
        Sun, 05 Jul 2026 12:41:18 -0700 (PDT)
X-Received: by 2002:a17:902:ce12:b0:2c9:c46b:1286 with SMTP id d9443c01a7336-2cbb9eba53bmr79825855ad.34.1783280477546;
        Sun, 05 Jul 2026 12:41:17 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:41:17 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, sound-open-firmware@alsa-project.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 40/42] misc: fastrpc: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:16 +0530
Message-ID: <20260705194019.2565498-8-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX8CFX171qnmrB
 bvzotdU3Xi8NJqYC+rsViFU+y9SkmAcGBTQ2PgY9piQ17ulIDbSyQ+YrMNERKy8xp4B58z1ISwN
 clxQOVvu+uCKXnyPY6uCiFb/rhgNEAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX1WxRXWLgGwfI
 Xv+bDxluteoabJ4Kxx1fcvKzXc8jT6U6JS5cvokfJH5LOPjXgRJZBuEn3ERNTC4gdJPx6Zq4u/o
 AIoRWX1npJbfsAfBdeNiLOYfaJx08w/W3HRjugAstnZou2vd2lYCnxMXyigW677J/hUV5emKm1G
 q8ZJGCI86bdnz9slyyLn77Ce2vNM3wkRD8vUFYWDyvfonLr7la4R1YrT45JlDGiFvQyheeBO3yG
 bENCIDdKgfjzI+3cPsKibrhjesLlb+uCw/vsDs1oqlVL9KMIc2B6KLv9LeZ0KnIHr70wtIhvY+j
 hhUYSeEwZTJMP5uOrmumPTi/2o3GDeP9CI0b35A94UmdJB1hWHbW2H6hCl1wbU68N8f9AUtajNX
 uHmZtLWTgDDMfMdctijLpLbZEAs2ewQBckTAOvZ7JZkgFt3xkUJgey1P5P45kWajaTlPXO+3iRM
 KIOHmBxyK7xND2Hg7DA==
X-Proofpoint-GUID: 8L7mLx2AFUSF8g6Oxk-ySWpzpZlR6__e
X-Proofpoint-ORIG-GUID: 8L7mLx2AFUSF8g6Oxk-ySWpzpZlR6__e
X-Authority-Analysis: v=2.4 cv=b9GCJNGx c=1 sm=1 tr=0 ts=6a4ab35e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=2vM2yDDFhuSsTauGYd8A:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing of_reserved_mem_device_release() in fastrpc_rpmsg_remove().

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index d86e79134c68..c4e05b0db527 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2396,7 +2396,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		return -EINVAL;
 	}
 
-	if (of_reserved_mem_device_init_by_idx(rdev, rdev->of_node, 0))
+	if (devm_of_reserved_mem_device_init(rdev))
 		dev_info(rdev, "no reserved DMA memory for FASTRPC\n");
 
 	vmcount = of_property_read_variable_u32_array(rdev->of_node,
-- 
2.53.0

