Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10A43A6B8E
	for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 21:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781126983; cv=none; b=S/MoeNYfZKtbviRudYrjHyMIZF4+BPW09KYN78R50s73mrb43aSveeK6Kw+PLRwycYDUNEqVCdYDQjpb9RMIFNitVynRl7fiLzcowqy6Id9tKdEMcKW5d10eS12w0XDvi/bA4vHxSD9IaEvsTyzHAfvwN4x3LVc+MpVas9BaUR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781126983; c=relaxed/simple;
	bh=trgz8cBBhoMcWZm4BFymiPHpU+7G88HDCgUCGN9Npl8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EwE9RfO3ZXwR0DA6QnoKG4ZeR/gIy1ng5MFFgZDbQuHO+aQ7A7mHuowq4FrmmQcMZuZH/gqR/JeZUGLfGiEABm5L1s0AJIIqxkikxnEZXDDDYMzoy7rPXbXtgzDJQ3nbRnZvix+WkbZZ9gBZhaV1N83gEBB3x9kP39jvj1stsck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=TisvyiKO; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="TisvyiKO"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490b3637b90so62521825e9.3
        for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 14:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781126979; x=1781731779; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=arBcvsWOJ7tCGJfn8TBgJSURx+zdaxN19ttwPiWsVPk=;
        b=TisvyiKOzWHpBa1neK2svgXdE3ygIaRpNanXf7tVddtbkXTaa4ygSlC1IPGwld4UU/
         lKh+9WUenEuYpXzJRtQfRXw2zOZXYITf5OP5aey/xwlgAh6xG2I5Cz010Nn6tZ7Hi/JI
         3wwFavA9kVent3O7dhTvDEop+BYoejflZHOJBucwSKWvxUc7qCOgEgmqIgY+XuGhnU0A
         kv7pgg8/xfVlofIekJqPzBnZchvZ5EHR8zaomqzbcOtTnl7LRqGrx0O89wO5X7dEuymJ
         BxZXyK+XLOCsspVEBVotGJwnYyowN04Dq8ASplUEffQyKGxt86ABOzwotBBqlyWBgkmh
         mTVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781126979; x=1781731779;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=arBcvsWOJ7tCGJfn8TBgJSURx+zdaxN19ttwPiWsVPk=;
        b=KbT46+9JgsrAavGSKZ8i5wTc+Mm7a/M2WXo+gNyv4l5wn1SFoJHxAj6t4CyddOFqVQ
         VBWXGg3n5CiTAPiF3+KRLIx6GqaF6+Fsxme6twVywZ0aC5Wr2zRVlCu76BkWHhw9bUQ1
         kmxM2ZOWsvZgamhpVzp5uNPSjO5hQTAwWfs/nO+eXo4sj9RneojayOeCzmz89zNj+sWm
         0adu01IpjajpSRTAHDryb0ZO/bkFQFQZ80LXxPnUH7+zvk/e9I1xtClw6FIeaBGo2FsD
         Tyjlxuy2CIiM2cCXgyNejv3ddVF4xLYDBS7Bq4vlYvXLdElNik6PttBiIfP49tPKEef6
         wfBA==
X-Forwarded-Encrypted: i=1; AFNElJ84ok+gXtzNAKGX+oxJX2owG/+7U5c69K87+9C3Suo5NbbALYHD4dNwGiD1/+mcg6UrVsMkoCMa0/lBrg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNeL+xsWHfzXLevnLe5mP5jujGg/oEZn6+Rm3n89FukXYOd2Xd
	orYR/zFCLDnBtHB+/zi8Lgkmtko5g8p1CHL7hNSyf9X1FB0z/WpSwDONAMaLQXPnA/RdqZPkkdG
	/isxBak8=
