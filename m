Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A366948BD36
	for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 15:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778857880; cv=none; b=m/Xmj56G/bXEs0GTw1S2xCQs3yt7k/r18eRpRniMnPRKMBZGgV+RD9LE1Yafl4KkaNBwr9TYh5iEF5EZOsFwDgjR9+gUQs/0UHYRb/rWhIdmlylEapE6R0HcWR/OINlMnQIBHAjBdCoNc/xnTc7mzWfr0fg5LUbDdDMElQrRUeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778857880; c=relaxed/simple;
	bh=54PIae7SEeel0cOzqQW3XSaYMJnLQDfwZn/z4oQ7lbg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EsOYp5MqxK+SvXMAtTQDyVsAEO33//JzBj4S8VWpmpT+BYQRD4223/p9m/soSLZzk/xysHf6Ud2ULItyUjrV6D0c5Pa9zkI/SMjYU61/j0tyLyckFuKNf0N50JaHqQcptZTqEzNndPItemcggEeyPqus9s/J+klP0z24aEbB1ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=n9l4ed6C; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="n9l4ed6C"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so81373355e9.2
        for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 08:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778857877; x=1779462677; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0EaEtp+NjgujiEJl+onPEKqRbgJwif9DxxZ8e5Jffn0=;
        b=n9l4ed6CglS91TiL/MKu7pC0d+dXu35LzNqhXjl9IfsqSPQ1QCYdsu/kr/cLOXY2Pi
         WJ3FivKTBuiIsnxmVkpYIswisObs1mMK5Q89RKon0aQpYk3VJNDgQ73QgUGrTGEBoto7
         /Xj1+64fGeGObaBJcM2ZCZNFJbq6GIqwpO93Pt9Ni5cPUYxmf0pxB5YOFFIPyVb+je8F
         1VNNx/ECbgCB4Vco8yE9LxKz7Nqu96em41Ad/JD3VBSWikfLrTXm3utBgTTat3RzJSxu
         SpWfrqisUFmC0C5X5BaphXWQwwIOQMgGF3Lop66w1Nw2cKcSMfJgu3VMUismer7NcHBU
         vURw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778857877; x=1779462677;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0EaEtp+NjgujiEJl+onPEKqRbgJwif9DxxZ8e5Jffn0=;
        b=gGySl6FlkMCWxSYx4i5uusQ6uag/RFbz0q/kswQ8Ro8/JNpHbOeGvkQpWOl7okOOuc
         46F4eY4dtYAIe/djeKsiQ1QO3zKXhmBdG0Frg1xy7mpBFQULkhQcDzwo+sj2OLzpJZ60
         pnHZ8V6KQqv6OYYo93R+InI+ST5DIoy6SWQgxUec8f4/J1VM/ChL2Magu8T0x4qdOL2v
         HCfD019AzBsjj65sh+zAeyXhMZk9+VdHHgLaXmAL3yCFHfTAjcICpVUNYcVovNMd6jDY
         0Piey8+r9HtLhNMh6+jsbXTCREPkoOhLqj15/o3zdQjIz5ZIdK7OW0J3hLmGtFk5XRyP
         U3Og==
X-Forwarded-Encrypted: i=1; AFNElJ9ZogJ4NPyISrcEXI9UVtIIUBB9ZJ4Kvz7J6vmMUduWbQBXxKLJbEjv2wSM0AcOpPsZpgu+kYMwyNLRNA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLOJKG59lECz6LIGMM/RlHOx3WHBoqok4flhOgxKP0CD0CfUx3
	MEsaCNKIX0ZX/LRlumZikz0wA7v9r848R+rU4VhqRjB6G9VCnyc8t6od4Dkoeba52No=
X-Gm-Gg: Acq92OEszPmB0R15Ex2FRMnk3eUAzQKipUXhZFhcud6VE6EH1tMTEtHxulodgqXd5bf
	S7M09OcHfQKGsVwld0QILBLSQdEm2Ebok7rKTK1nqgfm2V1Rk3AXI44xe+h3PjyKMaTiTthOoK/
	TAr7maLuNNtM3TTWgSRSEluUCb61FKmnOo9LT8iicR9fgjr5DaeYD3XhocwAbLCb2J532fpJ5BA
	ddRHfZiK1xmqWvWulK09EGk42p3o0a8NGdLgS/fN8LKCnEk7yeupHqTYz1DCIuNi8nKBGsGGq8c
	VDIYbElpugjx0mn4Y8+tFjkE13ebC672wfvbmWYLOcK6/ApL9msdX6s+oYk34aCHfX1O4I8U0Cq
	Uwz6O7aSMBaozDtocPMUK+l5vnwOAzZfUJrL8JdpWlmvIM5WM+Z/LraO/x64TgRNiwvfCaWKGFn
	pXqKMkBoiyZ7vtWSb+9KSD
