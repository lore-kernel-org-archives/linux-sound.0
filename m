Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D5C3D905D;
	Tue,  5 May 2026 20:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778012706; cv=none; b=PhKCfnnKHa/nvrJychj/8H4qHXdwwdXHwG/AG0BQN6TZEInJiqXuO/WEG7GSLdaocIH+8aIDgUGPOPBEU1vteHanCSL0iq7vr9GL6vWqQcKxbIY/Ct+0UVeNCZeBNk/Ko1XgZKIf56MVfoTCFITOiVKamFVOCAlixWtXVSfZT8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778012706; c=relaxed/simple;
	bh=lBo/lyaa4aB0w46YkGIP+XrB594mnvOG8246BMnPmmE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=X8NapmKApYsTKGmbUHiK3/uQIp/1d6r1jGHGFlWL3hfJCVLG/Vbsu5IAWCO9GpSsZN1V6qL9Q11E01eppyFcxF0SafEKQUYS4iiLocu2YXA9X6Czy44e9RxFCC94CfwThXMBVv6WU/UKqtw1L0U/LmHewfzftoIgAia18WN5pCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tYwCaYpt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tYwCaYpt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B814C2BCC9;
	Tue,  5 May 2026 20:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778012705;
	bh=lBo/lyaa4aB0w46YkGIP+XrB594mnvOG8246BMnPmmE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tYwCaYptvGeuEZ5Br2Rd65W/IpC7xAw2wmlSRemlXvRar2Wh7Sxnn2ayeUwYsisKc
	 496gnR1o3OxBur9uk6QX6tiXnmXUcrdhXYHKqDoklpdAY2X6Nn0jZ09sPwTe/LIZr1
	 rEAfQGNlxgrN1iEMx2BaW2hvhA70UGmEYspoxRHfLiWwo8oA34vhaQ8sqLn/meFynf
	 DoixMSyGPcd2AUIgAgs/+THPJ672bhnd/TGlhdCPhP79yiOYvALfgQrmZP9h2SS0Ir
	 CZCB9r6QQzY66jnUDxxP7o9QzuFp9Anp6rGymPVy6w9nhJXktF/Xn8gN25Own3wbNP
	 4I2pLaT1zijmA==
From: Arnd Bergmann <arnd@kernel.org>
To: Mark Brown <broonie@kernel.org>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v2 3/3] ASoC: pxa: integrate sound/arm/pxa2xx into sound/soc/pxa2xx
Date: Tue,  5 May 2026 22:24:26 +0200
Message-Id: <20260505202426.3605262-3-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260505202426.3605262-1-arnd@kernel.org>
References: <20260505202426.3605262-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The pxa2xx sound library modules are only used by the ASoC driver since
commit b094de7810f3 ("ASoC: codec: Remove pxa2xx-ac97.c"), so move the
code into the one module that uses as a simpliciation.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/sound/pxa2xx-lib.h                | 50 +----------------------
 sound/arm/Kconfig                         |  7 ----
 sound/arm/Makefile                        |  4 --
 sound/soc/pxa/Kconfig                     |  6 +++
 sound/soc/pxa/Makefile                    |  4 +-
 sound/soc/pxa/mmp-sspa.c                  |  2 +-
 sound/soc/pxa/pxa-ssp.c                   |  2 +-
 sound/{arm => soc/pxa}/pxa2xx-ac97-lib.c  | 10 +----
 sound/{arm => soc/pxa}/pxa2xx-ac97-regs.h |  0
 sound/soc/pxa/pxa2xx-ac97.c               |  3 +-
 sound/soc/pxa/pxa2xx-i2s.c                |  2 +-
 sound/soc/pxa/pxa2xx-lib.h                | 45 ++++++++++++++++++++
 sound/{arm => soc/pxa}/pxa2xx-pcm-lib.c   | 26 +++++-------
 sound/soc/pxa/pxa2xx-pcm.c                |  3 +-
 14 files changed, 73 insertions(+), 91 deletions(-)
 rename sound/{arm => soc/pxa}/pxa2xx-ac97-lib.c (96%)
 rename sound/{arm => soc/pxa}/pxa2xx-ac97-regs.h (100%)
 create mode 100644 sound/soc/pxa/pxa2xx-lib.h
 rename sound/{arm => soc/pxa}/pxa2xx-pcm-lib.c (86%)

