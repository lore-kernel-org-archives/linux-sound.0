Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5F64A7C92;
	Thu, 17 Sep 2026 22:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789685485; cv=none; b=HuJlFXw4sF0bCkwDwl8f9bKv2RFl9MOVr+MIUukCyCo1KXrTowAmSJjakFJ+ZYknMjbtiuN33FOKmgtsTSPI08vcWtaZ3CKbQKaTbjKwz05lWv+rIiYQxpimTeNRjNrJyfMGVRfN60ODYrnpokwdSCFuldu2yTaGW0rZtSHAwHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789685485; c=relaxed/simple;
	bh=LkA/6uoqr9lONOSa0befxH7OPmE+lM+VUYOTE0+vgus=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HNaDfvMpNPQ6w/ATk1sa7jc+k+Fdz0uFHAecfRN3tUMgkLYa6/Np+Qc2xWfbuLhzD52FDTApU+vionNRoRV/OPWN9cUksPy/p+S3S6LthF8l+f9Bn+moV4XOHY3ukdZ18Xpa/Ni7kGxMOKG3z+6OxfbiLdKf8k55/zK4R4ObExg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MKCjr8wp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MKCjr8wp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BC981F00893;
	Thu, 17 Sep 2026 22:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789685483;
	bh=yMe/fbktEToQ8q0b8CR104kDsJnWNrt/a1cQrf5v9f4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=MKCjr8wpI2tSbeOidDC/JV33duL4V1w0csu0EGoYM4WYczjOsUpMCiq5OrSRbDM0p
	 Gf8qrmfhcsEWEfzRw2GXf7T3e34MuqjEZwIF4cfqHhjOSJeEjQ1h+F6Et0OCjf4ksU
	 hg66Fz+KVmmOqWJiM+LnrHf+g3g5W1EU+DUmuiKNZ8fHPAL3ykFjeSM6wy4h0/3dKb
	 wAu56wkb7BkjpCoPeThVOzsxpi/6Q/+ucaWwMxvU6F3vAv8Scr02aaG/vWZhMQBYco
	 nGorFmPTAxEa6SSx0yStHqYQz+5UMwGNOXjylE6/e4ckcIaQcPaZKod8dtdx8f4wR6
	 PEv3SgVq7KxCw==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 18 Sep 2026 00:51:03 +0200
Subject: [PATCH v2 5/9] ASoC: ux500: Remove the MOP500 machine driver
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-ux500-simple-sound-v2-5-88d29416e3c3@kernel.org>
References: <20260918-ux500-simple-sound-v2-0-88d29416e3c3@kernel.org>
In-Reply-To: <20260918-ux500-simple-sound-v2-0-88d29416e3c3@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 mfd@lists.linux.dev, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

The Ux500 boards now use audio-graph-card2, so remove the machine driver
and its obsolete binding. The generic card obtains the DAI format,
clock roles, TDM layout and board routing from the device tree graphs.

Make the codec, MSP and DMA platform components part of the Ux500 ASoC
selection. These providers were previously selected indirectly by the
machine driver.

Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 sound/soc/ux500/Kconfig         |  23 +--
 sound/soc/ux500/Makefile        |   3 -
 sound/soc/ux500/mop500.c        | 167 ---------------
 sound/soc/ux500/mop500_ab8500.c | 437 ----------------------------------------
 sound/soc/ux500/mop500_ab8500.h |  17 --
 5 files changed, 7 insertions(+), 640 deletions(-)

diff --git a/sound/soc/ux500/Kconfig b/sound/soc/ux500/Kconfig
index 113058060350..f3c7c216267c 100644
--- a/sound/soc/ux500/Kconfig
+++ b/sound/soc/ux500/Kconfig
@@ -6,28 +6,19 @@ menuconfig SND_SOC_UX500
 	tristate "Ux500"
 	depends on SND_SOC
 	depends on MFD_DB8500_PRCMU
+	depends on AB8500_CORE && AB8500_GPADC
+	select SND_SOC_AB8500_CODEC
+	select SND_SOC_UX500_PLAT_MSP_I2S
+	select SND_SOC_UX500_PLAT_DMA
 	help
-		Say Y if you want to enable ASoC-support for
-		any of the Ux500 platforms (e.g. U8500).
+		Say Y if you want to enable ASoC support for Ux500 platforms
+		using the AB8500 or AB8505 codec.
 
 config SND_SOC_UX500_PLAT_MSP_I2S
 	tristate
 	depends on SND_SOC_UX500
 
 config SND_SOC_UX500_PLAT_DMA
