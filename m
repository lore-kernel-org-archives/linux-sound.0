Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FA2388873
	for <linux-sound@vger.kernel.org>; Thu,  3 Sep 2026 05:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788412353; cv=none; b=lhWJGSsxY2FnrVOt3Ahuyha9Ic8gY50R2ixJJhVJkab0PXiXK7GBGRzY0KJagmRMMWvZFR/KlVzFuIyTepMF8Gx0pacXPGTZoLxwHaUmznnR3WbMOkRvSzoWVI2qWamHvb3WuhlasSaI5aEQbicPnTIwt3gUGH3mqi72p94oDAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788412353; c=relaxed/simple;
	bh=IMMNfAHA925c8xRPeFIaX7picSPtRX32u3H+Rxm6mmY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PixcqpEvjwkqu4FUPeyxp0nDr8vsrkl/Ar6OZYsoNImYqNFS/Z7/YBxTGFem8/iff/8YCzPe2BWwlPOkGElSvIk7cXby5Xa/VPvr5H9xCacSjVLCdfS4v5/jsm9NuXjo/YwV5KNBEcUSsWYj3Q0Gc362PhNCxsCCn0zUlv7wWL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NFL8vXf3; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NFL8vXf3"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c9aea40d799so1179930a12.0
        for <linux-sound@vger.kernel.org>; Wed, 02 Sep 2026 22:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788412351; x=1789017151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bQlCZdv6KNUR0PACOoD9lgtTeqoM7wiIPRUAOQBrgJY=;
        b=NFL8vXf3VGaIJZPqkSa0ofqQsno/jCjN0fUr424mibkV4jdAXzx+ctAiGkJyKghWih
         N0HSqNtIwqUwIFNo+YwbWMjaOLMC/IMA+MeRDS7IfOnUerO2tU+VY1wasyqzG4PSRi55
         vzMZk3xjycpEzCaEaX+ovc7HLNM1ILrJ2z7E5dluvrAHBLRSfxctJ3csREUCQDKttwYa
         /6xkWk9HmQpWf7fV0Etqt9CGR7eZgnDKnIwvj7i7LQGulgpaEktByj2ChR8JlqqiDas7
         DRM+FuS//DGr0ojGHZfd1/Jqj3t0cEpvpNt9rOaW2g3lajD3wYuonSksBs4yMIIZB6hd
         4LaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788412351; x=1789017151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bQlCZdv6KNUR0PACOoD9lgtTeqoM7wiIPRUAOQBrgJY=;
        b=lLWj86YqoxNMDB2AhwdYb+hhJJptqFy9vhHXOgLrfATWHM5t+l9+Xyz5eQ6Uq2KNmZ
         P91forwbs3ktCXN0kQ1J9XRi7/ElwO5SnH/6XRLtn3LwI0F99aZaPWsc65CWg65UrFt2
         iFpr9uBCbpFa5AgAD4MGTTh5puxxt2hSeOrOyEgr0lptt4gR5btQhdh2RJblqyzVcrJU
         aalmtDO48Xqeg1Xito/3xPRPrJqyyR8koWsJWIy1x7dNC7A91nKAbL6HCdl1Jy5Lqu6e
         g45MCVXB91BlEf6tgU+HTsr7BALbkpoPSBklGkBd64X8a9Q+NxVP5pQphr6vodUxNCt/
         tIcQ==
X-Forwarded-Encrypted: i=1; AKwUvBy6baFqUVNbI4IOuPBG+uHvKS3/4vDaZ8ReGPRP0nKcuIIac/f4FrkbXXOwpEEdkzSOtVJUf/9Ph8IOjw==@vger.kernel.org
X-Gm-Message-State: AFuF++n9UHeGlwwWjgcKmfD8GAUZ92DUrOn1mAExKAXASEa+/jvU6mYd
	CJvgYqUa5fqpqdME66A7t9S3pntAUBdhlaCtdnJjQMhF/tGhWhGOr9P8
