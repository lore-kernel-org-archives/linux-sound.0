Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13F8248881;
	Thu, 17 Sep 2026 22:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789685482; cv=none; b=gdfdV4l+QKtFvWR2OKD7Kg5mu7jmEIgF7Fi2s8bx3t0NWBB2TxI4mUe3yHxs7bxfotn2dHF03qrMsLAQ4ReBnw4eK91/gGaMtahT0MMlotR8AOzmmtZOzfLweFXOEdiOt2PHPDZyTck5Y3CHRamsacGb0D0psRbcIj6e0wzHQ2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789685482; c=relaxed/simple;
	bh=wS0aZrOeDNyhD+XGIGzDSAElGYb+IObpugHdokhFyoA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IPhUg9Byx2Y5jpVCAQdJOy+bB04BUB1iNZ53yvZc7QM8mlmblrHEvdlvSeumxGstny7sryOB3sksN5ITWYkNQTxBeFd2U4stHg8OrhYyBlkha9mBWJhhqGeOX8JjbI/lJEmUXPStzsjOQf4h0PUitSthCybsjPVqvDmC1SH9YBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OlAGdbdQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OlAGdbdQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F3251F000FF;
	Thu, 17 Sep 2026 22:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789685480;
	bh=oLhVn6lbhj3EhpMFwNsDhV8XdOBajGu6JReHZ1+ijgc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=OlAGdbdQDTIs9maJp+HsWcZcokE3hzJd320eFTbopt4L4FccunnBzKamLzAoP8uI9
	 d0Plz+9NChRxFnTpUHk1PFBWnKW5MeDWtQ/9po+e5CTKuyp8yIJ9W+3o8AX1+RkDaE
	 AGJfT9jDvQjD9Kfs6o1LBwrQM4XSUR+L7DYbtWw3REQIZbGQ77knufKOEQZNHNGcke
	 H9IXHSJfUsNty+UWy4B8GSH0Pv7qCronTuuppv7cjQ4IEt3NoGqgEva5cNqMRLoT72
	 DEaNoSB9SVGJvrzJYWw/gx5hs/p2iy+4+zJyYlul/4X8pd5y8lnYzBtOLq6wNbVHfl
	 8dvhF4IYCv57g==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 18 Sep 2026 00:51:02 +0200
Subject: [PATCH v2 4/9] ASoC: ab8500: Skip digital microphone support on
 AB8505
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-ux500-simple-sound-v2-4-88d29416e3c3@kernel.org>
References: <20260918-ux500-simple-sound-v2-0-88d29416e3c3@kernel.org>
In-Reply-To: <20260918-ux500-simple-sound-v2-0-88d29416e3c3@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 mfd@lists.linux.dev, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

The AB8505 does not have the digital microphone interface, its six
input pins or the VDMIC regulator found in AB8500. The shared codec
driver nevertheless creates the entire AB8500 DMIC DAPM graph. When an
AB8505 sound card binds, the regulator widget requests the nonexistent
V-DMIC supply and falls back to a dummy regulator.

Split the digital microphone widgets and routes from the common codec
graph and add them only when the parent MFD is an actual AB8500. This
also removes the DMIC4-only AD_OUT4 path from AB8505.

Fixes: 679d7abdc754 ("ASoC: codecs: Add AB8500 codec-driver")
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 sound/soc/codecs/ab8500-codec.c | 144 +++++++++++++++++++++++-----------------
 1 file changed, 82 insertions(+), 62 deletions(-)

