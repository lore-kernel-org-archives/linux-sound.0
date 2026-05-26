Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24D533F5BE3
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 11:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779796602; cv=none; b=SPAe5aWmNlapygzZH4nInpwS3sZyE5w2hpphBNx5TAr/442OFgWM/wb4fjiUq29lBJRCYSbVg2x83+eg27efGDJiroaeySCmCwF6iMJfuDM+l4lLtqZBk2Kfcw3i1mEwlHM9wL3T2RntGsAVAS4jajRTg9iBRCB7nNATF98Dges=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779796602; c=relaxed/simple;
	bh=o5u5qtKs/eVenBbT6xwqRX3EUkEN583HVIiD9vyCGu4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GvvU1dEpjN+Y6lnR1rb74881qMjZk6R4Uilohr7lucpsaXmeKHE/BeuaxBuYwY9GEuV6rfGfUpTJmANHcGFVj4bfZBDEzlh9N7NjsJzqTwSMZsY1RycrKWK+3MRDpKy+qCwGCvmD0FGpfd5SDtqT9U9Ms0df9jnrBvce/Cfum1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.59])
	by gateway (Coremail) with SMTP id _____8CxRehzihVqw2MNAA--.32158S3;
	Tue, 26 May 2026 19:56:35 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.59])
	by front1 (Coremail) with SMTP id qMiowJCxGOBwihVq6I+RAA--.13381S2;
	Tue, 26 May 2026 19:56:34 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	linux-sound@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v2 4/5] ASoC: loongson: Separate external shared DMA from the platform interface
Date: Tue, 26 May 2026 19:56:25 +0800
Message-ID: <30612b6ec0212fe2fb6e387b1c7235cfef4e390a.1779796354.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1779796354.git.zhoubinbin@loongson.cn>
References: <cover.1779796354.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxGOBwihVq6I+RAA--.13381S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgETCGoVNiwIrgAAsb
X-Coremail-Antispam: 1Uk129KBj93XoW3Gw48WrykKFy8AF13KFy8Zwc_yoW3Wr45pF
	s3A3yxWrW5AF4avr98JrWrXr13ArySkFZrGay7G348Ar9rAw1ru34DtF1vvFW7CFWUWryk
	XFWkC3yrCFn8GFbCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWr
	XVW3AwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x02
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUneRRtUUUUU==

The Loongson I2S platform driver (used on LS2K1000, LS7A etc.) relies on
an external DMA engine (e.g., dw_dmac) rather than the internal DMA.
However, its DMA-related code was originally embedded in
loongson_i2s_plat.c, duplicating logic that should be shared.

Extract the external DMA (eDMA) support from the platform driver and move
it into loongson_dma.c alongside the existing internal DMA (iDMA) code.

This change eliminates code duplication and prepares for future
consolidation of DMA selection logic.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 sound/soc/loongson/Makefile            |  4 +-
 sound/soc/loongson/loongson_dma.c      | 59 ++++++++++++++++++++++++++
 sound/soc/loongson/loongson_dma.h      |  2 +
 sound/soc/loongson/loongson_i2s_plat.c | 59 +-------------------------
 4 files changed, 65 insertions(+), 59 deletions(-)

diff --git a/sound/soc/loongson/Makefile b/sound/soc/loongson/Makefile
index 4c6d3130bcee..6e43672071fc 100644
--- a/sound/soc/loongson/Makefile
+++ b/sound/soc/loongson/Makefile
@@ -1,12 +1,12 @@
 # SPDX-License-Identifier: GPL-2.0
 #Platform Support
-snd-soc-loongson-i2s-pci-y := loongson_i2s_pci.o loongson_dma.o
+snd-soc-loongson-i2s-pci-y := loongson_i2s_pci.o
 obj-$(CONFIG_SND_SOC_LOONGSON_I2S_PCI) += snd-soc-loongson-i2s-pci.o snd-soc-loongson-i2s.o
 
 snd-soc-loongson-i2s-plat-y := loongson_i2s_plat.o
 obj-$(CONFIG_SND_SOC_LOONGSON_I2S_PLATFORM) += snd-soc-loongson-i2s-plat.o snd-soc-loongson-i2s.o
 
