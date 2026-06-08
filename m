Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8F1317173
	for <linux-sound@vger.kernel.org>; Mon,  8 Jun 2026 02:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780885845; cv=none; b=gy7Fc7Zr01cD+7IA9Bb8uwiK+J/KY3xddyQ/a5iRt6P2ANcJx62MLXulL0lBjh1NuguD0ntHcULAjIbCUsHryN0Gx+26BWaraVm9VItnVdst6cXSvh09zEnZvys0aIWu6yN7LGBRPYkfEX8vk1om9+XETbd5REvNsvAs0z8Vzm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780885845; c=relaxed/simple;
	bh=BcXNi1JLPYozmk8/QHvCr0pZ/WjZCh4TPhBSo3DHPGY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IDecH2iJdpU9POeVYj/+Kg/3t+NZTaA4UHJWs/3YLwKfDfdw5/PUy5vEPWamoGT1pfGSQ8b6mZak9NZb9gF6P9BnjsTPuVtt7UlbCpTML1b7mcpcqkvqIxrn2DXRBdkFfaYb0OvRNKD7g5wbZzdVB5lWq7zIaLAU4hDmQsxkhiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CbFHUSvE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IxpF+E5b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CbFHUSvE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IxpF+E5b"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580FLGq2023398
	for <linux-sound@vger.kernel.org>; Mon, 8 Jun 2026 02:30:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=h8Jmd3NB1Lr
	fDBYuQ2+LtOcZPICs044bAIaMIRNUmTE=; b=CbFHUSvEdSRUcd9hBXDA/LjattO
	V1RADF6VSrEYCt4zSc7x3HdnfITXqK4mWrT2ZJBQK+kKbDsooUdZnxOzdLkyOq/v
	DuqF9TEdm/sO+hu+lG63sjAnbiOlQv+dySzg2XdzsL+TS2dYHKtjr6TvyYaEkp2M
	wn8wfKuiywjDH5tzQprtlV3W6630DHbYjKjLhvZ+p5UaPvSw6OsBM8zENIOsOOOy
	iO5X0U12UeLMTbJOtl4TukYwcRepUDnyx0bKvbz/1Hq3jCkyLGTmx5BoSCU7Ak6e
	v/sGlly4c1d1CrjTA1Z7zN8Q2zJN1uebOxhsXXu/pweqjV4HDXW5Ia66IZA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embmrdfn4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 08 Jun 2026 02:30:43 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8582b167f7so1933342a12.0
        for <linux-sound@vger.kernel.org>; Sun, 07 Jun 2026 19:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780885842; x=1781490642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h8Jmd3NB1LrfDBYuQ2+LtOcZPICs044bAIaMIRNUmTE=;
        b=IxpF+E5bCY2t4Ud8aUBUS9IpVUIgJs9ZN7DHYxlZEgY7lIVvlTGlV01DaHJIqosmHt
         +ln+9S7gKND2SAgv//DRDx6Qn7II6PUSxOMJlTr/SCJm+ktSFnUauLCF5f12tLLC7UvM
         mnyFBR9kEZOsWpLdjMTxgSJIlGky5Y3kSRP5XMNgNRmi/SSTNom2vH9wE/MCieX6X7DM
         e2qHcySobHknGb3qIG+9zCRkEkkYJUzcqxXOOYgGaTDhuIBDiTRZBhBOC/W0xQtdtpLJ
         GkmiJoBtorseZ83liAlMOwKKpsUj2Mmj3wlYoliF+FJ/Uh5vGTgvo1TrotWoQn7PkqK6
         wvbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780885842; x=1781490642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h8Jmd3NB1LrfDBYuQ2+LtOcZPICs044bAIaMIRNUmTE=;
        b=K28o8FbUwsMkg71cSswUqG6CYoIS3pDzMtgDz4Gc6ikrA5f2aSNBNyfWJPGVBsLKFG
         UfjHzXOkB+PCsj1r92A1ow70vEaez1XfMSKIcsX7TppDkG3lM11sBcLCadChkgqfGdhh
         vWuau1pa7MmH8uvaYI8NSIaMsFm5uVft9xKzvfgXloyy490e/bcEaUuMAyFoa2uWcCxQ
         c8m+pyh6WRHpFcjNr0R++ZpIpIVPF9vACoijmeqRQSPQpSpzG4QsDRCtXuoudikMlHth
         UTGCDgBwrQMt/EQJyivqIVbm5c3DkOK1Xp3XRYm/1C4QtN/f3FXcaRViN+0fRtas0Ab5
         kX3g==
