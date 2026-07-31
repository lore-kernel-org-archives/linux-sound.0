Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82CE364931
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 06:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785480228; cv=none; b=MrDm4C19XsbAHUwcRe2Ug2ve/KSFLTLeT86Aooha688eva8jz8L2NsZn6SGHaYZzJ+OrwJekV+VZyA12K7GQ0oi2cs5/8Q9477xYbkEEyS2CthrGkIXj5oOV9Jfhw243N4856+0skLqRCyN8rdkxIWsCq0XFd03+9LKEiO265qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785480228; c=relaxed/simple;
	bh=8rbg7XEDRe3Fi8PbDWy9idBygflmV+gM2SBEm4X0/Rs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JYlSkN1Vwrj1GgL8IZwTkFcbOu7t4S3e5VagNpbnhnvvmhQWQdTYLnL5NDO4mSU/NTkISXJ1ng549SC3SOVCl1crAULtJZcLWG0FnDlK0bjrWbJJhlWwRuJpjOVc+0ZmNO0mqf3n8CV5ZyzsZaILvY3I0sRBr1fdD18OiDVIj2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TphNqI7b; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TphNqI7b"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-476a130c138so700324f8f.0
        for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 23:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785480225; x=1786085025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Yn5SGXWGzU7jg3uvtllcPlKx+PMxc5UfNcEyZfO4D+0=;
        b=TphNqI7bMB8dKN/6VEmNIoR/FVV8B7liSE90RgADsA/oDwY3XGs0WxJ6t38dCTNxcP
         XXk5t0O5I4G6thHW3cLiTTfIgUq+iLiHt9x8Hd02S5gUsUiW5NTZ6ulJ4yt2YiZyU579
         apt3qbCEH4JWUrWAkD0BsGCuAUmSdJKKWVuEXvw3Zf64D4BaJAeOghXCeoEyuVFz+CM1
         7cnTgPEy33luHJiuktvUpUOpEnx/imbwk6IefDf7Er8R7BPGDBxtT+i2gLdIm3U8gQB1
         6eWti7hhiJIA74WZ8fFBumeaQ3kpr3nKkCctf0fmfUQBbVqeoAhmV+SrYGAXehP/SKbs
         +giQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785480225; x=1786085025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Yn5SGXWGzU7jg3uvtllcPlKx+PMxc5UfNcEyZfO4D+0=;
        b=ag0ka+U34phh3k6f2K1iotgiFF7q2awxHhQPVqM3+ug9o2PqBMfTMjBVOYHLbJApPJ
         bvtDQCYJ4uS8jnZCUSAoZUxee4uef+JscGttWdmxTDFS17FDTN8sQqdYmfgGCud+5r1w
         3E986AwlCoFjjQQGSnCGMsTPya371e4ka+AFv1EC8spn5+78+z8UiWCrBoV/JyFYWifo
         piv7abwNWEigOekv1Oqdi4u275iBUiVwYWi4FTOJM4GYoHK7jln9x5Y+g5NLBkPPMWSV
         G8rb5Dn3abAoVbGUeHmcFRSO2+WbLU5s2qFkapLY4HC3XeDv8RMDcp8PeqcMKmma78ni
         KV5w==
X-Forwarded-Encrypted: i=1; AHgh+RqDjSdLKbLM2qgF+8/Ylv8ka1xUYrKINzyfPxSvNvrf26daM7+gqB46A6GnZ5FQ8tI/K0ATQpj7F/x7kA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwOvjqZAnjn1LskfQYkBrZ+ySyjTWgDFUKlWHXioNqgNCLY4EV
	vaAUVNEvVNDCj23kprrkSwqf8e9Y/avmNG+MEWaPqRZ6t0o23ey19orn
X-Gm-Gg: AR+sD13eCdPnTxJFpGUZmottqHnyVKdwrteGUMEDZkBtnbL7kO1DxogrhKnyNxNn0OJ
	uFr95paJ2QZmzDAPuTzfwPK64ph35+PdTk6PavlaeTl1ngo2zHrfPmgqOtO4j8TcTfMVWD/gAYy
	o62/2vA7LsLDgTjOaILZyUkvekMLKrVDy/CAHrgf42lOXafvZFrmo2IZBkCXxjrStJW9sxlZXfs
	kdw70CBG/DlBeFCTHSsWeKy26mEcBtOOPBEM/Wt2SnN2HqLyrB12bdxN5esJQJl5yZxTTf06e4S
	hP1wM5ZefX7yDGIZACUiDdcbx52G2Irp6XlgPFDPw3nlStUVcwDCpQSs0Z6rjc4+iAn+8VQudWs
	uEYpKpkdrLtnGnkfU/2f66Sf62tNkqgk+xdPIilV5d8moxlHeor39yQoF778VZgiTeMwMUBpWY2
	h1NSteibxUcA9cPYzClLN+VCeA5hUNe3aDG8UkwHNLHSLtJQ+4AQ2AJEW5TalzUIfEw8HrGJ0jd
	chX0twWC86LKDgl/SP62qUbIiqYPfyjf7aGleUS7BELdsv9xDgNHQ==
X-Received: by 2002:a05:6000:2504:b0:47f:7c50:2222 with SMTP id ffacd0b85a97d-47fd2adcf89mr1876494f8f.24.1785480225025;
        Thu, 30 Jul 2026 23:43:45 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-11-254-126.retail.telecomitalia.it. [87.11.254.126])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47fd41cfdc6sm1372488f8f.8.2026.07.30.23.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 23:43:44 -0700 (PDT)
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
	Darren Ye <darren.ye@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Rosen Penev <rosenp@gmail.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 3/4] ASoC: mediatek: common: permit to provide dedicated regmap for irq
Date: Fri, 31 Jul 2026 08:43:23 +0200
Message-ID: <20260731064326.2284228-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260731064326.2284228-1-ansuelsmth@gmail.com>
References: <20260731064326.2284228-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some SoC might require dedicated regmap to configure some specific IRQ
register.

Add an extra entry in the base_afe_irq struct and use the specific regmap if
defined.

If not defined then the global AFE regmap is used instead.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 sound/soc/mediatek/common/mtk-afe-fe-dai.c | 14 +++++++++-----
 sound/soc/mediatek/common/mtk-base-afe.h   |  2 ++
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-fe-dai.c b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
index 2a20fa5dba49..948f606cbaf2 100644
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
 
+	if (irqs->regmap)
+		regmap = irqs->regmap;
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
index a406f2e3e7a8..b5300c9ed415 100644
--- a/sound/soc/mediatek/common/mtk-base-afe.h
+++ b/sound/soc/mediatek/common/mtk-base-afe.h
@@ -153,6 +153,8 @@ struct mtk_base_afe_memif {
 struct mtk_base_afe_irq {
 	const struct mtk_base_irq_data *irq_data;
 	int irq_occupyed;
+
+	struct regmap *regmap;
 };
 
 struct mtk_base_afe_dai {
-- 
2.53.0

