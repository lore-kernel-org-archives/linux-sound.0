Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D26649B5DC
	for <linux-sound@vger.kernel.org>; Thu, 17 Sep 2026 09:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789635725; cv=none; b=CSxyGF/WzpMqmGe2FXv5HV/eo/MDNCUUN8MCw4xv/01PQKLLsTBhji5fYqQ8wgY12+M5TWOe5ky00/93KGV7xVCcmQ1vsfLrsldKDJlHrK80S3Oag7vaGj8h+RvhezbSOWjHb2xzn2bRpeK7vjxBTQT0ccYKcbqx2OCpVdEesi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789635725; c=relaxed/simple;
	bh=5KZDPolGLunZUPqjm1y/5enNxrEwvmzhfV/4oSsPaDU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TjUhJqiHUTePBhSH5dNN+aRkLTS8GhynkoqbRXhuAKj/5hp+uZh2VSkpp9AXjzUCDtbFPvVotUQw/9GW3vh7kHFgLxd2OmQbsECmDRpm8PTTfVeViv9JQIIq8GRPJhlWQj+2P1WR1MMlNwYf7L6xKrq3LGowf6Kd4DUzyWOScXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=JvkxF/5f; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="JvkxF/5f"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 68H91XBK03145211, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1789635694; bh=7WURpATfG3s3wN1yL9r1dvTYpVr6HV9bv730HUoZzdY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=JvkxF/5fpsvpP/EBW8dYT2dHfPWzd57vH8SliqQKurJmsw/LGzw1SJZcouo05fg1b
	 U/+FAtLoHXMOIxx7bDA8wjqkjsXi5+PVYg+UzKJeaLbHTbbEmQpnuGYntWuZtirNG9
	 oY7g9Xn3jMojZN0nK4Dv/sLrEoBvqu3I6VgV1/rfMrlS0Q0UZ9LpDTIcKENE0ZO8SG
	 vYThIdAqpL0aZmX0P9tEGiQP6qt7DNEmh6lUBFve2+u4IKq4xTkdFmwGDMYa3ns1CB
	 GxesJoXm+urxMJngBavyZ+XcOauyrwNl3YDeFyxtq3l/KJW319TxugaCW/hXf7BPXC
	 ITV0rM2JqJ9Zw==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 68H91XBK03145211
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Sep 2026 17:01:34 +0800
Received: from RTKEXHMBS04.realtek.com.tw (10.21.1.54) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 17 Sep 2026 17:01:32 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server id
 15.2.2562.49 via Frontend Transport; Thu, 17 Sep 2026 17:01:32 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
	<oder_chiou@realtek.com>, <jack.yu@realtek.com>, <derek.fang@realtek.com>,
	Shuming Fan <shumingf@realtek.com>
Subject: [PATCH v2] ASoC: rt712: add GPIOs for LED control
Date: Thu, 17 Sep 2026 17:01:20 +0800
Message-ID: <20260917090120.2506160-1-shumingf@realtek.com>
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
 sound/soc/codecs/rt712-sdca-sdw.c |   1 +
 sound/soc/codecs/rt712-sdca-sdw.h |   3 +
 sound/soc/codecs/rt712-sdca.c     | 136 ++++++++++++++++++++++++++++++
 sound/soc/codecs/rt712-sdca.h     |   6 ++
 4 files changed, 146 insertions(+)

diff --git a/sound/soc/codecs/rt712-sdca-sdw.c b/sound/soc/codecs/rt712-sdca-sdw.c
index edba0367d9ce..f2f91dd087bf 100644
--- a/sound/soc/codecs/rt712-sdca-sdw.c
+++ b/sound/soc/codecs/rt712-sdca-sdw.c
@@ -395,6 +395,7 @@ static void rt712_sdca_sdw_remove(struct sdw_slave *slave)
 
 	mutex_destroy(&rt712->calibrate_mutex);
 	mutex_destroy(&rt712->disable_irq_lock);
+	mutex_destroy(&rt712->gc_lock);
 }
 
 static const struct sdw_device_id rt712_sdca_id[] = {
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
index 38052cb19790..a98537e23c21 100644
--- a/sound/soc/codecs/rt712-sdca.c
+++ b/sound/soc/codecs/rt712-sdca.c
@@ -113,6 +113,138 @@ static void rt712_sdca_clk_patch2(struct rt712_sdca_priv *rt712)
 	rt712_sdca_index_write(rt712, RT712_VENDOR_REG, 0x65, 0x0000);
 }
 
