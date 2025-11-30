Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F21023A98E
	for <linux-sound@vger.kernel.org>; Sun, 30 Nov 2025 12:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764506182; cv=none; b=eecpStJLqsVaQX7BLmNRF+Zu3J8jptKWroY4GVeHnvZsdW0P9b1KMVeSmp3Cm6oHOjXRQvzytYEdlNJCcLBPtBDSG0/tBrNh3AWgM4q+9pTexschbmiHV2cjTqOm5k2jpdgKjJXRVpV3nzNTt4sdHkFqgK99T3EOmGq36QuY46g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764506182; c=relaxed/simple;
	bh=pq/+nMdyC+q1ogI0/TIhIirNxNxs+pUe22DWF7lVnBo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rNlEZ4hetyr3JUaGEFpwNigiO4lvIJZmSSM0gUo/bFjCXVrRez3RMUTiVLXZqxDf133yBErglNUfsggVfqjRmib67n9QthauKZFRJQR37/YivhJ4mkiPfohKwY0QZMiUtOjOW9Cs0x6NY5CcwYcCs56ERE0+IH4AIpkAR/Xstfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TpxT7ZCn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LtCbQ7Uq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TpxT7ZCn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LtCbQ7Uq"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AUBgUgK1236371
	for <linux-sound@vger.kernel.org>; Sun, 30 Nov 2025 12:36:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e4n62F7hOmaFjnTCj5sDtBY7XKAle/kgKH/bYoDqk94=; b=TpxT7ZCnor5T2yg3
	AKgmBbRB5Pt+U1lPauoLJS0xDRXqqO93uwhjmP1g6U+ru+mDj19cHM5kXCpC8xkb
	/DN69xmHIx9y04/TtZbcu1pxjRkSuucpZ9iiwmkGW1hHgIi0UInB/FM5GCtajS8l
	TanJTGLjX57AHO7tDv6nG7LBnQEh+QEQbTR1m39m8bY3G9NaHZFEgiuBVZQrnhTO
	XwmXHfV8aZ6TyHXrKZxwkYVQb/aXqogQMz1Jv/TEApwBm3Ix/XcKOAc5eSMNmOI3
	leAWHVHZ1o6DZK8hoTcfOOKkZqFLsquuCNVbm1E3hTiPQ0e+MFomBCu2X+R4SAbh
	/NR0sw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aqphfacg8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 30 Nov 2025 12:36:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2dbd36752so640477585a.0
        for <linux-sound@vger.kernel.org>; Sun, 30 Nov 2025 04:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764506178; x=1765110978; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e4n62F7hOmaFjnTCj5sDtBY7XKAle/kgKH/bYoDqk94=;
        b=LtCbQ7Uq/BzPpb4T1xFw1AQDVEJc7u9pgsBxbmaY8bb+CgM5HTw5Y6yA/K0cvMdEj7
         ZyEaHWTE9YOcsOzHp0W9bDZAVqciKvbfTtZvUqtu96up2t4r1zUszAbHIVpySEUj92W5
         Lhwz353U41YMQVr5QwdlvZQa6xaA4HYwqifijKMAoN8g8zBxuNCkTvCu5nDl46jpotBr
         5Rc6MYt/E5jmBSWYsq9rVmbIBrMa6rBH726AzciZnvuwmm3jQteBWPcI+o6iI/90fxOr
         3By7AWrG7g/ftBrV0db1TK/STgxCGtcd1lnvoSzxi/dQ0bPefpfin/nNlnhnnzf9T8+S
         p+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764506178; x=1765110978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e4n62F7hOmaFjnTCj5sDtBY7XKAle/kgKH/bYoDqk94=;
        b=XskR1C5kv709ZbAEZzV7Aio4uMzGqhzJdGTGoUWt89NQU0l2E8QnAww+E0R+6y+LI9
         EenhCPwgXKtaLoiizbkXgKbrMYzNFetma6pX0S4uNg6f9vUuSgJgvjWDksqkhMie3QzD
         qZOOpEKWYMupb67PCP4wUeZcCtLWsxFyjiNvXMLf7C0NxU6z1DGKIW01aPxiZIkqvmdB
         /Psh3YpRL4CVmp8C2i19P9+QN6q8KsjmO2VZXT1stpLVatQh/FXIaGm0yHkIyQSmJmIg
         XuZ+fCURYtKxHshvPCvhOq5OoppOzMMksAFw2uiq0pCqhOuptJzHPdjZAbtggLENyLA3
         FrnA==
