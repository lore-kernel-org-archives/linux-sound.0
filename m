Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855633A4539;
	Mon,  3 Aug 2026 19:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785787004; cv=none; b=vAsKGktbwRGYy7ojt5RUKesm3HLAx2cZIngdFMW88gFI9R2rFUrYPF8V5BVPI5PNzqrGOHrBf21/rpTTo9kX5Q+L1RMJO1Gkg+P1mfjcYs+0bzWW9NVgGgD5zWkJ5CERarLusX9/rdJBKg4cOTNPm/7z7EnrTmccEzfgJeK8/wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785787004; c=relaxed/simple;
	bh=KpiJQIjWivtnORSdGN0YbwCY1TkbHlYEgEjcQh9rCBI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NhYQVBuDyANFB4LVa0XxLwaZ4xKd+WdQ9LYo87EKoOAvZUbyJRpYUH8lVtnOcdISbXrx8M2CWeerSEb0zWBS56fFGuS+xd2RuNQG8AYtSsqHEQLNNUbeotopKu4K1jBuXzFpzpWEZSm7O3pUtJ0WhEJjTf6jfTb5mf8erkj2KsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zurx19+x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zurx19+x"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673Jknp7990371;
	Mon, 3 Aug 2026 19:56:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MJAFVMYhixP
	FJjxjlYOJLwrPVDXme4c6u966ZjsDfW8=; b=Zurx19+x1MLC/Da62WBmrNAwiF1
	YrARjFmuMtDFR03MvnQEjJirotOrEghc7D6rVZpsnll839K/3jrdU8HdF0WQPgEY
	odOA4nb7UD/r6FBc2p2dBXzycs4M5lVk2FKcJxOABn3GPNeb3z6Pfm+gCducmksH
	a8UFDBMokcTujiBpLtN49Obq6322ipdOFwBp0cqA7FQGKGgRQqYt1G+9DkaDaKJE
	N0VEXYP5pC8Q42nc10ef5yeFCjNP1gGsmesNINN8ZjAKJNvUfnly+cXgwuj8mS4G
	D+QOafSbvxihXT2SBxoR7vGqPy8r2kB6/Yb45UIzXfG8XoJjoi8l8cyL2HQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftx7m11nd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Aug 2026 19:56:31 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 673JuSR9016738;
	Mon, 3 Aug 2026 19:56:28 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4fs9vj9wut-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Aug 2026 19:56:28 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 673JuS1Z016711;
	Mon, 3 Aug 2026 19:56:28 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 673JuRpr016706
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Aug 2026 19:56:28 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id DD20F63F; Tue,  4 Aug 2026 01:26:26 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v6 2/7] ASoC: qcom: q6apm-lpass-dais: add TDM DAI operations
Date: Tue,  4 Aug 2026 01:26:19 +0530
Message-Id: <20260803195624.3606352-3-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260803195624.3606352-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260803195624.3606352-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE3NiBTYWx0ZWRfXwSbbbEd+OHdZ
 tIgUwO6JnJQFr4ftPP4Qf9dPcHR6vUO3sjirCfoldaB6SIKNAtnIGXjdTuTKXpPoFFg8e+xHFUf
 ono3e4QdIKLiiMCeeyD8aWGKAcQ1zeutfhF+FDztpi20l4AaH0sP4ykLlWToTOyLvT5/KqfXR1q
 Bs9jALjZdaYKD21nGWOY6bIi1OhsurEkrwuAP3miMBvPGlIi9kEUCUQkO43zVFg4WmLMfufGiYA
 vKbkcqirPnsLW6/hpise1+Ykb7CmZiLPx559Nd5bw9ouXNcJEr4GapNFCivztzOXHmCohC1z3oO
 7gcmHuA81LQlUD0DNd9W7QGx3BQV9EKKbGcKguCEGc+yITlOAmFUWZRirf4Lxv2l/fHvbsPy8Wm
 Nea/jEvX5bkn6k0gRKyu9HTbvk+1PmuzRO+Nh+DIT/Eqj7+peQ0lyFB1ko5jEgy0x34oVufy3+b
 oxYvtMbZpwoQ0atbtAQ==
X-Authority-Analysis: v=2.4 cv=TIt1jVla c=1 sm=1 tr=0 ts=6a70f26f cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=ZMHsmkTgFhVY9WPaUOcA:9
X-Proofpoint-ORIG-GUID: FX18hKIGJtl5DAPGn4DL3CUZls6Dux1H
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE3NiBTYWx0ZWRfX4jIxwcQYWTJL
 OccpVC1CBY54SUMPaqNmez8QOeBP9F/H+YWFYnqTBqn/Xn3bled8o8LBKQZrzN9PFtSvxVuyf2U
 GFAdrH/gsIEcbCuB2kl+TXfU5yEPhJw=
