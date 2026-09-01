Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6994488748
	for <linux-sound@vger.kernel.org>; Tue,  1 Sep 2026 22:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788302639; cv=none; b=EFQPmejJ/Dh0X6vQ5YXweE4ouAIM3hoSgxOFuW5VfTdh7RpKmSPa/iVLy4HqfJOoSqqvh2RAKUTF1GM9H8RS4/kDkYdqhVGasmWDE/dJafSB2YBHNKYLQotgfKePUkh+vqvuxwYXg+FQvHPE8OLwj5kBGwHMAx2LgjJ9CICew3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788302639; c=relaxed/simple;
	bh=nsZogfpYDXAaBvgGXj+1sV45wUuN/Qst5N9Z4EMqjRw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j9Sex8Bo1JiNXzvTo2ckfEiQsiU07yVHQKnlSMAN6wUZOT6Yp6jF8RAOJv6ZT6gis7cVsBTyeNWT70qPC0U5LYrYH4uZoSKOZPbtBiyUFLeGztmxJoBxjrfn9/SJBtzCLPgGB3RB8WBl7RNpODbxr2RpHjmW2/v0rkMWS7PqLeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lpeCRa3k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lpeCRa3k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 619C71F000E9;
	Tue,  1 Sep 2026 22:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788302637;
	bh=ohheOuY6ujPtP13hHYQiyOx5SSKwe/aDl3/Gz5cj6ic=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=lpeCRa3kjD6oUGATT6BaGCbpYVSMqY5gj5L6lOP1IkUXIE5znYEEEI3sty6hb1g6i
	 rn5pJc0HTjkHCWX9X3fPSmi4P0DERNKuTK3cmr6grNj8Hf6nRr7isfWMF2kxbpaxQk
	 lifWHJxiZigY8AaU0JsxUWZWehH2ay419Q7Su4hP+JOpUwlyhfo7AtI6UmDh+CIFrk
	 ZNXNzvSDKIHvWMGL72itNbEScK+IaF7c5TmUvd4t0kfZYtoe1eXy+aqdGikoGXOLqN
	 MzFiQ4sFPnB6JEWUNrd2R1LMSi0fgL2aEWIhAWmjLwYDd711PMK2DNcqpyzsxEcWDL
	 bqVnJy+Fpth2A==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 02 Sep 2026 00:43:47 +0200
Subject: [PATCH 4/9] ASoC: ux500: Validate MSP DAI configuration
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-ux500-msp-fixes-v1-4-da1447fd9f7b@kernel.org>
References: <20260902-ux500-msp-fixes-v1-0-da1447fd9f7b@kernel.org>
In-Reply-To: <20260902-ux500-msp-fixes-v1-0-da1447fd9f7b@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-sound@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

Installing channel constraints from hw_params is too late to affect the
parameters being committed. The driver consequently accepts channel
counts which disagree with the I2S or TDM setup. It also silently
truncates out-of-range slot masks and accepts inverted bit clock formats
which prepare then rejects.

Validate the selected channel count directly, reject invalid masks
before changing cached TDM state, and implement all four standard clock
and frame inversion combinations. Use the requested format in
validation diagnostics.

Fixes: 3592b7f69a54 ("ASoC: Ux500: Add MSP I2S-driver")
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 sound/soc/ux500/ux500_msp_dai.c | 41 +++++++++++++++++++++++++++--------------
 sound/soc/ux500/ux500_msp_i2s.c |  7 +++++--
 sound/soc/ux500/ux500_msp_i2s.h |  1 +
 3 files changed, 33 insertions(+), 16 deletions(-)