+static int rt712_sdca_gpio_request(struct gpio_chip *chip, unsigned int offset)
+{
+	struct rt712_sdca_priv *rt712 = gpiochip_get_data(chip);
+	struct device *dev = &rt712->slave->dev;
+	unsigned int gpio_pin = offset + 3;
+	int ret;
+
+	dev_dbg(&rt712->slave->dev, "%s: gpio_pin=%d\n", __func__, gpio_pin);
+
+	mutex_lock(&rt712->gc_lock);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0 && ret != -EACCES)
+		goto io_error;
+
+	/*
+	 * Only support GPIO3 and GPIO4 for now
+	 */
+	switch (gpio_pin) {
+	case 3:
+		break;
+	case 4:
+		ret = rt712_sdca_index_update_bits(rt712, RT712_VENDOR_HDA_CTL,
+			RT712_HDA_LEGACY_CONFIG_CTL0, 0x000c, 0x0004);
+		if (ret < 0)
+			goto io_error;
+		break;
+	default:
+		ret = -EINVAL;
+		goto io_error;
+	}
+
+	ret = rt712_sdca_index_update_bits(rt712, RT712_VENDOR_HDA_CTL,
+		RT712_HDA_GPIO_EN_CTL, (1 << gpio_pin), (1 << gpio_pin));
+	if (ret < 0)
+		goto io_error;
+	ret = rt712_sdca_index_update_bits(rt712, RT712_VENDOR_HDA_CTL,
+		RT712_HDA_GPIO_DIRECTION_CTL, (1 << gpio_pin), (1 << gpio_pin));
+
+io_error:
+	mutex_unlock(&rt712->gc_lock);
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+	return ret;
+}
+
+static int rt712_sdca_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
+{
+	struct rt712_sdca_priv *rt712 = gpiochip_get_data(chip);
+	struct device *dev = &rt712->slave->dev;
+	unsigned int gpio_pin = offset + 3;
+	int ret;
+
+	dev_dbg(&rt712->slave->dev, "%s: gpio_pin=%d, value=%d\n", __func__, gpio_pin, value);
+
+	mutex_lock(&rt712->gc_lock);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0 && ret != -EACCES)
+		goto io_error;
+
+	ret = rt712_sdca_index_update_bits(rt712, RT712_VENDOR_HDA_CTL,
+			RT712_HDA_GPIO_SET_CTL, (1 << gpio_pin), (!!value << gpio_pin));
+
+io_error:
+	mutex_unlock(&rt712->gc_lock);
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+	return ret;
+}
+
+static int rt712_sdca_gpio_direction_out(struct gpio_chip *chip,
+				     unsigned offset, int value)
+{
+	struct rt712_sdca_priv *rt712 = gpiochip_get_data(chip);
+	struct device *dev = &rt712->slave->dev;
+	unsigned int gpio_pin = offset + 3;
+	int ret;
+
+	dev_dbg(&rt712->slave->dev, "%s: gpio_pin=%d, value=%d\n", __func__, gpio_pin, value);
+
+	mutex_lock(&rt712->gc_lock);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0 && ret != -EACCES)
+		goto io_error;
+
+	switch (gpio_pin) {
+	case 3:
+	case 4:
+		ret = rt712_sdca_index_update_bits(rt712, RT712_VENDOR_HDA_CTL,
+			RT712_HDA_GPIO_DIRECTION_CTL, (1 << gpio_pin), (1 << gpio_pin));
+		if (ret < 0)
+			goto io_error;
+		ret = rt712_sdca_index_update_bits(rt712, RT712_VENDOR_HDA_CTL,
+			RT712_HDA_GPIO_SET_CTL, (1 << gpio_pin), (!!value << gpio_pin));
+		break;
+	default:
+		ret = -EINVAL;
+		goto io_error;
+	}
+
+io_error:
+	mutex_unlock(&rt712->gc_lock);
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+	return ret;
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
+	mutex_init(&rt712->gc_lock);
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
@@ -1724,6 +1856,10 @@ int rt712_sdca_init(struct device *dev, struct regmap *regmap,
 	INIT_DELAYED_WORK(&rt712->jack_detect_work, rt712_sdca_jack_detect_handler);
 	INIT_DELAYED_WORK(&rt712->jack_btn_check_work, rt712_sdca_btn_check_handler);
 
+	/* initialize GPIOs */
+	if (IS_ENABLED(CONFIG_GPIOLIB))
+		rt712_sdca_gpio_init(rt712);
+
 	/*
 	 * Mark hw_init to false
 	 * HW init will be performed when device reports present
diff --git a/sound/soc/codecs/rt712-sdca.h b/sound/soc/codecs/rt712-sdca.h
index 6229fe341bb5..7e6ee21c8a17 100644
--- a/sound/soc/codecs/rt712-sdca.h
+++ b/sound/soc/codecs/rt712-sdca.h
@@ -14,6 +14,7 @@
 #include <linux/soundwire/sdw_type.h>
 #include <sound/soc.h>
 #include <linux/workqueue.h>
+#include <linux/gpio/driver.h>
 
 struct  rt712_sdca_priv {
 	struct regmap *regmap;
@@ -45,6 +46,8 @@ struct  rt712_sdca_priv {
 	bool fu05_dapm_mute;
 	bool fu05_mixer_l_mute;
 	bool fu05_mixer_r_mute;
+	struct gpio_chip gpio_chip;
+	struct mutex gc_lock;
 };
 
 struct rt712_dmic_kctrl_priv {
@@ -114,6 +117,9 @@ struct rt712_dmic_kctrl_priv {
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

