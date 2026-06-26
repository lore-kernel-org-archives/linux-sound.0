Received: from r3-74.sinamail.sina.com.cn (r3-74.sinamail.sina.com.cn [202.108.3.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B0E3E9281
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 11:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782473826; cv=none; b=gp/OVR2n5S6eKJfVw+gsr4lWChfgjBidqXjiFz9vHG9bGGVCzJjBKApF6cv2XM7HieX95p40zmFk9YGi+uAntDZkWpocTJ24FCAdCkOkeVlbLIRg7F2XMyQgsq3FRCy/o0k7uXnEQUjOV1ueiIAdme0ufXOU4RjWFhnyteL8xTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782473826; c=relaxed/simple;
	bh=3uyN0RWyUbvago34OncqEr20LLQ+/mSrhBLEoI1H7yA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=Di7Yc49xspP575pw4UvZhCRnwb8Oj2kFma/DXD+9FZo8hwzQgpy9ljhDd+/FF5Q9Cslns+1uOjIpz8XT8dTTrRhfTXE+BzQIJRtyR6sXUAq5xv6yvlnqgYoLM594wmKjAHpVHHaQJWKT6DeM4UuDYdLpFemRUAgTELNauIN8STw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.37) with ESMTP
	id 6A3E6431000068D5; Fri, 26 Jun 2026 19:36:25 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: CA56C95D080E40A3B25A2220E8428DD2
X-SMAIL-UIID: CA56C95D080E40A3B25A2220E8428DD2-20260626-193625
From: Zhang Yi <zhangyi@everest-semi.com>
To: linux-sound@vger.kernel.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v3 6/6] ASoC: codecs: ES8389: Add INPUTL MUX and INPUTR MUX
Date: Fri, 26 Jun 2026 19:36:14 +0800
Message-Id: <20260626113614.27893-7-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260626113614.27893-1-zhangyi@everest-semi.com>
References: <20260626113614.27893-1-zhangyi@everest-semi.com>
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
index 742c7f78b..8c4a90586 100644
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

