Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F54938A728
	for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 14:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775919495; cv=none; b=n0mOQRinR8v2A1a+o3j1TKKLiWVNisQJICxEu5dl8cXXPMZUUjT/Iqy1WDHQHmne3r2TLEG1C1XvO8/L1o3in/R22XokSZBQuZ62CapLbLzCFzuRNvVnsd5cz+YzHj24LJnZIo/hjzhakZndvzDJ1rf0OFVziRsvXBzyiYrRZCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775919495; c=relaxed/simple;
	bh=X76/n6h45y0nvLLm4b/LVVBOiI2A3dcRCIbR0u/wzRU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e5AZZtnF/X7+xkekjYQdDMd8TPCf/4kt2ySQDoxSsPrUBSwJ6LUYiPqI/4cPdvwp1w5bxOrWNsWHYT/jwKVUfGGU3pWkHwxlVdaTZWFhLWEXgJUCnuAx7z1lDPiQ94HjueRs7uidSR8VfiIB5/zBEDmw5pkKHs1qwbYrTXA+nJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=oI3K7H4A; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="oI3K7H4A"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488a041eae5so21103685e9.1
        for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 07:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775919488; x=1776524288; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2LRSj5mto7BT5HWwH0sE37ZxRDbLkILewmiwjWGOKCY=;
        b=oI3K7H4AhXOMP55IJvkCMK1NpTRK9tOjMwB3XJdB78q3WZuP/QJX2ftxSiAW0WT0Zk
         CKhZcTem4r8SgVUuq/sPo1FR8iaVHqgr8lLBv2/X5emtITdx2OStaE4IwxDrXYZHz6xt
         AdPHHXF3E9d3rm0gjOVvIDrpP2P+rsFVlaDk6RDmGjU4vZxK18h2VX6ek7Mj2gxNsOug
         fW3z52fIRWN0Zs2xLX1tsnDYijHZvSm9CDB8dorSh/yLHeydOjYwF803VsH/29jViKrr
         /4r51ALNhxzTKhmulps+fRVUum9jzmWfsOL3ljclQxiDmAXEpgdHHNFEuu2qN1lCzASr
         As0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775919488; x=1776524288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2LRSj5mto7BT5HWwH0sE37ZxRDbLkILewmiwjWGOKCY=;
        b=HmA1RxE7r/VGnycAl1/CRRs7FXFi3UVIubeoQlnEjmmAZ5QhfKIiG2tvwPdkljNqvT
         K92EZiyy4BifszxefawofDKFQNOp2YKLHPdWDKmPglolIASVJS8RbvKxGqHRvVe+RYAp
         +oOYkOaQNof2jA2nIqSGHwExM84/KRQbFR6NchPi5NE3UXWmehQkKLz9nUwEqZutuFCJ
         fllBjmFupP/wcA0PFxS7fVY5egr+8tRzuPw7EM4FKPSB+ssxMt7Y/Ly5AXLc1FD9oUxS
         qgdy7ohaDr53JTNqxKwhrB8hDXVeOJExuEGgZRDpIGUjScvJY6+mh/UXdAiWpPqSd9kn
         mgMg==
X-Forwarded-Encrypted: i=1; AJvYcCUB/ySQBoyeCn81P2mrQ56xOs2SRjbh2u692FmEkYWyXtpmOjkRgFIts2jKUKuL3G0krdM53Nh18kCu5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa1o4ruE7V78AIC95YCd0E3hIo+hvZi5K3lmblaZ7SLb5zLGAe
	wp+KKufF4yWarSYG+W0fokK+T3UOsPhCFSmqBebkuPp0ffdloZ1/FIO/7vuc02e17lQ=
