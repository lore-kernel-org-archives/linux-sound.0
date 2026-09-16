Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD9E48EBEA
	for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 09:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789549557; cv=none; b=K8d2eKR4+qbPAjJvoOfEclqPavKxKqAbT7k8FGa6FgS0EFkv8xUEs8s80Li6fc74zsW1fPPpNaFPPpmkyO/LYMuS9ypqWsWfrqp8t31bfWnMTZcT/ODdnJxry06X3FxDbzXX/dv1G+FGupLqqj9/TdlWyjqzSdBvISLiVBcZ0qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789549557; c=relaxed/simple;
	bh=capcDVI1GtGUj19hKfmIR07/wsPFBJt1I8HBeg9eXmI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gdVEk5023FlOSC2eujgeAJcBAio9f81kLOLIdw6L8bs6lz/MuqRU/Oa4EwZ2o83NmdCvT/EgDeTKdUPmzH+F7hpHh9JzY3R3dp0vL8Tm4J9Izm+ttiTDvbuzOSFNaQM9LiiRt+m9khwMz1LLOpQGmhopUtg3Nemz3tcqy8XzORg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=XVAnph8Z; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="XVAnph8Z"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 68G95FIk82243409, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1789549515; bh=OduiXmKWZqCqOMNafVnsgerVe/bh8Hqk8lN8+cxdWXc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=XVAnph8ZKxAx2gHOHp+uKdpajim3DWhajB9CRItMy5PyvvM48QYlPpfFjJ6WoArjZ
	 IqkBm6WngZ4GzbbFG50NG4frBL6XcJwOtPZvJiin+h6mf2mAyNl2W0m3e7VAPn4dDj
	 1qRKsMLbxm8YoRBZqAduarvvbPgiMZrG3+O01FLPPNs/eQseOEPDOKick0ULX3pDSQ
	 rPRHXSWL5mDodU90DrkDzyjoRyBpiOQrUJ2ZYoNXb65JnQ5U6FsrF88NCLm3P6gOA/
	 dNLKN4b+dGq9Bkc3OFDTrOEwejzrdx/VIeKbfaXRaiL/HQHCRFCgUauNd5FJ0uMjh3
	 G9d3QXi4ZyAIA==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 68G95FIk82243409
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 16 Sep 2026 17:05:15 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 16 Sep 2026 17:05:15 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server id
 15.2.2562.49 via Frontend Transport; Wed, 16 Sep 2026 17:05:14 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
	<oder_chiou@realtek.com>, <jack.yu@realtek.com>, <derek.fang@realtek.com>,
	Shuming Fan <shumingf@realtek.com>
Subject: [PATCH] ASoC: rt712: add GPIOs for LED control
Date: Wed, 16 Sep 2026 17:05:13 +0800
Message-ID: <20260916090513.2294466-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Shuming Fan <shumingf@realtek.com>

Certain platforms use the RT712 GPIOs to control the microphone mute LED and speaker mute LED.
This patch lets the LED subsystem to handle the GPIO control.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt712-sdca-sdw.h |   3 +
 sound/soc/codecs/rt712-sdca.c     | 106 ++++++++++++++++++++++++++++++
 sound/soc/codecs/rt712-sdca.h     |   6 +-
 3 files changed, 114 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt712-sdca-sdw.h b/sound/soc/codecs/rt712-sdca-sdw.h
index 7ad25cc27f62..162d62234b68 100644
--- a/sound/soc/codecs/rt712-sdca-sdw.h
+++ b/sound/soc/codecs/rt712-sdca-sdw.h
@@ -46,6 +46,9 @@ static const struct reg_default rt712_sdca_mbq_defaults[] = {
 	{ 0x5b00029, 0x3fff },
 	{ 0x5b0002a, 0xf000 },
 	{ 0x6100000, 0x04e4 },
+	{ 0x6100009, 0x0000 },
+	{ 0x610000a, 0x0000 },
+	{ 0x610000b, 0x0020 },
 	{ 0x610000e, 0x0007 },
 	{ 0x6100045, 0x0860 },
 	{ 0x6100046, 0x0029 },
diff --git a/sound/soc/codecs/rt712-sdca.c b/sound/soc/codecs/rt712-sdca.c
index 38052cb19790..20889c614e47 100644
--- a/sound/soc/codecs/rt712-sdca.c
+++ b/sound/soc/codecs/rt712-sdca.c
@@ -113,6 +113,109 @@ static void rt712_sdca_clk_patch2(struct rt712_sdca_priv *rt712)
 	rt712_sdca_index_write(rt712, RT712_VENDOR_REG, 0x65, 0x0000);
 }
 
