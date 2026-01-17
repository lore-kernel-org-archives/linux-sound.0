Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AC4DB640
	for <linux-sound@vger.kernel.org>; Sat, 17 Jan 2026 09:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768641537; cv=none; b=qQLN8BP+2YTMJKwdTdYfO8v+5nTE91pRSddO9nhZ7Q0mCuMtSp0FvbOzAE3qyGsTE6LbgAHHVaf0IpEgk9JaBc3jhZcltrlpCZ7NWU7JKRE3+NqI22EKGncmof6x5dzK+Z+VpzMBpAhUAvRZdjPZGo2fvwhLWzMxnMY0dZfEMOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768641537; c=relaxed/simple;
	bh=rjF8zMYuEW/E78aErNNqVRp1B6tdAotEUKkK6AK3S0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VdI59C+EEqVvfadcSdb7gNz3V+QzImK/pGMe7LTCuOESP62fw909U6VGSo6R7FcLlC0YEcV5awjO6X1RSXxY7n0ZTi1VIZbA6tXPX8nWHiiJL0fORTdX7NUytmqo2oGcTXwswi5DOVdlm1rml9Ou1U3rNfXVJl9SI0/3xzLLIF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.1])
	by gateway (Coremail) with SMTP id _____8Dx98H9U2tpWdQJAA--.19716S3;
	Sat, 17 Jan 2026 17:18:53 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.1])
	by front1 (Coremail) with SMTP id qMiowJAx28HzU2tpHh8hAA--.130S5;
	Sat, 17 Jan 2026 17:18:52 +0800 (CST)
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
Subject: [PATCH 3/4] ASoC: codecs: es8323: Enable proper DAPM widgets for capture ADC
Date: Sat, 17 Jan 2026 17:18:36 +0800
Message-ID: <9d93040f4cea77054e669c50325e080dffa7a7f1.1768641428.git.zhoubinbin@loongson.cn>
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
X-CM-TRANSID:qMiowJAx28HzU2tpHh8hAA--.130S5
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEKCGlrJLcBxQAAsX
X-Coremail-Antispam: 1Uk129KBj93XoWxtF1fWFyrWrWkXF1xtFW8GrX_yoWxJrWUpF
	Z0qrZ8tw10qrs3XryYyFW8Xrs7XrWxGa1fuw17K39IvF1xZrnaqw1YyF18XFy0vrsYqr4D
	Gw1kW3yUGa4Ig3XCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU90b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4j6r4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
	Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_
	WrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
	xGrwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWU
	XVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
	kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY
	6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
	vEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVj
	vjDU0xZFpf9x07jwBMNUUUUU=

Add proper DAPM capture ADC widgets to DAPM, which really should be
handled by the DAPM subsystem.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 sound/soc/codecs/es8323.c | 37 +++++++++++++++++++++----------------
 sound/soc/codecs/es8323.h | 13 +++++++++++++
 2 files changed, 34 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/es8323.c b/sound/soc/codecs/es8323.c
