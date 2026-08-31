Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B16390999
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 20:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788208160; cv=none; b=jGtA+YP4TODEkEkhFMEcun3g8yfVxhKZryfdkvqjJu5uZ58Qokv+5CajZhUYFWzcrKSkX21KQUstiqmXAH989W5qboAh7LSTfiScuIr42Q7L4FwS1+IwsH7XvorviXBUbEkUD96rKCHAXZTT+yMJtxrzqHZ9+NkAAmJB8Vsr+HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788208160; c=relaxed/simple;
	bh=xbKooEfIYs1KbdZZ4Evqsy5MtYiH/6hzRDf+AkwQrkc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=myXh3l7JaMQtreRojc5I+zco3VlW1aOuQC2eFfGXiMk6Ju9WMBvHfOWv+ZAMjLSROLZSMSiQWPiWnD1RUsxnXr/Eanc/ML9q4cvvYZjeiED9LtZjmxOo/anCLksFL4E0Arae6nSk4AKN3b9y7bmTy9NaK64Sm4KQwhvqe6VpTZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R0pqDVku; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R0pqDVku"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 047031F000E9;
	Mon, 31 Aug 2026 20:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788208158;
	bh=7Nrt78m1g3Y8rKysaqJRP/ZspYG0FeXva9jrpNe3dvg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=R0pqDVkuC4ZMhMSiiEqpyw3k7C5XwDt6t+cmmESErFxIEVsyJWsghmtlXmqwxryvw
	 nM88k0/h/5KC6FOOYBfGb89uJZN7p9pqm7RVzmg2u5igTL/QHoGYQsVwTSDJDWxWo+
	 DfiRN85csmU8rRJvR8WXdk4Vaf49HPry4maJC/20xUo9zLI2agNmgVKG/5RvbdAa7Q
	 OAyRgRE1r1biT3dPxCCtRiF5+vIuMAcBT371CFNg9kfUFlHrsQOKClB5WvPDN/iJGR
	 epgk5n+79Eq0ojCdXPPh/YtCgLs99MtYDzsHYElIHYqE+6P2hj2P31KuCUlafYRBr2
	 SUZf23aZBrT4A==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 31 Aug 2026 22:29:08 +0200
Subject: [PATCH 3/6] ASoC: ab8500: Correct digital interface format setup
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-ab8500-codec-fixes-v1-3-f85024e717e3@kernel.org>
References: <20260831-ab8500-codec-fixes-v1-0-f85024e717e3@kernel.org>
In-Reply-To: <20260831-ab8500-codec-fixes-v1-0-f85024e717e3@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: linux-sound@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

The codec programs I2S as an undelayed left-aligned format, although the
hardware manual defines delayed left-aligned as I2S compatible. It also
enables the master generator when the codec is a clock consumer, changes
registers before the complete format has been validated, and discards
register I/O errors.

Build all three interface register values before writing them, use the
required one-bit I2S delay, only run the master generator for a provider
configuration, and propagate write failures.

Fixes: 679d7abdc754 ("ASoC: codecs: Add AB8500 codec-driver")
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 sound/soc/codecs/ab8500-codec.c | 175 +++++++++++++++-------------------------
 1 file changed, 64 insertions(+), 111 deletions(-)

diff --git a/sound/soc/codecs/ab8500-codec.c b/sound/soc/codecs/ab8500-codec.c
index 5172154f4139..4fbe486de74a 100644
--- a/sound/soc/codecs/ab8500-codec.c
+++ b/sound/soc/codecs/ab8500-codec.c
@@ -1737,149 +1737,91 @@ static int ab8500_audio_set_ear_cmv(struct snd_soc_component *component,
 	return 0;
 }
 
