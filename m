Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516B948B397
	for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 15:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778857888; cv=none; b=PBq3ZCgHWmF/6ByM2ymYRv4gy+hPbOTC/JNfRG9twZjECFCsC+oO9XsR4+GmAq6o9XX4ntVH18AK1PENEGphhkjJAY4pLNr+/ZBtKFPFK4zyENiSdAfWw0qF+QfkfnTBmBPurNxh3VlEyEbxo6bY8w5mqLcCYpl27kQZTiqbA4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778857888; c=relaxed/simple;
	bh=QAXbc3wWqSC9H0GdnYojichQpjbJWMTmLX6rrahyWPc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=coCZsMcKYYUOn+3b7dUZT5SoUgIPyT4pQhxDlmo9LCFd+lLY54UN4iTasUWg1X62u9+xu69YOtHUMG6PhqVEok/N4UXpV+u0eaIV1D8c1GS6xwOepSUHsd4GkqltccO0HzgUWgg0X01h/JqFUChq+RP3xN5EuYS3r/CIAS5oDrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=oQW+A0sK; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="oQW+A0sK"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso76304045e9.2
        for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 08:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778857880; x=1779462680; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C6mWlulhIjJ+KVaCp0+AQJ0i2SOXLwY0ch+ls2yqanI=;
        b=oQW+A0sK4SrCM/mh8pHP3toTvCgWgMMfGoZqD2qBH71UkbtimNHmwjk9U2K/VE8wLv
         hUoMO72gl4y8DUjNVR0zHnsznAWMHJyKU9SvwatSVF4gnqlj+KpodRDE7xjlxniIdSym
         NGN1jZOA9peLoLM8FfQEl/PwRS7gy/NOqBw9O9P2WRtflIWSD3ghqAZW+AJv80wHvnS0
         o4+U+jVByKDCY8TD7GOCmxXHEgP4Ojd9iJ8JO0qwDZiPio/M6QmvccXLrA5y0aYPsY40
         VHBugzDfvU9JiQx+qUtaq3F6zadQcioKeYA0X6KGX3apW/w/egzE8tp4CfegblaLjoAt
         33zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778857880; x=1779462680;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C6mWlulhIjJ+KVaCp0+AQJ0i2SOXLwY0ch+ls2yqanI=;
        b=lcg120CSMmdmBp+OLBDejPZco23YrRaishQbbX9nBnT3CcYdzjZomi3QsBqaKqunG4
         iWI6ytSgksVmFllqeIQvLNQHcJ2VNYB5j4prhRoTsXfQFiiaT0awY2qemhicZzUyOqkm
         FgGtn5J+i7wiuW5OPxw7Z8YZiR5o/QiII29mtDC6cCKSi9QLxEfkqf5AePAmURTesMfk
         U+RMUDimdpKp85dORBlxzb2PWtvvejHuXzuESaEpgS0b6iPBvIiU7ele3g9LZGrsyKZv
         FFzdvSxcL3w65zs5NxxtTpMhDGLmHUJQmIDFrCjd0QsvtGAe7bhbIw/VXsVPkj7oszq8
         mvew==
X-Forwarded-Encrypted: i=1; AFNElJ+cmBVMRTwFA7ruUFmdeD1lelldQYZXt0QpcHMwopBOVemaCiciDqPykMotJoo06ehxSFgJCi7sybOXTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVSoYrilLbHe3OsNHQGZWdbq9FSiH3ZOhOZevb6oDQWgIh2mA8
	HHuNdLt04sE8Lozf/NWl19wWTEvY7pcZ66nZB09uWBMKXcVWDs+l+GB+6YT9IOEEtik=
X-Gm-Gg: Acq92OGCHZihOaGujyUFUjsqlu3lLppJv4twACZbb1Y5GPAQwaeiztl9T793e07JAjA
	lVp6//waFI6hFxB+N57CUeuSLCuwuG0Fb54bCXPwX8y32c/dysW4gN2Q3rNMciUaHC7+1oNchl9
	bD/p4DNobc/z72+rtywENLwwq4b4o4RQ+UjwQ9wFSkCi2eJA0m6IWN3hRHj8lbe54FfhrhAijdw
	LALMaNvd729p53hPQtdxv9+yamdWpa6/Hy2crkDNUFlPvRThUKvznHOwhlLOgBDW4mZNXw4BLT3
	gToEJpDjmLPsiT3Li3qvC/0F0i3B4uEDOMnf4YmcXvWAiihRVA4JOJbvjnL0OaV3Q6Vo5s3vyte
	XQWMo+Soegb/AZ2Ot0exdTBlh+D0Y+GuHUo2LeMkr2xTg3tyCbQboosZ8AaJ4mR4iNqPYA+1A//
	0GvGYqXiY2i7Hbo626faDVOy4hKYH8ikY=
