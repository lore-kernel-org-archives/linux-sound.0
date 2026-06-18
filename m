Received: from smtp153-140.sina.com.cn (smtp153-140.sina.com.cn [61.135.153.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4710E3A1685
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 08:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781771383; cv=none; b=HeFIDyf/OsFm/BFzFFb1menhgGRed9E7A4eeSo1QFb6WbIYuV9oXgRvMU/ggb+YUmmNW9+garT6B7Cs35TYiW58w9GE70iLw8zhnUNq5ylkPyTdfzgDHGv2kHBgqNcXN8LULwaW2nN0u4ucwW45zGJzCOgcPUajBuX0hb0p9SIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781771383; c=relaxed/simple;
	bh=cBs7YiHbetmL23BcwZVz+VI0A2XiRhJHU5HKrtE0vs8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=PfwlsTOj8hKa3bXxGHAN0Lpjngt0nBCmuF8gjzH4wfEnQwLWnXtAau/aJNzZjazRg/O+Wk5BPyCKsGGKRzFxOqxow7SGbkNVKWJBckCkkDN/yI31vr56CsFr+Ud/AW1SiSCE8RGPFxHyBfOaoX3xKLsgAmSy9RwOSzr+31kzhUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=61.135.153.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.36) with ESMTP
	id 6A33AC4300004CAE; Thu, 18 Jun 2026 16:28:58 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: EF3A811DE9164B79B972D6E711694A98
X-SMAIL-UIID: EF3A811DE9164B79B972D6E711694A98-20260618-162858
From: Zhang Yi <zhangyi@everest-semi.com>
To: linux-sound@vger.kernel.org,
	broonie@kernel.org,
	devicetree@vger.kernel.org
Cc: tiwai@suse.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v2 6/7] ASoC: codecs: ES8389: Add private members about HPF
Date: Thu, 18 Jun 2026 16:28:41 +0800
Message-Id: <20260618082842.2778-7-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260618082842.2778-1-zhangyi@everest-semi.com>
References: <20260618082842.2778-1-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

Add private members related to HPF.
Add a helper function to match the set HPF frequency.
Access the HPF frequency set by the user from the DTS

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/codecs/es8389.c | 65 +++++++++++++++++++++++++++++++++++++--
 sound/soc/codecs/es8389.h |  4 +++
 2 files changed, 67 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/es8389.c b/sound/soc/codecs/es8389.c
index 04b6a48b0..c80cc9601 100644
--- a/sound/soc/codecs/es8389.c
+++ b/sound/soc/codecs/es8389.c
@@ -36,6 +36,9 @@ struct	es8389_private {
 	unsigned int sysclk;
 	int mastermode;
 
+	u8 hpfl;
+	u8 hpfr;
+	u32 target_freq;
 	u8 mclk_src;
 	u8 vddd;
 	int version;
@@ -504,6 +507,48 @@ static inline int get_coeff(u8 vddd, u8 dmic, int mclk, int rate)
 	return -EINVAL;
 }
 
+static const u32 hpf_table[10][10] = {
+	{1020, 754, 624, 559, 527, 511, 502, 498, 497, 496},
+	{754, 495, 368, 306, 274, 259, 251, 247, 246, 244},
+	{624, 368, 243, 182, 151, 136, 128, 124, 123, 121},
+	{559, 306, 182, 120, 90, 75, 68, 63, 62, 60},
+	{527, 274, 151, 90, 60, 45, 38, 33, 32, 31},
+	{511, 259, 136, 75, 45, 30, 23, 19, 18, 17},
+	{502, 251, 128, 68, 38, 23, 16, 13, 11, 11},
+	{498, 247, 124, 63, 33, 19, 13, 10, 8, 8},
+	{497, 246, 123, 62, 32, 18, 11, 8, 8, 0},
+	{496, 244, 121, 60, 31, 17, 11, 8, 0, 0}
+};
+
+static bool find_best_hpf_freq(u32 target_hz, u8 *hpf1, u8 *hpf2)
+{
+	int best_row = -1, best_col = -1;
+	u32 min_diff = U32_MAX;
+	u32 f, diff;
+	int i, j;
+
+	if ((*hpf1 == ES8389_HPF_INVALID) | (*hpf2 == ES8389_HPF_INVALID))
+		return false;
+
+	for (i = 0; i < 10; i++) {
+		for (j = i; j < 10; j++) {
+			f = hpf_table[i][j];
+
+			diff = (target_hz > f) ? (target_hz - f) : (f - target_hz);
+			if (diff < min_diff) {
+				min_diff = diff;
+				best_row = i;
+				best_col = j;
+			}
+		}
+	}
+
+	*hpf1 = best_col + ES8389_HPF_OFFSET;
+	*hpf2 = best_row + ES8389_HPF_OFFSET;
+
+	return true;
+}
+
 /*
  * if PLL not be used, use internal clk1 for mclk,otherwise, use internal clk2 for PLL source.
  */
