Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22B13A453F;
	Mon,  3 Aug 2026 19:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785787005; cv=none; b=ndZJiQocxJsTmj0Jd4TseeUQ+Wq1+dotr57xKiEaUvdPD5IAFtmpSeXqZxUzJYdkmMozuqy+Cvn4FAVFZc6cTAZe5FM3+I0FJdqon1bOHHELlmHegfSJcbKk8xvQGlyPSB8+VTPE/+YWihY9TU9zzF6DJRauO9ECkbJLUeGQ1P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785787005; c=relaxed/simple;
	bh=1lbk4EOfdyj3q6nnkqB7mKqrQ73/6/vCyC/L7y91E3A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LBifQzzGzbXzURKqw+3I3ecYxMoLP+7hdISXAeJ6JivcFmHGZUh+mB6RisS31h7ykv5TqJPNIT+E91cXiv1g3vpeETmrENqrIjWbf3eax0owGKJVo0qgTeQaZHJmju2ThZo1+kFR9FWqZo8NGrk972xH60hm+n8d8PeOUPqnVgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mA2A39aG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mA2A39aG"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673JkoN82773462;
	Mon, 3 Aug 2026 19:56:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UpTyMOGNTYL
	Cloe02tRKuMNa4gB5VdWq+AzMlh/25TI=; b=mA2A39aGcq/wSpA6/B9VY1Z7idZ
	0FCOXDR/APrc5ZSS8D6+ROYmL2YpDEx6vWaf31gT48SlRTs98yyBHpdUE+4BFj0U
	xBuMvOvWEDu4kEq1fWjkycN0+9LxDIk9mT8VgCiZICaWHSRgQVX0rvNOo1I8bVJf
	ZlSdHAa7xOZDFHU6NpbxPOV48eUnltnCfTzVGV/tb0OimJ7zOfpMrJ3B/iiOrqiO
	74mimybXiKTBN3jlE0WjTnL4LTt07efbRW9re/kBQrXd+b15WCRTolDtBoxg0Lou
	R6rHBq1AnTcBYJE9iIt5Q+r9P1OpgFo0BlvvbPEPtiQjKDlqiV7hQNLOtyA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftwhds7yg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Aug 2026 19:56:32 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 673JuS7o016737;
	Mon, 3 Aug 2026 19:56:29 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4fs9vj9wvc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Aug 2026 19:56:29 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 673JuT0h016769;
	Mon, 3 Aug 2026 19:56:29 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 673JuTxn016765
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Aug 2026 19:56:29 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id F0F3E643; Tue,  4 Aug 2026 01:26:26 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Subject: [PATCH v6 6/7] ASoC: qcom: common: add DAI-node TDM slot helpers
Date: Tue,  4 Aug 2026 01:26:23 +0530
Message-Id: <20260803195624.3606352-7-prasad.kumpatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Zf4t8MVA c=1 sm=1 tr=0 ts=6a70f270 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=QQzHM_gvdhGi4T2-EgIA:9
X-Proofpoint-ORIG-GUID: WiuF_o504OG2trdPki-nM-F1zW13hpKU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE3NiBTYWx0ZWRfX2IOfpFjHrSqf
 NWWqMO0svg/bU0Rfb3bTLfMzLKnn0nneP3wxcS4c+CUmw54kurWnA76dDV0aE74+SHe1mF1UfwU
 YHxbAWT9v+9cQCybqG1Nhzyvl3JimPKlZf/LlryCvG5jsltXgvl0qH1ryeLZQRAMZVwHOIzh8+i
 7WWV2f4HmzSijK1z/+y+6oYo2eZ73E3sUN9xJoyceqIEwgvhbabRRyZ+0mvkqPANATFZUusN+I4
 yl+S62ZVHr+5UCUlGQVH8SXo9rWKOvDQbhyFtSmCpbr4mZ8LsiAZ2Tqf64EXoS1DdxGSGXYu5vz
 kML/U1JQ5EFCp0JoL6gCoY7bjlQCMwRV7dZ5nax3YkYSg/ArFjSFTem4aFJujCtJyS4oKc7wrm2
 FfTCf5OIhHQIaE7IR7wLhInb+fvNaZrVHPJik9tpXIU3+xz3YGZ8aELDNj0C2VSR1XVVIe5X8sr
 yP6XzNviSU/C3MGBNFQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE3NiBTYWx0ZWRfXyC7gBWwpqDy6
 jr60OaybAqY4ySHkQNsmKim0jNNgeq0Lp5JPfTauWTK2RJ6jc7VwF67n+NFY+MalpTOal4UETW6
 U3oRkbxRgFGWQP+R6ufpqPzPkCVcW+0=