diff --git a/sound/soc/codecs/ab8500-codec.c b/sound/soc/codecs/ab8500-codec.c
index e1a0e35836e6..35df09705440 100644
--- a/sound/soc/codecs/ab8500-codec.c
+++ b/sound/soc/codecs/ab8500-codec.c
@@ -299,7 +299,6 @@ static const struct snd_soc_dapm_widget ab8500_dapm_widgets[] = {
 	SND_SOC_DAPM_REGULATOR_SUPPLY("V-AUD", 0, 0),
 	SND_SOC_DAPM_REGULATOR_SUPPLY("V-AMIC1", 0, 0),
 	SND_SOC_DAPM_REGULATOR_SUPPLY("V-AMIC2", 0, 0),
-	SND_SOC_DAPM_REGULATOR_SUPPLY("V-DMIC", 0, 0),
 
 	/* Power */
 	SND_SOC_DAPM_SUPPLY("Audio Power",
@@ -324,7 +323,6 @@ static const struct snd_soc_dapm_widget ab8500_dapm_widgets[] = {
 	SND_SOC_DAPM_AIF_OUT("AD_OUT1", NULL, 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("AD_OUT2", NULL, 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("AD_OUT3", NULL, 0, SND_SOC_NOPM, 0, 0),
-	SND_SOC_DAPM_AIF_OUT("AD_OUT4", NULL, 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("AD_OUT57", NULL, 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("AD_OUT68", NULL, 0, SND_SOC_NOPM, 0, 0),
 
@@ -584,36 +582,6 @@ static const struct snd_soc_dapm_widget ab8500_dapm_widgets[] = {
 	SND_SOC_DAPM_SUPPLY("AD5768 Enable", AB8500_ADPATHENA,
 			    AB8500_ADPATHENA_ENAD5768, 0, NULL, 0),
 
-	/* Digital Microphone path */
-
-	SND_SOC_DAPM_INPUT("DMic 1"),
-	SND_SOC_DAPM_INPUT("DMic 2"),
-	SND_SOC_DAPM_INPUT("DMic 3"),
-	SND_SOC_DAPM_INPUT("DMic 4"),
-	SND_SOC_DAPM_INPUT("DMic 5"),
-	SND_SOC_DAPM_INPUT("DMic 6"),
-
-	SND_SOC_DAPM_MIXER("DMIC1",
-			AB8500_DIGMICCONF, AB8500_DIGMICCONF_ENDMIC1, 0,
-			NULL, 0),
-	SND_SOC_DAPM_MIXER("DMIC2",
-			AB8500_DIGMICCONF, AB8500_DIGMICCONF_ENDMIC2, 0,
-			NULL, 0),
-	SND_SOC_DAPM_MIXER("DMIC3",
-			AB8500_DIGMICCONF, AB8500_DIGMICCONF_ENDMIC3, 0,
-			NULL, 0),
-	SND_SOC_DAPM_MIXER("DMIC4",
-			AB8500_DIGMICCONF, AB8500_DIGMICCONF_ENDMIC4, 0,
-			NULL, 0),
-	SND_SOC_DAPM_MIXER("DMIC5",
-			AB8500_DIGMICCONF, AB8500_DIGMICCONF_ENDMIC5, 0,
-			NULL, 0),
-	SND_SOC_DAPM_MIXER("DMIC6",
-			AB8500_DIGMICCONF, AB8500_DIGMICCONF_ENDMIC6, 0,
-			NULL, 0),
-	SND_SOC_DAPM_MIXER("AD4 Channel Volume",
-			SND_SOC_NOPM, 0, 0,
-			NULL, 0),
 	/* Acoustical Noise Cancellation path */
 
 	SND_SOC_DAPM_MUX("ANC Source",
@@ -648,6 +616,40 @@ static const struct snd_soc_dapm_widget ab8500_dapm_widgets[] = {
 			NULL, 0),
 };
 
+static const struct snd_soc_dapm_widget ab8500_dmic_dapm_widgets[] = {
+	SND_SOC_DAPM_REGULATOR_SUPPLY("V-DMIC", 0, 0),
+	SND_SOC_DAPM_AIF_OUT("AD_OUT4", NULL, 0, SND_SOC_NOPM, 0, 0),
+
+	SND_SOC_DAPM_INPUT("DMic 1"),
+	SND_SOC_DAPM_INPUT("DMic 2"),
+	SND_SOC_DAPM_INPUT("DMic 3"),
+	SND_SOC_DAPM_INPUT("DMic 4"),
+	SND_SOC_DAPM_INPUT("DMic 5"),
+	SND_SOC_DAPM_INPUT("DMic 6"),
+
+	SND_SOC_DAPM_MIXER("DMIC1",
+			AB8500_DIGMICCONF, AB8500_DIGMICCONF_ENDMIC1, 0,
+			NULL, 0),
+	SND_SOC_DAPM_MIXER("DMIC2",
+			AB8500_DIGMICCONF, AB8500_DIGMICCONF_ENDMIC2, 0,
+			NULL, 0),
+	SND_SOC_DAPM_MIXER("DMIC3",
+			AB8500_DIGMICCONF, AB8500_DIGMICCONF_ENDMIC3, 0,
+			NULL, 0),
+	SND_SOC_DAPM_MIXER("DMIC4",
+			AB8500_DIGMICCONF, AB8500_DIGMICCONF_ENDMIC4, 0,
+			NULL, 0),
+	SND_SOC_DAPM_MIXER("DMIC5",
+			AB8500_DIGMICCONF, AB8500_DIGMICCONF_ENDMIC5, 0,
+			NULL, 0),
+	SND_SOC_DAPM_MIXER("DMIC6",
+			AB8500_DIGMICCONF, AB8500_DIGMICCONF_ENDMIC6, 0,
+			NULL, 0),
+	SND_SOC_DAPM_MIXER("AD4 Channel Volume",
+			SND_SOC_NOPM, 0, 0,
+			NULL, 0),
+};
+
 /*
  * DAPM-routes
  */
@@ -853,35 +855,6 @@ static const struct snd_soc_dapm_route ab8500_dapm_routes[] = {
 	{"AD_OUT68", NULL, "Main Supply"},
 	{"AD_OUT68", NULL, "AD6 Channel Volume"},
 
-	/* Digital Microphone path */
-
-	{"DMic 1", NULL, "V-DMIC"},
-	{"DMic 2", NULL, "V-DMIC"},
-	{"DMic 3", NULL, "V-DMIC"},
-	{"DMic 4", NULL, "V-DMIC"},
-	{"DMic 5", NULL, "V-DMIC"},
-	{"DMic 6", NULL, "V-DMIC"},
-
-	{"DMIC1", NULL, "DMic 1"},
-	{"DMIC2", NULL, "DMic 2"},
-	{"DMIC3", NULL, "DMic 3"},
-	{"DMIC4", NULL, "DMic 4"},
-	{"DMIC5", NULL, "DMic 5"},
-	{"DMIC6", NULL, "DMic 6"},
-
-	{"AD1 Source Select", "DMic 1", "DMIC1"},
-	{"AD2 Source Select", "DMic 2", "DMIC2"},
-	{"AD3 Source Select", "DMic 3", "DMIC3"},
-	{"AD5 Source Select", "DMic 5", "DMIC5"},
-	{"AD6 Source Select", "DMic 6", "DMIC6"},
-
-	{"AD4 Channel Volume", NULL, "DMIC4"},
-	{"AD4 Channel Volume", NULL, "AD34 Enable"},
-
-	{"ab8500_0c", NULL, "AD_OUT4"},
-	{"AD_OUT4", NULL, "Main Supply"},
-	{"AD_OUT4", NULL, "AD4 Channel Volume"},
-
 	/* LineIn Bypass path */
 
 	{"LINL to HSL Volume", NULL, "LINL Enable"},
@@ -911,7 +884,6 @@ static const struct snd_soc_dapm_route ab8500_dapm_routes[] = {
 	{"Sidetone Left Source", "Headset Left", "DA_IN1"},
 	{"Sidetone Right Source", "LineIn Right", "AD2 Channel Volume"},
 	{"Sidetone Right Source", "Mic 1", "AD3 Channel Volume"},
-	{"Sidetone Right Source", "DMic 4", "AD4 Channel Volume"},
 	{"Sidetone Right Source", "Headset Right", "DA_IN2"},
 
 	{"STFIR1 Control", NULL, "Sidetone Left Source"},
@@ -924,6 +896,37 @@ static const struct snd_soc_dapm_route ab8500_dapm_routes[] = {
 	{"DA2 Enable", NULL, "STFIR2 Volume"},
 };
 
+static const struct snd_soc_dapm_route ab8500_dmic_dapm_routes[] = {
+	{"DMic 1", NULL, "V-DMIC"},
+	{"DMic 2", NULL, "V-DMIC"},
+	{"DMic 3", NULL, "V-DMIC"},
+	{"DMic 4", NULL, "V-DMIC"},
+	{"DMic 5", NULL, "V-DMIC"},
+	{"DMic 6", NULL, "V-DMIC"},
+
+	{"DMIC1", NULL, "DMic 1"},
+	{"DMIC2", NULL, "DMic 2"},
+	{"DMIC3", NULL, "DMic 3"},
+	{"DMIC4", NULL, "DMic 4"},
+	{"DMIC5", NULL, "DMic 5"},
+	{"DMIC6", NULL, "DMic 6"},
+
+	{"AD1 Source Select", "DMic 1", "DMIC1"},
+	{"AD2 Source Select", "DMic 2", "DMIC2"},
+	{"AD3 Source Select", "DMic 3", "DMIC3"},
+	{"AD5 Source Select", "DMic 5", "DMIC5"},
+	{"AD6 Source Select", "DMic 6", "DMIC6"},
+
+	{"AD4 Channel Volume", NULL, "DMIC4"},
+	{"AD4 Channel Volume", NULL, "AD34 Enable"},
+
+	{"ab8500_0c", NULL, "AD_OUT4"},
+	{"AD_OUT4", NULL, "Main Supply"},
+	{"AD_OUT4", NULL, "AD4 Channel Volume"},
+
+	{"Sidetone Right Source", "DMic 4", "AD4 Channel Volume"},
+};
+
 static const struct snd_soc_dapm_route ab8500_dapm_routes_mic1a_vamicx[] = {
 	{"MIC1A V-AMICx Enable", NULL, "V-AMIC1"},
 	{"MIC1A V-AMICx Enable", NULL, "V-AMIC2"},
@@ -2043,13 +2046,30 @@ static int ab8500_codec_probe(struct snd_soc_component *component)
 {
 	struct device *dev = component->dev;
 	struct device_node *np = dev->of_node;
+	struct ab8500 *ab8500 = dev_get_drvdata(dev->parent);
 	struct ab8500_codec_platform_data codec_pdata;
+	struct snd_soc_dapm_context *dapm;
 	int status;
 
 	dev_dbg(dev, "%s: Enter.\n", __func__);
 
 	ab8500_codec_of_probe(dev, np, &codec_pdata);
 
+	if (is_ab8500(ab8500)) {
+		dapm = snd_soc_component_to_dapm(component);
+		status = snd_soc_dapm_new_controls(dapm,
+						   ab8500_dmic_dapm_widgets,
+						   ARRAY_SIZE(ab8500_dmic_dapm_widgets));
+		if (status)
+			return status;
+
+		status = snd_soc_dapm_add_routes(dapm,
+						 ab8500_dmic_dapm_routes,
+						 ARRAY_SIZE(ab8500_dmic_dapm_routes));
+		if (status)
+			return status;
+	}
+
 	status = ab8500_audio_init_audioblock(component);
 	if (status < 0) {
 		dev_err(dev, "%s: failed to init audio-block (%d)!\n",

-- 
2.55.0

