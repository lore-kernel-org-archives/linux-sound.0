Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B64D152524;
	Wed, 19 Jun 2024 14:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718808696; cv=none; b=YaKZ1u7j5aTqLASN3+hNIEoa9zXttpUTgM9wc34s1BEM7ZYdBmou85G1dS/134le9Sl4IhC5gkjX4IU+I8wuEv5AukkaYHNmvQitFwLuHssyQympWwBXK9AKHxbI1Wl0i5CBNZsesphuD1y+/Xfz1szBNGo+6uK7FPk89j/iuqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718808696; c=relaxed/simple;
	bh=RS1JNK9jnwSdC7yCs6wcFL28QJqhbWDdt/veuUdcqoo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TYWfHdwudVtTauPcQcqZJ5R+SHfiyfudhFNuaZGWHp3ELdXDFH1+4zoPO5yeeyJb7UTOG1W95+ipMoptJs1mfr0MuQ7tjq0MQYQJ7IFriWgzByWZ4UumSFITx/wVqvWwjGNVdZvKHbnfbKxwllHSrMpH1ruonsj1ToKkj4jkrBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=OvrHUGP5; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="OvrHUGP5"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45J6lOgB019985;
	Wed, 19 Jun 2024 09:51:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=R72qzC+gkGgaINaDQSnIHugc4HMNUlVXgcTdybVgFRk=; b=
	OvrHUGP5DRRUdY/4SV1vVIbH+5iV4NILFFvdD/NlEjoWzV9u/eC70L04itl0dexr
	Vq9xV+Tq5F06UDAkR1c5k4K4Lb0SwfcBwhdMI99R8Qoiyu69V8Y1avDfZectb5mN
	mplGthk0yJd8WM1+Vk1KIPTxPc8G8Uorlmg+AtDx/2VUeDA2PuLTN5JTFbiyIcgB
	D8jCZbfUowNCEeSb65JXojb65Q9Leo6VEHDiNVeD/3LoNTgl7DGOzxqfmFbtblD/
	7a3hUXhmNMoz9YouNuhRijfgc9YRSWYG3HSTa+XQ7FTynEJ8GNHFMvzCFUjt1OgM
	60NoHeLXH853r1z3bmD/9w==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3yuj8m0ss2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 09:51:14 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 19 Jun
 2024 15:51:12 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Wed, 19 Jun 2024 15:51:12 +0100
Received: from paulha.crystal.cirrus.com (paulha.ad.cirrus.com [141.131.145.123])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 0CC1D82F2A7;
	Wed, 19 Jun 2024 14:51:10 +0000 (UTC)
From: Paul Handrigan <paulha@opensource.cirrus.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
        <patches@opensource.cirrus.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>
CC: Paul Handrigan <paulha@opensource.cirrus.com>
Subject: [PATCH v4 2/2] ASoC: cs530x: Support for cs530x ADCs
Date: Wed, 19 Jun 2024 09:50:55 -0500
Message-ID: <20240619145056.1379266-3-paulha@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240619145056.1379266-1-paulha@opensource.cirrus.com>
References: <20240619145056.1379266-1-paulha@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: A61lvg0-yuwXhC5TLCo7sjKGuaUdM2dx
X-Proofpoint-ORIG-GUID: A61lvg0-yuwXhC5TLCo7sjKGuaUdM2dx
X-Proofpoint-Spam-Reason: safe

Add support for the cs530x family of high performance
ADCs.

Signed-off-by: Paul Handrigan <paulha@opensource.cirrus.com>
---
 sound/soc/codecs/Kconfig      |  14 +
 sound/soc/codecs/Makefile     |   4 +
 sound/soc/codecs/cs530x-i2c.c |  71 +++
 sound/soc/codecs/cs530x.c     | 966 ++++++++++++++++++++++++++++++++++
 sound/soc/codecs/cs530x.h     | 223 ++++++++
 5 files changed, 1278 insertions(+)
 create mode 100644 sound/soc/codecs/cs530x-i2c.c
 create mode 100644 sound/soc/codecs/cs530x.c
 create mode 100644 sound/soc/codecs/cs530x.h

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 7b99556f24d3..371ffb6327cd 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -99,6 +99,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_CS47L90
 	imply SND_SOC_CS47L92
 	imply SND_SOC_CS53L30
+	imply SND_SOC_CS530X_I2C
 	imply SND_SOC_CX20442
 	imply SND_SOC_CX2072X
 	imply SND_SOC_DA7210
@@ -999,6 +1000,19 @@ config SND_SOC_CS53L30
 	tristate "Cirrus Logic CS53L30 CODEC"
 	depends on I2C
 
+config SND_SOC_CS530X
+	tristate
+
+config SND_SOC_CS530X_I2C
+	tristate "Cirrus Logic CS530x ADCs (I2C)"
+	depends on I2C
+	select REGMAP
+	select REGMAP_I2C
+	select SND_SOC_CS530X
+	help
+	  Enable support for Cirrus Logic CS530X ADCs
+	  with I2C control.
+
 config SND_SOC_CX20442
 	tristate
 	depends on TTY
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index ca69f35cc0f7..27fe5c26306e 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -107,6 +107,8 @@ snd-soc-cs47l85-y := cs47l85.o
 snd-soc-cs47l90-y := cs47l90.o
 snd-soc-cs47l92-y := cs47l92.o
 snd-soc-cs53l30-y := cs53l30.o
+snd-soc-cs530x-y := cs530x.o
+snd-soc-cs530x-i2c-y := cs530x-i2c.o
 snd-soc-cx20442-y := cx20442.o
 snd-soc-cx2072x-y := cx2072x.o
 snd-soc-da7210-y := da7210.o
@@ -508,6 +510,8 @@ obj-$(CONFIG_SND_SOC_CS47L85)	+= snd-soc-cs47l85.o
 obj-$(CONFIG_SND_SOC_CS47L90)	+= snd-soc-cs47l90.o
 obj-$(CONFIG_SND_SOC_CS47L92)	+= snd-soc-cs47l92.o
 obj-$(CONFIG_SND_SOC_CS53L30)	+= snd-soc-cs53l30.o
+obj-$(CONFIG_SND_SOC_CS530X)	+= snd-soc-cs530x.o
+obj-$(CONFIG_SND_SOC_CS530X_I2C)	+= snd-soc-cs530x-i2c.o
 obj-$(CONFIG_SND_SOC_CX20442)	+= snd-soc-cx20442.o
 obj-$(CONFIG_SND_SOC_CX2072X)	+= snd-soc-cx2072x.o
 obj-$(CONFIG_SND_SOC_DA7210)	+= snd-soc-da7210.o
