Received: from mx-relay47-hz3.antispameurope.com (mx-relay47-hz3.antispameurope.com [94.100.134.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C1A2EDD69
	for <linux-sound@vger.kernel.org>; Tue, 25 Nov 2025 10:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.236
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764065708; cv=pass; b=HH3Ywh8udFNMK2Sb9/gAlwX3jKV8JxJn79uFLq83HM0WZdcHeW2CMcnI9AHd3XCqM41KMR7h9h6XNFsQpIqDKFnQ08buqd098zG5RZu7qzj8n35majXM0YzJtw5vFUtJIOw4Qp4UD/tZKcXXuuDsB3rS1DxMzuxx5rxoxBE8Hj4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764065708; c=relaxed/simple;
	bh=op/aA9TgbMwmAX/TMVrw8rTyjYfJHe4UFa86KHKsU7I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ETcJkrSP2i6pNuOFaKEOOu3Y5VIfAa+Jc+LFFXVci+bSfVb+W6a4V6SVYY/bB1ljpS0OkeCbQ35jloVMOvMAHPZSUV/JiHsWkq1DSi7MKbXltUAfigvZdPgldeWpQ8eIKGcPzBNu/7+dln1cQ5PK9y8ebgoD4WCj24mFnq1xZyY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=ce7EOkN2; arc=pass smtp.client-ip=94.100.134.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="ce7EOkN2"
ARC-Authentication-Results: i=1; mx-gate47-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=Rye+dkGKNNQ4N4PbVfKNGd2olFLjRhnboR82n7h1f/0=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1764065630;
 b=a87s6E2lNWFFHkBsY8tfcXNgaQjHr04Kf05bxXK8VDhIydMbLiigaxWgR4NNG529zVksoUVd
 Lqz1KcqENffWeIOrHBcgCLFq4FudetMZZhUJewgTUA+zoI9LCbi9+gGiuhFy8pi92zEuuV0PDo+
 VWaLp3PysA6LH1Y+iugcEM6C+Asq7s5PMD+M3XjEWFiKjUZoChXDF7gC4gshlRoiivF6WuzXbAQ
 rnRkRZpTWf8o2J3sOUZ3zeGYivfNBjF4xuasNPRwcT+tYMRdAaEzJWiKSUlv9IL3eYiYiZGy0vK
 7uNBU7pZs2ac4i4v3YBW84iy7kqcpZcEvGfnBz9yZZTvg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1764065630;
 b=SIP+oNe2Fa54WdfzPnZYq6pFQ1S2JRtbSjcFZIURqtqAh2ugE6RBmnWU7XQSplk0NWyR5Qu6
 vjad6rt1tUhObH9pxIFb472U6S2B0sUIPo4LGhGo0BQ4j6D5FVdz/9w5wZUZ7J9msKtcvebir0g
 kXwfZSqJgAhYvIO3u7ebhBzxhQ3itYRMt2/x4+gc4RkqUeuSy5ruUO8DwRIOiB1m1DvO24VwaC+
 swRFo0ppgiAI/D6HjOghxpstctpj3OTDsuFlsNYpO37YYDbSYMFlT9M6M1GzqnFFajIp+3PgeYc
 mW0QyY0a/VYSgiEJKN4mKO7NEOqbkn41OlKDuOXNJ0jTQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay47-hz3.antispameurope.com;
 Tue, 25 Nov 2025 11:13:50 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 1BCAAA41379;
	Tue, 25 Nov 2025 11:13:38 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] ASoC: fsl_xcvr: use dev_err_probe() replacing dev_err() + return
Date: Tue, 25 Nov 2025 11:13:33 +0100
Message-ID: <20251125101334.1596381-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:linux-sound@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay47-hz3.antispameurope.com with 4dFz6p5fyqz4MYpk
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:b0357d8e99060e6d3d18b33e90b892e4
X-cloud-security:scantime:2.101
DKIM-Signature: a=rsa-sha256;
 bh=Rye+dkGKNNQ4N4PbVfKNGd2olFLjRhnboR82n7h1f/0=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1764065630; v=1;
 b=ce7EOkN2PU5O45+LDnktTK4F36y9aVBOi0A2xpx/bUy6hCtdFZ72kfx/pD6BQnIawyud6dSc
 8IUpPerPE7wKN87TOdKiwbqeyYT+RmoPUg4VfEi3Q2oaKo8kT2SS/KHkUAYFJ11GvBZR8TNFLTt
 qEKgNvWRMbglvbF+FHaF5RJr6BWzefiADcEIKvFxZPxBijBBvTySJYRw7q/b8gWNmvUSX7wvokL
 +5juU6tV1bXRGa2FnlZRZUaAYBrejQkx2IqZc6AD5P2B2WCFbq6QrniiUt2/jRzXg6prIBNI6VJ
 geMyNRE9l0jzdHht4SqnveshNOeYWfmBvt0+Qm4CaA22A==

Use dev_err_probe() to simplify the code. This also silences -517 errors.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 sound/soc/fsl/fsl_xcvr.c | 86 ++++++++++++++++------------------------
 1 file changed, 34 insertions(+), 52 deletions(-)

diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index 5d804860f7d8c..07c9fef45b0f0 100644
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
2.43.0

