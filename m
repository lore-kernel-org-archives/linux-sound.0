Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C05C51F19A
	for <linux-sound@vger.kernel.org>; Sat, 17 Jan 2026 09:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768641533; cv=none; b=iJJB7/dpp4z9g+sZbDEQRY4WWM2lpkuILe8/2DDpa72XBk5Ovg5FdYgws5F3sv7woxCsVMZCDNmYfJrx2wZxprlnCxK3/ZUqKhwcc8/a0eMMlPrTtQ/V0lP57xNMLDggC6NcQwtLKKInNpieiNjy8Y3nviTwkbxA62c+XufKI9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768641533; c=relaxed/simple;
	bh=+byPycp6HoKUG5Dq/uORD6Od3STSMhScc7yGaqGfqGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DD/u0VVuRXnc1xgwWkohR9VKY7oVW+VgIFYJi5g0fqOJxpBtV8HK2HZT+Pob+CXkw9ySx8Y5Sup98rea6jeRiW/DYAzho0E3rttWTD3U/wOw/hNP2Wv7UvLgEaKRyZ16dpSotAsb/xdQuQ9z/NhVPAuySZBCK0PKhJ4j0WzyU6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.1])
	by gateway (Coremail) with SMTP id _____8BxWcL5U2tpT9QJAA--.32050S3;
	Sat, 17 Jan 2026 17:18:49 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.1])
	by front1 (Coremail) with SMTP id qMiowJAx28HzU2tpHh8hAA--.130S3;
	Sat, 17 Jan 2026 17:18:46 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	linux-sound@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 1/4] ASoC: codecs: es8323: Replace magic numbers with defined macros
Date: Sat, 17 Jan 2026 17:18:34 +0800
Message-ID: <7e8953f2d36a86e9d507d6bb01c72b64846e0829.1768641428.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768641428.git.zhoubinbin@loongson.cn>
References: <cover.1768641428.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAx28HzU2tpHh8hAA--.130S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEKCGlrJLcBwwAAsR
X-Coremail-Antispam: 1Uk129KBj9fXoWfJFWrXry5Jw18ur1rAFyrAFc_yoW8Aw4kXo
	WSq34ftw17J3WvvFW5Jr13KFyUGrWFvF13AFZxAwsYvF1xGFyYkw4qqFy7J34Yga4Yv34r
	Xr4DJF1rJrZakFy7l-sFpf9Il3svdjkaLaAFLSUrUUUU1b8apTn2vfkv8UJUUUU8wcxFpf
	9Il3svdxBIdaVrn0xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3
	UjIYCTnIWjp_UUUYq7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI
	8IcIk0rVWrJVCq3wAFIxvE14AKwVWUXVWUAwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xG
	Y2AK021l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14
	v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8JVW8Jr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q
	6rW5McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
	vIr41l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_
	Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1V
	AY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAI
	cVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42
	IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIev
	Ja73UjIFyTuYvjxU4AhLUUUUU

According to the manual, add more detailed register bitfield definitions
to replace the magic numbers in the register settings in es8323 codec.

No functional change intended.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 sound/soc/codecs/es8323.c | 203 ++++++++++++++++++++------------------
 sound/soc/codecs/es8323.h |  82 +++++++++++++--
 2 files changed, 182 insertions(+), 103 deletions(-)

diff --git a/sound/soc/codecs/es8323.c b/sound/soc/codecs/es8323.c
index eb85b71e87f3..8647ddc1c285 100644
--- a/sound/soc/codecs/es8323.c
+++ b/sound/soc/codecs/es8323.c
@@ -12,6 +12,7 @@
 // Further cleanup and restructuring by:
 //         Binbin Zhou <zhoubinbin@loongson.cn>
 
+#include <linux/bitfield.h>
 #include <linux/module.h>
 #include <linux/acpi.h>
 #include <linux/clk.h>
@@ -32,7 +33,6 @@ struct es8323_priv {
 	struct clk *mclk;
 	struct regmap *regmap;
 	struct snd_pcm_hw_constraint_list *sysclk_constraints;
-	struct snd_soc_component *component;
 };
 
 /* es8323 register cache */
