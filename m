Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792841243;
	b=mZH+noED7I+OsrCsAAB4P341NaLPeKYApzaSichcPyCE1ZFSFFJTbuMVWWw6xx9wJHQS
	 OCQ/GEA46zXbBdZHAesmGBcJDZ4RXzwvgecm3nww0Xr1lqxxps6RyGveOn7zwZyWhGvRr
	 VyTEsH8yOMi2jSjzHTD0RAUjAubxkRAZwLr5w/ffjZmDlUkOdQMUc4RhheDZYE5du3eXs
	 v7nPK4YpWa62Y1IlrVVyN6gQPPFGQheTUCCzxoI4H80Ra1JuxlzsRHpwhj8KyFE5cgrJq
	 MeG0yZCZX/SUCusHpj4LSXgqK0gI/E295zlo0lQuaTrbHPhkw5lCZyZ0AVh2U7TnGSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792841243;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=g9tCc/iO9dTl6JCd5kGyheiA4QwfLFPh1raL4bj3E9k=;
	b=MroC9MtiPnn5iHhzQd23B1vZQr5xe99C5vZ50Yt6jZx8/wpcO6Qm8spd3kl1E0YmI563
	 7xfFIkx1CylNadTPYpsyuxXxuE+7XIZrpKcKO7TdgPP5+UOceSwi3jWRKIghmQn/6IFcl
	 kRE+ymdPzJQXicR6bPSr4vUiP0Q4OOhVW6XF1sI/obg/D0Qdal8bg1h1UZmUsaq9mcQES
	 +oBTqWtfyVE3Wpnd20JbG4BdlkhQ62Bo2n1QkjtRfwXuVlwAYY1CCfILpxIP3zpF0P30i
	 orUD0EY46LzHNmoG+qr4KOWSMxcf19MpuQP1zOo8lSchAQKK9yUxi2VxbEYSDLYnPMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QDZMLSNw;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7623606A31A
	for <linux-sound@vger.kernel.org>; Sat, 24 Oct 2026 11:27:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7623606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QDZMLSNw
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48c4be28b82so1332294f8f.2
        for <linux-sound@vger.kernel.org>; Sat, 24 Oct 2026 04:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792841241; x=1793446041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g9tCc/iO9dTl6JCd5kGyheiA4QwfLFPh1raL4bj3E9k=;
        b=QDZMLSNwo3FQr2tZZUn9Qldppli4OEYyWq+efwI9fJRNaoM9WeMccd4VZc7XbR3iv9
         ualzqcv11mL3de0Mdu9zxJZv7F8sC9yO5XnbQv/SGnbQsaZNRpK0j+OcpQuACW5ns6ZK
         zq5Xn5KgMVQNrGwB6EevGHKklL5AOqjbvgNq2BCyzryOjO0R5R5h2p+Au5JfP0edbaE9
         s8C8W+zd+t5AKtMZKZU64drhWbC/aZazbV01B3mbfjz6XMQgsHQQ9PZOjpblgvaTDatt
         oOP36djT+DpQCjW+u3w+wN+KyPiahVWv1NDlHwYzmOgMjbE+iutJ1gv1KCHXd2w+QLG0
         O9wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792841241; x=1793446041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g9tCc/iO9dTl6JCd5kGyheiA4QwfLFPh1raL4bj3E9k=;
        b=bQhu2TrFcVlw5oFvZt6C41qyWM/ccb62LO0qiX2ijPntq5MmwSuk6jnmBE5vodLLeN
         hQDfIVVPsqWUHsm7xGCUXpY3Bi+K1bD+r9RwtFJTJ/iObQGEWkYgWefWieF74V5jDQfJ
         unH0D5snLHlLTz8Jzuq0p0YiFT6LuTOR06M5KazzPKpSDeTTQ88JZGzUd/FqndMbzg5T
         DS8qkRMzY5LwQNQfz4P0/uXgxqUNXZMgvJy/+y0edN8NoIpiD2V3dkvIukeBcutw1GKN
         UPNVe7xCVkxCJ8RP/2AyWqO8pwSFoP6yjAfZdmigXoeGKkLApkmZNU+pm/38RV827FQO
         GL1g==
