Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UGe7GZ6i"
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F38D3C4
	for <linux-sound@vger.kernel.org>; Mon,  4 Dec 2023 02:01:24 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2c9f7fe6623so14594051fa.3
        for <linux-sound@vger.kernel.org>; Mon, 04 Dec 2023 02:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701684083; x=1702288883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6ZudBhO/WCplbQCp3KVlqjf1fHRbAS/TfrewGCqAIPY=;
        b=UGe7GZ6i5Gk5Xty/f2kGTEcOZO4q4YI6F/ZTNBsgnXmWApJbEZ05e5KrZ7uLo1XZ0U
         +vA+hyxiqrBGpbgep+scL1qauA386N7bqrErYtC2w5cV/itesJkUlEmaTlvdUTnUPp80
         Ml2nRtWO3R2BmLt0nzif9+NyaH+GGysqPXkHxckXzM3V7wEwwqSuLBKQE0c9OEpNGlhI
         dCVp2FW4psPAZxKT8LAgLYkIT/3z9yLfjuqpyL0zWZoIyfLTsjaWT6DZ8AQL8TlUzQgF
         pkWZwiRPHPlHu4aD9H30sU1lItXG60hpwDANb5sA8u3/l4D9P6Ho9xQ9Oj3hojsVmMlw
         ckFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701684083; x=1702288883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ZudBhO/WCplbQCp3KVlqjf1fHRbAS/TfrewGCqAIPY=;
        b=WE+ldU+HqG2hO5m2h4WVwTLGfpe/u/SH9BTbpqyumlF7oxurlPNmFsZdHV18R2WSfn
         JoRR8TnKsHO7CBYTm/qjKTgV2b+PwA7GPm71XFliU1KCGgLst6kJSE6voZVFHm9kE53q
         TTvEh7wZHOuDZhShDLg334PiKDRls13OCrp/dlnMIJ1qkojBOPCbe7+JVnsSjp8r2b3F
         +BwB9Q+2k7szDj5O+PUYn6gAm/DNqB8WRVOz8qccDK1zwSRLo93TAuCyFKAvd71f/wXw
         7UDhEkInG+BD3WODwIioP+d0+42X0x7+35Sles1LA2jRAHi+BwetM8MZ7RqcvrIRCF3r
         uCqA==
X-Gm-Message-State: AOJu0YzzsJRGCM+EUOSMkJ2ma+nSgakmIgBVflZQXe1GEHWNsMSuHh9j
	AiNQynh5RYs6O+/l+p5+WRRulg==
X-Google-Smtp-Source: AGHT+IEDH45bXF+mWwkq6P/83Vxtzbob4paKWveQYD4Oa84mb7HX7jeUMe6GVsa5KVjC2XQoi2C8Xw==
X-Received: by 2002:a2e:82c3:0:b0:2c9:f7fb:4e0f with SMTP id n3-20020a2e82c3000000b002c9f7fb4e0fmr770674ljh.101.1701684082678;
        Mon, 04 Dec 2023 02:01:22 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id pj21-20020a170906d79500b00a188fe9563esm5065572ejb.131.2023.12.04.02.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 02:01:22 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] ASoC: qcom: Add x1e80100 sound machine driver
Date: Mon,  4 Dec 2023 11:01:15 +0100
Message-Id: <20231204100116.211898-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add sound machine driver for the soundcards on Qualcomm X1E80100 SoC,
supporting up to four channel audio playback over Soundwire bus.  The
driver is based on existing sc8280xp.c driver.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/qcom/Kconfig    |  12 +++
 sound/soc/qcom/Makefile   |   2 +
 sound/soc/qcom/x1e80100.c | 168 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 182 insertions(+)
 create mode 100644 sound/soc/qcom/x1e80100.c

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index e7b00d1d9e99..762491d6f2f2 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -221,4 +221,16 @@ config SND_SOC_SC7280
 	  SC7280 SoC-based systems.
 	  Say Y or M if you want to use audio device on this SoCs.
 
+config SND_SOC_X1E80100
+	tristate "SoC Machine driver for X1E80100 boards"
+	depends on QCOM_APR && SOUNDWIRE
+	depends on COMMON_CLK
+	select SND_SOC_QDSP6
+	select SND_SOC_QCOM_COMMON
+	select SND_SOC_QCOM_SDW
+	help
+	  Add support for audio on Qualcomm Technologies Inc.
+	  X1E80100 SoC-based systems.
+	  Say Y or M if you want to use audio device on this SoCs.
+
 endif #SND_SOC_QCOM
diff --git a/sound/soc/qcom/Makefile b/sound/soc/qcom/Makefile
index 254350d9dc06..34f3fcb8ee9a 100644
--- a/sound/soc/qcom/Makefile
+++ b/sound/soc/qcom/Makefile
@@ -29,6 +29,7 @@ snd-soc-sm8250-objs := sm8250.o
 snd-soc-sc8280xp-objs := sc8280xp.o
 snd-soc-qcom-common-objs := common.o
 snd-soc-qcom-sdw-objs := sdw.o
+snd-soc-x1e80100-objs := x1e80100.o
 
 obj-$(CONFIG_SND_SOC_STORM) += snd-soc-storm.o
 obj-$(CONFIG_SND_SOC_APQ8016_SBC) += snd-soc-apq8016-sbc.o