index 4a589949cc7e..001e63b4e345 100644
--- a/sound/soc/codecs/es8323.c
+++ b/sound/soc/codecs/es8323.c
@@ -212,19 +212,29 @@ static const struct snd_soc_dapm_widget es8323_dapm_widgets[] = {
 	SND_SOC_DAPM_INPUT("RINPUT1"),
 	SND_SOC_DAPM_INPUT("RINPUT2"),
 
-	SND_SOC_DAPM_MICBIAS("Mic Bias", SND_SOC_NOPM, 3, 1),
+	SND_SOC_DAPM_SUPPLY("Mic Bias", ES8323_ADCPOWER,
+			    ES8323_ADCPOWER_PDNMICB_OFF, 1, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("Mic Bias Gen", ES8323_ADCPOWER,
+			    ES8323_ADCPOWER_PDNADCBIS_OFF, 1, NULL, 0),
 
 	/* Muxes */
-	SND_SOC_DAPM_MUX("Left PGA Mux", SND_SOC_NOPM, 0, 0, &es8323_left_dac_mux_controls),
-	SND_SOC_DAPM_MUX("Right PGA Mux", SND_SOC_NOPM, 0, 0, &es8323_right_dac_mux_controls),
+	SND_SOC_DAPM_MUX("Left PGA Mux", ES8323_ADCPOWER,
+			 ES8323_ADCPOWER_PDNAINL_OFF, 1, &es8323_left_dac_mux_controls),
+	SND_SOC_DAPM_MUX("Right PGA Mux", ES8323_ADCPOWER,
+			 ES8323_ADCPOWER_PDNAINR_OFF, 1, &es8323_right_dac_mux_controls),
+
 	SND_SOC_DAPM_MUX("Differential Mux", SND_SOC_NOPM, 0, 0, &es8323_diffmux_controls),
+
 	SND_SOC_DAPM_MUX("Left ADC Mux", SND_SOC_NOPM, 0, 0, &es8323_mono_adc_mux_controls),
 	SND_SOC_DAPM_MUX("Right ADC Mux", SND_SOC_NOPM, 0, 0, &es8323_mono_adc_mux_controls),
+
 	SND_SOC_DAPM_MUX("Left Line Mux", SND_SOC_NOPM, 0, 0, &es8323_left_line_controls),
 	SND_SOC_DAPM_MUX("Right Line Mux", SND_SOC_NOPM, 0, 0, &es8323_right_line_controls),
 
-	SND_SOC_DAPM_ADC("Right ADC", "Right Capture", SND_SOC_NOPM, 4, 1),
-	SND_SOC_DAPM_ADC("Left ADC", "Left Capture", SND_SOC_NOPM, 5, 1),
+	SND_SOC_DAPM_ADC("Right ADC", "Right Capture",
+			 ES8323_ADCPOWER, ES8323_ADCPOWER_PDNADCR_OFF, 1),
+	SND_SOC_DAPM_ADC("Left ADC", "Left Capture",
+			 ES8323_ADCPOWER, ES8323_ADCPOWER_PDNADCL_OFF, 1),
 	SND_SOC_DAPM_DAC("Right DAC", "Right Playback",
 			 ES8323_DACPOWER, ES8323_DACPOWER_PDNDACR_OFF, 1),
 	SND_SOC_DAPM_DAC("Left DAC", "Left Playback",
@@ -237,8 +247,6 @@ static const struct snd_soc_dapm_widget es8323_dapm_widgets[] = {
 			   &es8323_right_mixer_controls[0],
 			   ARRAY_SIZE(es8323_right_mixer_controls)),
 
-	SND_SOC_DAPM_PGA("Right ADC Power", SND_SOC_NOPM, 6, 1, NULL, 0),
-	SND_SOC_DAPM_PGA("Left ADC Power", SND_SOC_NOPM, 7, 1, NULL, 0),
 	SND_SOC_DAPM_PGA("Right Out 2", ES8323_DACPOWER, ES8323_DACPOWER_ROUT2_OFF, 0, NULL, 0),
 	SND_SOC_DAPM_PGA("Left Out 2", ES8323_DACPOWER, ES8323_DACPOWER_LOUT2_OFF, 0, NULL, 0),
 	SND_SOC_DAPM_PGA("Right Out 1", ES8323_DACPOWER, ES8323_DACPOWER_ROUT1_OFF, 0, NULL, 0),
@@ -268,18 +276,16 @@ static const struct snd_soc_dapm_route es8323_dapm_routes[] = {
 	{"Differential Mux", "Line 2", "LINPUT2"},
 	{"Differential Mux", "Line 2", "RINPUT2"},
 
-	{"Left ADC Mux", "Stereo", "Right PGA Mux"},
 	{"Left ADC Mux", "Stereo", "Left PGA Mux"},
 	{"Left ADC Mux", "Mono (Left)", "Left PGA Mux"},
 
-	{"Right ADC Mux", "Stereo", "Left PGA Mux"},
 	{"Right ADC Mux", "Stereo", "Right PGA Mux"},
 	{"Right ADC Mux", "Mono (Right)", "Right PGA Mux"},
 
-	{"Left ADC Power", NULL, "Left ADC Mux"},
-	{"Right ADC Power", NULL, "Right ADC Mux"},
-	{"Left ADC", NULL, "Left ADC Power"},
-	{"Right ADC", NULL, "Right ADC Power"},
+	{"Left ADC", NULL, "Left ADC Mux"},
+	{"Right ADC", NULL, "Right ADC Mux"},
+
+	{ "Mic Bias", NULL, "Mic Bias Gen" },
 
 	{"Left Line Mux", "Line 1L", "LINPUT1"},
 	{"Left Line Mux", "Line 2L", "LINPUT2"},
@@ -661,8 +667,9 @@ static int es8323_set_bias_level(struct snd_soc_component *component,
 		snd_soc_component_write(component, ES8323_CHIPLOPOW1, 0x00);
 		snd_soc_component_write(component, ES8323_CHIPLOPOW2, 0x00);
 		snd_soc_component_write(component, ES8323_CHIPPOWER, 0x00);
-		snd_soc_component_write(component, ES8323_ADCPOWER, 0x09);
 		snd_soc_component_write(component, ES8323_ADCCONTROL14, 0x00);
+		snd_soc_component_update_bits(component, ES8323_ADCPOWER,
+					      ES8323_ADCPOWER_PDNADCBIS, 0);
 		break;
 	case SND_SOC_BIAS_PREPARE:
 		break;
@@ -671,11 +678,9 @@ static int es8323_set_bias_level(struct snd_soc_component *component,
 		snd_soc_component_write(component, ES8323_CHIPLOPOW1, 0x00);
 		snd_soc_component_write(component, ES8323_CHIPLOPOW2, 0x00);
 		snd_soc_component_write(component, ES8323_CHIPPOWER, 0x00);
-		snd_soc_component_write(component, ES8323_ADCPOWER, 0x59);
 		break;
 	case SND_SOC_BIAS_OFF:
 		clk_disable_unprepare(es8323->mclk);
-		snd_soc_component_write(component, ES8323_ADCPOWER, 0xff);
 		snd_soc_component_write(component, ES8323_CHIPLOPOW1, 0xff);
 		snd_soc_component_write(component, ES8323_CHIPLOPOW2, 0xff);
 		snd_soc_component_write(component, ES8323_CHIPPOWER, 0xff);
diff --git a/sound/soc/codecs/es8323.h b/sound/soc/codecs/es8323.h
index d79955f871c9..4d4ac4f2e4ae 100644
--- a/sound/soc/codecs/es8323.h
+++ b/sound/soc/codecs/es8323.h
@@ -17,6 +17,19 @@
 #define ES8323_CONTROL2		0x01
 #define ES8323_CHIPPOWER	0x02
 #define ES8323_ADCPOWER		0x03
+
+#define ES8323_ADCPOWER_INT1LP		BIT(0)
+#define ES8323_ADCPOWER_FLASHLP		BIT(1)
+#define ES8323_ADCPOWER_PDNADCBIS	BIT(2)
+#define ES8323_ADCPOWER_PDNMICB		BIT(3)
+
+#define ES8323_ADCPOWER_PDNADCBIS_OFF	2
+#define ES8323_ADCPOWER_PDNMICB_OFF	3
+#define ES8323_ADCPOWER_PDNADCR_OFF	4
+#define ES8323_ADCPOWER_PDNADCL_OFF	5
+#define ES8323_ADCPOWER_PDNAINR_OFF	6
+#define ES8323_ADCPOWER_PDNAINL_OFF	7
+
 #define ES8323_DACPOWER		0x04
 
 #define ES8323_DACPOWER_ROUT2_OFF	2
-- 
2.47.3