X-Forwarded-Encrypted: i=1; AFNElJ9kxQ51vocVmb+m6ycaZ+4mxrExcdTquykHgL6BzIlNs2j0UaUCagxBtYlIAFy6Cte62hhS8PgrDNyh0w==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz4dVAyTFXjRB+uRHJhrWUaD+v6hHkUZRNZs5AQOPj3uG/7Nei
	Cl7n8r9ZshvzKXhuftO3bvpBQF4/7hiv3/km5+8CUveTDcGgz64W3YHD6Z0veKHWw7XRPR03GCw
	zJzLOt074R3FdaW0XtGR/FcK3JSv54HdeuXuIlyQqjhUA3EEZpPTupMH6sD3fV7THKA==
X-Gm-Gg: Acq92OH10RgY/78MkYgIQC+oo3FMjSAGfGH77CYMf37vSuce654MipOE4MaB7frA30p
	L1+uKm7PeLVItYgpshvIGF/lHQHPiXXdeFAbQAXjACJCJpnTiyJgyqn9d+dqMIWkfbjpDXO1viI
	EbgLMUyteJRefI7NIyh54Yi9+ECJWVImASL6IMah+Lwp/qiziOrkTo46Ym6SJIT2iGEnP72snU9
	+5TzotYcfPH1biaguLFBWBLnsU6vlLWRRIsUIEle4iFFL7SMOxDfYhtEBX8w4V+psHZoyRBFYyQ
	pg0UaYJO03CGOMAaUCETjec/l9HonZKmqmR1+jf3XYTwvgVhR95pQClQNN5aZ+D2jYawOzTLLaF
	vjseQtBuJT6aRVIlqOtItmEZEaTK+QxsYulrMxHqtelz8BIF7citVqeedXRuvBniNo8x8
X-Received: by 2002:a05:6a21:685:b0:3aa:c964:3c27 with SMTP id adf61e73a8af0-3b4cd091965mr15956837637.46.1780885842174;
        Sun, 07 Jun 2026 19:30:42 -0700 (PDT)
X-Received: by 2002:a05:6a21:685:b0:3aa:c964:3c27 with SMTP id adf61e73a8af0-3b4cd091965mr15956799637.46.1780885841714;
        Sun, 07 Jun 2026 19:30:41 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e0bbsm162343585ad.50.2026.06.07.19.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 19:30:41 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 2/3] ASoC: qcom: q6apm-lpass-dais: Add MI2S clock control
Date: Mon,  8 Jun 2026 08:00:10 +0530
Message-Id: <20260608023011.942228-3-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260608023011.942228-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260608023011.942228-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDAyMCBTYWx0ZWRfXyVDipA5GyI6u
 hQVCtWVGnzpRm1Sp5XPdi8Z6KrB3kqzlPQ0zHsIXbaBT8+8WN3Rl2/6FX3VLl0Cz4sq9KU24hgW
 wSbTum+E7jjQXDvwpU8LVtWoio7gC+frjdePGFGe0RaQxktw5eeil1TFL0k6kdDXQI2xbkN549u
 SJJsDVNKlHtn07fpNFlLRzbHyKt6Jraw4/V2BtfjTNXYm48JMbBpmeA+onNmtrFxhNaXxjM3GKC
 fFPQPIai+CChlVxTfPbmpz3lFtuSD326WIZDgQqGaItF0IrcMbiKB1s2mnqq9YlkkUsSQBUbN9I
 LOIXksFZobATtAndXqYHVq50WpeOcpbyBuduGvoAvhaSH2AMoR6y8NT6eoI8AFgGiPF/vTviJ9w
 r6YYJVknLmTKL+mzJBCAte54yHhd1x0m1Nl+KfQeax0OfjUZ+ubyrAsaNol0n+DF1DCE5e/Y0jF
 KcBQDsv9hIt9j6uFT1A==
X-Authority-Analysis: v=2.4 cv=B5eJFutM c=1 sm=1 tr=0 ts=6a262953 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=A-h2Renr4JBikGDhi8kA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: X_V7pd-7wZLapz3-e2BLzq9T1-V8RTzM
X-Proofpoint-ORIG-GUID: X_V7pd-7wZLapz3-e2BLzq9T1-V8RTzM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 clxscore=1011 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080020

