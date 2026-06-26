Received: from r3-51.sinamail.sina.com.cn (r3-51.sinamail.sina.com.cn [202.108.3.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258583E9281
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 11:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782473823; cv=none; b=VXaMx5s4KyxNtLQxxDamGwmbXjEBKqOcKp/sDp1bW2x3x2i7agdLJl7K6hBh7AmiLm5oE2n1zmpqvcQltLjA0+XPuuXCyCV38Va8H82Bhpg8CIeu+h97C7ykO3sWo56qcCLMbSyUsVy6SNhpGT+HYo0hOTBWpjetFL3nhod98YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782473823; c=relaxed/simple;
	bh=c+leJfx73jzkzij1Pal7RPbMNSiHXCdBuzTzmbcfVEc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=jGFsJq85FxqLhroWtGJO4qUKFTo832m3ZxAlMxoHyG9gKoTLQKeNtACMj3J9F5N2TLIjhhFvZfDgWJpdlmXc8exfLkOvvXfYv9EccVyHtmJXjk54SjxBp4SL+gjfYctET+yGqPrh9KzayfABt4BgQRZXC5tS60hRxju0qmSeqzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.37) with ESMTP
	id 6A3E6431000068D5; Fri, 26 Jun 2026 19:36:20 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 0009E42119FA410A8816C5D4159AE111
X-SMAIL-UIID: 0009E42119FA410A8816C5D4159AE111-20260626-193620
From: Zhang Yi <zhangyi@everest-semi.com>
To: linux-sound@vger.kernel.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v3 1/6] ASoC: codecs: ES8389: Modify volatile_register
Date: Fri, 26 Jun 2026 19:36:09 +0800
Message-Id: <20260626113614.27893-2-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260626113614.27893-1-zhangyi@everest-semi.com>
References: <20260626113614.27893-1-zhangyi@everest-semi.com>
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

