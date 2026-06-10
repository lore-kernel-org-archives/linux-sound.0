Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A6F3B38B1
	for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 10:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781086868; cv=none; b=pfeqNPdQbLFoHzRV6aVqIOCGxBG0zC2KuX45nOuiY6Z9On4zEMLE3BmHYxAlsxIyhoe9lM6YUjP37SfDaHD0/QDfu2zhKRrlN+RxkeCWC3m5qqFDAAEMi+p4/9kznGpa15hyzg2qQYMsfoN8Z0GpWEM/Ep2LV6ZibDMryTpRL/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781086868; c=relaxed/simple;
	bh=z2piZvL+mAaTAYZdczqHMzsCaYv/janICW5fPxWoyjA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aDCpzbDjLPAJJwzEx+TXCooaRSzs/pe4dscN6Kcb4bovvRU24d3Yf4cHWKefwlVG6A3FowQEQzn+L9U/99ASnwHRacQ32bNIFZiPM6duEA8m01LimXDzNBl1eYRoGoScP7Ih1yvE2crYr3z77Kii+dhgskMNzqe34aOiZv2nEw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K2IZVRVO; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K2IZVRVO"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c0c1e0b0faso45326335ad.0
        for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 03:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781086866; x=1781691666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6PfHdZyZ58+lAvtt9QURTlmXybxBjprQ5FeV+lzJh6Y=;
        b=K2IZVRVOqj+COv0SbmJ7yk0zYbPidm9/KYimjxAtqCWa0hMtfKdB0+4W92gy82OCek
         8wwAx2f2EEw5rUf4RJCqmrh8fmOGcw4pVLWJPVGKel4zIEZdV0Ud0/Upg5y2OTt+FeaQ
         qAjIImt7thDHlc3NjDjJAqp+Zyz4zhhg0zjJk9dFaiE9JQ7NQnPbvZU8tStDHMgj4a56
         wW2KZ57986BpU0/5L73nhxq9G2qb2rnDKUbYpGinDN1lSGb/SLdbz7OTgaw1RiimMx+u
         BDDdvqAn4SLY4XE7MQkghCePt30kcrYCb+c0gjgTlS+44PauY44s5nCo9W7KS1Qui5KH
         bHIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781086866; x=1781691666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6PfHdZyZ58+lAvtt9QURTlmXybxBjprQ5FeV+lzJh6Y=;
        b=V3rVihUNs8kYqqv3NVbRlBjn//iqF4R6Zw+ZSmxIADuyKWu2MM4JngVPFBqTTpXszU
         abgx8E8cYj/7xOvO6QB2vzyOz195Dke0Y0gFh57HLR6py20Ju9/SgtZD2dAZF9NhsJaD
         T1mFeSOFxB5jX1zIBggulLFrv2ggCwaDI8AbMZVneACMRZNcxyPKPF1vBxWFibdyVydf
         tB7wtdxYmOQ8Gg/c0zv4NFrNzYZUVGiDqgFpwcTwWKdfVqGRjRkdaT15iXE7a8v+FUWC
         sTlzkT8XNgeD1nwy1jKmAuqkwDP2WI37qHdcy4sJaylKMtrNjxxHeYZw+gWLlJ8u0pQ5
         PTZg==
X-Forwarded-Encrypted: i=1; AFNElJ/ACjNE6ZMDu4w0FNz4ozeZQCh2w4JHSeJ66Sr29UVVwBct+N16IHfbns6IAXcNQTdo8QTxENi8aWt+fw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAQCTt+e3qEobYJhTFq+ila2VWzYRIpxtNuzF/EXFwRNOzHdXG
	x1Iwi5CN0MvsMFOqkGMkBcr9Nwtj7DWCXYmPxrj5OF4bhKKOEVDRQs25
