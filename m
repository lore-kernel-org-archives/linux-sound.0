Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA4B2ECE93
	for <linux-sound@vger.kernel.org>; Thu, 15 Jan 2026 19:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768504693; cv=none; b=NMUG630+pupG1d/yuo1RWdMR6tycEFoEIYOdHgPphPqkE8TM+0LKVLIGtO96I1SStvIvWznjxOnRTaYfqR8hhPUbmTmM9/PKctvhU47UkrWeJcsXkkL/OfULvEZRjgSSFWHcQCTKjqNmlhhxp9g8APZcgsp5ys3lcuh+3SIdIV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768504693; c=relaxed/simple;
	bh=U87qKfZ+a2BJ0cZEbw/LPacZcRExH/zpxyJ6JBlkiaU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oTrmPJBKsOQbF8m6zuywV6atnZBq1qXU/nrmEooFOoN8unhgac4reU+CVhwqdguZ1zhehRVkKxFbnGHcsnYXTyeU/5A7lqVxD6TCd+qhXXwxFAo1hXV/XiWzyYDZIgjS6uT7j+ehIAe/f/G5AA2MfIZgYgdZGlZ+hhvjr3U46Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H3fT1vCA; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H3fT1vCA"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4801bc328easo7318505e9.3
        for <linux-sound@vger.kernel.org>; Thu, 15 Jan 2026 11:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768504687; x=1769109487; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T1ynBQuWv4/1+RgpFKalLvGF7AqBFgPFTFi/g/rKhHQ=;
        b=H3fT1vCA1PfmyRfTy1MNMxQ3JTENwpzQIN8pBuQ51Yy/+iFQVMxReNLMkE4KqHhynm
         Tir8FgWkYbn6uhmEtYf8dv9WP9m9Sx4EvhFItk+sUz2M0YLYhGLMGjJDMqBBDW5nZBGC
         Nck3Nf0wvHG0DBlLWtjKaLUPgehwYzAzQWw975pbV6uoOj2P38nt35L5llm2oaNUpRo6
         RWkK49XXVXySUg0zrp3Uq6wyqQYfbIqs7tluu3roV8F3kwud3vu1s2VQWGdXGIfxGtrI
         aFMFdBCO8N9Nb2e9OWvpF5/dMAoCRicAb+ELoBHJX2g1CNyg/DJzhcCxqsRF0yeuX7J+
         Kh3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768504687; x=1769109487;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T1ynBQuWv4/1+RgpFKalLvGF7AqBFgPFTFi/g/rKhHQ=;
        b=xBsSYW81/K0nbYul49Ew23ItmshYU+ceidnkIAQtWhzAgyLqDmrTad9P1CuNk6q9g5
         PNJKY88+DkzP6vpUQt+xDl8JmZY0FbRxn+5lj0LMcGBQacT//8I9hNIe/AXV813Y5Sui
         MmCK6WnLad7N8tu5dzPzL4gInMket88SuFUS1mpkAtmcZdkmVRkLuoGPTCqNA2dzihiV
         2vhukkxcHgV0PZVcW4zokMhJSzXVR2E8zTkUm7QPXw2Ih3pdcpkBN+TV6YX8+F+rx1pO
         lRG9UJK1hR3HzriQQzeszRX3xDq2S4GPehXMIDg5t7CtDVY8yC9JQ65wkC/IPlHkELO7
         W7PA==
X-Gm-Message-State: AOJu0Yzv7ngGtDK/yzMVBBmxdqyODkL9iB6YKjZ/b6S+EVwLllpm2/kB
	XWY3d23B9axTIQ28P9Cfx/hQTXjW5JyHKLwMXt10q5d76j+U1aHIuPK7
X-Gm-Gg: AY/fxX6MKFsCe8d6x9yVnxGwMrvDLJL69UOiU7MtmbdZJsBdgRSluNoMrt0P7f5q1sm
	sw5ETHCPmXdWDyhQxcHb1ylF9cRPZkp9RMu/L4aYikldaAsD452dpWfT1Ucoef3GZdG5dKxCaos
	KjKF61jgXZWMEMSvMgtktwEu8J/pU1AclPHYpGhATCppu7GjxhgSlTe79erL8lhME1YrcBbOBI8
	cHaNx2Lub1WTTJ8CwWAp+2l8mYepxKX4xtsMJZ0DkgRDtnHPHr7UHvUni+NWoZWRWgTll7fC6sW
	YJ2TEPLCYV8PiFUOs1OE9cerrNVtyAIDo0I+x69LjJAJQ2BcHIom3H+gX2pqHhhB+fdMnC968RO
	Uju3ySzJOfM1L07yEUPss6+tXCC2K4D8zFycucLWci9MFbsKPEBpilyWFOzQmVga1SMO6jUmCSs
	WMK6XIx0WSwJsPoBQbRO8a46//pyPgpn2X9nLULdCxl/8GXMwZCCXfEO8=
