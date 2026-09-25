Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505F433F8A1
	for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 04:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790311774; cv=none; b=ZsdtTKnsQUxUf2eUPvhSKMB9a+el7TwiOjwJ9mmt/hQsOpG4RhEqxzSTxuSJ1XXrtZVBHCfYr0ED+8CvnKmtxZmSLcUtcoSSxnlS82eBJdn7cU6SGDRJgI8Mnd4FMVUbzUfoRCyKqTNhL/fEmFC/6yqSSQTo3Vq2/XEVA8CKNYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790311774; c=relaxed/simple;
	bh=BqOIdOWIc7Bbbr8ZxXOpLUQh36ChMcfJeTwhKtu2ZR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jd71IRuM0i9nYMaFQ3g6goRw3yGZ1zV2z40cD+5/i2ylpV0Ox18wVG93aNHXzkRuJdAqT1Tz0M4wqpvNr983JhfYrnGOQYqsqoPHrDE2Qbz3Qd+Ydt5weRWrAa1+lnJy5aWqZBU0TiGnKEzVzrjQSzucEYUNCGV9yinz2O8553Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lIX/M5qQ; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lIX/M5qQ"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a0b18f811cso396610a91.0
        for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 21:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790311771; x=1790916571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dtvWIRp9yO8uIIIbpOsaLthb3JvQZmMy0vJI9vWrQ+o=;
        b=lIX/M5qQAazWf6XS7qzfo33OWftnYTdrw9Q8KutgKMSHJYRzm4wjaUdvAe/c79x1DG
         J4lwZJX7HF5T1apjYnthOdaghHNY00Xd0b7UadB2KZUq2VzBfO/3npfop1n9QCBgF5Qx
         4qQ4UlTCG8gOxL1TKwNuUrhiMaaKoUXkcIQ2juiWlwJ3sUDVBxrDSIPy7MJvoTEmCnSC
         WmW8hnFh8w7WG2BvExZRWx9Y4aHzVgJ/mqGv0S/x1dUcycsHcxDFipGmAuwNB4GQv42c
         2KQhRZ5+8GrzDADi+t5BTAHOziGqAibsPpzLzyPvh8u+evEjCKX92HRFTxpdqds84oGm
         50CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311771; x=1790916571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dtvWIRp9yO8uIIIbpOsaLthb3JvQZmMy0vJI9vWrQ+o=;
        b=rSVKatbkKMqF8SkaVOfKQzE5fxqITF2NvOz3Oz2+/O4jy6V0jR+fNDiiznZNp4Hy/1
         tZoXkUI9mOuEomefNbcrzTyA8pK7akUHziLPozF0BXXVItZrXqH8CHX+86TGwLWCNUjM
         zzPCYbgiQYPeAWlaC4sApsWVrB+WwwwIgI6Mm+2V84Kg3zYVGiAIt6TpjHIXYjTNLrmN
         EKGzeWzNTi3X8vdiwR+sounYMxJgcrCO0diMPaRHIzcrxjfD5vneM+OPsWepZWoGwHa5
         Yvp5d4OyDRTLi3yP4fcnmjFYOePbAwJZeNyj/EYApdoH7RmPUvaOIuoWgaOfxguz2RQw
         MZIw==
X-Forwarded-Encrypted: i=1; AKwUvBzjxQCqduSno/2fBBcb6nUBYe2QYEgFJAEzfNrIiylA7hKKRBpJulEmzlPUQmt0c2cSjdn93pg1iFaJ6A==@vger.kernel.org
X-Gm-Message-State: AFuF++lNTHulQkqVI1glTEZ3VAmJ9IyRq5lrgZnuE8f3HSGPa7IkJL4F
	yqlCE61JTx7jL2g0qseisX4fqtGo6jO+p0cOCbjN3tkzwO81waBdTWPg
X-Gm-Gg: AYBFou2j14Opz2YT3tP4VnwpdjJWYATNYb6bwwf8BhkWytyGhmrl2Y0mM+UWwCbHLFk
	d9OYKtAprLZ3OLWj3gSPL8TUb0NJyyfZ8i99vPt/5CvFbh4L0p1mSI1JItFq1ernF1QkDosum2p
	cbcdhEkLPaB9DvtCOUl6SNd320b2OeKs0HvC2SGqFu8WiFcmedCVkYwE873B5Mn6j+WUNb2zCCH
	0cmWn163Cg2kjr8WMp5xtPoYjWP83UfvIlawnQdd0cHjJCCqBJn9kdPNE2UFLNTrqBx4AFJzbQJ
	0gtNAQtU1FnfLTifdAZzeec2w9fzdMX+riPrG2cnELCmX0rQzMvd/VJjo2sEhW2oIfxZg2BeAhB
	kBxFI71eu1/7uOdd75HaBTKcySE7W9oGJz64CI+l0yqOqV2pS7/jVl/IqmM1TFOD6eZuwSTk82f
	LA0x7mSiTsJ0zjuSiA9s9XA59X77dKy5TRcXGf7DExQwXuahEsJF6pW5tkFqbp8ewqW0SDE6XDY
	688fdobAxt/ZqVI+H/epm7QOGWmOS9K1CWqwgDJh4gSHJNBNLYbblEPw3rTmPg+XA6tqAks07a1
	i0/kJYUSG3DEng==
X-Received: by 2002:a17:90b:17c8:b0:39e:433:23b5 with SMTP id 98e67ed59e1d1-3a098b973c5mr4047368a91.5.1790311771625;
        Thu, 24 Sep 2026 21:49:31 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976cacbesm8151528a91.13.2026.09.24.21.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:49:31 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 01/14] ASoC: mediatek: mt8195: Fix tuner clock error handling
Date: Fri, 25 Sep 2026 11:48:55 +0700
Message-ID: <20260925044908.450775-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925044908.450775-1-phucduc.bui@gmail.com>
References: <20260925044908.450775-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Check and propagate errors from mt8195_afe_enable_clk(). If enabling
the tuner clock fails, disable the previously enabled APLL clock.

Fixes: ff5a90173d98 ("ASoC: mediatek: mt8195: enable apll tuner")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 24 +++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
index 618d8400913a..ec1ea5b988ff 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
@@ -241,21 +241,35 @@ static int mt8195_afe_enable_tuner_clk(struct mtk_base_afe *afe,
 				       unsigned int id)
 {
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+	int ret;
 
 	switch (id) {
 	case MT8195_AUD_PLL1:
-		mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL]);
-		mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL1_TUNER]);
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL]);
+		if (ret)
+			return ret;
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL1_TUNER]);
+		if (ret) {
+			mt8195_afe_disable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL]);
+			return ret;
+		}
 		break;
 	case MT8195_AUD_PLL2:
-		mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2]);
-		mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2_TUNER]);
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2]);
+		if (ret)
+			return ret;
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2_TUNER]);
+		if (ret) {
+			mt8195_afe_disable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2]);
+			return ret;
+		}
 		break;
 	default:
+		ret = 0;
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static int mt8195_afe_disable_tuner_clk(struct mtk_base_afe *afe,
-- 
2.43.0

