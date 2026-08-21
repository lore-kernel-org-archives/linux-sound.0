Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9B0381E9C
	for <linux-sound@vger.kernel.org>; Fri, 21 Aug 2026 04:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787287212; cv=none; b=AF/ilLY5MuiLX4CyV03wDdhDyivq5xEVEpxNS5Qdmy5yaDUqbsUgYqel1yBHt9S/HQc7iEJBHJ82DI6SSfgaee+pfzbR/ghseBgMZLLuQezeimMt5svxE0R3Tg08ufnIEhn1cKOclhUh1PABqkPzJGKO/ntSD67sZBqORhEUIzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787287212; c=relaxed/simple;
	bh=39ZyTOGOLUCIBOY1LGTX7M1Mz1/tw2r2BzD4vBcdKv4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Rd4OkqMDV1jt66v6JMpHjbfAtPXVitY5Aaw2YNvVH8RPMwc4HXoRqPh59CNb9pnXU++5fslwnPoNSQtrWToBqU91DWm75qoObZGOHNAH+Lfz/jTST032F0evobPdu8sKMfqL1AMHxdoXSenUKmEztIYbp5YoL//bBwpLQJHqwJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com; spf=pass smtp.mailfrom=asseily.com; dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b=ROTbsKKw; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asseily.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b="ROTbsKKw"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c160420289bso83291866b.0
        for <linux-sound@vger.kernel.org>; Thu, 20 Aug 2026 21:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asseily.com; s=google; t=1787287203; x=1787892003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yIEhqIPOBxMjxWWAh/uz9Co743TmyRSCRDw7X3v/c1Q=;
        b=ROTbsKKwi9Vfp/qOiAHcGVjtRiIs1rkM46kQBrYXYLr2XuWRhPfGLSG9LScT2b1/bz
         6x9kmyIP82vyH3UmYMxRB5URGBSkjt2arCGpFDkBc7wam2/kjHnYu4GRU9aDN/UZpmCJ
         v53MQb8Wz8l4meoE5Z96/Z7rAZcbwtSE+FfJmcaA3zQo5PK/0dLLJuz7jyxsdo05+akT
         ZejhQ8AG7fGAVqsK3T5IyNL7tOy1EJXrZ93w+8IF2//iheqHD4I/doVZXhFdL8lNX8Mw
         K+haGnP8j+CTuze0E9aOtUOcOMq7u8LCZ6InkFknczKfLtWGuKCtUsGYag0bXkpc6Brj
         lkFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787287203; x=1787892003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yIEhqIPOBxMjxWWAh/uz9Co743TmyRSCRDw7X3v/c1Q=;
        b=OTzvLlsa6qq7DfFiqznVc6tTktdzXtHPjZFMfNt3LG2kShkcGkYoT6WPQMgOAsm09T
         ebRTrom0TD48Jkn5+kcEsTpBT9a5PUFPGSCJZLjIBUFMxet/ZyuChhuVL+xsQ7AaSa8Y
         NOgMn53xsYbNQcGLTPVXoOk3MuJjdS8c6Kq3V2i5xFdgtB/GTD7ZN5vfyslnlGz+CBl+
         ysRFngXy6+SMwvMBCDq91tHFUlNaSHDaVRgQAglt3nFtVkMY6hf12lJQVUE9fOaKCfdz
         Dwp1Sq3sqAVPv8IJ1kxraF2GcTUdd6PSTSRWr7G93Ej7rbUEUZDbbaiix1hNbjpVfXhk
         pyPg==
X-Gm-Message-State: AOJu0Yzrt5i8TPf1zixkFxeF1+HKxw2+QV8DQxFhqPC5DjJzGQj56Vgt
	K15blknanEMx25l85w/VUXQQmRIlxa1sc3ZK3q2/4KT6CaTnMZd9z25yBHCHDd8pXc8=
X-Gm-Gg: AR+sD11GFk5uXTLKpmZbrZQzDa2X+e4+Ika5nZSmZ1dFQUKVsN346OmCgaoxBkUhCt0
	N1wmbseW80Iqd/4TvaTkewyKFu/czgA6FZR8POH3zSg2ItfuwzlqiFKZSFzeI17uX/uYc4++mm7
	lyoU3c7GmvoO6DPDpjeIv9XFVg4K75AkHixcqiSa+V/xIHos5UXIIv1TkwMv6UK/ZNmWISaEcgo
	jluLwNG4yCTAUlp/r5t2ssgiIlYVGLOi9R5OgH1/nbAigfhAO4LIn8M8xO1Vk0hK+rB0ocD+ok1
	E3lv4ADlSfoj8ES/J3Pj46y7XlhTDtp9wBnjcT/oQDaZeXNYD1GEV5+Duj3O7KYJFUGAOULNGrS
	Zk3nQWU2t0UWQ3qP3ME7bqx8xlSs69eQPwmV1IkVsbmcWcGUzLRTn8GaaoZC0evAYEt8Ve0FgFs
	nrqhGgmyRqlHchfosZVcqkxpHo0BSCJY+1h2Iq8lTJ/ABg9nlnYyx1b+RSKa8T93ztf58rWGCwx
	xA=
X-Received: by 2002:a17:906:5183:10b0:c16:84dc:9607 with SMTP id a640c23a62f3a-c246a704562mr279362466b.19.1787287202863;
        Thu, 20 Aug 2026 21:40:02 -0700 (PDT)
