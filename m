Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698423128D7;
	Sat,  1 Aug 2026 05:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785563195; cv=none; b=kTiCnsHPtxUw/bx9UGKeZv1U5ILtBWuojQM8nV+LbuIoOe7RrBsGMlZ06sA8WzNohjd3HQ02OAquptoNefxlOuWKUxFWZmFyqABbTKJy7P6ry6NW38WEelKi9UppTO4KCbdjDxU75eMCb/FrrKF9jQ+Mp9t8O8jm1bBA1w7ZXsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785563195; c=relaxed/simple;
	bh=4LIGQuwupRN1lGKc4bWbw5/Bd0oOwkYldVkMXrOaRf8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M7AQSowgsniMKnO7sTa1afs9hbJi10FqzMKIAaWgHrz9+aqTsBPvxIACRUmkHE2J68j/bFcDImHBV/myGz7LV1lwH8uTD/pKmdG+Y7cjkIdl9hA2aBlF4fARjVNEDqZB8Fv/y0gZbzkISSemcxbXwyvC4+oLeoHW7xxFN0ggZPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LlMkHB1u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LlMkHB1u"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6713LwGm2060672;
	Sat, 1 Aug 2026 05:46:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vU2HxjRbYno
	mMBWZrEG9jd9w4c5j+LJnWdhCdduh17g=; b=LlMkHB1u6VWs4LCkDu78CGMxKsh
	jA4/mT4Cn612eXLXZ61i6jhSejDmBY2pfwgWmRLDGzfsM+6dMwGvLJcKkC3WCoje
	7/O2HvkIoQR3RNEDydyDwfwsTMxetzBeOcXur9HRZTz4GjyTlcfvjJnqlQosf5IJ
	WrVRwssevaj3hOM911gB96MOzD/pqV3WVoAKGlFD0S3g82YDmkCO+VFpzLVjr8mk
	f97BECUbbJ0lhL3T950O8Ni4tmxkZ1FDLtZi7R3YhvQ3hFnnZkZmlQFK5rCsvnIc
	uVFvNXEgtp6623BEqA3nO2VaKuL7B3d2ZndsvQ4XrHz8PBXVzopYqhEY0KA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8tx092h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 01 Aug 2026 05:46:18 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 6715kEDk016936;
	Sat, 1 Aug 2026 05:46:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4fs9vh0uun-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 01 Aug 2026 05:46:15 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 6715kFk4017023;
	Sat, 1 Aug 2026 05:46:15 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6715kF9o017017
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 01 Aug 2026 05:46:15 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 1E654C0D; Sat,  1 Aug 2026 11:16:13 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Subject: [PATCH v5 7/7] ASoC: qcom: sc8280xp: add TDM hw_params support
Date: Sat,  1 Aug 2026 11:16:10 +0530
Message-Id: <20260801054610.4047089-8-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260801054610.4047089-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260801054610.4047089-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDAzNyBTYWx0ZWRfX17fAewfoNpfz
 yOIN1hn+vt90IvNgVoCl7y/mJ9ePeOQnAfmAZGjRzMU0cDBLYc4RulTU4CsyyR9dHO64IHex5DT
 H6XEOrz6NJKJhx/8bys37T7ywKZccVaStREx/IXxjWFV5dF5VHEcz4VTEAq1qsMla/V6e6jxTYh
 0JHHOJ5CA9lvaqonS4MzOJz1KVi6arDO3rhYrT5naP1pxsrboPM/uPkqLHYpYbdXFD23FBcoItE
 /HG/BQl3+ph/M6R34c+ywxECnGACSK5ldYbbX/E1zwmQk9wNPUNmQlfJ0ZUA3JL/WmupJWr08QQ
 GmNocCKthAGvGd3kzCMeP/XJrHRFA3JkIzqvVGpRE4h/TDI9H0CM8/f9/LfeX1OTGh7JIjLy2oj
 ymgkWm37Dfd28/pohCfPXHBxcJic0wqRzTxd77WbWmrCjdcfOpd4Puvr66ANNZSiRZUBul7Ak1K
 HCL+uOFMgmXyb/3lyHw==