diff --git a/include/sound/pxa2xx-lib.h b/include/sound/pxa2xx-lib.h
index 0a6f8dabf8c4..2d86f62f9408 100644
--- a/include/sound/pxa2xx-lib.h
+++ b/include/sound/pxa2xx-lib.h
@@ -2,55 +2,7 @@
 #ifndef PXA2XX_LIB_H
 #define PXA2XX_LIB_H
 
-#include <uapi/sound/asound.h>
-#include <linux/platform_device.h>
-
-/* PCM */
-struct snd_pcm_substream;
-struct snd_pcm_hw_params;
-struct snd_soc_pcm_runtime;
-struct snd_pcm;
-struct snd_soc_component;
-
-extern int pxa2xx_pcm_hw_params(struct snd_pcm_substream *substream,
-				struct snd_pcm_hw_params *params);
-extern int pxa2xx_pcm_trigger(struct snd_pcm_substream *substream, int cmd);
-extern snd_pcm_uframes_t pxa2xx_pcm_pointer(struct snd_pcm_substream *substream);
-extern int pxa2xx_pcm_prepare(struct snd_pcm_substream *substream);
-extern int pxa2xx_pcm_open(struct snd_pcm_substream *substream);
-extern int pxa2xx_pcm_close(struct snd_pcm_substream *substream);
-extern int pxa2xx_pcm_preallocate_dma_buffer(struct snd_pcm *pcm);
-extern int pxa2xx_soc_pcm_new(struct snd_soc_component *component,
-			      struct snd_soc_pcm_runtime *rtd);
-extern int pxa2xx_soc_pcm_open(struct snd_soc_component *component,
-			       struct snd_pcm_substream *substream);
-extern int pxa2xx_soc_pcm_close(struct snd_soc_component *component,
-				struct snd_pcm_substream *substream);
-extern int pxa2xx_soc_pcm_hw_params(struct snd_soc_component *component,
-				    struct snd_pcm_substream *substream,
-				    struct snd_pcm_hw_params *params);
-extern int pxa2xx_soc_pcm_prepare(struct snd_soc_component *component,
-				  struct snd_pcm_substream *substream);
-extern int pxa2xx_soc_pcm_trigger(struct snd_soc_component *component,
-				  struct snd_pcm_substream *substream, int cmd);
-extern snd_pcm_uframes_t
-pxa2xx_soc_pcm_pointer(struct snd_soc_component *component,
-		       struct snd_pcm_substream *substream);
-
-/* AC97 */
-
-extern int pxa2xx_ac97_read(int slot, unsigned short reg);
-extern int pxa2xx_ac97_write(int slot, unsigned short reg, unsigned short val);
-
-extern bool pxa2xx_ac97_try_warm_reset(void);
-extern bool pxa2xx_ac97_try_cold_reset(void);
-extern void pxa2xx_ac97_finish_reset(void);
-
-extern int pxa2xx_ac97_hw_suspend(void);
-extern int pxa2xx_ac97_hw_resume(void);
-
-extern int pxa2xx_ac97_hw_probe(struct platform_device *dev);
-extern void pxa2xx_ac97_hw_remove(struct platform_device *dev);
+#include <linux/types.h>
 
 /* modem registers, used by touchscreen driver */
 u32 pxa2xx_ac97_read_modr(void);
diff --git a/sound/arm/Kconfig b/sound/arm/Kconfig
index e4d7288d1e1e..09054ce8074f 100644
--- a/sound/arm/Kconfig
+++ b/sound/arm/Kconfig
@@ -19,10 +19,3 @@ config SND_ARMAACI
 	select SND_AC97_CODEC
 
 endif	# SND_ARM
-
-config SND_PXA2XX_LIB
-	tristate
-	select SND_DMAENGINE_PCM
-
-config SND_PXA2XX_LIB_AC97
-	bool
diff --git a/sound/arm/Makefile b/sound/arm/Makefile
index 99325a66cf77..6b91eb796b9b 100644
--- a/sound/arm/Makefile
+++ b/sound/arm/Makefile
@@ -5,7 +5,3 @@
 
 obj-$(CONFIG_SND_ARMAACI)	+= snd-aaci.o
 snd-aaci-y			:= aaci.o
