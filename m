Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256062BE02A;
	Wed, 10 Jun 2026 15:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781106350; cv=none; b=gWLh4oJKCtIhfpkE7gM4NYRfpvib8f6FXfwqESidArqU/w35uBxvYjmJJKI3+MISN0PPkFKj9lADJVhYIRiSR7KSb2YpH8uBCM5I8VZ4YSxA0FTAO3/i3SsZ8/vfwadjXeDJtONiHIsCLKowD7QasUIFKr6n0ObRw3OnJYJi2ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781106350; c=relaxed/simple;
	bh=tGJWmdZyOe3MDJ4nf2eSRXl6b4K3X1K+78Gq/zmri/8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YZkajnXz7q081qh2mifKEhfFBi0AJMhW65NF1hCjGk+4pgmPlrmdeucHmlzpB91djHWtLSQDVD/yYbjSU64uyq+fb0Gp3nbJAChi5GpUUfHlSnGuqHhIWxYK3N4eDhRtGkrJmYPpSGjd72kvKZmlLHhQCy0I5uPqPE+Y3AntTwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JkKbn5hQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JkKbn5hQ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBwPj1169956;
	Wed, 10 Jun 2026 15:45:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tkXAkXqrlK1
	rofHPC1VKknhIHhdjpGHCqUs8h8Q2+Ac=; b=JkKbn5hQrvTjIKdwYJJwPbWSWzT
	D/t6MBriNm3+FKWN7JF1IfBHYybGlsWg4qWNQ/W8G7jSH6NjhvhKFSJ3yRZgN+W8
	XDxDhqtVK8lshxiUQ4DC+gLwkCDyoF+fwFgW0+P8D0wUxIMWyKsQtc71ghiLNAhm
	sYahpy9H/v1Q5t6ECULrLI/xaafRFS/8ELWqL6K/6zmHj8DyQGbMUE973JG+Uawx
	wDd+LGXwtqVWXLZMwrDTQSAwxSSoA6qtKO6CAIbuu9p2UbCuLymUT7PaVnRAnvjr
	yICnMI6OuTVApv8flJDJEOQn4MYVbglev6y5MSEgjievbFnsj3l056TyFKg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq4w1smy4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jun 2026 15:45:37 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 65AFjW90003510;
	Wed, 10 Jun 2026 15:45:33 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4emcmk7fwu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jun 2026 15:45:33 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 65AFjWuA003484;
	Wed, 10 Jun 2026 15:45:32 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 65AFjWp1003477
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jun 2026 15:45:32 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 70F3B636; Wed, 10 Jun 2026 21:15:31 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Subject: [PATCH v1 2/6] ASoC: qcom: q6apm-lpass-dais: add TDM DAI operations
Date: Wed, 10 Jun 2026 21:15:13 +0530
Message-Id: <20260610154517.134570-3-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260610154517.134570-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260610154517.134570-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: XAYEJckqL58NX_KjOHovMkaRXbq4m8pl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDE0OSBTYWx0ZWRfX1PN3s6h5WEkP
 XP0EVBjVoVjCYIlx3Q10orgOQSZvKXVkSYtXlG9fu15Da1PAbXxzV3FVTxKHHcymPbDpw7Hmz7W
 PT0y11mLw7H/FKqxfaCr4NPwWu8Uo7/GI3YI4BjY/EmKOwdyIvSk6CCB3nPwsFfFw0/RoK5X6eo
 bSK06q+dh3kIYpSA6dkU1kMBW4LYVkfaZy2Cco0RFv6m63nTtHqzAhIsJA4R4wO+5x0cA7L0vDK
 3u4rnWVlSM5Uqv+jPPWB72nhDiglmL23sEhUDrXRj+ik2eGyqdklGbkZcP7H2lpOySuoIfzU106
 EeX6hXeHvOj9Lzx5hRjx91UEIK9Gt8gNzQrHQwbC6E5z8rI2cssoPfIqlY5F3uS32pfTYzsdlsy
 PB8c/Fogzj7JOphfC4X04kmnxY6g8gylb3Q8kqbcxPut+Enjp8lWcFMi4wGjezFAyAJ8YHUO1AA
 fAEplmW/tf569LZ3X9w==
