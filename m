Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B73389E17
	for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 14:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775919493; cv=none; b=iesTzPu0xGjLZZpZjNEm9Zz95Q6sp1nUNOgcBef97IspXUCkxqslLvyT8N/gw9bCQRPzpASBCXnREQL+4mxh3tFrtq2wHe7CRXyKQFXANvELx0sf1I1BSCXuRdmVCBCZ2x8CSam9R/G1j0OQq0JZT0WYIaYj60ErsvGss+LLSgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775919493; c=relaxed/simple;
	bh=MjrJtEP6/3DL+dz7MWVYq7fJbah22ZrD+trVWvL43Co=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GuIJx8veznW7SUBHtXFZ6PP2zn8OJUbKZLh/FCMcvOn4vEti533xvNJTThLH4ss/fLrwc01q6DRJaQWwSPJ1Mhnou6ycGi41pZZHrybb7j4yywJW/OYgmpiQuHX24VIN2hYXFxEfb7u0MObHaHoQYij/WaB/wUztjP7NmfmesCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=sYWGjqmg; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="sYWGjqmg"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488ad135063so28524355e9.0
        for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 07:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775919486; x=1776524286; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L1fvr9X2u9Mv2M4hYwLbnMDv2qJWnbRmtU9EIkDyPQg=;
        b=sYWGjqmgr0eeWsuKdAP/+DXK/MRfJmBnJmF1V6hKz0Rq/IL8I7X99zOCYcahgbRrlL
         WQ/+cocciQSjWQYxqpNlHxxOfdRK9L7a5yg8IBpNGMb/o5hLBW70d24/pHvDw21+/kA3
         5eH4ivfOh7dKjWKCDsp12FWdeModVXpC7YGqcGZ4In+zPAyI4Iyw7gsFZzpPyjQ6oSAn
         MhpQidPGeMbHNhQz4wORbyr5vfOVIQKpbyq8h2Thcl2xLbM6kYuWT1kMQAvw1Tu00/aC
         2WUKYR1/jfjMcJ64XcTflARSiq2X7bB99h1SWY+7Hxd0xTA3YW817uxmx1ICYetHh41A
         hUaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775919486; x=1776524286;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L1fvr9X2u9Mv2M4hYwLbnMDv2qJWnbRmtU9EIkDyPQg=;
        b=OXmpJAsNwVdLutmn5PWhmViuGdBic1A6Rip6lxewG1tck+26I0cY5UqZQ8Ws63EktQ
         ohYVJxYlLIfKVY6Y1erUoK4qXEETglU/8rW7VvJnVYvCgCd5NfgSaU4F4vTXqMZZW2Ml
         iT41hzCfslSJ3yhBwfzjEadAC//k7wRQr9RakXF1d9v0i+z+C+AZoQY4AJ5AHMV1u8O3
         Tu0W+eWb3xPJPPFNLovUXW6tAfhrBGZ8sjrDUyaeMLnhjG+hgrnsAWLqpwpkHBKNpxzx
         ZfJ2wjeiSGlJu8oX6vCeGD6w7E9959JN60W1AjzynIffwphS+y3bh5OC4eYlmMxAfIJx
         F+/g==
X-Forwarded-Encrypted: i=1; AJvYcCUFJJdRoyoTz5Eu8pir847uQyJSK1YuK4wA94mbC8vs1DrzJpDK6VdvJqwMJGYGS3VWS6OqmKAJkISJaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkJaw/7t9ttb5FRMKmLySAYdcnl34gB5UWP+UKviopbwrJvkKs
	KfSU2VjJdYdRAMsU1aHOnXndbDN02c/6MLYo4eVZdDD5AlEnjDumV26Gw+AFEq4iOTU=
