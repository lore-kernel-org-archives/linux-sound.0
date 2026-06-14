Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7A93321A7
	for <linux-sound@vger.kernel.org>; Sun, 14 Jun 2026 16:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781453607; cv=none; b=SNbAJppwnSekUMsaHmAcNfkkVOAsokKatKavVZ/UFW2i2gRi9y/NUwTaj6Uysfwv9qFkkncDqWpd3qB/RhkxUmKWDyja3CxmwqHmEzu8q5RVElqKWYktREf7lZ6wxuNonvj3jBKdcuah7BvNbcR6l50w/qSWr1VErAX1RBNFDx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781453607; c=relaxed/simple;
	bh=fKgZfZd3gg7nZeNX8ucyeXHzYT5yZhP0kMILhq+pvrY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UjJsfEUrgTJTf3PaesVrNYOMLGmj9i/ZLyuq0UR+A1diFUDztWmI2XrPdMgMKZotC33DPNzow9CldsDpoU+MdyAuO7xCmdScp3dDMVNsRhIYaoRXKWJzi7zg8S01zeayzArVyewTbXzQUr92RxYXSDR2mHDTQUQDBvOWa2NxIDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ii71tduL; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ii71tduL"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45ef189aa1cso1700449f8f.0
        for <linux-sound@vger.kernel.org>; Sun, 14 Jun 2026 09:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781453603; x=1782058403; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lDhMnrDplSPx3xywz3+nFMG6bAUsgdI6SfBHT80AIIM=;
        b=ii71tduLQiJc4F4qdf7glEtwYD7qKNc6OSFjvBtO+pCaDWFiEy/FwURp33Y/F4B2c8
         ap5+xNVqQlnTcEBIby02VwoiMaVdxhP/eLVc9mxAcUWUKjBsV+HCWy5DEyF4ecpY2wYa
         LDe0nD4VgurA3f/v0+fUQAoT+h/BNh8fdpblIkF+K6IXv1WCSWXAqVWRkhigiYxkpTEN
         Z87MVhEG5S8QiKFaySSlsjpj9EfGjmYDztkZzz/owiiA2F4jf2EL45ECHPUi2x8GjHT5
         Si58/HBYx4nEKSCwcQwbe4zriu/pdBaLXj/MchFdGUSkzIJEsEFeBthf/6xRUUD0v1d7
         fB3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781453603; x=1782058403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lDhMnrDplSPx3xywz3+nFMG6bAUsgdI6SfBHT80AIIM=;
        b=nyVAHNaCWuSbNhJFpx4C6o38TVsl+v4LvL2oO0Dop02WMDkLV+cBQGuWGAetqvjt+3
         hPoTH37efA+ygBK271dHo/4gEW5bqRVwqpwxUqp8OnebITWwa4LT7EH+1j+/UgwlD8M1
         lKoZFRBqMJ/k3zK5wu4MEZeozf93cpvPAGMrRZMpG/Z//iLkcEXyXTLZmLvr7feATb7j
         JOmQ3O9/fyGXRXa0HRC4t6Kit5x7Lk51NlrmtueuKUJbMQKlBVM6HLKHtBcV7OlSmmif
         xI9DtAuXKAY4HDbxHKqRTvDoZwA3kABpN2MeF/98kG9Qwgq9IGvu4U5MDE9cRd21LbZO
         3RfA==
X-Forwarded-Encrypted: i=1; AFNElJ8WQtLEqNZ2JhtZmpCZgL4Vgx1qjAYNbj5M8EieoEpouwS+oYaHrwwze0EcYbXYsq66FAJ17wglqeEvuw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyX9stztV+FI5F0HlzMFsqFdFU6D+3tWRpYuoliYO1xqB9Qblg9
	7JU0lQvIflLm/mPvV8c3ohQ16CI0FQl6n87LT9h5AGUi6Y0IlOIimJ5d
