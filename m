Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C103357A58;
	Fri,  9 Jan 2026 09:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.130.44.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767949465; cv=none; b=X0PNg3yHk77e7doU8hPyMPmJnz6xCbWI4cih/sDh/if0ZG+J3jAGwnWJQxz4vx1/Km16cDlcM8qD6YszsNTv7MIlwmuJO1yZDgusgFSqolUNbaYHEgWZlWly6zCaPHGiNgHDAsxtPoq13DTZEbHr0Inpj4IkmHtE9bsQJ8ASUzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767949465; c=relaxed/simple;
	bh=Cols0olXDmcG2NINw8CZ0PpGHHzk6YIWuCRqBZOUI8o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GTCO/TeoYv9mR3hEsRf9rLJeIwEcVPvwoJw6Zi0VkRc5e/dw+Efa57ghjCRwIh610ROVEU+g5K3QJim19UmlPlqTPVNQIF32tNDUledNCtt9CUUIm85qn2g0apkHNHIEbVm3najxJLmqVlWna7L0ky3cxsIpErjV9GipdpTtPVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com; spf=pass smtp.mailfrom=richtek.com; dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b=E61IJLFw; arc=none smtp.client-ip=220.130.44.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=richtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b="E61IJLFw"
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1767949455;
	bh=f05NxiHIb+vaAHm2MOLnZi7z72lHeOpeLKtw9bq/xE0=; l=8411;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=E61IJLFwtkvVCJPbDt+G5u24EHeHWXHoFev/Wt+ECnIb35suW4tEFZR6wellmTDmB
	 HvdImzjm0pJYSUbiJSrrznVpUMdWXZzzGkMqs9Zi9NQOL2f56hMMa8JpaMEnpXX7gK
	 jTSyAzPoDY0h4wVGbPAP8HnYIQp5AA3aTIgp4ceYjSixdUyBwBh0oadveBy34zZUyU
	 hV4WkYBEbH2OLLLaYsEW+l2uTSer/VPuxGlrgb88D2d0jRWlc6ETKtuU+2xbJJvWxK
	 LTanU8CfBmfpOHEXkLZ5O8X2sIF9DFBrEkI8IbFev2p7FbpXhxdvTwVa7c1L6txSZw
	 EXyjkH3XVz0eg==
Received: from 192.168.10.47
	by mg.richtek.com with MailGates ESMTPS Server V6.0(2572465:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256); Fri, 09 Jan 2026 17:04:00 +0800 (CST)
Received: from ex4.rt.l (192.168.10.47) by ex4.rt.l (192.168.10.47) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.26; Fri, 9 Jan
 2026 17:03:59 +0800
Received: from git-send.richtek.com (192.168.10.154) by ex4.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1748.26 via Frontend
 Transport; Fri, 9 Jan 2026 17:03:59 +0800
From: <cy_huang@richtek.com>
To: Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
CC: Rob Herring <robh@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	ChiYuan Huang <cy_huang@richtek.com>, <musk_wang@richtek.com>,
	<roy_chiu@richtek.com>, <allen_lin@richtek.com>,
	<devicetree@vger.kernel.org>, <linux-sound@vger.kernel.org>
Subject: [PATCH 3/3] ASoC: codecs: rtq9128: Add compatible changes for rtq9154
Date: Fri, 9 Jan 2026 17:03:54 +0800
Message-ID: <26e4454188b3880d84293ea0bf8eac28b20b6469.1767948925.git.cy_huang@richtek.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <cover.1767948925.git.cy_huang@richtek.com>
References: <cover.1767948925.git.cy_huang@richtek.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: ChiYuan Huang <cy_huang@richtek.com>

Although rtq9154 only modify the outter package, some register settings
related to the channel order definition are still different. Use the chip
model ID code to seperate these changes.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 sound/soc/codecs/rtq9128.c | 108 +++++++++++++++++++++++++++++++++++--
 1 file changed, 104 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rtq9128.c b/sound/soc/codecs/rtq9128.c
