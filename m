Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD68126C03
	for <linux-sound@vger.kernel.org>; Sun,  3 May 2026 00:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777768254; cv=none; b=TaeAEhQBdPMdXJXoGAjTedz7m+eViSu9pEmDvStNfbBF9q0yQvEe9dNILRhYjP8rVew7tb1XqRDKeiArP+VGO1jTsslIS3r8Zw1uNGaMgPjCmFHwiBSEqV4TQ/SXjDGjDA/RnQPJ7kkfiemlHUNNDOPnDqW2dS01sXfbPUIq+KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777768254; c=relaxed/simple;
	bh=N4Oewy83+Tf/MQeuvG7fpzvA1Aszha9anFzqTZugG0A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Mu/Mc2KdWcjSeCOT+M5uif7clkQ/u0yKc7syRtzIrZyWLLe7E5qmibp+gJUEv7PBkybyr/W6Nho9sa59GvFivrJdAM5OGw18IOv+90zPmTa4GMQeDlkqxB//PtCj+LJd6YdMRIMEOdCQDnSIdJZC4swWdgRfvMFcLlYUWeT1JMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hPjCbDfq; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hPjCbDfq"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8353fd1cb5fso104511b3a.0
        for <linux-sound@vger.kernel.org>; Sat, 02 May 2026 17:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777768252; x=1778373052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2cqtN6UxMZDT/bmefPZMzQI/MaSXcFcM6J1zz/t6mH8=;
        b=hPjCbDfqOIYxyAYnFs5HLlGwKMxVf5NDKQTQt29hcQc9/JY9AKo86YOSG3SD2eTuiS
         oqMgwiLlookbhcBR1UEja0SUwEkE4BYlbco2Pf02rF1zpsPMlp0vC4rEh69dRvzsZwH5
         KsS1VEXKYPOBEdH++9ukyselT3Lkfav5ktXq398EIxlELnjv61JK67wA4iFQhYgT84AQ
         LFyQdoqpJUq9G5TGXY3u3pgpm/y6YURmLdkXPKNt89w9KLa4W5x2D0Lr5B5b3H3duv6t
         u3Y4trT/kta3Iiu4BDzYxXTWmqFsdoQnqiILx6AzsGBoWQBe1Kjjj2TgouBtNZh82syw
         GM/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777768252; x=1778373052;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2cqtN6UxMZDT/bmefPZMzQI/MaSXcFcM6J1zz/t6mH8=;
        b=WkpQsPYzYJ4hFCmbBBcMWCUhLKhZUiXBUn6kcQLcnrGpQ2iAkK70vP3Q2WeNdRfF1P
         BuIZxA3yqP6m/ILZ0JDvgTnjKgS45WryamTVvxEz/C9lMbCBrCVJiGn7e0pbflIfEyGW
         qGSP4DBCLQx8L/sQQHzpU6/u7XuBeRREgqipk1quhfPFzGGgM/S5L9J69Q2k1GfKREl6
         n2VC59HtPUnQyGjG/jbwqSB8i/YyMgSfn2ffWjnudUdA1NCG4R5AWeDmJBkcAJyzIv50
         6kh3Dg2N9TK9KmHN8KPD2jbLh53HyL/w1RMhup694JdVxP5Ejw0/hvSf4ZgoSy+aQt0N
         dQhQ==
X-Gm-Message-State: AOJu0YxKmh/jQ0JLldG2F1Wke1WBd9edbhuv1vBJu0fJmfPAkFZ3jhrT
	u3aO/OLwHL9yRMW3FMuXAQTLP9R4zQwKi9D/TxLeQwSwC0oYbTR9aLrIi82ObA==
X-Gm-Gg: AeBDietLobmC1rzEiLcyt2VaOw2NvdvLGysqiGYBmYRWsScEZMO3xsLgMGD2qAFzCnC
	i9hCwaTNow3jhILtTv/b4jiRTTA5bLkSGoWsLIcJgiM3wlFYntW0xQmds2lwbUvAvMykzzZ6LG1
	PFckC+O/F8Dz4KYxNxtpjdPtLnEfuY8oH7KgeHdT46l99aWlZstY04XjLzukJ1YqBIT45YQQG12
	O4yzlxwxa8rgWCAav2TwrdDXbqP+u6x+Vv3icgrT56d8tqY5IkQeE9B/oubO6G9YFKdl5rjLSrI
	8nYSVnvEI7hidV2ewtaWICodmdnJUfy5ClQ3/+t9U3UbW5EzeWQKkPXjWlPlIVvvVn+8hsKN7Ct
	aBvikEdqus8wtS5iDUWFmQL/OJyNQubA6+X0RnIVNL09qO47LilkraOJVdm7Wy5HHya2x3Hdcw+
	fbiU46BaZAqufv4F1ppvx1ThSbXGruTTxH2AVGlc4vzmmMUCw0Adg6Gm9+dd6tuwYNdkxoLF5al
	yNV+mFdY0XA40doCdXazZrwag8aAY6FiddEGgz0Opv3HQ==
