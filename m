Received: from r3-144.sinamail.sina.com.cn (r3-144.sinamail.sina.com.cn [202.108.3.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22198472068
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 13:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789133339; cv=none; b=ASkYOUBBNAO4YUz3F672OrJP7Sv4EUrJ0GI/NoQbAVFN0e1gy1AFSXghVGRWJxFXERfYwQn8+n5oD5bQ1Suv7TDqj2cy4Paka2B3lGUn35lAyYBsUb40ZnVPfALpAIQoTz8aLs9e5cIzYe3m8L4Zom3D04oPP1Ktoa2vN7YFoSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789133339; c=relaxed/simple;
	bh=gnWrzr4nTOkLq7mXxOC3yhltZCpa/iZQYaRQaKB4HUE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=bbQGOJjGZ0V/Lr4dzsoyPzqhXbXM//bwnrFiAkzvbbEpYvPVv4I+cqYDkN65/M7c1X+ZYBafiFNC5YKHWJasoZcSet6LdqKUW1WK+j3LbTEdXZiWHntTIgZmIRa0XR1ePAZBMEADqdOOy1MCYfmBHOU7/HbIJ6tVSPBQCuGOHvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.36) with ESMTP
	id 6AA401EC00006365; Fri, 11 Sep 2026 21:28:15 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 076792D0A71347E8A86D1171EBE3EB70
X-SMAIL-UIID: 076792D0A71347E8A86D1171EBE3EB70-20260911-212815
From: Zhang Yi <zhangyi@everest-semi.com>
To: linux-sound@vger.kernel.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v3 2/2] ASoC: codecs: ES8326: Adjust the standby configuration
Date: Fri, 11 Sep 2026 21:28:09 +0800
Message-Id: <20260911132809.4478-3-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260911132809.4478-1-zhangyi@everest-semi.com>
References: <20260911132809.4478-1-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

Adjust the configuration in SND_SOC_BIAS_STANDBY for better
power consumption performance

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/codecs/es8326.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index 7bb16ef37..6fc72d82a 100644
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -818,7 +818,8 @@ static int es8326_set_bias_level(struct snd_soc_component *codec,
 	case SND_SOC_BIAS_PREPARE:
 		break;
 	case SND_SOC_BIAS_STANDBY:
-		regmap_write(es8326->regmap, ES8326_ANA_PDN, 0x3b);
+		regmap_write(es8326->regmap, ES8326_PGA_PDN, 0x58);
+		regmap_write(es8326->regmap, ES8326_ANA_PDN, 0x13);
 		regmap_update_bits(es8326->regmap, ES8326_CLK_CTL, 0x20, 0x00);
 		regmap_write(es8326->regmap, ES8326_SDINOUT1_IO, ES8326_IO_INPUT);
 		if (es8326->version > ES8326_VERSION_B) {
@@ -981,7 +982,7 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 	struct es8326_priv *es8326 =
 		container_of(work, struct es8326_priv, jack_detect_work.work);
 	struct snd_soc_component *comp = es8326->component;
-	unsigned int iface;
+	unsigned int iface, pga_status;
 
 	guard(mutex)(&es8326->lock);
 	iface = snd_soc_component_read(comp, ES8326_HPDET_STA);
@@ -1077,12 +1078,19 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 			dev_dbg(comp->dev, "Headset detected\n");
 			snd_soc_jack_report(es8326->jack,
 					SND_JACK_HEADSET, SND_JACK_HEADSET);
-			regmap_update_bits(es8326->regmap, ES8326_PGA_PDN,
-					0x08, 0x08);
-			regmap_write(es8326->regmap, ES8326_ADC1_SRC, 0x00);
-			regmap_write(es8326->regmap, ES8326_ADC2_SRC, 0x00);
-			regmap_update_bits(es8326->regmap, ES8326_PGA_PDN,
-					0x08, 0x00);
+			pga_status = snd_soc_component_read(comp, ES8326_PGA_PDN);
+
+			if ((pga_status & 0x08) >> 3) {
+				regmap_write(es8326->regmap, ES8326_ADC1_SRC, 0x00);
+				regmap_write(es8326->regmap, ES8326_ADC2_SRC, 0x00);
+			} else {
+				regmap_update_bits(es8326->regmap, ES8326_PGA_PDN,
+						0x08, 0x08);
+				regmap_write(es8326->regmap, ES8326_ADC1_SRC, 0x00);
+				regmap_write(es8326->regmap, ES8326_ADC2_SRC, 0x00);
+				regmap_update_bits(es8326->regmap, ES8326_PGA_PDN,
+						0x08, 0x00);
+			}
 			usleep_range(10000, 15000);
 		}
 	}
-- 
2.17.1

