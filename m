Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732A53BADB5
	for <linux-sound@vger.kernel.org>; Wed,  1 Jul 2026 09:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782896777; cv=none; b=DVMbp5H184FjsggCGnTGLMDMRDG9RSdK1OjXb2b3PJ0JRUE7ThPoK1vKWb9odKbFL9TXgCAbNhXaU6wwsFDSaijgomBuE/LEIBev5QcoFRVaaOsuzkU82MH5dY7Ugf7kS6aOa6+jR8e07V4HDZ99Z4j1qh0AuVst9sI5FJrn+FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782896777; c=relaxed/simple;
	bh=YTezhMXUNZ+lT07JrY7LOttTe2l9JBCxCY2VoNMENDA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FZtCpynEHE8s4aBP6nBUqS6WPaQNQi9S39MWA1M4/Ksix7vOpr0BeyFxzkZMOCkVWLxaDZbLFL4deZse12q0DHoSZQI4xDyH7ueUPnsMQO/dArLPW/6zxAVHvCoKjuAzrkqipqW4EWFtnWRJl6pqxvHt/sj7iWMSSXUFtfgbm4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=UowDnypI; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="UowDnypI"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 66195eb161033135, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1782896741; bh=/GNeFsoIkud9nOLItlstXYerDeLwbg7ma9n9A63bR4U=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=UowDnypI4OvoLPi45GP94WZ+wUONQPW6XI2+h0+hEL+vhwgaTatZH5fAHU4zMiRp3
	 Yldz7QI7Jvw6lFnlO5vbPAGMNuvjMUQjyO/9HZD4mYi6S73dMZY8vR1H+Iec9eqsfp
	 0jgXa6C0I9gIYVuKOOfOv+aKDZzBVbghaVQuaglswkJPKjhNzWUif/uWaXwCi+On4m
	 I6QKyTW0vhE3x7GVC0uZlqzOg7BGgKUdJIG3epbeMoBj0YE8kVaGcEzqY3dWPTdb9x
	 bd5qOAnyDk9rHT8lvgH5uzxwgA6vEnpplT+Fao+eTW4m9WGMQTOjELwxwxJUAJp4xj
	 S+RlNz/SkcXwQ==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 66195eb161033135
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 1 Jul 2026 17:05:41 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 1 Jul 2026 17:05:40 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server id
 15.2.2562.17 via Frontend Transport; Wed, 1 Jul 2026 17:05:39 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
	<oder_chiou@realtek.com>, <jack.yu@realtek.com>, <derek.fang@realtek.com>,
	<dirk.su@canonical.com>, <pin-hao.huang@hp.com>, Shuming Fan
	<shumingf@realtek.com>
Subject: [PATCH] ASoC: rt712: add mute led control for specific machines
Date: Wed, 1 Jul 2026 17:05:30 +0800
Message-ID: <20260701090530.3754881-1-shumingf@realtek.com>
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

Certain HP platforms use the RT712 GPIOs to control the microphone mute LED and mute LED.
This patch registers LED class devices in the codec driver to control the GPIOs
through the LED subsystem.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt712-sdca-sdw.h |  3 +
 sound/soc/codecs/rt712-sdca.c     | 91 +++++++++++++++++++++++++++++++
 sound/soc/codecs/rt712-sdca.h     |  3 +
 3 files changed, 97 insertions(+)

