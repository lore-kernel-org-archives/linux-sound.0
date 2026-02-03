Received: from smtp134-89.sina.com.cn (smtp134-89.sina.com.cn [180.149.134.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F41367F48
	for <linux-sound@vger.kernel.org>; Tue,  3 Feb 2026 05:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=180.149.134.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770096275; cv=none; b=Ec/Opp54mbHdT7PMDC5h/6oYWWWSzyLRR6e1fmbMheZG7KvBqm3+PAbjJSYtFWKQBMwsnhtWL/MITwGf9piZ13xao1ZIXMdNRg+ckgWDdsKuM/DVTHim7FS4UID2+WY4MID+ypd0OVf4P4Jwqr6T9eYzlMtCTV6PyKKp9ToRRc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770096275; c=relaxed/simple;
	bh=j8+/OCf1bJoWtnfyVAOZJ23qKLwGjZEd6E6TCsuzSz8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=ITvigeBV7AgeN3RRpR4FQOxENGEPMZiHIRisJwjqVA/YsZDOM23qK7JRVZCqUJHAfDnYI4wl0cNhlesXYExNVWV+35ZlaykejMHM5ApGeLmWHxA3YdSCzzW0B0BOpbsqA51OTAuzWxZ0KSvO8fq0wa3YSneJA/ANQL3B3X4AKvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=180.149.134.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.154.36.64])
	by sina.net (10.185.250.31) with ESMTP
	id 6981867B00003F3F; Tue, 3 Feb 2026 13:24:22 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: A5DFBA7B16924AB4A18AABAD0C6394A9
X-SMAIL-UIID: A5DFBA7B16924AB4A18AABAD0C6394A9-20260203-132422
From: Zhang Yi <zhangyi@everest-semi.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	linux-sound@vger.kernel.org
Cc: peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH 4/6] ASoC: es9356-sdca: Add ES9356 SDCA driver
Date: Tue,  3 Feb 2026 13:24:04 +0800
Message-Id: <20260203052406.28562-5-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260203052406.28562-1-zhangyi@everest-semi.com>
References: <20260203052406.28562-1-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

This is the codec driver for es9356-sdca.

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/codecs/Kconfig  |    6 +
 sound/soc/codecs/Makefile |    2 +
 sound/soc/codecs/es9356.c | 1483 +++++++++++++++++++++++++++++++++++++
 sound/soc/codecs/es9356.h |  218 ++++++
 4 files changed, 1709 insertions(+)
 create mode 100644 sound/soc/codecs/es9356.c
 create mode 100644 sound/soc/codecs/es9356.h

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index d09de0ff5..afd0e0585 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -123,6 +123,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_ES8328_I2C
 	imply SND_SOC_ES8375
 	imply SND_SOC_ES8389
+	imply SND_SOC_ES9356
 	imply SND_SOC_ES7134
 	imply SND_SOC_ES7241
 	imply SND_SOC_FRAMER
@@ -1284,6 +1285,11 @@ config SND_SOC_ES8389
 	tristate "Everest Semi ES8389 CODEC"
 	depends on I2C
 
+config SND_SOC_ES9356
+        tristate "Everest Semi ES9356 CODEC SDW"
+        depends on SOUNDWIRE
+        select REGMAP_SOUNDWIRE
+
 config SND_SOC_FRAMER
 	tristate "Framer codec"
 	depends on GENERIC_FRAMER
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index c3568de5e..ba8b6187b 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -138,6 +138,7 @@ snd-soc-es8328-i2c-y := es8328-i2c.o
 snd-soc-es8328-spi-y := es8328-spi.o
 snd-soc-es8375-y := es8375.o
 snd-soc-es8389-y := es8389.o
+snd-soc-es9356-y := es9356.o
 snd-soc-framer-y := framer-codec.o
 snd-soc-fs-amp-lib-y := fs-amp-lib.o
 snd-soc-fs210x-y := fs210x.o
@@ -574,6 +575,7 @@ obj-$(CONFIG_SND_SOC_ES8328_I2C)+= snd-soc-es8328-i2c.o
 obj-$(CONFIG_SND_SOC_ES8328_SPI)+= snd-soc-es8328-spi.o
 obj-$(CONFIG_SND_SOC_ES8375)    += snd-soc-es8375.o
 obj-$(CONFIG_SND_SOC_ES8389)    += snd-soc-es8389.o
+obj-$(CONFIG_SND_SOC_ES9356)    += snd-soc-es9356.o
 obj-$(CONFIG_SND_SOC_FRAMER)	+= snd-soc-framer.o
 obj-$(CONFIG_SND_SOC_FS_AMP_LIB)+= snd-soc-fs-amp-lib.o
 obj-$(CONFIG_SND_SOC_FS210X)	+= snd-soc-fs210x.o