X-Received: by 2002:a05:600c:6992:b0:48e:6f39:f7be with SMTP id 5b1f17b1804b1-48fe60ea533mr59171235e9.10.1778857879891;
        Fri, 15 May 2026 08:11:19 -0700 (PDT)
Received: from [127.0.1.1] ([151.41.223.93])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a19c2dsm15262062f8f.21.2026.05.15.08.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 08:11:18 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Fri, 15 May 2026 17:10:40 +0200
Subject: [PATCH 4/4] ASoC: meson: aiu: use aiu-formatter-i2s to format I2S
 output data
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-reshape-aiu-as-axg-v1-4-53b457784ff3@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6060; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=QAXbc3wWqSC9H0GdnYojichQpjbJWMTmLX6rrahyWPc=;
 b=owGbwMvMwCF2z3ty7kUrRgbG02pJDFns5hO+L3dLkz56L3furj2Jsw65ZDWbeb8TihIUiDF6n
 TT3bf2pjlIWBjEOBlkxRRaW6fd+F5SqPTROOFkAM4eVCWQIAxenAExEUpLhr1i2b8Ud/8nHa6Qe
 pel9PSH3erOa49tdG7a4r3pygP39BhuGv+Lldy7t2Hp9pv5+Ri/mzxrxuq6eOjfv1rK+ETu4+dr
 KNdwA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

Create a new DAPM widget for "I2S formatter" and place it on the path
between FIFO and output DAI interface. Remove I2S output formatting code
from aiu-encoder-i2s since it's now implemented from aiu-formatter-i2s.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/aiu-encoder-i2s.c | 56 ---------------------------------------
 sound/soc/meson/aiu.c             | 30 ++++++++++++++++++---
 sound/soc/meson/aiu.h             |  1 +
 3 files changed, 27 insertions(+), 60 deletions(-)

diff --git a/sound/soc/meson/aiu-encoder-i2s.c b/sound/soc/meson/aiu-encoder-i2s.c
index 39accd396affb8beb49fa7cca394244730b24574..9f935a93aeab7a27f880fbde2d29041a4802e3a3 100644
--- a/sound/soc/meson/aiu-encoder-i2s.c
+++ b/sound/soc/meson/aiu-encoder-i2s.c
@@ -13,13 +13,6 @@
 #include "gx-formatter.h"
 #include "gx-interface.h"
 
-#define AIU_I2S_SOURCE_DESC_MODE_8CH	BIT(0)
-#define AIU_I2S_SOURCE_DESC_MODE_24BIT	BIT(5)
-#define AIU_I2S_SOURCE_DESC_MODE_32BIT	BIT(9)
-#define AIU_I2S_SOURCE_DESC_MODE_SPLIT	BIT(11)
-#define AIU_RST_SOFT_I2S_FAST		BIT(0)
-
-#define AIU_I2S_DAC_CFG_MSB_FIRST	BIT(2)
 #define AIU_CLK_CTRL_I2S_DIV_EN		BIT(0)
 #define AIU_CLK_CTRL_I2S_DIV		GENMASK(3, 2)
 #define AIU_CLK_CTRL_AOCLK_INVERT	BIT(6)
@@ -37,49 +30,6 @@ static void aiu_encoder_i2s_divider_enable(struct snd_soc_component *component,
 				      enable ? AIU_CLK_CTRL_I2S_DIV_EN : 0);
 }
 