X-Received: by 2002:a05:600c:34d6:b0:47d:3ead:7440 with SMTP id 5b1f17b1804b1-4801eb131b2mr3101085e9.32.1768504687290;
        Thu, 15 Jan 2026 11:18:07 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569921dedsm692734f8f.9.2026.01.15.11.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 11:18:06 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Date: Thu, 15 Jan 2026 23:17:39 +0400
Subject: [PATCH 2/8] ASoC: sophgo: add CV1800B I2S/TDM controller driver
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-cv1800b-i2s-driver-v1-2-e8b22b8578ab@gmail.com>
References: <20260115-cv1800b-i2s-driver-v1-0-e8b22b8578ab@gmail.com>
In-Reply-To: <20260115-cv1800b-i2s-driver-v1-0-e8b22b8578ab@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 "Anton D. Stavinskii" <stavinsky@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768504677; l=24180;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=U87qKfZ+a2BJ0cZEbw/LPacZcRExH/zpxyJ6JBlkiaU=;
 b=eTCNg1xLNSE3zAMGpNuwOq3+EzAX0A17CiZnO26wEoD+oD7sJSvXP1VX3rJJaKYET1OcXwxOf
 /6Rd9Z2l4SGBqcO5kcgpgxH9e4/ocv+iX83xhbQ369QC45JlJVEKkE0
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=

The actual CPU DAI controller.

Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
 sound/soc/Kconfig              |   1 +
 sound/soc/Makefile             |   1 +
 sound/soc/sophgo/Kconfig       |  20 ++
 sound/soc/sophgo/Makefile      |   3 +
 sound/soc/sophgo/cv1800b-tdm.c | 714 +++++++++++++++++++++++++++++++++++++++++
 5 files changed, 739 insertions(+)

diff --git a/sound/soc/Kconfig b/sound/soc/Kconfig
index 36e0d443ba0e..edfdcbf734fe 100644
--- a/sound/soc/Kconfig
+++ b/sound/soc/Kconfig
@@ -127,6 +127,7 @@ source "sound/soc/renesas/Kconfig"
 source "sound/soc/rockchip/Kconfig"
 source "sound/soc/samsung/Kconfig"
 source "sound/soc/sdca/Kconfig"
+source "sound/soc/sophgo/Kconfig"
 source "sound/soc/spacemit/Kconfig"
 source "sound/soc/spear/Kconfig"
 source "sound/soc/sprd/Kconfig"
diff --git a/sound/soc/Makefile b/sound/soc/Makefile
index 8c0480e6484e..21d8406767fc 100644
--- a/sound/soc/Makefile
+++ b/sound/soc/Makefile
@@ -70,6 +70,7 @@ obj-$(CONFIG_SND_SOC)	+= rockchip/
 obj-$(CONFIG_SND_SOC)	+= samsung/
 obj-$(CONFIG_SND_SOC)	+= sdca/
 obj-$(CONFIG_SND_SOC)	+= sof/
+obj-$(CONFIG_SND_SOC)   += sophgo/
 obj-$(CONFIG_SND_SOC)	+= spacemit/
 obj-$(CONFIG_SND_SOC)	+= spear/
 obj-$(CONFIG_SND_SOC)	+= sprd/
