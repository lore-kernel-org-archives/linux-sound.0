Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9680175A79
	for <linux-sound@vger.kernel.org>; Mon,  1 Jun 2026 01:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780279164; cv=none; b=XYo8OEH8xeU2ONah5L/N3xrBRmU8DbEywWvweZ1nKaZpMRiUAVMoR0Wcww89slkvhLnNjynL6NRtQUi0SOZbWsDVCCCbvPWfni9UkM9LzSXEQ5Cf0Wp8TTZLxRMhsydigVtYXN+SMpcQN8sRa9ojlLQSQi4ds5DwBSzJNGYDOLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780279164; c=relaxed/simple;
	bh=03BvygSOC8DjFHkGwz73/sJEtL0JQ8W55aJrZA0OaAs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nmyar47BGcZiGzVi9Ca0Kr30mrwbEFB0NXq8cP7Jok3nKEs9tkM2JpG9UFnHSqJmHLZ38SLxdvWmIhKKwA1CM4RZg5WZtvPcgM6bHMeQw3MxJ4t0ZJqVEt0D2Gi+ozznytcklwcHi4rxHDnz02aY3rtkNvEDVz1MtZFMcelmYWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PshVI4w0; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PshVI4w0"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-304545f5206so13305582eec.0
        for <linux-sound@vger.kernel.org>; Sun, 31 May 2026 18:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780279162; x=1780883962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mFUceQxD5y95ftKb10VP5umDLnod9a60+EGCwRKENio=;
        b=PshVI4w05F8TflzYqtyRAK85miC7Pt6IhSpiibQTjTRMs7PXTedGGJE/0gIJdk/4p1
         3TCypE21oFYDgz1Lb3v5jENoPrNegohAuiK+KUWDi3ojYy9jj4u0En5IUjuS4VrihybS
         NTF78FZ4AUJuZsd4ZkBfichHDeDguO4grbSQIgT2D4Zhoqe1tqkiW9S2TO5tflCjwTNA
         iJwSOCfQ5b4lxJA5m51kPGtATxadswUxhDXTaspjT9g3untOTARL6kDHyrPotbVxCi3l
         EIK0vm1s9Pf3+Wr/bDBRWQ8lJScdcDSwu0Z+gw7ECLIqhjDA9Rim7Wy84pMuArZLgQv1
         zqoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780279162; x=1780883962;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mFUceQxD5y95ftKb10VP5umDLnod9a60+EGCwRKENio=;
        b=ZYI+6Y/9ldfNtwp/VI3LOmGOcrQF/5twIRXCVKVPtlWBlosuWfbzJ2HxX6WTGamPDx
         fjiX9jcWh90p3G3BfjdVh3cUSshljy4Ro05FphsOQ38c0rNGhkJBPQ9l3cvBjC30riJ8
         ID2RAGb5bDfyIhqRjmWrPMcFuYwLR5AZY+un0I7hb4+i75yQwnWS7z9c7bBSWKAx9g/v
         3Xqaz/BN2cHpU3q8x1QmUgrLHlTdTaON+tM/n3U+qChh/2+mqa2emMylJt9akViCdAcW
         4thO/xlKMP+CVIeaFkX2xoM6Cs+nD2d72rJa8SpSUh4MT8buAEajw9tfTSnROO2n+/O1
         BH6A==
X-Gm-Message-State: AOJu0YzeFWmfAN1RjpA0yDvQuxAteQLq0GSQhNM9QxlU7yzvrweSom/y
	5KrDzuRwrQXqUmv3Pxc1n7URpfcoI2ozSt0LScvofH4dyQq3mvpXyOgGOMuWtq1I8nmyAupg
