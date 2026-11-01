Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793520590;
	b=AuDuOKKKmFeLeIrEjDidFi9pzQPyyZDca1OvPqjMphblylG7s0l15cxyMmA//6vNXuNz
	 Om4cQyw+FtdDcH12x42ujcv7ycEJkI2t1DSOhBFgExDRROmH/0e2q0FHa0Mc8OHTnCeu5
	 WX54kiwvNioBEyeBLBWkqLk216wtttDqv+7MjuEwfVmZNU5HSQbcrW4Ux0vdizea7H9Uy
	 B0c7SDEhHYE52xVvwqVVrR5v3zs0TzjQioVOk0sE8ne8jpLKYHOI44ZM1Tbk0So+oa8hv
	 q5+Fg10808TR6F6RKlM/ckb74Quh2XAMQ+lxROeDBvfxXpYqRTliAYTIZq+DVZerMUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793520590;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XWOKTFFVxS0A5ofKInpigKUflYTnFU8Lbq0QpvU93GE=;
	b=k5oHOV+4epCH7FgJ8V8KaM0+5rfmhJ4+MsNaK4xMvbH6hdQ6RAyfiZexvA7tfZi1JX1i
	 NXy/UWapfngPgsjn0hQFwtZ6OvttZq/hmbY1QXLDs3RtXgZvxjxMeizf335vNnmuguyV/
	 A14IG8QhotAtCx3TJzZdUlNwPDDYf68ZqFaw7Npi3KmVw1d4V8J9vlnA1KWGHMpVEoxEp
	 gVc4SNs58ZiWb1PpgHjTAL/PqyjYo9GW4QCQ0qKD9hosGeEXKsZwpocvJ2wYCw8X0LE9/
	 8NtzrDhcRKgmC9ScifIWP1rdMB+9g/3gOEF5gs4kGpvLzUVt5hBZStlOB8uK1qzrEYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VzUWM04W;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186C3606A32E
	for <linux-sound@vger.kernel.org>; Sun,  1 Nov 2026 08:09:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 186C3606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VzUWM04W
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36a18fc7a38so2756818eec.1
        for <linux-sound@vger.kernel.org>; Sun, 01 Nov 2026 01:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793520588; x=1794125388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XWOKTFFVxS0A5ofKInpigKUflYTnFU8Lbq0QpvU93GE=;
        b=VzUWM04W9dh6HotCNJivQl+GQ/Ub5iMlUT+9i60mUUQNlg6AiXKJBAQXvsziY4c4Tq
         wa0uAKO9W2JD7XpR4mPT9V906eYqYhf54eyYHUfLqpvjOtgOnZJiH8/28obcIf0a8b3U
         wJulmvpYPwNYTwLy19fqIA55sejEoO9ZIiHbnJk/MNVu7u+nHe4x0UpYKXpbvAcyM1z5
         IYim4SYKoiMTLO8gtabT2X6ThXdcgYzHYwCaa4j61hFPshQHonWQaSYOwrgH5RWI/Js+
         jhlaVAHFsDae8N23WALPpwPrrJe86/7KVb/uMfwlDxkKiUA6s7NctalQe5KWUmLJNWLZ
         43Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793520588; x=1794125388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XWOKTFFVxS0A5ofKInpigKUflYTnFU8Lbq0QpvU93GE=;
        b=XPHwLtICrtDLpjUxQGss12f3WxablL6UDoQlQJz58NA0iJqzcRh2js5TSV2o/kd9n7
         lg+OVe1BjpM3pIar0ObZHlbtyG8I4vjPhN9C0aQyXbgOwbE86cms7eszxRFq6XlRJJHS
         efl9vQeRqRXzUisA5DgqDIyKvm0rragAS/iMoDpvQE7EfBwVOf39eH/6HZoSbcn/2TZ6
         UTDWWsW+7sN/wjMQn1CQaIsWEPMIc0HQbgwap0tooXQjw+SOsGkZzf/VDEMk9r1gDce/
         QCZcayIA4AV5SJXMULJ6XjOX7y81K5xPR1e8k/Iw9B5A9PK/Qewf5swWJl696NmfVI2z
         BAtw==
X-Gm-Message-State: APuU4Z87twmkj3DMQ/7ckvU+wy8uJo0JjgyUTPdeqoWi0r6NgVT9mNDO
	DwcgtZzRgsNBswi0ec2tyccqKMG1Ffw8uePFawvA8OZytZFhF3UBhx9g
