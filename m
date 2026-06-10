Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118FA3AB29E
	for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 23:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781135538; cv=none; b=CCDORAd54v0Fi+tO2yaSsOW9gWQLu4ynYMioCNJuD+mwDxU+K3IYf+2t8/GaHCfsCh2NgSIC01OwIftEhU0/G3eX5rg+nTHZLBjLKwe46jpJGRBhjpRwnKAPQJ0sbWilH/V158byQefHC/d0Q0hrIh3MFXsswPbxfAU/O9xXE5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781135538; c=relaxed/simple;
	bh=rDm6hph7aZq0i+MCXYhsZXtoTSo+SjOUgIX3bzYwMwc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iZzKefuM/0AkIbVUPU7uDeZPXoLCYsHRxotE5t5gdygsmTYPqngLsedJGQx2l9yq1D287Qhbh/P3HQo5PPtM3QyDR4HYXWYoU92rNpItMeJC4cAHsR01GiT0Ue/N3h80Yk7Xyf/KZLP3GjULnwDQo/DqUQnJiafUfE59NCYHmu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pmcqcfbt; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pmcqcfbt"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-bebac79fff8so790427966b.0
        for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 16:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781135533; x=1781740333; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mGyTY91nLZPNtfDSJSTO87aJBf+OSye5CcEbLTr/Fms=;
        b=pmcqcfbtFraK3gTN3og6RQWItFRR0Cc7B/8kcD0lVEY5obOBBFJG9aXGuuZNKkyqni
         u3W8bRvJxryhZ3kWg/xQrmJaVVk/ifZnvYav5lbwQ9T8uezZrQG6ih6zAATpms2yDJep
         DSy8DLtwE4KGgbQOK3eSPlQ96NHx4O1SkOmwpyzelO+bmNDxT5+rkvSejJ+j5YdGNuN4
         wtucPE7sg47RlwmTOMYI3rYkkrpDVMNUTBgH62K6EHc2cC1cHmFMXQ5M7tj+FKOhXyzM
         Ekiy58RbTMFe4PJ4pF3Qc5kp40d6sQ/tVFq0sZ+exd4wQEGMl1XFAATR9C3+BodeUBe2
         wz7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781135533; x=1781740333;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mGyTY91nLZPNtfDSJSTO87aJBf+OSye5CcEbLTr/Fms=;
        b=EZqEHHaRLIiCRIYtArdEsCjTSpLhn6nHjstVFz0/c5Oe5pY0GkDk6PD/jtiojRgZ8R
         SUqQR4nw+r98DVxTPWePlM7DMJzutR6/qhbm+CQB5sV1nP3KPdiEzBk7WAhmN6S23660
         28Thwt8tecqS2yN4jg/taHj78x71yb3iA0B+RsFJ/hOcyG1/uUdc++W0qe7qlL2Pl0dL
         +lamcVY8l9pklxSGXq7hrv+C1GoKgCeqF2RrJxTjsU527+QSIX2n0mTUEnCzo5bhD6RF
         np/808rDtkSImG38heQP5RamWY9NBFEbpU+aiDk4/viSA2NTrroU55JxquD2xmCmw9Ko
         LoXg==
X-Gm-Message-State: AOJu0Yw8XwVXRYCFxNxNsY8MCemcpXnncC/AwR1MVoOjj+GKqZR4nFrE
	MlxF9iA7gOVDhww0qpq7p3BqvAr2qrgwEP1YWMkGJRb712wK8eXEvrw3
X-Gm-Gg: Acq92OGGmIBIpdU5mxxAnTGvnAYI8PXWPhR4a0Azo68wxZfaH6RiAbz64UULwvQKr9X
	dvjxD59ir20hXyQKveBgx0VB6a5rhTxpSKDYCjFyDDMdkXJH60yW1PbtXgPE+wavYngD8xKIe1U
	GNll4kSDeM+SBS47jhPK/IQaYocT0dmYV9ZcGASZTY3TPeJPQBwCGxcSAxlZ4HTBLj0r4nB9GaA
	Ynf4JZLDalWVQ309Rc236up5asScKx64liR4nzeREYszddqJKegth3hTjZO0MUT0m+N7QeRDMxz
	C1SbSXfcOYgNdKbYfW8rqKjaGKBrBNTNf1vK5cIBjJoQFOyIC78anWPtBMo96ibyn3GxIW0FeGv
	YOzGYS2B0dNIVeaKAfgjQqc4ADyf9lkIahYs+vQhFtrcsP769fFILWqe6Jm1pKpqJiVKmIuFWWy
	5Y5rv4pcZqi+A7Zr8KUgp4sqc0PaDx