diff --git a/sound/soc/sophgo/Kconfig b/sound/soc/sophgo/Kconfig
new file mode 100644
index 000000000000..70f07d46c810
--- /dev/null
+++ b/sound/soc/sophgo/Kconfig
@@ -0,0 +1,20 @@
+menu "Sophgo"
+	depends on COMPILE_TEST || ARCH_SOPHGO
+
+config SND_SOC_CV1800B_TDM
+	tristate "Sophgo CV1800B I2S/TDM support"
+	depends on SND_SOC && OF
+	select SND_SOC_GENERIC_DMAENGINE_PCM
+	help
+	  This option enables the I2S/TDM audio controller found in Sophgo
+	  CV1800B / SG2002 SoCs. The controller supports standard I2S
+	  audio modes for playback and capture.
+
+	  The driver integrates with the ASoC framework and uses the DMA
+	  engine for audio data transfer. It is intended to be configured
+	  via Device Tree along with simple-audio-card module.
+
+	  To compile the driver as a module, choose M here: the module will
+	  be called cv1800b_tdm.
+
+endmenu
diff --git a/sound/soc/sophgo/Makefile b/sound/soc/sophgo/Makefile
new file mode 100644
index 000000000000..3f9f1d07227a
--- /dev/null
+++ b/sound/soc/sophgo/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+# Sophgo Platform Support
+obj-$(CONFIG_SND_SOC_CV1800B_TDM) += cv1800b-tdm.o
diff --git a/sound/soc/sophgo/cv1800b-tdm.c b/sound/soc/sophgo/cv1800b-tdm.c
new file mode 100644
index 000000000000..5bd9236ef3b9
--- /dev/null
+++ b/sound/soc/sophgo/cv1800b-tdm.c
@@ -0,0 +1,714 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <sound/dmaengine_pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <linux/string.h>
+#include <linux/dev_printk.h>
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/limits.h>
+
+#define TX_FIFO_SIZE (1024)
+#define RX_FIFO_SIZE (1024)
+#define TX_MAX_BURST (8)
+#define RX_MAX_BURST (8)
+
+#define CV1800B_DEF_FREQ          24576000
+#define CV1800B_DEF_MCLK_FS_RATIO 256
+
+/* tdm registers */
+#define CV1800B_BLK_MODE_SETTING  0x000
+#define CV1800B_FRAME_SETTING     0x004
+#define CV1800B_SLOT_SETTING1     0x008
+#define CV1800B_SLOT_SETTING2     0x00C
+#define CV1800B_DATA_FORMAT       0x010
+#define CV1800B_BLK_CFG           0x014
+#define CV1800B_I2S_ENABLE        0x018
+#define CV1800B_I2S_RESET         0x01C
+#define CV1800B_I2S_INT_EN        0x020
+#define CV1800B_I2S_INT           0x024
+#define CV1800B_FIFO_THRESHOLD    0x028
+#define CV1800B_LRCK_MASTER       0x02C /* special clock only mode */
+#define CV1800B_FIFO_RESET        0x030
+#define CV1800B_RX_STATUS         0x040
+#define CV1800B_TX_STATUS         0x048
+#define CV1800B_CLK_CTRL0         0x060
+#define CV1800B_CLK_CTRL1         0x064
+#define CV1800B_PCM_SYNTH         0x068
+#define CV1800B_RX_RD_PORT        0x080
+#define CV1800B_TX_WR_PORT        0x0C0
+
+/* CV1800B_BLK_MODE_SETTING (0x000) */
+#define BLK_TX_MODE_MASK                   GENMASK(0, 0)
+#define BLK_MASTER_MODE_MASK               GENMASK(1, 1)
+#define BLK_DMA_MODE_MASK                  GENMASK(7, 7)
+
+/* CV1800B_CLK_CTRL1 (0x064) */
+#define CLK_MCLK_DIV_MASK                  GENMASK(15, 0)
+#define CLK_BCLK_DIV_MASK                  GENMASK(31, 16)
+
+/* CV1800B_CLK_CTRL0 (0x060) */
+#define CLK_AUD_CLK_SEL_MASK               GENMASK(0, 0)
+#define CLK_BCLK_OUT_CLK_FORCE_EN_MASK     GENMASK(6, 6)
+#define CLK_MCLK_OUT_EN_MASK               GENMASK(7, 7)
+#define CLK_AUD_EN_MASK                    GENMASK(8, 8)
+
+/* CV1800B_I2S_RESET (0x01C) */
+#define RST_I2S_RESET_RX_MASK              GENMASK(0, 0)
+#define RST_I2S_RESET_TX_MASK              GENMASK(1, 1)
+
+/* CV1800B_FIFO_RESET (0x030) */
+#define FIFO_RX_RESET_MASK                 GENMASK(0, 0)
+#define FIFO_TX_RESET_MASK                 GENMASK(16, 16)
+
+/* CV1800B_I2S_ENABLE (0x018) */
+#define I2S_ENABLE_MASK                    GENMASK(0, 0)
+
+/* CV1800B_BLK_CFG (0x014) */
+#define BLK_AUTO_DISABLE_WITH_CH_EN_MASK   GENMASK(4, 4)
+#define BLK_RX_BLK_CLK_FORCE_EN_MASK       GENMASK(8, 8)
+#define BLK_RX_FIFO_DMA_CLK_FORCE_EN_MASK  GENMASK(9, 9)
+#define BLK_TX_BLK_CLK_FORCE_EN_MASK       GENMASK(16, 16)
+#define BLK_TX_FIFO_DMA_CLK_FORCE_EN_MASK  GENMASK(17, 17)
+
+/* CV1800B_FRAME_SETTING (0x004) */
+#define FRAME_LENGTH_MASK                  GENMASK(8, 0)
+#define FS_ACTIVE_LENGTH_MASK              GENMASK(23, 16)
+
+/* CV1800B_I2S_INT_EN (0x020) */
+#define INT_I2S_INT_EN_MASK                GENMASK(8, 8)
+
+/* CV1800B_SLOT_SETTING2 (0x00C) */
+#define SLOT_EN_MASK                       GENMASK(15, 0)
+
+/* CV1800B_LRCK_MASTER (0x02C) */
+#define LRCK_MASTER_ENABLE_MASK            GENMASK(0, 0)
+
+/* CV1800B_DATA_FORMAT (0x010) */
+#define DF_WORD_LENGTH_MASK	           GENMASK(2, 1)
+#define DF_TX_SOURCE_LEFT_ALIGN_MASK       GENMASK(6, 6)
+
+/* CV1800B_FIFO_THRESHOLD (0x028) */
+#define FIFO_RX_THRESHOLD_MASK	           GENMASK(4, 0)
+#define FIFO_TX_THRESHOLD_MASK	           GENMASK(20, 16)
+#define FIFO_TX_HIGH_THRESHOLD_MASK        GENMASK(28, 24)
+
+/* CV1800B_SLOT_SETTING1 (0x008) */
+#define SLOT_NUM_MASK                      GENMASK(3, 0)
+#define SLOT_SIZE_MASK                     GENMASK(13, 8)
+#define DATA_SIZE_MASK                     GENMASK(20, 16)
+#define FB_OFFSET_MASK                     GENMASK(28, 24)
+
+enum cv1800b_tdm_word_length {
+	CV1800B_WORD_LENGTH_8_BIT = 0,
+	CV1800B_WORD_LENGTH_16_BIT = 1,
+	CV1800B_WORD_LENGTH_32_BIT = 2,
+};
+
+struct cv1800b_i2s {
+	void __iomem *base;
+	struct clk *clk;
+	struct clk *sysclk;
+	struct device *dev;
+	struct snd_dmaengine_dai_dma_data playback_dma;
+	struct snd_dmaengine_dai_dma_data capture_dma;
+	u32 mclk_rate;
+	bool bclk_ratio_fixed;
+	u32 bclk_ratio;
+
+};
+
+static void cv1800b_setup_dma_struct(struct cv1800b_i2s *i2s,
+				     phys_addr_t phys_base)
+{
+	i2s->playback_dma.addr = phys_base + CV1800B_TX_WR_PORT;
+	i2s->playback_dma.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
+	i2s->playback_dma.fifo_size = TX_FIFO_SIZE;
+	i2s->playback_dma.maxburst = TX_MAX_BURST;
+
+	i2s->capture_dma.addr = phys_base + CV1800B_RX_RD_PORT;
+	i2s->capture_dma.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
+	i2s->capture_dma.fifo_size = RX_FIFO_SIZE;
+	i2s->capture_dma.maxburst = RX_MAX_BURST;
+}
+
+static const struct snd_dmaengine_pcm_config cv1800b_i2s_pcm_config = {
+	.prepare_slave_config = snd_dmaengine_pcm_prepare_slave_config,
+};
+
+static void cv1800b_reset_fifo(struct cv1800b_i2s *i2s)
+{
+	u32 val;
+
+	val = readl(i2s->base + CV1800B_FIFO_RESET);
+	val = u32_replace_bits(val, 1, FIFO_RX_RESET_MASK);
+	val = u32_replace_bits(val, 1, FIFO_TX_RESET_MASK);
+	writel(val, i2s->base + CV1800B_FIFO_RESET);
+
+	usleep_range(10, 20);
+
+	val = readl(i2s->base + CV1800B_FIFO_RESET);
+	val = u32_replace_bits(val, 0, FIFO_RX_RESET_MASK);
+	val = u32_replace_bits(val, 0, FIFO_TX_RESET_MASK);
+	writel(val, i2s->base + CV1800B_FIFO_RESET);
+}
+
+static void cv1800b_reset_i2s(struct cv1800b_i2s *i2s)
+{
+	u32 val;
+
+	val = readl(i2s->base + CV1800B_I2S_RESET);
+	val = u32_replace_bits(val, 1, RST_I2S_RESET_RX_MASK);
+	val = u32_replace_bits(val, 1, RST_I2S_RESET_TX_MASK);
+	writel(val, i2s->base + CV1800B_I2S_RESET);
+
+	usleep_range(10, 20);
+
+	val = readl(i2s->base + CV1800B_I2S_RESET);
+	val = u32_replace_bits(val, 0, RST_I2S_RESET_RX_MASK);
+	val = u32_replace_bits(val, 0, RST_I2S_RESET_TX_MASK);
+	writel(val, i2s->base + CV1800B_I2S_RESET);
+}
+
+static void cv1800b_set_mclk_div(struct cv1800b_i2s *i2s, u32 mclk_div)
+{
+	u32 val;
+
+	val = readl(i2s->base + CV1800B_CLK_CTRL1);
+	val = u32_replace_bits(val, mclk_div, CLK_MCLK_DIV_MASK);
+	writel(val, i2s->base + CV1800B_CLK_CTRL1);
+	dev_dbg(i2s->dev, "mclk_div is set to %u\n", mclk_div);
+}
+
+static void cv1800b_set_tx_mode(struct cv1800b_i2s *i2s, bool is_tx)
+{
+	u32 val;
+
+	val = readl(i2s->base + CV1800B_BLK_MODE_SETTING);
+	val = u32_replace_bits(val, is_tx, BLK_TX_MODE_MASK);
+	writel(val, i2s->base + CV1800B_BLK_MODE_SETTING);
+	dev_dbg(i2s->dev, "tx_mode is set to %u\n", is_tx);
+}
+
+static int cv1800b_set_bclk_div(struct cv1800b_i2s *i2s, u32 bclk_div)
+{
+	u32 val;
+
+	if (bclk_div == 0 || bclk_div > 0xFFFF)
+		return -EINVAL;
+
+	val = readl(i2s->base + CV1800B_CLK_CTRL1);
+	val = u32_replace_bits(val, bclk_div, CLK_BCLK_DIV_MASK);
+	writel(val, i2s->base + CV1800B_CLK_CTRL1);
+	dev_dbg(i2s->dev, "bclk_div is set to %u\n", bclk_div);
+	return 0;
+}
+
+/* set memory width of audio data , reg word_length */
+static int cv1800b_set_word_length(struct cv1800b_i2s *i2s,
+				   unsigned int physical_width)
+{
+	u8 word_length_val;
+	u32 val;
+
+	switch (physical_width) {
+	case 8:
+		word_length_val = CV1800B_WORD_LENGTH_8_BIT;
+		break;
+	case 16:
+		word_length_val = CV1800B_WORD_LENGTH_16_BIT;
+		break;
+	case 32:
+		word_length_val = CV1800B_WORD_LENGTH_32_BIT;
+		break;
+	default:
+		dev_dbg(i2s->dev, "can't set word_length field\n");
+		return -EINVAL;
+	}
+
+	val = readl(i2s->base + CV1800B_DATA_FORMAT);
+	val = u32_replace_bits(val, word_length_val, DF_WORD_LENGTH_MASK);
+	writel(val, i2s->base + CV1800B_DATA_FORMAT);
+	return 0;
+}
+
+static void cv1800b_enable_clocks(struct cv1800b_i2s *i2s, bool enabled)
+{
+	u32 val;
+
+	val = readl(i2s->base + CV1800B_CLK_CTRL0);
+	val = u32_replace_bits(val, enabled, CLK_AUD_EN_MASK);
+	writel(val, i2s->base + CV1800B_CLK_CTRL0);
+}
+
+static int cv1800b_set_slot_settings(struct cv1800b_i2s *i2s, u32 slots,
+				     u32 physical_width, u32 data_size)
+{
+	u32 slot_num;
+	u32 slot_size;
+	u32 frame_length;
+	u32 frame_active_length;
+	u32 val;
+
+	if (!slots || !physical_width || !data_size) {
+		dev_err(i2s->dev, "frame or slot settings are not valid\n");
+		return -EINVAL;
+	}
+	if (slots > 16 || physical_width > 64 || data_size > 32) {
+		dev_err(i2s->dev, "frame or slot settings are not valid\n");
+		return -EINVAL;
+	}
+
+	slot_num = slots - 1;
+	slot_size = physical_width - 1;
+	frame_length = (physical_width * slots) - 1;
+	frame_active_length = physical_width - 1;
+
+	if (frame_length > 511 || frame_active_length > 255) {
+		dev_err(i2s->dev, "frame or slot settings are not valid\n");
+		return -EINVAL;
+	}
+
+	val = readl(i2s->base + CV1800B_SLOT_SETTING1);
+	val = u32_replace_bits(val, slot_size, SLOT_SIZE_MASK);
+	val = u32_replace_bits(val, data_size - 1, DATA_SIZE_MASK);
+	val = u32_replace_bits(val, slot_num, SLOT_NUM_MASK);
+	writel(val, i2s->base + CV1800B_SLOT_SETTING1);
+
+	val = readl(i2s->base + CV1800B_FRAME_SETTING);
+	val = u32_replace_bits(val, frame_length, FRAME_LENGTH_MASK);
+	val = u32_replace_bits(val, frame_active_length, FS_ACTIVE_LENGTH_MASK);
+	writel(val, i2s->base + CV1800B_FRAME_SETTING);
+
+	dev_dbg(i2s->dev, "slot settings num: %u width: %u\n", slots, physical_width);
+	return 0;
+}
+
+/*
+ * calculate mclk_div.
+ * if requested value is bigger than optimal
+ * leave mclk_div as 1. cff clock is capable
+ * to handle it
+ */
+static int cv1800b_calc_mclk_div(unsigned int target_mclk, u32 *mclk_div)
+{
+	*mclk_div = 1;
+
+	if (target_mclk == 0)
+		return -EINVAL;
+
+	/* optimal parent frequency is close to CV1800B_DEF_FREQ */
+	if (target_mclk < CV1800B_DEF_FREQ) {
+		*mclk_div = DIV_ROUND_CLOSEST(CV1800B_DEF_FREQ, target_mclk);
+		if (!*mclk_div || *mclk_div > 0xFFFF)
+			return -EINVAL;
+	}
+	return 0;
+}
+
+/*
+ * set CCF clock and divider for this clock
+ * mclk_clock = ccf_clock / mclk_div
+ */
+static int cv1800b_i2s_set_rate_for_mclk(struct cv1800b_i2s *i2s,
+					 unsigned int target_mclk)
+{
+	u32 mclk_div = 1;
+	u64 tmp;
+	int ret;
+	unsigned long clk_rate;
+	unsigned long actual;
+
+	ret = cv1800b_calc_mclk_div(target_mclk, &mclk_div);
+	if (ret) {
+		dev_dbg(i2s->dev, "can't calc mclk_div for freq %u\n",
+			target_mclk);
+		return ret;
+	}
+
+	tmp = (u64)target_mclk * mclk_div;
+	if (tmp > ULONG_MAX) {
+		dev_err(i2s->dev, "clk_rate overflow: freq=%u div=%u\n",
+			target_mclk, mclk_div);
+		return -ERANGE;
+	}
+
+	clk_rate = (unsigned long)tmp;
+
+	cv1800b_enable_clocks(i2s, false);
+
+	ret = clk_set_rate(i2s->sysclk, clk_rate);
+	if (ret)
+		return ret;
+
+	actual = clk_get_rate(i2s->sysclk);
+	if (clk_rate != actual) {
+		dev_err_ratelimited(i2s->dev,
+				    "clk_set_rate failed %lu, actual is %lu\n",
+				    clk_rate, actual);
+	}
+
+	cv1800b_set_mclk_div(i2s, mclk_div);
+	cv1800b_enable_clocks(i2s, true);
+
+	return 0;
+}
+
+static int cv1800b_i2s_hw_params(struct snd_pcm_substream *substream,
+				 struct snd_pcm_hw_params *params,
+				 struct snd_soc_dai *dai)
+{
+	struct cv1800b_i2s *i2s = snd_soc_dai_get_drvdata(dai);
+	unsigned int rate = params_rate(params);
+	unsigned int channels = params_channels(params);
+	unsigned int physical_width = params_physical_width(params);
+	int data_width = params_width(params);
+	bool tx_mode = (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) ? 1 : 0;
+	int ret;
+	u32 bclk_div;
+	u32 bclk_ratio;
+	u32 mclk_rate;
+	u64 tmp;
+
+	if (data_width < 0)
+		return data_width;
+
+	if (!channels || !rate || !physical_width)
+		return -EINVAL;
+
+	ret = cv1800b_set_slot_settings(i2s, channels, physical_width, data_width);
+	if (ret)
+		return ret;
+
+	if (i2s->mclk_rate) {
+		mclk_rate = i2s->mclk_rate;
+	} else {
+		dev_dbg(i2s->dev, "mclk is not set by machine driver\n");
+		ret = cv1800b_i2s_set_rate_for_mclk(i2s,
+						    rate * CV1800B_DEF_MCLK_FS_RATIO);
+		if (ret)
+			return ret;
+		mclk_rate = rate * CV1800B_DEF_MCLK_FS_RATIO;
+	}
+
+	bclk_ratio = (i2s->bclk_ratio_fixed) ? i2s->bclk_ratio :
+					       (physical_width * channels);
+
+	tmp = (u64)rate * bclk_ratio;
+	if (!tmp)
+		return -EINVAL;
+	if (mclk_rate % tmp)
+		dev_warn(i2s->dev, "mclk rate is not aligned to bclk or rate\n");
+
+	bclk_div = DIV_ROUND_CLOSEST((u64)mclk_rate, tmp);
+
+	ret = cv1800b_set_bclk_div(i2s, bclk_div);
+	if (ret)
+		return ret;
+
+	ret = cv1800b_set_word_length(i2s, physical_width);
+	if (ret)
+		return ret;
+
+	cv1800b_set_tx_mode(i2s, tx_mode);
+
+	cv1800b_reset_fifo(i2s);
+	cv1800b_reset_i2s(i2s);
+	return 0;
+}
+
+static int cv1800b_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
+			       struct snd_soc_dai *dai)
+{
+	struct cv1800b_i2s *i2s = snd_soc_dai_get_drvdata(dai);
+	u32 val;
+
+	val = readl(i2s->base + CV1800B_I2S_ENABLE);
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		val = u32_replace_bits(val, 1, I2S_ENABLE_MASK);
+		break;
+
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		val = u32_replace_bits(val, 0, I2S_ENABLE_MASK);
+		break;
+	default:
+		return -EINVAL;
+	}
+	writel(val, i2s->base + CV1800B_I2S_ENABLE);
+	return 0;
+}
+
+static int cv1800b_i2s_startup(struct snd_pcm_substream *substream,
+			       struct snd_soc_dai *dai)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct cv1800b_i2s *i2s = snd_soc_dai_get_drvdata(dai);
+	struct snd_soc_dai_link *dai_link = rtd->dai_link;
+
+	dev_dbg(i2s->dev, "%s: dai=%s substream=%d\n", __func__, dai->name,
+		substream->stream);
+	/**
+	 * Ensure DMA is stopped before DAI
+	 * shutdown (prevents DW AXI DMAC stop/busy on next open).
+	 */
+	dai_link->trigger_stop = SND_SOC_TRIGGER_ORDER_LDC;
+	return 0;
+}
+
+static int cv1800b_i2s_dai_probe(struct snd_soc_dai *dai)
+{
+	struct cv1800b_i2s *i2s = snd_soc_dai_get_drvdata(dai);
+
+	if (!i2s) {
+		dev_err(dai->dev, "no drvdata in DAI probe\n");
+		return -ENODEV;
+	}
+
+	snd_soc_dai_init_dma_data(dai, &i2s->playback_dma, &i2s->capture_dma);
+	return 0;
+}
+
+static int cv1800b_i2s_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
+{
+	struct cv1800b_i2s *i2s = snd_soc_dai_get_drvdata(dai);
+	u32 val;
+	u32 master;
+
+	/* only i2s format is supported */
+	if ((fmt & SND_SOC_DAIFMT_FORMAT_MASK) != SND_SOC_DAIFMT_I2S)
+		return -EINVAL;
+
+	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
+	case SND_SOC_DAIFMT_CBP_CFP:
+		dev_dbg(i2s->dev, "set to master mode\n");
+		master = 1;
+		break;
+
+	case SND_SOC_DAIFMT_CBC_CFC:
+		dev_dbg(i2s->dev, "set to slave mode\n");
+		master = 0;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	val = readl(i2s->base + CV1800B_BLK_MODE_SETTING);
+	val = u32_replace_bits(val, master, BLK_MASTER_MODE_MASK);
+	writel(val, i2s->base + CV1800B_BLK_MODE_SETTING);
+	return 0;
+}
+
+static int cv1800b_i2s_dai_set_bclk_ratio(struct snd_soc_dai *dai,
+					  unsigned int ratio)
+{
+	struct cv1800b_i2s *i2s = snd_soc_dai_get_drvdata(dai);
+
+	if (ratio == 0)
+		return -EINVAL;
+	i2s->bclk_ratio = ratio;
+	i2s->bclk_ratio_fixed = true;
+	return 0;
+}
+
+static int cv1800b_i2s_dai_set_sysclk(struct snd_soc_dai *dai, int clk_id,
+				      unsigned int freq, int dir)
+{
+	struct cv1800b_i2s *i2s = snd_soc_dai_get_drvdata(dai);
+	int ret;
+	u32 val;
+	bool output_enable = (dir == SND_SOC_CLOCK_OUT) ? true : false;
+
+	dev_dbg(i2s->dev, "%s called with %u\n", __func__, freq);
+	ret = cv1800b_i2s_set_rate_for_mclk(i2s, freq);
+	if (ret)
+		return ret;
+
+	val = readl(i2s->base + CV1800B_CLK_CTRL0);
+	val = u32_replace_bits(val, output_enable, CLK_MCLK_OUT_EN_MASK);
+	writel(val, i2s->base + CV1800B_CLK_CTRL0);
+
+	i2s->mclk_rate = freq;
+	return 0;
+}
+
+static const struct snd_soc_dai_ops cv1800b_i2s_dai_ops = {
+	.probe = cv1800b_i2s_dai_probe,
+	.startup = cv1800b_i2s_startup,
+	.hw_params = cv1800b_i2s_hw_params,
+	.trigger = cv1800b_i2s_trigger,
+	.set_fmt = cv1800b_i2s_dai_set_fmt,
+	.set_bclk_ratio = cv1800b_i2s_dai_set_bclk_ratio,
+	.set_sysclk = cv1800b_i2s_dai_set_sysclk,
+};
+
+static struct snd_soc_dai_driver cv1800b_i2s_dai_template = {
+	.name = "cv1800b-i2s",
+	.playback = {
+		.stream_name = "Playback",
+		.channels_min = 1,
+		.channels_max = 2,
+		.rates = SNDRV_PCM_RATE_8000_192000,
+		.formats = SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S16_LE,
+	},
+	.capture = {
+		.stream_name = "Capture",
+		.channels_min = 1,
+		.channels_max = 2,
+		.rates = SNDRV_PCM_RATE_8000_192000,
+		.formats = SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S16_LE,
+	},
+	.ops = &cv1800b_i2s_dai_ops,
+};
+
+static const struct snd_soc_component_driver cv1800b_i2s_component = {
+	.name = "cv1800b-i2s",
+};
+
+static void cv1800b_i2s_hw_disable(struct cv1800b_i2s *i2s)
+{
+	u32 val;
+
+	val = readl(i2s->base + CV1800B_I2S_ENABLE);
+	val = u32_replace_bits(val, 0, I2S_ENABLE_MASK);
+	writel(val, i2s->base + CV1800B_I2S_ENABLE);
+
+	val = readl(i2s->base + CV1800B_CLK_CTRL0);
+	val = u32_replace_bits(val, 0, CLK_AUD_EN_MASK);
+	val = u32_replace_bits(val, 0, CLK_MCLK_OUT_EN_MASK);
+	writel(val, i2s->base + CV1800B_CLK_CTRL0);
+
+	val = readl(i2s->base + CV1800B_I2S_RESET);
+	val = u32_replace_bits(val, 1, RST_I2S_RESET_RX_MASK);
+	val = u32_replace_bits(val, 1, RST_I2S_RESET_TX_MASK);
+	writel(val, i2s->base + CV1800B_I2S_RESET);
+
+	val = readl(i2s->base + CV1800B_FIFO_RESET);
+	val = u32_replace_bits(val, 1, FIFO_RX_RESET_MASK);
+	val = u32_replace_bits(val, 1, FIFO_TX_RESET_MASK);
+	writel(val, i2s->base + CV1800B_FIFO_RESET);
+}
+
+static void cv1800b_i2s_setup_tdm(struct cv1800b_i2s *i2s)
+{
+	u32 val;
+
+	val = readl(i2s->base + CV1800B_BLK_MODE_SETTING);
+	val = u32_replace_bits(val, 1, BLK_DMA_MODE_MASK);
+	writel(val, i2s->base + CV1800B_BLK_MODE_SETTING);
+
+	val = readl(i2s->base + CV1800B_CLK_CTRL0);
+	val = u32_replace_bits(val, 0, CLK_AUD_CLK_SEL_MASK);
+	val = u32_replace_bits(val, 0, CLK_MCLK_OUT_EN_MASK);
+	val = u32_replace_bits(val, 0, CLK_AUD_EN_MASK);
+	writel(val, i2s->base + CV1800B_CLK_CTRL0);
+
+	val = readl(i2s->base + CV1800B_FIFO_THRESHOLD);
+	val = u32_replace_bits(val, 4, FIFO_RX_THRESHOLD_MASK);
+	val = u32_replace_bits(val, 4, FIFO_TX_THRESHOLD_MASK);
+	val = u32_replace_bits(val, 4, FIFO_TX_HIGH_THRESHOLD_MASK);
+	writel(val, i2s->base + CV1800B_FIFO_THRESHOLD);
+
+	val = readl(i2s->base + CV1800B_I2S_ENABLE);
+	val = u32_replace_bits(val, 0, I2S_ENABLE_MASK);
+	writel(val, i2s->base + CV1800B_I2S_ENABLE);
+}
+
+static int cv1800b_i2s_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct cv1800b_i2s *i2s;
+	struct resource *res;
+	void __iomem *regs;
+	struct snd_soc_dai_driver *dai;
+	int ret;
+
+	i2s = devm_kzalloc(dev, sizeof(*i2s), GFP_KERNEL);
+	if (!i2s)
+		return -ENOMEM;
+
+	regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+	i2s->dev = &pdev->dev;
+	i2s->base = regs;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -ENODEV;
+	cv1800b_setup_dma_struct(i2s, res->start);
+
+	i2s->clk = devm_clk_get_enabled(dev, "i2s");
+	if (IS_ERR(i2s->clk))
+		return dev_err_probe(dev, PTR_ERR(i2s->clk),
+				     "failed to get+enable i2s\n");
+	i2s->sysclk = devm_clk_get_enabled(dev, "mclk");
+	if (IS_ERR(i2s->sysclk))
+		return dev_err_probe(dev, PTR_ERR(i2s->sysclk),
+				     "failed to get+enable mclk\n");
+
+	platform_set_drvdata(pdev, i2s);
+	cv1800b_i2s_setup_tdm(i2s);
+
+	dai = devm_kmemdup(dev, &cv1800b_i2s_dai_template, sizeof(*dai),
+			   GFP_KERNEL);
+	if (!dai)
+		return -ENOMEM;
+
+	ret = devm_snd_soc_register_component(dev, &cv1800b_i2s_component, dai,
+					      1);
+	if (ret)
+		return ret;
+
+	ret = devm_snd_dmaengine_pcm_register(dev, &cv1800b_i2s_pcm_config, 0);
+	if (ret) {
+		dev_err(dev, "dmaengine_pcm_register failed: %d\n", ret);
+		return ret;
+	}
+
+	dev_dbg(dev, "cv1800b I2S probed:\n");
+	return 0;
+}
+
+static void cv1800b_i2s_remove(struct platform_device *pdev)
+{
+	struct cv1800b_i2s *i2s = platform_get_drvdata(pdev);
+
+	if (!i2s)
+		return;
+	cv1800b_i2s_hw_disable(i2s);
+}
+
+static const struct of_device_id cv1800b_i2s_of_match[] = {
+	{ .compatible = "sophgo,cv1800b-i2s" },
+	{ /* sentinel */ }
+};
+
+MODULE_DEVICE_TABLE(of, cv1800b_i2s_of_match);
+
+static struct platform_driver cv1800b_i2s_driver = {
+	.probe = cv1800b_i2s_probe,
+	.remove = cv1800b_i2s_remove,
+	.driver = {
+		.name = "cv1800b-i2s",
+		.of_match_table = cv1800b_i2s_of_match,
+	},
+};
+module_platform_driver(cv1800b_i2s_driver);
+
+MODULE_DESCRIPTION("Sophgo cv1800b I2S/TDM driver");
+MODULE_AUTHOR("Anton D. Stavinsky <stavinsky@gmail.com>");
+MODULE_LICENSE("GPL");

-- 
2.43.0

