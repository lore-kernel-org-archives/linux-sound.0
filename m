Received: from r3-129.sinamail.sina.com.cn (r3-129.sinamail.sina.com.cn [202.108.3.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A303BED30
	for <linux-sound@vger.kernel.org>; Fri,  4 Sep 2026 10:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788518522; cv=none; b=a3oEYSd5nUCpd0KpQUve2YVTt5F4t67AYjDLnmUwExIPGEQ0nMRfkIgonFPbd+LsBl2GCTxynXHz+8dSuIcbtS3bhvTsWNOtBIijr/D0AbAUPMUq675LXgdRkTS4o7CkbUiP3zXvxu8jgJ/XQ0Sy3DbIGtqTLD6aLWweaGvefBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788518522; c=relaxed/simple;
	bh=JEHLqHpRXGU+mk1wLlKD0iUGfaaE88EISpOVd7zKyQY=;
	h=From:To:Cc:Subject:Date:Message-Id; b=KuSXw8641kCC0A3rLc5aHNPhy1qvI3eqBO7LeB9dtrHWNGfke8m2aQXSay9pLAlq9CAHRA2ZwrpME+kqpyUJy6JzFgTNqsclprngGsWi32nJgMyDCjy3W3vzyTnht1i2cIFhdBP9tUuDGCD4z3O5qKz1ycSugeQ+OCAo5iBmV3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.36) with ESMTP
	id 6A9AA0670000570D; Fri, 4 Sep 2026 18:41:44 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 14FC4DC99E384753A0D82291B4B09D9E
X-SMAIL-UIID: 14FC4DC99E384753A0D82291B4B09D9E-20260904-184144
From: Zhang Yi <zhangyi@everest-semi.com>
To: linux-sound@vger.kernel.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH] ASoC: codecs: ES8389: Prevent enable_count underflow in clk_core_disable
Date: Fri,  4 Sep 2026 18:41:41 +0800
Message-Id: <20260904104141.3885-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

To prevent enable_count underflow in clk_core_disable,
I replaced the direct call to `es8389_set_bias_level(component, SND_SOC_BIAS_STANDBY);`
in the code with a helper function.

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/codecs/es8389.c | 34 ++++++++++++++++++++--------------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/es8389.c b/sound/soc/codecs/es8389.c
index 80efce3e0..2ea0c4052 100644
--- a/sound/soc/codecs/es8389.c
+++ b/sound/soc/codecs/es8389.c
@@ -812,6 +812,23 @@ static int es8389_pcm_hw_free(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static void es8389_standby(struct snd_soc_component *component)
+{
+	struct es8389_private *es8389 = snd_soc_component_get_drvdata(component);
+
+	regmap_update_bits(es8389->regmap, ES8389_ADC_HPF1, 0x0f, 0x04);
+	regmap_update_bits(es8389->regmap, ES8389_ADC_HPF2, 0x0f, 0x04);
+	regmap_write(es8389->regmap, ES8389_CSM_JUMP, 0xD4);
+	usleep_range(70000, 72000);
+	regmap_write(es8389->regmap, ES8389_ANA_CTL1, 0x59);
+	regmap_write(es8389->regmap, ES8389_ADC_EN, 0x00);
+	regmap_write(es8389->regmap, ES8389_CLK_OFF1, 0x00);
+	regmap_write(es8389->regmap, ES8389_RESET, 0x3E);
+	regmap_update_bits(es8389->regmap, ES8389_DAC_INV, 0x80, 0x80);
+	usleep_range(8000, 8500);
+	regmap_update_bits(es8389->regmap, ES8389_DAC_INV, 0x80, 0x00);
+}
+
 static int es8389_set_bias_level(struct snd_soc_component *component,
 			enum snd_soc_bias_level level)
 {
@@ -834,18 +851,7 @@ static int es8389_set_bias_level(struct snd_soc_component *component,
 	case SND_SOC_BIAS_PREPARE:
 		break;
 	case SND_SOC_BIAS_STANDBY:
-		regmap_update_bits(es8389->regmap, ES8389_ADC_HPF1, 0x0f, 0x04);
-		regmap_update_bits(es8389->regmap, ES8389_ADC_HPF2, 0x0f, 0x04);
-		regmap_write(es8389->regmap, ES8389_CSM_JUMP, 0xD4);
-		usleep_range(70000, 72000);
-		regmap_write(es8389->regmap, ES8389_ANA_CTL1, 0x59);
-		regmap_write(es8389->regmap, ES8389_ADC_EN, 0x00);
-		regmap_write(es8389->regmap, ES8389_CLK_OFF1, 0x00);
-		regmap_write(es8389->regmap, ES8389_RESET, 0x3E);
-		regmap_update_bits(es8389->regmap, ES8389_DAC_INV, 0x80, 0x80);
-		usleep_range(8000, 8500);
-		regmap_update_bits(es8389->regmap, ES8389_DAC_INV, 0x80, 0x00);
-
+		es8389_standby(component);
 		clk_disable_unprepare(es8389->mclk);
 		break;
 	case SND_SOC_BIAS_OFF:
@@ -1015,7 +1021,7 @@ static int es8389_suspend(struct snd_soc_component *component)
 {
 	struct es8389_private *es8389 = snd_soc_component_get_drvdata(component);
 
-	es8389_set_bias_level(component, SND_SOC_BIAS_STANDBY);
+	es8389_standby(component);
 	regcache_cache_only(es8389->regmap, true);
 	regcache_mark_dirty(es8389->regmap);
 
@@ -1084,7 +1090,7 @@ static int es8389_probe(struct snd_soc_component *component)
 
 	es8389->hpf_freq = ES8389_HPF_DEFAULT;
 	es8389_init(component);
-	es8389_set_bias_level(component, SND_SOC_BIAS_STANDBY);
+	es8389_standby(component);
 
 	return 0;
 }
-- 
2.17.1

