Received: from smtp153-140.sina.com.cn (smtp153-140.sina.com.cn [61.135.153.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4BF26E6F2
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 07:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782804246; cv=none; b=jxZIQ6jw2u165SqYACFeCCV+L3wdsWU7WKWGEwtuKS/cEB7rfvusmZEYaKp8FZBV6w523Khg8m3jHHg1wtE7Mst7Okyf55o3cK1Wp3+TANNJC7p9veOyt1PqHDjEPOWTwhjCSZPRlGe/iYXPPwdAnGBN+WXSh4zFJEqeib8McPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782804246; c=relaxed/simple;
	bh=pqZ1nlj+q4ICp0JDUFUW08tRRSPUyXmGdEZ8k1Q8B1k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=XRUt4J2DzWUp8nTr7zf6rhN1MhCNPrAs+9+j0TmS7gqPBM5TzZDwZuB8pakxYkysxCQ4ZuxWcUg1TRPjzXCSqU4NHzoyEEpu1nSPNDgDt15T76X8JUf6FQxRcfeivbJ8+y8pJSB1dRtIyWek48iGjoaRhXW0i5mOSXYtsOufrtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=61.135.153.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.36) with ESMTP
	id 6A436EE200001A79; Tue, 30 Jun 2026 15:23:21 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 53DEB06F98074DBB845B4792F186D76C
X-SMAIL-UIID: 53DEB06F98074DBB845B4792F186D76C-20260630-152321
From: Zhang Yi <zhangyi@everest-semi.com>
To: linux-sound@vger.kernel.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v4 5/6] ASoC: codecs: ES8389: Add private members about HPF
Date: Tue, 30 Jun 2026 15:23:10 +0800
Message-Id: <20260630072311.8427-6-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260630072311.8427-1-zhangyi@everest-semi.com>
References: <20260630072311.8427-1-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

Add private members related to HPF.
Add Kcontrol for HPF

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/codecs/es8389.c | 122 +++++++++++++++++++++++++++++++++++++-
 sound/soc/codecs/es8389.h |   3 +
 2 files changed, 123 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/es8389.c b/sound/soc/codecs/es8389.c