-snd-soc-loongson-i2s-y := loongson_i2s.o
+snd-soc-loongson-i2s-y := loongson_i2s.o loongson_dma.o
 
 obj-$(CONFIG_SND_LOONGSON1_AC97) += loongson1_ac97.o
 
diff --git a/sound/soc/loongson/loongson_dma.c b/sound/soc/loongson/loongson_dma.c
index f51b5b94e3ab..ed970343d283 100644
--- a/sound/soc/loongson/loongson_dma.c
+++ b/sound/soc/loongson/loongson_dma.c
@@ -344,3 +344,62 @@ const struct snd_soc_component_driver loongson_i2s_idma_component = {
 	.mmap		= loongson_idma_pcm_mmap,
 	.pcm_new	= loongson_idma_pcm_new,
 };
+EXPORT_SYMBOL_GPL(loongson_i2s_idma_component);
+
+static const struct snd_pcm_hardware loongson_edma_hardware = {
+	.info = SNDRV_PCM_INFO_MMAP |
+		SNDRV_PCM_INFO_INTERLEAVED |
+		SNDRV_PCM_INFO_MMAP_VALID |
+		SNDRV_PCM_INFO_RESUME |
+		SNDRV_PCM_INFO_PAUSE,
+	.formats = SNDRV_PCM_FMTBIT_S16_LE |
+		   SNDRV_PCM_FMTBIT_S20_3LE |
+		   SNDRV_PCM_FMTBIT_S24_LE,
+	.period_bytes_min = 128,
+	.period_bytes_max = 128 * 1024,
+	.periods_min = 1,
+	.periods_max = 64,
+	.buffer_bytes_max = 1024 * 1024,
+};
+
+const struct snd_dmaengine_pcm_config loongson_dmaengine_pcm_config = {
+	.pcm_hardware = &loongson_edma_hardware,
+	.prepare_slave_config = snd_dmaengine_pcm_prepare_slave_config,
+	.prealloc_buffer_size = 128 * 1024,
+};
+EXPORT_SYMBOL_GPL(loongson_dmaengine_pcm_config);
+
+/* External DMA component */
+static int loongson_edma_pcm_open(struct snd_soc_component *component,
+				  struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+
+	if (substream->pcm->device & 1) {
+		runtime->hw.info &= ~SNDRV_PCM_INFO_INTERLEAVED;
+		runtime->hw.info |= SNDRV_PCM_INFO_NONINTERLEAVED;
+	}
+
+	if (substream->pcm->device & 2)
+		runtime->hw.info &= ~(SNDRV_PCM_INFO_MMAP |
+				      SNDRV_PCM_INFO_MMAP_VALID);
+	/*
+	 * For mysterious reasons (and despite what the manual says)
+	 * playback samples are lost if the DMA count is not a multiple
+	 * of the DMA burst size.  Let's add a rule to enforce that.
+	 */
+	snd_pcm_hw_constraint_step(runtime, 0,
+				   SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 128);
+	snd_pcm_hw_constraint_step(runtime, 0,
+				   SNDRV_PCM_HW_PARAM_BUFFER_BYTES, 128);
+	snd_pcm_hw_constraint_integer(substream->runtime,
+				      SNDRV_PCM_HW_PARAM_PERIODS);
+
+	return 0;
+}
+
+const struct snd_soc_component_driver loongson_i2s_edma_component = {
+	.name   = LS_I2S_DRVNAME,
+	.open	= loongson_edma_pcm_open,
+};
+EXPORT_SYMBOL_GPL(loongson_i2s_edma_component);
diff --git a/sound/soc/loongson/loongson_dma.h b/sound/soc/loongson/loongson_dma.h
index 8a8fa8abd85a..a040681d2693 100644
--- a/sound/soc/loongson/loongson_dma.h
+++ b/sound/soc/loongson/loongson_dma.h
@@ -10,5 +10,7 @@
 #define _LOONGSON_DMA_H
 
 extern const struct snd_soc_component_driver loongson_i2s_idma_component;
+extern const struct snd_soc_component_driver loongson_i2s_edma_component;
+extern const struct snd_dmaengine_pcm_config loongson_dmaengine_pcm_config;
 
 #endif