-
-obj-$(CONFIG_SND_PXA2XX_LIB)	+= snd-pxa2xx-lib.o
-snd-pxa2xx-lib-y		:= pxa2xx-pcm-lib.o
-snd-pxa2xx-lib-$(CONFIG_SND_PXA2XX_LIB_AC97)	+= pxa2xx-ac97-lib.o
diff --git a/sound/soc/pxa/Kconfig b/sound/soc/pxa/Kconfig
index 4bd14ae330d5..2788514be6b1 100644
--- a/sound/soc/pxa/Kconfig
+++ b/sound/soc/pxa/Kconfig
@@ -54,4 +54,10 @@ config SND_PXA910_SOC
 	  Say Y if you want to add support for SoC audio on the
 	  Marvell PXA910 reference platform.
 
+config SND_PXA2XX_LIB
+	tristate
+	select SND_DMAENGINE_PCM
+
+config SND_PXA2XX_LIB_AC97
+	bool
 endmenu
diff --git a/sound/soc/pxa/Makefile b/sound/soc/pxa/Makefile
index 93b4e57eaa5c..bf504a85657c 100644
--- a/sound/soc/pxa/Makefile
+++ b/sound/soc/pxa/Makefile
@@ -1,8 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
 # PXA Platform Support
 snd-soc-pxa2xx-y := pxa2xx-pcm.o
-snd-soc-pxa2xx-ac97-y := pxa2xx-ac97.o
+snd-soc-pxa2xx-ac97-y := pxa2xx-ac97.o pxa2xx-ac97-lib.o
 snd-soc-pxa2xx-i2s-y := pxa2xx-i2s.o
+snd-soc-pxa2xx-lib-y := pxa2xx-pcm-lib.o
 snd-soc-pxa-ssp-y := pxa-ssp.o
 snd-soc-mmp-sspa-y := mmp-sspa.o
 
@@ -11,6 +12,7 @@ obj-$(CONFIG_SND_PXA2XX_SOC_AC97) += snd-soc-pxa2xx-ac97.o
 obj-$(CONFIG_SND_PXA2XX_SOC_I2S) += snd-soc-pxa2xx-i2s.o
 obj-$(CONFIG_SND_PXA_SOC_SSP) += snd-soc-pxa-ssp.o
 obj-$(CONFIG_SND_MMP_SOC_SSPA) += snd-soc-mmp-sspa.o
+obj-$(CONFIG_SND_PXA2XX_LIB)   += snd-soc-pxa2xx-lib.o
 
 # PXA Machine Support
 snd-soc-spitz-y := spitz.o
diff --git a/sound/soc/pxa/mmp-sspa.c b/sound/soc/pxa/mmp-sspa.c
index 73f36c9dd35c..fbbce81680cf 100644
--- a/sound/soc/pxa/mmp-sspa.c
+++ b/sound/soc/pxa/mmp-sspa.c
@@ -20,8 +20,8 @@
 #include <sound/initval.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
-#include <sound/pxa2xx-lib.h>
 #include <sound/dmaengine_pcm.h>
