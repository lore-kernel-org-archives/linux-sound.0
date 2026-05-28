Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFDC403138
	for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 17:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779990541; cv=none; b=Ucr1p0PznljYZDuc2fHLkAwEJ9kz2PScSDs9J7++Giic12gQDUmLXtvP/9gq5WO1VEQup6nDM/pxOCcdMcAZrBjYHZIXWrZ+UEDKc8be+UbTodjB6ZwksS5F50BdW0QcZrVjkPY3+mlcIwy6fV6M8RjsVjh/5QeEZqEfcbj61D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779990541; c=relaxed/simple;
	bh=SC2mZnDsiwRhE1VAHS/s0aXYO5xOgQW8rsM0NY9nRGA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kposf6bh8qNi72LRbdIBv/l2y7BAMb/Z3o/fTvSBnd3rCoIJWR2n8E6Nk+dMjA9MS0CPJybCgdtMZm16CCv1M/6ocToQPe1asoJsvQGRc/fDBGlU3OHG2mE77RKPPuSG9CedOVucKmm5nneFpF88Hed1Afr4kqhiG58qPKbdbKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YKuSWQ0C; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YKuSWQ0C"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so136485865e9.0
        for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 10:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779990536; x=1780595336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=90iZe+Vt3FO3EhRu8PaahonsZT35J6uAqMQ+RMLFCOI=;
        b=YKuSWQ0C1BYy7HCgg5kG+4kVUkMubSRbCn1J7j/3cUX76dncZwqekcO8Ts6fTx4Hi5
         D8Ih3B4xJYsLRAv8bcUobhaJtlcryFjoR+PZdJxEcVpqHrG3L0tp3iHdQt4ipv9dJLzG
         uF6UEoduy5vJcccBQgBEIU37TzdQDFJproJcQkkptzOwwwh6Nf3svqRHkB3Hv9q400Cq
         VMA1hfj6hlJQoNOa9ExBMo7AW+yVD5spxJxijuhNvkBJ0pKcSiZttsAfin5oqEAD9PGR
         kqafDukLineJ11zDMzyRGrRu09MOpGc9NHaaHmNk+oUzhukwLwnNsF01qIgVKkiq51Mh
         pGgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779990536; x=1780595336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=90iZe+Vt3FO3EhRu8PaahonsZT35J6uAqMQ+RMLFCOI=;
        b=Q1Hz4FW8Pci+lyiIEha7EXSTQJ+2LFU/phnzxhrGW8AxkvDlieXHDHem512S8pDCYO
         ummEUA82Pmt7e5dMpiVgvKEvuMggLbIbF3hMMb2S4bBTuV3aqOozpkoRe8XYn9Hfj5+S
         kSiCNkrgPRS828eFZf3XOumPG2UzvVgtFbbR5lv5ckUSIG+iawU4JiiHr8Q2QWUHSp9L
         6jrbI2HKhII/xgj3d1XdCJM1bVstO8Gsvj0e1SRTnYaAqANtYl2day3VTZMk79BdY9WM
         sHPw06vbP9E1TJARdJ3llth/W58G4Dq8UyOy8pe599XfZSFuxcRP3cjWCd1vSdNRuR/n
         0s3w==
X-Forwarded-Encrypted: i=1; AFNElJ94kc3n3ZJ7TM1gs2EeVHv05oHjw3O+8bMPtcGnJAXSysGxNZfF7GRvfHs/lCsbBHPeO3u1Xq54gEAppw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2nJS841osmSTw/fETEA5e2w7MoS5shvQbBHIJEaVDtqsJn0pC
	2DPjbKXtfZkeWXDbp14CxE1pxNHtPKKnWpfrdbJrF/LPXrH7yH6AzIAq
X-Gm-Gg: Acq92OF8psRTz+18rNnL/rDeUrpHkyrOmJTdv21IkpM6ZbkMyRG4iUP6YJXLgWzLrxp
	gvsV3K7wkv8Y24rvBA01zXrvqRQGj3tPKas6qTOM1sVfHBJUvInqMeNSTOdswW1nRopaZblUTWf
	h3rZt/le5CDAsmKYieYpA26JkihRErUgCUyvEPx/AdLmF8M7e4lzWPIhW72+BvdjATQUILTybQA
	ksRU8snME34EY2c3z/kq9Txtu5I1XCC2t3S0H2CLI4n/7+CJJaTN8L62NPHNndOFxjQ2wb/6xgj
	UJJ6G3IvZCFJmHtBElME2xyuNBXMV93BCG+E0YRCK499pVQmii+j+im331Fy1MGQ1xVjaBOmnU3
	yqJwysvJ3h6C3gTnlTbMhsIk9hM7NsfBEgrHOIVEOQ2CO3MaQC+ggTbfG0YyTqpd4SJrbTWEK7j
	kvg3nyfvcSQQ1IWnPkUsQRChthvxZvK9CtR8/5r8JZ3t2ikH9v7RIciHdzOqPUp0Ocz6IiRnLgL
	3d8UYs=
