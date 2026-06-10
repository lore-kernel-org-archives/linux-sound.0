Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0263BBFC1
	for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 21:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781126983; cv=none; b=ZIcwxHCSLlOsPRkydnSNttChxyiw36xtRWvhD9jD4LKVTkXDTV2cluOBaEThHqIBw7kggWwD/ZivYSN1Kn/ZWcRqqAxfnKgUBPhxibGA9MqkJPoqPY1bF9ftAqozQOcVjt76wmsn74NqiT7xJcvFl8VlkzX/t1CCfRLpqL6kUjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781126983; c=relaxed/simple;
	bh=pgscRYSf0CnocgVAT3NBszrMFG6puvajLA4Nw2Ybqg0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fjEcGwF+3xUixuE7eaA0yb6cmhL9lg6ctHxPFrft3sxgDkA1eYm7g3nu9BDlrc6U9VwFFYIQr9plqTNHoRQvTE1Z+RbsOIzv5wEUo4QFKt+5qoKATuXSMFscu1lNLccf+z5mJlup9BseCLXG05wTPKSr2jSuuIIeZtlOssq5QE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=KUWVZKD5; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="KUWVZKD5"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-45fd464d51fso4025889f8f.3
        for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 14:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781126980; x=1781731780; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b5n/WB65Bulk0t5EdzRIcppU+woA0ls1FJjQ79kkwdI=;
        b=KUWVZKD5L87akKeEKfTTGhJWTaQ0MEJyQFUGlQt97xgCKD4auUlWQjfIuoNGOZPm41
         7HjyAOGojnXztjvxD+naW9WVJQEnHAaxQc993ZvsN8zqBbUCmr9iD9NlqDZe/sQc7Zcf
         DeqWwKiFJpDD4VZf5o12xrVANJHrK5YcctmY7GEgSUCuSBsv84Sb/0cGGWq/mnqSW0df
         gpI36ms8D3Jz89MfYo7TPX5pbZIY+xDtHPMZ6VA1Zq7mqc711n7QDA7aZOwqWJjOOOp5
         0Fj8PJx8kySVTd0Qw7/La906cNCdI+dupHCZzccSy0dt9JZTDcOZ/f555hEAipTF3hb+
         3Ong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781126980; x=1781731780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b5n/WB65Bulk0t5EdzRIcppU+woA0ls1FJjQ79kkwdI=;
        b=dTzZWI6m0FeuwNZFXAkV120vZarrnD3m4lZ216zSfdUmtivUKzYtnzEyauh+t6eWat
         f0rulhuTKmbEirG7F0mQa2beMbWo9w1dHiFTU6oZ/a6oNdGgDm2jhA1OLRCGE4YUyY6J
         Y8r2Dy+dYYAjAiCAtoldrfO5zHi4HWw6b/HgNZR+YMYuhcbaHbvN8Bj22GpRhsf1osj/
         4cs7+XEP3yBN3S2Xi5885/54gGN+4uz6YCBUPYUFWdY3XpBN7WMLrJwnsL7sg4/AQ/CB
         NysacDRd0G9zau72cwajpsxy63SrEFd/nxFPFdB89Dssir/MHVbTfapWySVGgFFoKf9h
         z9vQ==
X-Forwarded-Encrypted: i=1; AFNElJ/+YFEraQZ30z2zLLUviNkXfQPOa0u75A9eNs9i3aPRty9tgkxk9lJjDKGA4XQEYLjUJndYGg8/nC53gg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrsgK/rdri+anAQ6rI+aNfcqOgO+wl5cusC2WVAEn4MzGGIs38
	2hydgCJUX1oAquP1sgjIMEtIDqd6kz9YasnxRLNLGMV5HzMw5zY0VZXdlwT31mUnK0I=