X-Proofpoint-GUID: FX18hKIGJtl5DAPGn4DL3CUZls6Dux1H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_05,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030176

Add TDM DAI operations to q6apm-lpass-dais so AudioReach TDM
backends can be configured through the normal ASoC hw_params and DAI
setup flow.

The TDM set_tdm_slot() callback validates the supported slot width and
slot count, stores the active slot mask in the AudioReach module
configuration, and leaves existing DMA, I2S and HDMI paths unchanged.

Reuse the existing LPASS child-clock handling for TDM nodes as well as
MI2S nodes, since TDM backends also request optional backend clocks
through the machine driver set_sysclk() path.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 60 +++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index e68e8b000e07..e204fd59e512 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -358,6 +358,53 @@ static int q6i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	return 0;
 }
 
+static int q6tdm_set_tdm_slot(struct snd_soc_dai *dai,
+			      unsigned int tx_mask,
+			      unsigned int rx_mask,
+			      int slots, int slot_width)
+{
+	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
+	struct audioreach_module_config *cfg = &dai_data->module_config[dai->id];
+	unsigned int cap_mask, slot_mask;
+
+	if (slot_width != 16 && slot_width != 32) {
+		dev_err(dai->dev, "%s: invalid slot_width %d\n", __func__, slot_width);
+		return -EINVAL;
+	}
+
+	switch (slots) {
+	case 2:
+	case 4:
+	case 8:
+	case 16:
+		cap_mask = GENMASK(slots - 1, 0);
+		break;
+	default:
+		dev_err(dai->dev, "%s: invalid slots %d\n", __func__, slots);
+		return -EINVAL;
+	}
+
+	switch (dai->id) {
+	case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
+		slot_mask = (dai->id & 0x1) ? tx_mask : rx_mask;
+		if (slot_mask & ~cap_mask) {
+			dev_err(dai->dev, "%s: invalid slot mask 0x%x for %d slots\n",
+				__func__, slot_mask, slots);
+			return -EINVAL;
+		}
+
+		cfg->nslots_per_frame = slots;
+		cfg->slot_width = slot_width;
+		cfg->slot_mask = slot_mask;
+		break;
+	default:
+		dev_err(dai->dev, "%s: invalid dai id 0x%x\n", __func__, dai->id);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static const struct snd_soc_dai_ops q6dma_ops = {
 	.prepare	= q6apm_lpass_dai_prepare,
 	.startup	= q6apm_lpass_dai_startup,
@@ -387,6 +434,17 @@ static const struct snd_soc_dai_ops q6hdmi_ops = {
 	.trigger	= q6apm_lpass_dai_trigger,
 };
 
+static const struct snd_soc_dai_ops q6tdm_ops = {
+	.prepare	= q6apm_lpass_dai_prepare,
+	.startup	= q6apm_lpass_dai_startup,
+	.shutdown	= q6i2s_lpass_dai_shutdown,
+	.set_tdm_slot	= q6tdm_set_tdm_slot,
+	.hw_params	= q6dma_hw_params,
+	.set_fmt	= q6i2s_set_fmt,
+	.set_sysclk	= q6i2s_set_sysclk,
+	.trigger	= q6apm_lpass_dai_trigger,
+};
+
 static const struct snd_soc_component_driver q6apm_lpass_dai_component = {
 	.name = "q6apm-be-dai-component",
 	.of_xlate_dai_name = q6dsp_audio_ports_of_xlate_dai_name,
@@ -415,6 +473,7 @@ static int of_q6apm_parse_dai_data(struct device *dev,
 		case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
 		case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
 		case SENARY_MI2S_RX ... SENARY_MI2S_TX:
+		case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
 			priv = &data->priv[id];
 			priv->mclk = of_clk_get_by_name(node, "mclk");
 			if (IS_ERR(priv->mclk)) {
@@ -479,6 +538,7 @@ static int q6apm_lpass_dai_dev_probe(struct platform_device *pdev)
 	cfg.q6i2s_ops = &q6i2s_ops;
 	cfg.q6dma_ops = &q6dma_ops;
 	cfg.q6hdmi_ops = &q6hdmi_ops;
+	cfg.q6tdm_ops = &q6tdm_ops;
 	dais = q6dsp_audio_ports_set_config(dev, &cfg, &num_dais);
 
 	return devm_snd_soc_register_component(dev, &q6apm_lpass_dai_component, dais, num_dais);
-- 
2.34.1

