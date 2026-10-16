Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE9A47F3BD
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 10:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792146867; cv=none; b=lb0jjXutAXJ8Nkpp0e2sRbQogCpyWI3eprgjcgfRF6XeS9khK0aUMATf4patK96+1MpBkX/CpzsirFXWxL803q7X17AENzADIKywq4dhErcn/fyTP3bFYGBBXX8E7MWgMUd8YPNTTy14o1sO4m7vpUyjtaDQ1dfS1uaUesUgZTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792146867; c=relaxed/simple;
	bh=Zib/Tn/9dUZvXjtweZFxNuM8aRPoTdWFV7BmIZDwigk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D9zFT1+CMiubp2gVBxz0jKE1upav3GMuqJLQNyW1iMO5xYOJtm+oTcUCXmSYWAudHw0Yd7YDr3A1RpICRWbPQTBAhUiMc/A6TTNSyLnerlwHtoXZKitz157vnGyUIjttst+LOQ7v9OFDASZjxe4FMdRnt7EGswooBqvTic8XhTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=nyftLFnq; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="nyftLFnq"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1d484b4a9so97225e9.0
        for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 03:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1792146863; x=1792751663; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N4mHzpuyPPiZCfg7+PuclKsw29LzPIuraVJuXhPzW54=;
        b=nyftLFnqV7A/NgoezDU6Cs29l8XlLWS7Nr7+HJeI3MB/llAYLcnl6wFeQ/RhKoRP2e
         PV4OitlsmOa4KLEkSNMjJJe0sIgzCcdJ9jUVHhuY7P+NkaGSHnhcfSQSF4XSnUltpafU
         K5QnkpKHuXB/16vIioXKy52sxyZBvY1nn0ZJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792146863; x=1792751663;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N4mHzpuyPPiZCfg7+PuclKsw29LzPIuraVJuXhPzW54=;
        b=bBlYfTu66K6wP5N4BXNTxXR3FUY/JioM1AxT6/egMgr2oZHZAkEhsVZylEtNT5BwJk
         aYmKyfYuKC6rQ5GpAeKBqBikRZiogR1FFANHaviTHGhTSZ87zRRGyUnJcaLEk2FrrQ12
         kB+jkVh6HY8RzVmFbO+QrOS1TzW2Eb0M8442zkMt2/tH9nlpNaUvWfTR+zejGxJIlMm4
         27fAwuEnZjV+Z6FsXCofHKNEE3i0vmofsP5EtktlUYPs+KT4D08wlVH7wY8crfj5sJw2
         nIh9sSun9fp0Uxk3NwkRZpufeJCnFDQradBiOvYxt7lfFeQbmfgMLcsaxHeWzA9pvj+P
         LbrA==
X-Forwarded-Encrypted: i=1; AKwUvByjEdISOXrHnM/DVjIvPSfJSV8pB+txY9t69yOupjXUKWOIMiRZ6sonBK1jc388Vw3bioOTaxKqtioKOg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKf1R3r5AM1s64no7RzLh5iti9E42hjCP+FzeywEP6gb3Vhcrqx
	Qu2CeOHKDHAuvjyYrYKMi6+NR0KS7iTa+wz3U9YUHk26Zzvos8MQBBfTRq2/FSAyNtU=
X-Gm-Gg: AYBFou21zYBDV1bCMQZmiqFqwK/Cp6voqSx7JKWWufx5ATePAMrOK5Fi1oB79X7TSr5
	xSRF74RIth0rjk+AMq+tsBgwLI5sqm7/K93Chth+hyQwq01Mz/0apk1JicEXtMgZoTRaBTtw4Wo
	OKrfEtml52LJILzRLkcABJGENdJcrAn7isLxgiPiyAF4Zg4pmYkMIMqV9bFenKYwvBmNPeKevSJ
	JF14XzxGXm6qm8ucsUtBt7FjAGtNuyXQNZ8F55oNbYFgVKhgltApA5oXaVhZmqnbdzMy9TiKdnr
	GWj4TDf4AdOvhH7JdL0pbxgmPiceVIxhQOVubBm0888uVESx2Y8YXYKdRomX7jxGaq40zHV19WA
	5JDDPKr8kvk4L0VY9kuUGogNQG0Y9KfQ6eo7c6is7xfry1+L0xIaXqJSJTPVTA37eBVkVlAZ79a
	JqdUFkPhRzn/Y4rx0AIM+vZedljbUaUc5280gWGEuEt4n/I/yVM1e+9fYpzGGXoWhtEM2BjmcVP
	VrvbJtjyTqAo0p0AdykoNvNy1BGsmfGjZPrkf8kXiMw15xW/LJB3og=
