Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8248F36D9F8;
	Wed, 11 Mar 2026 06:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773211084; cv=none; b=pAP7qhpgOvYKRE8B6YoxzBOVTZUu08GzHd4LwA+SQ+0GE+1IDiilhyNm84gXM2XMo8cWVjrMZipqnbXkh+8c54UGBeG57GNr6MFWlip57FUnOgZFmIOB1YpZvkPslbF2DK1mdHmv3rXgdQnliocecNZi3kI8BbFv0yOIbRC3Vkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773211084; c=relaxed/simple;
	bh=eQoEotEpIpWesWbb93SbM6uiZ1ROkoiI2ggAao9QOQs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tLsF3HvvkBpgRaafc2l0BherGsmMP0hN8Fv4znLGLn+0jCROH3g0ThOMdcRQzAb2+vg9T96B/sWN0plOzKqgX6pym6wMLYTd8pP5aNOXAV42ie2VP8c3Jzv0KMVg+9GOgP0HQQJ2efYmDx3fv0PSFm3ecuyz0juqLi3cr0UFnbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.227])
	by gateway (Coremail) with SMTP id _____8Axz6vEDbFp_dIZAA--.16677S3;
	Wed, 11 Mar 2026 14:37:56 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.227])
	by front1 (Coremail) with SMTP id qMiowJCx_8LCDbFp2clSAA--.26807S2;
	Wed, 11 Mar 2026 14:37:55 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 4/6] ASoC: loongson: Separate external shared DMA from the platform interface
Date: Wed, 11 Mar 2026 14:37:46 +0800
Message-ID: <ee1309d49b93daaee62dc8f9a955dc4130d4bd0e.1773107475.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1773107475.git.zhoubinbin@loongson.cn>
References: <cover.1773107475.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCx_8LCDbFp2clSAA--.26807S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgEDCGmxBCIAqwAAsd
X-Coremail-Antispam: 1Uk129KBj93XoW3JF45Xr4fGFWrXF43Xw4xAFc_yoW3GryrpF
	s3A3yxWrW5AF4avr98JryrZr1fArySkF9rGay7J348Ar9rA345u34DtF1qvF47CFWUWryk
	XFWkC3yrC3Z8GFbCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBSb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2
	xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_
	Wrv_ZF1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x
	0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
	bVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E74
	80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0
	I7IYx2IY67AKxVW5JVW7JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42
	xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF
	7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU36RRDUUUU

External shared DMA has no binding relationship with the platform
interface. Separating external shared DMA-related definitions enhances
the clarity of the overall structural hierarchy.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 sound/soc/loongson/Makefile            |  4 +-
 sound/soc/loongson/loongson_dma.c      | 58 +++++++++++++++++++++++++
 sound/soc/loongson/loongson_dma.h      |  2 +
 sound/soc/loongson/loongson_i2s_plat.c | 59 +-------------------------
 4 files changed, 64 insertions(+), 59 deletions(-)

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
index 07a084cebdc0..07ee9afc4981 100644
--- a/sound/soc/loongson/loongson_dma.c
+++ b/sound/soc/loongson/loongson_dma.c
@@ -343,3 +343,61 @@ const struct snd_soc_component_driver loongson_i2s_internal_dma_component = {
 	.mmap		= loongson_internal_dma_pcm_mmap,
 	.pcm_construct	= loongson_internal_dma_pcm_new,
 };
+EXPORT_SYMBOL_GPL(loongson_i2s_internal_dma_component);
+
+static const struct snd_pcm_hardware loongson_external_dma_hardware = {
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
+	.pcm_hardware = &loongson_external_dma_hardware,
+	.prepare_slave_config = snd_dmaengine_pcm_prepare_slave_config,
+	.prealloc_buffer_size = 128 * 1024,
+};
+EXPORT_SYMBOL_GPL(loongson_dmaengine_pcm_config);
+
+static int loongson_external_dma_pcm_open(struct snd_soc_component *component,
+					  struct snd_pcm_substream *substream)
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
+const struct snd_soc_component_driver loongson_i2s_external_dma_component = {
+	.name   = LS_I2S_DRVNAME,
+	.open	= loongson_external_dma_pcm_open,
+};
+EXPORT_SYMBOL_GPL(loongson_i2s_external_dma_component);
diff --git a/sound/soc/loongson/loongson_dma.h b/sound/soc/loongson/loongson_dma.h
index 8795fd7874bb..989832385220 100644
--- a/sound/soc/loongson/loongson_dma.h
+++ b/sound/soc/loongson/loongson_dma.h
@@ -10,5 +10,7 @@
 #define _LOONGSON_DMA_H
 
 extern const struct snd_soc_component_driver loongson_i2s_internal_dma_component;
+extern const struct snd_soc_component_driver loongson_i2s_external_dma_component;
+extern const struct snd_dmaengine_pcm_config loongson_dmaengine_pcm_config;
 
 #endif
diff --git a/sound/soc/loongson/loongson_i2s_plat.c b/sound/soc/loongson/loongson_i2s_plat.c
index f8d7aca8b903..eaaab2b05633 100644
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
+	ret = devm_snd_soc_register_component(dev, &loongson_i2s_external_dma_component,
 					      &loongson_i2s_dai, 1);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to register DAI\n");
-- 
2.52.0

