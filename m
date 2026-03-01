Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97232F5485
	for <linux-sound@vger.kernel.org>; Sun,  1 Mar 2026 21:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772400851; cv=none; b=I4GsLHlfADFs8GhpPps40+WVs3I/js2VCKW/F7U+t3BH32Yq4OgKg67G9kPecXihTCn/D1zw7Ty1HTiDoJuXEKcsDQEkilNvc6SFre/aSwccYhivrNsTEXhw6/t2pgDfPiHGl2rVYCD2ZSux41FW5Pj1lewKA9HueO3cEqk1RN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772400851; c=relaxed/simple;
	bh=qVAI0cy4vwnSShSUyt2bELrLj2tIIw5QyEWW7tT4m24=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rBTNayZz5KQVZsT0XMfKuxldkbhqn1THPHNHi5b8hIa4mQln39nBg7rOozhAqMBIn3/QWLUMfXI46w7aoIH4hScfpwys1L0W35jgzx2Hu7/lN0EfwbNRN0QaF86ow6UPZPfYpfYjDfv4dg802CdTp/YPV+mw+rXVaewWQRcyClY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b1rYfVgq; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b1rYfVgq"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b8fb6ad3243so566873666b.1
        for <linux-sound@vger.kernel.org>; Sun, 01 Mar 2026 13:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772400846; x=1773005646; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eua0+RXtpU2H7UelcO0dLJIQrVhWLZK4LeM9+ZoYzZY=;
        b=b1rYfVgqEuA+ais2EsQYmRMFYPRUq0Ko/u9apTvB1jcbxu5r2COtzv1e2SezLh+Mlt
         WSpJdE8Qnf2ct+Oloz/tTLpCuMrxPxWBA0+s+XUF0euLLSf/SaPR7qClV1X5/PewY0yH
         xk0vrpuyGxEB3HLrO/MZX5mlRcc4vJMKWFRYTognpwy1qY119gUTeUQyxzyqU3kvFYF8
         n6IBpNi8nww/4TqVSCo1Us8RbkUibxtXYMLMRZo6nm6Unn6340KpuocvoDXrbSS1aPfw
         y4f69sjQsPAbkNqTsZrnhSOoe/UvU9O/dzvB67ahb4JbNaMcrv6Sb/bTK5tsVH2ZwHF8
         9P5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772400846; x=1773005646;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eua0+RXtpU2H7UelcO0dLJIQrVhWLZK4LeM9+ZoYzZY=;
        b=JIYw/FB1yIz4g72+hzN91IaHG9LPtlz9Uclx3LktAwuQ8jiFGhNywDIzbQpHKQwTlz
         vTblGeWeJV81HTkBnNhyp5jRvL5QaRC13RzupjerQUbt7+Kw5mP8ZZp2kCRHvEHLbLpY
         AaY7UZ2ePPl9+uQKOcwQyg7d4qmwZhz1UTo0iQrqh+Kww4JcROpxiDceV2qs0i5f3+4d
         vcY1tE1zF7uzBEviuFf+irOWl2PFsxBHCzGW+nYH0vPJawrjdRTJdh0ncMlPUnhNNtof
         lScaTVtWNBR/7j1ptJ9yMSSPBC60f7gVBk/jF3Ndddc5LO2qFzDyWjjaRLp719RQIck4
         c3gQ==
X-Gm-Message-State: AOJu0YzfSXQq0NFl/Eg9n1b5njqe1YdS3z2i3VsommHUbQSnh68PjIbX
	/wr2SKue3+j2Vn6/mN01F8/AB4zrWmBkDQe6BjLarR90qWqMMRaJUzG8