+#include "pxa2xx-lib.h"
 #include "mmp-sspa.h"
 
 /*
diff --git a/sound/soc/pxa/pxa-ssp.c b/sound/soc/pxa/pxa-ssp.c
index 37bd8dbd541f..f8054c1c59fa 100644
--- a/sound/soc/pxa/pxa-ssp.c
+++ b/sound/soc/pxa/pxa-ssp.c
@@ -27,9 +27,9 @@
 #include <sound/initval.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
-#include <sound/pxa2xx-lib.h>
 #include <sound/dmaengine_pcm.h>
 
+#include "pxa2xx-lib.h"
 #include "pxa-ssp.h"
 
 /*
diff --git a/sound/arm/pxa2xx-ac97-lib.c b/sound/soc/pxa/pxa2xx-ac97-lib.c
similarity index 96%
rename from sound/arm/pxa2xx-ac97-lib.c
rename to sound/soc/pxa/pxa2xx-ac97-lib.c
index 87e0d6b1e160..d9c3935636da 100644
--- a/sound/arm/pxa2xx-ac97-lib.c
+++ b/sound/soc/pxa/pxa2xx-ac97-lib.c
@@ -23,6 +23,7 @@
 #include <linux/platform_data/asoc-pxa.h>
 
 #include "pxa2xx-ac97-regs.h"
+#include "pxa2xx-lib.h"
 
 static DEFINE_MUTEX(car_mutex);
 static DECLARE_WAIT_QUEUE_HEAD(gsr_wq);
@@ -82,7 +83,6 @@ int pxa2xx_ac97_read(int slot, unsigned short reg)
 	wait_event_timeout(gsr_wq, (readl(ac97_reg_base + GSR) | gsr_bits) & GSR_SDONE, 1);
 	return val;
 }
-EXPORT_SYMBOL_GPL(pxa2xx_ac97_read);
 
 int pxa2xx_ac97_write(int slot, unsigned short reg, unsigned short val)
 {
@@ -112,7 +112,6 @@ int pxa2xx_ac97_write(int slot, unsigned short reg, unsigned short val)
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(pxa2xx_ac97_write);
 
 #ifdef CONFIG_PXA25x
 static inline void pxa_ac97_warm_pxa25x(void)
@@ -225,7 +224,6 @@ bool pxa2xx_ac97_try_warm_reset(void)
 
 	return true;
 }
-EXPORT_SYMBOL_GPL(pxa2xx_ac97_try_warm_reset);
 
 bool pxa2xx_ac97_try_cold_reset(void)
 {
@@ -262,7 +260,6 @@ bool pxa2xx_ac97_try_cold_reset(void)
 
 	return true;
 }
-EXPORT_SYMBOL_GPL(pxa2xx_ac97_try_cold_reset);
 
 
 void pxa2xx_ac97_finish_reset(void)
@@ -272,7 +269,6 @@ void pxa2xx_ac97_finish_reset(void)
 	gcr |= GCR_SDONE_IE|GCR_CDONE_IE;
 	writel(gcr, ac97_reg_base + GCR);
 }
-EXPORT_SYMBOL_GPL(pxa2xx_ac97_finish_reset);
 
 static irqreturn_t pxa2xx_ac97_irq(int irq, void *dev_id)
 {
@@ -306,14 +302,12 @@ int pxa2xx_ac97_hw_suspend(void)
 	clk_disable_unprepare(ac97_clk);
 	return 0;
 }
-EXPORT_SYMBOL_GPL(pxa2xx_ac97_hw_suspend);
 
 int pxa2xx_ac97_hw_resume(void)
 {
 	clk_prepare_enable(ac97_clk);
 	return 0;
 }
-EXPORT_SYMBOL_GPL(pxa2xx_ac97_hw_resume);
 #endif
 
 int pxa2xx_ac97_hw_probe(struct platform_device *dev)
@@ -388,7 +382,6 @@ int pxa2xx_ac97_hw_probe(struct platform_device *dev)
 err_conf:
 	return ret;
 }
-EXPORT_SYMBOL_GPL(pxa2xx_ac97_hw_probe);
 
 void pxa2xx_ac97_hw_remove(struct platform_device *dev)
 {
@@ -402,7 +395,6 @@ void pxa2xx_ac97_hw_remove(struct platform_device *dev)
 	clk_put(ac97_clk);
 	ac97_clk = NULL;
 }
-EXPORT_SYMBOL_GPL(pxa2xx_ac97_hw_remove);
 
 u32 pxa2xx_ac97_read_modr(void)
 {
diff --git a/sound/arm/pxa2xx-ac97-regs.h b/sound/soc/pxa/pxa2xx-ac97-regs.h
similarity index 100%
rename from sound/arm/pxa2xx-ac97-regs.h
rename to sound/soc/pxa/pxa2xx-ac97-regs.h
diff --git a/sound/soc/pxa/pxa2xx-ac97.c b/sound/soc/pxa/pxa2xx-ac97.c
index b0b1293bc849..7b9036947dfc 100644
--- a/sound/soc/pxa/pxa2xx-ac97.c
+++ b/sound/soc/pxa/pxa2xx-ac97.c
@@ -18,11 +18,12 @@
 #include <sound/core.h>
 #include <sound/ac97_codec.h>
 #include <sound/soc.h>
-#include <sound/pxa2xx-lib.h>
 #include <sound/dmaengine_pcm.h>
 
 #include <linux/platform_data/asoc-pxa.h>
 
+#include "pxa2xx-lib.h"
+
 #define PCDR	0x0040  /* PCM FIFO Data Register */
 #define MODR	0x0140  /* Modem FIFO Data Register */
 #define MCDR	0x0060  /* Mic-in FIFO Data Register */