-	tristate "Platform - DB8500 (DMA)"
+	tristate
 	depends on SND_SOC_UX500
 	select SND_SOC_GENERIC_DMAENGINE_PCM
-	help
-		Say Y if you want to enable the Ux500 platform-driver.
-
-config SND_SOC_UX500_MACH_MOP500
-	tristate "Machine - MOP500 (Ux500 + AB8500)"
-	depends on AB8500_CORE && AB8500_GPADC && SND_SOC_UX500
-	select SND_SOC_AB8500_CODEC
-	select SND_SOC_UX500_PLAT_MSP_I2S
-	select SND_SOC_UX500_PLAT_DMA
-	help
-		Select this to enable the MOP500 machine-driver.
-		This will enable platform-drivers for: Ux500
-		This will enable codec-drivers for: AB8500
diff --git a/sound/soc/ux500/Makefile b/sound/soc/ux500/Makefile
index a63787d9d664..83e7aeff70f8 100644
--- a/sound/soc/ux500/Makefile
+++ b/sound/soc/ux500/Makefile
@@ -6,6 +6,3 @@ obj-$(CONFIG_SND_SOC_UX500_PLAT_MSP_I2S) += snd-soc-ux500-plat-msp-i2s.o
 
 snd-soc-ux500-plat-dma-y := ux500_pcm.o
 obj-$(CONFIG_SND_SOC_UX500_PLAT_DMA) += snd-soc-ux500-plat-dma.o