X-Gm-Gg: ATEYQzzKCrM72WvtXXEig9EYzsRr2d8OtTUs0U9NqQeYh9JE3+i2bMeIEuLUf7JiL1K
	PHtQephjpuqzSF2NK91vkSuQxGk2HW0vHgKEo4RUEwtJE3QXzbV7Hhq2wZ3EDTOvxeXXq1BAot3
	ZdGnDQQzAPMsPRtKb7Z0FJD8DL5DylqCozqS/8lAkIBMoy7oviE1UWs28rk7456yUJK8Mug+1O0
	ZvxZLkhwBYL7uMKg/v0ed/35CbUnG8PmFU6BhaMMvzgKMRy50mBXn68Cx9/MO8mqZlbP3sjZt/Q
	EuFJIN3E8F+oBpTqTytSjfpH5m9AbfzV+EO3IcRIaqFbCmaxZtgqLCja4lZqytCR5AX/X0kIw+s
	YGj/My+08RRpu7Uuxk0GuO8+rhuu0wFnT3+pmNd80+q5zC22BxR4jRx72V2MrH6U3+7IWiSRxMk
	AFUNjNE/6nCvT43CbOQg==
X-Received: by 2002:a17:907:7f8a:b0:b8e:9d66:f5fb with SMTP id a640c23a62f3a-b937616f277mr568593766b.0.1772400845618;
        Sun, 01 Mar 2026 13:34:05 -0800 (PST)
Received: from [127.0.1.1] ([46.251.53.180])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fabf6cfd9sm2934793a12.22.2026.03.01.13.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 13:34:05 -0800 (PST)
From: Yauhen Kharuzhy <jekhor@gmail.com>
Date: Sun, 01 Mar 2026 23:33:46 +0200
Subject: [PATCH v2 3/3] ASoC: Intel: cht_yogabook: Add driver for Lenovo
 Yoga Book tablets
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-asoc-yogabook-v2-v2-3-adcc7ed40985@gmail.com>
References: <20260301-asoc-yogabook-v2-v2-0-adcc7ed40985@gmail.com>
In-Reply-To: <20260301-asoc-yogabook-v2-v2-0-adcc7ed40985@gmail.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>, 
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hans de Goede <hansg@kernel.org>, Yauhen Kharuzhy <jekhor@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772400841; l=20169;
 i=jekhor@gmail.com; s=20260301; h=from:subject:message-id;
 bh=qVAI0cy4vwnSShSUyt2bELrLj2tIIw5QyEWW7tT4m24=;
 b=C3Iz4CjDYN261gkNVkvpp8cePFfSZpO/YJJRvyO70C/IukZ2nedHVdYodEDJ/1JbyjgBBdJpF
 zUjRlZdPOqFA5wqA+naVVWZOljkmD2vpsiv5AeQw9NGTKeR04Am15vW
X-Developer-Key: i=jekhor@gmail.com; a=ed25519;
 pk=C/csaZJs7UBNDgeJcUAmPu4ntqNeaZ3BKfBQiH8tuGc=

Add a new ASoC machine driver for Lenovo Yoga Book Intel Cherry
Trail-based tablets (YB1-X90F/L, YB1-X91F/L models).

This platform uses a Realtek ALC5677 codec accompanied by a TS3A227E jack
configuration detection IC.

The driver is based on the cht_bsw_rt5672.c mainline driver and the driver
from the vendor's Android kernel [1].

There are no other known Cherry Trail platforms using an RT5677 codec, so
the driver is named 'cht_yogabook', and some device-specific tricks are
hardcoded, such as jack events and additional GPIOs controlling the
speaker amplifier.

[1] https://github.com/deadman96385/android_kernel_lenovo_yeti/blob/master/sound/soc/intel/board/cht_bl_dpcm_rt5677.c

Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
---
 sound/soc/intel/boards/Kconfig        |  15 +
 sound/soc/intel/boards/Makefile       |   2 +
 sound/soc/intel/boards/cht_yogabook.c | 551 ++++++++++++++++++++++++++++++++++
 3 files changed, 568 insertions(+)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index c5942b5655d3..f7346ee085e7 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -237,6 +237,21 @@ config SND_SOC_INTEL_BYT_CHT_ES8316_MACH
 	  Say Y or m if you have such a device. This is a recommended option.
 	  If unsure select "N".
 
