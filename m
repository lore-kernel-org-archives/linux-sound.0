Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26756399015
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 22:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784674490; cv=none; b=rgAXipeNBDDhEO0TAZSCCsKdO6rLvmAYy64UX66ON5jhRpdanMrPp5U2w6cC+/6IUPUvQFzLqKQ6O8oWCAngUkxp5Z3QUvuPJ3S/FHwdoypmshwM2vgfUN6/nfwsxVdZYUanLA3Ha2deA3fXizHtJSHbFONkkPQDAr07amezUtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784674490; c=relaxed/simple;
	bh=l3T1ZwxPhm4j4ZjqPoXWyL63holaH//cXTmXIHO2F4o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RCPg+DnSCcIjqqJV8EsuPtBUBv2DmuO1+KXpl3uMTvi7DcTX4rz2aW0IJDZFAHzYqr1Bjtw76yRsjPgYiKMvWLsqf582PfG4gZtX9/0MmdZY1xndxBgFd78xtZP1YZlBwgl83DrVDGYMhIcNxhCqiQd78ZFM/CcHHXPnKB96XUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=guuXt6Bz; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="guuXt6Bz"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38df94d4dd8so6239267a91.2
        for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 15:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784674484; x=1785279284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QbIg1IxIIpMZeFpgIXtG09JmNMcRp9S88gerpDxWPSU=;
        b=guuXt6BzzNugTK7uleB5xqNJijdLpScNGE6y38pBPMcE31gDrPb1lIi4sO22lmjWe0
         0DWAec6W0RxkG0gNzWarl8mQHJ6g8Psv3DHsQh4BCHmV91tRyrsDUCQwWxZq4oY47yVX
         Fo05FOgD9Hk3ibKfItKcU8H5bAQeuhhdiUr+cq+6EOclXDJ+pe/wDWanDBbYgR3mA5w1
         FS4qrWdY/3/90ALEonaYZxa1ryMXVJxHooRbjg2kUcwPeC9+NL5p3FlJ1EInbVM0EItG
         76E2p3d9xTyPvDpjZqAhYrMtB0x0AZ/5qXPYsHVd9KFc+Ef8eDgXfUhWq0F6O/0KUu+D
         CBLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784674484; x=1785279284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QbIg1IxIIpMZeFpgIXtG09JmNMcRp9S88gerpDxWPSU=;
        b=fxHKi8d3pxVpMxA5YdUDRkV0IeBWfdUOh6x6iBNRhHSEwC3pW4vRWYzXc2K4/WIjHt
         ccXLqEJu3XuGSUjz5U5jGe8+Fi/zDRgjkgdXzApMNUK8FkQrB15PqiY4oB5i7hCzLES2
         hzhkV3ve52wnNyHYKlgCJCfddx/07OPbz+kEwSZlweFFfr9oyzZVKYx+0TTCtJdCGhcK
         XrapvIiCrZIztnQQwzMnyZLv1nidig420gOzmwMZgwia0QVrrBk+pJt3+eOOmN6TJL1M
         vFDBPfAhD1JR81ncIUjYE4D2Jcn3th4MywkcfO4hM+2nnafXxcvBapB/atXrdU4+41Jp
         rPTw==
X-Gm-Message-State: AOJu0YyC7mEveI61olg3fMnDkJfIgzZrV+dp+MGGZ6OTbnqhMdQeuOe+
	jRTikJ9fB7oenmEPiuosWlp2MeW7MvU/t9LCmvqxxjF8gCssogl+jYNAZtrzOxG7
X-Gm-Gg: AR+sD11j13gelpq6UUZ/YcdI1ySwOPJqFmsUMcxtebt+1WE8r/nAgM3X1bHjnLyWJsk
	6wg2Tz0ieBSIx4+VUVf/tAVI9lGB0l5zTC/QTdXZgKzP/6ZErlXCGHW3joFrZniftS9bnRKi7ZW
	C/07nwoSSaKQ8mi6wMrMZkrG83Hjon+yQW3tJqSVWl9+uU/+TY53QR53lhjZsFaHhnHPSjLrFK5
	/RnwTT+pIhw5GLtKq9Eo0XRViyFNXzeGz8d+X9aNgImltWe2vlYLgyb6js1+172cTS9qgs/kWaW
	o8B/65AvAhXX8sNHwvAhLy8gF/fvizgB73ocCYXC9p9L9UgJd7XRDAQOjgcrZ7TpeFpAnY2Dm7+
	B5tzP3akKw+PcOrK6fzVXqdsXaefypEJlG6MketkOV14AFIMrZWHgqwCRDzJWNksl8Lf2Ix6efl
	niYYQZPZuuxbWTtl7hc20udMmC9dne6MbfBg8Au2hjimdNKpSz5iXob/TRDKoX9s5sKxDCYXsdz
	t0rhleFvgQu9FeoyaiEx4Lgky756U48dhrdTlXNaxbE7DvJZG21cs6OGrGIFIF6rg==
X-Received: by 2002:a17:90b:2ec6:b0:38e:6a44:671b with SMTP id 98e67ed59e1d1-38e6a446b78mr8745830a91.0.1784674484427;
        Tue, 21 Jul 2026 15:54:44 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38ea7aff836sm39369a91.15.2026.07.21.15.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 15:54:43 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linuxppc-dev@lists.ozlabs.org (open list:FREESCALE SOC SOUND DRIVERS),
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] ASoC: fsl: dma: use platform helpers and devm cleanup
Date: Tue, 21 Jul 2026 15:54:42 -0700
Message-ID: <20260721225442.817787-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert fsl_soc_dma_probe() to managed APIs. Replace the open-coded
of_address_to_resource()/of_iomap() of the DMA channel registers with
devm_platform_ioremap_resource(), and irq_of_parse_and_map() with
platform_get_irq() (which returns a negative errno instead of 0).
Switch the allocation to devm_kzalloc() and register the component via
the devm variant, dropping the now-unneeded error-path cleanup and the
manual fsl_soc_dma_remove().