X-Gm-Gg: AeBDievbVk3zTgZnX4mGCVbgzfeLKOywHZx2AMdrpIVEVwDZ2/IsttGpcg6YjTJPBdi
	OFC01CJUEmabYBX/SXkMGMckr2nk5bX3B1qgILVVrBwHIPFGcf3T8zNzs1mFrWB7+Jp0SRdp9tg
	n58i2FOO6PtFBFilcxs6Eiot+dJm4YYDIu/0QDGIqFIzliq9eOINH9wqYkcdlXv9U6REdDNlj9L
	PyG3Qon8SGb97I24ngTgtdEAiB1c8Q03GS1u2oaQraJ7/zpn/MTqVJEKQMWbHc/Xoj6jgmlzCZr
	XivHYYDcPOo8M50MtFC2RfTtJh2YAgBBwgbqtu2nKtRrYGjlcj1Y7KiEuYgstKtZIit+x6/dVaL
	iqcZX5DvccOvA0NKe1oTfILXxKbVnT/S5Col+lhfFl4suZGYOQxLCWezJegxRu1NvpHaxVlmT2q
	U2B+nPQ9MBBUVIV0/WVGEz
X-Received: by 2002:a05:600c:c0da:b0:488:b043:5efd with SMTP id 5b1f17b1804b1-488d682628dmr85823445e9.13.1775919486295;
        Sat, 11 Apr 2026 07:58:06 -0700 (PDT)
