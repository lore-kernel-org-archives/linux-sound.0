Received: from r3-129.sinamail.sina.com.cn (r3-129.sinamail.sina.com.cn [202.108.3.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3093F39A07D
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 08:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781771376; cv=none; b=QqH+ESn9ogph/hf0k8K2blIaUDd59pCAtwAPupDkYY78C4KvauEOb0930OgEoxLs6dWDb6UVUqclJZ6JIKBH0NmkdnwZvU63kHpV7BmkX1qhGnHvwRCBdtaid18ylUPCCX5e78GQemzc+0FQwLB+WuPI7tNqby7p3HKbf2B4S9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781771376; c=relaxed/simple;
	bh=c+leJfx73jzkzij1Pal7RPbMNSiHXCdBuzTzmbcfVEc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=rfuxiqH/Ijs/2h5QfdakJHA0Ff45blVw1aUnm9nBF5FE2OOJ0Q1/fKnbxh8y+nobtOOWNwE07oulGYWseV9lsJ7kbOyAqechKNofNeRtekuegi0odELkJRLmklNXE56ILblJyOIdyUJII9tttpwDngcGNyIHUIR1pxXNhWLyVLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.36) with ESMTP
	id 6A33AC4300004CAE; Thu, 18 Jun 2026 16:28:54 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 8E5695D0BB3C41AB9CD4141E4863B847
X-SMAIL-UIID: 8E5695D0BB3C41AB9CD4141E4863B847-20260618-162854
From: Zhang Yi <zhangyi@everest-semi.com>
To: linux-sound@vger.kernel.org,
	broonie@kernel.org,
	devicetree@vger.kernel.org
Cc: tiwai@suse.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v2 2/7] ASoC: codecs: ES8389: Modify volatile_register
Date: Thu, 18 Jun 2026 16:28:37 +0800
Message-Id: <20260618082842.2778-3-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260618082842.2778-1-zhangyi@everest-semi.com>
References: <20260618082842.2778-1-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

Mark some registers that are not volatile as false
And modified the logic for `cache_bypass` during `8389_resume`.

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/codecs/es8389.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/es8389.c b/sound/soc/codecs/es8389.c
index 449d9574b..be7a36f17 100644
--- a/sound/soc/codecs/es8389.c
+++ b/sound/soc/codecs/es8389.c
@@ -50,10 +50,29 @@ static const char * const es8389_core_supplies[] = {
 static bool es8389_volatile_register(struct device *dev,
 			unsigned int reg)
 {
-	if ((reg  <= 0xff))
-		return true;
-	else
+	switch (reg) {
+	case ES8389_ADCL_VOL:
+	case ES8389_ADCR_VOL:
+	case ES8389_MIC1_GAIN:
+	case ES8389_MIC2_GAIN:
+	case ES8389_DACL_VOL:
+	case ES8389_DACR_VOL:
+	case ES8389_ALC_ON:
+	case ES8389_ALC_CTL:
+	case ES8389_ALC_TARGET:
+	case ES8389_ALC_GAIN:
+	case ES8389_ADC_MUTE:
+	case ES8389_OSR_VOL:
+	case ES8389_DAC_INV:
+	case ES8389_MIX_VOL:
+	case ES8389_DAC_MIX:
+	case ES8389_ADC_RESET:
+	case ES8389_ADC_MODE:
+	case ES8389_DMIC_EN:
 		return false;
+	default:
+		return true;
+	}
 }
 
 static const DECLARE_TLV_DB_SCALE(dac_vol_tlv, -9550, 50, 0);
@@ -861,13 +880,13 @@ static int es8389_resume(struct snd_soc_component *component)
 	regcache_cache_only(es8389->regmap, false);
 	regcache_cache_bypass(es8389->regmap, true);
 	regmap_read(es8389->regmap, ES8389_RESET, &regv);
-	regcache_cache_bypass(es8389->regmap, false);
 
 	if (regv == 0xff)
 		es8389_init(component);
 	else
 		es8389_set_bias_level(component, SND_SOC_BIAS_ON);
 
+	regcache_cache_bypass(es8389->regmap, false);
 	regcache_sync(es8389->regmap);
 
 	return 0;
-- 
2.17.1