X-Gm-Gg: AeBDietvEoXer//NLLtOCFrfoTWg35CbJn1E1gVH8pfON3WCW6omUhnSgkpyn/R1C11
	+qO6LvzbtcT1u+x3z2wbsJ6x6dClMfWjuw4FOr+e1m9JpB/SlqsBFFTjiPnmeGbq9IQ7j51fkoK
	Mv8+/wYtoP1U5c5CW2G+CVTBhBFptqhN8t/UhbsQugHBXpFs9Q1eLA8a0dhG6KAs/WkNTvEr9/g
	v7UxMHvkA4E3EpPuFCQDj238Hy/KL/jkrLXlgcoWB8m2jM0BEKGKtPSQr+B6EFOheQMlEvK58Dq
	ZUid2JTtAYtOkIJGNtoZNmNyuX1oTmtEt0e4TuiZmXfHgL8cy4kCDq4JOmm4Mr5GUajkhGvKZuy
	F0ETCcVDKJ8D41RJOuGzA61SDfRpJyTishIjnF0MeMxsyKJyIi+NP1ZhPyCqHGxSdJ9NszNcSPQ
	GKx5nQEWTK/9O4YidHxWzu
X-Received: by 2002:a05:600d:d:b0:488:d243:8da9 with SMTP id 5b1f17b1804b1-488d67b8cf3mr72270985e9.1.1775919487634;
        Sat, 11 Apr 2026 07:58:07 -0700 (PDT)
