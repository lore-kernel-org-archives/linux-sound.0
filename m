Received: from r3-90.sinamail.sina.com.cn (r3-90.sinamail.sina.com.cn [202.108.3.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F8A37DEA2
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 07:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782804351; cv=none; b=erduOr1tOXtt+OR1+NbQvWVZG7OUps053wgSf9bvYvSeM09P37982dejfpoXR1SNAEF0ESnBuhemWPFxo6WiZf2q5tcXwNOWQbGm7dOdqwEn1mOSqBNx8D2HCe4GlmuSBN/xUbzEogGwUdiixIOYSvpSxrFKCyVDy5/mcXAYAzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782804351; c=relaxed/simple;
	bh=GxtelNrWoWgfAoWid0wj50WkofDUtQCYfQrkwKutIS4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=oQ6KSUdFwdVGU1FNE4U0SjVZOrN9Z3wTwDZ+gtIxLGLmDqJEDLd4x88jfC9+yKIgrdtfe5Acf4Fq/2DyIKjuh3Sbyw5WnXCycJcvVHeCqQnqlX73/MXf8BsP4zLCdZpD15PyT5vgqJrqPUR+G2yyNX34pWYPsNy5V4Gwkvt1QUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.36) with ESMTP
	id 6A436EE200001A79; Tue, 30 Jun 2026 15:23:22 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: AE956BF7E88A44D1AA5999AF0513D9E4
X-SMAIL-UIID: AE956BF7E88A44D1AA5999AF0513D9E4-20260630-152322
From: Zhang Yi <zhangyi@everest-semi.com>
To: linux-sound@vger.kernel.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v4 6/6] ASoC: codecs: ES8389: Add INPUTL MUX and INPUTR MUX
Date: Tue, 30 Jun 2026 15:23:11 +0800
Message-Id: <20260630072311.8427-7-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260630072311.8427-1-zhangyi@everest-semi.com>
References: <20260630072311.8427-1-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

Add INPUTL MUX and INPUTR MUX in route

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/codecs/es8389.c | 35 +++++++++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/es8389.c b/sound/soc/codecs/es8389.c
index ce8258567..875c4a2be 100644
--- a/sound/soc/codecs/es8389.c
+++ b/sound/soc/codecs/es8389.c
@@ -252,6 +252,16 @@ static const struct soc_enum alc_ramprate =
 static const struct soc_enum alc_winsize =
 	SOC_ENUM_SINGLE(ES8389_ALC_CTL, 0, 16, winsize);
 
+static const char *const es8389_adcl_mux_txt[] = {
+	"Normal",
+	"ADC2 channel to ADC1 channel",
+};
+
+static const char *const es8389_adcr_mux_txt[] = {
+	"Normal",
+	"ADC1 channel to ADC2 channel",
+};
+
 static const char *const es8389_outl_mux_txt[] = {
 	"Normal",
 	"DAC2 channel to DAC1 channel",
@@ -279,6 +289,20 @@ static const unsigned int es8389_pga_values[] = {
 	1, 5, 6
 };
 
+static const struct soc_enum es8389_adcl_mux_enum =
+	SOC_ENUM_SINGLE(ES8389_ADC_MODE, 5,
+			ARRAY_SIZE(es8389_adcl_mux_txt), es8389_adcl_mux_txt);
+
+static const struct snd_kcontrol_new es8389_adcl_mux_controls =
+	SOC_DAPM_ENUM("INPUTL MUX", es8389_adcl_mux_enum);
+
+static const struct soc_enum es8389_adcr_mux_enum =
+	SOC_ENUM_SINGLE(ES8389_ADC_MODE, 4,
+			ARRAY_SIZE(es8389_adcr_mux_txt), es8389_adcr_mux_txt);
+
+static const struct snd_kcontrol_new es8389_adcr_mux_controls =
+	SOC_DAPM_ENUM("INPUTR MUX", es8389_adcr_mux_enum);
+
 static const struct soc_enum es8389_outl_mux_enum =
 	SOC_ENUM_SINGLE(ES8389_DAC_MIX, 5,
 			ARRAY_SIZE(es8389_outl_mux_txt), es8389_outl_mux_txt);
@@ -409,6 +433,8 @@ static const struct snd_soc_dapm_widget es8389_dapm_widgets[] = {
 			   &es8389_adc_mixer_controls[0],
 			   ARRAY_SIZE(es8389_adc_mixer_controls)),
 	SND_SOC_DAPM_MUX("ADC MUX", SND_SOC_NOPM, 0, 0, &es8389_dmic_mux_controls),
+	SND_SOC_DAPM_MUX("INPUTL MUX", SND_SOC_NOPM, 0, 0, &es8389_adcl_mux_controls),
+	SND_SOC_DAPM_MUX("INPUTR MUX", SND_SOC_NOPM, 0, 0, &es8389_adcr_mux_controls),
 
 	SND_SOC_DAPM_MUX("OUTL MUX", SND_SOC_NOPM, 0, 0, &es8389_outl_mux_controls),
 	SND_SOC_DAPM_MUX("OUTR MUX", SND_SOC_NOPM, 0, 0, &es8389_outr_mux_controls),
@@ -422,10 +448,15 @@ static const struct snd_soc_dapm_route es8389_dapm_routes[] = {
 	{"ADCL", NULL, "PGAL"},
 	{"ADCR", NULL, "PGAR"},
 
+	{"INPUTL MUX", "Normal", "ADCL"},
+	{"INPUTL MUX", "ADC2 channel to ADC1 channel", "ADCR"},
+	{"INPUTR MUX", "Normal", "ADCR"},
+	{"INPUTR MUX", "ADC1 channel to ADC2 channel", "ADCL"},
+
 	{"ADC Mixer", "DACL ADCL Mixer", "DACL"},
 	{"ADC Mixer", "DACR ADCR Mixer", "DACR"},
-	{"ADC Mixer", NULL, "ADCL"},
-	{"ADC Mixer", NULL, "ADCR"},
+	{"ADC Mixer", NULL, "INPUTL MUX"},
+	{"ADC Mixer", NULL, "INPUTR MUX"},
 
 	{"ADC MUX", "AMIC", "ADC Mixer"},
 	{"ADC MUX", "DMIC", "DMIC"},
-- 
2.17.1