diff --git a/sound/soc/codecs/rt712-sdca-sdw.h b/sound/soc/codecs/rt712-sdca-sdw.h
index 99fd2d67f04d..0f54bbd64f4d 100644
--- a/sound/soc/codecs/rt712-sdca-sdw.h
+++ b/sound/soc/codecs/rt712-sdca-sdw.h
@@ -45,6 +45,9 @@ static const struct reg_default rt712_sdca_mbq_defaults[] = {
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
index 4796fce084ff..2cbf3144a275 100644
--- a/sound/soc/codecs/rt712-sdca.c
+++ b/sound/soc/codecs/rt712-sdca.c
@@ -13,6 +13,7 @@
 #include <sound/initval.h>
 #include <sound/jack.h>
 #include <linux/kernel.h>
+#include <linux/leds.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/pm_runtime.h>
@@ -23,6 +24,7 @@
 #include <linux/slab.h>
 #include <sound/soc-dapm.h>
 #include <sound/tlv.h>
+#include <linux/dmi.h>
 #include "rt712-sdca.h"
 
 static int rt712_sdca_index_write(struct rt712_sdca_priv *rt712,
@@ -71,6 +73,87 @@ static int rt712_sdca_index_update_bits(struct rt712_sdca_priv *rt712,
 	return rt712_sdca_index_write(rt712, nid, reg, tmp);
 }
 
+static const struct dmi_system_id dmi_rt712_quirk_table[] = {
+	{
+		.ident = "HP",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
+			DMI_MATCH(DMI_BOARD_NAME, "8E86"),
+		}
+	},
+	{ }
+};
+
+#ifdef CONFIG_LEDS_TRIGGERS
+static int rt712_sdca_mute_led_set(struct led_classdev *led_cdev,
+			       enum led_brightness brightness)
+{
+	struct rt712_sdca_priv *rt712 = led_cdev->trigger_data;
+	struct device *dev = rt712->component->dev;
+	unsigned int value = (brightness != LED_OFF);
+	unsigned int gpio_pin;
+	int ret;
+
+	ret = pm_runtime_resume(rt712->component->dev);
+	if (ret < 0 && ret != -EACCES)
+		return ret;
+
+	if (!strcmp(led_cdev->name, "rt712::micmute"))
+		gpio_pin = 3;
+	else if (!strcmp(led_cdev->name, "rt712::mute")) {
+		gpio_pin = 4;
+		rt712_sdca_index_update_bits(rt712, RT712_VENDOR_HDA_CTL,
+			RT712_HDA_LEGACY_CONFIG_CTL0, 0x000c, 0x0004);
+	} else
+		return -EINVAL;
+
+	rt712_sdca_index_update_bits(rt712, RT712_VENDOR_HDA_CTL,
+		RT712_HDA_GPIO_EN_CTL, (1 << gpio_pin), (1 << gpio_pin));
+	rt712_sdca_index_update_bits(rt712, RT712_VENDOR_HDA_CTL,
+		RT712_HDA_GPIO_DIRECTION_CTL, (1 << gpio_pin), (1 << gpio_pin));
+	rt712_sdca_index_update_bits(rt712, RT712_VENDOR_HDA_CTL,
+		RT712_HDA_GPIO_SET_CTL, (1 << gpio_pin), (value << gpio_pin));
+
+	dev_dbg(dev, "%s LED %s\n", led_cdev->name, value ? "on" : "off");
+
+	return 0;
+}
+
+static struct led_classdev mute_led_cdev[NUM_AUDIO_LEDS] = {
+	[LED_AUDIO_MUTE] = {
+		.name = "rt712::mute",
+		.max_brightness = 1,
+		.brightness_set_blocking = rt712_sdca_mute_led_set,
+		.default_trigger = "audio-mute",
+	},
+	[LED_AUDIO_MICMUTE] = {
+		.name = "rt712::micmute",
+		.max_brightness = 1,
+		.brightness_set_blocking = rt712_sdca_mute_led_set,
+		.default_trigger = "audio-micmute",
+	},
+};
+
+static int rt712_sdca_mute_led_init(struct rt712_sdca_priv *rt712)
+{
+	int i, err;
+
+	for (i = 0; i < NUM_AUDIO_LEDS; i++) {
+		mute_led_cdev[i].trigger_data = (void *)rt712;
+		err = devm_led_classdev_register(rt712->component->dev, &mute_led_cdev[i]);
+		if (err < 0)
+			return err;
+	}
+	return 0;
+}
+#else
+static int rt712_sdca_mute_led_init(struct rt712_sdca_priv *rt712)
+{
+	dev_dbg(rt712->component->dev, "Please enable CONFIG_LEDS_TRIGGERS to support mute LED\n");
+	return 0;
+}
+#endif
+
 static int rt712_sdca_calibration(struct rt712_sdca_priv *rt712)
 {
 	unsigned int val, loop_rc = 0, loop_dc = 0;
@@ -1031,6 +1114,14 @@ static int rt712_sdca_probe(struct snd_soc_component *component)
 			rt712_sdca_spk_dapm_routes, ARRAY_SIZE(rt712_sdca_spk_dapm_routes));
 	}
 
+	if (dmi_check_system(dmi_rt712_quirk_table)) {
+		ret = rt712_sdca_mute_led_init(rt712);
+		if (ret) {
+			dev_err(component->dev, "failed to register mute LED, ret = %d\n", ret);
+			return ret;
+		}
+	}
+
 	if (!rt712->first_hw_init)
 		return 0;
 
diff --git a/sound/soc/codecs/rt712-sdca.h b/sound/soc/codecs/rt712-sdca.h
index 7ab7d5feb50a..191225838d4f 100644
--- a/sound/soc/codecs/rt712-sdca.h
+++ b/sound/soc/codecs/rt712-sdca.h
@@ -113,6 +113,9 @@ struct rt712_dmic_kctrl_priv {
 #define RT712_HDA_LEGACY_MUX_CTL0			0x00
 #define RT712_HDA_LEGACY_CONFIG_CTL0			0x06
 #define RT712_HDA_LEGACY_RESET_CTL			0x08
+#define RT712_HDA_GPIO_EN_CTL				0x09
+#define RT712_HDA_GPIO_DIRECTION_CTL			0x0a
+#define RT712_HDA_GPIO_SET_CTL				0x0b
 #define RT712_HDA_LEGACY_GPIO_WAKE_EN_CTL		0x0e
 #define RT712_DMIC_ENT_FLOAT_CTL			0x10
 #define RT712_DMIC_GAIN_ENT_FLOAT_CTL0			0x11
-- 
2.54.0

