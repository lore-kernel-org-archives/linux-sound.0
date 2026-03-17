Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2633C196B
	for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 12:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773751027; cv=none; b=mpPNzkn2kCkFE2KLNTtPEK13GRk6676yzquLsowPc0kLEFEmgbKj7ZikQ0SOI/mYv540IGNSlXrSLsm1RPhbzQHFgO7Dt+neQvZPS5dRxtRUqwC0R5HEhabP7StTynmCkIfSBlwoxRqeGHReNM6MO2exdbYmr6adcjLPWzwufRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773751027; c=relaxed/simple;
	bh=D6+6jus/li56x+pBYY+b3ZKTjJKdSYbftq5axc2thAk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hF8Ak0ZFWYZeWfAv/L8nKO8i+C1pUwHbFJYemmTWlqCnJgRI/3zqw2v068GcXLeyMwLJELtFIfFK+XAITZHsniAO2ZnrhJLyImT9ZP9mwx+GRlBZhQyTm/F1X/baiGbKKl78/2/N0wvn5XmmKLDZJ/MqD6YhBtmqJoYQV6NUQh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eEVe1rbf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VxHMNCaz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eEVe1rbf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VxHMNCaz"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H81L2X3295184
	for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 12:37:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d4K2m8EmkyTuCsbQro3hOXDA/sCvLpdG20NK5RUNXH8=; b=eEVe1rbfQl4RZOik
	kQmOfHy9g+KUrlgJA7nyceTXFe0TTiu5JQMZBV7XkZeYhx4eiYR5fvWu31JRsoQM
	BSsRUzV/HsH5gO8Zx4w/l3n3g0rkDC77kqZd3O6JRHBheLW24HNuYuQ6SGjkcAtE
	igNfHp2k3qDjCH5fzYQFinHX0+svqK3Rsn89vuyaZRM5tu9VBzHsM1ZdoTTRuzwA
	MRIwZKGuhwjm4D4HBS4W8d+J84PRHyYCnAJY1O+duNInxSyPxeEdzE0pAR646EoS
	4yQTFZZFy52G5bC67PKtq2uu7O6wURjX9bpzrz+WIi70DmkqCaEmg1hgG+JysvHc
	vNVLGg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxkuy40k7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 12:37:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd85e08fddso6030834285a.1
        for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 05:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773751025; x=1774355825; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d4K2m8EmkyTuCsbQro3hOXDA/sCvLpdG20NK5RUNXH8=;
        b=VxHMNCazWlakG0rQg23ZlAteiuqXqnP4sYTnnJfrAGWP0503AXZr7Gw/wG2korN4PT
         Xj2qwKrD6aYQ6R5GLekvFnQ3emta6Wc85oQKuLx7603hUlNDOwDhRu7c1YUQXxnfRlMt
         dB1tSUxJvSjYI5W8CX88zpdtyWe1lzE/hDnV+m+8qsZ5Q9nCA8oSLt1X4XFzbPQTNCrZ
         oZpCD9AEIEj4IRKcxq0raclQHgkurb6+UZ12xUYQNFazoBKH6luuxoZtfkSPtKDs2j+I
         eVpLDNNgItLR2386K+MR7rUQIkoBkZWyD81V1TxvdatJblbAq8jr/Qe4nL7zGKQ5UcFz
         HAPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773751025; x=1774355825;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d4K2m8EmkyTuCsbQro3hOXDA/sCvLpdG20NK5RUNXH8=;
        b=Y8Oj8nz/7Ms15Duz4zgNsVL5b1y39f3a9jfwMyxbqrA0mtgOpMlJHAGj1UOkDKjk2T
         8udV7yFeqwRnfJ2gwutI4ZpoEbbsd7F8MjgD95e8IhlnCcFimlxqJkL1v675yoOhFwE0
         dDCtt2OiXMrfHJabYg6XEWslUFDzzX/8WIq7IuUTkJogDTwNlRvY1FxrfbXAfSLosCU7
         fRZ2UkEujLYalUHjOr7OiMaexUEqdSo2Qhc25SKM2L952wdUVAQX5OOLxeVeRN2FppZW
         5bh3BsAwFLK1rWjQiPdT+Fc3kmYPt8tjmGy4c+MAYIkMW+hYkTSLSLUD/P7J3EJc0/d6
         sXKg==
X-Forwarded-Encrypted: i=1; AJvYcCVC9tC6ExT8npDETM2JKm6C785SnEQCOHtG3zBGtXnVJt1baNI94EomgBY1nxB79V7v+kRikfNKdnh1qw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPD5+jZujlMU0EemOQXXdn+psP148h405Xc1US1e/G9ReNVe5y
	zStAEroS9c0ni6p4xq2mK8nL10L9iN5BYVlNsPkXRaW/LeFcWOcxYwX6R2Dsf9ZczGEBdGndacH
	QNfzeHcNd4g9ASKF5IbFOV3wTnup3U2jkcuPFHkqHX1Qi6mxJ6Io6lh+Vlhynrgru3w==
X-Gm-Gg: ATEYQzwvr4PNY9rWaZ1ZMtsbWgGSt0yGTtR4WcOaPqJqMTmgNp+qV0Bwym1e3jJLS7R
	kqsteaZYoV3bFuGIYr0u2hvzFmdyI4ofUxrDG8XzmEn0WA5OqoCJVTA92Bcdz5zEOV0rNLpIeWC
	sMS0WA3VPPAmETPrqYu3Xt5V7ffLsk2WpoVCqjrqqzraj+/5xwpiTi0gx/A/c3dCBv0zwn8gdtu
	3Ke8sa07IONLyxGILFQ/oyk/kT2cq+1/PjIq8H8gc31UT7dkkyfXcPI1dIixXJ+hlJWgOskSTYx
	OWtssO9WtK/2VLFCNTwSOj1A+hxFdnBBSyOwKkPPD2BgoeiNCnK9Bibnb/OkJWf1mVIDcPG8//H
	Wjl5Wpu9wbiPX9xVw6ltJkYLCNCMN1wWrrv+gZ1b++89b