The SSI node's register resource is still read via of_address_to_resource()
to compute the SSI FIFO physical addresses (dma->ssi_stx_phys /
ssi_srx_phys); only the DMA controller window is mapped.

The DMA controller register window is owned solely by this driver, so the
new region request from devm_platform_ioremap_resource() cannot conflict
with another claimant, and it is mapped exactly once (no double mapping).

The local channel pointer is declared as void __iomem * so the
devm_platform_ioremap_resource() result can be stored before assignment
to dma->channel.

No functional change; built for powerpc (allmodconfig + CONFIG_SND_SOC_FSL_DMA)
with LLVM=1 and sound/soc/fsl/fsl_dma.o compiles cleanly.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 sound/soc/fsl/fsl_dma.c | 68 ++++++++++++++++-------------------------
 1 file changed, 27 insertions(+), 41 deletions(-)

diff --git a/sound/soc/fsl/fsl_dma.c b/sound/soc/fsl/fsl_dma.c
index b12474880185..b1b341132dd6 100644
--- a/sound/soc/fsl/fsl_dma.c
+++ b/sound/soc/fsl/fsl_dma.c
@@ -18,8 +18,6 @@
 #include <linux/delay.h>
 #include <linux/gfp.h>
 #include <linux/of_address.h>
-#include <linux/of_irq.h>
-#include <linux/of_platform.h>
 #include <linux/list.h>
 #include <linux/slab.h>
 
@@ -824,9 +822,34 @@ static int fsl_soc_dma_probe(struct platform_device *pdev)
 	struct device_node *np = pdev->dev.of_node;
 	struct device_node *ssi_np;
 	struct resource res;
+	void __iomem *channel;
 	const uint32_t *iprop;
+	int irq;
 	int ret;
 
+	channel = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(channel))
+		return PTR_ERR(channel);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	dma = devm_kzalloc(&pdev->dev, sizeof(*dma), GFP_KERNEL);
+	if (!dma)
+		return -ENOMEM;
+
+	dma->dai.name = DRV_NAME;
+	dma->dai.open = fsl_dma_open;
+	dma->dai.close = fsl_dma_close;
+	dma->dai.hw_params = fsl_dma_hw_params;
+	dma->dai.hw_free = fsl_dma_hw_free;
+	dma->dai.pointer = fsl_dma_pointer;
+	dma->dai.pcm_new = fsl_dma_new;
+
+	dma->channel = channel;
+	dma->irq = irq;
+
 	/* Find the SSI node that points to us. */
 	ssi_np = find_ssi_node(np);
 	if (!ssi_np) {
@@ -842,55 +865,19 @@ static int fsl_soc_dma_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	dma = kzalloc_obj(*dma);
-	if (!dma) {
-		of_node_put(ssi_np);
-		return -ENOMEM;
-	}
-
-	dma->dai.name = DRV_NAME;
-	dma->dai.open = fsl_dma_open;
-	dma->dai.close = fsl_dma_close;
-	dma->dai.hw_params = fsl_dma_hw_params;
-	dma->dai.hw_free = fsl_dma_hw_free;
-	dma->dai.pointer = fsl_dma_pointer;
-	dma->dai.pcm_new = fsl_dma_new;
-
 	/* Store the SSI-specific information that we need */
 	dma->ssi_stx_phys = res.start + REG_SSI_STX0;
 	dma->ssi_srx_phys = res.start + REG_SSI_SRX0;
 
 	iprop = of_get_property(ssi_np, "fsl,fifo-depth", NULL);
+	of_node_put(ssi_np);
 	if (iprop)
 		dma->ssi_fifo_depth = be32_to_cpup(iprop);
 	else
                 /* Older 8610 DTs didn't have the fifo-depth property */
 		dma->ssi_fifo_depth = 8;
 
-	of_node_put(ssi_np);
-
-	ret = devm_snd_soc_register_component(&pdev->dev, &dma->dai, NULL, 0);
-	if (ret) {
-		dev_err(&pdev->dev, "could not register platform\n");
-		kfree(dma);
-		return ret;
-	}
-
-	dma->channel = of_iomap(np, 0);
-	dma->irq = irq_of_parse_and_map(np, 0);
-
-	dev_set_drvdata(&pdev->dev, dma);
-
-	return 0;
-}
-
-static void fsl_soc_dma_remove(struct platform_device *pdev)
-{
-	struct dma_object *dma = dev_get_drvdata(&pdev->dev);
-
-	iounmap(dma->channel);
-	irq_dispose_mapping(dma->irq);
-	kfree(dma);
+	return devm_snd_soc_register_component(&pdev->dev, &dma->dai, NULL, 0);
 }
 
 static const struct of_device_id fsl_soc_dma_ids[] = {
@@ -905,7 +892,6 @@ static struct platform_driver fsl_soc_dma_driver = {
 		.of_match_table = fsl_soc_dma_ids,
 	},
 	.probe = fsl_soc_dma_probe,
-	.remove = fsl_soc_dma_remove,
 };
 
 module_platform_driver(fsl_soc_dma_driver);
-- 
2.55.0

