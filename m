Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34F4301719;
	Sat,  8 Aug 2026 18:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786213210; cv=none; b=VBVEN1r/lyOm+bAhmsKMzPDIn+7Vga4jFQCFcaSgRWAidzFSGokjXO+rbRIjnJA+HtW8pFNuHEU2UuYng1FezHIYiDTLOW5k3tVyWvBZmBU/9EJUEsVwJ4EL66LYucxQ15LiMtZ/Zvq/aZIe77OlZyf6FKxYsgbzeW9QCxyn17o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786213210; c=relaxed/simple;
	bh=r6to8mgIt5K1aB2MrgeTl2JrB74V6ZONzSzVJLqkDxM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=di52I9lylblRRJ3DO85RrAxbQRSPa+O/5Xs1ARh8Lsn9uM7l7CRd4JPp4rBW7QkH7/WFe4+PNnV3bjIwJfxyU5tvZcQY93wrPGwQ6CRrKZadV9hlOo5va52UTCkQTtB3OueSdceRfBZhy77qkClzQOqbmbFi+/pdPg8LnqoCXm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oE4FPT52; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oE4FPT52"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 678GlijU044434;
	Sat, 8 Aug 2026 18:19:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xPF7LcYiwpl
	bM+7FwnD4/GA0q+Hx0hw4nsuLHEFaTgo=; b=oE4FPT521ppiACcSQEUa3FeUC2v
	gndW3u84R5nnd5Gz8fOl+lx1jfo6/gQlbpeT/1SBzREzjBHYQnUCrrzbADV5ujzl
	GPn0YA+7emr7/+G1kM2guKCWS/Mwd1A6zTEivP0QEOJhqeHrz5EgAb0tlbyWAqfm
	xRi6BiTP+Vz9fnLVfOfNTObCgLv3+2dAZXZ03ovzbTDIsqco1lyG4JWyUdfumkLl
	ssj4EEuj6pxqtrg6RmUQUPH29ORZPQ441C5lWy+4RKFugYHytdQ6DTZnCaHacdD/
	qf1RwasJWB6PQEfvTMky+oAV+Ot7HtFI0WIoZknCENsscnrjtQKZRLlt5vA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fww7cscr8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Aug 2026 18:19:55 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 678IJqAK009362;
	Sat, 8 Aug 2026 18:19:52 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4fwwhhhg10-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Aug 2026 18:19:52 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 678IJqBB009335;
	Sat, 8 Aug 2026 18:19:52 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 678IJql3009332
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Aug 2026 18:19:52 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 3AB82C0A; Sat,  8 Aug 2026 23:49:51 +0530 (+0530)
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
Subject: [PATCH v1 4/5] ASoC: qcom: common: Distinguish missing and invalid TDM slot configuration
Date: Sat,  8 Aug 2026 23:49:47 +0530
Message-Id: <20260808181948.2489187-5-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260808181948.2489187-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260808181948.2489187-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: 9IqBwejRAwBaq_m6cgaIPs2xs2LLZWpZ
X-Proofpoint-ORIG-GUID: 9IqBwejRAwBaq_m6cgaIPs2xs2LLZWpZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA4MDE1NyBTYWx0ZWRfX08OpV335WGIe
 IDFM5WbIVJQlm0Ggl0DWCBhPsDkTY5LBaOSthqKSKA06ccsJPw/yWN5i4JRX36lyEF/7MkZkCSm
 5ouqWmcuXt11EueVbv//OjNgfPi8AU82xao/6IoD/ekBbgTcIO79KtRYSHFqXLsNLtXXl40h8Dr
 /EleRH2R2040UM4LoAuQqf6EdUmLBViKsOt8iVvhJP1LOxOLKnpUX2vW3mWWXSZDJFQSulq31ud
 JCxb2UW8tJHF1rHbhubL4rzGljHbAjZuez5NUOcBMjxqdUNk6de6+SBwWxhcaUX+jYwmw9sYUJj
 AaIeWp7gtS2Xv/BGf/pJZoV5xSda69W0k7BIshwrF7LRi0ALLk65geWSfRQE6VVpJ7XgfvjmufC
 1P3xKm27I0sKic+SUTGnVXQSxZHN5EGUfUkkjw+F475UAvis2p+h5OEQ5AThzPk4HsMj6T9dOuN
 MBbFoopLc8HTbCSw5YQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA4MDE1NyBTYWx0ZWRfXzDZcIm7eSaYQ
 Kgdz+mTXbcDmDw16MHE8fBZDP06oB8MnEulbeAy7p47LkIW4a8e3vamaMsKnUQbm/yR79xybM4V
 wS/faTAsJsFetwG3JRjtE0s28boa41w=
X-Authority-Analysis: v=2.4 cv=IPsyzAvG c=1 sm=1 tr=0 ts=6a77734b cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=AbhjdIP-p_szEeCd9bMA:9 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-08_06,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1011 priorityscore=1501 suspectscore=0
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608080157

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
