Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445639;
	b=0C+zmu4RtxrXSrB9/u8dV+TpwiyW+5Rq5vxQlzVHFDoFIAKlzjhxp8AXm7nCI6EfYD1p
	 T597kEBUgoAAwPto+SGftFWmUNX3ligS+w/V7rHR/PmK5ME/E9tYY7vQzfa4m2F22IYcB
	 GtQ0/1+D8fi4NkrvWC/72T/69NU01acXfd0WyUZ3s+Q/eL3fLgunNWxjsZ4/XeFZ0l8mX
	 pcMRGlKDy7hgEHLcJSAPiRBhUxyY2Ee3VLsTJIei6XOV/68r+yG34RzrJrAvD+NsuZ/TV
	 FaWx+pqv0KFoxIdd4z7iRaUhBlY3msFbVkcDLhChnpAfSvoF4LDPAXYEM4f+cZoCNgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445639;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=R4tDEGiURQM1Arylz9v3qFzT8K+oOXwhYEhcFQrcNqk=;
	b=O5rZgndWT2R0IElHEkAS03ZL1H/TXqnwgsoQFYUYFaDV9vYPkPOawvJbbk4D9GmbVJ20
	 DRwrSzmie8+eVRGgNw4Ez0Gx/0ZY9Syag27fBGxMvCgE0vSqt65O575/14RywgSn17wAw
	 eU4xUtNTTB5NwzOsaQcjT0Dk9SHjlWpfJEeyyjiI5JG1uYA4A0MXKi7b0z1gqKF2H4AhM
	 pFN5svb3onX6HEIvlOJ00/oMIOGKCum8ba1Q2L2NtnY77Srb00SRUHodrRE2NaIdFcoQo
	 pyVBPt9Rd/P9Gu1RpaPZQsfg3QHzN2pfFBv7JmKOE7UWdEerVaBBGWjQ4B1GcQhoQ2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ZXg8n3IQ;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F98A60A6F64
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 14:53:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F98A60A6F64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ZXg8n3IQ
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-49a92144733so1636585f8f.0
        for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 06:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445637; x=1796050437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R4tDEGiURQM1Arylz9v3qFzT8K+oOXwhYEhcFQrcNqk=;
        b=ZXg8n3IQn27O0EAhb1QV0uH9WnWcXpQh9UD9Fvi2XTr2ASnA2yqy5YIIR0EGymdyk9
         g7EAMbPzyM5DOd0ZgSgIkkAED/fKpca6LzxdnKBGE+EMIbOwm7Y8k9L8fpshjuWqU3iR
         hWyi1JtgEKqmmEjZ7T4mZWKTcDiwAjKST/MmKcbhG7GHFy9PUYr3l4I8uu5doG0Rf+8h
         Jv/Ja/9M7YI2u9z1sGUcRe58XaSmCFSWsjkJ8aV5PXNK/ARgkcE8azAKcvlAJdWZtKKo
         3a3x+7CfZ0Cm9jx6aBVsHvAaXnRmugE0fMfySQmQUcyKwaoSaLwmt7mG6/Kzft3ZUXoq
         LEpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445637; x=1796050437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R4tDEGiURQM1Arylz9v3qFzT8K+oOXwhYEhcFQrcNqk=;
        b=Z6essYphpb0Pkg0kM36csu8PTv01onHJ4MmNgP7gmd9t3g9TvyRrTWNtjOJhT9Bu96
         dJaq3KMGVO3W8Vq9w5jDQ8nWI9Fmse+AhqC/S+fUHnzWkYV2dtg8sKz9CjsYGd10YJh2
         g1tur+XjrztxxiGHF0gCTrf7phOgG9AR+/y7D1nhAC5C0IrFP4piZbZyod3swhjNcuBw
         BNRBeMFk9IfT1LIFFkDgKqTxop/drNHR8cq40O4JLzz0vvmhQMstOewX2TgJPg8M7BM4
         a3myXasY9tOYhVnAOhr/GyZdu7g4jj5U48onFUubvAnurZHgpv1RGxmQq5wJDnDd7MR9
         n+Gw==
X-Forwarded-Encrypted: i=1; AL+hErF8mKfssktMvVE5TLE9dgOhf2g4+ub0aUdHjPd87QJDN0ICdyh5kok06M/HIuGFn/8xIA1LrxPNJmJWNA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+vxkhR0Gxy+fzE6cfGOSbOaqS7rbqarSjQZ28uthBB2AKAoyVB
	iAjCfsnt7MQpuHqrBbnF9wVBve4nzL26m+grn2H4K8kO7rc5seAqN1eSeQtlfWwkdFg=