Received: from Behemoth.triland.local ([178.135.16.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2458b5d438sm268182266b.27.2026.08.20.21.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 21:40:02 -0700 (PDT)
From: Karl Asseily <karl@asseily.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Karl Asseily <karl@asseily.com>
Subject: [PATCH v2 3/4] ASoC: es9039q2m: add ESS Technology ES9039Q2M codec driver
Date: Fri, 21 Aug 2026 07:38:58 +0300
Message-Id: <20260821043859.171871-4-karl@asseily.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260821043859.171871-1-karl@asseily.com>
References: <20260821043859.171871-1-karl@asseily.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ES9039Q2M is a 32-bit two-channel audio DAC with an asynchronous
sample rate converter. It selects between two control personalities with
its MODE pin: hardware mode, strapped by HW0/HW1/HW2 with no control bus
at all, and software mode over I2C or SPI. This driver implements
software mode over I2C, which MODE = GND selects.

Three properties of the part shape the driver:

 - The ASRC in front of the DAC means MCLK need not be synchronous with
   BCLK or LRCK, so a board can feed it a fixed oscillator and never
   touch the clock again. The driver derives which case it is in rather
   than assuming one: the part runs synchronously when it drives the bus
   clocks itself, or when the MCLK it was given can be retuned to a
   multiple of the sample rate, and asynchronously only when a fixed
   oscillator feeds it as a clock consumer. The datasheet's MCLK floor
   differs between the two - 128 x Fs synchronous, 130 x Fs asynchronous
   - and where the clock is fixed a startup constraint derives the
   maximum rate from the MCLK actually present rather than advertising
   rates the hardware cannot honour.

 - Selecting an input format takes two registers, not one. Register 57
   INPUT_SEL chooses which port to listen to; register 1 SYS MODE CONFIG
   enables the corresponding decoder, and at reset only ENABLE_TDM_DECODE
   is set. Selecting DoP without also enabling ENABLE_DOP_DECODE leaves
   the part hunting for a marker with the marker decoder switched off, so
   it finds no valid DoP and mutes. The driver sets both.

 - Several registers have non-zero reserved defaults - register 88 reads
   0xb8 at reset - so every write is read-modify-write.

DoP is detected by the part rather than announced by the host:
AUTO_INPUT_SEL is enabled and both the TDM and DoP decoders run, so a
player can simply send DoP-encoded PCM. That is the only way DoP works in
practice, because no player can select a DAC mode through a kcontrol
first, and material sent to a part that is not looking for the marker
renders as the near-silent hiss the DoP design deliberately degrades to.

The programmable FIR coefficient controls are write-only by design. The
part has a PROG_COEFF_OUT register described as "Programmable FIR
coefficient readback", but it is not a RAM read port: it returns the last
coefficient written, whatever address is selected in PROG_COEFF_ADDR.
Measured by writing two different coefficients to addresses 0 and 1 and
reading them back five ways - plain, with a settle delay, with
PROG_COEFF_EN set, with the address written twice, and with a
write-enable pulse after the address. All ten reads returned the value
written to address 1. A get() built on that register would return
something with the shape of data and none of its meaning, so there is
none.

Every control was verified against the silicon rather than against the
driver's own read-back: written through ALSA, then read from the chip
over raw I2C. That covers the eight filter shapes, the modulator
bandwidth, the IIR bandwidth, the four signed 16-bit THD compensation
coefficients at both extremes of their range, and the automute enable,
time, level and off-level fields including the neighbouring
MUTE_RAMP_TO_GND bit that shares a register with the 11-bit time field.
The coefficient upload, whose RAM cannot be read back, was verified from
the I2C bus itself.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Karl Asseily <karl@asseily.com>
---

Notes:
    v2: address Mark Brown's review of v1
    - make the whole header block a C++ comment
    - ES9039_DECODE_MASK now covers S/PDIF. hw_params() uses it to enable one
      decoder and clear the rest, so omitting it left S/PDIF enabled alongside
      whichever decoder was selected
    - plain conditionals in place of "return ret ? ret : 1"
    - mute_stream() and the Master Playback Switch no longer both write
      ES9039_DAC_MUTE. Each records its intent and the register is written from
      the union, so neither can override the other
    - the DoP control returns -EBUSY while a stream is open rather than
      half-applying a change hw_params() will not re-run
    - the status controls use the symbolic source bits; TDM_VALID gained one
    - the harmonic correction controls keep their names. The TLV justification
      was wrong and is gone, but they cancel distortion rather than set a level
    - clocking, which was one mistake in three places. SND_SOC_DAIFMT_CBP_CFP is
      accepted and programs PCM_MASTER_MODE; clk_set_rate() pulls MCLK to
      256 * FS when the clock is settable; synchronous operation is derived
      rather than assumed; and the MCLK floor is 128 * FS synchronous or
      130 * FS asynchronous, not 130 unconditionally, so a synchronous board is
      no longer refused rates it can carry
    - fix the Clock Fault control, which read the byte above the status bit and
      so could never report a fault
    - hold both DoP bits consistent under a mutex, and use VOLUME_HOLD so the
      two channel volumes latch together

 sound/soc/codecs/Kconfig     |   14 +
 sound/soc/codecs/Makefile    |    2 +
 sound/soc/codecs/es9039q2m.c | 1621 ++++++++++++++++++++++++++++++++++
 3 files changed, 1637 insertions(+)
 create mode 100644 sound/soc/codecs/es9039q2m.c

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index f9a47e262a7..a5b9896f234 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -123,6 +123,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_ES8328_I2C
 	imply SND_SOC_ES8375
 	imply SND_SOC_ES8389
+	imply SND_SOC_ES9039Q2M
 	imply SND_SOC_ES9356
 	imply SND_SOC_ES7134
 	imply SND_SOC_ES7241
@@ -1315,6 +1316,19 @@ config SND_SOC_ES8389
 	tristate "Everest Semi ES8389 CODEC"
 	depends on I2C
 
+config SND_SOC_ES9039Q2M
+	tristate "ESS Technology ES9039Q2M CODEC"
+	depends on I2C
+	select REGMAP_I2C
+	help
+	  Enable support for the ESS Technology ES9039Q2M, a 32-bit
+	  two-channel audio DAC with an asynchronous sample rate converter,
+	  supporting PCM, DSD, DoP and S/PDIF input. This driver covers the
+	  I2C control interface, which the MODE pin selects.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called snd-soc-es9039q2m.
+
 config SND_SOC_ES9356
 	tristate "Everest Semi ES9356 CODEC SDW"
 	depends on SND_SOC_SDCA
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 3d122ace75a..3c83a4a1577 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -140,6 +140,7 @@ snd-soc-es8328-i2c-y := es8328-i2c.o
 snd-soc-es8328-spi-y := es8328-spi.o
 snd-soc-es8375-y := es8375.o
 snd-soc-es8389-y := es8389.o
+snd-soc-es9039q2m-y := es9039q2m.o
 snd-soc-es9356-y := es9356.o
 snd-soc-framer-y := framer-codec.o
 snd-soc-fs-amp-lib-y := fs-amp-lib.o
@@ -584,6 +585,7 @@ obj-$(CONFIG_SND_SOC_ES8328_I2C)+= snd-soc-es8328-i2c.o
 obj-$(CONFIG_SND_SOC_ES8328_SPI)+= snd-soc-es8328-spi.o
 obj-$(CONFIG_SND_SOC_ES8375)    += snd-soc-es8375.o
 obj-$(CONFIG_SND_SOC_ES8389)    += snd-soc-es8389.o
+obj-$(CONFIG_SND_SOC_ES9039Q2M)	+= snd-soc-es9039q2m.o
 obj-$(CONFIG_SND_SOC_ES9356)    += snd-soc-es9356.o
 obj-$(CONFIG_SND_SOC_FRAMER)	+= snd-soc-framer.o
 obj-$(CONFIG_SND_SOC_FS_AMP_LIB)+= snd-soc-fs-amp-lib.o
diff --git a/sound/soc/codecs/es9039q2m.c b/sound/soc/codecs/es9039q2m.c
new file mode 100644
index 00000000000..bd09e230f9a
--- /dev/null
+++ b/sound/soc/codecs/es9039q2m.c
@@ -0,0 +1,1621 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// ESS Technology ES9039Q2M 32-bit 2-channel audio DAC
+//
+// Copyright (C) 2026 Karl Asseily <karl@asseily.com>
+//
+// Every register number, bit field and default in this file was taken from
+// ES9039Q2M datasheet v0.2.3 and then verified by reading the defaults back off
+// a live part over I2C.
+//
+// The part has two control personalities selected by the MODE pin: hardware
+// mode (strapped by HW0/HW1/HW2, no bus at all) and software mode (I2C or SPI).
+// This driver implements software mode over I2C, which MODE = GND selects.
+//
+// Three properties shape the driver:
+//
+//  - There is an ASRC in front of the DAC, so MCLK need not be synchronous with
+//    BCLK or LRCK. A board may feed it a fixed oscillator, or may run it
+//    synchronously and let the part generate BCLK and WS; both are supported.
+//
+//  - INPUT_SEL chooses PCM / DSD / DoP / S/PDIF. It does NOT choose I2S vs
+//    left-justified - that is TDM_LJ_MODE in register 60, and there is no
+//    right-justified mode to map onto at all.
+//
+//  - Several registers have non-zero reserved defaults (register 88 reads
+//    0xb8 at reset), so every write here is read-modify-write.
+
+#include <linux/bitfield.h>
+#include <linux/cleanup.h>
+#include <linux/clk.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/regmap.h>
+
+#include <sound/control.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/tlv.h>
+
+/* ------------------------------------------------- read/write registers ---- */
+
+#define ES9039_SYSTEM_CONFIG		0x00	/* reg 0 */
+#define   ES9039_64FS_MODE		BIT(6)
+
+/*
+ * Register 1 selects which DECODERS are running, and it is separate from
+ * INPUT_SEL in register 57, which only says which port to listen to. Both are
+ * needed: on reset only ENABLE_TDM_DECODE is set, so selecting DoP as the input
+ * while leaving bit 2 clear leaves the part hunting for a marker with the
+ * marker decoder switched off. It then finds no valid DoP and mutes - silence,
+ * DOP_VALID reading 0, and nothing anywhere saying why. Measured on B1,
+ * 2026-08-19.
+ */
+#define ES9039_SYS_MODE			0x01	/* reg 1, reset 0xb1 */
+#define   ES9039_ENABLE_TDM_DECODE	BIT(0)	/* set at reset */
+#define   ES9039_ENABLE_DSD_DECODE	BIT(1)
+#define   ES9039_ENABLE_DOP_DECODE	BIT(2)
+#define   ES9039_ENABLE_SPDIF_DECODE	BIT(3)
+#define   ES9039_SYNC_MODE		BIT(6)	/* 0 = ASYNC, which DATUM uses */
+#define   ES9039_ENABLE_DAC_CLK		BIT(7)	/* set at reset */
+/*
+ * Every decoder the part has. hw_params() enables one of these and clears the
+ * rest, so leaving S/PDIF out of the mask would have left its decoder running
+ * alongside the selected one.
+ */
+#define   ES9039_DECODE_MASK		(ES9039_ENABLE_TDM_DECODE | \
+					 ES9039_ENABLE_DSD_DECODE | \
+					 ES9039_ENABLE_DOP_DECODE | \
+					 ES9039_ENABLE_SPDIF_DECODE)
+
+#define ES9039_AUTO_FS_DETECT		0x03	/* reg 3 */
+#define   ES9039_AUTO_FS_DETECT_EN	BIT(7)
+
+#define ES9039_CLOCK_CONFIG		0x04	/* reg 4, MASTER_BCK_DIV */
+
+#define ES9039_INPUT_SEL		0x39	/* reg 57 */
+#define   ES9039_AUTO_INPUT_SEL		BIT(0)
+#define   ES9039_INPUT_SEL_MASK		GENMASK(2, 1)
+#define     ES9039_INPUT_PCM		0x0
+#define     ES9039_INPUT_DSD		0x1
+#define     ES9039_INPUT_DOP		0x2
+#define     ES9039_INPUT_SPDIF		0x3
+#define   ES9039_PCM_MASTER_MODE	BIT(4)
+#define   ES9039_DSD_MASTER_MODE	BIT(5)
+#define   ES9039_DSD_FAULT_DETECT	BIT(6)	/* set at reset */
+
+#define ES9039_MASTER_ENC		0x3a	/* reg 58 */
+#define   ES9039_BCK_INV		BIT(6)
+
+#define ES9039_TDM_CH_NUM		0x3b	/* reg 59, slots = value + 1 */
+#define   ES9039_TDM_CH_NUM_MASK	GENMASK(4, 0)
+
+#define ES9039_TDM_CONFIG1		0x3c	/* reg 60 */
+#define   ES9039_TDM_VALID_EDGE		BIT(6)
+#define   ES9039_TDM_LJ_MODE		BIT(7)	/* 0 = standard I2S */
+
+#define ES9039_TDM_CONFIG2		0x3d	/* reg 61 */
+#define   ES9039_TDM_BIT_WIDTH_MASK	GENMASK(6, 5)
+#define     ES9039_WIDTH_32		0x0
+#define     ES9039_WIDTH_24		0x1
+#define     ES9039_WIDTH_16		0x2
+
+#define ES9039_MONITOR_CFG		0x3e	/* reg 62 */
+#define   ES9039_DISABLE_PCM_DC		BIT(3)
+#define   ES9039_ENABLE_BCK_MONITOR	BIT(4)	/* set at reset */
+#define   ES9039_ENABLE_WS_MONITOR	BIT(5)	/* set at reset */
+#define   ES9039_DISABLE_DSD_MUTE	BIT(6)
+#define   ES9039_DISABLE_DSD_DC		BIT(7)
+
+#define ES9039_VOLUME_CH1		0x4a	/* reg 74, 0x00 = 0 dB */
+#define ES9039_VOLUME_CH2		0x4b	/* reg 75, 0xff = -127.5 dB */
+#define   ES9039_VOL_MAX		0xff
+
+#define ES9039_VOL_RATE_UP		0x52	/* reg 82 */
+#define ES9039_VOL_RATE_DOWN		0x53	/* reg 83 */
+
+#define ES9039_DAC_MUTE			0x56	/* reg 86, 1 = muted */
+#define   ES9039_MUTE_CH1		BIT(0)
+#define   ES9039_MUTE_CH2		BIT(1)
+#define   ES9039_MUTE_BOTH		(ES9039_MUTE_CH1 | ES9039_MUTE_CH2)
+
+#define ES9039_DAC_INVERT		0x57	/* reg 87 */
+
+#define ES9039_FILTER_SHAPE		0x58	/* reg 88, [7:3] reset to 10111 */
+#define   ES9039_FILTER_SHAPE_MASK	GENMASK(2, 0)
+#define     ES9039_FILTER_APODIZING	1	/* linear phase apodizing fast */
+
+#define ES9039_IIR_SPDIF		0x59	/* reg 89 */
+#define   ES9039_IIR_BW_MASK		GENMASK(2, 0)
+#define   ES9039_VOLUME_HOLD		BIT(3)
+#define   ES9039_SPDIF_SEL_MASK		GENMASK(7, 4)
+
+#define ES9039_DAC_PATH			0x5a	/* reg 90 */
+#define   ES9039_BYPASS_FIR2X		BIT(0)
+#define   ES9039_BYPASS_FIR4X		BIT(1)
+#define   ES9039_BYPASS_IIR		BIT(2)
+
+#define ES9039_THD_C2			0x5b	/* regs 91-94: CH1 lo, CH2 hi */
+#define ES9039_THD_C3			0x6b	/* regs 107-110 */
+
+#define ES9039_AUTOMUTE_EN		0x7b	/* reg 123, both set at reset */
+#define ES9039_AUTOMUTE_TIME		0x7c	/* regs 124-125 */
+#define   ES9039_AUTOMUTE_TIME_MASK	GENMASK(10, 0)
+#define   ES9039_MUTE_RAMP_TO_GND	BIT(11)	/* set at reset */
+#define ES9039_AUTOMUTE_LEVEL		0x7e	/* regs 126-127 */
+#define ES9039_AUTOMUTE_OFF_LEVEL	0x80	/* regs 128-129 */
+
+#define ES9039_SOFT_RAMP		0x82	/* reg 130, valid 0..12 */
+#define   ES9039_SOFT_RAMP_MASK		GENMASK(4, 0)
+#define   ES9039_SOFT_RAMP_MAX		12
+
+#define ES9039_NSMOD			0x83	/* reg 131 */
+#define   ES9039_NSMOD_WIDE_BW_MASK	GENMASK(4, 1)
+#define     ES9039_NSMOD_DEFAULT	0x4
+#define     ES9039_NSMOD_WIDE		0xc
+
+#define ES9039_PROG_RAM_CTRL		0x87	/* reg 135 */
+#define   ES9039_PROG_COEFF_EN		BIT(0)
+#define   ES9039_PROG_COEFF_WE		BIT(1)
+
+#define ES9039_PROG_RAM_ADDR		0x89	/* reg 137 */
+#define   ES9039_PROG_ADDR_MASK		GENMASK(6, 0)
+#define   ES9039_PROG_STAGE_4X		BIT(7)
+
+#define ES9039_PROG_RAM_DATA		0x8a	/* regs 138-140, 24-bit signed */
+
+#define ES9039_LAST_RW			0x8e	/* reg 145 */
+
+/* ----------------------------------------------------- readback registers -- */
+
+#define ES9039_READBACK_BASE		0xe0	/* reg 224 */
+
+#define ES9039_CHIP_ID			0xe1	/* reg 225 */
+#define   ES9039_CHIP_ID_ES9039Q2M	0x63
+
+#define ES9039_IRQ_SOURCES		0xea	/* regs 234-235, 16-bit */
+#define   ES9039_SRC_VOL_MIN_MASK	GENMASK(1, 0)
+#define   ES9039_SRC_AUTOMUTE_MASK	GENMASK(3, 2)
+#define   ES9039_SRC_SS_RAMP_MASK	GENMASK(5, 4)
+#define   ES9039_SRC_DOP_VALID		BIT(6)
+#define   ES9039_SRC_BCK_WS_FAIL	BIT(7)
+#define   ES9039_SRC_TDM_VALID		BIT(11)
+
+#define ES9039_AUTO_FS_READ		0xef	/* reg 239 */
+#define   ES9039_FS_DIV_MASK		GENMASK(5, 0)
+#define   ES9039_FS_HALF_DIV		BIT(6)
+#define   ES9039_FS_DIV_VALID		BIT(7)
+
+#define ES9039_AUTOMUTE_READ		0xf2	/* reg 242 */
+
+#define ES9039_INPUT_STREAM_READ	0xf5	/* reg 245 */
+#define   ES9039_RD_INPUT_SEL_MASK	GENMASK(1, 0)
+#define   ES9039_RD_DOP_VALID		BIT(2)
+#define   ES9039_RD_TDM_VALID		BIT(3)
+#define   ES9039_RD_SPDIF_VALID		BIT(4)
+
+#define ES9039_MAX_REGISTER		0xfb	/* reg 251 */
+
+/* Programmable oversampling FIR: 128 taps in the 2x stage, 32 in the 4x. */
+#define ES9039_FIR2X_TAPS		128
+#define ES9039_FIR4X_TAPS		32
+#define ES9039_COEFF_BYTES		3
+
+/* ------------------------------------------------------------------ private */
+
+struct es9039q2m_priv {
+	struct regmap *regmap;
+	struct clk *mclk;
+	unsigned int mclk_rate;
+	unsigned int fmt;
+	unsigned int stream_rate;	/* last rate from hw_params */
+	unsigned int bclk_ratio;	/* bit clocks per frame, 0 = unknown */
+
+	/*
+	 * Serialises dop_auto against hw_params(), which reads it while
+	 * deciding what to program. Without it a control write racing a
+	 * stream start can leave the two DoP registers disagreeing.
+	 */
+	struct mutex lock;
+	bool dop_auto;		/* let the part detect DoP itself */
+
+	/*
+	 * ES9039_DAC_MUTE has two owners and neither can hold it alone: the
+	 * "Master Playback Switch" control, and mute_stream() around stream
+	 * start and stop. Both record what they want here and the register is
+	 * written from the union, so a user unmute cannot un-mute a stopped
+	 * stream and a stream start cannot override a user mute.
+	 *
+	 * mute_stream starts FALSE and only a real mute_stream(1) sets it.
+	 * Starting it true seemed the safe choice - come up muted - but it is
+	 * not: if a card never reaches the DAI mute callbacks, the flag never
+	 * clears, and because the control now records intent rather than
+	 * writing the register there is nothing the user can do about it. The
+	 * DAC is then muted for ever and the mixer looks fine. Measured on
+	 * DATUM 2026-08-20: silent with the switch on, off, stream or no
+	 * stream. Pop suppression at probe comes from writing the register
+	 * directly instead, which is what the driver did before this rework
+	 * and is a state either owner may legitimately lift.
+	 */
+	unsigned int mute_user;	/* ES9039_MUTE_CH* the user asked for */
+	bool mute_stream;	/* ASoC has the stream muted */
+
+	bool provider;		/* part drives BCK and WS */
+	bool mclk_fixed;	/* MCLK rate cannot be changed, so ASRC it is */
+};
+
+/*
+ * Multi-byte fields are little-endian across ascending register addresses:
+ * register N holds bits [7:0], N+1 holds [15:8], and so on.
+ */
+static int es9039_read_le(struct regmap *map, unsigned int reg, int n, u32 *out)
+{
+	u8 buf[4];
+	int ret, i;
+
+	ret = regmap_bulk_read(map, reg, buf, n);
+	if (ret)
+		return ret;
+
+	*out = 0;
+	for (i = 0; i < n; i++)
+		*out |= (u32)buf[i] << (8 * i);
+
+	return 0;
+}
+
+static int es9039_write_le(struct regmap *map, unsigned int reg, int n, u32 val)
+{
+	u8 buf[4];
+	int i;
+
+	for (i = 0; i < n; i++)
+		buf[i] = (val >> (8 * i)) & 0xff;
+
+	return regmap_bulk_write(map, reg, buf, n);
+}
+
+/* ------------------------------------------------------------------ regmap */
+
+static bool es9039q2m_writeable_reg(struct device *dev, unsigned int reg)
+{
+	return reg <= ES9039_LAST_RW;
+}
+
+static bool es9039q2m_readable_reg(struct device *dev, unsigned int reg)
+{
+	return reg <= ES9039_LAST_RW || reg >= ES9039_READBACK_BASE;
+}
+
+static bool es9039q2m_volatile_reg(struct device *dev, unsigned int reg)
+{
+	return reg >= ES9039_READBACK_BASE;
+}
+
+static const struct regmap_config es9039q2m_regmap = {
+	.reg_bits	= 8,
+	.val_bits	= 8,
+	.max_register	= ES9039_MAX_REGISTER,
+	.writeable_reg	= es9039q2m_writeable_reg,
+	.readable_reg	= es9039q2m_readable_reg,
+	.volatile_reg	= es9039q2m_volatile_reg,
+	.cache_type	= REGCACHE_MAPLE,
+};
+
+/* --------------------------------------------------- signed 16-bit controls */
+
+struct es9039_s16_ctl {
+	unsigned int reg;
+	unsigned int shift;	/* 0 for CH1, 16 for CH2 within the 32-bit pair */
+};
+
+static int es9039_s16_info(struct snd_kcontrol *kcontrol,
+			   struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 1;
+	uinfo->value.integer.min = S16_MIN;
+	uinfo->value.integer.max = S16_MAX;
+	return 0;
+}
+
+static int es9039_s16_get(struct snd_kcontrol *kcontrol,
+			  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *c = snd_kcontrol_chip(kcontrol);
+	struct es9039q2m_priv *priv = snd_soc_component_get_drvdata(c);
+	struct es9039_s16_ctl *p = (void *)kcontrol->private_value;
+	u32 v;
+	int ret;
+
+	ret = es9039_read_le(priv->regmap, p->reg + (p->shift / 8), 2, &v);
+	if (ret)
+		return ret;
+
+	ucontrol->value.integer.value[0] = (s16)v;
+	return 0;
+}
+
+static int es9039_s16_put(struct snd_kcontrol *kcontrol,
+			  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *c = snd_kcontrol_chip(kcontrol);
+	struct es9039q2m_priv *priv = snd_soc_component_get_drvdata(c);
+	struct es9039_s16_ctl *p = (void *)kcontrol->private_value;
+	long v = ucontrol->value.integer.value[0];
+	u32 old;
+	int ret;
+
+	if (v < S16_MIN || v > S16_MAX)
+		return -EINVAL;
+
+	ret = es9039_read_le(priv->regmap, p->reg + (p->shift / 8), 2, &old);
+	if (ret)
+		return ret;
+
+	if ((s16)old == (s16)v)
+		return 0;
+
+	ret = es9039_write_le(priv->regmap, p->reg + (p->shift / 8), 2,
+			      (u16)v);
+	if (ret)
+		return ret;
+
+	return 1;
+}
+
+#define ES9039_S16(xname, xreg, xshift)					\
+{									\
+	.iface	= SNDRV_CTL_ELEM_IFACE_MIXER,				\
+	.name	= xname,						\
+	.info	= es9039_s16_info,					\
+	.get	= es9039_s16_get,					\
+	.put	= es9039_s16_put,					\
+	.private_value = (unsigned long)&(struct es9039_s16_ctl)	\
+			 { .reg = xreg, .shift = xshift },		\
+}
+
+/* ------------------------------------------------- multi-register integers */
+
+struct es9039_wide_ctl {
+	unsigned int reg;
+	unsigned int bytes;
+	unsigned int mask;
+	unsigned int max;
+};
+
+static int es9039_wide_info(struct snd_kcontrol *kcontrol,
+			    struct snd_ctl_elem_info *uinfo)
+{
+	struct es9039_wide_ctl *p = (void *)kcontrol->private_value;
+
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 1;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = p->max;
+	return 0;
+}
+
+static int es9039_wide_get(struct snd_kcontrol *kcontrol,
+			   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *c = snd_kcontrol_chip(kcontrol);
+	struct es9039q2m_priv *priv = snd_soc_component_get_drvdata(c);
+	struct es9039_wide_ctl *p = (void *)kcontrol->private_value;
+	u32 v;
+	int ret;
+
+	ret = es9039_read_le(priv->regmap, p->reg, p->bytes, &v);
+	if (ret)
+		return ret;
+
+	ucontrol->value.integer.value[0] = v & p->mask;
+	return 0;
+}
+
+static int es9039_wide_put(struct snd_kcontrol *kcontrol,
+			   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *c = snd_kcontrol_chip(kcontrol);
+	struct es9039q2m_priv *priv = snd_soc_component_get_drvdata(c);
+	struct es9039_wide_ctl *p = (void *)kcontrol->private_value;
+	long v = ucontrol->value.integer.value[0];
+	u32 old;
+	int ret;
+
+	if (v < 0 || v > p->max)
+		return -EINVAL;
+
+	ret = es9039_read_le(priv->regmap, p->reg, p->bytes, &old);
+	if (ret)
+		return ret;
+
+	if ((old & p->mask) == (u32)v)
+		return 0;
+
+	/* Preserve the bits outside the field - reg 124 carries MUTE_RAMP. */
+	ret = es9039_write_le(priv->regmap, p->reg, p->bytes,
+			      (old & ~p->mask) | (u32)v);
+	if (ret)
+		return ret;
+
+	return 1;
+}
+
+#define ES9039_WIDE(xname, xreg, xbytes, xmask, xmax)			\
+{									\
+	.iface	= SNDRV_CTL_ELEM_IFACE_MIXER,				\
+	.name	= xname,						\
+	.info	= es9039_wide_info,					\
+	.get	= es9039_wide_get,					\
+	.put	= es9039_wide_put,					\
+	.private_value = (unsigned long)&(struct es9039_wide_ctl)	\
+			 { .reg = xreg, .bytes = xbytes,		\
+			   .mask = xmask, .max = xmax },		\
+}
+
+/* ------------------------------------------------ programmable FIR upload --
+ *
+ * Write-only, deliberately. The chip has a PROG_COEFF_OUT register (248-246)
+ * described only as "Programmable FIR coefficient readback", but it is not a
+ * RAM read port: it returns the LAST COEFFICIENT WRITTEN, whatever address is
+ * selected in PROG_COEFF_ADDR. Measured on B1, 2026-08-19, over raw I2C with
+ * this driver out of the path - two different coefficients written to
+ * addresses 0 and 1, then read back with five different sequences (plain, with
+ * a settle delay, with PROG_COEFF_EN set, with the address written twice, and
+ * with a WE pulse after the address). All ten reads returned the value written
+ * to address 1.
+ *
+ * A get() built on that register would return something with the shape of data
+ * and none of its meaning, so there is no get(). If ESS documents a real
+ * readback sequence, add one - tools/es9039-coeff-probe.sh in the DATUM
+ * repository is the test it has to pass.
+ */
+
+/*
+ * Per-control data rides in our own struct with the soc_bytes_ext EMBEDDED,
+ * recovered by container_of. Not in soc_bytes_ext.dobj: that field belongs to
+ * the topology subsystem and only exists under CONFIG_SND_SOC_TOPOLOGY, so a
+ * driver stashing its own data there fails to build on any config without it.
+ */
+struct es9039_fir_ctl {
+	struct soc_bytes_ext be;
+	unsigned int taps;
+	bool stage_4x;
+};
+
+static int es9039_fir_put(struct snd_kcontrol *kcontrol,
+			  const unsigned int __user *bytes, unsigned int size)
+{
+	struct snd_soc_component *c = snd_kcontrol_chip(kcontrol);
+	struct es9039q2m_priv *priv = snd_soc_component_get_drvdata(c);
+	struct soc_bytes_ext *be = (void *)kcontrol->private_value;
+	struct es9039_fir_ctl *p = container_of(be, struct es9039_fir_ctl, be);
+	u8 *buf;
+	int ret, i;
+
+	if (size != p->taps * ES9039_COEFF_BYTES)
+		return -EINVAL;
+
+	buf = memdup_user(bytes, size);
+	if (IS_ERR(buf))
+		return PTR_ERR(buf);
+
+	/*
+	 * PROG_COEFF_WE is a per-coefficient strobe, not a gate held open
+	 * across the upload. The datasheet's sequence is address, data, raise
+	 * WE, lower WE, once per coefficient. Holding it high for the whole
+	 * loop also appears to work on ES9039Q2M silicon, but "appears to
+	 * work" is not a specification.
+	 */
+	for (i = 0; i < p->taps; i++) {
+		ret = regmap_write(priv->regmap, ES9039_PROG_RAM_ADDR,
+				   (p->stage_4x ? ES9039_PROG_STAGE_4X : 0) |
+				   FIELD_PREP(ES9039_PROG_ADDR_MASK, i));
+		if (ret)
+			goto out;
+
+		ret = regmap_bulk_write(priv->regmap, ES9039_PROG_RAM_DATA,
+					&buf[i * ES9039_COEFF_BYTES],
+					ES9039_COEFF_BYTES);
+		if (ret)
+			goto out;
+
+		ret = regmap_update_bits(priv->regmap, ES9039_PROG_RAM_CTRL,
+					 ES9039_PROG_COEFF_WE,
+					 ES9039_PROG_COEFF_WE);
+		if (ret)
+			goto out;
+
+		ret = regmap_update_bits(priv->regmap, ES9039_PROG_RAM_CTRL,
+					 ES9039_PROG_COEFF_WE, 0);
+		if (ret)
+			goto out;
+	}
+
+out:
+	regmap_update_bits(priv->regmap, ES9039_PROG_RAM_CTRL,
+			   ES9039_PROG_COEFF_WE, 0);
+	kfree(buf);
+	if (ret)
+		return ret;
+
+	return 1;
+}
+
+static struct es9039_fir_ctl es9039_fir2x = {
+	.be = { .max = ES9039_FIR2X_TAPS * ES9039_COEFF_BYTES,
+		.put = es9039_fir_put },
+	.taps = ES9039_FIR2X_TAPS,
+};
+
+static struct es9039_fir_ctl es9039_fir4x = {
+	.be = { .max = ES9039_FIR4X_TAPS * ES9039_COEFF_BYTES,
+		.put = es9039_fir_put },
+	.taps = ES9039_FIR4X_TAPS,
+	.stage_4x = true,
+};
+
+#define ES9039_FIR(xname, xctl)						\
+{									\
+	.iface	= SNDRV_CTL_ELEM_IFACE_MIXER,				\
+	.name	= xname,						\
+	.info	= snd_soc_bytes_info_ext,				\
+	.tlv.c	= snd_soc_bytes_tlv_callback,				\
+	.access	= SNDRV_CTL_ELEM_ACCESS_TLV_WRITE |			\
+		  SNDRV_CTL_ELEM_ACCESS_TLV_CALLBACK,			\
+	.private_value = (unsigned long)&(xctl).be,			\
+}
+
+/* ------------------------------------------------------- status (read-only) */
+
+struct es9039_stat_ctl {
+	unsigned int reg;
+	unsigned int mask;
+	unsigned int max;
+};
+
+static int es9039_stat_info(struct snd_kcontrol *kcontrol,
+			    struct snd_ctl_elem_info *uinfo)
+{
+	struct es9039_stat_ctl *p = (void *)kcontrol->private_value;
+
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 1;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = p->max;
+	return 0;
+}
+
+static int es9039_stat_get(struct snd_kcontrol *kcontrol,
+			   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *c = snd_kcontrol_chip(kcontrol);
+	struct es9039q2m_priv *priv = snd_soc_component_get_drvdata(c);
+	struct es9039_stat_ctl *p = (void *)kcontrol->private_value;
+	unsigned int v;
+	int ret;
+
+	ret = regmap_read(priv->regmap, p->reg, &v);
+	if (ret)
+		return ret;
+
+	ucontrol->value.integer.value[0] =
+		(v & p->mask) >> (ffs(p->mask) - 1);
+	return 0;
+}
+
+#define ES9039_STAT(xname, xreg, xmask, xmax)				\
+{									\
+	.iface	= SNDRV_CTL_ELEM_IFACE_MIXER,				\
+	.name	= xname,						\
+	.access	= SNDRV_CTL_ELEM_ACCESS_READ |				\
+		  SNDRV_CTL_ELEM_ACCESS_VOLATILE,			\
+	.info	= es9039_stat_info,					\
+	.get	= es9039_stat_get,					\
+	.private_value = (unsigned long)&(struct es9039_stat_ctl)	\
+			 { .reg = xreg, .mask = xmask, .max = xmax },	\
+}
+
+/*
+ * Detected sample rate.
+ *
+ * When the part's own rate detector has a valid ratio, use it - it is measured
+ * from the incoming frame clock and is the ground truth:
+ *
+ *   FS = Y * SYS_CLK / ((X + 1) * (128 >> 64FS_MODE))
+ *
+ * with X = IDAC_DIV_AUTO and Y = 2 when IDAC_HALF_DIV_AUTO reports a
+ * half-integer multiple.
+ *
+ * That detector is UNAVAILABLE on any board running the DAC asynchronously -
+ * register 3[7] AUTO_FS_DETECT carries the note "Cannot be used in ASYNC mode".
+ * A board feeding a free-running oscillator and letting the ASRC absorb the
+ * difference is precisely that case, and it is the preferable design, so the
+ * detector reading 0 there is expected rather than a fault. Fall back to the
+ * rate the stream was opened at, which is what a front panel wants to show.
+ * Reports 0 only when nothing is playing and the chip has no lock either.
+ */
+static int es9039_rate_info(struct snd_kcontrol *kcontrol,
+			    struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 1;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = 1536000;
+	return 0;
+}
+
+static int es9039_rate_get(struct snd_kcontrol *kcontrol,
+			   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *c = snd_kcontrol_chip(kcontrol);
+	struct es9039q2m_priv *priv = snd_soc_component_get_drvdata(c);
+	unsigned int fsreg, sysreg, div, y, den;
+	int ret;
+
+	ucontrol->value.integer.value[0] = priv->stream_rate;
+
+	if (!priv->mclk_rate)
+		return 0;
+
+	ret = regmap_read(priv->regmap, ES9039_AUTO_FS_READ, &fsreg);
+	if (ret)
+		return ret;
+
+	if (!(fsreg & ES9039_FS_DIV_VALID))
+		return 0;	/* async mode: keep the stream rate set above */
+
+	ret = regmap_read(priv->regmap, ES9039_SYSTEM_CONFIG, &sysreg);
+	if (ret)
+		return ret;
+
+	div = FIELD_GET(ES9039_FS_DIV_MASK, fsreg) + 1;
+	y   = (fsreg & ES9039_FS_HALF_DIV) ? 2 : 1;
+	den = div * ((sysreg & ES9039_64FS_MODE) ? 64 : 128);
+
+	ucontrol->value.integer.value[0] =
+		DIV_ROUND_CLOSEST(priv->mclk_rate * y, den);
+	return 0;
+}
+
+static const char * const es9039_stream_texts[] = {
+	"PCM", "DSD", "DoP", "S/PDIF",
+};
+
+static int es9039_stream_info(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_info *uinfo)
+{
+	return snd_ctl_enum_info(uinfo, 1, ARRAY_SIZE(es9039_stream_texts),
+				 es9039_stream_texts);
+}
+
+static int es9039_stream_get(struct snd_kcontrol *kcontrol,
+			     struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *c = snd_kcontrol_chip(kcontrol);
+	struct es9039q2m_priv *priv = snd_soc_component_get_drvdata(c);
+	unsigned int v;
+	int ret;
+
+	ret = regmap_read(priv->regmap, ES9039_INPUT_STREAM_READ, &v);
+	if (ret)
+		return ret;
+
+	ucontrol->value.enumerated.item[0] =
+		FIELD_GET(ES9039_RD_INPUT_SEL_MASK, v);
+	return 0;
+}
+
+/* ----------------------------------------------------------------- controls */
+
+static const DECLARE_TLV_DB_SCALE(es9039_vol_tlv, -12750, 50, 1);
+
+static const char * const es9039_filter_texts[] = {
+	"Minimum Phase",
+	"Linear Phase Apodizing Fast Roll-Off",
+	"Linear Phase Fast Roll-Off",
+	"Linear Phase Fast Roll-Off Low Ripple",
+	"Linear Phase Slow Roll-Off",
+	"Minimum Phase Fast Roll-Off",
+	"Minimum Phase Slow Roll-Off",
+	"Minimum Phase Slow Roll-Off Low Dispersion",
+};
+
+static SOC_ENUM_SINGLE_DECL(es9039_filter_enum, ES9039_FILTER_SHAPE, 0,
+			    es9039_filter_texts);
+
+/* IIR_BW is a multiple of the datapath bandwidth, not a frequency. */
+static const char * const es9039_iir_texts[] = {
+	"Reserved", "BW x8", "BW x4", "BW x2", "BW", "BW /2", "BW /4", "BW /8",
+};
+
+static SOC_ENUM_SINGLE_DECL(es9039_iir_enum, ES9039_IIR_SPDIF, 0,
+			    es9039_iir_texts);
+
+static const char * const es9039_nsmod_texts[] = {
+	"Default", "Wide Bandwidth",
+};
+
+static const unsigned int es9039_nsmod_values[] = {
+	ES9039_NSMOD_DEFAULT, ES9039_NSMOD_WIDE,
+};
+
+static SOC_VALUE_ENUM_SINGLE_DECL(es9039_nsmod_enum, ES9039_NSMOD, 1,
+				  GENMASK(3, 0), es9039_nsmod_texts,
+				  es9039_nsmod_values);
+
+static int es9039_dop_get(struct snd_kcontrol *kcontrol,
+			  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *c = snd_kcontrol_chip(kcontrol);
+	struct es9039q2m_priv *priv = snd_soc_component_get_drvdata(c);
+
+	ucontrol->value.integer.value[0] = priv->dop_auto;
+	return 0;
+}
+
+/*
+ * Automatic DoP detection is two bits in two registers, and they are one
+ * setting: AUTO_INPUT_SEL lets the part choose a decoder from the data, and
+ * ENABLE_DOP_DECODE is what gives it a DoP decoder to choose. Enabling the
+ * first without the second leaves the part hunting for a marker it has no
+ * decoder for, whereupon it finds no valid DoP and mutes.
+ *
+ * Everything that changes the setting goes through here, so the pair can
+ * never be written apart. Callers hold priv->lock.
+ */
+static int es9039_apply_dop(struct es9039q2m_priv *priv, bool on)
+{
+	int ret;
+
+	ret = regmap_update_bits(priv->regmap, ES9039_SYS_MODE,
+				 ES9039_ENABLE_DOP_DECODE,
+				 on ? ES9039_ENABLE_DOP_DECODE : 0);
+	if (ret)
+		return ret;
+
+	return regmap_update_bits(priv->regmap, ES9039_INPUT_SEL,
+				  ES9039_AUTO_INPUT_SEL,
+				  on ? ES9039_AUTO_INPUT_SEL : 0);
+}
+
+/* Caller holds priv->lock. */
+static int es9039_apply_mute(struct es9039q2m_priv *priv)
+{
+	unsigned int val = priv->mute_user;
+
+	if (priv->mute_stream)
+		val = ES9039_MUTE_BOTH;
+
+	return regmap_update_bits(priv->regmap, ES9039_DAC_MUTE,
+				  ES9039_MUTE_BOTH, val);
+}
+
+/*
+ * The control is inverted - 1 means playing - so a zero here is a mute
+ * request. It reports priv->mute_user rather than the register, because the
+ * register also carries the stream mute and the user did not ask for that.
+ */
+static int es9039_mute_get(struct snd_kcontrol *kcontrol,
+			   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *c = snd_kcontrol_chip(kcontrol);
+	struct es9039q2m_priv *priv = snd_soc_component_get_drvdata(c);
+
+	guard(mutex)(&priv->lock);
+
+	ucontrol->value.integer.value[0] = !(priv->mute_user & ES9039_MUTE_CH1);
+	ucontrol->value.integer.value[1] = !(priv->mute_user & ES9039_MUTE_CH2);
+
+	return 0;
+}
+
+static int es9039_mute_put(struct snd_kcontrol *kcontrol,
+			   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *c = snd_kcontrol_chip(kcontrol);
+	struct es9039q2m_priv *priv = snd_soc_component_get_drvdata(c);
+	unsigned int val = 0;
+	int ret;
+
+	if (!ucontrol->value.integer.value[0])
+		val |= ES9039_MUTE_CH1;
+	if (!ucontrol->value.integer.value[1])
+		val |= ES9039_MUTE_CH2;
+
+	guard(mutex)(&priv->lock);
+
+	if (val == priv->mute_user)
+		return 0;
+
+	priv->mute_user = val;
+
+	ret = es9039_apply_mute(priv);
+	if (ret)
+		return ret;
+
+	return 1;
+}
+
+static int es9039_dop_put(struct snd_kcontrol *kcontrol,
+			  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *c = snd_kcontrol_chip(kcontrol);
+	struct es9039q2m_priv *priv = snd_soc_component_get_drvdata(c);
+	bool on = !!ucontrol->value.integer.value[0];
+	int ret;
+
+	guard(mutex)(&priv->lock);
+
+	if (on == priv->dop_auto)
+		return 0;
+
+	/*
+	 * hw_params() programs the decoder and INPUT_SEL from dop_auto, so
+	 * changing it under a running stream would apply half the setting now
+	 * and the rest at the next open. Refuse instead of half-applying.
+	 */
+	if (priv->stream_rate)
+		return -EBUSY;
+
+	priv->dop_auto = on;
+
+	ret = es9039_apply_dop(priv, on);
+	if (ret)
+		return ret;
+
+	return 1;
+}
+
+/*
+ * The two channel volumes live in separate registers, so a stereo change is
+ * two I2C writes and the channels are briefly at different levels in between.
+ * VOLUME_HOLD exists for exactly this: while it is set the part accepts writes
+ * to registers 74-75 without applying them, and clearing it applies both at
+ * once. Raise it, let the generic handler do the writes, drop it again.
+ *
+ * It is dropped unconditionally, including on the error path, because a stuck
+ * VOLUME_HOLD would silently freeze the volume control.
+ */
+static int es9039_vol_put(struct snd_kcontrol *kcontrol,
+			  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *c = snd_kcontrol_chip(kcontrol);
+	struct es9039q2m_priv *priv = snd_soc_component_get_drvdata(c);
+	int ret;
+
+	ret = regmap_update_bits(priv->regmap, ES9039_IIR_SPDIF,
+				 ES9039_VOLUME_HOLD, ES9039_VOLUME_HOLD);
+	if (ret)
+		return ret;
+
+	ret = snd_soc_put_volsw(kcontrol, ucontrol);
+
+	regmap_update_bits(priv->regmap, ES9039_IIR_SPDIF,
+			   ES9039_VOLUME_HOLD, 0);
+
+	return ret;
+}
+
+static const struct snd_kcontrol_new es9039q2m_controls[] = {
+	/* --- level --- */
+	{
+		.iface	= SNDRV_CTL_ELEM_IFACE_MIXER,
+		.name	= "Master Playback Volume",
+		.access	= SNDRV_CTL_ELEM_ACCESS_READWRITE |
+			  SNDRV_CTL_ELEM_ACCESS_TLV_READ,
+		.info	= snd_soc_info_volsw,
+		.get	= snd_soc_get_volsw,
+		.put	= es9039_vol_put,
+		.tlv.p	= es9039_vol_tlv,
+		.private_value = SOC_DOUBLE_R_VALUE(ES9039_VOLUME_CH1,
+						    ES9039_VOLUME_CH2, 0, 0,
+						    ES9039_VOL_MAX, 1),
+	},
+	{
+		.iface	= SNDRV_CTL_ELEM_IFACE_MIXER,
+		.name	= "Master Playback Switch",
+		.info	= snd_soc_info_volsw,
+		.get	= es9039_mute_get,
+		.put	= es9039_mute_put,
+		.private_value = SOC_DOUBLE_VALUE(ES9039_DAC_MUTE, 0, 1, 0, 1,
+						  1, 0),
+	},
+	SOC_DOUBLE("DAC Invert Switch", ES9039_DAC_INVERT, 0, 1, 1, 0),
+	SOC_SINGLE("Volume Ramp Up Rate", ES9039_VOL_RATE_UP, 0, 255, 0),
+	SOC_SINGLE("Volume Ramp Down Rate", ES9039_VOL_RATE_DOWN, 0, 255, 0),
+	SOC_SINGLE("Soft Ramp Time", ES9039_SOFT_RAMP, 0,
+		   ES9039_SOFT_RAMP_MAX, 0),
+
+	/* --- reconstruction filter --- */
+	SOC_ENUM("Filter Shape", es9039_filter_enum),
+	SOC_ENUM("IIR Bandwidth", es9039_iir_enum),
+	SOC_ENUM("Modulator Bandwidth", es9039_nsmod_enum),
+	SOC_SINGLE("IIR Filter Bypass Switch", ES9039_DAC_PATH, 2, 1, 0),
+	SOC_SINGLE("FIR 2x Bypass Switch", ES9039_DAC_PATH, 0, 1, 0),
+	SOC_SINGLE("FIR 4x Bypass Switch", ES9039_DAC_PATH, 1, 1, 0),
+	SOC_SINGLE("Custom FIR Switch", ES9039_PROG_RAM_CTRL, 0, 1, 0),
+	ES9039_FIR("FIR 2x Coefficients", es9039_fir2x),
+	ES9039_FIR("FIR 4x Coefficients", es9039_fir4x),
+
+	/*
+	 * Not "... Volume", because these do not set a level. They are signed
+	 * correction coefficients for the second and third harmonic: they
+	 * cancel distortion the analogue stage adds, and turning one up does
+	 * not make anything louder. Useful values come from measuring a given
+	 * board's distortion on an analyser and solving for them; zero, the
+	 * reset value, is the only honest default until someone has.
+	 */
+	/* --- distortion compensation --- */
+	ES9039_S16("THD Compensation C2 CH1", ES9039_THD_C2, 0),
+	ES9039_S16("THD Compensation C2 CH2", ES9039_THD_C2, 16),
+	ES9039_S16("THD Compensation C3 CH1", ES9039_THD_C3, 0),
+	ES9039_S16("THD Compensation C3 CH2", ES9039_THD_C3, 16),
+
+	/* --- automute --- */
+	SOC_DOUBLE("Automute Switch", ES9039_AUTOMUTE_EN, 0, 1, 1, 0),
+	ES9039_WIDE("Automute Time", ES9039_AUTOMUTE_TIME, 2,
+		    ES9039_AUTOMUTE_TIME_MASK, 2047),
+	ES9039_WIDE("Automute Level", ES9039_AUTOMUTE_LEVEL, 2, 0xffff, 65535),
+	ES9039_WIDE("Automute Off Level", ES9039_AUTOMUTE_OFF_LEVEL, 2,
+		    0xffff, 65535),
+	SOC_SINGLE("Mute Ramp To Ground Switch", ES9039_AUTOMUTE_TIME + 1,
+		   3, 1, 0),
+	SOC_SINGLE("DSD DC Automute Switch", ES9039_MONITOR_CFG, 7, 1, 1),
+	SOC_SINGLE("DSD Mute Pattern Switch", ES9039_MONITOR_CFG, 6, 1, 1),
+	SOC_SINGLE("PCM DC Automute Switch", ES9039_MONITOR_CFG, 3, 1, 1),
+
+	/* --- stream --- */
+	/*
+	 * On by default. DoP is designed to be detected, not announced: the
+	 * player just sends it and a DoP-aware DAC notices the marker, which
+	 * is why a DAC that does not notice plays it as near-silence rather
+	 * than noise. Roon and every other player rely on that, and none of
+	 * them can reach into ALSA to flip a mode first.
+	 *
+	 * Left switchable because automatic detection is a pattern match, and
+	 * anyone worried about PCM material that happens to look like DoP can
+	 * turn it off and get strictly PCM.
+	 */
+	SOC_SINGLE_BOOL_EXT("DoP Auto Detect Switch", 0,
+			    es9039_dop_get, es9039_dop_put),
+
+	/* --- status, read-only --- */
+	ES9039_STAT("Automute Active CH1", ES9039_AUTOMUTE_READ, BIT(0), 1),
+	ES9039_STAT("Automute Active CH2", ES9039_AUTOMUTE_READ, BIT(1), 1),
+	ES9039_STAT("DoP Valid", ES9039_INPUT_STREAM_READ,
+		    ES9039_RD_DOP_VALID, 1),
+	ES9039_STAT("TDM Data Valid", ES9039_INPUT_STREAM_READ,
+		    ES9039_RD_TDM_VALID, 1),
+	ES9039_STAT("SPDIF Valid", ES9039_INPUT_STREAM_READ,
+		    ES9039_RD_SPDIF_VALID, 1),
+	/*
+	 * Register 235-234 is one 16-bit word and BCK_WS_FAIL_SOURCE is bit
+	 * 7 of it, so it sits in the low byte at ES9039_IRQ_SOURCES. This
+	 * read the byte above with the same mask, which is bit 15 - reserved
+	 * - so the control could never have reported a fault. The named
+	 * constant now carries the bit rather than a bare BIT(7).
+	 *
+	 * The flag is meaningful only with the BCK and WS monitors enabled,
+	 * which they are at reset and the driver leaves alone.
+	 */
+	ES9039_STAT("Clock Fault", ES9039_IRQ_SOURCES,
+		    ES9039_SRC_BCK_WS_FAIL, 1),
+	{
+		.iface	= SNDRV_CTL_ELEM_IFACE_MIXER,
+		.name	= "Detected Sample Rate",
+		.access	= SNDRV_CTL_ELEM_ACCESS_READ |
+			  SNDRV_CTL_ELEM_ACCESS_VOLATILE,
+		.info	= es9039_rate_info,
+		.get	= es9039_rate_get,
+	},
+	{
+		.iface	= SNDRV_CTL_ELEM_IFACE_MIXER,
+		.name	= "Detected Input Format",
+		.access	= SNDRV_CTL_ELEM_ACCESS_READ |
+			  SNDRV_CTL_ELEM_ACCESS_VOLATILE,
+		.info	= es9039_stream_info,
+		.get	= es9039_stream_get,
+	},
+};
+
+/* --------------------------------------------------------------------- DAPM */
+
+static const struct snd_soc_dapm_widget es9039q2m_widgets[] = {
+	SND_SOC_DAPM_DAC("DAC", NULL, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_OUTPUT("AOUTL"),
+	SND_SOC_DAPM_OUTPUT("AOUTR"),
+};
+
+static const struct snd_soc_dapm_route es9039q2m_routes[] = {
+	{ "DAC",   NULL, "Playback" },
+	{ "AOUTL", NULL, "DAC" },
+	{ "AOUTR", NULL, "DAC" },
+};
+
+/* ---------------------------------------------------------------------- DAI */
+
+/*
+ * Datasheet Table 7 note 1: the part needs MCLK >= 128 * FS running
+ * synchronously and >= 130 * FS running asynchronously. The gap is small but it
+ * is not academic - with a 24.576 MHz clock, 128 * FS puts 192 kHz exactly at
+ * the limit and 130 * FS puts the ceiling at 189 kHz, so which mode the board
+ * is in decides whether 192 kHz exists at all.
+ */
+#define ES9039_SYNC_MIN_MCLK_FS		128
+#define ES9039_ASYNC_MIN_MCLK_FS	130
+
+/*
+ * Synchronous means the frame clock and MCLK come from the same place. That is
+ * true when the part generates BCK and WS itself, and it is true when the MCLK
+ * we were given can be set to a multiple of the sample rate. Only a fixed
+ * oscillator feeding a consumer-mode part is genuinely asynchronous, and only
+ * then does the ASRC have anything to do.
+ */
+static bool es9039_is_sync(struct es9039q2m_priv *priv)
+{
+	return priv->provider || !priv->mclk_fixed;
+}
+
+static int es9039q2m_startup(struct snd_pcm_substream *substream,
+			     struct snd_soc_dai *dai)
+{
+	struct es9039q2m_priv *priv = snd_soc_component_get_drvdata(dai->component);
+	unsigned int max_rate;
+
+	/*
+	 * A clock whose rate can be set imposes no ceiling here: hw_params()
+	 * raises MCLK to suit the rate, and fails cleanly if it cannot.
+	 * Constraining from the rate MCLK merely happens to be idling at would
+	 * reject rates the board can carry perfectly well.
+	 */
+	if (!priv->mclk_rate || !priv->mclk_fixed)
+		return 0;
+
+	if (es9039_is_sync(priv))
+		max_rate = priv->mclk_rate / ES9039_SYNC_MIN_MCLK_FS;
+	else
+		max_rate = priv->mclk_rate / ES9039_ASYNC_MIN_MCLK_FS;
+
+	return snd_pcm_hw_constraint_minmax(substream->runtime,
+					    SNDRV_PCM_HW_PARAM_RATE,
+					    8000, max_rate);
+}
+
+/*
+ * Put the clocking where it needs to be for this rate, and tell the part which
+ * of its two timing worlds it is living in.
+ *
+ * With a settable MCLK the useful thing is to pull it to an exact multiple of
+ * the sample rate: the ASRC then has nothing to correct, which is the better
+ * arrangement whenever the board can manage it. With a fixed oscillator there
+ * is nothing to pull, and the ASRC earns its keep.
+ */
+static int es9039_setup_clocking(struct es9039q2m_priv *priv,
+				 struct snd_soc_dai *dai, unsigned int rate)
+{
+	unsigned int ratio, min_mult, div;
+	int ret;
+
+	if (!priv->mclk_rate)
+		return 0;
+
+	ratio = priv->bclk_ratio ? priv->bclk_ratio : 64;
+
+	if (!priv->mclk_fixed) {
+		/*
+		 * 256 * FS is the usual choice and clears both the 128 and 130
+		 * floors with room to spare. Take whatever the clock actually
+		 * settles on rather than assuming the request was honoured.
+		 */
+		ret = clk_set_rate(priv->mclk, 256 * rate);
+		if (ret)
+			return ret;
+
+		priv->mclk_rate = clk_get_rate(priv->mclk);
+	}
+
+	if (es9039_is_sync(priv))
+		min_mult = ES9039_SYNC_MIN_MCLK_FS;
+	else
+		min_mult = ES9039_ASYNC_MIN_MCLK_FS;
+
+	if (priv->mclk_rate < min_mult * rate) {
+		dev_err(dai->dev,
+			"mclk %u Hz is below the %u * %u Hz this mode needs\n",
+			priv->mclk_rate, min_mult, rate);
+		return -EINVAL;
+	}
+
+	ret = regmap_update_bits(priv->regmap, ES9039_SYS_MODE,
+				 ES9039_SYNC_MODE,
+				 es9039_is_sync(priv) ? ES9039_SYNC_MODE : 0);
+	if (ret)
+		return ret;
+
+	if (!priv->provider)
+		return 0;
+
+	/*
+	 * Register 4: BCK = MCLK / (MASTER_BCK_DIV + 1), and WS follows from
+	 * the frame length. An MCLK that is not a whole multiple of the bit
+	 * clock cannot produce the requested rate at all, so say so rather
+	 * than emitting something close.
+	 */
+	if (priv->mclk_rate % (ratio * rate)) {
+		dev_err(dai->dev,
+			"mclk %u Hz cannot produce %u * %u Hz bit clock\n",
+			priv->mclk_rate, ratio, rate);
+		return -EINVAL;
+	}
+
+	div = priv->mclk_rate / (ratio * rate);
+	if (div < 1 || div > 256) {
+		dev_err(dai->dev, "master bck divider %u out of range\n", div);
+		return -EINVAL;
+	}
+
+	return regmap_write(priv->regmap, ES9039_CLOCK_CONFIG, div - 1);
+}
+
+static int es9039q2m_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
+{
+	struct es9039q2m_priv *priv = snd_soc_component_get_drvdata(dai->component);
+	unsigned int cfg1 = 0, enc = 0;
+	int ret;
+
+	/*
+	 * Both directions are useful and which is right is a board decision,
+	 * not a driver one. Driving BCK and WS from a good MCLK is the
+	 * conventional arrangement and keeps everything synchronous; taking
+	 * them from a consumer-mode host and letting the ASRC absorb the
+	 * mismatch is what a board with a fixed oscillator wants. The part can
+	 * do either, so the driver offers either.
+	 */
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBC_CFC:
+		priv->provider = false;
+		break;
+	case SND_SOC_DAIFMT_CBP_CFP:
+		if (!priv->mclk)
+			return -EINVAL;
+		priv->provider = true;
+		break;
+	default:
+		/* The part cannot split them: it drives both or neither. */
+		return -EINVAL;
+	}
+
+	ret = regmap_update_bits(priv->regmap, ES9039_INPUT_SEL,
+				 ES9039_PCM_MASTER_MODE,
+				 priv->provider ? ES9039_PCM_MASTER_MODE : 0);
+	if (ret)
+		return ret;
+
+	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+	case SND_SOC_DAIFMT_I2S:
+		break;
+	case SND_SOC_DAIFMT_LEFT_J:
+		cfg1 |= ES9039_TDM_LJ_MODE;
+		break;
+	default:
+		/* Register 60 offers I2S or LJ. There is no RJ mode. */
+		return -EINVAL;
+	}
+
+	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
+	case SND_SOC_DAIFMT_NB_NF:
+		break;
+	case SND_SOC_DAIFMT_IB_NF:
+		enc |= ES9039_BCK_INV;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	ret = regmap_update_bits(priv->regmap, ES9039_TDM_CONFIG1,
+				 ES9039_TDM_LJ_MODE, cfg1);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(priv->regmap, ES9039_MASTER_ENC,
+				 ES9039_BCK_INV, enc);
+	if (ret)
+		return ret;
+
+	priv->fmt = fmt;
+	return 0;
+}
+
+/*
+ * TDM_BIT_WIDTH describes the SLOT width on the wire, not the sample size. Those
+ * are routinely different: 16-bit samples are usually carried left-justified in
+ * 32-bit slots. Getting this wrong misaligns the channel boundaries and the
+ * result is one channel, or noise.
+ *
+ * ASoC does not hand the codec the bit clock ratio unless a machine driver sets
+ * it, so take it when offered and otherwise assume 32-bit slots - by far the
+ * most common arrangement, and what the RK3588 I2S does unconditionally
+ * (rockchip_i2s.c sets bclk_ratio = 64 at probe and never varies it with
+ * format).
+ */
+static int es9039q2m_set_bclk_ratio(struct snd_soc_dai *dai, unsigned int ratio)
+{
+	struct es9039q2m_priv *priv = snd_soc_component_get_drvdata(dai->component);
+
+	priv->bclk_ratio = ratio;
+	return 0;
+}
+
+static int es9039q2m_hw_params(struct snd_pcm_substream *substream,
+			       struct snd_pcm_hw_params *params,
+			       struct snd_soc_dai *dai)
+{
+	struct es9039q2m_priv *priv = snd_soc_component_get_drvdata(dai->component);
+	unsigned int input_sel, decode, width, slot_bits, isel;
+	bool auto_sel;
+	int ret;
+
+	/*
+	 * Held for the whole call: dop_auto decides both INPUT_SEL and
+	 * SYS_MODE below, and a kcontrol write landing between the two would
+	 * leave automatic detection enabled with no DoP decoder behind it.
+	 */
+	guard(mutex)(&priv->lock);
+
+	priv->stream_rate = params_rate(params);
+
+	ret = es9039_setup_clocking(priv, dai, priv->stream_rate);
+	if (ret)
+		return ret;
+
+	switch (params_format(params)) {
+	case SNDRV_PCM_FORMAT_DSD_U8:
+	case SNDRV_PCM_FORMAT_DSD_U16_LE:
+	case SNDRV_PCM_FORMAT_DSD_U32_LE:
+		/*
+		 * Forced, not auto-detected: the datasheet requires DSD data on
+		 * DATA1 and DATA2 for AUTO_INPUT_SEL to identify it, which a
+		 * two-channel I2S link does not provide.
+		 */
+		input_sel = ES9039_INPUT_DSD;
+		decode = ES9039_ENABLE_DSD_DECODE;
+		auto_sel = false;
+		break;
+	case SNDRV_PCM_FORMAT_S16_LE:
+	case SNDRV_PCM_FORMAT_S24_LE:
+	case SNDRV_PCM_FORMAT_S24_3LE:
+	case SNDRV_PCM_FORMAT_S32_LE:
+		/*
+		 * DoP arrives inside ordinary PCM frames and is indistinguishable
+		 * from PCM until the part finds the marker, so both decoders run
+		 * and AUTO_INPUT_SEL picks between them. INPUT_SEL is programmed
+		 * anyway as the fallback the part uses when auto-detection is
+		 * switched off.
+		 */
+		input_sel = ES9039_INPUT_PCM;
+		decode = ES9039_ENABLE_TDM_DECODE |
+			 (priv->dop_auto ? ES9039_ENABLE_DOP_DECODE : 0);
+		auto_sel = priv->dop_auto;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	slot_bits = priv->bclk_ratio ?
+		    priv->bclk_ratio / params_channels(params) : 32;
+
+	switch (slot_bits) {
+	case 16:
+		width = ES9039_WIDTH_16;
+		break;
+	case 24:
+		width = ES9039_WIDTH_24;
+		break;
+	case 32:
+		width = ES9039_WIDTH_32;
+		break;
+	default:
+		dev_err(dai->dev, "unsupported slot width %u\n", slot_bits);
+		return -EINVAL;
+	}
+
+	/*
+	 * AUTO_INPUT_SEL belongs in the value as well as the mask. It was in
+	 * the mask alone, so every hw_params quietly cleared it and undid what
+	 * the component probe had set - which is why enabling auto-detection
+	 * by hand mid-stream worked while enabling it in probe() did not.
+	 * INPUT_SEL is still programmed underneath: it is what the part falls
+	 * back to when auto-detection is switched off.
+	 */
+	isel = FIELD_PREP(ES9039_INPUT_SEL_MASK, input_sel);
+	if (auto_sel)
+		isel |= ES9039_AUTO_INPUT_SEL;
+
+	ret = regmap_update_bits(priv->regmap, ES9039_INPUT_SEL,
+				 ES9039_AUTO_INPUT_SEL | ES9039_INPUT_SEL_MASK,
+				 isel);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(priv->regmap, ES9039_TDM_CONFIG2,
+				 ES9039_TDM_BIT_WIDTH_MASK,
+				 FIELD_PREP(ES9039_TDM_BIT_WIDTH_MASK, width));
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(priv->regmap, ES9039_TDM_CH_NUM,
+				 ES9039_TDM_CH_NUM_MASK,
+				 params_channels(params) - 1);
+	if (ret)
+		return ret;
+
+	/*
+	 * Above 705.6 kHz there is not enough MCLK for the normal oversampling
+	 * chain, so the part runs at 64FS and forces a minimum phase filter
+	 * regardless of FILTER_SHAPE.
+	 */
+	ret = regmap_update_bits(priv->regmap, ES9039_SYSTEM_CONFIG,
+				 ES9039_64FS_MODE,
+				 params_rate(params) > 705600 ?
+					ES9039_64FS_MODE : 0);
+	if (ret)
+		return ret;
+
+	/* Switch the right decoder on for this stream, and the others off. */
+	return regmap_update_bits(priv->regmap, ES9039_SYS_MODE,
+				  ES9039_DECODE_MASK, decode);
+}
+
+static int es9039q2m_mute_stream(struct snd_soc_dai *dai, int mute, int dir)
+{
+	struct es9039q2m_priv *priv = snd_soc_component_get_drvdata(dai->component);
+
+	guard(mutex)(&priv->lock);
+
+	priv->mute_stream = mute;
+
+	return es9039_apply_mute(priv);
+}
+
+/*
+ * stream_rate doubles as "a stream is open", which es9039_dop_put() needs in
+ * order to refuse a change it could only half-apply.
+ */
+static void es9039q2m_shutdown(struct snd_pcm_substream *substream,
+			       struct snd_soc_dai *dai)
+{
+	struct es9039q2m_priv *priv = snd_soc_component_get_drvdata(dai->component);
+
+	guard(mutex)(&priv->lock);
+
+	priv->stream_rate = 0;
+}
+
+static const struct snd_soc_dai_ops es9039q2m_dai_ops = {
+	.startup	 = es9039q2m_startup,
+	.shutdown	 = es9039q2m_shutdown,
+	.set_fmt	 = es9039q2m_set_fmt,
+	.set_bclk_ratio	 = es9039q2m_set_bclk_ratio,
+	.hw_params	 = es9039q2m_hw_params,
+	.mute_stream	 = es9039q2m_mute_stream,
+	.no_capture_mute = 1,
+};
+
+#define ES9039_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE     | \
+			 SNDRV_PCM_FMTBIT_S24_LE     | \
+			 SNDRV_PCM_FMTBIT_S24_3LE    | \
+			 SNDRV_PCM_FMTBIT_S32_LE     | \
+			 SNDRV_PCM_FMTBIT_DSD_U8     | \
+			 SNDRV_PCM_FMTBIT_DSD_U16_LE | \
+			 SNDRV_PCM_FMTBIT_DSD_U32_LE)
+
+static struct snd_soc_dai_driver es9039q2m_dai = {
+	.name = "es9039q2m-hifi",
+	.playback = {
+		.stream_name	= "Playback",
+		.channels_min	= 2,
+		.channels_max	= 2,
+		.rates		= SNDRV_PCM_RATE_8000_768000,
+		.formats	= ES9039_FORMATS,
+	},
+	.ops = &es9039q2m_dai_ops,
+};
+
+/* ---------------------------------------------------------------- component */
+
+static int es9039q2m_component_probe(struct snd_soc_component *component)
+{
+	struct es9039q2m_priv *priv = snd_soc_component_get_drvdata(component);
+	int ret;
+
+	/*
+	 * Come up muted. The volume registers default to 0 dB, and an unmuted
+	 * DAC arriving into an already-powered analogue stage is how you get a
+	 * thump. ASoC unmutes via mute_stream() when a stream starts.
+	 */
+	priv->mute_user = 0;
+	priv->mute_stream = false;
+	ret = regmap_update_bits(priv->regmap, ES9039_DAC_MUTE,
+				 ES9039_MUTE_BOTH, ES9039_MUTE_BOTH);
+	if (ret)
+		return ret;
+
+	/*
+	 * VOLUME_HOLD set means "do not apply volume register writes", so its
+	 * resting state has to be clear or the volume control would appear
+	 * dead. es9039_vol_put() raises it around the pair of writes and drops
+	 * it again, which is how both channels are made to move together.
+	 */
+	ret = regmap_update_bits(priv->regmap, ES9039_IIR_SPDIF,
+				 ES9039_VOLUME_HOLD, 0);
+	if (ret)
+		return ret;
+
+	/*
+	 * Let the part identify DoP for itself. Register 57[0] AUTO_INPUT_SEL
+	 * makes it choose between PCM and DoP from the data, which is the only
+	 * way DoP can work in practice: players send DoP-encoded PCM and expect
+	 * the DAC to notice, and none of them can flip an ALSA control first.
+	 * Without this the part is told "PCM", never looks for the marker, and
+	 * renders a DoP stream as the near-silent hiss the DoP marker design
+	 * deliberately degrades to. Verified on hardware by enabling this
+	 * mid-stream and watching reg 245 flip from PCM to DoP with DOP_VALID
+	 * set. tools/datum-dop-test.sh in the DATUM repository is the standing
+	 * test: it plays DoP with nothing flipped and expects the part to
+	 * identify it unaided.
+	 *
+	 * The datasheet's "data must be provided on the DATA2 pin" applies to
+	 * identifying DSD, whose two channels arrive on separate data lines.
+	 * DoP is ordinary stereo I2S on one line and detects correctly without
+	 * it, which the same measurement establishes.
+	 */
+	priv->dop_auto = true;
+	scoped_guard(mutex, &priv->lock)
+		ret = es9039_apply_dop(priv, true);
+	if (ret)
+		return ret;
+
+	/*
+	 * Board defaults, applied once at probe so the part is deterministic
+	 * from cold instead of inheriting whatever its reset value happens to
+	 * be. Both stay user-settable through their kcontrols; these are
+	 * defaults, not policy.
+	 *
+	 * Reconstruction filter: linear phase apodizing fast roll-off. It keeps
+	 * the sharp cut and flat passband of the plain fast linear-phase filter
+	 * while suppressing pre-ringing, and an apodizing response also
+	 * suppresses pre-ringing already baked into the source material by the
+	 * recording chain - which none of the other seven addresses. The cost
+	 * is a little stopband rejection right at the band edge, well above
+	 * where it can matter. Chosen this way because a blind A/B listening
+	 * test on DATUM found no audible difference between any of the eight,
+	 * so the tie is broken on theory rather than on preference.
+	 *
+	 * Modulator: wide bandwidth, which is ESS's own recommendation. It
+	 * moves the modulator's noise further out of band and improves
+	 * linearity at high frequencies.
+	 */
+	ret = regmap_update_bits(priv->regmap, ES9039_FILTER_SHAPE,
+				 ES9039_FILTER_SHAPE_MASK,
+				 ES9039_FILTER_APODIZING);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(priv->regmap, ES9039_NSMOD,
+				 ES9039_NSMOD_WIDE_BW_MASK,
+				 FIELD_PREP(ES9039_NSMOD_WIDE_BW_MASK,
+					    ES9039_NSMOD_WIDE));
+	if (ret)
+		return ret;
+
+	/* Let the part work out the incoming rate; the ASRC does the rest. */
+	return regmap_update_bits(priv->regmap, ES9039_AUTO_FS_DETECT,
+				  ES9039_AUTO_FS_DETECT_EN,
+				  ES9039_AUTO_FS_DETECT_EN);
+}
+
+static const struct snd_soc_component_driver es9039q2m_component = {
+	.probe			= es9039q2m_component_probe,
+	.controls		= es9039q2m_controls,
+	.num_controls		= ARRAY_SIZE(es9039q2m_controls),
+	.dapm_widgets		= es9039q2m_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(es9039q2m_widgets),
+	.dapm_routes		= es9039q2m_routes,
+	.num_dapm_routes	= ARRAY_SIZE(es9039q2m_routes),
+	.idle_bias_on		= 1,
+	.endianness		= 1,
+};
+
+/* --------------------------------------------------------------------- I2C */
+
+static int es9039q2m_i2c_probe(struct i2c_client *i2c)
+{
+	struct device *dev = &i2c->dev;
+	struct es9039q2m_priv *priv;
+	unsigned int id;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->regmap = devm_regmap_init_i2c(i2c, &es9039q2m_regmap);
+	if (IS_ERR(priv->regmap))
+		return dev_err_probe(dev, PTR_ERR(priv->regmap),
+				     "failed to init regmap\n");
+
+	priv->mclk = devm_clk_get_optional_enabled(dev, "mclk");
+	if (IS_ERR(priv->mclk))
+		return dev_err_probe(dev, PTR_ERR(priv->mclk),
+				     "failed to get mclk\n");
+
+	if (priv->mclk) {
+		priv->mclk_rate = clk_get_rate(priv->mclk);
+		if (priv->mclk_rate > 50000000)
+			return dev_err_probe(dev, -EINVAL,
+					     "mclk %u Hz exceeds the 50 MHz maximum\n",
+					     priv->mclk_rate);
+
+		/*
+		 * A fixed-rate clock answers every rounding question with the
+		 * one rate it has. That is the board saying "this is an
+		 * oscillator, use the ASRC"; anything else can be pulled to
+		 * suit the sample rate and run synchronously.
+		 */
+		priv->mclk_fixed =
+			clk_round_rate(priv->mclk, priv->mclk_rate / 2) ==
+			priv->mclk_rate;
+	}
+
+	ret = devm_mutex_init(dev, &priv->lock);
+	if (ret)
+		return ret;
+
+	i2c_set_clientdata(i2c, priv);
+
+	ret = regmap_read(priv->regmap, ES9039_CHIP_ID, &id);
+	if (ret)
+		return dev_err_probe(dev, ret, "no response at 0x%02x\n",
+				     i2c->addr);
+
+	if (id != ES9039_CHIP_ID_ES9039Q2M)
+		return dev_err_probe(dev, -ENODEV,
+				     "unexpected chip id 0x%02x, want 0x%02x\n",
+				     id, ES9039_CHIP_ID_ES9039Q2M);
+
+	dev_info(dev, "ES9039Q2M at 0x%02x, mclk %u Hz\n",
+		 i2c->addr, priv->mclk_rate);
+
+	return devm_snd_soc_register_component(dev, &es9039q2m_component,
+					       &es9039q2m_dai, 1);
+}
+
+static const struct of_device_id es9039q2m_of_match[] = {
+	{ .compatible = "esstech,es9039q2m" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, es9039q2m_of_match);
+
+static const struct i2c_device_id es9039q2m_i2c_id[] = {
+	{ "es9039q2m" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, es9039q2m_i2c_id);
+
+static struct i2c_driver es9039q2m_i2c_driver = {
+	.driver = {
+		.name		= "es9039q2m",
+		.of_match_table	= es9039q2m_of_match,
+	},
+	.probe		= es9039q2m_i2c_probe,
+	.id_table	= es9039q2m_i2c_id,
+};
+module_i2c_driver(es9039q2m_i2c_driver);
+
+MODULE_DESCRIPTION("ASoC ES9039Q2M driver");
+MODULE_AUTHOR("Karl Asseily <karl@asseily.com>");
+MODULE_LICENSE("GPL");
-- 
2.34.1

