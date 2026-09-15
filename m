Received: from r3-55.sinamail.sina.com.cn (r3-55.sinamail.sina.com.cn [202.108.3.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D906B4BEE58
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 02:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789439454; cv=none; b=OAgh/JIklkWqobAzM0N20SfIu4j5v7RcGCDQ4wD3Mih0yu805w4+GjaBOHTeYf1KtPkmJKuo5oRV7XAT6Jk5gXqwDemYrsup0kCwZgYthnJVMNeXNgBU4Da9M9drDs6bMtK2ahgbxKrGmvlHMLyoq4VTEO6fUwxRzyf4RwVf+gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789439454; c=relaxed/simple;
	bh=4yHFdHFKTgFzAK2FIoOciKR4XARlwFi196yHQdAr314=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=AqCib9OSH1F2kdraQX8KFqz1XhwXGlXVdJlMAd1npIvaZTDwNcmIKwGB/fA/9rr7XSXljUuzWPk9mV59lVFesYjbZPiVJGPvutFmk69QmuTC8ZU7A4Fmi5cNPxJZGSbUqtgOBn8TsCO58LKsGrWoNU6Ot1kQOJrHJP70fTiuvig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.38) with ESMTP
	id 6AA8ADB0000067D9; Tue, 15 Sep 2026 10:30:09 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: B45FFE50C65C46B7B8DA3AA4C07B9C03
X-SMAIL-UIID: B45FFE50C65C46B7B8DA3AA4C07B9C03-20260915-103009
From: Zhang Yi <zhangyi@everest-semi.com>
To: linux-sound@vger.kernel.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v4 1/2] ASoC: codecs: ES8326: Add private members about HPF
Date: Tue, 15 Sep 2026 10:30:05 +0800
Message-Id: <20260915023006.22940-2-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260915023006.22940-1-zhangyi@everest-semi.com>
References: <20260915023006.22940-1-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

