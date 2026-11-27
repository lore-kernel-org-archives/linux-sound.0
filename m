Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781948;
	b=KKllkQecGJ6hs60R8uLU78Xu2RHh4Sv9NSekggeWjorp1QUDg9LUD4NiFzopF5mHWPOW
	 mZhbi7f/Vpqd312B+IbOBcTqe62l1H9/Plqtjdz6rQzGd34M0qtVA9uok0jkg4HrPqItB
	 SyDIEIcFA2gXx+NQ+CsIRhCBAc/8pGlrA7PNCLINu7IP7dczsU0bCuPkcIWiQcXqb9PGa
	 3f7Db0qSxtRLCCY7Rxlwif7RKkifMCLelkqO+XRkX1UQW4u98YJOc9EhPoV9DO5ivII4C
	 SXYUb5l0XSF81y4800PX2Ezst8a++iHHlLe4YQnTFmfkLYBYAx6U9IeLC+eGSyn0qYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781948;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=R4tDEGiURQM1Arylz9v3qFzT8K+oOXwhYEhcFQrcNqk=;
	b=lwvJb2SUE9gUh4F5cQrkCwi6ALE6//eImPF40AQJbSf4nU/jpwporw46ubf4UNDrW3lK
	 fvMYzx2IseAus3ThsQDGc6E5eLn6w8eXdDSeSNwuVvf0YgwW0ThmKsggcPRqwOST6jw7i
	 D2thQ2k1PYjkc3kMIFhLgo75Ne7Vf3ic4Cp+3rdGy568GHX62EtcUc91KfrqysVvUg9ZS
	 YSBDH06bxLfP4ckgw1R+18ujnDrBouoE1RAwWJOCTv5SrH3huwCkeLCEMaIJcCl3AUx7n
	 Dbm9bsI+h6FXLI6f5dA4NLyUzfzhKguXq36og5sZdIaP0BZI6yGjPa4QY7VHLzWJBPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=cK7VwD4l;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4763660A5BE1
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 12:19:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4763660A5BE1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=cK7VwD4l
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so5447123f8f.3
        for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 04:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781946; x=1796386746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R4tDEGiURQM1Arylz9v3qFzT8K+oOXwhYEhcFQrcNqk=;
        b=cK7VwD4lhiEURNmrx0uRZYLZwsRUZX9XwpeDLu685DQ/eBv0y4nmUjDgVBok9vrqJ2
         MRZlocRElF4uFOlhpGZfJJxce2M5zbNRfdcwhh7wZDUq553Swtkac8kwNq30pCLl9ecT
         8JGfgoPQZIWpohDlOHOT0Ph7vonifkWou1dg0DiBOO/rohzEnjuy7ynFTXsTELHq2ezB
         J6aG05JPBIVhfXAfcwnBDaT0luBHM5Q0MsN4qZXR3rsnaRq0ycmZqy3mpcd9QuGyH/vC
         AHcgkQ5LHT1bQadT69LdoRYEYXonfOJHMLzfwwjB+UgW4INoXSxIx4IGucob/t6iJibi
         yO8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781946; x=1796386746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R4tDEGiURQM1Arylz9v3qFzT8K+oOXwhYEhcFQrcNqk=;
        b=pX1XvXSTFBeU7wpxrw9AvEcPxaTdfyrb6qtp7e8sthwNl9Y/IErXuF0r88un9thE8P
         qORgUh9nTYQenqxHGu+pW0RnvZyZ450VsoVx0RnF5mXgWiTN3M5kRy1s527i4WkiofFt
         qHH+ULHAay3BKD6A6Pj4LIf6XWRs7gM0q8+wUopLH90fuZU8wRaUUMNCLQ5ckInhPLZ/
         cFBgoxQewTX2gh1RjuXY5gKYdAqqg3ooSJGsu7pDyncvFHLqEJ8pQuCJA/Brv4atza0e
         m8uydP13RnAbvbqzcWb4AS/cNc2K9E7agfYkuXgFQJcCVL5eP86qMSiUzghlMxeFIHgu
         iLxg==
X-Forwarded-Encrypted: i=1; AL+hErFOpVo1+gxhqfN7AL9HhGREM35tEDWYaqrh3YK75xLb1ed6T2+lI/xFDHOjRWafp6XX+wTZ9TIZsjK3Qw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+SEi5d7GqOlJgRqAa78xNUh5hg4nRXG0r6dsIFh8N0CeI8hi0E
	iPdZIn2JXuONQFZqpT35XF1k2YUpreQipdAVrtBkXkHB9Wes7EEUUutzQPBl8x8Qwr0=
X-Gm-Gg: AZFdTZcU/utb4p/ki/ZeBrrXGAiI/woKQI0jdE5b2aHLZ0o8Gy87owPFgqpEuGIaU8z
	dxzwNlk1OuKMN8Szc0xcjd6r+wUDk1c5AFXhsykEavtDl+z7zPgT4Ks1xioPpQyGvWTfDzZSBQ4
	aAqwAPXbucZa0gtRl/WQc473vnvLVB+sTxg7M+0ce0I3P5p/+OT+caQsMMJPHKWr1TaLEFL2ruo
	PCBuQ0lM68bVuM74yo+eM2iFdRBD4COzbL49/Ymr8MSNAfgtUR8B1LY4wbj2wyNFrxrGtwbgzeY
	Y9/T9iqXAFVpVpr7ZRs08FCUkcKRbB21BinQl+p2NRyM1APYDmprNq2LIStlDqKFbQNEknBookm
	+CJzfDQkNa3jLkSqQLlj2RhqM4rS322PqgUz9U91HaBo3g6VK8TIMvTcbiG0NGqGXJyirGmYNC1
	AJ9xpCJVZ4S/lLTb7cdODafXiqEzXikrOC0rdrYcQ3TsZEPuC2gMakFsLFElVWrIfcEPUBMjJlq
	D4SnTWbYic4yROeIpDRLKoQbR3F9gisk4Hh6II/CEPM7yBcGFuA/97ESV2rbfUJelW8mfRYSWL4
	D/xNMsmPiWNZvpmEpkN82vGESPMR
X-Received: by 2002:a05:6000:2685:b0:4bc:9b4e:62c7 with SMTP id ffacd0b85a97d-4bc9b4e64ccmr8999178f8f.45.1795781945689;
        Fri, 27 Nov 2026 04:19:05 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4bef07f9e0dsm3454109f8f.53.2026.11.27.04.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:19:05 -0800 (PST)
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
Subject: [PATCH v4 17/28] ASoC: bcm2835-i2s: Pass the CPU physical address of the FIFO to the DMA engine
Date: Fri, 27 Nov 2026 13:22:07 +0100
Message-ID: <20261127122236.4976-18-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261127122236.4976-1-andrea.porta@suse.com>
References: <20261127122236.4976-1-andrea.porta@suse.com>
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