X-Gm-Gg: Acq92OFPzQKY1BBRVYdzpOBjZMis36MyLBj67Fn+6Bb3AesRFLmXR5X9TZD8N2z+Lik
	9sm6C3t+7wtr54obXaB4gUgfTN6/wmIHyXHRhlWWR4NdPUYk9C6fBQoioRph8/ZT17EfKplhKkD
	eZ7diNQCCTYVuW6Qez6LCiuMGZjuAiZniQY95alPi6ttx49qHhx6+M8+JMHJPpTlOW7F/9LX2Bn
	4ViF+PGZLvFhEe+9P3Hm/CX1t5zd1SX++ZbE21qOE+OTjyAD43nJh5l8tAIXm78TFZs4GmLir0B
	umkVRUv/dvHRv6+pRHT5HbICWGrT/s5mnodapu1puYH2qZmj5Vwjp2/FT2YSGEPgWbIBr8/i/3l
	jACTB9kuefJJhdpGE+vtYb+vn5DOqxj0BmE1ng5Zxi40Jm8VSxHGI0m538j26HTPL7hHG8S94xQ
	AAScwea2PR1NJ+Eta6U8vhHntu/TJ8Tx0/CdDzPAGkN0mJCPhVZFkPeaiw
X-Received: by 2002:a05:7300:8605:b0:2dd:6937:79d5 with SMTP id 5a478bee46e88-304fa4c7c24mr4477449eec.8.1780279161714;
        Sun, 31 May 2026 18:59:21 -0700 (PDT)
Received: from DeathStar (c-98-224-79-207.hsd1.ca.comcast.net. [98.224.79.207])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed2efb4esm7815521eec.8.2026.05.31.18.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 18:59:21 -0700 (PDT)
From: Ferus Castor <castor.ferus@gmail.com>
X-Google-Original-From: Ferus Castor <feruscastor@proton.me>
To: linux-sound@vger.kernel.org
Cc: clemens@ladisch.de,
	tiwai@suse.com,
	Ferus Castor <feruscastor@proton.me>
Subject: [PATCH] ALSA: oxygen: add HT-Omega eClaro (7284:9783) support
Date: Sun, 31 May 2026 18:58:48 -0700
Message-ID: <20260601015848.128566-1-feruscastor@proton.me>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HT-Omega eClaro is a PCI sound card built on the C-Media CMI8788
(Oxygen HD) controller, with PCI subsystem ID 7284:9783.

Output hardware:
 - AK4396VF stereo DAC: front L/R output, connected via SPI CE0
 - CS4362A 6-channel DAC: surround, center/LFE, and side outputs,
   connected via SPI CE1 with a 3-byte [0x30, reg, val] frame

The CS4362A uses inverse attenuation encoding (0 = 0 dB, 127 = max
attenuation) and a 0.5 dB/step logarithmic scale. Volume TLV is set
to TLV_DB_SCALE(-6350, 50, 0) to match the hardware. The channel-to-
register mapping was verified by listening test:
 - Pair 1 (regs 7/8):   side L/R   (ALSA channels 6/7)
 - Pair 2 (regs 10/11): center/LFE (ALSA channels 4/5)
 - Pair 3 (regs 13/14): rear L/R   (ALSA channels 2/3)

Input hardware:
 - CS5361 stereo ADC: Line In and Mic In capture

GPIO assignments:
 - GPIO 0 (0x0001): CS4362A RESET# (active-low, driven high)
 - GPIO 2/3:        CS5361 M0/M1 (sample rate mode)
 - GPIO 5 (0x0020): front output stage enable (driven high)
 - GPIO 8 (0x0100): headphone amplifier enable

Signed-off-by: Ferus Castor <feruscastor@proton.me>
Assisted-by: Claude:claude-sonnet-4-6
---
 sound/pci/oxygen/oxygen.c | 270 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 264 insertions(+), 6 deletions(-)

diff --git a/sound/pci/oxygen/oxygen.c b/sound/pci/oxygen/oxygen.c
index e6f869cf8ca2..a4212b2558ee 100644
--- a/sound/pci/oxygen/oxygen.c
+++ b/sound/pci/oxygen/oxygen.c
@@ -25,6 +25,11 @@
  *   GPIO 6 -> S/PDIF from optical (0) or coaxial (1) input
  *   GPIO 8 -> enable headphone amplifier
  *
