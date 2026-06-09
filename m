Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB4F391845
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 21:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781041954; cv=none; b=GrDk3MQu0ygSxMjj3mL1mef30nd0jk48lluOpuNk88g2mYVkcZR2RaElmGmEqYkZ++OCPS4XGf6xo2vDAU1AswmWPXyaL4pd9v58/y13Uo819q4wQhtCnB0Vh5nm7zf4j5fcCHqrPngqt62cW3LGIL3FCZ9YK2smN+bgm9TQ6kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781041954; c=relaxed/simple;
	bh=NfZr0e5D6YhuANZdKjC74JZBPJmGJkCn8TNbvEVrL40=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BNR2psF7sdiYUvbMDgssXPup74N+y+MKh9fIdL0gtbaDcamOPqZZmBhRTrZALQo7VFIeopJC97X2ftjPzebogz4d4L9ZGqD/31HosmigRrJCjZM/NE+fxqFABcoXlhZi/H0C/D2smgNK5d+vQ1L7alrrNAn8GygSsS4UxSpeQBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R/033XAn; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R/033XAn"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7f015f87fddso31853487b3.0
        for <linux-sound@vger.kernel.org>; Tue, 09 Jun 2026 14:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781041951; x=1781646751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2tCTNHU1xpDtaN/e/bb3hciPsmmsEARAAxrB9kKSeYY=;
        b=R/033XAnhg3F2YVOllbjiJ94uBNPYaYN/+JlYN1m89UI/77fK0Z9BiHlVQ+lBqHTG1
         vFkbHL7uZ8DjYiB4FRpHfrfYx0RctDbidD3gk/ujIq482KqgesHX8Pr6eouRqMYoY/pN
         AUy8oASU0bgaqoxKvqCas5M8r/Ft41QfzIDA2mNTxFrvpGWwOjms7OIXBp7rt+4Aqysj
         ZMgHrNgbJTumEBgunsOK/LRZu0D+eYt47e2+Y3JoV2KtIrXmIp/Je4SM1MrCRC/3242j
         BN94QubRMLFMFOMirQEWALFuSS+j0uGfyPJ1foJykaiGrvAwcVS6/mZ+d4YpfEDwkLsd
         2gfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781041951; x=1781646751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2tCTNHU1xpDtaN/e/bb3hciPsmmsEARAAxrB9kKSeYY=;
        b=jD8ZyW/dmVA3zFS818fyI1m5K8xiZA8UYqoi5tBIRJzkXutjav9kHnU1VH71D3n/U0
         YEZJ3+R1x5KKdFP4OHuX/kFfmLOPrwqRMobnmjb8BbuWpxe2uzvD4wI67uw+RMD9AXjB
         PlXVfHiHP/BSl6rQaJ2qYPVUJGUqIOAy7HfaeSnSPLTdvZnzMrri/IZ1Z66bQq2hSOzk
         wmVrfQhaamRuU9zTySlNgV0Y/WqW2WIcGPTzgWbKxS4vNPrD0L+wcpCAkh1CVPAgQVf6
         yClTftBsMF8xeTHNofLvRTPu1AVUCtHNf2F+alJkuNbOChBMtXa4NiCABhxd8XLS+uhS
         bi4Q==
X-Gm-Message-State: AOJu0YwncagpklMIheHrpxAG5DxHsMRzcisWIViHvLIp7XPcCLqUJ9Bh
	c3NBxBKHjXgNE004VjeWG+WL6tvvypxA+vNbDsL5/FWznDgpdSSC3t5bvvgW18Ru
X-Gm-Gg: Acq92OGus7XdAtTx2uFc7KCoGjmQtEYD/5fj6mx9f617GDmqAkSL6Q3kbxuBLCExsfR
	t22+Y4OuwX36UZguODyyuB5um2CTHcV/dYJdTJuFi/ybEbD65eI5IG33gBXgMRkkIibmTuwv4Rs
	OokVflJsE7lTAeW0bHk6boZe/8dB7bwReKXNnwBDveiGk98UukppmeKS+ISRpUGZyyYHoD67WQ0
	hgRCgiNlRd/jp+OGonCnBqQqZmlXYrIWpPbFzWF0ziPIJwmkCr3G9uu4xpxtAZtF4YXQXDopVEu
	X1y2xCalrYSjnXa0q1iQMV9eM3oKiXP9J45Rodum/pQSqbETsPoCzvh+TRITcsck/eB/4Z6p73B
	u7pYi6V6FiqflBdtFm9nPPGHJ25LMcnDC3vv3KGOz3EWIYAUP0cEw5J/Hxx43s4a6FSu8ZkyV1K
	5S18DXTecpa66tGoT4g9AK8FSqZLLWL0NDTTqnJTGZ5n/43cvTMEepd+5m8hmhL0FHunABFZCI3
	+HQgxYujqMpTWvmOL+MoilRh7ioYSetBIbcVMCL+F2UdBvQxVgdf+Sb
X-Received: by 2002:a05:690c:6804:b0:7cf:eae6:7e8b with SMTP id 00721157ae682-7ed525f4015mr163227957b3.14.1781041951050;
        Tue, 09 Jun 2026 14:52:31 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7f005518c41sm36408427b3.29.2026.06.09.14.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 14:52:30 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ASoC: fsl: remove Efika audio fabric driver