X-Received: by 2002:a05:600c:848c:b0:48a:52d4:888c with SMTP id 5b1f17b1804b1-48fe60e5241mr65301055e9.3.1778857876640;
        Fri, 15 May 2026 08:11:16 -0700 (PDT)
Received: from [127.0.1.1] ([151.41.223.93])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a19c2dsm15262062f8f.21.2026.05.15.08.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 08:11:16 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Fri, 15 May 2026 17:10:38 +0200
Subject: [PATCH 2/4] ASoC: meson: aiu-encoder-i2s: use gx_iface and
 gx_stream structures
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-reshape-aiu-as-axg-v1-2-53b457784ff3@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=12028; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=54PIae7SEeel0cOzqQW3XSaYMJnLQDfwZn/z4oQ7lbg=;
 b=owGbwMvMwCF2z3ty7kUrRgbG02pJDFns5v1F/TXLIne8vloWHF1x7urD1lyx+TL183Y4nUuUn
 nzcynhNRykLgxgHg6yYIgvL9Hu/C0rVHhonnCyAmcPKBDKEgYtTACbSMZ+RYZWZbg3T1Ilh1Y82
 rexo2MgQP/GASdmXWVYf9P9NU30qrs3wT73JVOeMSOnk64vYk84927LvcpTgZFWrh8YTDv395TZ
 1CgcA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

Start using gx_iface and gx_stream to store interface and stream info,
respectively. probe()/remove() functions are added to allocate/free the
gx_stream structures for each PCM stream.

Clock-wise instead of bulk enabling all the clocks on startup and disabling
them on shutdown, only the peripheral's internal ones are enabled/disabled
in those functions, whereas MCLK and I2S clock divider are handled in
hw_params/hw_free.
Interface wide rate symmetry is also enforced here. This is useful when the
interface is used for playback and capture at the same time.

Finally a trigger() callback is also added to start/stop the associated
I2S data formatter.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/aiu-encoder-i2s.c | 200 ++++++++++++++++++++++++++++++++------
 sound/soc/meson/aiu.h             |   3 +
 2 files changed, 174 insertions(+), 29 deletions(-)

diff --git a/sound/soc/meson/aiu-encoder-i2s.c b/sound/soc/meson/aiu-encoder-i2s.c
index 3b4061508c18047fe8d6f3f98061720f8ce238f2..39accd396affb8beb49fa7cca394244730b24574 100644
--- a/sound/soc/meson/aiu-encoder-i2s.c
+++ b/sound/soc/meson/aiu-encoder-i2s.c
@@ -10,6 +10,8 @@
 #include <sound/soc-dai.h>
 
 #include "aiu.h"
+#include "gx-formatter.h"
+#include "gx-interface.h"
 
 #define AIU_I2S_SOURCE_DESC_MODE_8CH	BIT(0)
 #define AIU_I2S_SOURCE_DESC_MODE_24BIT	BIT(5)
