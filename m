Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598F83C4540
	for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 12:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773751036; cv=none; b=X8yTEcF0TukPs5sHFZDKFE0CCBvO5SDBq4t9VEoM8MWqARvxNfrGQOjj/Og7VsPFvM/mFP0bRZorIGxKUQK4YKExBjhWg2Xda9b+2C1p1za4z89K7sBdA3aHNgUEEf96ZdkCwZZRh1XNKwf3h4nX+wmBPLxqu6KznFgu1Jru0bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773751036; c=relaxed/simple;
	bh=ZGaNsAO6/SWilsi2TVuYP5VxbCn0rn/v0fIwUe7gK7E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DL4JkzfhMxwcFmrmHa9HH0Wo2mYC22/mBfV1XYE/OcnCzCUjKDHVAzHE1tSCobHB2z/uXSTgqqpepxIuegTPNabgiaZd2LHN/xBPHnXEQAei0BAho7EGIJ0N/lMb3jBGgkXQ1dVvG+qkkFr3l7UKajy/jdHHUkNaT2Z8zPDWYS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bmxbsWPs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S8oIJyOT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bmxbsWPs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S8oIJyOT"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HAjutK254208
	for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 12:37:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CY7V8gX74TZqrDxFU4lOxNwDl1sUPFKbOeuUpjzoYZc=; b=bmxbsWPsiiKK1sv7
	MAIjjzQGA6Op4Ez+yNJNtT0yUpe54FD8rLVAcdlkp4yN3Nn37ghPw9Xl69vFIEed
	kplsOXxKGglYkMIohmP3GYibKd62/1XpfC2Ii/EZq/p927zTqmcdARCJQ4QBzf/j
	PZjUDaiCYDhsYkDi8F4gtMy5g5cbzCCx29uj6/pexDv+q1ehSmmI6R7r1iNTFVXI
	TYRhVJK2EKQt9WKG7X4mqBR38jwppv4MWBG4/e8+s16BkJY7de3Gv6I/aWJ7mk9X
	ZG9Wo3qc+xoGir/fCOMor5tUcZX2ECRu/g3XdOYU//7jAN4OCSGwASDHrbha6Vdh
	oK6AtQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy5g8gb9v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 12:37:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd7a25c5a9so547390685a.2
        for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 05:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773751031; x=1774355831; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CY7V8gX74TZqrDxFU4lOxNwDl1sUPFKbOeuUpjzoYZc=;
        b=S8oIJyOT4pZc+I317oO9Qk+HWMXkr+GxRtr8/gJd6CfFbZWphJ9zj+DksWjknSQK0y
         HIEclJ+jURE7LJs+ekZpIgCbZMJcvPxi+HP5VXelLEhag43wAK2//P6DNaDuXDWGHdtn
         5wFXGGYD33UO6rK12Ux3QEEgJCWNxOVfZusnXmQpmSCIOI6L79cjGELBkMjOycNJrvqR
         dio5DPfRfLAtfgNpiXZ1tQ4yauzRGzIaB1ukR0oUSTFtVEECrc8use9p+akYv+YXdBMK
         hvLcRmD08zKpmDPA4KKD/5+uUOuOVugvB7VRSycxPdRg+ZFiDWlNxu6PmoK2WHFJDrQU
         8pMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773751031; x=1774355831;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CY7V8gX74TZqrDxFU4lOxNwDl1sUPFKbOeuUpjzoYZc=;
        b=IsCpXW9jKIxoUPVzDyzqjzjN3IKQQIw02MI9VsbDZ+/yQzbLfV3A2WoOREVn8V1oQe
         1QrhtlrhtuJRELyNS+K4DiqzQFHK6PISt7zxcXEmqjRSfbKWnGDqGUXZ0VjO1dWAr96Q
         Julyv9ze4gvwXRqNEe9KIziyFZpc6z/r0nFnCRg6cQ2KAx6hDOSqmL4/V1sIsyWydUKi
         lqScCi60jO4xVJLV2qJRlGBHVtzfrderzHtBpUuwdMQtq4HnPz3KeWgR2nm+PrvMARad
         1keTveIpkwA2sotyeZqVJ7Qikog7m3ox8MCkMOoxUeJxFENJcy+HZiG9dx08K2l4SlW8
         B9RQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMRyh4EMyxLtVK43ULu9IgB15VtSGr4HdRZ3of4JG7DHc8Ey9TA7oeFG2o/6JcYAZ2gx8ZQf0yjtlUmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzXT077d+iuBlUQ9TCT/4ebdRw/vPDPoybTDY90uYfLEBo9y8m
	lueSudntypVdn1hXkuAA2jBRf8P7gR3gSAfCl8bgWSDlA+KwjYQfIPhNqgQUgDprIgxWu0nwube
	Dj3SKxaDZrtRhU/h2XTufr6KkWUGGrWw3iH0ggdR5LhVpswU7VbsNIeNmlZALGK3TrQ==
