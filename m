Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723EC3859FA
	for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 14:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775919483; cv=none; b=m1QDBGyL5x9jdE1Q3+HliZaEuKrT4ZYRyYwafFMbN3gPPCOV6+/hbw+Lp0a1C/8T9DkB6fVaORfvgWPce0Q2ATvrNbQlyNPmUm6K+jDeJsPvcQJMxoCbXJRQ3+BvM3icnTh6C8g+Cgq3kQrE5T872S1OKW0F8okZt2YHjm7PhOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775919483; c=relaxed/simple;
	bh=qhdRQX/ddJSM25M93A+r/cVV0Syd/4yy9wYSGUsGKMU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R086cVeST8bH0R4g4auAR6kEThX/19OMLvZSZiljep14fLjX8a8+oPCrlAqjxZySEb8CVeZuvbtO6WkR7K0vIUEsO5Sl79wyZGw6rnFWyFzZtpbJdHf99+JHZVqdvn7xrJowX6A5YDFzp6HSk9qxUrNftCs7LwB0EdPAZMppHqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=t3DVrjbB; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="t3DVrjbB"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488971db0fdso29487965e9.0
        for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 07:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775919480; x=1776524280; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kz3FwAZomnP9aNGkoofTcWTLt5IEx/freTRsvHSCfXQ=;
        b=t3DVrjbBnzU89MW48JgOMgmJGpVzSG7R3YavOycIR2tA16AW5/93uZbjWGrDvaTnSV
         zHxbdJtW1LlvHNbTMlA9LyYBlaE0qnAVTA7ddlVqfpu1rV09Qk+Rw0OfcSZkYjxEs+tw
         uQaWQZ5AAhDundCmOhwJLo8US/eeVArc/Q9pleMyGGMT2AYZ0pQt/uH0NZjceMlyWX39
         eiapvEq/91wkE3NNYL7ryGELfEZfWIQgnWZ+grh/amn75k8N86ri+tZHOUky/R2xyDkM
         mRUZtCCa166E+wbbpLvRTUcq1n5bGV26s7N1C9wN2aij685kNIgG5ylmXecHfIVGGkL4
         0Ttg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775919480; x=1776524280;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Kz3FwAZomnP9aNGkoofTcWTLt5IEx/freTRsvHSCfXQ=;
        b=NpcDcqBun0KZ20ABuZD6yrGIBwcCLntC26V2OpunqCYhAwJ9UJMAt53PEwaJin0A89
         hl6TLYM4Htw/veY/t8odly1OxV/J5mAjSCk8nHGhz8CP2HQ2cpunSeHqe54Pn5kQ3VY3
         VdP6ZcQQ/L3ZU9HM+a8faFz2IWliMOpWsBSCq7yWTQCKnu7XuElkuZdIcQDP4i5luWnN
         gRetucuG276c5gDiXCmXnEJZbwBD3KlD2xbXZUidWgHkA+jD3qjp/R7Zb4cTdJOTb6HJ
         kKG5loyuGb6dVvpHQURAI9qq/i6PS1vlUAxwQypArECJ7wWzq/LzoSBH1geAvSk7Lc79
         kZeg==
X-Forwarded-Encrypted: i=1; AJvYcCUtm68skaUX8vgJwg+niAGXXkpBP38FzCr8SOLE81GUzs9kc3HvKSlpNiCjW2lzGaifkELDZLNdAU4TFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZR37VS6X0PvoZ+jML0DQkqA+XOazxCYuqPCyg5PYbIwPaLY0k
	mwA6FIHVobjc6JkJSNHjyPfB43SCn9w4L9jGUz+SaopfOjaEY1EOgYyazhxmZeMr5yQ=
