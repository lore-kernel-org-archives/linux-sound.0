Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 970B53019DC;
	Wed, 11 Mar 2026 06:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773211064; cv=none; b=bat3/RoYaXS99pYMcoE1aR27nDWi/n7ps7Bj0PZAWZNEo0zXAJsCvtwkl+wlHd8QPoiqTaxxkbIggg4GQ0IPuf9w7qmFfP8WW9LeLHg4W1sYAiMsXrC2OrZXWK66IfhhDk5nRxg0p7O/Y0PqLtJtTJ66ULCo9XbMtBw0nFWAx78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773211064; c=relaxed/simple;
	bh=M/BvXecmhn5mVBbVpQw5Qe9UqJRrpii6bRUgMLio15c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eWWZDPx8atIbApyKSJofv84vHtH8x/H5EG1+noeadO1SQePo9clflxiRTTcX0xRnaXsGX2QwcwMFMpxoJMtuA/WrpPSKroV+LRPvdFBtyyWAFQStdHPjZ4kQHVVSB8Jc6dw/VeSmj4vhhGT7wpDfdg/10p2ZqwTE2pZVc8ZO3hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.227])
	by gateway (Coremail) with SMTP id _____8CxH6q1DbFp0tIZAA--.16378S3;
	Wed, 11 Mar 2026 14:37:41 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.227])
	by front1 (Coremail) with SMTP id qMiowJCx_8KoDbFpqclSAA--.26805S5;
	Wed, 11 Mar 2026 14:37:40 +0800 (CST)
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
Subject: [PATCH 3/6] ASoC: loongson: Add `internal` to the names of internal DMA variables
Date: Wed, 11 Mar 2026 14:37:18 +0800
Message-ID: <ee177cd356803dd24d630c7502d850f52e3f63d8.1773107475.git.zhoubinbin@loongson.cn>
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
X-CM-TRANSID:qMiowJCx_8KoDbFpqclSAA--.26805S5
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEDCGmxBEIAmAAAsN
X-Coremail-Antispam: 1Uk129KBj93XoW3tFWkWrWxXrW8KF1fWF18tFc_yoWkurW3pF
	s5A39Ygr4YqF15ur98ArZ5ur13AryFkrsrKa17J34akr9Fqw1a9F1UKF18ZF4akFW5urnr
	ZrWvg3y8C3ZxGacCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	tVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x02
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0epB3UUUUU==

The DMA controller used in Loongson I2S is divided into internal
exclusive DMA and external shared DMA (APBDMA). Add the `internal`
dentifier to internal DMA variable names to better distinguish them from
external shared DMA.

No functional change intended.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 sound/soc/loongson/loongson_dma.c     | 84 +++++++++++++--------------
 sound/soc/loongson/loongson_dma.h     |  4 +-
 sound/soc/loongson/loongson_i2s.h     |  6 +-
 sound/soc/loongson/loongson_i2s_pci.c |  5 +-
 4 files changed, 49 insertions(+), 50 deletions(-)

diff --git a/sound/soc/loongson/loongson_dma.c b/sound/soc/loongson/loongson_dma.c
index f26b2951bc9c..07a084cebdc0 100644
--- a/sound/soc/loongson/loongson_dma.c
+++ b/sound/soc/loongson/loongson_dma.c
@@ -14,6 +14,7 @@
 #include <sound/soc.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
+
 #include "loongson_i2s.h"
 
 /* DMA dma_order Register */
@@ -29,7 +30,7 @@
 /*
  * DMA registers descriptor.
  */