-static int ab8500_audio_set_bit_delay(struct snd_soc_dai *dai,
-				unsigned int delay)
-{
-	unsigned int mask, val;
-	struct snd_soc_component *component = dai->component;
-
-	mask = BIT(AB8500_DIGIFCONF2_IF0DEL);
-	val = 0;
-
-	switch (delay) {
-	case 0:
-		break;
-	case 1:
-		val |= BIT(AB8500_DIGIFCONF2_IF0DEL);
-		break;
-	default:
-		dev_err(dai->component->dev,
-			"%s: ERROR: Unsupported bit-delay (0x%x)!\n",
-			__func__, delay);
-		return -EINVAL;
-	}
-
-	dev_dbg(dai->component->dev, "%s: IF0 Bit-delay: %d bits.\n",
-		__func__, delay);
-	snd_soc_component_update_bits(component, AB8500_DIGIFCONF2, mask, val);
-
-	return 0;
-}
-
-/* Gates clocking according format mask */
-static int ab8500_codec_set_dai_clock_gate(struct snd_soc_component *component,
-					unsigned int fmt)
-{
-	unsigned int mask;
-	unsigned int val;
-
-	mask = BIT(AB8500_DIGIFCONF1_ENMASTGEN) |
-			BIT(AB8500_DIGIFCONF1_ENFSBITCLK0);
-
-	val = BIT(AB8500_DIGIFCONF1_ENMASTGEN);
-
-	switch (fmt & SND_SOC_DAIFMT_CLOCK_MASK) {
-	case SND_SOC_DAIFMT_CONT: /* continuous clock */
-		dev_dbg(component->dev, "%s: IF0 Clock is continuous.\n",
-			__func__);
-		val |= BIT(AB8500_DIGIFCONF1_ENFSBITCLK0);
-		break;
-	case SND_SOC_DAIFMT_GATED: /* clock is gated */
-		dev_dbg(component->dev, "%s: IF0 Clock is gated.\n",
-			__func__);
-		break;
-	default:
-		dev_err(component->dev,
-			"%s: ERROR: Unsupported clock mask (0x%x)!\n",
-			__func__, fmt & SND_SOC_DAIFMT_CLOCK_MASK);
-		return -EINVAL;
-	}
-
-	snd_soc_component_update_bits(component, AB8500_DIGIFCONF1, mask, val);
-
-	return 0;
-}
-
 static int ab8500_codec_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 {
-	unsigned int mask;
-	unsigned int val;
 	struct snd_soc_component *component = dai->component;
-	int status;
+	unsigned int conf1_mask, conf1_val = 0;
+	unsigned int conf2_mask, conf2_val = 0;
+	unsigned int conf3_mask, conf3_val = 0;
+	bool provider = false;
+	int ret;
 
 	dev_dbg(component->dev, "%s: Enter (fmt = 0x%x)\n", __func__, fmt);
 
-	mask = BIT(AB8500_DIGIFCONF3_IF1DATOIF0AD) |
+	conf3_mask = BIT(AB8500_DIGIFCONF3_IF1DATOIF0AD) |
 			BIT(AB8500_DIGIFCONF3_IF1CLKTOIF0CLK) |
 			BIT(AB8500_DIGIFCONF3_IF0BFIFOEN) |
 			BIT(AB8500_DIGIFCONF3_IF0MASTER);
-	val = 0;
 
 	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
 	case SND_SOC_DAIFMT_CBP_CFP:
-		dev_dbg(dai->component->dev,
+		dev_dbg(component->dev,
 			"%s: IF0 Master-mode: AB8500 provider.\n", __func__);
-		val |= BIT(AB8500_DIGIFCONF3_IF0MASTER);
+		conf3_val |= BIT(AB8500_DIGIFCONF3_IF0MASTER);
+		provider = true;
 		break;
 	case SND_SOC_DAIFMT_CBC_CFC:
-		dev_dbg(dai->component->dev,
+		dev_dbg(component->dev,
 			"%s: IF0 Master-mode: AB8500 consumer.\n", __func__);
 		break;
 	case SND_SOC_DAIFMT_CBC_CFP:
 	case SND_SOC_DAIFMT_CBP_CFC:
-		dev_err(dai->component->dev,
+		dev_err(component->dev,
 			"%s: ERROR: The device is either a provider or a consumer.\n",
 			__func__);
 		fallthrough;
 	default:
-		dev_err(dai->component->dev,
-			"%s: ERROR: Unsupporter clocking mask 0x%x\n",
+		dev_err(component->dev,
+			"%s: ERROR: Unsupported clocking mask 0x%x\n",
 			__func__, fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK);
 		return -EINVAL;
 	}
 
-	snd_soc_component_update_bits(component, AB8500_DIGIFCONF3, mask, val);
-
-	/* Set clock gating */
-	status = ab8500_codec_set_dai_clock_gate(component, fmt);
-	if (status) {
-		dev_err(dai->component->dev,
-			"%s: ERROR: Failed to set clock gate (%d).\n",
-			__func__, status);
-		return status;
+	conf1_mask = BIT(AB8500_DIGIFCONF1_ENMASTGEN) |
+		     BIT(AB8500_DIGIFCONF1_ENFSBITCLK0);
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_MASK) {
+	case SND_SOC_DAIFMT_CONT:
+		if (provider)
+			conf1_val = conf1_mask;
+		break;
+	case SND_SOC_DAIFMT_GATED:
+		if (provider)
+			conf1_val = BIT(AB8500_DIGIFCONF1_ENMASTGEN);
+		break;
+	default:
+		dev_err(component->dev, "%s: Unsupported clock mask 0x%x\n",
+			__func__, fmt & SND_SOC_DAIFMT_CLOCK_MASK);
+		return -EINVAL;
 	}
 
-	/* Setting data transfer format */
-
-	mask = BIT(AB8500_DIGIFCONF2_IF0FORMAT0) |
-		BIT(AB8500_DIGIFCONF2_IF0FORMAT1) |
-		BIT(AB8500_DIGIFCONF2_FSYNC0P) |
-		BIT(AB8500_DIGIFCONF2_BITCLK0P);
-	val = 0;
+	conf2_mask = BIT(AB8500_DIGIFCONF2_IF0FORMAT0) |
+		     BIT(AB8500_DIGIFCONF2_IF0FORMAT1) |
+		     BIT(AB8500_DIGIFCONF2_IF0DEL) |
+		     BIT(AB8500_DIGIFCONF2_FSYNC0P) |
+		     BIT(AB8500_DIGIFCONF2_BITCLK0P);
 
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_I2S: /* I2S mode */
-		dev_dbg(dai->component->dev, "%s: IF0 Protocol: I2S\n", __func__);
-		val |= BIT(AB8500_DIGIFCONF2_IF0FORMAT1);
-		ab8500_audio_set_bit_delay(dai, 0);
+		dev_dbg(component->dev, "%s: IF0 Protocol: I2S\n", __func__);
+		conf2_val |= BIT(AB8500_DIGIFCONF2_IF0FORMAT1) |
+			     BIT(AB8500_DIGIFCONF2_IF0DEL);
 		break;
 
 	case SND_SOC_DAIFMT_DSP_A: /* L data MSB after FRM LRC */
-		dev_dbg(dai->component->dev,
+		dev_dbg(component->dev,
 			"%s: IF0 Protocol: DSP A (TDM)\n", __func__);
-		val |= BIT(AB8500_DIGIFCONF2_IF0FORMAT0);
-		ab8500_audio_set_bit_delay(dai, 1);
+		conf2_val |= BIT(AB8500_DIGIFCONF2_IF0FORMAT0) |
+			     BIT(AB8500_DIGIFCONF2_IF0DEL);
 		break;
 
 	case SND_SOC_DAIFMT_DSP_B: /* L data MSB during FRM LRC */
-		dev_dbg(dai->component->dev,
+		dev_dbg(component->dev,
 			"%s: IF0 Protocol: DSP B (TDM)\n", __func__);
-		val |= BIT(AB8500_DIGIFCONF2_IF0FORMAT0);
-		ab8500_audio_set_bit_delay(dai, 0);
+		conf2_val |= BIT(AB8500_DIGIFCONF2_IF0FORMAT0);
 		break;
 
 	default:
-		dev_err(dai->component->dev,
+		dev_err(component->dev,
 			"%s: ERROR: Unsupported format (0x%x)!\n",
 			__func__, fmt & SND_SOC_DAIFMT_FORMAT_MASK);
 		return -EINVAL;
@@ -1887,39 +1829,50 @@ static int ab8500_codec_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 
 	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
 	case SND_SOC_DAIFMT_NB_NF: /* normal bit clock + frame */
-		dev_dbg(dai->component->dev,
+		dev_dbg(component->dev,
 			"%s: IF0: Normal bit clock, normal frame\n",
 			__func__);
 		break;
 	case SND_SOC_DAIFMT_NB_IF: /* normal BCLK + inv FRM */
-		dev_dbg(dai->component->dev,
+		dev_dbg(component->dev,
 			"%s: IF0: Normal bit clock, inverted frame\n",
 			__func__);
-		val |= BIT(AB8500_DIGIFCONF2_FSYNC0P);
+		conf2_val |= BIT(AB8500_DIGIFCONF2_FSYNC0P);
 		break;
 	case SND_SOC_DAIFMT_IB_NF: /* invert BCLK + nor FRM */
-		dev_dbg(dai->component->dev,
+		dev_dbg(component->dev,
 			"%s: IF0: Inverted bit clock, normal frame\n",
 			__func__);
-		val |= BIT(AB8500_DIGIFCONF2_BITCLK0P);
+		conf2_val |= BIT(AB8500_DIGIFCONF2_BITCLK0P);
 		break;
 	case SND_SOC_DAIFMT_IB_IF: /* invert BCLK + FRM */
-		dev_dbg(dai->component->dev,
+		dev_dbg(component->dev,
 			"%s: IF0: Inverted bit clock, inverted frame\n",
 			__func__);
-		val |= BIT(AB8500_DIGIFCONF2_FSYNC0P);
-		val |= BIT(AB8500_DIGIFCONF2_BITCLK0P);
+		conf2_val |= BIT(AB8500_DIGIFCONF2_FSYNC0P) |
+			     BIT(AB8500_DIGIFCONF2_BITCLK0P);
 		break;
 	default:
-		dev_err(dai->component->dev,
+		dev_err(component->dev,
 			"%s: ERROR: Unsupported INV mask 0x%x\n",
 			__func__, fmt & SND_SOC_DAIFMT_INV_MASK);
 		return -EINVAL;
 	}
 
-	snd_soc_component_update_bits(component, AB8500_DIGIFCONF2, mask, val);
+	ret = snd_soc_component_update_bits(component, AB8500_DIGIFCONF3,
+					    conf3_mask, conf3_val);
+	if (ret < 0)
+		return ret;
 
-	return 0;
+	ret = snd_soc_component_update_bits(component, AB8500_DIGIFCONF1,
+					    conf1_mask, conf1_val);
+	if (ret < 0)
+		return ret;
+
+	ret = snd_soc_component_update_bits(component, AB8500_DIGIFCONF2,
+					    conf2_mask, conf2_val);
+
+	return ret < 0 ? ret : 0;
 }
 
 static int ab8500_codec_set_dai_tdm_slot(struct snd_soc_dai *dai,

-- 
2.55.0