X-Gm-Gg: AYBFou1TjOnb/DPxGW2roDncB+buFNNAUEA+VIhaRbflo5HeoOwWA1FFZ4Lm13Pp7zr
	JuI9kehpCK0Hpwnz27nxiD+9hMnayUSHNO7SGNGgpaeXGU6C24LjPfa1yBPmUHiDoAW7SpmXP/m
	m8eJYxz7nyWI4sx0RRLs96mLjFONLtq9ZVhFYE3OyfBGRTLZz3QztpLa2AvwJHdOeOzU6BrARuV
	iTXNCK1TWk93F5vg1MGBItYyXvIlkYSlrexXNYLfLH7cdW0Hrwnlgb8QPCMrN/SCqNAJ0ML+YSG
	u808aqFvCehmiBl2gdIhQIJmt7MbbE5Ai0uw+f7MUcfSZ2xn0MbZV0dDqN7YDma6NODzWot2nxN
	lShJyftZwbw3iVSyWX5uL2UV3ixE8LfBZLvZ5uXze/uYEprC8ynVGAkDwWNnP7+nyiQ2kaf/Rcb
	+MK/tsbKEUgDocK6zulk83IWCE5u1MnToxEM/Jih8FMRE4YHJBy3wD35qufCIWHwoXG/ejbfBFQ
	0rsT2CxfHARmgt6u/pTatO6uDBGamJ2oqhIAB8PiO/Jmqd30MlB5IDRMlrx4ORbAo+sumDWb8Q1
	Ry8b
X-Received: by 2002:a17:90b:5288:b0:398:9bd1:3214 with SMTP id 98e67ed59e1d1-39aee123ff5mr15589958a91.21.1788412351417;
        Wed, 02 Sep 2026 22:12:31 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b0875ce14sm3218092a91.13.2026.09.02.22.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 22:12:31 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 5/8] ASoC: mediatek: mt8186: Fix MCK error handling
Date: Thu,  3 Sep 2026 12:11:47 +0700
Message-ID: <20260903051150.178057-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903051150.178057-1-phucduc.bui@gmail.com>
References: <20260903051150.178057-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The mt8186_mck_enable() function returns immediately when a clock
operation fails, leaving previously enabled clocks active.

Add error paths to disable previously enabled clocks before returning
the error.

Fixes: 55b423d5623c ("ASoC: mediatek: mt8186: support audio clock control in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-clk.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
index 77a0cbc8ee24..62b008b7caca 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
@@ -520,7 +520,7 @@ int mt8186_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 		if (ret) {
 			dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
 				__func__, aud_clks[m_sel_id], ret);
-			return ret;
+			goto ERR_ENABLE_MCLK;
 		}
 		ret = clk_set_parent(afe_priv->clk[m_sel_id],
 				     afe_priv->clk[apll_clk_id]);
@@ -528,7 +528,7 @@ int mt8186_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 			dev_err(afe->dev, "%s(), clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[m_sel_id],
 				aud_clks[apll_clk_id], ret);
-			return ret;
+			goto ERR_SELECT_MCLK;
 		}
 	}
 
@@ -537,16 +537,25 @@ int mt8186_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[div_clk_id], ret);
-		return ret;
+		goto ERR_ENABLE_MCLK_DIV;
 	}
 	ret = clk_set_rate(afe_priv->clk[div_clk_id], rate);
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_set_rate %s, rate %d, fail %d\n",
 			__func__, aud_clks[div_clk_id], rate, ret);
-		return ret;
+		goto ERR_SET_MCLK_RATE;
 	}
 
 	return 0;
+
+ERR_SET_MCLK_RATE:
+	clk_disable_unprepare(afe_priv->clk[div_clk_id]);
+ERR_ENABLE_MCLK_DIV:
+ERR_SELECT_MCLK:
+	if (m_sel_id >= 0)
+		clk_disable_unprepare(afe_priv->clk[m_sel_id]);
+ERR_ENABLE_MCLK:
+	return ret;
 }
 
 void mt8186_mck_disable(struct mtk_base_afe *afe, int mck_id)
-- 
2.43.0