X-Received: by 2002:a05:600c:8692:b0:490:3fa2:1b93 with SMTP id 5b1f17b1804b1-490424b0e35mr303367145e9.13.1779990535640;
        Thu, 28 May 2026 10:48:55 -0700 (PDT)
Received: from Ansuel-XPS24 (host-79-42-252-49.retail.telecomitalia.it. [79.42.252.49])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4909235d4e5sm75342625e9.2.2026.05.28.10.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 10:48:55 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 3/4] ASoC: mediatek: common: permit to provide dedicated regmap for irq
Date: Thu, 28 May 2026 19:48:31 +0200
Message-ID: <20260528174840.28644-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260528174840.28644-1-ansuelsmth@gmail.com>
References: <20260528174840.28644-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some SoC might require dedicated regmap to configure some specific IRQ
register.

Add an extra entry in the irq_data struct and use the specific regmap if
defined.

If not defined then the global AFE regmap is used instead.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 sound/soc/mediatek/common/mtk-afe-fe-dai.c | 14 +++++++++-----
 sound/soc/mediatek/common/mtk-base-afe.h   |  2 ++
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-fe-dai.c b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
index 3809068f5620..a8f4e70c8213 100644
--- a/sound/soc/mediatek/common/mtk-afe-fe-dai.c
+++ b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
@@ -204,11 +204,15 @@ int mtk_afe_fe_trigger(struct snd_pcm_substream *substream, int cmd,
 	struct mtk_base_afe_irq *irqs = &afe->irqs[memif->irq_usage];
 	const struct mtk_base_irq_data *irq_data = irqs->irq_data;
 	unsigned int counter = runtime->period_size;
+	struct regmap *regmap = afe->regmap;
 	int fs;
 	int ret;
 
 	dev_dbg(afe->dev, "%s %s cmd=%d\n", __func__, memif->data->name, cmd);
 
+	if (irq_data->regmap)
+		regmap = irq_data->regmap;
+
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
@@ -220,7 +224,7 @@ int mtk_afe_fe_trigger(struct snd_pcm_substream *substream, int cmd,
 		}
 
 		/* set irq counter */
-		mtk_regmap_update_bits(afe->regmap, irq_data->irq_cnt_reg,
+		mtk_regmap_update_bits(regmap, irq_data->irq_cnt_reg,
 				       irq_data->irq_cnt_maskbit, counter,
 				       irq_data->irq_cnt_shift);
 
@@ -230,12 +234,12 @@ int mtk_afe_fe_trigger(struct snd_pcm_substream *substream, int cmd,
 		if (fs < 0)
 			return -EINVAL;
 
-		mtk_regmap_update_bits(afe->regmap, irq_data->irq_fs_reg,
+		mtk_regmap_update_bits(regmap, irq_data->irq_fs_reg,
 				       irq_data->irq_fs_maskbit, fs,
 				       irq_data->irq_fs_shift);
 
 		/* enable interrupt */
-		mtk_regmap_update_bits(afe->regmap, irq_data->irq_en_reg,
+		mtk_regmap_update_bits(regmap, irq_data->irq_en_reg,
 				       1, 1, irq_data->irq_en_shift);
 
 		return 0;
@@ -248,10 +252,10 @@ int mtk_afe_fe_trigger(struct snd_pcm_substream *substream, int cmd,
 		}
 
 		/* disable interrupt */
-		mtk_regmap_update_bits(afe->regmap, irq_data->irq_en_reg,
+		mtk_regmap_update_bits(regmap, irq_data->irq_en_reg,
 				       1, 0, irq_data->irq_en_shift);
 		/* and clear pending IRQ */
-		mtk_regmap_write(afe->regmap, irq_data->irq_clr_reg,
+		mtk_regmap_write(regmap, irq_data->irq_clr_reg,
 				 1 << irq_data->irq_clr_shift);
 		return ret;
 	default:
diff --git a/sound/soc/mediatek/common/mtk-base-afe.h b/sound/soc/mediatek/common/mtk-base-afe.h
index a406f2e3e7a8..76d010f853f4 100644
--- a/sound/soc/mediatek/common/mtk-base-afe.h
+++ b/sound/soc/mediatek/common/mtk-base-afe.h
@@ -87,6 +87,8 @@ struct mtk_base_irq_data {
 	int irq_clr_reg;
 	int irq_clr_shift;
 	int irq_status_shift;
+
+	struct regmap *regmap;
 };
 
 struct device;
-- 
2.53.0

