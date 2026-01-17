Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC74E271457
	for <linux-sound@vger.kernel.org>; Sat, 17 Jan 2026 09:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768641631; cv=none; b=DdugcsPmp7OH5OiV2atr4gxv+vLoCkvkaeV+vUBpV47dYdt3jt7uWEvrAjMTiZJ/GLAVlQjcnhvJ/bupv6uAp9y6l5UKwx5PiOpyiEnhqt4OJOXIxzJlU3Sw0z8tNQqfQDvFFkIEka+SSe2QYIWhbcQa5HrWwpfltFyxXWewTDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768641631; c=relaxed/simple;
	bh=K2WYudSFdlsiKrR3KyxH7KXl6TBu2YwImnWccBErvxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XgHkSPLbnVIBjP6P+N+xNgtqn6vRtl5iv52QNUa8gUY9imtHu0zks2g39itzBd1U2cdFvk/8xppP5qy1n8t6m9QuMx9kl0+et1lNdPqlVypiI4D8NSUbLyCmL/3QZZbpd8zxOMeuaJ02U4CgEz/nu9uyGmuqa0TH6vpzjhTC6Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.1])
	by gateway (Coremail) with SMTP id _____8CxVvBbVGtpZdQJAA--.32900S3;
	Sat, 17 Jan 2026 17:20:27 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.1])
	by front1 (Coremail) with SMTP id qMiowJDxysFYVGtpVR8hAA--.175S2;
	Sat, 17 Jan 2026 17:20:26 +0800 (CST)
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
Subject: [PATCH 4/4] ASoC: codecs: es8323: Enable proper DAPM widgets for chip power
Date: Sat, 17 Jan 2026 17:20:15 +0800
Message-ID: <db47e56e7c72bb900a84a33ee07d4ffcf0a908a3.1768641428.git.zhoubinbin@loongson.cn>
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
X-CM-TRANSID:qMiowJDxysFYVGtpVR8hAA--.175S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgEKCGlrJJwB3AAAsm
X-Coremail-Antispam: 1Uk129KBj93XoWxuw48uw1rCF18trW8XryfKrX_yoW7GFWDpr
	Z09FZ0q3W0vF4fWr98AFWfXr1xJrWrAFW7W347K398JF1xZr92g3WYqF1jvFyrZa98trZx
	u3yj93yUCa4fG3XCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Yb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q
	6rW5McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
	vIr41l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_
	JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1V
	AY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Xr0_Ar1lIxAI
	cVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42
	IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIev
	Ja73UjIFyTuYvjxU4AhLUUUUU

Remove initialization of the chip power register from the
es8323_set_bias_level routine, and add proper DAPM power supply widgets
to DAPM, which really should be handled by the DAPM subsystem.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 sound/soc/codecs/es8323.c | 50 +++++++++++++++++++++++++++------------
 sound/soc/codecs/es8323.h | 10 ++++++++
 2 files changed, 45 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/es8323.c b/sound/soc/codecs/es8323.c