X-Gm-Message-State: AFq9FYLGRP1HXpYYJ7Z9KHA/1pt2eTOCWU3qeEbOcfqyhAdn9IOs6fwc
	1l30TMjO5HZ+J0Vld3Zlz+piw2vSydAWh8IC9A2uZSeiRzp7rVO5JK3SspEIwoGHNmw=
X-Gm-Gg: AYBFou1A9EZWDpaIk9C4MifJB9wdj1iOPfM3uK4+fSGslyqz9rxuwxmugdvlZHlCYg/
	P1Dd1p8Cz9ukNGA/7Z3XYx4NR3F8QlvxVb7DmPchd0KRzaX7A4opqu8s7q7/MJ/w+jckD87rzuT
	N1Cy9zRMHaz5cdnTWnFJXNk09jkNbjJalf/e3Eu6HbTKzxZV3i5SvlCG3vlTJdIb967UQrXi7iI
	s3niZ5vCuhRAQMkp9nDwROgqHDAGUl1CiSRw2j69Qs4fowlJ3huZvQhWYM2uSVTvtD2Xk0tc1Pm
	ubkb/yvEBAJDvBdl44I+Mr4YuA4Wa5Wi0wSC/yEhK5VUBNcY6PhrWFyOcJvbj+6U6cxh3tLRNlj
	Qj5QzUlw1vDeh5sDJn4GmH6/eaBrkqpt6dgG6qtSd1GpRkKTAEa+1qqG6IFv1SZsqU24qF7SJTo
	Zkylt+rEHJYzacCP3gjo5ZdZMIQbrgB0EiZkEyEMwPmES4f20XtS77s+Pcje929dA3eYRiOwO0A
	zd99Gwa/X4Wj05oKzabs4uTo38U9l2JDT8xsrFNtfas+bWV2ltqBRido7jpKKWXrqR9+kr22NuD
	YxLeUrnkopY4ysmdJu0tGllLs4ZrJEk=
X-Received: by 2002:a5d:548c:0:b0:48d:efe2:6f17 with SMTP id ffacd0b85a97d-48e3ebb14c6mr1791910f8f.42.1792841240971;
        Sat, 24 Oct 2026 04:27:20 -0700 (PDT)