X-Received: by 2002:a17:907:94c7:b0:bed:5a4f:9fd9 with SMTP id a640c23a62f3a-bfc85745c5bmr2875666b.6.1781135532702;
        Wed, 10 Jun 2026 16:52:12 -0700 (PDT)
Received: from [127.0.1.1] ([46.251.53.180])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e03716sm1225741366b.34.2026.06.10.16.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 16:52:12 -0700 (PDT)
From: Yauhen Kharuzhy <jekhor@gmail.com>
Date: Thu, 11 Jun 2026 02:51:57 +0300
Subject: [PATCH v3 3/3] ASoC: Intel: Add cht_rt5677 driver
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-asoc-yogabook-v2-v3-3-3128447b67b6@gmail.com>
References: <20260611-asoc-yogabook-v2-v3-0-3128447b67b6@gmail.com>
In-Reply-To: <20260611-asoc-yogabook-v2-v3-0-3128447b67b6@gmail.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>, 
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hans de Goede <hansg@kernel.org>, Yauhen Kharuzhy <jekhor@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781135528; l=23354;
 i=jekhor@gmail.com; s=20260301; h=from:subject:message-id;
 bh=rDm6hph7aZq0i+MCXYhsZXtoTSo+SjOUgIX3bzYwMwc=;
 b=WGhL6TOft+jYkrWFN+Vs0yvhU0AUmB18kCw1Oe40ZvZjzV+oskU/gktC7j3osvTIqStL6XFE0
 Mz6tK3JMlnEA3tQ8UvP/abuumxh8+6+D1sBawLu3qvDwTXR1f07AqaN
X-Developer-Key: i=jekhor@gmail.com; a=ed25519;
 pk=C/csaZJs7UBNDgeJcUAmPu4ntqNeaZ3BKfBQiH8tuGc=

Add a new ASoC machine driver for Intel Cherry Trail platforms with
rt5677 codec.

It supports Lenovo Yoga Book tablets (YB1-X90F/L, YB1-X91F/L models) for
now and can be extended for other platforms.

This platform uses a Realtek ALC5677 codec accompanied by a TS3A227E jack
configuration detection IC.

The driver is based on the cht_bsw_rt5672.c mainline driver and the driver
from the vendor's Android kernel [1].

There are no other known Cherry Trail platforms using an RT5677 codec, so
some device-specific tricks are hardcoded, such as jack events and additional
GPIOs controlling the speaker amplifier.

