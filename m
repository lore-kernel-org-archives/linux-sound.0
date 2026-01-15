Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C802F3621
	for <linux-sound@vger.kernel.org>; Thu, 15 Jan 2026 19:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768504704; cv=none; b=FZVrb89vR9BeLmNq8IXy5Kf9tdGU6XeWhhEdWWe7vv6SsqwOVqSANxcVWILkbKE/2EjEyYDaFvBDJesaV5K6nug/VJs9eWlm0pVTXgyWtp/z0QdlEmLF5t1lpMKpmBNNgXiKSJdFyYdHdnFYu3BGAYFpK2uMHFBVU3keZm9IXsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768504704; c=relaxed/simple;
	bh=KrPmfmoDlhB5aHZakfTJ0DcCmCsvnj5DBdRQf3ocXWI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g9j5Nx47UsIbcujfdeyF/v3bmHO+/6P1yyfWnaMZujwTGbwb7qrOZfAAwHpNnZNDz1XmHDgteouQ+7g1imtP/mz/A/AXk97hPckmAy0Ad5P5gS0BpYVTIl3F/PJ/qwlaogmXOmXjhUFezS7D0lrcee+YrDucfBPjrE/9XEXS4yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Am+0aRXI; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Am+0aRXI"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47edd6111b4so10952835e9.1
        for <linux-sound@vger.kernel.org>; Thu, 15 Jan 2026 11:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768504700; x=1769109500; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xc1juLftWyA1wDHyb+/Z3FwNIJ+75ZFh3R/kOCHvlHU=;
        b=Am+0aRXIXIvR3eK7Q/296RVakUfTb6QBs7fYfbi9uCJqiecjkNQvfRX9/thYdtmbjJ
         qAzsr/NdVyezUkFqnnYcdITq0MLZc330Tlpo3McBTu/pTVMyxiKeR1BOT9+zw8OjxiMn
         +tWia+Up/Hs541g6BeIwapOxLDbkVZc0iXAGFEgF4svBAiEZJ8/EGjMyj7voDnryFkPY
         xN7RB043NsA45mMnSxR7ct1KBe0Qt9HBJPFrcn4ZwEOPvsMSTfA9AQMxmgQrjNwlbrEu
         j0Hwf5/P/YVUzuvO02mGvNKwVyFwOx0F2Gmt+31QNxX/E3u/rZpYF0YHGBOgEnNAJWpM
         O9+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768504700; x=1769109500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xc1juLftWyA1wDHyb+/Z3FwNIJ+75ZFh3R/kOCHvlHU=;
        b=wYD7BDpWA2WVhxrPBf5HXV+tPxYIrBEV8lCzSS+s1V49QHUNHSMyAmjkZ8pRXx1Vhz
         xs3eT0DjfRWleEjDALoFrpv7L+zzzARmpWCWncNV7kP4LwaygOMs9AE4T/ulDHJhkCLz
         I+J7r8QnMpYWmqYtYJ4c75ebDa61yTkatvn4bhmPnSVtEGCVYu4Q5iXP5SHCHq0giiYV
         oxJYgUP83euSDPyncmSxwFNMLQnmqwW5FhK7sbI5naFOtoEtI9LN8QROv59hQfSJIp1k
         kvsDkuPeIAGF6rnJV5Hl8OoQS6Zpjv94kBxRhigdGfIao3V4m6Toi6Y7r3aqc1O3DnSP
         ZRjw==
X-Gm-Message-State: AOJu0YwSn3VunwsJSn1GFJqxNa9iQ9TNG/eDotqvH7bXLOUM2QZJ57+H
	E4CYvFghKnNngyTkaU8voQ2XR6c3QGmawZ/1GP95D8GsNJuAoiuJzLx6
