Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B898843B6F2;
	Tue, 18 Aug 2026 08:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787042836; cv=none; b=pnm0oRccYlzEOyohFT6vaZwd87EyHdUP/omAAsMfAwFIke7v/txr7EQT0XYZVrtRIsq0s8GoltuUizb5SEPaWF5MdecoJ6cRWcDKO4ZuiNRIMtlT/cVXWpFh8chR8OQqUl5q1bbj1BsXJ9SlEAiVqeH0SnhgbHmT+8DeZUfenQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787042836; c=relaxed/simple;
	bh=qzmrHDq9gKwBtG8E4LViOyEL/NmVMbxTaKNmUk5bwYw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jX9+ui3EXqGXNHIkqIf+gypFUVpa5lfzMzQ52+3fr0gAomVS+WJ2ZNfqDUJEVNqmRuOpCxxycSquEM1ESNVRIJwA4gFZgV5zhLgOgtgG1mT0Pspk65OSmvovPwkthz3QOoUis3CWd8GGDCoxWUuEJJOHvCz7uiXIgtXMljCkR/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZbkYcOa5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZbkYcOa5"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I8BF5l747627;
	Tue, 18 Aug 2026 08:47:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5ouo3eP4Nwd
	R9V90XmQZmlFUIo7unktWuZVWtmyvDTU=; b=ZbkYcOa5Zy6cTTiOCNweJfzbdKf
	GC3eTHGe991sFbODwzcWncLSlIIu53tIgKJVxjx5re+CjvizftNU5mnw3VSVEY5t
	YKrZY4cqfXQ+bYp81JdP+gdY0qESwgi5dFdlOG/no1GvMNqedN0P1hsT049fGeSK
	CRkIZZsrQWCYGplLpMwmAFSL0jv6SvvK7gnX6v/Q+eYC/YOPTDOUroyxjcaef/NI
	CpvfOJuF5fGZGggpz+9euDr8L+JwhioVgLq7ru/YO7766Y3ZrTHgswunO0yGQVUs
	WH2Tl2FbKiarUsRrJkAhQpc2R3QgYHwfmR4eERN/LZ3Twwd/+DBJv6oaZew==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g48q0tt79-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2026 08:47:03 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 67I8kxQi000891;
	Tue, 18 Aug 2026 08:46:59 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4g2h6jq1g6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2026 08:46:59 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67I8kxnP000865;
	Tue, 18 Aug 2026 08:46:59 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 67I8kwNW000860
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2026 08:46:59 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 1ACD8641; Tue, 18 Aug 2026 14:16:58 +0530 (+0530)
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
Subject: [PATCH v2 4/4] ASoC: qcom: sc8280xp: Fix TDM hw_params error handling
Date: Tue, 18 Aug 2026 14:16:55 +0530
Message-Id: <20260818084655.3240284-5-prasad.kumpatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA2NCBTYWx0ZWRfX9c5bdhonxsGo
 mNDWmnKjsObK7L7HZu1NT03pdZObz4ZdIviJcRL1EblsNdQkU3P+80oGj0C0wlSvMjR4HmTbcjR
 S3sxb0fxR3nzItCy1iEsdA6MCtRma3A=
X-Authority-Analysis: v=2.4 cv=VuITxe2n c=1 sm=1 tr=0 ts=6a841c07 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=__KbwfSMYZr-9KUfyosA:9 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: jEyYjZOqFI3dsvJsgcDnRLpH-QYOA1BH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA2NCBTYWx0ZWRfXxacXEN4OWZId
 u2mErA986U2/QaFvs3uaDdpR2DMW28Nyj/NK18xi9ki27TseHIEZA7lQJsewYoPrc5BdS0F5sfx
 bgiyl6J2a7SFlDndgouwjuMRNmyVuvROFZE/73z/KBaoxzl48F1EZ55cAYvSAXi6jirzQ7vWWFQ
 gNkZX2icbE6ZhrGcX1fEud8/5aIoP9x+gPPLC2VRxhsyKm9XGgSdSeFXSj203hfy7IOl3OSxHTF
 QDbaFLhnllxSVSySBn1tPEPSGZGZv724lHKVOSxCUvNFVOBY4TQCLFyKT2Jy5QQj0RTaJbc+zWW
 6NTFBtva2QN+vhaTjgtpwwttiYFzsftZbhd+gqt0AAUIDzISNntJNU7taJ1CjbIyJvbciL4ID9X
 d0mtSlRX0AqHd6F5kFtaQa+bJBV1py96uieLi9dnnIFb9zBK+sXLC7wOfPC8GoL7aabYIkPQrnv
 BnDj8eRjxHZZv2YR/xQ==