X-Gm-Gg: AZFdTZdDn0K77gfzwed1uZDwzPAxAY94oTG6IW9ZGbkfVfeqq8o63FTC9bfCfJuWjNA
	06O1ydVaeoX53CGsSlw6j0b2I/aH5KqpzMQI5/iRaN9UiW9a3AP4rW91pBs/brCcuh66AEm5LUj
	UDScwAZU9VXox9DXPyGpvzCBWDLhASTEUwdgKiXROIHuCPVeW3wfDMeX/WClS7C6FQSdTztTSQq
	uZndl8Og8bMZxD5PxrUOqJl8B1C7YdQcvizgHdEBsm7v4ua9dCk2qkKyWBWf8UFV/IRjB8J5EjP
	3dz/4WqFYPs6o0GuBGPZo+OwL8FkCQY3k14mpUHDQmXKJDIIw9r8HCSqZzMtjwhFNYz/nysKnS8
	amCMShisPVFEA8gXJkziXIiwTUcLB6yA+RfXNU8RHveM1sg0UWOKqtE30zBKQO5vZ8f+bd2Mvlt
	KrkdRR7TgZ2HeOiC3aSnX+D7kdVA4K/ntJhLdZUwYhlH1guVVJigTRWHJzJgKFGOO++FFNhb2ZX
	Y/7Jast2rWqHjdz5HNn6ekX0XL8u78TY0OOOT3DAqmW4K03WA0VFIxEJxYy1bNV1zZhPebccVot
	xPRAFARkEdQSyoFrVZIYi4e6/WjjYOBniEVRnSqa2qjDslv4
X-Received: by 2002:a5d:5d82:0:b0:4ac:7595:6f68 with SMTP id ffacd0b85a97d-4ac75957253mr19069216f8f.36.1795445636715;
        Mon, 23 Nov 2026 06:53:56 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm22292067f8f.10.2026.11.23.06.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:53:56 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dom Cobley <popcornmix@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrea della Porta <andrea.porta@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: [PATCH v3 17/28] ASoC: bcm2835-i2s: Pass the CPU physical address of the FIFO to the DMA engine
Date: Mon, 23 Nov 2026 15:56:55 +0100
Message-ID: <20261123145728.29082-18-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261123145728.29082-1-andrea.porta@suse.com>
References: <20261123145728.29082-1-andrea.porta@suse.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The address of the DMA slave is handed to the DMA engine through the
dma_slave_config, where it is meant to be a CPU physical address that
the DMA controller driver translates into its own view of the bus. The
driver instead reads the untranslated address out of its reg property,
which only happens to be what the BCM2835 DMA controller expects because
the DMA engine driver used the address verbatim.

Now that the DMA engine driver translates slave addresses itself, use the
CPU physical address of the register resource, which also gets rid of
the open coded parsing of the DT node.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 sound/soc/bcm/bcm2835-i2s.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/sound/soc/bcm/bcm2835-i2s.c b/sound/soc/bcm/bcm2835-i2s.c
index 208977828254..ad95412cc8b5 100644
--- a/sound/soc/bcm/bcm2835-i2s.c
+++ b/sound/soc/bcm/bcm2835-i2s.c
@@ -30,7 +30,6 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/module.h>
-#include <linux/of_address.h>
 #include <linux/slab.h>
 
 #include <sound/core.h>
@@ -843,8 +842,7 @@ static int bcm2835_i2s_probe(struct platform_device *pdev)
 	struct bcm2835_i2s_dev *dev;
 	int ret;
 	void __iomem *base;
-	const __be32 *addr;
-	dma_addr_t dma_base;
+	struct resource *res;
 
 	dev = devm_kzalloc(&pdev->dev, sizeof(*dev),
 			   GFP_KERNEL);
@@ -859,7 +857,7 @@ static int bcm2835_i2s_probe(struct platform_device *pdev)
 				     "could not get clk\n");
 
 	/* Request ioarea */
-	base = devm_platform_ioremap_resource(pdev, 0);
+	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
@@ -868,19 +866,12 @@ static int bcm2835_i2s_probe(struct platform_device *pdev)
 	if (IS_ERR(dev->i2s_regmap))
 		return PTR_ERR(dev->i2s_regmap);
 
-	/* Set the DMA address - we have to parse DT ourselves */
-	addr = of_get_address(pdev->dev.of_node, 0, NULL, NULL);
-	if (!addr) {
-		dev_err(&pdev->dev, "could not get DMA-register address\n");
-		return -EINVAL;
-	}
-	dma_base = be32_to_cpup(addr);
-
+	/* Set the DMA address, the DMA engine translates it */
 	dev->dma_data[SNDRV_PCM_STREAM_PLAYBACK].addr =
-		dma_base + BCM2835_I2S_FIFO_A_REG;
+		res->start + BCM2835_I2S_FIFO_A_REG;
 
 	dev->dma_data[SNDRV_PCM_STREAM_CAPTURE].addr =
-		dma_base + BCM2835_I2S_FIFO_A_REG;
+		res->start + BCM2835_I2S_FIFO_A_REG;
 
 	/* Set the bus width */
 	dev->dma_data[SNDRV_PCM_STREAM_PLAYBACK].addr_width =
-- 
2.51.0