X-Proofpoint-GUID: WiuF_o504OG2trdPki-nM-F1zW13hpKU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_05,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030176

Add common helpers to parse standard dai-tdm-slot-* properties from the
CPU and codec child nodes of a backend DAI link and apply the result to
the active DAIs.

QCOM machine drivers already use qcom_snd_parse_of() to build links from
DT, but they lacked a shared helper to translate endpoint TDM properties
into snd_soc_dai_set_tdm_slot() calls. Boards therefore had to carry ad
hoc parsing or rely on non-standard DT properties.

The helpers parse endpoint masks, validate the shared slot count and
slot width, and program CPU and codec DAIs with the resulting slot
configuration. A cfg-based apply helper is provided for callers that
already parsed the DT data and want to avoid a second DT traversal.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 sound/soc/qcom/common.c | 155 ++++++++++++++++++++++++++++++++++++++++
 sound/soc/qcom/common.h |  14 ++++
 2 files changed, 169 insertions(+)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index e4ff247ea47f..cacf467bc2a7 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -23,6 +23,161 @@ static const struct snd_soc_dapm_widget qcom_jack_snd_widgets[] = {
 	SND_SOC_DAPM_SPK("DP7 Jack", NULL),
 };
 
+static struct device_node *qcom_snd_get_link_node(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_card *card = rtd->card;
+	struct of_phandle_args args;
+	int ret;
+
+	if (!card->dev || !card->dev->of_node)
+		return NULL;
+
+	for_each_available_child_of_node_scoped(card->dev->of_node, np) {
+		struct device_node *cpu_np __free(device_node) =
+			of_get_child_by_name(np, "cpu");
+
+		if (!cpu_np)
+			continue;
+
+		ret = of_parse_phandle_with_args(cpu_np, "sound-dai", "#sound-dai-cells", 0,
+						 &args);
+		if (ret)
+			continue;
+
+		if (args.np == rtd->dai_link->cpus[0].of_node &&
+		    args.args_count == 1 && args.args[0] == cpu_dai->id) {
+			of_node_put(args.np);
+			return of_node_get(np);
+		}
+
+		of_node_put(args.np);
+	}
+
+	return NULL;
+}
+
+static int qcom_snd_parse_tdm_slot(struct device_node *np,
+				   struct qcom_snd_tdm_slot_cfg *cfg)
+{
+	memset(cfg, 0, sizeof(*cfg));
+
+	return snd_soc_of_parse_tdm_slot(np, &cfg->tx_mask, &cfg->rx_mask,
+					 &cfg->slots, &cfg->slot_width);
+}
+
+static int qcom_snd_normalize_tdm_slots(struct qcom_snd_tdm_slot_cfg *cpu_cfg,
+					struct qcom_snd_tdm_slot_cfg *codec_cfg)
+{
+	unsigned int slots;
+	unsigned int slot_width;
+
+	if (cpu_cfg->slots && codec_cfg->slots && cpu_cfg->slots != codec_cfg->slots)
+		return -EINVAL;
+
+	if (cpu_cfg->slot_width && codec_cfg->slot_width &&
+	    cpu_cfg->slot_width != codec_cfg->slot_width)
+		return -EINVAL;
+
+	slots = cpu_cfg->slots ?: codec_cfg->slots;
+	if (!slots)
+		return 0;
+
+	slot_width = cpu_cfg->slot_width ?: codec_cfg->slot_width;
+	if (!slot_width)
+		return -EINVAL;
+
+	cpu_cfg->slots = slots;
+	codec_cfg->slots = slots;
+	cpu_cfg->slot_width = slot_width;
+	codec_cfg->slot_width = slot_width;
+
+	return 0;
+}
+
+static int qcom_snd_parse_dai_tdm_slots(struct snd_soc_pcm_runtime *rtd,
+					struct qcom_snd_tdm_slot_cfg *cpu_cfg,
+					struct qcom_snd_tdm_slot_cfg *codec_cfg)
+{
+	struct device_node *link_np __free(device_node) = qcom_snd_get_link_node(rtd);
+	int ret;
+
+	if (!link_np)
+		return -EINVAL;
+
+	struct device_node *cpu_np __free(device_node) =
+		of_get_child_by_name(link_np, "cpu");
+	struct device_node *codec_np __free(device_node) =
+		of_get_child_by_name(link_np, "codec");
+	if (!cpu_np || !codec_np)
+		return -EINVAL;
+
+	ret = qcom_snd_parse_tdm_slot(cpu_np, cpu_cfg);
+	if (ret)
+		return ret;
+
+	return qcom_snd_parse_tdm_slot(codec_np, codec_cfg);
+}
+
+int qcom_snd_get_dai_tdm_slots(struct snd_soc_pcm_runtime *rtd,
+			       struct qcom_snd_tdm_slot_cfg *cpu_cfg,
+			       struct qcom_snd_tdm_slot_cfg *codec_cfg)
+{
+	int ret;
+
+	ret = qcom_snd_parse_dai_tdm_slots(rtd, cpu_cfg, codec_cfg);
+	if (ret)
+		return ret;
+
+	return qcom_snd_normalize_tdm_slots(cpu_cfg, codec_cfg);
+}
+EXPORT_SYMBOL_GPL(qcom_snd_get_dai_tdm_slots);
+
+int qcom_snd_apply_dai_tdm_slots_cfg(struct snd_soc_pcm_runtime *rtd,
+				     const struct qcom_snd_tdm_slot_cfg *cpu_cfg,
+				     const struct qcom_snd_tdm_slot_cfg *codec_cfg)
+{
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai;
+	int i;
+	int ret;
+
+	if (!cpu_cfg->slots)
+		return 0;
+
+	ret = snd_soc_dai_set_tdm_slot(cpu_dai, cpu_cfg->tx_mask, cpu_cfg->rx_mask,
+				       cpu_cfg->slots, cpu_cfg->slot_width);
+	if (ret)
+		return ret;
+
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		ret = snd_soc_dai_set_tdm_slot(codec_dai,
+					       codec_cfg->tx_mask,
+					       codec_cfg->rx_mask,
+					       codec_cfg->slots,
+					       codec_cfg->slot_width);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_snd_apply_dai_tdm_slots_cfg);
+
+int qcom_snd_apply_dai_tdm_slots(struct snd_soc_pcm_runtime *rtd)
+{
+	struct qcom_snd_tdm_slot_cfg cpu_cfg;
+	struct qcom_snd_tdm_slot_cfg codec_cfg;
+	int ret;
+
+	ret = qcom_snd_get_dai_tdm_slots(rtd, &cpu_cfg, &codec_cfg);
+	if (ret)
+		return ret == -EINVAL ? 0 : ret;
+
+	return qcom_snd_apply_dai_tdm_slots_cfg(rtd, &cpu_cfg, &codec_cfg);
+}
+EXPORT_SYMBOL_GPL(qcom_snd_apply_dai_tdm_slots);
+
 int qcom_snd_parse_of(struct snd_soc_card *card)
 {
 	struct device *dev = card->dev;
diff --git a/sound/soc/qcom/common.h b/sound/soc/qcom/common.h
index ee6662885593..02b24caec485 100644
--- a/sound/soc/qcom/common.h
+++ b/sound/soc/qcom/common.h
@@ -9,7 +9,21 @@
 
 #define LPASS_MAX_PORT			(SENARY_MI2S_TX + 1)
 
+struct qcom_snd_tdm_slot_cfg {
+	unsigned int tx_mask;
+	unsigned int rx_mask;
+	unsigned int slots;
+	unsigned int slot_width;
+};
+
 int qcom_snd_parse_of(struct snd_soc_card *card);
+int qcom_snd_get_dai_tdm_slots(struct snd_soc_pcm_runtime *rtd,
+			       struct qcom_snd_tdm_slot_cfg *cpu_cfg,
+			       struct qcom_snd_tdm_slot_cfg *codec_cfg);
+int qcom_snd_apply_dai_tdm_slots_cfg(struct snd_soc_pcm_runtime *rtd,
+				     const struct qcom_snd_tdm_slot_cfg *cpu_cfg,
+				     const struct qcom_snd_tdm_slot_cfg *codec_cfg);
+int qcom_snd_apply_dai_tdm_slots(struct snd_soc_pcm_runtime *rtd);
 int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
 			    struct snd_soc_jack *jack, bool *jack_setup);
 int qcom_snd_dp_jack_setup(struct snd_soc_pcm_runtime *rtd,
-- 
2.34.1