Add private members related to HPF.
Add Kcontrol for HPF

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/codecs/es8326.c | 124 +++++++++++++++++++++++++++++++++++++-
 sound/soc/codecs/es8326.h |   4 ++
 2 files changed, 126 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index 32f39cdff..30964aeb9 100644
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -33,11 +33,16 @@ struct es8326_priv {
 	 * while enabling or disabling or during an irq.
 	 */
 	struct mutex lock;
+	struct mutex hpf_lock;
 	u8 jack_pol;
 	u8 interrupt_src;
 	u8 interrupt_clk;
 	u8 hpl_vol;
 	u8 hpr_vol;
+	u8 hpfl;
+	u8 hpfr;
+	u32 hpf_freq;
+	u32 capture_rate;
 	bool jd_inverted;
 	unsigned int sysclk;
 
@@ -47,6 +52,48 @@ struct es8326_priv {
 	int jack_remove_retry;
 };
 
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
+	if (target_hz > 1020)
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
+	*hpf1 = best_col + ES8326_HPF_OFFSET;
+	*hpf2 = best_row + ES8326_HPF_OFFSET;
+
+	return true;
+}
+
 static int es8326_crosstalk1_get(struct snd_kcontrol *kcontrol,
 		struct snd_ctl_elem_value *ucontrol)
 {
@@ -189,6 +236,48 @@ static int es8326_hprvol_set(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
+static int es8326_hpf_get(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct es8326_priv *es8326 = snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.integer.value[0] = es8326->hpf_freq;
+	return 0;
+}
+
+static int es8326_hpf_set(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct es8326_priv *es8326 = snd_soc_component_get_drvdata(component);
+	u32 freq;
+	bool hpf;
+
+	if ((ucontrol->value.integer.value[0] > 1020) || (ucontrol->value.integer.value[0] < 0))
+		return -EBUSY;
+
+	if (es8326->hpf_freq == ucontrol->value.integer.value[0])
+		return 0;
+
+	if (es8326->capture_rate) {
+		guard(mutex)(&es8326->hpf_lock);
+		freq = (ucontrol->value.integer.value[0] * 48000) / es8326->capture_rate;
+
+		hpf = find_best_hpf_freq(freq, &es8326->hpfl, &es8326->hpfr);
+		if (!hpf)
+			return -EBUSY;
+
+		regmap_update_bits(es8326->regmap, ES8326_ADC_HPFS1, 0x0f, es8326->hpfl);
+		regmap_update_bits(es8326->regmap, ES8326_ADC_HPFS2, 0x0f, es8326->hpfr);
+	} else {
+		dev_dbg_ratelimited(component->dev, "PCM_STREAM_CAPTURE is not active.retain the input frequency\n");
+	}
+	es8326->hpf_freq = ucontrol->value.integer.value[0];
+
+	return 1;
+}
+
 static const SNDRV_CTL_TLVD_DECLARE_DB_SCALE(dac_vol_tlv, -9550, 50, 0);
 static const SNDRV_CTL_TLVD_DECLARE_DB_SCALE(adc_vol_tlv, -9550, 50, 0);
 static const SNDRV_CTL_TLVD_DECLARE_DB_SCALE(adc_analog_pga_tlv, 0, 300, 0);
@@ -269,6 +358,8 @@ static const struct snd_kcontrol_new es8326_snd_controls[] = {
 	SOC_ENUM("ALC Capture Winsize", alc_winsize),
 	SOC_SINGLE_TLV("ALC Capture Target Level", ES8326_ALC_LEVEL,
 			0, 0x0f, 0, drc_target_tlv),
+	SOC_SINGLE_EXT("ADC HPF Freq Select", SND_SOC_NOPM, 0, 1020, 0,
+				es8326_hpf_get, es8326_hpf_set),
 
 	SOC_SINGLE_EXT("CROSSTALK1", SND_SOC_NOPM, 0, 31, 0,
 			es8326_crosstalk1_get, es8326_crosstalk1_set),
@@ -353,8 +444,6 @@ static bool es8326_writeable_register(struct device *dev, unsigned int reg)
 	case ES8326_BIAS_SW2:
 	case ES8326_BIAS_SW3:
 	case ES8326_BIAS_SW4:
-	case ES8326_ADC_HPFS1:
-	case ES8326_ADC_HPFS2:
 		return false;
 	default:
 		return true;
@@ -558,6 +647,8 @@ static int es8326_pcm_hw_params(struct snd_pcm_substream *substream,
 	struct es8326_priv *es8326 = snd_soc_component_get_drvdata(component);
 	u8 srate = 0;
 	int coeff, array;
+	u32 freq;
+	bool hpf;
 
 	if (es8326->version == 0) {
 		coeff_div =  coeff_div_v0;
@@ -612,6 +703,28 @@ static int es8326_pcm_hw_params(struct snd_pcm_substream *substream,
 		dev_warn(component->dev, "Clock coefficients do not match");
 	}
 
+	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+		es8326->capture_rate = params_rate(params);
+		freq = (es8326->hpf_freq * 48000) / params_rate(params);
+		hpf = find_best_hpf_freq(freq, &es8326->hpfl, &es8326->hpfr);
+		if (!hpf) {
+			dev_err(component->dev, "The HPF frequency is invalid\n");
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static int es8326_pcm_hw_free(struct snd_pcm_substream *substream,
+		struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct es8326_priv *es8326 = snd_soc_component_get_drvdata(component);
+
+	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+		es8326->capture_rate = 0;
+
 	return 0;
 }
 
@@ -636,6 +749,8 @@ static int es8326_mute(struct snd_soc_dai *dai, int mute, int direction)
 				regmap_update_bits(es8326->regmap, ES8326_VMIDSEL, 0x40, 0x40);
 				regmap_update_bits(es8326->regmap, ES8326_ANA_MICBIAS, 0x70, 0x30);
 			}
+			regmap_update_bits(es8326->regmap, ES8326_ADC_HPFS1, 0x0f, 0x04);
+			regmap_update_bits(es8326->regmap, ES8326_ADC_HPFS2, 0x0f, 0x04);
 		}
 	} else {
 		if (!es8326->calibrated) {
@@ -728,6 +843,7 @@ static int es8326_set_bias_level(struct snd_soc_component *codec,
 
 static const struct snd_soc_dai_ops es8326_ops = {
 	.hw_params = es8326_pcm_hw_params,
+	.hw_free = es8326_pcm_hw_free,
 	.set_fmt = es8326_set_dai_fmt,
 	.set_sysclk = es8326_set_dai_sysclk,
 	.mute_stream = es8326_mute,
@@ -781,6 +897,8 @@ static void es8326_capture_pop_handler(struct work_struct *work)
 	struct es8326_priv *es8326 =
 		container_of(work, struct es8326_priv, capture_pop_work.work);
 
+	regmap_update_bits(es8326->regmap, ES8326_ADC_HPFS1, 0x0f, es8326->hpfl);
+	regmap_update_bits(es8326->regmap, ES8326_ADC_HPFS2, 0x0f, es8326->hpfr);
 	regmap_update_bits(es8326->regmap,  ES8326_ADC_MUTE,
 					0x0F, 0x00);
 }
@@ -1212,6 +1330,7 @@ static int es8326_probe(struct snd_soc_component *component)
 	}
 	dev_dbg(component->dev, "interrupt-clk %x", es8326->interrupt_clk);
 
+	es8326->hpf_freq = ES8326_HPF_DEFAULT;
 	es8326_init(component);
 	return 0;
 }
@@ -1298,6 +1417,7 @@ static int es8326_i2c_probe(struct i2c_client *i2c)
 	i2c_set_clientdata(i2c, es8326);
 	es8326->i2c = i2c;
 	mutex_init(&es8326->lock);
+	mutex_init(&es8326->hpf_lock);
 	es8326->regmap = devm_regmap_init_i2c(i2c, &es8326_regmap_config);
 	if (IS_ERR(es8326->regmap)) {
 		ret = PTR_ERR(es8326->regmap);
diff --git a/sound/soc/codecs/es8326.h b/sound/soc/codecs/es8326.h
index 1c5b3ec70..c78d528e7 100644
--- a/sound/soc/codecs/es8326.h
+++ b/sound/soc/codecs/es8326.h
@@ -149,6 +149,10 @@
 #define ES8326_ADC_SRC_DMIC_SDIN3 6
 #define ES8326_ADC_SRC_DMIC_SDIN3_INV 7
 
+/* HPF Settings */
+#define ES8326_HPF_DEFAULT            8
+#define ES8326_HPF_OFFSET             4
+
 #define ES8326_ADC_AMIC	((ES8326_ADC_SRC_ANA_INV_SW1 << ES8326_ADC2_SHIFT) \
 		| (ES8326_ADC_SRC_ANA_INV_SW1 << ES8326_ADC1_SHIFT))
 #define ES8326_ADC_DMIC	((ES8326_ADC_SRC_DMIC_SDIN2 << ES8326_ADC2_SHIFT) \
-- 
2.17.1

