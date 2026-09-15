Received: from r3-212.sinamail.sina.com.cn (r3-212.sinamail.sina.com.cn [202.108.3.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C55D3CEBBD
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 02:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789439456; cv=none; b=GFcai67rKLZ7mun/Ez/di06T2m8va5fJW7hqr2JQvj3Gpv4iNz8edaQYmGgsCMOmP1RhL0T1lYv6Rb14mzKK2QAmD+KAX4PpWARLTsfkKRtSHn1kAMQ51EjV7baVGyPtskGzwBHqBCYwnXRCSJmlsup0PxvuWPCXjF9meZZ7MJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789439456; c=relaxed/simple;
	bh=KwlWzs6OAb4rhJtb6pPZvibniEDN44RlI2tvUW98zfA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=sGQGUpqtycW0kfNZhHEPo5zB6eQqEEs9rcnyV1btWNhm5iYi/kf9uxcvH+2Y7ae2sUx2DIBgrPlRUZB7ZvodDzdLF1VN543lL6QADy38uMniokLxP5GFogXNI99DxIxZYU9rTt0LPsIZ0PIiyqCRPWDnjOswTs0L8FA3H3+SP4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.38) with ESMTP
	id 6AA8ADB0000067D9; Tue, 15 Sep 2026 10:30:13 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 2B4F9E7A2CDE4622826C5702FE8CA90A
X-SMAIL-UIID: 2B4F9E7A2CDE4622826C5702FE8CA90A-20260915-103013
From: Zhang Yi <zhangyi@everest-semi.com>
To: linux-sound@vger.kernel.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v4 2/2] ASoC: codecs: ES8326: Adjust the standby configuration
Date: Tue, 15 Sep 2026 10:30:06 +0800
Message-Id: <20260915023006.22940-3-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260915023006.22940-1-zhangyi@everest-semi.com>
References: <20260915023006.22940-1-zhangyi@everest-semi.com>
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
index 30964aeb9..d522d254a 100644
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -820,7 +820,8 @@ static int es8326_set_bias_level(struct snd_soc_component *codec,
 	case SND_SOC_BIAS_PREPARE:
 		break;
 	case SND_SOC_BIAS_STANDBY:
-		regmap_write(es8326->regmap, ES8326_ANA_PDN, 0x3b);
+		regmap_write(es8326->regmap, ES8326_PGA_PDN, 0x58);
+		regmap_write(es8326->regmap, ES8326_ANA_PDN, 0x13);
 		regmap_update_bits(es8326->regmap, ES8326_CLK_CTL, 0x20, 0x00);
 		regmap_write(es8326->regmap, ES8326_SDINOUT1_IO, ES8326_IO_INPUT);
 		if (es8326->version > ES8326_VERSION_B) {
@@ -983,7 +984,7 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 	struct es8326_priv *es8326 =
 		container_of(work, struct es8326_priv, jack_detect_work.work);
 	struct snd_soc_component *comp = es8326->component;
-	unsigned int iface;
+	unsigned int iface, pga_status;
 
 	guard(mutex)(&es8326->lock);
 	iface = snd_soc_component_read(comp, ES8326_HPDET_STA);
@@ -1079,12 +1080,19 @@ static void es8326_jack_detect_handler(struct work_struct *work)
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