X-Gm-Gg: Acq92OEukonImXL0irq/OWUSfDdTDSC7WLObR64WdSDYojgrjRqrFHjJGMGYL9ONiM3
	fEPKsGx06ONAel8i9Np45WN1ID7M2VV6w1UEtTKZ/GXhhP09NrXmf6MZcRQ1STeOSjdDr/ODF89
	cpKbHeHKdT/6tIJJ1esvVXBVYNhjO6Y2+SjfULvdDicgEnGZCyCJZ80Ml6Cw2WBD7IqsIKVPQeH
	5frzwxHlbT+7cT4pCzOwmueiS3m67EJJ47RY4cjbz62Roo5kBNQA2Kgzgp2hLjNjNUhH1uXNDBh
	k3FHopRyx3uNBWxqWjQRF/5f9SKJ5aYqP+MKutkWuRJNc4ouellpmMH/a108qUa91uOBiUHgXUL
	16N8kN1pq9VWCGqZcL/5w5YamaZLKRdPvCTYSgAnBIEzty4H1DHiroiB9ptVn0DnxL4bSPov79J
	7B9uY=
X-Received: by 2002:a5d:64c6:0:b0:45d:77f4:1ac2 with SMTP id ffacd0b85a97d-4606da0508bmr15398917f8f.0.1781453603136;
        Sun, 14 Jun 2026 09:13:23 -0700 (PDT)