diff --git a/sound/soc/codecs/es9356.c b/sound/soc/codecs/es9356.c
new file mode 100644
index 000000000..5e90f6be6
--- /dev/null
+++ b/sound/soc/codecs/es9356.c
@@ -0,0 +1,1483 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// es9356.c -- SoundWire codec driver
+//
+// Copyright(c) Everest Semiconductor Co., Ltd
+//
+//
+
+#include <linux/device.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_type.h>
+#include <linux/soundwire/sdw_registers.h>
+#include <sound/core.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <linux/pm_runtime.h>
+#include <sound/sdw.h>
+#include <sound/soc.h>
+#include <sound/soc-dapm.h>
+#include <sound/tlv.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <sound/jack.h>
+#include "es9356.h"
+
+struct  es9356_sdw_priv {
+	struct sdw_slave *slave;
+	struct device *dev;
+	struct regmap *regmap;
+	struct snd_soc_component *component;
+	struct snd_soc_jack *hs_jack;
+
+	struct mutex lock;
+	struct mutex disable_irq_lock;
+	bool hw_init;
+	bool first_hw_init;
+	int jack_type;
+
+	struct delayed_work jack_detect_work;
+	struct delayed_work button_detect_work;
+	unsigned int sdca_status;
+};
+
+static int es9356_sdw_component_probe(struct snd_soc_component *component)
+{
+	struct es9356_sdw_priv *es9356 = snd_soc_component_get_drvdata(component);
+
+	es9356->component = component;
+
+	return 0;
+}
+
+static int es9356_sdca_set_gain_put(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+	struct es9356_sdw_priv *es9356 = snd_soc_component_get_drvdata(component);
+	unsigned int regv = 0;
+	unsigned int gain = 0;
+	int ret, changed = 0;
+
+	ret = pm_runtime_get_sync(&es9356->slave->dev);
+	if (ret < 0 && ret != -EACCES) {
+		dev_info(&es9356->slave->dev, "%s:Failed to enable clock : %d\n", __func__, ret);
+		return ret;
+	}
+
+	if (ucontrol->value.integer.value[0] > mc->max) {
+		changed = -EINVAL;
+		goto out;
+	}
+
+	regmap_read(es9356->regmap, SDW_SDCA_REG_MBQ(mc->reg), &regv);
+	regv /= 6;
+	if (regv != ucontrol->value.integer.value[0])
+		changed = 1;
+	else
+		goto out;
+
+	regv = 6 * ucontrol->value.integer.value[0];
+	regmap_write(es9356->regmap, SDW_SDCA_REG_MBQ(mc->reg), regv);
+	regmap_write(es9356->regmap, mc->reg, 0x00);
+
+	regmap_read(es9356->regmap, SDW_SDCA_REG_MBQ(mc->reg), &gain);
+
+out:
+	if (ret >= 0) {
+		pm_runtime_mark_last_busy(&es9356->slave->dev);
+		pm_runtime_put_autosuspend(&es9356->slave->dev);
+	} else if (ret == -EACCES) {
+		pm_runtime_mark_last_busy(&es9356->slave->dev);
+	}
+
+	if (regv == gain)
+		return changed;
+
+	return -EIO;
+}
+
+static int es9356_sdca_set_gain_get(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct es9356_sdw_priv *es9356 = snd_soc_component_get_drvdata(component);
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+	unsigned int regv;
+	int ret;
+
+	ret = pm_runtime_get_sync(&es9356->slave->dev);
+	if (ret < 0 && ret != -EACCES) {
+		dev_info(&es9356->slave->dev, "%s:Failed to enable clock : %d\n", __func__, ret);
+		return ret;
+	}
+
+	regmap_read(es9356->regmap, SDW_SDCA_REG_MBQ(mc->reg), &regv);
+
+	if (ret >= 0) {
+		pm_runtime_mark_last_busy(&es9356->slave->dev);
+		pm_runtime_put_autosuspend(&es9356->slave->dev);
+	} else if (ret == -EACCES) {
+		pm_runtime_mark_last_busy(&es9356->slave->dev);
+	}
+
+	ucontrol->value.integer.value[0] = regv / 6;
+	return 0;
+}
+
+static int es9356_sdca_set_volume_put(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+	struct es9356_sdw_priv *es9356 = snd_soc_component_get_drvdata(component);
+	unsigned int ctl_l = 0, ctl_r = 0;
+	u8 gain_l_val, gain_ll_val;
+	u8 gain_r_val, gain_rl_val;
+	unsigned int read_l, read_r, read_ll, read_rl;
+	unsigned int changed = 0;
+	int ret;
+
+	ret = pm_runtime_get_sync(&es9356->slave->dev);
+	if (ret < 0 && ret != -EACCES) {
+		dev_info(&es9356->slave->dev, "%s:Failed to enable clock : %d\n", __func__, ret);
+		return ret;
+	}
+
+	ctl_l = ucontrol->value.integer.value[0] - 768;
+	ctl_r = ucontrol->value.integer.value[1] - 768;
+
+	gain_l_val = (ctl_l & 0x07F8) >> 3;
+	gain_ll_val = (ctl_l & 0x0007) << 5;
+	gain_r_val = (ctl_r & 0x07F8) >> 3;
+	gain_rl_val = (ctl_r & 0x0007) << 5;
+
+	regmap_read(es9356->regmap, mc->reg, &read_ll);
+	regmap_read(es9356->regmap, SDW_SDCA_REG_MBQ(mc->reg), &read_l);
+	regmap_read(es9356->regmap, mc->rreg, &read_rl);
+	regmap_read(es9356->regmap, SDW_SDCA_REG_MBQ(mc->rreg), &read_r);
+
+	if (gain_ll_val != read_ll || gain_rl_val != read_rl
+		|| gain_l_val != read_l || gain_r_val != read_r)
+		changed = 1;
+	else
+		goto out;
+
+	regmap_write(es9356->regmap, SDW_SDCA_REG_MBQ(mc->reg), gain_l_val);
+	regmap_write(es9356->regmap, mc->reg, gain_ll_val);
+	regmap_write(es9356->regmap, SDW_SDCA_REG_MBQ(mc->rreg), gain_r_val);
+	regmap_write(es9356->regmap, mc->rreg, gain_rl_val);
+
+	regmap_read(es9356->regmap, mc->reg, &read_ll);
+	regmap_read(es9356->regmap, SDW_SDCA_REG_MBQ(mc->reg), &read_l);
+	regmap_read(es9356->regmap, mc->rreg, &read_rl);
+	regmap_read(es9356->regmap, SDW_SDCA_REG_MBQ(mc->rreg), &read_r);
+
+out:
+	if (ret >= 0) {
+		pm_runtime_mark_last_busy(&es9356->slave->dev);
+		pm_runtime_put_autosuspend(&es9356->slave->dev);
+	} else if (ret == -EACCES) {
+		pm_runtime_mark_last_busy(&es9356->slave->dev);
+	}
+
+	if (gain_ll_val == read_ll && gain_rl_val == read_rl
+		&& gain_l_val == read_l && gain_r_val == read_r) {
+		return changed;
+	}
+	return -EIO;
+}
+
+static int es9356_sdca_set_volume_get(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct es9356_sdw_priv *es9356 = snd_soc_component_get_drvdata(component);
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+	unsigned int read_l, read_r, read_ll, read_rl;
+	int16_t ctl_l = 0, ctl_r = 0;
+	int ret;
+
+	ret = pm_runtime_get_sync(&es9356->slave->dev);
+	if (ret < 0 && ret != -EACCES) {
+		dev_info(&es9356->slave->dev, "%s:Failed to enable clock : %d\n", __func__, ret);
+		return ret;
+	}
+
+	regmap_read(es9356->regmap, mc->reg, &read_ll);
+	regmap_read(es9356->regmap, SDW_SDCA_REG_MBQ(mc->reg), &read_l);
+	regmap_read(es9356->regmap, mc->rreg, &read_rl);
+	regmap_read(es9356->regmap, SDW_SDCA_REG_MBQ(mc->rreg), &read_r);
+
+	ctl_l = ((int16_t)(read_l << 8 | read_ll)) >> 5;
+	ctl_r = ((int16_t)(read_r << 8 | read_rl)) >> 5;
+
+	ucontrol->value.integer.value[0] = ctl_l + 768;
+	ucontrol->value.integer.value[1] = ctl_r + 768;
+
+	if (ret >= 0) {
+		pm_runtime_mark_last_busy(&es9356->slave->dev);
+		pm_runtime_put_autosuspend(&es9356->slave->dev);
+	} else if (ret == -EACCES) {
+		pm_runtime_mark_last_busy(&es9356->slave->dev);
+	}
+
+	return 0;
+}
+
+static const DECLARE_TLV_DB_SCALE(out_vol_tlv, -9600, 12, 0);
+static const DECLARE_TLV_DB_SCALE(amic_gain_tlv, 0, 3, 0);
+static const DECLARE_TLV_DB_SCALE(dmic_gain_tlv, 0, 6, 0);
+
+static const struct snd_kcontrol_new es9356_sdca_controls[] = {
+	/* Headphone playback settings */
+	SOC_DOUBLE_R_EXT_TLV("FU41 Playback Volume",
+		SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU41,
+			ES9356_SDCA_CTL_FU_VOLUME, CH_L),
+		SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU41,
+			ES9356_SDCA_CTL_FU_VOLUME, CH_R), 0, 0x41F, 0,
+		es9356_sdca_set_volume_get, es9356_sdca_set_volume_put, out_vol_tlv),
+	/* Headset mic capture settings */
+	SOC_DOUBLE_R_EXT_TLV("FU36 Capture Volume",
+		SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU36,
+			ES9356_SDCA_CTL_FU_VOLUME, CH_L),
+		SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU36,
+			ES9356_SDCA_CTL_FU_VOLUME, CH_R), 0, 0x41F, 0,
+		es9356_sdca_set_volume_get, es9356_sdca_set_volume_put, out_vol_tlv),
+	SOC_SINGLE_EXT_TLV("FU33 Capture Gain",
+		SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU33,
+			ES9356_SDCA_CTL_FU_CH_GAIN, 0), 0, 0x0a, 0,
+		es9356_sdca_set_gain_get, es9356_sdca_set_gain_put, amic_gain_tlv),
+	/* SPK playback settings */
+	SOC_DOUBLE_R_EXT_TLV("FU21 Playback Volume",
+		SDW_SDCA_CTL(FUNC_NUM_AMP, ES9356_SDCA_ENT_FU21,
+			ES9356_SDCA_CTL_FU_VOLUME, CH_L),
+		SDW_SDCA_CTL(FUNC_NUM_AMP, ES9356_SDCA_ENT_FU21,
+			ES9356_SDCA_CTL_FU_VOLUME, CH_R), 0, 0x41F, 0,
+		es9356_sdca_set_volume_get, es9356_sdca_set_volume_put, out_vol_tlv),
+	/* Dmic capture settings */
+	SOC_DOUBLE_R_EXT_TLV("FU113 Capture Volume",
+		SDW_SDCA_CTL(FUNC_NUM_MIC, ES9356_SDCA_ENT_FU113,
+			ES9356_SDCA_CTL_FU_VOLUME, CH_L),
+		SDW_SDCA_CTL(FUNC_NUM_MIC, ES9356_SDCA_ENT_FU113,
+			ES9356_SDCA_CTL_FU_VOLUME, CH_R), 0, 0x41F, 0,
+		es9356_sdca_set_volume_get, es9356_sdca_set_volume_put, out_vol_tlv),
+	SOC_SINGLE_EXT_TLV("FU11 Capture Gain",
+		SDW_SDCA_CTL(FUNC_NUM_MIC, ES9356_SDCA_ENT_FU11,
+			ES9356_SDCA_CTL_FU_CH_GAIN, 0), 0, 0x03, 0,
+		es9356_sdca_set_gain_get, es9356_sdca_set_gain_put, dmic_gain_tlv),
+};
+
+static const char *const es9356_left_mux_txt[] = {
+	"From Left",
+	"From Right",
+};
+
+static const char *const es9356_right_mux_txt[] = {
+	"From Right",
+	"From Left",
+};
+
+static const struct soc_enum es9356_left_mux_enum =
+	SOC_ENUM_SINGLE(ES9356_DAC_SWAP, 1,
+			ARRAY_SIZE(es9356_left_mux_txt), es9356_left_mux_txt);
+static const struct soc_enum es9356_right_mux_enum =
+	SOC_ENUM_SINGLE(ES9356_DAC_SWAP, 0,
+			ARRAY_SIZE(es9356_right_mux_txt), es9356_right_mux_txt);
+
+static const struct snd_kcontrol_new es9356_left_mux_controls =
+	SOC_DAPM_ENUM("Channel MUX", es9356_left_mux_enum);
+static const struct snd_kcontrol_new es9356_right_mux_controls =
+	SOC_DAPM_ENUM("Channel MUX", es9356_right_mux_enum);
+
+static void es9356_pde_transition_delay(struct es9356_sdw_priv *es9356, unsigned char func,
+	unsigned char entity, unsigned char ps)
+{
+	unsigned int delay = 1000, val;
+
+	pm_runtime_mark_last_busy(&es9356->slave->dev);
+
+	/* waiting for Actual PDE becomes to PS0/PS3 */
+	while (delay) {
+		regmap_read(es9356->regmap,
+			SDW_SDCA_HCTL(func, entity, ES9356_SDCA_CTL_ACTUAL_POWER_STATE, 0), &val);
+		if (val == ps)
+			break;
+
+		usleep_range(1000, 1500);
+		delay--;
+	}
+	if (!delay) {
+		dev_warn(&es9356->slave->dev, "%s PDE to %s is NOT ready", __func__, ps?"PS3":"PS0");
+	}
+}
+
+static int es9356_sdca_pde23_event(struct snd_soc_dapm_widget *w,
+	struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(w->dapm);
+	struct es9356_sdw_priv *es9356 = snd_soc_component_get_drvdata(component);
+	unsigned char ps0 = 0x0, ps3 = 0x3;
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		regmap_write(es9356->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_AMP, ES9356_SDCA_ENT_PDE23, ES9356_SDCA_CTL_REQ_POWER_STATE, 0), ps0);
+		es9356_pde_transition_delay(es9356, FUNC_NUM_AMP, ES9356_SDCA_ENT_PDE23, ps0);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		regmap_write(es9356->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_AMP, ES9356_SDCA_ENT_PDE23, ES9356_SDCA_CTL_REQ_POWER_STATE, 0), ps3);
+		es9356_pde_transition_delay(es9356, FUNC_NUM_AMP, ES9356_SDCA_ENT_PDE23, ps3);
+		break;
+	}
+	return 0;
+}
+
+static int es9356_sdca_pde11_event(struct snd_soc_dapm_widget *w,
+	struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(w->dapm);
+	struct es9356_sdw_priv *es9356 = snd_soc_component_get_drvdata(component);
+	unsigned char ps0 = 0x0, ps3 = 0x3;
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		regmap_write(es9356->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_MIC, ES9356_SDCA_ENT_PDE11, ES9356_SDCA_CTL_REQ_POWER_STATE, 0), ps0);
+		es9356_pde_transition_delay(es9356, FUNC_NUM_MIC, ES9356_SDCA_ENT_PDE11, ps0);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		regmap_write(es9356->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_MIC, ES9356_SDCA_ENT_PDE11, ES9356_SDCA_CTL_REQ_POWER_STATE, 0), ps3);
+		es9356_pde_transition_delay(es9356, FUNC_NUM_MIC, ES9356_SDCA_ENT_PDE11, ps3);
+		break;
+	}
+	return 0;
+}
+
+static int es9356_sdca_pde47_event(struct snd_soc_dapm_widget *w,
+	struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(w->dapm);
+	struct es9356_sdw_priv *es9356 = snd_soc_component_get_drvdata(component);
+	unsigned char ps0 = 0x0, ps3 = 0x3;
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		regmap_write(es9356->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_PDE47, ES9356_SDCA_CTL_REQ_POWER_STATE, 0), ps0);
+		es9356_pde_transition_delay(es9356, FUNC_NUM_UAJ, ES9356_SDCA_ENT_PDE47, ps0);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		regmap_write(es9356->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_PDE47, ES9356_SDCA_CTL_REQ_POWER_STATE, 0), ps3);
+		es9356_pde_transition_delay(es9356, FUNC_NUM_UAJ, ES9356_SDCA_ENT_PDE47, ps3);
+		break;
+	}
+	return 0;
+}
+
+static int es9356_sdca_pde34_event(struct snd_soc_dapm_widget *w,
+	struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(w->dapm);
+	struct es9356_sdw_priv *es9356 = snd_soc_component_get_drvdata(component);
+	unsigned char ps0 = 0x0, ps3 = 0x3;
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		regmap_write(es9356->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_PDE34, ES9356_SDCA_CTL_REQ_POWER_STATE, 0), ps0);
+		es9356_pde_transition_delay(es9356, FUNC_NUM_UAJ, ES9356_SDCA_ENT_PDE34, ps0);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		regmap_write(es9356->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_PDE34, ES9356_SDCA_CTL_REQ_POWER_STATE, 0), ps3);
+		es9356_pde_transition_delay(es9356, FUNC_NUM_UAJ, ES9356_SDCA_ENT_PDE34, ps3);
+		break;
+	}
+	return 0;
+}
+
+static int es9356_sdca_fu21_event(struct snd_soc_dapm_widget *w,
+	struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(w->dapm);
+	struct es9356_sdw_priv *es9356 = snd_soc_component_get_drvdata(component);
+	unsigned char unmute = 0x0, mute = 0x1;
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		regmap_write(es9356->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_AMP, ES9356_SDCA_ENT_FU21, ES9356_SDCA_CTL_FU_MUTE, CH_L), unmute);
+		regmap_write(es9356->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_AMP, ES9356_SDCA_ENT_FU21, ES9356_SDCA_CTL_FU_MUTE, CH_R), unmute);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		regmap_write(es9356->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_AMP, ES9356_SDCA_ENT_FU21, ES9356_SDCA_CTL_FU_MUTE, CH_L), mute);
+		regmap_write(es9356->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_AMP, ES9356_SDCA_ENT_FU21, ES9356_SDCA_CTL_FU_MUTE, CH_R), mute);
+		break;
+	}
+	return 0;
+}
+
+static int es9356_sdca_fu41_event(struct snd_soc_dapm_widget *w,
+	struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(w->dapm);
+	struct es9356_sdw_priv *es9356 = snd_soc_component_get_drvdata(component);
+	unsigned char unmute = 0x0, mute = 0x1;
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		regmap_write(es9356->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU41, ES9356_SDCA_CTL_FU_MUTE, CH_L), unmute);
+		regmap_write(es9356->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU41, ES9356_SDCA_CTL_FU_MUTE, CH_R), unmute);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		regmap_write(es9356->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU41, ES9356_SDCA_CTL_FU_MUTE, CH_L), mute);
+		regmap_write(es9356->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU41, ES9356_SDCA_CTL_FU_MUTE, CH_R), mute);
+		break;
+	}
+	return 0;
+}
+
+static int es9356_sdca_fu113_event(struct snd_soc_dapm_widget *w,
+	struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(w->dapm);
+	struct es9356_sdw_priv *es9356 = snd_soc_component_get_drvdata(component);
+	unsigned char unmute = 0x0, mute = 0x1;
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		regmap_write(es9356->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_MIC, ES9356_SDCA_ENT_FU113, ES9356_SDCA_CTL_FU_MUTE, CH_L), unmute);
+		regmap_write(es9356->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_MIC, ES9356_SDCA_ENT_FU113, ES9356_SDCA_CTL_FU_MUTE, CH_R), unmute);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		regmap_write(es9356->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_MIC, ES9356_SDCA_ENT_FU113, ES9356_SDCA_CTL_FU_MUTE, CH_L), mute);
+		regmap_write(es9356->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_MIC, ES9356_SDCA_ENT_FU113, ES9356_SDCA_CTL_FU_MUTE, CH_R), mute);
+		break;
+	}
+	return 0;
+}
+
+static int es9356_sdca_fu36_event(struct snd_soc_dapm_widget *w,
+	struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(w->dapm);
+	struct es9356_sdw_priv *es9356 = snd_soc_component_get_drvdata(component);
+	unsigned char unmute = 0x0, mute = 0x1;
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		regmap_write(es9356->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU36, ES9356_SDCA_CTL_FU_MUTE, CH_L), unmute);
+		regmap_write(es9356->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU36, ES9356_SDCA_CTL_FU_MUTE, CH_R), unmute);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		regmap_write(es9356->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU36, ES9356_SDCA_CTL_FU_MUTE, CH_L), mute);
+		regmap_write(es9356->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU36, ES9356_SDCA_CTL_FU_MUTE, CH_R), mute);
+		break;
+	}
+	return 0;
+}
+
+static const struct snd_soc_dapm_widget es9356_dapm_widgets[] = {
+	SND_SOC_DAPM_OUTPUT("HP"),
+	SND_SOC_DAPM_OUTPUT("SPK"),
+	SND_SOC_DAPM_INPUT("MIC1"),
+	SND_SOC_DAPM_INPUT("PDM_DIN"),
+
+	SND_SOC_DAPM_SUPPLY("DMIC Clock", ES9356_DMIC_GPIO, 1, 1, NULL, 0),
+
+	SND_SOC_DAPM_AIF_IN("DP4RX", "DP4 Playback", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("DP3RX", "DP3 Playback", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("DP1TX", "DP1 Capture", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("DP2TX", "DP2 Capture", 0, SND_SOC_NOPM, 0, 0),
+
+	SND_SOC_DAPM_PGA("IF DP3RXL", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("IF DP3RXR", SND_SOC_NOPM, 0, 0, NULL, 0),
+
+	SND_SOC_DAPM_MUX("Left Channel MUX", SND_SOC_NOPM, 0, 0, &es9356_left_mux_controls),
+	SND_SOC_DAPM_MUX("Right Channel MUX", SND_SOC_NOPM, 0, 0, &es9356_right_mux_controls),
+
+	SND_SOC_DAPM_SUPPLY("PDE 23", SND_SOC_NOPM, 0, 0,
+		es9356_sdca_pde23_event,
+		SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+	SND_SOC_DAPM_SUPPLY("PDE 11", SND_SOC_NOPM, 0, 0,
+		es9356_sdca_pde11_event,
+		SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+	SND_SOC_DAPM_SUPPLY("PDE 47", SND_SOC_NOPM, 0, 0,
+		es9356_sdca_pde47_event,
+		SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+	SND_SOC_DAPM_SUPPLY("PDE 34", SND_SOC_NOPM, 0, 0,
+		es9356_sdca_pde34_event,
+		SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+
+	SND_SOC_DAPM_DAC_E("FU 21", NULL, SND_SOC_NOPM, 0, 0,
+		es9356_sdca_fu21_event,
+		SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+	SND_SOC_DAPM_DAC_E("FU 41", NULL, SND_SOC_NOPM, 0, 0,
+		es9356_sdca_fu41_event,
+		SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+	SND_SOC_DAPM_ADC_E("FU 113", NULL, SND_SOC_NOPM, 0, 0,
+		es9356_sdca_fu113_event,
+		SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+	SND_SOC_DAPM_ADC_E("FU 36", NULL, SND_SOC_NOPM, 0, 0,
+		es9356_sdca_fu36_event,
+		SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+};
+
+static const struct snd_soc_dapm_route es9356_audio_map[] = {
+	{"FU 36", NULL, "MIC1"},
+	{"DP2TX", NULL, "PDE 34"},
+	{"DP2TX", NULL, "FU 36"},
+
+	{"PDM_DIN", NULL, "DMIC Clock"},
+	{"FU 113", NULL, "PDM_DIN"},
+	{"DP1TX", NULL, "PDE 11"},
+	{"DP1TX", NULL, "FU 113"},
+
+	{"FU 41", NULL, "DP4RX"},
+
+	{"IF DP3RXL", NULL, "DP3RX"},
+	{"IF DP3RXR", NULL, "DP3RX"},
+
+	{"Left Channel MUX", "From Left", "IF DP3RXL"},
+	{"Left Channel MUX", "From Right", "IF DP3RXR"},
+	{"Right Channel MUX", "From Left", "IF DP3RXL"},
+	{"Right Channel MUX", "From Right", "IF DP3RXR"},
+
+	{"FU 21", NULL, "Left Channel MUX"},
+	{"FU 21", NULL, "Right Channel MUX"},
+
+	{"SPK", NULL, "PDE 23"},
+	{"SPK", NULL, "FU 21"},
+
+	{"HP", NULL, "PDE 47"},
+	{"HP", NULL, "FU 41"},
+
+};
+
+static void es9356_sdca_jack_init(struct es9356_sdw_priv *es9356)
+{
+	mutex_lock(&es9356->lock);
+
+	if (es9356->hs_jack) {
+		sdw_write_no_pm(es9356->slave, SDW_SCP_SDCA_INTMASK1, SDW_SCP_SDCA_INTMASK_SDCA_7);
+		sdw_write_no_pm(es9356->slave, SDW_SCP_SDCA_INTMASK1,
+			(SDW_SCP_SDCA_INTMASK_SDCA_7 | SDW_SCP_SDCA_INTMASK_SDCA_5 | SDW_SCP_SDCA_INTMASK_SDCA_1));
+	}
+
+	mutex_unlock(&es9356->lock);
+}
+
+static int es9356_set_jack_detect(struct snd_soc_component *component,
+	struct snd_soc_jack *hs_jack, void *data)
+{
+	struct es9356_sdw_priv *es9356 = snd_soc_component_get_drvdata(component);
+	int ret;
+
+	es9356->hs_jack = hs_jack;
+	ret = pm_runtime_resume_and_get(component->dev);
+	if (ret < 0) {
+		if (ret != -EACCES) {
+			dev_err(component->dev, "%s: failed to resume %d\n", __func__, ret);
+			return ret;
+		}
+		/* pm_runtime not enabled yet */
+		dev_info(component->dev, "%s: skipping jack init for now\n", __func__);
+		return 0;
+	}
+
+	es9356_sdca_jack_init(es9356);
+
+	pm_runtime_mark_last_busy(component->dev);
+	pm_runtime_put_autosuspend(component->dev);
+
+	return 0;
+}
+static const struct snd_soc_component_driver snd_soc_es9356_sdw_component = {
+	.probe = es9356_sdw_component_probe,
+	.controls = es9356_sdca_controls,
+	.num_controls = ARRAY_SIZE(es9356_sdca_controls),
+	.dapm_widgets = es9356_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(es9356_dapm_widgets),
+	.dapm_routes = es9356_audio_map,
+	.num_dapm_routes = ARRAY_SIZE(es9356_audio_map),
+	.set_jack = es9356_set_jack_detect,
+	.endianness = 1,
+};
+
+static int es9356_sdw_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
+				     int direction)
+{
+	snd_soc_dai_dma_data_set(dai, direction, sdw_stream);
+
+	return 0;
+}
+
+static void es9356_sdw_shutdown(struct snd_pcm_substream *substream,
+				struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct es9356_sdw_priv *es9356 = snd_soc_component_get_drvdata(component);
+
+	regmap_write(es9356->regmap, SDW_SCP_SYSTEMCTRL, SDW_SCP_SYSTEMCTRL_WAKE_UP_EN | SDW_SCP_SYSTEMCTRL_CLK_STP_PREP);
+
+	snd_soc_dai_set_dma_data(dai, substream, NULL);
+}
+
+static int es9356_sdca_button(unsigned int *buffer)
+{
+	static int cur_button;
+
+	if (*(buffer + 1) | *(buffer + 2))
+		return -EINVAL;
+	switch (*buffer) {
+	case 0x00:
+		cur_button = 0;
+		break;
+	case 0x20:
+		cur_button = SND_JACK_BTN_5;
+		break;
+	case 0x10:
+		cur_button = SND_JACK_BTN_3;
+		break;
+	case 0x08:
+		cur_button = SND_JACK_BTN_2;
+		break;
+	case 0x02:
+		cur_button = SND_JACK_BTN_4;
+		break;
+	case 0x01:
+		cur_button = SND_JACK_BTN_0;
+		break;
+	default:
+		break;
+	}
+
+	return cur_button;
+}
+
+static int es9356_sdca_button_detect(struct es9356_sdw_priv *es9356)
+{
+	unsigned int btn_type = 0, offset, idx, val, owner;
+	int ret;
+	unsigned int button[3];
+
+	ret = regmap_read(es9356->regmap,
+		SDW_SDCA_HCTL(FUNC_NUM_HID, ES9356_SDCA_ENT_HID01, ES9356_SDCA_CTL_HIDTX_CURRENT_OWNER, 0), &owner);
+	if (ret < 0 || owner == 0x01)
+		return 0;
+
+	ret = regmap_read(es9356->regmap, ES9356_BUF_ADDR_HID, &offset);
+		if (ret < 0)
+			goto button_det_end;
+
+	for (idx = 0; idx < ARRAY_SIZE(button); idx++) {
+		ret = regmap_read(es9356->regmap, ES9356_BUF_ADDR_HID + offset + idx, &val);
+		if (ret < 0)
+			goto button_det_end;
+		button[idx] = val;
+	}
+
+	btn_type = es9356_sdca_button(&button[0]);
+
+button_det_end:
+	if (owner == 0x00)
+		regmap_write(es9356->regmap,
+			SDW_SDCA_HCTL(FUNC_NUM_HID, ES9356_SDCA_ENT_HID01, ES9356_SDCA_CTL_HIDTX_CURRENT_OWNER, 0), 0x01);
+
+	return btn_type;
+}
+
+static int es9356_sdca_headset_detect(struct es9356_sdw_priv *es9356)
+{
+	unsigned int reg;
+	int ret;
+
+	regmap_read(es9356->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_GE35, ES9356_SDCA_CTL_DETECTED_MODE, 0), &reg);
+
+	if (ret < 0)
+		goto io_error;
+
+	switch (reg) {
+	case 0x00:
+		es9356->jack_type = 0;
+		break;
+	case 0x03:
+		es9356->jack_type = SND_JACK_HEADPHONE;
+		break;
+	case 0x04:
+		es9356->jack_type = SND_JACK_HEADSET;
+		break;
+	}
+
+	if (reg) {
+		ret = regmap_write(es9356->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_GE35, ES9356_SDCA_CTL_SELECTED_MODE, 0), reg);
+		if (ret < 0)
+			goto io_error;
+		ret = regmap_write(es9356->regmap, ES9356_HP_DETECTTIME, 0x75);
+	} else {
+		ret = regmap_write(es9356->regmap, ES9356_HP_DETECTTIME, 0xa4);
+	}
+
+	return 0;
+
+io_error:
+	pr_err_ratelimited("IO error in %s, ret %d\n", __func__, ret);
+	return ret;
+}
+
+static void es9356_jack_detect_handler(struct work_struct *work)
+{
+	struct es9356_sdw_priv *es9356 =
+		container_of(work, struct es9356_sdw_priv, jack_detect_work.work);
+	unsigned int reg;
+	int ret, btn_type = 0;
+
+	if (!es9356->hs_jack)
+		return;
+
+	if (!es9356->component->card || !es9356->component->card->instantiated)
+		return;
+
+	if (es9356->sdca_status & SDW_SCP_SDCA_INT_SDCA_7) {
+		btn_type = es9356_sdca_button_detect(es9356);
+		if (btn_type < 0)
+			return;
+	} else {
+		ret = es9356_sdca_headset_detect(es9356);
+		if (ret < 0)
+			return;
+	}
+
+	if (es9356->jack_type != SND_JACK_HEADSET)
+		btn_type = 0;
+
+	snd_soc_jack_report(es9356->hs_jack, es9356->jack_type | btn_type,
+			SND_JACK_HEADSET |
+			SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+			SND_JACK_BTN_2 | SND_JACK_BTN_3 |
+			SND_JACK_BTN_4 | SND_JACK_BTN_5);
+
+	if (btn_type) {
+		snd_soc_jack_report(es9356->hs_jack, es9356->jack_type,
+			SND_JACK_HEADSET |
+			SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+			SND_JACK_BTN_2 | SND_JACK_BTN_3 |
+			SND_JACK_BTN_4 | SND_JACK_BTN_5);
+		mod_delayed_work(system_power_efficient_wq,
+			&es9356->button_detect_work, msecs_to_jiffies(280));
+	}
+}
+
+static void es9356_button_detect_handler(struct work_struct *work)
+{
+	struct es9356_sdw_priv *es9356 =
+		container_of(work, struct es9356_sdw_priv, button_detect_work.work);
+	unsigned int reg, offset;
+	int ret, idx, btn_type = 0;
+	unsigned int button[3];
+
+	regmap_read(es9356->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_GE35, ES9356_SDCA_CTL_DETECTED_MODE, 0), &reg);
+
+	if (ret < 0)
+		goto io_error;
+
+	if (reg == 0x04) {
+		ret = regmap_read(es9356->regmap, ES9356_BUF_ADDR_HID, &offset);
+		if (ret < 0)
+			goto io_error;
+		for (idx = 0; idx < ARRAY_SIZE(button); idx++) {
+			ret = regmap_read(es9356->regmap, ES9356_BUF_ADDR_HID + offset + idx, &reg);
+			if (ret < 0)
+				goto io_error;
+			button[idx] = reg;
+		}
+		btn_type = es9356_sdca_button(&button[0]);
+	}
+
+	snd_soc_jack_report(es9356->hs_jack, btn_type,
+			SND_JACK_HEADSET |
+			SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+			SND_JACK_BTN_2 | SND_JACK_BTN_3 |
+			SND_JACK_BTN_4 | SND_JACK_BTN_5);
+
+	if (btn_type) {
+		snd_soc_jack_report(es9356->hs_jack, es9356->jack_type,
+			SND_JACK_HEADSET |
+			SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+			SND_JACK_BTN_2 | SND_JACK_BTN_3 |
+			SND_JACK_BTN_4 | SND_JACK_BTN_5);
+		mod_delayed_work(system_power_efficient_wq,
+			&es9356->button_detect_work, msecs_to_jiffies(280));
+	}
+
+	return;
+io_error:
+	pr_err_ratelimited("IO error in %s, ret %d\n", __func__, ret);
+}
+
+static int es9356_sdw_pcm_hw_params(struct snd_pcm_substream *substream,
+				    struct snd_pcm_hw_params *params,
+				    struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct es9356_sdw_priv *es9356 = snd_soc_component_get_drvdata(component);
+	struct sdw_stream_config stream_config = {0};
+	struct sdw_port_config port_config = {0};
+	struct sdw_stream_runtime *sdw_stream = snd_soc_dai_get_dma_data(dai, substream);
+	enum sdw_data_direction direction;
+	int ret, num_channels;
+	unsigned int rate;
+
+	if (!sdw_stream)
+		return -EINVAL;
+
+	if (!es9356->slave)
+		return -EINVAL;
+
+	/* SoundWire specific configuration */
+	snd_sdw_params_to_config(substream, params, &stream_config, &port_config);
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		port_config.num = dai->id;
+	} else {
+		port_config.num = dai->id;
+	}
+
+	ret = sdw_stream_add_slave(es9356->slave, &stream_config,
+				   &port_config, 1, sdw_stream);
+	if (ret)
+		dev_err(dai->dev, "Unable to configure port\n");
+
+	switch (params_rate(params)) {
+	case 16000:
+		rate = ES9356_SDCA_RATE_16000HZ;
+		break;
+	case 44100:
+		rate = ES9356_SDCA_RATE_44100HZ;
+		break;
+	case 48000:
+		rate = ES9356_SDCA_RATE_48000HZ;
+		break;
+	case 96000:
+		rate = ES9356_SDCA_RATE_96000HZ;
+		break;
+	default:
+		dev_err(component->dev, "%s: Rate %d is not supported\n",
+			__func__, params_rate(params));
+		return -EINVAL;
+	}
+
+	if (dai->id == ES9356_DMIC)
+		regmap_write(es9356->regmap,
+			SDW_SDCA_HCTL(FUNC_NUM_MIC, ES9356_SDCA_ENT_CS113, ES9356_SDCA_CTL_SAMPLE_FREQ_INDEX, 0), rate);
+	if (dai->id == ES9356_AMP)
+		regmap_write(es9356->regmap,
+			SDW_SDCA_HCTL(FUNC_NUM_AMP, ES9356_SDCA_ENT_CS21, ES9356_SDCA_CTL_SAMPLE_FREQ_INDEX, 0), rate);
+	if ((dai->id == ES9356_JACK_IN) | (dai->id == ES9356_JACK_OUT)) {
+		regmap_write(es9356->regmap,
+			SDW_SDCA_HCTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_CS41, ES9356_SDCA_CTL_SAMPLE_FREQ_INDEX, 0), rate);
+		regmap_write(es9356->regmap,
+			SDW_SDCA_HCTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_CS36, ES9356_SDCA_CTL_SAMPLE_FREQ_INDEX, 0), rate);
+	}
+	return ret;
+}
+
+static int es9356_sdw_pcm_hw_free(struct snd_pcm_substream *substream,
+				  struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct es9356_sdw_priv *es9356 = snd_soc_component_get_drvdata(component);
+	struct sdw_stream_runtime *sdw_stream = snd_soc_dai_get_dma_data(dai, substream);
+
+	if (!es9356->slave)
+		return -EINVAL;
+
+	sdw_stream_remove_slave(es9356->slave, sdw_stream);
+	return 0;
+}
+
+static const struct snd_soc_dai_ops es9356_sdw_ops = {
+	.hw_params	= es9356_sdw_pcm_hw_params,
+	.hw_free	= es9356_sdw_pcm_hw_free,
+	.set_stream	= es9356_sdw_set_sdw_stream,
+	.shutdown	= es9356_sdw_shutdown,
+};
+
+static struct snd_soc_dai_driver es9356_sdw_dai[] = {
+	{
+		.name = "es9356-sdp-aif4",
+		.id = ES9356_DMIC,
+		.capture = {
+			.stream_name = "DP1 Capture",
+			.channels_min = 1,
+			.channels_max = 2,
+		},
+		.ops = &es9356_sdw_ops,
+	},
+	{
+		.name = "es9356-sdp-aif2",
+		.id = ES9356_JACK_IN,
+		.capture = {
+			.stream_name = "DP2 Capture",
+			.channels_min = 1,
+			.channels_max = 2,
+		},
+		.ops = &es9356_sdw_ops,
+	},
+	{
+		.name = "es9356-sdp-aif3",
+		.id = ES9356_AMP,
+		.playback = {
+			.stream_name = "DP3 Playback",
+			.channels_min = 1,
+			.channels_max = 2,
+		},
+		.ops = &es9356_sdw_ops,
+	},
+	{
+		.name = "es9356-sdp-aif1",
+		.id = ES9356_JACK_OUT,
+		.playback = {
+			.stream_name = "DP4 Playback",
+			.channels_min = 1,
+			.channels_max = 2,
+		},
+		.ops = &es9356_sdw_ops,
+	},
+};
+
+static bool es9356_sdca_volatile_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case 0x44000000:
+	case 0x44000001:
+	case 0x44000002:
+	case 0x44000003:
+	case SDW_SDCA_HCTL(FUNC_NUM_HID, ES9356_SDCA_ENT_HID01, ES9356_SDCA_CTL_HIDTX_CURRENT_OWNER, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_GE35, ES9356_SDCA_CTL_DETECTED_MODE, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_GE35, ES9356_SDCA_CTL_SELECTED_MODE, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_AMP, ES9356_SDCA_ENT_PDE23, ES9356_SDCA_CTL_REQ_POWER_STATE, 0):
+	case SDW_SDCA_HCTL(FUNC_NUM_AMP, ES9356_SDCA_ENT_PDE23, ES9356_SDCA_CTL_ACTUAL_POWER_STATE, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_MIC, ES9356_SDCA_ENT_PDE11, ES9356_SDCA_CTL_REQ_POWER_STATE, 0):
+	case SDW_SDCA_HCTL(FUNC_NUM_MIC, ES9356_SDCA_ENT_PDE11, ES9356_SDCA_CTL_ACTUAL_POWER_STATE, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_PDE47, ES9356_SDCA_CTL_REQ_POWER_STATE, 0):
+	case SDW_SDCA_HCTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_PDE47, ES9356_SDCA_CTL_ACTUAL_POWER_STATE, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_PDE34, ES9356_SDCA_CTL_REQ_POWER_STATE, 0):
+	case SDW_SDCA_HCTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_PDE34, ES9356_SDCA_CTL_ACTUAL_POWER_STATE, 0):
+	case 0x2003:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static const struct regmap_config es9356_sdca_regmap = {
+	.reg_bits = 32,
+	.val_bits = 8,
+	.volatile_reg = es9356_sdca_volatile_register,
+	.max_register = 0x45ffffff,
+	.cache_type = REGCACHE_RBTREE,
+	.use_single_read = true,
+	.use_single_write = true,
+};
+
+static void es9356_regcache_sync_volume(struct regmap *regmap)
+{
+	unsigned int reg, i;
+
+	for (i = 0; i < ARRAY_SIZE(es9356_volume_register); i++) {
+		regcache_sync_region(regmap, SDW_SDCA_REG_MBQ(es9356_volume_register[i]),
+			SDW_SDCA_REG_MBQ(es9356_volume_register[i]));
+		regcache_sync_region(regmap, es9356_volume_register[i],
+			es9356_volume_register[i]);
+	}
+}
+
+static void es9356_register_init(struct es9356_sdw_priv *es9356)
+{
+	regmap_write(es9356->regmap, ES9356_STATE, 0x02);
+	regmap_write(es9356->regmap, ES9356_ENDPOINT_MODE, 0x24);
+	regmap_write(es9356->regmap, ES9356_PRE_DIV_CTL, 0x00);
+	regmap_write(es9356->regmap, ES9356_ADC_OSR, 0x18);
+	regmap_write(es9356->regmap, ES9356_ADC_OSRGAIN, 0x13);
+	regmap_write(es9356->regmap, ES9356_DAC_OSR, 0x16);
+	regmap_write(es9356->regmap, ES9356_CLK_CTL, 0x0f);
+	regmap_write(es9356->regmap, ES9356_CSM_RESET, 0x01);
+	regmap_write(es9356->regmap, ES9356_CLK_SEL, 0x30);
+
+	regmap_write(es9356->regmap, ES9356_DETCLK_CTL, 0x51);
+	regmap_write(es9356->regmap, ES9356_HP_TYPE, 0x10);
+	regmap_write(es9356->regmap, ES9356_MICBIAS_CTL, 0x10);
+	regmap_write(es9356->regmap, ES9356_HPDETECT_CTL, 0x07);
+	regmap_write(es9356->regmap, ES9356_ADC_ANA, 0x30);
+	regmap_write(es9356->regmap, ES9356_PGA_CTL, 0xa8);
+	regmap_write(es9356->regmap, ES9356_ADC_INT, 0xaa);
+	regmap_write(es9356->regmap, ES9356_ADC_LP, 0x19);
+	regmap_write(es9356->regmap, ES9356_VMID1SEL, 0xbc);
+	regmap_write(es9356->regmap, ES9356_VMID_TIME, 0x0b);
+	regmap_write(es9356->regmap, ES9356_STATE_TIME, 0xbb);
+	regmap_write(es9356->regmap, ES9356_HP_SPK_TIME, 0x77);
+	regmap_write(es9356->regmap, ES9356_HP_DETECTTIME, 0xa4);
+	regmap_write(es9356->regmap, ES9356_MICBIAS_SEL, 0x15);
+	regmap_write(es9356->regmap, ES9356_KEY_PRESS_TIME, 0xff);
+	regmap_write(es9356->regmap, ES9356_KEY_RELEASE_TIME, 0xff);
+	regmap_write(es9356->regmap, ES9356_KEY_HOLD_TIME, 0x0f);
+	regmap_write(es9356->regmap, ES9356_BTSEL_REF, 0x00);
+	regmap_write(es9356->regmap, ES9356_KEYD_DETECT, 0x18);
+	regmap_write(es9356->regmap, ES9356_MICBIAS_RES, 0x03);
+	regmap_write(es9356->regmap, ES9356_BUTTON_CHARGE, 0x00);
+	regmap_write(es9356->regmap, ES9356_CALIBRATION_TIME, 0x13);
+	regmap_write(es9356->regmap, ES9356_CALIBRATION_SETTING, 0xf4);
+
+	regmap_write(es9356->regmap, ES9356_SPK_VOLUME, 0x33);
+	regmap_write(es9356->regmap, ES9356_DAC_VROI, 0x01);
+	regmap_write(es9356->regmap, ES9356_DAC_LP, 0x00);
+	regmap_write(es9356->regmap, ES9356_HP_IBIAS, 0x04);
+	regmap_write(es9356->regmap, ES9356_HP_LP, 0x03);
+	regmap_write(es9356->regmap, ES9356_SPKLDO_CTL, 0x65);
+	regmap_write(es9356->regmap, ES9356_SPKBIAS_COMP, 0x09);
+	regmap_write(es9356->regmap, ES9356_VMID1STL, 0x00);
+	regmap_write(es9356->regmap, ES9356_VMID2STL, 0x00);
+	regmap_write(es9356->regmap, ES9356_VSEL, 0xfc);
+
+	regmap_write(es9356->regmap, ES9356_IBIASGEN, 0x10);
+	regmap_write(es9356->regmap, ES9356_ADC_AMIC_CTL, 0x0d);
+	regmap_write(es9356->regmap, SDW_SCP_BUS_CLOCK_BASE, 0x01);
+	regmap_write(es9356->regmap, ES9356_STATE, 0x0e);
+	regmap_write(es9356->regmap, ES9356_CSM_RESET, 0x00);
+	regmap_write(es9356->regmap, ES9356_HP_TYPE, 0x08);
+
+	regmap_write(es9356->regmap,
+		SDW_SDCA_CTL_MBQ(FUNC_NUM_MIC, ES9356_SDCA_ENT_FU113, ES9356_SDCA_CTL_FU_VOLUME, CH_L), 0x00);
+	regmap_write(es9356->regmap,
+		SDW_SDCA_CTL(FUNC_NUM_MIC, ES9356_SDCA_ENT_FU113, ES9356_SDCA_CTL_FU_VOLUME, CH_L), 0x00);
+	regmap_write(es9356->regmap,
+		SDW_SDCA_CTL_MBQ(FUNC_NUM_MIC, ES9356_SDCA_ENT_FU113, ES9356_SDCA_CTL_FU_VOLUME, CH_R), 0x00);
+	regmap_write(es9356->regmap,
+		SDW_SDCA_CTL(FUNC_NUM_MIC, ES9356_SDCA_ENT_FU113, ES9356_SDCA_CTL_FU_VOLUME, CH_R), 0x00);
+
+	regmap_write(es9356->regmap,
+		SDW_SDCA_CTL_MBQ(FUNC_NUM_AMP, ES9356_SDCA_ENT_FU21, ES9356_SDCA_CTL_FU_VOLUME, CH_L), 0x00);
+	regmap_write(es9356->regmap,
+		SDW_SDCA_CTL(FUNC_NUM_AMP, ES9356_SDCA_ENT_FU21, ES9356_SDCA_CTL_FU_VOLUME, CH_L), 0x00);
+	regmap_write(es9356->regmap,
+		SDW_SDCA_CTL_MBQ(FUNC_NUM_AMP, ES9356_SDCA_ENT_FU21, ES9356_SDCA_CTL_FU_VOLUME, CH_R), 0x00);
+	regmap_write(es9356->regmap,
+		SDW_SDCA_CTL(FUNC_NUM_AMP, ES9356_SDCA_ENT_FU21, ES9356_SDCA_CTL_FU_VOLUME, CH_R), 0x00);
+
+	regmap_write(es9356->regmap,
+		SDW_SDCA_CTL_MBQ(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU41, ES9356_SDCA_CTL_FU_VOLUME, CH_L), 0x00);
+	regmap_write(es9356->regmap,
+		SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU41, ES9356_SDCA_CTL_FU_VOLUME, CH_L), 0x00);
+	regmap_write(es9356->regmap,
+		SDW_SDCA_CTL_MBQ(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU41, ES9356_SDCA_CTL_FU_VOLUME, CH_R), 0x00);
+	regmap_write(es9356->regmap,
+		SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU41, ES9356_SDCA_CTL_FU_VOLUME, CH_R), 0x00);
+
+	regmap_write(es9356->regmap,
+		SDW_SDCA_CTL_MBQ(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU36, ES9356_SDCA_CTL_FU_VOLUME, CH_L), 0x00);
+	regmap_write(es9356->regmap,
+		SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU36, ES9356_SDCA_CTL_FU_VOLUME, CH_L), 0x00);
+	regmap_write(es9356->regmap,
+		SDW_SDCA_CTL_MBQ(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU36, ES9356_SDCA_CTL_FU_VOLUME, CH_R), 0x00);
+	regmap_write(es9356->regmap,
+		SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU36, ES9356_SDCA_CTL_FU_VOLUME, CH_R), 0x00);
+}
+
+static int es9356_sdca_io_init(struct device *dev, struct sdw_slave *slave)
+{
+	struct es9356_sdw_priv *es9356 = dev_get_drvdata(&slave->dev);
+	unsigned int reg;
+
+	if (es9356->hw_init)
+		return 0;
+
+	regcache_cache_only(es9356->regmap, false);
+
+	if (es9356->first_hw_init) {
+		regcache_cache_bypass(es9356->regmap, true);
+	} else {
+		/*
+		 * PM runtime is only enabled when a Slave reports as Attached
+		 */
+
+		/* set autosuspend parameters */
+		pm_runtime_set_autosuspend_delay(&slave->dev, 3000);
+		pm_runtime_use_autosuspend(&slave->dev);
+
+		/* update count of parent 'active' children */
+		pm_runtime_set_active(&slave->dev);
+
+		/* make sure the device does not suspend immediately */
+		pm_runtime_mark_last_busy(&slave->dev);
+
+		pm_runtime_enable(&slave->dev);
+
+		es9356_register_init(es9356);
+	}
+	pm_runtime_get_noresume(&slave->dev);
+
+	regmap_write(es9356->regmap, SDW_SCP_BUS_CLOCK_BASE, 0x01);
+	regmap_write(es9356->regmap,
+		SDW_SDCA_HCTL(FUNC_NUM_MIC, ES9356_SDCA_ENT_XU12, ES9356_SDCA_CTL_SELECTED_MODE, 0), 0x01);
+	regmap_write(es9356->regmap,
+		SDW_SDCA_HCTL(FUNC_NUM_MIC, ES9356_SDCA_ENT0, ES9356_SDCA_CTL_FUNC_STATUS, 0), 0x40);
+	regmap_write(es9356->regmap,
+		SDW_SDCA_HCTL(FUNC_NUM_AMP, ES9356_SDCA_ENT_XU22, ES9356_SDCA_CTL_SELECTED_MODE, 0), 0x01);
+	regmap_write(es9356->regmap,
+		SDW_SDCA_HCTL(FUNC_NUM_AMP, ES9356_SDCA_ENT0, ES9356_SDCA_CTL_FUNC_STATUS, 0), 0x40);
+	regmap_write(es9356->regmap,
+		SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_XU42, ES9356_SDCA_CTL_SELECTED_MODE, 0), 0x01);
+	regmap_write(es9356->regmap,
+		SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_XU36, ES9356_SDCA_CTL_SELECTED_MODE, 0), 0x01);
+	regmap_write(es9356->regmap,
+		SDW_SDCA_HCTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT0, ES9356_SDCA_CTL_FUNC_STATUS, 0), 0x40);
+
+	if (es9356->first_hw_init) {
+		regcache_cache_bypass(es9356->regmap, false);
+		regcache_mark_dirty(es9356->regmap);
+	} else
+		es9356->first_hw_init = true;
+
+	es9356->hw_init = true;
+
+	pm_runtime_mark_last_busy(&slave->dev);
+	pm_runtime_put_autosuspend(&slave->dev);
+
+	return 0;
+}
+
+static int es9356_sdw_update_status(struct sdw_slave *slave,
+				    enum sdw_slave_status status)
+{
+	struct es9356_sdw_priv *es9356 = dev_get_drvdata(&slave->dev);
+
+	if (status == SDW_SLAVE_UNATTACHED)
+		es9356->hw_init = false;
+
+	if (status == SDW_SLAVE_ATTACHED) {
+		if (es9356->hs_jack) {
+			sdw_write_no_pm(es9356->slave, SDW_SCP_SDCA_INTMASK1, SDW_SCP_SDCA_INTMASK_SDCA_7);
+			sdw_write_no_pm(es9356->slave, SDW_SCP_SDCA_INTMASK1,
+			(SDW_SCP_SDCA_INTMASK_SDCA_7 | SDW_SCP_SDCA_INTMASK_SDCA_5 | SDW_SCP_SDCA_INTMASK_SDCA_1));
+		}
+	}
+
+	if (es9356->hw_init || status != SDW_SLAVE_ATTACHED)
+		return 0;
+
+	return es9356_sdca_io_init(&slave->dev, slave);
+}
+
+static int es9356_sdw_read_prop(struct sdw_slave *slave)
+{
+	struct sdw_slave_prop *prop = &slave->prop;
+	int nval;
+	int i, j;
+	u32 bit;
+	unsigned long addr;
+	struct sdw_dpn_prop *dpn;
+
+	prop->paging_support = true;
+
+	/*
+	 * first we need to allocate memory for set bits in port lists
+	 * the port allocation is completely arbitrary:
+	 * DP0 is not supported
+	 * DP3 and DP4 is sink
+	 * DP1 and DP2 is source
+	 */
+	prop->source_ports = BIT(1) | BIT(2);
+	prop->sink_ports = BIT(3) | BIT(4);
+
+	nval = hweight32(prop->source_ports);
+	prop->src_dpn_prop = devm_kcalloc(&slave->dev, nval,
+					  sizeof(*prop->src_dpn_prop),
+					  GFP_KERNEL);
+	if (!prop->src_dpn_prop)
+		return -ENOMEM;
+
+	i = 0;
+	dpn = prop->src_dpn_prop;
+	addr = prop->source_ports;
+	for_each_set_bit(bit, &addr, 32) {
+		dpn[i].num = bit;
+		dpn[i].type = SDW_DPN_FULL;
+		dpn[i].simple_ch_prep_sm = true;
+		i++;
+	}
+
+	/* do this again for sink now */
+	nval = hweight32(prop->sink_ports);
+	prop->sink_dpn_prop = devm_kcalloc(&slave->dev, nval,
+					   sizeof(*prop->sink_dpn_prop),
+					   GFP_KERNEL);
+	if (!prop->sink_dpn_prop)
+		return -ENOMEM;
+
+	j = 0;
+	dpn = prop->sink_dpn_prop;
+	addr = prop->sink_ports;
+	for_each_set_bit(bit, &addr, 32) {
+		dpn[j].num = bit;
+		dpn[j].type = SDW_DPN_FULL;
+		dpn[j].simple_ch_prep_sm = true;
+		j++;
+	}
+
+	/* wake-up event */
+	prop->wake_capable = 1;
+
+	return 0;
+}
+
+static int es9356_sdw_interrupt_callback(struct sdw_slave *slave,
+					 struct sdw_slave_intr_status *status)
+{
+	struct es9356_sdw_priv *es9356 = dev_get_drvdata(&slave->dev);
+	int ret, stat;
+	int count = 0, retry = 3;
+	unsigned int sdca_cascade, scp_sdca_stat1 = 0;
+
+	mutex_lock(&es9356->disable_irq_lock);
+
+	ret = sdw_read_no_pm(es9356->slave, SDW_SCP_SDCA_INT1);
+	if (ret < 0)
+		goto io_error;
+	es9356->sdca_status = ret;
+
+	do {
+		ret = sdw_read_no_pm(es9356->slave, SDW_SCP_SDCA_INT1);
+		if (ret < 0)
+			goto io_error;
+		if (ret & SDW_SCP_SDCA_INTMASK_SDCA_1) {
+			ret = sdw_update_no_pm(es9356->slave, SDW_SCP_SDCA_INT1,
+				SDW_SCP_SDCA_INT_SDCA_1, SDW_SCP_SDCA_INT_SDCA_1);
+			if (ret < 0)
+				goto io_error;
+		}
+
+		ret = sdw_read_no_pm(es9356->slave, SDW_SCP_SDCA_INT1);
+		if (ret < 0)
+			goto io_error;
+		if (ret & SDW_SCP_SDCA_INTMASK_SDCA_5) {
+			ret = sdw_update_no_pm(es9356->slave, SDW_SCP_SDCA_INT1,
+				SDW_SCP_SDCA_INT_SDCA_5, SDW_SCP_SDCA_INT_SDCA_5);
+			if (ret < 0)
+				goto io_error;
+		}
+
+		ret = sdw_read_no_pm(es9356->slave, SDW_SCP_SDCA_INT1);
+		if (ret < 0)
+			goto io_error;
+		if (ret & SDW_SCP_SDCA_INTMASK_SDCA_7) {
+			ret = sdw_update_no_pm(es9356->slave, SDW_SCP_SDCA_INT1,
+				SDW_SCP_SDCA_INT_SDCA_7, SDW_SCP_SDCA_INT_SDCA_7);
+			if (ret < 0)
+				goto io_error;
+		}
+
+		ret = sdw_read_no_pm(es9356->slave, SDW_DP0_INT);
+		if (ret < 0)
+			goto io_error;
+		sdca_cascade = ret & SDW_DP0_SDCA_CASCADE;
+
+		ret = sdw_read_no_pm(es9356->slave, SDW_SCP_SDCA_INT1);
+		if (ret < 0)
+			goto io_error;
+		scp_sdca_stat1 = ret & SDW_SCP_SDCA_INTMASK_SDCA_1;
+
+		stat = scp_sdca_stat1 || sdca_cascade;
+
+		count++;
+	} while (stat != 0 && count < retry);
+
+	if (status->sdca_cascade)
+		mod_delayed_work(system_power_efficient_wq,
+			&es9356->jack_detect_work, msecs_to_jiffies(280));
+
+	mutex_unlock(&es9356->disable_irq_lock);
+	return 0;
+
+io_error:
+	mutex_unlock(&es9356->disable_irq_lock);
+	pr_err_ratelimited("IO error in %s, ret %d\n", __func__, ret);
+	return ret;
+}
+
+static const struct sdw_slave_ops es9356_sdw_slave_ops = {
+	.read_prop = es9356_sdw_read_prop,
+	.interrupt_callback = es9356_sdw_interrupt_callback,
+	.update_status = es9356_sdw_update_status,
+};
+
+static int es9356_sdca_init(struct device *dev, struct regmap *regmap, struct sdw_slave *slave)
+{
+	struct es9356_sdw_priv *es9356;
+
+	es9356 = devm_kzalloc(dev, sizeof(*es9356), GFP_KERNEL);
+	if (!es9356)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, es9356);
+
+	es9356->slave = slave;
+	es9356->regmap = regmap;
+	mutex_init(&es9356->lock);
+	mutex_init(&es9356->disable_irq_lock);
+
+	regcache_cache_only(es9356->regmap, true);
+
+	es9356->hw_init = false;
+	es9356->first_hw_init = false;
+
+	INIT_DELAYED_WORK(&es9356->jack_detect_work,
+			  es9356_jack_detect_handler);
+	INIT_DELAYED_WORK(&es9356->button_detect_work,
+			  es9356_button_detect_handler);
+
+	return devm_snd_soc_register_component(dev,
+					       &snd_soc_es9356_sdw_component,
+					       es9356_sdw_dai,
+					       ARRAY_SIZE(es9356_sdw_dai));
+}
+
+static int es9356_sdw_probe(struct sdw_slave *slave,
+				const struct sdw_device_id *id)
+{
+	struct regmap *regmap;
+
+	regmap = devm_regmap_init_sdw(slave, &es9356_sdca_regmap);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	return es9356_sdca_init(&slave->dev, regmap, slave);
+}
+
+static int es9356_sdw_remove(struct sdw_slave *slave)
+{
+	struct es9356_sdw_priv *es9356 = dev_get_drvdata(&slave->dev);
+
+	if (es9356->hw_init) {
+		cancel_delayed_work_sync(&es9356->jack_detect_work);
+		cancel_delayed_work_sync(&es9356->button_detect_work);
+	}
+
+	if (es9356->first_hw_init)
+		pm_runtime_disable(&slave->dev);
+
+	mutex_destroy(&es9356->lock);
+	mutex_destroy(&es9356->disable_irq_lock);
+	return 0;
+}
+
+static const struct sdw_device_id es9356_sdw_id[] = {
+	SDW_SLAVE_ENTRY_EXT(0x04b3, 0x9356, 0x02, 0, 0),
+	SDW_SLAVE_ENTRY_EXT(0x04b3, 0x9356, 0x03, 0, 0),
+	{},
+};
+MODULE_DEVICE_TABLE(sdw, es9356_sdw_id);
+
+static int es9356_sdca_dev_suspend(struct device *dev)
+{
+	struct es9356_sdw_priv *es9356 = dev_get_drvdata(dev);
+
+	cancel_delayed_work_sync(&es9356->jack_detect_work);
+	cancel_delayed_work_sync(&es9356->button_detect_work);
+
+	return 0;
+}
+
+static int es9356_sdca_dev_system_suspend(struct device *dev)
+{
+	struct es9356_sdw_priv *es9356 = dev_get_drvdata(dev);
+
+	regmap_write(es9356->regmap, SDW_SCP_SYSTEMCTRL, SDW_SCP_SYSTEMCTRL_WAKE_UP_EN | SDW_SCP_SYSTEMCTRL_CLK_STP_PREP);
+
+	return es9356_sdca_dev_suspend(dev);
+}
+
+#define es9356_PROBE_TIMEOUT 2000
+
+static int es9356_sdca_dev_resume(struct device *dev)
+{
+	struct sdw_slave *slave = dev_to_sdw_dev(dev);
+	struct es9356_sdw_priv *es9356 = dev_get_drvdata(dev);
+	unsigned long time;
+
+	if (!slave->unattach_request)
+		goto regmap_sync;
+
+	time = wait_for_completion_timeout(&slave->initialization_complete,
+				msecs_to_jiffies(es9356_PROBE_TIMEOUT));
+	if (!time) {
+		dev_err(&slave->dev, "Initialization not complete, timed out\n");
+		sdw_show_ping_status(slave->bus, true);
+
+		return -ETIMEDOUT;
+	}
+
+regmap_sync:
+	slave->unattach_request = 0;
+	regcache_cache_only(es9356->regmap, false);
+	es9356_regcache_sync_volume(es9356->regmap);
+	return 0;
+}
+
+static const struct dev_pm_ops es9356_sdca_pm = {
+	SYSTEM_SLEEP_PM_OPS(es9356_sdca_dev_system_suspend, es9356_sdca_dev_resume)
+	RUNTIME_PM_OPS(es9356_sdca_dev_suspend, es9356_sdca_dev_resume, NULL)
+};
+
+static struct sdw_driver es9356_sdw_driver = {
+	.driver = {
+		.name = "es9356",
+		.pm = pm_ptr(&es9356_sdca_pm),
+	},
+	.probe = es9356_sdw_probe,
+	.remove = es9356_sdw_remove,
+	.ops = &es9356_sdw_slave_ops,
+	.id_table = es9356_sdw_id,
+};
+module_sdw_driver(es9356_sdw_driver);
+
+MODULE_DESCRIPTION("ASoC ES9356 SDCA SDW codec driver");
+MODULE_AUTHOR("Michael Zhang <zhangyi@everest-semi.com>");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/es9356.h b/sound/soc/codecs/es9356.h
new file mode 100644
index 000000000..0078aa489
--- /dev/null
+++ b/sound/soc/codecs/es9356.h
@@ -0,0 +1,218 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __ES9356_H__
+#define __ES9356_H__
+
+#define SDW_SDCA_CTL_MBQ(fun, ent, ctl, ch) (SDW_SDCA_CTL(fun, ent, ctl, ch) | MBQ)
+#define SDW_SDCA_HCTL(fun, ent, ctl, ch) (SDW_SDCA_CTL(fun, ent, ctl, ch) | 0x80000)
+#define SDW_SDCA_REG_MBQ(reg) (reg | MBQ)
+
+/*ES9356 Implementation-define*/
+#define ES9356_CSM_RESET			0x2020
+#define ES9356_FUC_RESET			0x2021
+#define ES9356_STATE				0x2022
+#define ES9356_VMID_TIME			0x2023
+#define ES9356_STATE_TIME			0x2024
+#define ES9356_HP_SPK_TIME			0x2025
+#define ES9356_WP_ENABLE			0x2026
+#define ES9356_DMIC_GPIO			0x2027
+#define ES9356_ENDPOINT_MODE			0x2028
+
+/*HP DETECT*/
+#define ES9356_HP_TYPE				0x2029
+#define ES9356_HP_DETECTTIME			0x202A
+#define ES9356_MICBIAS_SEL			0x202B
+#define ES9356_KEY_PRESS_TIME			0x202C
+#define ES9356_KEY_RELEASE_TIME			0x202D
+#define ES9356_KEY_HOLD_TIME			0x202E
+#define ES9356_BTSEL_REF			0x202F
+#define ES9356_BUTTON_CHARGE			0x2030
+
+#define ES9356_KEYD_DETECT			0x2031
+#define ES9356_DPEN_TIME			0x2032
+#define ES9356_TIMER_CHECK			0x2033
+#define ES9356_IBIASGEN				0x2041
+#define ES9356_VMID1SEL				0x2042
+#define ES9356_VMID1STL				0x2043
+#define ES9356_VMID2SEL				0x2044
+#define ES9356_VMID2STL				0x2045
+#define ES9356_VSEL				0x2046
+#define ES9356_MICBIAS_CTL			0x2047
+#define ES9356_HPDETECT_CTL			0x2048
+#define ES9356_MICBIAS_RES			0x2049
+
+/*CLK*/
+#define ES9356_CLK_SEL				0x2050
+#define ES9356_CLK_CTL				0x2051
+#define ES9356_DETCLK_CTL			0x2052
+#define ES9356_CPCLK_CTL			0x2053
+#define ES9356_SPKCLK_CTL			0x2054
+#define ES9356_PRE_DIV_CTL			0x2055
+#define ES9356_DLL_MODE				0x2056
+#define ES9356_ANACLK_SEL			0x2057
+#define ES9356_OSRCLK_SEL			0x2058
+#define ES9356_DSPCLK_SEL			0x2059
+#define ES9356_SPK9M_MODE			0x205a
+
+/*ADC DIG CTL*/
+#define ES9356_DMIC_POL				0x2061
+#define ES9356_ADC_SWAP				0x2062
+#define ES9356_ADC_OSR				0x2063
+#define ES9356_ADC_OSRGAIN			0x2064
+#define ES9356_ADC_CLEARRAM			0x2065
+#define ES9356_ADC_RAMP				0x2066
+#define ES9356_ADC_HPF1				0x2067
+#define ES9356_ADC_HPF2				0x2068
+#define ES9356_ADC_ALC				0x206C
+#define ES9356_ALC_LEVEL			0x206D
+#define ES9356_ALC_RAMP_WINSIZE			0x206E
+
+/*ADC ANA CTL*/
+#define ES9356_ADC_REF_EN			0x2080
+#define ES9356_ADC_AMIC_CTL			0x2081
+#define ES9356_ADC_ANA				0x2082
+#define ES9356_PGA_CTL				0x2083
+#define ES9356_ADC_INT				0x2084
+#define ES9356_ADC_VCM				0x2085
+#define ES9356_ADC_VRPBIAS			0x2086
+#define ES9356_ADC_LP				0x2087
+
+/*DAC DIG CTL*/
+#define ES9356_DAC_FSMODE			0x2090
+#define ES9356_DAC_OSR				0x2091
+#define ES9356_DAC_INV				0x2092
+#define ES9356_DAC_RAMP				0x2093
+#define ES9356_DAC_VPPSCALE			0x2094
+#define ES9356_DAC_SWAP				0x2097
+#define ES9356_SPKCMP_VPPSC			0x20A0
+#define ES9356_CALIBRATION_TIME			0x20A1
+#define ES9356_CALIBRATION_SETTING		0x20A2
+#define ES9356_DAC_OFFSET_LH			0x20A3
+#define ES9356_DAC_OFFSET_LL			0x20A4
+#define ES9356_DAC_OFFSET_RH			0x20A5
+#define ES9356_DAC_OFFSET_RL			0x20A6
+
+/*DAC ANA CTL*/
+#define ES9356_DAC_REF_EN			0x20B0
+#define ES9356_DAC_ENABLE			0x20B1
+#define ES9356_DAC_VROI				0x20B2
+#define ES9356_DAC_LP				0x20B3
+
+/*HP CTL*/
+#define ES9356_CHARGEPUMP_CTL			0x20C0
+#define ES9356_CPLDO_CTL			0x20C1
+#define ES9356_HP_REF_CTL			0x20C2
+#define ES9356_HP_IBIAS				0x20C3
+#define ES9356_HP_EN				0x20C4
+#define ES9356_HP_VOLUME			0x20C5
+#define ES9356_HP_LP				0x20C6
+
+/*SPK CTL*/
+#define ES9356_SPKLDO_CTL			0x20D0
+#define ES9356_CLASSD_CTL			0x20D1
+#define ES9356_SPK_HBDG				0x20D5
+#define ES9356_SPK_VOLUME			0x20D7
+#define ES9356_SPK_SCP				0x20D8
+#define ES9356_SPK_DT				0x20D9
+#define ES9356_SPK_OTP				0x20DA
+#define ES9356_SPKBIAS_COMP			0x20DB
+
+/* ES9356 SDCA Control - function number */
+#define FUNC_NUM_UAJ				0x01
+#define FUNC_NUM_MIC				0x02
+#define FUNC_NUM_AMP				0x03
+#define FUNC_NUM_HID				0x04
+
+/* ES9356 SDCA entity */
+#define ES9356_SDCA_ENT0			0x00
+#define ES9356_SDCA_ENT_PDE11			0x03
+#define ES9356_SDCA_ENT_FU11			0x04
+#define ES9356_SDCA_ENT_XU12			0x05
+#define ES9356_SDCA_ENT_FU113			0x07
+#define ES9356_SDCA_ENT_CS113			0x09
+#define ES9356_SDCA_ENT_PPU11			0x0C
+
+#define ES9356_SDCA_ENT_CS21			0x02
+#define ES9356_SDCA_ENT_PPU21			0x03
+#define ES9356_SDCA_ENT_FU21			0X04
+#define ES9356_SDCA_ENT_XU22			0x06
+#define ES9356_SDCA_ENT_SAPU29			0x03
+#define ES9356_SDCA_ENT_PDE23			0x0B
+#define ES9356_SDCA_ENT_HID01			0x01
+
+#define ES9356_SDCA_ENT_CS41			0x02
+#define ES9356_SDCA_ENT_FU35			0x04
+#define ES9356_SDCA_ENT_XU42			0x06
+#define ES9356_SDCA_ENT_FU41			0x07
+#define ES9356_SDCA_ENT_PDE47			0x0E
+#define ES9356_SDCA_ENT_IT33			0x0F
+#define ES9356_SDCA_ENT_PDE34			0x10
+#define ES9356_SDCA_ENT_FU33			0x11
+#define ES9356_SDCA_ENT_XU36			0x13
+#define ES9356_SDCA_ENT_FU36			0x15
+#define ES9356_SDCA_ENT_CS36			0x17
+#define ES9356_SDCA_ENT_GE35			0x18
+
+/* ES9356 SDCA control */
+#define ES9356_SDCA_CTL_SAMPLE_FREQ_INDEX		0x00
+#define ES9356_SDCA_CTL_FU_MUTE				0x01
+#define ES9356_SDCA_CTL_FU_VOLUME			0x02
+#define ES9356_SDCA_CTL_HIDTX_CURRENT_OWNER		0x00
+#define ES9356_SDCA_CTL_SELECTED_MODE			0x01
+#define ES9356_SDCA_CTL_DETECTED_MODE			0x02
+#define ES9356_SDCA_CTL_REQ_POWER_STATE			0x01
+#define ES9356_SDCA_CTL_FU_CH_GAIN			0x0b
+#define ES9356_SDCA_CTL_FUNC_STATUS			0x10
+#define ES9356_SDCA_CTL_ACTUAL_POWER_STATE		0x00
+#define ES9356_SDCA_CTL_POSTURE_NUMBER			0x00
+
+/* ES9356 SDCA channel */
+#define CH_L	0x01
+#define CH_R	0x02
+#define MBQ	0x2000
+
+#define FUNCTION_NEEDS_INITIALIZATION		BIT(5)
+
+#define ES9356_BUF_ADDR_HID	0x44000000
+
+enum {
+	ES9356_DMIC = 1, /* For dmic */
+	ES9356_JACK_IN, /* For headset mic */
+	ES9356_AMP, /* For speaker */
+	ES9356_JACK_OUT, /* For headphone */
+};
+
+enum {
+	ES9356_SDCA_RATE_16000HZ,
+	ES9356_SDCA_RATE_24000HZ,
+	ES9356_SDCA_RATE_32000HZ,
+	ES9356_SDCA_RATE_44100HZ,
+	ES9356_SDCA_RATE_48000HZ,
+	ES9356_SDCA_RATE_88200HZ,
+	ES9356_SDCA_RATE_96000HZ,
+};
+
+static unsigned int es9356_volume_register[] = {
+	SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU41,
+		ES9356_SDCA_CTL_FU_VOLUME, CH_L),
+	SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU41,
+		ES9356_SDCA_CTL_FU_VOLUME, CH_R),
+	SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU36,
+		ES9356_SDCA_CTL_FU_VOLUME, CH_L),
+	SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU36,
+		ES9356_SDCA_CTL_FU_VOLUME, CH_R),
+	SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU33,
+		ES9356_SDCA_CTL_FU_CH_GAIN, 0),
+	SDW_SDCA_CTL(FUNC_NUM_AMP, ES9356_SDCA_ENT_FU21,
+		ES9356_SDCA_CTL_FU_VOLUME, CH_L),
+	SDW_SDCA_CTL(FUNC_NUM_AMP, ES9356_SDCA_ENT_FU21,
+		ES9356_SDCA_CTL_FU_VOLUME, CH_R),
+	SDW_SDCA_CTL(FUNC_NUM_MIC, ES9356_SDCA_ENT_FU113,
+			ES9356_SDCA_CTL_FU_VOLUME, CH_L),
+	SDW_SDCA_CTL(FUNC_NUM_MIC, ES9356_SDCA_ENT_FU113,
+		ES9356_SDCA_CTL_FU_VOLUME, CH_R),
+	SDW_SDCA_CTL(FUNC_NUM_MIC, ES9356_SDCA_ENT_FU11,
+		ES9356_SDCA_CTL_FU_CH_GAIN, 0),
+};
+
+#endif
-- 
2.17.1