+static int rt712_sdca_gpio_request(struct gpio_chip *chip, unsigned int offset)
+{
+	struct rt712_sdca_priv *rt712 = gpiochip_get_data(chip);
+	unsigned int gpio_pin = offset + 3;
+	int ret;
+
+	dev_dbg(&rt712->slave->dev, "%s: gpio_pin=%d\n", __func__, gpio_pin);
+
+	ret = pm_runtime_resume(rt712->component->dev);
+	if (ret < 0 && ret != -EACCES)
+		return ret;
+
+	/*
+	 * Only support GPIO3 and GPIO4 for now
+	 */
+	switch (gpio_pin) {
+	case 3:
+		break;
+	case 4:
+		rt712_sdca_index_update_bits(rt712, RT712_VENDOR_HDA_CTL,
+			RT712_HDA_LEGACY_CONFIG_CTL0, 0x000c, 0x0004);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	rt712_sdca_index_update_bits(rt712, RT712_VENDOR_HDA_CTL,
+		RT712_HDA_GPIO_EN_CTL, (1 << gpio_pin), (1 << gpio_pin));
+	rt712_sdca_index_update_bits(rt712, RT712_VENDOR_HDA_CTL,
+		RT712_HDA_GPIO_DIRECTION_CTL, (1 << gpio_pin), (1 << gpio_pin));
+
+	return 0;
+}
+
+static int rt712_sdca_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
+{
+	struct rt712_sdca_priv *rt712 = gpiochip_get_data(chip);
+	unsigned int gpio_pin = offset + 3;
+	int ret;
+
+	dev_dbg(&rt712->slave->dev, "%s: gpio_pin=%d, value=%d\n", __func__, gpio_pin, value);
+
+	ret = pm_runtime_resume(rt712->component->dev);
+	if (ret < 0 && ret != -EACCES)
+		return ret;
+
+	return rt712_sdca_index_update_bits(rt712, RT712_VENDOR_HDA_CTL,
+			RT712_HDA_GPIO_SET_CTL, (1 << gpio_pin), (!!value << gpio_pin));
+}
+
+static int rt712_sdca_gpio_direction_out(struct gpio_chip *chip,
+				     unsigned offset, int value)
+{
+	struct rt712_sdca_priv *rt712 = gpiochip_get_data(chip);
+	unsigned int gpio_pin = offset + 3;
+	int ret;
+
+	dev_dbg(&rt712->slave->dev, "%s: gpio_pin=%d, value=%d\n", __func__, gpio_pin, value);
+
+	ret = pm_runtime_resume(rt712->component->dev);
+	if (ret < 0 && ret != -EACCES)
+		return ret;
+
+	switch (gpio_pin) {
+	case 3:
+	case 4:
+		rt712_sdca_index_update_bits(rt712, RT712_VENDOR_HDA_CTL,
+			RT712_HDA_GPIO_DIRECTION_CTL, (1 << gpio_pin), (1 << gpio_pin));
+		rt712_sdca_index_update_bits(rt712, RT712_VENDOR_HDA_CTL,
+			RT712_HDA_GPIO_SET_CTL, (1 << gpio_pin), (!!value << gpio_pin));
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct gpio_chip rt712_sdca_template_chip = {
+	.label = "rt712-sdca",
+	.owner = THIS_MODULE,
+	.request = rt712_sdca_gpio_request,
+	.direction_output = rt712_sdca_gpio_direction_out,
+	.set = rt712_sdca_gpio_set,
+	.ngpio = 2,
+	.can_sleep = true,
+	.base = -1,
+};
+
+static void rt712_sdca_gpio_init(struct rt712_sdca_priv *rt712)
+{
+	int ret;
+
+	rt712->gpio_chip = rt712_sdca_template_chip;
+	rt712->gpio_chip.parent = &rt712->slave->dev;
+	rt712->gpio_chip.fwnode = dev_fwnode(&rt712->slave->dev);
+
+	ret = devm_gpiochip_add_data(&rt712->slave->dev, &rt712->gpio_chip, rt712);
+	if (ret != 0)
+		dev_err(&rt712->slave->dev, "Failed to add GPIOs: %d\n", ret);
+}
+
 static int rt712_sdca_calibration(struct rt712_sdca_priv *rt712)
 {
 	unsigned int val, loop_rc = 0, loop_dc = 0;
@@ -1101,6 +1204,9 @@ static int rt712_sdca_probe(struct snd_soc_component *component)
 			rt712_sdca_spk_dapm_routes, ARRAY_SIZE(rt712_sdca_spk_dapm_routes));
 	}
 
+	/* initialize GPIOs */
+	rt712_sdca_gpio_init(rt712);
+
 	if (!rt712->first_hw_init)
 		return 0;
 
diff --git a/sound/soc/codecs/rt712-sdca.h b/sound/soc/codecs/rt712-sdca.h
index 6229fe341bb5..362e6226982a 100644
--- a/sound/soc/codecs/rt712-sdca.h
+++ b/sound/soc/codecs/rt712-sdca.h
@@ -14,6 +14,7 @@
 #include <linux/soundwire/sdw_type.h>
 #include <sound/soc.h>
 #include <linux/workqueue.h>
+#include <linux/gpio/driver.h>
 
 struct  rt712_sdca_priv {
 	struct regmap *regmap;
@@ -45,6 +46,7 @@ struct  rt712_sdca_priv {
 	bool fu05_dapm_mute;
 	bool fu05_mixer_l_mute;
 	bool fu05_mixer_r_mute;
+	struct gpio_chip gpio_chip;
 };
 
 struct rt712_dmic_kctrl_priv {
@@ -114,6 +116,9 @@ struct rt712_dmic_kctrl_priv {
 #define RT712_HDA_LEGACY_MUX_CTL0			0x00
 #define RT712_HDA_LEGACY_CONFIG_CTL0			0x06
 #define RT712_HDA_LEGACY_RESET_CTL			0x08
+#define RT712_HDA_GPIO_EN_CTL				0x09
+#define RT712_HDA_GPIO_DIRECTION_CTL			0x0a
+#define RT712_HDA_GPIO_SET_CTL				0x0b
 #define RT712_HDA_LEGACY_GPIO_WAKE_EN_CTL		0x0e
 #define RT712_DMIC_ENT_FLOAT_CTL			0x10
 #define RT712_DMIC_GAIN_ENT_FLOAT_CTL0			0x11
@@ -271,7 +276,6 @@ enum {
 	RT712_CLK_FREQ_22_5792MHZ = 4,
 };
 
-
 int rt712_sdca_io_init(struct device *dev, struct sdw_slave *slave);
 int rt712_sdca_init(struct device *dev, struct regmap *regmap,
 			struct regmap *mbq_regmap, struct sdw_slave *slave);
-- 
2.54.0