Received: from fedora ([84.17.59.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2b0d28sm26493401f8f.20.2026.06.14.09.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 09:13:22 -0700 (PDT)
From: Tagir Garaev <tgaraev653@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org,
	Tagir Garaev <tgaraev653@gmail.com>
Subject: [RFC PATCH] ASoC: Intel: sof_es8336: add Huawei BOD-WXX9 HWSP support
Date: Sun, 14 Jun 2026 19:10:28 +0300
Message-ID: <20260614161028.10405-1-tgaraev653@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Huawei BOD-WXX9 routes the ES8336 HPOL/HPOR outputs to both the
headphone jack and an internal speaker amplifier. The amplifier is
represented in ACPI as HWSP0001 and is not controlled by the ES8336
GPIOs alone.

Update the existing BOD-WXX9 board quirk to keep the common ES8336
output path enabled while using HWSP0001 to mute or restore the
internal speaker amplifier when the headphone jack state changes.

The jack state is tracked with an ES8336 register fallback because the
normal jack reporting path is not reliable on this machine.

Signed-off-by: Tagir Garaev <tgaraev653@gmail.com>
---
RFC notes:
- The HWSP0001 restore profile is empirical.
- The test system has had local SOF topology experiments, so the remaining
  playback distortion has not been isolated to this driver change.
- More hardware data is needed before this should be treated as final.

 sound/soc/intel/boards/sof_es8336.c | 407 +++++++++++++++++++++++++---
 1 file changed, 374 insertions(+), 33 deletions(-)

diff --git a/sound/soc/intel/boards/sof_es8336.c b/sound/soc/intel/boards/sof_es8336.c
index e9ee752d5..2ef87757a 100644
--- a/sound/soc/intel/boards/sof_es8336.c
+++ b/sound/soc/intel/boards/sof_es8336.c
@@ -5,6 +5,8 @@
  * Intel SOF Machine Driver with es8336 Codec
  */
 
+#include <linux/acpi.h>
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/dmi.h>
 #include <linux/gpio/consumer.h>
@@ -12,6 +14,7 @@
 #include <linux/i2c.h>
 #include <linux/input.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <sound/jack.h>
@@ -50,6 +53,14 @@
 #define SOF_ES8336_JD_INVERTED			BIT(6)
 #define SOF_ES8336_HEADPHONE_GPIO		BIT(7)
 #define SOC_ES8336_HEADSET_MIC1			BIT(8)
+#define SOF_ES8336_JD_STATUS_FALLBACK		BIT(13)
+#define SOF_ES8336_HWSPK_AMP			BIT(17)
+
+#define SOF_ES8336_JD_STATUS_REG_DEFAULT	0x4f
+#define SOF_ES8336_JD_STATUS_MASK_DEFAULT	BIT(2)
+#define SOF_ES8336_JD_STATUS_POLL_MS		250
+#define SOF_ES8336_HWSP_MUTE_PULSE_MS		10
+#define SOF_ES8336_HWSP_SECONDARY_ADDR		0x5b
 
 static unsigned long quirk;
 
@@ -57,13 +68,49 @@ static int quirk_override = -1;
 module_param_named(quirk, quirk_override, int, 0444);
 MODULE_PARM_DESC(quirk, "Board-specific quirk override");
 
+struct sof_es8336_hwsp_regval {
+	u8 reg;
+	u8 val;
+};
+
+static const struct sof_es8336_hwsp_regval hwsp_speaker_restore_profile[] = {
+	{ 0x01, 0x69 },
+	{ 0x03, 0x16 },
+	{ 0x04, 0x80 },
+	{ 0x05, 0x0c },
+	{ 0x06, 0x11 },
+	{ 0x07, 0x93 },
+	{ 0x09, 0x0b },
+	{ 0x0b, 0x4b },
+	{ 0x0c, 0x00 },
+	{ 0x0d, 0x77 },
+	{ 0x0f, 0x51 },
+	{ 0x10, 0x58 },
+	{ 0x58, 0x00 },
+	{ 0x59, 0x80 },
+};
+
 struct sof_es8336_private {
 	struct device *codec_dev;
+	struct device *hwsp_dev;
+	struct snd_soc_component *codec_component;
 	struct gpio_desc *gpio_speakers, *gpio_headphone;
+	struct gpio_desc *gpio_hwsp;
+	struct i2c_client *hwsp_client, *hwsp_client_5b;
 	struct snd_soc_jack jack;
 	struct list_head hdmi_pcm_list;
-	bool speaker_en;
-	struct delayed_work pcm_pop_work;
+	bool output_active;
+	bool hp_jack_present;
+	bool speaker_amp_on;
+	bool headphone_amp_on;
+	bool hwsp_speaker_amp_on;
+	bool hwsp_speaker_amp_known;
+	bool have_jd_status;
+	unsigned int last_jd_status;
+	/* Protects output and jack state shared with gpio_mux_work. */
+	struct mutex gpio_mux_lock;
+	struct delayed_work gpio_mux_work;
+	struct notifier_block jack_nb;
 };
 
 struct sof_hdmi_pcm {
@@ -74,6 +121,7 @@ struct sof_hdmi_pcm {
 
 static const struct acpi_gpio_params enable_gpio0 = { 0, 0, true };
 static const struct acpi_gpio_params enable_gpio1 = { 1, 0, true };
+static const struct acpi_gpio_params hwsp_enable_gpio0 = { 0, 0, true };
 
 static const struct acpi_gpio_mapping acpi_speakers_enable_gpio0[] = {
 	{ "speakers-enable-gpios", &enable_gpio0, 1, ACPI_GPIO_QUIRK_ONLY_GPIOIO },
@@ -96,6 +144,11 @@ static const struct acpi_gpio_mapping acpi_enable_both_gpios_rev_order[] = {
 	{ }
 };
 
+static const struct acpi_gpio_mapping acpi_hwsp_enable_gpio[] = {
+	{ "hwsp-enable-gpios", &hwsp_enable_gpio0, 1, ACPI_GPIO_QUIRK_ONLY_GPIOIO },
+	{ }
+};
+
 static void log_quirks(struct device *dev)
 {
 	dev_info(dev, "quirk mask %#lx\n", quirk);
@@ -110,40 +163,228 @@ static void log_quirks(struct device *dev)
 		dev_info(dev, "quirk JD inverted enabled\n");
 	if (quirk & SOC_ES8336_HEADSET_MIC1)
 		dev_info(dev, "quirk headset at mic1 port enabled\n");
+	if (quirk & SOF_ES8336_JD_STATUS_FALLBACK)
+		dev_info(dev, "quirk JD status fallback enabled\n");
+	if (quirk & SOF_ES8336_HWSPK_AMP)
+		dev_info(dev, "quirk HWSP0001 speaker amp enabled\n");
+}
+
+static bool sof_es8336_jd_status_fallback_enabled(void)
+{
+	return quirk & SOF_ES8336_JD_STATUS_FALLBACK;
+}
+
+static bool sof_es8336_hwsp_amp_enabled(void)
+{
+	return quirk & SOF_ES8336_HWSPK_AMP;
 }
 
-static void pcm_pop_work_events(struct work_struct *work)
+static void sof_es8336_update_jd_status_fallback(struct sof_es8336_private *priv)
+{
+	bool present;
+	bool report_present;
+	bool should_report;
+	bool should_log;
+	unsigned int status;
+
+	if (!sof_es8336_jd_status_fallback_enabled() ||
+	    !priv->codec_component)
+		return;
+
+	status = snd_soc_component_read(priv->codec_component,
+					SOF_ES8336_JD_STATUS_REG_DEFAULT);
+	present = !(status & SOF_ES8336_JD_STATUS_MASK_DEFAULT);
+
+	mutex_lock(&priv->gpio_mux_lock);
+	should_log = !priv->have_jd_status || priv->last_jd_status != status ||
+		     priv->hp_jack_present != present;
+	priv->have_jd_status = true;
+	priv->last_jd_status = status;
+	priv->hp_jack_present = present;
+	mutex_unlock(&priv->gpio_mux_lock);
+
+	report_present = !!(priv->jack.status & SND_JACK_HEADPHONE);
+	should_report = report_present != present;
+
+	if (should_log)
+		dev_dbg(priv->codec_dev,
+			"JD fallback: reg %#x=%#x mask %#x hp_jack_present=%d alsa_headphone=%d report=%d\n",
+			SOF_ES8336_JD_STATUS_REG_DEFAULT, status,
+			(unsigned int)SOF_ES8336_JD_STATUS_MASK_DEFAULT, present,
+			report_present, should_report);
+
+	if (should_report)
+		snd_soc_jack_report(&priv->jack,
+				    present ? SND_JACK_HEADPHONE : 0,
+				    SND_JACK_HEADPHONE);
+}
+
+static void sof_es8336_set_amp_gpio(struct gpio_desc *gpio, bool on)
+{
+	gpiod_set_value_cansleep(gpio, on);
+}
+
+static void sof_es8336_hwsp_write_restore_profile(struct sof_es8336_private *priv,
+						  struct i2c_client *client)
+{
+	int ret;
+	int i;
+
+	if (!client)
+		return;
+
+	for (i = 0; i < ARRAY_SIZE(hwsp_speaker_restore_profile); i++) {
+		ret = i2c_smbus_write_byte_data(client,
+						hwsp_speaker_restore_profile[i].reg,
+						hwsp_speaker_restore_profile[i].val);
+		if (ret < 0) {
+			dev_warn(priv->codec_dev,
+				 "HWSP restore failed addr=0x%02x reg=0x%02x val=0x%02x: %d\n",
+				 client->addr, hwsp_speaker_restore_profile[i].reg,
+				 hwsp_speaker_restore_profile[i].val, ret);
+			return;
+		}
+	}
+}
+
+static void sof_es8336_hwsp_set_speaker_amp(struct sof_es8336_private *priv,
+					    bool on)
+{
+	if (!sof_es8336_hwsp_amp_enabled() || !priv->hwsp_client)
+		return;
+
+	if (priv->hwsp_speaker_amp_known &&
+	    priv->hwsp_speaker_amp_on == on)
+		return;
+
+	if (on) {
+		sof_es8336_hwsp_write_restore_profile(priv, priv->hwsp_client);
+		sof_es8336_hwsp_write_restore_profile(priv, priv->hwsp_client_5b);
+	} else if (priv->gpio_hwsp) {
+		gpiod_set_raw_value_cansleep(priv->gpio_hwsp, 0);
+		usleep_range(SOF_ES8336_HWSP_MUTE_PULSE_MS * 1000,
+			     SOF_ES8336_HWSP_MUTE_PULSE_MS * 1000 + 1000);
+		gpiod_set_raw_value_cansleep(priv->gpio_hwsp, 1);
+	} else {
+		dev_warn(priv->codec_dev,
+			 "HWSP speaker mute requested but HWSP GPIO is unavailable\n");
+	}
+
+	priv->hwsp_speaker_amp_on = on;
+	priv->hwsp_speaker_amp_known = true;
+
+	dev_dbg(priv->codec_dev, "HWSP speaker amp: target=%d\n", on);
+}
+
+static void sof_es8336_apply_gpio_mux(struct sof_es8336_private *priv)
+{
+	struct gpio_desc *speaker_gpio = priv->gpio_speakers;
+	struct gpio_desc *headphone_gpio = priv->gpio_headphone;
+	bool hwsp_enabled = sof_es8336_hwsp_amp_enabled() && priv->hwsp_client;
+	bool hwsp_speaker_on = false;
+	bool speaker_on;
+	bool headphone_on;
+	bool need_enable_delay;
+
+	if (!priv->gpio_speakers)
+		return;
+
+	mutex_lock(&priv->gpio_mux_lock);
+
+	speaker_on = priv->output_active && !priv->hp_jack_present;
+	headphone_on = priv->output_active && priv->hp_jack_present;
+
+	if (hwsp_enabled) {
+		speaker_on = priv->output_active;
+		headphone_on = false;
+	}
+
+	if (!(quirk & SOF_ES8336_HEADPHONE_GPIO))
+		headphone_on = false;
+
+	if (hwsp_enabled)
+		hwsp_speaker_on = !priv->hp_jack_present;
+
+	if (speaker_on == priv->speaker_amp_on &&
+	    headphone_on == priv->headphone_amp_on &&
+	    (!hwsp_enabled ||
+	     (priv->hwsp_speaker_amp_known &&
+	      hwsp_speaker_on == priv->hwsp_speaker_amp_on)))
+		goto out_unlock;
+
+	if (priv->speaker_amp_on && !speaker_on)
+		sof_es8336_set_amp_gpio(speaker_gpio, false);
+
+	if ((quirk & SOF_ES8336_HEADPHONE_GPIO) && headphone_gpio &&
+	    priv->headphone_amp_on && !headphone_on)
+		sof_es8336_set_amp_gpio(headphone_gpio, false);
+
+	need_enable_delay = (speaker_on && !priv->speaker_amp_on) ||
+			    (headphone_on && !priv->headphone_amp_on);
+
+	if (need_enable_delay)
+		usleep_range(10000, 15000);
+
+	if (speaker_on && !priv->speaker_amp_on)
+		sof_es8336_set_amp_gpio(speaker_gpio, true);
+
+	if ((quirk & SOF_ES8336_HEADPHONE_GPIO) && headphone_gpio &&
+	    headphone_on && !priv->headphone_amp_on)
+		sof_es8336_set_amp_gpio(headphone_gpio, true);
+
+	sof_es8336_hwsp_set_speaker_amp(priv, hwsp_speaker_on);
+
+	priv->speaker_amp_on = speaker_on;
+	priv->headphone_amp_on = headphone_on;
+
+	dev_dbg(priv->codec_dev,
+		"GPIO mux: output_active=%d hp_jack_present=%d speaker=%d headphone=%d hwsp=%d\n",
+		priv->output_active, priv->hp_jack_present,
+		priv->speaker_amp_on, priv->headphone_amp_on,
+		priv->hwsp_speaker_amp_on);
+
+out_unlock:
+	mutex_unlock(&priv->gpio_mux_lock);
+}
+
+static void sof_es8336_gpio_mux_work(struct work_struct *work)
 {
 	struct sof_es8336_private *priv =
-		container_of(work, struct sof_es8336_private, pcm_pop_work.work);
+		container_of(work, struct sof_es8336_private, gpio_mux_work.work);
 
-	gpiod_set_value_cansleep(priv->gpio_speakers, priv->speaker_en);
+	sof_es8336_update_jd_status_fallback(priv);
+	sof_es8336_apply_gpio_mux(priv);
 
-	if (quirk & SOF_ES8336_HEADPHONE_GPIO)
-		gpiod_set_value_cansleep(priv->gpio_headphone, !priv->speaker_en);
+	if (sof_es8336_jd_status_fallback_enabled())
+		mod_delayed_work(system_dfl_wq, &priv->gpio_mux_work,
+				 msecs_to_jiffies(SOF_ES8336_JD_STATUS_POLL_MS));
+}
 
+static int sof_es8336_jack_notifier(struct notifier_block *nb,
+				    unsigned long action, void *data)
+{
+	struct sof_es8336_private *priv =
+		container_of(nb, struct sof_es8336_private, jack_nb);
+	struct snd_soc_jack *jack = data;
+
+	mutex_lock(&priv->gpio_mux_lock);
+	priv->hp_jack_present = jack->status & SND_JACK_HEADPHONE;
+	mutex_unlock(&priv->gpio_mux_lock);
+
+	mod_delayed_work(system_dfl_wq, &priv->gpio_mux_work, 0);
+
+	return NOTIFY_OK;
 }
 
 static int sof_8336_trigger(struct snd_pcm_substream *substream, int cmd)
 {
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct snd_soc_card *card = rtd->card;
-	struct sof_es8336_private *priv = snd_soc_card_get_drvdata(card);
-
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 	case SNDRV_PCM_TRIGGER_RESUME:
-		break;
-
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_STOP:
-		if (priv->speaker_en == false)
-			if (substream->stream == 0) {
-				cancel_delayed_work(&priv->pcm_pop_work);
-				gpiod_set_value_cansleep(priv->gpio_speakers, true);
-			}
 		break;
 	default:
 		return -EINVAL;
@@ -152,18 +393,19 @@ static int sof_8336_trigger(struct snd_pcm_substream *substream, int cmd)
 	return 0;
 }
 
-static int sof_es8316_speaker_power_event(struct snd_soc_dapm_widget *w,
-					  struct snd_kcontrol *kcontrol, int event)
+static int sof_es8316_output_power_event(struct snd_soc_dapm_widget *w,
+					 struct snd_kcontrol *kcontrol, int event)
 {
 	struct snd_soc_card *card = snd_soc_dapm_to_card(w->dapm);
 	struct sof_es8336_private *priv = snd_soc_card_get_drvdata(card);
+	bool output_active = SND_SOC_DAPM_EVENT_ON(event);
+	unsigned long delay = output_active ? msecs_to_jiffies(70) : 0;
 
-	if (priv->speaker_en == !SND_SOC_DAPM_EVENT_ON(event))
-		return 0;
-
-	priv->speaker_en = !SND_SOC_DAPM_EVENT_ON(event);
+	mutex_lock(&priv->gpio_mux_lock);
+	priv->output_active = output_active;
+	mutex_unlock(&priv->gpio_mux_lock);
 
-	queue_delayed_work(system_dfl_wq, &priv->pcm_pop_work, msecs_to_jiffies(70));
+	mod_delayed_work(system_dfl_wq, &priv->gpio_mux_work, delay);
 	return 0;
 }
 
@@ -173,8 +415,8 @@ static const struct snd_soc_dapm_widget sof_es8316_widgets[] = {
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
 	SND_SOC_DAPM_MIC("Internal Mic", NULL),
 
-	SND_SOC_DAPM_SUPPLY("Speaker Power", SND_SOC_NOPM, 0, 0,
-			    sof_es8316_speaker_power_event,
+	SND_SOC_DAPM_SUPPLY("Output Power", SND_SOC_NOPM, 0, 0,
+			    sof_es8316_output_power_event,
 			    SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMU),
 };
 
@@ -185,6 +427,7 @@ static const struct snd_soc_dapm_widget dmic_widgets[] = {
 static const struct snd_soc_dapm_route sof_es8316_audio_map[] = {
 	{"Headphone", NULL, "HPOL"},
 	{"Headphone", NULL, "HPOR"},
+	{"Headphone", NULL, "Output Power"},
 
 	/*
 	 * There is no separate speaker output instead the speakers are muxed to
@@ -192,7 +435,7 @@ static const struct snd_soc_dapm_route sof_es8316_audio_map[] = {
 	 */
 	{"Speaker", NULL, "HPOL"},
 	{"Speaker", NULL, "HPOR"},
-	{"Speaker", NULL, "Speaker Power"},
+	{"Speaker", NULL, "Output Power"},
 };
 
 static const struct snd_soc_dapm_route sof_es8316_headset_mic2_map[] = {
@@ -302,8 +545,16 @@ static int sof_es8316_init(struct snd_soc_pcm_runtime *runtime)
 	}
 
 	snd_jack_set_key(priv->jack.jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
+	priv->codec_component = codec;
+
+	if (priv->gpio_speakers) {
+		priv->jack_nb.notifier_call = sof_es8336_jack_notifier;
+		snd_soc_jack_notifier_register(&priv->jack, &priv->jack_nb);
+	}
 
 	snd_soc_component_set_jack(codec, &priv->jack, NULL);
+	mod_delayed_work(system_dfl_wq, &priv->gpio_mux_work,
+			 msecs_to_jiffies(100));
 
 	return 0;
 }
@@ -311,6 +562,11 @@ static int sof_es8316_init(struct snd_soc_pcm_runtime *runtime)
 static void sof_es8316_exit(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_card *card = rtd->card;
+	struct sof_es8336_private *priv = snd_soc_card_get_drvdata(card);
+
+	if (priv->gpio_speakers)
+		snd_soc_jack_notifier_unregister(&priv->jack, &priv->jack_nb);
 
 	snd_soc_component_set_jack(component, NULL, NULL);
 }
@@ -340,8 +596,10 @@ static const struct dmi_system_id sof_es8336_quirk_table[] = {
 			DMI_MATCH(DMI_SYS_VENDOR, "HUAWEI"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "BOD-WXX9"),
 		},
-		.driver_data = (void *)(SOF_ES8336_HEADPHONE_GPIO |
-					SOF_ES8336_ENABLE_DMIC)
+		.driver_data = (void *)(SOF_ES8336_SPEAKERS_EN_GPIO1_QUIRK |
+					SOF_ES8336_ENABLE_DMIC |
+					SOF_ES8336_JD_STATUS_FALLBACK |
+					SOF_ES8336_HWSPK_AMP)
 	},
 	{
 		.callback = sof_es8336_quirk_cb,
@@ -596,6 +854,75 @@ static char soc_components[30];
  /* i2c-<HID>:00 with HID being 8 chars */
 static char codec_name[SND_ACPI_I2C_ID_LEN];
 
+static void sof_es8336_hwsp_cleanup(struct sof_es8336_private *priv)
+{
+	if (priv->gpio_hwsp)
+		gpiod_put(priv->gpio_hwsp);
+
+	if (priv->hwsp_dev)
+		put_device(priv->hwsp_dev);
+}
+
+static void sof_es8336_hwsp_init(struct platform_device *pdev,
+				 struct sof_es8336_private *priv)
+{
+	struct device *dev = &pdev->dev;
+	struct acpi_device *adev;
+	struct device *hwsp_dev;
+	struct i2c_client *client;
+	int ret;
+
+	if (!sof_es8336_hwsp_amp_enabled())
+		return;
+
+	adev = acpi_dev_get_first_match_dev("HWSP0001", NULL, -1);
+	if (!adev) {
+		dev_warn(dev, "HWSP0001 ACPI device not found\n");
+		return;
+	}
+
+	hwsp_dev = acpi_get_first_physical_node(adev);
+	acpi_dev_put(adev);
+	if (!hwsp_dev) {
+		dev_warn(dev, "HWSP0001 physical I2C device not ready\n");
+		return;
+	}
+
+	client = i2c_verify_client(hwsp_dev);
+	if (!client) {
+		dev_warn(dev, "HWSP0001 physical device is not an I2C client\n");
+		return;
+	}
+
+	priv->hwsp_dev = get_device(hwsp_dev);
+	priv->hwsp_client = client;
+
+	ret = devm_acpi_dev_add_driver_gpios(hwsp_dev, acpi_hwsp_enable_gpio);
+	if (ret)
+		dev_warn(hwsp_dev, "unable to add HWSP GPIO mapping: %d\n", ret);
+
+	priv->gpio_hwsp = gpiod_get_optional(hwsp_dev, "hwsp-enable",
+					     GPIOD_ASIS);
+	if (IS_ERR(priv->gpio_hwsp)) {
+		dev_warn(hwsp_dev, "could not get HWSP GPIO: %ld\n",
+			 PTR_ERR(priv->gpio_hwsp));
+		priv->gpio_hwsp = NULL;
+	}
+
+	priv->hwsp_client_5b = devm_i2c_new_dummy_device(dev, client->adapter,
+							 SOF_ES8336_HWSP_SECONDARY_ADDR);
+	if (IS_ERR(priv->hwsp_client_5b)) {
+		dev_info(dev, "HWSP secondary i2c addr=0x%02x unavailable: %ld\n",
+			 SOF_ES8336_HWSP_SECONDARY_ADDR,
+			 PTR_ERR(priv->hwsp_client_5b));
+		priv->hwsp_client_5b = NULL;
+	}
+
+	dev_info(dev, "HWSP speaker amp ready: primary=0x%02x secondary=%s gpio=%d\n",
+		 client->addr, priv->hwsp_client_5b ? "0x5b" : "none",
+		 !!priv->gpio_hwsp);
+}
+
 static int sof_es8336_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -756,9 +1083,12 @@ static int sof_es8336_probe(struct platform_device *pdev)
 		goto err_put_codec;
 	}
 
+	sof_es8336_hwsp_init(pdev, priv);
+
 	INIT_LIST_HEAD(&priv->hdmi_pcm_list);
-	INIT_DELAYED_WORK(&priv->pcm_pop_work,
-				pcm_pop_work_events);
+	mutex_init(&priv->gpio_mux_lock);
+	INIT_DELAYED_WORK(&priv->gpio_mux_work,
+			  sof_es8336_gpio_mux_work);
 	snd_soc_card_set_drvdata(card, priv);
 
 	if (mach->mach_params.dmic_num > 0) {
@@ -770,6 +1100,8 @@ static int sof_es8336_probe(struct platform_device *pdev)
 	ret = devm_snd_soc_register_card(dev, card);
 	if (ret) {
 		gpiod_put(priv->gpio_speakers);
+		gpiod_put(priv->gpio_headphone);
+		sof_es8336_hwsp_cleanup(priv);
 		dev_err(dev, "snd_soc_register_card failed: %d\n", ret);
 		goto err_put_codec;
 	}
@@ -787,8 +1119,17 @@ static void sof_es8336_remove(struct platform_device *pdev)
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
 	struct sof_es8336_private *priv = snd_soc_card_get_drvdata(card);
 
-	cancel_delayed_work_sync(&priv->pcm_pop_work);
+	cancel_delayed_work_sync(&priv->gpio_mux_work);
+
+	if (priv->gpio_speakers)
+		gpiod_set_value_cansleep(priv->gpio_speakers, false);
+
+	if ((quirk & SOF_ES8336_HEADPHONE_GPIO) && priv->gpio_headphone)
+		gpiod_set_value_cansleep(priv->gpio_headphone, false);
+
 	gpiod_put(priv->gpio_speakers);
+	gpiod_put(priv->gpio_headphone);
+	sof_es8336_hwsp_cleanup(priv);
 	device_remove_software_node(priv->codec_dev);
 	put_device(priv->codec_dev);
 }
-- 
2.53.0
