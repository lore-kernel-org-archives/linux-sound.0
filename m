Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298B654764
	for <linux-sound@vger.kernel.org>; Tue, 21 Jan 2025 23:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737500964; cv=none; b=VrNqs8L4xUXnzo45VKQ2A85lGBvCm0HZ+SeFuie9IRBSoxZg3X1aBCCB8wzIMd1kdSGFWUds4dz/7JQVlg2ef4ujMeTmJNL1jZcuY4nrY/36DXcwnKrFRS+w5buGCTPFdIe3b50x0emKAXbxpEEbuOGYm16iMEGyeOjyWpiIxco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737500964; c=relaxed/simple;
	bh=CvulfpMawWD0KesUr5oHLE97U1dbOjH/VGgvnw1J6SA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kw176OmrFQ6d/BqvcSKixbcioi38vgUjAu6AhKENkv10ag45dtFGqPueIMFC9qYbJkrU7nLpveMTu7DVpUEK4h4dsba7DgALlNaiy5x8hNYRMtOt8br9fbvItfKFFTIFydHTXxmW/WAD2HNgAdmhSljrwEwMdBRawE/4ptBi4QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dhxkr4Dr; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dhxkr4Dr"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5d3d0205bd5so10110527a12.3
        for <linux-sound@vger.kernel.org>; Tue, 21 Jan 2025 15:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737500959; x=1738105759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NwjHNE6ymZbjv+DOjVeTK88uK4Zn3W5g8GfLI/YLZsk=;
        b=Dhxkr4DruqRyq2KvctWa5TMOOfqZJu6+MMTaXs9xG0i2MmeMGZEthDaioBqNAhheRH
         e/TCBOzxTFN401q4DuOJuT1Ioxsyk5+rHlH69xEVFAr+p8NP8JWshjNlcXLT6XjlBg3E
         7EYGlvyzi6yHbE75GWh1cthUM1fJ3+bl5Jci/ozomFjpbICX2VY8qHYLy6+GuhlCiBGQ
         QlGRb/CR9iWMOmH9rBn4JTXQ8Br15NRusWhQh/0SsD2dNlWkwlkV0nbVayavPadm3whV
         Vb6TrlBE4SBi4kJrvbgV4vOlYbYq9+HSLNhwHTFPkFjZ5srW7sYzAHpKXInHPTF+6SiW
         +ZDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737500959; x=1738105759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NwjHNE6ymZbjv+DOjVeTK88uK4Zn3W5g8GfLI/YLZsk=;
        b=nDPJMovcrlGdccCYKJRVS9d0fGBDrk1EEpjVGC4a9eFtl55tbqNAfxagzy7ej7MV/w
         UcBRgw8e0GHbkINZgTOnTCTppxKVaucf/MdEtmtal/4gOapslEjKYBRtqfG91G6cT5YB
         y/wUP8UR8IdU8vpXHBUFT2qxFg70aHL86h0OIf2+2TRaTLz5dQ3rXhQLRU+NbnNzfRW1
         rVEyZqwUEzDCnI89XQyO1O5dzyiL8Mg2Jy1vRDPQ+m5DpeVUTcko61SiNxWhcew4B3o0
         q55JaNfQa7ml0f/Hk/bJ2M5RLhgCBC6L3gjcCHoccOXSdZLG1QqCBziMigZkVdn7EJPx
         zF5A==
X-Forwarded-Encrypted: i=1; AJvYcCV1qvp0IUTX3GcFD8UuI9BtuYINwi2asnpeu1M7LTuBq/N2byv9+gplWmalWIpJjmBtcFy+6MqobPo46Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIuRCckYU/7zU4/3AdV4tuayR5fvocHNwCJ7JeBy6dpq6+OXJr
	KhCLs2/dS6OGkSqXCe3lh3I+m+zTGm1uL6fHh1pprEVPzaFvJ0FT6LlMptxs
X-Gm-Gg: ASbGncsvFMlwIxHMeab/diBxJEVtPb4FDj30nx6BRErhPo0eW0OxcjCiELgLHMWh73V
	7Pl8xc04MIixyYHNvfsMlxNE9lEwoAcvPxn5jXYVNS9ljZj9lJYCBbMSs/I3G9A0e54kCyZChX4
	LwYNmx56lUPw5XDj8a0EmCgZzUXukrT73OMD9ZRAcdQblNohnkPC0h6I8ACofvg56eIB29ctIvF
	x5bIUoTpuCTEo9oFH3Gqf98BgWFNcZ4HPURmD0Fme8cZuppDR6n/hyirhDGF4x3/Od+xdHmxMh3
	tnR4ODjFrQ==
X-Google-Smtp-Source: AGHT+IEzRGh9vr4zdtkb3biG4SixA/pmcxTOFi7Q8qEb2Ym/XOaGmDzD73f5tf4N/1VCxKafKfBK9Q==
X-Received: by 2002:a17:907:6d0a:b0:aae:eb0b:f39a with SMTP id a640c23a62f3a-ab38b3b08c2mr1829389766b.42.1737500959110;
        Tue, 21 Jan 2025 15:09:19 -0800 (PST)
Received: from CYBER-ABAKUS.kucica ([87.116.134.57])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ab384c613d9sm812563166b.31.2025.01.21.15.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 15:09:17 -0800 (PST)
From: Nikola Jelic <nikola.jelic83@gmail.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	linux-sound@vger.kernel.org
Cc: rwalton@cmlmicro.com
Subject: [PATCH 2/2] Adding support for the CML's CMX655D audio codec, both i2c and spi connectivity options.
Date: Wed, 22 Jan 2025 00:09:03 +0100
Message-ID: <20250121230903.89808-2-nikola.jelic83@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250121230903.89808-1-nikola.jelic83@gmail.com>
References: <20250121230903.89808-1-nikola.jelic83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Nikola Jelic <nikola.jelic83@gmail.com>
---
 sound/soc/codecs/Kconfig      |   27 +
 sound/soc/codecs/Makefile     |    4 +
 sound/soc/codecs/cmx655.c     | 1179 +++++++++++++++++++++++++++++++++
 sound/soc/codecs/cmx655.h     |  151 +++++
 sound/soc/codecs/cmx655_i2c.c |  135 ++++
 sound/soc/codecs/cmx655_spi.c |  132 ++++
 6 files changed, 1628 insertions(+)
 create mode 100644 sound/soc/codecs/cmx655.c
 create mode 100644 sound/soc/codecs/cmx655.h
 create mode 100644 sound/soc/codecs/cmx655_i2c.c
 create mode 100644 sound/soc/codecs/cmx655_spi.c

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index ee35f3aa5521..4f440e849b23 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -63,6 +63,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_BT_SCO
 	imply SND_SOC_BD28623
 	imply SND_SOC_CHV3_CODEC
+	imply SND_SOC_CMX655
 	imply SND_SOC_CQ0093VC
 	imply SND_SOC_CROS_EC_CODEC
 	imply SND_SOC_CS35L32
@@ -747,6 +748,32 @@ config SND_SOC_CPCAP
 	tristate "Motorola CPCAP codec"
 	depends on MFD_CPCAP || COMPILE_TEST
 
+config SND_SOC_CMX655D
+	tristate "CMX655D codec"
+	depends on I2C || SPI_MASTER
+	help
+	  Enable support for CML CMX655D audio codec with a speaker and
+	  two microphones. You also need to enable at least one bus
+	  adapter, I2C and/or SPI.
+
+config SND_SOC_CMX655D_I2C
+       tristate "CMX655D codec (I2C)"
+       depends on I2C && SND_SOC_CMX655D
+       default I2C && SND_SOC_CMX655D
+       select REGMAP
+       select REGMAP_I2C
+       help
+         Enable support for CML CMX655D audio codec with I2C control.
+
+config SND_SOC_CMX655D_SPI
+       tristate "CMX655D codec (SPI)"
+       depends on SPI_MASTER && SND_SOC_CMX655D
+       default SPI_MASTER && SND_SOC_CMX655D
+       select REGMAP
+       select REGMAP_SPI
+       help
+         Enable support for CML CMX655D audio codec with SPI control.
+
 config SND_SOC_CQ0093VC
 	tristate
 
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index d7ad795603c1..85c167283956 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -58,6 +58,7 @@ snd-soc-aw88399-y := aw88399.o
 snd-soc-bd28623-y := bd28623.o
 snd-soc-bt-sco-y := bt-sco.o
 snd-soc-chv3-codec-y := chv3-codec.o
+snd-soc-cmx655-y := cmx655.o
 snd-soc-cpcap-y := cpcap.o
 snd-soc-cq93vc-y := cq93vc.o
 snd-soc-cros-ec-codec-y := cros_ec_codec.o
@@ -475,6 +476,9 @@ obj-$(CONFIG_SND_SOC_AW88399)	+= snd-soc-aw88399.o
 obj-$(CONFIG_SND_SOC_BD28623)	+= snd-soc-bd28623.o
 obj-$(CONFIG_SND_SOC_BT_SCO)	+= snd-soc-bt-sco.o
 obj-$(CONFIG_SND_SOC_CHV3_CODEC) += snd-soc-chv3-codec.o