@@ -79,7 +81,7 @@ static int aiu_encoder_i2s_setup_desc(struct snd_soc_component *component,
 }
 
 static int aiu_encoder_i2s_set_legacy_div(struct snd_soc_component *component,
-					  struct snd_pcm_hw_params *params,
+					  struct gx_stream *ts,
 					  unsigned int bs)
 {
 	switch (bs) {
@@ -109,7 +111,7 @@ static int aiu_encoder_i2s_set_legacy_div(struct snd_soc_component *component,
 }
 
 static int aiu_encoder_i2s_set_more_div(struct snd_soc_component *component,
-					struct snd_pcm_hw_params *params,
+					struct gx_stream *ts,
 					unsigned int bs)
 {
 	/*
@@ -119,7 +121,7 @@ static int aiu_encoder_i2s_set_more_div(struct snd_soc_component *component,
 	 * increased by 50% to get the correct output rate.
 	 * No idea why !
 	 */
-	if (params_width(params) == 16 && params_channels(params) == 8) {
+	if (ts->width == 16 && ts->channels == 8) {
 		if (bs % 2) {
 			dev_err(component->dev,
 				"Cannot increase i2s divider by 50%%\n");
@@ -142,24 +144,18 @@ static int aiu_encoder_i2s_set_more_div(struct snd_soc_component *component,
 }
 
 static int aiu_encoder_i2s_set_clocks(struct snd_soc_component *component,
-				      struct snd_pcm_hw_params *params)
+				      struct gx_stream *ts)
 {
 	struct aiu *aiu = snd_soc_component_get_drvdata(component);
-	unsigned int srate = params_rate(params);
 	unsigned int fs, bs;
 	int ret;
 
 	/* Get the oversampling factor */
-	fs = DIV_ROUND_CLOSEST(clk_get_rate(aiu->i2s.clks[MCLK].clk), srate);
+	fs = DIV_ROUND_CLOSEST(ts->iface->mclk_rate, ts->iface->rate);
 
 	if (fs % 64)
 		return -EINVAL;
 
-	/* Send data MSB first */
-	snd_soc_component_update_bits(component, AIU_I2S_DAC_CFG,
-				      AIU_I2S_DAC_CFG_MSB_FIRST,
-				      AIU_I2S_DAC_CFG_MSB_FIRST);
-
 	/* Set bclk to lrlck ratio */
 	snd_soc_component_update_bits(component, AIU_CODEC_DAC_LRCLK_CTRL,
 				      AIU_CODEC_DAC_LRCLK_CTRL_DIV,
@@ -169,9 +165,9 @@ static int aiu_encoder_i2s_set_clocks(struct snd_soc_component *component,
 	bs = fs / 64;
 
 	if (aiu->platform->has_clk_ctrl_more_i2s_div)
-		ret = aiu_encoder_i2s_set_more_div(component, params, bs);
+		ret = aiu_encoder_i2s_set_more_div(component, ts, bs);
 	else
-		ret = aiu_encoder_i2s_set_legacy_div(component, params, bs);
+		ret = aiu_encoder_i2s_set_legacy_div(component, ts, bs);
 
 	if (ret)
 		return ret;
@@ -188,25 +184,55 @@ static int aiu_encoder_i2s_hw_params(struct snd_pcm_substream *substream,
 				     struct snd_pcm_hw_params *params,
 				     struct snd_soc_dai *dai)
 {
+	struct gx_stream *ts = snd_soc_dai_get_dma_data(dai, substream);
+	struct gx_iface *iface = ts->iface;
 	struct snd_soc_component *component = dai->component;
 	int ret;
 
-	/* Disable the clock while changing the settings */
-	aiu_encoder_i2s_divider_enable(component, false);
+	/* Enforce interface wide rate symmetry. */
+	if (iface->rate && (iface->rate != params_rate(params))) {
+		dev_err(dai->dev, "can't set iface rate (%d != %d)\n",
+			iface->rate, params_rate(params));
+		return -EINVAL;
+	}
+
+	iface->rate = params_rate(params);
+	ts->physical_width = params_physical_width(params);
+	ts->width = params_width(params);
+	ts->channels = params_channels(params);
 
 	ret = aiu_encoder_i2s_setup_desc(component, params);
 	if (ret) {
-		dev_err(dai->dev, "setting i2s desc failed\n");
+		dev_err(dai->dev, "setting i2s desc failed: %d\n", ret);
 		return ret;
 	}
 
-	ret = aiu_encoder_i2s_set_clocks(component, params);
+	ret = aiu_encoder_i2s_set_clocks(component, ts);
 	if (ret) {
-		dev_err(dai->dev, "setting i2s clocks failed\n");
+		dev_err(dai->dev, "setting i2s clocks failed: %d\n", ret);
 		return ret;
 	}
 
-	aiu_encoder_i2s_divider_enable(component, true);
+	return 0;
+}
+
+static int aiu_encoder_i2s_prepare(struct snd_pcm_substream *substream,
+				   struct snd_soc_dai *dai)
+{
+	struct gx_stream *ts = snd_soc_dai_get_dma_data(dai, substream);
+	struct snd_soc_component *component = dai->component;
+	int ret;
+
+	if (ts->clk_enabled)
+		return 0;
+
+	ret = clk_prepare_enable(ts->iface->mclk);
+	if (ret)
+		return ret;
+
+	ts->clk_enabled = true;
+
+	aiu_encoder_i2s_divider_enable(component, 1);
 
 	return 0;
 }
@@ -214,9 +240,20 @@ static int aiu_encoder_i2s_hw_params(struct snd_pcm_substream *substream,
 static int aiu_encoder_i2s_hw_free(struct snd_pcm_substream *substream,
 				   struct snd_soc_dai *dai)
 {
+	struct gx_stream *ts = snd_soc_dai_get_dma_data(dai, substream);
 	struct snd_soc_component *component = dai->component;
 
-	aiu_encoder_i2s_divider_enable(component, false);
+	/*
+	 * Disable the i2s clock divider only if this is the last substream
+	 * being closed.
+	 */
+	if (snd_soc_dai_active(dai) <= 1)
+		aiu_encoder_i2s_divider_enable(component, 0);
+
+	if (ts->clk_enabled) {
+		clk_disable_unprepare(ts->iface->mclk);
+		ts->clk_enabled = false;
+	}
 
 	return 0;
 }
@@ -224,6 +261,8 @@ static int aiu_encoder_i2s_hw_free(struct snd_pcm_substream *substream,
 static int aiu_encoder_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 {
 	struct snd_soc_component *component = dai->component;
+	struct aiu *aiu = snd_soc_component_get_drvdata(component);
+	struct gx_iface *iface = &aiu->i2s.iface;
 	unsigned int inv = fmt & SND_SOC_DAIFMT_INV_MASK;
 	unsigned int val = 0;
 	unsigned int skew;
@@ -255,9 +294,12 @@ static int aiu_encoder_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		skew = 0;
 		break;
 	default:
+		dev_err(dai->dev, "unsupported dai format\n");
 		return -EINVAL;
 	}
 
+	iface->fmt = fmt;
+
 	val |= FIELD_PREP(AIU_CLK_CTRL_LRCLK_SKEW, skew);
 	snd_soc_component_update_bits(component, AIU_CLK_CTRL,
 				      AIU_CLK_CTRL_LRCLK_INVERT |
@@ -281,10 +323,14 @@ static int aiu_encoder_i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id,
 		return 0;
 
 	ret = clk_set_rate(aiu->i2s.clks[MCLK].clk, freq);
-	if (ret)
-		dev_err(dai->dev, "Failed to set sysclk to %uHz", freq);
+	if (ret) {
+		dev_err(dai->dev, "Failed to set sysclk to %uHz: %d", freq, ret);
+		return ret;
+	}
 
-	return ret;
+	aiu->i2s.iface.mclk_rate = freq;
+
+	return 0;
 }
 
 static const unsigned int hw_channels[] = {2, 8};
@@ -305,30 +351,126 @@ static int aiu_encoder_i2s_startup(struct snd_pcm_substream *substream,
 					 SNDRV_PCM_HW_PARAM_CHANNELS,
 					 &hw_channel_constraints);
 	if (ret) {
-		dev_err(dai->dev, "adding channels constraints failed\n");
+		dev_err(dai->dev, "adding channels constraints failed: %d\n", ret);
 		return ret;
 	}
 
-	ret = clk_bulk_prepare_enable(aiu->i2s.clk_num, aiu->i2s.clks);
-	if (ret)
-		dev_err(dai->dev, "failed to enable i2s clocks\n");
+	/*
+	 * Enable only clocks which are required for the interface internal
+	 * logic. MCLK is enabled/disabled from the formatter and the I2S
+	 * divider is enabled/disabled in "hw_params"/"hw_free", respectively.
+	 */
+	ret = clk_prepare_enable(aiu->i2s.clks[PCLK].clk);
+	if (ret) {
+		dev_err(dai->dev, "failed to enable PCLK: %d\n", ret);
+		return ret;
+	}
+	ret = clk_prepare_enable(aiu->i2s.clks[MIXER].clk);
+	if (ret) {
+		dev_err(dai->dev, "failed to enable MIXER: %d\n", ret);
+		clk_disable_unprepare(aiu->i2s.clks[PCLK].clk);
+		return ret;
+	}
+	ret = clk_prepare_enable(aiu->i2s.clks[AOCLK].clk);
+	if (ret) {
+		dev_err(dai->dev, "failed to enable AOCLK: %d\n", ret);
+		clk_disable_unprepare(aiu->i2s.clks[MIXER].clk);
+		clk_disable_unprepare(aiu->i2s.clks[PCLK].clk);
+		return ret;
+	}
 
-	return ret;
+	return 0;
 }
 
 static void aiu_encoder_i2s_shutdown(struct snd_pcm_substream *substream,
 				     struct snd_soc_dai *dai)
 {
 	struct aiu *aiu = snd_soc_component_get_drvdata(dai->component);
+	struct gx_stream *ts = snd_soc_dai_get_dma_data(dai, substream);
+	struct gx_iface *iface = ts->iface;
+
+	if (!snd_soc_dai_active(dai))
+		iface->rate = 0;
+
+	clk_disable_unprepare(aiu->i2s.clks[AOCLK].clk);
+	clk_disable_unprepare(aiu->i2s.clks[MIXER].clk);
+	clk_disable_unprepare(aiu->i2s.clks[PCLK].clk);
+}
 
-	clk_bulk_disable_unprepare(aiu->i2s.clk_num, aiu->i2s.clks);
+static int aiu_encoder_i2s_trigger(struct snd_pcm_substream *substream,
+				   int cmd,
+				   struct snd_soc_dai *dai)
+{
+	struct gx_stream *ts = snd_soc_dai_get_dma_data(dai, substream);
+	int ret;
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		ret = gx_stream_start(ts);
+		break;
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+	case SNDRV_PCM_TRIGGER_STOP:
+		gx_stream_stop(ts);
+		ret = 0;
+		break;
+	default:
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
+
+static int aiu_encoder_i2s_remove_dai(struct snd_soc_dai *dai)
+{
+	int stream;
+
+	for_each_pcm_streams(stream) {
+		struct gx_stream *ts = snd_soc_dai_dma_data_get(dai, stream);
+
+		if (ts)
+			gx_stream_free(ts);
+	}
+
+	return 0;
+}
+
+static int aiu_encoder_i2s_probe_dai(struct snd_soc_dai *dai)
+{
+	struct aiu *aiu = snd_soc_dai_get_drvdata(dai);
+	struct gx_iface *iface = &aiu->i2s.iface;
+	int stream;
+
+	for_each_pcm_streams(stream) {
+		struct gx_stream *ts;
+
+		if (!snd_soc_dai_get_widget(dai, stream))
+			continue;
+
+		ts = gx_stream_alloc(iface);
+		if (!ts) {
+			aiu_encoder_i2s_remove_dai(dai);
+			return -ENOMEM;
+		}
+		snd_soc_dai_dma_data_set(dai, stream, ts);
+	}
+
+	iface->mclk = aiu->i2s.clks[MCLK].clk;
+
+	return 0;
 }
 
 const struct snd_soc_dai_ops aiu_encoder_i2s_dai_ops = {
+	.probe		= aiu_encoder_i2s_probe_dai,
+	.remove		= aiu_encoder_i2s_remove_dai,
 	.hw_params	= aiu_encoder_i2s_hw_params,
+	.prepare	= aiu_encoder_i2s_prepare,
 	.hw_free	= aiu_encoder_i2s_hw_free,
 	.set_fmt	= aiu_encoder_i2s_set_fmt,
 	.set_sysclk	= aiu_encoder_i2s_set_sysclk,
 	.startup	= aiu_encoder_i2s_startup,
 	.shutdown	= aiu_encoder_i2s_shutdown,
+	.trigger	= aiu_encoder_i2s_trigger,
 };
diff --git a/sound/soc/meson/aiu.h b/sound/soc/meson/aiu.h
index 0f94c8bf608181112d78402532b832eb50c2d409..68310de0bdf7a97d8de2ff306c159248ee9b0ede 100644
--- a/sound/soc/meson/aiu.h
+++ b/sound/soc/meson/aiu.h
@@ -7,6 +7,8 @@
 #ifndef _MESON_AIU_H
 #define _MESON_AIU_H
 
+#include "gx-formatter.h"
+
 struct clk;
 struct clk_bulk_data;
 struct device;
@@ -25,6 +27,7 @@ struct aiu_interface {
 	struct clk_bulk_data *clks;
 	unsigned int clk_num;
 	int irq;
+	struct gx_iface iface;
 };
 
 struct aiu_platform_data {

-- 
2.39.5

