Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A9D3C6A3F
	for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 14:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774018172; cv=none; b=HkSLOUb2b1ageDBWipzaeMNbV6QJxvV9cfYvYBkAQOLnNAA7fJf9qF34cg8U7PJz3veCCPXRiDn2EjV/8BQC9XFkmc/NG0qssMEMIZNGf5c2RATMiQVweFtRB4DYOlkakzRdF5+Bd6sZFMH8p+kGTwOtsXhBOhOjAhBu44h9UUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774018172; c=relaxed/simple;
	bh=Nn5W6j2KgfG3MXrQpHQ1hcxXhxv/yUbhKAiv5Knj23A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jra5vYP5eidpV6PyDxfkDTY2b70VcR+PBiFKYiIKAit4Jnc/2MWW/5Tr/lNSrXXzp/nbR26Fd2izLF5yhNQVamByfxJC2i+VdcBF2/mVTcJ11O5Q6x/mtMZyVMvt9wfoemq/eKG3o8qUMxf2KsPBdwWiBuJ3KCNIFuEDclKSQCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BZQ7rV5/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EoXw7R2G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BZQ7rV5/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EoXw7R2G"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62KEeETn1692180
	for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 14:49:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=it+OAEpYU8v
	0MR39X1WR6T1UKdIHL61i+TcaqL8baj4=; b=BZQ7rV5/GyyNa8ccYSgIrTTB2fD
	QkljqL7NXHQUJMRG7q+BNPaL8+raXhjI87j1bwAocGjCvoj+Z8GYTn1MWdUla4LE
	v077WSzk/FN5yQ8MqEz9GBvhD5DaYL4FCkPHMklwtfIK20+4eeyX+4U7lh2/6PuM
	aidycHxqCrJD00u0iDqrKdgZ0BKr74bAprHqxHybF1VbR47pp1wXGaVURrKalSI7
	pj/n3Bx4qgNxpCRz0HbhB/NSIF7rn30AEgfyb8cOuwja3z6tbs7eoEvfE6jqr8Nt
	T2BpU0CegVRCKSrtXelsU3xgCdSsg+5INQUwM5CBH8Y6cj/PUhD8yOqkRVg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0s5d2apk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 14:49:30 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b3a341f3dso46782311cf.0
        for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 07:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774018170; x=1774622970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=it+OAEpYU8v0MR39X1WR6T1UKdIHL61i+TcaqL8baj4=;
        b=EoXw7R2G3nUQ93kVGDEQbjcXcFIsQkozOB6ZVD9p4PqE08iqqMYOvN+dLtnnaR4MsE
         hclDv/KEA5UVMVRlTd1K7eYomI7VS7PhYAOTyJK9ADKJR+k6P5OThJRpr7dJqrLKqrXc
         AvnovdLm8tPBRnuVQyCve+VyDXlzS49D4DR1pLgYSo/EzDkRj8hWf5OMvc3R4ISUOlfw
         1BY1Z5t9wVf/rII1aTs1PUOSDA5gAvnUhCVa4vT8pjVk1gXZn+IczoLrsvx1M/CxLwrG
         LeZinTfXWLczo5lwrmDMvIqoEqJ8THzjkEdvN4Xa2C/PrN5rgU34fsm35dzEsteU7Ejp
         7ljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774018170; x=1774622970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=it+OAEpYU8v0MR39X1WR6T1UKdIHL61i+TcaqL8baj4=;
        b=so9kLneGgSvumXGpYVBNQvhCMg2ye1PayzjDCvQOPkiQeXOOvUCT91xoQ0zCNwj8GX
         GntikfuXT19fs05q9cja3G5fkbV9tRmxX1iRHj4KIJuFmu2YtOvNoQJSsCmK36Rcwk2b
         1JnmHS82tmKq2msG5GKfEfleGsQTN3WVupfOIglvyXGvdgR9cKd6bw+13OvNAhYWbVEZ
         etLsaMYKbQgMqJmmj+ZLyyjpi0AWB5LbtTT6yZXb9AZ3oTZb0//c29Ntd9koyKlwveg/
         KZ9KwCS4HnWeK+BY/KJog4IbXVIjwYKBkF9KZe0vqWTvFCc/pKaKgIA1MG+BxQ6oZwZx
         WGjA==
X-Forwarded-Encrypted: i=1; AJvYcCW+RlRXAm5wK/kH6DrXvhybHB2a1k/QiqhTseldT59Arvra8MEhozQEifFUzlrfnUkdNL6jWpBLQrN1Bw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd8NvRjOKg8MblEX6s+ON5/NFZ9Pt+MVE75GC+sp6C4wH0wFsR
	gg+H57hePlyHfslyEaHItzVSiOC6FwDnuMFh6B1OQKssRMYYMIY54c2UMXs909p1Poqf1AXHLHw
	eKpgJvtRa7JE2pKwyoVCVZmlaYNEkR7tEwRhuUuhyY+6g7tzbFN6EJkHVZsQq+6U8uQ==