X-Gm-Gg: AYBFou0pQl1nOZiLwyQkUv+PtzlGykuTJ3Tp4VaRHUQWuJ1FnLCF7xFvbgZRhA/uMzq
	OyrYbJge12zdeBma+DLYLrnScny3Izwn/XDKoEO2LEjTWXazyE8thHss2Lnl6a+RhTfX79ZXuzm
	peOyizVlrW3XgAJq2NzrteQo01unU4yODzoCgga8o1C9SnsVL+f0/6iJL2U6+e0BtCsMz7iqyaT
	2k6KAYMvBYfdFYtKfCNWy6QSyIobZUueNuCCN0ax7AJyS4biHbXNtcac7j/1ueocx1K+LbzcVri
	66bXOX070ZWpvgQObzNJZMI/HphzqoQVfkNSRlH9VRD5+dHUFjnrxzoT2wSR/5nJqJjmMLvtep5
	7rgpa9+0rP5G+LTR39KVK7sI3TBG8uarBQUaNnuLLSC/yJsJ4MuGrVxgWgiBL0uunYKk+HXxm+c
	OKApKx1ikseyH6jCt+5nNnnfZEgPnLO2AKGAJ/UTZ9eyL3lg7Oa3wGCGMOVEQ0kSq35WJ1nXtBC
	rQzCvewP4QmpF/yJ9+4gAZClpeNCJGZac4AGzQpMHp7qJpvYp/BZbL3C4frsMdfZ6smJ+MyPb8Z
	OQibVDR7sI/GandF/oDOutRTucXwO2w7UKp16WcyipyKQCi6WIwtJRtbYHiXGw==
X-Received: by 2002:a05:7300:f78b:b0:36a:43d:8ef7 with SMTP id 5a478bee46e88-36a423a2da5mr9888263eec.18.1793520587976;
        Sun, 01 Nov 2026 01:09:47 -0700 (PDT)
Received: from arch.localdomain ([152.175.67.103])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42aa8999sm27611719eec.29.2026.11.01.01.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 01:09:47 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jerrysteve1101@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v3 2/2] ASoC: codecs: add support for Everest ES7202 PDM ADC
Date: Sun,  1 Nov 2026 16:09:26 +0800
Message-ID: <20261101080926.267041-3-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261101080926.267041-1-jerrysteve1101@gmail.com>
References: <20261101080926.267041-1-jerrysteve1101@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the Everest ES7202, a 2-channel PDM analog-to-digital
converter controlled over I2C. The device outputs PDM data to the SoC
PDM controller and is configured through registers for supply voltage,
analog front-end and per-channel PGA gain.

Based on the Rockchip BSP driver[1] by Binyuan Lan <lby@rock-chips.com>
(committed by Tao Huang <huangtao@rock-chips.com>), originally written
by David Yang <yangxiaohua@everest-semi.com>.

[1] https://github.com/rockchip-linux/kernel/blob/develop-6.1/sound/soc/codecs/es7202.c

Link: https://archive.org/details/es-7202-ds
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 sound/soc/codecs/Kconfig  |  11 ++
 sound/soc/codecs/Makefile |   2 +
 sound/soc/codecs/es7202.c | 373 ++++++++++++++++++++++++++++++++++++++
 sound/soc/codecs/es7202.h | 131 +++++++++++++
 4 files changed, 517 insertions(+)
 create mode 100644 sound/soc/codecs/es7202.c
 create mode 100644 sound/soc/codecs/es7202.h

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index ba59dabeeccd..40ccdef10e24 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -126,6 +126,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_ES9039Q2M
 	imply SND_SOC_ES9356
 	imply SND_SOC_ES7134
+	imply SND_SOC_ES7202
 	imply SND_SOC_ES7241
 	imply SND_SOC_FRAMER
 	imply SND_SOC_FS210X
@@ -1274,6 +1275,16 @@ config SND_SOC_HDMI_CODEC
 config SND_SOC_ES7134
 	tristate "Everest Semi ES7134 CODEC"
 
