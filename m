Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74342C4167D
	for <linux-sound@archiver.kernel.org>; Sun, 29 Oct 2023 17:06:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbjJ2RG2 (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Sun, 29 Oct 2023 13:06:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230219AbjJ2RGZ (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Sun, 29 Oct 2023 13:06:25 -0400
Received: from srv01.abscue.de (abscue.de [IPv6:2a03:4000:63:bf5:4817:8eff:feeb:8ac7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9B47BF
        for <linux-sound@vger.kernel.org>; Sun, 29 Oct 2023 10:06:21 -0700 (PDT)
Received: from srv01.abscue.de (localhost [127.0.0.1])
        by spamfilter.srv.local (Postfix) with ESMTP id 9A6FF1C2592;
        Sun, 29 Oct 2023 17:57:53 +0100 (CET)
Received: from fluffy-mammal.fritz.box (dslb-088-078-198-137.088.078.pools.vodafone-ip.de [88.78.198.137])
        by srv01.abscue.de (Postfix) with ESMTPSA id 40CA91C2590;
        Sun, 29 Oct 2023 17:57:53 +0100 (CET)
From:   =?UTF-8?q?Otto=20Pfl=C3=BCger?= <otto.pflueger@abscue.de>
To:     linux-arm-msm@vger.kernel.org
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        =?UTF-8?q?Otto=20Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Subject: [PATCH v2 3/4] ASoC: qcom: q6afe-dai: check ADSP version when setting sysclk
Date:   Sun, 29 Oct 2023 17:57:15 +0100
Message-Id: <20231029165716.69878-4-otto.pflueger@abscue.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231029165716.69878-1-otto.pflueger@abscue.de>
References: <20231029165716.69878-1-otto.pflueger@abscue.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

Some older DSP firmware versions only provide AFE_PARAM_ID_*_CLK_CONFIG
requests for setting clocks, while newer ones only provide the
incompatible AFE_PARAM_ID_CLOCK_SET. The q6afe driver implements both,
but requires different clock IDs for the different firmware versions.

Implement the LPAIF_*_CLK clocks using newer clock IDs when the DSP
firmware does not support the old clocks so that users don't have to
care about the firmware version when setting clocks.

Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
---
 sound/soc/qcom/qdsp6/q6afe-dai.c | 98 +++++++++++++++++++++++++++-----
 1 file changed, 84 insertions(+), 14 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6afe-dai.c b/sound/soc/qcom/qdsp6/q6afe-dai.c
index a9c4f896a7df..c66f8ab41d5e 100644
--- a/sound/soc/qcom/qdsp6/q6afe-dai.c
+++ b/sound/soc/qcom/qdsp6/q6afe-dai.c
@@ -14,6 +14,7 @@
 #include <sound/pcm_params.h>
 #include "q6dsp-lpass-ports.h"
 #include "q6dsp-common.h"
+#include "q6core.h"
 #include "q6afe.h"
 
 
@@ -443,36 +444,105 @@ static int q6slim_set_channel_map(struct snd_soc_dai *dai,
 	return 0;
 }
 
+static int q6afe_get_bit_clk_id(unsigned int dai_id)
+{
+	switch (dai_id) {
+	case PRIMARY_MI2S_RX:
+	case PRIMARY_MI2S_TX:
+		return Q6AFE_LPASS_CLK_ID_PRI_MI2S_IBIT;
+	case SECONDARY_MI2S_RX:
+	case SECONDARY_MI2S_TX:
+		return Q6AFE_LPASS_CLK_ID_SEC_MI2S_IBIT;
+	case TERTIARY_MI2S_RX:
+	case TERTIARY_MI2S_TX:
+		return Q6AFE_LPASS_CLK_ID_TER_MI2S_IBIT;
+	case QUATERNARY_MI2S_RX:
+	case QUATERNARY_MI2S_TX:
+		return Q6AFE_LPASS_CLK_ID_TER_MI2S_IBIT;
+	case QUINARY_MI2S_RX:
+	case QUINARY_MI2S_TX:
+		return Q6AFE_LPASS_CLK_ID_QUI_MI2S_IBIT;
+
+	case PRIMARY_TDM_RX_0 ... PRIMARY_TDM_TX_7:
+		return Q6AFE_LPASS_CLK_ID_PRI_TDM_IBIT;
+	case SECONDARY_TDM_RX_0 ... SECONDARY_TDM_TX_7:
+		return Q6AFE_LPASS_CLK_ID_SEC_TDM_IBIT;
+	case TERTIARY_TDM_RX_0 ... TERTIARY_TDM_TX_7:
+		return Q6AFE_LPASS_CLK_ID_TER_TDM_IBIT;
+	case QUATERNARY_TDM_RX_0 ... QUATERNARY_TDM_TX_7:
+		return Q6AFE_LPASS_CLK_ID_QUAD_TDM_IBIT;
+	case QUINARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
+		return Q6AFE_LPASS_CLK_ID_QUIN_TDM_IBIT;
+
+	default:
+		return -EINVAL;
+	}
+}
+
+static int q6afe_get_osr_clk_id(unsigned int dai_id)
+{
+	switch (dai_id) {
+	case QUINARY_MI2S_RX:
+	case QUINARY_MI2S_TX:
+		return Q6AFE_LPASS_CLK_ID_QUI_MI2S_OSR;
+
+	case QUINARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
+		return Q6AFE_LPASS_CLK_ID_QUIN_TDM_OSR;
+
+	default:
+		return -EINVAL;
+	}
+}
+
 static int q6afe_mi2s_set_sysclk(struct snd_soc_dai *dai,
 		int clk_id, unsigned int freq, int dir)
 {
 	struct q6afe_dai_data *dai_data = dev_get_drvdata(dai->dev);
 	struct q6afe_port *port = dai_data->port[dai->id];
+	int clk_src;
+	int clk_root;
+	bool use_new_clks = q6core_get_adsp_version() >= Q6_ADSP_VERSION_2_7;
 
 	switch (clk_id) {
 	case LPAIF_DIG_CLK:
-		return q6afe_port_set_sysclk(port, clk_id, 0, 5, freq, dir);
+		if (use_new_clks) {
+			clk_src = Q6AFE_LPASS_CLK_ATTRIBUTE_COUPLE_NO;
+			clk_root = Q6AFE_LPASS_CLK_ROOT_DEFAULT;
+			clk_id = Q6AFE_LPASS_CLK_ID_INTERNAL_DIGITAL_CODEC_CORE;
+		} else {
+			clk_src = 0;
+			clk_root = 5;
+		}
+		break;
 	case LPAIF_BIT_CLK:
 	case LPAIF_OSR_CLK:
-		return q6afe_port_set_sysclk(port, clk_id,
-					     Q6AFE_LPASS_CLK_SRC_INTERNAL,
-					     Q6AFE_LPASS_CLK_ROOT_DEFAULT,
-					     freq, dir);
+		if (use_new_clks) {
+			clk_src = Q6AFE_LPASS_CLK_ATTRIBUTE_COUPLE_NO;
+			clk_root = Q6AFE_LPASS_CLK_ROOT_DEFAULT;
+			if (clk_id == LPAIF_OSR_CLK)
+				clk_id = q6afe_get_osr_clk_id(dai->id);
+			else
+				clk_id = q6afe_get_bit_clk_id(dai->id);
+		} else {
+			clk_src = Q6AFE_LPASS_CLK_SRC_INTERNAL;
+			clk_root = Q6AFE_LPASS_CLK_ROOT_DEFAULT;
+		}
+		break;
 	case Q6AFE_LPASS_CLK_ID_PRI_MI2S_IBIT ... Q6AFE_LPASS_CLK_ID_QUI_MI2S_OSR:
 	case Q6AFE_LPASS_CLK_ID_MCLK_1 ... Q6AFE_LPASS_CLK_ID_INT_MCLK_1:
 	case Q6AFE_LPASS_CLK_ID_WSA_CORE_MCLK ... Q6AFE_LPASS_CLK_ID_VA_CORE_2X_MCLK:
-		return q6afe_port_set_sysclk(port, clk_id,
-					     Q6AFE_LPASS_CLK_ATTRIBUTE_COUPLE_NO,
-					     Q6AFE_LPASS_CLK_ROOT_DEFAULT,
-					     freq, dir);
+		clk_src = Q6AFE_LPASS_CLK_ATTRIBUTE_COUPLE_NO;
+		clk_root = Q6AFE_LPASS_CLK_ROOT_DEFAULT;
+		break;
 	case Q6AFE_LPASS_CLK_ID_PRI_TDM_IBIT ... Q6AFE_LPASS_CLK_ID_QUIN_TDM_EBIT:
-		return q6afe_port_set_sysclk(port, clk_id,
-					     Q6AFE_LPASS_CLK_ATTRIBUTE_INVERT_COUPLE_NO,
-					     Q6AFE_LPASS_CLK_ROOT_DEFAULT,
-					     freq, dir);
+		clk_src = Q6AFE_LPASS_CLK_ATTRIBUTE_INVERT_COUPLE_NO;
+		clk_root = Q6AFE_LPASS_CLK_ROOT_DEFAULT;
+		break;
+	default:
+		return 0;
 	}
 
-	return 0;
+	return q6afe_port_set_sysclk(port, clk_id, clk_src, clk_root, freq, dir);
 }
 
 static const struct snd_soc_dapm_route q6afe_dapm_routes[] = {
-- 
2.39.2
