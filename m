Received: from r3-74.sinamail.sina.com.cn (r3-74.sinamail.sina.com.cn [202.108.3.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D077B3BAD95
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 11:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782473823; cv=none; b=GbzLdXjnAQs/xTkJYZX65rJHnamAPi1ryuqXpohjbqjvhGna4uJ1DzOeZyuUd5DhO6vL9X9Z+7Si3NXHdbBb4C3bmz8b5QbNlTR4D6NbFK5U+g9m/fYNnTDn2RBFiYghzkaQieCyX/jAlOFM+3s8s2pBL/64CuCM8CmvZy1T1/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782473823; c=relaxed/simple;
	bh=bCchkJtR+CPooMEuvI/ETK/NSwMSRGEW/IV3TAM5FJU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=Q/dKfpfjUGfIyoGq/fQC8x7nPzxmmNJyT06u3rB956KM00WFfqtIlve9MZYQdOU5AWCcoh7RfGOYhmcNXodF/Py3oUlIgI6hpJ111WOVmgVp6YZHdIeJnr0m9Ql41PFyINe7s86/oHGAYtoFhcAYNGIIFeaIzqiteD3ROiNnT+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.37) with ESMTP
	id 6A3E6431000068D5; Fri, 26 Jun 2026 19:36:21 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 27744E615B174DDF9D82704D74EF85FA
X-SMAIL-UIID: 27744E615B174DDF9D82704D74EF85FA-20260626-193621
From: Zhang Yi <zhangyi@everest-semi.com>
To: linux-sound@vger.kernel.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v3 2/6] ASoC: codecs: ES8389: Fix the issue about mclk_src
Date: Fri, 26 Jun 2026 19:36:10 +0800
Message-Id: <20260626113614.27893-3-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260626113614.27893-1-zhangyi@everest-semi.com>
References: <20260626113614.27893-1-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

Fix the issue with incorrect modifications to mclk_src
When the system needs to be configured to use the MCLK from the SCLK pin,
the code still sets the relevant registers to use the MCLK from the MCLK pin

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/codecs/es8389.c | 26 +++++++++++++++-----------
 sound/soc/codecs/es8389.h |  8 +++++---
 2 files changed, 20 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/es8389.c b/sound/soc/codecs/es8389.c
index be7a36f17..6834508ee 100644
--- a/sound/soc/codecs/es8389.c
+++ b/sound/soc/codecs/es8389.c
@@ -609,7 +609,7 @@ static int es8389_pcm_hw_params(struct snd_pcm_substream *substream,
 
 	if (es8389->mclk_src == ES8389_SCLK_PIN) {
 		regmap_update_bits(es8389->regmap, ES8389_MASTER_CLK,
-					ES8389_MCLK_SOURCE, es8389->mclk_src);
+					ES8389_MCLK_MASK, ES8389_MCLK_FROM_SCLK);
 		es8389->sysclk = params_channels(params) * params_width(params) * params_rate(params);
 	}
 
@@ -912,17 +912,21 @@ static int es8389_probe(struct snd_soc_component *component)
 	}
 
 	es8389->mclk = devm_clk_get_optional(component->dev, "mclk");
-	if (IS_ERR(es8389->mclk))
-		return dev_err_probe(component->dev, PTR_ERR(es8389->mclk),
-			"ES8389 is unable to get mclk\n");
-
-	if (!es8389->mclk)
-		dev_err(component->dev, "%s, assuming static mclk\n", __func__);
+	if (IS_ERR(es8389->mclk)) {
+		/*
+		 * If the MCLK property cannot be accessed,
+		 * switch the codec's internal MCLK_SOURCE to the SCLK pin.
+		 */
+		es8389->mclk_src = ES8389_SCLK_PIN;
+	} else {
+		if (!es8389->mclk)
+			dev_err(component->dev, "%s, assuming static mclk\n", __func__);
 
-	ret = clk_prepare_enable(es8389->mclk);
-	if (ret) {
-		dev_err(component->dev, "%s, unable to enable mclk\n", __func__);
-		return ret;
+		ret = clk_prepare_enable(es8389->mclk);
+		if (ret) {
+			dev_err(component->dev, "%s, unable to enable mclk\n", __func__);
+			return ret;
+		}
 	}
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(es8389_core_supplies), es8389->core_supply);
diff --git a/sound/soc/codecs/es8389.h b/sound/soc/codecs/es8389.h
index d21e72f87..57bf7c5f8 100644
--- a/sound/soc/codecs/es8389.h
+++ b/sound/soc/codecs/es8389.h
@@ -116,9 +116,11 @@
 #define ES8389_TDM_SLOT               (0x70 << 0)
 #define ES8389_TDM_SHIFT              4
 
-#define ES8389_MCLK_SOURCE            (1 << 6)
-#define ES8389_MCLK_PIN               (1 << 6)
-#define ES8389_SCLK_PIN               (0 << 6)
+#define ES8389_MCLK_MASK              (3 << 6)
+#define ES8389_MCLK_FROM_SCLK         (1 << 6)
+#define ES8389_MCLK_SOURCE            ES8389_MCLK_PIN
+#define ES8389_MCLK_PIN               0
+#define ES8389_SCLK_PIN               1
 
 /* ES8389_FMT */
 #define ES8389_S24_LE                 (0 << 5)
-- 
2.17.1