X-Proofpoint-ORIG-GUID: jEyYjZOqFI3dsvJsgcDnRLpH-QYOA1BH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180064

Treat -ENOENT from TDM slot parsing as the optional "configuration not
present" case and continue to propagate real configuration errors.

Also ignore -ENOTSUPP from optional DAI format and codec sysclk
callbacks, apply codec_dai_fmt to codec DAIs on TDM links, and use a
signed bclk_freq variable so errors from snd_soc_tdm_params_to_bclk()
are handled correctly.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/patchset/20260804070307.117119-1-prasad.kumpatla@oss.qualcomm.com
Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 1322601659d4..4d48e1012cd4 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -115,33 +115,42 @@ static int sc8280xp_tdm_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_dai *codec_dai;
 	struct qcom_snd_tdm_slot_cfg cpu_cfg;
 	struct qcom_snd_tdm_slot_cfg codec_cfg;
-	unsigned int bclk_freq;
+	int bclk_freq;
 	int ret;
 	int i;
 
 	ret = qcom_snd_get_dai_tdm_slots(rtd, &cpu_cfg, &codec_cfg);
 	if (ret)
-		return ret == -EINVAL ? 0 : ret;
+		return ret == -ENOENT ? 0 : ret;
 
 	if (!cpu_cfg.slots)
 		return 0;
 
 	ret = snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
-	if (ret)
+	if (ret && ret != -ENOTSUPP)
 		return ret;
 
+	if (data->priv->codec_dai_fmt) {
+		for_each_rtd_codec_dais(rtd, i, codec_dai) {
+			ret = snd_soc_dai_set_fmt(codec_dai,
+						  data->priv->codec_dai_fmt);
+			if (ret && ret != -ENOTSUPP)
+				return ret;
+		}
+	}
+
 	ret = qcom_snd_apply_dai_tdm_slots_cfg(rtd, &cpu_cfg, &codec_cfg);
 	if (ret)
 		return ret;
 
 	bclk_freq = snd_soc_tdm_params_to_bclk(params, cpu_cfg.slot_width, cpu_cfg.slots, 1);
-	if (!bclk_freq)
+	if (bclk_freq <= 0)
 		return -EINVAL;
 
 	if (data->priv->mi2s_bclk_enable) {
 		ret = snd_soc_dai_set_sysclk(cpu_dai, LPAIF_MI2S_BCLK, bclk_freq,
 					     SND_SOC_CLOCK_IN);
-		if (ret) {
+		if (ret && ret != -ENOTSUPP) {
 			dev_err(rtd->dev, "%s: failed to set cpu sysclk: %d\n",
 				__func__, ret);
 			return ret;
@@ -152,7 +161,7 @@ static int sc8280xp_tdm_hw_params(struct snd_pcm_substream *substream,
 		for_each_rtd_codec_dais(rtd, i, codec_dai) {
 			ret = snd_soc_dai_set_sysclk(codec_dai, 0, bclk_freq,
 						     SND_SOC_CLOCK_IN);
-			if (ret) {
+			if (ret && ret != -ENOTSUPP) {
 				dev_err(rtd->dev, "%s: failed to set codec sysclk on %s: %d\n",
 					__func__, codec_dai->name, ret);
 				return ret;
-- 
2.34.1