+config SND_SOC_INTEL_CHT_YOGABOOK_MACH
+	tristate "Cherrytrail-based Lenovo Yoga Book tablet"
+	depends on I2C && ACPI
+	depends on X86_INTEL_LPSS || COMPILE_TEST
+	depends on GPIOLIB || COMPILE_TEST
+	select SND_SOC_ACPI
+	select SND_SOC_RT5677
+	select SND_SOC_TS3A227E
+        help
+	  This adds support for ASoC machine driver for the Lenovo Yoga Book
+	  tablets based on CherryTrail platform with RT5677 audio codec, models
+	  YB1-X90F, YB1-X90L, YB1-X91F, YB1-X91L.
+          Say Y or m if you have such a device. This is a recommended option.
+          If unsure select "N".
+
 endif ## SND_SST_ATOM_HIFI2_PLATFORM || SND_SOC_SOF_BAYTRAIL
 
 if SND_SST_ATOM_HIFI2_PLATFORM
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index 25a1a9066cbf..58bd6029545b 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -15,6 +15,7 @@ snd-soc-sst-cht-bsw-nau8824-y := cht_bsw_nau8824.o
 snd-soc-sst-byt-cht-cx2072x-y := bytcht_cx2072x.o
 snd-soc-sst-byt-cht-da7213-y := bytcht_da7213.o
 snd-soc-sst-byt-cht-es8316-y := bytcht_es8316.o
+snd-soc-sst-cht-yogabook-objs := cht_yogabook.o
 snd-soc-sst-byt-cht-nocodec-y := bytcht_nocodec.o
 snd-soc-sof_rt5682-y := sof_rt5682.o
 snd-soc-sof_cs42l42-y := sof_cs42l42.o
@@ -47,6 +48,7 @@ obj-$(CONFIG_SND_SOC_INTEL_CHT_BSW_NAU8824_MACH) += snd-soc-sst-cht-bsw-nau8824.
 obj-$(CONFIG_SND_SOC_INTEL_BYT_CHT_CX2072X_MACH) += snd-soc-sst-byt-cht-cx2072x.o
 obj-$(CONFIG_SND_SOC_INTEL_BYT_CHT_DA7213_MACH) += snd-soc-sst-byt-cht-da7213.o
 obj-$(CONFIG_SND_SOC_INTEL_BYT_CHT_ES8316_MACH) += snd-soc-sst-byt-cht-es8316.o
+obj-$(CONFIG_SND_SOC_INTEL_CHT_YOGABOOK_MACH) += snd-soc-sst-cht-yogabook.o
 obj-$(CONFIG_SND_SOC_INTEL_BYT_CHT_NOCODEC_MACH) += snd-soc-sst-byt-cht-nocodec.o
 obj-$(CONFIG_SND_SOC_INTEL_SKL_HDA_DSP_GENERIC_MACH) += snd-soc-skl_hda_dsp.o
 obj-$(CONFIG_SND_SOC_INTEL_EHL_RT5660_MACH) += snd-soc-ehl-rt5660.o