+config SND_SOC_ES7202
+	tristate "Everest Semi ES7202 CODEC"
+	depends on I2C
+	select REGMAP_I2C
+	help
+	  Enable support for the Everest Semiconductor ES7202, a 2-channel
+	  PDM analog-to-digital converter controlled over I2C. The device
+	  outputs PDM data to a SoC PDM controller and is configured through
+	  registers for supply voltage, analog front-end and PGA gain.
+
 config SND_SOC_ES7241
 	tristate "Everest Semi ES7241 CODEC"
 
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 3826f9e4fce8..2a56fad9073a 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -129,6 +129,7 @@ snd-soc-da732x-y := da732x.o
 snd-soc-da9055-y := da9055.o
 snd-soc-dmic-y := dmic.o
 snd-soc-es7134-y := es7134.o
+snd-soc-es7202-y := es7202.o
 snd-soc-es7241-y := es7241.o
 snd-soc-es83xx-dsm-common-y := es83xx-dsm-common.o
 snd-soc-es8311-y := es8311.o
@@ -577,6 +578,7 @@ obj-$(CONFIG_SND_SOC_DA732X)	+= snd-soc-da732x.o
 obj-$(CONFIG_SND_SOC_DA9055)	+= snd-soc-da9055.o
 obj-$(CONFIG_SND_SOC_DMIC)	+= snd-soc-dmic.o
 obj-$(CONFIG_SND_SOC_ES7134)	+= snd-soc-es7134.o
+obj-$(CONFIG_SND_SOC_ES7202)	+= snd-soc-es7202.o
 obj-$(CONFIG_SND_SOC_ES7241)	+= snd-soc-es7241.o
 obj-$(CONFIG_SND_SOC_ES83XX_DSM_COMMON)    += snd-soc-es83xx-dsm-common.o
 obj-$(CONFIG_SND_SOC_ES8311)    += snd-soc-es8311.o
