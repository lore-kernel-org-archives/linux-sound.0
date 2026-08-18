Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FFE43BDBC;
	Tue, 18 Aug 2026 08:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787042840; cv=none; b=Pb9lQvimyzoib0OMCTA1FfbaMH6/8FoPb7r3MUrnhrDiX4TzIMd167sTdxgOf+RYGYHzlG9wS/XiAoNeM0dJ4zMLl8pgusc7jBiYq8UqgZ5eoYAQbgxMamHGnVeweb4QCSLW+krZ/tI1nnGpM6GRfY2PwChPCmVbvjO2Rpsl6VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787042840; c=relaxed/simple;
	bh=r6to8mgIt5K1aB2MrgeTl2JrB74V6ZONzSzVJLqkDxM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AZtfWrJ3xQjM6SscfrvO/yRAXrwwvSvSPI9FiFS8/9UP2zbnlvOtfvSZvf9a08ar5O47S/ksY5mtP9NJ3lURoDSWAs+AY2OEwc29qdWtW/bWVsox2Mo+YtK8B9li805Ul8/Zy1/F1+gzSRpOwDqRQ5rZcgYKgLNXpHBtZs+jkdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ldpXuQLp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ldpXuQLp"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I8BLBF3703515;
	Tue, 18 Aug 2026 08:47:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xPF7LcYiwpl
	bM+7FwnD4/GA0q+Hx0hw4nsuLHEFaTgo=; b=ldpXuQLpDve6mXxsI+gTandJDW0
	G969p0efypWoSjnFM+vnPoL45IKjhEN5aEUoV0EjWly5T/ceWpbPYQPb1XPmwX2d
	feqcWNjtjrYM464LwviXTXfoXq7sovJ4hKojG/MOzFufKKw0wzKs6uiU37U4XyCE
	5Pj7VKKtkPFx38fR0PjAghFCDXg4uXWjvKVTMidJZE9Yc3hF01PDWgP5SNi51vdT
	zdwF8JNNIip5ygqEHvyHjlx0p/Fm6i7DcfKXc73DLEd+cgx6kFPLckYShkT1crGt
	wJomMOiDCVq3ulI7yDZn/sWHIfWCtV1FmMPr9qrllWd3tnpbXe6nh8aoRHw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4ebpshu5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2026 08:47:03 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 67I8kxeN000888;
	Tue, 18 Aug 2026 08:46:59 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4g2h6jq1g3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2026 08:46:59 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67I8kx6m000863;
	Tue, 18 Aug 2026 08:46:59 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 67I8kwA7000861
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2026 08:46:59 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 1635E640; Tue, 18 Aug 2026 14:16:58 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v2 3/4] ASoC: qcom: common: Distinguish missing and invalid TDM slot configuration
Date: Tue, 18 Aug 2026 14:16:54 +0530
Message-Id: <20260818084655.3240284-4-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260818084655.3240284-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260818084655.3240284-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: zPWVO0ntOR0EuzluhI-9_P2uZHXia3po
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA2NCBTYWx0ZWRfXwLQBpIN1fsCG
 k9rtbnCPD+dqiytUJ0YqWPO2xNXkFkChEeUK9KsY8Jix4MnXZtYHoTHGHyPp0hVQnO8PeE6v0vT
 ZyzeCPG2IEc6q4dIDysYTg2D/DXX2rc9QfVFgZ+yZeayyHTQAEPNDP11mrZihHfe4H4xpzdOzoD
 RpPAt5J4su2DgHZ0Om59YLlBgjRfy615eIdRP7fH+SOdWydQYOjxKIZqN+rtKJ+0kYZovCUIjoB
 ejvN+2F6IPlCRKDSN78GjFFXy6LH7BGd3Tm1CVEegATRe9pwJz2QDRRN7V8ptLE7rAzIqfGMyVZ
 AOSvkxYx+5U3oye6cKZe2iI4y3BCgYjQfpL0E3ZNMc0VoDkmbtblWV1arq5YHHWZyUtdk6QDODl
 Sjmd4QspoXqFgmpsgKXsBwUqhgQkVIq8m7hJVxpDQO0ZEKmz53wTjrK0CXMtLUYnfifJ5bvglj5
 hON79UOuKlK+7NTqkbw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA2NCBTYWx0ZWRfX39CwtU2a1V+r
 QHKTGyqyAX8NI/Y0iux4pjNJ0wFhtdML1XnTyqbjTj6xk/cSywRfM0ypxmV5MydzY7cbXdrzluc
 8WJ7/594GGasddwJsPPcI5XOMn5fnsY=
X-Authority-Analysis: v=2.4 cv=FsU1OWrq c=1 sm=1 tr=0 ts=6a841c07 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=AbhjdIP-p_szEeCd9bMA:9 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: zPWVO0ntOR0EuzluhI-9_P2uZHXia3po
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180064

qcom_snd_parse_dai_tdm_slots() uses -EINVAL for both missing DAI-link
TDM configuration and malformed TDM slot properties. As a result,
qcom_snd_apply_dai_tdm_slots() silently ignores configuration errors.

Return -ENOENT for missing DAI-link configuration and preserve -EINVAL
for malformed TDM slot properties.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/patchset/20260804070307.117119-1-prasad.kumpatla@oss.qualcomm.com
Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 sound/soc/qcom/common.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index d231024206db..d9f256d51973 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -103,14 +103,14 @@ static int qcom_snd_parse_dai_tdm_slots(struct snd_soc_pcm_runtime *rtd,
 	int ret;
 
 	if (!link_np)
-		return -EINVAL;
+		return -ENOENT;
 
 	struct device_node *cpu_np __free(device_node) =
 		of_get_child_by_name(link_np, "cpu");
 	struct device_node *codec_np __free(device_node) =
 		of_get_child_by_name(link_np, "codec");
 	if (!cpu_np || !codec_np)
-		return -EINVAL;
+		return -ENOENT;
 
 	ret = qcom_snd_parse_tdm_slot(cpu_np, cpu_cfg);
 	if (ret)
@@ -172,7 +172,7 @@ int qcom_snd_apply_dai_tdm_slots(struct snd_soc_pcm_runtime *rtd)
 
 	ret = qcom_snd_get_dai_tdm_slots(rtd, &cpu_cfg, &codec_cfg);
 	if (ret)
-		return ret == -EINVAL ? 0 : ret;
+		return ret == -ENOENT ? 0 : ret;
 
 	return qcom_snd_apply_dai_tdm_slots_cfg(rtd, &cpu_cfg, &codec_cfg);
 }
-- 
2.34.1

