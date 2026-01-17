Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B24C2E5B32
	for <linux-sound@vger.kernel.org>; Sat, 17 Jan 2026 20:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768681188; cv=none; b=SgngulsgZEsS973RN+DPm6MmhayIL9drRoU1MyXvWWw63Lo043/zh3i3R/mt7TWq0cWTxpDk6py7ley5OrBdEU9Ese6U96WKl3njd8ovsNuQtkIeNOcHDnrm2YQ556npN/Q6p1APc0xhXqECwxRNu/2ypLSYGJepDjhH6ChpUb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768681188; c=relaxed/simple;
	bh=Ry87fypYvNiXf2Do52FZjUNG5N0BLDgHQy32QFRln+Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mJUwaj1mzceT/HTkHPOM8kJ9LPp4Lr1KTZIqyaCZUI0mX35HFxK6B/G5RWD/mj7/1SOP8U9CzVJK8FmDcF6w5v/jJ2avBqqs9k2uU2YXbErflesn5Ag4vO0nWLzx1FFOuectb2zNb8+gReuujK3s7YiytvgFH0BGFHcIIdYEHgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CYLsQchZ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CYLsQchZ"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47edd6111b4so26636865e9.1
        for <linux-sound@vger.kernel.org>; Sat, 17 Jan 2026 12:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768681183; x=1769285983; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3M3zoQ0I/C+HXol0UHjaWQx8Rj1QNDs6zFN2pCrPidA=;
        b=CYLsQchZXDmQs3gUNksldC6Z5eFx3My7lElNOBxXPzz+1MKzbpN4BSNfjOHn3G17wS
         dhy2PRRtovuM25pyKppj7db12rU0OXjr/NLRAWBxqOgsAVVRMMBYcNBks/u4eYRzPBsn
         16sHg3GDExmjpOI1X7GhsmBrCgVEHzPaqO+zj8n2nNc0/irpBVSG6VoirKLfnV+En2af
         LF2pLx9I5jJAXdoPhvsNovxof3GG6LXg0YNoZu0DcoIgDqbR4zKyybXJ6HjZZJAgGCoE
         2MkACEpJHypuZLXokcR6/jlAxuTOHLasoHYOM/NOjiZAak3BFF/ATflKm7yxI2VVTfA/
         0KEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768681183; x=1769285983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3M3zoQ0I/C+HXol0UHjaWQx8Rj1QNDs6zFN2pCrPidA=;
        b=F6xmoW12bwqGCjk4XkQLdKgW8eUXPZljP2rkq1cJpG7oT6Td5yx3aDskznEe1g1eeZ
         QktmmEQ7vm/5cp06N2+73YBEQvi/5TbnQAPfrvozsP94TgmCCvjUfiDG819yElBj+i60
         psFYJnIXI2hGf1oO53JNW0JeudMUj2RsyFHh3jZIolpz8g66lLU2ZPDseTAdPa4s/lmH
         uxS0XlTdZS/G0NyzFEGs8cld9vkq4pzv+eR+KuxMCsBMYQUfBbhU2xr2KzMhF3D/CPb5
         CxEIPLxksykbLMxBlDkXzX+2yx2FiAyfZY3BVbVLLtjHId+g1xSPJW1INQfnICJqgpKd
         od4Q==
X-Gm-Message-State: AOJu0Yyq1i2a8SZQYQHp7CncU/5axePm8xyi6miPpzffLH9pDNOCmINO
	KXablQqEi2CZGngzojmRuHGZ9+ubA/Q8ZLdDLFEdSjGodaPNAo2gxtEH
X-Gm-Gg: AY/fxX6Si4+A/oGzz0xAhzA3yTkUHfZ/R1BQk/KE0eAAGeGkuOte99ODOKG8/VvqD5G
	fzpy+GK1uKcRrASf2fCY3GKH5VY8bhXX9uPcQkBmCIwVoCfd5VhodcrpShKzjtg/J6E6aO+4Nm4
	FoYtVBR+zVC6vDcG+/4JnYE8uQ0Rze4hb+as76JDGZTfUgIGOCm0qhxnM+hANEzdh19iszcIXeJ
	L/13adJVMHo0MfSxPeUxW84EWuHf+xp3fj0psJxidLzvYTtXEi1nY6PkQEN2qoxk999vQvLKBpX
	VID/AvtoVc2dGKIZBsFhd5ABv1/RJUJ1AKTmjwLnbb1Fo9eytFxLe2iV7dSbE3ua1l2qMy8Ec/u
	7eeaUfU75nUCl6c65jpCWoNumhutAVilkLxPUeN3X8tdKwcZ1zV42Ecow8tz4p0rrGua6d5oOob
	isVW/V1WWa7QqPIb6D1oE5CJ3uorO/P2W7EaOB96zfEo70
X-Received: by 2002:a05:600c:3e08:b0:46e:3550:9390 with SMTP id 5b1f17b1804b1-4801e334384mr69858765e9.20.1768681182725;
        Sat, 17 Jan 2026 12:19:42 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e879542sm112402295e9.4.2026.01.17.12.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 12:19:42 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Date: Sun, 18 Jan 2026 00:18:58 +0400
Subject: [PATCH v2 6/7] ASoC: sophgo: add CV1800B internal DAC codec driver
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260118-cv1800b-i2s-driver-v2-6-d10055f68368@gmail.com>
References: <20260118-cv1800b-i2s-driver-v2-0-d10055f68368@gmail.com>
In-Reply-To: <20260118-cv1800b-i2s-driver-v2-0-d10055f68368@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768681160; l=7443;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=Ry87fypYvNiXf2Do52FZjUNG5N0BLDgHQy32QFRln+Q=;
 b=ued2nn31acFQjJYgLWHNrDxR3FILxTIpgxb6K2yEjB+F26VPN42E7lrSrcEeInLf/U2ajKXuG
 PIiF0Fe5pktDSQClDtzLM9pjs3BWDtuXax/hEcgbzJQoeLZj2Ou9qkU
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=

Codec DAI endpoint for TXDAC. The codec does only a few things
- set up decimation
- enable codec and I2S output
- ensures the driver doesn't have dac overwrite enabled. (unmute the
  output)

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