X-Gm-Gg: AY/fxX7sfH6i14Qe0+rHhdfFl89A2OMVdVAnT6V6M72Js8jZdyq0KydwQ38VeW8ifze
	LQKmcNs00vHxEj5TRcdlAMDywLiduHHPdASS4EIukt7sPSalKVFAPeIBOIa4+Hss2fv/wgJYnOp
	rGNSzB6v5UMnWlUbj4ccyIZ3GVGGvswhxj6jdmu75akO0SPIoz5FotwRjSJiNhSsHwg1JydoE7/
	TD3YhYg5xaqLrnp1AAU9NOEPlH67CvlhoT7Medzl3ZSnJSFos4w1045A5hx+plPMAu3r2wYyXN7
	yCU7ys/etzeHC8tuTfzfwguk5Rha8QrGn1ltxHVE1m+2rpVItNLR05Wu+KqwIO8x9dNjSRwfhBl
	7xEkr3Y/s59G/cCigeJvtSFUZdxgiut0eVdQddcG8QGnFVNtQ8iWxF7+KCgft3szQbYTbsTk7CE
	DkArR/gxBy6a4BdJyQ76U7PgmBuigHdEsmss1UcAWKhpsUyPKYLbPB7H0=
X-Received: by 2002:a05:6000:4383:b0:431:9dd:2cca with SMTP id ffacd0b85a97d-4356997f0c2mr532115f8f.7.1768504699943;
        Thu, 15 Jan 2026 11:18:19 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569921dedsm692734f8f.9.2026.01.15.11.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 11:18:19 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Date: Thu, 15 Jan 2026 23:17:43 +0400
Subject: [PATCH 6/8] ASoC: sophgo: add CV1800B internal DAC codec driver
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-cv1800b-i2s-driver-v1-6-e8b22b8578ab@gmail.com>
References: <20260115-cv1800b-i2s-driver-v1-0-e8b22b8578ab@gmail.com>
In-Reply-To: <20260115-cv1800b-i2s-driver-v1-0-e8b22b8578ab@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 "Anton D. Stavinskii" <stavinsky@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768504677; l=7294;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=KrPmfmoDlhB5aHZakfTJ0DcCmCsvnj5DBdRQf3ocXWI=;
 b=4iVlJNPj0IUBoHXVhipUHhAxzzbmClMq/SoiDq3Kf5XuqRc/D9PKwiTGGrS3BrHRfQoKSjKT8
 HMjs7tQ0MBlCjw0HAcwo6edhkYtDhD1Quk2VjVYpIA0XHaza4Tzeetw
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=

Codec DAI endpoint for TXDAC + basic controls.

Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
 sound/soc/sophgo/Kconfig             |  11 +-
 sound/soc/sophgo/Makefile            |   1 +
 sound/soc/sophgo/cv1800b-sound-dac.c | 204 +++++++++++++++++++++++++++++++++++
 3 files changed, 215 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sophgo/Kconfig b/sound/soc/sophgo/Kconfig
index 813ab30d6da3..e7c617b44db6 100644
--- a/sound/soc/sophgo/Kconfig
+++ b/sound/soc/sophgo/Kconfig
@@ -23,10 +23,19 @@ config SND_SOC_CV1800B_ADC_CODEC
 	help
 	  This driver provides an ASoC codec DAI for capture and basic
 	  control of the RXADC registers.
-
 	  Say Y or M to build support for the Sophgo CV1800B
 	  internal analog ADC codec block (RXADC).
 	  The module will be called cv1800b-sound-adc
 
+config SND_SOC_CV1800B_DAC_CODEC
+	tristate "Sophgo CV1800B/SG2002 internal DAC codec"
+	depends on SND_SOC
+	help
+	  This driver provides an ASoC codec DAI for playback and basic
+	  control of the TXDAC registers.
+
+	  Say Y or M to build support for the Sophgo CV1800B
+	  internal analog DAC codec block (TXDAC).
+	  The module will be called cv1800b-sound-dac
 
 endmenu
