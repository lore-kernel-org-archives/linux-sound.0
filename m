Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C492D3EE1EE
	for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 10:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781086859; cv=none; b=aCujxbe3igK+1sHYct01ajvoaEnPOL14GbOX2iOjMTLCimx8Ndd3qEzNFVvAPUZneZvdDuzNUbKR0rrLtFjO7VPlLlsjSUPX7l11T0wTuJ67Ywy2aDNwI9kSWlZGK8sL9B4Lt/ZoRWTfjvKDT4m59WC1b/RNbUw/BCen//Nr5OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781086859; c=relaxed/simple;
	bh=GFuEUxUc113IL3PLMCauoqpBjPzqAuM/CYALRcyREmg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AZHBgBcY8U6nYbnpKZZ1h5apxuXr3eXyxZp7wZELWSyOV+ZRnWXi/wI5iGp09Tm1NHEKj35RUhryxpSFZKq7MSvlFoHhyfH5rK1qsbnidPGdk40RVaFdNHwlQbM6mYxptogtSDtK3T9TyE1Dx6dfRVGAzaGI3hE8VDjfM7TpyI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hklkRN3M; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hklkRN3M"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2c0bb4a94b8so55306975ad.2
        for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 03:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781086857; x=1781691657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GQ1CB1xaItZwOeJMb8jfEb8OFmetyjBrvgHBbV+tv7c=;
        b=hklkRN3M0YeSfzBRBSKiH9zBBf1nJkvLFiaw9KuUHtbSOKHLJR6o+ZCaAbc9ypT+5F
         hrug+/e4WbGDfuTHXbQJvVysnEbXmhnW7mAkgzRoHaLE+3h3fmkIaqqBEQTKsqDFNqoJ
         kISj17RICOF+dD+rOgqsYVqfCia1ElJh94EcAcqfCDdxVVn+6p66lPh2F6oQ9ggqAWdR
         pzRe3xuuhN8UnsSO4V6tGoPO1KlcGN71aAYyOtdraFtejLdFkgKV2gIrznnd3qZ0Fl2j
         d638RMjOTWwhqFZY72ntZRbprldRElFVEeoXGmE4jSl9rtt4SYIMTCoxAPy/QhzlBXDC
         CDTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781086857; x=1781691657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GQ1CB1xaItZwOeJMb8jfEb8OFmetyjBrvgHBbV+tv7c=;
        b=Y6en9zgLLWEZu19nfVn16V+13uLiQk5tznRWq09EjFf6Mx/FjImkTydcv8s+scQyBm
         f5BOb95/FZUa7poF+43aGFH7kea+9IS5Uv9UQI7UwLKJwZ0OqJuKbgBOT+8nGKNTw8a5
         tZuNKEQm7f4j55wxn2wc15GRLW12EOxi75cNGFTYO+e/rmjyAxarQ+HSXFHopdkZuJg+
         V+9YgeIpHDv9qAOZDmlMkpGn2jvEA20fJH4L/XQBayfl0dcqRbXVkinUPulb2JNj4/fg
         +2f6YRG86d8jI8BlRQcSjVilBlgPozit/xUcvLqDBfEIG8+9nRG+Ds12OHCQMAHi2A6D
         xPkw==
X-Forwarded-Encrypted: i=1; AFNElJ/uFEGwkyhi90OMVbGIaHJDXZQoGmv7yvv9HVaKP0ZK4c5vlgadtcbx23K74WXedl36elngLZ+24B69RQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkmtZBQmIu1hMuurO5fUqBFJDJDspNFKmlDAwNsxjAlwikADAK
	0gUH7DbYNFiVTRFzzUd7KYoa8Oi3s7vu/5HkdVCDSdlKhDi+ZEEA/cnX
X-Gm-Gg: Acq92OG335zL3xzFtJznF6qgkhEm3PWv3+0tvB3nkxZunLeYUnoKdeitCOtKoffUUb/
	RDYF/Qw1m18HZm0NvXoMGB/BBMbdyMKLt1z1NRTKniyNdbHUrF5ejH6OEP4XaLaxp7xfLYTgCd2
	Xz6BlVHJCrWVY+J+B4ZlO7COn2qS3hk6dsW1BrN5/FdVEktkYuGuTTUm41ekp8s1eEJAfo7Uvnm
	CQl3D+5OcWXrJ9aFBzALR3oL/TnK1FOJxBRDipZglb+fD2ncZjqziKf+8h7sKJS3dHsBMnXHdz9
	6pWcVmLU/dqANjfakTEIMcMQ1rAEkRHQrgoWQ4aSl7nd9NsKqZw2/fN68YTGZR57FmqK613hO5t
	G4BGAqXIv+bUlv+NXF07iLavizPxnh4e2nIsION3T783AwpEUrlYDtNrPt2ShjujpQIAxY32vUA
	++HCoZai1PfWsOVOvwqFR01GkKbayM1rOkFVt4dW69Lh/WFfGzIi60pXZ0vfLLmJ9WHHWw
X-Received: by 2002:a17:902:c40f:b0:2c2:bd0d:3cfa with SMTP id d9443c01a7336-2c2bd0d3f54mr41954845ad.11.1781086857182;
        Wed, 10 Jun 2026 03:20:57 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f96b3fsm250133875ad.29.2026.06.10.03.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 03:20:56 -0700 (PDT)
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
Subject: [PATCH 04/10] ASoC: mediatek: mt8188: mt8188-afe-clk: Use guard() for spin locks
Date: Wed, 10 Jun 2026 17:20:15 +0700
Message-ID: <20260610102021.83273-5-phucduc.bui@gmail.com>
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
 sound/soc/mediatek/mt8188/mt8188-afe-clk.c | 29 ++++++++--------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-clk.c b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
index 7f411b857782..fc6cb3f0469e 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
@@ -301,7 +301,6 @@ static int mt8188_afe_disable_tuner_clk(struct mtk_base_afe *afe,
 static int mt8188_afe_enable_apll_tuner(struct mtk_base_afe *afe, unsigned int id)
 {
 	struct mt8188_afe_tuner_cfg *cfg = mt8188_afe_found_apll_tuner(id);
-	unsigned long flags;
 	int ret;
 
 	if (!cfg)
@@ -315,8 +314,7 @@ static int mt8188_afe_enable_apll_tuner(struct mtk_base_afe *afe, unsigned int i
 	if (ret)
 		return ret;
 
-	spin_lock_irqsave(&cfg->ctrl_lock, flags);
-
+	guard(spinlock_irqsave)(&cfg->ctrl_lock);
 	cfg->ref_cnt++;
 	if (cfg->ref_cnt == 1)
 		regmap_update_bits(afe->regmap,
@@ -324,32 +322,27 @@ static int mt8188_afe_enable_apll_tuner(struct mtk_base_afe *afe, unsigned int i
 				   cfg->tuner_en_maskbit << cfg->tuner_en_shift,
 				   BIT(cfg->tuner_en_shift));
 
-	spin_unlock_irqrestore(&cfg->ctrl_lock, flags);
-
 	return 0;
 }
 
 static int mt8188_afe_disable_apll_tuner(struct mtk_base_afe *afe, unsigned int id)
 {
 	struct mt8188_afe_tuner_cfg *cfg = mt8188_afe_found_apll_tuner(id);
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
 
 	ret = mt8188_afe_disable_tuner_clk(afe, id);
 	if (ret)
-- 
2.43.0