diff --git a/sound/soc/pxa/pxa2xx-i2s.c b/sound/soc/pxa/pxa2xx-i2s.c
index f6ada6cffc88..fe1df78926f5 100644
--- a/sound/soc/pxa/pxa2xx-i2s.c
+++ b/sound/soc/pxa/pxa2xx-i2s.c
@@ -18,11 +18,11 @@
 #include <sound/pcm.h>
 #include <sound/initval.h>
 #include <sound/soc.h>
-#include <sound/pxa2xx-lib.h>
 #include <sound/dmaengine_pcm.h>
 
 #include <linux/platform_data/asoc-pxa.h>
 
+#include "pxa2xx-lib.h"
 #include "pxa2xx-i2s.h"
 
 /*
diff --git a/sound/soc/pxa/pxa2xx-lib.h b/sound/soc/pxa/pxa2xx-lib.h
new file mode 100644
index 000000000000..3a9d6ac8d367
--- /dev/null
+++ b/sound/soc/pxa/pxa2xx-lib.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __PXA2XX_LIB_H
+#define __PXA2XX_LIB_H
+
+#include <uapi/sound/asound.h>
+#include <linux/platform_device.h>
+
+/* PCM */
+struct snd_pcm_substream;
+struct snd_pcm_hw_params;
+struct snd_soc_pcm_runtime;
+struct snd_pcm;
+struct snd_soc_component;
+
+int pxa2xx_soc_pcm_new(struct snd_soc_component *component,
+		       struct snd_soc_pcm_runtime *rtd);
+int pxa2xx_soc_pcm_open(struct snd_soc_component *component,
+		        struct snd_pcm_substream *substream);
+int pxa2xx_soc_pcm_close(struct snd_soc_component *component,
+			 struct snd_pcm_substream *substream);
+int pxa2xx_soc_pcm_hw_params(struct snd_soc_component *component,
+			     struct snd_pcm_substream *substream,
+			     struct snd_pcm_hw_params *params);
+int pxa2xx_soc_pcm_prepare(struct snd_soc_component *component,
+			   struct snd_pcm_substream *substream);
+int pxa2xx_soc_pcm_trigger(struct snd_soc_component *component,
+			   struct snd_pcm_substream *substream, int cmd);
+snd_pcm_uframes_t pxa2xx_soc_pcm_pointer(struct snd_soc_component *component,
+					 struct snd_pcm_substream *substream);
+
+/* AC97 */
+int pxa2xx_ac97_read(int slot, unsigned short reg);
+int pxa2xx_ac97_write(int slot, unsigned short reg, unsigned short val);
+
+bool pxa2xx_ac97_try_warm_reset(void);
+bool pxa2xx_ac97_try_cold_reset(void);
+void pxa2xx_ac97_finish_reset(void);
+
+int pxa2xx_ac97_hw_suspend(void);
+int pxa2xx_ac97_hw_resume(void);
+
+int pxa2xx_ac97_hw_probe(struct platform_device *dev);
+void pxa2xx_ac97_hw_remove(struct platform_device *dev);
+
+#endif
diff --git a/sound/arm/pxa2xx-pcm-lib.c b/sound/soc/pxa/pxa2xx-pcm-lib.c
similarity index 86%
rename from sound/arm/pxa2xx-pcm-lib.c
rename to sound/soc/pxa/pxa2xx-pcm-lib.c
index 571e9d909cdf..88a9d3226302 100644
--- a/sound/arm/pxa2xx-pcm-lib.c
+++ b/sound/soc/pxa/pxa2xx-pcm-lib.c
@@ -9,9 +9,10 @@
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
-#include <sound/pxa2xx-lib.h>
 #include <sound/dmaengine_pcm.h>
 
