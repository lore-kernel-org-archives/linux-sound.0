Received: from r3-78.sinamail.sina.com.cn (r3-78.sinamail.sina.com.cn [202.108.3.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037E937B40E
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 13:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789131837; cv=none; b=epSsqioPdFmCUs8IYSz+H8JxMOY4X5EbAkhug6j/cnT51/Hy6EWYYdFRvArtCJFAVfHiDNET7vIF+cg22ddcG++o5vKbgTk6PegxQPp5PlaAfj6/8D3YCbhbh868ws9lRLnNz5idhyMLpFFBYROHbOJrZ/Yxc4+ieIfF+H80kck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789131837; c=relaxed/simple;
	bh=gnWrzr4nTOkLq7mXxOC3yhltZCpa/iZQYaRQaKB4HUE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=M1GDM60YRLtREtroXEZmrn7rIIC+F7cg6aAs0GKJhJFSUqJe8cdEzjkH/YDjSFJxs8bT/8wxWRUeihasxbVbrm/rhGwPM5V6smyIs5ASzkcHri+NJqnv8dwLTxoGXh9UIsY7PlQLxlzO3eReZidev+V1lOgiYJFhWFUcR+bV5cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.37) with ESMTP
	id 6AA3FC2B00004A35; Fri, 11 Sep 2026 21:03:44 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: FA7D885E0D654A1498B2F5AEE3B76EDA
X-SMAIL-UIID: FA7D885E0D654A1498B2F5AEE3B76EDA-20260911-210344
From: Zhang Yi <zhangyi@everest-semi.com>
To: linux-sound@vger.kernel.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v1 2/2] ASoC: codecs: ES8326: Adjust the standby configuration
Date: Fri, 11 Sep 2026 21:03:37 +0800
Message-Id: <20260911130337.4058-3-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260911130337.4058-1-zhangyi@everest-semi.com>
References: <20260911130337.4058-1-zhangyi@everest-semi.com>
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