[1] https://github.com/deadman96385/android_kernel_lenovo_yeti/blob/master/sound/soc/intel/board/cht_bl_dpcm_rt5677.c

Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
Assisted-by: Claude:claude-sonnet-4-6
---
 sound/soc/intel/boards/Kconfig                    |  18 +
 sound/soc/intel/boards/Makefile                   |   2 +
 sound/soc/intel/boards/cht_rt5677.c               | 564 ++++++++++++++++++++++
 sound/soc/intel/common/soc-acpi-intel-cht-match.c |  29 +-
 4 files changed, 590 insertions(+), 23 deletions(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index cddbd2aa424e..80633ca88612 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -198,6 +198,24 @@ config SND_SOC_INTEL_CHT_BSW_NAU8824_MACH
 	  Say Y or m if you have such a device. This is a recommended option.
 	  If unsure select "N".
 
+config SND_SOC_INTEL_CHT_RT5677_MACH
+	tristate "Cherrytrail with RT5677 codec"
+	depends on I2C && ACPI
+	depends on X86_INTEL_LPSS || COMPILE_TEST
+	depends on GPIOLIB || COMPILE_TEST
+	select SND_SOC_ACPI
+	select SND_SOC_RT5677
+	select SND_SOC_TS3A227E
+        help
+	  This adds support for ASoC machine driver for Intel(R) Cherrytrail
+	  platforms with RT5677 audio codec.
+
+	  The driver supports Lenovo Yoga Book tablets, models
+	  YB1-X90F, YB1-X90L, YB1-X91F, YB1-X91L. The jack detection IC TS3A227E
+	  is used.
+          Say Y or m if you have such a device. This is a recommended option.
+          If unsure select "N".
+
 config SND_SOC_INTEL_BYT_CHT_CX2072X_MACH
 	tristate "Baytrail & Cherrytrail with CX2072X codec"
 	depends on I2C && ACPI
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index 25a1a9066cbf..c5fa9ddaf438 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -12,6 +12,7 @@ snd-soc-sst-cht-bsw-rt5672-y := cht_bsw_rt5672.o
 snd-soc-sst-cht-bsw-rt5645-y := cht_bsw_rt5645.o
 snd-soc-sst-cht-bsw-max98090_ti-y := cht_bsw_max98090_ti.o
 snd-soc-sst-cht-bsw-nau8824-y := cht_bsw_nau8824.o
+snd-soc-sst-cht-rt5677-y := cht_rt5677.o
 snd-soc-sst-byt-cht-cx2072x-y := bytcht_cx2072x.o
 snd-soc-sst-byt-cht-da7213-y := bytcht_da7213.o
 snd-soc-sst-byt-cht-es8316-y := bytcht_es8316.o
@@ -42,6 +43,7 @@ obj-$(CONFIG_SND_SOC_INTEL_BYTCR_RT5651_MACH) += snd-soc-sst-bytcr-rt5651.o
 obj-$(CONFIG_SND_SOC_INTEL_BYTCR_WM5102_MACH) += snd-soc-sst-bytcr-wm5102.o
 obj-$(CONFIG_SND_SOC_INTEL_CHT_BSW_RT5672_MACH) += snd-soc-sst-cht-bsw-rt5672.o
 obj-$(CONFIG_SND_SOC_INTEL_CHT_BSW_RT5645_MACH) += snd-soc-sst-cht-bsw-rt5645.o
+obj-$(CONFIG_SND_SOC_INTEL_CHT_RT5677_MACH) += snd-soc-sst-cht-rt5677.o
 obj-$(CONFIG_SND_SOC_INTEL_CHT_BSW_MAX98090_TI_MACH) += snd-soc-sst-cht-bsw-max98090_ti.o
 obj-$(CONFIG_SND_SOC_INTEL_CHT_BSW_NAU8824_MACH) += snd-soc-sst-cht-bsw-nau8824.o
 obj-$(CONFIG_SND_SOC_INTEL_BYT_CHT_CX2072X_MACH) += snd-soc-sst-byt-cht-cx2072x.o
diff --git a/sound/soc/intel/boards/cht_rt5677.c b/sound/soc/intel/boards/cht_rt5677.c
new file mode 100644
index 000000000000..d4dc31c13e31
--- /dev/null
+++ b/sound/soc/intel/boards/cht_rt5677.c
@@ -0,0 +1,564 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ *  cht_rt5677.c - ASoc Machine driver for Intel Cherrytrail platforms with an
+ *  RT5677 audio codec.
+ *
+ *  The driver supports Lenovo Yoga Book YB1-X90/X91 tablets and has some
+ *  things hardcoded for these devices because there are no other known
+ *  devices using such a configuration.
+ *
+ *  Copyright (C) 2026 Yauhen Kharuzhy <jekhor@gmail.com>
+ *
+ *  Based on the mainline cht_bsw_rt5672.c and on the cht_bl_dpcm_rt5677.c
+ *  from Lenovo Android kernel.
+ */
+
+#include <linux/cleanup.h>
+#include <linux/clk.h>
+#include <linux/dmi.h>
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/machine.h>
+#include <linux/i2c.h>
+#include <linux/input.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <sound/jack.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc-acpi.h>
+#include <sound/soc.h>
+#include "../../codecs/rt5677.h"
+#include "../../codecs/ts3a227e.h"
+#include "../atom/sst-atom-controls.h"
+
+#define RT5677_I2C_DEFAULT	"i2c-rt5677"
+
+/* The platform clock #3 outputs 19.2Mhz clock to codec as I2S MCLK */
+#define CHT_PLAT_CLK_3_HZ	19200000
+#define CHT_CODEC_DAI		"rt5677-aif1"
+
+struct cht_rt5677_private {
+	struct snd_soc_card card;
+	char codec_name[SND_ACPI_I2C_ID_LEN];
+	struct snd_soc_jack jack;
+	struct clk *mclk;
+	struct gpio_desc *gpio_spk_en1;
+	struct gpio_desc *gpio_spk_en2;
+	struct gpio_desc *gpio_hp_en;
+};
+
+static int cht_rt5677_platform_clock_enable(struct snd_soc_card *card,
+					struct snd_soc_dai *codec_dai)
+{
+	struct cht_rt5677_private *ctx = snd_soc_card_get_drvdata(card);
+	int ret;
+
+	ret = clk_prepare_enable(ctx->mclk);
+	if (ret < 0) {
+		dev_err(card->dev, "could not configure MCLK state: %d\n", ret);
+		return ret;
+	}
+
+	/* set codec PLL source to the 19.2MHz platform clock (MCLK) */
+	ret = snd_soc_dai_set_pll(codec_dai, 0, RT5677_PLL1_S_MCLK,
+				  CHT_PLAT_CLK_3_HZ, 48000 * 512);
+	if (ret < 0) {
+		dev_err(card->dev, "can't set codec pll: %d\n", ret);
+		return ret;
+	}
+
+	/* set codec sysclk source to PLL */
+	ret = snd_soc_dai_set_sysclk(codec_dai, RT5677_SCLK_S_PLL1,
+				     48000 * 512, SND_SOC_CLOCK_IN);
+	if (ret < 0) {
+		dev_err(card->dev, "can't set codec sysclk: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void cht_rt5677_platform_clock_disable(struct snd_soc_card *card,
+					  struct snd_soc_dai *codec_dai)
+{
+	struct cht_rt5677_private *ctx = snd_soc_card_get_drvdata(card);
+
+	/* Set codec sysclk source to its internal clock because codec
+	 * PLL will be off when idle and MCLK will also be off by ACPI
+	 * when codec is runtime suspended. Codec needs clock for jack
+	 * detection and button press.
+	 */
+	snd_soc_dai_set_sysclk(codec_dai, RT5677_SCLK_S_RCCLK,
+			       48000 * 512, SND_SOC_CLOCK_IN);
+
+	clk_disable_unprepare(ctx->mclk);
+}
+
+static int cht_rt5677_platform_clock_control(struct snd_soc_dapm_widget *w,
+					 struct snd_kcontrol *kctl, int event)
+{
+	struct snd_soc_card *card = snd_soc_dapm_to_card(w->dapm);
+	struct snd_soc_dai *codec_dai;
+
+	codec_dai = snd_soc_card_get_codec_dai(card, CHT_CODEC_DAI);
+	if (!codec_dai) {
+		dev_err(card->dev,
+			"Codec dai not found; Unable to set platform clock\n");
+		return -EIO;
+	}
+
+	if (SND_SOC_DAPM_EVENT_ON(event))
+		return cht_rt5677_platform_clock_enable(card, codec_dai);
+
+	cht_rt5677_platform_clock_disable(card, codec_dai);
+
+	return 0;
+}
+
+static int cht_rt5677_hp_event(struct snd_soc_dapm_widget *w,
+			   struct snd_kcontrol *kctl, int event)
+{
+	struct snd_soc_card *card = snd_soc_dapm_to_card(w->dapm);
+	struct cht_rt5677_private *ctx = snd_soc_card_get_drvdata(card);
+
+	gpiod_set_value_cansleep(ctx->gpio_hp_en, SND_SOC_DAPM_EVENT_ON(event));
+
+	return 0;
+}
+
+static int cht_rt5677_spk_event(struct snd_soc_dapm_widget *w,
+			    struct snd_kcontrol *kctl, int event)
+{
+	struct snd_soc_card *card = snd_soc_dapm_to_card(w->dapm);
+	struct cht_rt5677_private *ctx = snd_soc_card_get_drvdata(card);
+
+	gpiod_set_value_cansleep(ctx->gpio_spk_en1,
+				 SND_SOC_DAPM_EVENT_ON(event));
+	gpiod_set_value_cansleep(ctx->gpio_spk_en2,
+				 SND_SOC_DAPM_EVENT_ON(event));
+
+	return 0;
+}
+
+static const struct snd_soc_dapm_widget cht_rt5677_dapm_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone", cht_rt5677_hp_event),
+	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+	SND_SOC_DAPM_MIC("Int Mic", NULL),
+	SND_SOC_DAPM_SPK("Speaker", cht_rt5677_spk_event),
+	SND_SOC_DAPM_SUPPLY("Platform Clock", SND_SOC_NOPM, 0, 0,
+			    cht_rt5677_platform_clock_control,
+			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+};
+
+static const struct snd_soc_dapm_route cht_rt5677_audio_map[] = {
+	{"IN1P", NULL, "Headset Mic"},
+	{"IN1N", NULL, "Headset Mic"},
+	{"DMIC L1", NULL, "Int Mic"},
+	{"DMIC R1", NULL, "Int Mic"},
+	{"Headphone", NULL, "LOUT1"},
+	{"Headphone", NULL, "LOUT2"},
+	{"Speaker", NULL, "LOUT1"},
+	{"Speaker", NULL, "LOUT2"},
+
+	{"AIF1 Playback", NULL, "ssp2 Tx"},
+	{"ssp2 Tx", NULL, "codec_out0"},
+	{"ssp2 Tx", NULL, "codec_out1"},
+	{"codec_in0", NULL, "ssp2 Rx"},
+	{"codec_in1", NULL, "ssp2 Rx"},
+	{"ssp2 Rx", NULL, "AIF1 Capture"},
+	{"Headphone", NULL, "Platform Clock"},
+	{"Speaker", NULL, "Platform Clock"},
+	{"Headset Mic", NULL, "Platform Clock"},
+	{"Int Mic", NULL, "Platform Clock"},
+};
+
+static const struct snd_kcontrol_new cht_rt5677_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Headphone"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+	SOC_DAPM_PIN_SWITCH("Int Mic"),
+	SOC_DAPM_PIN_SWITCH("Speaker"),
+};
+
+static int cht_rt5677_aif1_hw_params(struct snd_pcm_substream *substream,
+				 struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	int ret;
+
+	/* set codec PLL source to the 19.2MHz platform clock (MCLK) */
+	ret = snd_soc_dai_set_pll(codec_dai, 0, RT5677_PLL1_S_MCLK,
+				  CHT_PLAT_CLK_3_HZ, params_rate(params) * 512);
+	if (ret < 0) {
+		dev_err(rtd->dev, "can't set codec pll: %d\n", ret);
+		return ret;
+	}
+
+	/* set codec sysclk source to PLL */
+	ret = snd_soc_dai_set_sysclk(codec_dai, RT5677_SCLK_S_PLL1,
+				     params_rate(params) * 512,
+				     SND_SOC_CLOCK_IN);
+	if (ret < 0) {
+		dev_err(rtd->dev, "can't set codec sysclk: %d\n", ret);
+		return ret;
+	}
+
+	/* Default mode for SSP configuration is TDM 4 slot */
+	ret = snd_soc_dai_set_fmt(codec_dai,
+				  SND_SOC_DAIFMT_DSP_B |
+				  SND_SOC_DAIFMT_IB_NF |
+				  SND_SOC_DAIFMT_CBC_CFC);
+	if (ret < 0) {
+		dev_err(codec_dai->dev, "can't set format to TDM %d\n", ret);
+		return ret;
+	}
+
+	/* TDM 4 slots 24 bit, set Rx & Tx bitmask to 4 active slots */
+	ret = snd_soc_dai_set_tdm_slot(codec_dai, 0xF, 0xF, 4, 25);
+	if (ret < 0) {
+		dev_err(rtd->dev, "can't set codec TDM slot %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int cht_rt5677_codec_init(struct snd_soc_pcm_runtime *runtime)
+{
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(runtime, 0);
+	struct snd_soc_component *component = codec_dai->component;
+	struct cht_rt5677_private *ctx = snd_soc_card_get_drvdata(runtime->card);
+	int ret = 0;
+
+	/* Enable codec ASRC function for Stereo DAC/Stereo1 ADC/DMIC/I2S1.
+	 * The ASRC clock source is clk_i2s1_asrc.
+	 */
+	rt5677_sel_asrc_clk_src(component, RT5677_DA_STEREO_FILTER |
+			RT5677_AD_STEREO1_FILTER | RT5677_I2S1_SOURCE,
+			RT5677_CLK_SEL_I2S1_ASRC);
+	/* Enable codec ASRC function for Mono ADC L.
+	 * The ASRC clock source is clk_sys2_asrc.
+	 */
+	rt5677_sel_asrc_clk_src(component, RT5677_AD_MONO_L_FILTER,
+				RT5677_CLK_SEL_SYS2);
+
+	/*
+	 * The firmware might enable the clock at
+	 * boot (this information may or may not
+	 * be reflected in the enable clock register).
+	 * To change the rate we must disable the clock
+	 * first to cover these cases. Due to common
+	 * clock framework restrictions that do not allow
+	 * to disable a clock that has not been enabled,
+	 * we need to enable the clock first.
+	 */
+	ret = clk_prepare_enable(ctx->mclk);
+	if (!ret)
+		clk_disable_unprepare(ctx->mclk);
+
+	ret = clk_set_rate(ctx->mclk, CHT_PLAT_CLK_3_HZ);
+	if (ret) {
+		dev_err(runtime->dev, "unable to set MCLK rate\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int cht_rt5677_codec_fixup(struct snd_soc_pcm_runtime *rtd,
+			      struct snd_pcm_hw_params *params)
+{
+	struct snd_interval *rate = hw_param_interval(params,
+			SNDRV_PCM_HW_PARAM_RATE);
+	struct snd_interval *channels = hw_param_interval(params,
+						SNDRV_PCM_HW_PARAM_CHANNELS);
+
+	/* The DSP will convert the FE rate to 48k, stereo, 24bits */
+	rate->min = rate->max = 48000;
+	channels->min = channels->max = 2;
+
+	/* set SSP2 to 24-bit */
+	params_set_format(params, SNDRV_PCM_FORMAT_S24_LE);
+
+	return 0;
+}
+
+static struct snd_soc_jack_pin cht_rt5677_jack_pins[] = {
+	{
+		.pin = "Headphone",
+		.mask = SND_JACK_HEADPHONE,
+	},
+	{
+		.pin = "Headset Mic",
+		.mask = SND_JACK_MICROPHONE,
+	},
+};
+
+static int cht_rt5677_headset_init(struct snd_soc_component *component)
+{
+	struct snd_soc_card *card = component->card;
+	struct cht_rt5677_private *ctx = snd_soc_card_get_drvdata(card);
+	struct snd_soc_jack *jack = &ctx->jack;
+	int jack_type;
+	int ret;
+
+	/*
+	 * TS3A227E supports 4 butons headset detection
+	 * KEY_MEDIA
+	 * KEY_VOICECOMMAND
+	 * KEY_VOLUMEUP
+	 * KEY_VOLUMEDOWN
+	 */
+	jack_type = SND_JACK_HEADPHONE | SND_JACK_MICROPHONE |
+		    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+		    SND_JACK_BTN_2 | SND_JACK_BTN_3;
+
+	ret = snd_soc_card_jack_new_pins(card, "Headset Jack",
+					 jack_type, jack,
+					 cht_rt5677_jack_pins,
+					 ARRAY_SIZE(cht_rt5677_jack_pins));
+	if (ret) {
+		dev_err(card->dev, "Headset Jack creation failed %d\n", ret);
+		return ret;
+	}
+
+	return ts3a227e_enable_jack_detect(component, jack);
+}
+
+static int cht_rt5677_aif1_startup(struct snd_pcm_substream *substream)
+{
+	return snd_pcm_hw_constraint_single(substream->runtime,
+			SNDRV_PCM_HW_PARAM_RATE, 48000);
+}
+
+static const struct snd_soc_ops cht_rt5677_aif1_ops = {
+	.startup = cht_rt5677_aif1_startup,
+};
+
+static const struct snd_soc_ops cht_rt5677_be_ssp2_ops = {
+	.hw_params = cht_rt5677_aif1_hw_params,
+};
+
+static struct snd_soc_aux_dev cht_rt5677_headset_dev = {
+	.dlc = COMP_AUX("i2c-ts3a227e"),
+	.init = cht_rt5677_headset_init,
+};
+
+SND_SOC_DAILINK_DEF(dummy,
+		    DAILINK_COMP_ARRAY(COMP_DUMMY()));
+
+SND_SOC_DAILINK_DEF(media,
+		    DAILINK_COMP_ARRAY(COMP_CPU("media-cpu-dai")));
+
+SND_SOC_DAILINK_DEF(deepbuffer,
+		    DAILINK_COMP_ARRAY(COMP_CPU("deepbuffer-cpu-dai")));
+
+SND_SOC_DAILINK_DEF(ssp2_port,
+		    DAILINK_COMP_ARRAY(COMP_CPU("ssp2-port")));
+SND_SOC_DAILINK_DEF(ssp2_codec,
+		    DAILINK_COMP_ARRAY(COMP_CODEC(RT5677_I2C_DEFAULT,
+						  "rt5677-aif1")));
+
+SND_SOC_DAILINK_DEF(platform,
+		    DAILINK_COMP_ARRAY(COMP_PLATFORM("sst-mfld-platform")));
+
+static struct snd_soc_dai_link cht_rt5677_dailink[] = {
+	/* Front End DAI links */
+	[MERR_DPCM_AUDIO] = {
+		.name = "Audio Port",
+		.stream_name = "Audio",
+		.nonatomic = true,
+		.dynamic = 1,
+		.ops = &cht_rt5677_aif1_ops,
+		SND_SOC_DAILINK_REG(media, dummy, platform),
+	},
+	[MERR_DPCM_DEEP_BUFFER] = {
+		.name = "Deep-Buffer Audio Port",
+		.stream_name = "Deep-Buffer Audio",
+		.nonatomic = true,
+		.dynamic = 1,
+		.playback_only = 1,
+		.ops = &cht_rt5677_aif1_ops,
+		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
+	},
+
+	/* Back End DAI links */
+	{
+		/* SSP2 - Codec */
+		.name = "SSP2-Codec",
+		.id = 0,
+		.no_pcm = 1,
+		.nonatomic = true,
+		.init = cht_rt5677_codec_init,
+		.be_hw_params_fixup = cht_rt5677_codec_fixup,
+		.ops = &cht_rt5677_be_ssp2_ops,
+		SND_SOC_DAILINK_REG(ssp2_port, ssp2_codec, platform),
+	},
+};
+
+static const struct acpi_gpio_params speaker_enable_gpio = { 2, 0, false };
+static const struct acpi_gpio_mapping cht_rt5677_gpios[] = {
+	{ "speaker-enable-gpios", &speaker_enable_gpio, 1 },
+	{ NULL }
+};
+
+static int snd_cht_rt5677_probe(struct platform_device *pdev)
+{
+	struct snd_soc_acpi_mach *mach = dev_get_platdata(&pdev->dev);
+	struct acpi_device *adev;
+	struct cht_rt5677_private *ctx;
+	struct snd_soc_card *card;
+	const char *platform_name;
+	int ret = 0;
+	int i;
+
+	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	card = &ctx->card;
+	card->dev = &pdev->dev;
+	card->owner = THIS_MODULE;
+	card->name = "cht-rt5677";
+	card->dai_link = cht_rt5677_dailink,
+	card->num_links = ARRAY_SIZE(cht_rt5677_dailink),
+	card->aux_dev = &cht_rt5677_headset_dev,
+	card->num_aux_devs = 1,
+	card->dapm_widgets = cht_rt5677_dapm_widgets,
+	card->num_dapm_widgets = ARRAY_SIZE(cht_rt5677_dapm_widgets),
+	card->dapm_routes = cht_rt5677_audio_map,
+	card->num_dapm_routes = ARRAY_SIZE(cht_rt5677_audio_map),
+	card->controls = cht_rt5677_controls,
+	card->num_controls = ARRAY_SIZE(cht_rt5677_controls),
+
+	strscpy(ctx->codec_name, RT5677_I2C_DEFAULT);
+
+	/* fixup codec name based on HID if ACPI node is present */
+	adev = acpi_dev_get_first_match_dev(mach->id, NULL, -1);
+	if (adev) {
+		snprintf(ctx->codec_name, sizeof(ctx->codec_name),
+			 "i2c-%s", acpi_dev_name(adev));
+
+		acpi_dev_put(adev);
+		for (i = 0; i < ARRAY_SIZE(cht_rt5677_dailink); i++) {
+			if (cht_rt5677_dailink[i].codecs->name &&
+			    !strcmp(cht_rt5677_dailink[i].codecs->name,
+				    RT5677_I2C_DEFAULT)) {
+				cht_rt5677_dailink[i].codecs->name = ctx->codec_name;
+				break;
+			}
+		}
+	}
+
+	struct device *codec_dev __free(put_device) =
+		bus_find_device_by_name(&i2c_bus_type, NULL, ctx->codec_name);
+
+	if (!codec_dev)
+		return -EPROBE_DEFER;
+
+	if (adev) {
+		ret = devm_acpi_dev_add_driver_gpios(codec_dev,
+							 cht_rt5677_gpios);
+		if (ret)
+			dev_warn(&pdev->dev,
+				 "Unable to add GPIO mapping table: %d\n",
+				 ret);
+	}
+
+	ctx->gpio_spk_en1 = gpiod_get(codec_dev, "speaker-enable", GPIOD_OUT_LOW);
+	if (IS_ERR(ctx->gpio_spk_en1)) {
+		ret = PTR_ERR(ctx->gpio_spk_en1);
+		return dev_err_probe(&pdev->dev, ret, "getting speaker enable GPIO\n");
+	}
+
+	ctx->gpio_spk_en2 = gpiod_get(codec_dev, "speaker-enable2", GPIOD_OUT_LOW);
+	if (IS_ERR(ctx->gpio_spk_en2)) {
+		ret = PTR_ERR(ctx->gpio_spk_en2);
+		dev_err_probe(codec_dev, ret, "getting speaker enable 2 GPIO\n");
+		goto out_put_spken_gpio;
+	}
+
+	ctx->gpio_hp_en = gpiod_get(codec_dev, "headphone-enable", GPIOD_OUT_LOW);
+	if (IS_ERR(ctx->gpio_hp_en)) {
+		ret = PTR_ERR(ctx->gpio_hp_en);
+		dev_err_probe(codec_dev, ret, "getting headphone enable GPIO\n");
+		goto out_put_spken2_gpio;
+	}
+
+	/* override platform name, if required */
+	platform_name = mach->mach_params.platform;
+
+	ret = snd_soc_fixup_dai_links_platform_name(card, platform_name);
+	if (ret) {
+		dev_err_probe(&pdev->dev, ret, "fixing up dai links platform name\n");
+		goto out_put_hpen_gpio;
+	}
+
+	ctx->mclk = devm_clk_get(&pdev->dev, "pmc_plt_clk_3");
+	if (IS_ERR(ctx->mclk)) {
+		ret = PTR_ERR(ctx->mclk);
+		dev_err_probe(&pdev->dev, ret, "getting MCLK from pmc_plt_clk_3\n");
+		goto out_put_hpen_gpio;
+	}
+
+	snd_soc_card_set_drvdata(card, ctx);
+
+	/* register the soc card */
+	ret = devm_snd_soc_register_card(&pdev->dev, card);
+	if (ret) {
+		dev_err_probe(&pdev->dev, ret, "registering card\n");
+		goto out_put_hpen_gpio;
+	}
+
+	return 0;
+
+out_put_hpen_gpio:
+	gpiod_put(ctx->gpio_hp_en);
+out_put_spken2_gpio:
+	gpiod_put(ctx->gpio_spk_en2);
+out_put_spken_gpio:
+	gpiod_put(ctx->gpio_spk_en1);
+
+	return ret;
+}
+
+static void snd_cht_rt5677_remove(struct platform_device *pdev)
+{
+	struct snd_soc_card *card = platform_get_drvdata(pdev);
+	struct cht_rt5677_private *ctx = snd_soc_card_get_drvdata(card);
+	int i;
+
+	/*
+	 * Reset the codec name in the global dailink array back to the default
+	 * to avoid a use-after-free on driver rebind (unbind/bind):
+	 * ctx->codec_name is about to be freed together with ctx (devm), but
+	 * cht_rt5677_dailink[] is a static global that persists across binds.
+	 */
+	for (i = 0; i < ARRAY_SIZE(cht_rt5677_dailink); i++) {
+		if (cht_rt5677_dailink[i].codecs->name == ctx->codec_name) {
+			cht_rt5677_dailink[i].codecs->name = RT5677_I2C_DEFAULT;
+			break;
+		}
+	}
+
+	gpiod_put(ctx->gpio_hp_en);
+	gpiod_put(ctx->gpio_spk_en2);
+	gpiod_put(ctx->gpio_spk_en1);
+}
+
+static struct platform_driver snd_cht_rt5677_driver = {
+	.driver = {
+		.name = "cht-rt5677",
+		.pm = &snd_soc_pm_ops,
+	},
+	.probe = snd_cht_rt5677_probe,
+	.remove = snd_cht_rt5677_remove,
+};
+
+module_platform_driver(snd_cht_rt5677_driver);
+
+MODULE_DESCRIPTION("ASoC Intel Cherrytrail with RT5677 machine driver");
+MODULE_AUTHOR("Yauhen Kharuzhy");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:cht-rt5677");
diff --git a/sound/soc/intel/common/soc-acpi-intel-cht-match.c b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
index 5e8a1dc84ee1..c719c3ec8314 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cht-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
@@ -17,12 +17,11 @@ static struct snd_soc_acpi_mach cht_surface_mach = {
 	.sof_tplg_filename = "sof-cht-rt5645.tplg",
 };
 
-static struct snd_soc_acpi_mach cht_yogabook_mach = {
+static struct snd_soc_acpi_mach cht_rt5677_mach = {
 	.id = "10EC5677",
-	.drv_name = "cht-yogabook",
+	.drv_name = "cht-rt5677",
 	.fw_filename = "intel/fw_sst_22a8.bin",
-	.board = "cht-yogabook",
-	.sof_tplg_filename = "sof-cht-rt5677.tplg",
+	.board = "cht_rt5677",
 };
 
 static struct snd_soc_acpi_mach cht_lenovo_yoga_tab3_x90_mach = {
@@ -41,17 +40,9 @@ static const struct dmi_system_id cht_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Surface 3"),
 		},
 	},
-	{
-		.ident = "Lenovo Yoga Book YB1-X91",
-		.driver_data = (void *)&cht_yogabook_mach,
-		/* YB1-X91L/F */
-		.matches = {
-			DMI_MATCH(DMI_PRODUCT_NAME, "Lenovo YB1-X91"),
-		}
-	},
 	{
 		.ident = "Lenovo Yoga Book YB1-X90",
-		.driver_data = (void *)&cht_yogabook_mach,
+		.driver_data = (void *)&cht_rt5677_mach,
 		/* YB1-X90L/F, codec is not listed in DSDT */
 		.matches = {
 			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
@@ -147,19 +138,11 @@ struct snd_soc_acpi_mach  snd_soc_acpi_intel_cherrytrail_machines[] = {
 		.board = "cht-bsw",
 		.sof_tplg_filename = "sof-cht-rt5670.tplg",
 	},
-	/*
-	 * The only known Cherry Trail device with RT5677 codec and 10EC677
-	 * DSTD entry is the Lenovo Yoga Book YB1-X91. It has a device-specific
-	 * driver, so check DMI and use a machine quirk to override the default
-	 * (non-existent) machine driver.
-	 */
 	{
 		.id = "10EC5677",
-		.drv_name = "cht-bsw-rt5677",
+		.drv_name = "cht-rt5677",
 		.fw_filename = "intel/fw_sst_22a8.bin",
-		.board = "cht-bsw",
-		.machine_quirk = cht_quirk,
-		.sof_tplg_filename = "sof-cht-rt5677.tplg",
+		.board = "cht_rt5677",
 	},
 	{
 		.comp_ids = &rt5645_comp_ids,

-- 
2.53.0

