Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A80C39D6F2;
	Sat,  8 Aug 2026 18:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786213225; cv=none; b=nwOHSoFRRtBei0kLMJ8A99IbfmTR8u6DtZj2WW7t7ItYzC9QzeBUZ+bD4BeE7iQMdJ5XAvHAKJSY8AphqpRcj81wjvQpGwOtVpjNzYNPHH3svk7Ok+NDFMkMnqoGCC1qE9hYV9YsAWtpLl0w2WJhO3gY15U75gBTT/lsKD2ed7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786213225; c=relaxed/simple;
	bh=orgqcrdT+1EdwlXhpoeFuH64cXFCpomuXXvTMzwE1i0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ua58DDx5JOn087FQyn9WDJk7Dtt/Xz0K8q5/aeOWmuqbrWK597HB/953FFDfj0QozbaqPJnjK33JPi4vFVUDlA6Ss99DE1DdF0L/pDsQ7JaEY+0wfOL2KkIyYO858gyOMCXQdiMTMfxbPEoRyLy9DsAWDiJYjB4iWTxkC1EReKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YpFzAcX1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YpFzAcX1"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 678Gn1H1350017;
	Sat, 8 Aug 2026 18:19:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JSJlRvgpauk
	igs3Lp4WVk0Lefxy09nbLs/0/hv72SKU=; b=YpFzAcX1hp6a1fKbb1hh5pK3ZKs
	NnI5MpaJV1zmUkFv5KhCKBdy6RM39X82Hvtq5wOPxE1QCsW5SDGQKuoTp4qH7WF9
	wIuTiQIwIOZ6c6LE1nlD4+FHK322keaKBFAcX8gh3XBCpifzsHjRmPhaFYHzMbKP
	lkP/U+9EaZ+uQ8mXtdU2RtfRX90udV3V3mqt3ydrGMj5mX68cnZAWjVPmoNZXqin
	OxMAUvGoUBa4LP7yv2jzsmvaQtc/DlA445thDVjRWFHyQ1dmYJhrDhSH4spxiFQW
	MFHtD6nOaMerHs8u5X2sDaVC4hMycX2Uzdw6L5pjfPodBdTi4rS1LBH29LA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwvhv9eg0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Aug 2026 18:19:57 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 678IJrJh009399;
	Sat, 8 Aug 2026 18:19:53 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4fwwhhhg1j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Aug 2026 18:19:53 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 678IJrFA009393;
	Sat, 8 Aug 2026 18:19:53 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 678IJrwB009392
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Aug 2026 18:19:53 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 3F4D3C0C; Sat,  8 Aug 2026 23:49:51 +0530 (+0530)
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
Subject: [PATCH v1 5/5] ASoC: qcom: sc8280xp: Fix TDM hw_params error handling
Date: Sat,  8 Aug 2026 23:49:48 +0530
Message-Id: <20260808181948.2489187-6-prasad.kumpatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=eqbvCIpX c=1 sm=1 tr=0 ts=6a77734d cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=__KbwfSMYZr-9KUfyosA:9 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: KkaTFHn6ffjXbseBI-lQOil2yjYdIh3M
X-Proofpoint-GUID: KkaTFHn6ffjXbseBI-lQOil2yjYdIh3M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA4MDE1NyBTYWx0ZWRfX7A4QBE+Y+m/n
 8mDwmIKy2U6zoyFfXHMAligzclDF7Pd2WYp+xOymqooAl1hbpMjQhg4k0FiTtzAl/X2bUIVGQgV
 SgqIViWt6XNpt0sjzxmTk4ePz0pZBiEvPqXF0CoICy7unLK1N7JdZ+EvOxk4Do9V14170yYuQUg
 aKHIU1vVRtd53clGDMmSjQGOFWHgGK+1Lm7NDk2hd8XktoNkijiBPF0DU0UIzm6rzGhxjkdub/5
 GucCnMKi1SOiRUzRKFdlLo3ZrsHvGsxqo0BLE/jvJGVLL0CYaFk5LmylxpFPCVU7eMPCIkfOx0r
 sQbJRE+5rPdqwtkTcKHq7qmWuqXfleDCJOrRyxjthIB8+hERk8HoMjTW1A/jVGalwumPru9/jWr
 HPhx588x/iLQfcyrwHiSO+JhiIjMdOcbhMQzswC6+kZcduuoy3geBrmYc51MRERD1/or1ZZDSe1
 IUrU+3cjD8XJQYi+02Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA4MDE1NyBTYWx0ZWRfXzPXSpWrAEkR8
 2H0SJWBr4pD0SbiUd2F1h2ED74iHnaI8fTrVYztLUOUECVGM3xw/udaXdTxhfUAJb3h83TE56uc
 enzT89cQa6QvUGbcVyxTFen1P/IXivY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-08_06,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 clxscore=1011 adultscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608080157

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
index 597c0d887d2f..0120443da418 100644
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