index 001e63b4e345..605375b154c8 100644
--- a/sound/soc/codecs/es8323.c
+++ b/sound/soc/codecs/es8323.c
@@ -217,6 +217,23 @@ static const struct snd_soc_dapm_widget es8323_dapm_widgets[] = {
 	SND_SOC_DAPM_SUPPLY("Mic Bias Gen", ES8323_ADCPOWER,
 			    ES8323_ADCPOWER_PDNADCBIS_OFF, 1, NULL, 0),
 
+	SND_SOC_DAPM_SUPPLY("DAC STM", ES8323_CHIPPOWER,
+			    ES8323_CHIPPOWER_DACSTM_RESET, 1, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("ADC STM", ES8323_CHIPPOWER,
+			    ES8323_CHIPPOWER_ADCSTM_RESET, 1, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("DAC DIG", ES8323_CHIPPOWER,
+			    ES8323_CHIPPOWER_DACDIG_OFF, 1, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("ADC DIG", ES8323_CHIPPOWER,
+			    ES8323_CHIPPOWER_ADCDIG_OFF, 1, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("DAC DLL", ES8323_CHIPPOWER,
+			    ES8323_CHIPPOWER_DACDLL_OFF, 1, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("ADC DLL", ES8323_CHIPPOWER,
+			    ES8323_CHIPPOWER_ADCDLL_OFF, 1, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("ADC Vref", ES8323_CHIPPOWER,
+			    ES8323_CHIPPOWER_ADCVREF_OFF, 1, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("DAC Vref", ES8323_CHIPPOWER,
+			    ES8323_CHIPPOWER_DACVREF_OFF, 1, NULL, 0),
+
 	/* Muxes */
 	SND_SOC_DAPM_MUX("Left PGA Mux", ES8323_ADCPOWER,
 			 ES8323_ADCPOWER_PDNAINL_OFF, 1, &es8323_left_dac_mux_controls),
@@ -287,6 +304,20 @@ static const struct snd_soc_dapm_route es8323_dapm_routes[] = {
 
 	{ "Mic Bias", NULL, "Mic Bias Gen" },
 
+	{ "ADC DIG", NULL, "ADC STM" },
+	{ "ADC DIG", NULL, "ADC Vref" },
+	{ "ADC DIG", NULL, "ADC DLL" },
+
+	{ "Left ADC", NULL, "ADC DIG" },
+	{ "Right ADC", NULL, "ADC DIG" },
+
+	{ "DAC DIG", NULL, "DAC STM" },
+	{ "DAC DIG", NULL, "DAC Vref" },
+	{ "DAC DIG", NULL, "DAC DLL" },
+
+	{ "Left DAC", NULL, "DAC DIG" },
+	{ "Right DAC", NULL, "DAC DIG" },
+
 	{"Left Line Mux", "Line 1L", "LINPUT1"},
 	{"Left Line Mux", "Line 2L", "LINPUT2"},
 	{"Left Line Mux", "MicL", "Left PGA Mux"},
@@ -644,7 +675,7 @@ static int es8323_probe(struct snd_soc_component *component)
 	}
 
 	snd_soc_component_write(component, ES8323_CONTROL2, 0x60);
-	snd_soc_component_write(component, ES8323_CHIPPOWER, 0x00);
+	snd_soc_component_write(component, ES8323_DACCONTROL21, 0x80);
 
 	return 0;
 }
@@ -657,34 +688,23 @@ static int es8323_set_bias_level(struct snd_soc_component *component,
 
 	switch (level) {
 	case SND_SOC_BIAS_ON:
+		break;
+	case SND_SOC_BIAS_PREPARE:
 		ret = clk_prepare_enable(es8323->mclk);
 		if (ret)
 			return ret;
 
-		snd_soc_component_write(component, ES8323_CHIPPOWER, 0xf0);
-		usleep_range(18000, 20000);
-		snd_soc_component_write(component, ES8323_ANAVOLMANAG, 0x7c);
 		snd_soc_component_write(component, ES8323_CHIPLOPOW1, 0x00);
 		snd_soc_component_write(component, ES8323_CHIPLOPOW2, 0x00);
-		snd_soc_component_write(component, ES8323_CHIPPOWER, 0x00);
-		snd_soc_component_write(component, ES8323_ADCCONTROL14, 0x00);
 		snd_soc_component_update_bits(component, ES8323_ADCPOWER,
 					      ES8323_ADCPOWER_PDNADCBIS, 0);
 		break;
-	case SND_SOC_BIAS_PREPARE:
-		break;
 	case SND_SOC_BIAS_STANDBY:
-		snd_soc_component_write(component, ES8323_ANAVOLMANAG, 0x7c);
-		snd_soc_component_write(component, ES8323_CHIPLOPOW1, 0x00);
-		snd_soc_component_write(component, ES8323_CHIPLOPOW2, 0x00);
-		snd_soc_component_write(component, ES8323_CHIPPOWER, 0x00);
 		break;
 	case SND_SOC_BIAS_OFF:
-		clk_disable_unprepare(es8323->mclk);
 		snd_soc_component_write(component, ES8323_CHIPLOPOW1, 0xff);
 		snd_soc_component_write(component, ES8323_CHIPLOPOW2, 0xff);
-		snd_soc_component_write(component, ES8323_CHIPPOWER, 0xff);
-		snd_soc_component_write(component, ES8323_ANAVOLMANAG, 0x7b);
+		clk_disable_unprepare(es8323->mclk);
 		break;
 	}
 
diff --git a/sound/soc/codecs/es8323.h b/sound/soc/codecs/es8323.h
index 4d4ac4f2e4ae..6e37e0480f04 100644
--- a/sound/soc/codecs/es8323.h
+++ b/sound/soc/codecs/es8323.h
@@ -16,6 +16,16 @@
 #define ES8323_CONTROL1		0x00
 #define ES8323_CONTROL2		0x01
 #define ES8323_CHIPPOWER	0x02
+
+#define ES8323_CHIPPOWER_DACVREF_OFF	0
+#define ES8323_CHIPPOWER_ADCVREF_OFF	1
+#define ES8323_CHIPPOWER_DACDLL_OFF	2
+#define ES8323_CHIPPOWER_ADCDLL_OFF	3
+#define ES8323_CHIPPOWER_DACSTM_RESET	4
+#define ES8323_CHIPPOWER_ADCSTM_RESET	5
+#define ES8323_CHIPPOWER_DACDIG_OFF	6
+#define ES8323_CHIPPOWER_ADCDIG_OFF	7
+
 #define ES8323_ADCPOWER		0x03
 
 #define ES8323_ADCPOWER_INT1LP		BIT(0)
-- 
2.47.3

