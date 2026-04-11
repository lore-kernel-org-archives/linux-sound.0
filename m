Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624C83890F0
	for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 14:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775919487; cv=none; b=ggf07WaxC75uYX8z/sAHcxQ+MRNAXO0kzHho6F9z9AeaYKvChkgY/3CjiImxNFFjt3K0kHT/iuWqpRPcNwzhWyJJsRApLeahx1gas638eDIw2Hv49ylqiTMXWM6uGs1Sbf2yY74UBrvPIRZLado0Io4fhHHjIqX8dNgb1IOMuIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775919487; c=relaxed/simple;
	bh=GvUUnavXTrTzCeaOmfiAqtoNpa4n5tFwZBrof78Pboc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VtESJQvOdXOpcWz95xj37eIQ/O+nQ/g9EBdj8RI0x6/C7iRdMjUsuIRtI7KONaRHMs8J4FFD8qehWOAqQW+UxVOiNmPTI1RKxpTT5unVdznRgXmyzaSJTvsFVWQnd8Dp8oroWUeS9rWiEjsRZWAk2zJi72rIofjYSq+dubTUG0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=QL0TnhRD; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="QL0TnhRD"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48897fd88ebso31789605e9.2
        for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 07:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775919484; x=1776524284; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ecSMrOBx0pzo4y3143wojd4syVHZTf/XbWi3AqukMso=;
        b=QL0TnhRDgYrvL9WuPQGwJuU0HhtRDT92hD4pCg3kjZQFt1RsnFOndeY7qQwwHGWB/c
         Ki3SYjcOZp4GhuSUTab2A/Y4yUng4X3xBIq0yqw5pT2LoV8u9E5PKsWCY68jYoW1keGp
         XC5fXb2Mgq4bsQBU2U0PGv1DjvwsIxX2Wux7pH3CE5GqjRUw9siFmGbGBi++p8NeVHwW
         R+qDfVylzpRwFL2NqEXBbk38ryeqMoYzAhSl0ohzUDYBmyCLLmtj2BAj39SUg8ebfnt7
         LSKussMp5lnjBt9KKAczoDeXf3UvAxyBG/9Mj6vcDgFvXM5CLkYDFWkR5v+IWtIqYWS3
         UixQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775919484; x=1776524284;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ecSMrOBx0pzo4y3143wojd4syVHZTf/XbWi3AqukMso=;
        b=I7UpDwpcbsspYIowvlWtQxGgIJmxOy21tGbJp1lJCBnyjMXhaIcG18SUyXswjy2z2T
         a811aBGkqFLV8Yo0JVFj2rK9FMLt0Wyz1fDFxAJD4j6HjCY9eRBt1qsfN30wOzKmFelF
         1AlHnMYOEigXDdgr2AM4aR/Vg1nFglOBX0q/SSdsc6Gl9PgJ66Hv6sCO7+yE6/5q5dCm
         P55OqbbdUO9STkILPxVf04P5LN35muSQsplMzEEU7zCzEVlbCH61+UMJFVA/gt0tTWLw
         AeZKJnXyAOYUdV+wbY2hXT4JRgK6pzM2bkRx65MfU7yraZDuK3Qq06KJLS8BUuaHY19H
         O9pA==
X-Forwarded-Encrypted: i=1; AJvYcCWQ3eQsiSVoxvnefVfIp6K9Lv4XAeoudmvh0K4OKUQk9uDAm+G4Qw4BieIlk/fygk8HDQWUFfXJ/r+Glw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBcxV97+L86ik4Einz/hZ3uo6w8FzEzryGfjrTJUc2BZPv1JUm
	gqnhJ1YSI/Dy0MxshVy7Ix1Hr92gYmyTpSHwhMd6CCQKTpbcjzwg7mBeCNudvWzjwsg=
X-Gm-Gg: AeBDiesbgY7ni0iMEPLJVusoby0Jfk4j95DqvGLILeEAJrizTrWtNPun0XFb/hgvttU
	8t4+yAvNyRS69CumlMFDHBUxV7pz72+rUzzyvFXKvyRUul8pgfw7OmgCu+qtFaG7p2T2EhynDwp
	OE5wHjSCAuYLZ0pNlBxeMSVQRUjTefkW2sMszlG7yFG9u8AaAUWre73Gw8hXlI+J6rGS7DZIRiY
	Lt3fLDBp5OzZVseUoNCW3cDPhar3etn9A+svAGBsVEsqIl7j+zvn1FHscBPBMT9Yg2uR2qneMdP
	N/iFu6ijjKapY8yYKifMFrjA4YE4x4VxkuPkIYJEacT08X8ylrb/TpI+ZxG7Nb5Vefqfkl5rX0p
	JSTZ2ov2et5JZkD4a4kOBO5BxeBTSM5fhiUaYCyautwzigM+euYgFB4Kk1Y2x0wAlFf4oFE3Q7l
	wL2B2VvDHQbr9DuzUbeIe6
X-Received: by 2002:a05:600c:3150:b0:488:c80c:c236 with SMTP id 5b1f17b1804b1-488d68057f3mr100729095e9.5.1775919483749;
        Sat, 11 Apr 2026 07:58:03 -0700 (PDT)
Received: from [127.0.1.1] ([151.61.248.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5dc7070sm48882375e9.10.2026.04.11.07.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 07:58:03 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Sat, 11 Apr 2026 16:57:29 +0200
Subject: [PATCH RFC v2 04/11] ASoC: meson: aiu: use aiu-formatter-i2s to
 format I2S output data
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-audin-rfc-v2-4-4c8a6ec5fcab@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6044; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=GvUUnavXTrTzCeaOmfiAqtoNpa4n5tFwZBrof78Pboc=;
 b=owGbwMvMwCF2z3ty7kUrRgbG02pJDJm3EoujFh9NYsnautmp8dAxR+7Vs6p+Mk29eWM2113x6
 v0WBxtSO0pZGMQ4GGTFFFlYpt/7XVCq9tA44WQBzBxWJpAhDFycAjCRPDaGv+JsavcKLCRMpnq7
 Vh9RLuvZdnKv8/Sw4ypmCxeJtznNWs/IcPC88j/JS+EO1450NvvHHSnfUnn7yZdlRnlH7T8qqGw
 4wwwA
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
index 76a33878b9df101ad62b18abd8cc14b7908c2c42..ce28850fde23f4fd1872c4364e13588138ba26ba 100644
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
@@ -194,12 +144,6 @@ static int aiu_encoder_i2s_hw_params(struct snd_pcm_substream *substream,
 	ts->width = params_width(params);
 	ts->channels = params_channels(params);
 
-	ret = aiu_encoder_i2s_setup_desc(component, params);
-	if (ret) {
-		dev_err(dai->dev, "setting i2s desc failed\n");
-		return ret;
-	}
-
 	ret = aiu_encoder_i2s_set_clocks(component, ts);
 	if (ret) {
 		dev_err(dai->dev, "setting i2s clocks failed\n");
diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
index f2890111c1d2cfa2213bf01849957a796744b9ae..bb3e0364190766ab4ce9ea3ebd313eecf220a244 100644
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
+		return ret;
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