+#include "pxa2xx-lib.h"
+
 static const struct snd_pcm_hardware pxa2xx_pcm_hardware = {
 	.info			= SNDRV_PCM_INFO_MMAP |
 				  SNDRV_PCM_INFO_MMAP_VALID |
@@ -29,8 +30,8 @@ static const struct snd_pcm_hardware pxa2xx_pcm_hardware = {
 	.fifo_size		= 32,
 };
 
-int pxa2xx_pcm_hw_params(struct snd_pcm_substream *substream,
-			 struct snd_pcm_hw_params *params)
+static int pxa2xx_pcm_hw_params(struct snd_pcm_substream *substream,
+			        struct snd_pcm_hw_params *params)
 {
 	struct dma_chan *chan = snd_dmaengine_pcm_get_chan(substream);
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
@@ -56,28 +57,24 @@ int pxa2xx_pcm_hw_params(struct snd_pcm_substream *substream,
 
 	return 0;
 }
-EXPORT_SYMBOL(pxa2xx_pcm_hw_params);
 
-int pxa2xx_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
+static int pxa2xx_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 {
 	return snd_dmaengine_pcm_trigger(substream, cmd);
 }
-EXPORT_SYMBOL(pxa2xx_pcm_trigger);
 
-snd_pcm_uframes_t
+static snd_pcm_uframes_t
 pxa2xx_pcm_pointer(struct snd_pcm_substream *substream)
 {
 	return snd_dmaengine_pcm_pointer(substream);
 }
-EXPORT_SYMBOL(pxa2xx_pcm_pointer);
 
-int pxa2xx_pcm_prepare(struct snd_pcm_substream *substream)
+static int pxa2xx_pcm_prepare(struct snd_pcm_substream *substream)
 {
 	return 0;
 }
-EXPORT_SYMBOL(pxa2xx_pcm_prepare);
 
-int pxa2xx_pcm_open(struct snd_pcm_substream *substream)
+static int pxa2xx_pcm_open(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
@@ -114,22 +111,19 @@ int pxa2xx_pcm_open(struct snd_pcm_substream *substream)
 		substream, dma_request_slave_channel(snd_soc_rtd_to_cpu(rtd, 0)->dev,
 						     dma_params->chan_name));
 }
-EXPORT_SYMBOL(pxa2xx_pcm_open);
 
-int pxa2xx_pcm_close(struct snd_pcm_substream *substream)
+static int pxa2xx_pcm_close(struct snd_pcm_substream *substream)
 {
 	return snd_dmaengine_pcm_close_release_chan(substream);
 }
-EXPORT_SYMBOL(pxa2xx_pcm_close);
 
-int pxa2xx_pcm_preallocate_dma_buffer(struct snd_pcm *pcm)
+static int pxa2xx_pcm_preallocate_dma_buffer(struct snd_pcm *pcm)
 {
 	size_t size = pxa2xx_pcm_hardware.buffer_bytes_max;
 
 	return snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV_WC,
 					    pcm->card->dev, size);
 }
-EXPORT_SYMBOL(pxa2xx_pcm_preallocate_dma_buffer);
 
 int pxa2xx_soc_pcm_new(struct snd_soc_component *component,
 		       struct snd_soc_pcm_runtime *rtd)
diff --git a/sound/soc/pxa/pxa2xx-pcm.c b/sound/soc/pxa/pxa2xx-pcm.c
index ff0fbb61dccd..71b7bd948b5e 100644
--- a/sound/soc/pxa/pxa2xx-pcm.c
+++ b/sound/soc/pxa/pxa2xx-pcm.c
@@ -14,9 +14,10 @@
 
 #include <sound/core.h>
 #include <sound/soc.h>
-#include <sound/pxa2xx-lib.h>
 #include <sound/dmaengine_pcm.h>
 
+#include "pxa2xx-lib.h"
+
 static const struct snd_soc_component_driver pxa2xx_soc_platform = {
 	.pcm_new	= pxa2xx_soc_pcm_new,
 	.open		= pxa2xx_soc_pcm_open,
-- 
2.39.5