+ * eClaro model:
+ *   GPIO 2 -> M0 of CS5361
+ *   GPIO 3 -> M1 of CS5361
+ *   GPIO 8 -> enable headphone amplifier
+ *
  * CM9780:
  *
  *   LINE_OUT -> input of ADC
@@ -51,6 +56,7 @@
 #include "oxygen.h"
 #include "xonar_dg.h"
 #include "ak4396.h"
+#include "cs4362a.h"
 #include "wm8785.h"
 
 MODULE_AUTHOR("Clemens Ladisch <clemens@ladisch.de>");
@@ -74,6 +80,7 @@ enum {
 	MODEL_MERIDIAN_2G,
 	MODEL_CLARO,
 	MODEL_CLARO_HALO,
+	MODEL_ECLARO,
 	MODEL_FANTASIA,
 	MODEL_SERENADE,
 	MODEL_2CH_OUTPUT,
@@ -113,6 +120,8 @@ static const struct pci_device_id oxygen_ids[] = {
 	{ OXYGEN_PCI_SUBID(0x7284, 0x9761), .driver_data = MODEL_CLARO },
 	/* HT-Omega Claro halo */
 	{ OXYGEN_PCI_SUBID(0x7284, 0x9781), .driver_data = MODEL_CLARO_HALO },
+	/* HT-Omega eClaro */
+	{ OXYGEN_PCI_SUBID(0x7284, 0x9783), .driver_data = MODEL_ECLARO },
 	{ }
 };
 MODULE_DEVICE_TABLE(pci, oxygen_ids);
@@ -130,27 +139,35 @@ MODULE_DEVICE_TABLE(pci, oxygen_ids);
 #define GPIO_CLARO_DIG_COAX	0x0040
 #define GPIO_CLARO_HP		0x0100
 
+#define GPIO_ECLARO_CS4362A_NRESET	0x0001	/* GPIO 0: CS4362A RESET# (active-low) */
+#define GPIO_ECLARO_FRONT_ENABLE	0x0020	/* GPIO 5: front output stage enable */
+
+/* CS4362A SPI: 3-byte frame [0x30, reg, value] on CE1, 1280 ns/bit clock */
+#define ECLARO_CS4362A_SPI_CONTROL \
+	(OXYGEN_SPI_TRIGGER | OXYGEN_SPI_DATA_LENGTH_3 | \
+	 OXYGEN_SPI_CLOCK_1280 | (1 << OXYGEN_SPI_CODEC_SHIFT) | \
+	 OXYGEN_SPI_CEN_LATCH_CLOCK_HI)
+
 struct generic_data {
 	unsigned int dacs;
+	u8 spi_map[4];
+	u16 spi_prefix[4];
 	u8 ak4396_regs[4][5];
+	u8 cs4362a_regs[15];
 	u16 wm8785_regs[3];
 };
 
 static void ak4396_write(struct oxygen *chip, unsigned int codec,
 			 u8 reg, u8 value)
 {
-	/* maps ALSA channel pair number to SPI output */
-	static const u8 codec_spi_map[4] = {
-		0, 1, 2, 4
-	};
 	struct generic_data *data = chip->model_data;
 
 	oxygen_write_spi(chip, OXYGEN_SPI_TRIGGER |
 			 OXYGEN_SPI_DATA_LENGTH_2 |
 			 OXYGEN_SPI_CLOCK_160 |
-			 (codec_spi_map[codec] << OXYGEN_SPI_CODEC_SHIFT) |
+			 (data->spi_map[codec] << OXYGEN_SPI_CODEC_SHIFT) |
 			 OXYGEN_SPI_CEN_LATCH_CLOCK_HI,
-			 AK4396_WRITE | (reg << 8) | value);
+			 data->spi_prefix[codec] | (reg << 8) | value);
 	data->ak4396_regs[codec][reg] = value;
 }
 
@@ -163,6 +180,51 @@ static void ak4396_write_cached(struct oxygen *chip, unsigned int codec,
 		ak4396_write(chip, codec, reg, value);
 }
 