+obj-$(CONFIG_SND_SOC_CMX655D) += snd-soc-cmx655.o
+obj-$(CONFIG_SND_SOC_CMX655D_I2C) += cmx655_i2c.o
+obj-$(CONFIG_SND_SOC_CMX655D_SPI) += cmx655_spi.o
 obj-$(CONFIG_SND_SOC_CQ0093VC) += snd-soc-cq93vc.o
 obj-$(CONFIG_SND_SOC_CPCAP)	+= snd-soc-cpcap.o
 obj-$(CONFIG_SND_SOC_CROS_EC_CODEC)	+= snd-soc-cros-ec-codec.o
diff --git a/sound/soc/codecs/cmx655.c b/sound/soc/codecs/cmx655.c
new file mode 100644
index 000000000000..afbd20796ac4
--- /dev/null
+++ b/sound/soc/codecs/cmx655.c
@@ -0,0 +1,1179 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/version.h>
+#include <linux/regmap.h>
+#include <linux/module.h>
+#include <linux/interrupt.h>
+#include <linux/delay.h>
+#include <linux/gpio.h>
+#include <linux/of.h>
+#include <sound/soc.h>
+#include <sound/soc-dapm.h>
+#include <sound/tlv.h>
+
+#include "cmx655.h"
+
+/*
+ * +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ * Create Regmap
+ * +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ */
+
+static const struct reg_default cmx655_reg_defaults[] = {
+	{ CMX655_ISR, 0x00 },
+	{ CMX655_ISM, 0x00 },
+	{ CMX655_ISE, 0x00 },
+	{ CMX655_CLKCTRL, 0x00 },
+	{ CMX655_RDIVHI, 0x00 },
+	{ CMX655_RDIVLO, 0x00 },
+	{ CMX655_NDIVHI, 0x00 },
+	{ CMX655_NDIVLO, 0x00 },
+	{ CMX655_PLLCTRL, 0x00 },
+	{ CMX655_SAICTRL, 0x00 },
+	{ CMX655_SAIMUX, 0x00 },
+
+	{ CMX655_RVF, 0x00 },
+	{ CMX655_LDCTRL, 0x00 },
+	{ CMX655_RDCTRL, 0x00 },
+	{ CMX655_LEVEL, 0x00 },
+
+	{ CMX655_NGCTRL, 0x00 },
+	{ CMX655_NGTIME, 0x00 },
+	{ CMX655_NGLSTAT, 0x00 },
+	{ CMX655_NGRSTAT, 0x00 },
+
+	{ CMX655_PVF, 0x00 },
+	{ CMX655_PREAMP, 0x00 },
+	{ CMX655_VOLUME, 0x00 },
+	{ CMX655_ALCCTRL, 0x00 },
+	{ CMX655_ALCTIME, 0x00 },
+	{ CMX655_ALCGAIN, 0x00 },
+	{ CMX655_ALCSTAT, 0x00 },
+	{ CMX655_DST, 0x00 },
+	{ CMX655_CPR, 0x00 },
+
+	{ CMX655_SYSCTRL, 0x00 },
+	{ CMX655_COMMAND, 0x00 },
+	{ 0x34, 0x29 },
+	{ 0x35, 0x40 },
+	{ 0x36, 0x80 },
+	{ 0x37, 0x80 },
+
+};
+
+/*
+ * Define all registers as regmap ranges
+ */
+static const struct regmap_range cmx655_valid_reg[] = {
+	{ 0x00, 0x0a },
+	{ 0x0c, 0x0f },
+	{ 0x1c, 0x1f },
+	{ 0x28, 0x30 },
+	{ 0x32, 0x33 }
+};
+
+/*
+ * Define read only as regmap ranges
+ */
+static const struct regmap_range cmx655_read_only_reg[] = {
+	{ 0x00, 0x00 },
+	{ 0x1e, 0x1f },
+	{ 0x2e, 0x2e }
+};
+
+/*
+ * Define write only as regmap ranges
+ */
+static const struct regmap_range cmx655_write_only_reg[] = {
+	{ 0x33, 0x33 }
+};
+
+/*
+ * Define access table for readable registers
+ *  Valid register and not write only
+ */
+static const struct regmap_access_table cmx655_readable_reg = {
+	.yes_ranges = cmx655_valid_reg,
+	.n_yes_ranges = ARRAY_SIZE(cmx655_valid_reg),
+	.no_ranges = cmx655_write_only_reg,
+	.n_no_ranges = ARRAY_SIZE(cmx655_write_only_reg)
+};
+
+/*
+ * Define access table for writeable registers
+ *  Valid register and not read only
+ */
+static const struct regmap_access_table cmx655_writeable_reg = {
+	.yes_ranges = cmx655_valid_reg,
+	.n_yes_ranges = ARRAY_SIZE(cmx655_valid_reg),
+	.no_ranges = cmx655_read_only_reg,
+	.n_no_ranges = ARRAY_SIZE(cmx655_read_only_reg)
+};
+
+/*
+ * Define volatile regs with function
+ */
+static bool cmx655_volatile_reg(struct device *dev, unsigned int reg)
+{
+	bool ret;
+
+	switch (reg) {
+	case CMX655_COMMAND:
+	case CMX655_SYSCTRL:
+	case CMX655_ISR:
+	case CMX655_ISE:
+		ret = true;
+		break;
+	default:
+		ret = false;
+		break;
+	}
+	return ret;
+};
+
+const struct regmap_config cmx655_regmap = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = CMX655_COMMAND,
+
+	.volatile_reg = cmx655_volatile_reg,
+	.wr_table = &cmx655_writeable_reg,
+	.rd_table = &cmx655_readable_reg,
+
+	.reg_defaults = cmx655_reg_defaults,
+	.num_reg_defaults = ARRAY_SIZE(cmx655_reg_defaults),
+	.cache_type = REGCACHE_RBTREE,
+};
+
+EXPORT_SYMBOL(cmx655_regmap);
+/* +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ * End of regmap define
+ * +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ */
+/* +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ * Define some functions used by this module to control the CMX655
+ * +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ */
+/*
+ * Start CMX655 internal clock and wait for clock ready bit
+ */
+static int cmx655_start_sys_clk(struct snd_soc_component *component)
+{
+	int ret;
+	int i;
+	unsigned int val;
+	// Dummy read to clear status bits
+	val = snd_soc_component_read(component, CMX655_ISR);
+	// Start clock
+	ret = snd_soc_component_write(component, CMX655_COMMAND,
+				      CMX655_CMD_CLOCK_START);
+	if (ret < 0) {
+		dev_err(component->dev,
+			"Failed to write start clock command %d\n", ret);
+		return ret;
+	}
+	// Wait for status bit
+	for (i = 0; i < 100; i++) {
+		val = snd_soc_component_read(component, CMX655_ISR);
+		if (val & CMX655_ISR_CLKRDY)
+			break;
+	}
+	if (i == 100) {
+		// Clock did not start
+		ret = -EIO;
+	}
+	return ret;
+}
+
+static int cmx655_stop_sys_clk(struct snd_soc_component *component)
+{
+	return snd_soc_component_write(component, CMX655_COMMAND,
+				       CMX655_CMD_CLOCK_STOP);
+}
+
+/*
+ *  Get the clock setup the system clock based on clock Id, DAI master mode
+ *  and sample rate
+ *      clk_id      - Clock source setting as defined in cmx655.h
+ *      master_mode - Non-zero if the CMX655 is the DAI master
+ *      sr_setting  - Setting for sample rate 0 to 3
+ *      clk_src     - pointer for storing clock source (PLLREF, PLLSEL and
+ *                          CLKSEL bits)
+ *      rdiv        - pointer for storing PLL's RDIV value (13 bits)
+ *      ndiv        - pointer for storing PLL's NDIV value (13 bits)
+ *      pll_ctrl    - pointer for storing PLLCTRL register value (8 bits)
+ */
+static int cmx655_get_sys_clk_config(int clk_id,
+				     int master_mode,
+				     int sr_setting,
+				     int *clk_src,
+				     int *rdiv, int *ndiv, int *pll_ctrl)
+{
+	// Do auto selection
+	if (clk_id == CMX655_SYSCLK_AUTO) {
+		if (master_mode != 0)
+			clk_id = CMX655_SYSCLK_RCLK;
+		else
+			clk_id = CMX655_SYSCLK_LRCLK;
+	}
+	// Set default values
+	*rdiv = 0;
+	*ndiv = 0;
+	*pll_ctrl = 0;
+	switch (clk_id) {
+	case (CMX655_SYSCLK_RCLK):
+		*clk_src = CMX655_CLKCTRL_CLRSRC_RCLK;
+		break;
+	case (CMX655_SYSCLK_LPO):
+		*clk_src = CMX655_CLKCTRL_CLRSRC_LPO;
+		break;
+	case (CMX655_SYSCLK_LRCLK):
+		*clk_src = CMX655_CLKCTRL_CLRSRC_LRCLK;
+		*rdiv = 1;
+		switch (sr_setting) {
+		case (CMX655_CLKCTRL_SR_8K):
+			*ndiv = 3072;
+			*pll_ctrl = (0 << CMX655_PLLCTRL_LFILT_SHIFT) ||
+			    (3 << CMX655_PLLCTRL_CPI_SHIFT);
+			break;
+		case (CMX655_CLKCTRL_SR_16K):
+			*ndiv = 1536;
+			*pll_ctrl = (0 << CMX655_PLLCTRL_LFILT_SHIFT) ||
+			    (3 << CMX655_PLLCTRL_CPI_SHIFT);
+			break;
+		case (CMX655_CLKCTRL_SR_32K):
+			*ndiv = 768;
+			*pll_ctrl = (12 << CMX655_PLLCTRL_LFILT_SHIFT) ||
+			    (3 << CMX655_PLLCTRL_CPI_SHIFT);
+			break;
+		case (CMX655_CLKCTRL_SR_48K):
+			*ndiv = 512;
+			*pll_ctrl = (12 << CMX655_PLLCTRL_LFILT_SHIFT) ||
+			    (3 << CMX655_PLLCTRL_CPI_SHIFT);
+			break;
+		default:
+			return -EINVAL;
+		}
+		break;
+	default:
+		return -EINVAL;
+	}
+	return 0;
+};
+
+/*
+ *  Setup the clock and sample rate. The clock needs to be setup at the same
+ *  time as the sample rate encase we are using the serial port as the clock
+ *  source.
+ *  If the clock source the serial port then the PLL settings are dependent on
+ *  the sample rate.
+ */
+static int cmx655_setup_rate(struct snd_soc_component *component,
+			     struct snd_pcm_hw_params *hw_params)
+{
+	int ret;
+	struct cmx655_data *cmx655_data =
+	    snd_soc_component_get_drvdata(component);
+	struct cmx655_dai_data *cmx655_dai_data = &cmx655_data->dai_data;
+	int srate = params_rate(hw_params);
+	int master_mode;
+	int srate_setting;
+	int clk_src;
+	int rdiv;
+	int ndiv;
+	int pll_ctrl;
+	int sys_ctrl;
+	int vol;
+
+	master_mode = snd_soc_component_read(component, CMX655_SAICTRL);
+	master_mode = master_mode & CMX655_SAI_MSTR;
+
+	// Workout clock settings
+	// Start with sample rate
+	switch (srate) {
+	case 8000:
+		srate_setting = CMX655_CLKCTRL_SR_8K;
+		break;
+	case 16000:
+		srate_setting = CMX655_CLKCTRL_SR_16K;
+		break;
+	case 32000:
+		srate_setting = CMX655_CLKCTRL_SR_32K;
+		break;
+	case 48000:
+		srate_setting = CMX655_CLKCTRL_SR_48K;
+		break;
+	default:
+		dev_err(component->dev, "Unsupported rate %d\n", srate);
+		return -EINVAL;
+	}
+
+	ret = cmx655_get_sys_clk_config(cmx655_dai_data->sys_clk,
+					master_mode, srate_setting,
+					&clk_src, &rdiv, &ndiv, &pll_ctrl);
+	if (ret < 0) {
+		dev_err(component->dev,
+			"Failed to get system clock settings %i\n", ret);
+	}
+	// Check if we are using the LRCLK as the source.
+	if (clk_src == CMX655_CLKCTRL_CLRSRC_LRCLK) {
+		dev_dbg(component->dev,
+			"Using LRCLK as clk source. Using LPO for setup then switch over to LRCLK later");
+		// Store correct clock source for later use
+		cmx655_dai_data->clk_src = clk_src;
+		cmx655_dai_data->best_clk_running = false;	// Need more setup later
+		clk_src = CMX655_CLKCTRL_CLRSRC_LPO;
+	} else {
+		cmx655_dai_data->best_clk_running = true;
+	}
+	// Test to see if the clock source and sample rate are correct.
+	// If so we can skip the setup
+	if (snd_soc_component_test_bits(component, CMX655_CLKCTRL,
+					CMX655_CLKCTRL_CLRSRC_MASK |
+					CMX655_CLKCTRL_SR_MASK,
+					clk_src | srate_setting) == 0) {
+		dev_dbg(component->dev, "Rate Setup correct skipping setup\n");
+		return 0;
+	}
+	// Turn all inputs and outputs off before disabling clock
+	sys_ctrl = snd_soc_component_read(component, CMX655_SYSCTRL);
+	snd_soc_component_update_bits(component, CMX655_SYSCTRL,
+				      CMX655_SYSCTRL_MICR |
+				      CMX655_SYSCTRL_MICL |
+				      CMX655_SYSCTRL_PAMP |
+				      CMX655_SYSCTRL_LOUT, 0);
+
+	cmx655_stop_sys_clk(component);
+	// Set new sample rate and clock source
+	snd_soc_component_update_bits(component, CMX655_CLKCTRL,
+				      CMX655_CLKCTRL_CLRSRC_MASK |
+				      CMX655_CLKCTRL_SR_MASK,
+				      clk_src | srate_setting);
+	// Set new RDIV
+	snd_soc_component_update_bits(component, CMX655_RDIVHI,
+				      0x1F, rdiv >> 8);
+	snd_soc_component_update_bits(component, CMX655_RDIVLO,
+				      0xFF, rdiv & 0xFF);
+	// Set new NDIV
+	snd_soc_component_update_bits(component, CMX655_NDIVHI,
+				      0x1F, ndiv >> 8);
+	snd_soc_component_update_bits(component, CMX655_NDIVLO,
+				      0xFF, ndiv & 0xFF);
+	// Set new PLLCTRL
+	snd_soc_component_update_bits(component, CMX655_PLLCTRL,
+				      0xFF, pll_ctrl & 0xFF);
+	// Now we can re-start the clock
+	ret = cmx655_start_sys_clk(component);
+	if (ret < 0) {
+		dev_err(component->dev,
+			"System clock failed to start %i\n", ret);
+		return ret;
+	}
+	// Turn anything on that we turned off
+	if ((sys_ctrl & (CMX655_SYSCTRL_MICR | CMX655_SYSCTRL_MICL)) > 0) {	// Turn on mic(s)
+		snd_soc_component_update_bits(component, CMX655_SYSCTRL,
+					      CMX655_SYSCTRL_MICR |
+					      CMX655_SYSCTRL_MICL, sys_ctrl);
+		// Wait for filters to settle
+		if (snd_soc_component_test_bits
+		    (component, CMX655_RVF, CMX655_VF_DCBLOCK,
+		     CMX655_VF_DCBLOCK) == 0) {
+			// DC blocking filter off, Shorter wait
+			usleep_range(3500, 4000);
+		} else {
+			// This allows time for Mics and DC blocking filter to settle
+			msleep(320);
+		}
+	}
+	if ((sys_ctrl & (CMX655_SYSCTRL_PAMP | CMX655_SYSCTRL_LOUT)) > 0) {	// Turn output(s) on
+		// Store volume
+		vol = snd_soc_component_read(component, CMX655_VOLUME);
+		// Lower volume with smooth on
+		snd_soc_component_write(component, CMX655_VOLUME, 0x80);
+		snd_soc_component_update_bits(component, CMX655_SYSCTRL,
+					      CMX655_SYSCTRL_PAMP |
+					      CMX655_SYSCTRL_LOUT, sys_ctrl);
+		// Restore volume
+		snd_soc_component_write(component, CMX655_VOLUME, vol);
+	}
+
+	return 0;
+};
+
+/* ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ * End of internal functions
+ * ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ */
+/* ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ * Define DAI (Digital Audio Interface) component
+ * ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ */
+/*
+ * Callback to set serial port format
+ */
+static int cmx655_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
+{
+	struct snd_soc_component *component = dai->component;
+	unsigned int reg_val = 0;
+	// Set master bit
+	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
+	case SND_SOC_DAIFMT_CBM_CFM:
+		reg_val = reg_val | CMX655_SAI_MSTR;
+		break;
+	case SND_SOC_DAIFMT_CBS_CFS:
+		// Could or in 0 but no need
+		break;
+	default:
+		dev_err(component->dev,
+			"Unsupported digital audio interface master mode\n");
+		return -EINVAL;
+	}
+	// Set data format
+	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+	case SND_SOC_DAIFMT_I2S:
+		reg_val = reg_val | CMX655_SAI_DLY | CMX655_SAI_POL;
+		break;
+	case SND_SOC_DAIFMT_LEFT_J:
+		// Could or in 0 but no need
+		break;
+	default:
+		dev_err(component->dev,
+			"Unsupported digital audio interface data format\n");
+		return -EINVAL;
+	}
+	// Change invert bits if required
+	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
+	case SND_SOC_DAIFMT_NB_NF:
+		// No inverts do nothing
+		break;
+	case SND_SOC_DAIFMT_NB_IF:
+		reg_val = reg_val ^ CMX655_SAI_POL;
+		break;
+	case SND_SOC_DAIFMT_IB_NF:
+		reg_val = reg_val | CMX655_SAI_BINV;
+		break;
+	case SND_SOC_DAIFMT_IB_IF:
+		reg_val = (reg_val | CMX655_SAI_BINV) ^ CMX655_SAI_POL;
+		break;
+	default:
+		dev_err(component->dev,
+			"Unknown digital audio interface polarity\n");
+		return -EINVAL;
+	}
+
+	// Write value to codec
+	snd_soc_component_write(component, CMX655_SAICTRL, reg_val);
+	return 0;
+}
+
+/*
+ * Save and check requested clk_id is valid.
+ * Clock is setup as part of hw params
+ */
+static int cmx655_set_dai_sysclk(struct snd_soc_dai *dai,
+				 int clk_id, unsigned int freq, int dir)
+{
+	struct cmx655_data *cmx655_data =
+	    snd_soc_component_get_drvdata(dai->component);
+	struct cmx655_dai_data *cmx655_dai_data = &cmx655_data->dai_data;
+
+	switch (clk_id) {
+	case CMX655_SYSCLK_MIN ... CMX655_SYSCLK_MAX:
+		break;
+	default:
+		return -EINVAL;
+	}
+	cmx655_dai_data->sys_clk = clk_id;
+
+	return 0;
+};
+
+/*
+ * Callback to prepare, if running from the LRCLK we will need to
+ * swap to it here.
+ * Cannot do it in hw_params as the CPU's port was not setup
+ */
+static int cmx655_dai_prepare(struct snd_pcm_substream *stream,
+			      struct snd_soc_dai *dai)
+{
+	int ret = 0;
+	struct snd_soc_component *component = dai->component;
+	struct cmx655_data *cmx655_data =
+	    snd_soc_component_get_drvdata(component);
+	struct cmx655_dai_data *cmx655_dai_data = &cmx655_data->dai_data;
+
+	if (!cmx655_dai_data->best_clk_running) {
+		// Stop the clock change over to the correct one an start it again
+		ret = cmx655_stop_sys_clk(component);
+		if (ret < 0) {
+			dev_err(component->dev, "Failed to stop clock %d\n",
+				ret);
+			goto get_out;
+		}
+		ret =
+		    snd_soc_component_update_bits(component, CMX655_CLKCTRL,
+						  CMX655_CLKCTRL_CLRSRC_MASK,
+						  cmx655_dai_data->clk_src);
+		if (ret < 0) {
+			dev_err(component->dev,
+				"Failed to set new clock setup %d\n", ret);
+			goto get_out;
+		}
+		ret = cmx655_start_sys_clk(component);
+		if (ret < 0) {
+			dev_warn(component->dev, "Failed to restart clock\n");
+			ret = 0;
+			// This will happen if the CPU driver does not start the LRCLK
+			// until the last point.
+			// For now we will assume the clock will start
+		}
+		cmx655_dai_data->best_clk_running = true;
+	}
+get_out:
+	return ret;
+};
+
+/*
+ * Callback to setup codec params
+ */
+static int cmx655_hw_params(struct snd_pcm_substream *stream,
+			    struct snd_pcm_hw_params *hw_params,
+			    struct snd_soc_dai *dai)
+{
+	int ret;
+	struct snd_soc_component *component = dai->component;
+	struct cmx655_data *cmx655_data =
+	    snd_soc_component_get_drvdata(component);
+	struct cmx655_dai_data *cmx655_dai_data = &cmx655_data->dai_data;
+	unsigned int enabled_streams = cmx655_dai_data->enabled_streams;
+
+	if (cmx655_dai_data->best_clk_running) {
+		// Will get here if the clock is in use so don't go stopping it
+		dev_dbg(component->dev, "Clock running. Skipping setup\n");
+	} else {
+		// Setup clock and sample rate
+		ret = cmx655_setup_rate(component, hw_params);
+		if (ret < 0) {
+			dev_err(component->dev, "Failed to set rates %d\n",
+				ret);
+			return ret;
+		}
+	}
+	// Set mono bit based on channel count
+	if (params_channels(hw_params) == 1) {
+		dev_dbg(component->dev, "Switching into mono mode\n");
+		snd_soc_component_update_bits(component, CMX655_SAICTRL,
+					      CMX655_SAI_MONO, CMX655_SAI_MONO);
+	} else {
+		snd_soc_component_update_bits(component, CMX655_SAICTRL,
+					      CMX655_SAI_MONO, 0);
+	}
+
+	if (cmx655_data->irq)
+		cmx655_data->oc_cnt = 0;	// Reset overcurrent count
+	if (enabled_streams == 0) {
+		dev_dbg(component->dev,
+			"First stream to enable, enabling SAI\n");
+		// If first stream to be enabled
+		// Enable SAI (serial audio interface) port
+		// We need it running before the platform starts.
+		// to avoid I2S sync errors
+		snd_soc_component_update_bits(component, CMX655_SYSCTRL,
+					      CMX655_SYSCTRL_SAI,
+					      CMX655_SYSCTRL_SAI);
+	} else {
+		dev_dbg(component->dev,
+			"Not first stream to enable, skipping SAI enable\n");
+	}
+
+	// Inc enabled streams by 1
+	cmx655_dai_data->enabled_streams = enabled_streams + 1;
+
+	return ret;
+}
+
+/*
+ * Shutdown DAI link
+ */
+static void cmx655_dai_shutdown(struct snd_pcm_substream *stream,
+				struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct cmx655_data *cmx655_data =
+	    snd_soc_component_get_drvdata(component);
+	struct cmx655_dai_data *cmx655_dai_data = &cmx655_data->dai_data;
+	unsigned int enabled_streams = cmx655_dai_data->enabled_streams;
+
+	if (enabled_streams == 0) {
+		// Protect against shutdown getting called without a start.
+		// This was seen with audacity
+		dev_dbg(component->dev,
+			"Shutdown called when SAI not running\n");
+		return;
+	}
+	// Reduce enabled streams by 1
+	enabled_streams = enabled_streams - 1;
+	cmx655_dai_data->enabled_streams = enabled_streams;
+	if (enabled_streams == 0) {
+		dev_dbg(component->dev,
+			"Last stream to disable, disabling SAI\n");
+		// If no streams left
+		// Disable SAI port
+		snd_soc_component_update_bits(component, CMX655_SYSCTRL,
+					      CMX655_SYSCTRL_SAI, 0);
+		// Setup the clock again next time around
+		cmx655_dai_data->best_clk_running = false;
+	} else {
+		dev_dbg(component->dev,
+			"Not last stream to disable, skipping SAI disable\n");
+	}
+}
+
+/*
+ * Define CMX655's DAI operations
+ */
+static const struct snd_soc_dai_ops cmx655_dai_ops = {
+	.set_sysclk = cmx655_set_dai_sysclk,
+	.set_fmt = cmx655_set_dai_fmt,
+
+	.prepare = cmx655_dai_prepare,
+	.hw_params = cmx655_hw_params,
+	.shutdown = cmx655_dai_shutdown,
+};
+
+/*
+ * Define CMX655's DAI driver
+ */
+static struct snd_soc_dai_driver cmx655_dai_driver = {
+	.name = "cmx655",
+	.playback = {
+		     .stream_name = "CMX655 Playback",
+		     .channels_min = 1,
+		     .channels_max = 2,
+		     .rates = CMX655_RATES,
+		     .formats = CMX655_FMTS,
+		      },
+	.capture = {
+		    .stream_name = "CMX655 Record",
+		    .channels_min = 1,
+		    .channels_max = 2,
+		    .rates = CMX655_RATES,
+		    .formats = CMX655_FMTS,
+		     },
+	.ops = &cmx655_dai_ops,
+	.symmetric_rate = 1
+};
+
+/* +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ * End of DAI component
+ * +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ */
+/* +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ * Define component/codec driver
+ * +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ */
+/*
+ * CMX655 IRQ handler thread (runs with interrupts enable)
+ * Read status register and take required action
+ */
+static irqreturn_t cmx655_irq_thread(int irq, void *data)
+{
+	struct snd_soc_component *component = data;
+	struct cmx655_data *cmx655_data =
+	    snd_soc_component_get_drvdata(component);
+	unsigned int status;
+
+	status = snd_soc_component_read(component, CMX655_ISR);
+	if (status == 0) {	// Event was not trigged by CMX655 so let the higher level know
+		return IRQ_NONE;
+	}
+	// Thermal protection event ++++++++++++++++++++++++++++++++++++++++++++++++
+	if (status & CMX655_ISR_THERM) {
+		// Do not reset CMX655 codec on over temperature event
+		dev_err(component->dev,
+			"CMX655 class-D over temperature detected\n");
+	}
+	// Over current  event +++++++++++++++++++++++++++++++++++++++++++++++++++++
+	if (status & CMX655_ISR_AMPOC) {
+		dev_warn(component->dev,
+			 "CMX655 class-D over current detected\n");
+		if (cmx655_data->oc_cnt < cmx655_data->oc_cnt_max) {
+			// Re enable class-D
+			snd_soc_component_update_bits(component,
+						      CMX655_SYSCTRL,
+						      CMX655_SYSCTRL_PAMP,
+						      CMX655_SYSCTRL_PAMP);
+			if (cmx655_data->oc_cnt_max <= 10000) {
+				// If overcurrent retries not set to > 10000 keep track of number
+				// of restarts
+				cmx655_data->oc_cnt = cmx655_data->oc_cnt + 1;
+			}
+		} else {
+			// Re enable count reached, do not try again
+			dev_err(component->dev,
+				"Class-D over current restart attempts exceeded\n");
+		}
+	}
+	// End of status bit handling ++++++++++++++++++++++++++++++++++++++++++++++
+	return IRQ_HANDLED;
+}
+
+/*
+ * Method to initailise CMX655 component
+ */
+static int cmx655_component_probe(struct snd_soc_component *component)
+{
+	int ret;
+	struct cmx655_data *cmx655_data =
+	    snd_soc_component_get_drvdata(component);
+
+	// We need the clock running to write to most of the registers
+	// so lets start that now
+	ret = cmx655_start_sys_clk(component);
+	if (ret < 0) {
+		dev_err(component->dev, "Failed to start system clock %d\n",
+			ret);
+		goto codec_err;
+	}
+	cmx655_data->oc_cnt = 0;	// Set overcurrent count
+	// Enable interrupt if supplied
+	if (cmx655_data->irq) {
+		ret =
+		    request_threaded_irq(cmx655_data->irq, NULL,
+					 cmx655_irq_thread, IRQF_ONESHOT,
+					 "cmx655", component);
+		if (ret < 0) {
+			dev_err(component->dev,
+				"Failed to setup interrupt %d\n", ret);
+			goto interrupt_err;
+		}
+		// Setup interrupts on cmx655
+		snd_soc_component_write(component, CMX655_ISM,
+					(CMX655_ISM_AMPOC | CMX655_ISM_THERM));
+	}
+
+	return 0;
+
+interrupt_err:
+codec_err:
+	return ret;
+}
+
+/*
+ * Method to tidy up when codec driver removed
+ */
+static void cmx655_component_remove(struct snd_soc_component *component)
+{
+	struct cmx655_data *cmx655_data =
+	    snd_soc_component_get_drvdata(component);
+	// disable interrupts if used
+	if (cmx655_data->irq) {
+		// Disable interrupts on cmx655
+		snd_soc_component_write(component, CMX655_ISM, 0);
+		// Free interrupt handler
+		free_irq(cmx655_data->irq, component);
+	}
+}
+
+/* +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ * Define ALSA SoC controls
+ */
+/*
+ * Define required TLV (type-length-value) ranges
+ */
+static const DECLARE_TLV_DB_SCALE(cmx655_level, -1200, 100, 0);
+static const DECLARE_TLV_DB_SCALE(cmx655_ng_thresh, -6300, 100, 0);
+static const DECLARE_TLV_DB_SCALE(cmx655_vol, -9100, 100, 1);
+static const DECLARE_TLV_DB_SCALE(cmx655_pre_amp, 0, 600, 0);
+static const DECLARE_TLV_DB_SCALE(cmx655_dst_gain, -6200, 200, 0);
+static const DECLARE_TLV_DB_SCALE(cmx655_alc_gain, 0, 100, 0);
+static const DECLARE_TLV_DB_SCALE(cmx655_alc_thresh, -3100, 100, 0);
+
+/*
+ * Define Enums
+ */
+static const char *const cmx655_ngratio_text[] = {
+	"1:2",
+	"1:3",
+	"1:4"
+};
+
+static SOC_ENUM_SINGLE_DECL(cmx655_ngratio_enum, CMX655_NGCTRL, 5,
+			    cmx655_ngratio_text);
+static const char *const cmx655_ngattack_text[] = {
+	"1.5ms",
+	"3ms",
+	"4.5ms",
+	"6ms",
+	"12ms",
+	"24ms",
+	"48ms",
+	"96ms"
+};
+
+static SOC_ENUM_SINGLE_DECL(cmx655_ngattack_enum, CMX655_NGTIME, 4,
+			    cmx655_ngattack_text);
+static const char *const cmx655_ngrelease_text[] = {
+	"0.06s",
+	"0.12s",
+	"0.24s",
+	"0.48s",
+	"0.96s",
+	"1.92s",
+	"3.84s",
+	"7.68s"
+};
+
+static SOC_ENUM_SINGLE_DECL(cmx655_ngrelease_enum, CMX655_NGTIME, 0,
+			    cmx655_ngrelease_text);
+static const char *const cmx655_hpf_text[] = {
+	"Disabled",
+	"SRate/320",
+	"SRate/53.3",
+	"SRate/26.7"
+};
+
+static SOC_ENUM_SINGLE_DECL(cmx655_hpf_capture_enum, CMX655_RVF, 0,
+			    cmx655_hpf_text);
+static SOC_ENUM_SINGLE_DECL(cmx655_hpf_playback_enum, CMX655_PVF, 0,
+			    cmx655_hpf_text);
+static const char *const cmx655_companding_text[] = {
+	"u-Law",
+	"a-Law"
+};
+
+static SOC_ENUM_SINGLE_DECL(cmx655_companding_enum, CMX655_SAIMUX, 5,
+			    cmx655_companding_text);
+static const char *const cmx655_alc_ratio_text[] = {
+	"1.5:1",
+	"2:1",
+	"4:1",
+	"Inf:1"
+};
+
+static SOC_ENUM_SINGLE_DECL(cmx655_alc_ratio_enum, CMX655_ALCCTRL, 5,
+			    cmx655_alc_ratio_text);
+// Note: The attack and release times are the same as the Noise gate's.
+static SOC_ENUM_SINGLE_DECL(cmx655_alc_attack_enum, CMX655_ALCTIME, 4,
+			    cmx655_ngattack_text);
+static SOC_ENUM_SINGLE_DECL(cmx655_alc_release_enum, CMX655_ALCTIME, 0,
+			    cmx655_ngrelease_text);
+
+/*
+ * Define controls for codec/component
+ */
+static const struct snd_kcontrol_new cmx655_snd_controls[] = {
+	// Capture ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+	SOC_DOUBLE_TLV("Master Capture Volume", CMX655_LEVEL, 4, 0, 15, 0,
+		       cmx655_level),
+
+	SOC_SINGLE("DC_Block Capture Switch", CMX655_RVF,
+		   CMX655_VF_DCBLOCK_SHIFT,
+		   1, 0),
+
+	SOC_SINGLE("LPF Capture Switch", CMX655_RVF, 3, 1, 0),
+	SOC_ENUM("Cap_HPF Capture Switch", cmx655_hpf_capture_enum),
+	// Noise gate
+	SOC_SINGLE("Noise_Gate Capture Switch", CMX655_NGCTRL, 7, 1, 0),
+	SOC_SINGLE_TLV("NG_Threshold Capture Volume", CMX655_NGCTRL, 0, 31, 0,
+		       cmx655_ng_thresh),
+	SOC_ENUM("NG_Ratio Capture Switch", cmx655_ngratio_enum),
+	SOC_ENUM("NG_Attack Capture Switch", cmx655_ngattack_enum),
+	SOC_ENUM("NG_Release Capture Switch", cmx655_ngrelease_enum),
+
+	// Playback +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+	SOC_SINGLE_TLV("Master Playback Volume", CMX655_VOLUME, 0, 91, 0,
+		       cmx655_vol),
+	SOC_SINGLE_TLV("Pre_Amp Playback Volume", CMX655_PREAMP, 0, 3, 0,
+		       cmx655_pre_amp),
+	SOC_SINGLE("Smooth Playback Switch", CMX655_VOLUME, 7, 0x01, 0),
+	SOC_SINGLE("DC_Block Playback Switch", CMX655_PVF,
+		   CMX655_VF_DCBLOCK_SHIFT,
+		   1, 0),
+	SOC_SINGLE("LPF Playback Switch", CMX655_PVF, 3, 1, 0),
+	SOC_ENUM("Play_HPF Playback Switch", cmx655_hpf_playback_enum),
+	SOC_SINGLE("Soft_Mute Playback Switch", CMX655_CPR, 0, 1, 0),
+	SOC_SINGLE("ALC Playback Switch", CMX655_ALCCTRL, 7, 1, 0),
+	SOC_ENUM("ALC_Ratio Playback Switch", cmx655_alc_ratio_enum),
+	SOC_SINGLE_TLV("ALC_Threshold Playback Volume", CMX655_ALCCTRL,
+		       0, 31, 0,
+		       cmx655_alc_thresh),
+	SOC_SINGLE_TLV("ALC_Gain Playback Volume", CMX655_ALCGAIN, 0, 12, 0,
+		       cmx655_alc_gain),
+	SOC_ENUM("ALC_Attack Playback Switch", cmx655_alc_attack_enum),
+	SOC_ENUM("ALC_Release Playback Switch", cmx655_alc_release_enum),
+
+	// Digital Sidetone +++++++++++++++++++++++++++++++++++++++++++++++++++++++
+	SOC_SINGLE_TLV("Sidetone Playback Volume", CMX655_DST, 0, 31, 0,
+		       cmx655_dst_gain),
+	// Companding +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+	SOC_SINGLE("Companding_En Switch", CMX655_SAIMUX, 4, 1, 0),
+	SOC_ENUM("Companding_Type Switch", cmx655_companding_enum),
+};
+
+/* ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ * Define dynamic audio power management (DAPM) widget, controls and routes
+ */
+/*
+ * Define Enums
+ */
+static const char *const cmx655_mic_mux_text[] = {
+	"Normal",
+	"Swapped",
+	"Left only",
+	"Right only"
+};
+
+static SOC_ENUM_SINGLE_DECL(cmx655_mic_mux_enum, CMX655_SAIMUX, 0,
+			    cmx655_mic_mux_text);
+
+static const char *const cmx655_amp_mux_text[] = {
+	"Left",
+	"Right",
+	"Mean"
+};
+
+static SOC_ENUM_SINGLE_DECL(cmx655_amp_mux_enum, CMX655_SAIMUX, 2,
+			    cmx655_amp_mux_text);
+
+static const char *const cmx655_digital_sidetone_text[] = {
+	"Left",
+	"Right",
+	"Mean"
+};
+
+static SOC_ENUM_SINGLE_DECL(cmx655_sidetone_enum, CMX655_DST, 5,
+			    cmx655_digital_sidetone_text);
+/*
+ * Define controls for DAPM
+ */
+static const struct snd_kcontrol_new cmx655_mic_mux =
+SOC_DAPM_ENUM("Cap_SAI Capture Route",
+	      cmx655_mic_mux_enum);
+
+static const struct snd_kcontrol_new cmx655_amp_mux =
+SOC_DAPM_ENUM("Play_SAI Playback Route",
+	      cmx655_amp_mux_enum);
+
+static const struct snd_kcontrol_new cmx655_spkr_en[] = {
+	SOC_DAPM_SINGLE_VIRT("Playback Switch", 1)
+};
+
+static const struct snd_kcontrol_new cmx655_lout_en[] = {
+	SOC_DAPM_SINGLE_VIRT("Playback Switch", 1)
+};
+
+static const struct snd_kcontrol_new cmx655_sidetone_mux =
+SOC_DAPM_ENUM("DST Route", cmx655_sidetone_enum);
+
+static const struct snd_kcontrol_new cmx655_dst_en[] = {
+	SOC_DAPM_SINGLE_VIRT("Playback Switch", 1)
+};
+
+/*
+ * Define DAPM custom events
+ */
+/*
+ *  Special event triggered after mics are enabled.
+ *      Wait for a bit to allow the MIC filters time to settle
+ */
+static int cmx655_mic_dapm_event(struct snd_soc_dapm_widget *widget,
+				 struct snd_kcontrol *control, int event)
+{
+	struct snd_soc_component *component =
+	    snd_soc_dapm_to_component(widget->dapm);
+	int reg_val;
+
+	switch (event) {
+	case (SND_SOC_DAPM_POST_PMU):
+		// After turn on give MIC filters time
+		// Time can be shorter if the DC blocking filter is not enabled
+		reg_val = snd_soc_component_read(component, CMX655_RVF);
+		if ((reg_val && CMX655_VF_DCBLOCK) > 0) {
+			// This allows time for Mics and DC blocking filter to settle
+			msleep(320);
+		} else {
+			usleep_range(3500, 4000);
+		}
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
+/*
+ * Define DAPM widgets for codec/component
+ */
+static const struct snd_soc_dapm_widget cmx655_dapm_widgets[] = {
+	// Input path widgets ++++++++++++++++++++++++++++++++++++++++++++++++++++++
+	SND_SOC_DAPM_INPUT("MICL"),
+	SND_SOC_DAPM_INPUT("MICR"),
+
+	// Custom widgets for Mics to get them to turn on before switches
+	{.id = snd_soc_dapm_mic,
+	 .name = "Left Mic",
+	 .kcontrol_news = NULL,
+	 .num_kcontrols = 0,
+	 .reg = CMX655_SYSCTRL,
+	 .shift = 1,
+	 .mask = 1,
+	 .on_val = 1,
+	 .off_val = 0,
+	 .event = cmx655_mic_dapm_event,
+	 .event_flags = SND_SOC_DAPM_POST_PMU },
+	{.id = snd_soc_dapm_mic,
+	 .name = "Right Mic",
+	 .kcontrol_news = NULL,
+	 .num_kcontrols = 0,
+	 .reg = CMX655_SYSCTRL,
+	 .shift = 0,
+	 .mask = 1,
+	 .on_val = 1,
+	 .off_val = 0,
+	 .event = cmx655_mic_dapm_event,
+	 .event_flags = SND_SOC_DAPM_POST_PMU },
+
+	SND_SOC_DAPM_MUX("SAI_L Capture Mux", SND_SOC_NOPM, 0, 0,
+			 &cmx655_mic_mux),
+	SND_SOC_DAPM_MUX("SAI_R Capture Mux", SND_SOC_NOPM, 0, 0,
+			 &cmx655_mic_mux),
+
+	// Note: SAI enable is controlled by DAI's HWparams and shutdown. Using
+	// DAPM control resulted in I2S sync errors on the platform driver
+	SND_SOC_DAPM_AIF_OUT("SAI Left Out", "CMX655 Record", 0,
+			     SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("SAI Right Out", "CMX655 Record", 1,
+			     SND_SOC_NOPM, 0, 0),
+
+	// Output path widgets +++++++++++++++++++++++++++++++++++++++++++++++++++++
+	SND_SOC_DAPM_AIF_IN("SAI Left In", "CMX655 Playback", 0,
+			    SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("SAI Right In", "CMX655 Playback", 1,
+			    SND_SOC_NOPM, 0, 0),
+
+	SND_SOC_DAPM_MUX("Play_SAI Playback Route", SND_SOC_NOPM, 0, 0,
+			 &cmx655_amp_mux),
+
+	SND_SOC_DAPM_DAC("Power Amp", "CMX655 Playback", CMX655_SYSCTRL, 3, 0),
+	SND_SOC_DAPM_DAC("Line Out", "CMX655 Playback", CMX655_SYSCTRL, 4, 0),
+
+	SND_SOC_DAPM_SWITCH("SPKR_EN", SND_SOC_NOPM, 0, 0, cmx655_spkr_en),
+	SND_SOC_DAPM_SWITCH("LOUT_EN", SND_SOC_NOPM, 0, 0, cmx655_lout_en),
+
+	SND_SOC_DAPM_OUTPUT("SPKR"),
+	SND_SOC_DAPM_OUTPUT("LOUT"),
+
+	// Digital side tone widgets +++++++++++++++++++++++++++++++++++++++++++++++
+	SND_SOC_DAPM_SWITCH("DST_EN", SND_SOC_NOPM, 0, 0, cmx655_dst_en),
+	SND_SOC_DAPM_MUX("DST", CMX655_DST, 7, 0, &cmx655_sidetone_mux),
+
+};
+
+/*
+ * Define dynamic audio power management routes for codec/component
+ */
+static const struct snd_soc_dapm_route cmx655_dapm_routes[] = {
+	// Main output path
+	{ "SPKR", NULL, "SPKR_EN" },
+	{ "LOUT", NULL, "LOUT_EN" },
+	{ "SPKR_EN", "Playback Switch", "Power Amp" },
+	{ "LOUT_EN", "Playback Switch", "Line Out" },
+	{ "Power Amp", NULL, "Play_SAI Playback Route" },
+	{ "Line Out", NULL, "Play_SAI Playback Route" },
+	{ "Play_SAI Playback Route", "Left", "SAI Left In" },
+	{ "Play_SAI Playback Route", "Right", "SAI Right In" },
+	{ "Play_SAI Playback Route", "Mean", "SAI Left In" },
+	{ "Play_SAI Playback Route", "Mean", "SAI Right In" },
+	// Main input path
+	{ "SAI Right Out", NULL, "SAI_R Capture Mux" },
+	{ "SAI Left Out", NULL, "SAI_L Capture Mux" },
+	{ "SAI_L Capture Mux", "Normal", "Left Mic" },
+	{ "SAI_R Capture Mux", "Normal", "Right Mic" },
+	{ "SAI_L Capture Mux", "Swapped", "Right Mic" },
+	{ "SAI_R Capture Mux", "Swapped", "Left Mic" },
+	{ "SAI_L Capture Mux", "Left only", "Left Mic" },
+	{ "SAI_R Capture Mux", "Left only", "Left Mic" },
+	{ "SAI_L Capture Mux", "Right only", "Right Mic" },
+	{ "SAI_R Capture Mux", "Right only", "Right Mic" },
+	{ "Right Mic", NULL, "MICR" },
+	{ "Left Mic", NULL, "MICL" },
+	// Digital side tone
+	{ "DST", "Left", "Left Mic" },
+	{ "DST", "Right", "Right Mic" },
+	{ "DST", "Mean", "Left Mic" },
+	{ "DST", "Mean", "Right Mic" },
+
+	{ "DST_EN", "Playback Switch", "DST" },
+
+	{ "Power Amp", NULL, "DST_EN" },
+	{ "Line Out", NULL, "DST_EN" },
+
+};
+
+/*
+ * Create component driver structure
+ */
+static const struct snd_soc_component_driver cmx655_component_driver = {
+	.controls = cmx655_snd_controls,
+	.num_controls = ARRAY_SIZE(cmx655_snd_controls),
+	.dapm_widgets = cmx655_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(cmx655_dapm_widgets),
+	.dapm_routes = cmx655_dapm_routes,
+	.num_dapm_routes = ARRAY_SIZE(cmx655_dapm_routes),
+
+	.probe = cmx655_component_probe,
+	.remove = cmx655_component_remove
+};
+
+/* +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ * End of component/codec driver
+ * +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ */
+
+/*
+ * Read custom setting from device tree
+ */
+int cmx655_parse_data_from_of(const struct device_node *device_node,
+			      struct cmx655_data *cmx655_data)
+{
+	int ret;
+	unsigned int val;
+
+	ret =
+	    of_property_read_u32(device_node,
+				 "cmx655,classd-oc-reset-attempts", &val);
+	if (ret >= 0)
+		cmx655_data->oc_cnt_max = val;
+	else
+		cmx655_data->oc_cnt_max = 5;
+
+	return 0;
+}
+
+EXPORT_SYMBOL(cmx655_parse_data_from_of);
+/*
+ * Method for component registration
+ */
+int cmx655_common_register_component(struct device *dev)
+{
+	return devm_snd_soc_register_component(dev,
+					       &cmx655_component_driver,
+					       &cmx655_dai_driver, 1);
+}
+
+EXPORT_SYMBOL(cmx655_common_register_component);
+
+void cmx655_common_unregister_component(struct device *dev)
+{
+	snd_soc_unregister_component(dev);
+}
+
+EXPORT_SYMBOL(cmx655_common_unregister_component);
+/* +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ * Module info
+ * +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ */
+MODULE_DESCRIPTION("ASoC CMX655 driver");
+MODULE_AUTHOR("CML");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/cmx655.h b/sound/soc/codecs/cmx655.h
new file mode 100644
index 000000000000..ab5b41c63af5
--- /dev/null
+++ b/sound/soc/codecs/cmx655.h
@@ -0,0 +1,151 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#ifndef CMX655_H
+#define CMX655_H
+
+#include <linux/gpio.h>
+#include <linux/regmap.h>
+#include <sound/pcm.h>
+
+#define CMX655_ISR      (0x00)
+#define     CMX655_ISR_MICR        (1 << 0)
+#define     CMX655_ISR_MICL        (1 << 1)
+#define     CMX655_ISR_AMPOC       (1 << 2)
+#define     CMX655_ISR_AMPCLIP     (1 << 3)
+#define     CMX655_ISR_CLKRDY      (1 << 4)
+#define     CMX655_ISR_THERM       (1 << 5)
+#define     CMX655_ISR_VOL         (1 << 6)
+#define     CMX655_ISR_CAL         (1 << 7)
+
+#define CMX655_ISM      (0x01)
+#define     CMX655_ISM_MICR        (1 << 0)
+#define     CMX655_ISM_MICL        (1 << 1)
+#define     CMX655_ISM_AMPOC       (1 << 2)
+#define     CMX655_ISM_AMPCLIP     (1 << 3)
+#define     CMX655_ISM_CLKRDY      (1 << 4)
+#define     CMX655_ISM_THERM       (1 << 5)
+#define     CMX655_ISM_VOL         (1 << 6)
+#define     CMX655_ISM_CAL         (1 << 7)
+#define CMX655_ISE      (0x02)
+#define CMX655_CLKCTRL  (0x03)
+#define     CMX655_CLKCTRL_PREDIV_SHIFT    (0)
+#define     CMX655_CLKCTRL_PREDIV_VALUE    (0x3)
+#define     CMX655_CLKCTRL_PREDIV_MASK     (CMX655_CLKCTRL_PREDIV_VALUE << \
+                                                CMX655_CLKCTRL_PREDIV_SHIFT)
+#define     CMX655_CLKCTRL_CLRSRC_SHIFT    (2)
+#define     CMX655_CLKCTRL_CLRSRC_VALUE    (0x7)
+#define     CMX655_CLKCTRL_CLRSRC_MASK     (CMX655_CLKCTRL_CLRSRC_VALUE << \
+                                                CMX655_CLKCTRL_CLRSRC_SHIFT)
+#define     CMX655_CLKCTRL_CLRSRC_RCLK     (0 << CMX655_CLKCTRL_CLRSRC_SHIFT)
+#define     CMX655_CLKCTRL_CLRSRC_LPO      (1 << CMX655_CLKCTRL_CLRSRC_SHIFT)
+#define     CMX655_CLKCTRL_CLRSRC_LRCLK    (7 << CMX655_CLKCTRL_CLRSRC_SHIFT)
+#define     CMX655_CLKCTRL_SR_SHIFT        (5)
+#define     CMX655_CLKCTRL_SR_VALUE        (0x3)
+#define     CMX655_CLKCTRL_SR_MASK         (CMX655_CLKCTRL_SR_VALUE << \
+                                                CMX655_CLKCTRL_SR_SHIFT)
+#define     CMX655_CLKCTRL_SR_8K            (0 << CMX655_CLKCTRL_SR_SHIFT)
+#define     CMX655_CLKCTRL_SR_16K           (1 << CMX655_CLKCTRL_SR_SHIFT)
+#define     CMX655_CLKCTRL_SR_32K           (2 << CMX655_CLKCTRL_SR_SHIFT)
+#define     CMX655_CLKCTRL_SR_48K           (3 << CMX655_CLKCTRL_SR_SHIFT)
+
+#define CMX655_RDIVHI   (0x04)
+#define CMX655_RDIVLO   (0x05)
+#define CMX655_NDIVHI   (0x06)
+#define CMX655_NDIVLO   (0x07)
+#define CMX655_PLLCTRL  (0x08)
+#define     CMX655_PLLCTRL_CPI_SHIFT       (0)
+#define     CMX655_PLLCTRL_LFILT_SHIFT     (4)
+#define CMX655_SAICTRL  (0x09)
+#define     CMX655_SAI_PCM         (1 << 0)
+#define     CMX655_SAI_BINV        (1 << 2)
+#define     CMX655_SAI_POL         (1 << 3)
+#define     CMX655_SAI_DLY         (1 << 4)
+#define     CMX655_SAI_MONO        (1 << 5)
+#define     CMX655_SAI_WL          (1 << 6)
+#define     CMX655_SAI_MSTR        (1 << 7)
+
+#define CMX655_SAIMUX   (0x0a)
+#define CMX655_RVF      (0x0c)
+#define     CMX655_VF_DCBLOCK_SHIFT     (2)
+#define     CMX655_VF_DCBLOCK           (1 << CMX655_VF_DCBLOCK_SHIFT)
+#define CMX655_LDCTRL   (0x0d)
+#define CMX655_RDCTRL   (0x0e)
+#define CMX655_LEVEL    (0x0f)
+#define CMX655_NGCTRL   (0x1c)
+#define CMX655_NGTIME   (0x1d)
+#define CMX655_NGLSTAT  (0x1e)
+#define CMX655_NGRSTAT  (0x1f)
+#define CMX655_PVF      (0x28)
+#define CMX655_PREAMP   (0x29)
+#define CMX655_VOLUME   (0x2a)
+#define CMX655_ALCCTRL  (0x2b)
+#define CMX655_ALCTIME  (0x2c)
+#define CMX655_ALCGAIN  (0x2d)
+#define CMX655_ALCSTAT  (0x2e)
+#define CMX655_DST      (0x2f)
+#define CMX655_CPR      (0x30)
+#define CMX655_SYSCTRL  (0x32)
+#define     CMX655_SYSCTRL_MICR    (1 << 0)
+#define     CMX655_SYSCTRL_MICL    (1 << 1)
+#define     CMX655_SYSCTRL_PAMP    (1 << 3)
+#define     CMX655_SYSCTRL_LOUT    (1 << 4)
+#define     CMX655_SYSCTRL_SAI     (1 << 5)
+
+#define CMX655_COMMAND  (0x33)
+#define     CMX655_CMD_CLOCK_STOP  (0x00)
+#define     CMX655_CMD_CLOCK_START (0x01)
+#define     CMX655_CMD_SOFT_RESET  (0xff)
+
+/*  GPIO connection for reset and irq */
+#define CMX655_RESETN   (24)
+#define CMX655_IRQN     (25)
+#define CMX655_CS       (8)
+
+#define CMX655_RATES (  SNDRV_PCM_RATE_8000 |\
+                        SNDRV_PCM_RATE_16000 |\
+                        SNDRV_PCM_RATE_32000 |\
+                        SNDRV_PCM_RATE_48000 )
+
+#define CMX655_FMTS ( SNDRV_PCM_FMTBIT_U8 | SNDRV_PCM_FMTBIT_S16_LE )
+
+// clock id's when calling set sysclk
+// Auto = Use RCLK when in DAI master mode. Use LRCLK in Slave mode.
+// DO NOT use CMX655_SYSCLK_LRCLK when in DAI master mode
+#define CMX655_SYSCLK_AUTO  (0)
+#define CMX655_SYSCLK_RCLK  (1)
+#define CMX655_SYSCLK_LRCLK (2)
+#define CMX655_SYSCLK_LPO   (3)
+#define CMX655_SYSCLK_MIN   (CMX655_SYSCLK_AUTO)
+#define CMX655_SYSCLK_MAX   (CMX655_SYSCLK_LPO)
+
+/*
+ * Structure to hold info on cmx655 setup
+ *
+ */
+struct cmx655_dai_data {
+	int sys_clk;
+	unsigned int enabled_streams;
+	bool best_clk_running;	// Clear if prepare needs to setup the clock
+	int clk_src;
+
+};
+
+struct cmx655_data {
+	struct regmap *regmap;
+	struct cmx655_dai_data dai_data;
+	struct gpio_desc *reset_gpio;
+	int irq;
+	// Number of times the class-D overcurrent has been reset
+	unsigned int oc_cnt;
+	// Max times the class-D overcurrent should be reset
+	unsigned int oc_cnt_max;
+};
+
+extern const struct regmap_config cmx655_regmap;
+
+int cmx655_parse_data_from_of(const struct device_node *device_node,
+			      struct cmx655_data *cmx655_data);
+int cmx655_common_register_component(struct device *dev);
+void cmx655_common_unregister_component(struct device *dev);
+
+#endif /* CMX655_H  */
diff --git a/sound/soc/codecs/cmx655_i2c.c b/sound/soc/codecs/cmx655_i2c.c
new file mode 100644
index 000000000000..0c277633499a
--- /dev/null
+++ b/sound/soc/codecs/cmx655_i2c.c
@@ -0,0 +1,135 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/version.h>
+#include <linux/module.h>
+#include <linux/i2c.h>
+#include <linux/of.h>
+
+#include "cmx655.h"
+
+/*
+ * I2C device bind stage used by i2c driver
+ */
+static int cmx655_i2c_probe(struct i2c_client *client)
+{
+	int ret;
+	struct cmx655_data *cmx655_data;
+	struct cmx655_dai_data *cmx655_dai_data =
+	    dev_get_platdata(&client->dev);
+	// Init CMX655 data area
+	cmx655_data = devm_kzalloc(&client->dev, sizeof(*cmx655_data),
+				   GFP_KERNEL);
+	if (!cmx655_data)
+		return -ENOMEM;
+
+	cmx655_data->regmap = devm_regmap_init_i2c(client, &cmx655_regmap);
+	if (IS_ERR(cmx655_data->regmap))
+		return PTR_ERR(cmx655_data->regmap);
+	cmx655_data->irq = client->irq;
+	// Use existing DAI data if found
+	if (cmx655_dai_data) {
+		memcpy(&cmx655_data->dai_data, cmx655_dai_data,
+		       sizeof(*cmx655_dai_data));
+	}
+	// Set-up value following the codec reset that will happen in a bit
+	cmx655_data->dai_data.enabled_streams = 0;
+	cmx655_data->dai_data.best_clk_running = false;
+	// Extract data from Device tree
+	if (client->dev.of_node) {
+		ret =
+		    cmx655_parse_data_from_of(client->dev.of_node, cmx655_data);
+		if (ret < 0) {
+			dev_err(&client->dev,
+				"Failed to extract data from device tree%d\n",
+				ret);
+			return ret;
+		}
+	}
+	// Find gpios
+	// Reset
+	// Find and set low
+	cmx655_data->reset_gpio = devm_gpiod_get_optional(&client->dev,
+							  "reset",
+							  GPIOD_OUT_LOW);
+	// Reset codec
+	if (cmx655_data->reset_gpio) {
+		// Hold reset line
+		gpiod_set_value_cansleep(cmx655_data->reset_gpio, 1);
+		// Time of reset pulse must be greater than 1us
+		// sleep for 10us to 1ms, speed is not critical here
+		usleep_range(10, 1000);
+		// release reset line
+		gpiod_set_value_cansleep(cmx655_data->reset_gpio, 0);
+	} else {
+		dev_dbg(&client->dev, "No reset GPIO, using reset command\n");
+		regmap_write(cmx655_data->regmap, CMX655_COMMAND,
+			     CMX655_CMD_SOFT_RESET);
+	}
+	i2c_set_clientdata(client, cmx655_data);
+
+	// Register codec component
+	ret = cmx655_common_register_component(&client->dev);
+
+	if (ret < 0) {
+		dev_err(&client->dev,
+			"%s: Register component failed %d\n", __func__, ret);
+	}
+
+	return ret;
+};
+
+/*
+ * I2C device removal stage used by i2c driver
+ */
+static void cmx655_i2c_remove(struct i2c_client *client)
+{
+	struct cmx655_data *cmx655_data = i2c_get_clientdata(client);
+	// put codec into reset in GPIO given
+	gpiod_set_value_cansleep(cmx655_data->reset_gpio, 1);
+	// unregister codec
+	cmx655_common_unregister_component(&client->dev);
+};
+
+static const struct i2c_device_id cmx655_device_id[] = {
+	{ "cmx655", 0 },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(i2c, cmx655_device_id);
+/*
+ * Define Open Firmware (OF) match table. Supportr for device tree
+ */
+static const struct of_device_id cmx655_of_match[] = {
+	{.compatible = "cml,cmx655d" },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(of, cmx655_of_match);
+
+/*
+ * Define i2c driver struct
+ */
+static struct i2c_driver cmx655_i2c_driver = {
+	.probe = cmx655_i2c_probe,
+	.remove = cmx655_i2c_remove,
+	.driver = {
+		   .name = "cmx655",
+		   .of_match_table = cmx655_of_match,
+		    },
+	.id_table = cmx655_device_id
+};
+
+module_i2c_driver(cmx655_i2c_driver);
+
+/* +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ * End if I2C define
+ * +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ */
+
+/* +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ * Module info
+ * +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ */
+MODULE_DESCRIPTION("ASoC CMX655 driver, I2C adapter");
+MODULE_AUTHOR("CML");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/cmx655_spi.c b/sound/soc/codecs/cmx655_spi.c
new file mode 100644
index 000000000000..aa73160576a0
--- /dev/null
+++ b/sound/soc/codecs/cmx655_spi.c
@@ -0,0 +1,132 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/version.h>
+#include <linux/module.h>
+#include <linux/spi/spi.h>
+#include <linux/of.h>
+
+#include "cmx655.h"
+
+/*
+ * SPI device bind stage used by spi driver
+ */
+static int cmx655_spi_probe(struct spi_device *spi)
+{
+	int ret;
+	struct cmx655_data *cmx655_data;
+	struct cmx655_dai_data *cmx655_dai_data = dev_get_drvdata(&spi->dev);
+	// Init CMX655 data area
+	cmx655_data = devm_kzalloc(&spi->dev, sizeof(*cmx655_data), GFP_KERNEL);
+	if (!cmx655_data)
+		return -ENOMEM;
+
+	cmx655_data->regmap = devm_regmap_init_spi(spi, &cmx655_regmap);
+	if (IS_ERR(cmx655_data->regmap))
+		return PTR_ERR(cmx655_data->regmap);
+	cmx655_data->irq = spi->irq;
+	// Use existing DAI data if found
+	if (cmx655_dai_data) {
+		memcpy(&cmx655_data->dai_data, cmx655_dai_data,
+		       sizeof(*cmx655_dai_data));
+	}
+	// Set-up value following the codec reset that will happen in a bit
+	cmx655_data->dai_data.enabled_streams = 0;
+	cmx655_data->dai_data.best_clk_running = false;
+	// Extract data from Device tree
+	if (spi->dev.of_node) {
+		ret = cmx655_parse_data_from_of(spi->dev.of_node, cmx655_data);
+		if (ret < 0) {
+			dev_err(&spi->dev,
+				"Failed to extract data from device tree%d\n",
+				ret);
+			return ret;
+		}
+	}
+	// Find gpios
+	// Reset
+	// Find and set low
+	cmx655_data->reset_gpio = devm_gpiod_get_optional(&spi->dev,
+							  "reset",
+							  GPIOD_OUT_LOW);
+	// Reset codec
+	if (cmx655_data->reset_gpio) {
+		// Hold reset line
+		gpiod_set_value_cansleep(cmx655_data->reset_gpio, 1);
+		// Time of reset pulse must be greater than 1us
+		// sleep for 10us to 1ms, speed is not critical here
+		usleep_range(10, 1000);
+		// release reset line
+		gpiod_set_value_cansleep(cmx655_data->reset_gpio, 0);
+	} else {
+		dev_dbg(&spi->dev, "No reset GPIO, using reset command\n");
+		regmap_write(cmx655_data->regmap, CMX655_COMMAND,
+			     CMX655_CMD_SOFT_RESET);
+	}
+	spi_set_drvdata(spi, cmx655_data);
+
+	// Register codec component
+	ret = cmx655_common_register_component(&spi->dev);
+
+	if (ret < 0) {
+		dev_err(&spi->dev,
+			"%s: Register component failed %d\n", __func__, ret);
+	}
+
+	return ret;
+};
+
+/*
+ * SPI device removal stage used by spi driver
+ */
+static void cmx655_spi_remove(struct spi_device *spi)
+{
+	struct cmx655_data *cmx655_data = spi_get_drvdata(spi);
+	// put codec into reset in GPIO given
+	gpiod_set_value_cansleep(cmx655_data->reset_gpio, 1);
+	// unregister codec
+	cmx655_common_unregister_component(&spi->dev);
+};
+
+static const struct spi_device_id cmx655_device_id[] = {
+	{ "cmx655" },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(spi, cmx655_device_id);
+/*
+ * Define Open Firmware (OF) match table. Supportr for device tree
+ */
+static const struct of_device_id cmx655_of_match[] = {
+	{.compatible = "cml,cmx655d" },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(of, cmx655_of_match);
+
+/*
+ * Define spi driver struct
+ */
+static struct spi_driver cmx655_spi_driver = {
+	.probe = cmx655_spi_probe,
+	.remove = cmx655_spi_remove,
+	.driver = {
+		   .name = "cmx655",
+		   .of_match_table = cmx655_of_match,
+		    },
+	.id_table = cmx655_device_id
+};
+
+module_spi_driver(cmx655_spi_driver);
+
+/* +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ * End if SPI define
+ * +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ */
+
+/* +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ * Module info
+ * +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ */
+MODULE_DESCRIPTION("ASoC CMX655 driver, SPI adapter");
+MODULE_AUTHOR("CML");
+MODULE_LICENSE("GPL");
-- 
2.45.2