Received: from [127.0.1.1] ([151.61.248.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5dc7070sm48882375e9.10.2026.04.11.07.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 07:58:07 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Sat, 11 Apr 2026 16:57:32 +0200
Subject: [PATCH RFC v2 07/11] ASoC: meson: gx: add AUDIN FIFO driver
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-audin-rfc-v2-7-4c8a6ec5fcab@baylibre.com>
References: <20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com>
In-Reply-To: <20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Valerio Setti <vsetti@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=16268; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=X76/n6h45y0nvLLm4b/LVVBOiI2A3dcRCIbR0u/wzRU=;
 b=owGbwMvMwCF2z3ty7kUrRgbG02pJDJm3Ekv8ZwdcrxF4zCP2TGOj6rFD9V5bl4R3SDcsbMzv3
 lvzUXpdRykLgxgHg6yYIgvL9Hu/C0rVHhonnCyAmcPKBDKEgYtTACZSXMTI0KfAzqB1hfWvFdNC
 1o826yPW9Uy5k6YjHripaXaA9Wa3ckaGaVumuE8+eODHpGrexyLLws76PdhwomKS6v5XkepSAc4
 zOAE=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

Add support for the frontend DAI of the capture interface which is in
charge of receiving decoded data from "audin-decoder-i2s" and move them to
an internal FIFO before they are block-transferring to RAM.

This component could ideally handle multiple input sources (SPDIF, I2S,
PCM, HDMI), but for the time being only I2S is added and has been tested.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/Kconfig      |   9 +
 sound/soc/meson/Makefile     |   2 +
 sound/soc/meson/audin-fifo.c | 432 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 443 insertions(+)

diff --git a/sound/soc/meson/Kconfig b/sound/soc/meson/Kconfig
index 0a1d166bed3477efdaffa8538150f7aca33a29e6..50307e54f96fda0f9c114c3bff6aae4094018934 100644
--- a/sound/soc/meson/Kconfig
+++ b/sound/soc/meson/Kconfig
@@ -19,6 +19,14 @@ config SND_MESON_GX_AUDIN_DECODER_I2S
 	  Select Y or M to add support for the I2S audio input decoder found
 	  in the Amlogic GX SoC family
 
+config SND_MESON_GX_AUDIN_FIFO
+	tristate "Amlogic GX AUDIN FIFO"
+	select REGMAP_MMIO
+	imply SND_MESON_AIU
+	help
+	  Select Y or M to add support for the frontend capture interfaces
+	  embedded in the Amlogic GX SoC family
+
 config SND_MESON_AXG_FIFO
 	tristate
 	select REGMAP_MMIO
@@ -116,6 +124,7 @@ config SND_MESON_GX_SOUND_CARD
 	select SND_MESON_CARD_UTILS
 	imply SND_MESON_AIU
 	imply SND_MESON_GX_AUDIN_DECODER_I2S
+	imply SND_MESON_GX_AUDIN_FIFO
 	help
 	  Select Y or M to add support for the GXBB/GXL SoC sound card
 
diff --git a/sound/soc/meson/Makefile b/sound/soc/meson/Makefile
index a5a8e5b5a3bb8ca8ca0f27e1a29865e0dab64b73..085ddcdc87639d5d79aa39152eafc030f2643e2e 100644
--- a/sound/soc/meson/Makefile
+++ b/sound/soc/meson/Makefile
@@ -11,6 +11,7 @@ snd-soc-meson-aiu-y += aiu-fifo.o
 snd-soc-meson-aiu-y += aiu-fifo-i2s.o
 snd-soc-meson-aiu-y += aiu-fifo-spdif.o
 snd-soc-meson-gx-audin-decoder-i2s-y := audin-decoder-i2s.o
+snd-soc-meson-gx-audin-fifo-y := audin-fifo.o
 snd-soc-meson-axg-fifo-y := axg-fifo.o
 snd-soc-meson-axg-frddr-y := axg-frddr.o
 snd-soc-meson-axg-toddr-y := axg-toddr.o
@@ -31,6 +32,7 @@ snd-soc-meson-t9015-y := t9015.o
 
 obj-$(CONFIG_SND_MESON_AIU) += snd-soc-meson-aiu.o
 obj-$(CONFIG_SND_MESON_GX_AUDIN_DECODER_I2S) += snd-soc-meson-gx-audin-decoder-i2s.o
+obj-$(CONFIG_SND_MESON_GX_AUDIN_FIFO) += snd-soc-meson-gx-audin-fifo.o
 obj-$(CONFIG_SND_MESON_AXG_FIFO) += snd-soc-meson-axg-fifo.o
 obj-$(CONFIG_SND_MESON_AXG_FRDDR) += snd-soc-meson-axg-frddr.o
 obj-$(CONFIG_SND_MESON_AXG_TODDR) += snd-soc-meson-axg-toddr.o
diff --git a/sound/soc/meson/audin-fifo.c b/sound/soc/meson/audin-fifo.c
new file mode 100644
index 0000000000000000000000000000000000000000..62f0b03cdfc33056e3be7aaf7333ab71086a9c25
--- /dev/null
+++ b/sound/soc/meson/audin-fifo.c
@@ -0,0 +1,432 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (c) 2026 BayLibre, SAS.
+// Author: Valerio Setti <vsetti@baylibre.com>
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <sound/pcm_params.h>
+#include <linux/dma-mapping.h>
+#include <linux/hrtimer.h>
+#include <sound/soc.h>
+#include <sound/soc-dai.h>
+
+/* FIFO registers */
+#define AUDIN_FIFO_START	0x00
+#define AUDIN_FIFO_END		0x04
+#define AUDIN_FIFO_PTR		0x08
+
+/* FIFOx CTRL registers and bits */
+#define AUDIN_FIFO_CTRL			0x14
+#define  AUDIN_FIFO_CTRL_EN		BIT(0)
+#define  AUDIN_FIFO_CTRL_RST		BIT(1)
+#define  AUDIN_FIFO_CTRL_LOAD		BIT(2)
+#define  AUDIN_FIFO_CTRL_DIN_SEL_OFF	3
+#define  AUDIN_FIFO_CTRL_DIN_SEL_MASK	GENMASK(5, 3)
+#define  AUDIN_FIFO_CTRL_ENDIAN_MASK	GENMASK(10, 8)
+#define  AUDIN_FIFO_CTRL_CHAN_MASK	GENMASK(14, 11)
+#define  AUDIN_FIFO_CTRL_UG		BIT(15)
+
+/* FIFOx_CTRL1 registers and bits */
+#define AUDIN_FIFO_CTRL1			0x18
+#define  AUDIN_FIFO_CTRL1_DIN_POS_2		BIT(7)
+#define  AUDIN_FIFO_CTRL1_DIN_BYTE_NUM_MASK	GENMASK(3, 2)
+#define  AUDIN_FIFO_CTRL1_DIN_POS_01_MASK	GENMASK(1, 0)
+
+/* This is the size of the FIFO (i.e. 64*64 bytes). */
+#define AUDIN_FIFO_I2S_BLOCK		4096
+
+static const struct snd_pcm_hardware audin_fifo_pcm_hw = {
+	.info = (SNDRV_PCM_INFO_INTERLEAVED |
+		 SNDRV_PCM_INFO_MMAP |
+		 SNDRV_PCM_INFO_MMAP_VALID |
+		 SNDRV_PCM_INFO_PAUSE),
+	.formats = SNDRV_PCM_FMTBIT_S16_LE,
+	.rate_min = 5512,
+	.rate_max = 192000,
+	.channels_min = 2,
+	.channels_max = 2,
+	.period_bytes_min = 2 * AUDIN_FIFO_I2S_BLOCK,
+	.period_bytes_max = AUDIN_FIFO_I2S_BLOCK * USHRT_MAX,
+	.periods_min = 2,
+	.periods_max = UINT_MAX,
+
+	/* No real justification for this */
+	.buffer_bytes_max = 1 * 1024 * 1024,
+};
+
+struct audin_fifo_drvdata {
+	struct clk *input_clk;
+};
+
+struct audin_fifo_dai_data {
+	/*
+	 * The AUDIN peripheral has an IRQ to signal when data is received, but
+	 * it cannot grant a periodic behavior. The reason is that the register
+	 * which holds the address which triggers the IRQ must be updated
+	 * continuously. This create a risk of overflow if for any reason the
+	 * ISR execution is delayed. Using a periodic time is therefore simpler
+	 * and more reliable.
+	 */
+	struct hrtimer polling_timer;
+	ktime_t poll_time_ns;
+	struct snd_pcm_substream *substream;
+};
+
+static int audin_fifo_dai_trigger(struct snd_pcm_substream *substream, int cmd,
+				  struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	(void) dai;
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		snd_soc_component_update_bits(component, AUDIN_FIFO_CTRL,
+					      AUDIN_FIFO_CTRL_EN,
+					      AUDIN_FIFO_CTRL_EN);
+		break;
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+	case SNDRV_PCM_TRIGGER_STOP:
+		snd_soc_component_update_bits(component, AUDIN_FIFO_CTRL,
+					      AUDIN_FIFO_CTRL_EN, 0);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int audin_fifo_dai_prepare(struct snd_pcm_substream *substream,
+			     struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	dma_addr_t dma_end = runtime->dma_addr + runtime->dma_bytes - 8;
+	unsigned int val;
+
+	/* Setup memory boundaries */
+	snd_soc_component_write(component, AUDIN_FIFO_START, runtime->dma_addr);
+	snd_soc_component_write(component, AUDIN_FIFO_PTR, runtime->dma_addr);
+	snd_soc_component_write(component, AUDIN_FIFO_END, dma_end);
+
+	/* Load new addresses */
+	val = AUDIN_FIFO_CTRL_LOAD | AUDIN_FIFO_CTRL_UG;
+	snd_soc_component_update_bits(component, AUDIN_FIFO_CTRL, val, val);
+
+	/* Reset */
+	snd_soc_component_update_bits(dai->component, AUDIN_FIFO_CTRL,
+				      AUDIN_FIFO_CTRL_RST,
+				      AUDIN_FIFO_CTRL_RST);
+
+	return 0;
+}
+
+static int audin_fifo_dai_hw_params(struct snd_pcm_substream *substream,
+				    struct snd_pcm_hw_params *params,
+				    struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct audin_fifo_dai_data *data = snd_soc_dai_dma_data_get_capture(dai);
+	unsigned int val;
+
+	if (params_width(params) != 16) {
+		dev_err(dai->dev, "Unsupported width %u\n",
+			params_physical_width(params));
+		return -EINVAL;
+	}
+
+	/*
+	 * FIFO is filled line by line and each of them is 8 bytes. The
+	 * problem is that each line is filled starting from the end,
+	 * so we need to properly reorder them before moving to the
+	 * RAM. This is the value required to properly re-order samples stored
+	 * in 16 bit format.
+	 */
+	val = FIELD_PREP(AUDIN_FIFO_CTRL_ENDIAN_MASK, 6);
+	snd_soc_component_update_bits(component, AUDIN_FIFO_CTRL,
+				      AUDIN_FIFO_CTRL_ENDIAN_MASK, val);
+
+	/*
+	 * The I2S input decoder passed 24 bits of left-justified data
+	 * but for the time being we only 16 bit formatted samples which means
+	 * that we drop the LSB.
+	 */
+	val = FIELD_PREP(AUDIN_FIFO_CTRL1_DIN_POS_01_MASK, 1);
+	snd_soc_component_update_bits(component, AUDIN_FIFO_CTRL1,
+				      AUDIN_FIFO_CTRL1_DIN_POS_01_MASK,
+				      val);
+
+	/* Set sample size to 2 bytes (16 bit) */
+	val = FIELD_PREP(AUDIN_FIFO_CTRL1_DIN_BYTE_NUM_MASK, 1);
+	snd_soc_component_update_bits(component, AUDIN_FIFO_CTRL1,
+				      AUDIN_FIFO_CTRL1_DIN_BYTE_NUM_MASK,
+				      val);
+
+	/*
+	 * This is a bit counterintuitive. Even though the platform has a single
+	 * pin for I2S input which would mean that we can only support 2
+	 * channels, doing so would cause samples to be stored in a weird way
+	 * into the FIFO: all the samples from the 1st channel on the 1st half
+	 * of the FIFO, then samples from the 2nd channel in the other half. Of
+	 * course extra work would be required to properly interleave them
+	 * before returning to the userspace.
+	 * Setting a single channel mode instead solves the problem: samples
+	 * from 1st and 2nd channel are stored interleaved and sequentially in
+	 * the FIFO.
+	 */
+	val = FIELD_PREP(AUDIN_FIFO_CTRL_CHAN_MASK, 1);
+	snd_soc_component_update_bits(component, AUDIN_FIFO_CTRL,
+				      AUDIN_FIFO_CTRL_CHAN_MASK, val);
+
+	/* Setup the period for the polling timer and start it. */
+	data->poll_time_ns = NSEC_PER_SEC * params_period_size(params) /
+			     params_rate(params);
+
+	hrtimer_start(&data->polling_timer, data->poll_time_ns,
+		      HRTIMER_MODE_REL);
+
+	return 0;
+}
+
+static int audin_fifo_dai_hw_free(struct snd_pcm_substream *substream,
+				  struct snd_soc_dai *dai)
+{
+	struct audin_fifo_dai_data *data = snd_soc_dai_dma_data_get_capture(dai);
+	(void) substream;
+
+	hrtimer_cancel(&data->polling_timer);
+
+	return 0;
+}
+
+static int audin_fifo_dai_startup(struct snd_pcm_substream *substream,
+				  struct snd_soc_dai *dai)
+{
+	struct audin_fifo_dai_data *data = snd_soc_dai_dma_data_get_capture(dai);
+	int ret;
+
+	snd_soc_set_runtime_hwparams(substream, &audin_fifo_pcm_hw);
+
+	ret = snd_pcm_hw_constraint_step(substream->runtime, 0,
+					 SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
+					 AUDIN_FIFO_I2S_BLOCK);
+	if (ret) {
+		dev_err(dai->dev, "Failed to set runtime constraint %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_pcm_hw_constraint_step(substream->runtime, 0,
+					 SNDRV_PCM_HW_PARAM_PERIOD_BYTES,
+					 AUDIN_FIFO_I2S_BLOCK);
+	if (ret) {
+		dev_err(dai->dev, "Failed to set runtime constraint %d\n", ret);
+		return ret;
+	}
+
+	data->substream = substream;
+
+	return ret;
+}
+
+static int audin_fifo_dai_pcm_new(struct snd_soc_pcm_runtime *rtd,
+			     struct snd_soc_dai *dai)
+{
+	int ret;
+
+	ret = dma_coerce_mask_and_coherent(dai->dev, DMA_BIT_MASK(32));
+	if (ret) {
+		dev_err(dai->dev, "Failed to set DMA mask %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_pcm_set_managed_buffer_all(rtd->pcm, SNDRV_DMA_TYPE_DEV,
+					     dai->dev,
+					     audin_fifo_pcm_hw.buffer_bytes_max,
+					     audin_fifo_pcm_hw.buffer_bytes_max);
+	if (ret) {
+		dev_err(dai->dev, "Failed to set PCM managed buffer %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static enum hrtimer_restart dai_timer_cb(struct hrtimer *timer)
+{
+	struct audin_fifo_dai_data *data =
+		container_of(timer, struct audin_fifo_dai_data, polling_timer);
+	snd_pcm_period_elapsed(data->substream);
+	hrtimer_forward_now(timer, data->poll_time_ns);
+	return HRTIMER_RESTART;
+}
+
+static int audin_fifo_dai_probe(struct snd_soc_dai *dai)
+{
+	struct audin_fifo_dai_data *data;
+
+	data = kzalloc(sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	hrtimer_setup(&data->polling_timer, dai_timer_cb, CLOCK_MONOTONIC,
+		      HRTIMER_MODE_REL);
+
+	snd_soc_dai_dma_data_set_capture(dai, data);
+
+	return 0;
+}
+
+static int audin_fifo_dai_remove(struct snd_soc_dai *dai)
+{
+	kfree(snd_soc_dai_dma_data_get_capture(dai));
+
+	return 0;
+}
+
+const struct snd_soc_dai_ops audin_fifo_dai_ops = {
+	.trigger	= audin_fifo_dai_trigger,
+	.prepare	= audin_fifo_dai_prepare,
+	.hw_params	= audin_fifo_dai_hw_params,
+	.hw_free	= audin_fifo_dai_hw_free,
+	.startup	= audin_fifo_dai_startup,
+	.pcm_new	= audin_fifo_dai_pcm_new,
+	.probe		= audin_fifo_dai_probe,
+	.remove		= audin_fifo_dai_remove,
+};
+
+static struct snd_soc_dai_driver audin_fifo_dai_drv[] = {
+	{
+		.name = "FIFO",
+		.capture = {
+			.stream_name	= "Capture",
+			.channels_min	= 2,
+			.channels_max	= 2,
+			.rates		= SNDRV_PCM_RATE_CONTINUOUS,
+			.rate_min	= 5512,
+			.rate_max	= 192000,
+			.formats	= SNDRV_PCM_FMTBIT_S16_LE,
+		},
+		.ops = &audin_fifo_dai_ops,
+	},
+};
+
+static snd_pcm_uframes_t
+audin_fifo_component_pointer(struct snd_soc_component *component,
+			     struct snd_pcm_substream *substream)
+{
+	unsigned int start, ptr;
+
+	start = snd_soc_component_read(component, AUDIN_FIFO_START);
+	ptr = snd_soc_component_read(component, AUDIN_FIFO_PTR);
+
+	return bytes_to_frames(substream->runtime, ptr - start);
+}
+
+static const char * const audin_fifo_fifo_input_sel_texts[] = {
+	"SPDIF", "I2S", "PCM", "HDMI", "Demodulator"
+};
+
+static SOC_ENUM_SINGLE_DECL(audin_fifo_input_sel_enum, AUDIN_FIFO_CTRL,
+			    AUDIN_FIFO_CTRL_DIN_SEL_OFF,
+			    audin_fifo_fifo_input_sel_texts);
+
+static const struct snd_kcontrol_new audin_fifo_input_sel_mux =
+	SOC_DAPM_ENUM("SRC SEL", audin_fifo_input_sel_enum);
+
+static const struct snd_soc_dapm_widget audin_fifo_dapm_widgets[] = {
+	SND_SOC_DAPM_AIF_IN("I2S IN", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_MUX("SRC SEL", SND_SOC_NOPM, 0, 0,
+			 &audin_fifo_input_sel_mux),
+};
+
+static const struct snd_soc_dapm_route audin_fifo_dapm_routes[] = {
+	{ "SRC SEL", "I2S", "I2S IN" },
+	{ "Capture", NULL, "SRC SEL" },
+};
+
+static const struct snd_soc_component_driver audin_fifo_component = {
+	.dapm_widgets		= audin_fifo_dapm_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(audin_fifo_dapm_widgets),
+	.dapm_routes		= audin_fifo_dapm_routes,
+	.num_dapm_routes	= ARRAY_SIZE(audin_fifo_dapm_routes),
+	.pointer		= audin_fifo_component_pointer,
+};
+
+static const struct regmap_config audin_fifo_regmap_cfg = {
+	.reg_bits	= 32,
+	.val_bits	= 32,
+	.reg_stride	= 4,
+	.max_register	= 0x1b,
+};
+
+static int audin_fifo_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	void __iomem *regs;
+	struct regmap *map;
+	struct audin_fifo_drvdata *data;
+	int ret;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (data == NULL)
+		return -ENOMEM;
+	platform_set_drvdata(pdev, data);
+
+	regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
+	map = devm_regmap_init_mmio(dev, regs, &audin_fifo_regmap_cfg);
+	if (IS_ERR(map)) {
+		dev_err(dev, "Failed to init regmap: %ld\n", PTR_ERR(map));
+		return PTR_ERR(map);
+	}
+
+	data->input_clk = devm_clk_get_enabled(dev, "i2s_input_clk");
+	if (IS_ERR(data->input_clk)) {
+		dev_err(dev, "can't get the i2s input clock\n");
+		return PTR_ERR(data->input_clk);
+	}
+
+	ret = snd_soc_register_component(dev, &audin_fifo_component,
+					 audin_fifo_dai_drv,
+					 ARRAY_SIZE(audin_fifo_dai_drv));
+	if (ret) {
+		dev_err(dev, "failed to register component\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static void audin_fifo_remove(struct platform_device *pdev)
+{
+	struct audin_fifo_drvdata *data = platform_get_drvdata(pdev);
+
+	clk_disable_unprepare(data->input_clk);
+	snd_soc_unregister_component(&pdev->dev);
+}
+
+static const struct of_device_id audin_fifo_of_match[] = {
+	{ .compatible = "amlogic,meson-gxbb-audin-fifo", .data = NULL },
+	{}
+};
+MODULE_DEVICE_TABLE(of, audin_fifo_of_match);
+
+static struct platform_driver audin_fifo_pdrv = {
+	.probe = audin_fifo_probe,
+	.remove = audin_fifo_remove,
+	.driver = {
+		.name = "meson-gx-audin-fifo",
+		.of_match_table = audin_fifo_of_match,
+	},
+};
+module_platform_driver(audin_fifo_pdrv);
+
+MODULE_DESCRIPTION("Meson AUDIN FIFO Driver");
+MODULE_AUTHOR("Valerio Setti <vsetti@baylibre.com>");
+MODULE_LICENSE("GPL");

-- 
2.39.5