X-Gm-Gg: ATEYQzx4Dq55qo/tXeBZHY4ZYsaQF9rZITezBbYphx06+nCL+yomgcf5eRueo3ExiGS
	/TeR/jeBo4Co4dPx4vhYDumiVGmkmC0cW0B1l1gof0GHYOMR9ycZkIlWm8NIWdxdVXCFVDgJn4t
	OdP7fBmrtFLSuxRaWLuTy+BHIhrmMTEsbAjCJQoVAtB4z7IL49hjercgkvTAdJAMgNieQFZI9A4
	QkgxthwE3NrmeWSBkM29JJjR6vLYwTZBLJNvj0JHMaGfcudrnu3M7s/8zuleWpKWcVPwLFgCHMS
	tOhwBGd9RMbbaNvnk13b5D9x/6i2CKGzZHlupbZSU0aOZkQgwpMllSP5DRRqPO54UZoM9iKXUiN
	TKvst3ZESEa1yH943+eXnP8HoIXV+Y0HSwH0OwCr2JTa+
X-Received: by 2002:a05:620a:4510:b0:8c6:a034:9224 with SMTP id af79cd13be357-8cdb5b1b110mr2171252485a.47.1773751031477;
        Tue, 17 Mar 2026 05:37:11 -0700 (PDT)
X-Received: by 2002:a05:620a:4510:b0:8c6:a034:9224 with SMTP id af79cd13be357-8cdb5b1b110mr2171248885a.47.1773751030947;
        Tue, 17 Mar 2026 05:37:10 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1abf84sm45556443f8f.14.2026.03.17.05.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 05:37:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 13:36:53 +0100
Subject: [PATCH v3 4/5] ASoC: qcom:: Constify GPR packet being send over
 GPR interface
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-rpmsg-send-const-v3-4-4d7fd27f037f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5845;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZGaNsAO6/SWilsi2TVuYP5VxbCn0rn/v0fIwUe7gK7E=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpuUrpKjAofV9NFYyslhVtg3eHvNPA6ap61m6fl
 5lWEvWjp2SJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCablK6QAKCRDBN2bmhouD
 1/kED/4imG8+I9OWKdgGF1mHR2e5RwwQa3uvCrPu6Qx4PoY20Ahr55T0gbApJbEYUeAG8PigeMj
 LtznsMoQ1QW4zL6ULOlc6nO31/NJq5HpGcmjWGYgvPqN6vB/FEhUgeYv2JF1lkvbncWLnEvzMgM
 2KDPbRUZbY9v9sO9dg8QFhRQnUtWPvB9aQY7h365y8nYk96vj2HGnwoN0IfxbDwjNgs0z5ceP2q
 mHVNVCgEw48tYM+WzM/NNhVLvCPFfSnvFicB1mcrpHNgpfsqz+TEcmGU0jtMDMKbiiYuT6J9ZcF
 /anoRDwwKdrw67UWj6RZXlpSr3COQ0sqe4d3ey/w6Q2hKLZ6uH91YLbJZ3Ql1zhV/X3t/rjmUu6
 519R0/5bkegtNGqCtcIFW9SAVKyInWRUl71QP0P7stUU8Y2ljB0Z3zm1x42M0OV2veiAvbjk5Kn
 1GpCKfjhNHwqFTeG9u1v36c9SazZvbs8+lIjsvynNvEzN2EFMFCfx6Es4PwZIiDg7+Z1Ux6wHj8
 lC9/QzoCGVxz1PqmoRJWbg81XO+4WCA7xAFOn5a2pShtQFZhVd2aphq+HE8ohLSn7rIzzx6BTSh
 7YTjJerhe5V2lyQVY0ZQXQXkurlQqlhm/Mnlgf6GGlSFKSvGogqyvCNoTIBtru20aq2EuLgTyPX
 PRkYwDHw2n6+kwg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: bNg55spBpy_Dxz5LxC5ZcwZEuXS73CaU