index 289bb3c04a90..14a2c0723d33 100644
--- a/sound/soc/codecs/rtq9128.c
+++ b/sound/soc/codecs/rtq9128.c
@@ -40,6 +40,12 @@
 #define RTQ9128_REG_EFUSE_DATA	0xE0
 #define RTQ9128_REG_VENDOR_ID	0xF9
 
+#define RTQ9154_REG_CH1_VOL	0x34
+#define RTQ9154_REG_CH2_VOL	0x33
+#define RTQ9154_REG_CH3_VOL	0x32
+#define RTQ9154_REG_CH4_VOL	0x31
+#define RTQ9154_REG_AUTOULQM	0xAD
+
 #define RTQ9128_CHSTAT_VAL_MASK	GENMASK(1, 0)
 #define RTQ9128_DOLEN_MASK	GENMASK(7, 6)
 #define RTQ9128_TDMSRCIN_MASK	GENMASK(5, 4)
@@ -48,6 +54,7 @@
 #define RTQ9128_MSMUTE_MASK	BIT(0)
 #define RTQ9128_DIE_CHECK_MASK	GENMASK(4, 0)
 #define RTQ9128_VENDOR_ID_MASK	GENMASK(19, 8)
+#define RTQ9128_MODEL_ID_MASK	GENMASK(7, 4)
 
 #define RTQ9128_SOFT_RESET_VAL	0x80
 #define RTQ9128_VENDOR_ID_VAL	0x470
@@ -56,6 +63,15 @@
 #define RTQ9128_TKA470B_VAL	0
 #define RTQ9128_RTQ9128DH_VAL	0x0F
 #define RTQ9128_RTQ9128DL_VAL	0x10
