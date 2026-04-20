Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6361A9F9B;
	Mon, 20 Apr 2026 01:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776647631; cv=none; b=nw7MfNyzhMmuq3fjLeOaqiybmyxpq/CZKdQINsEnBC2byWiWANU0udZwuCuOlULXoHTTnC9bE7x26ICKkp/fS7VXvBYf2Ti6eFeHVsTQj3iU5BihSq5wLPZ1KFiJ7gAskWURH1uThhH4+Vem7TGP+S5LFwVv1J1nCWZ1Bw2tSMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776647631; c=relaxed/simple;
	bh=/w+Xiq7zUdSSywcl56gLZe1IFGo3eoMv3QpXVmcnwe0=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XLbnOlrLAaT8V3uUQumV+UBRX9Je04bdjKVtQpNBu55rViQCImEHgpBrNEWc2bwL8ZlyR8ZFaQXGCo8lEDrfrX2YRI1W1nTJfGv3lNVU7kMcFMhrqI/qQeuz1UP/A1P/jfVX7zlXrAW8nTgjP7rFcly6kC7wIqh7uH+d4wfllrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wEdCq-000000002Yl-1hdv;
	Mon, 20 Apr 2026 01:13:44 +0000
Date: Mon, 20 Apr 2026 02:13:41 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Arnd Bergmann <arnd@arndb.de>, Cyril Chao <Cyril.Chao@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 6/9] ASoC: mediatek: mt2701: add machine driver for
 on-chip HDMI codec
Message-ID: <91558321781ca8c18a5baf2146b0ba0a6d2b97bd.1776646435.git.daniel@makrotopia.org>
References: <cover.1776646435.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1776646435.git.daniel@makrotopia.org>

Add a simple ASoC machine driver that wires the MT2701/MT7623N
AFE HDMI playback path to the on-chip HDMI transmitter exposed
as a generic hdmi-audio-codec "i2s-hifi" DAI.

The driver binds to "mediatek,mt2701-hdmi-audio". MT7623N device
trees carry "mediatek,mt7623n-hdmi-audio" as a board-specific
fallback, matching the dt-binding.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v2: no changes

 sound/soc/mediatek/Kconfig              |  10 +++
 sound/soc/mediatek/mt2701/Makefile      |   1 +
 sound/soc/mediatek/mt2701/mt2701-hdmi.c | 114 ++++++++++++++++++++++++
 3 files changed, 125 insertions(+)
 create mode 100644 sound/soc/mediatek/mt2701/mt2701-hdmi.c

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 3a1e1fa3fe5cc..fa076e7854adc 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -26,6 +26,16 @@ config SND_SOC_MT2701_CS42448
 	  Select Y if you have such device.
 	  If unsure select "N".
 
+config SND_SOC_MT2701_HDMI
+	tristate "ASoC Audio driver for MT2701 with on-chip HDMI codec"
+	depends on SND_SOC_MT2701
+	select SND_SOC_HDMI_CODEC
+	help
+	  This adds the ASoC machine driver for MediaTek MT2701 and
+	  MT7623N boards routing the AFE I2S back-end to the on-chip
+	  HDMI transmitter via the generic HDMI codec.
+	  If unsure select "N".
+
 config SND_SOC_MT2701_WM8960
 	tristate "ASoc Audio driver for MT2701 with WM8960 codec"
 	depends on SND_SOC_MT2701 && I2C
diff --git a/sound/soc/mediatek/mt2701/Makefile b/sound/soc/mediatek/mt2701/Makefile
index 507fa26c39452..59623d3d3a038 100644
--- a/sound/soc/mediatek/mt2701/Makefile
+++ b/sound/soc/mediatek/mt2701/Makefile
@@ -5,4 +5,5 @@ obj-$(CONFIG_SND_SOC_MT2701) += snd-soc-mt2701-afe.o
 
 # machine driver
 obj-$(CONFIG_SND_SOC_MT2701_CS42448) += mt2701-cs42448.o
+obj-$(CONFIG_SND_SOC_MT2701_HDMI) += mt2701-hdmi.o
 obj-$(CONFIG_SND_SOC_MT2701_WM8960) += mt2701-wm8960.o