X-Authority-Analysis: v=2.4 cv=EeTFgfmC c=1 sm=1 tr=0 ts=69b94af8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qTtUXMQ633XYL2vtSbcA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: bNg55spBpy_Dxz5LxC5ZcwZEuXS73CaU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDExMSBTYWx0ZWRfXw0xIBIcVmHhk
 zg7L8DZ5pqHa2sq6oRzbDvi0bG0pDGeQ5aEyiLDJ2mYcIVEQtBwEVrDjGm6jViWygPc1b9suV7m
 hyupdt2BKRLa9gW+ye8HIcQO5tH3ccQ/fP8lj00A2QW8GVsp62Jdt2O7JZTSYSleut0Em5FsRxp
 Pis5ZkAHk7Pn+6Z4SwDqHz3MTIegaV7LZH/10SeNjNdS+KCSvYj52t+ueWJJzlDruTocqOY/9ck
 vArF9UxeNfuVE22mZtwCHoFTyAkFwgdS9T+laekrVfCnjcWjT0vVni9FY4fXjnphs61G+zasLri
 JOBaR8nHOFBws64JSx4eUc5zYAr3CmikDdmZsZtynby3dQxnLvOOfN/P4X/RZfwwsLexn03c8Y2
 t9mJxruuFu/oi4tkR+2XUpd3vtl6vRCwa7/OlSg9inHe1YowR6qqDgU6s7/Q99vmiADteJpuGwi
 njl2vkpyjZaDrKTVIvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170111

gpr_send_pkt() and pkt_router_send_svc_pkt() only send the GPR packet
they receive, without any need to actually modify it, so mark the
pointer to GPR packet as pointer to const for code safety and code
self-documentation.  Several usersof this interface can follow up and
also operate on pointer to const.

Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Depends on previous patches.
---
 drivers/soc/qcom/apr.c            | 8 ++++----
 include/linux/soc/qcom/apr.h      | 4 ++--
 sound/soc/qcom/qdsp6/audioreach.c | 6 +++---
 sound/soc/qcom/qdsp6/audioreach.h | 4 ++--
 sound/soc/qcom/qdsp6/q6apm.c      | 3 ++-
 sound/soc/qcom/qdsp6/q6apm.h      | 2 +-
 6 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
index 78e72379a6e0..ea7f83916d8d 100644
--- a/drivers/soc/qcom/apr.c
+++ b/drivers/soc/qcom/apr.c
@@ -123,10 +123,10 @@ gpr_port_t *gpr_alloc_port(struct apr_device *gdev, struct device *dev,
 }
 EXPORT_SYMBOL_GPL(gpr_alloc_port);
 