X-Gm-Gg: Acq92OFhL9PXk5pcds52fs43ic+70ylSDgl0BA2V19TmTWX0WiH/P+ay3tuiMp3FztJ
	bIm40xgFcIdsIPY/wys4dy2kmv+GrWjsa9bSeB+UWvf2/JcmRlRVIY7GYLLBfwgKtrW1KAyDd37
	JRQgr76cw5QeEjYtYR4RrUbxFr0fYm/QjdTc35ceHlUyp+kMThdUc6cmwGSFOrh5WhBCAReU2yI
	LS1Vq62NE0LaCQ2U+oQZSL6/WUEbuUm5U8/88/kgiRgvzjQKwOoQm0HW82f8WhM+ptl07vyebsm
	WcN2FgH7o7VhI3FqsSxBXweMRSUiFgkPPMU/QpdcQWnh3wwObxRJPvCHlnHShL150XnxSCIcU/D
	E3roaRVB9FV0qbfHWTEdY1BUbkDPZ0PZp2pd2k9IIW8t82tuROinRrJZ8QGO2Lnnlr3ShsJIJNu
	Ngc2y+lYvY4hAhZAhwp1lVpwmS9OyOaX8=
X-Received: by 2002:a05:600c:6087:b0:48a:8b02:ae91 with SMTP id 5b1f17b1804b1-490c25b0231mr457881835e9.11.1781126980260;
        Wed, 10 Jun 2026 14:29:40 -0700 (PDT)