X-Proofpoint-GUID: Wec_cOZOgbGQv5O8vZqmQLQj7zGpf-e6
X-Authority-Analysis: v=2.4 cv=T9C8ifKQ c=1 sm=1 tr=0 ts=6a6d882b cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=QTpijNGdYiuWC2p250EA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDAzNyBTYWx0ZWRfX6FgivRmtsmQD
 ch1SH+YxknTm8427O4o/c1JzAVxfPobnGdfiAdWxH+JwG+n78lcJSbOFCH1l+zWDXX6sb2+ygnI
 frNisIaFOaSXibodLTfRWNRNu8Y79UE=
X-Proofpoint-ORIG-GUID: Wec_cOZOgbGQv5O8vZqmQLQj7zGpf-e6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608010037

Add TDM backend handling to the sc8280xp machine driver.

Use the common QCOM DAI-node TDM helper to parse the standard
DAI TDM slot properties from backend CPU and codec endpoints. Reuse the
parsed configuration when programming DAIs so hw_params does not need a
second DT traversal.

Derive the LPASS backend bit clock from the runtime TDM parameters and
request it through the backend child-clock path using LPAIF_MI2S_BCLK.

Program codec sysclk in hw_params so codec PLL setup happens before the
stream is triggered.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 59 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index a9304784d41e..3e8c904e837f 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -84,6 +84,63 @@ static inline int sc8280xp_get_bclk_freq(struct snd_pcm_hw_params *params)
 			    snd_pcm_format_width(params_format(params)));
 }
 
+static int sc8280xp_tdm_hw_params(struct snd_pcm_substream *substream,
+				  struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai;
+	struct qcom_snd_tdm_slot_cfg cpu_cfg;
+	struct qcom_snd_tdm_slot_cfg codec_cfg;
+	unsigned int bclk_freq;
+	int ret;
+	int i;
+
+	ret = qcom_snd_get_dai_tdm_slots(rtd, &cpu_cfg, &codec_cfg);
+	if (ret)
+		return ret == -EINVAL ? 0 : ret;
+
+	if (!cpu_cfg.slots)
+		return 0;
+
+	ret = snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
+	if (ret)
+		return ret;
+
+	ret = qcom_snd_apply_dai_tdm_slots_cfg(rtd, &cpu_cfg, &codec_cfg);
+	if (ret)
+		return ret;
+
+	bclk_freq = snd_soc_tdm_params_to_bclk(params, cpu_cfg.slot_width, cpu_cfg.slots, 1);
+	if (!bclk_freq)
+		return -EINVAL;
+
+	if (data->snd_soc_common_priv->mi2s_bclk_enable) {
+		ret = snd_soc_dai_set_sysclk(cpu_dai, LPAIF_MI2S_BCLK, bclk_freq,
+					     SND_SOC_CLOCK_IN);
+		if (ret) {
+			dev_err(rtd->dev, "%s: failed to set cpu sysclk: %d\n",
+				__func__, ret);
+			return ret;
+		}
+	}
+
+	if (data->snd_soc_common_priv->codec_sysclk_set) {
+		for_each_rtd_codec_dais(rtd, i, codec_dai) {
+			ret = snd_soc_dai_set_sysclk(codec_dai, 0, bclk_freq,
+						     SND_SOC_CLOCK_IN);
+			if (ret) {
+				dev_err(rtd->dev, "%s: failed to set codec sysclk on %s: %d\n",
+					__func__, codec_dai->name, ret);
+				return ret;
+			}
+		}
+	}
+
+	return 0;
+}
+
 static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
@@ -206,6 +263,8 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
 				return ret;
 		}
 		break;
+	case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
+		return sc8280xp_tdm_hw_params(substream, params);
 	default:
 		break;
 	}
-- 
2.34.1

