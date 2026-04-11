Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8523D33F374
	for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 11:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775907793; cv=none; b=BRoZU+/7sCRDIHE+id8BpL0ZDyG7HN/McUPLPlnDr7iltOdxtddP+oVh1jgY1o+USbg4glU87UBwMs7o0bcAa3Oi8rIe41fkx04U4uwmnFINKzdR2qNgrzBdUZ3QDUfNAbpSxDHq5scoV8YaM+Br2/JoSeEkE2ynxDnEtsf0DL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775907793; c=relaxed/simple;
	bh=SIisgWIq7iz0fEX6zbuC2vzUQFNOenfE175SXgsqSCI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gjLNW4jcI8iLZgTsYI4THoB3/cfE4chMWr8m6v8k/cz8rdebePd8yREnaayayTTzrVHjrf9KQfgvLET/ffhaMt5QooUBlSHT1JN9M03ITUkIY9CDFRD23BbAyv+9Mc2989jaB7isnxngEtqOCFvSaIcm6iDS19btnBCotWBnIcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=AlTA3i+/; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="AlTA3i+/"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48374014a77so40484675e9.3
        for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 04:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775907790; x=1776512590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2xnheHvaNltUuBI9CjLhmlXKJ1g2zxubkvsSzZotxIQ=;
        b=AlTA3i+/aEmGGqWaBB/kIenOvnULZwPvTCVjI0P+kS15UAYBEzTk4h4GhouQd55ocE
         LAgQ03YVZ0Iqqhif14f/F1dM7IT4GAVEXJwcCBkQ2KMgYea9wVaDgLvRctwtcF9q+oAe
         vGFL1k305VFnGQbB8cRSO1PW7ybMsQOW33tZHAFTztQhz3VbLLH81jq66YqJCmI85Aif
         R2d+kISc8scZXfIvU0nPu2W1f7rIspQ1V7bYtijgohYBgA/nfr4NjLu8bcYSNDM4hbVC
         OcKCweXLKSE9Z3HCLqSlBDjiO5dlJgLkwV4Wb8xCidGG5N6YSVY74+B2rD8HxxgTl4Ct
         U3nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775907790; x=1776512590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2xnheHvaNltUuBI9CjLhmlXKJ1g2zxubkvsSzZotxIQ=;
        b=m8G1SQXFcf9MeNhASmngDuLvfPn/NXb6IXRAK2k8q7DC4iNYrEJf9vXbIEbt4BJ+q8
         D4Gj+PB3dZaQUqawo8ygmwPopMxPP0meCgSK+5M7UvTzy12Xh4pKFKXiZJmSSSS048Xd
         lfxkqVCNUFt0/B7ZJwXrIzB1VW6F7oKiA2XOEjKXtcx1+NwNLTnqtg6iUef2j6qxZflA
         fGKIVTROcw4APO1x0TcLsspP8qeLm4A6x9MaV878iRzSHUwdxWBGJbE33BMtqqeIIodO
         Fjln89Qzcp9Zn78nmasrAmVuwRMNuL46JOp9JlTbBS7Ylcw+UhM0Gnd8OgJr6a+YSURw
         IqVA==
X-Forwarded-Encrypted: i=1; AJvYcCVy6NgizGBBFcKyA0m1nIExvQwU5nYFYfHu/gCG+ZJ1yOpOe8zqxjGKiEbFXynbuu/NEkT27wySGDragg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZTyef03Z4AaLqBTvz6oD8Ypvhme4FvSCuoH6BoP4y7RcXWU8Y
	H5HrSfgga9PYrIpcI8xGhCRZvZtp/ZT6NTZKgzep5me1c18dNplhGvKRudeLaOIFS40=
X-Gm-Gg: AeBDieumWECIqo4Nv0VoT+j5hklNpBwKkSZ+JDPPm1wEQAz7CXNUKJvBIXzkLZjUXAM
	5ypKxWWov0EOvM24q93bMfeNebmJDpVB2A2/NC2+LHi7g/ZXGJisC5BYdm4QHLq2BMNe79/R2Dc
	UWi8ftJrq4m4SbsiPLN4yEht0oAArMaKclvwqyuh+Y+UAfX0bAesok8w6O6x1Jn+EZhprprmXUc
	ABoacs7EMIi+y49iAui63t4ddC/+NssAALJNrLRwT5zgwabxpYK7gFmbTvNNpy5hQ0100K4hXKJ
	c11twp+GpTtqHB2QjQZ0VOjaJI2P+/uQqRBbm+KLxoEtVmsvunJp67vWB2FOXQ5ydE4ht/QK8sN
	0Q2Cnd49xGNVU9d1FH/baAB1euA8FnuSPU/3HItc5w1OwZXAwuwR38Bn4VHth3rLVTmfnAdCLgz
	0xgN/ZrTKIlqX12gPCwQzotWf64p/1eghOKBPoeHzByh9omkw3HxsrRgZW8HaaKVc=