X-Gm-Gg: Acq92OFgRDUTXgcdTyrniI6n02IurP0Dr2pCI9WYDnVH9kYPRnJXYYdY5j650YaNBZF
	vgWXzcxbSBmjdKpP3tZ8PF8ZrXBZ/+ruR7bE4hUgUCkYc6HFUDGZ6zidgDLubhLrvX4Qo5gpBuu
	oI5qDr7KGf3IqlePbbDuULpIUouLgkSdjzrwUGNuPHBr7TTxOcWWl5SyqQsNCHXHHiiO5EUXBdF
	PYl4NhDYQ9Z77Ew7BhA5k0p8lR4g6gTTQHd7gP3qCq0AV8Ga0ZsCfUL6+DdBKNJA5YLA+nNB/+y
	SGWg62WLMOYV4ZOqKOCarb61+PXuXKlaRJ1BwAWCJZo8Xxc+4Bt9fEGVhdaElJjsfTzXVmyoqAR
	tp/Qpagm/B/hiHZt1htEyE8yoVVt1UvPvHjpGejhzXeSptfd1wNUkTTYRVtkAtvSJU5/epNZV2y
	nCW+e6+zXVVkB4Q/BgbjNqZcggoY9fo7o=
X-Received: by 2002:a7b:c8da:0:b0:490:e1cd:e5a3 with SMTP id 5b1f17b1804b1-490e1cde5ecmr23023835e9.26.1781126979178;
        Wed, 10 Jun 2026 14:29:39 -0700 (PDT)
Received: from [127.0.1.1] ([151.61.238.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e4228768sm970965e9.0.2026.06.10.14.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 14:29:38 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Wed, 10 Jun 2026 23:29:25 +0200
Subject: [PATCH v2 1/4] ASoC: meson: gx: add gx-formatter and gx-interface
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-reshape-aiu-as-axg-v2-1-cac3663a8b51@baylibre.com>
References: <20260610-reshape-aiu-as-axg-v2-0-cac3663a8b51@baylibre.com>
In-Reply-To: <20260610-reshape-aiu-as-axg-v2-0-cac3663a8b51@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11719; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=trgz8cBBhoMcWZm4BFymiPHpU+7G88HDCgUCGN9Npl8=;
 b=owGbwMvMwCF2z3ty7kUrRgbG02pJDFma1x30fy88v9r8P99NAakzzu4JWYttVjPdvnGU7/z6g
 CL7WJnJHaUsDGIcDLJiiiws0+/9LihVe2iccLIAZg4rE8gQBi5OAZjIWSZGhl1nv/Lei/7cUph6
 er+Yaus8lQ0s17iD3/8xZlh+RnxCy0lGhnV3IzMOMqb+lrE8vfG5jmDN0llb5ovtvJ1Zrcv3V8m
 shA0A
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
 sound/soc/meson/gx-formatter.c | 282 +++++++++++++++++++++++++++++++++++++++++
 sound/soc/meson/gx-formatter.h |  56 ++++++++
 sound/soc/meson/gx-interface.h |  48 +++++++
 4 files changed, 387 insertions(+)

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
index 0000000000000000000000000000000000000000..311e63affb239ee575d59b7c6ea5c1c5f3ab2300
--- /dev/null
+++ b/sound/soc/meson/gx-formatter.c
@@ -0,0 +1,282 @@
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
+	if (!ts)
+		return;
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
+	INIT_LIST_HEAD(&formatter->list);
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
+EXPORT_SYMBOL_GPL(gx_formatter_create);
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
+			pr_err("failed to enable formatter\n");
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
index 0000000000000000000000000000000000000000..b90b1814d79b49e3e6e5f4470161bc1e8bba6ebd
--- /dev/null
+++ b/sound/soc/meson/gx-formatter.h
@@ -0,0 +1,56 @@
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
+/*
+ * Formatter data is already freed when the associated device is removed,
+ * so we just need to remove the pointer from the widget.
+ */
+static inline void gx_formatter_free(struct snd_soc_dapm_widget *w)
+{
+	w->priv = NULL;
+}
+
+#endif /* _MESON_GX_FORMATTER_H */
diff --git a/sound/soc/meson/gx-interface.h b/sound/soc/meson/gx-interface.h
new file mode 100644
index 0000000000000000000000000000000000000000..65c46dcce32a8c2d2a95afe3b99e65e759781a6a
--- /dev/null
+++ b/sound/soc/meson/gx-interface.h
@@ -0,0 +1,48 @@
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
+
+	/* Only for GX platform */
+	int bs_quirk;
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

