Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D941D48B36F
	for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 15:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778857879; cv=none; b=G82kWAaxPb2zLpE//04pqFwf0GHXhzMdifpV4SjVo5Np4Xlk0jcyO+5CJ8VlnZZmOXG6HwsOupgPU0kspLRcPEw5QOxlgpXygd6HZ3dFW8Kq6wgG3/Oq7FvjrXjk8vc/pn1pQOFrQu9dee+FNlOlqetswDJHMn025u8PO0H8NL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778857879; c=relaxed/simple;
	bh=j6Zh4RLoIBZtyp/kwYar+Xu3SLB01yR+UX6gB7d84TE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B8Ju80TH5Ibe7/W165mwjTSeaPMlUNM7M7dvBLSVgzlpEzWhFpmfIX6s25S1/9AA9+k0g3rW1eNbyGhEbBTfKHwbjvJ8zRWfjrtvkyRsUL/v8+EeKxIRg5cnUYlPQy5SVv4clCC3tuzRDwG3x/PsVurKlgWB3m7TJhZ6KhJEvr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=dnUc9wh6; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="dnUc9wh6"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4891b0786beso60846855e9.1
        for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 08:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778857875; x=1779462675; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rDDrzBwWLv7cxXzysL5yYXylItmsqFDKcdeZuZx/a38=;
        b=dnUc9wh6pFl6CjEekwGsbAZW3V0w23UbCmxf47+l9eJcD/Rp8AxHjR2sXeswDfxGi7
         4loF14CEP0msMqVxm2iN+skTX0mH9Yi4mPyVLM3V01PLAdRbohojdAdg8a/NB8IPcLo0
         JVUqRUVGe+7THN8sMMHVgxrgeDLYfNSr37i9vgLADJMytEFPzZRTtlXIyo+ITDy/Ap9l
         XPtqfJUXXm8yZh+bJOEZR2SI+M4M4bzDKNlmNqTmW+H7BdXMHm3UPiKZOqe577XSy+c3
         xX95G1SVyinJ0Fk0YVT6ekYDnDc4WZUapnXNwljGXsSRpDMATzTPP8qlwpRZr/kJ8nog
         XvpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778857875; x=1779462675;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rDDrzBwWLv7cxXzysL5yYXylItmsqFDKcdeZuZx/a38=;
        b=plCbtrrF7PYjQDyLGWU9rxO1tyAv+wj7Vh2b4caL/aw+SDxjve1qg0KE+b9zf0a9DW
         SpdDNbLaFzoAlObdIm/ACKVJ9kmQ3sCmXlfgiQdrkYTqR3byeak/YoMSF3wGQecmr25n
         gjdUEImqmMCqSr29xzBM35yEDQnYApRlOPaaQRx6Saa8J9MD5ICCSHrOJHdw3aSz/3yW
         7bJBDC6SbJFsH4jO/KEjmEcKNUBk91o5XWpGdGb/Km0Jw1Sea7TZd5lGbs9aHrkSIfln
         Es9EgSOsaQw2exewbOVl2B4EB1E9xtB9kzh21t5+M6xMVOuB4RhNFVSyfVMUBhF0zmap
         PsMw==
X-Forwarded-Encrypted: i=1; AFNElJ+laUc46Z+6fjoKNGFwcPNf6kW/kJzLwPoCG7dru7HnegqvFsKmCqGDpCTPVJk3RISB6MUtMg/GLEetUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzByscZbfHe0uHLwcStIPpILLBVp19S93wDQPPVioYzyjKi5w8N
	7iZb1qX9Csy13TdzH/4q65HSnprtf8LCLCHGgRNASi1CdlHsgEk9QhAQT9d/1APdz98=