Date: Tue,  9 Jun 2026 14:52:12 -0700
Message-ID: <20260609215212.28713-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Efika 5K2 is an OpenFirmware-based PowerPC board from ~2006.
The platform code (PPC_EFIKA) and its sound driver have no in-tree
DTB references and the hardware is long obsolete. Remove the driver.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 sound/soc/fsl/Kconfig              |  8 ---
 sound/soc/fsl/Makefile             |  1 -
 sound/soc/fsl/efika-audio-fabric.c | 92 ------------------------------
 3 files changed, 101 deletions(-)
 delete mode 100644 sound/soc/fsl/efika-audio-fabric.c

diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index 8ae59c094878..86be309158fa 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -250,14 +250,6 @@ config SND_MPC52xx_SOC_PCM030
 	  Say Y if you want to add support for sound on the Phytec pcm030
 	  baseboard.
 
-config SND_MPC52xx_SOC_EFIKA
-	tristate "SoC AC97 Audio support for bbplan Efika and STAC9766"
-	depends on PPC_EFIKA
-	select SND_SOC_MPC5200_AC97
-	select SND_SOC_STAC9766
-	help
-	  Say Y if you want to add support for sound on the Efika.
-
 endif # SND_POWERPC_SOC
 
 config SND_SOC_IMX_PCM_FIQ
diff --git a/sound/soc/fsl/Makefile b/sound/soc/fsl/Makefile
index d656a9ab54e3..367dbbd690be 100644
--- a/sound/soc/fsl/Makefile
+++ b/sound/soc/fsl/Makefile
@@ -52,7 +52,6 @@ obj-$(CONFIG_SND_SOC_MPC5200_AC97) += mpc5200_psc_ac97.o
 
 # MPC5200 Machine Support
 obj-$(CONFIG_SND_MPC52xx_SOC_PCM030) += pcm030-audio-fabric.o
-obj-$(CONFIG_SND_MPC52xx_SOC_EFIKA) += efika-audio-fabric.o
 
 # i.MX Platform Support
 snd-soc-imx-audmux-y := imx-audmux.o
diff --git a/sound/soc/fsl/efika-audio-fabric.c b/sound/soc/fsl/efika-audio-fabric.c
deleted file mode 100644
index 4d3266d9cbb7..000000000000
--- a/sound/soc/fsl/efika-audio-fabric.c
+++ /dev/null
@@ -1,92 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Efika driver for the PSC of the Freescale MPC52xx
- * configured as AC97 interface
- *
- * Copyright 2008 Jon Smirl, Digispeaker
- * Author: Jon Smirl <jonsmirl@gmail.com>
- */
-
-#include <linux/init.h>
-#include <linux/module.h>
-#include <linux/interrupt.h>
-#include <linux/device.h>
-#include <linux/delay.h>
-#include <linux/of.h>
-#include <linux/platform_device.h>
-#include <linux/dma-mapping.h>
-
-#include <sound/core.h>
-#include <sound/pcm.h>
-#include <sound/pcm_params.h>
-#include <sound/initval.h>
-#include <sound/soc.h>
-
-#include "mpc5200_dma.h"
-
-#define DRV_NAME "efika-audio-fabric"
-
-SND_SOC_DAILINK_DEFS(analog,
-	DAILINK_COMP_ARRAY(COMP_CPU("mpc5200-psc-ac97.0")),
-	DAILINK_COMP_ARRAY(COMP_CODEC("stac9766-codec",
-				      "stac9766-hifi-analog")),
-	DAILINK_COMP_ARRAY(COMP_PLATFORM("mpc5200-pcm-audio")));
-
-SND_SOC_DAILINK_DEFS(iec958,
-	DAILINK_COMP_ARRAY(COMP_CPU("mpc5200-psc-ac97.1")),
-	DAILINK_COMP_ARRAY(COMP_CODEC("stac9766-codec",
-				      "stac9766-hifi-IEC958")),
-	DAILINK_COMP_ARRAY(COMP_PLATFORM("mpc5200-pcm-audio")));
-
-static struct snd_soc_dai_link efika_fabric_dai[] = {
-{
-	.name = "AC97",
-	.stream_name = "AC97 Analog",
-	SND_SOC_DAILINK_REG(analog),
-},
-{
-	.name = "AC97",
-	.stream_name = "AC97 IEC958",
-	SND_SOC_DAILINK_REG(iec958),
-},
-};
-
-static struct snd_soc_card card = {
-	.name = "Efika",
-	.owner = THIS_MODULE,
-	.dai_link = efika_fabric_dai,
-	.num_links = ARRAY_SIZE(efika_fabric_dai),
-};
-
-static __init int efika_fabric_init(void)
-{
-	struct platform_device *pdev;
-	int rc;
-
-	if (!of_machine_is_compatible("bplan,efika"))
-		return -ENODEV;
-
-	pdev = platform_device_alloc("soc-audio", 1);
-	if (!pdev) {
-		pr_err("efika_fabric_init: platform_device_alloc() failed\n");
-		return -ENODEV;
-	}
-
-	platform_set_drvdata(pdev, &card);
-
-	rc = platform_device_add(pdev);
-	if (rc) {
-		pr_err("efika_fabric_init: platform_device_add() failed\n");
-		platform_device_put(pdev);
-		return -ENODEV;
-	}
-	return 0;
-}
-
-module_init(efika_fabric_init);
-
-
-MODULE_AUTHOR("Jon Smirl <jonsmirl@gmail.com>");
-MODULE_DESCRIPTION(DRV_NAME ": mpc5200 Efika fabric driver");
-MODULE_LICENSE("GPL");
-
-- 
2.54.0