X-Gm-Gg: ATEYQzy/p5QryMnssgYl3AlIWYQqxyn7TSI+GlDmNFoU6x8zoFXbAYac6JSMHJXFCvi
	xfLRbFidzD5e1px7+e73mw3fSILOagNUSjqpu+Z3sNY1gKxnEPoJEUrWFD8dYVRz6F/0FNAP9QD
	hTA+ZjjlcSwq62/0ezhTZWR30XI73Fj46le0ZuUcnsjXJVx9zCt1fv2+2UKJYVmvtS92nbC1kgg
	zeCJZfGYgOjxHiZqloiFJb/O0QE/VFQby1fCLLjqhW/9QaOLL37HY9LhX08qRjjCHVIkEp3R/RF
	nHKIwvtVn3+9IlyNgzV942cBwvRVJLqOUkecUkpup1GZkSG+tUG2+SI9d1RpKrU5JjxbdHSGkkL
	gDy23C/YwBvSDmVeiG219J24R7tuaXv2N7WY67v/EddnWZhtX2+ZnwL0=
X-Received: by 2002:a05:622a:11c6:b0:509:4342:9966 with SMTP id d75a77b69052e-50b2461b2a5mr104983841cf.16.1774018169648;
        Fri, 20 Mar 2026 07:49:29 -0700 (PDT)
X-Received: by 2002:a05:622a:11c6:b0:509:4342:9966 with SMTP id d75a77b69052e-50b2461b2a5mr104983171cf.16.1774018169094;
        Fri, 20 Mar 2026 07:49:29 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486ff109b95sm47906825e9.1.2026.03.20.07.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 07:49:27 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org
Subject: [PATCH v6 04/13] ASoC: qcom: q6apm-lpass-dai: Fix multiple graph opens
Date: Fri, 20 Mar 2026 14:49:09 +0000
Message-ID: <20260320144918.1685838-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260320144918.1685838-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260320144918.1685838-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: OgVv9LIclAxYzkb0NeMQpvpnylRgGGQa
X-Proofpoint-GUID: OgVv9LIclAxYzkb0NeMQpvpnylRgGGQa
X-Authority-Analysis: v=2.4 cv=CqCys34D c=1 sm=1 tr=0 ts=69bd5e7a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=M_mAHeyD2EURj3i0m2kA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDExOCBTYWx0ZWRfX4Y8SAKhwAYwX
 u3qYnPUGPKW6gmtx2unnOEwIuCNOGAmBtLCLaKMOtExgog57FbMJRUDx4uIdi/bc1zMKyEBnFYI
 y9q6pnGm/67oY5cHBbuaGZp7JhDCgA754KtVSS/K8m7PXv8Hi9m+fU4evHbwEqiMd7P8aK8owrg
 HFsCDu5gjBoixiq1Q8AlhmIXxETWXh1CT9IxnjpIPtVzGsCVyJ25CADyggB7q+f0MD7lRf3/dX4
 Pp5w47pDqWtdLGqG9xJkf5t8yRjggSr7CThOGY5aSIQtxfjkf1qBreNBF0MQUW3a9TfHwIowln5
 wz/TK5ouUWajMm3LeBlD93okBGSGwWH3xIAhX5NhPIDP02BJ4FuJgcRgPJRwbK+jRoLqFEpGdGa
 WSXVwB9zR8EvFi+7Z82oW1Z/LkQ+OhXZ8U1eaWxlrzuqNCM+4aDPbdhBko8+fI+BHz1/Y7BZh7N
 Sv/Lm8spqcMKcP5gVtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-20_02,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603200118

As prepare can be called mulitple times, this can result in multiple
graph opens for playback path.

This will result in a memory leaks, fix this by adding a check before
opening.

Fixes: be1fae62cf25 ("ASoC: q6apm-lpass-dai: close graph on prepare errors")
Cc: Stable@vger.kernel.org
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index 5be37eeea329..ba64117b8cfe 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -181,7 +181,7 @@ static int q6apm_lpass_dai_prepare(struct snd_pcm_substream *substream, struct s
 	 * It is recommend to load DSP with source graph first and then sink
 	 * graph, so sequence for playback and capture will be different
 	 */
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK && dai_data->graph[dai->id] == NULL) {
 		graph = q6apm_graph_open(dai->dev, NULL, dai->dev, graph_id);
 		if (IS_ERR(graph)) {
 			dev_err(dai->dev, "Failed to open graph (%d)\n", graph_id);
-- 
2.47.3