diff --git a/sound/soc/sophgo/Makefile b/sound/soc/sophgo/Makefile
index c654d6059cbd..ec8dd31efddd 100644
--- a/sound/soc/sophgo/Makefile
+++ b/sound/soc/sophgo/Makefile
@@ -2,3 +2,4 @@
 # Sophgo Platform Support
 obj-$(CONFIG_SND_SOC_CV1800B_TDM) += cv1800b-tdm.o
 obj-$(CONFIG_SND_SOC_CV1800B_ADC_CODEC) += cv1800b-sound-adc.o
+obj-$(CONFIG_SND_SOC_CV1800B_DAC_CODEC) += cv1800b-sound-dac.o
diff --git a/sound/soc/sophgo/cv1800b-sound-dac.c b/sound/soc/sophgo/cv1800b-sound-dac.c
new file mode 100644
index 000000000000..ccf386174639
--- /dev/null
+++ b/sound/soc/sophgo/cv1800b-sound-dac.c
@@ -0,0 +1,204 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Internal DAC codec for cv1800b based CPUs
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <sound/soc.h>
+#include <linux/io.h>
+
+#define CV1800B_TXDAC_CTRL0   0x00
+#define CV1800B_TXDAC_CTRL1   0x04
+#define CV1800B_TXDAC_STATUS  0x08
+#define CV1800B_TXDAC_AFE0    0x0c
+#define CV1800B_TXDAC_AFE1    0x10
+#define CV1800B_TXDAC_ANA0    0x20
+#define CV1800B_TXDAC_ANA1    0x24
+#define CV1800B_TXDAC_ANA2    0x28
+
+/* cv1800b_TXDAC_CTRL0 */
+#define REG_TXDAC_EN GENMASK(0, 0)
+#define REG_I2S_RX_EN GENMASK(1, 1)
+
+/* cv1800b_TXDAC_CTRL1 */
+#define REG_TXDAC_CIC_OPT GENMASK(1, 0)
+
+/* cv1800b_TXDAC_AFE0 */
+#define REG_TXDAC_INIT_DLY_CNT GENMASK(5, 0)
+
+/* cv1800b_TXDAC_ANA2 */
+#define TXDAC_OW_VAL_L_MASK GENMASK(7, 0)
+#define TXDAC_OW_VAL_R_MASK GENMASK(15, 8)
+#define TXDAC_OW_EN_L_MASK GENMASK(16, 16)
+#define TXDAC_OW_EN_R_MASK GENMASK(17, 17)
+
+struct cv1800b_priv {
+	void __iomem *regs;
+	struct device *dev;
+};
+
+enum decimation_values {
+	DECIMATION_64 = 0,
+	DECIMATION_128,
+	DECIMATION_256,
+	DECIMATION_512,
+};
+
+static void cv1800b_dac_enable(struct cv1800b_priv *priv, bool enable)
+{
+	u32 val;
+
+	val = readl(priv->regs + CV1800B_TXDAC_CTRL0);
+	val = u32_replace_bits(val, enable, REG_TXDAC_EN);
+	val = u32_replace_bits(val, enable, REG_I2S_RX_EN);
+	writel(val, priv->regs + CV1800B_TXDAC_CTRL0);
+}
+
+static void cv1800b_dac_mute(struct cv1800b_priv *priv, bool enable)
+{
+	u32 val;
+
+	val = readl(priv->regs + CV1800B_TXDAC_ANA2);
+	val = u32_replace_bits(val, enable, TXDAC_OW_EN_L_MASK);
+	val = u32_replace_bits(val, enable, TXDAC_OW_EN_R_MASK);
+	writel(val, priv->regs + CV1800B_TXDAC_ANA2);
+}
+
+static int cv1800b_dac_decimation(struct cv1800b_priv *priv, u8 dec)
+{
+	u32 val;
+
+	if (dec > 3)
+		return -EINVAL;
+
+	val = readl(priv->regs + CV1800B_TXDAC_CTRL1);
+	val = u32_replace_bits(val, dec, REG_TXDAC_CIC_OPT);
+	writel(val, priv->regs + CV1800B_TXDAC_CTRL1);
+	return 0;
+}
+
+static int cv1800b_dac_dly(struct cv1800b_priv *priv, u32 dly)
+{
+	u32 val;
+
+	if (dly > 63)
+		return -EINVAL;
+
+	val = readl(priv->regs + CV1800B_TXDAC_AFE0);
+	val = u32_replace_bits(val, dly, REG_TXDAC_INIT_DLY_CNT);
+	writel(val, priv->regs + CV1800B_TXDAC_AFE0);
+	return 0;
+}
+
+static int cv1800b_dac_hw_params(struct snd_pcm_substream *substream,
+				 struct snd_pcm_hw_params *params,
+				 struct snd_soc_dai *dai)
+{
+	struct cv1800b_priv *priv = snd_soc_dai_get_drvdata(dai);
+	int ret;
+	unsigned int rate = params_rate(params);
+
+	if (rate != 48000) {
+		dev_err(priv->dev, "rate %u is not supported\n", rate);
+		return -EINVAL;
+	}
+
+	cv1800b_dac_mute(priv, false);
+	/* minimal decimation for 48kHz is 64*/
+	ret = cv1800b_dac_decimation(priv, DECIMATION_64);
+	if (ret)
+		return ret;
+
+	/* value is taken from vendors driver 48kHz
+	 * tested on sg2000 and sg2002.
+	 */
+	ret = cv1800b_dac_dly(priv, 0x19);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int cv1800b_dac_dai_trigger(struct snd_pcm_substream *substream, int cmd,
+				   struct snd_soc_dai *dai)
+{
+	struct cv1800b_priv *priv = snd_soc_dai_get_drvdata(dai);
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		cv1800b_dac_enable(priv, true);
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		cv1800b_dac_enable(priv, false);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct snd_soc_dai_ops cv1800b_dac_dai_ops = {
+	.hw_params = cv1800b_dac_hw_params,
+	.trigger = cv1800b_dac_dai_trigger,
+};
+
+static struct snd_soc_dai_driver cv1800b_dac_dai = {
+	.name = "dac-hifi",
+	.playback = { .stream_name = "DAC Playback",
+		      .channels_min = 2,
+		      .channels_max = 2,
+		      .rates = SNDRV_PCM_RATE_48000,
+		      .formats = SNDRV_PCM_FMTBIT_S16_LE },
+	.ops = &cv1800b_dac_dai_ops,
+};
+
+static const struct snd_soc_component_driver cv1800b_dac_component = {
+	.name = "cv1800b-dac-codec",
+};
+
+static int cv1800b_dac_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct cv1800b_priv *priv;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = dev;
+	priv->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->regs))
+		return PTR_ERR(priv->regs);
+
+	platform_set_drvdata(pdev, priv);
+	return devm_snd_soc_register_component(&pdev->dev,
+					       &cv1800b_dac_component,
+					       &cv1800b_dac_dai, 1);
+}
+
+static const struct of_device_id cv1800b_dac_of_match[] = {
+	{ .compatible = "sophgo,cv1800b-sound-dac" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, cv1800b_dac_of_match);
+
+static struct platform_driver cv1800b_dac_driver = {
+	.probe = cv1800b_dac_probe,
+	.driver = {
+		.name = "cv1800b-dac-codec",
+		.of_match_table = cv1800b_dac_of_match,
+	},
+};
+module_platform_driver(cv1800b_dac_driver);
+
+MODULE_DESCRIPTION("DAC codec for CV1800B");
+MODULE_AUTHOR("Anton D. Stavinskii <stavinsky@gmail.com>");
+MODULE_LICENSE("GPL");

-- 
2.43.0

