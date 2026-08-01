Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F3B7263B;
	Sat,  1 Aug 2026 05:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785563195; cv=none; b=p+FseprtMnpdzXzQUyqNlRCakoiKlouhi4kqLIq/OmDpG8mr4rL4RCiMwEOW0DKF5kTK9tIxmbKJbx4d5zzw2mejxB5ONJzp2XwzIz+zIUIaiH/qQLM9vafZ98162LDc+A0UxrHvtho7SFVoGVmf11JCVpQGX5nkC1fif/X+0WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785563195; c=relaxed/simple;
	bh=1lbk4EOfdyj3q6nnkqB7mKqrQ73/6/vCyC/L7y91E3A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lpPjOu6CBvEbefxmoz/JAH/M51gP7SIiJiIaSHtK5DvfEHt4nwDazCoBfEK1egqT/eBTXhVnB3j+gUfadlid+THCH/eSRb1p2bgDMcB1T7PDIUQuMQ/bFad+fYvyBMj2hnJPRmJntAJb3PXELKbFsErD9SU7FjGLfP8r11M+H8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J+NDzeNy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J+NDzeNy"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6713FlTQ1759334;
	Sat, 1 Aug 2026 05:46:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UpTyMOGNTYL
	Cloe02tRKuMNa4gB5VdWq+AzMlh/25TI=; b=J+NDzeNyllEXHmYFSmVYUvuCaj4
	iRyrg5XeftMhad3gahdzR2Lu6jrM2aHyEaAEYdnGWLlg5b1FwWAb5J3VDXEK0dZV
	luZ1nl1HlLEJdG9SLKDBHx7jQPm6+U08/U1YcLNh29djMLzDwZk4vteQ4x1+148W
	q3a4YBlR658Uy4erit6H7tnA4kVGSplr/oYlStCENc9rOYVY0l3dwU28ytpYr1Vr
	y0LQMc9GrcoyZ2pd3hHal1WVaDPm97II4gCnPaMcx0JB7TER4TgkZ2e8qZGq4vQP
	GIrjRozr/ImbdknNuYuWvzn09ziVR0fIkimJm6UDn7XKpaVQpWPtotZunnA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8r6g9mw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 01 Aug 2026 05:46:18 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 6715kEjW016962;
	Sat, 1 Aug 2026 05:46:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4fs9vh0uuj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 01 Aug 2026 05:46:15 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 6715kFCX017020;
	Sat, 1 Aug 2026 05:46:15 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6715kF42017015
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 01 Aug 2026 05:46:15 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 19EAAC0C; Sat,  1 Aug 2026 11:16:13 +0530 (+0530)
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
Subject: [PATCH v5 6/7] ASoC: qcom: common: add DAI-node TDM slot helpers
Date: Sat,  1 Aug 2026 11:16:09 +0530
Message-Id: <20260801054610.4047089-7-prasad.kumpatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDAzNyBTYWx0ZWRfX6d/82byD8eZE
 03RqNBecEgtvWasJ5u+vIWMYaU4r/E/4h51hx8BjIG2GQjkmj39D6naBM8t2cYhvl931BB/7QCq
 XHYV6x//sFYVXQOtVESJWQWrPO9Fx04=
X-Proofpoint-GUID: dJungKvQt82KzPo74g9TQbnLe21781bb
X-Proofpoint-ORIG-GUID: dJungKvQt82KzPo74g9TQbnLe21781bb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDAzNyBTYWx0ZWRfX2K5hHGhDuhlS
 C+W/2ha+R8RxLHAZRe+Ipm6ysbHgIfNUK9oKjbiQw2zvZR/D2Ia3aIf6Ec2SNVPBj1iTl2Aalk5
 Ro/Vtlu+edBHaakRcwkNk8BZvWBTTChe65gEWcEEsOU+k7aCYWKp8aVsAOO3rl0jy336kn19X++
 0/mN45Xici9U69S7BSyI6p56D4EkZfZs4eqX5jyggwW4AyaBjzCPjYsDi/JQzhv6c21snO1OBwf
 jvK7M88so21jH9sKPMK7ZxnyitRvFU9kpk1AnJBi6cD9va9ciZqOiPBxzmCCjm3CBhSQMBk8iVN
 KtyeGzsoE/qR6NieS35rRKfCXeC20eoDx/uBh3J1L/7C6yTvhyQYUXCUOZxf+3ndxasrsKNgZDH
 CIH9TbcrlJIEqNWiRMUEwiBMJPoinEDLMvisuKxoQ/dn05hf00DSt8W1nSmPm5yotSYlkkVF6Cs
 seewbPwfoAM/3j/SZUw==
X-Authority-Analysis: v=2.4 cv=Q5ziJY2a c=1 sm=1 tr=0 ts=6a6d882a cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=QQzHM_gvdhGi4T2-EgIA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608010037

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

