Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B87322333B
	for <linux-sound@vger.kernel.org>; Thu, 12 Jun 2025 07:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749714575; cv=none; b=XYgIMRcShTqHUtSYE1JrwPWJBKrLPjj62gjcn86LPr7b3r3d2DhWn0NrTDRWuLnpNlfmb/AYFxSTsDHOhHdW10ghRjXzNYsRLMsX/PBrjIT5ER+w51NT53R/7OLowwmC129H+REJN8hTEAlZi2O0nPtritPqnF0SYhITL1NbBCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749714575; c=relaxed/simple;
	bh=vJU0lSRgVK0wAGWmZHwdmRtL/aFRS74afRHgWTg1wKs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZzAHePmAEHMNwX81exeFDov1hyHyPT2RpL6IguenWvekfM3Y1fh3ivtKuU+gVmv4tOocV4SXPXABpGeJhjp1hEmXmWRiCJcRV4W2yvscbubP8DHTkZwS3SfuRZ+v0T2ZRsmHXEgZuZLwa86n3FA6Vq5uQdfqUegidrAHb6DqBr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QBlgkZQ+; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QBlgkZQ+"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-235a3dd4f0dso4407095ad.0
        for <linux-sound@vger.kernel.org>; Thu, 12 Jun 2025 00:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749714572; x=1750319372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sbtP55NCyh4Df1vJCDqUAIM6R+yyfwut8FIK3Aq64wo=;
        b=QBlgkZQ+0zaOvA2lNogUqQaxIwNvvJ5OOY/g+nUoaEt4NWjaLATNT+C/qJlUl8JCNy
         FYm06PiqHVNu7syczoxcQpCKUpb8k84qc5+afquu/u947rwZOHxOVqqmpb6ZTNcpzr6Z
         9ob80CO8EQNeKTzPsotEzPsDTcKejQmy7crIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749714572; x=1750319372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sbtP55NCyh4Df1vJCDqUAIM6R+yyfwut8FIK3Aq64wo=;
        b=JEmT6inRaLg9mI8VOA2p+u6GoaZusrrI7+vA0sYy/EBE4HpPVIK+wAJsFnvQvKp/M5
         jddwHXZodz1AM2BkTW1Nh/nekufqt8IAr1uyNxzaBQf+kB9DrMxxYqEY40wJrT1Yq7nV
         HjyLLcgkSW5eNhS8aXsio3snZeC9HaMLYELMBscLYLDbsSs75brgBwISyQek56PYUw4T
         qpEeBBeB1UHbLHl6Md2h/mnykG7uMAa9x7rvdteAMaW3hZRm5U27Pm1gBa1b/VWOG7cU
         AEwSzHWzftO3FiCPTjmbJ+r78PGE7Ro9iTFZqrNBEjGIUHWo1bFmKiGx6jCIyArdqSzC
         O6jQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNpG0ImLqkjG7PSFAfcar6QxPCFCrHCrmcp4C16cXbe6odse/WSAxj0emRneKt5Y3+nhORTQcrFOhEBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGJBQ+eB8ExU4Ihemhrk2kLsVKj/9suhfdmHzK9wkSVva82bmJ
	PeAtRQ8wRbyYP5lEhx5b9BUOgJUrLEoOoZrT0af9XHguXDu259RW016MbGujawVsZw==
X-Gm-Gg: ASbGnctizt1suOkNgpuahLl8pEkkbEA4SqPEPgWFSb/1DkNmMkhk9gvei1cYX+YH5N8
	ymdhkBwoi288Fg4h6bcZvwu0LAwYEueZE2EchCjhGnfvMsBi3XdwPlj67ZYlnaxJky2DzFjrK/y
	3Kmh5xjBjqNM/lkEND01UXUFKxN7Ty9vWGC7i2Bi0M03SWQCinV7tqvh12TDvulJei+Jmkyla5p
	iCd79V8W4Oj0u6b39kOvuAeKxmSoWW8yDAWFdJl7cA9uGsH+oFhEpL2sqQ90s2P0x/qvuQ8PRzv
	yUNd8YJUyPCitbhln9yKoB3PeuzZyUgE7sBfNZm5XU3gB7XMtAxQKh/yIchnhN9nTkVdi4bUmsB
	pdoQ=
X-Google-Smtp-Source: AGHT+IHaJlXxYg2mu49lXSk0cZU/cv8JMuXBWfPAapKkAyg9tvhMsqA+YooEcad1wogppx7rwBhFeA==
X-Received: by 2002:a17:903:1b10:b0:234:d2fb:2d28 with SMTP id d9443c01a7336-23641aa2385mr85824375ad.2.1749714572600;
        Thu, 12 Jun 2025 00:49:32 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:5b9:e73a:2e58:5a47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2364e63d42esm7893295ad.74.2025.06.12.00.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 00:49:32 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/9] ASoC: mediatek: use reserved memory or enable buffer pre-allocation