-struct loongson_dma_desc {
+struct loongson_internal_dma_desc {
 	u32 order;		/* Next descriptor address register */
 	u32 saddr;		/* Source address register */
 	u32 daddr;		/* Device address register */
@@ -44,17 +45,17 @@ struct loongson_dma_desc {
 } __packed;
 
 struct loongson_runtime_data {
-	struct loongson_dma_data *dma_data;
+	struct loongson_internal_dma_data *dma_data;
 
-	struct loongson_dma_desc *dma_desc_arr;
+	struct loongson_internal_dma_desc *dma_desc_arr;
 	dma_addr_t dma_desc_arr_phy;
 	int dma_desc_arr_size;
 
-	struct loongson_dma_desc *dma_pos_desc;
+	struct loongson_internal_dma_desc *dma_pos_desc;
 	dma_addr_t dma_pos_desc_phy;
 };
 
-static const struct snd_pcm_hardware ls_pcm_hardware = {
+static const struct snd_pcm_hardware loongson_internal_dma_hardware = {
 	.info = SNDRV_PCM_INFO_MMAP |
 		SNDRV_PCM_INFO_INTERLEAVED |
 		SNDRV_PCM_INFO_MMAP_VALID |
@@ -67,12 +68,11 @@ static const struct snd_pcm_hardware ls_pcm_hardware = {
 	.period_bytes_min = 128,
 	.period_bytes_max = 128 * 1024,
 	.periods_min = 1,
-	.periods_max = PAGE_SIZE / sizeof(struct loongson_dma_desc),
+	.periods_max = PAGE_SIZE / sizeof(struct loongson_internal_dma_desc),
 	.buffer_bytes_max = 1024 * 1024,
 };
 
-static struct
-loongson_dma_desc *dma_desc_save(struct loongson_runtime_data *prtd)
+static struct loongson_internal_dma_desc *dma_desc_save(struct loongson_runtime_data *prtd)
 {
 	void __iomem *order_reg = prtd->dma_data->order_addr;
 	u64 val;
@@ -88,8 +88,8 @@ loongson_dma_desc *dma_desc_save(struct loongson_runtime_data *prtd)
 	return prtd->dma_pos_desc;
 }
 
-static int loongson_pcm_trigger(struct snd_soc_component *component,
-				struct snd_pcm_substream *substream, int cmd)
+static int loongson_internal_dma_pcm_trigger(struct snd_soc_component *component,
+					     struct snd_pcm_substream *substream, int cmd)
 {
 	struct loongson_runtime_data *prtd = substream->runtime->private_data;
 	struct device *dev = substream->pcm->card->dev;
@@ -131,9 +131,9 @@ static int loongson_pcm_trigger(struct snd_soc_component *component,
 	return 0;
 }
 
-static int loongson_pcm_hw_params(struct snd_soc_component *component,
-				  struct snd_pcm_substream *substream,
-				  struct snd_pcm_hw_params *params)
+static int loongson_internal_dma_pcm_hw_params(struct snd_soc_component *component,
+					       struct snd_pcm_substream *substream,
+					       struct snd_pcm_hw_params *params)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct device *dev = substream->pcm->card->dev;
@@ -141,7 +141,7 @@ static int loongson_pcm_hw_params(struct snd_soc_component *component,
 	size_t buf_len = params_buffer_bytes(params);
 	size_t period_len = params_period_bytes(params);
 	dma_addr_t order_addr, mem_addr;
-	struct loongson_dma_desc *desc;
+	struct loongson_internal_dma_desc *desc;
 	u32 num_periods;
 	int i;
 
@@ -195,12 +195,12 @@ static int loongson_pcm_hw_params(struct snd_soc_component *component,
 }
 
 static snd_pcm_uframes_t
-loongson_pcm_pointer(struct snd_soc_component *component,
-		     struct snd_pcm_substream *substream)
+loongson_internal_dma_pcm_pointer(struct snd_soc_component *component,
+				  struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct loongson_runtime_data *prtd = runtime->private_data;
-	struct loongson_dma_desc *desc;
+	struct loongson_internal_dma_desc *desc;
 	snd_pcm_uframes_t x;
 	u64 addr;
 
@@ -213,7 +213,7 @@ loongson_pcm_pointer(struct snd_soc_component *component,
 	return x;
 }
 
-static irqreturn_t loongson_pcm_dma_irq(int irq, void *devid)
+static irqreturn_t loongson_internal_dma_pcm_dma_irq(int irq, void *devid)
 {
 	struct snd_pcm_substream *substream = devid;
 
@@ -221,14 +221,14 @@ static irqreturn_t loongson_pcm_dma_irq(int irq, void *devid)
 	return IRQ_HANDLED;
 }
 
-static int loongson_pcm_open(struct snd_soc_component *component,
-			     struct snd_pcm_substream *substream)
+static int loongson_internal_dma_pcm_open(struct snd_soc_component *component,
+					  struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_card *card = substream->pcm->card;
 	struct loongson_runtime_data *prtd;
-	struct loongson_dma_data *dma_data;
+	struct loongson_internal_dma_data *dma_data;
 
 	/*
 	 * For mysterious reasons (and despite what the manual says)
@@ -241,7 +241,7 @@ static int loongson_pcm_open(struct snd_soc_component *component,
 				   SNDRV_PCM_HW_PARAM_BUFFER_BYTES, 128);
 	snd_pcm_hw_constraint_integer(substream->runtime,
 				      SNDRV_PCM_HW_PARAM_PERIODS);
-	snd_soc_set_runtime_hwparams(substream, &ls_pcm_hardware);
+	snd_soc_set_runtime_hwparams(substream, &loongson_internal_dma_hardware);
 
 	prtd = kzalloc_obj(*prtd);
 	if (!prtd)
@@ -277,8 +277,8 @@ static int loongson_pcm_open(struct snd_soc_component *component,
 	return -ENOMEM;
 }
 
-static int loongson_pcm_close(struct snd_soc_component *component,
-			      struct snd_pcm_substream *substream)
+static int loongson_internal_dma_pcm_close(struct snd_soc_component *component,
+					   struct snd_pcm_substream *substream)
 {
 	struct snd_card *card = substream->pcm->card;
 	struct loongson_runtime_data *prtd = substream->runtime->private_data;
@@ -293,21 +293,21 @@ static int loongson_pcm_close(struct snd_soc_component *component,
 	return 0;
 }
 
-static int loongson_pcm_mmap(struct snd_soc_component *component,
-			     struct snd_pcm_substream *substream,
-			     struct vm_area_struct *vma)
+static int loongson_internal_dma_pcm_mmap(struct snd_soc_component *component,
+					  struct snd_pcm_substream *substream,
+					  struct vm_area_struct *vma)
 {
 	return remap_pfn_range(vma, vma->vm_start,
-			substream->dma_buffer.addr >> PAGE_SHIFT,
-			vma->vm_end - vma->vm_start, vma->vm_page_prot);
+			       substream->dma_buffer.addr >> PAGE_SHIFT,
+			       vma->vm_end - vma->vm_start, vma->vm_page_prot);
 }
 
-static int loongson_pcm_new(struct snd_soc_component *component,
-			    struct snd_soc_pcm_runtime *rtd)
+static int loongson_internal_dma_pcm_new(struct snd_soc_component *component,
+					 struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_card *card = rtd->card->snd_card;
 	struct snd_pcm_substream *substream;
-	struct loongson_dma_data *dma_data;
+	struct loongson_internal_dma_data *dma_data;
 	unsigned int i;
 	int ret;
 
@@ -319,7 +319,7 @@ static int loongson_pcm_new(struct snd_soc_component *component,
 		dma_data = snd_soc_dai_get_dma_data(snd_soc_rtd_to_cpu(rtd, 0),
 						    substream);
 		ret = devm_request_irq(card->dev, dma_data->irq,
-				       loongson_pcm_dma_irq,
+				       loongson_internal_dma_pcm_dma_irq,
 				       IRQF_TRIGGER_HIGH, LS_I2S_DRVNAME,
 				       substream);
 		if (ret < 0) {
@@ -330,16 +330,16 @@ static int loongson_pcm_new(struct snd_soc_component *component,
 
 	return snd_pcm_set_fixed_buffer_all(rtd->pcm, SNDRV_DMA_TYPE_DEV,
 					    card->dev,
-					    ls_pcm_hardware.buffer_bytes_max);
+					    loongson_internal_dma_hardware.buffer_bytes_max);
 }
 
-const struct snd_soc_component_driver loongson_i2s_component = {
+const struct snd_soc_component_driver loongson_i2s_internal_dma_component = {
 	.name		= LS_I2S_DRVNAME,
-	.open		= loongson_pcm_open,
-	.close		= loongson_pcm_close,
-	.hw_params	= loongson_pcm_hw_params,
-	.trigger	= loongson_pcm_trigger,
-	.pointer	= loongson_pcm_pointer,
-	.mmap		= loongson_pcm_mmap,
-	.pcm_construct	= loongson_pcm_new,
+	.open		= loongson_internal_dma_pcm_open,
+	.close		= loongson_internal_dma_pcm_close,
+	.hw_params	= loongson_internal_dma_pcm_hw_params,
+	.trigger	= loongson_internal_dma_pcm_trigger,
+	.pointer	= loongson_internal_dma_pcm_pointer,
+	.mmap		= loongson_internal_dma_pcm_mmap,
+	.pcm_construct	= loongson_internal_dma_pcm_new,
 };
diff --git a/sound/soc/loongson/loongson_dma.h b/sound/soc/loongson/loongson_dma.h
index 073ee8c0c046..8795fd7874bb 100644
--- a/sound/soc/loongson/loongson_dma.h
+++ b/sound/soc/loongson/loongson_dma.h
@@ -9,8 +9,6 @@
 #ifndef _LOONGSON_DMA_H
 #define _LOONGSON_DMA_H
 
-#include <sound/soc.h>
-
-extern const struct snd_soc_component_driver loongson_i2s_component;
+extern const struct snd_soc_component_driver loongson_i2s_internal_dma_component;
 
 #endif
diff --git a/sound/soc/loongson/loongson_i2s.h b/sound/soc/loongson/loongson_i2s.h
index e73ffa954ec9..5f773bbd24c5 100644
--- a/sound/soc/loongson/loongson_i2s.h
+++ b/sound/soc/loongson/loongson_i2s.h
@@ -42,7 +42,7 @@
 
 #define LS_I2S_DRVNAME		"loongson-i2s"
 
-struct loongson_dma_data {
+struct loongson_internal_dma_data {
 	dma_addr_t dev_addr;		/* device physical address for DMA */
 	void __iomem *order_addr;	/* DMA order register */
 	int irq;			/* DMA irq */
@@ -52,11 +52,11 @@ struct loongson_i2s {
 	struct device *dev;
 	union {
 		struct snd_dmaengine_dai_dma_data playback_dma_data;
-		struct loongson_dma_data tx_dma_data;
+		struct loongson_internal_dma_data tx_dma_data;
 	};
 	union {
 		struct snd_dmaengine_dai_dma_data capture_dma_data;
-		struct loongson_dma_data rx_dma_data;
+		struct loongson_internal_dma_data rx_dma_data;
 	};
 	struct regmap *regmap;
 	void __iomem *reg_base;
diff --git a/sound/soc/loongson/loongson_i2s_pci.c b/sound/soc/loongson/loongson_i2s_pci.c
index dea1e4ebee29..9120432bbe64 100644
--- a/sound/soc/loongson/loongson_i2s_pci.c
+++ b/sound/soc/loongson/loongson_i2s_pci.c
@@ -13,6 +13,7 @@
 #include <linux/acpi.h>
 #include <linux/pci.h>
 #include <sound/soc.h>
+
 #include "loongson_i2s.h"
 #include "loongson_dma.h"
 
@@ -22,7 +23,7 @@ static int loongson_i2s_pci_probe(struct pci_dev *pdev,
 				  const struct pci_device_id *pid)
 {
 	const struct fwnode_handle *fwnode = pdev->dev.fwnode;
-	struct loongson_dma_data *tx_data, *rx_data;
+	struct loongson_internal_dma_data *tx_data, *rx_data;
 	struct device *dev = &pdev->dev;
 	struct loongson_i2s *i2s;
 	int ret;
@@ -79,7 +80,7 @@ static int loongson_i2s_pci_probe(struct pci_dev *pdev,
 		udelay(200);
 	}
 
-	ret = devm_snd_soc_register_component(dev, &loongson_i2s_component,
+	ret = devm_snd_soc_register_component(dev, &loongson_i2s_internal_dma_component,
 					      &loongson_i2s_dai, 1);
 	if (ret)
 		return dev_err_probe(dev, ret, "register DAI failed\n");
-- 
2.52.0