X-Received: by 2002:a05:6a00:299a:b0:822:69b2:7ed0 with SMTP id d2e1a72fcca58-8352c3b0cc7mr3848193b3a.6.1777768251973;
        Sat, 02 May 2026 17:30:51 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-835293f022asm4086305b3a.45.2026.05.02.17.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 17:30:51 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] ASoC: tegra: ADMAIF: allocate with a single kzalloc
Date: Sat,  2 May 2026 17:30:37 -0700
Message-ID: <20260503003037.11942-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Consolidate the allocations for capture_dma_data and playback_dma_data
into a single kzalloc by using a flexible array member at the end of
the tegra_admaif struct. This reduces the number of allocations from
three to one, simplifies error handling, and improves memory locality.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: place description in the proper place.
 sound/soc/tegra/tegra210_admaif.c | 28 ++++++++++------------------
 sound/soc/tegra/tegra210_admaif.h |  2 +-
 sound/soc/tegra/tegra_isomgr_bw.c |  1 +
 3 files changed, 12 insertions(+), 19 deletions(-)

diff --git a/sound/soc/tegra/tegra210_admaif.c b/sound/soc/tegra/tegra210_admaif.c
index a1c2757a3932..7299c6bfcf15 100644
--- a/sound/soc/tegra/tegra210_admaif.c
+++ b/sound/soc/tegra/tegra210_admaif.c
@@ -11,6 +11,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
+#include <sound/dmaengine_pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include "tegra_isomgr_bw.h"
@@ -912,35 +913,26 @@ MODULE_DEVICE_TABLE(of, tegra_admaif_of_match);
 
 static int tegra_admaif_probe(struct platform_device *pdev)
 {
+	const struct tegra_admaif_soc_data *soc_data;
 	struct tegra_admaif *admaif;
 	void __iomem *regs;
 	struct resource *res;
+	size_t alloc_size;
 	int err, i;
 
-	admaif = devm_kzalloc(&pdev->dev, sizeof(*admaif), GFP_KERNEL);
+	soc_data = of_device_get_match_data(&pdev->dev);
+
+	alloc_size = struct_size(admaif, capture_dma_data, soc_data->num_ch);
+	alloc_size += sizeof(*admaif->playback_dma_data) * soc_data->num_ch;
+	admaif = devm_kzalloc(&pdev->dev, alloc_size, GFP_KERNEL);
 	if (!admaif)
 		return -ENOMEM;
 
-	admaif->soc_data = of_device_get_match_data(&pdev->dev);
+	admaif->playback_dma_data = admaif->capture_dma_data + soc_data->num_ch;
+	admaif->soc_data = soc_data;
 
 	dev_set_drvdata(&pdev->dev, admaif);
 
-	admaif->capture_dma_data =
-		devm_kcalloc(&pdev->dev,
-			     admaif->soc_data->num_ch,
-			     sizeof(struct snd_dmaengine_dai_dma_data),
-			     GFP_KERNEL);
-	if (!admaif->capture_dma_data)
-		return -ENOMEM;
-
-	admaif->playback_dma_data =
-		devm_kcalloc(&pdev->dev,
-			     admaif->soc_data->num_ch,
-			     sizeof(struct snd_dmaengine_dai_dma_data),
-			     GFP_KERNEL);
-	if (!admaif->playback_dma_data)
-		return -ENOMEM;
-
 	for (i = 0; i < ADMAIF_PATHS; i++) {
 		admaif->mono_to_stereo[i] =
 			devm_kcalloc(&pdev->dev, admaif->soc_data->num_ch,
diff --git a/sound/soc/tegra/tegra210_admaif.h b/sound/soc/tegra/tegra210_admaif.h
index 304d45c76a9a..fd9877aa95d3 100644
--- a/sound/soc/tegra/tegra210_admaif.h
+++ b/sound/soc/tegra/tegra210_admaif.h
@@ -229,13 +229,13 @@ struct tegra_admaif_soc_data {
 };
 
 struct tegra_admaif {
-	struct snd_dmaengine_dai_dma_data *capture_dma_data;
 	struct snd_dmaengine_dai_dma_data *playback_dma_data;
 	const struct tegra_admaif_soc_data *soc_data;
 	unsigned int *mono_to_stereo[ADMAIF_PATHS];
 	unsigned int *stereo_to_mono[ADMAIF_PATHS];
 	struct regmap *regmap;
 	struct tegra_adma_isomgr *adma_isomgr;
+	struct snd_dmaengine_dai_dma_data capture_dma_data[];
 };
 
 #endif
diff --git a/sound/soc/tegra/tegra_isomgr_bw.c b/sound/soc/tegra/tegra_isomgr_bw.c
index fa979960bc09..c0f300fb3d38 100644
--- a/sound/soc/tegra/tegra_isomgr_bw.c
+++ b/sound/soc/tegra/tegra_isomgr_bw.c
@@ -6,6 +6,7 @@
 
 #include <linux/interconnect.h>
 #include <linux/module.h>
+#include <sound/dmaengine_pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include "tegra_isomgr_bw.h"
-- 
2.54.0