diff --git a/sound/soc/loongson/loongson_i2s_plat.c b/sound/soc/loongson/loongson_i2s_plat.c
index f8d7aca8b903..ac054b6ce632 100644
--- a/sound/soc/loongson/loongson_i2s_plat.c
+++ b/sound/soc/loongson/loongson_i2s_plat.c
@@ -19,6 +19,7 @@
 #include <sound/soc.h>
 
 #include "loongson_i2s.h"
+#include "loongson_dma.h"
 
 #define LOONGSON_I2S_RX_DMA_OFFSET	21
 #define LOONGSON_I2S_TX_DMA_OFFSET	18
@@ -29,62 +30,6 @@
 #define LOONGSON_DMA3_CONF	0x3
 #define LOONGSON_DMA4_CONF	0x4
 
-/* periods_max = PAGE_SIZE / sizeof(struct ls_dma_chan_reg) */
-static const struct snd_pcm_hardware loongson_pcm_hardware = {
-	.info = SNDRV_PCM_INFO_MMAP |
-		SNDRV_PCM_INFO_INTERLEAVED |
-		SNDRV_PCM_INFO_MMAP_VALID |
-		SNDRV_PCM_INFO_RESUME |
-		SNDRV_PCM_INFO_PAUSE,
-	.formats = SNDRV_PCM_FMTBIT_S16_LE |
-		   SNDRV_PCM_FMTBIT_S20_3LE |
-		   SNDRV_PCM_FMTBIT_S24_LE,
-	.period_bytes_min = 128,
-	.period_bytes_max = 128 * 1024,
-	.periods_min = 1,
-	.periods_max = 64,
-	.buffer_bytes_max = 1024 * 1024,
-};
-
-static const struct snd_dmaengine_pcm_config loongson_dmaengine_pcm_config = {
-	.pcm_hardware = &loongson_pcm_hardware,
-	.prepare_slave_config = snd_dmaengine_pcm_prepare_slave_config,
-	.prealloc_buffer_size = 128 * 1024,
-};
-
-static int loongson_pcm_open(struct snd_soc_component *component,
-			     struct snd_pcm_substream *substream)
-{
-	struct snd_pcm_runtime *runtime = substream->runtime;
-
-	if (substream->pcm->device & 1) {
-		runtime->hw.info &= ~SNDRV_PCM_INFO_INTERLEAVED;
-		runtime->hw.info |= SNDRV_PCM_INFO_NONINTERLEAVED;
-	}
-
-	if (substream->pcm->device & 2)
-		runtime->hw.info &= ~(SNDRV_PCM_INFO_MMAP |
-				      SNDRV_PCM_INFO_MMAP_VALID);
-	/*
-	 * For mysterious reasons (and despite what the manual says)
-	 * playback samples are lost if the DMA count is not a multiple
-	 * of the DMA burst size.  Let's add a rule to enforce that.
-	 */
-	snd_pcm_hw_constraint_step(runtime, 0,
-				   SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 128);
-	snd_pcm_hw_constraint_step(runtime, 0,
-				   SNDRV_PCM_HW_PARAM_BUFFER_BYTES, 128);
-	snd_pcm_hw_constraint_integer(substream->runtime,
-				      SNDRV_PCM_HW_PARAM_PERIODS);
-
-	return 0;
-}
-
-static const struct snd_soc_component_driver loongson_i2s_component_driver = {
-	.name   = LS_I2S_DRVNAME,
-	.open	= loongson_pcm_open,
-};
-
 static int loongson_i2s_apbdma_config(struct platform_device *pdev)
 {
 	int val;
@@ -147,7 +92,7 @@ static int loongson_i2s_plat_probe(struct platform_device *pdev)
 	dev_set_name(dev, LS_I2S_DRVNAME);
 	dev_set_drvdata(dev, i2s);
 
-	ret = devm_snd_soc_register_component(dev, &loongson_i2s_component_driver,
+	ret = devm_snd_soc_register_component(dev, &loongson_i2s_edma_component,
 					      &loongson_i2s_dai, 1);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to register DAI\n");
-- 
2.52.0