@@ -40,6 +41,7 @@ obj-$(CONFIG_SND_SOC_SDM845) += snd-soc-sdm845.o
 obj-$(CONFIG_SND_SOC_SM8250) += snd-soc-sm8250.o
 obj-$(CONFIG_SND_SOC_QCOM_COMMON) += snd-soc-qcom-common.o
 obj-$(CONFIG_SND_SOC_QCOM_SDW) += snd-soc-qcom-sdw.o
+obj-$(CONFIG_SND_SOC_X1E80100) += snd-soc-x1e80100.o
 
 #DSP lib
 obj-$(CONFIG_SND_SOC_QDSP6) += qdsp6/
diff --git a/sound/soc/qcom/x1e80100.c b/sound/soc/qcom/x1e80100.c
new file mode 100644
index 000000000000..c3c8bf7ffb5b
--- /dev/null
+++ b/sound/soc/qcom/x1e80100.c
@@ -0,0 +1,168 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2023, Linaro Limited
+
+#include <dt-bindings/sound/qcom,q6afe.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/soundwire/sdw.h>
+#include <sound/pcm.h>
+#include <sound/jack.h>
+#include <sound/soc.h>
+#include <sound/soc-dapm.h>
+
+#include "common.h"
+#include "qdsp6/q6afe.h"
+#include "sdw.h"
+
+struct x1e80100_snd_data {
+	bool stream_prepared[AFE_PORT_MAX];
+	struct snd_soc_card *card;
+	struct sdw_stream_runtime *sruntime[AFE_PORT_MAX];
+	struct snd_soc_jack jack;
+	bool jack_setup;
+};
+
+static int x1e80100_snd_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+
+	return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
+}
+
+static void x1e80100_snd_shutdown(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
+
+	data->sruntime[cpu_dai->id] = NULL;
+	sdw_release_stream(sruntime);
+}
+
+static int x1e80100_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
+				     struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_interval *rate = hw_param_interval(params,
+						      SNDRV_PCM_HW_PARAM_RATE);
+	struct snd_interval *channels = hw_param_interval(params,
+							  SNDRV_PCM_HW_PARAM_CHANNELS);
+
+	rate->min = rate->max = 48000;
+	switch (cpu_dai->id) {
+	case TX_CODEC_DMA_TX_0:
+	case TX_CODEC_DMA_TX_1:
+	case TX_CODEC_DMA_TX_2:
+	case TX_CODEC_DMA_TX_3:
+		channels->min = 1;
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int x1e80100_snd_hw_params(struct snd_pcm_substream *substream,
+				struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+
+	return qcom_snd_sdw_hw_params(substream, params, &data->sruntime[cpu_dai->id]);
+}
+
+static int x1e80100_snd_prepare(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
+
+	return qcom_snd_sdw_prepare(substream, sruntime,
+				    &data->stream_prepared[cpu_dai->id]);
+}
+
+static int x1e80100_snd_hw_free(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
+
+	return qcom_snd_sdw_hw_free(substream, sruntime,
+				    &data->stream_prepared[cpu_dai->id]);
+}
+
+static const struct snd_soc_ops x1e80100_be_ops = {
+	.startup = qcom_snd_sdw_startup,
+	.shutdown = x1e80100_snd_shutdown,
+	.hw_params = x1e80100_snd_hw_params,
+	.hw_free = x1e80100_snd_hw_free,
+	.prepare = x1e80100_snd_prepare,
+};
+
+static void x1e80100_add_be_ops(struct snd_soc_card *card)
+{
+	struct snd_soc_dai_link *link;
+	int i;
+
+	for_each_card_prelinks(card, i, link) {
+		if (link->no_pcm == 1) {
+			link->init = x1e80100_snd_init;
+			link->be_hw_params_fixup = x1e80100_be_hw_params_fixup;
+			link->ops = &x1e80100_be_ops;
+		}
+	}
+}
+
+static int x1e80100_platform_probe(struct platform_device *pdev)
+{
+	struct snd_soc_card *card;
+	struct x1e80100_snd_data *data;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	card = devm_kzalloc(dev, sizeof(*card), GFP_KERNEL);
+	if (!card)
+		return -ENOMEM;
+	/* Allocate the private data */
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	card->owner = THIS_MODULE;
+	card->dev = dev;
+	dev_set_drvdata(dev, card);
+	snd_soc_card_set_drvdata(card, data);
+
+	ret = qcom_snd_parse_of(card);
+	if (ret)
+		return ret;
+
+	card->driver_name = "x1e80100";
+	x1e80100_add_be_ops(card);
+
+	return devm_snd_soc_register_card(dev, card);
+}
+
+static const struct of_device_id snd_x1e80100_dt_match[] = {
+	{ .compatible = "qcom,x1e80100-sndcard", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, snd_x1e80100_dt_match);
+
+static struct platform_driver snd_x1e80100_driver = {
+	.probe  = x1e80100_platform_probe,
+	.driver = {
+		.name = "snd-x1e80100",
+		.of_match_table = snd_x1e80100_dt_match,
+	},
+};
+module_platform_driver(snd_x1e80100_driver);
+MODULE_AUTHOR("Srinivas Kandagatla <srinivas.kandagatla@linaro.org");
+MODULE_AUTHOR("Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>");
+MODULE_DESCRIPTION("Qualcomm X1E80100 ASoC Machine Driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1