X-Gm-Gg: Acq92OHTdJBxX2Ehi/onCSt0R3ij889RXwINz/3kZA+L95W5b9JsDI7SRvuPab8zUA7
	1HSAaeZYQqR/HAq7w+WixdAhr/kVYaMAI2nmpuyN7wQojmeFXueOCdybNkL/toP9boWjg50i22D
	ubzspfqTA/2dTjiUZCasTgj5cqn720UO00Lvl/+4BNOHiR4tVs+G6MirrdbTeChMfxX4ul2OOGv
	KnjTt/eaDmFMhPkikCbQGoWJAyl+NL29sG8YMtRpuL9wJ2qElIu4gUchvxBpZVMEGp3YqjIowu3
	Wp8qQWJKBIsngXKcWN3k246NxHECTYSytStQOtfsWZeyKi4CjpLgt1zBdDbBaHP1nqHrZDPTOUk
	pV6m5K7YtR3EspjC4XR7D0PcQ9hWD/YcpeKmPWb2sOGRrOgbkouwx8Mm8QXRuE3Aa1mlw3Hjy6z
	hA2Mos7YQn8z216oUdTKjhwht/NkrXj1Fg6Ao4nEhOq6VXgh7QogQoab4G+zEnZW1dsDSC7b6IF
	vlJ3Mk=
X-Received: by 2002:a17:903:1209:b0:2c0:c3ac:4ae6 with SMTP id d9443c01a7336-2c1e810b983mr265633925ad.19.1781086866069;
        Wed, 10 Jun 2026 03:21:06 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f96b3fsm250133875ad.29.2026.06.10.03.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 03:21:05 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 06/10] ASoC: mediatek: mt8195: mt8195-afe-clk: Use guard() for spin locks
Date: Wed, 10 Jun 2026 17:20:17 +0700
Message-ID: <20260610102021.83273-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610102021.83273-1-phucduc.bui@gmail.com>
References: <20260610102021.83273-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 42 ++++++++++------------
 1 file changed, 18 insertions(+), 24 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
index f35318ae0739..618d8400913a 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
@@ -283,7 +283,6 @@ static int mt8195_afe_enable_apll_tuner(struct mtk_base_afe *afe,
 					unsigned int id)
 {
 	struct mt8195_afe_tuner_cfg *cfg = mt8195_afe_found_apll_tuner(id);
-	unsigned long flags;
 	int ret;
 
 	if (!cfg)
@@ -297,16 +296,14 @@ static int mt8195_afe_enable_apll_tuner(struct mtk_base_afe *afe,
 	if (ret)
 		return ret;
 
-	spin_lock_irqsave(&cfg->ctrl_lock, flags);
-
-	cfg->ref_cnt++;
-	if (cfg->ref_cnt == 1)
-		regmap_update_bits(afe->regmap,
-				   cfg->tuner_en_reg,
-				   cfg->tuner_en_maskbit << cfg->tuner_en_shift,
-				   1 << cfg->tuner_en_shift);
-
-	spin_unlock_irqrestore(&cfg->ctrl_lock, flags);
+	scoped_guard(spinlock_irqsave, &cfg->ctrl_lock) {
+		cfg->ref_cnt++;
+		if (cfg->ref_cnt == 1)
+			regmap_update_bits(afe->regmap,
+					   cfg->tuner_en_reg,
+					   cfg->tuner_en_maskbit << cfg->tuner_en_shift,
+					   1 << cfg->tuner_en_shift);
+	}
 
 	return 0;
 }
@@ -315,24 +312,21 @@ static int mt8195_afe_disable_apll_tuner(struct mtk_base_afe *afe,
 					 unsigned int id)
 {
 	struct mt8195_afe_tuner_cfg *cfg = mt8195_afe_found_apll_tuner(id);
-	unsigned long flags;
 	int ret;
 
 	if (!cfg)
 		return -EINVAL;
 
-	spin_lock_irqsave(&cfg->ctrl_lock, flags);
-
-	cfg->ref_cnt--;
-	if (cfg->ref_cnt == 0)
-		regmap_update_bits(afe->regmap,
-				   cfg->tuner_en_reg,
-				   cfg->tuner_en_maskbit << cfg->tuner_en_shift,
-				   0 << cfg->tuner_en_shift);
-	else if (cfg->ref_cnt < 0)
-		cfg->ref_cnt = 0;
-
-	spin_unlock_irqrestore(&cfg->ctrl_lock, flags);
+	scoped_guard(spinlock_irqsave, &cfg->ctrl_lock) {
+		cfg->ref_cnt--;
+		if (cfg->ref_cnt == 0)
+			regmap_update_bits(afe->regmap,
+					   cfg->tuner_en_reg,
+					   cfg->tuner_en_maskbit << cfg->tuner_en_shift,
+					   0 << cfg->tuner_en_shift);
+		else if (cfg->ref_cnt < 0)
+			cfg->ref_cnt = 0;
+	}
 
 	ret = mt8195_afe_disable_tuner_clk(afe, id);
 	if (ret)
-- 
2.43.0