+static void eclaro_cs4362a_write(struct oxygen *chip, u8 reg, u8 value)
+{
+	struct generic_data *data = chip->model_data;
+	int err;
+
+	if (reg < ARRAY_SIZE(data->cs4362a_regs))
+		data->cs4362a_regs[reg] = value;
+
+	err = oxygen_write_spi(chip, ECLARO_CS4362A_SPI_CONTROL,
+			       (0x30u << 16) | ((u32)reg << 8) | value);
+	if (err)
+		dev_err(chip->card->dev,
+			"CS4362A SPI timeout: reg=0x%02x val=0x%02x\n",
+			reg, value);
+}
+
+static void eclaro_cs4362a_write_cached(struct oxygen *chip, u8 reg, u8 value)
+{
+	struct generic_data *data = chip->model_data;
+
+	if (value != data->cs4362a_regs[reg])
+		eclaro_cs4362a_write(chip, reg, value);
+}
+
+static void eclaro_cs4362a_registers_init(struct oxygen *chip)
+{
+	struct generic_data *data = chip->model_data;
+
+	eclaro_cs4362a_write(chip, 1, CS4362A_CPEN | CS4362A_PDN);
+	eclaro_cs4362a_write(chip, 2, CS4362A_DIF_LJUST);
+	eclaro_cs4362a_write(chip, 3, CS4362A_SOFT_RAMP | CS4362A_AMUTE);
+	eclaro_cs4362a_write(chip, 4, data->cs4362a_regs[4]);
+	eclaro_cs4362a_write(chip, 5, 0);
+	eclaro_cs4362a_write(chip, 6,  data->cs4362a_regs[6]);
+	eclaro_cs4362a_write(chip, 7,  data->cs4362a_regs[7]);
+	eclaro_cs4362a_write(chip, 8,  data->cs4362a_regs[8]);
+	eclaro_cs4362a_write(chip, 9,  data->cs4362a_regs[9]);
+	eclaro_cs4362a_write(chip, 10, data->cs4362a_regs[10]);
+	eclaro_cs4362a_write(chip, 11, data->cs4362a_regs[11]);
+	eclaro_cs4362a_write(chip, 12, data->cs4362a_regs[12]);
+	eclaro_cs4362a_write(chip, 13, data->cs4362a_regs[13]);
+	eclaro_cs4362a_write(chip, 14, data->cs4362a_regs[14]);
+	eclaro_cs4362a_write(chip, 1, CS4362A_CPEN);
+}
+
 static void wm8785_write(struct oxygen *chip, u8 reg, unsigned int value)
 {
 	struct generic_data *data = chip->model_data;
@@ -199,8 +261,13 @@ static void ak4396_registers_init(struct oxygen *chip)
 static void ak4396_init(struct oxygen *chip)
 {
 	struct generic_data *data = chip->model_data;
+	static const u8 default_spi_map[4] = { 0, 1, 2, 4 };
+	unsigned int i;
 
 	data->dacs = chip->model.dac_channels_pcm / 2;
+	memcpy(data->spi_map, default_spi_map, sizeof(default_spi_map));
+	for (i = 0; i < 4; ++i)
+		data->spi_prefix[i] = AK4396_WRITE;
 	data->ak4396_regs[0][AK4396_CONTROL_2] =
 		AK4396_SMUTE | AK4396_DEM_OFF | AK4396_DFS_NORMAL;
 	ak4396_registers_init(chip);
@@ -322,6 +389,102 @@ static void claro_resume(struct oxygen *chip)
 	claro_enable_hp(chip);
 }
 
+#define GPIO_CS5361_M_MASK	0x000c
+#define GPIO_CS5361_M_SINGLE	0x0000
+#define GPIO_CS5361_M_DOUBLE	0x0004
+#define GPIO_CS5361_M_QUAD	0x0008
+
+static void cs5361_init(struct oxygen *chip)
+{
+	oxygen_set_bits16(chip, OXYGEN_GPIO_CONTROL, GPIO_CS5361_M_MASK);
+	oxygen_write16_masked(chip, OXYGEN_GPIO_DATA,
+			      GPIO_CS5361_M_SINGLE, GPIO_CS5361_M_MASK);
+}
+
+static void set_cs5361_params(struct oxygen *chip,
+			      struct snd_pcm_hw_params *params)
+{
+	unsigned int value;
+
+	if (params_rate(params) <= 54000)
+		value = GPIO_CS5361_M_SINGLE;
+	else if (params_rate(params) <= 108000)
+		value = GPIO_CS5361_M_DOUBLE;
+	else
+		value = GPIO_CS5361_M_QUAD;
+	oxygen_write16_masked(chip, OXYGEN_GPIO_DATA,
+			      value, GPIO_CS5361_M_MASK);
+}
+
+static void eclaro_init(struct oxygen *chip)
+{
+	struct generic_data *data = chip->model_data;
+
+	oxygen_set_bits16(chip, OXYGEN_GPIO_CONTROL, GPIO_CLARO_DIG_COAX);
+	oxygen_clear_bits16(chip, OXYGEN_GPIO_DATA, GPIO_CLARO_DIG_COAX);
+
+	/* Single AK4396VF on SPI CE0/CA=00 handles front L/R */
+	data->dacs = 1;
+	data->spi_map[0] = 0;
+	data->spi_prefix[0] = AK4396_WRITE;
+	data->ak4396_regs[0][AK4396_CONTROL_2] =
+		AK4396_SMUTE | AK4396_DEM_OFF | AK4396_DFS_NORMAL;
+
+	ak4396_write(chip, 0, AK4396_CONTROL_1, AK4396_DIF_24_MSB | AK4396_ACKS);
+	ak4396_write(chip, 0, AK4396_CONTROL_2,
+		     data->ak4396_regs[0][AK4396_CONTROL_2]);
+	ak4396_write(chip, 0, AK4396_CONTROL_3, AK4396_PCM);
+	ak4396_write(chip, 0, AK4396_LCH_ATT, chip->dac_volume[0] * 2);
+	ak4396_write(chip, 0, AK4396_RCH_ATT, chip->dac_volume[1] * 2);
+	ak4396_write(chip, 0, AK4396_CONTROL_1, AK4396_DIF_24_MSB | AK4396_ACKS | AK4396_RSTN);
+
+	/* CS4362A (SPI CE1): surround/center-LFE/side L/R.
+	 * GPIO 0 (RESET#, active-low) and GPIO 5 (front output enable) must
+	 * be driven high. GPIOs 1 and 7 are outputs driven high.
+	 */
+	oxygen_set_bits16(chip, OXYGEN_GPIO_CONTROL, 0x00a3);
+	oxygen_set_bits16(chip, OXYGEN_GPIO_DATA, 0x00a3);
+	usleep_range(1000, 2000);
+
+	data->cs4362a_regs[4] = CS4362A_RMP_DN | CS4362A_DEM_NONE;
+	data->cs4362a_regs[6] = CS4362A_FM_SINGLE |
+				 CS4362A_ATAPI_B_R | CS4362A_ATAPI_A_L;
+	data->cs4362a_regs[7] = CS4362A_MUTE;
+	data->cs4362a_regs[9] = data->cs4362a_regs[6];
+	data->cs4362a_regs[12] = data->cs4362a_regs[6];
+
+	eclaro_cs4362a_registers_init(chip);
+
+	snd_component_add(chip->card, "AK4396");
+	snd_component_add(chip->card, "CS4362A");
+	cs5361_init(chip);
+	claro_enable_hp(chip);
+	snd_component_add(chip->card, "CS5361");
+}
+
+static void eclaro_resume(struct oxygen *chip)
+{
+	struct generic_data *data = chip->model_data;
+
+	oxygen_set_bits16(chip, OXYGEN_GPIO_CONTROL,
+			  GPIO_ECLARO_CS4362A_NRESET | GPIO_ECLARO_FRONT_ENABLE);
+	oxygen_set_bits16(chip, OXYGEN_GPIO_DATA,
+			  GPIO_ECLARO_CS4362A_NRESET | GPIO_ECLARO_FRONT_ENABLE);
+
+	/* AK4396 chip 0 */
+	ak4396_write(chip, 0, AK4396_CONTROL_1, AK4396_DIF_24_MSB | AK4396_ACKS | AK4396_RSTN);
+	ak4396_write(chip, 0, AK4396_CONTROL_2,
+		     data->ak4396_regs[0][AK4396_CONTROL_2]);
+	ak4396_write(chip, 0, AK4396_CONTROL_3, AK4396_PCM);
+	ak4396_write(chip, 0, AK4396_LCH_ATT, chip->dac_volume[0] * 2);
+	ak4396_write(chip, 0, AK4396_RCH_ATT, chip->dac_volume[1] * 2);
+
+	eclaro_cs4362a_registers_init(chip);
+
+	cs5361_init(chip);
+	claro_enable_hp(chip);
+}
+
 static void stereo_resume(struct oxygen *chip)
 {
 	ak4396_registers_init(chip);
@@ -355,6 +518,76 @@ static void set_ak4396_params(struct oxygen *chip,
 	}
 }
 
+static void eclaro_set_dac_params(struct oxygen *chip,
+				  struct snd_pcm_hw_params *params)
+{
+	struct generic_data *data = chip->model_data;
+	u8 ak_value, cs_fm;
+
+	ak_value = data->ak4396_regs[0][AK4396_CONTROL_2] & ~AK4396_DFS_MASK;
+	if (params_rate(params) <= 54000) {
+		ak_value |= AK4396_DFS_NORMAL;
+		cs_fm = CS4362A_FM_SINGLE;
+	} else if (params_rate(params) <= 108000) {
+		ak_value |= AK4396_DFS_DOUBLE;
+		cs_fm = CS4362A_FM_DOUBLE;
+	} else {
+		ak_value |= AK4396_DFS_QUAD;
+		cs_fm = CS4362A_FM_QUAD;
+	}
+
+	usleep_range(1000, 2000);
+
+	if (ak_value != data->ak4396_regs[0][AK4396_CONTROL_2]) {
+		ak4396_write(chip, 0, AK4396_CONTROL_1, AK4396_DIF_24_MSB | AK4396_ACKS);
+		ak4396_write(chip, 0, AK4396_CONTROL_2, ak_value);
+		ak4396_write(chip, 0, AK4396_CONTROL_1,
+			     AK4396_DIF_24_MSB | AK4396_ACKS | AK4396_RSTN);
+		data->ak4396_regs[0][AK4396_CONTROL_2] = ak_value;
+	}
+
+	/* Update CS4362A FM mode for all three DAC pairs */
+	cs_fm |= data->cs4362a_regs[6] & ~CS4362A_FM_MASK;
+	eclaro_cs4362a_write_cached(chip, 6, cs_fm);
+	eclaro_cs4362a_write_cached(chip, 12, cs_fm);
+	cs_fm &= CS4362A_FM_MASK;
+	cs_fm |= data->cs4362a_regs[9] & ~CS4362A_FM_MASK;
+	eclaro_cs4362a_write_cached(chip, 9, cs_fm);
+}
+
+static void update_eclaro_volume(struct oxygen *chip)
+{
+	u8 mute = chip->dac_mute ? CS4362A_MUTE : 0;
+
+	ak4396_write_cached(chip, 0, AK4396_LCH_ATT, chip->dac_volume[0] * 2);
+	ak4396_write_cached(chip, 0, AK4396_RCH_ATT, chip->dac_volume[1] * 2);
+
+	/* CS4362A attenuation is inverse: 0 = 0 dB, 127 = max attenuation.
+	 * Pair 1 (regs 7/8) is wired to the side outputs (ALSA ch 6/7);
+	 * pair 3 (regs 13/14) is wired to the rear outputs (ALSA ch 2/3).
+	 */
+	eclaro_cs4362a_write_cached(chip, 7,  mute | (127 - chip->dac_volume[6]));
+	eclaro_cs4362a_write_cached(chip, 8,  mute | (127 - chip->dac_volume[7]));
+	eclaro_cs4362a_write_cached(chip, 10, mute | (127 - chip->dac_volume[4]));
+	eclaro_cs4362a_write_cached(chip, 11, mute | (127 - chip->dac_volume[5]));
+	eclaro_cs4362a_write_cached(chip, 13, mute | (127 - chip->dac_volume[2]));
+	eclaro_cs4362a_write_cached(chip, 14, mute | (127 - chip->dac_volume[3]));
+}
+
+static void update_eclaro_mute(struct oxygen *chip)
+{
+	struct generic_data *data = chip->model_data;
+	u8 value;
+
+	value = data->ak4396_regs[0][AK4396_CONTROL_2] & ~AK4396_SMUTE;
+	if (chip->dac_mute)
+		value |= AK4396_SMUTE;
+	ak4396_write_cached(chip, 0, AK4396_CONTROL_2, value);
+
+	/* Re-apply volume+mute to CS4362A so the mute bit is set correctly */
+	update_eclaro_volume(chip);
+}
+
 static void update_ak4396_volume(struct oxygen *chip)
 {
 	struct generic_data *data = chip->model_data;
@@ -702,6 +935,8 @@ static void dump_oxygen_registers(struct oxygen *chip,
 }
 
 static const DECLARE_TLV_DB_LINEAR(ak4396_db_scale, TLV_DB_GAIN_MUTE, 0);
+/* CS4362A: 0.5 dB/step, raw=127 -> 0 dB, raw=0 -> -63.5 dB */
+static const DECLARE_TLV_DB_SCALE(eclaro_db_scale, -6350, 50, 0);
 
 static const struct oxygen_model model_generic = {
 	.shortname = "C-Media CMI8788",
@@ -745,6 +980,7 @@ static int get_oxygen_model(struct oxygen *chip,
 		[MODEL_MERIDIAN_2G]	= "AuzenTech X-Meridian 2G",
 		[MODEL_CLARO]		= "HT-Omega Claro",
 		[MODEL_CLARO_HALO]	= "HT-Omega Claro halo",
+		[MODEL_ECLARO]		= "HT-Omega eClaro",
 		[MODEL_FANTASIA]	= "TempoTec HiFier Fantasia",
 		[MODEL_SERENADE]	= "TempoTec HiFier Serenade",
 		[MODEL_HG2PCI]		= "CMI8787-HG2PCI",
@@ -788,6 +1024,28 @@ static int get_oxygen_model(struct oxygen *chip,
 					    CAPTURE_0_FROM_I2S_2 |
 					    CAPTURE_1_FROM_SPDIF;
 		break;
+	case MODEL_ECLARO:
+		chip->model.init = eclaro_init;
+		chip->model.mixer_init = generic_mixer_init;
+		chip->model.cleanup = claro_cleanup;
+		chip->model.suspend = claro_suspend;
+		chip->model.resume = eclaro_resume;
+		chip->model.set_dac_params = eclaro_set_dac_params;
+		chip->model.set_adc_params = set_cs5361_params;
+		chip->model.update_dac_volume = update_eclaro_volume;
+		chip->model.update_dac_mute = update_eclaro_mute;
+		chip->model.dump_registers = dump_ak4396_registers;
+		chip->model.device_config = PLAYBACK_0_TO_I2S |
+					    PLAYBACK_1_TO_SPDIF |
+					    CAPTURE_0_FROM_I2S_2 |
+					    CAPTURE_1_FROM_SPDIF;
+		chip->model.function_flags = OXYGEN_FUNCTION_SPI |
+					      OXYGEN_FUNCTION_ENABLE_SPI_4_5;
+		chip->model.dac_mclks = OXYGEN_MCLKS(256, 128, 128);
+		chip->model.dac_volume_min = 0;
+		chip->model.dac_volume_max = 127;
+		chip->model.dac_tlv = eclaro_db_scale;
+		break;
 	case MODEL_FANTASIA:
 	case MODEL_SERENADE:
 	case MODEL_2CH_OUTPUT:
-- 
2.53.0