X-Forwarded-Encrypted: i=1; AJvYcCVnlMRXt4b7mol6jVlJNEVrHqqVEPlxYBNMvZBq+1fasRO0AfhdfM+T7V+eZSflKstCdGzE5fHUSBHx9A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2ghpEq3ollFDXYjeMucdjUxnji7L393Ww9RNLzq/NqmgEa6P+
	Gzx0ai0pWr80jH4bgO76zSqxBggQjZRA2jDGA14rOE861+SKZ15lE+RoFKclPj0CYj/FuIb+Sct
	ebJoBW7blt0fb4tHOff+sWaKWHfOyEKvHiC15hjFuUQA007mByBBsC19p23GJd9ZeQw==
X-Gm-Gg: ASbGnctjXMyKQLhfjSgRN1wy/aY/HZZV9e+9RoZhEg85VlbSZZDfySt7cLR9YFJIfre
	9XmGqclxd0iYyP6QbkLZW8ds+xpOymj6RPSYUaA4/EIXRoleBpTXd0ruhLsi+WyGmSP9Zw/rYTL
	M7Ax0GHc8HRFlthjYzYcPRi5ekMgeFsDwuv88DFeIQVyjDO6/kpcps3m/9a+WQIBf2YuLymi2Y3
	2y3R+W/N8s9q1V8PrpIlKsfXqJSU8BaEPrgLfjCzOZxQ6D8e3dc+fSgRJTibPI+w5Lsj4LdsP8X
	BkxrsoLqieB+z4Q4wamvsuWisz/y4iLU+4fjkb+Enwm9ebdfruk3lOFgfSjnpQ02ateTU2h/hSj
	ttGGqk/qo3PplLbYTm+towHw3IuYZxdwxIQ==
X-Received: by 2002:a05:620a:4509:b0:892:eeb9:4def with SMTP id af79cd13be357-8b33d4cf9d0mr4721866485a.49.1764506178423;
        Sun, 30 Nov 2025 04:36:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEwd83+g8q92x1y4CWxFdCnR6Wp/D+6ypCjsLsXp/d0HHxg4TfXOyYZHiS3ejZPS6LsXDPMgw==
X-Received: by 2002:a05:620a:4509:b0:892:eeb9:4def with SMTP id af79cd13be357-8b33d4cf9d0mr4721863385a.49.1764506177949;
        Sun, 30 Nov 2025 04:36:17 -0800 (PST)
Received: from [127.0.1.1] ([178.197.195.159])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f51c6c12sm920506666b.29.2025.11.30.04.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 04:36:17 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 30 Nov 2025 13:36:08 +0100
Subject: [PATCH 1/4] remoteproc: mtp_scp_ipi: Constify buffer passed to
 scp_ipi_send()
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251130-rpmsg-send-const-v1-1-cb11c7e0a024@oss.qualcomm.com>
References: <20251130-rpmsg-send-const-v1-0-cb11c7e0a024@oss.qualcomm.com>
In-Reply-To: <20251130-rpmsg-send-const-v1-0-cb11c7e0a024@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1658;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=pq/+nMdyC+q1ogI0/TIhIirNxNxs+pUe22DWF7lVnBo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpLDo77EwKqXOJTM+99Uw/WZdDbkh4LZ6TE7MGd
 58HKTs3HPSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSw6OwAKCRDBN2bmhouD
 19GjD/4yqvoVdSiFtXLgPtSNjWBghlWA484iGQ/nvK11zYtmLSt73fjHu+ppUkACDE3Gzj+MQW3
 GDtp6bRzB1dZ3QT8+hLu/z1ccX0SfUdcsfvl8p/37dFdHApMe6rolFyGrlIn2G8TYijT3nYGyB0
 izR8XwMJza/i4Fmr7yUyAAbVxOeHbHI3TF5CozIZns+a8GS7giqH2FmroISq6Lq16y0TDHRwJqU
 A7ZLWYFUb2KyJTNwdjFO0sfjVkjqx8e/PKvM6Bzs8E3btdilFt/KcUIM6FXwFsUSUDpuuiRQPqt
 Qj5mdGUxGAffYx5dow27iCxx6uemvTGdgakcUyiQCaQuCytEbDlh8Ocm9SRF8XuTaldc8Wtagkh
 qNyDq8rMPwMzoHaW/BS0a54JrP8GZfP+40GvH+Z58mM7JNH6UoevmOFeyzT/u6PQ4QAA/4sskOK
 gapow81/rauguxhutkRhwgqWvj3E7v9wSscxUC06Tk4DILYqPcd4gzxySFbYZrqEgx7xXie2fDj
 r9mOc69XtfZRc9kYxDe15n5d6KEqv/5+uAg4SOlFfKoJjPjNu3LRCs1QldniZqnGgp33WEh3kbU
 gRIEMvf47RDpaZ/ky3EnM/viU+sU8FftAtiEPtskYBtbQqyRQD3BLdg0yLoExpWQ4Qro+t2IVvW
 Ps0SCz8LoJid2Gg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: fxtXa4CrMbPxgJhkeNVAsdJsPp_m40aU