diff --git a/sound/soc/codecs/cs530x-i2c.c b/sound/soc/codecs/cs530x-i2c.c
new file mode 100644
index 000000000000..ca9337f65915
--- /dev/null
+++ b/sound/soc/codecs/cs530x-i2c.c
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// CS530x CODEC driver
+//
+// Copyright (C) 2024 Cirrus Logic, Inc. and
+//                    Cirrus Logic International Semiconductor Ltd.
+
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/i2c.h>
+#include <linux/regmap.h>
+
+#include "cs530x.h"
+
+static const struct of_device_id cs530x_of_match[] = {
+	{
+		.compatible = "cirrus,cs5302",
+		.data = (void *)CS5302,
+	}, {
+		.compatible = "cirrus,cs5304",
+		.data = (void *)CS5304,
+	}, {
+		.compatible = "cirrus,cs5308",
+		.data = (void *)CS5308,
+	},
+	{}
+};
+MODULE_DEVICE_TABLE(of, cs530x_of_match);
+
+static const struct i2c_device_id cs530x_i2c_id[] = {
+	{ "cs5302", CS5302 },
+	{ "cs5304", CS5304 },
+	{ "cs5308", CS5308 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, cs530x_i2c_id);
+
+static int cs530x_i2c_probe(struct i2c_client *client)
+{
+	struct cs530x_priv *cs530x;
+
+	cs530x = devm_kzalloc(&client->dev, sizeof(*cs530x), GFP_KERNEL);
+	if (!cs530x)
+		return -ENOMEM;
+
+	i2c_set_clientdata(client, cs530x);
+
+	cs530x->regmap = devm_regmap_init_i2c(client, &cs530x_regmap);
+	if (IS_ERR(cs530x->regmap))
+		return dev_err_probe(&client->dev, PTR_ERR(cs530x->regmap),
+			      "Failed to allocate register map\n");
+
+	cs530x->devtype = (uintptr_t)i2c_get_match_data(client);
+	cs530x->dev = &client->dev;
+
+	return cs530x_probe(cs530x);
+}
+
+static struct i2c_driver cs530x_i2c_driver = {
+	.driver = {
+		.name = "cs530x",
+		.of_match_table = cs530x_of_match,
+	},
+	.probe = cs530x_i2c_probe,
+	.id_table = cs530x_i2c_id,
+};
+module_i2c_driver(cs530x_i2c_driver);
+
+MODULE_DESCRIPTION("I2C CS530X driver");
+MODULE_AUTHOR("Paul Handrigan, Cirrus Logic Inc, <paulha@opensource.cirrus.com>");
+MODULE_IMPORT_NS(SND_SOC_CS530X);
diff --git a/sound/soc/codecs/cs530x.c b/sound/soc/codecs/cs530x.c
new file mode 100644
index 000000000000..036d0f45e3ba
--- /dev/null
+++ b/sound/soc/codecs/cs530x.c
@@ -0,0 +1,966 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// CS530x CODEC driver
+//
+// Copyright (C) 2024 Cirrus Logic, Inc. and
+//                    Cirrus Logic International Semiconductor Ltd.
+
+#include <sound/core.h>
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <sound/initval.h>
+#include <linux/module.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <linux/pm.h>
+#include <linux/property.h>
+#include <linux/slab.h>
+#include <sound/soc.h>
+#include <sound/tlv.h>
+
+#include "cs530x.h"
+
+#define CS530X_MAX_ADC_CH	8
+#define CS530X_MIN_ADC_CH	2
+
+static const char *cs530x_supply_names[CS530X_NUM_SUPPLIES] = {
+	"vdd-a",
+	"vdd-io",
+};
+
+static const struct reg_default cs530x_reg_defaults[] = {
+	{ CS530X_CLK_CFG_0, 0x30 },
+	{ CS530X_CLK_CFG_1, 0x0001 },
+	{ CS530X_CHIP_ENABLE, 0 },
+	{ CS530X_ASP_CFG, 0 },
+	{ CS530X_SIGNAL_PATH_CFG, 0 },
+	{ CS530X_IN_ENABLES, 0 },
+	{ CS530X_IN_RAMP_SUM, 0x0022 },
+	{ CS530X_IN_FILTER, 0 },
+	{ CS530X_IN_HIZ, 0 },
+	{ CS530X_IN_INV, 0 },
+	{ CS530X_IN_VOL_CTRL1_0, 0x8000 },
+	{ CS530X_IN_VOL_CTRL1_1, 0x8000 },
+	{ CS530X_IN_VOL_CTRL2_0, 0x8000 },
+	{ CS530X_IN_VOL_CTRL2_1, 0x8000 },
+	{ CS530X_IN_VOL_CTRL3_0, 0x8000 },
+	{ CS530X_IN_VOL_CTRL3_1, 0x8000 },
+	{ CS530X_IN_VOL_CTRL4_0, 0x8000 },
+	{ CS530X_IN_VOL_CTRL4_1, 0x8000 },
+	{ CS530X_PAD_FN, 0 },
+	{ CS530X_PAD_LVL, 0 },
+};
+
+static bool cs530x_read_and_write_regs(unsigned int reg)
+{
+	switch (reg) {
+	case CS530X_CLK_CFG_0:
+	case CS530X_CLK_CFG_1:
+	case CS530X_CHIP_ENABLE:
+	case CS530X_ASP_CFG:
+	case CS530X_SIGNAL_PATH_CFG:
+	case CS530X_IN_ENABLES:
+	case CS530X_IN_RAMP_SUM:
+	case CS530X_IN_FILTER:
+	case CS530X_IN_HIZ:
+	case CS530X_IN_INV:
+	case CS530X_IN_VOL_CTRL1_0:
+	case CS530X_IN_VOL_CTRL1_1:
+	case CS530X_IN_VOL_CTRL2_0:
+	case CS530X_IN_VOL_CTRL2_1:
+	case CS530X_IN_VOL_CTRL3_0:
+	case CS530X_IN_VOL_CTRL3_1:
+	case CS530X_IN_VOL_CTRL4_0:
+	case CS530X_IN_VOL_CTRL4_1:
+	case CS530X_PAD_FN:
+	case CS530X_PAD_LVL:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool cs530x_readable_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case CS530X_DEVID:
+	case CS530X_REVID:
+		return true;
+	default:
+		return cs530x_read_and_write_regs(reg);
+	}
+}
+
+static bool cs530x_writeable_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case CS530X_SW_RESET:
+	case CS530X_IN_VOL_CTRL5:
+		return true;
+	default:
+		return cs530x_read_and_write_regs(reg);
+	}
+}
+
+static int cs530x_put_volsw_vu(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct cs530x_priv *cs530x = snd_soc_component_get_drvdata(component);
+	struct regmap *regmap = cs530x->regmap;
+	int ret;
+
+	snd_soc_dapm_mutex_lock(dapm);
+
+	ret = snd_soc_put_volsw(kcontrol, ucontrol);
+	if (ret)
+		goto volsw_err;
+
+	/* Write IN_VU bit for the volume change to take effect */
+	regmap_write(regmap, CS530X_IN_VOL_CTRL5, CS530X_IN_VU);
+
+volsw_err:
+	snd_soc_dapm_mutex_unlock(dapm);
+
+	return ret;
+}
+
+static const DECLARE_TLV_DB_SCALE(in_vol_tlv, -1270, 50, 0);
+
+static const char * const cs530x_in_hpf_text[] = {
+	"Min Phase Slow Roll-off",
+	"Min Phase Fast Roll-off",
+	"Linear Phase Slow Roll-off",
+	"Linear Phase Fast Roll-off",
+};
+
+static SOC_ENUM_SINGLE_DECL(cs530x_in_hpf_enum, CS530X_IN_FILTER,
+			    CS530X_IN_FILTER_SHIFT,
+			    cs530x_in_hpf_text);
+
+static const char * const cs530x_in_4ch_sum_text[] = {
+	"None",
+	"Groups of 2",
+	"Groups of 4",
+};
+
+static SOC_ENUM_SINGLE_DECL(cs530x_in_sum_ch4_enum, CS530X_IN_RAMP_SUM,
+			    CS530X_IN_SUM_MODE_SHIFT,
+			    cs530x_in_4ch_sum_text);
+
+static const struct snd_kcontrol_new cs530x_in_sum_4ch_controls[] = {
+SOC_ENUM("IN Sum Select", cs530x_in_sum_ch4_enum),
+};
+
+static const char * const cs530x_in_8ch_sum_text[] = {
+	"None",
+	"Groups of 2",
+	"Groups of 4",
+	"Groups of 8",
+};
+
+static SOC_ENUM_SINGLE_DECL(cs530x_in_sum_ch8_enum, CS530X_IN_RAMP_SUM,
+			    CS530X_IN_SUM_MODE_SHIFT,
+			    cs530x_in_8ch_sum_text);
+
+static const struct snd_kcontrol_new cs530x_in_sum_8ch_controls[] = {
+SOC_ENUM("IN Sum Select", cs530x_in_sum_ch8_enum),
+};
+
+
+static const char * const cs530x_vol_ramp_text[] = {
+	"0ms/6dB", "0.5ms/6dB", "1ms/6dB", "2ms/6dB", "4ms/6dB", "8ms/6dB",
+	"15ms/6dB", "30ms/6dB",
+};
+
+static SOC_ENUM_SINGLE_DECL(cs530x_ramp_inc_enum, CS530X_IN_RAMP_SUM,
+			    CS530X_RAMP_RATE_INC_SHIFT,
+			    cs530x_vol_ramp_text);
+
+static SOC_ENUM_SINGLE_DECL(cs530x_ramp_dec_enum, CS530X_IN_RAMP_SUM,
+			    CS530X_RAMP_RATE_DEC_SHIFT,
+			    cs530x_vol_ramp_text);
+
+static const struct snd_kcontrol_new cs530x_in_1_to_2_controls[] = {
+SOC_SINGLE_EXT_TLV("IN1 Volume", CS530X_IN_VOL_CTRL1_0, 0, 255, 1,
+		    snd_soc_get_volsw, cs530x_put_volsw_vu, in_vol_tlv),
+SOC_SINGLE_EXT_TLV("IN2 Volume", CS530X_IN_VOL_CTRL1_1, 0, 255, 1,
+		    snd_soc_get_volsw, cs530x_put_volsw_vu, in_vol_tlv),
+
+SOC_ENUM("IN HPF Select", cs530x_in_hpf_enum),
+SOC_ENUM("Input Ramp Up", cs530x_ramp_inc_enum),
+SOC_ENUM("Input Ramp Down", cs530x_ramp_dec_enum),
+
+SOC_SINGLE("ADC1 Invert Switch", CS530X_IN_INV, CS530X_IN1_INV_SHIFT, 1, 0),
+SOC_SINGLE("ADC2 Invert Switch", CS530X_IN_INV, CS530X_IN2_INV_SHIFT, 1, 0),
+};
+
+static const struct snd_kcontrol_new cs530x_in_3_to_4_controls[] = {
+SOC_SINGLE_EXT_TLV("IN3 Volume", CS530X_IN_VOL_CTRL2_0, 0, 255, 1,
+		    snd_soc_get_volsw, cs530x_put_volsw_vu, in_vol_tlv),
+SOC_SINGLE_EXT_TLV("IN4 Volume", CS530X_IN_VOL_CTRL2_1, 0, 255, 1,
+		    snd_soc_get_volsw, cs530x_put_volsw_vu, in_vol_tlv),
+
+SOC_SINGLE("ADC3 Invert Switch", CS530X_IN_INV, CS530X_IN3_INV_SHIFT, 1, 0),
+SOC_SINGLE("ADC4 Invert Switch", CS530X_IN_INV, CS530X_IN4_INV_SHIFT, 1, 0),
+};
+
+static const struct snd_kcontrol_new cs530x_in_5_to_8_controls[] = {
+SOC_SINGLE_EXT_TLV("IN5 Volume", CS530X_IN_VOL_CTRL3_0, 0, 255, 1,
+		    snd_soc_get_volsw, cs530x_put_volsw_vu, in_vol_tlv),
+SOC_SINGLE_EXT_TLV("IN6 Volume", CS530X_IN_VOL_CTRL3_1, 0, 255, 1,
+		    snd_soc_get_volsw, cs530x_put_volsw_vu, in_vol_tlv),
+SOC_SINGLE_EXT_TLV("IN7 Volume", CS530X_IN_VOL_CTRL4_0, 0, 255, 1,
+		    snd_soc_get_volsw, cs530x_put_volsw_vu, in_vol_tlv),
+SOC_SINGLE_EXT_TLV("IN8 Volume", CS530X_IN_VOL_CTRL4_1, 0, 255, 1,
+		    snd_soc_get_volsw, cs530x_put_volsw_vu, in_vol_tlv),
+
+SOC_SINGLE("ADC5 Invert Switch", CS530X_IN_INV, CS530X_IN5_INV_SHIFT, 1, 0),
+SOC_SINGLE("ADC6 Invert Switch", CS530X_IN_INV, CS530X_IN6_INV_SHIFT, 1, 0),
+SOC_SINGLE("ADC7 Invert Switch", CS530X_IN_INV, CS530X_IN7_INV_SHIFT, 1, 0),
+SOC_SINGLE("ADC8 Invert Switch", CS530X_IN_INV, CS530X_IN8_INV_SHIFT, 1, 0),
+};
+
+static int cs530x_adc_event(struct snd_soc_dapm_widget *w,
+			     struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct cs530x_priv *cs530x = snd_soc_component_get_drvdata(component);
+	struct regmap *regmap = cs530x->regmap;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		cs530x->adc_pairs_count++;
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		regmap_clear_bits(regmap, CS530X_IN_VOL_CTRL1_0 +
+				 (w->shift * 2), CS530X_IN_MUTE);
+		regmap_clear_bits(regmap, CS530X_IN_VOL_CTRL1_0 +
+				 ((w->shift+1) * 2), CS530X_IN_MUTE);
+
+		cs530x->adc_pairs_count--;
+		if (!cs530x->adc_pairs_count) {
+			usleep_range(1000, 1100);
+			return regmap_write(regmap, CS530X_IN_VOL_CTRL5,
+					    CS530X_IN_VU);
+		}
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		regmap_set_bits(regmap, CS530X_IN_VOL_CTRL1_0 +
+			       (w->shift * 2), CS530X_IN_MUTE);
+		regmap_set_bits(regmap, CS530X_IN_VOL_CTRL1_0 +
+			       ((w->shift+1) * 2), CS530X_IN_MUTE);
+		return regmap_write(regmap, CS530X_IN_VOL_CTRL5,
+				    CS530X_IN_VU);
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct snd_kcontrol_new adc12_ctrl =
+	SOC_DAPM_SINGLE_VIRT("Switch", 1);
+
+static const struct snd_kcontrol_new adc34_ctrl =
+	SOC_DAPM_SINGLE_VIRT("Switch", 1);
+
+static const struct snd_kcontrol_new adc56_ctrl =
+	SOC_DAPM_SINGLE_VIRT("Switch", 1);
+
+static const struct snd_kcontrol_new adc78_ctrl =
+	SOC_DAPM_SINGLE_VIRT("Switch", 1);
+
+static const struct snd_kcontrol_new in_hpf_ctrl =
+	SOC_DAPM_SINGLE_VIRT("Switch", 1);
+
+/* General DAPM widgets for all devices */
+static const struct snd_soc_dapm_widget cs530x_gen_dapm_widgets[] = {
+SND_SOC_DAPM_SUPPLY("Global Enable", CS530X_CHIP_ENABLE, 0, 0, NULL, 0),
+};
+
+/* ADC's Channels 1 and 2 plus generic ADC DAPM events */
+static const struct snd_soc_dapm_widget cs530x_adc_ch12_dapm_widgets[] = {
+SND_SOC_DAPM_INPUT("IN1"),
+SND_SOC_DAPM_INPUT("IN2"),
+SND_SOC_DAPM_ADC_E("ADC1", NULL, CS530X_IN_ENABLES, 0, 0,
+		   cs530x_adc_event,
+		   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMU |
+		   SND_SOC_DAPM_PRE_PMU),
+SND_SOC_DAPM_ADC("ADC2", NULL, CS530X_IN_ENABLES, 1, 0),
+SND_SOC_DAPM_SWITCH("ADC12 Enable", SND_SOC_NOPM, 0, 0, &adc12_ctrl),
+SND_SOC_DAPM_SWITCH("IN HPF", CS530X_IN_FILTER, CS530X_IN_HPF_EN_SHIFT,
+		    0, &in_hpf_ctrl),
+};
+
+/* ADC's Channels 3 and 4 */
+static const struct snd_soc_dapm_widget cs530x_adc_ch34_dapm_widgets[] = {
+SND_SOC_DAPM_INPUT("IN3"),
+SND_SOC_DAPM_INPUT("IN4"),
+SND_SOC_DAPM_ADC_E("ADC3", NULL, CS530X_IN_ENABLES, 2, 0,
+		   cs530x_adc_event,
+		   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMU |
+		   SND_SOC_DAPM_PRE_PMU),
+SND_SOC_DAPM_ADC("ADC4", NULL, CS530X_IN_ENABLES, 3, 0),
+SND_SOC_DAPM_SWITCH("ADC34 Enable", SND_SOC_NOPM, 0, 0, &adc34_ctrl),
+};
+
+/* ADC's Channels 5 to 8 */
+static const struct snd_soc_dapm_widget cs530x_adc_ch58_dapm_widgets[] = {
+SND_SOC_DAPM_INPUT("IN5"),
+SND_SOC_DAPM_INPUT("IN6"),
+SND_SOC_DAPM_INPUT("IN7"),
+SND_SOC_DAPM_INPUT("IN8"),
+SND_SOC_DAPM_ADC_E("ADC5", NULL, CS530X_IN_ENABLES, 4, 0,
+		   cs530x_adc_event,
+		   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMU |
+		   SND_SOC_DAPM_PRE_PMU),
+SND_SOC_DAPM_ADC("ADC6", NULL, CS530X_IN_ENABLES, 5, 0),
+SND_SOC_DAPM_SWITCH("ADC56 Enable", SND_SOC_NOPM, 0, 0, &adc56_ctrl),
+SND_SOC_DAPM_ADC_E("ADC7", NULL, CS530X_IN_ENABLES, 6, 0,
+		   cs530x_adc_event,
+		   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMU |
+		   SND_SOC_DAPM_PRE_PMU),
+SND_SOC_DAPM_ADC("ADC8", NULL, CS530X_IN_ENABLES, 7, 0),
+SND_SOC_DAPM_SWITCH("ADC78 Enable", SND_SOC_NOPM, 0, 0, &adc78_ctrl),
+};
+
+static const struct snd_soc_dapm_route adc_ch1_2_routes[] = {
+	{ "ADC1", NULL, "Global Enable" },
+	{ "ADC2", NULL, "Global Enable" },
+
+	{ "ADC12 Enable", "Switch", "IN1" },
+	{ "ADC12 Enable", "Switch", "IN2" },
+	{ "ADC1", NULL, "ADC12 Enable" },
+	{ "ADC2", NULL, "ADC12 Enable" },
+	{ "IN HPF", "Switch", "ADC1" },
+	{ "IN HPF", "Switch", "ADC2" },
+
+	{ "AIF Capture", NULL, "IN HPF" },
+	{ "AIF Capture", NULL, "ADC1" },
+	{ "AIF Capture", NULL, "ADC2" },
+};
+
+static const struct snd_soc_dapm_route adc_ch3_4_routes[] = {
+	{ "ADC3", NULL, "Global Enable" },
+	{ "ADC4", NULL, "Global Enable" },
+
+	{ "ADC34 Enable", "Switch", "IN3" },
+	{ "ADC34 Enable", "Switch", "IN4" },
+	{ "ADC3", NULL, "ADC34 Enable" },
+	{ "ADC4", NULL, "ADC34 Enable" },
+	{ "IN HPF", "Switch", "ADC3" },
+	{ "IN HPF", "Switch", "ADC4" },
+
+	{ "AIF Capture", NULL, "ADC3" },
+	{ "AIF Capture", NULL, "ADC4" },
+};
+
+static const struct snd_soc_dapm_route adc_ch5_8_routes[] = {
+	{ "ADC5", NULL, "Global Enable" },
+	{ "ADC6", NULL, "Global Enable" },
+	{ "ADC7", NULL, "Global Enable" },
+	{ "ADC8", NULL, "Global Enable" },
+
+	{ "ADC56 Enable", "Switch", "IN5" },
+	{ "ADC56 Enable", "Switch", "IN6" },
+	{ "ADC5", NULL, "ADC56 Enable" },
+	{ "ADC6", NULL, "ADC56 Enable" },
+	{ "IN HPF", "Switch", "ADC5" },
+	{ "IN HPF", "Switch", "ADC6" },
+
+	{ "AIF Capture", NULL, "ADC5" },
+	{ "AIF Capture", NULL, "ADC6" },
+
+	{ "ADC78 Enable", "Switch", "IN7" },
+	{ "ADC78 Enable", "Switch", "IN8" },
+	{ "ADC7", NULL, "ADC78 Enable" },
+	{ "ADC8", NULL, "ADC78 Enable" },
+	{ "IN HPF", "Switch", "ADC7" },
+	{ "IN HPF", "Switch", "ADC8" },
+
+	{ "AIF Capture", NULL, "ADC7" },
+	{ "AIF Capture", NULL, "ADC8" },
+};
+
+static void cs530x_add_12_adc_widgets(struct snd_soc_component *component)
+{
+	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+
+	snd_soc_add_component_controls(component,
+				       cs530x_in_1_to_2_controls,
+				       ARRAY_SIZE(cs530x_in_1_to_2_controls));
+
+	snd_soc_dapm_new_controls(dapm, cs530x_adc_ch12_dapm_widgets,
+				  ARRAY_SIZE(cs530x_adc_ch12_dapm_widgets));
+
+	snd_soc_dapm_add_routes(dapm, adc_ch1_2_routes,
+				ARRAY_SIZE(adc_ch1_2_routes));
+}
+
+static void cs530x_add_34_adc_widgets(struct snd_soc_component *component)
+{
+	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+
+	snd_soc_add_component_controls(component,
+				       cs530x_in_3_to_4_controls,
+				       ARRAY_SIZE(cs530x_in_3_to_4_controls));
+
+	snd_soc_dapm_new_controls(dapm, cs530x_adc_ch34_dapm_widgets,
+				  ARRAY_SIZE(cs530x_adc_ch34_dapm_widgets));
+
+	snd_soc_dapm_add_routes(dapm, adc_ch3_4_routes,
+				ARRAY_SIZE(adc_ch3_4_routes));
+}
+
+static int cs530x_set_bclk(struct snd_soc_component *component)
+{
+	struct cs530x_priv *cs530x = snd_soc_component_get_drvdata(component);
+	struct regmap *regmap = cs530x->regmap;
+	unsigned int bclk_val;
+
+	switch (cs530x->bclk) {
+	case 2822400:
+	case 3072000:
+		bclk_val = CS530X_BCLK_2P822_3P072;
+		break;
+	case 5644800:
+	case 6144000:
+		bclk_val = CS530X_BCLK_5P6448_6P144;
+		break;
+	case 11289600:
+	case 12288000:
+		bclk_val = CS530X_BCLK_11P2896_12P288;
+		break;
+	case 22579200:
+	case 24576000:
+		bclk_val = CS530X_BCLK_24P5792_24P576;
+		break;
+	default:
+		dev_err(component->dev, "Invalid BCLK %d\n", cs530x->bclk);
+		return -EINVAL;
+	}
+
+	dev_dbg(component->dev, "BCLK is %d\n", cs530x->bclk);
+
+	return regmap_update_bits(regmap, CS530X_ASP_CFG,
+				  CS530X_ASP_BCLK_FREQ_MASK, bclk_val);
+}
+
+static int cs530x_set_pll_refclk(struct snd_soc_component *component,
+				  const unsigned int freq)
+{
+	struct cs530x_priv *priv = snd_soc_component_get_drvdata(component);
+	struct regmap *regmap = priv->regmap;
+	unsigned int refclk;
+
+	switch (freq) {
+	case 2822400:
+	case 3072000:
+		refclk = CS530X_REFCLK_2P822_3P072;
+		break;
+	case 5644800:
+	case 6144000:
+		refclk = CS530X_REFCLK_5P6448_6P144;
+		break;
+	case 11289600:
+	case 12288000:
+		refclk = CS530X_REFCLK_11P2896_12P288;
+		break;
+	case 22579200:
+	case 24576000:
+		refclk = CS530X_REFCLK_24P5792_24P576;
+		break;
+	default:
+		dev_err(component->dev, "Invalid PLL refclk %d\n", freq);
+		return -EINVAL;
+	}
+
+	return regmap_update_bits(regmap, CS530X_CLK_CFG_0,
+				  CS530X_PLL_REFCLK_FREQ_MASK, refclk);
+}
+
+static int cs530x_hw_params(struct snd_pcm_substream *substream,
+			    struct snd_pcm_hw_params *params,
+			    struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct cs530x_priv *cs530x = snd_soc_component_get_drvdata(component);
+	struct regmap *regmap = cs530x->regmap;
+	int ret = 0, fs = params_rate(params);
+	unsigned int fs_val;
+
+
+	switch (fs) {
+	case 32000:
+		fs_val = CS530X_FS_32K;
+		break;
+	case 44100:
+	case 48000:
+		fs_val = CS530X_FS_48K_44P1K;
+		break;
+	case 88200:
+	case 96000:
+		fs_val = CS530X_FS_96K_88P2K;
+		break;
+	case 176400:
+	case 192000:
+		fs_val = CS530X_FS_192K_176P4K;
+		break;
+	case 356800:
+	case 384000:
+		fs_val = CS530X_FS_384K_356P8K;
+		break;
+	case 705600:
+	case 768000:
+		fs_val = CS530X_FS_768K_705P6K;
+		break;
+	default:
+		dev_err(component->dev, "Invalid sample rate %d\n", fs);
+		return -EINVAL;
+	}
+
+	cs530x->fs = fs;
+	regmap_update_bits(regmap, CS530X_CLK_CFG_1,
+			   CS530X_SAMPLE_RATE_MASK, fs_val);
+
+	if (cs530x->tdm_slots) {
+		dev_dbg(component->dev, "Configuring for %d %d bit TDM slots\n",
+			cs530x->tdm_slots, cs530x->tdm_width);
+		cs530x->bclk = snd_soc_calc_bclk(cs530x->fs,
+						 cs530x->tdm_width,
+						 params_channels(params),
+						 cs530x->tdm_slots);
+	} else {
+		cs530x->bclk = snd_soc_params_to_bclk(params);
+	}
+
+	if (!regmap_test_bits(regmap, CS530X_CLK_CFG_0,
+			     CS530X_PLL_REFCLK_SRC_MASK)) {
+		ret = cs530x_set_pll_refclk(component, cs530x->bclk);
+		if (ret)
+			return ret;
+	}
+
+	return cs530x_set_bclk(component);
+}
+
+static int cs530x_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
+{
+	struct snd_soc_component *component = dai->component;
+	struct cs530x_priv *priv = snd_soc_component_get_drvdata(component);
+	struct regmap *regmap = priv->regmap;
+	unsigned int asp_fmt, asp_cfg = 0;
+
+	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
+	case SND_SOC_DAIFMT_CBS_CFS:
+		break;
+	case SND_SOC_DAIFMT_CBM_CFM:
+		asp_cfg = CS530X_ASP_PRIMARY;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+	case SND_SOC_DAIFMT_DSP_A:
+		asp_fmt = CS530X_ASP_FMT_DSP_A;
+		break;
+	case SND_SOC_DAIFMT_I2S:
+		asp_fmt = CS530X_ASP_FMT_I2S;
+		break;
+	case SND_SOC_DAIFMT_LEFT_J:
+		asp_fmt = CS530X_ASP_FMT_LJ;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
+	case SND_SOC_DAIFMT_NB_NF:
+		break;
+	case SND_SOC_DAIFMT_IB_IF:
+		asp_cfg |= CS530X_ASP_BCLK_INV;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	regmap_update_bits(regmap, CS530X_ASP_CFG,
+			   CS530X_ASP_PRIMARY | CS530X_ASP_BCLK_INV,
+			   asp_cfg);
+
+	return regmap_update_bits(regmap, CS530X_SIGNAL_PATH_CFG,
+				  CS530X_ASP_FMT_MASK, asp_fmt);
+}
+
+static bool cs530x_check_mclk_freq(struct snd_soc_component *component,
+				   const unsigned int freq)
+{
+	switch (freq) {
+	case 24576000:
+	case 22579200:
+	case 12288000:
+	case 11289600:
+		return true;
+	default:
+		dev_err(component->dev, "Invalid MCLK %d\n", freq);
+		return false;
+	}
+}
+
+static int cs530x_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
+				 unsigned int rx_mask, int slots, int slot_width)
+{
+	struct snd_soc_component *component = dai->component;
+	struct cs530x_priv *cs530x = snd_soc_component_get_drvdata(component);
+	struct regmap *regmap = cs530x->regmap;
+	unsigned int val;
+
+	switch (tx_mask) {
+	case CS530X_0_1_TDM_SLOT_MASK:
+	case CS530X_0_3_TDM_SLOT_MASK:
+	case CS530X_0_7_TDM_SLOT_MASK:
+		val = CS530X_0_7_TDM_SLOT_VAL;
+		break;
+	case CS530X_2_3_TDM_SLOT_MASK:
+		val = CS530X_2_3_TDM_SLOT_VAL;
+		break;
+	case CS530X_4_5_TDM_SLOT_MASK:
+	case CS530X_4_7_TDM_SLOT_MASK:
+		val = CS530X_4_7_TDM_SLOT_VAL;
+		break;
+	case CS530X_6_7_TDM_SLOT_MASK:
+		val = CS530X_6_7_TDM_SLOT_VAL;
+		break;
+	case CS530X_8_9_TDM_SLOT_MASK:
+	case CS530X_8_11_TDM_SLOT_MASK:
+	case CS530X_8_15_TDM_SLOT_MASK:
+		val = CS530X_8_15_TDM_SLOT_VAL;
+		break;
+	case CS530X_10_11_TDM_SLOT_MASK:
+		val = CS530X_10_11_TDM_SLOT_VAL;
+		break;
+	case CS530X_12_13_TDM_SLOT_MASK:
+	case CS530X_12_15_TDM_SLOT_MASK:
+		val = CS530X_12_15_TDM_SLOT_VAL;
+		break;
+	case CS530X_14_15_TDM_SLOT_MASK:
+		val = CS530X_14_15_TDM_SLOT_VAL;
+		break;
+	default:
+		dev_err(component->dev, "Invalid TX slot(s) 0x%x\n", tx_mask);
+		return -EINVAL;
+	}
+
+	return regmap_update_bits(regmap, CS530X_SIGNAL_PATH_CFG,
+				  CS530X_ASP_TDM_SLOT_MASK,
+				  val << CS530X_ASP_TDM_SLOT_SHIFT);
+}
+
+static const struct snd_soc_dai_ops cs530x_dai_ops = {
+	.set_fmt = cs530x_set_fmt,
+	.hw_params = cs530x_hw_params,
+	.set_tdm_slot = cs530x_set_tdm_slot,
+};
+
+static const struct snd_soc_dai_driver cs530x_dai = {
+	.name = "cs530x-dai",
+	.capture = {
+		.stream_name = "AIF Capture",
+		.channels_min = 2,
+		.channels_max = 8,
+		.rates = SNDRV_PCM_RATE_KNOT,
+		.formats = SNDRV_PCM_FMTBIT_S32_LE,
+	},
+	.ops = &cs530x_dai_ops,
+	.symmetric_rate = 1,
+	.symmetric_sample_bits = 1,
+};
+
+static int cs530x_set_pll(struct snd_soc_component *component, int pll_id,
+			   int source, unsigned int freq_in,
+			   unsigned int freq_out)
+{
+	struct cs530x_priv *cs530x = snd_soc_component_get_drvdata(component);
+	struct regmap *regmap = cs530x->regmap;
+	unsigned int sysclk_src;
+	int ret;
+
+	regmap_read(regmap, CS530X_CLK_CFG_0, &sysclk_src);
+
+	/* Check if the source is the PLL  */
+	if ((sysclk_src & CS530X_SYSCLK_SRC_MASK) == 0)
+		return 0;
+
+	switch (source) {
+	case CS530X_PLL_SRC_MCLK:
+		if (!cs530x_check_mclk_freq(component, freq_in))
+			return -EINVAL;
+
+		ret = cs530x_set_pll_refclk(component, freq_in);
+		if (ret)
+			return ret;
+
+		break;
+	case CS530X_PLL_SRC_BCLK:
+		break;
+	default:
+		dev_err(component->dev, "Invalid PLL source %d\n", source);
+		return -EINVAL;
+	}
+
+	return regmap_update_bits(regmap, CS530X_CLK_CFG_0,
+				  CS530X_PLL_REFCLK_SRC_MASK, source);
+}
+
+static int cs530x_component_probe(struct snd_soc_component *component)
+{
+	struct cs530x_priv *cs530x = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	int num_widgets;
+
+	snd_soc_dapm_new_controls(dapm, cs530x_gen_dapm_widgets,
+				  ARRAY_SIZE(cs530x_gen_dapm_widgets));
+
+	switch (cs530x->devtype) {
+	case CS5302:
+		cs530x_add_12_adc_widgets(component);
+		break;
+	case CS5304:
+		cs530x_add_12_adc_widgets(component);
+		cs530x_add_34_adc_widgets(component);
+
+		num_widgets = ARRAY_SIZE(cs530x_in_sum_4ch_controls);
+		snd_soc_add_component_controls(component,
+					       cs530x_in_sum_4ch_controls,
+					       num_widgets);
+		break;
+
+	case CS5308:
+		cs530x_add_12_adc_widgets(component);
+		cs530x_add_34_adc_widgets(component);
+
+		num_widgets = ARRAY_SIZE(cs530x_in_5_to_8_controls);
+		snd_soc_add_component_controls(component,
+					       cs530x_in_5_to_8_controls,
+					       num_widgets);
+
+		num_widgets = ARRAY_SIZE(cs530x_in_sum_8ch_controls);
+		snd_soc_add_component_controls(component,
+					       cs530x_in_sum_8ch_controls,
+					       num_widgets);
+
+		num_widgets = ARRAY_SIZE(cs530x_adc_ch58_dapm_widgets);
+		snd_soc_dapm_new_controls(dapm, cs530x_adc_ch58_dapm_widgets,
+					  num_widgets);
+
+		snd_soc_dapm_add_routes(dapm, adc_ch5_8_routes,
+					ARRAY_SIZE(adc_ch5_8_routes));
+		break;
+	default:
+		dev_err(component->dev, "Invalid device type %d\n",
+			cs530x->devtype);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int cs530x_set_sysclk(struct snd_soc_component *component, int clk_id,
+				int source, unsigned int freq, int dir)
+{
+	struct cs530x_priv *cs530x = snd_soc_component_get_drvdata(component);
+	struct regmap *regmap = cs530x->regmap;
+
+	switch (source) {
+	case CS530X_SYSCLK_SRC_MCLK:
+		if (freq != 24560000 && freq != 22572000) {
+			dev_err(component->dev, "Invalid MCLK source rate %d\n",
+				freq);
+			return -EINVAL;
+		}
+
+		cs530x->mclk_rate = freq;
+		break;
+	case CS530X_SYSCLK_SRC_PLL:
+		break;
+	default:
+		dev_err(component->dev, "Invalid clock id %d\n", clk_id);
+		return -EINVAL;
+	}
+
+	return regmap_update_bits(regmap, CS530X_CLK_CFG_0,
+				  CS530X_SYSCLK_SRC_MASK,
+				  source << CS530X_SYSCLK_SRC_SHIFT);
+}
+
+static const struct snd_soc_component_driver soc_component_dev_cs530x = {
+	.probe			= cs530x_component_probe,
+	.set_sysclk		= cs530x_set_sysclk,
+	.set_pll		= cs530x_set_pll,
+	.endianness		= 1,
+};
+
+const struct regmap_config cs530x_regmap = {
+	.reg_bits = 16,
+	.val_bits = 16,
+
+	.max_register = CS530X_MAX_REGISTER,
+	.readable_reg = cs530x_readable_register,
+	.writeable_reg = cs530x_writeable_register,
+
+	.cache_type = REGCACHE_MAPLE,
+	.reg_defaults = cs530x_reg_defaults,
+	.num_reg_defaults = ARRAY_SIZE(cs530x_reg_defaults),
+};
+EXPORT_SYMBOL_NS_GPL(cs530x_regmap, SND_SOC_CS530X);
+
+static int cs530x_check_device_id(struct cs530x_priv *cs530x)
+{
+	struct device *dev = cs530x->dev;
+	unsigned int dev_id, rev;
+	int ret;
+
+	ret = regmap_read(cs530x->regmap, CS530X_DEVID, &dev_id);
+	if (ret)
+		return dev_err_probe(dev, ret, "Can't read device ID\n");
+
+	ret = regmap_read(cs530x->regmap, CS530X_REVID, &rev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Can't read REV ID\n");
+
+	dev_dbg(dev, "Device ID 0x%x Rev ID 0x%x\n", dev_id, rev);
+
+	switch (dev_id) {
+	case CS530X_2CH_ADC_DEV_ID:
+		cs530x->num_adcs = 2;
+		break;
+	case CS530X_4CH_ADC_DEV_ID:
+		cs530x->num_adcs = 4;
+		break;
+	case CS530X_8CH_ADC_DEV_ID:
+		cs530x->num_adcs = 8;
+		break;
+	default:
+		return dev_err_probe(dev, -EINVAL, "Invalid device ID 0x%x\n",
+				     dev_id);
+	}
+
+	return 0;
+}
+
+static int cs530x_parse_device_properties(struct cs530x_priv *cs530x)
+{
+	struct regmap *regmap = cs530x->regmap;
+	struct device *dev = cs530x->dev;
+	unsigned int val = 0;
+
+	switch (cs530x->num_adcs) {
+	case 8:
+		if (device_property_read_bool(dev, "cirrus,in-hiz-pin78"))
+			val = CS530X_IN78_HIZ;
+
+		if (device_property_read_bool(dev, "cirrus,in-hiz-pin56"))
+			val |= CS530X_IN56_HIZ;
+
+		fallthrough;
+	case 4:
+		if (device_property_read_bool(dev, "cirrus,in-hiz-pin34"))
+			val |= CS530X_IN34_HIZ;
+
+		fallthrough;
+	case 2:
+		if (device_property_read_bool(dev, "cirrus,in-hiz-pin12"))
+			val |= CS530X_IN12_HIZ;
+
+		return regmap_set_bits(regmap, CS530X_IN_HIZ, val);
+	default:
+		return dev_err_probe(dev, -EINVAL,
+				     "Invalid number of adcs %d\n",
+				     cs530x->num_adcs);
+	}
+}
+
+int cs530x_probe(struct cs530x_priv *cs530x)
+{
+	struct device *dev = cs530x->dev;
+	int ret, i;
+
+	cs530x->dev_dai = devm_kmemdup(dev, &cs530x_dai,
+					sizeof(*(cs530x->dev_dai)),
+					GFP_KERNEL);
+	if (!cs530x->dev_dai)
+		return -ENOMEM;
+
+	for (i = 0; i < ARRAY_SIZE(cs530x->supplies); i++)
+		cs530x->supplies[i].supply = cs530x_supply_names[i];
+
+	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(cs530x->supplies),
+				      cs530x->supplies);
+	if (ret != 0)
+		return dev_err_probe(dev, ret, "Failed to request supplies");
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(cs530x->supplies),
+				    cs530x->supplies);
+	if (ret != 0)
+		return dev_err_probe(dev, ret, "Failed to enable supplies");
+
+	cs530x->reset_gpio = devm_gpiod_get_optional(dev, "reset",
+						      GPIOD_OUT_HIGH);
+	if (IS_ERR(cs530x->reset_gpio)) {
+		ret = dev_err_probe(dev, PTR_ERR(cs530x->reset_gpio),
+			      "Reset gpio not available\n");
+		goto err_regulator;
+	}
+
+	if (cs530x->reset_gpio) {
+		usleep_range(2000, 2100);
+		gpiod_set_value_cansleep(cs530x->reset_gpio, 0);
+	}
+
+	usleep_range(5000, 5100);
+	ret = cs530x_check_device_id(cs530x);
+	if (ret)
+		goto err_reset;
+
+	if (!cs530x->reset_gpio) {
+		ret = regmap_write(cs530x->regmap, CS530X_SW_RESET,
+				   CS530X_SW_RST_VAL);
+		if (ret) {
+			dev_err_probe(dev, ret, "Soft Reset Failed\n");
+			goto err_reset;
+		}
+	}
+
+	ret = cs530x_parse_device_properties(cs530x);
+	if (ret)
+		goto err_reset;
+
+	cs530x->dev_dai->capture.channels_max = cs530x->num_adcs;
+
+	ret = devm_snd_soc_register_component(dev,
+			&soc_component_dev_cs530x, cs530x->dev_dai, 1);
+	if (ret) {
+		dev_err_probe(dev, ret, "Can't register cs530x component\n");
+		goto err_reset;
+	}
+
+	return 0;
+
+err_reset:
+	gpiod_set_value_cansleep(cs530x->reset_gpio, 1);
+
+err_regulator:
+	regulator_bulk_disable(ARRAY_SIZE(cs530x->supplies),
+			       cs530x->supplies);
+
+	return ret;
+}
+EXPORT_SYMBOL_NS_GPL(cs530x_probe, SND_SOC_CS530X);
+
+MODULE_DESCRIPTION("CS530X CODEC Driver");
+MODULE_AUTHOR("Paul Handrigan <paulha@opensource.cirrus.com>");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/cs530x.h b/sound/soc/codecs/cs530x.h
new file mode 100644
index 000000000000..1c85310a5d03
--- /dev/null
+++ b/sound/soc/codecs/cs530x.h
@@ -0,0 +1,223 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * CS530x CODEC driver internal data
+ *
+ * Copyright (C) 2023-2024 Cirrus Logic, Inc. and
+ *                         Cirrus Logic International Semiconductor Ltd.
+ */
+
+#ifndef _CS530X_H
+#define _CS530X_H
+
+#include <linux/device.h>
+#include <linux/gpio/consumer.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+
+/* Devices */
+#define CS530X_2CH_ADC_DEV_ID		 0x5302
+#define CS530X_4CH_ADC_DEV_ID		 0x5304
+#define CS530X_8CH_ADC_DEV_ID		 0x5308
+
+/* Registers */
+
+#define CS530X_DEVID			0x0000000
+#define CS530X_REVID			0x0000004
+#define CS530X_SW_RESET			0x0000022
+
+#define CS530X_CLK_CFG_0		0x0000040
+#define CS530X_CLK_CFG_1		0x0000042
+#define CS530X_CHIP_ENABLE		0x0000044
+#define CS530X_ASP_CFG			0x0000048
+#define CS530X_SIGNAL_PATH_CFG		0x0000050
+#define CS530X_IN_ENABLES		0x0000080
+#define CS530X_IN_RAMP_SUM		0x0000082
+#define CS530X_IN_FILTER		0x0000086
+#define CS530X_IN_HIZ			0x0000088
+#define CS530X_IN_INV			0x000008A
+#define CS530X_IN_VOL_CTRL1_0	        0x0000090
+#define CS530X_IN_VOL_CTRL1_1	        0x0000092
+#define CS530X_IN_VOL_CTRL2_0	        0x0000094
+#define CS530X_IN_VOL_CTRL2_1	        0x0000096
+#define CS530X_IN_VOL_CTRL3_0	        0x0000098
+#define CS530X_IN_VOL_CTRL3_1	        0x000009A
+#define CS530X_IN_VOL_CTRL4_0	        0x000009C
+#define CS530X_IN_VOL_CTRL4_1	        0x000009E
+#define CS530X_IN_VOL_CTRL5		0x00000A0
+
+#define CS530X_PAD_FN			0x0003D24
+#define CS530X_PAD_LVL			0x0003D28
+
+#define CS530X_MAX_REGISTER		CS530X_PAD_LVL
+
+/* Register Fields */
+
+/* REVID */
+#define CS530X_MTLREVID			GENMASK(3, 0)
+#define CS530X_AREVID			GENMASK(7, 4)
+
+/* SW_RESET */
+#define CS530X_SW_RST_SHIFT		8
+#define CS530X_SW_RST_VAL		(0x5A << CS530X_SW_RST_SHIFT)
+
+/* CLK_CFG_0 */
+#define CS530X_PLL_REFCLK_SRC_MASK	BIT(0)
+#define CS530X_PLL_REFCLK_FREQ_MASK	GENMASK(5, 4)
+#define CS530X_SYSCLK_SRC_MASK		BIT(12)
+#define CS530X_SYSCLK_SRC_SHIFT		12
+#define CS530X_REFCLK_2P822_3P072	0
+#define CS530X_REFCLK_5P6448_6P144	0x10
+#define CS530X_REFCLK_11P2896_12P288	0x20
+#define CS530X_REFCLK_24P5792_24P576	0x30
+
+/* CLK_CFG_1 */
+#define CS530X_SAMPLE_RATE_MASK		GENMASK(2, 0)
+#define CS530X_FS_32K			0
+#define CS530X_FS_48K_44P1K		1
+#define CS530X_FS_96K_88P2K		2
+#define CS530X_FS_192K_176P4K		3
+#define CS530X_FS_384K_356P8K		4
+#define CS530X_FS_768K_705P6K		5
+
+/* CHIP_ENABLE */
+#define CS530X_GLOBAL_EN		BIT(0)
+
+/* ASP_CFG */
+#define CS530X_ASP_BCLK_FREQ_MASK	GENMASK(1, 0)
+#define CS530X_ASP_PRIMARY		BIT(5)
+#define CS530X_ASP_BCLK_INV		BIT(6)
+#define CS530X_BCLK_2P822_3P072		0
+#define CS530X_BCLK_5P6448_6P144	1
+#define CS530X_BCLK_11P2896_12P288	2
+#define CS530X_BCLK_24P5792_24P576	3
+
+/* SIGNAL_PATH_CFG */
+#define CS530X_ASP_FMT_MASK		GENMASK(2, 0)
+#define CS530X_ASP_TDM_SLOT_MASK	GENMASK(5, 3)
+#define CS530X_ASP_TDM_SLOT_SHIFT	3
+#define CS530X_ASP_CH_REVERSE		BIT(9)
+#define CS530X_ASP_FMT_I2S		0
+#define CS530X_ASP_FMT_LJ		1
+#define CS530X_ASP_FMT_DSP_A		0x6
+
+/* TDM Slots */
+#define CS530X_0_1_TDM_SLOT_MASK	GENMASK(1, 0)
+#define CS530X_0_3_TDM_SLOT_MASK	GENMASK(3, 0)
+#define CS530X_0_7_TDM_SLOT_MASK	GENMASK(7, 0)
+#define CS530X_0_7_TDM_SLOT_VAL		0
+
+#define CS530X_2_3_TDM_SLOT_MASK	GENMASK(3, 2)
+#define CS530X_2_3_TDM_SLOT_VAL		1
+
+#define CS530X_4_5_TDM_SLOT_MASK	GENMASK(5, 4)
+#define CS530X_4_7_TDM_SLOT_MASK	GENMASK(7, 4)
+#define CS530X_4_7_TDM_SLOT_VAL		2
+
+#define CS530X_6_7_TDM_SLOT_MASK	GENMASK(7, 6)
+#define CS530X_6_7_TDM_SLOT_VAL		3
+
+#define CS530X_8_9_TDM_SLOT_MASK	GENMASK(9, 8)
+#define CS530X_8_11_TDM_SLOT_MASK	GENMASK(11, 8)
+#define CS530X_8_15_TDM_SLOT_MASK	GENMASK(15, 8)
+#define CS530X_8_15_TDM_SLOT_VAL	4
+
+#define CS530X_10_11_TDM_SLOT_MASK	GENMASK(11, 10)
+#define CS530X_10_11_TDM_SLOT_VAL	5
+
+#define CS530X_12_13_TDM_SLOT_MASK	GENMASK(13, 12)
+#define CS530X_12_15_TDM_SLOT_MASK	GENMASK(15, 12)
+#define CS530X_12_15_TDM_SLOT_VAL	6
+
+#define CS530X_14_15_TDM_SLOT_MASK	GENMASK(15, 14)
+#define CS530X_14_15_TDM_SLOT_VAL	7
+
+/* IN_RAMP_SUM */
+#define CS530X_RAMP_RATE_INC_SHIFT	0
+#define CS530X_RAMP_RATE_DEC_SHIFT	4
+#define CS530X_IN_SUM_MODE_SHIFT	13
+
+/* IN_FILTER */
+#define CS530X_IN_FILTER_SHIFT		8
+#define CS530X_IN_HPF_EN_SHIFT		12
+
+/* IN_HIZ */
+#define CS530X_IN12_HIZ			BIT(0)
+#define CS530X_IN34_HIZ			BIT(1)
+#define CS530X_IN56_HIZ			BIT(2)
+#define CS530X_IN78_HIZ			BIT(3)
+
+/* IN_INV */
+#define CS530X_IN1_INV_SHIFT		0
+#define CS530X_IN2_INV_SHIFT		1
+#define CS530X_IN3_INV_SHIFT		2
+#define CS530X_IN4_INV_SHIFT		3
+#define CS530X_IN5_INV_SHIFT		4
+#define CS530X_IN6_INV_SHIFT		5
+#define CS530X_IN7_INV_SHIFT		6
+#define CS530X_IN8_INV_SHIFT		7
+
+/* IN_VOL_CTLy_z */
+#define CS530X_IN_MUTE			BIT(15)
+
+/* IN_VOL_CTL5 */
+#define CS530X_IN_VU			BIT(0)
+
+/* PAD_FN */
+#define CS530X_DOUT2_FN			BIT(0)
+#define CS530X_DOUT3_FN			BIT(1)
+#define CS530X_DOUT4_FN			BIT(2)
+#define CS530X_SPI_CS_FN		BIT(3)
+#define CS530X_CONFIG2_FN		BIT(6)
+#define CS530X_CONFIG3_FN		BIT(7)
+#define CS530X_CONFIG4_FN		BIT(8)
+#define CS530X_CONFIG5_FN		BIT(9)
+
+/* PAD_LVL */
+#define CS530X_CONFIG2_LVL		BIT(6)
+#define CS530X_CONFIG3_LVL		BIT(7)
+#define CS530X_CONFIG4_LVL		BIT(8)
+#define CS530X_CONFIG5_LVL		BIT(9)
+
+/* System Clock Source */
+#define CS530X_SYSCLK_SRC_MCLK		0
+#define CS530X_SYSCLK_SRC_PLL		1
+
+/* PLL Reference Clock Source */
+#define CS530X_PLL_SRC_BCLK		0
+#define CS530X_PLL_SRC_MCLK		1
+
+#define CS530X_NUM_SUPPLIES		2
+
+enum cs530x_type {
+	CS5302,
+	CS5304,
+	CS5308,
+};
+
+/* codec private data */
+struct cs530x_priv {
+	struct regmap *regmap;
+	struct device *dev;
+	struct snd_soc_dai_driver *dev_dai;
+
+	enum cs530x_type devtype;
+	int num_adcs;
+	int num_dacs;
+
+	struct regulator_bulk_data supplies[CS530X_NUM_SUPPLIES];
+
+	unsigned int mclk_rate;
+
+	int tdm_width;
+	int tdm_slots;
+	int bclk;
+	int fs;
+	int adc_pairs_count;
+
+	struct gpio_desc *reset_gpio;
+};
+
+extern const struct regmap_config cs530x_regmap;
+int cs530x_probe(struct cs530x_priv *cs530x);
+
+#endif
-- 
2.34.1