Received: from [127.0.1.1] ([151.61.248.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5dc7070sm48882375e9.10.2026.04.11.07.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 07:58:05 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Sat, 11 Apr 2026 16:57:31 +0200
Subject: [PATCH RFC v2 06/11] ASoC: meson: gx: add AUDIN I2S Decoder driver
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-audin-rfc-v2-6-4c8a6ec5fcab@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9369; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=MjrJtEP6/3DL+dz7MWVYq7fJbah22ZrD+trVWvL43Co=;
 b=owGbwMvMwCF2z3ty7kUrRgbG02pJDJm3Ekv+ntqdWaQ+10C8dvcUx1hFLu2v4TLv+jrFyw3v/
 M8v6inoKGVhEONgkBVTZGGZfu93QanaQ+OEkwUwc1iZQIYwcHEKwETqTBkZPoTynek+Wx0q8bLY
 Lt4zpX5dsW7+Zrm0BT8U9rVWJH2fyvC/dPXmy1PqXP0OJ4n7XwzZ2P1oepny9fR1/Uf/Fyxs9eV
 mBAA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

This driver takes care of formatting I2S data being captured from the I2S
interface. Differently from aiu-formatter-i2s this driver implements
all the functionalities of a gx_formatter and it fully follows the design
proposed in the AXG platform (see axg-tdmin).

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/Kconfig             |   8 ++
 sound/soc/meson/Makefile            |   2 +
 sound/soc/meson/audin-decoder-i2s.c | 218 ++++++++++++++++++++++++++++++++++++
 3 files changed, 228 insertions(+)

diff --git a/sound/soc/meson/Kconfig b/sound/soc/meson/Kconfig
index d9a730994a2a2ad315a576981555203b379a212e..0a1d166bed3477efdaffa8538150f7aca33a29e6 100644
--- a/sound/soc/meson/Kconfig
+++ b/sound/soc/meson/Kconfig
@@ -12,6 +12,13 @@ config SND_MESON_AIU
 	  Select Y or M to add support for the Audio output subsystem found
 	  in the Amlogic Meson8, Meson8b and GX SoC families
 
+config SND_MESON_GX_AUDIN_DECODER_I2S
+	tristate "Amlogic GX AUDIN I2S Decoder"
+	imply SND_MESON_AIU
+	help
+	  Select Y or M to add support for the I2S audio input decoder found
+	  in the Amlogic GX SoC family
+
 config SND_MESON_AXG_FIFO
 	tristate
 	select REGMAP_MMIO
@@ -108,6 +115,7 @@ config SND_MESON_GX_SOUND_CARD
 	tristate "Amlogic GX Sound Card Support"
 	select SND_MESON_CARD_UTILS
 	imply SND_MESON_AIU
+	imply SND_MESON_GX_AUDIN_DECODER_I2S
 	help
 	  Select Y or M to add support for the GXBB/GXL SoC sound card
 
diff --git a/sound/soc/meson/Makefile b/sound/soc/meson/Makefile
index f9ec0ebb01f048728b8f85fd8e58fb90df990470..a5a8e5b5a3bb8ca8ca0f27e1a29865e0dab64b73 100644
--- a/sound/soc/meson/Makefile
+++ b/sound/soc/meson/Makefile
@@ -10,6 +10,7 @@ snd-soc-meson-aiu-y += aiu-encoder-spdif.o
 snd-soc-meson-aiu-y += aiu-fifo.o
 snd-soc-meson-aiu-y += aiu-fifo-i2s.o
 snd-soc-meson-aiu-y += aiu-fifo-spdif.o
+snd-soc-meson-gx-audin-decoder-i2s-y := audin-decoder-i2s.o
 snd-soc-meson-axg-fifo-y := axg-fifo.o
 snd-soc-meson-axg-frddr-y := axg-frddr.o
 snd-soc-meson-axg-toddr-y := axg-toddr.o
@@ -29,6 +30,7 @@ snd-soc-meson-g12a-tohdmitx-y := g12a-tohdmitx.o
 snd-soc-meson-t9015-y := t9015.o
 
 obj-$(CONFIG_SND_MESON_AIU) += snd-soc-meson-aiu.o
+obj-$(CONFIG_SND_MESON_GX_AUDIN_DECODER_I2S) += snd-soc-meson-gx-audin-decoder-i2s.o
 obj-$(CONFIG_SND_MESON_AXG_FIFO) += snd-soc-meson-axg-fifo.o
 obj-$(CONFIG_SND_MESON_AXG_FRDDR) += snd-soc-meson-axg-frddr.o
 obj-$(CONFIG_SND_MESON_AXG_TODDR) += snd-soc-meson-axg-toddr.o
diff --git a/sound/soc/meson/audin-decoder-i2s.c b/sound/soc/meson/audin-decoder-i2s.c
new file mode 100644
index 0000000000000000000000000000000000000000..4d8ba81ce321bd9bbb7fdee57ccf320e61b81fa2
--- /dev/null
+++ b/sound/soc/meson/audin-decoder-i2s.c
@@ -0,0 +1,218 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (c) 2026 BayLibre, SAS.
+// Author: Valerio Setti <vsetti@baylibre.com>
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/soc-dai.h>
+
+#include "gx-formatter.h"
+
+/* I2SIN_CTRL register and bits */
+#define AUDIN_I2SIN_CTRL			0x0
+#define  AUDIN_I2SIN_CTRL_I2SIN_DIR		BIT(0)
+#define  AUDIN_I2SIN_CTRL_I2SIN_CLK_SEL		BIT(1)
+#define  AUDIN_I2SIN_CTRL_I2SIN_LRCLK_SEL	BIT(2)
+#define  AUDIN_I2SIN_CTRL_I2SIN_POS_SYNC	BIT(3)
+#define  AUDIN_I2SIN_CTRL_I2SIN_LRCLK_SKEW_MASK	GENMASK(6, 4)
+#define  AUDIN_I2SIN_CTRL_I2SIN_LRCLK_INV	BIT(7)
+#define  AUDIN_I2SIN_CTRL_I2SIN_SIZE_MASK	GENMASK(9, 8)
+#define  AUDIN_I2SIN_CTRL_I2SIN_CHAN_EN_MASK	GENMASK(13, 10)
+#define  AUDIN_I2SIN_CTRL_I2SIN_EN		BIT(15)
+
+static struct snd_soc_dai *
+audin_decoder_i2s_get_be(struct snd_soc_dapm_widget *w)
+{
+	struct snd_soc_dapm_path *p;
+	struct snd_soc_dai *be;
+
+	snd_soc_dapm_widget_for_each_source_path(w, p) {
+		if (!p->connect)
+			continue;
+
+		if (p->source->id == snd_soc_dapm_dai_out)
+			return (struct snd_soc_dai *)p->source->priv;
+
+		be = audin_decoder_i2s_get_be(p->source);
+		if (be)
+			return be;
+	}
+
+	return NULL;
+}
+
+static struct gx_stream *
+audin_decoder_i2s_get_stream(struct snd_soc_dapm_widget *w)
+{
+	struct snd_soc_dai *be = audin_decoder_i2s_get_be(w);
+
+	if (!be)
+		return NULL;
+
+	return snd_soc_dai_dma_data_get_capture(be);
+}
+
+static void audin_decoder_i2s_enable(struct regmap *map)
+{
+	regmap_update_bits(map, AUDIN_I2SIN_CTRL,
+			   AUDIN_I2SIN_CTRL_I2SIN_EN,
+			   AUDIN_I2SIN_CTRL_I2SIN_EN);
+}
+
+static void audin_decoder_i2s_disable(struct regmap *map)
+{
+	regmap_update_bits(map, AUDIN_I2SIN_CTRL,
+			   AUDIN_I2SIN_CTRL_I2SIN_EN, 0);
+}
+
+static int audin_decoder_i2s_prepare(struct regmap *map,
+				   const struct gx_formatter_hw *quirks,
+				   struct gx_stream *ts)
+{
+	unsigned int val;
+	int ret;
+
+	if (ts->width != 16)
+		return -EINVAL;
+
+	if (ts->channels != 2)
+		return -EINVAL;
+
+	/*
+	 * I2S decoder always outputs 24bits to the FIFO according to the
+	 * manual. The only thing we can do is mask some bits as follows:
+	 * - 0: 16 bit
+	 * - 1: 18 bits (not exposed as supported format)
+	 * - 2: 20 bits (not exposed as supported format)
+	 * - 3: 24 bits
+	 *
+	 * At the moment only 16 bit format is supported, but we force 24 bit
+	 * anyway here to ease the future support of 24 bit format. Extra bits
+	 * will be filtered out at FIFO stage.
+	 * Note: data is left-justified, so in case of 16 bits samples, this
+	 *       means that the LSB is to be discarded at FIFO level and the
+	 *       relevant part is in bits [23:8].
+	 */
+	val = FIELD_PREP(AUDIN_I2SIN_CTRL_I2SIN_SIZE_MASK, 3);
+	ret = regmap_update_bits(map, AUDIN_I2SIN_CTRL,
+				 AUDIN_I2SIN_CTRL_I2SIN_SIZE_MASK, val);
+	if (ret)
+		return ret;
+
+	/*
+	 * The manual claims that this platform supports up to 4 streams
+	 * (8 channels), but the SOC only has 1 input pin (i.e. it only allows
+	 * for 1 stream and 2 channels) so this is what we support here.
+	 */
+	val = FIELD_PREP(AUDIN_I2SIN_CTRL_I2SIN_CHAN_EN_MASK, 1);
+	ret = regmap_update_bits(map, AUDIN_I2SIN_CTRL,
+				 AUDIN_I2SIN_CTRL_I2SIN_CHAN_EN_MASK, val);
+	if (ret)
+		return ret;
+
+	/*
+	 * Use clocks from AIU and not from the pads since we only want to
+	 * support master mode.
+	 */
+	val = AUDIN_I2SIN_CTRL_I2SIN_CLK_SEL |
+	      AUDIN_I2SIN_CTRL_I2SIN_LRCLK_SEL |
+	      AUDIN_I2SIN_CTRL_I2SIN_DIR;
+	ret = regmap_update_bits(map, AUDIN_I2SIN_CTRL, val, val);
+	if (ret)
+		return ret;
+
+	switch (ts->iface->fmt & SND_SOC_DAIFMT_INV_MASK) {
+	case SND_SOC_DAIFMT_IB_NF:
+		val = AUDIN_I2SIN_CTRL_I2SIN_POS_SYNC;
+		break;
+	case SND_SOC_DAIFMT_NB_NF:
+		val = 0;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	ret = regmap_update_bits(map, AUDIN_I2SIN_CTRL,
+				 AUDIN_I2SIN_CTRL_I2SIN_POS_SYNC, val);
+	if (ret)
+		return ret;
+
+	/*
+	 * MSB data starts 1 clock cycle after LRCLK transition, as per I2S
+	 * specs.
+	 */
+	val = FIELD_PREP(AUDIN_I2SIN_CTRL_I2SIN_LRCLK_SKEW_MASK, 1);
+	ret = regmap_update_bits(map, AUDIN_I2SIN_CTRL,
+				 AUDIN_I2SIN_CTRL_I2SIN_LRCLK_INV |
+				 AUDIN_I2SIN_CTRL_I2SIN_LRCLK_SKEW_MASK,
+				 val);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static const struct snd_soc_dapm_widget audin_decoder_i2s_dapm_widgets[] = {
+	SND_SOC_DAPM_AIF_IN("IN",  NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_PGA_E("DEC", SND_SOC_NOPM, 0, 0, NULL, 0,
+			   gx_formatter_event,
+			   (SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_PRE_PMD)),
+	SND_SOC_DAPM_AIF_OUT("OUT", NULL, 0, SND_SOC_NOPM, 0, 0),
+};
+
+static const struct snd_soc_dapm_route audin_decoder_i2s_dapm_routes[] = {
+	{ "DEC", NULL, "IN" },
+	{ "OUT", NULL, "DEC" },
+};
+
+static const struct snd_soc_component_driver audin_decoder_i2s_component = {
+	.dapm_widgets		= audin_decoder_i2s_dapm_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(audin_decoder_i2s_dapm_widgets),
+	.dapm_routes		= audin_decoder_i2s_dapm_routes,
+	.num_dapm_routes	= ARRAY_SIZE(audin_decoder_i2s_dapm_routes),
+};
+
+static const struct regmap_config audin_decoder_i2s_regmap_cfg = {
+	.reg_bits	= 32,
+	.val_bits	= 32,
+	.reg_stride	= 4,
+	.max_register	= 0x3,
+};
+
+static const struct gx_formatter_ops audin_decoder_i2s_ops = {
+	.get_stream	= audin_decoder_i2s_get_stream,
+	.prepare	= audin_decoder_i2s_prepare,
+	.enable		= audin_decoder_i2s_enable,
+	.disable	= audin_decoder_i2s_disable,
+};
+
+static const struct gx_formatter_driver audin_decoder_i2s_drv = {
+	.component_drv	= &audin_decoder_i2s_component,
+	.regmap_cfg	= &audin_decoder_i2s_regmap_cfg,
+	.ops		= &audin_decoder_i2s_ops,
+};
+
+static const struct of_device_id audin_decoder_i2s_of_match[] = {
+	{
+		.compatible = "amlogic,meson-gxbb-audin-decoder-i2s",
+		.data = &audin_decoder_i2s_drv
+	},
+	{}
+};
+MODULE_DEVICE_TABLE(of, audin_decoder_i2s_of_match);
+
+static struct platform_driver audin_decoder_i2s_pdrv = {
+	.probe = gx_formatter_probe,
+	.driver = {
+		.name = "meson-gx-audin-decoder-i2s",
+		.of_match_table = audin_decoder_i2s_of_match,
+	},
+};
+module_platform_driver(audin_decoder_i2s_pdrv);
+
+MODULE_DESCRIPTION("Meson AUDIN Formatter Driver");
+MODULE_AUTHOR("Valerio Setti <vsetti@baylibre.com>");
+MODULE_LICENSE("GPL");

-- 
2.39.5