@@ -585,6 +630,8 @@ static int es8389_pcm_hw_params(struct snd_pcm_substream *substream,
 	int coeff, ret;
 	u8 dmic_enable, state = 0;
 	unsigned int regv;
+	u32 freq;
+	bool hpf;
 
 	switch (params_format(params)) {
 	case SNDRV_PCM_FORMAT_S16_LE:
@@ -663,6 +710,14 @@ static int es8389_pcm_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
+	freq = (es8389->target_freq * 48000) / params_rate(params);
+	hpf = find_best_hpf_freq(freq, &es8389->hpfl, &es8389->hpfr);
+	if (!hpf) {
+		dev_dbg(component->dev, "Can't find best freq. Use the default setting");
+		es8389->hpfl = ES8389_HPF_DEFAULT;
+		es8389->hpfr = ES8389_HPF_DEFAULT;
+	}
+
 	return 0;
 }
 
@@ -743,8 +798,8 @@ static int es8389_mute(struct snd_soc_dai *dai, int mute, int direction)
 			regmap_update_bits(es8389->regmap, ES8389_DAC_FORMAT_MUTE,
 						0x03, 0x00);
 		} else {
-			regmap_update_bits(es8389->regmap, ES8389_ADC_HPF1, 0x0f, 0x0a);
-			regmap_update_bits(es8389->regmap, ES8389_ADC_HPF2, 0x0f, 0x0a);
+			regmap_update_bits(es8389->regmap, ES8389_ADC_HPF1, 0x0f, es8389->hpfl);
+			regmap_update_bits(es8389->regmap, ES8389_ADC_HPF2, 0x0f, es8389->hpfr);
 			regmap_update_bits(es8389->regmap, ES8389_ADC_FORMAT_MUTE,
 						0x03, 0x00);
 		}
@@ -906,6 +961,12 @@ static int es8389_probe(struct snd_soc_component *component)
 		es8389->mclk_src = ES8389_MCLK_SOURCE;
 	}
 
+	ret = device_property_read_u32(component->dev, "everest,hpf-frq", &es8389->target_freq);
+	if (ret != 0) {
+		dev_dbg(component->dev, "hpf-freq return %d\n", ret);
+		es8389->target_freq = ES8389_HPF_INVALID;
+	}
+
 	for (i = 0; i < ARRAY_SIZE(es8389_core_supplies); i++)
 		es8389->core_supply[i].supply = es8389_core_supplies[i];
 	ret = devm_regulator_bulk_get(component->dev, ARRAY_SIZE(es8389_core_supplies), es8389->core_supply);
diff --git a/sound/soc/codecs/es8389.h b/sound/soc/codecs/es8389.h
index 57bf7c5f8..995a3eb58 100644
--- a/sound/soc/codecs/es8389.h
+++ b/sound/soc/codecs/es8389.h
@@ -106,6 +106,10 @@
 #define ES8389_MIC_SEL_MASK           (7 << 4)
 #define ES8389_MIC_DEFAULT            (1 << 4)
 
+#define ES8389_HPF_INVALID            U32_MAX
+#define ES8389_HPF_DEFAULT            (0x0A << 0)
+#define ES8389_HPF_OFFSET             4
+
 #define ES8389_MASTER_MODE_EN         (1 << 0)
 
 #define ES8389_TDM_OFF                (0 << 0)
-- 
2.17.1