diff --git a/sound/soc/codecs/es7202.c b/sound/soc/codecs/es7202.c
new file mode 100644
index 000000000000..b652916b4458
--- /dev/null
+++ b/sound/soc/codecs/es7202.c
@@ -0,0 +1,373 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (C) 2020 Everest Semiconductor Co Ltd.,
+// Copyright (C) 2026 Jun Yan <jerrysteve1101@gmail.com>
+
+#include <linux/bitfield.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <sound/pcm.h>
+#include <sound/soc.h>
+#include <sound/soc-dapm.h>
+#include <sound/tlv.h>
+#include "es7202.h"
+
+/*
+ * The main supply voltage selects the analog front-end configuration:
+ * below this threshold the device is configured for 1.8 V, otherwise 3.3 V.
+ */
+#define ES7202_SUPPLY_1V8_MAX_UV	1980000
+#define ES7202_SUPPLY_3V3_DEFAULT_UV	3300000
+
+struct es7202_priv {
+	struct regmap *regmap;
+	struct regulator *supply;
+	struct gpio_desc *reset_gpio;
+	unsigned int supply_uv;
+};
+
+static bool es7202_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case ES7202_RESET:
+	case ES7202_CHIP_STA:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool es7202_writeable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case ES7202_DEV_ID1:
+	case ES7202_DEV_ID0:
+		return false;
+	default:
+		return true;
+	}
+}
+
+static const struct reg_default es7202_reg_defaults[] = {
+	{ ES7202_RESET,		0x10 },
+	{ ES7202_SOFT_MODE,	0x00 },
+	{ ES7202_CLK_DIV,	0x04 },
+	{ ES7202_CLK_EN,	0x00 },
+	{ ES7202_T1_VMID,	0x01 },
+	{ ES7202_T2_VMID,	0x18 },
+	{ ES7202_PDM_INF_CTL,	0x30 },
+	{ ES7202_MISC_CTL,	0x02 },
+	{ ES7202_ANALOG_EN,	0xff },
+	{ ES7202_BIAS_VMID,	0x0c },
+	{ ES7202_PGA1_BIAS,	0x55 },
+	{ ES7202_PGA2_BIAS,	0x55 },
+	{ ES7202_MOD1_BIAS,	0x8c },
+	{ ES7202_MOD2_BIAS,	0x33 },
+	{ ES7202_VREFP_BIAS,	0x33 },
+	{ ES7202_VMMOD_BIAS,	0x33 },
+	{ ES7202_MODS_BIAS,	0x44 },
+	{ ES7202_ANALOG_LP1,	0x00 },
+	{ ES7202_ANALOG_LP2,	0x00 },
+	{ ES7202_ANALOG_MISC1,	0x00 },
+	{ ES7202_ANALOG_MISC2,	0xf8 },
+	{ ES7202_PGA1,		0x18 },
+	{ ES7202_PGA2,		0x18 },
+};
+
+static const struct regmap_config es7202_regmap = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.use_single_read = true,
+	.use_single_write = true,
+	.max_register = ES7202_DEV_ID0,
+	.reg_defaults = es7202_reg_defaults,
+	.num_reg_defaults = ARRAY_SIZE(es7202_reg_defaults),
+	.writeable_reg = es7202_writeable_reg,
+	.volatile_reg = es7202_volatile_reg,
+	.cache_type = REGCACHE_MAPLE,
+};
+
+/*
+ * PGA gain per the datasheet: code 0 is 0 dB, codes 1..10 step +3 dB from
+ * 2.25 dB, and codes 11 and 12 are 30.75 dB and 32.25 dB respectively.  As
+ * the steps are not uniform, a linear TLV (the vendor driver's
+ * DECLARE_TLV_DB_SCALE(mic_boost_tlv, 0, 300, 0)) would misreport the gain,
+ * so use a piecewise range matching the datasheet instead.
+ */
+static const DECLARE_TLV_DB_RANGE(mic_boost_tlv,
+	0, 0, TLV_DB_SCALE_ITEM(0, 0, 0),
+	1, 10, TLV_DB_SCALE_ITEM(225, 300, 0),
+	11, 11, TLV_DB_SCALE_ITEM(3075, 0, 0),
+	12, 12, TLV_DB_SCALE_ITEM(3225, 0, 0),
+);
+
+static const struct snd_kcontrol_new es7202_controls[] = {
+	SOC_SINGLE_TLV("PGA1 Capture Volume", ES7202_PGA1, 0, 0x0c, 0,
+		       mic_boost_tlv),
+	SOC_SINGLE_TLV("PGA2 Capture Volume", ES7202_PGA2, 0, 0x0c, 0,
+		       mic_boost_tlv),
+};
+
+static const struct snd_soc_dapm_widget es7202_dapm_widgets[] = {
+	SND_SOC_DAPM_INPUT("MIC1"),
+	SND_SOC_DAPM_INPUT("MIC2"),
+	SND_SOC_DAPM_ADC("ADC", "Capture", SND_SOC_NOPM, 0, 0),
+};
+
+static const struct snd_soc_dapm_route es7202_dapm_routes[] = {
+	{ "ADC", NULL, "MIC1" },
+	{ "ADC", NULL, "MIC2" },
+};
+
+static int es7202_mute_pdm(struct es7202_priv *es7202, bool mute)
+{
+	return regmap_update_bits(es7202->regmap, ES7202_PDM_INF_CTL,
+				  ES7202_PDM_INF_CTL_MUTE,
+				  mute ? ES7202_PDM_INF_CTL_MUTE : 0);
+}
+
+static int es7202_hw_init(struct es7202_priv *es7202)
+{
+	struct regmap *regmap = es7202->regmap;
+	bool is_1v8 = es7202->supply_uv > 0 &&
+		      es7202->supply_uv <= ES7202_SUPPLY_1V8_MAX_UV;
+	/*
+	 * Power-up sequence from the vendor driver.
+	 * The analog front-end is configured for the actual supply voltage
+	 * (1.8 V vs 3.3 V) and the analog blocks are ramped out of
+	 * power-down in stages.
+	 */
+	const struct reg_sequence init_seq[] = {
+		{ ES7202_SOFT_MODE,	ES7202_MODE_SOFT_MODE_SEL },
+		{ ES7202_ANALOG_MISC1,	ES7202_ANALOG_MISC1_OFFSETSEL1 |
+					(is_1v8 ? 0 : ES7202_ANALOG_MISC1_SUPPLYSEL) },
+
+		/* analog on, rest powered down */
+		{ ES7202_ANALOG_EN,	ES7202_ANALOG_EN_PDN_ADCVREFGEN |
+					ES7202_ANALOG_EN_MODTOP1_RST |
+					ES7202_ANALOG_EN_MODTOP2_RST |
+					ES7202_ANALOG_EN_PDN_MOD1 |
+					ES7202_ANALOG_EN_PDN_MOD2 |
+					ES7202_ANALOG_EN_PDN_PGA1 |
+					ES7202_ANALOG_EN_PDN_PGA2 },
+
+		{ ES7202_BIAS_VMID,	FIELD_PREP(ES7202_BIAS_ADCBIAS_SWH1, 3) |
+					ES7202_BIAS_ENDITHER |
+					FIELD_PREP(ES7202_BIAS_VMIDSEL, 3) },
+
+		/* VREFGEN on; 3.3 V also drops MODTOP reset */
+		{ ES7202_ANALOG_EN,	is_1v8 ?
+					(ES7202_ANALOG_EN_MODTOP1_RST |
+					 ES7202_ANALOG_EN_MODTOP2_RST |
+					 ES7202_ANALOG_EN_PDN_MOD1 |
+					 ES7202_ANALOG_EN_PDN_MOD2 |
+					 ES7202_ANALOG_EN_PDN_PGA1 |
+					 ES7202_ANALOG_EN_PDN_PGA2) :
+					(ES7202_ANALOG_EN_PDN_MOD1 |
+					 ES7202_ANALOG_EN_PDN_MOD2 |
+					 ES7202_ANALOG_EN_PDN_PGA1 |
+					 ES7202_ANALOG_EN_PDN_PGA2) },
+
+		{ ES7202_ANALOG_EN,	0 },
+		{ ES7202_MOD1_BIAS,	FIELD_PREP(ES7202_MOD1_BIAS_SW0, 5) |
+					FIELD_PREP(ES7202_MOD1_BIAS_SW1, 8) },
+		{ ES7202_CLK_DIV,	FIELD_PREP(ES7202_CLK_DIV_MCLK_DIV, 1) },
+		{ ES7202_T2_VMID,	0x01 },
+		{ ES7202_MISC_CTL,	ES7202_MISC_DSM_DITHER_ON },
+		{ ES7202_RESET,		ES7202_RESET_CSM_ON },
+		{ ES7202_CLK_EN,	ES7202_CLK_ANA_CLK_ON | ES7202_CLK_MCLK_ON },
+		{ ES7202_BIAS_VMID,	FIELD_PREP(ES7202_BIAS_ADCBIAS_SWH1, 3) |
+					ES7202_BIAS_ENDITHER |
+					FIELD_PREP(ES7202_BIAS_VMIDSEL, 2) },
+
+		/* keep the PDM outputs muted until a capture stream starts */
+		{ ES7202_PDM_INF_CTL,	ES7202_PDM_NEG_DATA_VALID |
+					ES7202_PDM_POS_DATA_VALID |
+					ES7202_PDM_INF_CTL_MUTE },
+	};
+	return regmap_multi_reg_write(regmap, init_seq, ARRAY_SIZE(init_seq));
+}
+
+static int es7202_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
+{
+	struct snd_soc_component *component = dai->component;
+	struct es7202_priv *es7202 = snd_soc_component_get_drvdata(component);
+
+	if (stream == SNDRV_PCM_STREAM_PLAYBACK)
+		return 0;
+
+	return es7202_mute_pdm(es7202, mute);
+}
+
+static const struct snd_soc_dai_ops es7202_dai_ops = {
+	.mute_stream = es7202_mute_stream,
+};
+
+static struct snd_soc_dai_driver es7202_dai = {
+	.name = "es7202-hifi",
+	.capture = {
+		.stream_name	= "Capture",
+		.channels_min	= 1,
+		.channels_max	= 2,
+		.rates		= SNDRV_PCM_RATE_8000_96000,
+		.formats	= SNDRV_PCM_FMTBIT_S16_LE,
+	},
+	.ops = &es7202_dai_ops,
+};
+
+static int es7202_suspend(struct snd_soc_component *component)
+{
+	struct es7202_priv *es7202 = snd_soc_component_get_drvdata(component);
+
+	return es7202_mute_pdm(es7202, true);
+}
+
+static int es7202_resume(struct snd_soc_component *component)
+{
+	struct es7202_priv *es7202 = snd_soc_component_get_drvdata(component);
+	int ret;
+
+	/* re-run the power-up sequence to bring the analog front-end back up */
+	ret = es7202_hw_init(es7202);
+	if (ret)
+		return ret;
+
+	regcache_mark_dirty(es7202->regmap);
+	return regcache_sync(es7202->regmap);
+}
+
+static const struct snd_soc_component_driver es7202_component_driver = {
+	.controls		= es7202_controls,
+	.num_controls		= ARRAY_SIZE(es7202_controls),
+	.dapm_widgets		= es7202_dapm_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(es7202_dapm_widgets),
+	.dapm_routes		= es7202_dapm_routes,
+	.num_dapm_routes	= ARRAY_SIZE(es7202_dapm_routes),
+	.suspend		= es7202_suspend,
+	.resume			= es7202_resume,
+	.idle_bias_on		= 1,
+	.endianness		= 1,
+};
+
+static void es7202_disable_supply(void *data)
+{
+	regulator_disable(data);
+}
+
+static int es7202_i2c_probe(struct i2c_client *i2c)
+{
+	struct device *dev = &i2c->dev;
+	struct es7202_priv *es7202;
+	unsigned int id1, id0, device_id;
+	int ret;
+	int voltage;
+
+	es7202 = devm_kzalloc(dev, sizeof(*es7202), GFP_KERNEL);
+	if (!es7202)
+		return -ENOMEM;
+
+	i2c_set_clientdata(i2c, es7202);
+
+	es7202->regmap = devm_regmap_init_i2c(i2c, &es7202_regmap);
+	if (IS_ERR(es7202->regmap))
+		return dev_err_probe(dev, PTR_ERR(es7202->regmap),
+				     "failed to init regmap\n");
+
+	es7202->reset_gpio = devm_gpiod_get_optional(dev, "reset",
+						     GPIOD_OUT_HIGH);
+	if (IS_ERR(es7202->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(es7202->reset_gpio),
+				     "failed to get reset gpio\n");
+
+	es7202->supply = devm_regulator_get(dev, "vdd");
+	if (IS_ERR(es7202->supply))
+		return dev_err_probe(dev, PTR_ERR(es7202->supply),
+				     "failed to get supply\n");
+
+	ret = regulator_enable(es7202->supply);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable supply\n");
+
+	ret = devm_add_action_or_reset(dev, es7202_disable_supply, es7202->supply);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to add supply disable action\n");
+
+	voltage = regulator_get_voltage(es7202->supply);
+	if (voltage < 0)
+		es7202->supply_uv = ES7202_SUPPLY_3V3_DEFAULT_UV;
+	else
+		es7202->supply_uv = voltage;
+
+	/* take the device out of reset */
+	gpiod_set_value_cansleep(es7202->reset_gpio, 0);
+	usleep_range(1000, 2000);
+
+	/* verify the chip is present by reading its device id */
+	ret = regmap_read(es7202->regmap, ES7202_DEV_ID1, &id1);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to read device id\n");
+	ret = regmap_read(es7202->regmap, ES7202_DEV_ID0, &id0);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to read device id\n");
+
+	device_id = (id1 << 8) | id0;
+	if (device_id != ES7202_DEVICE_ID)
+		return dev_err_probe(dev, -ENODEV,
+				     "unexpected device id 0x%04x, expected 0x%04x\n",
+				     device_id, ES7202_DEVICE_ID);
+
+	ret = es7202_hw_init(es7202);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to init device\n");
+
+	return devm_snd_soc_register_component(dev, &es7202_component_driver,
+					       &es7202_dai, 1);
+}
+
+static void es7202_i2c_remove(struct i2c_client *i2c)
+{
+	struct es7202_priv *es7202 = i2c_get_clientdata(i2c);
+
+	es7202_mute_pdm(es7202, true);
+}
+
+static void es7202_i2c_shutdown(struct i2c_client *i2c)
+{
+	struct es7202_priv *es7202 = i2c_get_clientdata(i2c);
+
+	es7202_mute_pdm(es7202, true);
+}
+
+static const struct of_device_id es7202_of_match[] = {
+	{ .compatible = "everest,es7202" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, es7202_of_match);
+
+static const struct i2c_device_id es7202_i2c_id[] = {
+	{ "es7202" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, es7202_i2c_id);
+
+static struct i2c_driver es7202_i2c_driver = {
+	.driver = {
+		.name		= "es7202",
+		.of_match_table	= es7202_of_match,
+	},
+	.probe		= es7202_i2c_probe,
+	.remove		= es7202_i2c_remove,
+	.shutdown	= es7202_i2c_shutdown,
+	.id_table	= es7202_i2c_id,
+};
+module_i2c_driver(es7202_i2c_driver);
+
+MODULE_DESCRIPTION("Everest Semi ES7202 PDM ADC ALSA SoC Codec Driver");
+MODULE_AUTHOR("David Yang <yangxiaohua@everest-semi.com>");
+MODULE_AUTHOR("Jun Yan <jerrysteve1101@gmail.com>");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/es7202.h b/sound/soc/codecs/es7202.h
new file mode 100644
index 000000000000..f268722febcc
--- /dev/null
+++ b/sound/soc/codecs/es7202.h
@@ -0,0 +1,131 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2020 Everest Semiconductor Co Ltd.,
+ * Copyright (C) 2026 Jun Yan <jerrysteve1101@gmail.com>
+ */
+
+#ifndef _ES7202_H
+#define _ES7202_H
+
+#include <linux/bits.h>
+
+/* Register addresses */
+#define ES7202_RESET		0x00
+#define ES7202_SOFT_MODE	0x01
+#define ES7202_CLK_DIV		0x02
+#define ES7202_CLK_EN		0x03
+#define ES7202_T1_VMID		0x04
+#define ES7202_T2_VMID		0x05
+#define ES7202_CHIP_STA		0x06
+#define ES7202_PDM_INF_CTL	0x07
+#define ES7202_MISC_CTL		0x08
+#define ES7202_ANALOG_EN	0x10
+#define ES7202_BIAS_VMID	0x11
+#define ES7202_PGA1_BIAS	0x12
+#define ES7202_PGA2_BIAS	0x13
+#define ES7202_MOD1_BIAS	0x14
+#define ES7202_MOD2_BIAS	0x15
+#define ES7202_VREFP_BIAS	0x16
+#define ES7202_VMMOD_BIAS	0x17
+#define ES7202_MODS_BIAS	0x18
+#define ES7202_ANALOG_LP1	0x19
+#define ES7202_ANALOG_LP2	0x1a
+#define ES7202_ANALOG_MISC1	0x1b
+#define ES7202_ANALOG_MISC2	0x1c
+#define ES7202_PGA1		0x1d
+#define ES7202_PGA2		0x1e
+#define ES7202_DEV_ID1		0xfd
+#define ES7202_DEV_ID0		0xfe
+
+#define ES7202_DEVICE_ID		0x7201
+
+#define ES7202_RESET_RST_REGS		BIT(5)
+#define ES7202_RESET_RST_DIG		BIT(4)
+#define ES7202_RESET_SEQ_DIS		BIT(1)
+#define ES7202_RESET_CSM_ON		BIT(0)
+
+#define ES7202_MODE_SOFT_MODE_SEL	BIT(0)
+
+#define ES7202_CLK_DIV_MCLK_DIV		GENMASK(3, 0)	/* 0/1 = /16 ... 15 = /240 */
+
+#define ES7202_CLK_MCLK_INVERT		BIT(2)
+#define ES7202_CLK_ANA_CLK_ON		BIT(1)
+#define ES7202_CLK_MCLK_ON		BIT(0)
+
+#define ES7202_CHIP_STA_CSM_STATE	GENMASK(5, 4)
+#define ES7202_CHIP_STA_FORCE_CSM	GENMASK(2, 0)
+
+#define ES7202_PDM_NEG_DATA_VALID	BIT(5)
+#define ES7202_PDM_POS_DATA_VALID	BIT(4)
+#define ES7202_PDM_CHN_CROSS		BIT(3)
+#define ES7202_PDM_IF_DLY		BIT(2)
+#define ES7202_PDM_DATA2_MUTE		BIT(1)
+#define ES7202_PDM_DATA1_MUTE		BIT(0)
+#define ES7202_PDM_INF_CTL_MUTE		(ES7202_PDM_DATA2_MUTE | \
+					 ES7202_PDM_DATA1_MUTE)
+
+#define ES7202_MISC_CLKDET_RST_DIS	BIT(2)
+#define ES7202_MISC_DSM_DITHER_ON	BIT(1)
+#define ES7202_MISC_PDN_CLKDET		BIT(0)
+
+#define ES7202_ANALOG_EN_PDN_ANA	BIT(7)
+#define ES7202_ANALOG_EN_PDN_ADCVREFGEN	BIT(6)
+#define ES7202_ANALOG_EN_MODTOP1_RST	BIT(5)
+#define ES7202_ANALOG_EN_MODTOP2_RST	BIT(4)
+#define ES7202_ANALOG_EN_PDN_MOD1	BIT(3)
+#define ES7202_ANALOG_EN_PDN_MOD2	BIT(2)
+#define ES7202_ANALOG_EN_PDN_PGA1	BIT(1)
+#define ES7202_ANALOG_EN_PDN_PGA2	BIT(0)
+
+#define ES7202_BIAS_ADCBIAS_SWH0	GENMASK(7, 6)
+#define ES7202_BIAS_ENDITHER		BIT(5)
+#define ES7202_BIAS_ADCBIAS_SWH1	GENMASK(3, 2)
+#define ES7202_BIAS_VMIDSEL		GENMASK(1, 0)	/* 0 = off, 1 = 50k, 2 = 500k, 3 = 5k */
+
+/* bias levels 0x12-0x18 (SW0 for 1.8 V, SW1 for 3.3 V) */
+#define ES7202_PGA1_BIAS_SW0		GENMASK(7, 4)
+#define ES7202_PGA1_BIAS_SW1		GENMASK(3, 0)
+#define ES7202_PGA2_BIAS_SW0		GENMASK(7, 4)
+#define ES7202_PGA2_BIAS_SW1		GENMASK(3, 0)
+#define ES7202_MOD1_BIAS_SW0		GENMASK(7, 4)
+#define ES7202_MOD1_BIAS_SW1		GENMASK(3, 0)
+#define ES7202_MOD2_BIAS_SW0		GENMASK(7, 4)
+#define ES7202_MOD2_BIAS_SW1		GENMASK(3, 0)
+#define ES7202_VREFP_BIAS_SW0		GENMASK(7, 4)
+#define ES7202_VREFP_BIAS_SW1		GENMASK(3, 0)
+#define ES7202_VMMOD_BIAS_SW0		GENMASK(7, 4)
+#define ES7202_VMMOD_BIAS_SW1		GENMASK(3, 0)
+#define ES7202_MODS_BIAS_SW0		GENMASK(7, 4)
+#define ES7202_MODS_BIAS_SW1		GENMASK(3, 0)
+
+#define ES7202_LP1_LP_VRP		BIT(7)
+#define ES7202_LP1_LP_VRPOUT		BIT(6)
+#define ES7202_LP1_LP_VMMOD1		BIT(5)
+#define ES7202_LP1_LP_VMMOD2		BIT(4)
+#define ES7202_LP1_LP_MODS1		BIT(3)
+#define ES7202_LP1_LP_MODS2		BIT(2)
+#define ES7202_LP1_LP_MODI1		BIT(1)
+#define ES7202_LP1_LP_MODI2		BIT(0)
+
+#define ES7202_LP2_LP_PGA1		BIT(5)
+#define ES7202_LP2_LP_PGA2		BIT(4)
+#define ES7202_LP2_PDN_DETCT		BIT(3)
+
+#define ES7202_ANALOG_MISC1_OFFSETSEL1	BIT(6)
+#define ES7202_ANALOG_MISC1_OFFSETSEL0	BIT(5)
+#define ES7202_ANALOG_MISC1_SUPPLYSEL	BIT(4)	/* 0 = 1.8 V, 1 = 3.3 V */
+#define ES7202_ANALOG_MISC1_DITHERSEL	GENMASK(2, 0)
+
+#define ES7202_ANALOG_MISC2_VX2OFF_SW0	BIT(7)
+#define ES7202_ANALOG_MISC2_VX1SEL_SW0	BIT(6)
+#define ES7202_ANALOG_MISC2_VMIDLOW_SW0	GENMASK(5, 4)
+#define ES7202_ANALOG_MISC2_VX2OFF_SW1	BIT(3)
+#define ES7202_ANALOG_MISC2_VX1SEL_SW1	BIT(2)
+#define ES7202_ANALOG_MISC2_VMIDLOW_SW1	GENMASK(1, 0)
+
+#define ES7202_PGA_SELMIC1		BIT(4)
+#define ES7202_PGA_MIC1_GAIN		GENMASK(3, 0)
+#define ES7202_PGA_SELMIC2		BIT(4)
+#define ES7202_PGA_MIC2_GAIN		GENMASK(3, 0)
+
+#endif
-- 
2.56.0

