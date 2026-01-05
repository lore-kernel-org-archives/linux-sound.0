Received: from smtp134-80.sina.com.cn (smtp134-80.sina.com.cn [180.149.134.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E755A312819
	for <linux-sound@vger.kernel.org>; Mon,  5 Jan 2026 09:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=180.149.134.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767604606; cv=none; b=V0t5DOihg1tdhRMu3k39RhlhAK530oNib759449aG2nwNvIm98c1KZ60M2f9c73BfYFd9B2a5huV2mIzBzs1kgYP9cN53ibo1ftWSCPnimB2Wac3nAY20tWjBse18Y68ixIkK0WZe3aRY3MdMaga++JtNw26OOIyBngQey7hMX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767604606; c=relaxed/simple;
	bh=KcVv/vh+IMt2i/3H5LcV5fMNULiEDznlikXMlrPtHNs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=gbwsdSPPkl6ri79hQnjXN3tR3SAh7xGvtEKe127ZzMDoWWbog/RCxNmdta7QtGsvHNCSv+8IuY4H0d0zoFghUoJfpLnuGsZDVeHVO9OBBuU1L02A1KyXmByM/X2jc+RsuTbdvmNRIqXWBan8m3rH8WJIAZE49Oer7RvZrILCNpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=180.149.134.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.154.36.64])
	by sina.net (10.185.250.29) with ESMTP
	id 695B814B000044A1; Mon, 5 Jan 2026 17:15:59 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: D78820E784BF46CAB6F27AA7255DFFEA
X-SMAIL-UIID: D78820E784BF46CAB6F27AA7255DFFEA-20260105-171559
From: Zhang Yi <zhangyi@everest-semi.com>
To: broonie@kernel.org,
	robh@kernel.org,
	tiwai@suse.com,
	devicetree@vger.kernel.org,
	conor+dt@kernel.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	krzk+dt@kernel.org
Cc: amadeuszx.slawinski@linux.intel.com,
	krzk@kernel.org,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH 3/5] ASoC: codecs: ES8389: Adjust wakeup configuration
Date: Mon,  5 Jan 2026 17:15:46 +0800
Message-Id: <20260105091548.4196-4-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260105091548.4196-1-zhangyi@everest-semi.com>
References: <20260105091548.4196-1-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

Update wake-up configuration to ensure the codec works properly.

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/codecs/es8389.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/es8389.c b/sound/soc/codecs/es8389.c
index 9400c5ca4e3a..fb650ab2dd17 100755
--- a/sound/soc/codecs/es8389.c
+++ b/sound/soc/codecs/es8389.c
@@ -629,10 +629,6 @@ static int es8389_set_bias_level(struct snd_soc_component *component,
 		regmap_write(es8389->regmap, ES8389_CSM_JUMP, 0xE4);
 		regmap_write(es8389->regmap, ES8389_RESET, 0x01);
 		regmap_write(es8389->regmap, ES8389_CLK_OFF1, 0xC3);
-		regmap_update_bits(es8389->regmap, ES8389_ADC_HPF1, 0x0f, 0x0a);
-		regmap_update_bits(es8389->regmap, ES8389_ADC_HPF2, 0x0f, 0x0a);
-		usleep_range(70000, 72000);
-		regmap_write(es8389->regmap, ES8389_DAC_RESET, 0X00);
 		break;
 	case SND_SOC_BIAS_PREPARE:
 		break;
@@ -663,6 +659,7 @@ static int es8389_mute(struct snd_soc_dai *dai, int mute, int direction)
 {
 	struct snd_soc_component *component = dai->component;
 	struct es8389_private *es8389 = snd_soc_component_get_drvdata(component);
+	unsigned int regv;
 
 	if (mute) {
 		if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
@@ -673,10 +670,22 @@ static int es8389_mute(struct snd_soc_dai *dai, int mute, int direction)
 						0x03, 0x03);
 		}
 	} else {
+		regmap_read(es8389->regmap, ES8389_CSM_STATE1, &regv);
+		if (regv != ES8389_STATE_ON) {
+			regmap_update_bits(es8389->regmap, ES8389_HPSW, 0x20, 0x20);
+			regmap_write(es8389->regmap, ES8389_ANA_CTL1, 0xD9);
+			regmap_write(es8389->regmap, ES8389_ADC_EN, 0x8F);
+			regmap_write(es8389->regmap, ES8389_CSM_JUMP, 0xE4);
+			regmap_write(es8389->regmap, ES8389_RESET, 0x01);
+			regmap_write(es8389->regmap, ES8389_CLK_OFF1, 0xC3);
+		}
+
 		if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
 			regmap_update_bits(es8389->regmap, ES8389_DAC_FORMAT_MUTE,
 						0x03, 0x00);
 		} else {
+			regmap_update_bits(es8389->regmap, ES8389_ADC_HPF1, 0x0f, 0x0a);
+			regmap_update_bits(es8389->regmap, ES8389_ADC_HPF2, 0x0f, 0x0a);
 			regmap_update_bits(es8389->regmap, ES8389_ADC_FORMAT_MUTE,
 						0x03, 0x00);
 		}
-- 
2.17.1