+#define RTQ9154_MODEL_ID	0x08
+
+#define RTQ9154_AUTOULQM_VAL	0x82
+
+enum rtq9128_chip_model {
+	CHIP_MODEL_RTQ9128 = 0,
+	CHIP_MODEL_RTQ9154,
+	CHIP_MODEL_MAX
+};
 
 struct rtq9128_data {
 	struct gpio_desc *enable;
@@ -63,6 +79,7 @@ struct rtq9128_data {
 	int tdm_slots;
 	int tdm_slot_width;
 	bool tdm_input_data2_select;
+	enum rtq9128_chip_model chip_model;
 };
 
 struct rtq9128_init_reg {
@@ -251,6 +268,28 @@ static const struct soc_enum rtq9128_out4_phase_enum =
 	SOC_ENUM_SINGLE(RTQ9128_REG_PLLTRI_GEN2, 0, ARRAY_SIZE(phase_select_text),
 			phase_select_text);
 
+static const struct soc_enum rtq9154_ch1_si_enum =
+	SOC_ENUM_SINGLE(RTQ9128_REG_SDI_SEL, 0, ARRAY_SIZE(source_select_text),
+			source_select_text);
+static const struct soc_enum rtq9154_ch2_si_enum =
+	SOC_ENUM_SINGLE(RTQ9128_REG_SDI_SEL, 2, ARRAY_SIZE(source_select_text),
+			source_select_text);
+static const struct soc_enum rtq9154_ch3_si_enum =
+	SOC_ENUM_SINGLE(RTQ9128_REG_SDI_SEL, 4, ARRAY_SIZE(source_select_text),
+			source_select_text);
+static const struct soc_enum rtq9154_ch4_si_enum =
+	SOC_ENUM_SINGLE(RTQ9128_REG_SDI_SEL, 6, ARRAY_SIZE(source_select_text),
+			source_select_text);
+static const struct soc_enum rtq9154_out1_phase_enum =
+	SOC_ENUM_SINGLE(RTQ9128_REG_PLLTRI_GEN2, 0, ARRAY_SIZE(phase_select_text),
+			phase_select_text);
+static const struct soc_enum rtq9154_out2_phase_enum =
+	SOC_ENUM_SINGLE(RTQ9128_REG_PLLTRI_GEN2, 4, ARRAY_SIZE(phase_select_text),
+			phase_select_text);
+static const struct soc_enum rtq9154_out3_phase_enum =
+	SOC_ENUM_SINGLE(RTQ9128_REG_PLLTRI_GEN1, 0, ARRAY_SIZE(phase_select_text),
+			phase_select_text);
+
 /*
  * In general usage, DVDD could be 1P8V, 3P0V or 3P3V.
  * This DVDD undervoltage protection is to prevent from the abnormal power
@@ -283,10 +322,33 @@ static const struct snd_kcontrol_new rtq9128_snd_ctrls[] = {
 	SOC_ENUM("DVDD UV Threshold Select", rtq9128_dvdduv_select_enum),
 };
 
+static const struct snd_kcontrol_new rtq9154_snd_ctrls[] = {
+	SOC_SINGLE_TLV("MS Volume", RTQ9128_REG_MS_VOL, 2, 511, 1, dig_tlv),
+	SOC_SINGLE_TLV("CH1 Volume", RTQ9154_REG_CH1_VOL, 2, 511, 1, dig_tlv),
+	SOC_SINGLE_TLV("CH2 Volume", RTQ9154_REG_CH2_VOL, 2, 511, 1, dig_tlv),
+	SOC_SINGLE_TLV("CH3 Volume", RTQ9154_REG_CH3_VOL, 2, 511, 1, dig_tlv),
+	SOC_SINGLE_TLV("CH4 Volume", RTQ9154_REG_CH4_VOL, 2, 511, 1, dig_tlv),
+	SOC_SINGLE_TLV("SPK Gain Volume", RTQ9128_REG_MISC, 0, 5, 0, spkgain_tlv),
+	SOC_SINGLE("PBTL12 Switch", RTQ9128_REG_MISC, 4, 1, 0),
+	SOC_SINGLE("PBTL34 Switch", RTQ9128_REG_MISC, 5, 1, 0),
+	SOC_SINGLE("Spread Spectrum Switch", RTQ9128_REG_PWM_SS_OPT, 7, 1, 0),
+	SOC_SINGLE("SDO Select", RTQ9128_REG_SDO_SEL, 0, 15, 0),
+	SOC_ENUM("CH1 SI Select", rtq9154_ch1_si_enum),
+	SOC_ENUM("CH2 SI Select", rtq9154_ch2_si_enum),
+	SOC_ENUM("CH3 SI Select", rtq9154_ch3_si_enum),
+	SOC_ENUM("CH4 SI Select", rtq9154_ch4_si_enum),
+	SOC_ENUM("PWM FREQ Select", rtq9128_pwm_freq_enum),
+	SOC_ENUM("OUT1 Phase Select", rtq9154_out1_phase_enum),
+	SOC_ENUM("OUT2 Phase Select", rtq9154_out2_phase_enum),
+	SOC_ENUM("OUT3 Phase Select", rtq9154_out3_phase_enum),
+	SOC_ENUM("DVDD UV Threshold Select", rtq9128_dvdduv_select_enum),
+};
+
 static int rtq9128_dac_power_event(struct snd_soc_dapm_widget *w, struct snd_kcontrol *kcontrol,
 				   int event)
 {
 	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
+	struct rtq9128_data *data = snd_soc_component_get_drvdata(comp);
 	unsigned int shift, mask;
 	int ret;
 
@@ -301,6 +363,10 @@ static int rtq9128_dac_power_event(struct snd_soc_dapm_widget *w, struct snd_kco
 	else
 		shift = 0;
 
+	/* Compared to RTQ9128, RTQ9154 use the reverse order for DACx bitfield location */
+	if (data->chip_model == CHIP_MODEL_RTQ9154)
+		shift = 6 - shift;
+
 	mask = RTQ9128_CHSTAT_VAL_MASK << shift;
 
 	/* Turn channel state to Normal or HiZ */
@@ -387,6 +453,7 @@ static const struct rtq9128_init_reg rtq9128_dl_tables[] = {
 
 static int rtq9128_component_probe(struct snd_soc_component *comp)
 {
+	struct rtq9128_data *data = snd_soc_component_get_drvdata(comp);
 	const struct rtq9128_init_reg *table, *curr;
 	size_t table_size;
 	unsigned int val;
@@ -421,6 +488,14 @@ static int rtq9128_component_probe(struct snd_soc_component *comp)
 			return ret;
 	}
 
+
+	if (data->chip_model == CHIP_MODEL_RTQ9154) {
+		/* Enable RTQ9154 Specific AUTO ULQM feature */
+		ret = snd_soc_component_write(comp, RTQ9154_REG_AUTOULQM, RTQ9154_AUTOULQM_VAL);
+		if (ret < 0)
+			return ret;
+	}
+
 	pm_runtime_mark_last_busy(comp->dev);
 	pm_runtime_put(comp->dev);
 
@@ -439,6 +514,18 @@ static const struct snd_soc_component_driver rtq9128_comp_driver = {
 	.endianness = 1,
 };
 
+static const struct snd_soc_component_driver rtq9154_comp_driver = {
+	.probe = rtq9128_component_probe,
+	.controls = rtq9154_snd_ctrls,
+	.num_controls = ARRAY_SIZE(rtq9154_snd_ctrls),
+	.dapm_widgets = rtq9128_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(rtq9128_dapm_widgets),
+	.dapm_routes = rtq9128_dapm_routes,
+	.num_dapm_routes = ARRAY_SIZE(rtq9128_dapm_routes),
+	.use_pmdown_time = 1,
+	.endianness = 1,
+};
+
 static int rtq9128_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 {
 	struct rtq9128_data *data = snd_soc_dai_get_drvdata(dai);
@@ -679,7 +766,8 @@ static int rtq9128_probe(struct i2c_client *i2c)
 	struct device *dev = &i2c->dev;
 	struct rtq9128_data *data;
 	struct regmap *regmap;
-	unsigned int venid;
+	unsigned int veninfo, venid, chip_model;
+	const struct snd_soc_component_driver *comp_drv;
 	int ret;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
@@ -712,21 +800,33 @@ static int rtq9128_probe(struct i2c_client *i2c)
 	if (IS_ERR(regmap))
 		return dev_err_probe(dev, PTR_ERR(regmap), "Failed to init regmap\n");
 
-	ret = regmap_read(regmap, RTQ9128_REG_VENDOR_ID, &venid);
+	ret = regmap_read(regmap, RTQ9128_REG_VENDOR_ID, &veninfo);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to get vendor id\n");
 
-	venid = FIELD_GET(RTQ9128_VENDOR_ID_MASK, venid);
+	venid = FIELD_GET(RTQ9128_VENDOR_ID_MASK, veninfo);
 	if (venid != RTQ9128_VENDOR_ID_VAL)
 		return dev_err_probe(dev, -ENODEV, "Vendor ID not match (0x%x)\n", venid);
 
+	chip_model = FIELD_GET(RTQ9128_MODEL_ID_MASK, veninfo);
+	switch (chip_model) {
+	case RTQ9154_MODEL_ID:
+		data->chip_model = CHIP_MODEL_RTQ9154;
+		comp_drv = &rtq9154_comp_driver;
+		break;
+	default:
+		data->chip_model = CHIP_MODEL_RTQ9128;
+		comp_drv = &rtq9128_comp_driver;
+		break;
+	}
+
 	pm_runtime_set_active(dev);
 	pm_runtime_mark_last_busy(dev);
 	ret = devm_pm_runtime_enable(dev);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to enable pm runtime\n");
 
-	return devm_snd_soc_register_component(dev, &rtq9128_comp_driver, &rtq9128_dai, 1);
+	return devm_snd_soc_register_component(dev, comp_drv, &rtq9128_dai, 1);
 }
 
 static int rtq9128_pm_runtime_suspend(struct device *dev)
-- 
2.34.1