X-Received: by 2002:a05:600c:350b:b0:4a1:ad01:f8dc with SMTP id 5b1f17b1804b1-4a1ad01f924mr232327175e9.21.1792146860670;
        Fri, 16 Oct 2026 03:34:20 -0700 (PDT)
Received: from localhost (dynamic-2a00-1028-8382-0206-0000-0000-0000-0bc0.ipv6.o2.cz. [2a00:1028:8382:206::bc0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9b35a6sm132651465e9.6.2026.10.16.03.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:34:20 -0700 (PDT)
From: =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>
Date: Fri, 16 Oct 2026 12:33:58 +0200
Subject: [PATCH v2 5/5] ASoC: pcm179x: Add support for pcm1975
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261016-work-v2-5-9340b9555fbb@amarulasolutions.com>
References: <20261016-work-v2-0-9340b9555fbb@amarulasolutions.com>
In-Reply-To: <20261016-work-v2-0-9340b9555fbb@amarulasolutions.com>
To: Peter Rosin <peda@lysator.liu.se>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Sen Wang <sen@ti.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
 Michael Trimarchi <michael@amarulasolutions.com>, 
 =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>
X-Mailer: b4 0.16.0

From: Michael Trimarchi <michael@amarulasolutions.com>

The PCM1795 is register compatible with the PCM1792A, but it encodes two
of the register 18 FMT[2:0] values differently: code 001 selects 32-bit
standard data instead of 20-bit, and code 100 selects 32-bit I2S instead
of 16-bit I2S. It has no 20-bit format at all. The PCM1796 shares the
PCM1792A encoding.

The model is read with device_get_match_data(), so each bus driver
carries the model in its own of_device_id table. The tables cannot move
to the common file: MODULE_DEVICE_TABLE() aliases a table that has to be
defined in the same translation unit.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Roman Smrž <roman@amarulasolutions.com>

---
Changes in v2:
- Added missing entry to spi_ids.
---
 sound/soc/codecs/pcm179x-i2c.c |  3 +-
 sound/soc/codecs/pcm179x-spi.c |  4 ++-
 sound/soc/codecs/pcm179x.c     | 62 ++++++++++++++++++++++++++++++++++++++----
 sound/soc/codecs/pcm179x.h     | 12 ++++++--
 4 files changed, 72 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/pcm179x-i2c.c b/sound/soc/codecs/pcm179x-i2c.c
index e81e20fadadf..751f4b74647a 100644
--- a/sound/soc/codecs/pcm179x-i2c.c
+++ b/sound/soc/codecs/pcm179x-i2c.c
@@ -32,7 +32,8 @@ static int pcm179x_i2c_probe(struct i2c_client *client)
 #ifdef CONFIG_OF
 static const struct of_device_id pcm179x_of_match[] = {
 	{ .compatible = "ti,pcm1792a", },
-	{ .compatible = "ti,pcm1796", },
+	{ .compatible = "ti,pcm1795", .data = (void *)PCM1795, },
+	{ .compatible = "ti,pcm1796", .data = (void *)PCM1796, },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, pcm179x_of_match);
diff --git a/sound/soc/codecs/pcm179x-spi.c b/sound/soc/codecs/pcm179x-spi.c
index 4b873f2986c7..a6c6ac1eb97b 100644
--- a/sound/soc/codecs/pcm179x-spi.c
+++ b/sound/soc/codecs/pcm179x-spi.c
@@ -31,13 +31,15 @@ static int pcm179x_spi_probe(struct spi_device *spi)
 
 static const struct of_device_id pcm179x_of_match[] __maybe_unused = {
 	{ .compatible = "ti,pcm1792a", },
-	{ .compatible = "ti,pcm1796" },
+	{ .compatible = "ti,pcm1795", .data = (void *)PCM1795, },
+	{ .compatible = "ti,pcm1796", .data = (void *)PCM1796, },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, pcm179x_of_match);
 
 static const struct spi_device_id pcm179x_spi_ids[] = {
 	{ "pcm1792a", 0 },
+	{ "pcm1795", 0 },
 	{ "pcm1796", 0 },
 	{ "pcm179x", 0 },
 	{ },
diff --git a/sound/soc/codecs/pcm179x.c b/sound/soc/codecs/pcm179x.c
index fae5de318b6e..8e9b9e98c8df 100644
--- a/sound/soc/codecs/pcm179x.c
+++ b/sound/soc/codecs/pcm179x.c
@@ -19,6 +19,7 @@
 #include <sound/soc.h>
 #include <sound/tlv.h>
 #include <linux/of.h>
+#include <linux/property.h>
 
 #include "pcm179x.h"
 
@@ -63,6 +64,7 @@ struct pcm179x_private {
 	struct regmap *regmap;
 	unsigned int format;
 	unsigned int rate;
+	enum pcm179x_type codec_model;
 };
 
 struct pcm179x_fmt_table {
@@ -71,7 +73,17 @@ struct pcm179x_fmt_table {
 	unsigned int value;	/* FMT[2:0] */
 };
 
-static const struct pcm179x_fmt_table pcm1792a_fmt[] = {
+/*
+ * Register 18 FMT[2:0] is not encoded the same way by every model: value 001
+ * and value 100 are 20-bit and 16-bit I2S on the PCM1792A/PCM1796 but 32-bit
+ * and 32-bit I2S on the PCM1795, and neither model has a 32-bit
+ * left-justified mode.
+ *
+ * The PCM1792A/PCM1796 have no 32-bit format at all, so a 32-bit container
+ * keeps the 24-bit value and is clocked out as 24-bit data, as this driver has
+ * always done. Only the PCM1795 has real 32-bit formats.
+ */
+static const struct pcm179x_fmt_table pcm179x_fmt[] = {
 	{ SND_SOC_DAIFMT_RIGHT_J, 16, 0 },
 	{ SND_SOC_DAIFMT_RIGHT_J, 24, 2 },
 	{ SND_SOC_DAIFMT_RIGHT_J, 32, 2 },
@@ -82,16 +94,53 @@ static const struct pcm179x_fmt_table pcm1792a_fmt[] = {
 	{ SND_SOC_DAIFMT_I2S,     32, 5 },
 };
 
+static const struct pcm179x_fmt_table pcm1795_fmt[] = {
+	{ SND_SOC_DAIFMT_RIGHT_J, 16, 0 },
+	{ SND_SOC_DAIFMT_RIGHT_J, 24, 2 },
+	{ SND_SOC_DAIFMT_RIGHT_J, 32, 1 },
+	{ SND_SOC_DAIFMT_LEFT_J,  24, 3 },
+	{ SND_SOC_DAIFMT_I2S,     24, 5 },
+	{ SND_SOC_DAIFMT_I2S,     32, 4 },
+};
+
+struct pcm179x_model {
+	u64 formats;
+	const struct pcm179x_fmt_table *fmt;
+	unsigned int num_fmt;
+};
+
+static const struct pcm179x_model pcm179x_models[] = {
+	[PCM1792A] = { PCM179X_FORMATS, pcm179x_fmt, ARRAY_SIZE(pcm179x_fmt) },
+	[PCM1795] = { PCM1795_FORMATS, pcm1795_fmt, ARRAY_SIZE(pcm1795_fmt) },
+	[PCM1796] = { PCM179X_FORMATS, pcm179x_fmt, ARRAY_SIZE(pcm179x_fmt) },
+};
+
 static int pcm179x_fmt_value(struct pcm179x_private *priv, unsigned int fmt,
 			     unsigned int width)
 {
-	for (unsigned int i = 0; i < ARRAY_SIZE(pcm1792a_fmt); i++)
-		if (pcm1792a_fmt[i].fmt == fmt && pcm1792a_fmt[i].width == width)
-			return pcm1792a_fmt[i].value;
+	const struct pcm179x_model *model = &pcm179x_models[priv->codec_model];
+	const struct pcm179x_fmt_table *fmt_tbl = model->fmt;
+
+	for (unsigned int i = 0; i < model->num_fmt; i++)
+		if (fmt_tbl[i].fmt == fmt && fmt_tbl[i].width == width)
+			return fmt_tbl[i].value;
 
 	return -EINVAL;
 }
 
+static int pcm179x_startup(struct snd_pcm_substream *substream,
+			   struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct pcm179x_private *priv = snd_soc_component_get_drvdata(component);
+	u64 formats = pcm179x_models[priv->codec_model].formats;
+
+	snd_pcm_hw_constraint_mask64(substream->runtime,
+				     SNDRV_PCM_HW_PARAM_FORMAT, formats);
+
+	return 0;
+}
+
 static int pcm179x_set_dai_fmt(struct snd_soc_dai *codec_dai,
                              unsigned int format)
 {
@@ -150,6 +199,7 @@ static const u64 pcm179x_selectable_formats =
 	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J;
 
 static const struct snd_soc_dai_ops pcm179x_dai_ops = {
+	.startup	= pcm179x_startup,
 	.set_fmt	= pcm179x_set_dai_fmt,
 	.hw_params	= pcm179x_hw_params,
 	.mute_stream	= pcm179x_mute,
@@ -191,7 +241,7 @@ static struct snd_soc_dai_driver pcm179x_dai = {
 		.rates = SNDRV_PCM_RATE_CONTINUOUS,
 		.rate_min = 10000,
 		.rate_max = 200000,
-		.formats = PCM1792A_FORMATS, },
+		.formats = PCM179X_FORMATS, },
 	.ops = &pcm179x_dai_ops,
 };
 
@@ -227,6 +277,8 @@ int pcm179x_common_init(struct device *dev, struct regmap *regmap)
 	if (!pcm179x)
 		return -ENOMEM;
 
+	pcm179x->codec_model =
+		(enum pcm179x_type)(uintptr_t)device_get_match_data(dev);
 	pcm179x->regmap = regmap;
 	dev_set_drvdata(dev, pcm179x);
 
diff --git a/sound/soc/codecs/pcm179x.h b/sound/soc/codecs/pcm179x.h
index 0039ca8ee742..33971fa93546 100644
--- a/sound/soc/codecs/pcm179x.h
+++ b/sound/soc/codecs/pcm179x.h
@@ -8,8 +8,16 @@
 #ifndef __PCM179X_H__
 #define __PCM179X_H__
 
-#define PCM1792A_FORMATS (SNDRV_PCM_FMTBIT_S32_LE | SNDRV_PCM_FMTBIT_S24_LE | \
-			  SNDRV_PCM_FMTBIT_S16_LE)
+enum pcm179x_type {
+	PCM1792A,
+	PCM1795,
+	PCM1796,
+};
+
+#define PCM179X_FORMATS (SNDRV_PCM_FMTBIT_S32_LE | SNDRV_PCM_FMTBIT_S24_LE | \
+			 SNDRV_PCM_FMTBIT_S16_LE)
+
+#define PCM1795_FORMATS (SNDRV_PCM_FMTBIT_S32_LE | SNDRV_PCM_FMTBIT_S24_LE)
 
 extern const struct regmap_config pcm179x_regmap_config;
 

-- 
2.55.0