Add support for MI2S clock control within q6apm-lpass DAIs, including
handling of MCLK, BCLK, and ECLK via the DAI .set_sysclk callback.
Each MI2S port now retrieves its clock handles from the device tree,
allowing per-port clock configuration and proper enable/disable during
startup and shutdown.

Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 137 +++++++++++++++++++++++-
 sound/soc/qcom/qdsp6/q6prm.h            |   4 +
 2 files changed, 139 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index 006b28348..143750afb 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -2,10 +2,12 @@
 // Copyright (c) 2021, Linaro Limited
 
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
+#include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <sound/pcm.h>
@@ -15,13 +17,22 @@
 #include "q6dsp-common.h"
 #include "audioreach.h"
 #include "q6apm.h"
+#include "q6prm.h"
 
 #define AUDIOREACH_BE_PCM_BASE	16
 
+struct q6apm_dai_priv_data {
+	struct clk *mclk;
+	struct clk *bclk;
+	struct clk *eclk;
+	bool mclk_enabled, bclk_enabled, eclk_enabled;
+};
+
 struct q6apm_lpass_dai_data {
 	struct q6apm_graph *graph[APM_PORT_MAX];
 	bool is_port_started[APM_PORT_MAX];
 	struct audioreach_module_config module_config[APM_PORT_MAX];
+	struct q6apm_dai_priv_data priv[APM_PORT_MAX];
 };
 
 static int q6dma_set_channel_map(struct snd_soc_dai *dai,
@@ -251,6 +262,70 @@ static int q6apm_lpass_dai_startup(struct snd_pcm_substream *substream, struct s
 	return 0;
 }
 
+static int q6i2s_dai_startup(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+{
+	return q6apm_lpass_dai_startup(substream, dai);
+}
+
+static void q6i2s_lpass_dai_shutdown(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+{
+	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
+
+	if (dai_data->priv[dai->id].mclk_enabled) {
+		clk_disable_unprepare(dai_data->priv[dai->id].mclk);
+		dai_data->priv[dai->id].mclk_enabled = false;
+	}
+
+	if (dai_data->priv[dai->id].bclk_enabled) {
+		clk_disable_unprepare(dai_data->priv[dai->id].bclk);
+		dai_data->priv[dai->id].bclk_enabled = false;
+	}
+
+	if (dai_data->priv[dai->id].eclk_enabled) {
+		clk_disable_unprepare(dai_data->priv[dai->id].eclk);
+		dai_data->priv[dai->id].eclk_enabled = false;
+	}
+	q6apm_lpass_dai_shutdown(substream, dai);
+}
+
+static int q6i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id, unsigned int freq, int dir)
+{
+	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
+	struct clk *sysclk;
+	bool *enabled;
+	int ret = 0;
+
+	switch (clk_id) {
+	case LPAIF_MI2S_MCLK:
+		sysclk = dai_data->priv[dai->id].mclk;
+		enabled = &dai_data->priv[dai->id].mclk_enabled;
+		break;
+	case LPAIF_MI2S_BCLK:
+		sysclk = dai_data->priv[dai->id].bclk;
+		enabled = &dai_data->priv[dai->id].bclk_enabled;
+		break;
+	case LPAIF_MI2S_ECLK:
+		sysclk = dai_data->priv[dai->id].eclk;
+		enabled = &dai_data->priv[dai->id].eclk_enabled;
+		break;
+	default:
+		break;
+	}
+
+	if (sysclk) {
+		clk_set_rate(sysclk, freq);
+		ret = clk_prepare_enable(sysclk);
+		if (ret) {
+			dev_err(dai->dev, "Error, Unable to prepare (%d) sysclk\n", clk_id);
+			return ret;
+		}
+
+		*enabled = true;
+	}
+
+	return ret;
+}
+
 static int q6i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 {
 	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
@@ -272,11 +347,12 @@ static const struct snd_soc_dai_ops q6dma_ops = {
 
 static const struct snd_soc_dai_ops q6i2s_ops = {
 	.prepare	= q6apm_lpass_dai_prepare,
-	.startup	= q6apm_lpass_dai_startup,
-	.shutdown	= q6apm_lpass_dai_shutdown,
+	.startup	= q6i2s_dai_startup,
+	.shutdown	= q6i2s_lpass_dai_shutdown,
 	.set_channel_map  = q6dma_set_channel_map,
 	.hw_params        = q6dma_hw_params,
 	.set_fmt	= q6i2s_set_fmt,
+	.set_sysclk	= q6i2s_set_sysclk,
 	.trigger	= q6apm_lpass_dai_trigger,
 };
 
@@ -297,6 +373,59 @@ static const struct snd_soc_component_driver q6apm_lpass_dai_component = {
 	.remove_order   = SND_SOC_COMP_ORDER_FIRST,
 };
 
+static int of_q6apm_parse_dai_data(struct device *dev,
+				   struct q6apm_lpass_dai_data *data)
+{
+	struct device_node *node;
+	int ret;
+
+	for_each_child_of_node(dev->of_node, node) {
+		struct q6apm_dai_priv_data *priv;
+		int id;
+
+		ret = of_property_read_u32(node, "reg", &id);
+		if (ret || id < 0 || id >= APM_PORT_MAX) {
+			dev_err(dev, "valid dai id not found:%d\n", ret);
+			continue;
+		}
+
+		switch (id) {
+		/* MI2S specific properties */
+		case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
+		case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
+			priv = &data->priv[id];
+			priv->mclk = of_clk_get_by_name(node, "mclk");
+			if (IS_ERR(priv->mclk)) {
+				if (PTR_ERR(priv->mclk) == -EPROBE_DEFER)
+					return dev_err_probe(dev, PTR_ERR(priv->mclk),
+							     "unable to get mi2s mclk\n");
+				priv->mclk = NULL;
+			}
+
+			priv->bclk = of_clk_get_by_name(node, "bclk");
+			if (IS_ERR(priv->bclk)) {
+				if (PTR_ERR(priv->bclk) == -EPROBE_DEFER)
+					return dev_err_probe(dev, PTR_ERR(priv->bclk),
+							     "unable to get mi2s bclk\n");
+				priv->bclk = NULL;
+			}
+
+			priv->eclk = of_clk_get_by_name(node, "eclk");
+			if (IS_ERR(priv->eclk)) {
+				if (PTR_ERR(priv->eclk) == -EPROBE_DEFER)
+					return dev_err_probe(dev, PTR_ERR(priv->eclk),
+							     "unable to get mi2s eclk\n");
+				priv->eclk = NULL;
+			}
+			break;
+		default:
+			break;
+		}
+	}
+
+	return 0;
+}
+
 static int q6apm_lpass_dai_dev_probe(struct platform_device *pdev)
 {
 	struct q6dsp_audio_port_dai_driver_config cfg;
@@ -304,12 +433,16 @@ static int q6apm_lpass_dai_dev_probe(struct platform_device *pdev)
 	struct snd_soc_dai_driver *dais;
 	struct device *dev = &pdev->dev;
 	int num_dais;
+	int ret;
 
 	dai_data = devm_kzalloc(dev, sizeof(*dai_data), GFP_KERNEL);
 	if (!dai_data)
 		return -ENOMEM;
 
 	dev_set_drvdata(dev, dai_data);
+	ret = of_q6apm_parse_dai_data(dev, dai_data);
+	if (ret)
+		return ret;
 
 	memset(&cfg, 0, sizeof(cfg));
 	cfg.q6i2s_ops = &q6i2s_ops;
diff --git a/sound/soc/qcom/qdsp6/q6prm.h b/sound/soc/qcom/qdsp6/q6prm.h
index 6917e70bc..7b751486c 100644
--- a/sound/soc/qcom/qdsp6/q6prm.h
+++ b/sound/soc/qcom/qdsp6/q6prm.h
@@ -3,6 +3,10 @@
 #ifndef __Q6PRM_H__
 #define __Q6PRM_H__
 
+#define LPAIF_MI2S_MCLK 1
+#define LPAIF_MI2S_BCLK 2
+#define LPAIF_MI2S_ECLK 3
+
 /* Clock ID for Primary I2S IBIT */
 #define Q6PRM_LPASS_CLK_ID_PRI_MI2S_IBIT                          0x100
 /* Clock ID for Primary I2S EBIT */
-- 
2.34.1