X-Received: by 2002:a05:600c:c171:b0:488:a894:b27a with SMTP id 5b1f17b1804b1-488d67f0105mr91856815e9.8.1775907789889;
        Sat, 11 Apr 2026 04:43:09 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5c981sm15776447f8f.33.2026.04.11.04.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 04:43:09 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	Frank.Li@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	fabrizio.castro.jz@renesas.com,
	long.luu.ur@renesas.com
Cc: claudiu.beznea@tuxon.dev,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH v4 01/17] dmaengine: sh: rz-dmac: Move interrupt request after everything is set up
Date: Sat, 11 Apr 2026 14:42:47 +0300
Message-ID: <20260411114303.2814115-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260411114303.2814115-1-claudiu.beznea.uj@bp.renesas.com>
References: <20260411114303.2814115-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Once the interrupt is requested, the interrupt handler may run immediately.
Since the IRQ handler can access channel->ch_base, which is initialized
only after requesting the IRQ, this may lead to invalid memory access.
Likewise, the IRQ thread may access uninitialized data (the ld_free,
ld_queue, and ld_active lists), which may also lead to issues.

Request the interrupts only after everything is set up. To keep the error
path simpler, use dmam_alloc_coherent() instead of dma_alloc_coherent().

Fixes: 5000d37042a6 ("dmaengine: sh: Add DMAC driver for RZ/G2L SoC")
Cc: stable@vger.kernel.org
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- none, this patch is new

 drivers/dma/sh/rz-dmac.c | 88 +++++++++++++++-------------------------
 1 file changed, 33 insertions(+), 55 deletions(-)

diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
index 625ff29024de..9f206a33dcc6 100644
--- a/drivers/dma/sh/rz-dmac.c
+++ b/drivers/dma/sh/rz-dmac.c
@@ -981,25 +981,6 @@ static int rz_dmac_chan_probe(struct rz_dmac *dmac,
 	channel->index = index;
 	channel->mid_rid = -EINVAL;
 
-	/* Request the channel interrupt. */
-	scnprintf(pdev_irqname, sizeof(pdev_irqname), "ch%u", index);
-	irq = platform_get_irq_byname(pdev, pdev_irqname);
-	if (irq < 0)
-		return irq;
-
-	irqname = devm_kasprintf(dmac->dev, GFP_KERNEL, "%s:%u",
-				 dev_name(dmac->dev), index);
-	if (!irqname)
-		return -ENOMEM;
-
-	ret = devm_request_threaded_irq(dmac->dev, irq, rz_dmac_irq_handler,
-					rz_dmac_irq_handler_thread, 0,
-					irqname, channel);
-	if (ret) {
-		dev_err(dmac->dev, "failed to request IRQ %u (%d)\n", irq, ret);
-		return ret;
-	}
-
 	/* Set io base address for each channel */
 	if (index < 8) {
 		channel->ch_base = dmac->base + CHANNEL_0_7_OFFSET +
@@ -1012,9 +993,9 @@ static int rz_dmac_chan_probe(struct rz_dmac *dmac,
 	}
 
 	/* Allocate descriptors */
-	lmdesc = dma_alloc_coherent(&pdev->dev,
-				    sizeof(struct rz_lmdesc) * DMAC_NR_LMDESC,
-				    &channel->lmdesc.base_dma, GFP_KERNEL);
+	lmdesc = dmam_alloc_coherent(&pdev->dev,
+				     sizeof(struct rz_lmdesc) * DMAC_NR_LMDESC,
+				     &channel->lmdesc.base_dma, GFP_KERNEL);
 	if (!lmdesc) {
 		dev_err(&pdev->dev, "Can't allocate memory (lmdesc)\n");
 		return -ENOMEM;
@@ -1030,7 +1011,24 @@ static int rz_dmac_chan_probe(struct rz_dmac *dmac,
 	INIT_LIST_HEAD(&channel->ld_free);
 	INIT_LIST_HEAD(&channel->ld_active);
 
-	return 0;
+	/* Request the channel interrupt. */
+	scnprintf(pdev_irqname, sizeof(pdev_irqname), "ch%u", index);
+	irq = platform_get_irq_byname(pdev, pdev_irqname);
+	if (irq < 0)
+		return irq;
+
+	irqname = devm_kasprintf(dmac->dev, GFP_KERNEL, "%s:%u",
+				 dev_name(dmac->dev), index);
+	if (!irqname)
+		return -ENOMEM;
+
+	ret = devm_request_threaded_irq(dmac->dev, irq, rz_dmac_irq_handler,
+					rz_dmac_irq_handler_thread, 0,
+					irqname, channel);
+	if (ret)
+		dev_err(dmac->dev, "failed to request IRQ %u (%d)\n", irq, ret);
+
+	return ret;
 }
 
 static void rz_dmac_put_device(void *_dev)
@@ -1099,7 +1097,6 @@ static int rz_dmac_probe(struct platform_device *pdev)
 	const char *irqname = "error";
 	struct dma_device *engine;
 	struct rz_dmac *dmac;
-	int channel_num;
 	int ret;
 	int irq;
 	u8 i;
@@ -1132,18 +1129,6 @@ static int rz_dmac_probe(struct platform_device *pdev)
 			return PTR_ERR(dmac->ext_base);
 	}
 
-	/* Register interrupt handler for error */
-	irq = platform_get_irq_byname_optional(pdev, irqname);
-	if (irq > 0) {
-		ret = devm_request_irq(&pdev->dev, irq, rz_dmac_irq_handler, 0,
-				       irqname, NULL);
-		if (ret) {
-			dev_err(&pdev->dev, "failed to request IRQ %u (%d)\n",
-				irq, ret);
-			return ret;
-		}
-	}
-
 	/* Initialize the channels. */
 	INIT_LIST_HEAD(&dmac->engine.channels);
 
@@ -1169,6 +1154,18 @@ static int rz_dmac_probe(struct platform_device *pdev)
 			goto err;
 	}
 
+	/* Register interrupt handler for error */
+	irq = platform_get_irq_byname_optional(pdev, irqname);
+	if (irq > 0) {
+		ret = devm_request_irq(&pdev->dev, irq, rz_dmac_irq_handler, 0,
+				       irqname, NULL);
+		if (ret) {
+			dev_err(&pdev->dev, "failed to request IRQ %u (%d)\n",
+				irq, ret);
+			goto err;
+		}
+	}
+
 	/* Register the DMAC as a DMA provider for DT. */
 	ret = of_dma_controller_register(pdev->dev.of_node, rz_dmac_of_xlate,
 					 NULL);
@@ -1210,16 +1207,6 @@ static int rz_dmac_probe(struct platform_device *pdev)
 dma_register_err:
 	of_dma_controller_free(pdev->dev.of_node);
 err:
-	channel_num = i ? i - 1 : 0;
-	for (i = 0; i < channel_num; i++) {
-		struct rz_dmac_chan *channel = &dmac->channels[i];
-
-		dma_free_coherent(&pdev->dev,
-				  sizeof(struct rz_lmdesc) * DMAC_NR_LMDESC,
-				  channel->lmdesc.base,
-				  channel->lmdesc.base_dma);
-	}
-
 	reset_control_assert(dmac->rstc);
 err_pm_runtime_put:
 	pm_runtime_put(&pdev->dev);
@@ -1232,18 +1219,9 @@ static int rz_dmac_probe(struct platform_device *pdev)
 static void rz_dmac_remove(struct platform_device *pdev)
 {
 	struct rz_dmac *dmac = platform_get_drvdata(pdev);
-	unsigned int i;
 
 	dma_async_device_unregister(&dmac->engine);
 	of_dma_controller_free(pdev->dev.of_node);
-	for (i = 0; i < dmac->n_channels; i++) {
-		struct rz_dmac_chan *channel = &dmac->channels[i];
-
-		dma_free_coherent(&pdev->dev,
-				  sizeof(struct rz_lmdesc) * DMAC_NR_LMDESC,
-				  channel->lmdesc.base,
-				  channel->lmdesc.base_dma);
-	}
 	reset_control_assert(dmac->rstc);
 	pm_runtime_put(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-- 
2.43.0

