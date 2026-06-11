Received: from smtp153-177.sina.com.cn (smtp153-177.sina.com.cn [61.135.153.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91168305E28
	for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 03:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781147932; cv=none; b=JTR9tCgHZaFG9fO03r5z58IIvK03u12edbrUJYWaSH7lth3NWOe37SJRjz8/gW2/z0FLM/q4tSO8PlE1fiGRb/ucTeLILkYiv7d3XyLeAFR6VR/HlFRf9OMPhCsmgWai+D3GsSuKMncOEK83Hbm1cxYiPSR3MflP3+mgL7jLLbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781147932; c=relaxed/simple;
	bh=c+leJfx73jzkzij1Pal7RPbMNSiHXCdBuzTzmbcfVEc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=SkGO6c7jERdjHVTrTxWVO5Edtgs7pGj81fthXtRriAWZIeEyDfCW4GLD+PBh1jq2lt2TEIo2sjs2SnFRSpf8JgLXctrS0qIvRxRadBcOL0lpVj3LhQtTnwpNp3qyR6G+mImPCydP7MpDMy4v7aRwHGTzd7hz3PkGDJHgpBJeN2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=61.135.153.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.38) with ESMTP
	id 6A2A29030000377C; Thu, 11 Jun 2026 11:18:30 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 18E9FDDE5DD5441AAC588D819C359DA9
X-SMAIL-UIID: 18E9FDDE5DD5441AAC588D819C359DA9-20260611-111830
From: Zhang Yi <zhangyi@everest-semi.com>
To: linux-sound@vger.kernel.org,
	broonie@kernel.org,
	devicetree@vger.kernel.org
Cc: tiwai@suse.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v1 2/7] ASoC: codecs: ES8389: Modify volatile_register
Date: Thu, 11 Jun 2026 11:18:19 +0800
Message-Id: <20260611031824.4628-3-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260611031824.4628-1-zhangyi@everest-semi.com>
References: <20260611031824.4628-1-zhangyi@everest-semi.com>
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

