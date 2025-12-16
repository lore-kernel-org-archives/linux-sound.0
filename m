Received: from mail78-37.sinamail.sina.com.cn (mail78-37.sinamail.sina.com.cn [219.142.78.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28AC0321442
	for <linux-sound@vger.kernel.org>; Tue, 16 Dec 2025 06:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=219.142.78.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765867692; cv=none; b=Hd7UsRwkZ31QKpwrGftxSWzZq3RfiiBqg2Sngn/3PijrZhbafK8weFjPVz4nvmmjCkmnA0+6LMwgxn4XuxTXtRlLb/xdFnVMFcbmk3N/0C7v4xh95lPB87RvUsqBYTCJZ0bHodkVBngqmFWQ6K5HTEaWOooQJ+BRvRtihwUqHLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765867692; c=relaxed/simple;
	bh=RHjjs+V1lz+loCxXdRMmceuBQPvBGqZQp/Y275PJu70=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=ZxAjisXdE1ILs7OMqEhcXrbA1wibDj3/aqCPAcKqpdJHelp9GWzobBygmrjP+pyEUSvRMB9DsUxa+EARZb186gzJAv5QyYNE+lhn/SBj6c+ZHtyJkrgMTzHzm9tZl4WP3ap2I3znuHvfvZFXtuDAXp36O3LnK5vUMB9eauNpUq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=219.142.78.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.154.36.64])
	by sina.net (10.185.250.31) with ESMTP
	id 6941007B00005785; Tue, 16 Dec 2025 14:47:26 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: D73B5C311B554F068747B58D71D871E0
X-SMAIL-UIID: D73B5C311B554F068747B58D71D871E0-20251216-144726
From: Zhang Yi <zhangyi@everest-semi.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	perex@perex.cz
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH 1/2] ASoC: codecs: ES8326: Add a kcontrol for PGAGAIN
Date: Tue, 16 Dec 2025 14:47:20 +0800
Message-Id: <20251216064721.4622-2-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251216064721.4622-1-zhangyi@everest-semi.com>
References: <20251216064721.4622-1-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

set a kcontrol to control bit 7 of ES8326_PGAGAIN
instead of setting a fixed value in the driver

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/codecs/es8326.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index 78c4e68f6002..77af50eea27d 100755
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -245,6 +245,7 @@ static const struct snd_kcontrol_new es8326_snd_controls[] = {
 			 adc_vol_tlv),
 	SOC_DOUBLE_TLV("ADC PGA Volume", ES8326_ADC_SCALE, 4, 0, 5, 0, adc_pga_tlv),
 	SOC_SINGLE_TLV("ADC PGA Gain Volume", ES8326_PGAGAIN, 0, 10, 0, adc_analog_pga_tlv),
+	SOC_SINGLE("ADC PGA SE Switch", ES8326_PGAGAIN, 7, 1, 0),
 	SOC_SINGLE_TLV("ADC Ramp Rate", ES8326_ADC_RAMPRATE, 0, 0x0f, 0, softramp_rate),
 	SOC_SINGLE("ALC Capture Switch", ES8326_ALC_RECOVERY, 3, 1, 0),
 	SOC_SINGLE_TLV("ALC Capture Recovery Level", ES8326_ALC_LEVEL,
@@ -934,11 +935,8 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 			dev_dbg(comp->dev, "Headset detected\n");
 			snd_soc_jack_report(es8326->jack,
 					SND_JACK_HEADSET, SND_JACK_HEADSET);
-
 			regmap_update_bits(es8326->regmap, ES8326_PGA_PDN,
 					0x08, 0x08);
-			regmap_update_bits(es8326->regmap, ES8326_PGAGAIN,
-					0x80, 0x80);
 			regmap_write(es8326->regmap, ES8326_ADC1_SRC, 0x00);
 			regmap_write(es8326->regmap, ES8326_ADC2_SRC, 0x00);
 			regmap_update_bits(es8326->regmap, ES8326_PGA_PDN,
-- 
2.17.1