diff --git a/sound/soc/intel/boards/cht_yogabook.c b/sound/soc/intel/boards/cht_yogabook.c
new file mode 100644
index 000000000000..9d945cad5660
--- /dev/null
+++ b/sound/soc/intel/boards/cht_yogabook.c
@@ -0,0 +1,551 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ *  cht_yogabook.c - ASoc Machine driver for Lenovo Yoga Book YB1-X90/X91
+ *  tablets, based on Intel Cherrytrail platform with RT5677 codec.
+ *
+ *  Copyright (C) 2026 Yauhen Kharuzhy <jekhor@gmail.com>
+ *
+ *  Based on cht_bsw_rt5672.c:
+ *  Copyright (C) 2014 Intel Corp
+ *  Author: Subhransu S. Prusty <subhransu.s.prusty@intel.com>
+ *          Mengdong Lin <mengdong.lin@intel.com>
+ *
+ *  And based on the cht_bl_dpcm_rt5677.c from the Lenovo's Android kernel:
+ *  Copyright (C) 2014 Intel Corp
+ *  Author: Mythri P K <mythri.p.k@intel.com>
+ */
+
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
+struct cht_yb_private {
+	char codec_name[SND_ACPI_I2C_ID_LEN];
+	struct snd_soc_jack jack;
+	struct clk *mclk;
+	struct gpio_desc *gpio_spk_en1;
+	struct gpio_desc *gpio_spk_en2;
+	struct gpio_desc *gpio_hp_en;
+};
+
+static int cht_yb_platform_clock_control(struct snd_soc_dapm_widget *w,
+					 struct snd_kcontrol *k, int  event)
+{
+	struct snd_soc_card *card = snd_soc_dapm_to_card(w->dapm);
+	struct snd_soc_dai *codec_dai;
+	struct cht_yb_private *ctx = snd_soc_card_get_drvdata(card);
+	int ret;
+
+	codec_dai = snd_soc_card_get_codec_dai(card, CHT_CODEC_DAI);
+	if (!codec_dai) {
+		dev_err(card->dev,
+			"Codec dai not found; Unable to set platform clock\n");
+		return -EIO;
+	}
+
+	if (SND_SOC_DAPM_EVENT_ON(event)) {
+		if (ctx->mclk) {
+			ret = clk_prepare_enable(ctx->mclk);
+			if (ret < 0) {
+				dev_err(card->dev,
+					"could not configure MCLK state");
+				return ret;
+			}
+		}
+
+		/* set codec PLL source to the 19.2MHz platform clock (MCLK) */
+		ret = snd_soc_dai_set_pll(codec_dai, 0, RT5677_PLL1_S_MCLK,
+					  CHT_PLAT_CLK_3_HZ, 48000 * 512);
+		if (ret < 0) {
+			dev_err(card->dev, "can't set codec pll: %d\n", ret);
+			return ret;
+		}
+
+		/* set codec sysclk source to PLL */
+		ret = snd_soc_dai_set_sysclk(codec_dai, RT5677_SCLK_S_PLL1,
+					     48000 * 512, SND_SOC_CLOCK_IN);
+		if (ret < 0) {
+			dev_err(card->dev, "can't set codec sysclk: %d\n", ret);
+			return ret;
+		}
+	} else {
+		/* Set codec sysclk source to its internal clock because codec
+		 * PLL will be off when idle and MCLK will also be off by ACPI
+		 * when codec is runtime suspended. Codec needs clock for jack
+		 * detection and button press.
+		 */
+		snd_soc_dai_set_sysclk(codec_dai, RT5677_SCLK_S_RCCLK,
+				       48000 * 512, SND_SOC_CLOCK_IN);
+
+		if (ctx->mclk)
+			clk_disable_unprepare(ctx->mclk);
+	}
+	return 0;
+}
+
+static int cht_yb_hp_event(struct snd_soc_dapm_widget *w,
+			   struct snd_kcontrol *k, int event)
+{
+	struct snd_soc_card *card = snd_soc_dapm_to_card(w->dapm);
+	struct cht_yb_private *ctx = snd_soc_card_get_drvdata(card);
+
+	dev_dbg(card->dev, "HP event: %s\n",
+		SND_SOC_DAPM_EVENT_ON(event) ? "ON" : "OFF");
+
+	gpiod_set_value_cansleep(ctx->gpio_hp_en, SND_SOC_DAPM_EVENT_ON(event));
+
+	return 0;
+}
+
+static int cht_yb_spk_event(struct snd_soc_dapm_widget *w,
+			    struct snd_kcontrol *k, int event)
+{
+	struct snd_soc_card *card = snd_soc_dapm_to_card(w->dapm);
+	struct cht_yb_private *ctx = snd_soc_card_get_drvdata(card);
+
+	dev_dbg(card->dev, "SPK event: %s\n",
+		SND_SOC_DAPM_EVENT_ON(event) ? "ON" : "OFF");
+
+	gpiod_set_value_cansleep(ctx->gpio_spk_en1,
+				 SND_SOC_DAPM_EVENT_ON(event));
+	gpiod_set_value_cansleep(ctx->gpio_spk_en2,
+				 SND_SOC_DAPM_EVENT_ON(event));
+
+	return 0;
+}
+
+static const struct snd_soc_dapm_widget cht_yb_dapm_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone", cht_yb_hp_event),
+	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+	SND_SOC_DAPM_MIC("Int Mic", NULL),
+	SND_SOC_DAPM_SPK("Speaker", cht_yb_spk_event),
+	SND_SOC_DAPM_SUPPLY("Platform Clock", SND_SOC_NOPM, 0, 0,
+			    cht_yb_platform_clock_control,
+			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+};
+
+static const struct snd_soc_dapm_route cht_yb_audio_map[] = {
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
+static const struct snd_kcontrol_new cht_mc_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Headphone"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+	SOC_DAPM_PIN_SWITCH("Int Mic"),
+	SOC_DAPM_PIN_SWITCH("Speaker"),
+};
+
+static int cht_yb_aif1_hw_params(struct snd_pcm_substream *substream,
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
+	/*
+	 * Default mode for SSP configuration is TDM 4 slot
+	 */
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
+static int cht_yb_codec_init(struct snd_soc_pcm_runtime *runtime)
+{
+	int ret = 0;
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(runtime, 0);
+	struct snd_soc_component *component = codec_dai->component;
+	struct cht_yb_private *ctx = snd_soc_card_get_drvdata(runtime->card);
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
+	ctx->gpio_spk_en1 = devm_gpiod_get(component->dev, "speaker-enable",
+					   GPIOD_OUT_LOW);
+	if (IS_ERR(ctx->gpio_spk_en1)) {
+		dev_err(component->dev, "Can't find speaker enable GPIO\n");
+		return PTR_ERR(ctx->gpio_spk_en1);
+	}
+
+	ctx->gpio_spk_en2 = devm_gpiod_get(component->dev, "speaker-enable2",
+					   GPIOD_OUT_LOW);
+	if (IS_ERR(ctx->gpio_spk_en2)) {
+		dev_err(component->dev, "Can't find speaker enable 2 GPIO\n");
+		return PTR_ERR(ctx->gpio_spk_en2);
+	}
+
+	ctx->gpio_hp_en = devm_gpiod_get(component->dev, "headphone-enable",
+					 GPIOD_OUT_LOW);
+	if (IS_ERR(ctx->gpio_hp_en)) {
+		dev_err(component->dev, "Can't find headphone enable GPIO\n");
+		return PTR_ERR(ctx->gpio_hp_en);
+	}
+
+	if (ctx->mclk) {
+		/*
+		 * The firmware might enable the clock at
+		 * boot (this information may or may not
+		 * be reflected in the enable clock register).
+		 * To change the rate we must disable the clock
+		 * first to cover these cases. Due to common
+		 * clock framework restrictions that do not allow
+		 * to disable a clock that has not been enabled,
+		 * we need to enable the clock first.
+		 */
+		ret = clk_prepare_enable(ctx->mclk);
+		if (!ret)
+			clk_disable_unprepare(ctx->mclk);
+
+		ret = clk_set_rate(ctx->mclk, CHT_PLAT_CLK_3_HZ);
+
+		if (ret) {
+			dev_err(runtime->dev, "unable to set MCLK rate\n");
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int cht_yb_codec_fixup(struct snd_soc_pcm_runtime *rtd,
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
+static struct snd_soc_jack_pin cht_yb_jack_pins[] = {
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
+static int cht_yb_headset_init(struct snd_soc_component *component)
+{
+	struct snd_soc_card *card = component->card;
+	struct cht_yb_private *ctx = snd_soc_card_get_drvdata(card);
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
+					 cht_yb_jack_pins,
+					 ARRAY_SIZE(cht_yb_jack_pins));
+	if (ret) {
+		dev_err(card->dev, "Headset Jack creation failed %d\n", ret);
+		return ret;
+	}
+
+	return ts3a227e_enable_jack_detect(component, jack);
+}
+
+static int cht_yb_aif1_startup(struct snd_pcm_substream *substream)
+{
+	return snd_pcm_hw_constraint_single(substream->runtime,
+			SNDRV_PCM_HW_PARAM_RATE, 48000);
+}
+
+static const struct snd_soc_ops cht_yb_aif1_ops = {
+	.startup = cht_yb_aif1_startup,
+};
+
+static const struct snd_soc_ops cht_yb_be_ssp2_ops = {
+	.hw_params = cht_yb_aif1_hw_params,
+};
+
+static struct snd_soc_aux_dev cht_yb_headset_dev = {
+	.dlc = COMP_AUX("i2c-ts3a227e"),
+	.init = cht_yb_headset_init,
+};
+
+SND_SOC_DAILINK_DEF(dummy,
+	DAILINK_COMP_ARRAY(COMP_DUMMY()));
+
+SND_SOC_DAILINK_DEF(media,
+	DAILINK_COMP_ARRAY(COMP_CPU("media-cpu-dai")));
+
+SND_SOC_DAILINK_DEF(deepbuffer,
+	DAILINK_COMP_ARRAY(COMP_CPU("deepbuffer-cpu-dai")));
+
+SND_SOC_DAILINK_DEF(ssp2_port,
+	DAILINK_COMP_ARRAY(COMP_CPU("ssp2-port")));
+SND_SOC_DAILINK_DEF(ssp2_codec,
+	DAILINK_COMP_ARRAY(COMP_CODEC(RT5677_I2C_DEFAULT, "rt5677-aif1")));
+
+SND_SOC_DAILINK_DEF(platform,
+	DAILINK_COMP_ARRAY(COMP_PLATFORM("sst-mfld-platform")));
+
+static struct snd_soc_dai_link cht_yb_dailink[] = {
+	/* Front End DAI links */
+	[MERR_DPCM_AUDIO] = {
+		.name = "Audio Port",
+		.stream_name = "Audio",
+		.nonatomic = true,
+		.dynamic = 1,
+		.ops = &cht_yb_aif1_ops,
+		SND_SOC_DAILINK_REG(media, dummy, platform),
+	},
+	[MERR_DPCM_DEEP_BUFFER] = {
+		.name = "Deep-Buffer Audio Port",
+		.stream_name = "Deep-Buffer Audio",
+		.nonatomic = true,
+		.dynamic = 1,
+		.playback_only = 1,
+		.ops = &cht_yb_aif1_ops,
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
+		.init = cht_yb_codec_init,
+		.be_hw_params_fixup = cht_yb_codec_fixup,
+		.ops = &cht_yb_be_ssp2_ops,
+		SND_SOC_DAILINK_REG(ssp2_port, ssp2_codec, platform),
+	},
+};
+
+/* SoC card */
+static struct snd_soc_card snd_soc_card_cht_yb = {
+	.owner = THIS_MODULE,
+	.dai_link = cht_yb_dailink,
+	.num_links = ARRAY_SIZE(cht_yb_dailink),
+	.aux_dev = &cht_yb_headset_dev,
+	.num_aux_devs = 1,
+	.dapm_widgets = cht_yb_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(cht_yb_dapm_widgets),
+	.dapm_routes = cht_yb_audio_map,
+	.num_dapm_routes = ARRAY_SIZE(cht_yb_audio_map),
+	.controls = cht_mc_controls,
+	.num_controls = ARRAY_SIZE(cht_mc_controls),
+};
+
+static const struct acpi_gpio_params speaker_enable_gpio = { 2, 0, false };
+static const struct acpi_gpio_mapping cht_yb_gpios[] = {
+	{ "speaker-enable-gpios", &speaker_enable_gpio, 1 },
+	{ NULL }
+};
+
+#define SOF_CARD_NAME "cht yogabook"
+#define SOF_DRIVER_NAME "SOF"
+
+#define CARD_NAME "cht-yogabook"
+#define DRIVER_NAME NULL
+
+static int snd_cht_yb_mc_probe(struct platform_device *pdev)
+{
+	int ret_val = 0;
+	struct cht_yb_private *drv;
+	struct snd_soc_acpi_mach *mach = pdev->dev.platform_data;
+	const char *platform_name;
+	struct acpi_device *adev;
+	struct device *codec_dev;
+	bool sof_parent;
+	int i;
+
+	drv = devm_kzalloc(&pdev->dev, sizeof(*drv), GFP_KERNEL);
+	if (!drv)
+		return -ENOMEM;
+
+	strscpy(drv->codec_name, RT5677_I2C_DEFAULT);
+
+	/* fixup codec name based on HID if ACPI node is present */
+	adev = acpi_dev_get_first_match_dev(mach->id, NULL, -1);
+	if (adev) {
+		snprintf(drv->codec_name, sizeof(drv->codec_name),
+			 "i2c-%s", acpi_dev_name(adev));
+		dev_info(&pdev->dev, "real codec name: %s\n", drv->codec_name);
+
+		put_device(&adev->dev);
+		for (i = 0; i < ARRAY_SIZE(cht_yb_dailink); i++) {
+			if (cht_yb_dailink[i].codecs->name &&
+			    !strcmp(cht_yb_dailink[i].codecs->name,
+				    RT5677_I2C_DEFAULT)) {
+				cht_yb_dailink[i].codecs->name = drv->codec_name;
+				break;
+			}
+		}
+	}
+
+	codec_dev = bus_find_device_by_name(&i2c_bus_type, NULL,
+					    drv->codec_name);
+	if (!codec_dev)
+		return -EPROBE_DEFER;
+
+	if (adev) {
+		ret_val = devm_acpi_dev_add_driver_gpios(codec_dev,
+							 cht_yb_gpios);
+		if (ret_val)
+			dev_warn(&pdev->dev,
+				 "Unable to add GPIO mapping table: %d\n",
+				 ret_val);
+	}
+
+	/* override platform name, if required */
+	snd_soc_card_cht_yb.dev = &pdev->dev;
+	platform_name = mach->mach_params.platform;
+
+	ret_val = snd_soc_fixup_dai_links_platform_name(&snd_soc_card_cht_yb,
+							platform_name);
+	if (ret_val) {
+		dev_err(&pdev->dev,
+			"snd_soc_fixup_dai_links_platform_name failed: %d\n",
+			ret_val);
+		return ret_val;
+	}
+
+	drv->mclk = devm_clk_get(&pdev->dev, "pmc_plt_clk_3");
+	if (IS_ERR(drv->mclk)) {
+		dev_err(&pdev->dev,
+			"Failed to get MCLK from pmc_plt_clk_3: %ld\n",
+			PTR_ERR(drv->mclk));
+		return PTR_ERR(drv->mclk);
+	}
+	snd_soc_card_set_drvdata(&snd_soc_card_cht_yb, drv);
+
+	sof_parent = snd_soc_acpi_sof_parent(&pdev->dev);
+
+	/* set the card and driver name */
+	if (sof_parent) {
+		snd_soc_card_cht_yb.name = SOF_CARD_NAME;
+		snd_soc_card_cht_yb.driver_name = SOF_DRIVER_NAME;
+	} else {
+		snd_soc_card_cht_yb.name = CARD_NAME;
+		snd_soc_card_cht_yb.driver_name = DRIVER_NAME;
+	}
+
+	/* register the soc card */
+	snd_soc_card_cht_yb.dev = &pdev->dev;
+	ret_val = devm_snd_soc_register_card(&pdev->dev, &snd_soc_card_cht_yb);
+	if (ret_val) {
+		dev_err(&pdev->dev,
+			"snd_soc_register_card failed %d\n", ret_val);
+		return ret_val;
+	}
+	platform_set_drvdata(pdev, &snd_soc_card_cht_yb);
+
+	return ret_val;
+}
+
+static struct platform_driver snd_cht_yb_mc_driver = {
+	.driver = {
+		.name = "cht-yogabook",
+	},
+	.probe = snd_cht_yb_mc_probe,
+};
+
+module_platform_driver(snd_cht_yb_mc_driver);
+
+MODULE_DESCRIPTION("Lenovo Yoga Book YB1-X9x machine driver");
+MODULE_AUTHOR("Yauhen Kharuzhy");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:cht-yogabook");

-- 
2.51.0