Date: Thu, 12 Jun 2025 15:48:57 +0800
Message-ID: <20250612074901.4023253-7-wenst@chromium.org>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
In-Reply-To: <20250612074901.4023253-1-wenst@chromium.org>
References: <20250612074901.4023253-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In commit 32c9c06adb5b ("ASoC: mediatek: disable buffer pre-allocation")
buffer pre-allocation was disabled to accommodate newer platforms that
have a limited reserved memory region for the audio frontend.

Turns out disabling pre-allocation across the board impacts platforms
that don't have this reserved memory region. Buffer allocation failures
have been observed on MT8173 and MT8183 based Chromebooks under low
memory conditions, which results in no audio playback for the user.

Since some MediaTek platforms already have dedicated reserved memory
pools for the audio frontend, the plan is to enable this for all of
them. This requires device tree changes. As a fallback, reinstate the
original policy of pre-allocating audio buffers at probe time of the
reserved memory pool cannot be found or used.

This patch covers the MT8173, MT8183, MT8186 and MT8192 platforms for
now, the reason being that existing MediaTek platform drivers that
supported reserved memory were all platforms that mainly supported
ChromeOS, and is also the set of devices that I can verify.

Fixes: 32c9c06adb5b ("ASoC: mediatek: disable buffer pre-allocation")
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 sound/soc/mediatek/common/mtk-afe-platform-driver.c | 4 +++-
 sound/soc/mediatek/common/mtk-base-afe.h            | 1 +
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c          | 7 +++++++
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c          | 7 +++++++
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c          | 7 +++++++
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c          | 7 +++++++
 6 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-platform-driver.c b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
index 6b6330583941..70fd05d5ff48 100644
--- a/sound/soc/mediatek/common/mtk-afe-platform-driver.c
+++ b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
@@ -120,7 +120,9 @@ int mtk_afe_pcm_new(struct snd_soc_component *component,
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
 
 	size = afe->mtk_afe_hardware->buffer_bytes_max;
-	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, afe->dev, 0, size);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, afe->dev,
+				       afe->preallocate_buffers ? size : 0,
+				       size);
 
 	return 0;
 }
diff --git a/sound/soc/mediatek/common/mtk-base-afe.h b/sound/soc/mediatek/common/mtk-base-afe.h
index f51578b6c50a..a406f2e3e7a8 100644
--- a/sound/soc/mediatek/common/mtk-base-afe.h
+++ b/sound/soc/mediatek/common/mtk-base-afe.h
@@ -117,6 +117,7 @@ struct mtk_base_afe {
 	struct mtk_base_afe_irq *irqs;
 	int irqs_size;
 	int memif_32bit_supported;
+	bool preallocate_buffers;
 
 	struct list_head sub_dais;
 	struct snd_soc_dai_driver *dai_drivers;
diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
index 04ed0cfec174..f93d6348fdf8 100644
--- a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
+++ b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/dma-mapping.h>
 #include <linux/pm_runtime.h>
 #include <sound/soc.h>
@@ -1070,6 +1071,12 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	afe->dev = &pdev->dev;
 
+	ret = of_reserved_mem_device_init(&pdev->dev);
+	if (ret) {
+		dev_info(&pdev->dev, "no reserved memory found, pre-allocating buffers instead\n");
+		afe->preallocate_buffers = true;
+	}
+
 	irq_id = platform_get_irq(pdev, 0);
 	if (irq_id <= 0)
 		return irq_id < 0 ? irq_id : -ENXIO;
diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index e8884354995c..9b6b45c646e6 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -10,6 +10,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 
@@ -777,6 +778,12 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 	afe->dev = &pdev->dev;
 	dev = afe->dev;
 
+	ret = of_reserved_mem_device_init(dev);
+	if (ret) {
+		dev_info(dev, "no reserved memory found, pre-allocating buffers instead\n");
+		afe->preallocate_buffers = true;
+	}
+
 	/* initial audio related clock */
 	ret = mt8183_init_clock(afe);
 	if (ret) {
diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
index db7c93401bee..c73b4664e53e 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
@@ -10,6 +10,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 #include <sound/soc.h>
@@ -2835,6 +2836,12 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 	afe_priv = afe->platform_priv;
 	afe->dev = &pdev->dev;
 
+	ret = of_reserved_mem_device_init(dev);
+	if (ret) {
+		dev_info(dev, "no reserved memory found, pre-allocating buffers instead\n");
+		afe->preallocate_buffers = true;
+	}
+
 	afe->base_addr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(afe->base_addr))
 		return PTR_ERR(afe->base_addr);
diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
index fd6af74d7995..3d32fe46118e 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
@@ -12,6 +12,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 #include <sound/soc.h>
@@ -2179,6 +2180,12 @@ static int mt8192_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	afe->dev = dev;
 
+	ret = of_reserved_mem_device_init(dev);
+	if (ret) {
+		dev_info(dev, "no reserved memory found, pre-allocating buffers instead\n");
+		afe->preallocate_buffers = true;
+	}
+
 	/* init audio related clock */
 	ret = mt8192_init_clock(afe);
 	if (ret) {
-- 
2.50.0.rc1.591.g9c95f17f64-goog

