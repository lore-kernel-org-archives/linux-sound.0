Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC033ED5B1
	for <linux-sound@vger.kernel.org>; Fri,  6 Mar 2026 17:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772816690; cv=none; b=W0KCrJ0+qh5v0rBFuGBagAh1riEo3scdLP5Cb5Ky9fIOCfsAvoa0I+MhA7kce/aNrI7jDFBx+aSjw0wVRaCudvbyLAG6p2el68X0Mhl0T76ncwZVUVnwdG1zeWczR9QMymrCl2MrGhMVU8i29ED05TKzEAL+HVP/hBeuNswjlNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772816690; c=relaxed/simple;
	bh=3i0lS/jOLHvh97zTu+WpGgYG0i1iba6kUtOX/wFfAgA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VYAcKh9aOh82gRNaYwqeJj5j5f+BbzKuaTp8dwH5t1oC+1rOqHySDQmdVxbjSfTlmThH7wUBKLsQfyFlFhRlaoAAeWWw2inqiqs+06YIFG24QR2OCO8jSsXrl2uwtKtm8DUGzfXtNoDzGtECZSQBtCy0Oql+wcpEhq5jcN8TFnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e/Ex87t0; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e/Ex87t0"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56b069fed64so349340e0c.2
        for <linux-sound@vger.kernel.org>; Fri, 06 Mar 2026 09:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772816688; x=1773421488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BuxO1nSghzb98GxKgSltIqgao3JhVu7jRzBHBXc7f4Y=;
        b=e/Ex87t0CsX/rHY7FzS5dF2Fs9+JEX1saLx3Mv6bGr6ffpVrW4uc0luMt2uz/grdPc
         PgZcahKtMuzNYzxyzQVKw0ohGefRv9B9foUMu5gqMbt0spO0exs1MWo/rtsqXdIIjqhJ
         kBx9K4hjbjYhE4joZuVss3nVU06P+DW7uGAZWABxV+kjiuYOKhDwEovpb5UmNA0I8Dr9
         wBPRpAbmQoJvgjei2gE0usH86/9cn9efNWA7pYSfBGax/uS/X0TasNa00+KyE7mqmJ7L
         qXnxycP3RjaFCK4ovxmMU7IsGqFwy2Iipxnp8KDfLuzkpMgEa55ssgwyVqCJ0HYYlF+8
         HqdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772816688; x=1773421488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BuxO1nSghzb98GxKgSltIqgao3JhVu7jRzBHBXc7f4Y=;
        b=pH+zF7kghUsm/a8xuVNKMCEYrZ24yKRKxVSQLnYKFwk4SLik7Jsin1fRRU5P+azxFn
         wRQrAAzrQSJ2Q28RrJxKBhQ6xgeXQwEKUm5Kzc6Mx6YbqPg1jbNgY3ge64UJ1JQY5mzZ
         bLl1hZUbLZMRkSSoATD0MtED0AtRbrezQuOrlAaG/jpywA+cQG5kntYsU/O1fAc9J/fk
         gRc/91j1b/CqbSuSW+vIOu9VcSa7XEMRSjosOyrx231+CHCdr7CQ2RLwRLKcd3tA2u34
         ZZ59cRYgzi7pNdqoYsdsa4rcZw/GW5EiH8Js7iDbVymt2SFLqvtFkTrv2nYlBAd57r4d
         7dDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVljm4fbKzFcGTfhv3ly4GMkL/lEzO1M4A6q59g1wn/i0BLb0lvY1WaHZHAxbEgMb8yZWJQtgUCEvwmoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRUSGMDmOZ/VdlEc8Maf6ud0CjvGpNMcL7RMtVaWFSvSRGohvA
	rgnrB1/tGSxd/xJxRacPDFtGYEfGX8CLNnQqs06FMnK4FMdnlM6pDrbf9/P8PA==
X-Gm-Gg: ATEYQzw6U774KwqUCSnvpm3pWYFJunwoPF8P4eKbWa2fQ8SWD10Pk6zvrrBeCCrXdcf
	btGtQpfupwtWGKkMcrMja7x7Va//hAB8bBQFwnnOsBsq7X9D1Pt0K3FQt4FhnkdiQKoUej1uFNu
	UfaDqBuyxGN6P7TeEgXvmxR7vw9wOrxg5BgRU3kx1CJRaVDuR3Upt/AVQ4m/OfFlsf1Wh8oaITK
	YUGb3nTc9T0pc15GaTmTMTOmSzE9MxT1UiaW5ctmPDvzTFaDwKwuI9mZC5ntI4cqk3xpCbnRTGp
	SAK9iAFgy7ykCzHxstkSv2vy+hKzoWnf9kukhQ+qdiok/GvP0SirZYYI3hH8CyCLaIXnIYK1e5I
	+gqJ9KUOw30hpId604tJXStLPMOz34uGNWIRWRw26atRrYSCiOdaXFPy++/YEplrvoR4n6AXX0+
	ioDVF8TvXZ0LYfpC3VmiKpRttJxIxZ4FQK6P9o9B3zm97K1B7/ZO2XvzfxzMnrf2e5KqdN