X-Gm-Gg: AeBDiesle4Iut2XU4FDi9BELg7J05uRL5BXb1oY/cgyeUgwh9VQAGrH2NPlqRvJpVzP
	MpeEOKhbP1UbrqNXiCgyWfCNvlauBlCvgmp9LpMAoPhUSQXmyJao++LS8qP8lgkgwFm7v1jTkD4
	dpaWEBvb9Q5f9IHYXjrlHZdMZ0bpWx5WE/SgRUz1VIEF9UO+eByMGXSk0Ao5j1rbVbARdJf7gM7
	rWC/NtTo0w+LaBGm3D3rBoMU7rdANQP3GgckMAdPMQrcH2p/3PhmblG8LewrxCGfMDpiUyYQNVD
	IBJVCj2zjK0CLHpbVtQekIV5y1JhwiO128yjA2mrFKN7JALS7CI0EvmppzSHGP4mOlz2nLs9ZLy
	4oOyMmLEi7GyE5H4FVPe/G7SNcTtF+yPFbDyhbK0Khod4RQxkCYSxzY09XrVTqS/XhyKk8djf/u
	2IcPYmpVVgseEekN9cbl1no28PULkCouc=
X-Received: by 2002:a05:600c:4443:b0:488:8577:d9cc with SMTP id 5b1f17b1804b1-488d686be7bmr92734015e9.20.1775919479814;
        Sat, 11 Apr 2026 07:57:59 -0700 (PDT)
Received: from [127.0.1.1] ([151.61.248.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5dc7070sm48882375e9.10.2026.04.11.07.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 07:57:59 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Sat, 11 Apr 2026 16:57:26 +0200
Subject: [PATCH RFC v2 01/11] ASoC: meson: gx: add gx-formatter and
 gx-interface
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-audin-rfc-v2-1-4c8a6ec5fcab@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=12064; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=qhdRQX/ddJSM25M93A+r/cVV0Syd/4yy9wYSGUsGKMU=;
 b=owGbwMvMwCF2z3ty7kUrRgbG02pJDJm3Eoud4v2Ovfz+rt27Yq7bM/9pNfOWKwR2svEujj6qE
 Kt+Kkilo5SFQYyDQVZMkYVl+r3fBaVqD40TThbAzGFlAhnCwMUpABPpLGRkmDN7ywbr+Y8T8lfx
 Js3XUGzl6DdawJNw8vTpeZqqK4XYrzD8lZK2v7DellGFz7r6gtIkefubF3UfljFMnrJ4TuoS8Ze
 7GQE=
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
 sound/soc/meson/gx-formatter.c | 304 +++++++++++++++++++++++++++++++++++++++++
 sound/soc/meson/gx-formatter.h |  47 +++++++
 sound/soc/meson/gx-interface.h |  50 +++++++
 4 files changed, 402 insertions(+)

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
index 0000000000000000000000000000000000000000..3f6d01f8d755ddedaaa0b0ab0a2683155e43d1b6
--- /dev/null
+++ b/sound/soc/meson/gx-formatter.c
@@ -0,0 +1,304 @@
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
+	if (w->priv != NULL)
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
+	return snd_soc_register_component(dev, drv->component_drv, NULL, 0);
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
+	ts->ready = true;
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
+int gx_stream_set_cont_clocks(struct gx_stream *ts,
+			      unsigned int fmt)
+{
+	int ret = 0;
+
+	if (fmt & SND_SOC_DAIFMT_CONT) {
+		/* Clock are already enabled - skipping */
+		if (ts->clk_enabled)
+			return 0;
+
+		ret = clk_prepare_enable(ts->iface->mclk);
+		if (ret)
+			return ret;
+
+		ts->clk_enabled = true;
+		return 0;
+	}
+
+	/* Clocks are already disabled - skipping */
+	if (!ts->clk_enabled)
+		return 0;
+
+	clk_disable_unprepare(ts->iface->mclk);
+
+	ts->clk_enabled = false;
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gx_stream_set_cont_clocks);
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
index 0000000000000000000000000000000000000000..c6b78635d7807333e4cb2f09191e29390da8e077
--- /dev/null
+++ b/sound/soc/meson/gx-interface.h
@@ -0,0 +1,50 @@
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
+	struct clk *sclk;
+	struct clk *lrclk;
+	struct clk *mclk;
+	unsigned long mclk_rate;
+
+	/* format is common to all the DAIs of the iface */
+	unsigned int fmt;
+	unsigned int slots;
+	unsigned int slot_width;
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
+int gx_stream_set_cont_clocks(struct gx_stream *ts, unsigned int fmt);
+
+#endif /* _MESON_GX_INTERFACE_H */

-- 
2.39.5