-static int aiu_encoder_i2s_setup_desc(struct snd_soc_component *component,
-				      struct snd_pcm_hw_params *params)
-{
-	/* Always operate in split (classic interleaved) mode */
-	unsigned int desc = AIU_I2S_SOURCE_DESC_MODE_SPLIT;
-
-	/* Reset required to update the pipeline */
-	snd_soc_component_write(component, AIU_RST_SOFT, AIU_RST_SOFT_I2S_FAST);
-	snd_soc_component_read(component, AIU_I2S_SYNC);
-
-	switch (params_physical_width(params)) {
-	case 16: /* Nothing to do */
-		break;
-
-	case 32:
-		desc |= (AIU_I2S_SOURCE_DESC_MODE_24BIT |
-			 AIU_I2S_SOURCE_DESC_MODE_32BIT);
-		break;
-
-	default:
-		return -EINVAL;
-	}
-
-	switch (params_channels(params)) {
-	case 2: /* Nothing to do */
-		break;
-	case 8:
-		desc |= AIU_I2S_SOURCE_DESC_MODE_8CH;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	snd_soc_component_update_bits(component, AIU_I2S_SOURCE_DESC,
-				      AIU_I2S_SOURCE_DESC_MODE_8CH |
-				      AIU_I2S_SOURCE_DESC_MODE_24BIT |
-				      AIU_I2S_SOURCE_DESC_MODE_32BIT |
-				      AIU_I2S_SOURCE_DESC_MODE_SPLIT,
-				      desc);
-
-	return 0;
-}
-
 static int aiu_encoder_i2s_set_legacy_div(struct snd_soc_component *component,
 					  struct gx_stream *ts,
 					  unsigned int bs)
@@ -201,12 +151,6 @@ static int aiu_encoder_i2s_hw_params(struct snd_pcm_substream *substream,
 	ts->width = params_width(params);
 	ts->channels = params_channels(params);
 
-	ret = aiu_encoder_i2s_setup_desc(component, params);
-	if (ret) {
-		dev_err(dai->dev, "setting i2s desc failed: %d\n", ret);
-		return ret;
-	}
-
 	ret = aiu_encoder_i2s_set_clocks(component, ts);
 	if (ret) {
 		dev_err(dai->dev, "setting i2s clocks failed: %d\n", ret);
diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
index f2890111c1d2cfa2213bf01849957a796744b9ae..b09c2058eacaf2998d0d3cd6682910f94ec89912 100644
--- a/sound/soc/meson/aiu.c
+++ b/sound/soc/meson/aiu.c
@@ -29,13 +29,22 @@ static SOC_ENUM_SINGLE_DECL(aiu_spdif_encode_sel_enum, AIU_I2S_MISC,
 static const struct snd_kcontrol_new aiu_spdif_encode_mux =
 	SOC_DAPM_ENUM("SPDIF Buffer Src", aiu_spdif_encode_sel_enum);
 
-static const struct snd_soc_dapm_widget aiu_cpu_dapm_widgets[] = {
-	SND_SOC_DAPM_MUX("SPDIF SRC SEL", SND_SOC_NOPM, 0, 0,
-			 &aiu_spdif_encode_mux),
+#define AIU_WIDGET_SPDIF_SRC_SEL	0
+#define AIU_WIDGET_I2S_FORMATTER	1
+
+static struct snd_soc_dapm_widget aiu_cpu_dapm_widgets[] = {
+	[AIU_WIDGET_SPDIF_SRC_SEL] =
+		SND_SOC_DAPM_MUX("SPDIF SRC SEL", SND_SOC_NOPM, 0, 0,
+				 &aiu_spdif_encode_mux),
+	[AIU_WIDGET_I2S_FORMATTER] =
+		SND_SOC_DAPM_PGA_E("I2S Formatter", SND_SOC_NOPM, 0, 0, NULL, 0,
+				   gx_formatter_event,
+				   (SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_PRE_PMD)),
 };
 
 static const struct snd_soc_dapm_route aiu_cpu_dapm_routes[] = {
-	{ "I2S Encoder Playback", NULL, "I2S FIFO Playback" },
+	{ "I2S Formatter", NULL, "I2S FIFO Playback" },
+	{ "I2S Encoder Playback", NULL, "I2S Formatter" },
 	{ "SPDIF SRC SEL", "SPDIF", "SPDIF FIFO Playback" },
 	{ "SPDIF SRC SEL", "I2S", "I2S FIFO Playback" },
 	{ "SPDIF Encoder Playback", NULL, "SPDIF SRC SEL" },
@@ -172,6 +181,11 @@ static const struct regmap_config aiu_regmap_cfg = {
 	.max_register	= 0x2ac,
 };
 
+const struct gx_formatter_driver aiu_formatter_i2s_drv = {
+	.regmap_cfg	= &aiu_regmap_cfg,
+	.ops		= &aiu_formatter_i2s_ops,
+};
+
 static int aiu_clk_bulk_get(struct device *dev,
 			    const char * const *ids,
 			    unsigned int num,
@@ -291,6 +305,14 @@ static int aiu_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	/* Allocate the aiu-formatter into its widget */
+	ret = gx_formatter_create(dev, &aiu_cpu_dapm_widgets[AIU_WIDGET_I2S_FORMATTER],
+				  &aiu_formatter_i2s_drv, map);
+	if (ret) {
+		dev_err(dev, "Failed to allocate aiu formatter\n");
+		goto err;
+	}
+
 	/* Register the hdmi codec control component */
 	ret = aiu_hdmi_ctrl_register_component(dev);
 	if (ret) {
diff --git a/sound/soc/meson/aiu.h b/sound/soc/meson/aiu.h
index 68310de0bdf7a97d8de2ff306c159248ee9b0ede..7d0b98c1f351b3c526ca06c43a4c04ee5f4b6dfa 100644
--- a/sound/soc/meson/aiu.h
+++ b/sound/soc/meson/aiu.h
@@ -61,6 +61,7 @@ extern const struct snd_soc_dai_ops aiu_fifo_i2s_dai_ops;
 extern const struct snd_soc_dai_ops aiu_fifo_spdif_dai_ops;
 extern const struct snd_soc_dai_ops aiu_encoder_i2s_dai_ops;
 extern const struct snd_soc_dai_ops aiu_encoder_spdif_dai_ops;
+extern const struct gx_formatter_ops aiu_formatter_i2s_ops;
 
 #define AIU_IEC958_BPF			0x000
 #define AIU_958_MISC			0x010

-- 
2.39.5