X-Received: by 2002:a05:6122:6e05:b0:56a:ef89:34fc with SMTP id 71dfb90a1353d-56b07d7aebbmr953603e0c.6.1772816688042;
        Fri, 06 Mar 2026 09:04:48 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:1b3:a802:8875:ddd6:ede8:90d6:abeb])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b0f889ed2sm332967e0c.13.2026.03.06.09.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 09:04:46 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: stable@vger.kernel.org
Cc: broonie@kernel.org,
	alexander.stein@ew.tq-group.com,
	linux-sound@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 stable-6.18 1/2] ASoC: fsl_xcvr: use dev_err_probe() replacing dev_err() + return
Date: Fri,  6 Mar 2026 14:04:20 -0300
Message-Id: <20260306170421.1430704-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Stein <alexander.stein@ew.tq-group.com>

commit 8ae28d04593a5fdddb16d3edcdabb8d1e4330d0b upstream.

Use dev_err_probe() to simplify the code. This also silences -517 errors.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Link: https://patch.msgid.link/20251125101334.1596381-1-alexander.stein@ew.tq-group.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Also include it as part of the series as it fixes a storm of:

 [   3.217646] fsl-xcvr 30cc0000.r: failed to pcm register
 [    4.450639] fsl-xcvr 30cc0000vr: failed t pcm register
 [    4.485499] fsl-xcvr 30cc0000vr: failed to pcm register
 [    4.508775 fsl-xcvr 30cc0000.r: failed to pcm register
 [    4.624521] fsl-xcvr 30cc0000vr: failed to pcm reister
 [    4.783004] fsl-xcvr 30cc0000vr: failed to pcm register
 [    4.823300] fsl-xcv 30cc0000.r: failed to pcm register
 [    4.863936] fsl-xcvr 30cc0000vr: failed to pcm register
 [    4.907075] fsl-xcvr 30cc0000vr: failed to pcm register

 sound/soc/fsl/fsl_xcvr.c | 86 ++++++++++++++++------------------------
 1 file changed, 34 insertions(+), 52 deletions(-)

diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index 58db4906a01d..06434b2c9a0f 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -1548,28 +1548,24 @@ static int fsl_xcvr_probe(struct platform_device *pdev)
 	xcvr->soc_data = of_device_get_match_data(&pdev->dev);
 
 	xcvr->ipg_clk = devm_clk_get(dev, "ipg");
-	if (IS_ERR(xcvr->ipg_clk)) {
-		dev_err(dev, "failed to get ipg clock\n");
-		return PTR_ERR(xcvr->ipg_clk);
-	}
+	if (IS_ERR(xcvr->ipg_clk))
+		return dev_err_probe(dev, PTR_ERR(xcvr->ipg_clk),
+				     "failed to get ipg clock\n");
 
 	xcvr->phy_clk = devm_clk_get(dev, "phy");
-	if (IS_ERR(xcvr->phy_clk)) {
-		dev_err(dev, "failed to get phy clock\n");
-		return PTR_ERR(xcvr->phy_clk);
-	}
+	if (IS_ERR(xcvr->phy_clk))
+		return dev_err_probe(dev, PTR_ERR(xcvr->phy_clk),
+				     "failed to get phy clock\n");
 
 	xcvr->spba_clk = devm_clk_get(dev, "spba");
-	if (IS_ERR(xcvr->spba_clk)) {
-		dev_err(dev, "failed to get spba clock\n");
-		return PTR_ERR(xcvr->spba_clk);
-	}
+	if (IS_ERR(xcvr->spba_clk))
+		return dev_err_probe(dev, PTR_ERR(xcvr->spba_clk),
+				     "failed to get spba clock\n");
 
 	xcvr->pll_ipg_clk = devm_clk_get(dev, "pll_ipg");
-	if (IS_ERR(xcvr->pll_ipg_clk)) {
-		dev_err(dev, "failed to get pll_ipg clock\n");
-		return PTR_ERR(xcvr->pll_ipg_clk);
-	}
+	if (IS_ERR(xcvr->pll_ipg_clk))
+		return dev_err_probe(dev, PTR_ERR(xcvr->pll_ipg_clk),
+				     "failed to get pll_ipg clock\n");
 
 	fsl_asoc_get_pll_clocks(dev, &xcvr->pll8k_clk,
 				&xcvr->pll11k_clk);
@@ -1593,51 +1589,42 @@ static int fsl_xcvr_probe(struct platform_device *pdev)
 
 	xcvr->regmap = devm_regmap_init_mmio_clk(dev, NULL, regs,
 						 &fsl_xcvr_regmap_cfg);
-	if (IS_ERR(xcvr->regmap)) {
-		dev_err(dev, "failed to init XCVR regmap: %ld\n",
-			PTR_ERR(xcvr->regmap));
-		return PTR_ERR(xcvr->regmap);
-	}
+	if (IS_ERR(xcvr->regmap))
+		return dev_err_probe(dev, PTR_ERR(xcvr->regmap), "failed to init XCVR regmap\n");
 
 	if (xcvr->soc_data->use_phy) {
 		xcvr->regmap_phy = devm_regmap_init(dev, NULL, xcvr,
 						    &fsl_xcvr_regmap_phy_cfg);
-		if (IS_ERR(xcvr->regmap_phy)) {
-			dev_err(dev, "failed to init XCVR PHY regmap: %ld\n",
-				PTR_ERR(xcvr->regmap_phy));
-			return PTR_ERR(xcvr->regmap_phy);
-		}
+		if (IS_ERR(xcvr->regmap_phy))
+			return dev_err_probe(dev, PTR_ERR(xcvr->regmap_phy),
+					     "failed to init XCVR PHY regmap\n");
 
 		switch (xcvr->soc_data->pll_ver) {
 		case PLL_MX8MP:
 			xcvr->regmap_pll = devm_regmap_init(dev, NULL, xcvr,
 							    &fsl_xcvr_regmap_pllv0_cfg);
-			if (IS_ERR(xcvr->regmap_pll)) {
-				dev_err(dev, "failed to init XCVR PLL regmap: %ld\n",
-					PTR_ERR(xcvr->regmap_pll));
-				return PTR_ERR(xcvr->regmap_pll);
-			}
+			if (IS_ERR(xcvr->regmap_pll))
+				return dev_err_probe(dev, PTR_ERR(xcvr->regmap_pll),
+						     "failed to init XCVR PLL regmap\n");
 			break;
 		case PLL_MX95:
 			xcvr->regmap_pll = devm_regmap_init(dev, NULL, xcvr,
 							    &fsl_xcvr_regmap_pllv1_cfg);
-			if (IS_ERR(xcvr->regmap_pll)) {
-				dev_err(dev, "failed to init XCVR PLL regmap: %ld\n",
-					PTR_ERR(xcvr->regmap_pll));
-				return PTR_ERR(xcvr->regmap_pll);
-			}
+			if (IS_ERR(xcvr->regmap_pll))
+				return dev_err_probe(dev, PTR_ERR(xcvr->regmap_pll),
+						     "failed to init XCVR PLL regmap\n");
 			break;
 		default:
-			dev_err(dev, "Error for PLL version %d\n", xcvr->soc_data->pll_ver);
-			return -EINVAL;
+			return dev_err_probe(dev, -EINVAL,
+					     "Error for PLL version %d\n",
+					     xcvr->soc_data->pll_ver);
 		}
 	}
 
 	xcvr->reset = devm_reset_control_get_optional_exclusive(dev, NULL);
-	if (IS_ERR(xcvr->reset)) {
-		dev_err(dev, "failed to get XCVR reset control\n");
-		return PTR_ERR(xcvr->reset);
-	}
+	if (IS_ERR(xcvr->reset))
+		return dev_err_probe(dev, PTR_ERR(xcvr->reset),
+				     "failed to get XCVR reset control\n");
 
 	/* get IRQs */
 	irq = platform_get_irq(pdev, 0);
@@ -1645,17 +1632,13 @@ static int fsl_xcvr_probe(struct platform_device *pdev)
 		return irq;
 
 	ret = devm_request_irq(dev, irq, irq0_isr, 0, pdev->name, xcvr);
-	if (ret) {
-		dev_err(dev, "failed to claim IRQ0: %i\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to claim IRQ0\n");
 
 	rx_res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "rxfifo");
 	tx_res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "txfifo");
-	if (!rx_res || !tx_res) {
-		dev_err(dev, "could not find rxfifo or txfifo resource\n");
-		return -EINVAL;
-	}
+	if (!rx_res || !tx_res)
+		return dev_err_probe(dev, -EINVAL, "could not find rxfifo or txfifo resource\n");
 	xcvr->dma_prms_rx.chan_name = "rx";
 	xcvr->dma_prms_tx.chan_name = "tx";
 	xcvr->dma_prms_rx.addr = rx_res->start;
@@ -1678,8 +1661,7 @@ static int fsl_xcvr_probe(struct platform_device *pdev)
 	ret = devm_snd_dmaengine_pcm_register(dev, NULL, 0);
 	if (ret) {
 		pm_runtime_disable(dev);
-		dev_err(dev, "failed to pcm register\n");
-		return ret;
+		return dev_err_probe(dev, ret, "failed to pcm register\n");
 	}
 
 	ret = devm_snd_soc_register_component(dev, &fsl_xcvr_comp,
-- 
2.34.1

