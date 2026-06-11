Received: from r3-212.sinamail.sina.com.cn (r3-212.sinamail.sina.com.cn [202.108.3.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8E92E7398
	for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 03:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781147924; cv=none; b=lsEjJhHA/8GM7cf95FhdEWGkdk2ex3GtVi9qIJVAeoKcUvmy00pc8U7jZ2nnP79wuLz8yfzvNd7zdHdCBgUqEyzxBS3+NBdUKh5HQsz+zFIC+6oeyrGLXfS1C4XR72ebJkL/4/WPgqoMHWerrn8OfWr19gUurGB91i+A0p5ix3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781147924; c=relaxed/simple;
	bh=wcuXqRZFARDZr0HdqZfZekYVkFYOJj3VFbZWolgB5c8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=VI6toAlxZkCgOT1hKYA+n9erXcgBZACusMYxXnXu/Yvlwtx1O3BlxO+l+hqsamhc/4BnYbooCWk2UDfiQ0N7TxvcGINaL5zJB0D2Tvsp1B6JapJr6iRrxguyB2ZJHm3WngGW1Rb1rDaf37YYasVo69VoHHVQCjSEwYqNezw3eE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.38) with ESMTP
	id 6A2A29030000377C; Thu, 11 Jun 2026 11:18:33 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: B459201F147348CCA1F3E6ADD24FF568
X-SMAIL-UIID: B459201F147348CCA1F3E6ADD24FF568-20260611-111833
From: Zhang Yi <zhangyi@everest-semi.com>
To: linux-sound@vger.kernel.org,
	broonie@kernel.org,
	devicetree@vger.kernel.org
Cc: tiwai@suse.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v1 6/7] ASoC: codecs: ES8389: Add private members related to HPF
Date: Thu, 11 Jun 2026 11:18:23 +0800
Message-Id: <20260611031824.4628-7-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260611031824.4628-1-zhangyi@everest-semi.com>
References: <20260611031824.4628-1-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

Add private members related to HPF.
And defines ES8389_HPF_DEFAULT

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/codecs/es8389.c | 18 ++++++++++++++++--
 sound/soc/codecs/es8389.h |  1 +
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/es8389.c b/sound/soc/codecs/es8389.c
index 284eb707f..2460cf977 100644
--- a/sound/soc/codecs/es8389.c
+++ b/sound/soc/codecs/es8389.c
@@ -36,6 +36,8 @@ struct	es8389_private {
 	unsigned int sysclk;
 	int mastermode;
 
+	u8 hpfl;
+	u8 hpfr;
 	u8 vddd;
 	bool mclk_src;
 	int version;
@@ -743,8 +745,8 @@ static int es8389_mute(struct snd_soc_dai *dai, int mute, int direction)
 			regmap_update_bits(es8389->regmap, ES8389_DAC_FORMAT_MUTE,
 						0x03, 0x00);
 		} else {
-			regmap_update_bits(es8389->regmap, ES8389_ADC_HPF1, 0x0f, 0x0a);
-			regmap_update_bits(es8389->regmap, ES8389_ADC_HPF2, 0x0f, 0x0a);
+			regmap_update_bits(es8389->regmap, ES8389_ADC_HPF1, 0x0f, es8389->hpfl);
+			regmap_update_bits(es8389->regmap, ES8389_ADC_HPF2, 0x0f, es8389->hpfr);
 			regmap_update_bits(es8389->regmap, ES8389_ADC_FORMAT_MUTE,
 						0x03, 0x00);
 		}
@@ -902,6 +904,18 @@ static int es8389_probe(struct snd_soc_component *component)
 
 	es8389->mclk_src = device_property_read_bool(component->dev, "everest,mclk-from-sclk");
 
+	ret = device_property_read_u8(component->dev, "everest,hpfl", &es8389->hpfl);
+	if (ret != 0) {
+		dev_dbg(component->dev, "hpfl return %d\n", ret);
+		es8389->hpfl = ES8389_HPF_DEFAULT;
+	}
+
+	ret = device_property_read_u8(component->dev, "everest,hpfr", &es8389->hpfr);
+	if (ret != 0) {
+		dev_dbg(component->dev, "hpfr return %d\n", ret);
+		es8389->hpfr = ES8389_HPF_DEFAULT;
+	}
+
 	for (i = 0; i < ARRAY_SIZE(es8389_core_supplies); i++)
 		es8389->core_supply[i].supply = es8389_core_supplies[i];
 	ret = devm_regulator_bulk_get(component->dev, ARRAY_SIZE(es8389_core_supplies), es8389->core_supply);
diff --git a/sound/soc/codecs/es8389.h b/sound/soc/codecs/es8389.h
index 7f1212219..81353dcec 100644
--- a/sound/soc/codecs/es8389.h
+++ b/sound/soc/codecs/es8389.h
@@ -105,6 +105,7 @@
 
 #define ES8389_MIC_SEL_MASK           (7 << 4)
 #define ES8389_MIC_DEFAULT            (1 << 4)
+#define ES8389_HPF_DEFAULT            (0x0A << 0)
 
 #define ES8389_MASTER_MODE_EN         (1 << 0)
 
-- 
2.17.1