X-Proofpoint-GUID: XAYEJckqL58NX_KjOHovMkaRXbq4m8pl
X-Authority-Analysis: v=2.4 cv=ZfEt8MVA c=1 sm=1 tr=0 ts=6a2986a1 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=ZMHsmkTgFhVY9WPaUOcA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100149

Add TDM DAI operations to q6apm-lpass-dais so AudioReach TDM
backends can be configured through the normal ASoC hw_params and DAI
setup flow.

The TDM set_tdm_slot() callback validates the supported slot width and
slot count, stores the active slot mask in the AudioReach module
configuration, and leaves existing DMA, I2S and HDMI paths unchanged.

Reuse the existing LPASS child-clock handling for TDM nodes as well as
MI2S nodes, since TDM backends also request optional backend clocks
through the machine driver set_sysclk() path.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 64 ++++++++++++++++++++++++-
 1 file changed, 63 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index 143750afb..d07b2d751 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -336,6 +336,55 @@ static int q6i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	return 0;
 }
 
+static int q6tdm_set_tdm_slot(struct snd_soc_dai *dai,
+			      unsigned int tx_mask,
+			      unsigned int rx_mask,
+			      int slots, int slot_width)
+{
+	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
+	struct audioreach_module_config *cfg = &dai_data->module_config[dai->id];
+	unsigned int cap_mask;
+
+	if (slot_width != 16 && slot_width != 32) {
+		dev_err(dai->dev, "%s: invalid slot_width %d\n",
+			__func__, slot_width);
+		return -EINVAL;
+	}
+
+	switch (slots) {
+	case 2:
+		cap_mask = 0x03;
+		break;
+	case 4:
+		cap_mask = 0x0f;
+		break;
+	case 8:
+		cap_mask = 0xff;
+		break;
+	case 16:
+		cap_mask = 0xffff;
+		break;
+	default:
+		dev_err(dai->dev, "%s: invalid slots %d\n",
+			__func__, slots);
+		return -EINVAL;
+	}
+
+	switch (dai->id) {
+	case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
+		cfg->nslots_per_frame = slots;
+		cfg->slot_width = slot_width;
+		cfg->slot_mask = ((dai->id & 0x1) ? tx_mask : rx_mask) & cap_mask;
+		break;
+	default:
+		dev_err(dai->dev, "%s: invalid dai id 0x%x\n",
+			__func__, dai->id);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static const struct snd_soc_dai_ops q6dma_ops = {
 	.prepare	= q6apm_lpass_dai_prepare,
 	.startup	= q6apm_lpass_dai_startup,
@@ -365,6 +414,17 @@ static const struct snd_soc_dai_ops q6hdmi_ops = {
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
@@ -390,9 +450,10 @@ static int of_q6apm_parse_dai_data(struct device *dev,
 		}
 
 		switch (id) {
-		/* MI2S specific properties */
+		/* MI2S/TDM child clocks */
 		case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
 		case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
+		case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
 			priv = &data->priv[id];
 			priv->mclk = of_clk_get_by_name(node, "mclk");
 			if (IS_ERR(priv->mclk)) {
@@ -448,6 +509,7 @@ static int q6apm_lpass_dai_dev_probe(struct platform_device *pdev)
 	cfg.q6i2s_ops = &q6i2s_ops;
 	cfg.q6dma_ops = &q6dma_ops;
 	cfg.q6hdmi_ops = &q6hdmi_ops;
+	cfg.q6tdm_ops = &q6tdm_ops;
 	dais = q6dsp_audio_ports_set_config(dev, &cfg, &num_dais);
 
 	return devm_snd_soc_register_component(dev, &q6apm_lpass_dai_component, dais, num_dais);
-- 
2.34.1