diff --git a/sound/soc/mediatek/mt2701/mt2701-hdmi.c b/sound/soc/mediatek/mt2701/mt2701-hdmi.c
new file mode 100644
index 0000000000000..a84907879c04e
--- /dev/null
+++ b/sound/soc/mediatek/mt2701/mt2701-hdmi.c
@@ -0,0 +1,114 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * mt2701-hdmi.c -- MT2701 HDMI ALSA SoC machine driver
+ *
+ * Copyright (c) 2026 Daniel Golle <daniel@makrotopia.org>
+ *
+ * Based on mt2701-cs42448.c
+ */
+
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <sound/soc.h>
+
+enum {
+	DAI_LINK_FE_HDMI_OUT,
+	DAI_LINK_BE_HDMI_I2S,
+};
+
+SND_SOC_DAILINK_DEFS(fe_hdmi_out,
+	DAILINK_COMP_ARRAY(COMP_CPU("PCM_HDMI")),
+	DAILINK_COMP_ARRAY(COMP_DUMMY()),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(be_hdmi_i2s,
+	DAILINK_COMP_ARRAY(COMP_CPU("HDMI I2S")),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "i2s-hifi")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+static struct snd_soc_dai_link mt2701_hdmi_dai_links[] = {
+	[DAI_LINK_FE_HDMI_OUT] = {
+		.name = "HDMI Playback",
+		.stream_name = "HDMI Playback",
+		.trigger = { SND_SOC_DPCM_TRIGGER_POST,
+			     SND_SOC_DPCM_TRIGGER_POST },
+		.dynamic = 1,
+		.playback_only = 1,
+		SND_SOC_DAILINK_REG(fe_hdmi_out),
+	},
+	[DAI_LINK_BE_HDMI_I2S] = {
+		.name = "HDMI BE",
+		.no_pcm = 1,
+		.playback_only = 1,
+		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
+			   SND_SOC_DAIFMT_CBC_CFC,
+		SND_SOC_DAILINK_REG(be_hdmi_i2s),
+	},
+};
+
+static struct snd_soc_card mt2701_hdmi_soc_card = {
+	.name = "mt2701-hdmi",
+	.owner = THIS_MODULE,
+	.dai_link = mt2701_hdmi_dai_links,
+	.num_links = ARRAY_SIZE(mt2701_hdmi_dai_links),
+};
+
+static int mt2701_hdmi_machine_probe(struct platform_device *pdev)
+{
+	struct snd_soc_card *card = &mt2701_hdmi_soc_card;
+	struct device *dev = &pdev->dev;
+	struct device_node *platform_node;
+	struct device_node *codec_node;
+	struct snd_soc_dai_link *dai_link;
+	int ret;
+	int i;
+
+	platform_node = of_parse_phandle(dev->of_node, "mediatek,platform", 0);
+	if (!platform_node)
+		return dev_err_probe(dev, -EINVAL,
+				     "Property 'mediatek,platform' missing\n");
+
+	for_each_card_prelinks(card, i, dai_link) {
+		if (dai_link->platforms->name)
+			continue;
+		dai_link->platforms->of_node = platform_node;
+	}
+
+	codec_node = of_parse_phandle(dev->of_node, "mediatek,audio-codec", 0);
+	if (!codec_node) {
+		of_node_put(platform_node);
+		return dev_err_probe(dev, -EINVAL,
+				     "Property 'mediatek,audio-codec' missing\n");
+	}
+	mt2701_hdmi_dai_links[DAI_LINK_BE_HDMI_I2S].codecs->of_node = codec_node;
+
+	card->dev = dev;
+
+	ret = devm_snd_soc_register_card(dev, card);
+
+	of_node_put(platform_node);
+	of_node_put(codec_node);
+	return ret;
+}
+
+static const struct of_device_id mt2701_hdmi_machine_dt_match[] = {
+	{ .compatible = "mediatek,mt2701-hdmi-audio" },
+	{ .compatible = "mediatek,mt7623n-hdmi-audio" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, mt2701_hdmi_machine_dt_match);
+
+static struct platform_driver mt2701_hdmi_machine = {
+	.driver = {
+		.name = "mt2701-hdmi",
+		.of_match_table = mt2701_hdmi_machine_dt_match,
+	},
+	.probe = mt2701_hdmi_machine_probe,
+};
+module_platform_driver(mt2701_hdmi_machine);
+
+MODULE_DESCRIPTION("MT2701 HDMI ALSA SoC machine driver");
+MODULE_AUTHOR("Daniel Golle <daniel@makrotopia.org>");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:mt2701-hdmi");
-- 
2.53.0