Received: from gmail.com (dynamic-adsl-84-221-247-128.clienti.tiscali.it. [84.221.247.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e4115f496sm3326178f8f.5.2026.10.24.04.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 04:27:20 -0700 (PDT)
From: root <davide.gironi@gmail.com>
X-Google-Original-From: root <root@debian.lab.local>
To: linux-sound@vger.kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	Davide Gironi <davide.gironi@gmail.com>
Subject: [PATCH] ASoC: ice1712: add TerraTec PHASE 88 support
Date: Sat, 24 Oct 2026 13:27:00 +0200
Message-ID: <20261024112700.3634-1-root@debian.lab.local>
X-Mailer: git-send-email 2.47.3
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

From: Davide Gironi <davide.gironi@gmail.com>

Add board-specific handling for the TerraTec PHASE 88, which shares an
EWS88MT device ID but uses different external hardware.

Use the write-only expander at 0x42 for AK4524 chip selection, initialize
its second register, and add the measured Line/Mic 7/8 control. Correct the
EEPROM-reported AC'97 codec and MIDI UART configuration, and guard consumer
capture open when AC'97 initialization failed.

Tested on two PHASE 88 racks with kernel 6.18.55; built against Debian
6.12.111. The patch applies to 6.18.58.

Assisted-by: Pi:gpt-6-luna
Signed-off-by: Davide Gironi <davide.gironi@gmail.com>
---
 sound/pci/ice1712/ews.c     | 163 +++++++++++++++++++++++++++++++++++-
 sound/pci/ice1712/ews.h     |  26 ++++++
 sound/pci/ice1712/ice1712.c |  38 ++++++++-
 3 files changed, 224 insertions(+), 3 deletions(-)

diff --git a/sound/pci/ice1712/ews.c b/sound/pci/ice1712/ews.c
index 1dffcb0..ac36370 100644
--- a/sound/pci/ice1712/ews.c
+++ b/sound/pci/ice1712/ews.c
@@ -32,6 +32,8 @@ enum {
 /* additional i2c devices for EWS boards */
 struct ews_spec {
 	struct snd_i2c_device *i2cdevs[3];
+	unsigned char pcf8575_data;	/* PHASE 88: shadow of the chip select byte */
+	unsigned char pcf8575_input;	/* PHASE 88: shadow of the input select byte */
 };
 
 /*
@@ -128,12 +130,130 @@ static struct snd_i2c_bit_ops snd_ice1712_ewx_cs8427_bit_ops = {
  * AK4524 access
  */
 
+/*
+ * PHASE 88 AK4524 chip select
+ *
+ * Contrary to the EWS88MT the chip select byte of the PHASE 88 cannot be
+ * read back: the expander is only ever written by the original Windows
+ * driver, which composes the byte from its own state.  Therefore keep a
+ * shadow copy of the flag bits and always write the complete value.
+ */
+/*
+ * Write one register of the PHASE 88 expander.
+ *
+ * The bit-banged bus of the EWS boards takes the GPIO lock on its own, so
+ * the caller must not hold ice->gpio_mutex - it is not a recursive mutex
+ * and the writer would deadlock itself inside ewx_i2c_start().
+ */
+static int snd_ice1712_phase88_write(struct snd_ice1712 *ice,
+				     unsigned char page, unsigned char value)
+{
+	struct ews_spec *spec = ice->spec;
+	unsigned char bytes[2];
+	int err;
+
+	bytes[0] = page;
+	bytes[1] = value;
+	snd_i2c_lock(ice->i2c);
+	err = snd_i2c_sendbytes(spec->i2cdevs[EWS_I2C_PCF2], bytes, 2);
+	snd_i2c_unlock(ice->i2c);
+	if (err != 2) {
+		dev_err(ice->card->dev,
+			"PHASE 88 expander write failed (page 0x%02x, addr 0x%02x, err %d)\n",
+			page, spec->i2cdevs[EWS_I2C_PCF2]->addr, err);
+		return -EIO;
+	}
+	return 0;
+}
+
+static int snd_ice1712_phase88_chip_select(struct snd_ice1712 *ice, int chip_mask)
+{
+	struct ews_spec *spec = ice->spec;
+	int err;
+
+	if (snd_BUG_ON(chip_mask < 0 || chip_mask > 0x0f))
+		return -EINVAL;
+	spec->pcf8575_data = (spec->pcf8575_data & 0xf0) | chip_mask;
+	err = snd_ice1712_phase88_write(ice, ICE1712_PHASE88_OUTPUT_PAGE,
+					spec->pcf8575_data);
+	if (err < 0)
+		spec->pcf8575_data ^= chip_mask;
+	return err;
+}
+
+/*
+ * PHASE 88: Line/Mic select of the four analog input pairs
+ *
+ * The Terratec mixers of the original operating systems offer a "Line/Mic
+ * 1/2 ... 7/8" switch for every pair of the AK4524 codecs; the setting is
+ * kept in the second register of the chip select expander.
+ *
+ * With a microphone on input 7 the level of that pair rises by roughly
+ * 30 dB when bit 4 (0x10) of this register is set, while bits 5 ... 7 do
+ * not change anything that could be measured on the other pairs - only the
+ * pair with the microphone attached could be verified.  The register is
+ * write-only, so the bits are assumed to be ordered from the last pair to
+ * the first one: 0x10 selects the microphone of pair 7/8, 0x80 the one of
+ * pair 1/2.
+ */
+static int snd_ice1712_phase88_linemic_info(struct snd_kcontrol *kcontrol,
+					    struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_BOOLEAN;
+	uinfo->count = 1;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = 1;
+	return 0;
+}
+
+static int snd_ice1712_phase88_linemic_get(struct snd_kcontrol *kcontrol,
+					   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_ice1712 *ice = snd_kcontrol_chip(kcontrol);
+	struct ews_spec *spec = ice->spec;
+
+	ucontrol->value.integer.value[0] =
+		!!(spec->pcf8575_input & (0x80 >> kcontrol->private_value));
+	return 0;
+}
+
+static int snd_ice1712_phase88_linemic_put(struct snd_kcontrol *kcontrol,
+					   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_ice1712 *ice = snd_kcontrol_chip(kcontrol);
+	struct ews_spec *spec = ice->spec;
+	unsigned char bit = 0x80 >> kcontrol->private_value;
+	unsigned char val = ucontrol->value.integer.value[0] ?
+		spec->pcf8575_input | bit : spec->pcf8575_input & ~bit;
+	int err;
+
+	if (val == spec->pcf8575_input)
+		return 0;
+	err = snd_ice1712_phase88_write(ice, ICE1712_PHASE88_INPUT_PAGE, val);
+	if (err < 0)
+		return err;
+	spec->pcf8575_input = val;
+	return 1;
+}
+
+static const struct snd_kcontrol_new snd_ice1712_phase88_linemic_ctl = {
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+	.name = "Line/Mic 7/8 Switch",
+	.info = snd_ice1712_phase88_linemic_info,
+	.get = snd_ice1712_phase88_linemic_get,
+	.put = snd_ice1712_phase88_linemic_put,
+	.private_value = 3,		/* bit 0x10: the pair nothing else drives */
+};
+
 /* AK4524 chip select; address 0x48 bit 0-3 */
 static int snd_ice1712_ews88mt_chip_select(struct snd_ice1712 *ice, int chip_mask)
 {
 	struct ews_spec *spec = ice->spec;
 	unsigned char data, ndata;
 
+	if (ice->eeprom.subvendor == ICE1712_SUBDEVICE_PHASE88)
+		return snd_ice1712_phase88_chip_select(ice, chip_mask);
+
 	if (snd_BUG_ON(chip_mask < 0 || chip_mask > 0x0f))
 		return -EINVAL;
 	snd_i2c_lock(ice->i2c);
@@ -458,9 +578,37 @@ static int snd_ice1712_ews_init(struct snd_ice1712 *ice)
 		}
 		snd_ice1712_6fire_write_pca(ice, PCF9554_REG_CONFIG, 0x80);
 		break;
+	case ICE1712_SUBDEVICE_PHASE88:
+		err = snd_i2c_device_create(ice->i2c, "CS8404",
+					    ICE1712_EWS88MT_CS8404_ADDR,
+					    &spec->i2cdevs[EWS_I2C_CS8404]);
+		if (err < 0)
+			return err;
+		err = snd_i2c_device_create(ice->i2c, "Output expander",
+					    ICE1712_PHASE88_OUTPUT_ADDR,
+					    &spec->i2cdevs[EWS_I2C_PCF2]);
+		if (err < 0)
+			return err;
+	spec->pcf8575_data = ICE1712_PHASE88_OUTPUT_INIT;
+		/* Check if the chip select expander is present */
+		err = snd_ice1712_ews88mt_chip_select(ice, 0x0f);
+		if (err < 0)
+			return err;
+		/*
+		 * The latch of the second expander register is undefined
+		 * after power on; the Terratec driver clears it while it
+		 * initialises a "type 8" board, before the codecs are set up.
+		 * With the latch in an unknown state all four AK4524 keep
+		 * their transmit drivers disabled and nothing is captured.
+		 */
+		spec->pcf8575_input = ICE1712_PHASE88_INPUT_INIT;
+		err = snd_ice1712_phase88_write(ice, ICE1712_PHASE88_INPUT_PAGE,
+						spec->pcf8575_input);
+		if (err < 0)
+			return err;
+		break;
 	case ICE1712_SUBDEVICE_EWS88MT:
 	case ICE1712_SUBDEVICE_EWS88MT_NEW:
-	case ICE1712_SUBDEVICE_PHASE88:
 	case ICE1712_SUBDEVICE_TS88:
 
 		err = snd_i2c_device_create(ice->i2c, "CS8404",
@@ -982,9 +1130,20 @@ static int snd_ice1712_ews_add_controls(struct snd_ice1712 *ice)
 				return err;
 		}
 		break;
+	case ICE1712_SUBDEVICE_PHASE88:
+		/*
+		 * The PHASE 88 has neither the input sensitivity expander on
+		 * 0x23 nor the output expander on 0x24 of the EWS88MT, so the
+		 * corresponding switches must not be created here; instead
+		 * the Line/Mic select of the codec pairs is offered.
+		 */
+		err = snd_ctl_add(ice->card,
+				  snd_ctl_new1(&snd_ice1712_phase88_linemic_ctl, ice));
+		if (err < 0)
+			return err;
+		break;
 	case ICE1712_SUBDEVICE_EWS88MT:
 	case ICE1712_SUBDEVICE_EWS88MT_NEW:
-	case ICE1712_SUBDEVICE_PHASE88:
 	case ICE1712_SUBDEVICE_TS88:
 		err = snd_ctl_add(ice->card, snd_ctl_new1(&snd_ice1712_ews88mt_input_sense, ice));
 		if (err < 0)
diff --git a/sound/pci/ice1712/ews.h b/sound/pci/ice1712/ews.h
index aec8dc6..08f9238 100644
--- a/sound/pci/ice1712/ews.h
+++ b/sound/pci/ice1712/ews.h
@@ -58,6 +58,32 @@ extern struct snd_ice1712_card_info snd_ice1712_ews_cards[];
 #define ICE1712_EWS88MT_OUTPUT_SENSE	0x40	/* mask */
 #define ICE1712_EWS88D_PCF_ADDR		(0x40>>1)
 
+/*
+ * TerraTec PHASE 88 configuration definitions
+ *
+ * The PHASE 88 is derived from the EWS88MT but it does not carry the two
+ * PCF8574 expanders at 0x23/0x24.  The AK4524 chip selects are driven by a
+ * 16-bit output expander answering at the 8-bit address 0x42, programmed
+ * with a two byte transfer: an address/page byte followed by the data byte
+ * holding the chip select bits (0-3, active low) and the board flags.
+ * This matches the "type 8" code path of the Terratec Windows driver for
+ * subsystem 0x1151 (PHASE 88) and 0xf151 (PHASE 88 master).
+ */
+#define ICE1712_PHASE88_OUTPUT_ADDR	(0x42 >> 1)
+#define ICE1712_PHASE88_OUTPUT_PAGE	0x01	/* first byte of the transfer */
+#define ICE1712_PHASE88_OUTPUT_INIT	0x20	/* flags kept asserted (bits 4-7) */
+
+/*
+ * The same expander has a second register that the Terratec drivers clear
+ * once while they initialise a "type 8" board ({0x03, 0x00} written to
+ * 8-bit 0x42).  The latch of the expander is undefined after power on and
+ * the AK4524 codecs stay silent when it is left alone, so it has to be
+ * written before the codecs are set up.  Its four upper bits select either
+ * the line input or the microphone input of the four codec pairs.
+ */
+#define ICE1712_PHASE88_INPUT_PAGE	0x03
+#define ICE1712_PHASE88_INPUT_INIT	0x00
+
 /* TerraTec DMX 6Fire configuration definitions */
 #define ICE1712_6FIRE_AK4524_CS_MASK	0x07	/* AK4524 chip select #1-#3 */
 #define ICE1712_6FIRE_RW		0x08	/* read/write switch for i2c; high = write  */
diff --git a/sound/pci/ice1712/ice1712.c b/sound/pci/ice1712/ice1712.c
index 376df1a..86ecf7b 100644
--- a/sound/pci/ice1712/ice1712.c
+++ b/sound/pci/ice1712/ice1712.c
@@ -768,6 +768,9 @@ static int snd_ice1712_capture_open(struct snd_pcm_substream *substream)
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_ice1712 *ice = snd_pcm_substream_chip(substream);
 
+	if (!ice->ac97)
+		return -ENODEV;
+
 	ice->capture_con_substream = substream;
 	runtime->hw = snd_ice1712_capture;
 	runtime->hw.rates = ice->ac97->rates[AC97_RATES_ADC];
@@ -2290,12 +2293,45 @@ static int snd_ice1712_chip_init(struct snd_ice1712 *ice)
 	outb(ICE1712_NATIVE, ICEREG(ice, CONTROL));
 	udelay(200);
 	if (ice->eeprom.subvendor == ICE1712_SUBDEVICE_DMX6FIRE &&
-	    !ice->dxr_enable)
+	    !ice->dxr_enable) {
 		/*  Set eeprom value to limit active ADCs and DACs to 6;
 		 *  Also disable AC97 as no hardware in standard 6fire card/box
 		 *  Note: DXR extensions are not currently supported
 		 */
 		ice->eeprom.data[ICE_EEP1_CODEC] = 0x3a;
+	} else if (ice->eeprom.subvendor == ICE1712_SUBDEVICE_PHASE88) {
+		/*
+		 * The EEPROM of the PHASE 88 advertises a consumer AC'97
+		 * codec, but the board does not carry one - the AC'97 link
+		 * does not answer even after a cold reset (every register
+		 * reads back as 0xffff).  All converters of this card are the
+		 * AKM codecs on the multitrack I2S interface, and the original
+		 * Terratec driver does not touch the AC'97 link either.
+		 * Without this quirk the probe wastes two seconds in the
+		 * AC'97 reset and creates consumer PCM devices that have no
+		 * codec behind them.
+		 */
+		ice->eeprom.data[ICE_EEP1_CODEC] |= ICE1712_CFG_NO_CON_AC97;
+		/*
+		 * The rack has two MIDI interfaces - one on the front panel, one
+		 * on the rear - but the EEPROM advertises only one UART, so
+		 * without this the rear connector stays dead.  Terratec's own
+		 * driver exposes both: "[PHASE88.Interface.Midi1]" and
+		 * "[PHASE88.Interface.Midi2]" in ews88wdm.inf, "PHASE88 MIDI Port
+		 * 1/2", the changelog naming the second one "Mic28 Extensions
+		 * (Midi 2)".  Both UARTs are inside the Envy24, so claiming the
+		 * second one is only a matter of setting the bit the EEPROM
+		 * should have carried.
+		 *
+		 * Verified on a PHASE 88 rack: with a loopback cable in the rear
+		 * connector, a SysEx frame written to the second UART came back
+		 * on it byte-exactly, and the first UART (front connector) kept
+		 * working as before.  With the second UART enabled and both ports
+		 * idle the card raised no interrupt on its IRQ line for 10 s,
+		 * so an unconnected input does not generate traffic.
+		 */
+		ice->eeprom.data[ICE_EEP1_CODEC] |= ICE1712_CFG_2xMPU401;
+	}
 	pci_write_config_byte(ice->pci, 0x60, ice->eeprom.data[ICE_EEP1_CODEC]);
 	pci_write_config_byte(ice->pci, 0x61, ice->eeprom.data[ICE_EEP1_ACLINK]);
 	pci_write_config_byte(ice->pci, 0x62, ice->eeprom.data[ICE_EEP1_I2SID]);