X-Authority-Analysis: v=2.4 cv=FvwIPmrq c=1 sm=1 tr=0 ts=692c3a43 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FPK7cjBCgYbqzSTDLBmM0Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=bWW22GgIgZmb96Hp9REA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTMwMDEwOCBTYWx0ZWRfXyWmAtKJ71de1
 Iq+aJQ3DZxFl67s5iN+6fdZcV9lnQ1aEt46mrwau0Swk29Z3s8//jjc651ThspTH4EoT8VBDTMS
 RGm0AYkqY/+V/2T96xKbWLWgNtte5J1pBbqBS9sSmYsEpSJo239tHj3ZLfPrndyjdP5k0/1d6+l
 9S/0W1L3wi7FoqXLIzlJb7JW9n0/n7RyWexYIipU83Y78WRSapr8ARjBUoOWQ1fEOpqs7dfXLxI
 mQYgnwrGgm9RCLgBOKYXxGsjfhoOdfDz3bdaV3uY3dtZ6ATlAW7lsTyqN3DQXVhH1xJ/kYXnANE
 2mEjeOenqqZtQ91rkGSbqJwG4w3xBzCOFXWFRr7tcvll0PUMxxCMDs8SvY1P6DwsVRgzLSHQwzy
 HVeHx0cGG0zSP41e3YB92fUtxPXUwA==
X-Proofpoint-GUID: fxtXa4CrMbPxgJhkeNVAsdJsPp_m40aU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511300108

scp_ipi_send() should only send the passed buffer, without modifying its
contents, so mark pointer 'buf' as pointer to const.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Patch necessary for the further patches, please keep with the rest.
---
 drivers/remoteproc/mtk_scp_ipi.c   | 2 +-
 include/linux/remoteproc/mtk_scp.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp_ipi.c b/drivers/remoteproc/mtk_scp_ipi.c
index c068227e251e..bc1ee82cff36 100644
--- a/drivers/remoteproc/mtk_scp_ipi.c
+++ b/drivers/remoteproc/mtk_scp_ipi.c
@@ -156,7 +156,7 @@ EXPORT_SYMBOL_GPL(scp_ipi_unlock);
  *
  * Return: 0 if sending data successfully, -error on error.
  **/
-int scp_ipi_send(struct mtk_scp *scp, u32 id, void *buf, unsigned int len,
+int scp_ipi_send(struct mtk_scp *scp, u32 id, const void *buf, unsigned int len,
 		 unsigned int wait)
 {
 	struct mtk_share_obj __iomem *send_obj = scp->send_buf;
diff --git a/include/linux/remoteproc/mtk_scp.h b/include/linux/remoteproc/mtk_scp.h
index 344ff41c22c7..4070537d6542 100644
--- a/include/linux/remoteproc/mtk_scp.h
+++ b/include/linux/remoteproc/mtk_scp.h
@@ -58,7 +58,7 @@ int scp_ipi_register(struct mtk_scp *scp, u32 id, scp_ipi_handler_t handler,
 		     void *priv);
 void scp_ipi_unregister(struct mtk_scp *scp, u32 id);
 
-int scp_ipi_send(struct mtk_scp *scp, u32 id, void *buf, unsigned int len,
+int scp_ipi_send(struct mtk_scp *scp, u32 id, const void *buf, unsigned int len,
 		 unsigned int wait);
 
 unsigned int scp_get_vdec_hw_capa(struct mtk_scp *scp);

-- 
2.48.1