X-Received: by 2002:a05:620a:2590:b0:8cd:8938:eff9 with SMTP id af79cd13be357-8cdb59fff5cmr2252382685a.1.1773751024752;
        Tue, 17 Mar 2026 05:37:04 -0700 (PDT)
X-Received: by 2002:a05:620a:2590:b0:8cd:8938:eff9 with SMTP id af79cd13be357-8cdb59fff5cmr2252376985a.1.1773751024311;
        Tue, 17 Mar 2026 05:37:04 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1abf84sm45556443f8f.14.2026.03.17.05.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 05:37:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 13:36:50 +0100
Subject: [PATCH v3 1/5] remoteproc: mtk_scp_ipi: Constify buffer passed to
 scp_ipi_send()
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-rpmsg-send-const-v3-1-4d7fd27f037f@oss.qualcomm.com>
References: <20260317-rpmsg-send-const-v3-0-4d7fd27f037f@oss.qualcomm.com>
In-Reply-To: <20260317-rpmsg-send-const-v3-0-4d7fd27f037f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1795;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=D6+6jus/li56x+pBYY+b3ZKTjJKdSYbftq5axc2thAk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpuUrnOx+lHsgQiNOkTmEDx+3tpumic0NjHLRS3
 KqB60rCDL6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCablK5wAKCRDBN2bmhouD
 1y25D/kBPvJvGmbh87Tm7p+4o7yQwfwul6JXdr5rhanHpwawDTxECRfEZQro72/xuExaXTi0NW8
 +ogE9W9d4Nje8UndJGvSCSMqdRh2SbV5JAm3KM/4glNysoCAkl0Wzq33oKSyOSb35g2KfmdZ1Fh
 3ZIP3sFnZtuGlju0BnpbXgBsoZSuYJzk6DNo5jphcPjy1Vv2nySE89AUID12M55fqJlwSFsboJZ
 nOwz2Ilyj2Ps3B6pVrwgsP9o8zimsmF1C3y0hQD1/UL50ojAde+rY35dZ9o4gdK3K+jbATigoYd
 t2hxRXshbdtsSxuwFn2NKPOL4k07JHcpJXjHzvl/ED+1hO6zKT6oeGPh452/qPhsfp+WX6VC1pl
 rNF8xXyToTlmgqPC7c0Fh6UvYgNQQz5pkwJbssWoSrqV6vttgXutrbVOUVTqAVPnlkwtGxLGORG
 ouDPyNqRbc08FxOryo3mAkJojtfOgGoZ+D9r4hZOEUMZnFC6yi0xAVLyj8dcmlg641NoXdFeDhR
 1eAOnHfpMylnUdbGgV/GZsGefNVvEqndiDTGWt9/8aQIIuCkfyIBgXYwIvCVc5QNLItPeVO/xVb
 kfR/E7hD+CEjP7vN784wOEsqW06CK3+iIsKX5jBjmvdf5nISIEOWMTvYl7rNgl2qYuW4nJMfu8c
 scpWzdKfIwpCTbw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=br1BxUai c=1 sm=1 tr=0 ts=69b94af1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=aY2cFw3b1D9xo--RORcA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDExMSBTYWx0ZWRfX9V6hIct3ZibW
 4/fuhnDc+5kefipqosZ2zampRcVM/CxWLdwWzWCbEqBsJoVkvCCmLSszRtDJqQw7XejxU4xilOe
 eRyAwY95P3eg+7+190XnZ36/Dah2S6QtHowdRPENKYoOxTlD21Hrv+1GByZTg3xueLwX1uQWfOm
 G8ZIjFtC1l0JJ08M9F/n5KETBxC6SCI4XH6LgJG2qbW4zBJiqEKlQcwRQyZlmU4B2rtomlvab1C
 oXVKfX/5qY3ajT622KhhevdiYH2YnEvI1Frb57bEB19bvpdDnnMUlDQkuXaUfvl0J1neORVUU4p
 +qb4wH/1+vNnKX8r9D8GXijlgnhgzUki6sk/VAfKWYm1g1u7RAfbG/fIn+EAICF50r7Ao5DG8gw
 3RVjPMTvEvQ8z10P4kFUo+/ocjf1sYVeU3hQGU65HhcmtZqXNjWJ17jITVBQPc+vehRP/cAOvRN
 2xW1s5kobh3IT70h/RQ==
X-Proofpoint-ORIG-GUID: 5vQsUrZZJr2-zhv7D-a6_R4F79NqEST1
X-Proofpoint-GUID: 5vQsUrZZJr2-zhv7D-a6_R4F79NqEST1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170111

scp_ipi_send() should only send the passed buffer, without modifying its
contents, so mark pointer 'buf' as pointer to const.

Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Patch necessary for the further patches, please keep with the rest.
---
 drivers/remoteproc/mtk_scp_ipi.c   | 2 +-
 include/linux/remoteproc/mtk_scp.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp_ipi.c b/drivers/remoteproc/mtk_scp_ipi.c
index 7a37e273b3af..ee2f1121411f 100644
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
2.51.0