diff --git a/sound/soc/ux500/ux500_msp_dai.c b/sound/soc/ux500/ux500_msp_dai.c
index 0a9cc7e769fe..599de5de23dd 100644
--- a/sound/soc/ux500/ux500_msp_dai.c
+++ b/sound/soc/ux500/ux500_msp_dai.c
@@ -130,7 +130,16 @@ static int setup_clocking(struct snd_soc_dai *dai,
 	case SND_SOC_DAIFMT_NB_IF:
 		msp_config->tx_fsync_pol ^= 1 << TFSPOL_SHIFT;
 		msp_config->rx_fsync_pol ^= 1 << RFSPOL_SHIFT;
+		break;
+
+	case SND_SOC_DAIFMT_IB_NF:
+		msp_config->bclk_inverted = true;
+		break;
 
+	case SND_SOC_DAIFMT_IB_IF:
+		msp_config->bclk_inverted = true;
+		msp_config->tx_fsync_pol ^= 1 << TFSPOL_SHIFT;
+		msp_config->rx_fsync_pol ^= 1 << RFSPOL_SHIFT;
 		break;
 
 	default:
@@ -453,7 +462,6 @@ static int ux500_msp_dai_hw_params(struct snd_pcm_substream *substream,
 				struct snd_soc_dai *dai)
 {
 	unsigned int mask, slots_active;
-	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct ux500_msp_i2s_drvdata *drvdata = dev_get_drvdata(dai->dev);
 
 	dev_dbg(dai->dev, "%s: MSP %d (%s): Enter.\n",
@@ -461,9 +469,8 @@ static int ux500_msp_dai_hw_params(struct snd_pcm_substream *substream,
 
 	switch (drvdata->fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_I2S:
-		snd_pcm_hw_constraint_minmax(runtime,
-				SNDRV_PCM_HW_PARAM_CHANNELS,
-				1, 2);
+		if (params_channels(params) < 1 || params_channels(params) > 2)
+			return -EINVAL;
 		break;
 
 	case SND_SOC_DAIFMT_DSP_B:
@@ -475,9 +482,8 @@ static int ux500_msp_dai_hw_params(struct snd_pcm_substream *substream,
 		slots_active = hweight32(mask);
 		dev_dbg(dai->dev, "TDM-slots active: %d", slots_active);
 
-		snd_pcm_hw_constraint_single(runtime,
-				SNDRV_PCM_HW_PARAM_CHANNELS,
-				slots_active);
+		if (!slots_active || params_channels(params) != slots_active)
+			return -EINVAL;
 		break;
 
 	default:
@@ -510,20 +516,21 @@ static int ux500_msp_dai_set_dai_fmt(struct snd_soc_dai *dai,
 	default:
 		dev_err(dai->dev,
 			"%s: Error: Unsupported protocol/master (fmt = 0x%x)!\n",
-			__func__, drvdata->fmt);
+			__func__, fmt);
 		return -EINVAL;
 	}
 
 	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
 	case SND_SOC_DAIFMT_NB_NF:
 	case SND_SOC_DAIFMT_NB_IF:
+	case SND_SOC_DAIFMT_IB_NF:
 	case SND_SOC_DAIFMT_IB_IF:
 		break;
 
 	default:
 		dev_err(dai->dev,
 			"%s: Error: Unsupported inversion (fmt = 0x%x)!\n",
-			__func__, drvdata->fmt);
+			__func__, fmt);
 		return -EINVAL;
 	}
 
@@ -557,17 +564,23 @@ static int ux500_msp_dai_set_tdm_slot(struct snd_soc_dai *dai,
 			__func__, slots);
 		return -EINVAL;
 	}
-	drvdata->slots = slots;
 
-	if (!(slot_width == 16)) {
+	if (slot_width != 16) {
 		dev_err(dai->dev, "%s: Error: Unsupported slot-width (%d)!\n",
 			__func__, slot_width);
 		return -EINVAL;
 	}
-	drvdata->slot_width = slot_width;
 
-	drvdata->tx_mask = tx_mask & cap;
-	drvdata->rx_mask = rx_mask & cap;
+	if ((tx_mask | rx_mask) & ~cap) {
+		dev_err(dai->dev, "%s: Slot mask exceeds %d slots\n",
+			__func__, slots);
+		return -EINVAL;
+	}
+
+	drvdata->slots = slots;
+	drvdata->slot_width = slot_width;
+	drvdata->tx_mask = tx_mask;
+	drvdata->rx_mask = rx_mask;
 
 	return 0;
 }
diff --git a/sound/soc/ux500/ux500_msp_i2s.c b/sound/soc/ux500/ux500_msp_i2s.c
index ef41de92d8e7..bc77174e0070 100644
--- a/sound/soc/ux500/ux500_msp_i2s.c
+++ b/sound/soc/ux500/ux500_msp_i2s.c
@@ -201,10 +201,12 @@ static int configure_protocol(struct ux500_msp *msp,
 
 	/* The code below should not be separated. */
 	temp_reg = readl(msp->registers + MSP_GCR) & ~TX_CLK_POL_RISING;
-	temp_reg |= MSP_TX_CLKPOL_BIT(~protdesc->tx_clk_pol);
+	temp_reg |= MSP_TX_CLKPOL_BIT(!protdesc->tx_clk_pol ^
+					  config->bclk_inverted);
 	writel(temp_reg, msp->registers + MSP_GCR);
 	temp_reg = readl(msp->registers + MSP_GCR) & ~RX_CLK_POL_RISING;
-	temp_reg |= MSP_RX_CLKPOL_BIT(protdesc->rx_clk_pol);
+	temp_reg |= MSP_RX_CLKPOL_BIT(protdesc->rx_clk_pol ^
+					  config->bclk_inverted);
 	writel(temp_reg, msp->registers + MSP_GCR);
 
 	return 0;
@@ -441,6 +443,7 @@ static bool ux500_msp_config_compatible(struct ux500_msp *msp,
 	       active->data_size == config->data_size &&
 	       active->def_elem_len == config->def_elem_len &&
 	       active->clock_provider == config->clock_provider &&
+	       active->bclk_inverted == config->bclk_inverted &&
 	       !memcmp(&active->protdesc, &config->protdesc,
 		       sizeof(active->protdesc));
 }
diff --git a/sound/soc/ux500/ux500_msp_i2s.h b/sound/soc/ux500/ux500_msp_i2s.h
index 80085dde5079..17b5c37a7e5d 100644
--- a/sound/soc/ux500/ux500_msp_i2s.h
+++ b/sound/soc/ux500/ux500_msp_i2s.h
@@ -459,6 +459,7 @@ struct ux500_msp_config {
 	unsigned int def_elem_len;
 	unsigned int iodelay;
 	bool clock_provider;
+	bool bclk_inverted;
 };
 
 struct ux500_msp {

-- 
2.55.0

