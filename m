Received: from r3-82.sinamail.sina.com.cn (r3-82.sinamail.sina.com.cn [202.108.3.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA1347209C
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 11:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789039266; cv=none; b=UfFFpwwQgiv1tc9avs7U0kjtsSvDLVCKB5ZGEkM5wWuO8Wq6VSrSvrrFxz6JPd1657Le6i7HnlBCK4aNbj/fjhlx8BkMMOYUMDh5YEfq5Bhh0swT2WHbTLfyOU4H6zHz8p42TbyQfccJsWg5tDvP13JtjtcppjtVkq/pgwj6Yzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789039266; c=relaxed/simple;
	bh=pbKyBRqOhSmd98BNE2rjVkbCW8phSr8dQGbul551n2E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=X1mt1JfQIlJBh7KFu5xcNC0qvM4oHz6c8WV7tknuf2GMTQcRr3Rucm0ehvupZQaC+4SYBxyjJboVC6Jlbg86ppomtVxYNxwIFmUEv6ESagLMjTuRRBCKVpuIFd2LT9gRygKDziWHLb5amdEpI2jed4jtyyu4fhugMUeY/ukbN7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.37) with ESMTP
	id 6AA2920700005D89; Thu, 10 Sep 2026 19:18:34 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 0B6631D7A4554809A0D6E0AF4421A587
X-SMAIL-UIID: 0B6631D7A4554809A0D6E0AF4421A587-20260910-191834
From: Zhang Yi <zhangyi@everest-semi.com>
To: linux-sound@vger.kernel.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH 2/2] ASoC: codecs: ES8326: Adjust the standby configuration
Date: Thu, 10 Sep 2026 19:18:28 +0800
Message-Id: <20260910111828.28027-3-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260910111828.28027-1-zhangyi@everest-semi.com>
References: <20260910111828.28027-1-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

Adjust the configuration in SND_SOC_BIAS_STANDBY for better
power consumption performance

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/codecs/es8326.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index d016b79a8..668c9b782 100644
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -821,7 +821,8 @@ static int es8326_set_bias_level(struct snd_soc_component *codec,
 	case SND_SOC_BIAS_PREPARE:
 		break;
 	case SND_SOC_BIAS_STANDBY:
-		regmap_write(es8326->regmap, ES8326_ANA_PDN, 0x3b);
+		regmap_write(es8326->regmap, ES8326_PGA_PDN, 0x58);
+		regmap_write(es8326->regmap, ES8326_ANA_PDN, 0x13);
 		regmap_update_bits(es8326->regmap, ES8326_CLK_CTL, 0x20, 0x00);
 		regmap_write(es8326->regmap, ES8326_SDINOUT1_IO, ES8326_IO_INPUT);
 		if (es8326->version > ES8326_VERSION_B) {
@@ -984,7 +985,7 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 	struct es8326_priv *es8326 =
 		container_of(work, struct es8326_priv, jack_detect_work.work);
 	struct snd_soc_component *comp = es8326->component;
-	unsigned int iface;
+	unsigned int iface, pga_status;
 
 	guard(mutex)(&es8326->lock);
 	iface = snd_soc_component_read(comp, ES8326_HPDET_STA);
@@ -1078,14 +1079,19 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 					SND_JACK_HEADPHONE, SND_JACK_HEADSET);
 		} else {
 			dev_dbg(comp->dev, "Headset detected\n");
-			snd_soc_jack_report(es8326->jack,
-					SND_JACK_HEADSET, SND_JACK_HEADSET);
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