@@ -52,7 +52,7 @@ static const struct reg_default es8323_reg_defaults[] = {
 	{ ES8323_ADCCONTROL4,  0x00 },
 	{ ES8323_ADCCONTROL5,  0x06 },
 	{ ES8323_ADCCONTROL6,  0x30 },
-	{ ES8323_ADC_MUTE,     0x30 },
+	{ ES8323_ADCCONTROL7,  0x30 },
 	{ ES8323_LADC_VOL,     0xc0 },
 	{ ES8323_RADC_VOL,     0xc0 },
 	{ ES8323_ADCCONTROL10, 0x38 },
@@ -62,7 +62,7 @@ static const struct reg_default es8323_reg_defaults[] = {
 	{ ES8323_ADCCONTROL14, 0x00 },
 	{ ES8323_DACCONTROL1,  0x00 },
 	{ ES8323_DACCONTROL2,  0x06 },
-	{ ES8323_DAC_MUTE,     0x30 },
+	{ ES8323_DACCONTROL3,  0x30 },
 	{ ES8323_LDAC_VOL,     0xc0 },
 	{ ES8323_RDAC_VOL,     0xc0 },
 	{ ES8323_DACCONTROL6,  0x08 },
@@ -119,29 +119,43 @@ static const struct snd_kcontrol_new es8323_snd_controls[] = {
 	SOC_ENUM("ALC Capture NG Type", es8323_alc_ng_type_enum),
 	SOC_ENUM("Playback De-emphasis", es8323_playback_deemphasis_enum),
 	SOC_ENUM("Capture Polarity", es8323_capture_polarity_enum),
-	SOC_SINGLE("ALC Capture ZC Switch", ES8323_ADCCONTROL13, 6, 1, 0),
-	SOC_SINGLE("ALC Capture Decay Time", ES8323_ADCCONTROL12, 4, 15, 0),
-	SOC_SINGLE("ALC Capture Attack Time", ES8323_ADCCONTROL12, 0, 15, 0),
-	SOC_SINGLE("ALC Capture NG Threshold", ES8323_ADCCONTROL14, 3, 31, 0),
-	SOC_SINGLE("ALC Capture NG Switch", ES8323_ADCCONTROL14, 0, 1, 0),
-	SOC_SINGLE("ZC Timeout Switch", ES8323_ADCCONTROL13, 6, 1, 0),
-	SOC_SINGLE("Capture Mute Switch", ES8323_ADC_MUTE, 2, 1, 0),
-	SOC_SINGLE_TLV("Left Channel Capture Volume", ES8323_ADCCONTROL1, 4, 8,
-		       0, es8323_bypass_tlv),
-	SOC_SINGLE_TLV("Right Channel Capture Volume", ES8323_ADCCONTROL1, 0,
-		       8, 0, es8323_bypass_tlv),
-	SOC_SINGLE_TLV("Left Mixer Left Bypass Volume", ES8323_DACCONTROL17, 3,
-		       7, 1, es8323_bypass_tlv2),
+
+	SOC_SINGLE("ALC Capture ZC Switch", ES8323_ADCCONTROL13,
+		   ES8323_ADCCONTROL13_ALCZC_OFF, 1, 0),
+	SOC_SINGLE("ALC Capture Decay Time", ES8323_ADCCONTROL12,
+		   ES8323_ADCCONTROL12_ALCDCY_OFF, 15, 0),
+	SOC_SINGLE("ALC Capture Attack Time", ES8323_ADCCONTROL12,
+		   ES8323_ADCCONTROL12_ALCATK_OFF, 15, 0),
+	SOC_SINGLE("ALC Capture NG Threshold", ES8323_ADCCONTROL14,
+		   ES8323_ADCCONTROL14_NGTH_OFF, 31, 0),
+	SOC_SINGLE("ALC Capture NG Switch", ES8323_ADCCONTROL14,
+		   ES8323_ADCCONTROL14_NGAT_OFF, 1, 0),
+	SOC_SINGLE("ZC Timeout Switch", ES8323_ADCCONTROL13,
+		   ES8323_ADCCONTROL13_TIMEOUT_OFF, 1, 0),
+	SOC_SINGLE("Capture Mute Switch", ES8323_ADCCONTROL7,
+		   ES8323_ADCCONTROL7_ADCMUTE_OFF, 1, 0),
+
+	SOC_SINGLE_TLV("Left Channel Capture Volume", ES8323_ADCCONTROL1,
+		       ES8323_ADCCONTROL1_MICAMPL_OFF, 8, 0, es8323_bypass_tlv),
+	SOC_SINGLE_TLV("Right Channel Capture Volume", ES8323_ADCCONTROL1,
+		       ES8323_ADCCONTROL1_MICAMPR_OFF, 8, 0, es8323_bypass_tlv),
+	SOC_SINGLE_TLV("Left Mixer Left Bypass Volume", ES8323_DACCONTROL17,
+		       ES8323_DACCONTROL17_LI2LOVOL_OFF, 7, 1, es8323_bypass_tlv2),
 	SOC_SINGLE_TLV("Right Mixer Right Bypass Volume", ES8323_DACCONTROL20,
-		       3, 7, 1, es8323_bypass_tlv2),
-	SOC_DOUBLE_R_TLV("PCM Volume", ES8323_LDAC_VOL, ES8323_RDAC_VOL,
+		       ES8323_DACCONTROL20_RI2ROVOL_OFF, 7, 1, es8323_bypass_tlv2),
+
+	SOC_DOUBLE_R_TLV("PCM Volume",
+			 ES8323_LDAC_VOL, ES8323_RDAC_VOL,
 			 0, 192, 1, es8323_dac_tlv),
-	SOC_DOUBLE_R_TLV("Capture Digital Volume", ES8323_LADC_VOL,
-			 ES8323_RADC_VOL, 0, 192, 1, es8323_adc_tlv),
-	SOC_DOUBLE_R_TLV("Output 1 Playback Volume", ES8323_LOUT1_VOL,
-			 ES8323_ROUT1_VOL, 0, 33, 0, es8323_out_tlv),
-	SOC_DOUBLE_R_TLV("Output 2 Playback Volume", ES8323_LOUT2_VOL,
-			 ES8323_ROUT2_VOL, 0, 33, 0, es8323_out_tlv),
+	SOC_DOUBLE_R_TLV("Capture Digital Volume",
+			 ES8323_LADC_VOL, ES8323_RADC_VOL,
+			 0, 192, 1, es8323_adc_tlv),
+	SOC_DOUBLE_R_TLV("Output 1 Playback Volume",
+			 ES8323_LOUT1_VOL, ES8323_ROUT1_VOL,
+			 0, 33, 0, es8323_out_tlv),
+	SOC_DOUBLE_R_TLV("Output 2 Playback Volume",
+			 ES8323_LOUT2_VOL, ES8323_ROUT2_VOL,
+			 0, 33, 0, es8323_out_tlv),
 };
 
 /* Left DAC Route */
@@ -211,8 +225,10 @@ static const struct snd_soc_dapm_widget es8323_dapm_widgets[] = {
 
 	SND_SOC_DAPM_ADC("Right ADC", "Right Capture", SND_SOC_NOPM, 4, 1),
 	SND_SOC_DAPM_ADC("Left ADC", "Left Capture", SND_SOC_NOPM, 5, 1),
-	SND_SOC_DAPM_DAC("Right DAC", "Right Playback", ES8323_DACPOWER, 6, 1),
-	SND_SOC_DAPM_DAC("Left DAC", "Left Playback", ES8323_DACPOWER, 7, 1),
+	SND_SOC_DAPM_DAC("Right DAC", "Right Playback",
+			 ES8323_DACPOWER, ES8323_DACPOWER_PDNDACR_OFF, 1),
+	SND_SOC_DAPM_DAC("Left DAC", "Left Playback",
+			 ES8323_DACPOWER, ES8323_DACPOWER_PDNDACL_OFF, 1),
 
 	SND_SOC_DAPM_MIXER("Left Mixer", SND_SOC_NOPM, 0, 0,
 			   &es8323_left_mixer_controls[0],
@@ -223,12 +239,12 @@ static const struct snd_soc_dapm_widget es8323_dapm_widgets[] = {
 
 	SND_SOC_DAPM_PGA("Right ADC Power", SND_SOC_NOPM, 6, 1, NULL, 0),
 	SND_SOC_DAPM_PGA("Left ADC Power", SND_SOC_NOPM, 7, 1, NULL, 0),
-	SND_SOC_DAPM_PGA("Right Out 2", ES8323_DACPOWER, 2, 0, NULL, 0),
-	SND_SOC_DAPM_PGA("Left Out 2", ES8323_DACPOWER, 3, 0, NULL, 0),
-	SND_SOC_DAPM_PGA("Right Out 1", ES8323_DACPOWER, 4, 0, NULL, 0),
-	SND_SOC_DAPM_PGA("Left Out 1", ES8323_DACPOWER, 5, 0, NULL, 0),
-	SND_SOC_DAPM_PGA("LAMP", ES8323_ADCCONTROL1, 4, 0, NULL, 0),
-	SND_SOC_DAPM_PGA("RAMP", ES8323_ADCCONTROL1, 0, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("Right Out 2", ES8323_DACPOWER, ES8323_DACPOWER_ROUT2_OFF, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("Left Out 2", ES8323_DACPOWER, ES8323_DACPOWER_LOUT2_OFF, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("Right Out 1", ES8323_DACPOWER, ES8323_DACPOWER_ROUT1_OFF, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("Left Out 1", ES8323_DACPOWER, ES8323_DACPOWER_LOUT1_OFF, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("LAMP", ES8323_ADCCONTROL1, ES8323_ADCCONTROL1_MICAMPL_OFF, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("RAMP", ES8323_ADCCONTROL1, ES8323_ADCCONTROL1_MICAMPR_OFF, 0, NULL, 0),
 
 	SND_SOC_DAPM_OUTPUT("LOUT1"),
 	SND_SOC_DAPM_OUTPUT("ROUT1"),
@@ -423,16 +439,18 @@ static int es8323_set_dai_sysclk(struct snd_soc_dai *codec_dai,
 static int es8323_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 {
 	struct snd_soc_component *component = codec_dai->component;
-	u8 iface = snd_soc_component_read(component, ES8323_MASTERMODE);
-	u8 adciface = snd_soc_component_read(component, ES8323_ADC_IFACE);
-	u8 daciface = snd_soc_component_read(component, ES8323_DAC_IFACE);
+	u8 format_mode, inv_mode;
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
 	case SND_SOC_DAIFMT_BC_FP:
-		iface |= 0x80;
+		/* Master serial port mode */
+		snd_soc_component_update_bits(component, ES8323_MASTERMODE,
+					      ES8323_MASTERMODE_MSC, ES8323_MASTERMODE_MSC);
 		break;
 	case SND_SOC_DAIFMT_BC_FC:
-		iface &= 0x7f;
+		/* Slave serial port mode */
+		snd_soc_component_update_bits(component, ES8323_MASTERMODE,
+					      ES8323_MASTERMODE_MSC, 0);
 		break;
 	default:
 		return -EINVAL;
@@ -441,55 +459,47 @@ static int es8323_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 	/* interface format */
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_I2S:
-		adciface &= 0xfc;
-		daciface &= 0xf8;
+		format_mode = ES8323_FMT_I2S;
 		break;
 	case SND_SOC_DAIFMT_LEFT_J:
-		adciface &= 0xfd;
-		daciface &= 0xf9;
+		format_mode = ES8323_FMT_LEFT_J;
 		break;
 	case SND_SOC_DAIFMT_RIGHT_J:
-		adciface &= 0xfe;
-		daciface &= 0xfa;
+		format_mode = ES8323_FMT_RIGHT_J;
 		break;
 	case SND_SOC_DAIFMT_DSP_A:
 	case SND_SOC_DAIFMT_DSP_B:
-		adciface &= 0xff;
-		daciface &= 0xfb;
+		format_mode = ES8323_FMT_DSP;
 		break;
 	default:
 		return -EINVAL;
 	}
 
+	snd_soc_component_write_field(component, ES8323_ADCCONTROL4,
+				      ES8323_ADCCONTROL4_ADCFORMAT, format_mode);
+	snd_soc_component_write_field(component, ES8323_DACCONTROL1,
+				      ES8323_DACCONTROL1_DACFORMAT, format_mode);
+
 	/* clock inversion */
 	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
 	case SND_SOC_DAIFMT_NB_NF:
-		iface &= 0xdf;
-		adciface &= 0xdf;
-		daciface &= 0xbf;
-		break;
-	case SND_SOC_DAIFMT_IB_IF:
-		iface |= 0x20;
-		adciface |= 0x20;
-		daciface |= 0x40;
-		break;
 	case SND_SOC_DAIFMT_IB_NF:
-		iface |= 0x20;
-		adciface &= 0xdf;
-		daciface &= 0xbf;
+		inv_mode = 0;
 		break;
+	case SND_SOC_DAIFMT_IB_IF:
 	case SND_SOC_DAIFMT_NB_IF:
-		iface &= 0xdf;
-		adciface |= 0x20;
-		daciface |= 0x40;
+		inv_mode = 1;
 		break;
 	default:
 		return -EINVAL;
 	}
 
-	snd_soc_component_write(component, ES8323_MASTERMODE, iface);
-	snd_soc_component_write(component, ES8323_ADC_IFACE, adciface);
-	snd_soc_component_write(component, ES8323_DAC_IFACE, daciface);
+	snd_soc_component_update_bits(component, ES8323_MASTERMODE,
+				      ES8323_MASTERMODE_BCLKINV, inv_mode);
+	snd_soc_component_update_bits(component, ES8323_ADCCONTROL4,
+				      ES8323_ADCCONTROL4_ADCLRP, inv_mode);
+	snd_soc_component_update_bits(component, ES8323_DACCONTROL1,
+				      ES8323_DACCONTROL1_DACLRP, inv_mode);
 
 	return 0;
 }
@@ -515,52 +525,56 @@ static int es8323_pcm_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_component *component = dai->component;
 	struct es8323_priv *es8323 = snd_soc_component_get_drvdata(component);
-	u16 srate = snd_soc_component_read(component, ES8323_MASTERMODE) & 0x80;
-	u16 adciface = snd_soc_component_read(component, ES8323_ADC_IFACE) & 0xe3;
-	u16 daciface = snd_soc_component_read(component, ES8323_DAC_IFACE) & 0xc7;
+	u8 wl_mode, fs;
 	int coeff;
 
 	coeff = get_coeff(es8323->sysclk, params_rate(params));
 	if (coeff < 0) {
 		coeff = get_coeff(es8323->sysclk / 2, params_rate(params));
-		srate |= 0x40;
+		if (coeff < 0) {
+			dev_err(component->dev,
+				"Unable to configure sample rate %dHz with %dHz MCLK\n",
+				params_rate(params), es8323->sysclk);
+			return coeff;
+		}
+
+		snd_soc_component_update_bits(component, ES8323_MASTERMODE,
+					      ES8323_MASTERMODE_MCLKDIV2,
+					      ES8323_MASTERMODE_MCLKDIV2);
 	}
 
-	if (coeff < 0) {
-		dev_err(component->dev,
-			"Unable to configure sample rate %dHz with %dHz MCLK\n",
-			params_rate(params), es8323->sysclk);
-		return coeff;
-	}
+	fs = FIELD_PREP(ES8323_DACCONTROL2_DACFSMODE, es8323_coeff_div[coeff].usb)
+	   | FIELD_PREP(ES8323_DACCONTROL2_DACFSRATIO, es8323_coeff_div[coeff].sr);
 
-	/* bit size */
+	snd_soc_component_write_field(component, ES8323_ADCCONTROL5,
+				      ES8323_ADCCONTROL5_ADCFS_MASK, fs);
+
+	snd_soc_component_write_field(component, ES8323_DACCONTROL2,
+				      ES8323_DACCONTROL2_DACFS_MASK, fs);
+
+	/* serial audio data word length */
 	switch (params_format(params)) {
 	case SNDRV_PCM_FORMAT_S16_LE:
-		adciface |= 0xc;
-		daciface |= 0x18;
+		wl_mode = ES8323_S16_LE;
 		break;
 	case SNDRV_PCM_FORMAT_S20_3LE:
-		adciface |= 0x4;
-		daciface |= 0x8;
+		wl_mode = ES8323_S20_LE;
 		break;
 	case SNDRV_PCM_FORMAT_S24_LE:
+		wl_mode = ES8323_S24_LE;
 		break;
 	case SNDRV_PCM_FORMAT_S32_LE:
-		adciface |= 0x10;
-		daciface |= 0x20;
+		wl_mode = ES8323_S32_LE;
 		break;
+	default:
+		return -EINVAL;
 	}
 
-	snd_soc_component_write(component, ES8323_DAC_IFACE, daciface);
-	snd_soc_component_write(component, ES8323_ADC_IFACE, adciface);
+	snd_soc_component_write_field(component, ES8323_ADCCONTROL4,
+				      ES8323_ADCCONTROL4_ADCWL, wl_mode);
 
-	snd_soc_component_write(component, ES8323_MASTERMODE, srate);
-	snd_soc_component_write(component, ES8323_ADCCONTROL5,
-				es8323_coeff_div[coeff].sr |
-				(es8323_coeff_div[coeff].usb) << 4);
-	snd_soc_component_write(component, ES8323_DACCONTROL2,
-				es8323_coeff_div[coeff].sr |
-				(es8323_coeff_div[coeff].usb) << 4);
+	snd_soc_component_write_field(component, ES8323_DACCONTROL1,
+				      ES8323_DACCONTROL1_DACWL, wl_mode);
 
 	snd_soc_component_write(component, ES8323_DACPOWER, 0x3c);
 
@@ -569,12 +583,9 @@ static int es8323_pcm_hw_params(struct snd_pcm_substream *substream,
 
 static int es8323_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 {
-	struct snd_soc_component *component = dai->component;
-	u32 val = mute ? 0x6 : 0x2;
-
-	snd_soc_component_write(component, ES8323_DAC_MUTE, val);
-
-	return 0;
+	return snd_soc_component_update_bits(dai->component, ES8323_DACCONTROL3,
+					     ES8323_DACCONTROL3_DACMUTE,
+					     mute ? ES8323_DACCONTROL3_DACMUTE : 0);
 }
 
 static const struct snd_soc_dai_ops es8323_ops = {
@@ -613,8 +624,6 @@ static int es8323_probe(struct snd_soc_component *component)
 	struct es8323_priv *es8323 = snd_soc_component_get_drvdata(component);
 	int ret;
 
-	es8323->component = component;
-
 	es8323->mclk = devm_clk_get_optional(component->dev, "mclk");
 	if (IS_ERR(es8323->mclk)) {
 		dev_err(component->dev, "unable to get mclk\n");
diff --git a/sound/soc/codecs/es8323.h b/sound/soc/codecs/es8323.h
index f986c9301dc6..d79955f871c9 100644
--- a/sound/soc/codecs/es8323.h
+++ b/sound/soc/codecs/es8323.h
@@ -18,31 +18,99 @@
 #define ES8323_CHIPPOWER	0x02
 #define ES8323_ADCPOWER		0x03
 #define ES8323_DACPOWER		0x04
+
+#define ES8323_DACPOWER_ROUT2_OFF	2
+#define ES8323_DACPOWER_LOUT2_OFF	3
+#define ES8323_DACPOWER_ROUT1_OFF	4
+#define ES8323_DACPOWER_LOUT1_OFF	5
+#define ES8323_DACPOWER_PDNDACR_OFF	6
+#define ES8323_DACPOWER_PDNDACL_OFF	7
+
 #define ES8323_CHIPLOPOW1	0x05
 #define ES8323_CHIPLOPOW2	0x06
 #define ES8323_ANAVOLMANAG	0x07
 #define ES8323_MASTERMODE	0x08
 
+#define ES8323_MASTERMODE_BCLKDIV	GENMASK(4, 0)
+#define ES8323_MASTERMODE_BCLKINV	BIT(5)
+#define ES8323_MASTERMODE_MCLKDIV2	BIT(6)
+#define ES8323_MASTERMODE_MSC		BIT(7)
+
 /* ADC Control */
 #define ES8323_ADCCONTROL1	0x09
+
+#define ES8323_ADCCONTROL1_MICAMPR_OFF	0
+#define ES8323_ADCCONTROL1_MICAMPL_OFF	4
+
 #define ES8323_ADCCONTROL2	0x0a
 #define ES8323_ADCCONTROL3	0x0b
 #define ES8323_ADCCONTROL4	0x0c
+
+#define ES8323_ADCCONTROL4_ADCFORMAT	GENMASK(1, 0)
+#define ES8323_FMT_I2S			0x0
+#define ES8323_FMT_LEFT_J		0x1
+#define ES8323_FMT_RIGHT_J		0x2
+#define ES8323_FMT_DSP			0x3
+#define ES8323_ADCCONTROL4_ADCWL	GENMASK(4, 2)
+#define ES8323_S24_LE			0x0
+#define ES8323_S20_LE			0x1
+#define ES8323_S18_LE			0x2
+#define ES8323_S16_LE			0x3
+#define ES8323_S32_LE			0x4
+#define ES8323_ADCCONTROL4_ADCLRP	BIT(5)
+#define ES8323_ADCCONTROL4_DATSEL	GENMASK(7, 6)
+
 #define ES8323_ADCCONTROL5	0x0d
+
+#define ES8323_ADCCONTROL5_ADCFSRATIO	GENMASK(4, 0)
+#define ES8323_ADCCONTROL5_ADCFSMODE	BIT(5)
+#define ES8323_ADCCONTROL5_ADCFS_MASK	(ES8323_ADCCONTROL5_ADCFSRATIO |\
+					 ES8323_ADCCONTROL5_ADCFSMODE)
+
 #define ES8323_ADCCONTROL6	0x0e
-#define ES8323_ADC_MUTE		0x0f
+#define ES8323_ADCCONTROL7	0x0f
+
+#define ES8323_ADCCONTROL7_ADCMUTE_OFF	2
+
 #define ES8323_LADC_VOL		0x10
 #define ES8323_RADC_VOL		0x11
 #define ES8323_ADCCONTROL10	0x12
 #define ES8323_ADCCONTROL11	0x13
 #define ES8323_ADCCONTROL12	0x14
+
+#define ES8323_ADCCONTROL12_ALCATK_OFF	0
+#define ES8323_ADCCONTROL12_ALCDCY_OFF	4
+
 #define ES8323_ADCCONTROL13	0x15
+
+#define ES8323_ADCCONTROL13_TIMEOUT_OFF	5
+#define ES8323_ADCCONTROL13_ALCZC_OFF	6
+
 #define ES8323_ADCCONTROL14	0x16
 
+#define ES8323_ADCCONTROL14_NGAT_OFF	0
+#define ES8323_ADCCONTROL14_NGG_OFF	1
+#define ES8323_ADCCONTROL14_NGTH_OFF	3
+
 /* DAC Control */
 #define ES8323_DACCONTROL1	0x17
+
+#define ES8323_DACCONTROL1_DACFORMAT	GENMASK(1, 0)
+#define ES8323_DACCONTROL1_DACWL	GENMASK(5, 3)
+#define ES8323_DACCONTROL1_DACLRP	BIT(6)
+#define ES8323_DACCONTROL1_DACLRSWAP	BIT(7)
+
 #define ES8323_DACCONTROL2	0x18
-#define ES8323_DAC_MUTE		0x19
+
+#define ES8323_DACCONTROL2_DACFSRATIO	GENMASK(4, 0)
+#define ES8323_DACCONTROL2_DACFSMODE	BIT(5)
+#define ES8323_DACCONTROL2_DACFS_MASK	(ES8323_DACCONTROL2_DACFSRATIO |\
+					 ES8323_DACCONTROL2_DACFSMODE)
+
+#define ES8323_DACCONTROL3	0x19
+
+#define ES8323_DACCONTROL3_DACMUTE	BIT(2)
+
 #define ES8323_LDAC_VOL		0x1a
 #define ES8323_RDAC_VOL		0x1b
 #define ES8323_DACCONTROL6	0x1c
@@ -57,9 +125,15 @@
 #define ES8323_DACCONTROL15	0x25
 #define ES8323_DACCONTROL16	0x26
 #define ES8323_DACCONTROL17	0x27
+
+#define ES8323_DACCONTROL17_LI2LOVOL_OFF	3
+
 #define ES8323_DACCONTROL18	0x28
 #define ES8323_DACCONTROL19	0x29
 #define ES8323_DACCONTROL20	0x2a
+
+#define ES8323_DACCONTROL20_RI2ROVOL_OFF	3
+
 #define ES8323_DACCONTROL21	0x2b
 #define ES8323_DACCONTROL22	0x2c
 #define ES8323_DACCONTROL23	0x2d
@@ -71,8 +145,4 @@
 #define ES8323_DACCONTROL29	0x33
 #define ES8323_DACCONTROL30	0x34
 
-#define ES8323_ADC_IFACE	ES8323_ADCCONTROL4
-#define ES8323_ADC_SRATE	ES8323_ADCCONTROL5
-#define ES8323_DAC_IFACE	ES8323_DACCONTROL1
-#define ES8323_DAC_SRATE	ES8323_DACCONTROL2
 #endif
-- 
2.47.3