index 2838b337d..ce8258567 100644
--- a/sound/soc/codecs/es8389.c
+++ b/sound/soc/codecs/es8389.c
@@ -36,6 +36,10 @@ struct	es8389_private {
 	unsigned int sysclk;
 	int mastermode;
 
+	u8 hpfl;
+	u8 hpfr;
+	u32 hpf_freq;
+	u32 capture_rate;
 	u8 mclk_src;
 	u8 vddd;
 	int version;
@@ -82,6 +86,92 @@ static const DECLARE_TLV_DB_SCALE(mix_vol_tlv, -9500, 100, 0);
 static const DECLARE_TLV_DB_SCALE(alc_target_tlv, -3200, 200, 0);
 static const DECLARE_TLV_DB_SCALE(alc_max_level, -3200, 200, 0);
 
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
+static bool find_best_hpf_freq(u32 target_hz, u8 *hpf1, u8 *hpf2, u32 *out)
+{
+	int best_row = -1, best_col = -1;
+	u32 min_diff = U32_MAX;
+	u32 f, diff;
+	int i, j;
+
+	if ((target_hz > 1020) | (target_hz < 0))
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
+				*out = f;
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
+static int es8389_hpf_get(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct es8389_private *es8389 = snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.integer.value[0] = es8389->hpf_freq;
+	return 0;
+}
+
+static int es8389_hpf_set(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct es8389_private *es8389 = snd_soc_component_get_drvdata(component);
+	u32 freq;
+	bool hpf;
+
+	if (es8389->hpf_freq == ucontrol->value.integer.value[0])
+		return 0;
+
+	if (es8389->capture_rate) {
+		freq = (ucontrol->value.integer.value[0] * 48000) / es8389->capture_rate;
+
+		hpf = find_best_hpf_freq(freq, &es8389->hpfl, &es8389->hpfr, &es8389->hpf_freq);
+		if (!hpf)
+			return -EBUSY;
+
+		if (es8389->hpf_freq != ucontrol->value.integer.value[0])
+			dev_dbg(component->dev, "At the %u Hz sampling rate, %ld Hz could not be obtained."
+				"the frequency has been set to the closest value, %u Hz\n",
+				es8389->capture_rate, ucontrol->value.integer.value[0], es8389->hpf_freq);
+
+		regmap_update_bits(es8389->regmap, ES8389_ADC_HPF1, 0x0f, es8389->hpfl);
+		regmap_update_bits(es8389->regmap, ES8389_ADC_HPF2, 0x0f, es8389->hpfr);
+	} else {
+		es8389->hpf_freq = ucontrol->value.integer.value[0];
+		dev_dbg(component->dev, "PCM_STREAM_CAPTURE is not active.retain the input frequency\n");
+	}
+
+	return 1;
+}
+
 static int es8389_dmic_set(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
@@ -259,6 +349,8 @@ static const struct snd_kcontrol_new es8389_snd_controls[] = {
 	SOC_DOUBLE("ADC OSR Volume ON Switch", ES8389_ADC_MUTE, 6, 7, 1, 0),
 	SOC_SINGLE_TLV("ADC OSR Volume", ES8389_OSR_VOL, 0, 0xFF, 0, adc_vol_tlv),
 	SOC_DOUBLE("ADC OUTPUT Invert Switch", ES8389_ADC_HPF2, 5, 6, 1, 0),
+	SOC_SINGLE_EXT("ADC HPF Freq Select", SND_SOC_NOPM, 0, 1020, 0,
+				es8389_hpf_get, es8389_hpf_set),
 
 	SOC_SINGLE_TLV("DACL Playback Volume", ES8389_DACL_VOL, 0, 0xFF, 0, dac_vol_tlv),
 	SOC_SINGLE_TLV("DACR Playback Volume", ES8389_DACR_VOL, 0, 0xFF, 0, dac_vol_tlv),
@@ -585,6 +677,8 @@ static int es8389_pcm_hw_params(struct snd_pcm_substream *substream,
 	int coeff, ret;
 	u8 dmic_enable, state = 0;
 	unsigned int regv;
+	u32 freq;
+	bool hpf;
 
 	switch (params_format(params)) {
 	case SNDRV_PCM_FORMAT_S16_LE:
@@ -662,6 +756,28 @@ static int es8389_pcm_hw_params(struct snd_pcm_substream *substream,
 		dev_warn(component->dev, "Clock coefficients do not match");
 	}
 
+	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+		es8389->capture_rate = params_rate(params);
+		freq = (es8389->hpf_freq * 48000) / params_rate(params);
+		hpf = find_best_hpf_freq(freq, &es8389->hpfl, &es8389->hpfr, &es8389->hpf_freq);
+		if (!hpf) {
+			dev_err(component->dev, "The HPF frequency is invalid\n");
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static int es8389_pcm_hw_free(struct snd_pcm_substream *substream,
+		struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct es8389_private *es8389 = snd_soc_component_get_drvdata(component);
+
+	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+		es8389->capture_rate = 0;
+
 	return 0;
 }
 
@@ -742,8 +858,8 @@ static int es8389_mute(struct snd_soc_dai *dai, int mute, int direction)
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
@@ -759,6 +875,7 @@ static int es8389_mute(struct snd_soc_dai *dai, int mute, int direction)
 
 static const struct snd_soc_dai_ops es8389_ops = {
 	.hw_params = es8389_pcm_hw_params,
+	.hw_free = es8389_pcm_hw_free,
 	.set_fmt = es8389_set_dai_fmt,
 	.set_sysclk = es8389_set_dai_sysclk,
 	.set_tdm_slot = es8389_set_tdm_slot,
@@ -934,6 +1051,7 @@ static int es8389_probe(struct snd_soc_component *component)
 		return ret;
 	}
 
+	es8389->hpf_freq = ES8389_HPF_DEFAULT;
 	es8389_init(component);
 	es8389_set_bias_level(component, SND_SOC_BIAS_STANDBY);
 
diff --git a/sound/soc/codecs/es8389.h b/sound/soc/codecs/es8389.h
index 57bf7c5f8..de39e9bf9 100644
--- a/sound/soc/codecs/es8389.h
+++ b/sound/soc/codecs/es8389.h
@@ -106,6 +106,9 @@
 #define ES8389_MIC_SEL_MASK           (7 << 4)
 #define ES8389_MIC_DEFAULT            (1 << 4)
 
+#define ES8389_HPF_DEFAULT            16
+#define ES8389_HPF_OFFSET             4
+
 #define ES8389_MASTER_MODE_EN         (1 << 0)
 
 #define ES8389_TDM_OFF                (0 << 0)
-- 
2.17.1