Received: from [127.0.1.1] ([151.61.238.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e4228768sm970965e9.0.2026.06.10.14.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 14:29:39 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Wed, 10 Jun 2026 23:29:26 +0200
Subject: [PATCH v2 2/4] ASoC: meson: aiu-encoder-i2s: prepare for multiple
 streams
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-reshape-aiu-as-axg-v2-2-cac3663a8b51@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11845; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=pgscRYSf0CnocgVAT3NBszrMFG6puvajLA4Nw2Ybqg0=;
 b=owGbwMvMwCF2z3ty7kUrRgbG02pJDFma1x02TC8IZFvQdb8z83t6V+eau8YT+x0X8e1X3xB0W
 HGns29oRykLgxgHg6yYIgvL9Hu/C0rVHhonnCyAmcPKBDKEgYtTACay/yrD/yR5g+UKK3f6POQs
 ldu/eMcTyQCPqh96qc65eZbX/2Wx1jAyXHn650n6esN/v7RN9LL6L8zVtrD9scFfet367wemJnr
 eZgUA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

aiu-encoder-i2s is going to be the interface that handles both playback
and capture, so this commit does all the required changes to prepare
for that since so far it only handled playback:
- probe/remove functions are added to allocate/free per stream data,
  respectively.
- 'struc gx_iface' and 'struct gx_stream' are used to store interface or
  stream associated data, respecively.
- interface wide rate symmetry is enforced.
- quirks on bclk are also enforced if/when necessary.

Clock-wise instead of bulk enabling all the clocks on startup and disabling
them on shutdown, only the peripheral's internal ones are enabled/disabled
in those functions, whereas MCLK and I2S clock divider are handled in
prepare/hw_free.

Finally a trigger() callback is also added to start/stop the associated
I2S data formatter.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/aiu-encoder-i2s.c | 207 ++++++++++++++++++++++++++++++++++----
 sound/soc/meson/aiu.h             |   3 +
 2 files changed, 193 insertions(+), 17 deletions(-)

diff --git a/sound/soc/meson/aiu-encoder-i2s.c b/sound/soc/meson/aiu-encoder-i2s.c
index 3b4061508c18047fe8d6f3f98061720f8ce238f2..f50b03824ad280afabb31eecc20ccb855defa11e 100644
--- a/sound/soc/meson/aiu-encoder-i2s.c
+++ b/sound/soc/meson/aiu-encoder-i2s.c
@@ -10,6 +10,8 @@
 #include <sound/soc-dai.h>
 
 #include "aiu.h"
+#include "gx-formatter.h"
+#include "gx-interface.h"
 
 #define AIU_I2S_SOURCE_DESC_MODE_8CH	BIT(0)
 #define AIU_I2S_SOURCE_DESC_MODE_24BIT	BIT(5)
@@ -112,6 +114,9 @@ static int aiu_encoder_i2s_set_more_div(struct snd_soc_component *component,
 					struct snd_pcm_hw_params *params,
 					unsigned int bs)
 {
+	struct aiu *aiu = snd_soc_component_get_drvdata(component);
+	struct gx_iface *iface = &aiu->i2s.iface;
+
 	/*
 	 * NOTE: this HW is odd.
 	 * In most configuration, the i2s divider is 'mclk / blck'.
@@ -126,6 +131,18 @@ static int aiu_encoder_i2s_set_more_div(struct snd_soc_component *component,
 			return -EINVAL;
 		}
 		bs += bs / 2;
+		iface->bs_quirk = true;
+	} else {
+		/*
+		 * If the bs quirk is currently applied for one stream and another
+		 * ones tries to setup a configuration for which the quirk is
+		 * not required, then fail.
+		 */
+		if (iface->bs_quirk) {
+			dev_err(component->dev,
+				"bclk requirements are incompatible with active stream\n");
+			return -EINVAL;
+		}
 	}
 
 	/* Use CLK_MORE for mclk to bclk divider */
@@ -145,14 +162,15 @@ static int aiu_encoder_i2s_set_clocks(struct snd_soc_component *component,
 				      struct snd_pcm_hw_params *params)
 {
 	struct aiu *aiu = snd_soc_component_get_drvdata(component);
+	struct gx_iface *iface = &aiu->i2s.iface;
 	unsigned int srate = params_rate(params);
 	unsigned int fs, bs;
 	int ret;
 
 	/* Get the oversampling factor */
-	fs = DIV_ROUND_CLOSEST(clk_get_rate(aiu->i2s.clks[MCLK].clk), srate);
+	fs = DIV_ROUND_CLOSEST(iface->mclk_rate, srate);
 
-	if (fs % 64)
+	if ((fs % 64) || (fs == 0))
 		return -EINVAL;
 
 	/* Send data MSB first */
@@ -188,24 +206,59 @@ static int aiu_encoder_i2s_hw_params(struct snd_pcm_substream *substream,
 				     struct snd_pcm_hw_params *params,
 				     struct snd_soc_dai *dai)
 {
+	struct gx_stream *ts = snd_soc_dai_get_dma_data(dai, substream);
+	struct gx_iface *iface = ts->iface;
 	struct snd_soc_component *component = dai->component;
 	int ret;
 
-	/* Disable the clock while changing the settings */
-	aiu_encoder_i2s_divider_enable(component, false);
+	/*
+	 * Enforce interface wide rate symmetry only if there is more than
+	 * 1 stream active.
+	 */
+	if (snd_soc_dai_active(dai) > 1) {
+		if (iface->rate && iface->rate != params_rate(params)) {
+			dev_err(dai->dev, "can't set iface rate (%d != %d)\n",
+				iface->rate, params_rate(params));
+			return -EINVAL;
+		}
+	}
 
 	ret = aiu_encoder_i2s_setup_desc(component, params);
 	if (ret) {
-		dev_err(dai->dev, "setting i2s desc failed\n");
+		dev_err(dai->dev, "setting i2s desc failed: %d\n", ret);
 		return ret;
 	}
 
 	ret = aiu_encoder_i2s_set_clocks(component, params);
 	if (ret) {
-		dev_err(dai->dev, "setting i2s clocks failed\n");
+		dev_err(dai->dev, "setting i2s clocks failed: %d\n", ret);
 		return ret;
 	}
 
+	iface->rate = params_rate(params);
+	ts->physical_width = params_physical_width(params);
+	ts->width = params_width(params);
+	ts->channels = params_channels(params);
+
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
 	aiu_encoder_i2s_divider_enable(component, true);
 
 	return 0;
@@ -214,9 +267,24 @@ static int aiu_encoder_i2s_hw_params(struct snd_pcm_substream *substream,
 static int aiu_encoder_i2s_hw_free(struct snd_pcm_substream *substream,
 				   struct snd_soc_dai *dai)
 {
+	struct gx_stream *ts = snd_soc_dai_get_dma_data(dai, substream);
+	struct gx_iface *iface = ts->iface;
 	struct snd_soc_component *component = dai->component;
 
-	aiu_encoder_i2s_divider_enable(component, false);
+	/*
+	 * If this is the last substream being closed then disable the i2s
+	 * clock divider and clear 'iface->rate'.
+	 */
+	if (snd_soc_dai_active(dai) <= 1) {
+		aiu_encoder_i2s_divider_enable(component, 0);
+		iface->rate = 0;
+		iface->bs_quirk = false;
+	}
+
+	if (ts->clk_enabled) {
+		clk_disable_unprepare(ts->iface->mclk);
+		ts->clk_enabled = false;
+	}
 
 	return 0;
 }
@@ -224,6 +292,8 @@ static int aiu_encoder_i2s_hw_free(struct snd_pcm_substream *substream,
 static int aiu_encoder_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 {
 	struct snd_soc_component *component = dai->component;
+	struct aiu *aiu = snd_soc_component_get_drvdata(component);
+	struct gx_iface *iface = &aiu->i2s.iface;
 	unsigned int inv = fmt & SND_SOC_DAIFMT_INV_MASK;
 	unsigned int val = 0;
 	unsigned int skew;
@@ -255,9 +325,12 @@ static int aiu_encoder_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
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
@@ -272,6 +345,7 @@ static int aiu_encoder_i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id,
 				      unsigned int freq, int dir)
 {
 	struct aiu *aiu = snd_soc_component_get_drvdata(dai->component);
+	struct gx_iface *iface = &aiu->i2s.iface;
 	int ret;
 
 	if (WARN_ON(clk_id != 0))
@@ -280,11 +354,15 @@ static int aiu_encoder_i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id,
 	if (dir == SND_SOC_CLOCK_IN)
 		return 0;
 
-	ret = clk_set_rate(aiu->i2s.clks[MCLK].clk, freq);
-	if (ret)
-		dev_err(dai->dev, "Failed to set sysclk to %uHz", freq);
+	ret = clk_set_rate(iface->mclk, freq);
+	if (ret) {
+		dev_err(dai->dev, "Failed to set sysclk to %uHz: %d", freq, ret);
+		return ret;
+	}
 
-	return ret;
+	iface->mclk_rate = freq;
+
+	return 0;
 }
 
 static const unsigned int hw_channels[] = {2, 8};
@@ -305,15 +383,35 @@ static int aiu_encoder_i2s_startup(struct snd_pcm_substream *substream,
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
@@ -321,14 +419,89 @@ static void aiu_encoder_i2s_shutdown(struct snd_pcm_substream *substream,
 {
 	struct aiu *aiu = snd_soc_component_get_drvdata(dai->component);
 
-	clk_bulk_disable_unprepare(aiu->i2s.clk_num, aiu->i2s.clks);
+	clk_disable_unprepare(aiu->i2s.clks[AOCLK].clk);
+	clk_disable_unprepare(aiu->i2s.clks[MIXER].clk);
+	clk_disable_unprepare(aiu->i2s.clks[PCLK].clk);
+}
+
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
+		struct gx_stream *ts;
+
+		ts = snd_soc_dai_dma_data_get(dai, stream);
+		if (ts)
+			gx_stream_free(ts);
+
+		snd_soc_dai_dma_data_set(dai, stream, NULL);
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
+	iface->mclk_rate = clk_get_rate(iface->mclk);
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