-static int pkt_router_send_svc_pkt(struct pkt_router_svc *svc, struct gpr_pkt *pkt)
+static int pkt_router_send_svc_pkt(struct pkt_router_svc *svc, const struct gpr_pkt *pkt)
 {
 	struct packet_router *pr = svc->pr;
-	struct gpr_hdr *hdr;
+	const struct gpr_hdr *hdr;
 	unsigned long flags;
 	int ret;
 
@@ -139,13 +139,13 @@ static int pkt_router_send_svc_pkt(struct pkt_router_svc *svc, struct gpr_pkt *p
 	return ret ? ret : hdr->pkt_size;
 }
 
-int gpr_send_pkt(struct apr_device *gdev, struct gpr_pkt *pkt)
+int gpr_send_pkt(struct apr_device *gdev, const struct gpr_pkt *pkt)
 {
 	return pkt_router_send_svc_pkt(&gdev->svc, pkt);
 }
 EXPORT_SYMBOL_GPL(gpr_send_pkt);
 
-int gpr_send_port_pkt(gpr_port_t *port, struct gpr_pkt *pkt)
+int gpr_send_port_pkt(gpr_port_t *port, const struct gpr_pkt *pkt)
 {
 	return pkt_router_send_svc_pkt(port, pkt);
 }
diff --git a/include/linux/soc/qcom/apr.h b/include/linux/soc/qcom/apr.h
index 6e1b1202e818..58fa1df96347 100644
--- a/include/linux/soc/qcom/apr.h
+++ b/include/linux/soc/qcom/apr.h
@@ -191,7 +191,7 @@ int apr_send_pkt(struct apr_device *adev, struct apr_pkt *pkt);
 gpr_port_t *gpr_alloc_port(gpr_device_t *gdev, struct device *dev,
 				gpr_port_cb cb, void *priv);
 void gpr_free_port(gpr_port_t *port);
-int gpr_send_port_pkt(gpr_port_t *port, struct gpr_pkt *pkt);
-int gpr_send_pkt(gpr_device_t *gdev, struct gpr_pkt *pkt);
+int gpr_send_port_pkt(gpr_port_t *port, const struct gpr_pkt *pkt);
+int gpr_send_pkt(gpr_device_t *gdev, const struct gpr_pkt *pkt);
 
 #endif /* __QCOM_APR_H_ */
diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 241c3b4479c6..c84e098230c6 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -579,10 +579,10 @@ EXPORT_SYMBOL_GPL(audioreach_alloc_graph_pkt);
 int audioreach_send_cmd_sync(struct device *dev, gpr_device_t *gdev,
 			     struct gpr_ibasic_rsp_result_t *result, struct mutex *cmd_lock,
 			     gpr_port_t *port, wait_queue_head_t *cmd_wait,
-			     struct gpr_pkt *pkt, uint32_t rsp_opcode)
+			     const struct gpr_pkt *pkt, uint32_t rsp_opcode)
 {
 
-	struct gpr_hdr *hdr = &pkt->hdr;
+	const struct gpr_hdr *hdr = &pkt->hdr;
 	int rc;
 
 	mutex_lock(cmd_lock);
@@ -622,7 +622,7 @@ int audioreach_send_cmd_sync(struct device *dev, gpr_device_t *gdev,
 }
 EXPORT_SYMBOL_GPL(audioreach_send_cmd_sync);
 
-int audioreach_graph_send_cmd_sync(struct q6apm_graph *graph, struct gpr_pkt *pkt,
+int audioreach_graph_send_cmd_sync(struct q6apm_graph *graph, const struct gpr_pkt *pkt,
 				   uint32_t rsp_opcode)
 {
 
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 89f172aab8c0..6262b9251440 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -844,8 +844,8 @@ int audioreach_map_memory_regions(struct q6apm_graph *graph,
 				  bool is_contiguous);
 int audioreach_send_cmd_sync(struct device *dev, gpr_device_t *gdev, struct gpr_ibasic_rsp_result_t *result,
 			     struct mutex *cmd_lock, gpr_port_t *port, wait_queue_head_t *cmd_wait,
-			     struct gpr_pkt *pkt, uint32_t rsp_opcode);
-int audioreach_graph_send_cmd_sync(struct q6apm_graph *graph, struct gpr_pkt *pkt,
+			     const struct gpr_pkt *pkt, uint32_t rsp_opcode);
+int audioreach_graph_send_cmd_sync(struct q6apm_graph *graph, const struct gpr_pkt *pkt,
 				   uint32_t rsp_opcode);
 int audioreach_set_media_format(struct q6apm_graph *graph,
 				const struct audioreach_module *module,
diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 44841fde3856..3527ad1acbca 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -29,7 +29,8 @@ struct apm_graph_mgmt_cmd {
 
 static struct q6apm *g_apm;
 
-int q6apm_send_cmd_sync(struct q6apm *apm, struct gpr_pkt *pkt, uint32_t rsp_opcode)
+int q6apm_send_cmd_sync(struct q6apm *apm, const struct gpr_pkt *pkt,
+			uint32_t rsp_opcode)
 {
 	gpr_device_t *gdev = apm->gdev;
 
diff --git a/sound/soc/qcom/qdsp6/q6apm.h b/sound/soc/qcom/qdsp6/q6apm.h
index 7ce08b401e31..a39f6046f886 100644
--- a/sound/soc/qcom/qdsp6/q6apm.h
+++ b/sound/soc/qcom/qdsp6/q6apm.h
@@ -138,7 +138,7 @@ int q6apm_map_memory_regions(struct q6apm_graph *graph,
 int q6apm_unmap_memory_regions(struct q6apm_graph *graph,
 			       unsigned int dir);
 /* Helpers */
-int q6apm_send_cmd_sync(struct q6apm *apm, struct gpr_pkt *pkt,
+int q6apm_send_cmd_sync(struct q6apm *apm, const struct gpr_pkt *pkt,
 			uint32_t rsp_opcode);
 
 /* Callback for graph specific */

-- 
2.51.0