X-Gm-Gg: Acq92OG9fbIGn0GmNzbOeUcj750zHrH/cyvtZKEFU9y2YZ8Jbimxzao7SAbAOvJQg88
	lda+MalskYYdi61gqoKliMdAayuv6MXJDs01wI562uXqZoOCFIMG05yOGbis7A0XomrRTgG3toP
	NADCgzeqdJUPgz/CuwSGdOjGC1oyQ29QcgLL+kpKFbfCqkV3cdEHRzv1FckBvLCKy0leOhvcN5W
	qVuaaMhpB5y9r/dcyZ0hSXqpWJYQMN25tfozLkWdsNBibFayirIIvrSarBXoLr+e5IpHwJ5TKbB
	L1mhNdqjeiPxz4NulBuhOjL9qfFV0SIpdYnMcoUWauTith6svdh1Uj+6iO/qMCGem9r2PxTSTl/
	zgKSRU8cnOyj9zchST3Yr5u6Vx5nZdEoSbgCGN4BRGzna9/6VbP7ClftuPqaSKnzBCVGy6j1pF3
	LE6ym4rP1QWNnxs/Aue6pS
X-Received: by 2002:a05:6000:250a:b0:45d:4b37:7fcf with SMTP id ffacd0b85a97d-45e5c58951emr6150818f8f.15.1778857875103;
        Fri, 15 May 2026 08:11:15 -0700 (PDT)
Received: from [127.0.1.1] ([151.41.223.93])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a19c2dsm15262062f8f.21.2026.05.15.08.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 08:11:14 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Fri, 15 May 2026 17:10:37 +0200
Subject: [PATCH 1/4] ASoC: meson: gx: add gx-formatter and gx-interface
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-reshape-aiu-as-axg-v1-1-53b457784ff3@baylibre.com>
References: <20260515-reshape-aiu-as-axg-v1-0-53b457784ff3@baylibre.com>
In-Reply-To: <20260515-reshape-aiu-as-axg-v1-0-53b457784ff3@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11315; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=j6Zh4RLoIBZtyp/kwYar+Xu3SLB01yR+UX6gB7d84TE=;
 b=owGbwMvMwCF2z3ty7kUrRgbG02pJDFns5v31Lufn3Togwrkoq36i9Qw/rjX9GdeMVPrFWk+yH
 Fun+Muto5SFQYyDQVZMkYVl+r3fBaVqD40TThbAzGFlAhnCwMUpABM5xMrIsFjmd/bqK9ytE3dO
 Pvxcr6I7fsrG8NwWPUGJH20TdFW3mTEyTJYTNnnVqf89bObMKLn4HxtbVkpOFO5mvtskMT9jWUI
 /FwA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

These files are the basic block which allow to shape I2S in GX devices
the same as the AXG ones: the DAI backend only controls the interface
(i.e. clocks and pins) whereas a formatter takes care of properly
formatting the data.

gx-formatter and gx-interface are strongly inspired to axg-tdm-formatter
and axg-tdm, respectively. The long term plan is to join the two platforms
to use the same formatter solution.

There is only a minor addition here compared to what has been done for
AXG and it's "gx_formatter_create()" which is required in order to let
already existing AIU code to make use of this formatter without making any
devicetree change.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/Makefile       |   1 +
 sound/soc/meson/gx-formatter.c | 277 +++++++++++++++++++++++++++++++++++++++++
 sound/soc/meson/gx-formatter.h |  47 +++++++
 sound/soc/meson/gx-interface.h |  45 +++++++
 4 files changed, 370 insertions(+)

diff --git a/sound/soc/meson/Makefile b/sound/soc/meson/Makefile
index 24078e4396b02d545d8ba4bcb1632979001354e3..146ec81526ba091a174a113ce3d8412ddbbfd9dd 100644
--- a/sound/soc/meson/Makefile
+++ b/sound/soc/meson/Makefile
@@ -4,6 +4,7 @@ snd-soc-meson-aiu-y := aiu.o
 snd-soc-meson-aiu-y += aiu-acodec-ctrl.o
 snd-soc-meson-aiu-y += aiu-codec-ctrl.o
 snd-soc-meson-aiu-y += aiu-encoder-i2s.o