-
-snd-soc-ux500-mach-mop500-y := mop500.o mop500_ab8500.o
-obj-$(CONFIG_SND_SOC_UX500_MACH_MOP500) += snd-soc-ux500-mach-mop500.o
diff --git a/sound/soc/ux500/mop500.c b/sound/soc/ux500/mop500.c
deleted file mode 100644
index 6d196b4b8802..000000000000
--- a/sound/soc/ux500/mop500.c
+++ /dev/null
@@ -1,167 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) ST-Ericsson SA 2012
- *
- * Author: Ola Lilja (ola.o.lilja@stericsson.com)
- *         for ST-Ericsson.
- */
-
-#include <asm/mach-types.h>
-
-#include <linux/module.h>
-#include <linux/io.h>
-#include <linux/spi/spi.h>
-#include <linux/of.h>
-
-#include <sound/soc.h>
-#include <sound/initval.h>
-
-#include "ux500_pcm.h"
-#include "ux500_msp_dai.h"
-
-#include "mop500_ab8500.h"
-
-/* Define the whole MOP500 soundcard, linking platform to the codec-drivers  */
-SND_SOC_DAILINK_DEFS(link1,
-	DAILINK_COMP_ARRAY(COMP_CPU("ux500-msp-i2s.1")),
-	DAILINK_COMP_ARRAY(COMP_CODEC("ab8500-codec.0", "ab8500-codec-dai.0")),
-	DAILINK_COMP_ARRAY(COMP_PLATFORM("ux500-msp-i2s.1")));
-
-SND_SOC_DAILINK_DEFS(link2,
-	DAILINK_COMP_ARRAY(COMP_CPU("ux500-msp-i2s.3")),
-	DAILINK_COMP_ARRAY(COMP_CODEC("ab8500-codec.0", "ab8500-codec-dai.1")),
-	DAILINK_COMP_ARRAY(COMP_PLATFORM("ux500-msp-i2s.3")));
-
-static struct snd_soc_dai_link mop500_dai_links[] = {
-	{
-		.name = "ab8500_0",
-		.stream_name = "ab8500_0",
-		.init = mop500_ab8500_machine_init,
-		.ops = mop500_ab8500_ops,
-		SND_SOC_DAILINK_REG(link1),
-	},
-	{
-		.name = "ab8500_1",
-		.stream_name = "ab8500_1",
-		.init = NULL,
-		.ops = mop500_ab8500_ops,
-		SND_SOC_DAILINK_REG(link2),
-	},
-};
-
-static struct snd_soc_card mop500_card = {
-	.name = "MOP500-card",
-	.owner = THIS_MODULE,
-	.probe = NULL,
-	.dai_link = mop500_dai_links,
-	.num_links = ARRAY_SIZE(mop500_dai_links),
-};
-
-static void mop500_of_node_put(void)
-{
-	int i;
-
-	for (i = 0; i < 2; i++)
-		of_node_put(mop500_dai_links[i].cpus->of_node);
-
-	/* Both links use the same codec, which is refcounted only once */
-	of_node_put(mop500_dai_links[0].codecs->of_node);
-}
-
-static int mop500_of_probe(struct snd_soc_card *card)
-{
-	struct device *dev = card->dev;
-	struct device_node *codec_np, *msp_np[2];
-	struct device_node *np = dev->of_node;
-	int i;
-
-	msp_np[0] = of_parse_phandle(np, "stericsson,cpu-dai", 0);
-	msp_np[1] = of_parse_phandle(np, "stericsson,cpu-dai", 1);
-	codec_np  = of_parse_phandle(np, "stericsson,audio-codec", 0);
-
-	if (!(msp_np[0] && msp_np[1] && codec_np)) {
-		dev_err(dev, "Phandle missing or invalid\n");
-		for (i = 0; i < 2; i++)
-			of_node_put(msp_np[i]);
-		of_node_put(codec_np);
-		return -EINVAL;
-	}
-
-	for (i = 0; i < 2; i++) {
-		mop500_dai_links[i].cpus->of_node = msp_np[i];
-		mop500_dai_links[i].cpus->dai_name = NULL;
-		mop500_dai_links[i].platforms->of_node = msp_np[i];
-		mop500_dai_links[i].platforms->name = NULL;
-		mop500_dai_links[i].codecs->of_node = codec_np;
-		mop500_dai_links[i].codecs->name = NULL;
-	}
-
-	snd_soc_of_parse_card_name(card, "stericsson,card-name");
-
-	return 0;
-}
-
-static int mop500_probe(struct platform_device *pdev)
-{
-	int ret;
-
-	dev_dbg(&pdev->dev, "%s: Enter.\n", __func__);
-
-	mop500_card.dev = &pdev->dev;
-
-	ret = mop500_of_probe(&mop500_card);
-	if (ret)
-		return ret;
-
-	dev_dbg(&pdev->dev, "%s: Card %s: Set platform drvdata.\n",
-		__func__, mop500_card.name);
-
-	snd_soc_card_set_drvdata(&mop500_card, NULL);
-
-	dev_dbg(&pdev->dev, "%s: Card %s: num_links = %d\n",
-		__func__, mop500_card.name, mop500_card.num_links);
-	dev_dbg(&pdev->dev, "%s: Card %s: DAI-link 0: name = %s\n",
-		__func__, mop500_card.name, mop500_card.dai_link[0].name);
-	dev_dbg(&pdev->dev, "%s: Card %s: DAI-link 0: stream_name = %s\n",
-		__func__, mop500_card.name,
-		mop500_card.dai_link[0].stream_name);
-
-	ret = snd_soc_register_card(&mop500_card);
-	if (ret)
-		dev_err(&pdev->dev,
-			"Error: snd_soc_register_card failed (%d)!\n", ret);
-
-	return ret;
-}
-
-static void mop500_remove(struct platform_device *pdev)
-{
-	struct snd_soc_card *card = platform_get_drvdata(pdev);
-
-	pr_debug("%s: Enter.\n", __func__);
-
-	snd_soc_unregister_card(card);
-	mop500_ab8500_remove(card);
-	mop500_of_node_put();
-}
-
-static const struct of_device_id snd_soc_mop500_match[] = {
-	{ .compatible = "stericsson,snd-soc-mop500", },
-	{},
-};
-MODULE_DEVICE_TABLE(of, snd_soc_mop500_match);
-
-static struct platform_driver snd_soc_mop500_driver = {
-	.driver = {
-		.name = "snd-soc-mop500",
-		.of_match_table = snd_soc_mop500_match,
-	},
-	.probe = mop500_probe,
-	.remove = mop500_remove,
-};
-
-module_platform_driver(snd_soc_mop500_driver);
-
-MODULE_LICENSE("GPL v2");
-MODULE_DESCRIPTION("ASoC MOP500 board driver");
-MODULE_AUTHOR("Ola Lilja");
diff --git a/sound/soc/ux500/mop500_ab8500.c b/sound/soc/ux500/mop500_ab8500.c
deleted file mode 100644
index feb683c55d11..000000000000
--- a/sound/soc/ux500/mop500_ab8500.c
+++ /dev/null
@@ -1,437 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) ST-Ericsson SA 2012
- *
- * Author: Ola Lilja <ola.o.lilja@stericsson.com>,
- *         Kristoffer Karlsson <kristoffer.karlsson@stericsson.com>
- *         for ST-Ericsson.
- */
-
-#include <linux/module.h>
-#include <linux/device.h>
-#include <linux/io.h>
-#include <linux/clk.h>
-#include <linux/mutex.h>
-
-#include <sound/soc.h>
-#include <sound/soc-dapm.h>
-#include <sound/pcm.h>
-#include <sound/pcm_params.h>
-
-#include "ux500_pcm.h"
-#include "ux500_msp_dai.h"
-#include "mop500_ab8500.h"
-#include "../codecs/ab8500-codec.h"
-
-#define TX_SLOT_MONO	0x0008
-#define TX_SLOT_STEREO	0x000a
-#define RX_SLOT_MONO	0x0001
-#define RX_SLOT_STEREO	0x0003
-#define TX_SLOT_8CH	0x00FF
-#define RX_SLOT_8CH	0x00FF
-
-#define DEF_TX_SLOTS	TX_SLOT_STEREO
-#define DEF_RX_SLOTS	RX_SLOT_MONO
-
-#define DRIVERMODE_NORMAL	0
-#define DRIVERMODE_CODEC_ONLY	1
-
-/* Slot configuration */
-static unsigned int tx_slots = DEF_TX_SLOTS;
-static unsigned int rx_slots = DEF_RX_SLOTS;
-
-/* Configuration consistency parameters */
-static DEFINE_MUTEX(mop500_ab8500_params_lock);
-static unsigned long mop500_ab8500_usage;
-static int mop500_ab8500_rate;
-static int mop500_ab8500_channels;
-
-/* Clocks */
-static const char * const enum_mclk[] = {
-	"SYSCLK",
-	"ULPCLK"
-};
-enum mclk {
-	MCLK_SYSCLK,
-	MCLK_ULPCLK,
-};
-
-static SOC_ENUM_SINGLE_EXT_DECL(soc_enum_mclk, enum_mclk);
-
-/* Private data for machine-part MOP500<->AB8500 */
-struct mop500_ab8500_drvdata {
-	/* Clocks */
-	enum mclk mclk_sel;
-	struct clk *clk_ptr_intclk;
-	struct clk *clk_ptr_sysclk;
-	struct clk *clk_ptr_ulpclk;
-};
-
-static inline const char *get_mclk_str(enum mclk mclk_sel)
-{
-	switch (mclk_sel) {
-	case MCLK_SYSCLK:
-		return "SYSCLK";
-	case MCLK_ULPCLK:
-		return "ULPCLK";
-	default:
-		return "Unknown";
-	}
-}
-
-static int mop500_ab8500_set_mclk(struct device *dev,
-				struct mop500_ab8500_drvdata *drvdata)
-{
-	int status;
-	struct clk *clk_ptr;
-
-	if (IS_ERR(drvdata->clk_ptr_intclk)) {
-		dev_err(dev,
-			"%s: ERROR: intclk not initialized!\n", __func__);
-		return -EIO;
-	}
-
-	switch (drvdata->mclk_sel) {
-	case MCLK_SYSCLK:
-		clk_ptr = drvdata->clk_ptr_sysclk;
-		break;
-	case MCLK_ULPCLK:
-		clk_ptr = drvdata->clk_ptr_ulpclk;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	if (IS_ERR(clk_ptr)) {
-		dev_err(dev, "%s: ERROR: %s not initialized!\n", __func__,
-			get_mclk_str(drvdata->mclk_sel));
-		return -EIO;
-	}
-
-	status = clk_set_parent(drvdata->clk_ptr_intclk, clk_ptr);
-	if (status)
-		dev_err(dev,
-			"%s: ERROR: Setting intclk parent to %s failed (ret = %d)!",
-			__func__, get_mclk_str(drvdata->mclk_sel), status);
-	else
-		dev_dbg(dev,
-			"%s: intclk parent changed to %s.\n",
-			__func__, get_mclk_str(drvdata->mclk_sel));
-
-	return status;
-}
-
-/*
- * Control-events
- */
-
-static int mclk_input_control_get(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_card *card = snd_kcontrol_chip(kcontrol);
-	struct mop500_ab8500_drvdata *drvdata =
-				snd_soc_card_get_drvdata(card);
-
-	ucontrol->value.enumerated.item[0] = drvdata->mclk_sel;
-
-	return 0;
-}
-
-static int mclk_input_control_put(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_card *card = snd_kcontrol_chip(kcontrol);
-	struct mop500_ab8500_drvdata *drvdata =
-				snd_soc_card_get_drvdata(card);
-	unsigned int val = ucontrol->value.enumerated.item[0];
-
-	if (val > (unsigned int)MCLK_ULPCLK)
-		return -EINVAL;
-	if (drvdata->mclk_sel == val)
-		return 0;
-
-	drvdata->mclk_sel = val;
-
-	return 1;
-}
-
-/*
- * Controls
- */
-
-static struct snd_kcontrol_new mop500_ab8500_ctrls[] = {
-	SOC_ENUM_EXT("Master Clock Select",
-		soc_enum_mclk,
-		mclk_input_control_get, mclk_input_control_put),
-	SOC_DAPM_PIN_SWITCH("Headset Left"),
-	SOC_DAPM_PIN_SWITCH("Headset Right"),
-	SOC_DAPM_PIN_SWITCH("Earpiece"),
-	SOC_DAPM_PIN_SWITCH("Speaker Left"),
-	SOC_DAPM_PIN_SWITCH("Speaker Right"),
-	SOC_DAPM_PIN_SWITCH("LineOut Left"),
-	SOC_DAPM_PIN_SWITCH("LineOut Right"),
-	SOC_DAPM_PIN_SWITCH("Vibra 1"),
-	SOC_DAPM_PIN_SWITCH("Vibra 2"),
-	SOC_DAPM_PIN_SWITCH("Mic 1"),
-	SOC_DAPM_PIN_SWITCH("Mic 2"),
-	SOC_DAPM_PIN_SWITCH("LineIn Left"),
-	SOC_DAPM_PIN_SWITCH("LineIn Right"),
-	SOC_DAPM_PIN_SWITCH("DMic 1"),
-	SOC_DAPM_PIN_SWITCH("DMic 2"),
-	SOC_DAPM_PIN_SWITCH("DMic 3"),
-	SOC_DAPM_PIN_SWITCH("DMic 4"),
-	SOC_DAPM_PIN_SWITCH("DMic 5"),
-	SOC_DAPM_PIN_SWITCH("DMic 6"),
-};
-
-/* ASoC */
-
-static int mop500_ab8500_startup(struct snd_pcm_substream *substream)
-{
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-
-	/* Set audio-clock source */
-	return mop500_ab8500_set_mclk(rtd->card->dev,
-				snd_soc_card_get_drvdata(rtd->card));
-}
-
-static void mop500_ab8500_shutdown(struct snd_pcm_substream *substream)
-{
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct device *dev = rtd->card->dev;
-
-	dev_dbg(dev, "%s: Enter\n", __func__);
-
-	/* Reset slots configuration to default(s) */
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-		tx_slots = DEF_TX_SLOTS;
-	else
-		rx_slots = DEF_RX_SLOTS;
-}
-
-static int mop500_ab8500_hw_params(struct snd_pcm_substream *substream,
-			struct snd_pcm_hw_params *params)
-{
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
-	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-	struct device *dev = rtd->card->dev;
-	unsigned int fmt;
-	int channels, ret = 0, driver_mode, slots;
-	unsigned int sw_codec, sw_cpu;
-	bool is_playback;
-
-	dev_dbg(dev, "%s: Enter\n", __func__);
-
-	dev_dbg(dev, "%s: substream->pcm->name = %s\n"
-		"substream->pcm->id = %s.\n"
-		"substream->name = %s.\n"
-		"substream->number = %d.\n",
-		__func__,
-		substream->pcm->name,
-		substream->pcm->id,
-		substream->name,
-		substream->number);
-
-	/* Ensure configuration consistency between DAIs */
-	scoped_guard(mutex, &mop500_ab8500_params_lock) {
-		if (mop500_ab8500_usage) {
-			if (mop500_ab8500_rate != params_rate(params) ||
-			    mop500_ab8500_channels != params_channels(params)) {
-				return -EBUSY;
-			}
-		} else {
-			mop500_ab8500_rate = params_rate(params);
-			mop500_ab8500_channels = params_channels(params);
-		}
-		__set_bit(cpu_dai->id, &mop500_ab8500_usage);
-	}
-
-	channels = params_channels(params);
-
-	switch (params_format(params)) {
-	case SNDRV_PCM_FORMAT_S32_LE:
-		sw_cpu = 32;
-		break;
-
-	case SNDRV_PCM_FORMAT_S16_LE:
-		sw_cpu = 16;
-		break;
-
-	default:
-		return -EINVAL;
-	}
-
-	/* Setup codec depending on driver-mode */
-	if (channels == 8)
-		driver_mode = DRIVERMODE_CODEC_ONLY;
-	else
-		driver_mode = DRIVERMODE_NORMAL;
-	dev_dbg(dev, "%s: Driver-mode: %s.\n", __func__,
-		(driver_mode == DRIVERMODE_NORMAL) ? "NORMAL" : "CODEC_ONLY");
-
-	/* Setup format */
-
-	if (driver_mode == DRIVERMODE_NORMAL) {
-		fmt = SND_SOC_DAIFMT_DSP_A |
-			SND_SOC_DAIFMT_CBP_CFP |
-			SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CONT;
-	} else {
-		fmt = SND_SOC_DAIFMT_DSP_A |
-			SND_SOC_DAIFMT_CBP_CFP |
-			SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_GATED;
-	}
-
-	ret = snd_soc_runtime_set_dai_fmt(rtd, fmt);
-	if (ret)
-		return ret;
-
-	/* Setup TDM-slots */
-
-	is_playback = (substream->stream == SNDRV_PCM_STREAM_PLAYBACK);
-	switch (channels) {
-	case 1:
-		slots = 16;
-		tx_slots = (is_playback) ? TX_SLOT_MONO : 0;
-		rx_slots = (is_playback) ? 0 : RX_SLOT_MONO;
-		break;
-	case 2:
-		slots = 16;
-		tx_slots = (is_playback) ? TX_SLOT_STEREO : 0;
-		rx_slots = (is_playback) ? 0 : RX_SLOT_STEREO;
-		break;
-	case 8:
-		slots = 16;
-		tx_slots = (is_playback) ? TX_SLOT_8CH : 0;
-		rx_slots = (is_playback) ? 0 : RX_SLOT_8CH;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	if (driver_mode == DRIVERMODE_NORMAL)
-		sw_codec = sw_cpu;
-	else
-		sw_codec = 20;
-
-	dev_dbg(dev, "%s: CPU-DAI TDM: TX=0x%04X RX=0x%04x\n", __func__,
-		tx_slots, rx_slots);
-	ret = snd_soc_dai_set_tdm_slot(cpu_dai, tx_slots, rx_slots, slots,
-				sw_cpu);
-	if (ret)
-		return ret;
-
-	dev_dbg(dev, "%s: CODEC-DAI TDM: TX=0x%04X RX=0x%04x\n", __func__,
-		tx_slots, rx_slots);
-	ret = snd_soc_dai_set_tdm_slot(codec_dai, tx_slots, rx_slots, slots,
-				sw_codec);
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-static int mop500_ab8500_hw_free(struct snd_pcm_substream *substream)
-{
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-
-	guard(mutex)(&mop500_ab8500_params_lock);
-	__clear_bit(cpu_dai->id, &mop500_ab8500_usage);
-
-	return 0;
-}
-
-const struct snd_soc_ops mop500_ab8500_ops[] = {
-	{
-		.hw_params = mop500_ab8500_hw_params,
-		.hw_free = mop500_ab8500_hw_free,
-		.startup = mop500_ab8500_startup,
-		.shutdown = mop500_ab8500_shutdown,
-	}
-};
-
-int mop500_ab8500_machine_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(rtd->card);
-	struct device *dev = rtd->card->dev;
-	struct mop500_ab8500_drvdata *drvdata;
-	int ret;
-
-	dev_dbg(dev, "%s Enter.\n", __func__);
-
-	/* Create driver private-data struct */
-	drvdata = devm_kzalloc(dev, sizeof(struct mop500_ab8500_drvdata),
-			GFP_KERNEL);
-
-	if (!drvdata)
-		return -ENOMEM;
-
-	snd_soc_card_set_drvdata(rtd->card, drvdata);
-
-	/* Setup clocks */
-
-	drvdata->clk_ptr_sysclk = clk_get(dev, "sysclk");
-	if (IS_ERR(drvdata->clk_ptr_sysclk))
-		dev_warn(dev, "%s: WARNING: clk_get failed for 'sysclk'!\n",
-			__func__);
-	drvdata->clk_ptr_ulpclk = clk_get(dev, "ulpclk");
-	if (IS_ERR(drvdata->clk_ptr_ulpclk))
-		dev_warn(dev, "%s: WARNING: clk_get failed for 'ulpclk'!\n",
-			__func__);
-	drvdata->clk_ptr_intclk = clk_get(dev, "intclk");
-	if (IS_ERR(drvdata->clk_ptr_intclk))
-		dev_warn(dev, "%s: WARNING: clk_get failed for 'intclk'!\n",
-			__func__);
-
-	/* Set intclk default parent to ulpclk */
-	drvdata->mclk_sel = MCLK_ULPCLK;
-	ret = mop500_ab8500_set_mclk(dev, drvdata);
-	if (ret < 0)
-		dev_warn(dev, "%s: WARNING: mop500_ab8500_set_mclk!\n",
-			__func__);
-
-	drvdata->mclk_sel = MCLK_ULPCLK;
-
-	/* Add controls */
-	ret = snd_soc_add_card_controls(rtd->card, mop500_ab8500_ctrls,
-			ARRAY_SIZE(mop500_ab8500_ctrls));
-	if (ret < 0) {
-		pr_err("%s: Failed to add machine-controls (%d)!\n",
-				__func__, ret);
-		return ret;
-	}
-
-	ret = snd_soc_dapm_disable_pin(dapm, "Earpiece");
-	ret |= snd_soc_dapm_disable_pin(dapm, "Speaker Left");
-	ret |= snd_soc_dapm_disable_pin(dapm, "Speaker Right");
-	ret |= snd_soc_dapm_disable_pin(dapm, "LineOut Left");
-	ret |= snd_soc_dapm_disable_pin(dapm, "LineOut Right");
-	ret |= snd_soc_dapm_disable_pin(dapm, "Vibra 1");
-	ret |= snd_soc_dapm_disable_pin(dapm, "Vibra 2");
-	ret |= snd_soc_dapm_disable_pin(dapm, "Mic 1");
-	ret |= snd_soc_dapm_disable_pin(dapm, "Mic 2");
-	ret |= snd_soc_dapm_disable_pin(dapm, "LineIn Left");
-	ret |= snd_soc_dapm_disable_pin(dapm, "LineIn Right");
-	ret |= snd_soc_dapm_disable_pin(dapm, "DMic 1");
-	ret |= snd_soc_dapm_disable_pin(dapm, "DMic 2");
-	ret |= snd_soc_dapm_disable_pin(dapm, "DMic 3");
-	ret |= snd_soc_dapm_disable_pin(dapm, "DMic 4");
-	ret |= snd_soc_dapm_disable_pin(dapm, "DMic 5");
-	ret |= snd_soc_dapm_disable_pin(dapm, "DMic 6");
-
-	return ret;
-}
-
-void mop500_ab8500_remove(struct snd_soc_card *card)
-{
-	struct mop500_ab8500_drvdata *drvdata = snd_soc_card_get_drvdata(card);
-
-	clk_put(drvdata->clk_ptr_sysclk);
-	clk_put(drvdata->clk_ptr_ulpclk);
-	clk_put(drvdata->clk_ptr_intclk);
-
-	snd_soc_card_set_drvdata(card, NULL);
-}
diff --git a/sound/soc/ux500/mop500_ab8500.h b/sound/soc/ux500/mop500_ab8500.h
deleted file mode 100644
index 98de80a9cc4f..000000000000
--- a/sound/soc/ux500/mop500_ab8500.h
+++ /dev/null
@@ -1,17 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (C) ST-Ericsson SA 2012
- *
- * Author: Ola Lilja <ola.o.lilja@stericsson.com>
- *         for ST-Ericsson.
- */
-
-#ifndef MOP500_AB8500_H
-#define MOP500_AB8500_H
-
-extern const struct snd_soc_ops mop500_ab8500_ops[];
-
-int mop500_ab8500_machine_init(struct snd_soc_pcm_runtime *rtd);
-void mop500_ab8500_remove(struct snd_soc_card *card);
-
-#endif

-- 
2.55.0