+snd-soc-meson-aiu-y += gx-formatter.o
 snd-soc-meson-aiu-y += aiu-encoder-spdif.o
 snd-soc-meson-aiu-y += aiu-fifo.o
 snd-soc-meson-aiu-y += aiu-fifo-i2s.o
diff --git a/sound/soc/meson/gx-formatter.c b/sound/soc/meson/gx-formatter.c
new file mode 100644
index 0000000000000000000000000000000000000000..db93546ed9217f711fcdbeddbd815ce21f27bab5
--- /dev/null
+++ b/sound/soc/meson/gx-formatter.c
@@ -0,0 +1,277 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+//
+// Copyright (c) 2026 BayLibre, SAS.
+// Author: Valerio Setti <vsetti@baylibre.com>
+
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/regmap.h>
+#include <sound/soc.h>
+
+#include "gx-formatter.h"
+
+struct gx_formatter {
+	struct list_head list;
+	struct gx_stream *stream;
+	const struct gx_formatter_driver *drv;
+	bool enabled;
+	struct regmap *map;
+};
+
+static int gx_formatter_enable(struct gx_formatter *formatter)
+{
+	int ret;
+
+	/* Do nothing if the formatter is already enabled */
+	if (formatter->enabled)
+		return 0;
+
+	/* Setup the stream parameter in the formatter */
+	if (formatter->drv->ops->prepare) {
+		ret = formatter->drv->ops->prepare(formatter->map,
+					   formatter->drv->quirks,
+					   formatter->stream);
+		if (ret)
+			return ret;
+	}
+
+	/* Finally, actually enable the formatter */
+	if (formatter->drv->ops->enable)
+		formatter->drv->ops->enable(formatter->map);
+
+	formatter->enabled = true;
+
+	return 0;
+}
+
+static void gx_formatter_disable(struct gx_formatter *formatter)
+{
+	/* Do nothing if the formatter is already disabled */
+	if (!formatter->enabled)
+		return;
+
+	if (formatter->drv->ops->disable)
+		formatter->drv->ops->disable(formatter->map);
+
+	formatter->enabled = false;
+}
+
+static int gx_formatter_attach(struct gx_formatter *formatter)
+{
+	struct gx_stream *ts = formatter->stream;
+	int ret = 0;
+
+	mutex_lock(&ts->lock);
+
+	/* Catch up if the stream is already running when we attach */
+	if (ts->ready) {
+		ret = gx_formatter_enable(formatter);
+		if (ret) {
+			pr_err("failed to enable formatter\n");
+			goto out;
+		}
+	}
+
+	list_add_tail(&formatter->list, &ts->formatter_list);
+out:
+	mutex_unlock(&ts->lock);
+	return ret;
+}
+
+static void gx_formatter_detach(struct gx_formatter *formatter)
+{
+	struct gx_stream *ts = formatter->stream;
+
+	mutex_lock(&ts->lock);
+	list_del(&formatter->list);
+	mutex_unlock(&ts->lock);
+
+	gx_formatter_disable(formatter);
+}
+
+static int gx_formatter_power_up(struct gx_formatter *formatter,
+				      struct snd_soc_dapm_widget *w)
+{
+	struct gx_stream *ts = formatter->drv->ops->get_stream(w);
+	int ret;
+
+	/*
+	 * If we don't get a stream at this stage, it would mean that the
+	 * widget is powering up but is not attached to any backend DAI.
+	 * It should not happen, ever !
+	 */
+	if (WARN_ON(!ts))
+		return -ENODEV;
+
+	formatter->stream = ts;
+	ret = gx_formatter_attach(formatter);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static void gx_formatter_power_down(struct gx_formatter *formatter)
+{
+	gx_formatter_detach(formatter);
+	formatter->stream = NULL;
+}
+
+int gx_formatter_event(struct snd_soc_dapm_widget *w,
+		       struct snd_kcontrol *control,
+		       int event)
+{
+	struct snd_soc_component *c;
+	struct gx_formatter *formatter;
+	int ret = 0;
+
+	c = snd_soc_dapm_to_component(w->dapm);
+
+	if (w->priv)
+		formatter = w->priv;
+	else
+		formatter = snd_soc_component_get_drvdata(c);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		ret = gx_formatter_power_up(formatter, w);
+		break;
+
+	case SND_SOC_DAPM_PRE_PMD:
+		gx_formatter_power_down(formatter);
+		break;
+
+	default:
+		dev_err(c->dev, "Unexpected event %d\n", event);
+		return -EINVAL;
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gx_formatter_event);
+
+int gx_formatter_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	const struct gx_formatter_driver *drv;
+	struct gx_formatter *formatter;
+	void __iomem *regs;
+
+	drv = of_device_get_match_data(dev);
+	if (!drv) {
+		dev_err(dev, "failed to match device\n");
+		return -ENODEV;
+	}
+
+	formatter = devm_kzalloc(dev, sizeof(*formatter), GFP_KERNEL);
+	if (!formatter)
+		return -ENOMEM;
+	platform_set_drvdata(pdev, formatter);
+	formatter->drv = drv;
+
+	regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
+	formatter->map = devm_regmap_init_mmio(dev, regs, drv->regmap_cfg);
+	if (IS_ERR(formatter->map)) {
+		dev_err(dev, "failed to init regmap: %ld\n",
+			PTR_ERR(formatter->map));
+		return PTR_ERR(formatter->map);
+	}
+
+	return devm_snd_soc_register_component(dev, drv->component_drv,
+					       NULL, 0);
+}
+EXPORT_SYMBOL_GPL(gx_formatter_probe);
+
+int gx_formatter_create(struct device *dev,
+			struct snd_soc_dapm_widget *w,
+			const struct gx_formatter_driver *drv,
+			struct regmap *regmap)
+{
+	struct gx_formatter *formatter;
+
+	formatter = devm_kzalloc(dev, sizeof(*formatter), GFP_KERNEL);
+	if (!formatter)
+		return -ENOMEM;
+
+	formatter->drv = drv;
+	formatter->map = regmap;
+
+	w->priv = formatter;
+
+	return 0;
+}
+
+int gx_stream_start(struct gx_stream *ts)
+{
+	struct gx_formatter *formatter;
+	int ret = 0;
+
+	mutex_lock(&ts->lock);
+
+	/* Start all the formatters attached to the stream */
+	list_for_each_entry(formatter, &ts->formatter_list, list) {
+		ret = gx_formatter_enable(formatter);
+		if (ret) {
+			pr_err("failed to start tdm stream\n");
+			goto out;
+		}
+	}
+
+	ts->ready = true;
+
+out:
+	mutex_unlock(&ts->lock);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gx_stream_start);
+
+void gx_stream_stop(struct gx_stream *ts)
+{
+	struct gx_formatter *formatter;
+
+	mutex_lock(&ts->lock);
+	ts->ready = false;
+
+	/* Stop all the formatters attached to the stream */
+	list_for_each_entry(formatter, &ts->formatter_list, list) {
+		gx_formatter_disable(formatter);
+	}
+
+	mutex_unlock(&ts->lock);
+}
+EXPORT_SYMBOL_GPL(gx_stream_stop);
+
+struct gx_stream *gx_stream_alloc(struct gx_iface *iface)
+{
+	struct gx_stream *ts;
+
+	ts = kzalloc(sizeof(*ts), GFP_KERNEL);
+	if (ts) {
+		INIT_LIST_HEAD(&ts->formatter_list);
+		mutex_init(&ts->lock);
+		ts->iface = iface;
+	}
+
+	return ts;
+}
+EXPORT_SYMBOL_GPL(gx_stream_alloc);
+
+void gx_stream_free(struct gx_stream *ts)
+{
+	/*
+	 * If the list is not empty, it would mean that one of the formatter
+	 * widget is still powered and attached to the interface while we
+	 * are removing the TDM DAI. It should not be possible
+	 */
+	WARN_ON(!list_empty(&ts->formatter_list));
+	mutex_destroy(&ts->lock);
+	kfree(ts);
+}
+EXPORT_SYMBOL_GPL(gx_stream_free);
+
+MODULE_DESCRIPTION("Amlogic GX formatter driver");
+MODULE_AUTHOR("Valerio Setti <vsetti@baylibre.com>");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/meson/gx-formatter.h b/sound/soc/meson/gx-formatter.h
new file mode 100644
index 0000000000000000000000000000000000000000..05670c3dfb9f43ac3ee959f1d3d11bacee020c43
--- /dev/null
+++ b/sound/soc/meson/gx-formatter.h
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
+/*
+ * Copyright (c) 2026 Baylibre SAS.
+ * Author: Valerio Setti <vsetti@baylibre.com>
+ */
+
+#ifndef _MESON_GX_FORMATTER_H
+#define _MESON_GX_FORMATTER_H
+
+#include "gx-interface.h"
+
+struct platform_device;
+struct regmap;
+struct snd_soc_dapm_widget;
+struct snd_kcontrol;
+
+struct gx_formatter_hw {
+	unsigned int skew_offset;
+};
+
+struct gx_formatter_ops {
+	struct gx_stream *(*get_stream)(struct snd_soc_dapm_widget *w);
+	void (*enable)(struct regmap *map);
+	void (*disable)(struct regmap *map);
+	int (*prepare)(struct regmap *map,
+		       const struct gx_formatter_hw *quirks,
+		       struct gx_stream *ts);
+};
+
+struct gx_formatter_driver {
+	const struct snd_soc_component_driver *component_drv;
+	const struct regmap_config *regmap_cfg;
+	const struct gx_formatter_ops *ops;
+	const struct gx_formatter_hw *quirks;
+};
+
+int gx_formatter_event(struct snd_soc_dapm_widget *w,
+		       struct snd_kcontrol *control,
+		       int event);
+int gx_formatter_probe(struct platform_device *pdev);
+
+int gx_formatter_create(struct device *dev,
+			struct snd_soc_dapm_widget *w,
+			const struct gx_formatter_driver *drv,
+			struct regmap *regmap);
+
+#endif /* _MESON_GX_FORMATTER_H */
diff --git a/sound/soc/meson/gx-interface.h b/sound/soc/meson/gx-interface.h
new file mode 100644
index 0000000000000000000000000000000000000000..d9ab894589fa039f7fdd76765390630a2c6d8fbf
--- /dev/null
+++ b/sound/soc/meson/gx-interface.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
+/*
+ * Copyright (c) 2026 Baylibre SAS.
+ * Author: Valerio Setti <vsetti@baylibre.com>
+ */
+
+#ifndef _MESON_GX_INTERFACE_H
+#define _MESON_GX_INTERFACE_H
+
+#include <linux/clk.h>
+#include <linux/regmap.h>
+#include <sound/pcm.h>
+#include <sound/soc.h>
+#include <sound/soc-dai.h>
+
+struct gx_iface {
+	struct clk *mclk;
+	unsigned long mclk_rate;
+
+	/* format is common to all the DAIs of the iface */
+	unsigned int fmt;
+
+	/* For component wide symmetry */
+	int rate;
+};
+
+struct gx_stream {
+	struct gx_iface *iface;
+	struct list_head formatter_list;
+	struct mutex lock;
+	unsigned int channels;
+	unsigned int width;
+	unsigned int physical_width;
+	bool ready;
+
+	/* For continuous clock tracking */
+	bool clk_enabled;
+};
+
+struct gx_stream *gx_stream_alloc(struct gx_iface *iface);
+void gx_stream_free(struct gx_stream *ts);
+int gx_stream_start(struct gx_stream *ts);
+void gx_stream_stop(struct gx_stream *ts);
+
+#endif /* _MESON_GX_INTERFACE_H */

-- 
2.39.5

